unit HomePage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, MySkinWhite,
  cxLabel, cxDBLabel, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, cxButtons, umainModule, dxBarBuiltInMenu, cxPC, dxCore, cxClasses, dxSkinsForm,
  dxSkinOffice2013White, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frCoreClasses, frxDBSet,
  frxTableObject, System.DateUtils, frxPreview;

type
  THome = class(TForm)
    pcMain: TcxPageControl;
    shHome: TcxTabSheet;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    tStatusSystem: TcxDBLabel;
    Panel2: TPanel;
    bbJRN_Parts_Stock: TcxButton;
    cxButton2: TcxButton;
    cxButton8: TcxButton;
    Panel3: TPanel;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Panel4: TPanel;
    Label3: TLabel;
    bbReport_Ready_Details: TcxButton;
    bbDeatil_Queue: TcxButton;
    Panel5: TPanel;
    Label2: TLabel;
    bb_Tools: TcxButton;
    bb_Parts: TcxButton;
    bbListMaterials: TcxButton;
    bbMachine: TcxButton;
    Panel6: TPanel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    bbBatery: TcxButton;
    bbUnits: TcxButton;
    bbCategories: TcxButton;
    bbPriceElectricity: TcxButton;
    tLevelChargAcc: TcxDBLabel;
    spCurrentTariff: TFDQuery;
    dsCurrentTariff: TDataSource;
    tUpdateTariff: TTimer;
    tCurrentTariff: TcxDBLabel;
    spBatteryStatus: TFDQuery;
    dsBatteryStatus: TDataSource;
    spReport_Ready_Details: TFDQuery;
    dsReport_Ready_Details: TfrxDBDataset;
    rpReport_Ready_Details: TfrxReport;
    procedure bb_ToolsClick(Sender: TObject);
    procedure bb_PartsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcMainCanCloseEx(Sender: TObject; ATabIndex: Integer; var ACanClose: Boolean);
    procedure bbListMaterialsClick(Sender: TObject);
    procedure bbMachineClick(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure bbBateryClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure bbUnitsClick(Sender: TObject);
    procedure bbCategoriesClick(Sender: TObject);
    procedure bbJRN_Parts_StockClick(Sender: TObject);
    procedure bbPriceElectricityClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tUpdateTariffTimer(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure bbReport_Ready_DetailsClick(Sender: TObject);
    procedure bbDeatil_QueueClick(Sender: TObject);
  private
    procedure OpenReportInTab(AReport: TfrxReport; const ATabCaption: string);
  public
    procedure EmbedForm(AForm: TForm; const ATabCaption: string);
  end;

var
  Home: THome;

implementation

uses ufmTools, ufmParts, ufmListMaterial, ufmListMachine, ufmJRN_Outage,
     ufmListBatery, ufmJRN_BatteryMonitor, ufmUnits, ufmCategories, ufmJRN_Parts_Stock, ufmPriceElectricity, ufmJRN_Nesting_Tasks,
     ufmListUsers, ufmListUsers_Ch, ufmReportParams;


{$R *.dfm}

procedure THome.OpenReportInTab(AReport: TfrxReport; const ATabCaption: string);
var
  NewTab: TcxTabSheet;
  frPreview: TfrxPreview;
begin
  // Припускаємо, що ваш TcxPageControl називається pcMain
  // 1. Створюємо нову вкладку
  NewTab := TcxTabSheet.Create(pcMain);
  NewTab.PageControl := pcMain;
  NewTab.Caption := ATabCaption;

  // Дозволяємо закривати цю вкладку (якщо у вас налаштовано закриття хрестиком)
  NewTab.ImageIndex := -1;

  // 2. Створюємо кастомний переглядач FastReport
  frPreview := TfrxPreview.Create(NewTab);
  frPreview.Parent := NewTab;
  frPreview.Align := alClient; // Розтягуємо на всю вкладку

  // Додаткові налаштування інтерфейсу (можна приховати зайві кнопки)
  // frPreview.ToolbarVisible := True;

  // 3. Прив'язуємо звіт до нашого переглядача на вкладці
  AReport.Preview := frPreview;

  // 4. Формуємо звіт (ShowReport автоматично виведе його у frPreview)
  AReport.ShowReport(True);

  // 5. Робимо створену вкладку активною
  pcMain.ActivePage := NewTab;
end;

procedure THome.EmbedForm(AForm: TForm; const ATabCaption: string);
var
  NewTab: TcxTabSheet;
  I: Integer;
begin
  // 1. Перевірка, чи форма з такою назвою вже є
  for I := 0 to pcMain.PageCount - 1 do
  begin
    if pcMain.Pages[I].Caption = ATabCaption then
    begin
      AForm.Free; // Якщо вже відкрита, нова нам не потрібна - видаляємо її
      pcMain.ActivePageIndex := I;
      Exit;
    end;
  end;

  // 2. Створення вкладки
  NewTab := TcxTabSheet.Create(pcMain);
  NewTab.PageControl := pcMain;
  NewTab.Caption := ATabCaption;

  // 3. Вбудовування форми
  AForm.BorderStyle := bsNone;
  AForm.Align := alClient;
  AForm.Parent := NewTab;
  AForm.Show;

  pcMain.ActivePage := NewTab;
end;

procedure THome.pcMainCanCloseEx(Sender: TObject; ATabIndex: Integer; var ACanClose: Boolean);
begin
  // 0 - це зазвичай вкладка "Головна", її закривати не можна
  if ATabIndex = 0 then
  begin
    ACanClose := False;
    Exit;
  end;

  // Знищуємо форму, яка "живе" всередині вкладки
  if pcMain.Pages[ATabIndex].ControlCount > 0 then
    pcMain.Pages[ATabIndex].Controls[0].Free;

  ACanClose := True; // Дозволяємо закрити саму вкладку
end;

procedure THome.tUpdateTariffTimer(Sender: TObject);
begin
  // Оновлюємо дані кожну хвилину
  spCurrentTariff.Refresh;
  spBatteryStatus.Refresh;
end;


procedure THome.bbListMaterialsClick(Sender: TObject);
var
  F: TfmListMaterial;
begin
 F := TfmListMaterial.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Листовий матеріал');
end;

procedure THome.bbPriceElectricityClick(Sender: TObject);
var
  F: TfmPriceElectricity;
begin
 F := TfmPriceElectricity.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Варість електроенергії');
end;

procedure THome.bbReport_Ready_DetailsClick(Sender: TObject);
var
  frmParams: TfmReportParams;
begin
  frmParams := TfmReportParams.Create(nil);
  try
    frmParams.deStart.Date := StartOfAMonth(YearOf(Now), MonthOf(Now));
    frmParams.deEnd.Date := Now;

    if frmParams.ShowModal = mrOk then
    begin
      spReport_Ready_Details.Close;

      if frmParams.deStart.Text <> '' then
        spReport_Ready_Details.ParamByName('P_DATE_START').AsDate := frmParams.deStart.Date
      else
        spReport_Ready_Details.ParamByName('P_DATE_START').Clear;

      if frmParams.deEnd.Text <> '' then
        spReport_Ready_Details.ParamByName('P_DATE_END').AsDate := frmParams.deEnd.Date
      else
        spReport_Ready_Details.ParamByName('P_DATE_END').Clear;

      // Передаємо статус 1 (Виготовлені)
      spReport_Ready_Details.ParamByName('P_STATUS').AsInteger := 1;

      try
        spReport_Ready_Details.Open;

        // Перевірка, чи є дані для звіту
        if not spReport_Ready_Details.IsEmpty then
        begin
          // Викликаємо нашу нову процедуру для відкриття у вкладці
          OpenReportInTab(rpReport_Ready_Details, 'Виготовлені деталі');
        end
        else
          mainModule.ShowMessage(Self, 'За вказаний період виготовлених деталей не знайдено', '');

      except
        on E: Exception do
          mainModule.ShowMessage(Self, 'Помилка формування звіту: ' + E.Message, '', TTypeMessage.Error);
      end;
    end;
  finally
    frmParams.Free;
  end;
end;

procedure THome.bbUnitsClick(Sender: TObject);
var
  F: TfmUnits;
begin
 F := TfmUnits.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Одиниці виміру');
end;

procedure THome.bb_PartsClick(Sender: TObject);
var
  F: TfmParts;
begin
 F := TfmParts.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Деталі');
end;

procedure THome.bb_ToolsClick(Sender: TObject);
var
  F: TfmTools;
begin
 F := TfmTools.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Різальних інсрументи');
end;

procedure THome.cxButton2Click(Sender: TObject);
var
  F: TfmJRN_BatteryMonitor;
begin
 F := TfmJRN_BatteryMonitor.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Моніторинг стану енергосистеми');
end;

procedure THome.cxButton8Click(Sender: TObject);
var
  F: TfmJRN_Nesting_Tasks;
begin
 F := TfmJRN_Nesting_Tasks.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Журнал відкладених різів');
end;

procedure THome.cxButton9Click(Sender: TObject);
var
  F: TfmJRN_Outage;
begin
 F := TfmJRN_Outage.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Журнал графіків відключень електроенергії');
end;

procedure THome.bbBateryClick(Sender: TObject);
var
  F: TfmListBatery;
begin
 F := TfmListBatery.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Акумулятори');
end;

procedure THome.bbCategoriesClick(Sender: TObject);
var
  F: TfmCategories;
begin
 F := TfmCategories.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Категорії');
end;

procedure THome.bbDeatil_QueueClick(Sender: TObject);
var
  frmParams: TfmReportParams;
begin
  frmParams := TfmReportParams.Create(nil);
  try
    frmParams.deStart.Date := StartOfAMonth(YearOf(Now), MonthOf(Now));
    frmParams.deEnd.Date := Now;

    if frmParams.ShowModal = mrOk then
    begin
      spReport_Ready_Details.Close;

      if frmParams.deStart.Text <> '' then
        spReport_Ready_Details.ParamByName('P_DATE_START').AsDate := frmParams.deStart.Date
      else
        spReport_Ready_Details.ParamByName('P_DATE_START').Clear;

      if frmParams.deEnd.Text <> '' then
        spReport_Ready_Details.ParamByName('P_DATE_END').AsDate := frmParams.deEnd.Date
      else
        spReport_Ready_Details.ParamByName('P_DATE_END').Clear;

      // Передаємо статус -1 (Все, що в черзі та в роботі: статуси 0 і 2)
      spReport_Ready_Details.ParamByName('P_STATUS').AsInteger := -1;

      try
        spReport_Ready_Details.Open;

        // Перевірка, чи є дані для звіту
        if not spReport_Ready_Details.IsEmpty then
        begin
          // ВИПРАВЛЕНО НАЗВУ ВКЛАДКИ
          OpenReportInTab(rpReport_Ready_Details, 'Черга та в роботі');
        end
        else
          // ВИПРАВЛЕНО ТЕКСТ ПОМИЛКИ
          mainModule.ShowMessage(Self, 'За вказаний період деталей у черзі не знайдено', '');

      except
        on E: Exception do
          mainModule.ShowMessage(Self, 'Помилка формування звіту: ' + E.Message, '', TTypeMessage.Error);
      end;
    end;
  finally
    frmParams.Free;
  end;
end;

procedure THome.bbJRN_Parts_StockClick(Sender: TObject);
var
  F: TfmJRN_Parts_Stock;
begin
 F := TfmJRN_Parts_Stock.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Журнал залишків деталей');
end;


procedure THome.bbMachineClick(Sender: TObject);
var
  F: TfmListMachine;
begin
 F := TfmListMachine.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Верстати');
end;

procedure THome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure THome.FormShow(Sender: TObject);
begin
  spCurrentTariff.Open;
  spBatteryStatus.Open;

  tUpdateTariff.Enabled := True;

  if gbSysUserName <> 'Адміністратор' then
    N1.Visible := False;


end;

procedure THome.N2Click(Sender: TObject);
var
  F: TfmListUsers;
begin
  if gbSysUserName <> 'Адміністратор' then
    begin
      mainModule.ShowMessage(Self, 'У вас немає прав на відкриття цієї форми!', '', Warning);
      exit;
    end;

 F := TfmListUsers.Create(Application, nil, Self, fsNormal);
 EmbedForm(F, 'Користувачі');
end;

end.
