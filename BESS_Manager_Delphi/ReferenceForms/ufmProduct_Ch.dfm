object fmProduct_Ch: TfmProduct_Ch
  Left = 0
  Top = 0
  Caption = #1043#1086#1090#1086#1074#1080#1081' '#1074#1080#1088#1110#1073
  ClientHeight = 616
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
  OnShow = FormShow
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 882
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
    Width = 882
    Height = 72
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      882
      72)
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 90
      Height = 17
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103':'
    end
    object Label4: TLabel
      Left = 8
      Top = 40
      Width = 47
      Height = 17
      Caption = #1040#1088#1090#1080#1082#1091#1083
    end
    object Label2: TLabel
      Left = 750
      Top = 9
      Width = 26
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1050#1086#1076':'
    end
    object edName: TcxDBTextEdit
      Left = 123
      Top = 6
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'NAME'
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
      TabOrder = 0
      Width = 613
    end
    object edArticle: TcxDBTextEdit
      Left = 123
      Top = 37
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'ARTICLE'
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
      TabOrder = 1
      Width = 613
    end
    object edKod: TcxDBTextEdit
      Left = 782
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
    Top = 105
    Width = 882
    Height = 452
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 880
      Height = 40
      Align = alTop
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object cxButton1: TcxButton
        Left = 7
        Top = 6
        Width = 130
        Height = 28
        Action = aAddProductPart
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'MySkinWhite'
        TabOrder = 0
      end
      object cxButton2: TcxButton
        Left = 143
        Top = 5
        Width = 130
        Height = 28
        Action = aDeleteProductPart
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'MySkinWhite'
        TabOrder = 1
      end
    end
    object gList: TcxGrid
      Left = 1
      Top = 41
      Width = 880
      Height = 410
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
        OnEditKeyDown = gListDBTableViewEditKeyDown
        DataController.DataSource = dsStructure
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
        object gListDBTableViewNAME: TcxGridDBColumn
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
          DataBinding.FieldName = 'ID_REF_PARTS'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NOTES'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsPartsList
          RowLayoutItem = gListDBTableViewLayoutItem3.Owner
          Width = 160
        end
        object gListDBTableViewQuantity: TcxGridDBColumn
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
          DataBinding.FieldName = 'QUANTITY'
          PropertiesClassName = 'TcxSpinEditProperties'
          RowLayoutItem = gListDBTableViewLayoutItem6.Owner
          Width = 30
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
          object gListDBTableViewLayoutItem3: TcxGridTableRowLayoutItem
            Parent = gListDBTableViewAutoCreatedGroup1.Owner
            AlignHorz = ahLeft
            AlignVert = avTop
            Index = 0
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
  end
  object Panel4: TPanel
    Left = 0
    Top = 557
    Width = 882
    Height = 59
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      882
      59)
    object Label3: TLabel
      Left = 16
      Top = 17
      Width = 57
      Height = 17
      Caption = #1055#1088#1080#1084#1110#1090#1082#1072':'
    end
    object edNotes: TcxDBTextEdit
      Left = 76
      Top = 14
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
      TabOrder = 0
      Width = 798
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
      'select * from REF_PRODUCTS where id=:id')
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
    StoredProcName = 'REF_PRODUCTS_IU'
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
        Name = 'ARTICLE'
        DataType = ftString
        ParamType = ptInput
        Size = 50
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
      ShortCut = 116
      OnExecute = aConfirmExecute
    end
    object aSave: TAction
      Caption = #1047#1072#1087#1080#1089#1072#1090#1080
      ImageIndex = 4
      ShortCut = 117
      OnExecute = aSaveExecute
    end
    object aAddProductPart: TAction
      Caption = #1044#1086#1076#1072#1090#1080' '#1076#1077#1090#1072#1083#1100
      Hint = #1044#1086#1076#1072#1090#1080' '#1076#1077#1090#1072#1083#1100
      ImageIndex = 2
      OnExecute = aAddProductPartExecute
    end
    object aDeleteProductPart: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1076#1077#1090#1072#1083#1100
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1076#1077#1090#1072#1083#1100
      ImageIndex = 14
      OnExecute = aDeleteProductPartExecute
    end
  end
  object spStructure: TFDQuery
    CachedUpdates = True
    Connection = mainModule.cnFBConnect
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'REF_PRODUCT_STRUCTURE'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'SELECT * FROM REF_PRODUCT_STRUCTURE'
      'WHERE ID_REF_PRODUCTS = :ID AND DEL = FALSE')
    Left = 587
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object spStructureID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object spStructure_DATE: TSQLTimeStampField
      FieldName = '_DATE'
      Origin = '_DATE'
    end
    object spStructureDEL: TBooleanField
      FieldName = 'DEL'
      Origin = 'DEL'
      Required = True
    end
    object spStructureID_REF_PRODUCTS: TIntegerField
      FieldName = 'ID_REF_PRODUCTS'
      Origin = 'ID_REF_PRODUCTS'
      Required = True
    end
    object spStructureID_REF_PARTS: TIntegerField
      FieldName = 'ID_REF_PARTS'
      Origin = 'ID_REF_PARTS'
      Required = True
    end
    object spStructureQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
      Origin = 'QUANTITY'
      Required = True
    end
  end
  object dsStructure: TDataSource
    DataSet = spStructure
    Left = 664
    Top = 64
  end
  object spPartsList: TFDQuery
    CachedUpdates = True
    Connection = mainModule.cnFBConnect
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT ID, NAME, NOTES '
      'FROM REF_PARTS '
      'WHERE DEL = FALSE '
      'ORDER BY NAME')
    Left = 595
    Top = 120
  end
  object dsPartsList: TDataSource
    DataSet = spPartsList
    Left = 672
    Top = 120
  end
end
