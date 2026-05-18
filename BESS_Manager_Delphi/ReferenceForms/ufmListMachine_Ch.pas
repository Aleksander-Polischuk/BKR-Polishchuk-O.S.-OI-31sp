unit ufmListMachine_Ch;

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
  mCaption = 'Верстат: ';

type
  TfmListMachine_Ch = class(TfmBaseObjectForm)
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
    Label4: TLabel;
    Label5: TLabel;
    edNotes: TcxDBTextEdit;
    edLength: TcxDBCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    edPower_Nominal: TcxDBCurrencyEdit;
    edWidth: TcxDBCurrencyEdit;
    edPower_Idle: TcxDBCurrencyEdit;
    Label8: TLabel;
    edDefault_Tool_Radius: TcxDBCurrencyEdit;
    Label9: TLabel;
    edMax_Speed: TcxDBCurrencyEdit;
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
  fmListMachine_Ch: TfmListMachine_Ch;
  OwnSender: TObject;

implementation

uses ufmListMachine;

{$R *.dfm}

constructor TfmListMachine_Ch.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
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

procedure TfmListMachine_Ch.OnDataSetChange(DataSet: TDataSet);
begin
  FormModify := true;
end;

function TfmListMachine_Ch.CheckDataForErrors(): Boolean;
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

  Result := Res;
end;

procedure TfmListMachine_Ch.aSaveExecute(Sender: TObject);
begin
  if spDataField.State <> dsBrowse then
    spDataField.Post;

  FormCanClose := false;

  if CheckDataForErrors then
    exit;

  mainModule.cnFBConnectWrite.StartTransaction;
  try
    try
      spSaveForm.Params.ParamByName('ID').AsInteger                  := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
      spSaveForm.Params.ParamByName('NAME').AsString                 := mainModule.IFNull(spDataField.FieldValues['NAME'], '');
      spSaveForm.Params.ParamByName('DEL').AsBoolean                 := mainModule.IFNull(spDataField.FieldValues['DEL'], false);
      spSaveForm.Params.ParamByName('WORK_AREA_WIDTH').AsInteger     := mainModule.IFNull(spDataField.FieldValues['WORK_AREA_WIDTH'], 0);
      spSaveForm.Params.ParamByName('WORK_AREA_LENGTH').AsInteger    := mainModule.IFNull(spDataField.FieldValues['WORK_AREA_LENGTH'], 0);
      spSaveForm.Params.ParamByName('POWER_NOMINAL').AsFloat         := mainModule.IFNull(spDataField.FieldValues['POWER_NOMINAL'], 0.0);
      spSaveForm.Params.ParamByName('POWER_IDLE').AsFloat            := mainModule.IFNull(spDataField.FieldValues['POWER_IDLE'], 0.0);
      spSaveForm.Params.ParamByName('DEFAULT_TOOL_RADIUS').AsFloat   := mainModule.IFNull(spDataField.FieldValues['DEFAULT_TOOL_RADIUS'], 0.0);
      spSaveForm.Params.ParamByName('MAX_SPEED').AsInteger           := mainModule.IFNull(spDataField.FieldValues['MAX_SPEED'], 0);
      spSaveForm.Params.ParamByName('NOTES').AsString                := mainModule.IFNull(spDataField.FieldValues['NOTES'], '');

      spSaveForm.Params.ParamByName('CURRENT_USER_ID').AsInteger := gbSysIDUserName;

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

  // Оновлення списків (виправив spREF_MATERIALS на spREF_MACHINE)
  if Assigned(mainModule.spREF_MACHINE) and mainModule.spREF_MACHINE.Active then
    mainModule.spREF_MACHINE.Refresh
  else if Assigned(mainModule.spREF_MACHINE) then
    mainModule.spREF_MACHINE.Open;

  if Owner.ClassName = 'TfmListMachine' then
    (Owner as TfmListMachine).spList.Refresh;
end;

procedure TfmListMachine_Ch.aConfirmExecute(Sender: TObject);
begin
  aSaveExecute(nil);

  if FormCanClose then
    Close;
end;

procedure TfmListMachine_Ch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmListMachine_Ch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (spDataField.Active) and (spDataField.State <> dsBrowse) then
    spDataField.Post;

  inherited CloseQuery(Sender, CanClose, aSave);
end;

end.

