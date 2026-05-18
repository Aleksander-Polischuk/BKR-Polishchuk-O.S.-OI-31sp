object fmProduct: TfmProduct
  Left = 0
  Top = 0
  Caption = #1043#1086#1090#1086#1074#1110' '#1074#1080#1088#1086#1073#1080
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
      object gListDBTableViewARTICLE: TcxGridDBColumn
        Caption = #1040#1088#1090#1080#1082#1091#1083
        DataBinding.FieldName = 'ARTICLE'
        DataBinding.IsNullValueType = True
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
  object spList: TFDQuery
    Connection = mainModule.cnFBConnect
    SQL.Strings = (
      'select * from REF_PRODUCTS')
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
