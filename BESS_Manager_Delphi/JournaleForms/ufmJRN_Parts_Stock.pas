unit ufmJRN_Parts_Stock;

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
  TfmJRN_Parts_Stock = class(TfmBaseListForm)
    gList: TcxGrid;
    gListDBTableView: TcxGridDBTableView;
    gListDBTableViewMARKDEL: TcxGridDBColumn;
    gListDBTableViewID: TcxGridDBColumn;
    gListDBTableViewPART_NUMBER: TcxGridDBColumn;
    gListDBTableViewRootGroup: TcxGridTableRowLayoutGroup;
    gListLevel1: TcxGridLevel;
    spList: TFDQuery;
    dsList: TDataSource;
    alListActions: TActionList;
    aAddNew: TAction;
    aClearFind: TAction;
    Panel1: TPanel;
    bbAdd: TcxButton;
    aRefresh: TAction;
    cxButton5: TcxButton;
    edFind: TcxButtonEdit;
    gListDBTableViewCATEGORY: TcxGridDBColumn;
    gListDBTableViewADD_ID_SYS_USERS: TcxGridDBColumn;
    gListDBTableViewCH_ID_SYS_USERS: TcxGridDBColumn;
    gListDBTableViewADD_TIMESTAMP: TcxGridDBColumn;
    gListDBTableViewCH_TIMESTAMP: TcxGridDBColumn;
    gListDBTableViewPART_NAME: TcxGridDBColumn;
    gListDBTableViewQUANTITY: TcxGridDBColumn;
    gListDBTableViewUNIT: TcxGridDBColumn;
    gListDBTableViewColumn3: TcxGridDBColumn;
    aAddNesting: TAction;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddNewExecute(Sender: TObject);
    procedure aClearFindExecute(Sender: TObject);
    procedure edFindPropertiesEditValueChanged(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure gListDBTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure aAddNestingExecute(Sender: TObject);
  private
    //
  public
    constructor Create(AOwner: TComponent;Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsStayOnTop); reintroduce;
  end;

var
  fmJRN_Parts_Stock    : TfmJRN_Parts_Stock;
  OwnSender : TObject;

implementation

Uses ufmJRN_Parts_Stock_Add, HomePage, ufmJRN_Parts_Stock_Cutting;

type
  TcxGridTableControllerAccess = class(TcxGridTableController);
  TcxGridFindPanelAccess       = Class(TcxGridFindPanel);

{$R *.dfm}


constructor TfmJRN_Parts_Stock.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;
  if FormIsClosed then exit;

  ///////////////////////////////////
  Tag := mainModule.GetIDForm;
  ////////////////

  if Not spList.Active then spList.Active := true;

  ShowThisForm();
end;

procedure TfmJRN_Parts_Stock.aAddNestingExecute(Sender: TObject);
var
  Param: TStructure;
begin
  inherited;

  Param := TStructure.Create;
  try
    Param.AddParam('Operation', FormOperation.Add);
    Param.AddParam('ID', -1);

    TfmJRN_Parts_Stock_Cutting.Create(Self, Param, Sender, fsStayOnTop);
  finally
    Param.Free;
  end;
end;

procedure TfmJRN_Parts_Stock.aAddNewExecute(Sender: TObject);
var
  Param: TStructure;
begin
  Param := TStructure.Create;
  try
    Param.AddParam('Operation', FormOperation.Add);
    Param.AddParam('ID', -1);

    TfmJRN_Parts_Stock_Add.Create(Self, Param, Sender, fsStayOnTop);
  finally
    Param.Free;
  end;
end;

procedure TfmJRN_Parts_Stock.aClearFindExecute(Sender: TObject);
begin
  edFind.Text := '';
  TcxGridFindPanelAccess(TcxGridTableControllerAccess(gListDBTableView.Controller).FindPanel).ApplyText('');
end;

procedure TfmJRN_Parts_Stock.aRefreshExecute(Sender: TObject);
begin
  spList.Refresh;
end;

procedure TfmJRN_Parts_Stock.edFindPropertiesEditValueChanged(Sender: TObject);
begin
  TcxGridFindPanelAccess(TcxGridTableControllerAccess(gListDBTableView.Controller).FindPanel)
    .ApplyText(edFind.Text);
end;

procedure TfmJRN_Parts_Stock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  if Assigned(Home) then
    Home.Enabled := true;
end;

procedure TfmJRN_Parts_Stock.gListDBTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
begin
  if ARecord.Selected then AStyle := mainModule.GridFocusLight;
end;

end.
