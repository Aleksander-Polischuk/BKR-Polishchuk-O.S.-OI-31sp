unit ufmMessDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, MySkinWhite, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxControls, cxContainer, cxEdit, dxGDIPlusClasses, cxImage,
  System.ImageList, Vcl.ImgList, cxImageList, System.Actions, Vcl.ActnList, cxTextEdit, cxMemo, dxSkinOffice2013White;

type
  TfmMessDialog = class(TForm)
    Panel1: TPanel;
    bbOk: TcxButton;
    cxImageList: TcxImageList;
    ActionList: TActionList;
    aClose: TAction;
    bbShowDebugInfo: TcxButton;
    lMassage: TMemo;
    cxImage: TcxImage;
    procedure bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbShowDebugInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; TTypeMessage: integer; StrMessage:string; StrCaption:string; Sender: TObject = nil; DebugInfo:string = ''); reintroduce;
  end;

var
  fmMessDialog: TfmMessDialog;
  OwnSender           : TObject;
  vDebugInfo           : string;
implementation

{$R *.dfm}

constructor TfmMessDialog.Create(AOwner: TComponent; TTypeMessage: integer; StrMessage:string; StrCaption:string; Sender: TObject = nil; DebugInfo:string = '');
begin
  inherited Create(AOwner);
  OwnSender := Sender;

  Caption := StrCaption;
  var Bitmap := TBitmap.Create;
   try
      cxImageList.GetBitmap(TTypeMessage, Bitmap);
      cxImage.Picture.Assign(Bitmap);
   finally
      Bitmap.Free;
   end;
  lMassage.Lines.Text := StrMessage;

  if lMassage.Lines.Count > 3 then
     begin
        var PlusHeight := (lMassage.Lines.Count - 3) * 17;
        ClientHeight := ClientHeight + PlusHeight;
     end;

  bbShowDebugInfo.Visible := DebugInfo <> '';
  vDebugInfo := DebugInfo;
end;


procedure TfmMessDialog.aCloseExecute(Sender: TObject);
begin
   ModalResult := mrClose;
end;

procedure TfmMessDialog.bbOkClick(Sender: TObject);
begin
  ModalResult := mrYes;
end;

procedure TfmMessDialog.bbShowDebugInfoClick(Sender: TObject);
begin
  bbShowDebugInfo.Visible := false;

  lMassage.Lines.Add('');
  lMassage.Lines.Add('Додаткова інформація:');
  lMassage.Lines.Add(vDebugInfo);


  lMassage.ScrollBars := TScrollStyle.ssVertical;
  ClientHeight := ClientHeight + 400;
 // ClientWidth  := ClientWidth + 100;

  Repaint;
end;

procedure TfmMessDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmMessDialog.FormShow(Sender: TObject);
begin
  bbOK.SetFocus;
end;

end.
