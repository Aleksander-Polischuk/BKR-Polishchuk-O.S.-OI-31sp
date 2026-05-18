unit udmConf;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils, Xml.XMLDoc, Xml.XMLIntf;

type
  TXMLSettings = class
  private
    FFileName: string;
    FXMLDoc: IXMLDocument;
    function GetNodeByPath(const XPath: string; CreateIfMissing: Boolean): IXMLNode;
  public
    constructor Create(const FileName: string);
    destructor Destroy; override;
    procedure SaveSetting(const XPath, Value: string);
    function LoadSetting(const XPath, DefaultValue: string): string;
  end;

type
  TdmConf = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConf: TdmConf;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Конструктор: загружает или создаёт XML }
constructor TXMLSettings.Create(const FileName: string);
begin
  FFileName := FileName;

  if TFile.Exists(FFileName) then
    FXMLDoc := LoadXMLDocument(FFileName)
  else
    FXMLDoc := NewXMLDocument;

  //FXMLDoc.Options := [doNodeAutoIndent];

  // Добавляем корневой узел, если его нет
  if FXMLDoc.DocumentElement = nil then
    FXMLDoc.AddChild('Settings');
end;

{ Деструктор: сохраняет XML перед освобождением памяти }
destructor TXMLSettings.Destroy;
begin
  FXMLDoc.SaveToFile(FFileName);
  inherited;
end;

{ Получает узел по пути (создаёт, если отсутствует) }
function TXMLSettings.GetNodeByPath(const XPath: string; CreateIfMissing: Boolean): IXMLNode;
var
  PathParts: TArray<string>;
  CurrentNode: IXMLNode;
  I: Integer;
begin
  PathParts := XPath.Split(['/']);
  CurrentNode := FXMLDoc.DocumentElement;

  for I := Low(PathParts) to High(PathParts) do
  begin
    if CurrentNode.ChildNodes.FindNode(PathParts[I]) = nil then
    begin
      if not CreateIfMissing then
        Exit(nil);
      CurrentNode := CurrentNode.AddChild(PathParts[I]);
    end
    else
      CurrentNode := CurrentNode.ChildNodes.FindNode(PathParts[I]);
  end;

  Result := CurrentNode;
end;

{ Сохраняет настройку в XML (без записи в файл) }
procedure TXMLSettings.SaveSetting(const XPath, Value: string);
var
  TargetNode: IXMLNode;
begin
  TargetNode := GetNodeByPath(XPath, True);
  if Assigned(TargetNode) then
    TargetNode.Text := Value;
end;

{ Загружает настройку из XML }
function TXMLSettings.LoadSetting(const XPath, DefaultValue: string): string;
var
  TargetNode: IXMLNode;
begin
  TargetNode := GetNodeByPath(XPath, False);
  if Assigned(TargetNode) then
    Result := TargetNode.Text
  else
    Result := DefaultValue;
end;


//{ Пример использования }
//var
//  Settings: TXMLSettings;
//begin
//  try
//    // Создаём объект для работы с файлом config.xml
//    Settings := TXMLSettings.Create('config.xml');
//
//    // Записываем настройки (но не сохраняем сразу)
//    Settings.SaveSetting('Display/Theme', 'Dark');
//    Settings.SaveSetting('Audio/Volume', '80');
//    Settings.SaveSetting('User/Name', 'Admin');
//    Settings.SaveSetting('User/Preferences/Language', 'Russian');
//
//    // Загружаем настройки
//    Writeln('Тема: ', Settings.LoadSetting('Display/Theme', 'Light'));
//    Writeln('Громкость: ', Settings.LoadSetting('Audio/Volume', '50'));
//    Writeln('Имя пользователя: ', Settings.LoadSetting('User/Name', 'Guest'));
//    Writeln('Язык: ', Settings.LoadSetting('User/Preferences/Language', 'English'));
//
//  finally
//    Settings.Free; // Здесь XML-файл сохраняется
//  end;
//end.


end.
