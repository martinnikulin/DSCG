object BoreholesFrame: TBoreholesFrame
  Left = 0
  Top = 0
  Width = 1400
  Height = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Splitter15: TSplitter
    Left = 600
    Top = 0
    Height = 800
    ExplicitLeft = 633
    ExplicitTop = -79
    ExplicitHeight = 715
  end
  object Panel11: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 800
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter14: TSplitter
      Left = 0
      Top = 601
      Width = 600
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 593
      ExplicitWidth = 633
    end
    object SurveyGrid: TcxGrid
      Left = 0
      Top = 604
      Width = 600
      Height = 196
      Align = alBottom
      TabOrder = 0
      OnExit = GridExit
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmClassic
      object SurveyGridTableView: TcxGridDBTableView
        PopupMenu = SurveyMenu
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DMBoreholes.dsSurvey
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.IncSearch = True
        OptionsBehavior.ExpandMasterRowOnDblClick = False
        OptionsBehavior.FocusCellOnCycle = True
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Appending = True
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 23
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 24
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        object SurveyGridTableViewdepth: TcxGridDBColumn
          Caption = #1043#1083#1091#1073#1080#1085#1072
          DataBinding.FieldName = 'Depth'
          DataBinding.IsNullValueType = True
        end
        object SurveyGridTableViewdip: TcxGridDBColumn
          Caption = #1059#1075#1086#1083
          DataBinding.FieldName = 'Dip'
          DataBinding.IsNullValueType = True
        end
        object SurveyGridTableViewazimuth: TcxGridDBColumn
          Caption = #1040#1079#1080#1084#1091#1090
          DataBinding.FieldName = 'Azimuth'
          DataBinding.IsNullValueType = True
        end
      end
      object SurveyGridLevel1: TcxGridLevel
        GridView = SurveyGridTableView
      end
    end
    object BHGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 600
      Height = 601
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = GridExit
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmClassic
      object BHTableView: TcxGridDBTableView
        PopupMenu = CoordsMenu
        OnKeyDown = BHTableViewKeyDown
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        FilterBox.Visible = fvNever
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DMBoreholes.dsBoreholes
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.IncSearch = True
        OptionsBehavior.ExpandMasterRowOnDblClick = False
        OptionsBehavior.FocusCellOnCycle = True
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.Appending = True
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 23
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 24
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = 'Id'
          DataBinding.FieldName = 'BoreholeId'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 30
          Options.Editing = False
          Options.Filtering = False
          Options.AutoWidthSizable = False
          Width = 30
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = #1058#1080#1087
          DataBinding.FieldName = 'HoleType'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownWidth = 100
          Properties.KeyFieldNames = 'Id'
          Properties.ListColumns = <
            item
              FieldName = 'HoleTypeName'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DM.dsHoleTypes
          HeaderAlignmentHorz = taCenter
          Options.IncSearch = False
          Width = 65
        end
        object cxGridDBColumn4: TcxGridDBColumn
          Caption = #1057#1082#1074#1072#1078#1080#1085#1072
          DataBinding.FieldName = 'HoleName'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 70
          Options.Filtering = False
          Width = 70
        end
        object cxGridDBColumn5: TcxGridDBColumn
          DataBinding.FieldName = 'X'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 0
          Options.Filtering = False
          Options.IncSearch = False
          Width = 76
        end
        object cxGridDBColumn6: TcxGridDBColumn
          DataBinding.FieldName = 'Y'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 0
          Options.Filtering = False
          Options.IncSearch = False
          Width = 80
        end
        object cxGridDBColumn7: TcxGridDBColumn
          DataBinding.FieldName = 'Z'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 0
          Options.Filtering = False
          Options.IncSearch = False
          Width = 73
        end
        object cxGridDBColumn8: TcxGridDBColumn
          Caption = #1043#1083#1091#1073#1080#1085#1072
          DataBinding.FieldName = 'Depth'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 0
          Options.Filtering = False
          Options.IncSearch = False
          Width = 79
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = BHTableView
      end
    end
  end
  object Panel21: TPanel
    Left = 603
    Top = 0
    Width = 797
    Height = 800
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter16: TSplitter
      Left = 0
      Top = 305
      Width = 797
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 233
      ExplicitWidth = 947
    end
    object TabControl1: TTabControl
      Left = 0
      Top = 0
      Width = 797
      Height = 305
      Align = alTop
      TabOrder = 0
      Tabs.Strings = (
        #1056#1072#1079#1074#1077#1076#1086#1095#1085#1099#1077' '#1083#1080#1085#1080#1080)
      TabIndex = 0
      object SLGrid: TcxGrid
        Left = 4
        Top = 24
        Width = 789
        Height = 277
        Align = alClient
        PopupMenu = SLHMenu
        TabOrder = 0
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object SLGridTableView: TcxGridDBTableView
          PopupMenu = SLMenu
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DMBoreholes.dsSurveyLines
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Appending = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object SLGridTableViewsl_id: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'LineId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.Editing = False
            Options.AutoWidthSizable = False
            Width = 30
          end
          object SLGridTableViewnn: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'N'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.AutoWidthSizable = False
            Width = 30
          end
          object SLGridTableViewdescription: TcxGridDBColumn
            Caption = #1056#1072#1079#1074#1077#1076#1086#1095#1085#1072#1103' '#1083#1080#1085#1080#1103
            DataBinding.FieldName = 'Description'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 232
          end
          object SLGridTableViewsltypename: TcxGridDBColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'LineType'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownWidth = 150
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'SLTypeName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DM.dsLineTypes
            HeaderAlignmentHorz = taCenter
            Width = 139
          end
          object SLGridTableViewX1: TcxGridDBColumn
            Caption = 'X '#1085#1072#1095#1072#1083#1072
            DataBinding.FieldName = 'X1'
            DataBinding.IsNullValueType = True
            Width = 101
          end
          object SLGridTableViewY1: TcxGridDBColumn
            Caption = 'Y '#1085#1072#1095#1072#1083#1072
            DataBinding.FieldName = 'Y1'
            DataBinding.IsNullValueType = True
            Width = 101
          end
          object SLGridTableViewX2: TcxGridDBColumn
            Caption = 'X '#1082#1086#1085#1094#1072
            DataBinding.FieldName = 'X2'
            DataBinding.IsNullValueType = True
            Width = 101
          end
          object SLGridTableViewY2: TcxGridDBColumn
            Caption = 'Y '#1082#1086#1085#1094#1072
            DataBinding.FieldName = 'Y2'
            DataBinding.IsNullValueType = True
            Width = 72
          end
          object SLGridTableViewCalcSpreadAzimuths: TcxGridDBColumn
            DataBinding.FieldName = 'Lock'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 58
          end
        end
        object SLGridLevel1: TcxGridLevel
          GridView = SLGridTableView
        end
      end
    end
    object TabControl2: TTabControl
      Left = 0
      Top = 308
      Width = 797
      Height = 492
      Align = alClient
      TabOrder = 1
      Tabs.Strings = (
        #1057#1082#1074#1072#1078#1080#1085#1099' '#1074' '#1088#1072#1079#1074#1077#1076#1086#1095#1085#1099#1093' '#1083#1080#1085#1080#1103#1093)
      TabIndex = 0
      DesignSize = (
        797
        492)
      object SLHGrid: TcxGrid
        Left = 4
        Top = 24
        Width = 789
        Height = 464
        Align = alClient
        BevelKind = bkTile
        TabOrder = 0
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object SLHGridTableView: TcxGridDBTableView
          PopupMenu = SLHMenu
          OnKeyDown = SLHGridTableViewKeyDown
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          OnFocusedRecordChanged = SLHGridTableViewFocusedRecordChanged
          DataController.DataSource = DMBoreholes.dsLineHoles
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object SLHGridTableViewhole_id: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'BoreholeId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.Editing = False
            Options.AutoWidthSizable = False
            Width = 30
          end
          object SLHGridTableViewnn: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'N'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.AutoWidthSizable = False
            Options.Grouping = False
            Options.Moving = False
            Width = 30
          end
          object SLHGridTableViewholename: TcxGridDBColumn
            Caption = #1057#1082#1074
            DataBinding.FieldName = 'HoleName'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 64
          end
          object SLHGridTableViewnode: TcxGridDBColumn
            Caption = #1059#1079#1077#1083
            DataBinding.FieldName = 'node'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object SLHGridTableViewshift: TcxGridDBColumn
            Caption = #1040#1079#1080#1084#1091#1090' '#1087#1088#1086#1077#1082#1094#1080#1080
            DataBinding.FieldName = 'shift'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.Grouping = False
            Options.Moving = False
            Width = 98
          end
          object SLHGridTableViewonprofile: TcxGridDBColumn
            Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100
            DataBinding.FieldName = 'onprofile'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 81
          end
          object SLHGridTableViewX: TcxGridDBColumn
            DataBinding.FieldName = 'X'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 90
          end
          object SLHGridTableViewY: TcxGridDBColumn
            DataBinding.FieldName = 'Y'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 90
          end
          object SLHGridTableViewZ: TcxGridDBColumn
            DataBinding.FieldName = 'Z'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 90
          end
        end
        object SLHGridLevel1: TcxGridLevel
          GridView = SLHGridTableView
        end
      end
      object CheckBox3: TCheckBox
        Left = 649
        Top = 2
        Width = 145
        Height = 17
        Anchors = [akTop, akRight]
        Caption = #1055#1086' '#1088#1072#1079#1074#1077#1076#1086#1095#1085#1099#1084' '#1083#1080#1085#1080#1103#1084
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox3Click
      end
    end
  end
  object SLHMenu: TPopupMenu
    Left = 674
    Top = 572
    object N57: TMenuItem
      Caption = #1055#1088#1080#1089#1074#1086#1080#1090#1100' '#1089#1082#1074#1072#1078#1080#1085#1072#1084' '#1085#1086#1084#1077#1088#1072' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091
      OnClick = N57Click
    end
    object N13: TMenuItem
      Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100' '#1072#1079#1080#1084#1091#1090' '#1087#1088#1086#1077#1082#1094#1080#1080
      OnClick = N13Click
    end
    object N21: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N21Click
    end
  end
  object SurveyMenu: TPopupMenu
    Left = 72
    Top = 672
    object N15: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N15Click
    end
  end
  object CoordsMenu: TPopupMenu
    Left = 82
    Top = 164
    object N40: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1082#1074#1072#1078#1080#1085#1091' '#1089#1086' '#1074#1089#1077#1084#1080' '#1077#1077' '#1076#1072#1085#1085#1099#1084#1080
      OnClick = N40Click
    end
    object N17: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N17Click
    end
  end
  object SLMenu: TPopupMenu
    Left = 666
    Top = 76
    object N1: TMenuItem
      Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1082#1086#1085#1094#1086#1074' '#1101#1090#1086#1081' '#1083#1080#1085#1080#1080
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1082#1086#1085#1094#1086#1074' '#1076#1083#1103' '#1074#1089#1077#1093' '#1083#1080#1085#1080#1081
      OnClick = N3Click
    end
    object N24: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N24Click
    end
  end
end
