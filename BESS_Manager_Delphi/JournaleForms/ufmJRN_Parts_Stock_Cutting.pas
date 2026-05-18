unit ufmJRN_Parts_Stock_Cutting;

interface

uses
  ufmBaseObjectForm,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, umainModule, dxSkinsCore,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, cxControls, cxContainer, cxEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, cxTextEdit, cxDBEdit, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, MySkinWhite, cxCurrencyEdit, cxCheckBox, dxSkinOffice2013White, cxDropDownEdit, cxCalendar, cxMaskEdit, cxSpinEdit, cxTimeEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridLevel, dxLayoutContainer, cxGridTableView, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxBarBuiltInMenu, cxPC, System.Generics.Collections,
  System.Hash,
  System.Diagnostics;

const
  mCaption = 'Різка готової деталі: ';

type
  TfmJRN_Parts_Stock_Cutting = class(TfmBaseObjectForm)
    spDataField: TFDQuery;
    dsDataField: TDataSource;
    spSaveForm: TFDStoredProc;
    Splitter1: TSplitter;
    Panel1: TPanel;
    bbSave: TcxButton;
    bbConfirm: TcxButton;
    Panel2: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblNetworkStatus: TcxLabel;
    lblCostNow: TcxLabel;
    lblCostOptimal: TcxLabel;
    edOP_DATE: TcxDBDateEdit;
    edID_REF_MACHINE: TcxDBLookupComboBox;
    edKod: TcxDBTextEdit;
    alListActions: TActionList;
    aCutNow: TAction;
    aCutLater: TAction;
    aAddPart: TAction;
    aDelPart: TAction;
    spCurrentTariff: TFDQuery;
    dsCurrentTariff: TDataSource;
    spOptimalTariff: TFDQuery;
    dsOptimalTariff: TDataSource;
    mtNestingQueue: TFDMemTable;
    dsNestingQueue: TDataSource;
    mtNestingQueueID_PART: TIntegerField;
    mtNestingQueueQUANTITY: TIntegerField;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Panel3: TPanel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    mtSheetsQueue: TFDMemTable;
    IntegerField1: TIntegerField;
    dsSheetsQueue: TDataSource;
    grParts: TcxGrid;
    tvParts: TcxGridDBTableView;
    colPart: TcxGridDBColumn;
    colQuantity: TcxGridDBColumn;
    tvPartsRootGroup: TcxGridTableRowLayoutGroup;
    grPartsLevel1: TcxGridLevel;
    grSheets: TcxGrid;
    tvSheets: TcxGridDBTableView;
    colSheetName: TcxGridDBColumn;
    tvSheetsRootGroup: TcxGridTableRowLayoutGroup;
    cxGridLevel1: TcxGridLevel;
    Panel4: TPanel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    aAddPaper: TAction;
    aDelPaper: TAction;
    spSheetsStock: TFDQuery;
    dsSheetsStock: TDataSource;
    mtSheetsQueueNAME: TStringField;
    mtSheetsQueueWIDTH: TFloatField;
    mtSheetsQueueLENGTH: TFloatField;
    mtSheetsQueueIS_ROLL: TBooleanField;
    mtSheetsQueueCOST_PER_M2: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCutLaterExecute(Sender: TObject);
    procedure aCutNowExecute(Sender: TObject);
    procedure edKodPropertiesChange(Sender: TObject);
    procedure aAddPartExecute(Sender: TObject);
    procedure aDelPartExecute(Sender: TObject);
    procedure aAddPaperExecute(Sender: TObject);
    procedure aDelPaperExecute(Sender: TObject);
    procedure colSheetNamePropertiesEditValueChanged(Sender: TObject);
    procedure colPartPropertiesEditValueChanged(Sender: TObject);
  private
    FMachineTime: Double; // Зберігає час роботи верстата з C++ консолі
    FPartTimes: TDictionary<Integer, Double>;
    function CheckDataForErrors(): Boolean;
    procedure CalculateCosts;
    procedure RunNestingConsole;
  public
    constructor Create(AOwner: TComponent; Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild); reintroduce;
  end;

var
  fmJRN_Parts_Stock_Cutting: TfmJRN_Parts_Stock_Cutting;
  OwnSender: TObject;

implementation

uses ufmJRN_Parts_Stock, System.JSON, System.IOUtils;

{$R *.dfm}

constructor TfmJRN_Parts_Stock_Cutting.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;
  Tag := mainModule.GetIDForm;

  if Operation = FormOperation.None then exit;

  mainModule.spREF_PARTS.Open;
  mainModule.spREF_MACHINE.Open;

  // Ініціалізація віртуальної черги розкрою
  mtNestingQueue.Active := False;
  mtNestingQueue.Active := True;

  mtSheetsQueue.Active := false;
  mtSheetsQueue.Active := true;

  spSheetsStock.Active := false;
  spSheetsStock.Active := true;

  spDataField.Active := false;
  spDataField.Params.ParamByName('ID').AsInteger := ID;
  try
    spDataField.Active := true;
    if spDataField.RecordCount = 0 then
    begin
      spDataField.Append;
      spDataField.FieldValues['ID'] := -1;
      spDataField.FieldValues['OP_TYPE'] := 1;
      spDataField.FieldValues['OP_DATE'] := Now;
    end;
  except
    on E: Exception do
      mainModule.ShowMessage(Self, 'Помилка: ' + E.Message, '', TTypeMessage.Error);
  end;

  FMachineTime := 0.0;
  FPartTimes := TDictionary<Integer, Double>.Create;
  ShowThisForm();
