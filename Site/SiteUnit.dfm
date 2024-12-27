object SiteFrame: TSiteFrame
  Left = 0
  Top = 0
  Width = 1149
  Height = 626
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 393
    Top = 0
    Height = 626
    ExplicitLeft = 528
    ExplicitTop = 176
    ExplicitHeight = 100
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 626
    Align = alLeft
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 1
      Top = 257
      Width = 391
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = -13
      ExplicitTop = 297
      ExplicitWidth = 400
    end
    object TabControl2: TTabControl
      Left = 1
      Top = 260
      Width = 391
      Height = 365
      Align = alClient
      TabOrder = 0
      Tabs.Strings = (
        #1055#1088#1077#1076#1099#1076#1091#1097#1080#1077' '#1086#1090#1095#1077#1090#1099)
      TabIndex = 0
      object ReportsGrid: TcxGrid
        Left = 4
        Top = 26
        Width = 383
        Height = 335
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.ScrollbarMode = sbmClassic
        object ReportsTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DM.dsPreviousProjects
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.InfoText = #1053#1086#1074#1072#1103' '#1089#1090#1088#1086#1082#1072
          OptionsBehavior.ImmediateEditor = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object ReportsTableViewProjectNumber: TcxGridDBColumn
            Caption = #8470' '#1054#1090#1095#1077#1090#1072
            DataBinding.FieldName = 'ProjectNumber'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 231
          end
          object ReportsTableViewProjectDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
            DataBinding.FieldName = 'ProjectDate'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 158
          end
        end
        object ReportsGridLevel: TcxGridLevel
          GridView = ReportsTableView
        end
      end
    end
    object TabControl3: TTabControl
      Left = 1
      Top = 1
      Width = 391
      Height = 256
      Align = alTop
      TabOrder = 1
      Tabs.Strings = (
        #1044#1072#1085#1085#1099#1077' '#1091#1095#1072#1089#1090#1082#1072)
      TabIndex = 0
      object cxDBVerticalGrid1: TcxDBVerticalGrid
        Left = 4
        Top = 26
        Width = 383
        Height = 226
        BorderStyle = cxcbsNone
        Align = alClient
        LookAndFeel.Kind = lfFlat
        LookAndFeel.ScrollbarMode = sbmClassic
        OptionsView.GridLineColor = clBtnShadow
        OptionsView.RowHeaderMinWidth = 20
        OptionsView.RowHeaderWidth = 162
        OptionsView.RowHeight = 23
        OptionsBehavior.ImmediateEditor = False
        OptionsData.CancelOnExit = False
        OptionsData.Appending = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = False
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Visible = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = True
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        TabOrder = 0
        DataController.DataSource = DM.dsProject
        Version = 1
        object cxDBVerticalGrid1ProjectDescription: TcxDBEditorRow
          Properties.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1095#1072#1089#1090#1082#1072
          Properties.DataBinding.FieldName = 'ProjectDescription'
          ID = 0
          ParentID = -1
          Index = 0
          Version = 1
        end
        object cxDBVerticalGrid1LicenseNumber: TcxDBEditorRow
          Properties.Caption = #1053#1086#1084#1077#1088' '#1083#1080#1094#1077#1085#1079#1080#1080
          Properties.DataBinding.FieldName = 'LicenseNumber'
          ID = 1
          ParentID = -1
          Index = 1
          Version = 1
        end
        object cxDBVerticalGrid1SubsoilUser: TcxDBEditorRow
          Properties.Caption = #1053#1077#1076#1088#1086#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          Properties.DataBinding.FieldName = 'SubsoilUser'
          ID = 2
          ParentID = -1
          Index = 2
          Version = 1
        end
        object cxDBVerticalGrid1ProjectNumber: TcxDBEditorRow
          Properties.Caption = #1053#1086#1084#1077#1088' '#1086#1090#1095#1077#1090#1072
          Properties.DataBinding.FieldName = 'ProjectNumber'
          ID = 3
          ParentID = -1
          Index = 3
          Version = 1
        end
        object cxDBVerticalGrid1ProjectDate: TcxDBEditorRow
          Properties.Caption = #1044#1072#1090#1072' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103' '#1086#1090#1095#1077#1090#1072
          Properties.DataBinding.FieldName = 'ProjectDate'
          ID = 4
          ParentID = -1
          Index = 4
          Version = 1
        end
        object cxDBVerticalGrid1CoordinateSystem: TcxDBEditorRow
          Properties.Caption = #1057#1080#1089#1090#1077#1084#1072' '#1082#1086#1086#1088#1076#1080#1085#1072#1090
          Properties.DataBinding.FieldName = 'CoordinateSystem'
          ID = 5
          ParentID = -1
          Index = 5
          Version = 1
        end
        object cxDBVerticalGrid1ContractNumber: TcxDBEditorRow
          Properties.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
          Properties.DataBinding.FieldName = 'ContractNumber'
          ID = 6
          ParentID = -1
          Index = 6
          Version = 1
        end
      end
    end
  end
  object TabControl1: TTabControl
    Left = 396
    Top = 0
    Width = 753
    Height = 626
    Align = alClient
    TabOrder = 1
    Tabs.Strings = (
      #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1091#1075#1083#1086#1074#1099#1093' '#1090#1086#1095#1077#1082)
    TabIndex = 0
    object ObjectCoordsGrid: TcxGrid
      Left = 4
      Top = 26
      Width = 745
      Height = 596
      Align = alClient
      TabOrder = 0
      OnEnter = ObjectCoordsGridEnter
      LookAndFeel.Kind = lfFlat
      LookAndFeel.ScrollbarMode = sbmClassic
      object ObjectCoordsTableView: TcxGridDBBandedTableView
        PopupMenu = CoordsMenu
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellClick = ObjectCoordsTableViewCellClick
        DataController.DataSource = DM.dsObjectCoords
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NewItemRow.InfoText = #1053#1086#1074#1072#1103' '#1089#1090#1088#1086#1082#1072
        NewItemRow.SeparatorWidth = 2
        OptionsBehavior.ImmediateEditor = False
        OptionsData.Appending = True
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 23
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 24
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        OptionsView.BandHeaderHeight = 24
        Bands = <
          item
            Width = 110
          end
          item
            Caption = #1044#1086#1083#1075#1086#1090#1072
          end
          item
            Caption = #1064#1080#1088#1086#1090#1072
          end
          item
          end>
        object ObjectCoordsTableViewId: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Id'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 46
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewN: TcxGridDBBandedColumn
          Caption = #8470' '#1090#1086#1095#1082#1080
          DataBinding.FieldName = 'N'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 79
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewLongDegrees: TcxGridDBBandedColumn
          Caption = #1043#1088#1072#1076#1091#1089#1099
          DataBinding.FieldName = 'LongDegrees'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewLongMinutes: TcxGridDBBandedColumn
          Caption = #1052#1080#1085#1091#1090#1099
          DataBinding.FieldName = 'LongMinutes'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewLongSeconds: TcxGridDBBandedColumn
          Caption = #1057#1077#1082#1091#1085#1076#1099
          DataBinding.FieldName = 'LongSeconds'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewLatDegrees: TcxGridDBBandedColumn
          Caption = #1043#1088#1072#1076#1091#1089#1099
          DataBinding.FieldName = 'LatDegrees'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewLatMinutes: TcxGridDBBandedColumn
          Caption = #1052#1080#1085#1091#1090#1099
          DataBinding.FieldName = 'LatMinutes'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewLatSeconds: TcxGridDBBandedColumn
          Caption = #1057#1077#1082#1091#1085#1076#1099
          DataBinding.FieldName = 'LatSeconds'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 2
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewLongitude: TcxGridDBBandedColumn
          Caption = #1044#1086#1083#1075#1086#1090#1072', '#1075#1088#1072#1076'.'
          DataBinding.FieldName = 'Longitude'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 90
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewLatitude: TcxGridDBBandedColumn
          Caption = #1064#1080#1088#1086#1090#1072', '#1075#1088#1072#1076
          DataBinding.FieldName = 'Latitude'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 90
          Position.BandIndex = 3
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewX: TcxGridDBBandedColumn
          DataBinding.FieldName = 'X'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 3
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewY: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Y'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 3
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object ObjectCoordsTableViewObjectName: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ObjectName'
          DataBinding.IsNullValueType = True
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
      end
      object ObjectCoordsGridLevel: TcxGridLevel
        GridView = ObjectCoordsTableView
      end
    end
  end
  object CoordsMenu: TPopupMenu
    Left = 546
    Top = 204
    object N1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Visible = False
      OnClick = N1Click
    end
    object N2: TMenuItem
      Action = Paste
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
    end
    object N17: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N17Click
    end
  end
  object ActionList: TActionList
    Left = 652
    Top = 152
    object Paste: TAction
      Caption = 'Paste'
      ShortCut = 16470
      OnExecute = PasteExecute
    end
  end
end
