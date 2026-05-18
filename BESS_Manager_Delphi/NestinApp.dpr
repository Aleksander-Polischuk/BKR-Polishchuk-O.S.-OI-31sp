program NestinApp;

uses
  Winapi.Windows,
  Vcl.Forms,
  System.UITypes,
  Vcl.Controls,
  HomePage in 'Forms\HomePage.pas' {Home},
  stopwatch in 'Forms\stopwatch.pas',
  ufmDialogQuestion in 'Forms\ufmDialogQuestion.pas' {fmDialogQuestion},
  ufmMessDialog in 'Forms\ufmMessDialog.pas' {fmMessDialog},
  ufmBaseListForm in 'Forms\ufmBaseListForm.pas' {fmBaseListForm},
  ufmBaseObjectForm in 'Forms\ufmBaseObjectForm.pas' {fmBaseObjectForm},
  ufmTools in 'ReferenceForms\ufmTools.pas' {fmTools},
  ufmTools_Ch in 'ReferenceForms\ufmTools_Ch.pas' {fmTools_Ch},
  ufmParts in 'ReferenceForms\ufmParts.pas' {fmParts},
  ufmParts_Ch in 'ReferenceForms\ufmParts_Ch.pas' {fmParts_Ch},
  ufmAuthorization in 'Forms\ufmAuthorization.pas' {fmAuthorization},
  ufmListMaterial in 'ReferenceForms\ufmListMaterial.pas' {fmListMaterial},
  ufmListMaterial_Ch in 'ReferenceForms\ufmListMaterial_Ch.pas' {fmListMaterial_Ch},
  umainModule in 'Forms\umainModule.pas' {mainModule: TDataModule},
  ufmListMachine in 'ReferenceForms\ufmListMachine.pas' {fmListMachine},
  ufmListMachine_Ch in 'ReferenceForms\ufmListMachine_Ch.pas' {fmListMachine_Ch},
  ufmJRN_Outage in 'JournaleForms\ufmJRN_Outage.pas' {fmJRN_Outage},
  ufmJRN_Outage_Ch in 'JournaleForms\ufmJRN_Outage_Ch.pas' {fmJRN_Outage_Ch},
  ufmListBatery in 'ReferenceForms\ufmListBatery.pas' {fmListBatery},
  ufmListBatery_Ch in 'ReferenceForms\ufmListBatery_Ch.pas' {fmListBatery_Ch},
  ufmJRN_BatteryMonitor in 'JournaleForms\ufmJRN_BatteryMonitor.pas' {fmJRN_BatteryMonitor},
  ufmUnits in 'ReferenceForms\ufmUnits.pas' {fmUnits},
  ufmUnits_Ch in 'ReferenceForms\ufmUnits_Ch.pas' {fmUnits_Ch},
  ufmCategories in 'ReferenceForms\ufmCategories.pas' {fmCategories},
  ufmCategories_Ch in 'ReferenceForms\ufmCategories_Ch.pas' {fmCategories_Ch},
  ufmJRN_Parts_Stock in 'JournaleForms\ufmJRN_Parts_Stock.pas' {fmJRN_Parts_Stock},
  ufmPriceElectricity in 'ReferenceForms\ufmPriceElectricity.pas' {fmPriceElectricity},
  ufmPriceElectricity_Ch in 'ReferenceForms\ufmPriceElectricity_Ch.pas' {fmPriceElectricity_Ch},
  ufmJRN_Parts_Stock_Add in 'JournaleForms\ufmJRN_Parts_Stock_Add.pas' {fmJRN_Parts_Stock_Add},
  ufmJRN_Parts_Stock_Cutting in 'JournaleForms\ufmJRN_Parts_Stock_Cutting.pas' {fmJRN_Parts_Stock_Cutting},
  ufmJRN_Nesting_Tasks in 'JournaleForms\ufmJRN_Nesting_Tasks.pas' {fmJRN_Nesting_Tasks},
  ufmJRN_Nesting_Tasks_Detail in 'JournaleForms\ufmJRN_Nesting_Tasks_Detail.pas' {fmJRN_Nesting_Tasks_Detail},
  ufmListUsers in 'Forms\ufmListUsers.pas' {fmListUsers},
  ufmListUsers_Ch in 'Forms\ufmListUsers_Ch.pas' {fmListUsers_Ch},
  ufmReportParams in 'Forms\ufmReportParams.pas' {ReportParams};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TmainModule, mainModule);
  fmAuthorization := TfmAuthorization.Create(nil);
  if fmAuthorization.ShowModal = mrOk then
  begin
    fmAuthorization.Free;
    Application.CreateForm(THome, Home);
    Application.Run;
  end
  else
  begin
    ExitProcess(0);
  end;
end.
