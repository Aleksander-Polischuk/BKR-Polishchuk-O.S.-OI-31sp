unit ufmJRN_Nesting_Tasks_Detail;

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
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel,
  dxLayoutContainer, cxGridTableView, cxGridCustomTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  System.IOUtils;

const
  mCaption = 'Деталі завдання на розкрій';

type
  TfmJRN_Nesting_Tasks_Detail = class(TfmBaseObjectForm)
    spDataField: TFDQuery;
    dsDataField: TDataSource;
    spSaveForm: TFDStoredProc;
    Panel1: TPanel;
    cxButton1: TcxButton;
    alListActions: TActionList;
    aConfirm: TAction;
    Splitter1: TSplitter;
    gList: TcxGrid;
    gListDBTableView: TcxGridDBTableView;
    gListDBTableViewID: TcxGridDBColumn;
    gListDBTableViewQUANTITY: TcxGridDBColumn;
    gListDBTableViewRootGroup: TcxGridTableRowLayoutGroup;
    gListLevel1: TcxGridLevel;
    gListDBTableViewNAME: TcxGridDBColumn;
    gListDBTableViewESTIMATED_TIME_MINS: TcxGridDBColumn;
    gListDBTableViewESTIMATED_COST: TcxGridDBColumn;
    gListDBTableViewColumn1: TcxGridDBColumn;
    edFactDate: TcxDBDateEdit;
    Label1: TLabel;
    aLookSVG: TAction;
    cxButton2: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnDataSetChange(DataSet: TDataSet);
    procedure aConfirmExecute(Sender: TObject);
    procedure aLookSVGExecute(Sender: TObject);
  private
    //
  public
    constructor Create(AOwner: TComponent; Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsStayOnTop); reintroduce;
    procedure LoadBatch(ABatchID: Integer);
  end;

var
  fmJRN_Nesting_Tasks_Detail: TfmJRN_Nesting_Tasks_Detail;
  OwnSender: TObject;

implementation

uses ufmJRN_Nesting_Tasks, Winapi.ShellAPI;

{$R *.dfm}

procedure TfmJRN_Nesting_Tasks_Detail.aConfirmExecute(Sender: TObject);
var
  vMsg: string;
  vFactTime: TDateTime;
  vBatchID, NewTariffID: Integer;
  NewTariffPrice: Double;
  qTariff: TFDQuery;
begin
  if spDataField.IsEmpty then Exit;

  if spDataField.FieldByName('STATUS').AsInteger = 1 then
  begin
    mainModule.ShowMessage(Self, 'Це завдання вже виконано!', '');
    Exit;
  end;

  vBatchID := spDataField.FieldByName('BATCH_ID').AsInteger;

  // Беремо дату та час виконання з нашого нового компонента на формі
  vFactTime := edFactDate.Date;

  vMsg := 'Підтвердити виконання партії №' + IntToStr(vBatchID) + '?' + sLineBreak +
          'Фактичний час: ' + FormatDateTime('dd.mm.yyyy hh:nn', vFactTime) + sLineBreak +
          'Вартість буде перераховано за тарифом на вказаний час.';

  if mainModule.ShowQuestionYesNo(Self, vMsg, 'Виконання завдання') then
  begin
    // 1. ШУКАЄМО АКТУАЛЬНИЙ ТАРИФ НА ФАКТИЧНУ ДАТУ
    qTariff := TFDQuery.Create(nil);
    try
      qTariff.Connection := mainModule.cnFBConnect;
      // ВИПРАВЛЕНО: ID AS TARIFF_ID
      qTariff.SQL.Text :=
        'SELECT FIRST 1 ID AS TARIFF_ID, PRICE_PER_KWH FROM REF_ENERGY_TARIFFS ' +
        'WHERE DEL = FALSE ' +
        '  AND CAST(:P_DATE AS DATE) BETWEEN DATE_START AND COALESCE(DATE_END, ''2099-12-31'') ' +
        '  AND CAST(:P_DATE AS TIME) BETWEEN TIME_START AND TIME_END';
      qTariff.ParamByName('P_DATE').AsDateTime := vFactTime;
      qTariff.Open;

      if qTariff.IsEmpty then
      begin
        mainModule.ShowMessage(Self, 'Помилка: На вказану дату та час (' +
          FormatDateTime('hh:nn', vFactTime) + ') не знайдено діючого тарифу!', '', TTypeMessage.Error);
        Exit;
      end;

      NewTariffID := qTariff.FieldByName('TARIFF_ID').AsInteger;
      NewTariffPrice := qTariff.FieldByName('PRICE_PER_KWH').AsFloat;
    finally
      qTariff.Free;
    end;

    // 2. ЗБЕРІГАЄМО ТА ПЕРЕРАХОВУЄМО
    mainModule.cnFBConnectWrite.StartTransaction;
    try
      spDataField.First;
      while not spDataField.Eof do
      begin
        // Оприбутковуємо на склад (передаємо новий ID тарифу)
        mainModule.cnFBConnectWrite.ExecSQL(
          'EXECUTE PROCEDURE JRN_PARTS_MOVEMENT_IU(:I_ID, :I_ID_PART, :I_OP_DATE, :I_OP_TYPE, :I_QUANTITY, ' +
          ':I_ID_REF_MACHINE, :I_ENERGY_KWH, :I_ID_TARIFF, :I_NOTES, :I_ID_USER)',
          [-1,
           spDataField.FieldByName('ID_PART').AsInteger,
           vFactTime, // Фактичний час замість Now
           1,
           spDataField.FieldByName('QUANTITY').AsInteger,
           spDataField.FieldByName('ID_REF_MACHINE').AsInteger,
           0,
           NewTariffID, // Збережеться новий тариф
           'Виконано з партії № ' + IntToStr(vBatchID),
           gbSysIDUserName]
        );
        spDataField.Next;
      end;

      // МАГІЯ ТУТ: Оновлюємо статус і змушуємо базу саму перерахувати вартість!
      mainModule.cnFBConnectWrite.ExecSQL(
        'UPDATE JRN_NESTING_TASKS T ' +
        'SET ' +
        '  STATUS = 1, ' +
        '  FACT_DATE = :F_DATE, ' +
        '  ID_TARIFF = :NEW_TARIFF, ' +
        '  ESTIMATED_COST = (T.ESTIMATED_TIME_MINS / 60.0) * ' +
        '                   (SELECT M.POWER_NOMINAL FROM REF_MACHINE M WHERE M.ID = T.ID_REF_MACHINE) * :NEW_PRICE ' +
        'WHERE BATCH_ID = :B_ID',
        [vFactTime, NewTariffID, NewTariffPrice, vBatchID]
      );

      mainModule.cnFBConnectWrite.Commit;

      mainModule.ShowMessage(Self, 'Завдання успішно виконано, а вартість перераховано!', '');

      if Assigned(OwnSender) and (OwnSender is TfmJRN_Nesting_Tasks) then
        (OwnSender as TfmJRN_Nesting_Tasks).aRefresh.Execute;

      Close;
    except
      on E: Exception do
      begin
        mainModule.cnFBConnectWrite.Rollback;
        mainModule.ShowMessage(Self, 'Помилка виконання: ' + E.Message, '', TTypeMessage.Error);
      end;
    end;
  end;
