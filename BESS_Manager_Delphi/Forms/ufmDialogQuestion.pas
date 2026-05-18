unit ufmDialogQuestion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, MySkinWhite, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxControls, cxContainer, cxEdit, dxGDIPlusClasses, cxImage,
  System.ImageList, Vcl.ImgList, cxImageList, System.Actions, Vcl.ActnList, cxClasses, cxPropertiesStore, dxSkinOffice2013White;

type
  TfmDialogQuestion = class(TForm)
    Panel1: TPanel;
    bbYes: TcxButton;
    cxImage: TcxImage;
    lMassage: TLabel;
    bbNo: TcxButton;
    ActionList: TActionList;
    aClose: TAction;
    bbCancel: TcxButton;
    procedure bbYesClick(Sender: TObject);
    procedure bbNoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; bbDefault: TModalResult; StrMessage:string; StrCaption:string; Sender: TObject = nil; VisibleCancel:boolean = false); reintroduce;
  end;

var
  fmDialogQuestion: TfmDialogQuestion;
  OwnSender       : TObject;
  DefaultButton   : TModalResult;
  v_bbCancel      :boolean;
implementation

{$R *.dfm}

procedure TfmDialogQuestion.aCloseExecute(Sender: TObject);
begin
  if v_bbCancel then
     ModalResult := mrCancel
  else
     ModalResult := mrNo;
end;

procedure TfmDialogQuestion.bbCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmDialogQuestion.bbNoClick(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TfmDialogQuestion.bbYesClick(Sender: TObject);
begin
  ModalResult := mrYes;
end;

constructor TfmDialogQuestion.Create(AOwner: TComponent; bbDefault: TModalResult; StrMessage:string; StrCaption:string; Sender: TObject = nil; VisibleCancel:boolean = false);
begin
  inherited Create(AOwner);
  OwnSender := Sender;

  v_bbCancel       := VisibleCancel;
  bbCancel.Visible := VisibleCancel;

  Caption          := StrCaption;
  lMassage.Caption := StrMessage;
  DefaultButton    := bbDefault;
end;

procedure TfmDialogQuestion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmDialogQuestion.FormShow(Sender: TObject);
begin
 if DefaultButton = mrYes then
    begin
      bbYes.Font.Style := [fsBold];
      bbYes.SetFocus;
    end

 else if DefaultButton = mrNo then
    begin
      bbNo.Font.Style := [fsBold];
      bbNo.SetFocus;
    end

 else if DefaultButton = mrCancel then
    begin
      bbCancel.Font.Style := [fsBold];
      bbCancel.SetFocus;
    end;
end;

end.
