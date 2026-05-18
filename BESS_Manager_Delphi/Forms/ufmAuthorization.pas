unit ufmAuthorization;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, iniFiles, Vcl.Dialogs, dxSkinsCore,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  cxContainer, cxEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, dxCore, cxClasses,
  dxSkinsForm, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, Vcl.ExtCtrls,
  MySkinWhite, dxSkinOffice2013White;

type
  TfmAuthorization = class(TForm)
    edPassword: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    spUsers: TFDQuery;
    dsUsers: TDataSource;
    cbUserName: TcxLookupComboBox;
    Panel1: TPanel;
    bbOk: TcxButton;
    bbCancel: TcxButton;
    procedure edPasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure ButtonCustomDraws(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxButtonViewInfo; var ADone: Boolean);
  public
  end;

var
  fmAuthorization: TfmAuthorization;

implementation

{$R *.dfm}

uses
  umainModule, HomePage, System.Hash;

procedure TfmAuthorization.bbCancelClick(Sender: TObject);
begin
  // Зміщуємо фокус з DevExpress-кнопки, щоб зняти графічні хуки до закриття
  Self.SetFocus;
  ModalResult := mrCancel;
end;

procedure TfmAuthorization.ButtonCustomDraws(Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxButtonViewInfo; var ADone: Boolean);
begin
  if AViewInfo.State = cxbsDefault then
    ACanvas.Brush.Color := clWhite
  else if AViewInfo.State = cxbsHot then
    ACanvas.Brush.Color := $00F0F0F0
  else
    ACanvas.Brush.Color := $00E0E0E0;

  ACanvas.FillRect(AViewInfo.Bounds);
  ACanvas.FrameRect(AViewInfo.Bounds, $00D0D0D0);

  ACanvas.Font.Color := clBlack;
  ACanvas.DrawText(TcxButton(Sender).Caption, AViewInfo.Bounds, cxAlignCenter);
  ADone := True;
end;

procedure TfmAuthorization.bbOkClick(Sender: TObject);
var
  FileSET: TiniFile;
  InputHash, DbHash: string;
begin
  // Безпечна перевірка на пустий вибір
  if VarIsNull(cbUserName.EditValue) or (VarToStr(cbUserName.EditValue) = '') then
  begin
    mainModule.ShowMessage(Self, 'Виберіть, будь ласка, користувача', 'Увага', TTypeMessage.Warning);
    cbUserName.SetFocus;
    Exit;
  end;

  if not spUsers.Locate('ID', cbUserName.EditValue, []) then
    Exit;

  InputHash := LowerCase(THashSHA2.GetHashString(edPassword.Text));
  DbHash    := LowerCase(Trim(spUsers.FieldByName('USER_PASSWORD').AsString));

  if InputHash <> DbHash then
  begin
    mainModule.ShowMessage(Self, 'Авторизація не виконана, перевірте пароль!', 'Вхід в програму', TTypeMessage.Error);
    edPassword.SetFocus;
    Exit;
  end;

  gbSysIDUserName := spUsers.FieldByName('ID').AsInteger;
  gbSysUserName   := spUsers.FieldByName('USER_NAME').AsString;

  FileSET := TiniFile.Create(gbPathProg + gbNameIniFileProgram);
  try
    FileSET.WriteInteger('MAIN', 'LAST_USER_ID', gbSysIDUserName);
  finally
    FileSET.Free;
  end;

  ModalResult := mrOk;
end;

procedure TfmAuthorization.edPasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    bbOkClick(nil);
end;

procedure TfmAuthorization.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TfmAuthorization.FormCreate(Sender: TObject);
var
  I: Integer;
  FileSET: TiniFile;
begin
  gbPathProg := ExtractFilePath(ParamStr(0));

  FileSET := TiniFile.Create(gbPathProg + gbNameIniFileProgram);
  try
    gbServer   := FileSET.ReadString('MAIN', 'SERVER', '');
    gbDatabase := FileSET.ReadString('MAIN', 'DATABASE', '');
    gbPort     := FileSET.ReadString('MAIN', 'Port', '3050');
    gbUserDB   := FileSET.ReadString('MAIN', 'USER', 'SYSDBA');
    gbPassword := FileSET.ReadString('MAIN', 'PASS', 'masterkey');
  finally
    FileSET.Free;
  end;

  if (gbServer = '') or (gbDatabase = '') then
  begin
    ShowMessage('Помилка: Не вказано шлях до бази даних у файлі ' + gbNameIniFileProgram + '!');
    Application.Terminate;
    Abort;
  end;

  if not mainModule.Connect then
  begin
    Application.Terminate;
    Abort;
  end;

  edPassword.Text := '';
  try
    spUsers.Active := True;
  except
    on E: Exception do
    begin
      ShowMessage('Неможливо завантажити список користувачів!' + #13#10 + E.Message);
      Application.Terminate;
      Abort;
    end;
  end;

  for I := 0 to Self.ComponentCount - 1 do
    if Self.Components[I] is TcxButton then
      TcxButton(Self.Components[I]).OnCustomDraw := ButtonCustomDraws;
end;

procedure TfmAuthorization.FormShow(Sender: TObject);
var
  FileSET: TiniFile;
  UserID: Integer;
begin
  FileSET := TiniFile.Create(gbPathProg + gbNameIniFileProgram);
  try
    UserID := FileSET.ReadInteger('MAIN', 'LAST_USER_ID', -1);
  finally
    FileSET.Free;
  end;

  if UserID > 0 then
  begin
    if spUsers.Locate('ID', UserID, []) then
    begin
      cbUserName.EditValue := UserID;
      edPassword.SetFocus;
    end;
  end;
end;

end.
