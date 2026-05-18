unit ufmReportPreview_FR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, frxTable,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, frxClass,
  frxExportBaseDialog, frxExportXLSX, System.Actions, Vcl.ActnList, frxPreview,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, MySkinWhite, frCoreClasses, frxTableObject,
  Vcl.ComCtrls, frxExportPDF, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, frxExportDOCX, cxMemo, umainModule;

type
  TfmReportPreview_FR = class(TForm)
    pMenu: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    alListActions: TActionList;
    aPrint: TAction;
    aSave: TAction;
    Report: TfrxReport;
    StatusBar: TStatusBar;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    aClearFind: TAction;
    Edit1: TMenuItem;
    procedure aPrintExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReportProgressStop(Sender: TfrxReport;
      ProgressType: TfrxProgressType; Progress: Integer);
    procedure ReportProgress(Sender: TfrxReport; ProgressType: TfrxProgressType;
      Progress: Integer);
    procedure ReportProgressStart(Sender: TfrxReport;
      ProgressType: TfrxProgressType; Progress: Integer);
    procedure ReportPreviewPageChanged(Sender: TfrxPreview; PageNo: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aCollapseAllExecute(Sender: TObject);
    procedure aExpandAllExecute(Sender: TObject);
    procedure ReportDblClickObject(Sender: TfrxView; Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
    procedure aEditExecute(Sender: TObject);
  private
    LiveMode :boolean;
  public
    MyReport      : TfrxReport;
    ReportPreview : TfrxPreview;

    constructor Create(AOwner: TComponent; ReportStream : TMemoryStream = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild; LiveReport:boolean = false; OwnTag:Integer=0); reintroduce;
  end;

var
  fmReportPreview_FR: TfmReportPreview_FR;
  ReportInProgres   : Boolean;
  OwnSender         : TObject;

implementation

{$R *.dfm}

constructor TfmReportPreview_FR.Create(AOwner: TComponent; ReportStream : TMemoryStream = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild; LiveReport:boolean = false; OwnTag:Integer=0);
begin
  inherited Create(AOwner);

  OwnSender := Sender;
  Self.Tag  := OwnTag;

  FormStyle := AFormStyle;
  if FormStyle <> fsMDIChild then
    begin
       Position    := poMainFormCenter;
       WindowState := TWindowState.wsMaximized;
    end;

  LiveMode := LiveReport;

  ReportPreview := TfrxPreview.Create(Self);
  ReportPreview.Parent        := Self;
  ReportPreview.Align         := alClient;
  ReportPreview.BackColor     := clWhite;
  ReportPreview.BorderStyle   := bsNone;
  ReportPreview.OnPageChanged := ReportPreviewPageChanged;

  if ReportStream <> nil then
     begin
        MyReport := TfrxReport.Create(Self);

        if not LiveReport then
           MyReport.PreviewPages.LoadFromStream(ReportStream)
        else
           MyReport.LoadFromStream(ReportStream);

        MyReport.Preview       := ReportPreview;

        MyReport.ShowPreparedReport;

        MyReport.OnProgress       := ReportProgress;
        MyReport.OnProgressStart  := ReportProgressStart;
        MyReport.OnProgressStop   := ReportProgressStop;
        MyReport.OnDblClickObject := ReportDblClickObject;

        if LiveReport then
          MyReport.PrepareReport();
     end
  else if Sender is TfrxReport then
    TfrxReport(OwnSender).Preview := ReportPreview;


  if Sender is TfrxReport then
     begin
       ReportPreview.Zoom     := TfrxReport(Sender).PreviewOptions.Zoom;
       ReportPreview.ZoomMode := TfrxReport(Sender).PreviewOptions.ZoomMode;
     end;

  ReportPreview.PopupMenu := PopupMenu;
end;

procedure TfmReportPreview_FR.aCollapseAllExecute(Sender: TObject);
var
 i: Integer;
 c: TfrxComponent;
begin
  ReportPreview.Lock;
  var l := MyReport.AllObjects;

  for i := 0 to l.Count - 1 do
     begin
       c := l[i];
       if (c is TfrxGroupHeader) and TfrxGroupHeader(c).DrillDown then
          begin
             if Sender is TfrxGroupHeader then
               begin
                 if (TfrxGroupHeader(Sender).Name = TfrxGroupHeader(c).Name) and (TfrxGroupHeader(c).DrillDown) then
                     TfrxGroupHeader(c).ExpandDrillDown := False;
               end

            else
              TfrxGroupHeader(c).ExpandDrillDown := False;
          end
     end;

  MyReport.DrillState.Clear;
  ReportPreview.RefreshReport;
  ReportPreview.SetPosition(0,0);
end;

procedure TfmReportPreview_FR.aEditExecute(Sender: TObject);
begin
  ReportPreview.Edit;
end;

procedure TfmReportPreview_FR.aExpandAllExecute(Sender: TObject);
var
 i: Integer;
 c: TfrxComponent;
begin
  ReportPreview.Lock;
  var l := MyReport.AllObjects;

  for i := 0 to l.Count - 1 do
    begin
      c := l[i];

      if (c is TfrxGroupHeader) and TfrxGroupHeader(c).DrillDown then
         begin

            if Sender is TfrxGroupHeader then
              begin
                 if (TfrxGroupHeader(Sender).Name = TfrxGroupHeader(c).Name) and (TfrxGroupHeader(c).DrillDown) then
                     TfrxGroupHeader(c).ExpandDrillDown := True;
              end

            else
               TfrxGroupHeader(c).ExpandDrillDown := True;
         end;
    end;
  MyReport.DrillState.Clear;
  ReportPreview.RefreshReport;
end;

procedure TfmReportPreview_FR.aPrintExecute(Sender: TObject);
begin
  ReportPreview.Print;
end;

procedure TfmReportPreview_FR.aSaveExecute(Sender: TObject);
var
  ExportFilter: TfrxCustomExportFilter;
begin

  var SaveDialog := TSaveDialog.Create(Self);
  try
    SaveDialog.Title := 'Зберегти як';
    SaveDialog.Filter := 'PDF файл (*.pdf)|*.pdf|Word файл (*.docx)|*.docx';
    SaveDialog.FilterIndex := 1;
    SaveDialog.DefaultExt := 'pdf';

    if SaveDialog.Execute then
    begin
      case SaveDialog.FilterIndex of
        1: ExportFilter := TfrxPDFExport.Create(nil);   // PDF
        2: ExportFilter := TfrxDOCXExport.Create(nil);
      else
        Exit;
      end;

      try
        ExportFilter.FileName   := SaveDialog.FileName;
        ExportFilter.ShowDialog := False;
        ExportFilter.OverwritePrompt := False;
        ReportPreview.Export(ExportFilter);
      finally
        ExportFilter.Free;
      end;

    end;
  finally
    SaveDialog.Free;
  end;
end;

procedure TfmReportPreview_FR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmReportPreview_FR.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ReportInProgres then
     begin
         if MyReport = nil then
            Report.Terminated := true
         else
            MyReport.Terminated := true;

        CanClose := false;
     end;
end;

procedure TfmReportPreview_FR.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  ReportPreview.MouseWheelScroll(WheelDelta, Shift, MousePos);
end;

procedure TfmReportPreview_FR.FormShow(Sender: TObject);
begin
  ReportPreview.SetFocus;
end;

function GetGroup(Sender: TfrxView):TfrxGroupHeader;
begin
  Result := nil;
  var TableRow := TfrxTableCell(Sender).Parent;
  if (TableRow is TfrxTableRow) then
     begin
         var TableObj := TfrxTableRow(TableRow).Parent;

         if (TableObj is TfrxTableObject) then
              begin
                 var Group := TfrxTableObject(TableObj).Parent;

                 if (Group is TfrxGroupHeader) then
                   begin
                      Result := TfrxGroupHeader(Group);
                   end
              end;
     end;
end;

procedure TfmReportPreview_FR.ReportDblClickObject(Sender: TfrxView; Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
begin
   if (Sender is TfrxTableCell) and LiveMode then
     begin
       var Group :TfrxGroupHeader := GetGroup(Sender);

       if (Group <> nil) and (Group.DrillDown) then
         begin
            if not Group.ExpandDrillDown then
               aExpandAllExecute(Group)
            else
               aCollapseAllExecute(Group);
         end;
     end;
end;

procedure TfmReportPreview_FR.ReportPreviewPageChanged(Sender: TfrxPreview; PageNo: Integer);
begin
  if not ReportInProgres then
    begin
      if MyReport = nil then
          StatusBar.Panels[0].Text := 'Сторінка '+IntToStr(PageNo)+' з '+IntToStr(Report.PreviewPages.Count)
      else
          StatusBar.Panels[0].Text := 'Сторінка '+IntToStr(PageNo)+' з '+IntToStr(MyReport.PreviewPages.Count)
    end;
end;

procedure TfmReportPreview_FR.ReportProgress(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
begin
   if MyReport = nil then
      StatusBar.Panels[0].Text := 'Сторінок '+IntToStr(MyReport.PreviewPages.Count)
   else
      StatusBar.Panels[0].Text := 'Сторінок '+IntToStr(Report.PreviewPages.Count);
end;

procedure TfmReportPreview_FR.ReportProgressStart(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
begin
   ReportInProgres := True;
end;

procedure TfmReportPreview_FR.ReportProgressStop(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
begin
   ReportInProgres := False;
end;

end.
