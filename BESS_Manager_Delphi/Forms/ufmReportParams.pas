unit ufmReportParams;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinOffice2013White, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfmReportParams = class(TForm)
    deStart: TcxDateEdit;
    deEnd: TcxDateEdit;
    btnCancel: TcxButton;
    btnOk: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReportParams: TfmReportParams;

implementation

{$R *.dfm}

end.