end;

procedure TfmJRN_Nesting_Tasks_Detail.aLookSVGExecute(Sender: TObject);
var
  q: TFDQuery;
  BatchID: Integer;
  TempFile: string;
  SvgText: string;
begin
  if spDataField.IsEmpty then Exit;
  BatchID := spDataField.FieldByName('BATCH_ID').AsInteger;

  if BatchID = 0 then
  begin
    mainModule.ShowMessage(Self, 'Це завдання ще не має сформованої карти розкрою.', 'Увага', TTypeMessage.Warning);
    Exit;
  end;

  q := TFDQuery.Create(nil);
  try
    q.Connection := mainModule.cnFBConnect;
    q.SQL.Text := 'SELECT RESULT_SVG FROM JRN_NESTING_CACHE WHERE ID = :ID';
    q.ParamByName('ID').AsInteger := BatchID;
    q.Open;

    if (not q.IsEmpty) and (not q.FieldByName('RESULT_SVG').IsNull) then
    begin
      TempFile := TPath.Combine(TPath.GetTempPath, 'nesting_map_' + IntToStr(BatchID) + '.svg');

      // МАГІЯ ТУТ: Читаємо як рядок і зберігаємо у файл як примусовий UTF-8
      SvgText := q.FieldByName('RESULT_SVG').AsString;
      TFile.WriteAllText(TempFile, SvgText, TEncoding.UTF8);

      // Відкриваємо SVG у новій вкладці стандартного браузера
      ShellExecute(0, 'open', PChar(TempFile), nil, nil, SW_SHOWMAXIMIZED);
    end
    else
    begin
      mainModule.ShowMessage(Self, 'Для цього завдання не знайдено збереженого SVG у базі (JRN_NESTING_CACHE).', 'Помилка', TTypeMessage.Error);
    end;
  finally
    q.Free;
  end;
end;

constructor TfmJRN_Nesting_Tasks_Detail.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;

  if FormIsClosed then exit;

  Tag := mainModule.GetIDForm;

  ShowThisForm();
end;

procedure TfmJRN_Nesting_Tasks_Detail.LoadBatch(ABatchID: Integer);
begin
  spDataField.DisableControls;
  try
    try
      spDataField.Close;
      spDataField.ParamByName('P_BATCH_ID').AsInteger := ABatchID;
      spDataField.Open;

      if not spDataField.IsEmpty then
      begin
        if spDataField.FieldByName('STATUS').AsInteger = 1 then
          aConfirm.Enabled := False
        else
        begin
          aConfirm.Enabled := True;

          // --- ДОДАНО: Автоматичне заповнення поточним часом ---
          // Якщо завдання не виконане і дата порожня - ставимо зараз (Now)
          spDataField.First;
          while not spDataField.Eof do
          begin
            if spDataField.FieldByName('FACT_DATE').IsNull then
            begin
              spDataField.Edit;
              spDataField.FieldByName('FACT_DATE').AsDateTime := Now;
              spDataField.Post; // Зберігаємо в кеш (CachedUpdates)
            end;
            spDataField.Next;
          end;
          spDataField.First;
          // -----------------------------------------------------
        end;
      end
      else
        aConfirm.Enabled := False;

    except
      on E: Exception do
      begin
        mainModule.ShowMessage(Self, 'Помилка завантаження списку деталей: ' + sLineBreak + E.Message, '', TTypeMessage.Error);
      end;
    end;
  finally
    spDataField.EnableControls;
  end;

  Caption := mCaption + ' ' + IntToStr(ABatchID);
end;

procedure TfmJRN_Nesting_Tasks_Detail.OnDataSetChange(DataSet: TDataSet);
begin
  FormModify := true;
end;

procedure TfmJRN_Nesting_Tasks_Detail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

end.