end;

procedure TfmJRN_Parts_Stock_Cutting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mainModule.spREF_PARTS.Close;
  mainModule.spREF_MACHINE.Close;
  Action := TCloseAction.caFree;
  if Assigned(FPartTimes) then FPartTimes.Free;
end;

procedure TfmJRN_Parts_Stock_Cutting.edKodPropertiesChange(Sender: TObject);
begin
  inherited;
end;

// =========================================================================
// ПЕРЕВІРКА ПОМИЛОК
// =========================================================================
function TfmJRN_Parts_Stock_Cutting.CheckDataForErrors(): Boolean;
var
  CloneTable: TFDMemTable;
  SheetW, SheetH: Double;
  GeomStr: string;
  JArr: TJSONArray;
  I: Integer;
  X, Y, MinX, MaxX, MinY, MaxY, PartW, PartH: Double;
  jX, jY: TJSONValue;
begin
  Result := False;

  if mainModule.IFNull(edID_REF_MACHINE.EditValue, 0) = 0 then
  begin
    mainModule.ShowMessage(Self, 'Оберіть верстат для розкрою', '');
    edID_REF_MACHINE.SetFocus;
    Exit(True);
  end;

  if mtNestingQueue.IsEmpty then
  begin
    mainModule.ShowMessage(Self, 'Додайте хоча б одну деталь для розкрою!', '');
    Exit(True);
  end;

  if mtSheetsQueue.IsEmpty then
  begin
    mainModule.ShowMessage(Self, 'Додайте матеріал (аркуш або рулон) для розкрою!', '');
    Exit(True);
  end;

  if mtNestingQueue.State in dsEditModes then mtNestingQueue.Post;
  if mtSheetsQueue.State in dsEditModes then mtSheetsQueue.Post;

  CloneTable := TFDMemTable.Create(nil);
  try
    CloneTable.CloneCursor(mtNestingQueue);
    CloneTable.First;
    while not CloneTable.Eof do
    begin
      if CloneTable.FieldByName('ID_PART').IsNull or (CloneTable.FieldByName('ID_PART').AsInteger <= 0) then
      begin
        mainModule.ShowMessage(Self, 'В одному з рядків не обрано деталь!', '');
        Exit(True);
      end;
      if CloneTable.FieldByName('QUANTITY').AsInteger <= 0 then
      begin
        mainModule.ShowMessage(Self, 'Кількість деталей має бути більшою за нуль!', '');
        Exit(True);
      end;
      CloneTable.Next;
    end;

    CloneTable.CloneCursor(mtSheetsQueue);
    CloneTable.First;
    while not CloneTable.Eof do
    begin
      if CloneTable.FieldByName('ID_MATERIAL').IsNull or (CloneTable.FieldByName('ID_MATERIAL').AsInteger <= 0) then
      begin
        mainModule.ShowMessage(Self, 'В одному з рядків матеріалів не зроблено вибір!', '');
        Exit(True);
      end;
      CloneTable.Next;
    end;

    // ==== НОВА ПЕРЕВІРКА ГАБАРИТІВ (ЩОБ НЕ ДОПУСТИТИ ЗАПУСКУ С++) ====
    if mtSheetsQueue.RecordCount > 0 then
    begin
      mtSheetsQueue.First;
      SheetW := mtSheetsQueue.FieldByName('WIDTH').AsFloat;
      if mtSheetsQueue.FieldByName('IS_ROLL').AsBoolean then
        SheetH := 999999.0 // Для рулону довжина не обмежена
      else
        SheetH := mtSheetsQueue.FieldByName('LENGTH').AsFloat;

      CloneTable.CloneCursor(mtNestingQueue);
      CloneTable.First;
      while not CloneTable.Eof do
      begin
        if not CloneTable.FieldByName('ID_PART').IsNull then
        begin
          // Беремо JSON геометрії з довідника
          GeomStr := mainModule.spREF_PARTS.Lookup('ID', CloneTable.FieldByName('ID_PART').Value, 'GEOMETRY_JSON');
          if GeomStr <> '' then
          begin
            JArr := TJSONObject.ParseJSONValue(GeomStr) as TJSONArray;
            if Assigned(JArr) then
            try
              if JArr.Count > 0 then
              begin
                MinX := 999999; MaxX := -999999;
                MinY := 999999; MaxY := -999999;

                // Шукаємо крайні точки полігону
                for I := 0 to JArr.Count - 1 do
                begin
                  jX := (JArr.Items[I] as TJSONObject).GetValue('x');
                  jY := (JArr.Items[I] as TJSONObject).GetValue('y');
                  if Assigned(jX) and Assigned(jY) then
                  begin
                    X := TJSONNumber(jX).AsDouble;
                    Y := TJSONNumber(jY).AsDouble;
                    if X < MinX then MinX := X;
                    if X > MaxX then MaxX := X;
                    if Y < MinY then MinY := Y;
                    if Y > MaxY then MaxY := Y;
                  end;
                end;

                PartW := MaxX - MinX;
                PartH := MaxY - MinY;

                // Додаємо відступи (margin + spacing), які ти відправляєш в С++
                PartW := PartW + 20;
                PartH := PartH + 20;

                // Перевіряємо, чи влізе деталь (з урахуванням можливого повороту)
                if not (((PartW <= SheetW) and (PartH <= SheetH)) or
                        ((PartW <= SheetH) and (PartH <= SheetW))) then
                begin
                  mainModule.ShowMessage(Self, Format('Увага! Габарити деталі (%.0f x %.0f мм) ' +
                    'перевищують розмір обраного матеріалу (%.0f x %.0f мм)! Розкрій неможливий.',
                    [PartW - 20, PartH - 20, SheetW, SheetH]), '', TTypeMessage.Error);
                  Exit(True);
                end;
              end;
            finally
              JArr.Free;
            end;
          end;
        end;
        CloneTable.Next;
      end;
    end;
    // ==== КІНЕЦЬ ПЕРЕВІРКИ ГАБАРИТІВ ====

  finally
    CloneTable.Free;
  end;
