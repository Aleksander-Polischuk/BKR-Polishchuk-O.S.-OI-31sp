object fmJRN_Parts_Stock_Cutting: TfmJRN_Parts_Stock_Cutting
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1085#1072#1103#1074#1085#1080#1093' '#1076#1077#1090#1072#1083#1077#1081
  ClientHeight = 754
  ClientWidth = 1012
  Color = clWhite
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
  OnClose = FormClose
  TextHeight = 17
  object Splitter1: TSplitter
    Left = 0
    Top = 209
    Width = 1012
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 249
    ExplicitWidth = 180
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1012
    Height = 33
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object bbSave: TcxButton
      AlignWithMargins = True
      Left = 133
      Top = 3
      Width = 137
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = aCutLater
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 0
    end
    object bbConfirm: TcxButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 126
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = aCutNow
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 1012
    Height = 176
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      1012
      176)
    object Label5: TLabel
      Left = 10
      Top = 87
      Width = 71
      Height = 17
      Caption = #1044#1072#1090#1072' '#1090#1072' '#1095#1072#1089':'
    end
    object Label1: TLabel
      Left = 10
      Top = 113
      Width = 48
      Height = 17
      Caption = #1042#1077#1088#1089#1090#1072#1090':'
    end
    object Label2: TLabel
      Left = 881
      Top = 9
      Width = 26
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1050#1086#1076':'
      ExplicitLeft = 695
    end
    object lblNetworkStatus: TcxLabel
      Left = 10
      Top = 6
      Caption = #1057#1090#1072#1090#1091#1089' '#1089#1074#1110#1090#1083#1086':'
    end
    object lblCostNow: TcxLabel
      Left = 10
      Top = 33
      Caption = #1062#1110#1085#1072' '#1088#1086#1079#1082#1088#1086#1102' '#1079#1072#1088#1072#1079':'
    end
    object lblCostOptimal: TcxLabel
      Left = 10
      Top = 60
      Caption = #1062#1110#1085#1072' '#1088#1086#1079#1082#1088#1086#1102' '#1087#1110#1079#1110#1085#1096#1077':'
    end
    object edOP_DATE: TcxDBDateEdit
      Left = 87
      Top = 84
      DataBinding.DataField = 'OP_DATE'
      DataBinding.DataSource = dsDataField
      Properties.Kind = ckDateTime
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 3
      Width = 732
    end
    object edID_REF_MACHINE: TcxDBLookupComboBox
      Left = 87
      Top = 110
      DataBinding.DataField = 'ID_REF_MACHINE'
      DataBinding.DataSource = dsDataField
      Properties.Alignment.Horz = taLeftJustify
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = mainModule.dsREF_MACHINE
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 4
      Width = 732
    end
    object edKod: TcxDBTextEdit
      Left = 913
      Top = 6
      TabStop = False
      Anchors = [akTop, akRight]
      DataBinding.DataField = 'ID'
      DataBinding.DataSource = dsDataField
      Properties.ReadOnly = True
      Properties.OnChange = edKodPropertiesChange
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 5
      Width = 92
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 212
    Width = 1012
    Height = 542
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.Images = mainModule.cxImageList32
    ClientRectBottom = 540
    ClientRectLeft = 2
    ClientRectRight = 1010
    ClientRectTop = 45
    object cxTabSheet1: TcxTabSheet
      Caption = #1044#1077#1090#1072#1083#1110
      ImageIndex = 5
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 33
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object cxButton2: TcxButton
          Left = 133
          Top = 2
          Width = 142
          Height = 25
          Action = aDelPart
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Office2013White'
          TabOrder = 0
        end
        object cxButton1: TcxButton
          Left = 3
          Top = 3
          Width = 124
          Height = 25
          Action = aAddPart
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Office2013White'
          TabOrder = 1
        end
      end
      object grParts: TcxGrid
        Left = 0
        Top = 33
        Width = 1008
        Height = 462
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        LookAndFeel.ScrollMode = scmClassic
        LookAndFeel.SkinName = 'Office2013White'
        object tvParts: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FindPanel.ApplyInputDelay = 500
          FindPanel.Behavior = fcbFilter
          FindPanel.InfoText = #1055#1086#1096#1091#1082
          FindPanel.Layout = fplCompact
          FindPanel.ShowClearButton = False
          FindPanel.ShowCloseButton = False
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = dsNestingQueue
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
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
          Styles.UseOddEvenStyles = bTrue
          object colPart: TcxGridDBColumn
            Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            DataBinding.FieldName = 'ID_PART'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = mainModule.dsREF_PARTS
            Properties.OnEditValueChanged = colPartPropertiesEditValueChanged
            RowLayoutItem = tvPartsLayoutItem1.Owner
            Width = 160
          end
          object colQuantity: TcxGridDBColumn
            Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
            DataBinding.FieldName = 'QUANTITY'
            PropertiesClassName = 'TcxSpinEditProperties'
            RowLayoutItem = tvPartsLayoutItem2.Owner
            Width = 30
          end
          object TcxGridTableRowLayoutSerializationOwner
            object tvPartsRootGroup: TcxGridTableRowLayoutGroup
              AlignHorz = ahLeft
              AlignVert = avTop
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              Index = -1
            end
            object tvPartsAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
              Parent = tvPartsRootGroup
              AlignHorz = ahLeft
              AlignVert = avTop
              Index = 0
            end
            object tvPartsAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
              Parent = tvPartsRootGroup
              AlignHorz = ahLeft
              AlignVert = avTop
              Index = 1
            end
            object tvPartsLayoutItem3: TcxGridTableRowLayoutItem
              Parent = tvPartsAutoCreatedGroup1.Owner
              AlignHorz = ahLeft
              AlignVert = avTop
              Index = 0
            end
            object tvPartsLayoutItem1: TcxGridTableRowLayoutItem
              Index = -1
            end
            object tvPartsLayoutItem2: TcxGridTableRowLayoutItem
              Index = -1
            end
          end
        end
        object grPartsLevel1: TcxGridLevel
          GridView = tvParts
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1040#1088#1082#1091#1096#1110
      ImageIndex = 9
      object grSheets: TcxGrid
        Left = 0
        Top = 33
        Width = 1008
        Height = 462
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        LookAndFeel.ScrollMode = scmClassic
        LookAndFeel.SkinName = 'Office2013White'
        object tvSheets: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FindPanel.ApplyInputDelay = 500
          FindPanel.Behavior = fcbFilter
          FindPanel.InfoText = #1055#1086#1096#1091#1082
          FindPanel.Layout = fplCompact
          FindPanel.ShowClearButton = False
          FindPanel.ShowCloseButton = False
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = dsSheetsQueue
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
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
          Styles.UseOddEvenStyles = bTrue
          object colSheetName: TcxGridDBColumn
            Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            DataBinding.FieldName = 'ID_MATERIAL'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsSheetsStock
            Properties.OnEditValueChanged = colSheetNamePropertiesEditValueChanged
            RowLayoutItem = tvPartsLayoutItem3.Owner
            Width = 160
          end
          object TcxGridTableRowLayoutSerializationOwner
            object tvSheetsRootGroup: TcxGridTableRowLayoutGroup
              AlignHorz = ahLeft
              AlignVert = avTop
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              Index = -1
            end
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = tvSheets
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 33
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object cxButton3: TcxButton
          Left = 133
          Top = 3
          Width = 142
          Height = 25
          Action = aDelPaper
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Office2013White'
          TabOrder = 0
        end
        object cxButton4: TcxButton
          Left = 3
          Top = 2
          Width = 124
          Height = 25
          Action = aAddPaper
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Office2013White'
          TabOrder = 1
        end
      end
    end
  end
  object spDataField: TFDQuery
    CachedUpdates = True
    Connection = mainModule.cnFBConnect
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT * FROM JRN_PARTS_MOVEMENT WHERE ID = :ID')
    Left = 355
    Top = 8
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
    Left = 432
    Top = 8
  end
  object spSaveForm: TFDStoredProc
    Connection = mainModule.cnFBConnectWrite
    StoredProcName = 'JRN_NESTING_TASKS_IU'
    Left = 276
    Top = 10
    ParamData = <
      item
        Position = 1
        Name = 'I_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'I_ID_PART'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'I_QUANTITY'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'I_ID_REF_MACHINE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'I_ID_REF_MATERIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'I_PLANNED_DATE'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'I_ESTIMATED_COST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'I_ID_TARIFF'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'I_FACT_DATE'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'I_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'I_ESTIMATED_TIME_MINS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'I_BATCH_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'O_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object alListActions: TActionList
    Images = mainModule.cxImageList16
    Left = 193
    Top = 13
    object aCutNow: TAction
      Caption = #1056#1086#1079#1082#1088#1086#1111#1090#1080' '#1079#1072#1088#1072#1079
      Hint = #1057#1090#1074#1086#1088#1080#1090#1080' '#1085#1086#1074#1080#1081' '#1077#1083#1077#1084#1077#1085#1090' '#1095#1077#1088#1077#1079' '#1082#1086#1087#1110#1102#1074#1072#1085#1085#1103' '#1087#1086#1090#1086#1095#1085#1086#1075#1086
      ImageIndex = 19
      OnExecute = aCutNowExecute
    end
    object aCutLater: TAction
      Caption = #1056#1086#1079#1082#1088#1086#1111#1090#1080' '#1087#1110#1079#1085#1110#1096#1077
      ImageIndex = 4
      OnExecute = aCutLaterExecute
    end
    object aAddPart: TAction
      Caption = #1044#1086#1076#1072#1090#1080' '#1076#1077#1090#1072#1083#1100
      ImageIndex = 2
      OnExecute = aAddPartExecute
    end
    object aDelPart: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1076#1077#1090#1072#1083#1100
      ImageIndex = 14
      OnExecute = aDelPartExecute
    end
    object aAddPaper: TAction
      Caption = #1044#1086#1076#1072#1090#1080' '#1072#1088#1082#1091#1096
      ImageIndex = 2
      OnExecute = aAddPaperExecute
    end
    object aDelPaper: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1072#1088#1082#1091#1096
      ImageIndex = 14
      OnExecute = aDelPaperExecute
    end
  end
  object spCurrentTariff: TFDQuery
    CachedUpdates = True
    Connection = mainModule.cnFBConnect
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT '
      '    T.ID AS TARIFF_ID,'
      '    T.NAME AS TARIFF_NAME,'
      '    T.PRICE_PER_KWH,'
      
        '    /* '#1055#1110#1076#1079#1072#1087#1080#1090' '#1087#1086#1074#1077#1088#1085#1077' 1, '#1103#1082#1097#1086' '#1079#1072#1088#1072#1079' '#1074#1110#1076#1082#1083#1102#1095#1077#1085#1085#1103', '#1110' 0, '#1103#1082#1097#1086' '#1089#1074#1110 +
        #1090#1083#1086' '#1108' */'
      '    (SELECT COUNT(O.ID) '
      '     FROM JRN_OUTAGES O '
      '     WHERE O.DEL = FALSE '
      '       AND O.OUTAGE_DATE = CURRENT_DATE '
      
        '       AND CURRENT_TIME BETWEEN O.TIME_START AND O.TIME_END) AS ' +
        'IS_OUTAGE_NOW'
      'FROM REF_ENERGY_TARIFFS T'
      'WHERE T.DEL = FALSE'
      '  AND CURRENT_TIME BETWEEN T.TIME_START AND T.TIME_END'
      '  AND CURRENT_DATE >= T.DATE_START '
      '  AND (T.DATE_END IS NULL OR CURRENT_DATE <= T.DATE_END)')
    Left = 355
    Top = 64
  end
  object dsCurrentTariff: TDataSource
    DataSet = spCurrentTariff
    Left = 432
    Top = 64
  end
  object spOptimalTariff: TFDQuery
    CachedUpdates = True
    Connection = mainModule.cnFBConnect
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT FIRST 1'
      '    T.ID AS OPTIMAL_TARIFF_ID,'
      '    T.NAME AS OPTIMAL_TARIFF_NAME,'
      '    T.TIME_START AS OPT_TIME_START,'
      '    T.TIME_END AS OPT_TIME_END,'
      '    T.PRICE_PER_KWH AS MIN_PRICE'
      'FROM REF_ENERGY_TARIFFS T'
      'WHERE T.DEL = FALSE'
      '  AND CURRENT_DATE >= T.DATE_START '
      '  AND (T.DATE_END IS NULL OR CURRENT_DATE <= T.DATE_END)'
      'ORDER BY T.PRICE_PER_KWH ASC')
    Left = 355
    Top = 120
  end
  object dsOptimalTariff: TDataSource
    DataSet = spOptimalTariff
    Left = 432
    Top = 120
  end
  object mtNestingQueue: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 440
    Top = 319
    object mtNestingQueueID_PART: TIntegerField
      FieldName = 'ID_PART'
    end
    object mtNestingQueueQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
  end
  object dsNestingQueue: TDataSource
    DataSet = mtNestingQueue
    Left = 544
    Top = 319
  end
  object mtSheetsQueue: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 440
    Top = 391
    object IntegerField1: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object mtSheetsQueueNAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object mtSheetsQueueWIDTH: TFloatField
      FieldName = 'WIDTH'
    end
    object mtSheetsQueueLENGTH: TFloatField
      FieldName = 'LENGTH'
    end
    object mtSheetsQueueIS_ROLL: TBooleanField
      FieldName = 'IS_ROLL'
    end
    object mtSheetsQueueCOST_PER_M2: TFloatField
      FieldName = 'COST_PER_M2'
    end
  end
  object dsSheetsQueue: TDataSource
    DataSet = mtSheetsQueue
    Left = 544
    Top = 391
  end
  object spSheetsStock: TFDQuery
    CachedUpdates = True
    Connection = mainModule.cnFBConnect
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT '
      '    ID, '
      '    NAME, '
      '    WIDTH, '
      '    "LENGTH", '
      '    IS_ROLL, '
      '    COST_PER_M2 '
      'FROM REF_MATERIALS '
      'WHERE DEL = FALSE '
      'ORDER BY NAME')
    Left = 355
    Top = 176
  end
  object dsSheetsStock: TDataSource
    DataSet = spSheetsStock
    Left = 432
    Top = 176
  end
end
