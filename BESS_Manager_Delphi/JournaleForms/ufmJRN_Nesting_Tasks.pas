unit ufmJRN_Nesting_Tasks;

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
  cxClasses, cxGridCustomView, cxGrid, MySkinWhite, cxCurrencyEdit, cxDBLookupComboBox, dxSkinOffice2013White, cxCalendar;

type
  TfmJRN_Nesting_Tasks = class(TfmBaseListForm)
    gList: TcxGrid;
    gListDBTableView: TcxGridDBTableView;
    gListDBTableViewBATCH_ID: TcxGridDBColumn;
    gListDBTableViewRootGroup: TcxGridTableRowLayoutGroup;
    gListLevel1: TcxGridLevel;
    spList: TFDQuery;
    dsList: TDataSource;
    alListActions: TActionList;
    aClearFind: TAction;
    Panel1: TPanel;
    aRefresh: TAction;
    cxButton5: TcxButton;
    edFind: TcxButtonEdit;
    gListDBTableViewMACHINE_NAME: TcxGridDBColumn;
    gListDBTableViewTOTAL_COST: TcxGridDBColumn;
    gListDBTableViewPLANNED_DATE: TcxGridDBColumn;
    gListDBTableViewSTATUS: TcxGridDBColumn;
    gListDBTableViewTOTAL_PARTS: TcxGridDBColumn;
    aConfirm: TAction;
    cxButton1: TcxButton;
    gListDBTableViewTOTAL_TIME: TcxGridDBColumn;
    gListDBTableViewColumn1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aClearFindExecute(Sender: TObject);
    procedure edFindPropertiesEditValueChanged(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure gListDBTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure aConfirmExecute(Sender: TObject);
    procedure gListDBTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    //
  public
    constructor Create(AOwner: TComponent;Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsNormal); reintroduce;
  end;

var
  fmJRN_Nesting_Tasks    : TfmJRN_Nesting_Tasks;
  OwnSender : TObject;

implementation

Uses ufmJRN_Nesting_Tasks_Detail, HomePage;

type
  TcxGridTableControllerAccess = class(TcxGridTableController);
  TcxGridFindPanelAccess       = Class(TcxGridFindPanel);

{$R *.dfm}


constructor TfmJRN_Nesting_Tasks.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;
  if FormIsClosed then exit;

  ///////////////////////////////////
  Tag := mainModule.GetIDForm;
  ////////////////

  if Not spList.Active then spList.Active := true;

  mainModule.spREF_PARTS.Active := false;
  mainModule.spREF_PARTS.Active := true;

  mainModule.spREF_MACHINE.Active := false;
  mainModule.spREF_MACHINE.Active := true;

  mainModule.spREF_ENERGY_TARIFFS.Active := false;
  mainModule.spREF_ENERGY_TARIFFS.Active := true;

  ShowThisForm();
end;

procedure TfmJRN_Nesting_Tasks.aClearFindExecute(Sender: TObject);
begin
  edFind.Text := '';
  TcxGridFindPanelAccess(TcxGridTableControllerAccess(gListDBTableView.Controller).FindPanel).ApplyText('');
end;

procedure TfmJRN_Nesting_Tasks.aConfirmExecute(Sender: TObject);
var
  vBatchID: Integer;
  vMsg: string;
  vCurrentTime: TDateTime;
  QryDetails: TFDQuery;
begin
  if spList.IsEmpty then Exit;

  // Якщо статус 1 (Виконано) — виходимо
  if spList.FieldByName('STATUS').AsInteger = 1 then
    Exit;

  vBatchID := spList.FieldByName('BATCH_ID').AsInteger;
  vCurrentTime := Now;

  vMsg := 'Підтвердити виконання всієї партії (Batch ID: ' + IntToStr(vBatchID) + ')?' + sLineBreak +
          'Поточний час: ' + FormatDateTime('dd.mm.yyyy hh:nn', vCurrentTime);

  if mainModule.ShowQuestionYesNo(Self, vMsg, 'Закриття розкрою') then
  begin
    QryDetails := TFDQuery.Create(nil);
    try
      QryDetails.Connection := mainModule.cnFBConnectWrite;

      mainModule.cnFBConnectWrite.StartTransaction;
      try
        // 1. Отримуємо всі деталі, які входять у цю партію
        QryDetails.SQL.Text := 'SELECT * FROM JRN_NESTING_TASKS WHERE BATCH_ID = :B_ID';
        QryDetails.ParamByName('B_ID').AsInteger := vBatchID;
        QryDetails.Open;

        QryDetails.First;
        while not QryDetails.Eof do
        begin
          // 2. Оприбутковуємо кожну деталь на склад окремо
          mainModule.cnFBConnectWrite.ExecSQL(
            'EXECUTE PROCEDURE JRN_PARTS_MOVEMENT_IU(:I_ID, :I_ID_PART, :I_OP_DATE, :I_OP_TYPE, :I_QUANTITY, ' +
            ':I_ID_REF_MACHINE, :I_ENERGY_KWH, :I_ID_TARIFF, :I_NOTES, :I_ID_USER)',
            [-1,
             QryDetails.FieldByName('ID_PART').AsInteger,
             vCurrentTime,
             1,
             QryDetails.FieldByName('QUANTITY').AsInteger,
             QryDetails.FieldByName('ID_REF_MACHINE').AsInteger,
             0,
             QryDetails.FieldByName('ID_TARIFF').AsInteger,
             'Виконано з партії № ' + IntToStr(vBatchID),
             gbSysIDUserName]
          );
          QryDetails.Next;
        end;

        // 3. Змінюємо статус відразу для ВСІХ записів цієї партії
        mainModule.cnFBConnectWrite.ExecSQL(
          'UPDATE JRN_NESTING_TASKS SET STATUS = 1, FACT_DATE = :F_DATE WHERE BATCH_ID = :B_ID',
          [vCurrentTime, vBatchID]
        );

        mainModule.cnFBConnectWrite.Commit;
        aRefresh.Execute; // Оновлюємо гріД
      except
        on E: Exception do
        begin
          mainModule.cnFBConnectWrite.Rollback;
          mainModule.ShowMessage(Self, 'Помилка закриття: ' + E.Message, '', TTypeMessage.Error);
        end;
      end;
    finally
      QryDetails.Free;
    end;
  end;
end;

procedure TfmJRN_Nesting_Tasks.aRefreshExecute(Sender: TObject);
begin
  spList.Refresh;
end;

procedure TfmJRN_Nesting_Tasks.edFindPropertiesEditValueChanged(Sender: TObject);
begin
  TcxGridFindPanelAccess(TcxGridTableControllerAccess(gListDBTableView.Controller).FindPanel)
    .ApplyText(edFind.Text);
end;

procedure TfmJRN_Nesting_Tasks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  if Assigned(Home) then
    Home.Enabled := true;
end;

procedure TfmJRN_Nesting_Tasks.gListDBTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  DetailForm: TfmJRN_Nesting_Tasks_Detail;
begin
  if spList.IsEmpty then Exit;

  // 1. Створюємо форму без параметра TStructure (передаємо nil)
  DetailForm := TfmJRN_Nesting_Tasks_Detail.Create(Application, nil, Self);

  // 2. Викликаємо нашу власну процедуру завантаження
  DetailForm.LoadBatch(spList.FieldByName('BATCH_ID').AsInteger);
end;

procedure TfmJRN_Nesting_Tasks.gListDBTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
begin
  if ARecord.Selected then AStyle := mainModule.GridFocusLight;
end;


end.