end;

procedure TfmJRN_Parts_Stock_Cutting.colPartPropertiesEditValueChanged(Sender: TObject);
var
  Edit: TcxLookupComboBox;
  PartID: Variant;
  CloneTable: TFDMemTable;
begin
  Edit := Sender as TcxLookupComboBox;
  PartID := Edit.EditValue;

  if not VarIsNull(PartID) then
  begin
    CloneTable := TFDMemTable.Create(nil);
    try
      CloneTable.CloneCursor(mtNestingQueue);
      CloneTable.First;
      while not CloneTable.Eof do
      begin
        if (CloneTable.RecNo <> mtNestingQueue.RecNo) and (CloneTable.FieldByName('ID_PART').Value = PartID) then
        begin
          mainModule.ShowMessage(Self, 'Ця деталь вже додана до списку! Просто збільшіть її кількість.', '');
          Edit.EditValue := Null;
          Exit;
        end;
        CloneTable.Next;
      end;
    finally
      CloneTable.Free;
    end;
  end;
end;

procedure TfmJRN_Parts_Stock_Cutting.colSheetNamePropertiesEditValueChanged(Sender: TObject);
var
  Edit: TcxLookupComboBox;
  MaterialID: Variant;
  CloneTable: TFDMemTable;
  IsRollNew, IsRollExisting: Boolean;
begin
  Edit := Sender as TcxLookupComboBox;
  MaterialID := Edit.EditValue;

  if not VarIsNull(MaterialID) then
  begin
    IsRollNew := spSheetsStock.Lookup('ID', MaterialID, 'IS_ROLL');

    // Перевірка на дублікати та змішування типів
    CloneTable := TFDMemTable.Create(nil);
    try
      CloneTable.CloneCursor(mtSheetsQueue);
      CloneTable.First;
      while not CloneTable.Eof do
      begin
        if CloneTable.RecNo <> mtSheetsQueue.RecNo then
        begin
          // 1. Заборона дублікатів
          if CloneTable.FieldByName('ID_MATERIAL').Value = MaterialID then
          begin
            mainModule.ShowMessage(Self, 'Цей матеріал вже додано до списку!', '');
            Edit.EditValue := Null;
            Exit;
          end;
          // 2. Заборона змішування рулонів і аркушів
          if not CloneTable.FieldByName('IS_ROLL').IsNull then
          begin
            IsRollExisting := CloneTable.FieldByName('IS_ROLL').AsBoolean;
            if IsRollExisting <> IsRollNew then
            begin
              mainModule.ShowMessage(Self, 'Не можна змішувати рулони та фіксовані аркуші в одному розкрої!', '');
              Edit.EditValue := Null;
              Exit;
            end;
          end;
        end;
        CloneTable.Next;
      end;
    finally
      CloneTable.Free;
    end;

    mtSheetsQueue.Edit;
    mtSheetsQueue.FieldByName('ID_MATERIAL').Value := MaterialID;
    mtSheetsQueue.FieldByName('NAME').Value         := spSheetsStock.Lookup('ID', MaterialID, 'NAME');
    mtSheetsQueue.FieldByName('WIDTH').Value        := spSheetsStock.Lookup('ID', MaterialID, 'WIDTH');
    mtSheetsQueue.FieldByName('LENGTH').Value       := spSheetsStock.Lookup('ID', MaterialID, 'LENGTH');
    mtSheetsQueue.FieldByName('IS_ROLL').Value      := IsRollNew;
    mtSheetsQueue.FieldByName('COST_PER_M2').Value  := spSheetsStock.Lookup('ID', MaterialID, 'COST_PER_M2');
    mtSheetsQueue.Post;
  end;
end;

