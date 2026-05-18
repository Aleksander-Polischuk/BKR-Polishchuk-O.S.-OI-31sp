unit ufmProduct_Ch;

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
  Vcl.ExtCtrls, MySkinWhite, cxCurrencyEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxImageComboBox, cxGridLevel, dxLayoutContainer, cxGridTableView, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxDBLookupComboBox, cxSpinEdit, dxSkinOffice2013White;

const
  mCaption = 'Готовий виріб: ';

type
  TfmProduct_Ch = class(TfmBaseObjectForm)
    spDataField: TFDQuery;
    dsDataField: TDataSource;
    spSaveForm: TFDStoredProc;
    Panel1: TPanel;
    alListActions: TActionList;
    aConfirm: TAction;
    aSave: TAction;
    bbSave: TcxButton;
    bbConfirm: TcxButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    edName: TcxDBTextEdit;
    edArticle: TcxDBTextEdit;
    Label2: TLabel;
    edKod: TcxDBTextEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    gList: TcxGrid;
    gListDBTableView: TcxGridDBTableView;
    gListDBTableViewNAME: TcxGridDBColumn;
    gListDBTableViewQuantity: TcxGridDBColumn;
    gListDBTableViewRootGroup: TcxGridTableRowLayoutGroup;
    gListLevel1: TcxGridLevel;
    cxButton1: TcxButton;
    aAddProductPart: TAction;
    aDeleteProductPart: TAction;
    cxButton2: TcxButton;
    Label3: TLabel;
    edNotes: TcxDBTextEdit;
    spStructure: TFDQuery;
    dsStructure: TDataSource;
    spPartsList: TFDQuery;
    dsPartsList: TDataSource;
    spStructureID: TIntegerField;
    spStructure_DATE: TSQLTimeStampField;
    spStructureDEL: TBooleanField;
    spStructureID_REF_PRODUCTS: TIntegerField;
    spStructureID_REF_PARTS: TIntegerField;
    spStructureQUANTITY: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aConfirmExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure OnDataSetChange(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aAddProductPartExecute(Sender: TObject);
    procedure aDeleteProductPartExecute(Sender: TObject);
    procedure gListDBTableViewEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    function CheckDataForErrors(): Boolean;
  public
    constructor Create(AOwner: TComponent; Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild); reintroduce;
  end;

var
  fmProduct_Ch: TfmProduct_Ch;
  OwnSender: TObject;

implementation

uses ufmProduct;

{$R *.dfm}

constructor TfmProduct_Ch.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;
  if FormIsClosed then
    exit;

  Tag := mainModule.GetIDForm;

  /// //////////////////////////////////////////////////////////
  if Operation = FormOperation.None then
    exit;

  spDataField.Active             := false;
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
    Caption := mCaption + ' ' + mainModule.IFNull(spDataField.FieldValues['NAME'], '');

  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    Caption := mCaption + ' Створення';

  mainModule.EditReadOnly(edKod, clWhite, clHotLight);

  if (spDataField.State = dsEdit) or (spDataField.State = dsInsert) then
    spDataField.Post;
  FormModify            := false;
  spDataField.AfterPost := OnDataSetChange;

  spPartsList.Active := false;
  spPartsList.Active := true;

  spStructure.Active := false;
  spStructure.Params.ParamByName('ID').AsInteger := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
  spStructure.Active := true;

  ShowThisForm();
end;

procedure TfmProduct_Ch.OnDataSetChange(DataSet: TDataSet);
begin
  FormModify := true;
end;

function TfmProduct_Ch.CheckDataForErrors(): Boolean;
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

procedure TfmProduct_Ch.aSaveExecute(Sender: TObject);
begin
  if spDataField.State <> dsBrowse then
    spDataField.Post;

  FormCanClose := false;

  if CheckDataForErrors then exit;

  // Стартуємо транзакцію прямо на підключенні
  mainModule.cnFBConnectWrite.StartTransaction;
  try
    spSaveForm.Params.ParamByName('ID').AsInteger      := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
    spSaveForm.Params.ParamByName('NAME').AsString     := mainModule.IFNull(spDataField.FieldValues['NAME'], '');
    spSaveForm.Params.ParamByName('ARTICLE').AsString  := mainModule.IFNull(spDataField.FieldValues['ARTICLE'], '');
    spSaveForm.Params.ParamByName('NOTES').AsString    := mainModule.IFNull(spDataField.FieldValues['NOTES'], '');
    spSaveForm.Params.ParamByName('DEL').AsBoolean     := mainModule.IFNull(spDataField.FieldValues['DEL'], false);
    spSaveForm.Params.ParamByName('CURRENT_USER_ID').AsInteger := gbSysIDUserName;

    spSaveForm.ExecProc;

    if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
      ID := spSaveForm.Params.ParamByName('IDOUT').AsInteger;

    if spStructure.State = dsInsert then
      spStructure.Post;

    spStructure.First;
    while not spStructure.Eof do
    begin
      spStructure.Edit;
      spStructure.FieldValues['ID_REF_PRODUCTS'] := ID;
      spStructure.Post;

      spStructure.Next;
    end;

    if spStructure.ApplyUpdates(0) <> 0 then
    begin
      mainModule.cnFBConnectWrite.Rollback; // Відкат на рівні підключення
      mainModule.ShowMessage(Self, 'Неможливо виконати збереження даних таблиці складу виробу', '', TTypeMessage.Error);
      exit;
    end;

    Operation := FormOperation.Edit;

    if spDataField.State <> dsEdit then
      spDataField.Edit;
    spDataField.FieldValues['ID'] := ID;
    spDataField.Post;

    mainModule.cnFBConnectWrite.Commit; // Коміт на рівні підключення
  except
    on E: Exception do
    begin
      mainModule.cnFBConnectWrite.Rollback; // Відкат на рівні підключення
      mainModule.ShowMessage(Self, 'Неможливо виконати збереження даних' + #13 + E.Message, '', TTypeMessage.Error);
      exit;
    end;
  end;

  /// //////////////////////////////////////////////////////////
  Caption      := mCaption + ' ' + mainModule.IFNull(spDataField.FieldValues['NAME'], '');
  FormCanClose := true;
  FormModify   := false;

  /// Оновити датасет списку
  if Assigned(mainModule.spREF_Product) and mainModule.spREF_Product.Active then
    mainModule.spREF_Product.Refresh
  else if Assigned(mainModule.spREF_Product) then
    mainModule.spREF_Product.Open;

  if Assigned(Owner) and (Owner.ClassName = 'TfmProduct') then
    (Owner as TfmProduct).spList.Refresh;

end;

procedure TfmProduct_Ch.aAddProductPartExecute(Sender: TObject);
begin
  if not Assigned(spStructure) or not spStructure.Active then
    Exit;

  try
    if spStructure.State in [dsEdit, dsInsert] then
      spStructure.Post;

    if not spStructure.IsEmpty then
    begin
      if (spStructure.FieldByName('ID_REF_PARTS').IsNull) or (spStructure.FieldByName('ID_REF_PARTS').AsInteger <= 0) then
        Exit;
    end;


    spStructure.Append;
    spStructure.FieldByName('QUANTITY').AsInteger := 1;
    spStructure.FieldByName('DEL').AsBoolean := False;

    gListDBTableView.Controller.FocusedColumn := gListDBTableViewNAME;
    gListDBTableView.Controller.EditingController.ShowEdit;

  except
    on E: Exception do
    begin
      if spStructure.State in [dsEdit, dsInsert] then
        spStructure.Cancel;
      mainModule.ShowMessage(Self, 'Помилка: ' + #13#10 + E.Message, 'Помилка', TTypeMessage.Error);
    end;
  end;
end;

procedure TfmProduct_Ch.aConfirmExecute(Sender: TObject);
begin
  aSaveExecute(nil);

  if FormCanClose then
    Close;
end;

procedure TfmProduct_Ch.aDeleteProductPartExecute(Sender: TObject);
begin
  if not Assigned(spStructure) or not spStructure.Active or spStructure.IsEmpty then
    Exit;

  try
    spStructure.Delete;
  except
    on E: Exception do
    begin
      if spStructure.State in [dsEdit, dsInsert] then
        spStructure.Cancel;

      mainModule.ShowMessage(Self, 'Помилка при видаленні деталі: ' + #13#10 + E.Message, 'Помилка', TTypeMessage.Error);
    end;
  end;
end;
procedure TfmProduct_Ch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmProduct_Ch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (spDataField.Active) and (spDataField.State <> dsBrowse) then
    spDataField.Post;

  inherited CloseQuery(Sender, CanClose, aSave);
end;

procedure TfmProduct_Ch.FormShow(Sender: TObject);
begin
  edName.SetFocus;
end;

procedure TfmProduct_Ch.gListDBTableViewEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit;
  var Key: Word; Shift: TShiftState);
begin
  if AItem = gListDBTableViewQuantity then
  begin
    if Key = VK_RETURN then
    begin
      Key := 0;

      if spStructure.State in [dsEdit, dsInsert] then
        spStructure.Post;

      aAddProductPartExecute(Self);
    end

    else if Key = VK_TAB then
    begin
      Key := 0;

      if spStructure.State in [dsEdit, dsInsert] then
        spStructure.Post;

      if bbConfirm.CanFocus then
        bbConfirm.SetFocus;
    end;
  end;
end;
end.
