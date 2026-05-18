unit ufmCustomGridColumn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, MySkinWhite, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxControls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, dxLayoutContainer, cxGridTableView, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxCheckBox;

type
  TfmCustomGridColumn = class(TForm)
    Panel1: TPanel;
    bbOk: TcxButton;
    bbCancel: TcxButton;
    gList: TcxGrid;
    gListDBTableView: TcxGridDBTableView;
    gListDBTableViewNameColumn: TcxGridDBColumn;
    gListDBTableViewRootGroup: TcxGridTableRowLayoutGroup;
    gListLevel1: TcxGridLevel;
    spListColumns: TFDMemTable;
    dsListColumns: TDataSource;
    gListDBTableViewVisible: TcxGridDBColumn;
    cxButton1: TcxButton;
    gListDBTableViewWidth: TcxGridDBColumn;
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCustomGridColumn: TfmCustomGridColumn;

implementation

{$R *.dfm}

procedure TfmCustomGridColumn.bbCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfmCustomGridColumn.bbOkClick(Sender: TObject);
begin
  ModalResult := mrYes;
end;

procedure TfmCustomGridColumn.cxButton1Click(Sender: TObject);
begin
  spListColumns.First;
  While not spListColumns.Eof do
    begin
      spListColumns.Edit;
      spListColumns.FieldValues['Visible'] := spListColumns.FieldValues['DefVisible'];
      spListColumns.FieldValues['Width']   := spListColumns.FieldValues['DefWidth'];
      spListColumns.Post;

      spListColumns.Next;
    end;
  spListColumns.First;
end;

procedure TfmCustomGridColumn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

end.