// =========================================================================
// КЕРУВАННЯ ГРІДОМ
// =========================================================================
procedure TfmJRN_Parts_Stock_Cutting.aAddPaperExecute(Sender: TObject);
begin
  if not mtSheetsQueue.Active then Exit;

  mtSheetsQueue.Append;

  try
    mtSheetsQueue.Post;
    mtSheetsQueue.Edit;
  except
    on E: Exception do
      mainModule.ShowMessage(Self, 'Помилка ініціалізації рядка аркуша: ' + E.Message, '', TTypeMessage.Error);
  end;
end;

procedure TfmJRN_Parts_Stock_Cutting.aDelPaperExecute(Sender: TObject);
begin
  if mtSheetsQueue.IsEmpty then Exit;

  mtSheetsQueue.Delete;
end;

procedure TfmJRN_Parts_Stock_Cutting.aAddPartExecute(Sender: TObject);
begin
  // Перевірка, чи не закрита основна таблиця (профілактика Access Violation)
  if not mtNestingQueue.Active then Exit;

  mtNestingQueue.Append;
  mtNestingQueue.FieldByName('QUANTITY').AsInteger := 1;

  try
    mtNestingQueue.Post;
    mtNestingQueue.Edit;

    if Assigned(grParts) and grParts.CanFocus then
      grParts.SetFocus;
  except
    on E: Exception do
      mainModule.ShowMessage(Self, 'Помилка при додаванні деталі: ' + E.Message, '', TTypeMessage.Error);
  end;
end;

procedure TfmJRN_Parts_Stock_Cutting.aDelPartExecute(Sender: TObject);
begin
  if mtNestingQueue.IsEmpty then Exit;
  mtNestingQueue.Delete;
end;

// =========================================================================
// РОЗРАХУНОК ВАРТОСТІ ЕНЕРГІЇ
// =========================================================================
procedure TfmJRN_Parts_Stock_Cutting.CalculateCosts;
var
  PowerKWVar: Variant;
  PowerKW, Hours, CostNow, CostOpt: Double;
  IsOutageNow: Boolean;
  MachineIDVar: Variant;
begin
  spCurrentTariff.Close; spCurrentTariff.Open;
  spOptimalTariff.Close; spOptimalTariff.Open;

  MachineIDVar := edID_REF_MACHINE.EditValue;
  if VarIsNull(MachineIDVar) or (FMachineTime <= 0) then exit;

  // Перевіряємо чи відкритий довідник
  if not mainModule.spREF_MACHINE.Active then mainModule.spREF_MACHINE.Open;

  PowerKWVar := mainModule.spREF_MACHINE.Lookup('ID', MachineIDVar, 'POWER_NOMINAL');
  if VarIsNull(PowerKWVar) then PowerKW := 0 else PowerKW := PowerKWVar;

  Hours := FMachineTime / 60.0;
  IsOutageNow := spCurrentTariff.FieldByName('IS_OUTAGE_NOW').AsInteger > 0;

  if IsOutageNow then
  begin
    lblNetworkStatus.Caption := 'МЕРЕЖА ВІДСУТНЯ (BESS)';
    lblCostNow.Caption := 'Зараз: Робота від АКБ';
  end
  else
  begin
    lblNetworkStatus.Caption := 'Мережа доступна';
    CostNow := PowerKW * Hours * spCurrentTariff.FieldByName('PRICE_PER_KWH').AsFloat;
    lblCostNow.Caption := Format('Вартість зараз: %.2f грн', [CostNow]);
  end;

  CostOpt := PowerKW * Hours * spOptimalTariff.FieldByName('MIN_PRICE').AsFloat;
  lblCostOptimal.Caption := Format('Оптимально (о %s): %.2f грн',
    [FormatDateTime('hh:nn', spOptimalTariff.FieldByName('OPT_TIME_START').AsDateTime), CostOpt]);
end;

// =========================================================================
// КОНСОЛЬ РОЗКРОЮ (C++)
// =========================================================================
procedure TfmJRN_Parts_Stock_Cutting.RunNestingConsole;
var
  InputJsonPath, OutputJsonPath, OutputSvgPath: string;
  JsonObj, ItemObj, SheetObj, CostObj, ResultObj: TJSONObject;
  ItemsArray, SheetsArray: TJSONArray;
  PointsData: TJSONValue;
  InputJsonStr, ResultJsonStr, ResultSvgStr, vCmdLine, GeomStr, InputHash: string;
  MachineSpeed, W, H, M2Cost, FullSheetCost: Double;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  Stopwatch: TStopwatch;
  qryCache: TFDQuery;
  MachineID, PartID: Variant;
  IsRollMode: Boolean;

  // ЛОКАЛЬНА ПРОЦЕДУРА ОБРОБКИ (Захищена)
  procedure ProcessNestingResult(const AJsonStr, ASvgStr: string);
  var
    LResultObj: TJSONObject;
    LPartsArr: TJSONArray;
    i: Integer;
    pID: Integer;
    pTime: Double;
    vMachineTime, vPartTime: TJSONValue;
  begin
    if not Assigned(FPartTimes) then Exit; // Захист від nil

    LResultObj := TJSONObject.ParseJSONValue(AJsonStr) as TJSONObject;
    if Assigned(LResultObj) then
    try
      // Шукаємо час роботи верстата
      vMachineTime := LResultObj.GetValue('machine_time_mins');

      // Перевіряємо, чи є значення і чи це правильне JSON число
      if Assigned(vMachineTime) and (vMachineTime is TJSONNumber) then
      begin
        // TJSONNumber.AsDouble ігнорує кому в Windows і читає крапку ідеально!
        FMachineTime := TJSONNumber(vMachineTime).AsDouble;
        FPartTimes.Clear;

        if LResultObj.TryGetValue<TJSONArray>('parts', LPartsArr) then
        begin
          for i := 0 to LPartsArr.Count - 1 do
          begin
            var PartItem := LPartsArr.Items[i] as TJSONObject;
            if Assigned(PartItem) then
            begin
              // Читаємо ID деталі
              pID := (PartItem.GetValue('id') as TJSONNumber).AsInt;

              // Безпечно читаємо індивідуальний час (0.6118 не перетвориться на 0)
              vPartTime := PartItem.GetValue('time_mins');
              if Assigned(vPartTime) and (vPartTime is TJSONNumber) then
                pTime := TJSONNumber(vPartTime).AsDouble
              else
                pTime := 0.0;

              // Додаємо або оновлюємо час деталі у словнику
              if FPartTimes.ContainsKey(pID) then
                FPartTimes[pID] := FPartTimes[pID] + pTime
              else
                FPartTimes.Add(pID, pTime);
            end;
          end;
        end;
        CalculateCosts;
      end;
    finally
      LResultObj.Free;
    end;
  end;

