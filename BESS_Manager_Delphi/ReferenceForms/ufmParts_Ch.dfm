object fmParts_Ch: TfmParts_Ch
  Left = 0
  Top = 0
  Caption = #1044#1077#1090#1072#1083#1100
  ClientHeight = 891
  ClientWidth = 1102
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    1102
    891)
  TextHeight = 17
  object Splitter1: TSplitter
    Left = 0
    Top = 105
    Width = 1102
    Height = 4
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 137
    ExplicitWidth = 882
  end
  object Label12: TLabel
    Left = 8
    Top = 179
    Width = 121
    Height = 17
    Caption = #1044#1086#1074#1078#1080#1085#1072' '#1089#1090#1086#1088#1086#1085#1080' 1:'
  end
  object Label22: TLabel
    Left = 10
    Top = 182
    Width = 119
    Height = 17
    Caption = #1053#1080#1078#1085#1103' '#1086#1089#1085#1086#1074#1072' ('#1084#1084'):'
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 273
    Width = 1102
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 281
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1102
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
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 1102
    Height = 72
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      1102
      72)
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 90
      Height = 17
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103':'
    end
    object Label2: TLabel
      Left = 970
      Top = 9
      Width = 26
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1050#1086#1076':'
      ExplicitLeft = 750
    end
    object Label4: TLabel
      Left = 8
      Top = 40
      Width = 57
      Height = 17
      Caption = #1055#1088#1080#1084#1110#1090#1082#1080':'
    end
    object Label9: TLabel
      Left = 821
      Top = 40
      Width = 66
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1058#1080#1087' '#1092#1110#1075#1091#1088#1080':'
    end
    object cbShapeType: TcxComboBox
      Left = 893
      Top = 37
      Anchors = [akTop, akRight]
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1050#1074#1072#1076#1088#1072#1090
        #1055#1088#1103#1084#1086#1082#1091#1090#1085#1080#1082
        #1058#1088#1080#1082#1091#1090#1085#1080#1082
        #1055#39#1103#1090#1080#1082#1091#1090#1085#1080#1082
        #1064#1077#1089#1090#1080#1082#1091#1090#1085#1080#1082
        #1058#1088#1072#1087#1077#1094#1110#1103
        #1050#1086#1083#1086
        #1045#1083#1110#1087#1089
        #1056#1086#1084#1073
        #1055#1072#1088#1072#1083#1077#1083#1086#1075#1088#1072#1084
        #1044#1086#1074#1110#1083#1100#1085#1072' '#1092#1110#1075#1091#1088#1072)
      Properties.OnChange = cbShapeTypePropertiesChange
      TabOrder = 0
      Width = 204
    end
    object edName: TcxDBTextEdit
      Left = 123
      Top = 6
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'NAME'
      DataBinding.DataSource = dsDataField
      Properties.ReadOnly = True
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
      Width = 833
    end
    object edKod: TcxDBTextEdit
      Left = 1002
      Top = 6
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
      TabOrder = 2
      Width = 92
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 109
    Width = 1102
    Height = 164
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object cxPageControl1: TcxPageControl
      Left = 1
      Top = 1
      Width = 1100
      Height = 162
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = shTriangle
      Properties.CustomButtons.Buttons = <>
      OnChange = cxPageControl1Change
      ClientRectBottom = 160
      ClientRectLeft = 2
      ClientRectRight = 1098
      ClientRectTop = 2
      object shSqueare: TcxTabSheet
        Caption = #1050#1074#1072#1076#1088#1072#1090
        ImageIndex = 0
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label5: TLabel
          Left = 3
          Top = 16
          Width = 198
          Height = 17
          Caption = #1044#1086#1074#1078#1080#1085#1072' '#1089#1090#1086#1088#1086#1085#1080' '#1082#1074#1072#1076#1088#1072#1090#1072' ('#1084#1084'):'
        end
        object Label3: TLabel
          Left = 3
          Top = 47
          Width = 45
          Height = 17
          Caption = #1055#1083#1086#1097#1072':'
        end
        object cxSquareSide: TcxCurrencyEdit
          Left = 207
          Top = 13
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxSquareSidePropertiesChange
          TabOrder = 0
          Width = 216
        end
        object edAreaSquare: TcxDBCurrencyEdit
          Left = 54
          Top = 44
          DataBinding.DataField = 'AREA'
          DataBinding.DataSource = dsDataField
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = False
          Style.LookAndFeel.SkinName = 'MySkinWhite'
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.SkinName = 'MySkinWhite'
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.SkinName = 'MySkinWhite'
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.SkinName = 'MySkinWhite'
          TabOrder = 1
          Width = 331
        end
      end
      object shRectangle: TcxTabSheet
        Caption = #1055#1088#1103#1084#1086#1082#1091#1090#1085#1080#1082
        ImageIndex = 1
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label6: TLabel
          Left = 3
          Top = 16
          Width = 227
          Height = 17
          Caption = #1044#1086#1074#1078#1080#1085#1072' '#1089#1090#1086#1088#1086#1085#1080' '#1087#1088#1103#1084#1086#1082#1091#1090#1085#1080#1082#1072' ('#1084#1084'):'
        end
        object Label7: TLabel
          Left = 3
          Top = 56
          Width = 222
          Height = 17
          Caption = #1064#1080#1088#1080#1085#1072' '#1089#1090#1086#1088#1086#1085#1080' '#1087#1088#1103#1084#1086#1082#1091#1090#1085#1080#1082#1072' ('#1084#1084'):'
        end
        object Label8: TLabel
          Left = 3
          Top = 87
          Width = 45
          Height = 17
          Caption = #1055#1083#1086#1097#1072':'
        end
        object cxRectangleWidth: TcxCurrencyEdit
          Left = 236
          Top = 13
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxRectangleWidthPropertiesChange
          TabOrder = 0
          Width = 216
        end
        object cxRectangleHeight: TcxCurrencyEdit
          Left = 236
          Top = 53
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxRectangleHeightPropertiesChange
          TabOrder = 1
          Width = 216
        end
        object edAreaRectangle: TcxDBCurrencyEdit
          Left = 54
          Top = 84
          DataBinding.DataField = 'AREA'
          DataBinding.DataSource = dsDataField
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = False
          Style.LookAndFeel.SkinName = 'MySkinWhite'
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.SkinName = 'MySkinWhite'
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.SkinName = 'MySkinWhite'
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.SkinName = 'MySkinWhite'
          TabOrder = 2
          Width = 368
        end
      end
      object shTriangle: TcxTabSheet
        Caption = #1058#1088#1080#1082#1091#1090#1085#1080#1082
        ImageIndex = 2
        TabVisible = False
        object Label10: TLabel
          Left = 3
          Top = 3
          Width = 151
          Height = 17
          Caption = #1044#1086#1074#1078#1080#1085#1072' '#1089#1090#1086#1088#1086#1085#1080' 1 ('#1084#1084'):'
        end
        object Label11: TLabel
          Left = 3
          Top = 34
          Width = 151
          Height = 17
          Caption = #1044#1086#1074#1078#1080#1085#1072' '#1089#1090#1086#1088#1086#1085#1080' 2 ('#1084#1084'):'
        end
        object Label13: TLabel
          Left = 3
          Top = 65
          Width = 151
          Height = 17
          Caption = #1044#1086#1074#1078#1080#1085#1072' '#1089#1090#1086#1088#1086#1085#1080' 3 ('#1084#1084'):'
        end
        object Label14: TLabel
          Left = 3
          Top = 103
          Width = 45
          Height = 17
          Caption = #1055#1083#1086#1097#1072':'
        end
        object cxTriangleA: TcxCurrencyEdit
          Left = 160
          Top = 0
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxTriangleAPropertiesChange
          TabOrder = 0
          Width = 216
        end
        object cxTriangleB: TcxCurrencyEdit
          Left = 160
          Top = 31
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxTriangleBPropertiesChange
          TabOrder = 1
          Width = 216
        end
        object cxTriangleC: TcxCurrencyEdit
          Left = 160
          Top = 62
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxTriangleCPropertiesChange
          TabOrder = 2
          Width = 216
        end
        object edAreaTriangle: TcxDBCurrencyEdit
          Left = 54
          Top = 100
          DataBinding.DataField = 'AREA'
          DataBinding.DataSource = dsDataField
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
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
          Width = 331
        end
      end
      object shpentagon: TcxTabSheet
        Caption = 'shpentagon'
        ImageIndex = 0
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label15: TLabel
          Left = 3
          Top = 3
          Width = 217
          Height = 17
          Caption = #1044#1086#1074#1078#1080#1085#1072' '#1089#1090#1086#1088#1086#1085#1080' '#1087#39#1103#1090#1080#1082#1091#1090#1085#1080#1082#1072' ('#1084#1084'):'
        end
        object Label16: TLabel
          Left = 3
          Top = 34
          Width = 45
          Height = 17
          Caption = #1055#1083#1086#1097#1072':'
        end
        object cxPentagonHeight: TcxCurrencyEdit
          Left = 226
          Top = -1
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxPentagonHeightPropertiesChange
          TabOrder = 0
          Width = 216
        end
        object edAreaPentagon: TcxDBCurrencyEdit
          Left = 54
          Top = 31
          DataBinding.DataField = 'AREA'
          DataBinding.DataSource = dsDataField
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = False
          Style.LookAndFeel.SkinName = 'MySkinWhite'
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.SkinName = 'MySkinWhite'
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.SkinName = 'MySkinWhite'
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.SkinName = 'MySkinWhite'
          TabOrder = 1
          Width = 331
        end
      end
      object shhexagon: TcxTabSheet
        Caption = 'shhexagon'
        ImageIndex = 0
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label17: TLabel
          Left = 3
          Top = 3
          Width = 224
          Height = 17
          Caption = #1044#1086#1074#1078#1080#1085#1072' '#1089#1090#1086#1088#1086#1085#1080' '#1096#1077#1089#1090#1080#1082#1091#1090#1085#1080#1082#1072' ('#1084#1084'):'
        end
        object Label18: TLabel
          Left = 3
          Top = 34
          Width = 45
          Height = 17
          Caption = #1055#1083#1086#1097#1072':'
        end
        object cxHexagonSide: TcxCurrencyEdit
          Left = 233
          Top = 0
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxHexagonSidePropertiesChange
          TabOrder = 0
          Width = 216
        end
        object edAreaHexagon: TcxDBCurrencyEdit
          Left = 62
          Top = 39
          DataBinding.DataField = 'AREA'
          DataBinding.DataSource = dsDataField
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = False
          Style.LookAndFeel.SkinName = 'MySkinWhite'
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.SkinName = 'MySkinWhite'
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.SkinName = 'MySkinWhite'
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.SkinName = 'MySkinWhite'
          TabOrder = 1
          Width = 331
        end
      end
      object shTrapeze: TcxTabSheet
        Caption = 'shTrapeze'
        ImageIndex = 0
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label19: TLabel
          Left = 3
          Top = 6
          Width = 119
          Height = 17
          Caption = #1053#1080#1078#1085#1103' '#1086#1089#1085#1086#1074#1072' ('#1084#1084'):'
        end
        object Label20: TLabel
          Left = 11
          Top = 106
          Width = 45
          Height = 17
          Caption = #1055#1083#1086#1097#1072':'
        end
        object Label21: TLabel
          Left = 3
          Top = 37
          Width = 122
          Height = 17
          Caption = #1042#1077#1088#1093#1085#1103' '#1086#1089#1085#1086#1074#1072' ('#1084#1084'):'
        end
        object Label23: TLabel
          Left = 3
          Top = 68
          Width = 124
          Height = 17
          Caption = #1042#1080#1089#1086#1090#1072' '#1090#1088#1072#1087#1077#1094#1110#1111' ('#1084#1084'):'
        end
        object cxTrapezeBottom: TcxCurrencyEdit
          Left = 128
          Top = 3
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxTrapezeBottomPropertiesChange
          TabOrder = 0
          Width = 216
        end
        object cxTrapezeTop: TcxCurrencyEdit
          Left = 128
          Top = 34
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxTrapezeTopPropertiesChange
          TabOrder = 1
          Width = 216
        end
        object cxTrapezeHeight: TcxCurrencyEdit
          Left = 128
          Top = 65
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxTrapezeHeightPropertiesChange
          TabOrder = 2
          Width = 216
        end
        object edAreaTrapeze: TcxDBCurrencyEdit
          Left = 62
          Top = 103
          DataBinding.DataField = 'AREA'
          DataBinding.DataSource = dsDataField
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
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
          Width = 331
        end
      end
      object shcircle: TcxTabSheet
        Caption = 'shcircle'
        ImageIndex = 0
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label26: TLabel
          Left = 3
          Top = 3
          Width = 101
          Height = 17
          Caption = #1056#1072#1076#1110#1091#1089' '#1082#1086#1083#1072' ('#1084#1084'):'
        end
        object Label27: TLabel
          Left = 3
          Top = 40
          Width = 45
          Height = 17
          Caption = #1055#1083#1086#1097#1072':'
        end
        object cxCircleRadius: TcxCurrencyEdit
          Left = 110
          Top = 3
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxCircleRadiusPropertiesChange
          TabOrder = 0
          Width = 216
        end
        object edAreaCircle: TcxDBCurrencyEdit
          Left = 54
          Top = 37
          DataBinding.DataField = 'AREA'
          DataBinding.DataSource = dsDataField
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = False
          Style.LookAndFeel.SkinName = 'MySkinWhite'
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.SkinName = 'MySkinWhite'
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.SkinName = 'MySkinWhite'
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.SkinName = 'MySkinWhite'
          TabOrder = 1
          Width = 331
        end
      end
      object shellipse: TcxTabSheet
        Caption = 'shellipse'
        ImageIndex = 0
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label24: TLabel
          Left = 11
          Top = 3
          Width = 138
          Height = 17
          Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1096#1080#1088#1080#1085#1072' ('#1084#1084'):'
        end
        object Label25: TLabel
          Left = 11
          Top = 72
          Width = 45
          Height = 17
          Caption = #1055#1083#1086#1097#1072':'
        end
        object Label28: TLabel
          Left = 11
          Top = 38
          Width = 131
          Height = 17
          Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1074#1080#1089#1086#1090#1072' ('#1084#1084'):'
        end
        object cxEllipseWidth: TcxCurrencyEdit
          Left = 155
          Top = 0
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxEllipseWidthPropertiesChange
          TabOrder = 0
          Width = 216
        end
        object cxEllipseHeight: TcxCurrencyEdit
          Left = 155
          Top = 35
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxEllipseHeightPropertiesChange
          TabOrder = 1
          Width = 216
        end
        object edAreaEllipse: TcxDBCurrencyEdit
          Left = 62
          Top = 69
          DataBinding.DataField = 'AREA'
          DataBinding.DataSource = dsDataField
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = False
          Style.LookAndFeel.SkinName = 'MySkinWhite'
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.SkinName = 'MySkinWhite'
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.SkinName = 'MySkinWhite'
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.SkinName = 'MySkinWhite'
          TabOrder = 2
          Width = 331
        end
      end
      object shRhombus: TcxTabSheet
        Caption = 'shRhombus'
        ImageIndex = 0
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label29: TLabel
          Left = 3
          Top = 3
          Width = 138
          Height = 17
          Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1096#1080#1088#1080#1085#1072' ('#1084#1084'):'
        end
        object Label30: TLabel
          Left = 3
          Top = 38
          Width = 131
          Height = 17
          Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1074#1080#1089#1086#1090#1072' ('#1084#1084'):'
        end
        object Label31: TLabel
          Left = 3
          Top = 72
          Width = 45
          Height = 17
          Caption = #1055#1083#1086#1097#1072':'
        end
        object cxRhombusDiagH: TcxCurrencyEdit
          Left = 147
          Top = 4
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxRhombusDiagHPropertiesChange
          TabOrder = 0
          Width = 216
        end
        object cxRhombusDiagV: TcxCurrencyEdit
          Left = 147
          Top = 35
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxRhombusDiagVPropertiesChange
          TabOrder = 1
          Width = 216
        end
        object edAreaRhombus: TcxDBCurrencyEdit
          Left = 54
          Top = 69
          DataBinding.DataField = 'AREA'
          DataBinding.DataSource = dsDataField
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = False
          Style.LookAndFeel.SkinName = 'MySkinWhite'
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.SkinName = 'MySkinWhite'
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.SkinName = 'MySkinWhite'
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.SkinName = 'MySkinWhite'
          TabOrder = 2
          Width = 331
        end
      end
      object shParallelogram: TcxTabSheet
        Caption = 'shParallelogram'
        ImageIndex = 0
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label32: TLabel
          Left = 3
          Top = 3
          Width = 134
          Height = 17
          Caption = #1044#1086#1074#1078#1080#1085#1072' '#1086#1089#1085#1086#1074#1080' ('#1084#1084'):'
        end
        object Label33: TLabel
          Left = 3
          Top = 38
          Width = 165
          Height = 17
          Caption = #1044#1086#1074#1078#1080#1085#1072' '#1073#1110#1095'. '#1089#1090#1086#1088#1086#1085#1080' ('#1084#1084'):'
        end
        object Label34: TLabel
          Left = 3
          Top = 102
          Width = 45
          Height = 17
          Caption = #1055#1083#1086#1097#1072':'
        end
        object Label35: TLabel
          Left = 3
          Top = 71
          Width = 115
          Height = 17
          Caption = #1043#1086#1089#1090#1088#1080#1081' '#1082#1091#1076' ('#1075#1088#1072#1076'.):'
        end
        object cxParallelogramSide: TcxCurrencyEdit
          Left = 176
          Top = 35
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxParallelogramSidePropertiesChange
          TabOrder = 0
          Width = 216
        end
        object cxParallelogramAngle: TcxCurrencyEdit
          Left = 176
          Top = 68
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxParallelogramAnglePropertiesChange
          TabOrder = 1
          Width = 216
        end
        object cxParallelogramBase: TcxCurrencyEdit
          Left = 176
          Top = 0
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = cxParallelogramBasePropertiesChange
          TabOrder = 2
          Width = 216
        end
        object edAreaParallelogram: TcxDBCurrencyEdit
          Left = 61
          Top = 99
          DataBinding.DataField = 'AREA'
          DataBinding.DataSource = dsDataField
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
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
          Width = 331
        end
      end
      object shCustom: TcxTabSheet
        Caption = 'shCustom'
        ImageIndex = 0
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object bbCloseShape: TcxButton
          Left = 3
          Top = 3
          Width = 169
          Height = 40
          Caption = #1047#1072#1084#1082#1085#1091#1090#1080' '#1092#1110#1075#1091#1088#1091
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'MySkinWhite'
          TabOrder = 0
          OnClick = bbCloseShapeClick
        end
        object bbClearShape: TcxButton
          Left = 3
          Top = 64
          Width = 169
          Height = 40
          Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1087#1086#1083#1077
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'MySkinWhite'
          TabOrder = 1
          OnClick = bbClearShapeClick
        end
      end
    end
  end
  object edNotes: TcxDBTextEdit
    Left = 123
    Top = 70
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
    TabOrder = 3
    Width = 692
  end
  object cxImage1: TcxImage
    Left = 0
    Top = 276
    Align = alClient
    TabOrder = 4
    OnMouseDown = cxImage1MouseDown
    Height = 615
    Width = 1102
  end
  object spDataField: TFDQuery
    CachedUpdates = True
    Connection = mainModule.cnFBConnect
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'select * from REF_Parts where id=:id')
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
    StoredProcName = 'REF_PARTS_IU'
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
        Size = 200
      end
      item
        Position = 3
        Name = 'GEOMETRY_JSON'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'AREA'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'NOTES'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 6
        Name = 'DEL'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'CURRENT_USER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
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
