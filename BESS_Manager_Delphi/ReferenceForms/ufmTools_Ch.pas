unit ufmTools_Ch;

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
  Vcl.ExtCtrls, MySkinWhite, cxCurrencyEdit, dxSkinOffice2013White;

const
  mCaption = 'Різальний інструмент: ';

type
  TfmTools_Ch = class(TfmBaseObjectForm)
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
    edDiameter: TcxDBCurrencyEdit;
    edMaxRPM: TcxDBCurrencyEdit;
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
  fmTools_Ch: TfmTools_Ch;
  OwnSender: TObject;

implementation

uses ufmTools;

{$R *.dfm}

constructor TfmTools_Ch.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;
  if FormIsClosed then
    exit;

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

procedure TfmTools_Ch.OnDataSetChange(DataSet: TDataSet);
begin
  FormModify := true;
end;

function TfmTools_Ch.CheckDataForErrors(): Boolean;
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

procedure TfmTools_Ch.aSaveExecute(Sender: TObject);
begin
  if spDataField.State <> dsBrowse then
    spDataField.Post;

  FormCanClose := false;

  if CheckDataForErrors then
    exit;

  mainModule.cnFBConnectWrite.StartTransaction;
  try
    spSaveForm.Params.ParamByName('ID').AsInteger    := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
    spSaveForm.Params.ParamByName('NAME').AsString   := mainModule.IFNull(spDataField.FieldValues['NAME'], '');
    spSaveForm.Params.ParamByName('DEL').AsBoolean   := mainModule.IFNull(spDataField.FieldValues['DEL'], false);

    spSaveForm.Params.ParamByName('DIAMETER').AsFloat  := mainModule.IFNull(spDataField.FieldValues['DIAMETER'], 0);
    spSaveForm.Params.ParamByName('MAX_RPM').AsInteger := mainModule.IFNull(spDataField.FieldValues['MAX_RPM'], 0);
    spSaveForm.Params.ParamByName('NOTES').AsString    := mainModule.IFNull(spDataField.FieldValues['NOTES'], '');

    spSaveForm.Params.ParamByName('CURRENT_USER_ID').AsInteger := gbSysIDUserName;

    spSaveForm.ExecProc;

    if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    begin
      ID := spSaveForm.Params.ParamByName('IDOUT').AsInteger;
    end;

    mainModule.cnFBConnectWrite.Commit;
  except
    on E: Exception do
    begin
      mainModule.cnFBConnectWrite.Rollback;
      mainModule.ShowMessage(Self, 'Неможливо виконати збереження даних' + #13 + E.Message, '', TTypeMessage.Error);
      exit;
    end;
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

  // Оновлення списків
  if Assigned(mainModule.spREF_TOOLS) and mainModule.spREF_TOOLS.Active then
    mainModule.spREF_TOOLS.Refresh
  else if Assigned(mainModule.spREF_TOOLS) then
    mainModule.spREF_TOOLS.Open;

  if Assigned(Owner) and (Owner.ClassName = 'TfmTools') then
    (Owner as TfmTools).spList.Refresh;
end;

procedure TfmTools_Ch.aConfirmExecute(Sender: TObject);
begin
  aSaveExecute(nil);

  if FormCanClose then
    Close;
end;

procedure TfmTools_Ch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmTools_Ch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (spDataField.Active) and (spDataField.State <> dsBrowse) then
    spDataField.Post;

  inherited CloseQuery(Sender, CanClose, aSave);
end;

end.