begin
  // 1. ПІДГОТОВКА СТРУКТУР (Критично важливо!)
  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  FillChar(ProcessInfo, SizeOf(ProcessInfo), 0);

  if mtNestingQueue.State in dsEditModes then mtNestingQueue.Post;
  if mtSheetsQueue.State in dsEditModes then mtSheetsQueue.Post;

  if VarIsNull(edID_REF_MACHINE.EditValue) or (mtNestingQueue.RecordCount = 0) then Exit;

  InputJsonPath  := TPath.Combine(ExtractFilePath(ParamStr(0)), 'input.json');
  OutputJsonPath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'output.json');
  OutputSvgPath  := TPath.Combine(ExtractFilePath(ParamStr(0)), 'output.svg');

  // 2. ФОРМУВАННЯ JSON ТА ХЕШУ
  JsonObj := TJSONObject.Create;
  try
    // === ВИЗНАЧАЄМО, ЧИ Є В СПИСКУ РУЛОН ===
    IsRollMode := False;
    mtSheetsQueue.First;
    while not mtSheetsQueue.Eof do
    begin
      if mtSheetsQueue.FieldByName('IS_ROLL').AsBoolean then
      begin
        IsRollMode := True;
        Break;
      end;
      mtSheetsQueue.Next;
    end;

    // ПИШЕМО IS_ROLL У КОРІНЬ
    if IsRollMode then
      JsonObj.AddPair('is_roll', TJSONBool.Create(True))
    else
      JsonObj.AddPair('is_roll', TJSONBool.Create(False));

    JsonObj.AddPair('margin', TJSONNumber.Create(10.0));
    JsonObj.AddPair('spacing', TJSONNumber.Create(5.0));
    JsonObj.AddPair('kerf', TJSONNumber.Create(4.0));

    MachineSpeed := mainModule.spREF_MACHINE.Lookup('ID', edID_REF_MACHINE.EditValue, 'MAX_SPEED');
    if VarIsNull(MachineSpeed) or (MachineSpeed <= 0) then MachineSpeed := 2500.0;
    JsonObj.AddPair('machine_speed', TJSONNumber.Create(MachineSpeed));
    JsonObj.AddPair('calc_step', TJSONNumber.Create(2.0));

    CostObj := TJSONObject.Create;
    CostObj.AddPair('per_pierce', TJSONNumber.Create(0.5));
    CostObj.AddPair('per_meter_cut', TJSONNumber.Create(1.2));
    CostObj.AddPair('labor_cost', TJSONNumber.Create(25.0));
    JsonObj.AddPair('costs', CostObj);

    SheetsArray := TJSONArray.Create;
    mtSheetsQueue.First;
    while not mtSheetsQueue.Eof do
    begin
      SheetObj := TJSONObject.Create;
      W := mtSheetsQueue.FieldByName('WIDTH').AsFloat;
      H := mtSheetsQueue.FieldByName('LENGTH').AsFloat;
      M2Cost := mtSheetsQueue.FieldByName('COST_PER_M2').AsFloat;

      SheetObj.AddPair('w', TJSONNumber.Create(W));

      if mtSheetsQueue.FieldByName('IS_ROLL').AsBoolean then
        SheetObj.AddPair('h', TJSONNumber.Create(1000000.0))
      else
        SheetObj.AddPair('h', TJSONNumber.Create(H));

      FullSheetCost := (W * H / 1000000.0) * M2Cost;
      SheetObj.AddPair('cost', TJSONNumber.Create(FullSheetCost));
      SheetObj.AddPair('name', mtSheetsQueue.FieldByName('NAME').AsString);
      SheetsArray.Add(SheetObj);
      mtSheetsQueue.Next;
    end;
    JsonObj.AddPair('sheets', SheetsArray);

    ItemsArray := TJSONArray.Create;
    mtNestingQueue.First;
    while not mtNestingQueue.Eof do
    begin
      PartID := mtNestingQueue.FieldByName('ID_PART').Value;
      ItemObj := TJSONObject.Create;
      ItemObj.AddPair('id', TJSONNumber.Create(mtNestingQueue.FieldByName('ID_PART').AsInteger));
      ItemObj.AddPair('type', 'polygon');
      GeomStr := mainModule.spREF_PARTS.Lookup('ID', PartID, 'GEOMETRY_JSON');
      if GeomStr <> '' then
      begin
        PointsData := TJSONObject.ParseJSONValue(GeomStr);
        if Assigned(PointsData) then ItemObj.AddPair('points', PointsData);
      end;
      ItemObj.AddPair('q', TJSONNumber.Create(mtNestingQueue.FieldByName('QUANTITY').AsInteger));
      ItemsArray.Add(ItemObj);
      mtNestingQueue.Next;
    end;
    JsonObj.AddPair('items', ItemsArray);

    // === МАГІЯ ФОРМАТУВАННЯ ТУТ ===
    // Замість InputJsonStr := JsonObj.ToString; використовуємо Format() з відступом 2 пробіли
    InputJsonStr := JsonObj.Format(2);

    TFile.WriteAllText(InputJsonPath, InputJsonStr, TEncoding.UTF8);
  finally
    JsonObj.Free;
  end;

  // 3. ПЕРЕВІРКА КЕШУ
  InputHash := THashSHA2.GetHashString(InputJsonStr);
  qryCache := TFDQuery.Create(nil);
  try
    qryCache.Connection := mainModule.cnFBConnect;
    qryCache.SQL.Text := 'SELECT RESULT_JSON, RESULT_SVG FROM JRN_NESTING_CACHE WHERE INPUT_HASH = :H AND DEL = FALSE';
    qryCache.ParamByName('H').AsString := InputHash;
    qryCache.Open;

    if not qryCache.IsEmpty then
    begin
      ProcessNestingResult(qryCache.FieldByName('RESULT_JSON').AsString,
                           qryCache.FieldByName('RESULT_SVG').AsString);
      Exit;
    end;
  finally
    qryCache.Free;
  end;

  // 4. ЗАПУСК КОНСОЛІ
  Stopwatch := TStopwatch.StartNew;
  vCmdLine := 'ConsoleCutting_4.exe input.json output.json';
  UniqueString(vCmdLine);

  if CreateProcess(nil, PChar(vCmdLine), nil, nil, False, CREATE_NO_WINDOW, nil, nil, StartupInfo, ProcessInfo) then
  begin
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end;
  Stopwatch.Stop;

  // 5. ЗБЕРЕЖЕННЯ В КЕШ
  if TFile.Exists(OutputJsonPath) then
  begin
    ResultJsonStr := TFile.ReadAllText(OutputJsonPath, TEncoding.UTF8);
    ResultSvgStr := '';
    if TFile.Exists(OutputSvgPath) then
      ResultSvgStr := TFile.ReadAllText(OutputSvgPath, TEncoding.UTF8);

    ResultObj := TJSONObject.ParseJSONValue(ResultJsonStr) as TJSONObject;
    if Assigned(ResultObj) then
    try
      mainModule.cnFBConnectWrite.ExecSQL(
        'INSERT INTO JRN_NESTING_CACHE (INPUT_HASH, RESULT_JSON, RESULT_SVG, UTILIZATION_RATE, COMPUTATION_TIME_MS, ADD_ID_SYS_USERS) ' +
        'VALUES (:H, :RJ, :RSVG, :UR, :CT, :UID)',
        [InputHash, ResultJsonStr, ResultSvgStr,
         ResultObj.GetValue<Double>('sheet_leftover_percent', 0),
         Stopwatch.ElapsedMilliseconds, gbSysIDUserName]
      );
      ProcessNestingResult(ResultJsonStr, ResultSvgStr);
    finally
      ResultObj.Free;
    end;
  end;
