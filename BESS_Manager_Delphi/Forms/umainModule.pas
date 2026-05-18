unit umainModule;

interface

uses
  Vcl.Graphics, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.IniFiles, cxTextEdit, cxDBEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, ufmDialogQuestion,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.Dialogs, System.ImageList, Vcl.ImgList, Vcl.Controls,
  cxImageList, cxGraphics, System.UITypes, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, cxStyles, cxClasses, System.Variants, Vcl.Forms,
  System.Generics.Collections, DateUtils, frxClass,  System.StrUtils, cxDBLookupComboBox, cxEdit, cxGridDBBandedTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridExportLink, ufmMessDialog, frLanguageUkrainian, cxCurrencyEdit, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, MySkinWhite, cxMaskEdit, cxDropDownEdit, cxCalendar,

  stopwatch, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, cxDBTL, cxTLExportLink,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, Math, RegularExpressions,
  FireDAC.Phys.SQLiteVDataSet, frLocalization, frCoreClasses, cxButtonEdit,
  Rtti, TypInfo, cxEditRepositoryItems, cxDBEditRepository,

  dxSpreadSheetCore, dxSpreadSheetCoreFormulas, dxSpreadSheetCoreHistory, dxSpreadSheetCoreStyles,
  dxSpreadSheetCoreStrs, dxSpreadSheetConditionalFormatting, dxSpreadSheetConditionalFormattingRules,
  dxSpreadSheetClasses, dxSpreadSheetContainers, dxSpreadSheetFormulas, dxSpreadSheetHyperlinks,
  dxSpreadSheetFunctions, dxSpreadSheetStyles, dxSpreadSheetGraphics, dxSpreadSheetPrinting,
  dxSpreadSheetTypes, dxSpreadSheetUtils, dxSpreadSheetFormattedTextUtils, dxSpreadSheet, dxSpreadSheetFormatXLSX, cxLookAndFeels, dxSkinsForm,
  dxSkinOffice2013White;

const
  gbNameIniFileProgram  = 'nesting.ini';

  gbDefaultUser     = 'app';
  gbDefaultPassword = 'fqu0PS8NTmsr';
  gbDefaultPort     = '';

type
  TTypeMessage     = (Information = 0, Warning = 1, Error = 2);
  FormOperation    = (None = 0, Add = 1, AddCopy = 2, Edit = 3);
  TTypeForm        = (FormList = 0, FormObj = 1);
  DBOperations     = (dboMarkDelete = 0, dboDelete = 1, dboEdit = 2, dboNew = 3);

type
  DBTableName = (
    REF_TOOLS           = 0,
    REF_PARTS           = 1,
    REF_MATERIALS       = 2,
    REF_MACHINE         = 3,
    JRN_OUTAGES         = 4,
    REF_BATTERY         = 5,
    REF_UNITS           = 6,
    REF_CATEGORIES      = 7,
    REF_ENERGY_TARIFFS  = 8,
    SYS_USERS           = 9
  );

  ///////// Структура ////////////////////////////////////
  type
    TStructure = class
  private
    FParams: TDictionary<String, Variant>;
  public
    CheckExistingKey :boolean;
    constructor Create;
    destructor Destroy; override;
    procedure AddParam(const Name: String; const Value: Variant);
    procedure RemoveParam(const Name: String);
    function GetParam(const Name: String): Variant;
    function Count(): Integer;
    function ValueItems():TArray<Variant>;
    function KeyItems():TArray<String>;
    procedure Empty();
  end;


