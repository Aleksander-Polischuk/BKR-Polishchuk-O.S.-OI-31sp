unit ufmQueryListInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, udmLib,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, MySkinWhite, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel,
  dxLayoutContainer, cxGridTableView, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  cxButtons;

type
  TfmQueryListInput = class(TForm)
    dsDataSet: TDataSource;
    gList: TcxGrid;
    gListDBTableView: TcxGridDBTableView;
    gListDBTableViewID: TcxGridDBColumn;
    gListDBTableViewNAME: TcxGridDBColumn;
    gListDBTableViewRootGroup: TcxGridTableRowLayoutGroup;
    gListLevel1: TcxGridLevel;
    Panel1: TPanel;
    bbOk: TcxButton;
    bbCancel: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gListDBTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure gListDBTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    procedure DialogCancel;
    procedure DialogConfirm;
  public
    DataSet  :TDataSet;
    ResultID :integer;

    constructor Create(AOwner: TComponent; Param: TStructure = nil); reintroduce;
  end;

var
  fmQueryListInput: TfmQueryListInput;

implementation

{$R *.dfm}

constructor TfmQueryListInput.Create(AOwner: TComponent; Param: TStructure);
begin
  inherited Create(AOwner);

end;

procedure TfmQueryListInput.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmQueryListInput.FormShow(Sender: TObject);
begin
  dsDataSet.DataSet := DataSet;
end;

procedure TfmQueryListInput.gListDBTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  DialogConfirm;
end;

procedure TfmQueryListInput.gListDBTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
     DialogConfirm;

  if Key = 27 then
     DialogCancel;
end;

procedure TfmQueryListInput.DialogConfirm;
begin
  ResultID := DataSet.FieldValues['ID'];
  ModalResult := mrOk;
end;

procedure TfmQueryListInput.bbCancelClick(Sender: TObject);
begin
  DialogCancel;
end;

procedure TfmQueryListInput.bbOkClick(Sender: TObject);
begin
  DialogConfirm;
end;

procedure TfmQueryListInput.DialogCancel;
begin
  ModalResult := mrCancel;
end;

end.