end;

// =========================================================================
// ЗБЕРЕЖЕННЯ В БАЗУ (ЗАРАЗ / ПІЗНІШЕ)
// =========================================================================
procedure TfmJRN_Parts_Stock_Cutting.aCutNowExecute(Sender: TObject);
var
  PowerKWVar: Variant;
  PowerKW: Double;
  TariffID: Integer;
  TariffPrice: Double;
  vBatchID: Integer;
  PartID, CurrentQty: Integer;
  ExactPartTime, ExactEnergyCost: Double;
  MainMaterialID: Integer;
begin
  // 1. Попередні перевірки
  if spDataField.State in dsEditModes then spDataField.Post;

  // Викликаємо оновлену CheckDataForErrors (має перевіряти наявність аркушів)
  if CheckDataForErrors() then Exit;

  // 2. Блокування інтерфейсу для запобігання дублюванню запитів
  aCutNow.Enabled := False;
  aCutLater.Enabled := False;

  try
    // 3. Перевірка розрахунків геометричного ядра
    // Якщо час ще не розрахований (перший запуск), запускаємо консоль C++
    if FMachineTime <= 0 then
    begin
      RunNestingConsole;
      if (FMachineTime <= 0) or (FPartTimes.Count = 0) then
      begin
        mainModule.ShowMessage(Self, 'Помилка: Алгоритм розкрою не зміг розрахувати час!', '', TTypeMessage.Error);
        aCutNow.Enabled := True;
        aCutLater.Enabled := True;
        Exit;
      end;
    end;

    // 4. Отримання енергетичних та тарифних параметрів
    // Потужність верстата з довідника
    PowerKWVar := mainModule.spREF_MACHINE.Lookup('ID', edID_REF_MACHINE.EditValue, 'POWER_NOMINAL');
    if VarIsNull(PowerKWVar) then PowerKW := 0 else PowerKW := PowerKWVar;

    // Поточний тариф із бази[cite: 12]
    spCurrentTariff.Close;
    spCurrentTariff.Open;
    if spCurrentTariff.IsEmpty then
    begin
      mainModule.ShowMessage(Self, 'Не знайдено діючого тарифу на поточний час!', '');
      aCutNow.Enabled := True;
      aCutLater.Enabled := True;
      Exit;
    end;

    TariffID := spCurrentTariff.FieldByName('TARIFF_ID').AsInteger;
    TariffPrice := spCurrentTariff.FieldByName('PRICE_PER_KWH').AsFloat;

    // 5. Отримання ID матеріалу (беремо перший із черги, оскільки змішування заборонено)[cite: 11, 12]
    mtSheetsQueue.First;
    MainMaterialID := mtSheetsQueue.FieldByName('ID_MATERIAL').AsInteger;

    // 6. ЗАПИС У БАЗУ ДАНИХ (Транзакційно)
    mainModule.cnFBConnectWrite.StartTransaction;
    try
      // Генеруємо Batch_ID для групування деталей одного розкрою
      vBatchID := mainModule.cnFBConnectWrite.ExecSQLScalar('SELECT GEN_ID(GEN_NESTING_BATCH_ID, 1) FROM RDB$DATABASE');

      spSaveForm.StoredProcName := 'JRN_NESTING_TASKS_IU';
      spSaveForm.Prepare;

      mtNestingQueue.First;
      while not mtNestingQueue.Eof do
      begin
        PartID := mtNestingQueue.FieldByName('ID_PART').AsInteger;
        CurrentQty := mtNestingQueue.FieldByName('QUANTITY').AsInteger;

        // Отримуємо точний час для цієї деталі зі словника, куди його записало ядро
        if not FPartTimes.TryGetValue(PartID, ExactPartTime) then
          ExactPartTime := 0;

        // Формула: Потужність (кВт) * Час (год) * Ціна (грн/кВт*год)
        ExactEnergyCost := PowerKW * (ExactPartTime / 60.0) * TariffPrice;

        // Передача параметрів у збережену процедуру Firebird[cite: 11]
        spSaveForm.ParamByName('I_ID').AsInteger             := -1;
        spSaveForm.ParamByName('I_ID_PART').AsInteger        := PartID;
        spSaveForm.ParamByName('I_QUANTITY').AsInteger       := CurrentQty;
        spSaveForm.ParamByName('I_ID_REF_MACHINE').AsInteger := edID_REF_MACHINE.EditValue;
        spSaveForm.ParamByName('I_ID_REF_MATERIAL').AsInteger := MainMaterialID; // НОВЕ ПОЛЕ
        spSaveForm.ParamByName('I_PLANNED_DATE').AsDateTime  := Now;
        spSaveForm.ParamByName('I_ESTIMATED_COST').AsFloat   := ExactEnergyCost;
        spSaveForm.ParamByName('I_ID_TARIFF').AsInteger      := TariffID;
        spSaveForm.ParamByName('I_STATUS').AsInteger         := 2; // Статус "В роботі"
        spSaveForm.ParamByName('I_ESTIMATED_TIME_MINS').AsFloat := ExactPartTime;
        spSaveForm.ParamByName('I_BATCH_ID').AsInteger       := vBatchID;

        spSaveForm.ExecProc;
        mtNestingQueue.Next;
      end;

      mainModule.cnFBConnectWrite.Commit;
      mainModule.ShowMessage(Self, 'Завдання успішно додано до черги та відправлено на верстат!', '');
      Self.Close; // Закриваємо форму після успішного запуску

    except
      on E: Exception do
      begin
        mainModule.cnFBConnectWrite.Rollback;
        raise Exception.Create('Помилка збереження завдання: ' + E.Message);
      end;
    end;

  finally
    // Розблоковуємо кнопки у разі помилки
    if not (mtNestingQueue.Active = False) then
    begin
      aCutNow.Enabled := True;
      aCutLater.Enabled := True;
    end;
  end;
