unit ufmListEmployees;

interface

uses
  ufmBaseListForm,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,  umainModule,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxImageComboBox, Vcl.Menus, cxContainer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, cxMaskEdit,
  cxButtonEdit, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxGridLevel,
  dxLayoutContainer, cxGridTableView, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, MySkinWhite, cxCurrencyEdit, cxDBLookupComboBox, dxSkinOffice2013White;

type
  TfmListEmployees = class(TfmBaseListForm)
    gList: TcxGrid;
    gListDBTableView: TcxGridDBTableView;
    gListDBTableViewMARKDEL: TcxGridDBColumn;
    gListDBTableViewID: TcxGridDBColumn;
    gListDBTableViewNAME: TcxGridDBColumn;
    gListDBTableViewRootGroup: TcxGridTableRowLayoutGroup;
    gListLevel1: TcxGridLevel;
    spList: TFDQuery;
    dsList: TDataSource;
    alListActions: TActionList;
    aAddNew: TAction;
    aEdit: TAction;
    aMarkDelete: TAction;
    aClearFind: TAction;
    aSelect: TAction;
    Panel1: TPanel;
    bbSelect: TcxButton;
    bbAdd: TcxButton;
    bbMarkDelete: TcxButton;
    bbEdit: TcxButton;
    aDelete: TAction;
    aRefresh: TAction;
    cxButton5: TcxButton;
    edFind: TcxButtonEdit;
    gListDBTableViewADD_ID_SYS_USERS: TcxGridDBColumn;
    gListDBTableViewCH_ID_SYS_USERS: TcxGridDBColumn;
    gListDBTableViewADD_TIMESTAMP: TcxGridDBColumn;
    gListDBTableViewCH_TIMESTAMP: TcxGridDBColumn;
    gListDBTableViewNOTES: TcxGridDBColumn;
    gListDBTableViewHOURLY_RATE: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gListDBTableViewDblClick(Sender: TObject);
    procedure aAddNewExecute(Sender: TObject);
    procedure aAddNewCopyExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aMarkDeleteExecute(Sender: TObject);
    procedure aClearFindExecute(Sender: TObject);
    procedure aSelectExecute(Sender: TObject);
    procedure edFindPropertiesEditValueChanged(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure gListDBTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    //
  public
    constructor Create(AOwner: TComponent;Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsStayOnTop); reintroduce;
  end;

var
  fmListEmployees    : TfmListEmployees;
  OwnSender : TObject;

implementation

Uses ufmListEmployees_Ch, HomePage;

type
  TcxGridTableControllerAccess = class(TcxGridTableController);
  TcxGridFindPanelAccess       = Class(TcxGridFindPanel);

{$R *.dfm}


constructor TfmListEmployees.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;
  if FormIsClosed then exit;

   aSelect.Visible := ActionChoice;

  ///////////////////////////////////
  Tag := mainModule.GetIDForm;
  ////////////////

  if Not spList.Active then spList.Active := true;

  ShowThisForm();
end;

procedure TfmListEmployees.aAddNewCopyExecute(Sender: TObject);
begin
  if spList.RecordCount = 0 then exit;

  var Param := TStructure.Create;
  try
    Param.AddParam('Operation', FormOperation.AddCopy);
    Param.AddParam('ID',        spList.FieldValues['ID']);

    mainModule.GetForm(TTypeForm.FormObj, DBTableName.REF_EMPLOYEES, Param, Self, Sender, fsStayOnTop);
  finally
    Param.Free;
  end;
end;

procedure TfmListEmployees.aAddNewExecute(Sender: TObject);
begin

  var Param := TStructure.Create;
  try
    Param.AddParam('Operation', FormOperation.Add);

    mainModule.GetForm(TTypeForm.FormObj, DBTableName.REF_EMPLOYEES, Param, Self, Sender, fsStayOnTop);
  finally
    Param.Free;
  end;
end;

procedure TfmListEmployees.aClearFindExecute(Sender: TObject);
begin
  edFind.Text := '';
  TcxGridFindPanelAccess(TcxGridTableControllerAccess(gListDBTableView.Controller).FindPanel).ApplyText('');
end;

procedure TfmListEmployees.aDeleteExecute(Sender: TObject);
var
  ID: Integer;
begin
  if spList.RecordCount = 0 then exit;

  If not mainModule.ShowQuestionYesNo(Self, 'Видалити поточний запис ?', '') then
    exit;

  ID := spList.FieldValues['ID'];

  if mainModule.DelRecordSetMarkDel(spList, Self.Handle, 'REF_EMPLOYEES', ID, false, true) then
    begin
      spList.Refresh;
    end;
end;

procedure TfmListEmployees.aEditExecute(Sender: TObject);
begin
  if spList.RecordCount = 0 then exit;

  var Param := TStructure.Create;
  try
    Param.AddParam('Operation', FormOperation.Edit);
    Param.AddParam('ID',        spList.FieldValues['ID']);

    mainModule.GetForm(TTypeForm.FormObj, DBTableName.REF_EMPLOYEES, Param, Self, Sender, fsStayOnTop);
  finally
    Param.Free;
  end;
end;

procedure TfmListEmployees.aMarkDeleteExecute(Sender: TObject);
var
  ID: Integer;
  MarkDel: Boolean;
begin
  if spList.RecordCount = 0 then exit;

  If not mainModule.ShowQuestionYesNo(Self, 'Помітити/зняти помітку на вилучення ?', '') then
    exit;

  ID      := spList.FieldValues['ID'];
  MarkDel := not spList.FieldValues['DEL'];

  if mainModule.DelRecordSetMarkDel(spList, Self.Handle, 'REF_EMPLOYEES', ID, MarkDel, false) then
    begin
      spList.Refresh;
    end;
end;

procedure TfmListEmployees.aRefreshExecute(Sender: TObject);
begin
  spList.Refresh;
end;

procedure TfmListEmployees.aSelectExecute(Sender: TObject);
begin
  if Not aSelect.Visible then
  begin
    aEdit.Execute;
  end
  else
  begin
    if spList.RecordCount > 0 then
    begin
      FSelectID := spList.FieldValues['ID'];
    end;

    ModalResult := mrOk;

    Close;
  end;
end;

procedure TfmListEmployees.edFindPropertiesEditValueChanged(Sender: TObject);
begin
  TcxGridFindPanelAccess(TcxGridTableControllerAccess(gListDBTableView.Controller).FindPanel)
    .ApplyText(edFind.Text);
end;

procedure TfmListEmployees.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  if Assigned(Home) then
    Home.Enabled := true;
end;

procedure TfmListEmployees.gListDBTableViewDblClick(Sender: TObject);
begin
  aSelect.Execute;
end;

procedure TfmListEmployees.gListDBTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
begin
  if ARecord.Selected then AStyle := mainModule.GridFocusLight;
end;

end.