///////////////////////////////////////////////////////////////////////
type
  TmainModule = class(TDataModule)
    cnFBConnect: TFDConnection;
    cnFBConnectWrite: TFDConnection;
    cxImageList64: TcxImageList;
    StylesRepository: TcxStyleRepository;
    StyleGrid_odd_lightgreen: TcxStyle;
    StyleGrid_Service: TcxStyle;
    cxRedCaption: TcxStyle;
    Green: TcxStyle;
    Footer_bold: TcxStyle;
    WorkAccountVolume: TcxStyle;
    white_Bold: TcxStyle;
    cxStyle1: TcxStyle;
    StyleGrid_odd: TcxStyle;
    GridBackground: TcxStyle;
    ControlInFocus: TcxStyle;
    GridHeader: TcxStyle;
    BlueText: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    GridFocusLight: TcxStyle;
    GridFocus: TcxStyle;
    GridGroup: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxImageListStatus: TcxImageList;
    cxImageList32: TcxImageList;
    cxImageList16: TcxImageList;
    spSysMessages: TFDMemTable;
    dsSysMessages: TDataSource;
    stYellow: TcxStyle;
    stGreen: TcxStyle;
    stred: TcxStyle;
    spREF_TOOLS: TFDQuery;
    dsREF_TOOLS: TDataSource;
    spREF_PARTS: TFDQuery;
    dsREF_PARTS: TDataSource;
    spREF_Product: TFDQuery;
    dsREF_Product: TDataSource;
    spUsers: TFDQuery;
    dsUsers: TDataSource;
    dxSkinController1: TdxSkinController;
    spREF_MATERIALS: TFDQuery;
    dsREF_MATERIALS: TDataSource;
    spREF_MACHINE: TFDQuery;
    dsREF_MACHINE: TDataSource;
    spJRN_OUTAGES: TFDQuery;
    dsJRN_OUTAGES: TDataSource;
    spREF_BATTERY: TFDQuery;
    dsREF_BATTERY: TDataSource;
    spBatteryTelemetry: TFDQuery;
    dsBatteryTelemetry: TDataSource;
    spJRN_PARTS_STOCK: TFDQuery;
    dsJRN_PARTS_STOCK: TDataSource;
    spREF_UNITS: TFDQuery;
    dsREF_UNITS: TDataSource;
    spREF_CATEGORIES: TFDQuery;
    dsREF_CATEGORIES: TDataSource;
    spREF_ENERGY_TARIFFS: TFDQuery;
    dsREF_ENERGY_TARIFFS: TDataSource;
    spJRN_NESTING_TASKS: TFDQuery;
    dsJRN_NESTING_TASKS: TDataSource;
    dsSYS_USERS: TDataSource;
    spSYS_USERS: TFDQuery;

  public
    function Connect(): boolean;
    function ShowQuestionYesNo(AOwner: TComponent; StrQuestion, Caption: string; bbDefault: TModalResult = mrYes): boolean;
    function DelRecordSetMarkDel(DataField: TFDQuery; Wnd:HWND; TableName: string; IDRecord: integer; MarkDel: boolean; DelRecord: boolean = false): boolean;
    procedure ShowMessage(AOwner: TComponent; StrMessage:string; Caption: string = ''; TypeMessage : TTypeMessage = TTypeMessage.Information; DebugInfo: string = '');
    function IFNull(Val, ValIfNull: Variant): Variant;
    procedure EditReadOnly(Sender: TObject; Color: TColor = 0; FontColor:TColor = 0; ReadOnly :boolean = true);
    function GetIDForm: integer;

    Function GetForm(TypeForm :TTypeForm; DBTable: DBTableName;  Param: TStructure = nil; AOwner: TComponent = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild): TForm; overload;
    Function GetForm(TypeForm :TTypeForm; const DBTable: string; Param: TStructure = nil; AOwner: TComponent = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild): TForm; overload;

    function BeginTransaction_():TFDTransaction;
    function BeginTransactionWrite():TFDTransaction;
  end;

var
  mainModule : TmainModule;

  gbPathProg : string;
  gbServer   : string;
  gbDatabase : string;
  gbPort     : string;
  gbPassword : string;
  gbUserDB   : string;
  gbSysUserName :string;

  gbIDForm: integer;
  gbSysIDUserName :Integer;

implementation

uses
   ufmTools, ufmTools_Ch, ufmParts, ufmParts_Ch, ufmListMaterial,
   ufmListMaterial_Ch, ufmListMachine, ufmListMachine_Ch, ufmJRN_Outage, ufmJRN_Outage_Ch,
   ufmListBatery, ufmListBatery_Ch, ufmJRN_Parts_Stock, ufmJRN_Parts_Stock_Add, ufmUnits, ufmUnits_Ch, ufmCategories, ufmCategories_Ch,
   ufmPriceElectricity, ufmPriceElectricity_Ch, ufmListUsers, ufmListUsers_Ch;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

/////////// Структура //////////////////////////////////
constructor TStructure.Create;
begin
  inherited;
  FParams := TDictionary<String, Variant>.Create;
end;

destructor TStructure.Destroy;
begin
  FParams.Free;
  inherited;
end;

procedure TStructure.AddParam(const Name: String; const Value: Variant);
begin
  if (CheckExistingKey) and (not FParams.ContainsKey(AnsiUpperCase(Name))) then
     raise Exception.Create('Помилка, параметр '+AnsiUpperCase(Name)+ ' не знайдений');

  FParams.AddOrSetValue(AnsiUpperCase(Name), Value);
