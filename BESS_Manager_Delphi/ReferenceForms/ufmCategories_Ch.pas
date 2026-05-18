unit ufmCategories_Ch;

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
  Vcl.ExtCtrls, MySkinWhite, dxBarBuiltInMenu, cxPC, dxSkinOffice2013White;

const
  mCaption = 'Категорія: ';

type
  TfmCategories_Ch = class(TfmBaseObjectForm)
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
    edName: TcxDBTextEdit;
    Label2: TLabel;
    edNotes: TcxDBTextEdit;
    Label4: TLabel;
    edKod: TcxDBTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aConfirmExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    function CheckDataForErrors(): Boolean;
  public
    constructor Create(AOwner: TComponent; Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild); reintroduce;
  end;

var
  fmCategories_Ch: TfmCategories_Ch;
  OwnSender: TObject;

implementation

uses ufmCategories;

{$R *.dfm}

constructor TfmCategories_Ch.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;
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

  // Код (ID) тільки для читання
  mainModule.EditReadOnly(edKod, clWhite, clHotLight);

  if (spDataField.State in [dsEdit, dsInsert]) then
    spDataField.Post;

  FormModify := false;
  ShowThisForm();
end;

function TfmCategories_Ch.CheckDataForErrors(): Boolean;
begin
  Result := false;
  if Trim(mainModule.IFNull(spDataField.FieldValues['NAME'], '')) = '' then
  begin
    mainModule.ShowMessage(Self, 'Необхідно вказати "Найменування"', '');
    edName.SetFocus;
    Result := true;
  end;
end;

procedure TfmCategories_Ch.aSaveExecute(Sender: TObject);
begin
  if spDataField.State <> dsBrowse then
    spDataField.Post;

  FormCanClose := false;

  if CheckDataForErrors then exit;

  mainModule.cnFBConnectWrite.StartTransaction;
  try
    // Виклик процедури REF_Categories_IU
    spSaveForm.StoredProcName := 'REF_Categories_IU';
    spSaveForm.Prepare;

    spSaveForm.Params.ParamByName('ID').AsInteger          := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
    spSaveForm.Params.ParamByName('NAME').AsString        := spDataField.FieldValues['NAME'];
    spSaveForm.Params.ParamByName('NOTES').AsString       := mainModule.IFNull(spDataField.FieldValues['NOTES'], '');
    spSaveForm.Params.ParamByName('DEL').AsInteger         := mainModule.IFNull(spDataField.FieldValues['DEL'], 0);
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
    Caption := mCaption + ' ' + spDataField.FieldValues['NAME'];
  end;

  FormCanClose := true;
  FormModify   := false;
  Operation    := FormOperation.Edit;

  // Оновлюємо список у батьківській формі
  if Assigned(Owner) and (Owner is TfmCategories) then
    (Owner as TfmCategories).spList.Refresh;
end;

procedure TfmCategories_Ch.aConfirmExecute(Sender: TObject);
begin
  aSaveExecute(nil);
  if FormCanClose then Close;
end;

procedure TfmCategories_Ch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmCategories_Ch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (spDataField.Active) and (spDataField.State <> dsBrowse) then
    spDataField.Post;

  inherited CloseQuery(Sender, CanClose, aSave);
end;

end.
