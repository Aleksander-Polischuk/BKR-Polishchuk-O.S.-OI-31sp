unit ufmPriceElectricity_Ch;

interface

uses
  ufmBaseObjectForm,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, umainModule, dxSkinsCore,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, cxControls, cxContainer, cxEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, cxTextEdit, cxDBEdit, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, MySkinWhite, dxBarBuiltInMenu, cxPC, dxSkinOffice2013White,
  cxCurrencyEdit, cxSpinEdit, cxTimeEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxImageComboBox;

const
  mCaption = 'Вартість електроенергії: ';

type
  TfmPriceElectricity_Ch = class(TfmBaseObjectForm)
    spDataField: TFDQuery;
    dsDataField: TDataSource;
    spSaveForm: TFDStoredProc;
    Panel1: TPanel;
    alListActions: TActionList;
    aConfirm: TAction;
    aSave: TAction;
    bbSave: TcxButton;
    bbConfirm: TcxButton;
    Label1: TLabel;
    Label2: TLabel; edNotes: TcxDBTextEdit;
    Label4: TLabel; edKod: TcxDBTextEdit;
    Label3: TLabel; edPricePerKWH: TcxDBCurrencyEdit;
    Label5: TLabel; edDateStart: TcxDBDateEdit;
    Label6: TLabel; edDateEnd: TcxDBDateEdit;
    Label7: TLabel; edTimeStart: TcxDBTimeEdit;
    Label8: TLabel; edTimeEnd: TcxDBTimeEdit;
    edTariff_Type: TcxDBImageComboBox;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aConfirmExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    function CheckDataForErrors(): Boolean;
  public
    constructor Create(AOwner: TComponent; Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild); reintroduce;
  end;

implementation

uses ufmPriceElectricity;

{$R *.dfm}

constructor TfmPriceElectricity_Ch.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  if FormIsClosed then exit;

  Tag := mainModule.GetIDForm;
  if Operation = FormOperation.None then exit;

  spDataField.Active := false;
  spDataField.Params.ParamByName('ID').AsInteger := ID;

  try
    spDataField.Active := true;
    if Operation = FormOperation.AddCopy then
    begin
      spDataField.Edit;
      spDataField.FieldValues['ID'] := -1;
    end;
    if spDataField.RecordCount = 0 then
    begin
      spDataField.Append;
      spDataField.FieldValues['ID'] := -1;
      spDataField.FieldValues['DATE_START'] := Date;
      spDataField.FieldValues['TIME_START'] := StrToTime('00:00:00');
      spDataField.FieldValues['TIME_END']   := StrToTime('23:59:59');
      spDataField.FieldValues['PRICE_PER_KWH'] := 0;
    end;
  except
    on E: Exception do
    begin
      mainModule.ShowMessage(Self, 'Помилка запиту: ' + E.Message, '', TTypeMessage.Error);
      exit;
    end;
  end;

  if Operation = FormOperation.Edit then
    Caption := mCaption + ' ' + VarToStr(spDataField.FieldValues['NAME']);
  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    Caption := mCaption + ' Створення';

  mainModule.EditReadOnly(edKod, clWhite, clHotLight);
  ShowThisForm();
end;

function TfmPriceElectricity_Ch.CheckDataForErrors(): Boolean;
var
  CheckQ: TFDQuery;