end;

procedure TfmJRN_Parts_Stock_Cutting.aCutLaterExecute(Sender: TObject);
var
  OptimalTariffID: Integer;
  OptimalDate: TDateTime;
  TariffPrice: Double;
  PowerKWVar: Variant;
  PowerKW: Double;
  vBatchID: Integer;
  PartID, CurrentQty: Integer;
  ExactPartTime, ExactEnergyCost, TotalCalculatedCost: Double;
begin
if CheckDataForErrors() then exit;

  // БЛОКУЄМО КНОПКИ, щоб уникнути подвійного натискання
  aCutNow.Enabled := False;
  aCutLater.Enabled := False;

  try
    if FMachineTime <= 0 then
    begin
      RunNestingConsole;
      if FMachineTime <= 0 then
      begin
        aCutNow.Enabled := True;
        aCutLater.Enabled := True;
        exit;
      end;
    end;

    if mtNestingQueue.RecordCount = 0 then
    begin
      aCutNow.Enabled := True;
      aCutLater.Enabled := True;
      exit;
    end;

    // 1. Оптимальний тариф для BESS
    spOptimalTariff.Close;
    spOptimalTariff.Open;
    if spOptimalTariff.IsEmpty then
    begin
      mainModule.ShowMessage(Self, 'Не знайдено тарифів у базі!', '');
      // РОЗБЛОКОВУЄМО КНОПКИ ПРИ ПОМИЛЦІ
      aCutNow.Enabled := True;
      aCutLater.Enabled := True;
      Exit;
    end;

    OptimalTariffID := spOptimalTariff.FieldByName('OPTIMAL_TARIFF_ID').AsInteger;
    OptimalDate := Date + spOptimalTariff.FieldByName('OPT_TIME_START').AsDateTime;
    TariffPrice := spOptimalTariff.FieldByName('MIN_PRICE').AsFloat;

    PowerKWVar := mainModule.spREF_MACHINE.Lookup('ID', edID_REF_MACHINE.EditValue, 'POWER_NOMINAL');
    if VarIsNull(PowerKWVar) then PowerKW := 0 else PowerKW := PowerKWVar;

    TotalCalculatedCost := 0;

    mainModule.cnFBConnectWrite.StartTransaction;
    try
      vBatchID := mainModule.cnFBConnectWrite.ExecSQLScalar('SELECT GEN_ID(GEN_NESTING_BATCH_ID, 1) FROM RDB$DATABASE');

      spSaveForm.StoredProcName := 'JRN_NESTING_TASKS_IU';
      spSaveForm.Prepare;

      mtNestingQueue.First;
      while not mtNestingQueue.Eof do
      begin
        PartID := mtNestingQueue.FieldByName('ID_PART').AsInteger;
        CurrentQty := mtNestingQueue.FieldByName('QUANTITY').AsInteger;

        // 2. Отримуємо точний час для цієї деталі
        if not FPartTimes.TryGetValue(PartID, ExactPartTime) then
          ExactPartTime := 0;

        // 3. Вираховуємо ТОЧНУ вартість енергії і додаємо в загальну суму
        ExactEnergyCost := PowerKW * (ExactPartTime / 60.0) * TariffPrice;
        TotalCalculatedCost := TotalCalculatedCost + ExactEnergyCost;

        spSaveForm.Params.ParamByName('I_ID').AsInteger             := -1;
        spSaveForm.Params.ParamByName('I_ID_PART').AsInteger        := PartID;
        spSaveForm.Params.ParamByName('I_QUANTITY').AsInteger       := CurrentQty;
        spSaveForm.Params.ParamByName('I_ID_REF_MACHINE').AsInteger := edID_REF_MACHINE.EditValue;
        spSaveForm.Params.ParamByName('I_PLANNED_DATE').AsDateTime  := OptimalDate;
        spSaveForm.Params.ParamByName('I_ESTIMATED_COST').AsFloat   := ExactEnergyCost; // ТОЧНА ВАРТІСТЬ
        spSaveForm.Params.ParamByName('I_ID_TARIFF').AsInteger      := OptimalTariffID;
        spSaveForm.Params.ParamByName('I_FACT_DATE').Clear;         // Завдання відкладено
        spSaveForm.Params.ParamByName('I_STATUS').AsInteger         := 0; // СТАТУС "ОЧІКУЄ"
        spSaveForm.Params.ParamByName('I_ESTIMATED_TIME_MINS').AsFloat := ExactPartTime;   // ТОЧНИЙ ЧАС
        spSaveForm.Params.ParamByName('I_BATCH_ID').AsInteger       := vBatchID;

        spSaveForm.ExecProc;
        mtNestingQueue.Next;
      end;

      mainModule.cnFBConnectWrite.Commit;
      mainModule.ShowMessage(Self, 'Завдання відкладено на ' + FormatDateTime('hh:nn', OptimalDate) +
                            '. Очікувана вартість: ' + FormatFloat('0.00 грн', TotalCalculatedCost), '');
    except
      on E: Exception do
      begin
        mainModule.cnFBConnectWrite.Rollback;
        mainModule.ShowMessage(Self, 'Помилка збереження плану: ' + E.Message, '', TTypeMessage.Error);
        // РОЗБЛОКОВУЄМО КНОПКИ ПРИ ПОМИЛЦІ
        aCutNow.Enabled := True;
        aCutLater.Enabled := True;
      end;
    end;

  except
    on E: Exception do
    begin
      mainModule.ShowMessage(Self, 'Непередбачена помилка: ' + E.Message, '', TTypeMessage.Error);
      aCutNow.Enabled := True;
      aCutLater.Enabled := True;
    end;
  end;
end;

end.