end;
procedure TStructure.RemoveParam(const Name: String);
begin
  FParams.Remove(Name);
end;

function TStructure.GetParam(const Name: String): Variant;
var
  Val :Variant;
begin
  try
    if FParams.TryGetValue(AnsiUpperCase(Name), Val) then
       Result := Val
    else
       Result := Null;
  except
    Result := Null;
  end;
end;

function TStructure.Count(): integer;
begin
  try
    Result := FParams.Count;
  except
    Result := 0;
  end;
end;

function TStructure.ValueItems():TArray<Variant>;
begin
  Result := FParams.Values.ToArray;
end;

function TStructure.KeyItems():TArray<String>;
begin
  Result := FParams.Keys.ToArray;
end;

procedure TStructure.Empty;
var
   FieldName : string;
begin
  For FieldName in FParams.Keys.ToArray do
    begin
      FParams.Items[FieldName] := '';
    end;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function TmainModule.Connect(): boolean;
var
  Ini: TIniFile;
  AppPath: string;
begin
  // Визначаємо папку, де лежить NestinApp.exe
  AppPath := ExtractFilePath(ParamStr(0));

  // Читаємо nesting.ini. Якщо файлу або ключа немає - беремо дефолтні значення
  Ini := TIniFile.Create(AppPath + gbNameIniFileProgram);
  try
    gbServer   := Ini.ReadString('MAIN', 'SERVER', '192.168.2.220');
    gbDatabase := Ini.ReadString('MAIN', 'DATABASE', 'D:\ALex\Диплом\NESTINGDB_3.fdb');
    gbPort     := Ini.ReadString('MAIN', 'Port', '3051');
    gbPassword := Ini.ReadString('MAIN', 'PASSWORD', gbDefaultPassword); // Підтягуємо константу 'fqu0PS8NTmsr', якщо порожньо
  finally
    Ini.Free;
  end;

  if gbPort = '' then
     gbPort := gbDefaultPort;

  cnFBConnect.Connected    := false;
  cnFBConnect.DriverName  := 'FB';
  cnFBConnect.LoginPrompt := false;

  cnFBConnect.Params.Values['Server']    := gbServer;
  cnFBConnect.Params.Values['Port']      := gbPort;
  cnFBConnect.Params.Values['Database']  := gbDatabase;
  cnFBConnect.Params.Values['User_Name'] := gbDefaultUser;
  cnFBConnect.Params.Values['Password']  := gbPassword;

  cnFBConnectWrite.Connected    := false;
  cnFBConnectWrite.DriverName  := 'FB';
  cnFBConnectWrite.LoginPrompt := false;

  cnFBConnectWrite.Params.Values['Server']    := gbServer;
  cnFBConnectWrite.Params.Values['Port']      := gbPort;
  cnFBConnectWrite.Params.Values['Database']  := gbDatabase;
  cnFBConnectWrite.Params.Values['User_Name'] := gbDefaultUser;
  cnFBConnectWrite.Params.Values['Password']  := gbPassword;

  try
    cnFBConnect.Connected      := True;
    cnFBConnectWrite.Connected := True;
    Result                     := True;
  except
    on E: Exception do
      begin
        ShowMessage(Application, 'Неможливо підключитися до сервера. ' + #13 + E.Message, '', TTypeMessage.Error);
        Result := false;
      end;
  end;
end;

function TmainModule.GetIDForm: integer;
begin
  gbIDForm := gbIDForm + 1;
  Result := gbIDForm;
end;


procedure TmainModule.EditReadOnly(Sender: TObject; Color: TColor = 0; FontColor:TColor = 0; ReadOnly :boolean = true);
var
  ColorApply      : TColor;
  FontColorApply  : TColor;
begin
  if Color = 0 then ColorApply := clWhite
  else ColorApply := Color;

  if FontColor = 0 then FontColorApply := clWindowText
  else FontColorApply := FontColor;

  if (Sender.ClassType = TcxDBTextEdit) then
    begin
      (Sender as TcxDBTextEdit).Style.Color         := ColorApply;
      (Sender as TcxDBTextEdit).Properties.ReadOnly := ReadOnly;
      (Sender as TcxDBTextEdit).Style.Edges         := [TcxBorder.bBottom];
      (Sender as TcxDBTextEdit).Style.TextColor     := FontColorApply;

      if not ReadOnly then (Sender as TcxDBTextEdit).Style.Edges := [TcxBorder.bBottom, TcxBorder.bTop, TcxBorder.bLeft, TcxBorder.bRight];
    end
end;

function TmainModule.ShowQuestionYesNo(AOwner: TComponent; StrQuestion, Caption: string; bbDefault: TModalResult = mrYes): boolean;
var
  FormCaption : string;
  FCaption    : string;
begin
   if AOwner = Application then
     begin
       if Screen.ActiveForm <> nil then
         begin
           FormCaption := Screen.ActiveForm.Caption;
         end;
     end
  else
    begin
       FormCaption := TForm(AOwner).Caption;
    end;

  if Caption = '' then FCaption := FormCaption
  else FCaption := Caption;

  fmDialogQuestion := TfmDialogQuestion.Create(nil, bbDefault, StrQuestion, FCaption);

  var res := fmDialogQuestion.ShowModal;

  If (res = mrYes) then
    Result := true
  else
    Result := false;
end;



procedure TmainModule.ShowMessage(AOwner: TComponent; StrMessage:string; Caption: string = ''; TypeMessage : TTypeMessage = TTypeMessage.Information; DebugInfo: string = '');
var
  FormCaption : string;
  FormName    : string;
  FCaption    : string;
begin
  if AOwner = Application then
     begin
       if Screen.ActiveForm <> nil then
         begin
           FormCaption := Screen.ActiveForm.Caption;
           FormName    := Screen.ActiveForm.Name;
         end;
     end
  else
    begin
       FormCaption := TForm(AOwner).Caption;
       FormName    := Screen.ActiveForm.Name;
    end;

  if Caption = '' then FCaption := FormCaption
  else FCaption := Caption;

  var Param    : Integer := 0;

  if TypeMessage = TTypeMessage.Information then
     Param := 0
   else if TypeMessage = TTypeMessage.Warning then
     Param := 1
    else if TypeMessage = TTypeMessage.Error then
     Param := 2;

  if DebugInfo <> '' then
     DebugInfo := 'Форма: '+ FormName + ' \ ' + FormCaption +#13#10+DebugInfo;

  fmMessDialog := TfmMessDialog.Create(nil, Param, StrMessage, FCaption, nil, DebugInfo);
  fmMessDialog.ShowModal;
end;

function TmainModule.DelRecordSetMarkDel(DataField: TFDQuery; Wnd:HWND; TableName: string; IDRecord: integer; MarkDel: boolean; DelRecord: boolean = false): boolean;
begin
  var FBTransaction          := BeginTransactionWrite;
  var spDelRecordSetMarkDel  := TFDStoredProc.Create(nil);
  try
     spDelRecordSetMarkDel.Connection := cnFBConnectWrite;
     spDelRecordSetMarkDel.Transaction := FBTransaction;
     spDelRecordSetMarkDel.StoredProcName := 'SYS_SETMARKDEL';
     spDelRecordSetMarkDel.Prepare;

     spDelRecordSetMarkDel.Params.ParamByName('ID').AsInteger        := IDRecord;
     spDelRecordSetMarkDel.Params.ParamByName('DEL').AsBoolean       := MarkDel;
     spDelRecordSetMarkDel.Params.ParamByName('NAMETAB').AsString    := TableName;
     spDelRecordSetMarkDel.Params.ParamByName('DELRECORD').AsBoolean := DelRecord;

     try
       spDelRecordSetMarkDel.ExecProc;
       FBTransaction.Commit;
       Result := True;
     except
        on E: Exception do
           begin
             FBTransaction.Rollback;
             ShowMessage(Application, 'Неможливо виконати запис. ' + #13 + E.Message, '', TTypeMessage.Error);
             Result := false;
           end;
     end;
  finally
    spDelRecordSetMarkDel.Free;
    FBTransaction.Free;
  end;
end;

function TmainModule.IFNull(Val, ValIfNull: Variant): Variant;
begin
  if (Val = Null) then
    Result := ValIfNull
  else
    Result := Val;
end;

Function TmainModule.GetForm(TypeForm :TTypeForm; const DBTable: string;
                        Param: TStructure = nil; AOwner: TComponent = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild): TForm;
var
  vDBTable :DBTableName;
begin
   var IDObj := GetEnumValue(TypeInfo(DBTableName), DBTable);
   vDBTable := DBTableName(IDObj);
   Result := GetForm(TypeForm, vDBTable, Param, AOwner, Sender, AFormStyle);
end;

Function TmainModule.GetForm(TypeForm :TTypeForm; DBTable: DBTableName;
                        Param: TStructure = nil; AOwner: TComponent = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild): TForm;
begin
  case DBTable of
    DBTableName.REF_TOOLS:
      begin
        if (TypeForm = TTypeForm.FormList) then
          Result := TfmTools.Create(AOwner, Param, Sender, AFormStyle)
        else
          Result := TfmTools_Ch.Create(AOwner, Param, Sender, AFormStyle);
      end;

    DBTableName.REF_PARTS:
      begin
        if (TypeForm = TTypeForm.FormList) then
          Result := TfmParts.Create(AOwner, Param, Sender, AFormStyle)
        else
          Result := TfmParts_Ch.Create(AOwner, Param, Sender, AFormStyle);
      end;

    DBTableName.REF_MATERIALS:
      begin
        if (TypeForm = TTypeForm.FormList) then
          Result := TfmListMaterial.Create(AOwner, Param, Sender, AFormStyle)
        else
          Result := TfmListMaterial_Ch.Create(AOwner, Param, Sender, AFormStyle);
      end;

    DBTableName.REF_MACHINE:
      begin
        if (TypeForm = TTypeForm.FormList) then
          Result := TfmListMachine.Create(AOwner, Param, Sender, AFormStyle)
        else
          Result := TfmListMachine_Ch.Create(AOwner, Param, Sender, AFormStyle);
      end;
    DBTableName.JRN_OUTAGES:
      begin
        if (TypeForm = TTypeForm.FormList) then
          Result := TfmJRN_Outage.Create(AOwner, Param, Sender, AFormStyle)
        else
          Result := TfmJRN_Outage_Ch.Create(AOwner, Param, Sender, AFormStyle);
      end;

    DBTableName.REF_BATTERY:
      begin
        if (TypeForm = TTypeForm.FormList) then
          Result := TfmListBatery.Create(AOwner, Param, Sender, AFormStyle)
        else
          Result := TfmListBatery_Ch.Create(AOwner, Param, Sender, AFormStyle);
      end;

    DBTableName.REF_UNITS:
      begin
        if (TypeForm = TTypeForm.FormList) then
          Result := TfmUnits.Create(AOwner, Param, Sender, AFormStyle)
        else
          Result := TfmUnits_Ch.Create(AOwner, Param, Sender, AFormStyle);
      end;

    DBTableName.REF_CATEGORIES:
      begin
        if (TypeForm = TTypeForm.FormList) then
          Result := TfmCategories.Create(AOwner, Param, Sender, AFormStyle)
        else
          Result := TfmCategories_Ch.Create(AOwner, Param, Sender, AFormStyle);
      end;

    DBTableName.REF_ENERGY_TARIFFS:
      begin
        if (TypeForm = TTypeForm.FormList) then
          Result := TfmPriceElectricity.Create(AOwner, Param, Sender, AFormStyle)
        else
          Result := TfmPriceElectricity_Ch.Create(AOwner, Param, Sender, AFormStyle);
      end;

     DBTableName.SYS_USERS:
      begin
        if (TypeForm = TTypeForm.FormList) then
          Result := TfmListUsers.Create(AOwner, Param, Sender, AFormStyle)
        else
          Result := TfmListUsers_Ch.Create(AOwner, Param, Sender, AFormStyle);
      end;
  else
    Result := nil;
  end;
end;

function TmainModule.BeginTransaction_():TFDTransaction;
begin
  var FBTransaction                      := TFDTransaction.Create(nil);
  FBTransaction.Connection               := mainModule.cnFBConnect;
  FBTransaction.Options.Isolation        := xiReadCommitted;
  FBTransaction.Options.AutoStart        := false;
  FBTransaction.Options.AutoStop         := false;
  FBTransaction.Options.DisconnectAction := xdRollback;
  FBTransaction.StartTransaction;
  Result := FBTransaction;
end;


function TmainModule.BeginTransactionWrite():TFDTransaction;
begin
  var FBTransaction                      := TFDTransaction.Create(nil);
  FBTransaction.Connection               := mainModule.cnFBConnectWrite;
  FBTransaction.Options.Isolation        := xiReadCommitted;
  FBTransaction.Options.AutoStart        := false;
  FBTransaction.Options.AutoStop         := false;
  FBTransaction.Options.DisconnectAction := xdRollback;
  FBTransaction.StartTransaction;
  Result := FBTransaction;
end;

end.
