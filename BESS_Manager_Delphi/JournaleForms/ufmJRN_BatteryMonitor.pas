unit ufmJRN_BatteryMonitor;

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
  cxClasses, cxGridCustomView, cxGrid, MySkinWhite, cxCurrencyEdit, cxDBLookupComboBox, dxSkinOffice2013White, dxBarBuiltInMenu, cxPC,
  cxGridChartView, cxGridDBChartView, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar;

type
  TfmJRN_BatteryMonitor = class(TfmBaseListForm)
    spBatteryTelemetry: TFDQuery;
    dsBatteryTelemetry: TDataSource;
    alListActions: TActionList;
    aClearFind: TAction;
    aRefresh: TAction;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Panel1: TPanel;
    edFind: TcxButtonEdit;
    gList: TcxGrid;
    gListDBTableView: TcxGridDBTableView;
    gListDBTableViewID: TcxGridDBColumn;
    gListDBTableViewOUTAGE_DATE: TcxGridDBColumn;
    gListDBTableViewTIME_START: TcxGridDBColumn;
    gListDBTableViewTIME_END: TcxGridDBColumn;
    gListDBTableViewADD_ID_SYS_USERS: TcxGridDBColumn;
    gListDBTableViewADD_TIMESTAMP: TcxGridDBColumn;
    gListDBTableViewCH_ID_SYS_USERS: TcxGridDBColumn;
    gListDBTableViewCH_TIMESTAMP: TcxGridDBColumn;
    gListDBTableViewRootGroup: TcxGridTableRowLayoutGroup;
    gListLevel1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBChartView1: TcxGridDBChartView;
    cxGrid1DBChartView1Series1: TcxGridDBChartSeries;
    tmrBMS_Simulator: TTimer;
    deStart: TcxDateEdit;
    deEnd: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnApplyFilter: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aClearFindExecute(Sender: TObject);
    procedure edFindPropertiesEditValueChanged(Sender: TObject);
    procedure gListDBTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure tmrBMS_SimulatorTimer(Sender: TObject);
    procedure cxGrid1DBChartView1GetValueHint(Sender: TcxGridChartView; ASeries: TcxGridChartSeries; AValueIndex: Integer; var AHint: string);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnApplyFilterClick(Sender: TObject);
  private
    //
  public
    constructor Create(AOwner: TComponent;Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsStayOnTop); reintroduce;
  end;

var
  fmJRN_BatteryMonitor    : TfmJRN_BatteryMonitor;
  OwnSender : TObject;

implementation

Uses HomePage;

type
  TcxGridTableControllerAccess = class(TcxGridTableController);
  TcxGridFindPanelAccess       = Class(TcxGridFindPanel);

{$R *.dfm}


procedure TfmJRN_BatteryMonitor.btnApplyFilterClick(Sender: TObject);
begin
  spBatteryTelemetry.DisableControls;
  try
    spBatteryTelemetry.Close;

    // Змінили .AsDateTime на .Value, щоб FireDAC сам розібрався з типом без конфліктів
    spBatteryTelemetry.ParamByName('D_START').Value := deStart.Date;
    spBatteryTelemetry.ParamByName('D_END').Value   := deEnd.Date;

    spBatteryTelemetry.Open;
  finally
    spBatteryTelemetry.EnableControls;
  end;
end;

constructor TfmJRN_BatteryMonitor.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;
  if FormIsClosed then exit;
  ///////////////////////////////////
  Tag := mainModule.GetIDForm;
  ////////////////

  if Not spBatteryTelemetry.Active then spBatteryTelemetry.Active := true;

  ShowThisForm();
end;

procedure TfmJRN_BatteryMonitor.cxGrid1DBChartView1GetValueHint(Sender: TcxGridChartView; ASeries: TcxGridChartSeries; AValueIndex: Integer;
  var AHint: string);
var
  CategoryValue: Variant;
  LookupResult: Variant;
  vCharge, vVoltage, vTemp: string;