begin
  Result := true;
  // 1. Перевірка назви
  if Trim(mainModule.IFNull(spDataField.FieldValues['NAME'], '')) = '' then
  begin
    mainModule.ShowMessage(Self, 'Вкажіть найменування тарифу', '');
    edTariff_Type.SetFocus; Exit;
  end;

  // 2. Логіка дат
  if not VarIsNull(spDataField.FieldValues['DATE_END']) then
  begin
    if spDataField.FieldValues['DATE_START'] > spDataField.FieldValues['DATE_END'] then
    begin
      mainModule.ShowMessage(Self, 'Дата закінчення не може бути раніше дати початку!', '');
      edDateEnd.SetFocus; Exit;
    end;
  end;

  // 3. Логіка вартості
  if mainModule.IFNull(spDataField.FieldValues['PRICE_PER_KWH'], 0) <= 0 then
  begin
    mainModule.ShowMessage(Self, 'Вкажіть коректну ціну за кВт*год', '');
    edPricePerKWH.SetFocus; Exit;
  end;

  // 4. ПЕРЕВІРКА НА ПЕРЕКРИТТЯ (Overlap)
  CheckQ := TFDQuery.Create(nil);
  try
    CheckQ.Connection := mainModule.cnFBConnect;
    CheckQ.SQL.Text :=
      'SELECT ID FROM REF_ENERGY_TARIFFS ' +
      'WHERE DEL = FALSE AND ID <> :CUR_ID ' +
      'AND (:DS <= COALESCE(DATE_END, ''2099-12-31'')) AND (COALESCE(:DE, ''2099-12-31'') >= DATE_START) ' +
      'AND (:TS <= TIME_END) AND (:TE >= TIME_START)';

    CheckQ.ParamByName('CUR_ID').AsInteger := spDataField.FieldByName('ID').AsInteger;
    CheckQ.ParamByName('DS').AsDate    := spDataField.FieldByName('DATE_START').AsDateTime;
    CheckQ.ParamByName('DE').Value    := spDataField.FieldByName('DATE_END').Value;
    CheckQ.ParamByName('TS').AsTime    := spDataField.FieldByName('TIME_START').AsDateTime;
    CheckQ.ParamByName('TE').AsTime    := spDataField.FieldByName('TIME_END').AsDateTime;
    CheckQ.Open;

    if not CheckQ.IsEmpty then
    begin
      mainModule.ShowMessage(Self, 'Цей період часу вже перекривається іншим тарифом!', '', TTypeMessage.Warning);
      Result := true; Exit;
    end;
  finally
    CheckQ.Free;
  end;

  Result := false;
end;

procedure TfmPriceElectricity_Ch.aSaveExecute(Sender: TObject);
begin
  if spDataField.State <> dsBrowse then spDataField.Post;
  FormCanClose := false;
  if CheckDataForErrors then exit;

  mainModule.cnFBConnectWrite.StartTransaction;
  try
    // Використовуємо процедуру з твого Nesting_2.sql
    spSaveForm.StoredProcName := 'REF_ENERGY_TARIFFS_IU';
    spSaveForm.Prepare;

    spSaveForm.Params.ParamByName('ID').AsInteger           := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
    spSaveForm.Params.ParamByName('TARIFF_TYPE').AsInteger  := spDataField.FieldValues['TARIFF_TYPE'];
    spSaveForm.Params.ParamByName('NAME').AsString          := edTariff_Type.Text;
    spSaveForm.Params.ParamByName('DATE_START').AsDate      := spDataField.FieldValues['DATE_START'];
    spSaveForm.Params.ParamByName('DATE_END').Value         := spDataField.FieldValues['DATE_END'];
    spSaveForm.Params.ParamByName('TIME_START').AsTime      := spDataField.FieldValues['TIME_START'];
    spSaveForm.Params.ParamByName('TIME_END').AsTime        := spDataField.FieldValues['TIME_END'];
    spSaveForm.Params.ParamByName('PRICE_PER_KWH').AsCurrency := spDataField.FieldValues['PRICE_PER_KWH'];
    spSaveForm.Params.ParamByName('NOTES').AsString         := mainModule.IFNull(spDataField.FieldValues['NOTES'], '');
    spSaveForm.Params.ParamByName('DEL').AsBoolean          := mainModule.IFNull(spDataField.FieldValues['DEL'], false);
    spSaveForm.Params.ParamByName('CURRENT_USER_ID').AsInteger := gbSysIDUserName;

    spSaveForm.ExecProc;
    if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
      ID := spSaveForm.Params.ParamByName('IDOUT').AsInteger;

    mainModule.cnFBConnectWrite.Commit;
  except
    on E: Exception do
    begin
      mainModule.cnFBConnectWrite.Rollback;
      mainModule.ShowMessage(Self, 'Помилка збереження: ' + E.Message, '', TTypeMessage.Error);
      exit;
    end;
  end;

  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
  begin
    spDataField.Edit;
    spDataField.FieldValues['ID'] := ID;
    spDataField.Post;
  end;

  FormCanClose := true;
  FormModify   := false;
  Operation    := FormOperation.Edit;

  if Assigned(Owner) and (Owner is TfmPriceElectricity) then
    (Owner as TfmPriceElectricity).spList.Refresh;
end;

procedure TfmPriceElectricity_Ch.aConfirmExecute(Sender: TObject);
begin
  aSaveExecute(nil);
  if FormCanClose then Close;
end;

procedure TfmPriceElectricity_Ch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmPriceElectricity_Ch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (spDataField.Active) and (spDataField.State <> dsBrowse) then
    spDataField.Post;
  inherited CloseQuery(Sender, CanClose, aSave);
end;

end.
