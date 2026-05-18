unit ufmBaseListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, umainModule, System.IniFiles, System.DateUtils, dxSkinsCore, MySkinWhite, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, cxButtons, cxDBTL, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfmBaseListForm = class(TForm)
    spListColumns: TFDMemTable;

  protected
    FActionChoice    : boolean;
    FNoCheckOpenForm : boolean;
    FSelectID        : integer;
    FFormIsClosed    : boolean;
    FFormStyle       : TFormStyle;

    FListBeginPeriod : Variant;
    FListEndPeriod   : Variant;
    FTypePeriod      : Integer;
    FIntervalBeg     : Integer;
    FIntervalEnd     : Integer;
    FListSavePeriod  : boolean;

    FTop, FLeft, FWidth, FHeight: Integer;

  public
    procedure ShowThisForm();
    constructor Create(AOwner: TComponent; Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild; FormClass: TFormClass = nil); reintroduce;

    property ActionChoice: boolean read FActionChoice write FActionChoice;
    property FormIsClosed: boolean read FFormIsClosed write FFormIsClosed;
  end;

var
  fmBaseListForm   : TfmBaseListForm;
  OwnSender        : TObject;

implementation

{$R *.dfm}

constructor TfmBaseListForm.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle; FormClass: TFormClass);
begin
  inherited Create(AOwner);

  OwnSender := Sender;
  FFormStyle := AFormStyle;

  if Param <> nil then
  begin
    FSelectID        := mainModule.IFNull(Param.GetParam('SelectID'), 0);
    FActionChoice    := mainModule.IFNull(Param.GetParam('Choice'), False);
    FNoCheckOpenForm := mainModule.IFNull(Param.GetParam('NoCheckOpenForm'), False);
    FTop             := mainModule.IFNull(Param.GetParam('Top'), 0);
    FLeft            := mainModule.IFNull(Param.GetParam('Left'), 0);
    FWidth           := mainModule.IFNull(Param.GetParam('Width'), 0);
    FHeight          := mainModule.IFNull(Param.GetParam('Height'), 0);
  end;

  FFormIsClosed := False;
end;

procedure TfmBaseListForm.ShowThisForm();
begin
  FormStyle := FFormStyle;
  if FormStyle <> fsMDIChild then
     begin
        if (FTop = 0) and (FLeft = 0) then
            Position := poMainFormCenter

        else
           begin
             Position := poDesigned;
             Top  := FTop;
             Left := FLeft;
           end;

        if FWidth > 0 Then Width   := FWidth;
        if FHeight > 0 Then Height := FHeight;
     end;

  if (FormStyle <> fsMDIChild) and (FormStyle <> fsNormal) then
     Show;
end;

end.
