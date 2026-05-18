object fmCategories_Ch: TfmCategories_Ch
  Left = 0
  Top = 0
  Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
  ClientHeight = 99
  ClientWidth = 746
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000040000C30E0000C30E000000000000000000003838
    382D363636763737377737373777373737773737377737373777373737773737
    37773636367E4D6146CE5A784DFC56704BED40473D9E32323219000000003C3F
    52E8434869FF414663FF414663FF414663FF414663FF414663FF414663FF4046
    55FF6D9C5AFF84C769FF84C769FF84C769FF7FBE66FF4D6245E23A3A3A1A4044
    5DFF7E7E82FFC2C2C2FFA2A2A2FFB4B4B4FFE4E4E4FFE4E4E4FFC7C7C7FF6185
    52FF84C769FF648B54FF80C066FF84C769FF84C769FF7FBE66FF3F473CA04044
    5DFF88898DFF898582FFBFB5ADFF89847EFFEDEDEDFF959595FF969696FF7DBA
    64FF81C167FF6C9A5AFF57724CFF83C669FF84C769FF84C769FF566F4BF04044
    5DFF88898DFF948F8BFFB4ABA3FF565351FFE9E9E9FFADADADFF989898FF83C4
    68FF84C769FF84C769FF75AB5FFF5D7F50FF84C769FF84C769FF5A784EFE4044
    5DFF88898DFFB5B4B4FF949493FF969595FFE0E0E0FFF5F5F5FFBBBBBBFF73A7
    5EFF84C769FF84C769FF84C769FF6B9859FF699558FF84C769FF4D6046D34044
    5DFF88898DFF979695FF95908CFF868482FFF5F5F5FFBDBDBDFFCCCCCCFF6778
    60FF83C468FF84C769FF84C769FF84C769FF81C167FF6D9C5AFF3538355F4044
    5DFF88898DFF95908CFF9D9690FF7A7570FFEFEFEFFFD7D7D7FFE5E5E5FFE0E0
    E0FF677860FF73A75EFF83C468FF7DBA64FF608551FD3C403A82000000004044
    5DFF88898DFF868482FFA19992FF4C4B4AFFD3D3D3FF959595FF949494FF9797
    97FFF6F6F6FF50525CFF3D4051BF363636743939392800000000000000004044
    5DFF88898DFFCFCFCFFFA2A2A2FFBBBBBBFFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFF585B6DFF3D4052B3000000000000000000000000000000004044
    5DFF88898DFF8B8784FFC3BAB0FF8E8882FFECECECFF959595FF959595FFE9E9
    E9FFFFFFFFFF585B6DFF3B3E4DBB000000000000000000000000000000004044
    5DFF88898DFF928E8AFFBDB4ABFF555351FFE8E8E8FF959595FF949494FF9494
    94FFE2E2E2FF585B6DFF3B3E4DBB000000000000000000000000000000004044
    5DFF88898DFFBDBDBDFF949494FF9E9E9EFFE2E2E2FFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFF585B6DFF3B3E4DBB000000000000000000000000000000003F43
    5BFD565966FF7C7E85FF7C7E85FF797671FF8E877DFF8E877DFF747374FF7C7E
    85FF7C7E85FF494D68FF3C3E4BB900000000000000000000000000000000383A
    41903F425AED3F4359EE3F4359EE706A62FDDECDB7FFCEBEAAFF515052F93F43
    59EE3F4359EE3D4257E738383856000000000000000000000000000000000000
    00000000000000000000000000003636362F6A655FE157544FB4323232190000
    0000000000000000000000000000000000000000000000000000000000000001
    0000000000000000000000000000000000000000000000000000000100000003
    0000000F0000000F0000000F0000000F0000000F0000000F0000F0FF0000}
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    746
    99)
  TextHeight = 17
  object Label4: TLabel
    Left = 8
    Top = 72
    Width = 57
    Height = 17
    Caption = #1055#1088#1080#1084#1110#1090#1082#1080':'
  end
  object Label1: TLabel
    Left = 8
    Top = 41
    Width = 90
    Height = 17
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103':'
  end
  object Label2: TLabel
    Left = 614
    Top = 41
    Width = 26
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1050#1086#1076':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 33
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
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
    Left = 123
    Top = 38
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = dsDataField
    Properties.ReadOnly = False
    Style.BorderStyle = ebsUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'MySkinWhite'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'MySkinWhite'
    StyleFocused.BorderColor = 15381630
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'MySkinWhite'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'MySkinWhite'
    TabOrder = 1
    Width = 477
  end
  object edNotes: TcxDBTextEdit
    Left = 123
    Top = 69
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'NOTES'
    DataBinding.DataSource = dsDataField
    Style.BorderStyle = ebsUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'MySkinWhite'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'MySkinWhite'
    StyleFocused.BorderColor = 15381630
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'MySkinWhite'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'MySkinWhite'
    TabOrder = 2
    Width = 477
  end
  object edKod: TcxDBTextEdit
    Left = 646
    Top = 38
    TabStop = False
    Anchors = [akTop, akRight]
    DataBinding.DataField = 'ID'
    DataBinding.DataSource = dsDataField
    Properties.ReadOnly = True
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'MySkinWhite'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'MySkinWhite'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'MySkinWhite'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'MySkinWhite'
    TabOrder = 3
    Width = 92
  end
  object spDataField: TFDQuery
    CachedUpdates = True
    Connection = mainModule.cnFBConnect
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'select * from REF_Categories where id=:id')
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
    StoredProcName = 'REF_CATEGORIES_IU'
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
        Size = 100
      end
      item
        Position = 3
        Name = 'NOTES'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end
      item
        Position = 4
        Name = 'DEL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'CURRENT_USER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
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
