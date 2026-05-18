object fmQueryListInput: TfmQueryListInput
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'fmQueryListInput'
  ClientHeight = 209
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 16
  object gList: TcxGrid
    Left = 0
    Top = 0
    Width = 522
    Height = 165
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'MySkinWhite'
    ExplicitTop = -2
    object gListDBTableView: TcxGridDBTableView
      OnKeyDown = gListDBTableViewKeyDown
      Navigator.Buttons.CustomButtons = <>
      FindPanel.ApplyInputDelay = 500
      FindPanel.Behavior = fcbFilter
      FindPanel.InfoText = #1055#1086#1096#1091#1082
      FindPanel.Layout = fplCompact
      FindPanel.ShowClearButton = False
      FindPanel.ShowCloseButton = False
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCellDblClick = gListDBTableViewCellDblClick
      DataController.DataSource = dsDataSet
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
      Styles.ContentOdd = dmLib.StyleGrid_odd_lightgreen
      Styles.UseOddEvenStyles = bTrue
      object gListDBTableViewNAME: TcxGridDBColumn
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        DataBinding.FieldName = 'NAME'
        DataBinding.IsNullValueType = True
        RowLayoutItem = gListDBTableViewLayoutItem3.Owner
        Width = 370
      end
      object gListDBTableViewID: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'ID'
        DataBinding.IsNullValueType = True
        Options.AutoWidthSizable = False
        RowLayoutItem = gListDBTableViewLayoutItem2.Owner
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
          Parent = gListDBTableViewAutoCreatedGroup1.Owner
          AlignHorz = ahLeft
          AlignVert = avTop
          Index = 0
        end
      end
    end
    object gListLevel1: TcxGridLevel
      GridView = gListDBTableView
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 165
    Width = 522
    Height = 44
    Align = alBottom
    Color = 16316664
    ParentBackground = False
    TabOrder = 1
    object bbOk: TcxButton
      AlignWithMargins = True
      Left = 224
      Top = 6
      Width = 164
      Height = 32
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MySkinWhite'
      OptionsImage.ImageIndex = 21
      OptionsImage.Images = dmLib.cxImageList16
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = bbOkClick
    end
    object bbCancel: TcxButton
      AlignWithMargins = True
      Left = 398
      Top = 6
      Width = 118
      Height = 32
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MySkinWhite'
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = dmLib.cxImageList16
      TabOrder = 1
      OnClick = bbCancelClick
    end
  end
  object dsDataSet: TDataSource
    Left = 280
    Top = 72
  end
end