begin
  // Беремо час точки
  CategoryValue := Sender.Categories.Values[AValueIndex];

  // Шукаємо запис
  LookupResult := spBatteryTelemetry.Lookup(
    'LOG_TIMESTAMP',
    CategoryValue,
    'LOG_TIMESTAMP;WORK_STATE;VOLTAGE;TEMPERATURE'
  );

  // Формуємо текст з БЕЗПЕЧНИМИ перевірками на Null
  if not VarIsNull(LookupResult) and VarIsArray(LookupResult) then
  begin
    // 1. Перевіряємо заряд
    if VarIsNull(ASeries.Values[AValueIndex]) then
      vCharge := '---'
    else
      vCharge := FormatFloat('0.00', ASeries.Values[AValueIndex]);

    // 2. Перевіряємо напругу
    if VarIsNull(LookupResult[2]) then
      vVoltage := 'Немає даних'
    else
      vVoltage := FormatFloat('0.00', LookupResult[2]) + ' В';

    // 3. Перевіряємо температуру
    if VarIsNull(LookupResult[3]) then
      vTemp := 'Немає даних'
    else
      vTemp := FormatFloat('0.00', LookupResult[3]) + ' °C';

    // Збираємо все в одну підказку
    AHint := '📅 Час: ' + FormatDateTime('hh:nn:ss', LookupResult[0]) + #13#10 +
             '⚡ Заряд: ' + vCharge + ' %' + #13#10 +
             '⚙️ Стан: ' + VarToStr(LookupResult[1]) + #13#10 +
             '🔌 Напруга: ' + vVoltage + #13#10 +
             '🌡 Температура: ' + vTemp;
  end;
end;
procedure TfmJRN_BatteryMonitor.aClearFindExecute(Sender: TObject);
begin
  edFind.Text := '';
  TcxGridFindPanelAccess(TcxGridTableControllerAccess(gListDBTableView.Controller).FindPanel).ApplyText('');
end;


procedure TfmJRN_BatteryMonitor.edFindPropertiesEditValueChanged(Sender: TObject);
begin
  TcxGridFindPanelAccess(TcxGridTableControllerAccess(gListDBTableView.Controller).FindPanel)
    .ApplyText(edFind.Text);
end;

procedure TfmJRN_BatteryMonitor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrBMS_Simulator.Enabled := False;
  Action := TCloseAction.caFree;
  if Assigned(Home) then
    Home.Enabled := true;
end;

procedure TfmJRN_BatteryMonitor.FormResize(Sender: TObject);
begin
  if cxPageControl1.PageCount > 0 then
  begin
    // Віднімаємо 30 пікселів запасу, щоб активній вкладці було куди "розширюватися" при кліку
    cxPageControl1.Properties.TabWidth := (cxPageControl1.ClientWidth div cxPageControl1.PageCount) - 30;
  end;
end;

procedure TfmJRN_BatteryMonitor.FormShow(Sender: TObject);
begin
  // Встановлюємо період: від вчора до зараз
  deStart.Date := Now - 1;
  deEnd.Date   := Now + 1;

  // Викликаємо натискання кнопки оновлення програмно
  btnApplyFilterClick(nil);

  tmrBMS_Simulator.Enabled := True;
end;

procedure TfmJRN_BatteryMonitor.gListDBTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
begin
  if ARecord.Selected then AStyle := mainModule.GridFocusLight;
end;

procedure TfmJRN_BatteryMonitor.tmrBMS_SimulatorTimer(Sender: TObject);
begin
  tmrBMS_Simulator.Enabled := False;
  try
    try
      // Симуляція нового запису (як і було)
      mainModule.cnFBConnectWrite.ExecSQL(
        'EXECUTE PROCEDURE JRN_BMS_SIMULATE_TICK(0.00138)'
      );

      // ОНОВЛЕНИЙ БЛОК: Перевідкриваємо запит для агрегації
      if Assigned(spBatteryTelemetry) and spBatteryTelemetry.Active then
      begin
        spBatteryTelemetry.DisableControls;
        try
          spBatteryTelemetry.Close;
          spBatteryTelemetry.Open; // Перезавантажуємо згруповані дані
          spBatteryTelemetry.Last; // Стрибаємо на кінець
        finally
          spBatteryTelemetry.EnableControls;
        end;
      end;

    except
      // Глушимо помилки
    end;
  finally
    tmrBMS_Simulator.Enabled := True;
  end;
end;
end.
