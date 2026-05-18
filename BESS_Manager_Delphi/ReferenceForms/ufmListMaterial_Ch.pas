unit ufmListMaterial_Ch;

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
  Vcl.ExtCtrls, MySkinWhite, cxCurrencyEdit, cxCheckBox, dxSkinOffice2013White;

const
  mCaption = 'Листовий матеріал: ';

type
  TfmListMaterial_Ch = class(TfmBaseObjectForm)
    spDataField: TFDQuery;
    dsDataField: TDataSource;
    spSaveForm: TFDStoredProc;
    Panel1: TPanel;
    Label1: TLabel;
    edName: TcxDBTextEdit;
    edKod: TcxDBTextEdit;
    Label2: TLabel;
    alListActions: TActionList;
    aConfirm: TAction;
    aSave: TAction;
    bbSave: TcxButton;
    bbConfirm: TcxButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edNotes: TcxDBTextEdit;
    edLength: TcxDBCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    edWIDTH: TcxDBCurrencyEdit;
    edCost_Per_M2: TcxDBCurrencyEdit;
    edIs_Roll: TcxDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aConfirmExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure OnDataSetChange(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edIs_RollPropertiesEditValueChanged(Sender: TObject);
    procedure edLengthPropertiesEditValueChanged(Sender: TObject);
    procedure edWIDTHPropertiesEditValueChanged(Sender: TObject);
  private
    function CheckDataForErrors(): Boolean;
    procedure UpdateRollState;
    procedure AutoGenerateName;
  public
    constructor Create(AOwner: TComponent; Param: TStructure = nil; Sender: TObject = nil; AFormStyle: TFormStyle = fsMDIChild); reintroduce;
  end;

var
  fmListMaterial_Ch: TfmListMaterial_Ch;
  OwnSender: TObject;

implementation

uses ufmListMaterial;

{$R *.dfm}

constructor TfmListMaterial_Ch.Create(AOwner: TComponent; Param: TStructure; Sender: TObject; AFormStyle: TFormStyle);
begin
  inherited Create(AOwner, Param, Sender, AFormStyle, TFormClass(Self.ClassType));
  OwnSender := Sender;

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
  mainModule.EditReadOnly(edName, clWhite, clHotLight);

  edIs_Roll.Properties.OnEditValueChanged := edIs_RollPropertiesEditValueChanged;

  UpdateRollState();

  if (spDataField.State = dsEdit) or (spDataField.State = dsInsert) then
    spDataField.Post;
  FormModify            := false;
  spDataField.AfterPost := OnDataSetChange;

  ShowThisForm();
end;

procedure TfmListMaterial_Ch.edIs_RollPropertiesEditValueChanged(Sender: TObject);
begin
  UpdateRollState();
end;

procedure TfmListMaterial_Ch.edLengthPropertiesEditValueChanged(Sender: TObject);
begin
  (Sender as TcxCustomEdit).PostEditValue;
  AutoGenerateName;
end;

procedure TfmListMaterial_Ch.edWIDTHPropertiesEditValueChanged(Sender: TObject);
begin
  (Sender as TcxCustomEdit).PostEditValue;
  AutoGenerateName;
end;

procedure TfmListMaterial_Ch.OnDataSetChange(DataSet: TDataSet);
begin
  FormModify := true;
end;

function TfmListMaterial_Ch.CheckDataForErrors(): Boolean;
begin
  var
    Res: Boolean := false;

    // Якщо це новий документ
  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
    begin

    end;

  if not Res then
    begin
      if mainModule.IFNull(spDataField.FieldValues['NAME'], '') = '' then
        begin
           mainModule.ShowMessage(Self, 'Необхідно вказати "Найменування"', '');
           edName.SetFocus;
           Res := true;
        end;
    end;

  Result := Res;
end;

procedure TfmListMaterial_Ch.aSaveExecute(Sender: TObject);
begin
  if spDataField.State <> dsBrowse then
    spDataField.Post;

  FormCanClose := false;

  if CheckDataForErrors then
    exit;

  mainModule.cnFBConnectWrite.StartTransaction;
  try
    try
      // Не треба ніяких spSaveForm.Transaction := ...
      spSaveForm.Params.ParamByName('ID').AsInteger    := mainModule.IFNull(spDataField.FieldValues['ID'], -1);
      spSaveForm.Params.ParamByName('NAME').AsString   := mainModule.IFNull(spDataField.FieldValues['NAME'], '');
      spSaveForm.Params.ParamByName('DEL').AsBoolean   := mainModule.IFNull(spDataField.FieldValues['DEL'], false);
      spSaveForm.Params.ParamByName('IS_ROLL').AsBoolean       := mainModule.IFNull(spDataField.FieldValues['IS_ROLL'], false);
      spSaveForm.Params.ParamByName('LENGTH').AsInteger        := mainModule.IFNull(spDataField.FieldValues['LENGTH'], 0);
      spSaveForm.Params.ParamByName('WIDTH').AsInteger         := mainModule.IFNull(spDataField.FieldValues['WIDTH'], 0);
      spSaveForm.Params.ParamByName('COST_PER_M2').AsInteger   := mainModule.IFNull(spDataField.FieldValues['COST_PER_M2'], 0);
      spSaveForm.Params.ParamByName('NOTES').AsString          := mainModule.IFNull(spDataField.FieldValues['NOTES'], '');
      spSaveForm.Params.ParamByName('CURRENT_USER_ID').AsInteger := gbSysIDUserName;

      spSaveForm.ExecProc;

      if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
      begin
        ID := spSaveForm.Params.ParamByName('IDOUT').AsInteger;
      end;

      // 2. Комітимо транзакцію підключення
      mainModule.cnFBConnectWrite.Commit;
    except
      on E: Exception do
      begin
        // 3. Якщо помилка - відкочуємо
        mainModule.cnFBConnectWrite.Rollback;
        mainModule.ShowMessage(Self, 'Неможливо виконати збереження даних' + #13#10 + E.Message, '', TTypeMessage.Error);
        exit;
      end;
    end;
  finally

  end;

  /// Оновлення локального датасету після збереження
  if (Operation = FormOperation.Add) or (Operation = FormOperation.AddCopy) then
  begin
    if spDataField.State <> dsEdit then
      spDataField.Edit;
    spDataField.FieldValues['ID'] := ID;
    spDataField.Post;

    Caption := mCaption + ' ' + spDataField.FieldValues['NAME'];
    Operation := FormOperation.Edit;
  end;

  FormCanClose := true;
  FormModify   := false;
  Operation    := FormOperation.Edit;

  // Оновлення списків
  if Assigned(mainModule.spREF_MATERIALS) and mainModule.spREF_MATERIALS.Active then
    mainModule.spREF_MATERIALS.Refresh
  else if Assigned(mainModule.spREF_MATERIALS) then
    mainModule.spREF_MATERIALS.Open;

  if Owner.ClassName = 'TfmListMaterial' then
    (Owner as TfmListMaterial).spList.Refresh;
end;

procedure TfmListMaterial_Ch.aConfirmExecute(Sender: TObject);
begin
  aSaveExecute(nil);

  if FormCanClose then
    Close;
end;

procedure TfmListMaterial_Ch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfmListMaterial_Ch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (spDataField.Active) and (spDataField.State <> dsBrowse) then
    spDataField.Post;

  inherited CloseQuery(Sender, CanClose, aSave);
end;

procedure TfmListMaterial_Ch.UpdateRollState;
var
  IsRoll: Boolean;
begin
  // 1. Читаємо НАПРЯМУ з візуального елемента, як ти і казав
  IsRoll := edIs_Roll.Checked;

  // 2. Одразу робимо візуальні зміни (блокуємо/розблоковуємо поле)
  if IsRoll then
  begin
    mainModule.EditReadOnly(edLENGTH, clWhite, clHotLight, true);
  end
  else
  begin
    mainModule.EditReadOnly(edLENGTH, clWindow, clWindowText, false);
  end;

  // 3. Змінюємо дані в датасеті ТІЛЬКИ якщо це реальний клік користувача
  // (тобто чекбокс має фокус), а не просто відкриття форми.
  if edIs_Roll.Focused then
  begin
    // ПРИМУСОВО записуємо стан галочки в буфер датасету,
    // щоб датасет не "відкинув" її назад при зміні поля LENGTH
    edIs_Roll.PostEditValue;

    if IsRoll then
    begin
      if spDataField.State = dsBrowse then
        spDataField.Edit;

      spDataField.FieldValues['LENGTH'] := 0;

      AutoGenerateName;
    end;
  end;
end;

procedure TfmListMaterial_Ch.AutoGenerateName;
var
  vType: string;
  vW, vL: Double;
begin
  if not (spDataField.State in dsEditModes) then
    spDataField.Edit;

  if spDataField.FieldByName('IS_ROLL').AsBoolean then
    vType := 'Рулон'
  else
    vType := 'Аркуш';

  vW := spDataField.FieldByName('WIDTH').AsFloat;
  vL := spDataField.FieldByName('LENGTH').AsFloat;

  spDataField.FieldByName('NAME').AsString := Format('%s %gх%g', [vType, vW, vL]);
end;

end.
