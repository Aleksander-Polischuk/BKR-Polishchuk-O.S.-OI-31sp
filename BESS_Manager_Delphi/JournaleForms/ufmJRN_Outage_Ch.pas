unit ufmJRN_Outage_Ch;

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
  Vcl.ExtCtrls, MySkinWhite, cxCurrencyEdit, cxCheckBox, dxSkinOffice2013White, cxDropDownEdit, cxCalendar, cxMaskEdit, cxSpinEdit, cxTimeEdit;

const
  mCaption = 'Журнал вікдючень електроенергії: ';

type
  TfmJRN_Outage_Ch = class(TfmBaseObjectForm)
    spDataField: TFDQuery;
    dsDataField: TDataSource;
    spSaveForm: TFDStoredProc;
    Panel1: TPanel;
    Label1: TLabel;
    alListActions: TActionList;
    aConfirm: TAction;
    aSave: TAction;
    bbSave: TcxButton;
    bbConfirm: TcxButton;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    edKod: TcxDBTextEdit;
    edTimeStart: TcxDBTimeEdit;
    edTimeEnd: TcxDBTimeEdit;
    edOutageDate: TcxDBDateEdit;
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
  fmJRN_Outage_Ch: TfmJRN_Outage_Ch;
  OwnSender: TObject;

implementation

uses ufmJRN_Outage;

{$R *.dfm}

constructor TfmJRN_Outage_Ch.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
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


  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    Caption := mCaption + ' Створення';

  mainModule.EditReadOnly(edKod, clWhite, clHotLight);

  if (spDataField.State = dsEdit) or (spDataField.State = dsInsert) then
    spDataField.Post;
  FormModify            := false;
  spDataField.AfterPost := OnDataSetChange;



  ShowThisForm();
end;

procedure TfmJRN_Outage_Ch.OnDataSetChange(DataSet: TDataSet);
begin
  FormModify := true;
end;

function TfmJRN_Outage_Ch.CheckDataForErrors(): Boolean;
begin
  var
    Res: Boolean := false;

  // Якщо це новий документ
  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    begin
      // Тут можна додати специфічні перевірки для нових записів
    end;

  // Перевірка дати
  if not Res then
    begin
      if mainModule.IFNull(spDataField.FieldValues['OUTAGE_DATE'], 0) = 0 then
        begin
           mainModule.ShowMessage(Self, 'Необхідно вказати "Дату відключення"', '');
           edOutageDate.SetFocus;
           Res := true;
        end;
    end;

  // Перевірка часу початку
  if not Res then
    begin
      if mainModule.IFNull(spDataField.FieldValues['TIME_START'], 0) = 0 then
        begin
           mainModule.ShowMessage(Self, 'Необхідно вказати "Час виключення"', '');
           edTimeStart.SetFocus;
           Res := true;
        end;
    end;

  // Перевірка часу закінчення[cite: 2]
  if not Res then
    begin
      if mainModule.IFNull(spDataField.FieldValues['TIME_END'], 0) = 0 then
        begin
           mainModule.ShowMessage(Self, 'Необхідно вказати "Час включення"', '');
           edTimeEnd.SetFocus;
           Res := true;
        end;
    end;

  Result := Res;
end;

procedure TfmJRN_Outage_Ch.aSaveExecute(Sender: TObject);
begin
  if spDataField.State <> dsBrowse then
    spDataField.Post;

  FormCanClose := false;

  if CheckDataForErrors then
    exit;

  mainModule.cnFBConnectWrite.StartTransaction;
  try
    try
      // Прив'язка параметрів до процедури JRN_OUTAGES_IU
      spSaveForm.Params.ParamByName('ID').AsInteger          := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
      spSaveForm.Params.ParamByName('OUTAGE_DATE').AsDate    := mainModule.IFNull(spDataField.FieldValues['OUTAGE_DATE'], Date);
      spSaveForm.Params.ParamByName('TIME_START').AsTime     := mainModule.IFNull(spDataField.FieldValues['TIME_START'], Now);
      spSaveForm.Params.ParamByName('TIME_END').AsTime       := mainModule.IFNull(spDataField.FieldValues['TIME_END'], Now);
      spSaveForm.Params.ParamByName('DEL').AsBoolean         := mainModule.IFNull(spDataField.FieldValues['DEL'], false);

      // Системне поле аудиту
      spSaveForm.Params.ParamByName('CURRENT_USER_ID').AsInteger := gbSysIDUserName;

      spSaveForm.ExecProc;

      if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
      begin
        ID := spSaveForm.Params.ParamByName('IDOUT').AsInteger;
      end;

      // Комітимо транзакцію
      mainModule.cnFBConnectWrite.Commit;
    except
      on E: Exception do
      begin
        mainModule.cnFBConnectWrite.Rollback;
        mainModule.ShowMessage(Self, 'Неможливо виконати збереження графіка' + #13#10 + E.Message, '', TTypeMessage.Error);
        exit;
      end;
    end;
  finally

  end;

  /// Оновлення локального датасету після збереження[cite: 2]
  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
  begin
    if spDataField.State <> dsEdit then
      spDataField.Edit;
    spDataField.FieldValues['ID'] := ID;
    spDataField.Post;

    // Оновлюємо заголовок форми датою відключення
    Caption := mCaption + ' на ' + DateToStr(spDataField.FieldValues['OUTAGE_DATE']);
    Operation := FormOperation.Edit;
  end;

  FormCanClose := true;
  FormModify   := false;
  Operation    := FormOperation.Edit;

  // Оновлення списку в головному модулі (якщо такий датасет створено)
  if Assigned(mainModule.spJRN_OUTAGES) and mainModule.spJRN_OUTAGES.Active then
    mainModule.spJRN_OUTAGES.Refresh
  else if Assigned(mainModule.spJRN_OUTAGES) then
    mainModule.spJRN_OUTAGES.Open;

  // Оновлення реєстру в батьківській формі[cite: 2]
  if Owner.ClassName = 'TfmJRN_Outage' then
    (Owner as TfmJRN_Outage).spList.Refresh;
end;

procedure TfmJRN_Outage_Ch.aConfirmExecute(Sender: TObject);
begin
  aSaveExecute(nil);

  if FormCanClose then
    Close;
end;

procedure TfmJRN_Outage_Ch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmJRN_Outage_Ch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (spDataField.Active) and (spDataField.State <> dsBrowse) then
    spDataField.Post;

  inherited CloseQuery(Sender, CanClose, aSave);
end;

end.
