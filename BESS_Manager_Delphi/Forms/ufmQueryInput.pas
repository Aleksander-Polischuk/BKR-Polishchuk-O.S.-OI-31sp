unit ufmQueryInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, umainModule,
  MySkinWhite, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfmQueryInput = class(TForm)
    lNameField: TLabel;
    Panel1: TPanel;
    bbOk: TcxButton;
    bbCancel: TcxButton;
    procedure edValKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure DialogConfirm;
    procedure DialogCancel;
  public
    ResultVal: Variant;

    constructor Create(AOwner: TComponent; Param: TStructure = nil; ValType:TFieldType = ftString); reintroduce;
  end;

var
  fmQueryInput: TfmQueryInput;

implementation

{$R *.dfm}

constructor TfmQueryInput.Create(AOwner: TComponent; Param: TStructure; ValType:TFieldType);
var
  Value     :variant;
  NameField :string;
begin
  inherited Create(AOwner);

  if Param <> nil then
    begin
      Value                := Param.GetParam('Value');
      Caption              := mainModule.IFNull(Param.GetParam('Caption'), '');
      lNameField.Caption   := mainModule.IFNull(Param.GetParam('NameField'), '');
    end;

  var edpos   := lNameField.left + lNameField.Width + 10;

  if ValType = ftDate then
     begin
       var El       := TcxDateEdit.Create(Self);
       El.Parent    := Self;
       El.Name      := 'edVal';
       El.EditValue := Value;
       El.Top       := 21;
       El.Left      := edpos;
       El.Height    := 22;

       Width := edpos + 150 +50;

       El.Width     := Width - El.Left - 50;
       EL.Properties.InputKind := ikMask;
       el.OnKeyDown := cxEdit1KeyDown;
     end

  else
     begin
       var El       := TcxTextEdit.Create(Self);
       El.Parent    := Self;
       El.Name      := 'edVal';
       El.EditValue := Value;
       El.Top       := 21;
       El.Left      := edpos;
       El.Height    := 22;
       El.Width     := Width - El.Left - 50;
       el.OnKeyDown := cxEdit1KeyDown;
     end;

end;


procedure TfmQueryInput.cxEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then DialogCancel;
  if Key = 13 then DialogConfirm;
end;

procedure TfmQueryInput.edValKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     DialogConfirm;

  if Key = 27 then
     DialogCancel;
end;

procedure TfmQueryInput.DialogConfirm;
begin
  var Comp := Self.FindComponent('edVal');

  if (Comp is TcxDateEdit) then
     ResultVal := TcxDateEdit(Comp).EditValue

  else
     ResultVal := TcxTextEdit(Comp).EditValue;

  ModalResult := mrOk;
end;

procedure TfmQueryInput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmQueryInput.FormShow(Sender: TObject);
begin
  var Comp := Self.FindComponent('edVal');

  if (Comp is TWinControl) and TWinControl(Comp).CanFocus then
    TWinControl(Comp).SetFocus;
end;

procedure TfmQueryInput.bbCancelClick(Sender: TObject);
begin
  DialogCancel;
end;

procedure TfmQueryInput.bbOkClick(Sender: TObject);
begin
  DialogConfirm;
end;

procedure TfmQueryInput.DialogCancel;
begin
  ModalResult := mrCancel;
end;

end.
