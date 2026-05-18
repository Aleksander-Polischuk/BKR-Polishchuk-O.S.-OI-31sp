object fmListEmployees_Ch: TfmListEmployees_Ch
  Left = 0
  Top = 0
  Caption = #1057#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082
  ClientHeight = 143
  ClientWidth = 882
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000040000C30E0000C30E00000000000000000000FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    FF00B5BAB5FF948E84FF948E84FF948E84FF948E84FF948E84FF948E84FF948E
    84FF948E84FF948E84FF948E84FF948E84FFB5BAB5FFFFFFFF00FFFFFF00FFFF
    FF00948E84FFFFFFFFFFFFFFFFFFFFFFFFFFADA294FFFFFFFFFFFFFFFFFFFFFF
    FFFFADA294FFFFFFFFFFFFFFFFFFFFFFFFFF948E84FFFFFFFF00FFFFFF00FFFF
    FF00948E84FFFFFFFFFFFFFFFFFFFFFFFFFF9C9284FFFFFFFFFFFFFFFFFFFFFF
    FFFF9C9284FFFFFFFFFFFFFFFFFFFFFFFFFF948E84FFFFFFFF00FFFFFF00FFFF
    FF00948E84FFFFFFFFFFFFFFFFFFFFFFFFFFA59A8CFFFFFFFFFFFFFFFFFFFFFF
    FFFFA59A8CFFFFFFFFFFFFFFFFFFFFFFFFFF948E84FFFFFFFF00FFFFFF00FFFF
    FF00948E84FFFFFFFFFFFFFFFFFFFFFFFFFFA59A8CFFFFFFFFFFFFFFFFFFFFFF
    FFFFA59A8CFFFFFFFFFFFFFFFFFFFFFFFFFF948E84FFFFFFFF00FFFFFF00FFFF
    FF00948E84FFFFFFFFFFFFFFFFFFFFFFFFFFA59A8CFFFFFFFFFFFFFFFFFFFFFF
    FFFFA59A8CFFFFFFFFFFFFFFFFFFFFFFFFFF948E84FFFFFFFF00FFFFFF00FFFF
    FF00948E84FFFFFFFFFFFFFFFFFFFFFFFFFFA59A8CFFFFFFFFFFFFFFFFFFFFFF
    FFFFA59A8CFFFFFFFFFFFFFFFFFFFFFFFFFF948E84FFFFFFFF00FFFFFF00FFFF
    FF00948E84FFFFFFFFFFFFFFFFFFFFFFFFFF9C9284FFFFFFFFFFFFFFFFFFFFFF
    FFFF9C9284FFFFFFFFFFFFFFFFFFFFFFFFFF948E84FFFFFFFF00FFFFFF00FFFF
    FF00948E84FFADA294FF948A7BFFADA69CFFA59E8CFFADA69CFF948A7BFFADA6
    9CFFA59E8CFFADA69CFF948A7BFFADA294FF948E84FFFFFFFF00FFFFFF00FFFF
    FF00948E84FF29DFFFFF29DFFFFF29DFFFFFADA294FF31D3EFFF29DFFFFF31D3
    EFFFADA294FF29DFFFFF29DFFFFF29DFFFFF948E84FFFFFFFF00FFFFFF00FFFF
    FF00948E84FF29DFFFFF29DFFFFF29DFFFFFADA294FF31D3EFFF29DFFFFF31D3
    EFFFADA294FF29DFFFFF29DFFFFF29DFFFFF948E84FFFFFFFF00FFFFFF00FFFF
    FF00B5BAB5FF948E84FF948E84FF948E84FF948E84FF948E84FF948E84FF948E
    84FF948E84FF948E84FF948E84FF948E84FFB5BAB5FFFFFFFF00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    0000FFFF00008003000080030000800300008003000080030000800300008003
    00008003000080030000800300008003000080030000FFFF0000FFFF0000}
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    882
    143)
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 49
    Width = 90
    Height = 17
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103':'
  end
  object Label2: TLabel
    Left = 750
    Top = 49
    Width = 26
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1050#1086#1076':'
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 133
    Height = 17
    Caption = #1054#1087#1083#1072#1090#1072' '#1074' '#1075#1086#1076#1080#1085#1091' ('#1075#1088#1085'):'
  end
  object Label7: TLabel
    Left = 8
    Top = 114
    Width = 57
    Height = 17
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 882
    Height = 33
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object bbSave: TcxButton
      AlignWithMargins = True
      Left = 168
      Top = 3
      Width = 95
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = aSave
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MySkinWhite'
      TabOrder = 0
    end
    object bbConfirm: TcxButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 161
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = aConfirm
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MySkinWhite'
      TabOrder = 1
    end
  end
  object edName: TcxDBTextEdit
    Left = 147
    Top = 46
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = dsDataField
    Style.BorderStyle = ebsUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Office2013White'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
    StyleFocused.BorderColor = 15381630
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Office2013White'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Office2013White'
    TabOrder = 0
    Width = 582
  end
  object edKod: TcxDBTextEdit
    Left = 782
    Top = 46
    TabStop = False
    Anchors = [akTop, akRight]
    DataBinding.DataField = 'ID'
    DataBinding.DataSource = dsDataField
    Properties.ReadOnly = True
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Office2013White'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Office2013White'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Office2013White'
    TabOrder = 4
    Width = 92
  end
  object edNotes: TcxDBTextEdit
    Left = 147
    Top = 111
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'NOTES'
    DataBinding.DataSource = dsDataField
    Properties.Alignment.Horz = taLeftJustify
    Style.BorderStyle = ebsUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Office2013White'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
    StyleFocused.BorderColor = 15381630
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Office2013White'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Office2013White'
    TabOrder = 2
    Width = 582
  end
  object edHourly_Rate: TcxDBCurrencyEdit
    Left = 147
    Top = 77
    DataBinding.DataField = 'HOURLY_RATE'
    DataBinding.DataSource = dsDataField
    Properties.Alignment.Horz = taLeftJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Office2013White'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Office2013White'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Office2013White'
    TabOrder = 1
    Width = 582
  end
  object spDataField: TFDQuery
    CachedUpdates = True
    Connection = mainModule.cnFBConnect
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'select * from REF_EMPLOYEES where id=:id')
    Left = 579
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object dsDataField: TDataSource
    DataSet = spDataField
    Left = 656
  end
  object spSaveForm: TFDStoredProc
    Connection = mainModule.cnFBConnectWrite
    StoredProcName = 'REF_EMPLOYEES_IU'
    Left = 500
    Top = 2
    ParamData = <
      item
        Position = 1
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'NAME'
        DataType = ftString
        ParamType = ptInput
        Size = 150
      end
      item
        Position = 3
        Name = 'HOURLY_RATE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'NOTES'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 5
        Name = 'DEL'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'CURRENT_USER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IDOUT'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object alListActions: TActionList
    Images = mainModule.cxImageList16
    Left = 417
    Top = 5
    object aConfirm: TAction
      Caption = #1047#1072#1087#1080#1089#1072#1090#1080' '#1090#1072' '#1079#1072#1082#1088#1080#1090#1080
      Hint = #1057#1090#1074#1086#1088#1080#1090#1080' '#1085#1086#1074#1080#1081' '#1077#1083#1077#1084#1077#1085#1090' '#1095#1077#1088#1077#1079' '#1082#1086#1087#1110#1102#1074#1072#1085#1085#1103' '#1087#1086#1090#1086#1095#1085#1086#1075#1086
      ImageIndex = 3
      OnExecute = aConfirmExecute
    end
    object aSave: TAction
      Caption = #1047#1072#1087#1080#1089#1072#1090#1080
      ImageIndex = 4
      OnExecute = aSaveExecute
    end
  end
end
