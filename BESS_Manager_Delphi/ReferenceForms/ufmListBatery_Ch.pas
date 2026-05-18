unit ufmListBatery_Ch;

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
  Vcl.ExtCtrls, MySkinWhite, cxCurrencyEdit, cxCheckBox, dxSkinOffice2013White;

const
  mCaption = 'Акумулятор: ';

type
  TfmListBatery_Ch = class(TfmBaseObjectForm)
    spDataField: TFDQuery;
    dsDataField: TDataSource;
    spSaveForm: TFDStoredProc;
    Panel1: TPanel;
    Label1: TLabel;
    edName: TcxDBTextEdit;
    edKod: TcxDBTextEdit;
    Label2: TLabel;
    alListActions: TActionList;
    aConfirm: TAction;
    aSave: TAction;
    bbSave: TcxButton;
    bbConfirm: TcxButton;
    Label3: TLabel;
    edNotes: TcxDBTextEdit;
    Label7: TLabel;
    edNominal_Capacity_KWH: TcxDBCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    edSoc_Min_Limit: TcxDBCurrencyEdit;
    Label6: TLabel;
    Label8: TLabel;
    edEfficiency_Rate: TcxDBCurrencyEdit;
    edNominal_Voltage: TcxDBCurrencyEdit;
    edSoc_Max_Limit: TcxDBCurrencyEdit;
    Label9: TLabel;
    edCHARGE_POWER_KW: TcxDBCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aConfirmExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure OnDataSetChange(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    function CheckDataForErrors(): Boolean;
  public
    constructor Create(AOwner: TComponent; Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild); reintroduce;
  end;

var
  fmListBatery_Ch: TfmListBatery_Ch;
  OwnSender: TObject;

implementation

uses ufmListBatery;

{$R *.dfm}

constructor TfmListBatery_Ch.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;

  Tag := mainModule.GetIDForm;

  /// //////////////////////////////////////////////////////////
  if Operation = FormOperation.None then
    exit;

  spDataField.Active                             := false;
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
      end;

  except
    on E: Exception do
      begin
        mainModule.ShowMessage(Self, 'Неможливо виконати запит. ' + #13 + E.Message, '', TTypeMessage.Error);
        exit;
      end;
  end;

  if Operation = FormOperation.Edit then
    Caption := mCaption + ' ' + spDataField.FieldValues['NAME'];

  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    Caption := mCaption + ' Створення';

  mainModule.EditReadOnly(edKod, clWhite, clHotLight);

  if (spDataField.State = dsEdit) or (spDataField.State = dsInsert) then
    spDataField.Post;
  FormModify            := false;
  spDataField.AfterPost := OnDataSetChange;



  ShowThisForm();
end;

procedure TfmListBatery_Ch.OnDataSetChange(DataSet: TDataSet);
begin
  FormModify := true;
end;

function TfmListBatery_Ch.CheckDataForErrors(): Boolean;
begin
  var
    Res: Boolean := false;

  // Якщо це новий документ
  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    begin

    end;

  if not Res then
    begin
      if mainModule.IFNull(spDataField.FieldValues['NAME'], '') = '' then
        begin
           mainModule.ShowMessage(Self, 'Необхідно вказати "Найменування"', '');
           edName.SetFocus;
           Res := true;
        end;
    end;

  if not Res then
    begin
      if mainModule.IFNull(spDataField.FieldValues['NOMINAL_CAPACITY_KWH'], 0.0) <= 0 then
        begin
           mainModule.ShowMessage(Self, 'Необхідно вказати "Номінальну ємність" (більше 0)', '');
           edNominal_Capacity_KWH.SetFocus;
           Res := true;
        end;
    end;

  Result := Res;
end;

procedure TfmListBatery_Ch.aSaveExecute(Sender: TObject);
begin
  if spDataField.State <> dsBrowse then
    spDataField.Post;

  FormCanClose := false;

  if CheckDataForErrors then
    exit;

  mainModule.cnFBConnectWrite.StartTransaction;
  try
    try
      // Передаємо всі параметри процедури REF_BATTERY_IU[cite: 1]
      spSaveForm.Params.ParamByName('ID').AsInteger                   := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
      spSaveForm.Params.ParamByName('NAME').AsString                  := mainModule.IFNull(spDataField.FieldValues['NAME'], '');
      spSaveForm.Params.ParamByName('NOMINAL_CAPACITY_KWH').AsFloat   := mainModule.IFNull(spDataField.FieldValues['NOMINAL_CAPACITY_KWH'], 0.0);
      spSaveForm.Params.ParamByName('NOMINAL_VOLTAGE').AsFloat        := mainModule.IFNull(spDataField.FieldValues['NOMINAL_VOLTAGE'], 0.0);
      spSaveForm.Params.ParamByName('SOC_MIN_LIMIT').AsFloat          := mainModule.IFNull(spDataField.FieldValues['SOC_MIN_LIMIT'], 20.0);
      spSaveForm.Params.ParamByName('SOC_MAX_LIMIT').AsFloat          := mainModule.IFNull(spDataField.FieldValues['SOC_MAX_LIMIT'], 100.0);
      spSaveForm.Params.ParamByName('EFFICIENCY_RATE').AsFloat        := mainModule.IFNull(spDataField.FieldValues['EFFICIENCY_RATE'], 0.95);
      spSaveForm.Params.ParamByName('DEGRADATION_PERCENT').AsFloat    := mainModule.IFNull(spDataField.FieldValues['DEGRADATION_PERCENT'], 0.0);
      spSaveForm.Params.ParamByName('NOTES').AsString                 := mainModule.IFNull(spDataField.FieldValues['NOTES'], '');
      spSaveForm.Params.ParamByName('DEGRADATION_PERCENT').AsFloat    := mainModule.IFNull(spDataField.FieldValues['DEGRADATION_PERCENT'], 0.0);
      spSaveForm.Params.ParamByName('DEL').AsBoolean                  := mainModule.IFNull(spDataField.FieldValues['DEL'], false);

      // Системне поле[cite: 1]
      spSaveForm.Params.ParamByName('CURRENT_USER_ID').AsInteger      := gbSysIDUserName;

      spSaveForm.ExecProc;

      if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
      begin
        ID := spSaveForm.Params.ParamByName('IDOUT').AsInteger;
      end;

      // 2. Комітимо транзакцію підключення
      mainModule.cnFBConnectWrite.Commit;
    except
      on E: Exception do
      begin
        // 3. Якщо помилка - відкочуємо
        mainModule.cnFBConnectWrite.Rollback;
        mainModule.ShowMessage(Self, 'Неможливо виконати збереження даних' + #13#10 + E.Message, '', TTypeMessage.Error);
        exit;
      end;
    end;
  finally

  end;

  /// Оновлення локального датасету після збереження
  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
  begin
    if spDataField.State <> dsEdit then
      spDataField.Edit;
    spDataField.FieldValues['ID'] := ID;
    spDataField.Post;

    Caption := mCaption + ' ' + spDataField.FieldValues['NAME'];
    Operation := FormOperation.Edit;
  end;

  FormCanClose := true;
  FormModify   := false;
  Operation    := FormOperation.Edit;

  // Оновлення списків (замінено spREF_MACHINE на spREF_BATTERY)
  if Assigned(mainModule.spREF_BATTERY) and mainModule.spREF_BATTERY.Active then
    mainModule.spREF_BATTERY.Refresh
  else if Assigned(mainModule.spREF_BATTERY) then
    mainModule.spREF_BATTERY.Open;

  if Owner.ClassName = 'TfmListBatery' then
    (Owner as TfmListBatery).spList.Refresh;
end;

procedure TfmListBatery_Ch.aConfirmExecute(Sender: TObject);
begin
  aSaveExecute(nil);

  if FormCanClose then
    Close;
end;

procedure TfmListBatery_Ch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmListBatery_Ch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (spDataField.Active) and (spDataField.State <> dsBrowse) then
    spDataField.Post;

  inherited CloseQuery(Sender, CanClose, aSave);
end;

end.
