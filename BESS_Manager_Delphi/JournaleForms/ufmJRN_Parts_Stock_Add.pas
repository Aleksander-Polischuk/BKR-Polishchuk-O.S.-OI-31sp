unit ufmJRN_Parts_Stock_Add;

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
  Vcl.ExtCtrls, MySkinWhite, cxCurrencyEdit, cxCheckBox, dxSkinOffice2013White, cxDropDownEdit, cxCalendar, cxMaskEdit, cxSpinEdit, cxTimeEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

const
  mCaption = 'Прихід готової деталі: ';

type
  TfmJRN_Parts_Stock_Add = class(TfmBaseObjectForm)
    spDataField: TFDQuery;
    dsDataField: TDataSource;
    spSaveForm: TFDStoredProc;
    Panel1: TPanel;
    alListActions: TActionList;
    aConfirm: TAction;
    aSave: TAction;
    bbSave: TcxButton;
    bbConfirm: TcxButton;
    Label2: TLabel;
    edKod: TcxDBTextEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edOP_DATE: TcxDBDateEdit;
    edID_PART: TcxDBLookupComboBox;
    edNOTES: TcxDBTextEdit;
    edQUANTITY: TcxDBSpinEdit;
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
  fmJRN_Parts_Stock_Add: TfmJRN_Parts_Stock_Add;
  OwnSender: TObject;

implementation

uses ufmJRN_Parts_Stock;

{$R *.dfm}

constructor TfmJRN_Parts_Stock_Add.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;
  Tag := mainModule.GetIDForm;

  if Operation = FormOperation.None then exit;

  mainModule.spREF_PARTS.Open;

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
      // Встановлюємо тип операції "Прихід" для форми Add
      spDataField.FieldValues['OP_TYPE'] := 1;
      spDataField.FieldValues['OP_DATE'] := Now;
    end;
  except
    on E: Exception do
    begin
      mainModule.ShowMessage(Self, 'Неможливо виконати запит.' + #13 + E.Message, '', TTypeMessage.Error);
      exit;
    end;
  end;

  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    Caption := mCaption + ' Створення';

  mainModule.EditReadOnly(edKod, clWhite, clHotLight);

  if (spDataField.State = dsEdit) or (spDataField.State = dsInsert) then
    spDataField.Post;

  FormModify := false;
  spDataField.AfterPost := OnDataSetChange;
  ShowThisForm();
end;

procedure TfmJRN_Parts_Stock_Add.OnDataSetChange(DataSet: TDataSet);
begin
  FormModify := true;
end;

function TfmJRN_Parts_Stock_Add.CheckDataForErrors(): Boolean;
begin
  var Res: Boolean := false;

  // Перевірка вибору деталі
  if mainModule.IFNull(spDataField.FieldValues['ID_PART'], 0) = 0 then
  begin
    mainModule.ShowMessage(Self, 'Оберіть деталь із довідника', '');
    edID_PART.SetFocus;
    Res := true;
  end;

  // Перевірка кількості
  if (not Res) and (mainModule.IFNull(spDataField.FieldValues['QUANTITY'], 0) <= 0) then
  begin
    mainModule.ShowMessage(Self, 'Вкажіть кількість більше нуля', '');
    edQUANTITY.SetFocus;
    Res := true;
  end;

  Result := Res;
end;

procedure TfmJRN_Parts_Stock_Add.aSaveExecute(Sender: TObject);
var
  NewID: Integer;
begin
  if spDataField.State <> dsBrowse then
    spDataField.Post;

  FormCanClose := false;
  if CheckDataForErrors then
    exit;

  mainModule.cnFBConnectWrite.StartTransaction;
  try
    try
      // Налаштовуємо процедуру збереження
      spSaveForm.StoredProcName := 'JRN_PARTS_MOVEMENT_IU';
      spSaveForm.Prepare;

      // Передаємо параметри для простого приходу
      spSaveForm.Params.ParamByName('I_ID').AsInteger        := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
      spSaveForm.Params.ParamByName('I_ID_PART').AsInteger   := spDataField.FieldValues['ID_PART'];
      spSaveForm.Params.ParamByName('I_OP_DATE').AsDateTime  := spDataField.FieldValues['OP_DATE'];
      spSaveForm.Params.ParamByName('I_OP_TYPE').AsInteger   := 1; // 1 = Прихід
      spSaveForm.Params.ParamByName('I_QUANTITY').AsFloat    := spDataField.FieldValues['QUANTITY'];
      spSaveForm.Params.ParamByName('I_NOTES').AsString      := mainModule.IFNull(spDataField.FieldValues['NOTES'], '');
      spSaveForm.Params.ParamByName('I_ID_USER').AsInteger   := gbSysIDUserName;

      // Поля для розкрою при простому додаванні зануляємо
      spSaveForm.Params.ParamByName('I_ID_REF_MACHINE').Value := Null;
      spSaveForm.Params.ParamByName('I_ENERGY_KWH').Value     := 0;
      spSaveForm.Params.ParamByName('I_ID_TARIFF').Value      := Null;

      spSaveForm.ExecProc;

      // Отримуємо новий ID, який згенерувала база
      NewID := spSaveForm.Params.ParamByName('O_ID').AsInteger;

      mainModule.cnFBConnectWrite.Commit;
    except
      on E: Exception do
      begin
        mainModule.cnFBConnectWrite.Rollback;
        mainModule.ShowMessage(Self, 'Помилка збереження операції приходу' + #13#10 + E.Message, '', TTypeMessage.Error);
        exit;
      end;
    end;
  finally
  end;

  // Оновлюємо локальний запис після успішного збереження
  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
  begin
    ID := NewID;
    if spDataField.State <> dsEdit then
      spDataField.Edit;
    spDataField.FieldValues['ID'] := ID;
    spDataField.Post;
    Caption := mCaption + ' №' + IntToStr(ID);
  end;

  FormCanClose := true;
  FormModify   := false;
  Operation    := FormOperation.Edit;

  // Оновлюємо список на головній формі складу
  if Owner.ClassName = 'TfmJRN_Parts_Stock' then
    (Owner as TfmJRN_Parts_Stock).spList.Refresh;
end;

procedure TfmJRN_Parts_Stock_Add.aConfirmExecute(Sender: TObject);
begin
  aSaveExecute(nil);
  if FormCanClose then Close;
end;

procedure TfmJRN_Parts_Stock_Add.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mainModule.spREF_PARTS.Close;

  Action := TCloseAction.caFree;
end;

procedure TfmJRN_Parts_Stock_Add.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (spDataField.Active) and (spDataField.State <> dsBrowse) then
    spDataField.Post;
  inherited CloseQuery(Sender, CanClose, aSave);
end;

end.
