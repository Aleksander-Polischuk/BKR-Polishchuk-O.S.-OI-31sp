unit ufmBaseObjectForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, umainModule, ActnList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, MySkinWhite, cxDBEdit, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfmBaseObjectForm = class(TForm)
    function GetOperation: FormOperation;
    procedure SetOperation(value: FormOperation);

  protected // Змінено на protected, щоб дочірні класи мали доступ до внутрішніх змінних, якщо потрібно
    FID               : Integer;
    FNoCheckOpenForm  : boolean;
    FOperation        : FormOperation;
    FFormIsClosed     : boolean;
    FFormModify       : boolean;
    FFormCanClose     : boolean;
    FFormStyle        : TFormStyle;

    function CheckOpenObjectForm(Sender: TForm; FormClass: TFormClass; ObjID:integer): Boolean;
  public
    // Додані публічні властивості, до яких звертається дочірня форма
    property Operation: FormOperation read GetOperation write SetOperation;
    property ID: Integer read FID write FID;
    property FormModify: boolean read FFormModify write FFormModify;
    property FormCanClose: boolean read FFormCanClose write FFormCanClose;
    property FormIsClosed: boolean read FFormIsClosed write FFormIsClosed;

    procedure ShowThisForm();

    constructor Create(AOwner: TComponent; Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild; FormClass: TFormClass = nil); reintroduce;

    // ВИПРАВЛЕНО: constructor змінено на procedure
    procedure CloseQuery(Sender: TObject; var CanClose: Boolean; SaveAction: TAction); reintroduce;
  end;

var
  fmBaseObjectForm  : TfmBaseObjectForm;

implementation

{$R *.dfm}

function TfmBaseObjectForm.GetOperation: FormOperation;
begin
   Result := FOperation;
end;

procedure TfmBaseObjectForm.SetOperation(value: FormOperation);
begin
   FOperation := value;
end;

constructor TfmBaseObjectForm.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle; FormClass: TFormClass);
begin
  inherited Create(AOwner);

  FFormStyle := AFormStyle;

  if Param <> nil then
    begin
      FOperation         := mainModule.IFNull(Param.GetParam('Operation'), FormOperation.None);
      FID                := mainModule.IFNull(Param.GetParam('ID'), 0);
      FNoCheckOpenForm   := mainModule.IFNull(Param.GetParam('NoCheckOpenForm'), false);
    end;

  if  (FNoCheckOpenForm = false) and (CheckOpenObjectForm(Self, FormClass, FID) = true) then
     begin
        FFormIsClosed := True;
        Close;
        Exit;
     end
  else FFormIsClosed := false;
end;

function TfmBaseObjectForm.CheckOpenObjectForm(Sender: TForm; FormClass: TFormClass; ObjID:integer): Boolean;
begin
  Result := False; // Додано повернення значення за замовчуванням
end;

// ВИПРАВЛЕНО: constructor змінено на procedure
procedure TfmBaseObjectForm.CloseQuery(Sender: TObject; var CanClose: Boolean; SaveAction: TAction);
begin

end;

procedure TfmBaseObjectForm.ShowThisForm();
begin
  FormStyle := FFormStyle;

  if FormStyle <> fsMDIChild then
  begin
    Position := poMainFormCenter;
    PopupMode := pmAuto;
    Show;
  end;
end;

end.
