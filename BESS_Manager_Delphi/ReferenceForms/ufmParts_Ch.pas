unit ufmParts_Ch;

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
  Vcl.ExtCtrls, MySkinWhite, cxCurrencyEdit, cxImage,

  dxGDIPlusClasses, dxGDIPlusApi, dxCore, Math,
  System.JSON, System.Generics.Collections, System.Types, dxBarBuiltInMenu, cxPC, cxMaskEdit, cxDropDownEdit, dxSkinOffice2013White, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

const
  mCaption = 'Деталь: ';

type
  TCurrentShape = (csSquare, csRectangle, csTriangle, csPentagon, csHexagon, csTrapeze, csCircle, csEllipse, csRhombus, csParallelogram, csCustom);

  TfmParts_Ch = class(TfmBaseObjectForm)
    spDataField: TFDQuery;
    dsDataField: TDataSource;
    spSaveForm: TFDStoredProc;
    Panel1: TPanel;
    alListActions: TActionList;
    aConfirm: TAction;
    aSave: TAction;
    bbSave: TcxButton;
    bbConfirm: TcxButton;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    cxPageControl1: TcxPageControl;
    shSqueare: TcxTabSheet;
    Label5: TLabel;
    Label3: TLabel;
    cxSquareSide: TcxCurrencyEdit;
    shRectangle: TcxTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxRectangleWidth: TcxCurrencyEdit;
    cxRectangleHeight: TcxCurrencyEdit;
    shTriangle: TcxTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cxTriangleA: TcxCurrencyEdit;
    cxTriangleB: TcxCurrencyEdit;
    cxTriangleC: TcxCurrencyEdit;
    shpentagon: TcxTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    cxPentagonHeight: TcxCurrencyEdit;
    shhexagon: TcxTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    cxHexagonSide: TcxCurrencyEdit;
    shTrapeze: TcxTabSheet;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    cxTrapezeBottom: TcxCurrencyEdit;
    cxTrapezeTop: TcxCurrencyEdit;
    cxTrapezeHeight: TcxCurrencyEdit;
    shcircle: TcxTabSheet;
    Label26: TLabel;
    Label27: TLabel;
    cxCircleRadius: TcxCurrencyEdit;
    shellipse: TcxTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    cxEllipseWidth: TcxCurrencyEdit;
    cxEllipseHeight: TcxCurrencyEdit;
    shRhombus: TcxTabSheet;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    cxRhombusDiagH: TcxCurrencyEdit;
    cxRhombusDiagV: TcxCurrencyEdit;
    shParallelogram: TcxTabSheet;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    cxParallelogramSide: TcxCurrencyEdit;
    cxParallelogramAngle: TcxCurrencyEdit;
    cxParallelogramBase: TcxCurrencyEdit;
    shCustom: TcxTabSheet;
    cbShapeType: TcxComboBox;
    edNotes: TcxDBTextEdit;
    edName: TcxDBTextEdit;
    edKod: TcxDBTextEdit;
    edAreaCircle: TcxDBCurrencyEdit;
    bbCloseShape: TcxButton;
    bbClearShape: TcxButton;
    edAreaEllipse: TcxDBCurrencyEdit;
    edAreaHexagon: TcxDBCurrencyEdit;
    edAreaParallelogram: TcxDBCurrencyEdit;
    edAreaPentagon: TcxDBCurrencyEdit;
    edAreaRectangle: TcxDBCurrencyEdit;
    edAreaRhombus: TcxDBCurrencyEdit;
    edAreaSquare: TcxDBCurrencyEdit;
    edAreaTrapeze: TcxDBCurrencyEdit;
    edAreaTriangle: TcxDBCurrencyEdit;
    cxImage1: TcxImage;
    Splitter2: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aConfirmExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure OnDataSetChange(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure cxImage1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxPageControl1Change(Sender: TObject);
    procedure cxSquareSidePropertiesChange(Sender: TObject);
    procedure cxRectangleWidthPropertiesChange(Sender: TObject);
    procedure cxRectangleHeightPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbShapeTypePropertiesChange(Sender: TObject);
    procedure cxTriangleAPropertiesChange(Sender: TObject);
    procedure cxTriangleBPropertiesChange(Sender: TObject);
    procedure cxTriangleCPropertiesChange(Sender: TObject);
    procedure cxPentagonHeightPropertiesChange(Sender: TObject);
    procedure cxTrapezeBottomPropertiesChange(Sender: TObject);
    procedure cxTrapezeTopPropertiesChange(Sender: TObject);
    procedure cxTrapezeHeightPropertiesChange(Sender: TObject);
    procedure cxHexagonSidePropertiesChange(Sender: TObject);
    procedure cxCircleRadiusPropertiesChange(Sender: TObject);
    procedure cxEllipseWidthPropertiesChange(Sender: TObject);
    procedure cxEllipseHeightPropertiesChange(Sender: TObject);
    procedure cxRhombusDiagHPropertiesChange(Sender: TObject);
    procedure cxRhombusDiagVPropertiesChange(Sender: TObject);
    procedure cxParallelogramBasePropertiesChange(Sender: TObject);
    procedure cxParallelogramSidePropertiesChange(Sender: TObject);
    procedure cxParallelogramAnglePropertiesChange(Sender: TObject);
    procedure bbCloseShapeClick(Sender: TObject);
    procedure bbClearShapeClick(Sender: TObject);
  private
    FCurrentShape: TCurrentShape; // Яка фігура зараз обрана
    FPoints: TList<TPointF>;      // Масив для довільного контуру
    FIsDrawing: Boolean;

    procedure RedrawCanvas;       // Головна процедура малювання
    procedure GenerateJSON;       // Процедура створення JSON

    function CheckDataForErrors(): Boolean;
    procedure UpdateGeometryFields;
    procedure LoadGeometryFromJSON;
    procedure UpdatePartName;
  public
    constructor Create(AOwner: TComponent; Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild); reintroduce;
  end;

var
  fmParts_Ch: TfmParts_Ch;
  OwnSender: TObject;

implementation

uses ufmParts;

{$R *.dfm}

constructor TfmParts_Ch.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;
  if FormIsClosed then
    exit;

  Tag := mainModule.GetIDForm;

  /// //////////////////////////////////////////////////////////
  if Operation = FormOperation.None then
    exit;

  spDataField.Active                             := false;
  spDataField.Params.ParamByName('ID').AsInteger := ID;
  try
    spDataField.Active := true;

    if Operation = FormOperation.AddCopy then
      begin
        spDataField.Edit;
        spDataField.FieldValues['ID'] := -1;
      end;

    if spDataField.RecordCount = 0 then
      begin
        spDataField.Append;
        spDataField.FieldValues['ID'] := -1;
      end;

  except
    on E: Exception do
      begin
        mainModule.ShowMessage(Self, 'Неможливо виконати запит. ' + #13 + E.Message, '', TTypeMessage.Error);
        exit;
      end;
  end;

  if Operation = FormOperation.Edit then
    Caption := mCaption + ' ' + spDataField.FieldValues['NAME'];

  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    Caption := mCaption + ' Створення';

  mainModule.EditReadOnly(edKod, clWhite, clHotLight);

  if (spDataField.State = dsEdit) or (spDataField.State = dsInsert) then
    spDataField.Post;
  FormModify            := false;
  spDataField.AfterPost := OnDataSetChange;

  FPoints := TList<TPointF>.Create;
  FIsDrawing := False;

  ShowThisForm();
end;

procedure TfmParts_Ch.UpdatePartName;
var
  NewName: string;
begin
  // Генеруємо правильну назву залежно від фігури
  case FCurrentShape of
    csSquare:
      NewName := Format('Квадрат %dx%d', [Trunc(cxSquareSide.Value), Trunc(cxSquareSide.Value)]);
    csRectangle:
      NewName := Format('Прямокутник %dx%d', [Trunc(cxRectangleWidth.Value), Trunc(cxRectangleHeight.Value)]);
    csTriangle:
      NewName := Format('Трикутник %dx%dx%d', [Trunc(cxTriangleA.Value), Trunc(cxTriangleB.Value), Trunc(cxTriangleC.Value)]);
    csPentagon: // <-- ДОДАНО
      NewName := Format('П''ятикутник a=%d', [Trunc(cxPentagonHeight.Value)]);
    csHexagon:
      NewName := Format('Шестикутник a=%d', [Trunc(cxHexagonSide.Value)]);
    csTrapeze:
      NewName := Format('Трапеція %dx%d h=%d', [Trunc(cxTrapezeBottom.Value), Trunc(cxTrapezeTop.Value), Trunc(cxTrapezeHeight.Value)]);
    csCircle:
      NewName := Format('Коло R=%d', [Trunc(cxCircleRadius.Value)]);
    csEllipse:
      NewName := Format('Еліпс %dx%d', [Trunc(cxEllipseWidth.Value), Trunc(cxEllipseHeight.Value)]);
    csRhombus:
      NewName := Format('Ромб %dx%d', [Trunc(cxRhombusDiagH.Value), Trunc(cxRhombusDiagV.Value)]);
    csParallelogram:
      NewName := Format('Паралелограм %dx%d кут %d°', [Trunc(cxParallelogramBase.Value), Trunc(cxParallelogramSide.Value), Trunc(cxParallelogramAngle.Value)]);
    csCustom:
      Exit; // Для довільної фігури виходимо, залишаючи те, що ввів користувач!
  end;

  // Щоб не смикати базу даних при кожному натисканні клавіші,
  // оновлюємо поле ТІЛЬКИ якщо згенерована назва відрізняється від поточної
  if mainModule.IFNull(spDataField.FieldValues['NAME'], '') <> NewName then
  begin
    if not (spDataField.State in [dsEdit, dsInsert]) then
      spDataField.Edit;

    spDataField.FieldByName('NAME').AsString := NewName;
  end;
end;

procedure TfmParts_Ch.cxCircleRadiusPropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxEllipseHeightPropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxEllipseWidthPropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxHexagonSidePropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxImage1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // Дозволяємо малювати мишкою ТІЛЬКИ на вкладці "Довільна фігура"
  if FCurrentShape <> csCustom then Exit;

  if Button = mbLeft then
  begin
    // Якщо малювання тільки почалося (після очищення або старту)
    if not FIsDrawing then
    begin
      FPoints.Clear;
      FIsDrawing := True;
    end;

    // --- МАГНІТ (АВТОЗАМИКАННЯ) ---
    if FPoints.Count >= 3 then
    begin
      // Рахуємо відстань від поточного кліку (X,Y) до першої точки (X0,Y0) за теоремою Піфагора
      var Dist: Double := Sqrt(Sqr(X - FPoints[0].X) + Sqr(Y - FPoints[0].Y));

      // Якщо клікнули в радіусі 15 пікселів від старту - замикаємо!
      if Dist <= 15.0 then
      begin
        FIsDrawing := False; // Вимикаємо малювання
        RedrawCanvas;        // Заливаємо фігуру
        Exit;                // Виходимо, щоб не додавати цю точку як нову кутову
      end;
    end;

    // Якщо ми сюди дійшли, значить просто ставимо нову кутову точку
    FPoints.Add(PointF(X, Y));
    RedrawCanvas;
  end
  else if Button = mbRight then
  begin
    // Залишаємо Правий Клік як ще одну альтернативу для швидкого замикання (як було у тебе)
    if FIsDrawing and (FPoints.Count >= 3) then
    begin
      FIsDrawing := False;
      RedrawCanvas;
    end;
  end;
end;

procedure TfmParts_Ch.cxPageControl1Change(Sender: TObject);
begin
  case cxPageControl1.ActivePageIndex of
    0: FCurrentShape := csSquare;
    1: FCurrentShape := csRectangle;
    2: FCurrentShape := csTriangle;
    3: FCurrentShape := csPentagon;
    4: FCurrentShape := csHexagon;
    5: FCurrentShape := csTrapeze;
    6: FCurrentShape := csCircle;
    7: FCurrentShape := csEllipse;
    8: FCurrentShape := csRhombus;
    9: FCurrentShape := csParallelogram;
    10: FCurrentShape := csCustom;
  end;

  var IsCustom: Boolean := (FCurrentShape = csCustom);
  bbCloseShape.Visible := IsCustom;
  bbClearShape.Visible := IsCustom;

  if FCurrentShape <> csCustom then
    FPoints.Clear;

  RedrawCanvas;
end;
procedure TfmParts_Ch.cxParallelogramAnglePropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxParallelogramBasePropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxParallelogramSidePropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxPentagonHeightPropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxRectangleHeightPropertiesChange(Sender: TObject);
begin
  RedrawCanvas;
end;

procedure TfmParts_Ch.cxRectangleWidthPropertiesChange(Sender: TObject);
begin
  RedrawCanvas;
end;

procedure TfmParts_Ch.cxRhombusDiagHPropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxRhombusDiagVPropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxSquareSidePropertiesChange(Sender: TObject);
begin
  RedrawCanvas;
end;

procedure TfmParts_Ch.cxTrapezeBottomPropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxTrapezeHeightPropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxTrapezeTopPropertiesChange(Sender: TObject);
begin
  RedrawCanvas
end;

procedure TfmParts_Ch.cxTriangleAPropertiesChange(Sender: TObject);
begin
  RedrawCanvas;
end;

procedure TfmParts_Ch.cxTriangleBPropertiesChange(Sender: TObject);
begin
  RedrawCanvas;
end;

procedure TfmParts_Ch.cxTriangleCPropertiesChange(Sender: TObject);
begin
  RedrawCanvas;
end;

procedure TfmParts_Ch.LoadGeometryFromJSON;
var
  JSONData: string;
  JSONArray: TJSONArray;
  JSONObj: TJSONObject;
  I: Integer;
  W, H: Double;
  X0, Y0, X1, Y1, X2, Y2, X3, Y3: Double;
  LenBottom, LenTop: Double;
begin
  JSONData := mainModule.IFNull(spDataField.FieldValues['GEOMETRY_JSON'], '');

  if JSONData = '' then Exit;

  JSONArray := TJSONObject.ParseJSONValue(JSONData) as TJSONArray;
  if Assigned(JSONArray) then
  try
    FPoints.Clear;

    // --- 1. ТРИКУТНИК ---
    if JSONArray.Count = 3 then
    begin
      FCurrentShape := csTriangle;
      cxPageControl1.ActivePageIndex := 2;
      if Assigned(cbShapeType) then cbShapeType.ItemIndex := 2;

      X1 := (JSONArray.Items[0] as TJSONObject).GetValue<Double>('x');
      Y1 := (JSONArray.Items[0] as TJSONObject).GetValue<Double>('y');
      X2 := (JSONArray.Items[1] as TJSONObject).GetValue<Double>('x');
      Y2 := (JSONArray.Items[1] as TJSONObject).GetValue<Double>('y');
      X3 := (JSONArray.Items[2] as TJSONObject).GetValue<Double>('x');
      Y3 := (JSONArray.Items[2] as TJSONObject).GetValue<Double>('y');

      cxTriangleA.Value := Round(Sqrt(Sqr(X2 - X1) + Sqr(Y2 - Y1)));
      cxTriangleB.Value := Round(Sqrt(Sqr(X3 - X1) + Sqr(Y3 - Y1)));
      cxTriangleC.Value := Round(Sqrt(Sqr(X3 - X2) + Sqr(Y3 - Y2)));
    end

    // --- 2. КВАДРАТ / ПРЯМОКУТНИК / ТРАПЕЦІЯ (всі мають 4 точки) ---
   else if JSONArray.Count = 4 then
    begin
      X0 := (JSONArray.Items[0] as TJSONObject).GetValue<Double>('x');
      Y0 := (JSONArray.Items[0] as TJSONObject).GetValue<Double>('y');
      X1 := (JSONArray.Items[1] as TJSONObject).GetValue<Double>('x');
      Y1 := (JSONArray.Items[1] as TJSONObject).GetValue<Double>('y');
      X2 := (JSONArray.Items[2] as TJSONObject).GetValue<Double>('x');
      Y2 := (JSONArray.Items[2] as TJSONObject).GetValue<Double>('y');
      X3 := (JSONArray.Items[3] as TJSONObject).GetValue<Double>('x');
      Y3 := (JSONArray.Items[3] as TJSONObject).GetValue<Double>('y');

      LenBottom := Sqrt(Sqr(X1 - X0) + Sqr(Y1 - Y0));
      LenTop    := Sqrt(Sqr(X2 - X3) + Sqr(Y2 - Y3));

      // Перевіряємо, чи нижня лінія горизонтальна (Y0 == Y1)
      var IsHorizontal: Boolean := Abs(Y1 - Y0) < 0.1;

      // Якщо протилежні сторони рівні (Основи однакові) і фігура лежить горизонтально
      if (Abs(LenBottom - LenTop) < 0.1) and IsHorizontal then
      begin
        // Перевіряємо зсув (нахил) лівої грані
        var ShiftX: Double := Abs(X3 - X0);

        // Якщо зсуву немає (або він мінімальний) - це ПРЯМОКУТНИК або КВАДРАТ
        if ShiftX < 0.1 then
        begin
          W := LenBottom;
          H := Sqrt(Sqr(X2 - X1) + Sqr(Y2 - Y1)); // Висота

          if Abs(W - H) < 0.1 then
          begin
            FCurrentShape := csSquare;
            cxPageControl1.ActivePageIndex := 0;
            cxSquareSide.Value := W;
          end
          else
          begin
            FCurrentShape := csRectangle;
            cxPageControl1.ActivePageIndex := 1;
            cxRectangleWidth.Value := W;
            cxRectangleHeight.Value := H;
          end;
        end
        // Якщо є зсув - це ПАРАЛЕЛОГРАМ
        else
        begin
          FCurrentShape := csParallelogram;
          cxPageControl1.ActivePageIndex := 9; // Вкажи свій індекс вкладки

          cxParallelogramBase.Value := Round(LenBottom);

          // Рахуємо довжину бокової сторони (відстань між точкою 0 і 3)
          var SideLen: Double := Sqrt(Sqr(X3 - X0) + Sqr(Y3 - Y0));
          cxParallelogramSide.Value := Round(SideLen);

          // Знаходимо кут через Арксинус (Висота / Бокова сторона)
          var H_shape: Double := Abs(Y3 - Y0);
          // Захист від похибки (щоб значення не вискочило за 1.0)
          var Ratio: Double := H_shape / SideLen;
          if Ratio > 1.0 then Ratio := 1.0;

          var AngleRad: Double := ArcSin(Ratio);

          // Якщо точка верхня лівіше за нижню, значить кут тупий
          if X3 < X0 then
            cxParallelogramAngle.Value := Round(180.0 - (AngleRad * 180.0 / Pi))
          else
            cxParallelogramAngle.Value := Round(AngleRad * 180.0 / Pi);
        end;
      end
      // Якщо протилежні сторони рівні, але фігура "нахилена" (координати Y різні) - це Ромб
      else if (Abs(LenBottom - LenTop) < 0.1) and not IsHorizontal then
      begin
        FCurrentShape := csRhombus;
        cxPageControl1.ActivePageIndex := 8; // Вкажи свій індекс для Ромба

        // Для ромба горизонтальна діагональ - це відстань між лівою (X3) і правою (X1) точками
        cxRhombusDiagH.Value := Round(Abs(X1 - X3));
        // Вертикальна діагональ - між верхньою (Y0) і нижньою (Y2)
        cxRhombusDiagV.Value := Round(Abs(Y0 - Y2));
      end
      // Якщо сторони різні - це Трапеція
      else
      begin
        FCurrentShape := csTrapeze;
        cxPageControl1.ActivePageIndex := 5; // Вкажи свій індекс для Трапеції

        cxTrapezeBottom.Value := Round(LenBottom);
        cxTrapezeTop.Value    := Round(LenTop);
        cxTrapezeHeight.Value := Round(Abs(Y2 - Y1)); // Висота трапеції
      end;

      if Assigned(cbShapeType) then cbShapeType.ItemIndex := cxPageControl1.ActivePageIndex;
    end

    // --- 3. П'ЯТИКУТНИК ---
    else if JSONArray.Count = 5 then
    begin
      FCurrentShape := csPentagon;
      cxPageControl1.ActivePageIndex := 3;
      X1 := (JSONArray.Items[0] as TJSONObject).GetValue<Double>('x');
      Y1 := (JSONArray.Items[0] as TJSONObject).GetValue<Double>('y');
      X2 := (JSONArray.Items[1] as TJSONObject).GetValue<Double>('x');
      Y2 := (JSONArray.Items[1] as TJSONObject).GetValue<Double>('y');

      cxPentagonHeight.Value := Round(Sqrt(Sqr(X2 - X1) + Sqr(Y2 - Y1)));
    end

    // --- 4. ШЕСТИКУТНИК ---
    else if JSONArray.Count = 6 then
    begin
      FCurrentShape := csHexagon;
      cxPageControl1.ActivePageIndex := 4;
      X1 := (JSONArray.Items[0] as TJSONObject).GetValue<Double>('x');
      Y1 := (JSONArray.Items[0] as TJSONObject).GetValue<Double>('y');
      X2 := (JSONArray.Items[1] as TJSONObject).GetValue<Double>('x');
      Y2 := (JSONArray.Items[1] as TJSONObject).GetValue<Double>('y');

      cxHexagonSide.Value := Round(Sqrt(Sqr(X2 - X1) + Sqr(Y2 - Y1)));
    end

   // --- 6. КОЛО (36 точок) ---
    else if JSONArray.Count = 36 then
    begin
      FCurrentShape := csCircle;
      cxPageControl1.ActivePageIndex := 6; // Вкажи свій індекс для вкладки кола
      if Assigned(cbShapeType) then cbShapeType.ItemIndex := 6;

      // Беремо точку 0 (крайня права) і точку 18 (крайня ліва)
      X1 := (JSONArray.Items[0] as TJSONObject).GetValue<Double>('x');
      X2 := (JSONArray.Items[18] as TJSONObject).GetValue<Double>('x');

      // Радіус - це половина ширини між цими точками
      cxCircleRadius.Value := Round(Abs(X2 - X1) / 2.0);
    end

   // --- КОЛО АБО ЕЛІПС (36 точок) ---
    else if JSONArray.Count = 36 then
    begin
      // Знаходимо ширину (відстань між точкою 0 і 18)
      X1 := (JSONArray.Items[0] as TJSONObject).GetValue<Double>('x');
      X2 := (JSONArray.Items[18] as TJSONObject).GetValue<Double>('x');
      W := Abs(X2 - X1);

      // Знаходимо висоту (відстань між точкою 9 і 27)
      Y1 := (JSONArray.Items[9] as TJSONObject).GetValue<Double>('y');
      Y2 := (JSONArray.Items[27] as TJSONObject).GetValue<Double>('y');
      H := Abs(Y2 - Y1);

      // Якщо ширина і висота рівні (з похибкою) - це ідеальне КОЛО
      if Abs(W - H) < 0.1 then
      begin
        FCurrentShape := csCircle;
        cxPageControl1.ActivePageIndex := 6; // Індекс кола
        cxCircleRadius.Value := Round(W / 2.0);
      end
      else
      begin
        // Якщо ширина і висота різні - це ЕЛІПС
        FCurrentShape := csEllipse;
        cxPageControl1.ActivePageIndex := 7; // Індекс еліпса (заміни на свій)
        cxEllipseWidth.Value := Round(W);
        cxEllipseHeight.Value := Round(H);
      end;

      if Assigned(cbShapeType) then cbShapeType.ItemIndex := cxPageControl1.ActivePageIndex;
    end

    // --- 5. ДОВІЛЬНА ФІГУРА ---
    else
    begin
      FCurrentShape := csCustom;
      cxPageControl1.ActivePageIndex := 6; // Останній індекс для Custom

      for I := 0 to JSONArray.Count - 1 do
      begin
        JSONObj := JSONArray.Items[I] as TJSONObject;
        FPoints.Add(PointF(JSONObj.GetValue<Double>('x'), JSONObj.GetValue<Double>('y')));
      end;
      FIsDrawing := False;
    end;

    // Синхронізуємо комбобокс з обраною сторінкою
    if Assigned(cbShapeType) then
      cbShapeType.ItemIndex := cxPageControl1.ActivePageIndex;

    RedrawCanvas;

  finally
    JSONArray.Free;
  end;
end;

procedure TfmParts_Ch.RedrawCanvas;
var
  Bmp: TBitmap;
  Side, W, H: Double;
  P: array of TPoint;
  I: Integer;
  A, B, C, p_half, X, Y: Double;
  OffsetX, OffsetY: Integer; // Змінні для відступів центрування
begin
  Bmp := TBitmap.Create;
  try
    Bmp.Width := cxImage1.Width;
    Bmp.Height := cxImage1.Height;

    // Заливка фону (сітка для краси)
    Bmp.Canvas.Brush.Color := clWhite;
    Bmp.Canvas.FillRect(Rect(0, 0, Bmp.Width, Bmp.Height));

    // Налаштовуємо стиль ліній
    Bmp.Canvas.Pen.Color := clBlack;
    Bmp.Canvas.Pen.Width := 2;
    Bmp.Canvas.Brush.Color := $00EBC587; // Колір заливки фігури

    // МАЛЮЄМО В ЗАЛЕЖНОСТІ ВІД ОБРАНОЇ ВКЛАДКИ
    case FCurrentShape of
      csSquare:
        begin
          Side := cxSquareSide.Value;
          if Side > 0 then
          begin
            edAreaSquare.Value := Side * Side;

            // Розрахунок центру екрана для квадрата
            OffsetX := (Bmp.Width - Trunc(Side)) div 2;
            OffsetY := (Bmp.Height - Trunc(Side)) div 2;

            SetLength(P, 4);
            P[0] := Point(OffsetX, OffsetY);
            P[1] := Point(OffsetX + Trunc(Side), OffsetY);
            P[2] := Point(OffsetX + Trunc(Side), OffsetY + Trunc(Side));
            P[3] := Point(OffsetX, OffsetY + Trunc(Side));
            Bmp.Canvas.Polygon(P);
          end
          else
          begin
            // ---> ЯКЩО РОЗМІР 0 АБО МЕНШЕ <---
            edAreaSquare.Value := 0;
            Bmp.Canvas.Font.Size := 14;
            Bmp.Canvas.Font.Color := clRed;
            Bmp.Canvas.TextOut(20, 20, 'Введіть сторону більшу за 0');
          end;
        end;

      csRectangle:
        begin
          W := cxRectangleWidth.Value;
          H := cxRectangleHeight.Value;
          if (W > 0) and (H > 0) then
          begin
            edAreaRectangle.Value := W * H;

            // Розрахунок центру екрана для прямокутника
            OffsetX := (Bmp.Width - Trunc(W)) div 2;
            OffsetY := (Bmp.Height - Trunc(H)) div 2;

            SetLength(P, 4);
            P[0] := Point(OffsetX, OffsetY);
            P[1] := Point(OffsetX + Trunc(W), OffsetY);
            P[2] := Point(OffsetX + Trunc(W), OffsetY + Trunc(H));
            P[3] := Point(OffsetX, OffsetY + Trunc(H));
            Bmp.Canvas.Polygon(P);
          end
          else
          begin
            // ---> ЯКЩО ШИРИНА АБО ВИСОТА 0 <---
            edAreaRectangle.Value := 0;
            Bmp.Canvas.Font.Size := 14;
            Bmp.Canvas.Font.Color := clRed;
            Bmp.Canvas.TextOut(20, 20, 'Ширина та Висота повинні бути більші за 0');
          end;
        end;

      csTriangle:
        begin
          A := cxTriangleA.Value; B := cxTriangleB.Value; C := cxTriangleC.Value;
          // ПЕРЕВІРКА ІСНУВАННЯ ТРИКУТНИКА
          if (A > 0) and (B > 0) and (C > 0) and
             (A + B > C) and (A + C > B) and (B + C > A) then
          begin
            p_half := (A + B + C) / 2.0;
            edAreaTriangle.Value := Sqrt(p_half * (p_half - A) * (p_half - B) * (p_half - C));

            X := (A * A + B * B - C * C) / (2 * A);
            Y := Sqrt(Abs(B * B - X * X));

            // Розрахунок центру екрана для трикутника (габарити: ширина A, висота Y)
            OffsetX := (Bmp.Width - Trunc(A)) div 2;
            OffsetY := (Bmp.Height - Trunc(Y)) div 2;

            SetLength(P, 3);
            P[0] := Point(OffsetX, OffsetY);
            P[1] := Point(OffsetX + Trunc(A), OffsetY);
            P[2] := Point(OffsetX + Trunc(X), OffsetY + Trunc(Y));
            Bmp.Canvas.Polygon(P);
          end
          else
          begin
            // ---> ЯКЩО ТАКИЙ ТРИКУТНИК НЕМОЖЛИВИЙ <---
            edAreaTriangle.Value := 0;
            Bmp.Canvas.Font.Size := 14;
            Bmp.Canvas.Font.Color := clRed;
            Bmp.Canvas.TextOut(20, 20, 'Помилка: Трикутник з такими сторонами не може існувати!');
            Bmp.Canvas.Font.Size := 10;
            Bmp.Canvas.Font.Color := clGray;
            Bmp.Canvas.TextOut(20, 50, 'Сума двох сторін має бути більшою за третю.');
          end;
        end;

        csPentagon:
        begin
          Side := cxPentagonHeight.Value;
          if Side > 0 then
          begin
            // 1. Рахуємо площу
            edAreaPentagon.Value := (Sqr(Side) * Sqrt(25 + 10 * Sqrt(5))) / 4;

            // 2. Рахуємо радіус описаного кола (Pi/5 = 36 градусів)
            var R: Double := Side / (2 * Sin(Pi / 5));

            // 3. Центр малюнка
            OffsetX := Bmp.Width div 2;
            OffsetY := Bmp.Height div 2;

            SetLength(P, 5);
            // 4. Генеруємо 5 точок по колу (починаючи з верхньої: -Pi/2)
            for I := 0 to 4 do
            begin
              var Angle: Double := -Pi/2 + I * (2 * Pi / 5);
              P[I].X := OffsetX + Round(R * Cos(Angle));
              P[I].Y := OffsetY + Round(R * Sin(Angle));
            end;

            Bmp.Canvas.Polygon(P);
          end
          else
          begin
            edAreaPentagon.Value := 0;
            Bmp.Canvas.Font.Size := 14;
            Bmp.Canvas.Font.Color := clRed;
            Bmp.Canvas.TextOut(20, 20, 'Введіть сторону більшу за 0');
          end;
        end;

      csHexagon:
        begin
          Side := cxHexagonSide.Value;
          if Side > 0 then
          begin
            // 1. Площа: S = (3 * sqrt(3) / 2) * a^2
            edAreaHexagon.Value := (3 * Sqrt(3) / 2) * Sqr(Side);

            // 2. Радіус дорівнює стороні
            var R: Double := Side;

            // 3. Центр екрана
            OffsetX := Bmp.Width div 2;
            OffsetY := Bmp.Height div 2;

            SetLength(P, 6); // 6 точок
            // 4. Генеруємо 6 точок по колу (крок 60 градусів = Pi/3)
            for I := 0 to 5 do
            begin
              var Angle: Double := -Pi/2 + I * (Pi / 3); // Починаємо з верхньої точки
              P[I].X := OffsetX + Round(R * Cos(Angle));
              P[I].Y := OffsetY + Round(R * Sin(Angle));
            end;

            Bmp.Canvas.Polygon(P);
          end
          else
          begin
            edAreaHexagon.Value := 0;
            Bmp.Canvas.Font.Size := 14;
            Bmp.Canvas.Font.Color := clRed;
            Bmp.Canvas.TextOut(20, 20, 'Введіть сторону більшу за 0');
          end;
        end;

      csTrapeze:
        begin
          // ПРИБРАЛИ var та : Double
          A := cxTrapezeBottom.Value;
          B := cxTrapezeTop.Value;
          H := cxTrapezeHeight.Value;

          if (A > 0) and (B > 0) and (H > 0) then
          begin
            // 1. Площа
            edAreaTrapeze.Value := ((A + B) / 2.0) * H;

            // 2. Розрахунок відступів (ПРИБРАЛИ var та : Integer)
            OffsetX := (Bmp.Width - Trunc(Max(A, B))) div 2;
            OffsetY := (Bmp.Height - Trunc(H)) div 2;

            // ShiftTop залишаємо з var, бо його немає у верхньому блоці
            var ShiftTop: Double := (A - B) / 2.0;

            SetLength(P, 4);
            P[0] := Point(OffsetX, OffsetY + Trunc(H));                        // Ліва нижня
            P[1] := Point(OffsetX + Trunc(A), OffsetY + Trunc(H));             // Права нижня
            P[2] := Point(OffsetX + Trunc(A - ShiftTop), OffsetY);             // Права верхня
            P[3] := Point(OffsetX + Trunc(ShiftTop), OffsetY);                 // Ліва верхня

            Bmp.Canvas.Polygon(P);
          end
          else
          begin
            edAreaTrapeze.Value := 0;
            Bmp.Canvas.Font.Size := 14;
            Bmp.Canvas.Font.Color := clRed;
            Bmp.Canvas.TextOut(20, 20, 'Всі три розміри мають бути більші за 0');
          end;
        end;

      csCircle:
        begin
          var R: Double := cxCircleRadius.Value;
          if R > 0 then
          begin
            // 1. Площа кола: S = Pi * R^2
            edAreaCircle.Value := Pi * Sqr(R);

            var D: Integer := Trunc(2 * R); // Діаметр

            // 2. Відступи для центрування
            OffsetX := (Bmp.Width - D) div 2;
            OffsetY := (Bmp.Height - D) div 2;

            // 3. Малюємо коло, вписане у квадрат (OffsetX, OffsetY, OffsetX+D, OffsetY+D)
            Bmp.Canvas.Ellipse(OffsetX, OffsetY, OffsetX + D, OffsetY + D);
          end
          else
          begin
            edAreaCircle.Value := 0;
            Bmp.Canvas.Font.Size := 14;
            Bmp.Canvas.Font.Color := clRed;
            Bmp.Canvas.TextOut(20, 20, 'Радіус має бути більшим за 0');
          end;
        end;

      csEllipse:
        begin
          W := cxEllipseWidth.Value;
          H := cxEllipseHeight.Value;

          if (W > 0) and (H > 0) then
          begin
            // 1. Площа еліпса: S = Pi * (W/2) * (H/2)
            edAreaEllipse.Value := Pi * (W / 2.0) * (H / 2.0);

            // 2. Відступи для центрування
            OffsetX := (Bmp.Width - Trunc(W)) div 2;
            OffsetY := (Bmp.Height - Trunc(H)) div 2;

            // 3. Малюємо еліпс, вписаний у прямокутник
            Bmp.Canvas.Ellipse(OffsetX, OffsetY, OffsetX + Trunc(W), OffsetY + Trunc(H));
          end
          else
          begin
            edAreaEllipse.Value := 0;
            Bmp.Canvas.Font.Size := 14;
            Bmp.Canvas.Font.Color := clRed;
            Bmp.Canvas.TextOut(20, 20, 'Ширина та Висота мають бути більшими за 0');
          end;
        end;

      csRhombus:
        begin
          W := cxRhombusDiagH.Value; // Горизонтальна діагональ
          H := cxRhombusDiagV.Value; // Вертикальна діагональ

          if (W > 0) and (H > 0) then
          begin
            // 1. Площа ромба
            edAreaRhombus.Value := (W * H) / 2.0;

            // 2. Відступи для центрування
            OffsetX := (Bmp.Width - Trunc(W)) div 2;
            OffsetY := (Bmp.Height - Trunc(H)) div 2;

            SetLength(P, 4);
            // 3. Малюємо 4 вершини (Верхня, Права, Нижня, Ліва)
            P[0] := Point(OffsetX + Trunc(W / 2.0), OffsetY);                        // Верхня
            P[1] := Point(OffsetX + Trunc(W), OffsetY + Trunc(H / 2.0));             // Права
            P[2] := Point(OffsetX + Trunc(W / 2.0), OffsetY + Trunc(H));             // Нижня
            P[3] := Point(OffsetX, OffsetY + Trunc(H / 2.0));                        // Ліва

            Bmp.Canvas.Polygon(P);
          end
          else
          begin
            edAreaRhombus.Value := 0;
            Bmp.Canvas.Font.Size := 14;
            Bmp.Canvas.Font.Color := clRed;
            Bmp.Canvas.TextOut(20, 20, 'Обидві діагоналі мають бути більшими за 0');
          end;
        end;

      csParallelogram:
        begin
          A := cxParallelogramBase.Value;
          B := cxParallelogramSide.Value;
          var AngleDeg: Double := cxParallelogramAngle.Value;

          if (A > 0) and (B > 0) and (AngleDeg > 0) and (AngleDeg < 180) then
          begin
            // Переводимо градуси в радіани
            var Rad: Double := AngleDeg * Pi / 180.0;

            // Висота фігури та зміщення верхньої точки (катети прямокутного трикутника)
            var H_shape: Double := B * Sin(Rad);
            var DX: Double := B * Cos(Rad);

            // 1. Площа
            edAreaParallelogram.Value := A * H_shape;

            // 2. Відступи для центрування
            var TotalWidth: Double := A + Abs(DX);
            OffsetX := (Bmp.Width - Trunc(TotalWidth)) div 2;
            OffsetY := (Bmp.Height - Trunc(H_shape)) div 2;

            SetLength(P, 4);
            if AngleDeg <= 90 then
            begin
              P[0] := Point(OffsetX, OffsetY + Trunc(H_shape));                // Ліва нижня
              P[1] := Point(OffsetX + Trunc(A), OffsetY + Trunc(H_shape));     // Права нижня
              P[2] := Point(OffsetX + Trunc(A + DX), OffsetY);                 // Права верхня
              P[3] := Point(OffsetX + Trunc(DX), OffsetY);                     // Ліва верхня
            end
            else
            begin
              // Якщо кут тупий (>90), паралелограм нахилений вліво
              var Shift: Double := Abs(DX);
              P[0] := Point(OffsetX + Trunc(Shift), OffsetY + Trunc(H_shape));
              P[1] := Point(OffsetX + Trunc(Shift + A), OffsetY + Trunc(H_shape));
              P[2] := Point(OffsetX + Trunc(A), OffsetY);
              P[3] := Point(OffsetX, OffsetY);
            end;

            Bmp.Canvas.Polygon(P);
          end
          else
          begin
            edAreaParallelogram.Value := 0;
            Bmp.Canvas.Font.Size := 14;
            Bmp.Canvas.Font.Color := clRed;
            Bmp.Canvas.TextOut(20, 20, 'Введіть коректні розміри та кут (1-179)');
          end;
        end;

      csCustom:
        begin
          if FPoints.Count > 0 then
          begin
            // 1. Налаштовуємо стиль ліній
            Bmp.Canvas.Pen.Color := clBlack;
            Bmp.Canvas.Pen.Width := 2;

            // 2. Якщо малювання завершено (FIsDrawing = False), заливаємо фігуру
            if not FIsDrawing and (FPoints.Count > 2) then
            begin
              SetLength(P, FPoints.Count);
              for I := 0 to FPoints.Count - 1 do
              begin
                P[I].X := Trunc(FPoints[I].X);
                P[I].Y := Trunc(FPoints[I].Y);
              end;
              Bmp.Canvas.Brush.Color := $00EBC587; // Світло-блакитний
              Bmp.Canvas.Polygon(P);
            end
            else
            begin
              // 3. Якщо процес малювання ще триває - просто малюємо лінії між точками
              Bmp.Canvas.MoveTo(Trunc(FPoints[0].X), Trunc(FPoints[0].Y));
              for I := 1 to FPoints.Count - 1 do
                Bmp.Canvas.LineTo(Trunc(FPoints[I].X), Trunc(FPoints[I].Y));
            end;

            // 4. Малюємо вузли (червоні точки), щоб користувач бачив куди він клікав
            Bmp.Canvas.Brush.Color := clRed;
            for I := 0 to FPoints.Count - 1 do
            begin
              Bmp.Canvas.Ellipse(
                Trunc(FPoints[I].X) - 3, Trunc(FPoints[I].Y) - 3,
                Trunc(FPoints[I].X) + 3, Trunc(FPoints[I].Y) + 3
              );
            end;

            // 5. Оновлюємо JSON для довільної фігури
            GenerateJSON;
          end;
        end;
    end;

    UpdatePartName;
    cxImage1.Picture.Assign(Bmp);
  finally
    Bmp.Free;
  end;
end;

procedure TfmParts_Ch.GenerateJSON;
var
  JSONArray: TJSONArray;
  JSONObj: TJSONObject;
  Side, W, H: Double;
  A, B, C, X, Y: Double;
  I: Integer;

  procedure AddPoint(PX, PY: Double);
  begin
    JSONObj := TJSONObject.Create;
    JSONObj.AddPair('x', TJSONNumber.Create(PX));
    JSONObj.AddPair('y', TJSONNumber.Create(PY));
    JSONArray.AddElement(JSONObj);
  end;

begin
  JSONArray := TJSONArray.Create;

  case FCurrentShape of
    csSquare:
      begin
        Side := cxSquareSide.Value;
        AddPoint(0, 0); AddPoint(Side, 0); AddPoint(Side, Side); AddPoint(0, Side);
      end;
    csRectangle:
      begin
        W := cxRectangleWidth.Value; H := cxRectangleHeight.Value;
        AddPoint(0, 0); AddPoint(W, 0); AddPoint(W, H); AddPoint(0, H);
      end;
    csTriangle:
      begin
        A := cxTriangleA.Value; B := cxTriangleB.Value; C := cxTriangleC.Value;
        if (A + B > C) and (A + C > B) and (B + C > A) then
        begin
          X := (A * A + B * B - C * C) / (2 * A);
          Y := Sqrt(Abs(B * B - X * X));
          AddPoint(0, 0); AddPoint(A, 0); AddPoint(X, Y);
        end;
      end;
    csCustom:
      begin
        if FPoints.Count > 2 then
          for I := 0 to FPoints.Count - 1 do
            AddPoint(FPoints[I].X, FPoints[I].Y);
      end;
  end;

  JSONArray.Free;
end;

procedure TfmParts_Ch.UpdateGeometryFields;
var
  JSONArray: TJSONArray;
  JSONObj: TJSONObject;
  Side, W, H, CalcArea: Double;
  // ДОДАНО: Змінні для Трикутника
  A, B, C, X, Y, p_half: Double;
  I, J: Integer;

  // ВИПРАВЛЕНО: Перейменовано параметри на PX та PY, щоб не було конфлікту з X та Y трикутника
  procedure AddPoint(PX, PY: Double);
  begin
    JSONObj := TJSONObject.Create;
    JSONObj.AddPair('x', TJSONNumber.Create(PX));
    JSONObj.AddPair('y', TJSONNumber.Create(PY));
    JSONArray.AddElement(JSONObj);
  end;

begin
  JSONArray := TJSONArray.Create;
  CalcArea := 0;

  try
    case FCurrentShape of
      csSquare:
        begin
          Side := cxSquareSide.Value;
          AddPoint(0, 0);
          AddPoint(Side, 0);
          AddPoint(Side, Side);
          AddPoint(0, Side);
          CalcArea := Side * Side; // Площа квадрата
        end;

      csRectangle:
        begin
          W := cxRectangleWidth.Value;
          H := cxRectangleHeight.Value;
          AddPoint(0, 0);
          AddPoint(W, 0);
          AddPoint(W, H);
          AddPoint(0, H);
          CalcArea := W * H; // Площа прямокутника
        end;

      csTriangle:
        begin
          A := cxTriangleA.Value;
          B := cxTriangleB.Value;
          C := cxTriangleC.Value;

          if (A + B > C) and (A + C > B) and (B + C > A) then
          begin
            X := (A * A + B * B - C * C) / (2 * A);
            Y := Sqrt(Abs(B * B - X * X));

            AddPoint(0, 0);   // Точка 1
            AddPoint(A, 0);   // Точка 2
            AddPoint(X, Y);   // Точка 3

            p_half := (A + B + C) / 2.0;
            CalcArea := Sqrt(p_half * (p_half - A) * (p_half - B) * (p_half - C));
          end;
        end;

        csPentagon:
        begin
          Side := cxPentagonHeight.Value;
          if Side > 0 then
          begin
            var R: Double := Side / (2 * Sin(Pi / 5));
            var MinX: Double := 999999;
            var MinY: Double := 999999;
            var Px, Py: array[0..4] of Double;

            // 1. Спочатку генеруємо сирі координати і шукаємо мінімальні
            for I := 0 to 4 do
            begin
              var Angle: Double := -Pi/2 + I * (2 * Pi / 5);
              Px[I] := R * Cos(Angle);
              Py[I] := R * Sin(Angle);
              if Px[I] < MinX then MinX := Px[I];
              if Py[I] < MinY then MinY := Py[I];
            end;

            // 2. Додаємо точки, зміщені до початку координат (0,0)
            for I := 0 to 4 do
              AddPoint(Px[I] - MinX, Py[I] - MinY);

            CalcArea := (Sqr(Side) * Sqrt(25 + 10 * Sqrt(5))) / 4;
          end;
        end;

      csHexagon:
        begin
          Side := cxHexagonSide.Value;
          if Side > 0 then
          begin
            var R: Double := Side;
            var MinX: Double := 999999;
            var MinY: Double := 999999;
            var Px, Py: array[0..5] of Double;

            // 1. Рахуємо координати та шукаємо найменші X та Y для зміщення
            for I := 0 to 5 do
            begin
              var Angle: Double := -Pi/2 + I * (Pi / 3);
              Px[I] := R * Cos(Angle);
              Py[I] := R * Sin(Angle);
              if Px[I] < MinX then MinX := Px[I];
              if Py[I] < MinY then MinY := Py[I];
            end;

            // 2. Додаємо зміщені точки до JSON
            for I := 0 to 5 do
              AddPoint(Px[I] - MinX, Py[I] - MinY);

            CalcArea := (3 * Sqrt(3) / 2) * Sqr(Side);
          end;
        end;

      csTrapeze:
        begin
          // ПРИБРАЛИ var та : Double
          A := cxTrapezeBottom.Value;
          B := cxTrapezeTop.Value;
          H := cxTrapezeHeight.Value;

          if (A > 0) and (B > 0) and (H > 0) then
          begin
            var ShiftTop: Double := (A - B) / 2.0;

            var BaseShift: Double := 0;
            if ShiftTop < 0 then BaseShift := Abs(ShiftTop);

            AddPoint(BaseShift, H);                    // Ліва нижня
            AddPoint(BaseShift + A, H);                // Права нижня
            AddPoint(BaseShift + A - ShiftTop, 0);     // Права верхня
            AddPoint(BaseShift + ShiftTop, 0);         // Ліва верхня

            CalcArea := ((A + B) / 2.0) * H;
          end;
        end;

      csCircle:
        begin
          var R: Double := cxCircleRadius.Value;
          if R > 0 then
          begin
            var PointsCount: Integer := 36; // 36 точок = кожні 10 градусів

            for I := 0 to PointsCount - 1 do
            begin
              var Angle: Double := I * (2 * Pi / PointsCount);
              // Центр кола лежить у точці (R, R), щоб координати починалися з 0
              AddPoint(R + R * Cos(Angle), R + R * Sin(Angle));
            end;

            CalcArea := Pi * Sqr(R);
          end;
        end;

      csEllipse:
        begin
          W := cxEllipseWidth.Value;
          H := cxEllipseHeight.Value;

          if (W > 0) and (H > 0) then
          begin
            var PointsCount: Integer := 36;
            var Rx: Double := W / 2.0; // Піввісь X
            var Ry: Double := H / 2.0; // Піввісь Y

            for I := 0 to PointsCount - 1 do
            begin
              var Angle: Double := I * (2 * Pi / PointsCount);
              // Центр лежить у точці (Rx, Ry)
              AddPoint(Rx + Rx * Cos(Angle), Ry + Ry * Sin(Angle));
            end;

            CalcArea := Pi * Rx * Ry;
          end;
        end;

      csRhombus:
        begin
          W := cxRhombusDiagH.Value;
          H := cxRhombusDiagV.Value;

          if (W > 0) and (H > 0) then
          begin
            AddPoint(W / 2.0, H);        // Верхня точка
            AddPoint(W, H / 2.0);        // Права точка
            AddPoint(W / 2.0, 0);        // Нижня точка
            AddPoint(0, H / 2.0);        // Ліва точка

            CalcArea := (W * H) / 2.0;
          end;
        end;

      csParallelogram:
        begin
          A := cxParallelogramBase.Value;
          B := cxParallelogramSide.Value;
          var AngleDeg: Double := cxParallelogramAngle.Value;

          if (A > 0) and (B > 0) and (AngleDeg > 0) and (AngleDeg < 180) then
          begin
            var Rad: Double := AngleDeg * Pi / 180.0;
            var H_shape: Double := B * Sin(Rad);
            var DX: Double := B * Cos(Rad);

            if AngleDeg <= 90 then
            begin
              AddPoint(0, H_shape);
              AddPoint(A, H_shape);
              AddPoint(A + DX, 0);
              AddPoint(DX, 0);
            end
            else
            begin
              var Shift: Double := Abs(DX);
              AddPoint(Shift, H_shape);
              AddPoint(Shift + A, H_shape);
              AddPoint(A, 0);
              AddPoint(0, 0);
            end;

            CalcArea := A * H_shape;
          end;
        end;

      csCustom:
        begin
          // Якщо намальовано довільну фігуру
          if FPoints.Count > 2 then
          begin
            for I := 0 to FPoints.Count - 1 do
              AddPoint(FPoints[I].X, FPoints[I].Y);

            // Формула площі Гауса (Shoelace formula) для довільного багатокутника
            J := FPoints.Count - 1;
            for I := 0 to FPoints.Count - 1 do
            begin
              CalcArea := CalcArea + (FPoints[J].X + FPoints[I].X) * (FPoints[J].Y - FPoints[I].Y);
              J := I;
            end;
            CalcArea := Abs(CalcArea) / 2.0;
          end;
        end;
    end;

    // Переводимо датасет у режим редагування (якщо він ще не там)
    if not (spDataField.State in [dsEdit, dsInsert]) then
      spDataField.Edit;

    // Записуємо згенерований JSON та розраховану площу в поля датасету
    spDataField.FieldByName('GEOMETRY_JSON').AsString := JSONArray.ToString;
    spDataField.FieldByName('AREA').AsFloat := CalcArea;

  finally
    JSONArray.Free; // Обов'язково очищаємо пам'ять
  end;
end;

procedure TfmParts_Ch.OnDataSetChange(DataSet: TDataSet);
begin
  FormModify := true;
end;

function TfmParts_Ch.CheckDataForErrors(): Boolean;
begin
  var
    Res: Boolean := false;

  // Твоя існуюча перевірка на пусте ім'я
  if mainModule.IFNull(spDataField.FieldValues['NAME'], '') = '' then
  begin
    mainModule.ShowMessage(Self, 'Необхідно вказати "Найменування"', '');
    edName.SetFocus;
    Res := true;
  end;

  // ---> НОВА ПЕРЕВІРКА ГЕОМЕТРІЇ <---
  if not Res then
  begin
    // Якщо розрахована площа <= 0 (а ми її обнуляємо при помилках розмірів)
    if mainModule.IFNull(spDataField.FieldValues['AREA'], 0.0) <= 0 then
    begin
      mainModule.ShowMessage(Self, 'Неможливо зберегти! Деталь має нульову площу або введені некоректні розміри.', '', TTypeMessage.Error);
      Res := true;
    end;
  end;

  Result := Res;
end;

procedure TfmParts_Ch.aSaveExecute(Sender: TObject);
begin
  UpdateGeometryFields;

  if spDataField.State <> dsBrowse then
    spDataField.Post;

  FormCanClose := false;

  if CheckDataForErrors then
    exit;

  mainModule.cnFBConnectWrite.StartTransaction;
  try
    spSaveForm.Params.ParamByName('ID').AsInteger     := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
    spSaveForm.Params.ParamByName('NAME').AsString    := mainModule.IFNull(spDataField.FieldValues['NAME'], '');
    spSaveForm.Params.ParamByName('DEL').AsBoolean    := mainModule.IFNull(spDataField.FieldValues['DEL'], false);

    spSaveForm.Params.ParamByName('GEOMETRY_JSON').AsString      := mainModule.IFNull(spDataField.FieldValues['GEOMETRY_JSON'], '');
    spSaveForm.Params.ParamByName('AREA').asFloat                := mainModule.IFNull(spDataField.FieldValues['AREA'], 0);
    spSaveForm.Params.ParamByName('NOTES').AsString              := mainModule.IFNull(spDataField.FieldValues['NOTES'], '');

    spSaveForm.Params.ParamByName('CURRENT_USER_ID').AsInteger := gbSysIDUserName;

    spSaveForm.ExecProc;

    if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    begin
      ID := spSaveForm.Params.ParamByName('IDOUT').AsInteger;
    end;

    mainModule.cnFBConnectWrite.Commit;
  except
    on E: Exception do
    begin
      mainModule.cnFBConnectWrite.Rollback;
      mainModule.ShowMessage(Self, 'Неможливо виконати збереження даних' + #13 + E.Message, '', TTypeMessage.Error);
      exit;
    end;
  end;

  /// //////////////////////////////////////////////////////////
  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
  begin
    if spDataField.State <> dsEdit then
      spDataField.Edit;
    spDataField.FieldValues['ID'] := ID;
    spDataField.Post;

    Caption   := mCaption + ' ' + spDataField.FieldValues['NAME'];
    Operation := FormOperation.Edit;
  end;
  /// ///////////////////////////////////////////////////////////
  FormCanClose := true;
  FormModify   := false;
  Operation    := FormOperation.Edit;


  if Assigned(mainModule.spREF_PARTS) and mainModule.spREF_PARTS.Active then
    mainModule.spREF_PARTS.Refresh
  else if Assigned(mainModule.spREF_PARTS) then
    mainModule.spREF_PARTS.Open;

  /// Оновити датасет списку
  if Assigned(Owner) and (Owner.ClassName = 'TfmParts') then
    (Owner as TfmParts).spList.Refresh;

end;

procedure TfmParts_Ch.bbClearShapeClick(Sender: TObject);
begin
  FPoints.Clear;      // Видаляємо всі точки
  FIsDrawing := True; // Вмикаємо режим очікування нових кліків
  RedrawCanvas;
end;

procedure TfmParts_Ch.bbCloseShapeClick(Sender: TObject);
begin
  // Перевіряємо, чи режим малювання активний і чи є хоча б 3 точки (для площини)
  if FIsDrawing and (FPoints.Count >= 3) then
  begin
    FIsDrawing := False; // Перемикаємо прапорець (це дасть сигнал RedrawCanvas залити фігуру)
    RedrawCanvas;
  end
  else if FIsDrawing and (FPoints.Count < 3) then
  begin
    mainModule.ShowMessage(Self, 'Потрібно поставити мінімум 3 точки!', '', TTypeMessage.Warning);
  end;
end;

procedure TfmParts_Ch.cbShapeTypePropertiesChange(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := cbShapeType.ItemIndex;
  FCurrentShape := TCurrentShape(cbShapeType.ItemIndex);

  edName.Properties.ReadOnly := (FCurrentShape <> csCustom);
  if FCurrentShape <> csCustom then
    edName.Style.Color := clBtnFace
  else
    edName.Style.Color := clWindow;

  RedrawCanvas;
end;

procedure TfmParts_Ch.aConfirmExecute(Sender: TObject);
begin
  aSaveExecute(nil);

  if FormCanClose then
    Close;
end;

procedure TfmParts_Ch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmParts_Ch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (spDataField.Active) and (spDataField.State <> dsBrowse) then
    spDataField.Post;

  inherited CloseQuery(Sender, CanClose, aSave);
end;

procedure TfmParts_Ch.FormDestroy(Sender: TObject);
begin
  FPoints.Free;
end;

procedure TfmParts_Ch.FormShow(Sender: TObject);
begin
  if Operation = FormOperation.Edit then
  begin
    LoadGeometryFromJSON;
  end
  else if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
  begin
    // Якщо це нова деталь - примусово ставимо Квадрат (індекс 0)
    if Assigned(cbShapeType) then
    begin
      cbShapeType.ItemIndex := 0;
      // Викликаємо зміну, щоб перемкнути сторінку і відмалювати
      cbShapeTypePropertiesChange(cbShapeType);
    end;
  end;
end;

end.
