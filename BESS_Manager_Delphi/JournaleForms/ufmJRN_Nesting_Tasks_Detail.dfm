object fmJRN_Nesting_Tasks_Detail: TfmJRN_Nesting_Tasks_Detail
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1074#1110#1076#1082#1083#1072#1076#1077#1085#1080#1093' '#1088#1110#1079#1110#1074
  ClientHeight = 426
  ClientWidth = 851
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
    Top = 41
    Width = 851
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 286
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 851
    Height = 41
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 320
      Top = 13
      Width = 92
      Height = 17
      Caption = #1063#1072#1089' '#1074#1080#1082#1086#1085#1072#1085#1085#1103':'
    end
    object cxButton1: TcxButton
      Left = 8
      Top = 5
      Width = 145
      Height = 33
      Action = aConfirm
      LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 0
    end
    object edFactDate: TcxDBDateEdit
      Left = 415
      Top = 10
      DataBinding.DataField = 'FACT_DATE'
      DataBinding.DataSource = dsDataField
      Properties.Kind = ckDateTime
      TabOrder = 1
      Width = 194
    end
    object cxButton2: TcxButton
      Left = 159
      Top = 5
      Width = 145
      Height = 33
      Action = aLookSVG
      LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 2
    end
  end
  object gList: TcxGrid
    Left = 0
    Top = 44
    Width = 851
    Height = 382
    Align = alClient
    TabOrder = 1
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
      DataController.DataSource = dsDataField
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
      object gListDBTableViewID: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'ID'
        DataBinding.IsNullValueType = True
        Options.AutoWidthSizable = False
        RowLayoutItem = gListDBTableViewLayoutItem2.Owner
      end
      object gListDBTableViewNAME: TcxGridDBColumn
        Caption = #1044#1077#1090#1072#1083#1100
        DataBinding.FieldName = 'PART_NAME'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem1.Owner
        Width = 60
      end
      object gListDBTableViewQUANTITY: TcxGridDBColumn
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
        DataBinding.FieldName = 'QUANTITY'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem3.Owner
        Width = 40
      end
      object gListDBTableViewESTIMATED_TIME_MINS: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1088#1086#1073#1086#1090#1080', '#1093#1074
        DataBinding.FieldName = 'ESTIMATED_TIME_STR'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem4.Owner
        Width = 40
      end
      object gListDBTableViewESTIMATED_COST: TcxGridDBColumn
        Caption = #1042#1072#1088#1090#1110#1089#1090#1100' '#1077#1085#1077#1088#1075#1110#1111', '#1075#1088#1085
        DataBinding.FieldName = 'ESTIMATED_COST'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem5.Owner
        Width = 40
      end
      object gListDBTableViewColumn1: TcxGridDBColumn
        Caption = #1060#1072#1082#1090#1080#1095#1085#1080#1081' '#1095#1072#1089' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
        DataBinding.FieldName = 'FACT_DATE'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem6.Owner
        Width = 50
      end
      object TcxGridTableRowLayoutSerializationOwner
        object gListDBTableViewRootGroup: TcxGridTableRowLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          Hidden = True
          ItemIndex = 1
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
        object gListDBTableViewLayoutItem2: TcxGridTableRowLayoutItem
          Parent = gListDBTableViewAutoCreatedGroup2.Owner
          AlignHorz = ahLeft
          AlignVert = avTop
          Index = 0
        end
        object gListDBTableViewLayoutItem3: TcxGridTableRowLayoutItem
          Index = -1
        end
        object gListDBTableViewLayoutItem1: TcxGridTableRowLayoutItem
          Index = -1
        end
        object gListDBTableViewLayoutItem4: TcxGridTableRowLayoutItem
          Index = -1
        end
        object gListDBTableViewLayoutItem5: TcxGridTableRowLayoutItem
          Index = -1
        end
        object gListDBTableViewLayoutItem6: TcxGridTableRowLayoutItem
          Index = -1
        end
      end
    end
    object gListLevel1: TcxGridLevel
      GridView = gListDBTableView
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
      'SELECT '
      '    T.ID,'
      '    T.BATCH_ID,'
      '    P.NAME AS PART_NAME,'
      '    T.QUANTITY,'
      '    T.ESTIMATED_TIME_MINS,'
      '    CASE '
      '        WHEN T.ESTIMATED_TIME_MINS >= 60 THEN'
      
        '            CAST(CAST(TRUNC(T.ESTIMATED_TIME_MINS / 60) AS INTEG' +
        'ER) AS VARCHAR(10)) || '#39' '#1075#1086#1076' '#39' || '
      
        '            CAST(MOD(CAST(TRUNC(T.ESTIMATED_TIME_MINS) AS INTEGE' +
        'R), 60) AS VARCHAR(10)) || '#39' '#1093#1074#39
      '        ELSE'
      
        '            CAST(CAST(TRUNC(T.ESTIMATED_TIME_MINS) AS INTEGER) A' +
        'S VARCHAR(10)) || '#39' '#1093#1074' '#39' || '
      
        '            CAST(CAST(TRUNC((T.ESTIMATED_TIME_MINS - TRUNC(T.EST' +
        'IMATED_TIME_MINS)) * 60) AS INTEGER) AS VARCHAR(10)) || '#39' '#1089#1077#1082#39
      '    END AS ESTIMATED_TIME_STR,'
      '    T.ESTIMATED_COST,'
      '    T.ID_PART,'
      '    T.ID_REF_MACHINE,'
      '    T.ID_TARIFF,'
      '    T.PLANNED_DATE,'
      '    T.STATUS,'
      '    T.FACT_DATE'
      'FROM JRN_NESTING_TASKS T'
      'JOIN REF_PARTS P ON T.ID_PART = P.ID'
      'WHERE T.BATCH_ID = :P_BATCH_ID')
    Left = 355
    Top = 8
    ParamData = <
      item
        Name = 'P_BATCH_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
        Name = 'I_PLANNED_DATE'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'I_ESTIMATED_COST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'I_ID_TARIFF'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'I_FACT_DATE'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'I_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'I_ESTIMATED_TIME_MINS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'I_BATCH_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'O_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object alListActions: TActionList
    Images = mainModule.cxImageList16
    Left = 440
    Top = 64
    object aConfirm: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080' '#1079#1072#1074#1076#1072#1085#1085#1103
      ImageIndex = 3
      OnExecute = aConfirmExecute
    end
    object aLookSVG: TAction
      Caption = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080' '#1089#1093#1077#1084#1091
      ImageIndex = 25
      OnExecute = aLookSVGExecute
    end
  end
end
