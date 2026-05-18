object fmJRN_Parts_Stock: TfmJRN_Parts_Stock
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1085#1072#1103#1074#1085#1080#1093' '#1076#1077#1090#1072#1083#1077#1081
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
    0000010020000000000000040000C30E0000C30E00000000000000000000F9F9
    F92FF8F7F9FFF0EEEEFFF2EBEDFFDFDAE0F371D7FEB371D7FEB371D7FEB371D7
    FEB371D7FEB371D7FEB371D7FEB371D7FEB35ABBFAB556BCFC5800000000F9F4
    F930F8F7F9FFA99A89FFB2A193FFDCDAE2FF72D5FCFF6C969BFF6C9499FF6C94
    99FF70BDD6FF72D7FFFF72D7FFFF72D7FFFF5CBEFCFF57B9FAE554C6FE09F9F4
    F930F8F7F9FFB0A394FFB2A092FFDCDAE2FF72D5FCFF6C969BFF6D9EA7FF72D7
    FFFF72D7FFFF72D7FFFF72D7FFFF72D7FFFF5BBDFBFF57BAFAE955BFFF0CF9F4
    F930F8F7F9FFECE9E8FFF0E9EAFFDED9E0F671D6FEBF71D6FEBF71D6FEBF71D6
    FEBF71D6FEBF71D6FEBF71D6FEBF70D5FEBF58B9FABF57B9F96000000000FFFF
    FF01FFFFFF0CFFFFFF0CEBEBEB0DE7E7E70B0000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000FFFFFF06FFFFFF06FEDAFE07FFD4D4060000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000F9F9
    F92FF8F7F9FFE8E5E3FFEAE2E2FFEDD8D2F5F8CD75B9F8CD75B9F8CD75B9F8CD
    75B9F8CD75B9F8CD75B9F8CD75B9F8CD75B9FEB761BAFEB6615C00000000F9F4
    F930F8F7F9FFA39481FFCEC1BAFFEED8CEFFF6CC74FFB39152FFB19051FFB190
    51FFDCB567FFF8CE75FFF8CE75FFF8CE75FFFEBA63FFFEB760E7FFB2660AF9F4
    F930F8F7F9FFB3A697FFB7A79AFFEED8CEFFF6CC74FFB39152FFBC9956FFF8CE
    75FFF8CE75FFF8CE75FFF8CE75FFF8CE75FFFEBA62FFFEB760E7FFB2660AF9F9
    F92FF8F7F9FFEEEBEAFFF2EBEDFFEDD8D2F5F8CD75B9F8CD75B9F8CD75B9F8CD
    75B9F8CD75B9F8CD75B9F8CD75B9F8CD74BAFEB65FBBFEB6615C000000000000
    0000FFFFFF06FFFFFF06FEDAFE07FFD4D4060000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FF01FFFFFF0CFFFFFF0CEBEBEB0DE7E7E70B0000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000F9F4
    F930F8F7F9FFF5F3F5FFF0E9EAFFDDCCDEF66854EABF6854EABF6854EABF6854
    EABF6854EABF6854EABF6854EABF6854EABF5039E5BF4F37E46000000000F9F4
    F930F8F7F9FFD8D2CCFFCEC1BAFFDAC8DFFF6854E9FF675190FF67518EFF6751
    8EFF6853C6FF6854EBFF6854EBFF6854EBFF533CE6FF4E37E4E9553FE90CF9F4
    F930F8F7F9FFC5BCB2FFCEC1BAFFDAC8DFFF6854E9FF675190FF67519BFF6854
    EBFF6854EBFF6854EBFF6854EBFF6854EBFF523BE6FF4F37E5E55438E209F9F9
    F92FF8F7F9FFF0EEEEFFF2EBECFFDFCCDFF36754EBB36754EBB36754EBB36754
    EBB36754EBB36754EBB36754EBB36652EBB34E38E5B54E39E458000000000001
    000000000000000000000001000007FF000087FF000000010000000000000000
    00000001000087FF000007FF000000010000000000000000000000010000}
  Position = poMainFormCenter
  OnClose = FormClose
  TextHeight = 17
  object gList: TcxGrid
    Left = 0
    Top = 33
    Width = 1105
    Height = 456
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.ScrollbarMode = sbmClassic
    LookAndFeel.ScrollMode = scmClassic
    LookAndFeel.SkinName = 'MySkinWhite'
    object gListDBTableView: TcxGridDBTableView
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
      object gListDBTableViewPART_NUMBER: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1087#1072#1088#1090#1110#1111
        DataBinding.FieldName = 'PART_NUMBER'
        DataBinding.IsNullValueType = True
        Visible = False
        Width = 60
      end
      object gListDBTableViewPART_NAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1087#1072#1088#1090#1110#1111
        DataBinding.FieldName = 'PART_NAME'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem10.Owner
        Width = 60
      end
      object gListDBTableViewCATEGORY: TcxGridDBColumn
        Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
        DataBinding.FieldName = 'CATEGORY_NAME'
        DataBinding.IsNullValueType = True
        Visible = False
        Width = 60
      end
      object gListDBTableViewQUANTITY: TcxGridDBColumn
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
        DataBinding.FieldName = 'QUANTITY'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem4.Owner
      end
      object gListDBTableViewUNIT: TcxGridDBColumn
        Caption = #1054#1076#1080#1085#1080#1094#1103' '#1074#1080#1084#1110#1088#1091
        DataBinding.FieldName = 'UNIT_NAME'
        DataBinding.IsNullValueType = True
        Visible = False
      end
      object gListDBTableViewColumn3: TcxGridDBColumn
        Caption = #1052#1085#1110#1084#1072#1083#1100#1085#1080#1081' '#1079#1072#1083#1080#1096#1086#1082
        DataBinding.FieldName = 'MIN_BALANCE'
        DataBinding.IsNullValueType = True
        Visible = False
      end
      object gListDBTableViewADD_ID_SYS_USERS: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095' '#1089#1090#1074#1086#1088#1080#1074
        DataBinding.FieldName = 'ADD_SYS_USERS'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem5.Owner
        Width = 40
      end
      object gListDBTableViewADD_TIMESTAMP: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1076#1072#1074#1072#1085#1085#1103
        DataBinding.FieldName = 'ADD_TIMESTAMP'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem8.Owner
        Width = 40
      end
      object gListDBTableViewCH_ID_SYS_USERS: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095' '#1079#1084#1110#1085#1080#1074
        DataBinding.FieldName = 'CH_SYS_USERS'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem7.Owner
        Width = 40
      end
      object gListDBTableViewCH_TIMESTAMP: TcxGridDBColumn
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
        object gListDBTableViewLayoutItem10: TcxGridTableRowLayoutItem
          Index = -1
        end
        object gListDBTableViewLayoutItem4: TcxGridTableRowLayoutItem
          Index = -1
        end
      end
    end
    object gListLevel1: TcxGridLevel
      GridView = gListDBTableView
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1105
    Height = 33
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object bbAdd: TcxButton
      AlignWithMargins = True
      Left = 3
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
      TabOrder = 0
    end
    object cxButton5: TcxButton
      AlignWithMargins = True
      Left = 228
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
      TabOrder = 1
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
      TabOrder = 2
      Width = 184
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 114
      Top = 3
      Width = 107
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = aAddNesting
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MySkinWhite'
      TabOrder = 3
    end
  end
  object spList: TFDQuery
    Connection = mainModule.cnFBConnect
    SQL.Strings = (
      'SELECT '
      '    PS.ID,'
      '    PS.PART_NUMBER,'
      '    PS.PART_NAME,'
      '    /* '#1047#1072#1084#1110#1089#1090#1100' ID_REF_CATEGORIES '#1090#1103#1075#1085#1077#1084#1086' '#1074#1110#1076#1088#1072#1079#1091' '#1085#1072#1079#1074#1091' */'
      '    RC.NAME AS CATEGORY_NAME, '
      '    /* '#1047#1072#1084#1110#1089#1090#1100' ID_REF_UNITS '#1090#1103#1075#1085#1077#1084#1086' '#1074#1110#1076#1088#1072#1079#1091' '#1085#1072#1079#1074#1091' */'
      '    RU.NAME AS UNIT_NAME,     '
      '    PS.QUANTITY,'
      '    PS.MIN_BALANCE,'
      '    PS.DEL,'
      '    '
      '    /* '#1040#1091#1076#1080#1090' '#1095#1077#1088#1077#1079' '#1090#1074#1086#1102' '#1092#1091#1085#1082#1094#1110#1102' */'
      '    GET_SYS_USER_NAME(PS.ADD_ID_SYS_USERS) AS ADD_SYS_USERS,'
      '    PS.ADD_TIMESTAMP,'
      '    GET_SYS_USER_NAME(PS.CH_ID_SYS_USERS) AS CH_SYS_USERS,'
      '    PS.CH_TIMESTAMP'
      'FROM '
      '    JRN_PARTS_STOCK PS'
      '    LEFT JOIN REF_CATEGORIES RC ON PS.ID_REF_CATEGORIES = RC.ID'
      '    LEFT JOIN REF_UNITS RU ON PS.ID_REF_UNITS = RU.ID'
      'WHERE '
      '    PS.DEL = 0'
      'ORDER BY '
      '    RC.NAME, PS.PART_NAME')
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
      Caption = #1044#1086#1076#1072#1090#1080
      Hint = #1057#1090#1074#1086#1088#1080#1090#1080' '#1085#1086#1074#1080#1081' '#1077#1083#1077#1084#1077#1085#1090
      ImageIndex = 2
      OnExecute = aAddNewExecute
    end
    object aClearFind: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1087#1086#1096#1091#1082
      Hint = #1054#1095#1080#1089#1090#1080#1090#1080' '#1087#1086#1096#1091#1082
      ImageIndex = 12
      OnExecute = aClearFindExecute
    end
    object aRefresh: TAction
      Caption = #1054#1085#1086#1074#1080#1090#1080
      Hint = #1054#1085#1086#1074#1080#1090#1080' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aAddNesting: TAction
      Caption = #1056#1086#1079#1082#1088#1086#1111#1090#1080
      ImageIndex = 18
      OnExecute = aAddNestingExecute
    end
  end
end
