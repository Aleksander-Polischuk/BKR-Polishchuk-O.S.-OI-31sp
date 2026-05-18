object fmParts: TfmParts
  Left = 0
  Top = 0
  Caption = #1044#1077#1090#1072#1083#1110
  ClientHeight = 489
  ClientWidth = 1105
  Color = clBtnFace
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
  Position = poMainFormCenter
  OnClose = FormClose
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1105
    Height = 33
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object bbSelect: TcxButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 94
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = aSelect
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MySkinWhite'
      TabOrder = 0
    end
    object bbAdd: TcxButton
      AlignWithMargins = True
      Left = 101
      Top = 3
      Width = 107
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = aAddNew
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MySkinWhite'
      TabOrder = 1
    end
    object bbMarkDelete: TcxButton
      AlignWithMargins = True
      Left = 242
      Top = 3
      Width = 26
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = aMarkDelete
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MySkinWhite'
      PaintStyle = bpsGlyph
      TabOrder = 2
    end
    object bbEdit: TcxButton
      AlignWithMargins = True
      Left = 212
      Top = 3
      Width = 26
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = aEdit
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MySkinWhite'
      PaintStyle = bpsGlyph
      TabOrder = 3
    end
    object cxButton5: TcxButton
      AlignWithMargins = True
      Left = 275
      Top = 3
      Width = 26
      Height = 27
      Margins.Left = 5
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = aRefresh
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MySkinWhite'
      PaintStyle = bpsGlyph
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object edFind: TcxButtonEdit
      AlignWithMargins = True
      Left = 917
      Top = 4
      Align = alRight
      Properties.Buttons = <
        item
          Action = aClearFind
          Default = True
          Kind = bkGlyph
        end>
      Properties.Images = mainModule.cxImageList16
      Properties.OnEditValueChanged = edFindPropertiesEditValueChanged
      TabOrder = 5
      Width = 184
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 470
    Width = 1105
    Height = 19
    Panels = <>
  end
  object gList: TcxGrid
    Left = 0
    Top = 33
    Width = 1105
    Height = 437
    Align = alClient
    TabOrder = 2
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.ScrollbarMode = sbmClassic
    LookAndFeel.ScrollMode = scmClassic
    LookAndFeel.SkinName = 'MySkinWhite'
    object gListDBTableView: TcxGridDBTableView
      OnDblClick = gListDBTableViewDblClick
      OnKeyDown = gListDBTableViewKeyDown
      Navigator.Buttons.CustomButtons = <>
      FindPanel.ApplyInputDelay = 500
      FindPanel.Behavior = fcbFilter
      FindPanel.InfoText = #1055#1086#1096#1091#1082
      FindPanel.Layout = fplCompact
      FindPanel.ShowClearButton = False
      FindPanel.ShowCloseButton = False
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.FocusRect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GridLineColor = 13027014
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      RowLayout.CellBorders = False
      RowLayout.UseDefaultLayout = False
      Styles.ContentOdd = mainModule.StyleGrid_odd_lightgreen
      Styles.UseOddEvenStyles = bTrue
      Styles.OnGetContentStyle = gListDBTableViewStylesGetContentStyle
      object gListDBTableViewMARKDEL: TcxGridDBColumn
        DataBinding.FieldName = 'DEL'
        DataBinding.IsNullValueType = True
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = mainModule.cxImageListStatus
        Properties.Items = <
          item
            ImageIndex = 0
            Value = False
          end
          item
            ImageIndex = 1
            Value = True
          end>
        Options.AutoWidthSizable = False
        RowLayoutItem = gListDBTableViewLayoutItem1.Owner
        Width = 36
        IsCaptionAssigned = True
      end
      object gListDBTableViewID: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'ID'
        DataBinding.IsNullValueType = True
        Options.AutoWidthSizable = False
        RowLayoutItem = gListDBTableViewLayoutItem2.Owner
      end
      object gListDBTableViewNAME: TcxGridDBColumn
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        DataBinding.FieldName = 'NAME'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem3.Owner
        Width = 160
      end
      object gListDBTableViewAREA: TcxGridDBColumn
        Caption = #1055#1083#1086#1097#1072' '#1076#1077#1090#1072#1083#1110' '#1085#1072' '#1083#1080#1089#1090#1110
        DataBinding.FieldName = 'AREA'
        DataBinding.IsNullValueType = True
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        RowLayoutItem = gListDBTableViewLayoutItem4.Owner
        Width = 80
      end
      object gListDBTableViewNOTES: TcxGridDBColumn
        Caption = #1055#1088#1080#1084#1110#1090#1082#1080
        DataBinding.FieldName = 'NOTES'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem6.Owner
        Width = 80
      end
      object gListDBTableViewColumn1: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095' '#1089#1090#1074#1086#1088#1080#1074
        DataBinding.FieldName = 'ADD_SYS_USERS'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem5.Owner
        Width = 40
      end
      object gListDBTableViewColumn2: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1089#1090#1074#1086#1088#1077#1085#1085#1103
        DataBinding.FieldName = 'ADD_TIMESTAMP'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem7.Owner
        Width = 40
      end
      object gListDBTableViewColumn3: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095' '#1079#1084#1110#1085#1080#1074
        DataBinding.FieldName = 'CH_SYS_USERS'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem8.Owner
        Width = 40
      end
      object gListDBTableViewColumn4: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1084#1110#1085#1080
        DataBinding.FieldName = 'CH_TIMESTAMP'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem9.Owner
        Width = 40
      end
      object TcxGridTableRowLayoutSerializationOwner
        object gListDBTableViewRootGroup: TcxGridTableRowLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = -1
        end
        object gListDBTableViewAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
          Parent = gListDBTableViewRootGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          Index = 0
        end
        object gListDBTableViewAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
          Parent = gListDBTableViewRootGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          Index = 1
        end
        object gListDBTableViewLayoutItem1: TcxGridTableRowLayoutItem
          Parent = gListDBTableViewAutoCreatedGroup1.Owner
          AlignHorz = ahLeft
          AlignVert = avTop
          Index = 0
        end
        object gListDBTableViewLayoutItem2: TcxGridTableRowLayoutItem
          Parent = gListDBTableViewAutoCreatedGroup2.Owner
          AlignHorz = ahLeft
          AlignVert = avTop
          Index = 0
        end
        object gListDBTableViewLayoutItem3: TcxGridTableRowLayoutItem
          Parent = gListDBTableViewAutoCreatedGroup1.Owner
          AlignHorz = ahLeft
          AlignVert = avTop
          Index = 1
        end
        object gListDBTableViewLayoutItem4: TcxGridTableRowLayoutItem
          Index = -1
        end
        object gListDBTableViewLayoutItem6: TcxGridTableRowLayoutItem
          Index = -1
        end
        object gListDBTableViewLayoutItem5: TcxGridTableRowLayoutItem
          Index = -1
        end
        object gListDBTableViewLayoutItem7: TcxGridTableRowLayoutItem
          Index = -1
        end
        object gListDBTableViewLayoutItem8: TcxGridTableRowLayoutItem
          Index = -1
        end
        object gListDBTableViewLayoutItem9: TcxGridTableRowLayoutItem
          Index = -1
        end
      end
    end
    object gListLevel1: TcxGridLevel
      GridView = gListDBTableView
    end
  end
  object spList: TFDQuery
    Connection = mainModule.cnFBConnect
    SQL.Strings = (
      'select rp.*,'
      '       GET_SYS_USER_NAME(rp.add_id_sys_users) as add_sys_users,'
      '       GET_SYS_USER_NAME(rp.ch_id_sys_users) as ch_sys_users  '
      'from REF_PARTS rp'
      'order by rp.id ASC')
    Left = 483
    Top = 152
  end
  object dsList: TDataSource
    DataSet = spList
    Left = 552
    Top = 152
  end
  object alListActions: TActionList
    Images = mainModule.cxImageList16
    Left = 440
    Top = 64
    object aAddNew: TAction
      Caption = #1057#1090#1074#1086#1088#1080#1090#1080
      Hint = #1057#1090#1074#1086#1088#1080#1090#1080' '#1085#1086#1074#1080#1081' '#1077#1083#1077#1084#1077#1085#1090
      ImageIndex = 2
      OnExecute = aAddNewExecute
    end
    object aEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Hint = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 1
      OnExecute = aEditExecute
    end
    object aMarkDelete: TAction
      Caption = #1042#1110#1076#1084#1110#1090#1080#1090#1080' '#1085#1072' '#1074#1080#1083#1091#1095#1077#1085#1085#1103' / '#1047#1085#1103#1090#1080' '#1087#1086#1079#1085#1072#1095#1082#1091
      Hint = #1042#1110#1076#1084#1110#1090#1080#1090#1080' '#1085#1072' '#1074#1080#1083#1091#1095#1077#1085#1085#1103' / '#1047#1085#1103#1090#1080' '#1087#1086#1079#1085#1072#1095#1082#1091
      ImageIndex = 7
      ShortCut = 46
      OnExecute = aMarkDeleteExecute
    end
    object aClearFind: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1087#1086#1096#1091#1082
      Hint = #1054#1095#1080#1089#1090#1080#1090#1080' '#1087#1086#1096#1091#1082
      ImageIndex = 12
      OnExecute = aClearFindExecute
    end
    object aSelect: TAction
      Caption = #1042#1080#1073#1088#1072#1090#1080
      ImageIndex = 0
      OnExecute = aSelectExecute
    end
    object aRefresh: TAction
      Caption = #1054#1085#1086#1074#1080#1090#1080
      Hint = #1054#1085#1086#1074#1080#1090#1080' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1073#1077#1079#1087#1086#1089#1077#1088#1077#1076#1085#1100#1086
      ImageIndex = 14
      ShortCut = 8238
      OnExecute = aDeleteExecute
    end
  end
end
