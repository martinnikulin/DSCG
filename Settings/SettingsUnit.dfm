object SettingsFrame: TSettingsFrame
  Left = 0
  Top = 0
  Width = 1200
  Height = 673
  TabOrder = 0
  object dxNavBar1: TdxNavBar
    Left = 0
    Top = 0
    Width = 257
    Height = 673
    Align = alLeft
    ActiveGroupIndex = 0
    TabOrder = 0
    View = 10
    OptionsStyle.DefaultStyles.Item.BackColor = clWhite
    OptionsStyle.DefaultStyles.Item.BackColor2 = clWhite
    OptionsStyle.DefaultStyles.Item.Font.Charset = DEFAULT_CHARSET
    OptionsStyle.DefaultStyles.Item.Font.Color = 12999969
    OptionsStyle.DefaultStyles.Item.Font.Height = -12
    OptionsStyle.DefaultStyles.Item.Font.Name = 'Tahoma'
    OptionsStyle.DefaultStyles.Item.Font.Style = []
    OptionsStyle.DefaultStyles.Item.AssignedValues = [savFont]
    OnLinkClick = dxNavBar1LinkClick
    object TablesGroup: TdxNavBarGroup
      Caption = #1058#1072#1073#1083#1080#1094#1099
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = RocksItem
        end
        item
          Item = AssayVarsItem
        end>
    end
    object ReservesGroup: TdxNavBarGroup
      Caption = #1047#1072#1087#1072#1089#1099
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = ConditionsItem
        end
        item
          Item = VersionsItem
        end>
    end
    object DictionariesGroup: TdxNavBarGroup
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = BoundariesItem
        end
        item
          Item = ResParamsItem
        end
        item
          Item = CoalRanksItem
        end
        item
          Item = CoalTypesItem
        end
        item
          Item = PillarsItem
        end
        item
          Item = FormationsItem
        end>
    end
    object SiteInfoGroup: TdxNavBarGroup
      Caption = #1059#1095#1072#1089#1090#1086#1082
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = SiteInfoItem
        end>
    end
    object RocksItem: TdxNavBarItem
      Caption = #1055#1086#1088#1086#1076#1099
    end
    object AssayVarsItem: TdxNavBarItem
      Tag = 1
      Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1080' '#1082#1072#1095#1077#1089#1090#1074#1072
    end
    object ConditionsItem: TdxNavBarItem
      Tag = 3
      Caption = #1050#1086#1085#1076#1080#1094#1080#1080
    end
    object VersionsItem: TdxNavBarItem
      Tag = 4
      Caption = #1042#1077#1088#1089#1080#1080' '#1087#1086#1076#1089#1095#1077#1090#1072' '#1079#1072#1087#1072#1089#1086#1074
    end
    object BoundariesItem: TdxNavBarItem
      Tag = 5
      Caption = #1043#1088#1072#1085#1080#1094#1099
    end
    object ResParamsItem: TdxNavBarItem
      Tag = 6
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1088#1086#1084#1079#1072#1087#1072#1089#1086#1074
    end
    object CoalRanksItem: TdxNavBarItem
      Tag = 7
      Caption = #1052#1072#1088#1082#1080' '#1091#1075#1083#1103
    end
    object CoalTypesItem: TdxNavBarItem
      Tag = 8
      Caption = #1058#1080#1087#1099' '#1091#1075#1083#1103
    end
    object PillarsItem: TdxNavBarItem
      Tag = 9
      Caption = #1062#1077#1083#1080#1082#1080
    end
    object FormationsItem: TdxNavBarItem
      Tag = 10
      Caption = #1057#1074#1080#1090#1099
    end
    object SiteInfoItem: TdxNavBarItem
      Tag = 11
      Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1091#1095#1072#1089#1090#1082#1091
    end
  end
  object SettingsPageControl: TcxPageControl
    Left = 257
    Top = 0
    Width = 943
    Height = 673
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = _5_BoundariesTab
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    Properties.TabHeight = 40
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    OnChange = SettingsPageControlChange
    ClientRectBottom = 672
    ClientRectLeft = 1
    ClientRectRight = 942
    ClientRectTop = 1
    object _0_RocksTab: TcxTabSheet
      Caption = #1055#1086#1088#1086#1076#1099
      ImageIndex = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RocksGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 941
        Height = 671
        Align = alClient
        TabOrder = 0
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object RocksTableView: TcxGridDBTableView
          PopupMenu = RocksPopup
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DMSettings.dsRocks
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsData.Appending = True
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object RocksTableViewlith_id: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'RockId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.AutoWidthSizable = False
            Width = 30
          end
          object RocksTableViewdescription: TcxGridDBColumn
            Caption = #1055#1086#1088#1086#1076#1072
            DataBinding.FieldName = 'description'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Width = 250
          end
          object RocksTableViewcoregroup: TcxGridDBColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'RockGroupId'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'RockGroupId'
            Properties.ListColumns = <
              item
                FieldName = 'Description'
              end>
            Properties.ListSource = DMSettings.dsRockGroups
            Visible = False
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
            Width = 136
          end
          object RocksTableViewAd: TcxGridDBColumn
            DataBinding.FieldName = 'Ad'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Width = 98
          end
          object RocksTableViewdensity: TcxGridDBColumn
            Caption = 'dda ('#1050#1086#1101#1092#1092#1080#1094#1080#1077#1090' b)'
            DataBinding.FieldName = 'Dda'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Width = 96
          end
          object RocksTableViewautocad: TcxGridDBColumn
            Caption = #1064#1090#1088#1080#1093#1086#1074#1082#1072
            DataBinding.FieldName = 'AutocadPattern'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 95
          end
          object RocksTableViewscale_autocad: TcxGridDBColumn
            Caption = #1052#1072#1089#1096#1090#1072#1073' '#1096#1090#1088#1080#1093#1086#1074#1082#1080
            DataBinding.FieldName = 'AutocadScale'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 106
          end
          object RocksTableViewa: TcxGridDBColumn
            Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' a'
            DataBinding.FieldName = 'A'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 93
          end
        end
        object RocksGridLevel1: TcxGridLevel
          GridView = RocksTableView
        end
      end
    end
    object _1_AssaysTab: TcxTabSheet
      Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1080' '#1082#1072#1095#1077#1089#1090#1074#1072
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object AssayPageControl: TcxPageControl
        Left = 0
        Top = 0
        Width = 941
        Height = 671
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = AssayTabSheet1
        Properties.CustomButtons.Buttons = <>
        Properties.TabHeight = 30
        ClientRectBottom = 669
        ClientRectLeft = 2
        ClientRectRight = 939
        ClientRectTop = 40
        object AssayTabSheet1: TcxTabSheet
          Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1080' '#1082#1072#1095#1077#1089#1090#1074#1072
          ImageIndex = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Splitter5: TSplitter
            Left = 310
            Top = 0
            Height = 629
            ExplicitLeft = 457
            ExplicitHeight = 592
          end
          object AssayGroupGrid: TcxGrid
            Left = 0
            Top = 0
            Width = 310
            Height = 629
            Align = alLeft
            TabOrder = 0
            OnExit = GridExit
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object AssayGroupTableView: TcxGridDBTableView
              PopupMenu = AssaysGroupsMenu
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Visible = False
              Navigator.Buttons.Next.Visible = False
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Insert.Visible = True
              Navigator.Buttons.Delete.Visible = True
              Navigator.Buttons.Edit.Visible = False
              Navigator.Buttons.Post.Visible = True
              Navigator.Buttons.Cancel.Visible = False
              Navigator.Buttons.Refresh.Visible = False
              Navigator.Buttons.SaveBookmark.Visible = False
              Navigator.Buttons.GotoBookmark.Visible = False
              Navigator.Buttons.Filter.Visible = False
              Navigator.InfoPanel.Visible = True
              Navigator.Visible = True
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = DMSettings.dsAssayGroups
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsBehavior.ImmediateEditor = False
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnMoving = False
              OptionsData.Appending = True
              OptionsSelection.MultiSelect = True
              OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 23
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 24
              OptionsView.Indicator = True
              object AssayGroupTableViewgroup_id: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'GroupId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 30
                Options.AutoWidthSizable = False
                Width = 30
              end
              object AssayGroupTableViewnn: TcxGridDBColumn
                Caption = #8470
                DataBinding.FieldName = 'N'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 30
                Options.AutoWidthSizable = False
                Width = 30
              end
              object AssayGroupTableViewgroupname: TcxGridDBColumn
                Caption = #1043#1088#1091#1087#1087#1072
                DataBinding.FieldName = 'GroupName'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 450
              end
            end
            object AssayGroupGridLevel1: TcxGridLevel
              GridView = AssayGroupTableView
            end
          end
          object AssayVarsGrid: TcxGrid
            Left = 313
            Top = 0
            Width = 624
            Height = 629
            Align = alClient
            TabOrder = 1
            OnExit = GridExit
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object AssayVarsTableView: TcxGridDBTableView
              PopupMenu = AssayVarsPopup
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Visible = False
              Navigator.Buttons.Next.Visible = False
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Insert.Visible = True
              Navigator.Buttons.Delete.Visible = True
              Navigator.Buttons.Edit.Visible = False
              Navigator.Buttons.Post.Visible = True
              Navigator.Buttons.Cancel.Visible = False
              Navigator.Buttons.Refresh.Visible = False
              Navigator.Buttons.SaveBookmark.Visible = False
              Navigator.Buttons.GotoBookmark.Visible = False
              Navigator.Buttons.Filter.Visible = False
              Navigator.InfoPanel.Visible = True
              Navigator.Visible = True
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = DMSettings.dsAssayVars
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsBehavior.ImmediateEditor = False
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnMoving = False
              OptionsData.Appending = True
              OptionsSelection.MultiSelect = True
              OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 23
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 24
              OptionsView.Indicator = True
              object AssayVarsTableViewvar_id: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'VarId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 30
                Options.AutoWidthSizable = False
                Width = 30
              end
              object AssayVarsTableViewnn: TcxGridDBColumn
                Caption = #8470
                DataBinding.FieldName = 'N'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 30
                Options.AutoWidthSizable = False
                Width = 30
              end
              object AssayVarsTableViewdescription: TcxGridDBColumn
                Caption = #1055#1072#1088#1072#1084#1077#1090#1088
                DataBinding.FieldName = 'Description'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 166
              end
              object AssayVarsTableViewDimension: TcxGridDBColumn
                Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100
                DataBinding.FieldName = 'Dimension'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 73
              end
              object AssayVarsTableViewactual: TcxGridDBColumn
                Caption = #1048#1089#1087'.'
                DataBinding.FieldName = 'Actual'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                HeaderHint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100
                Width = 50
              end
              object AssayVarsTableViewcomposite: TcxGridDBColumn
                Caption = #1057#1088#1077#1076#1085#1080#1077
                DataBinding.FieldName = 'Composite'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                HeaderHint = #1056#1072#1089#1089#1095#1080#1090#1099#1074#1072#1090#1100' '#1089#1088#1077#1076#1085#1080#1077
                Width = 50
              end
              object AssayVarsTableViewAssayTable: TcxGridDBColumn
                Caption = #1057#1090#1086#1087#1082#1080
                DataBinding.FieldName = 'AssayTable'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                HeaderHint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074' '#1090#1072#1073#1083#1080#1094#1072#1093' '#1087#1086#1076' '#1089#1090#1086#1087#1082#1072#1084#1080
                Width = 50
              end
              object AssayVarsTableViewAutocadText: TcxGridDBColumn
                Caption = 'Autocad'
                DataBinding.FieldName = 'AutocadText'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 85
              end
              object AssayVarsTableViewDigits: TcxGridDBColumn
                Caption = #1058#1086#1095#1085#1086#1089#1090#1100
                DataBinding.FieldName = 'Digits'
                DataBinding.IsNullValueType = True
                Width = 56
              end
            end
            object AssayVarsGridLevel1: TcxGridLevel
              GridView = AssayVarsTableView
            end
          end
        end
        object AssayTabSheet2: TcxTabSheet
          Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1080' '#1082#1072#1095#1077#1089#1090#1074#1072' '#1087#1086' '#1084#1072#1088#1082#1072#1084' '#1080' '#1090#1080#1087#1072#1084
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 937
            Height = 629
            Align = alClient
            TabOrder = 0
            object Splitter3: TSplitter
              Left = 465
              Top = 1
              Height = 627
              ExplicitLeft = 433
              ExplicitTop = 2
              ExplicitHeight = 671
            end
            object Panel3: TPanel
              Left = 468
              Top = 1
              Width = 468
              Height = 627
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Panel5: TPanel
                Left = 0
                Top = 0
                Width = 468
                Height = 55
                Align = alTop
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 0
                object Label1: TLabel
                  Left = 16
                  Top = 12
                  Width = 37
                  Height = 16
                  Caption = #1052#1072#1088#1082#1072
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label2: TLabel
                  Left = 230
                  Top = 12
                  Width = 22
                  Height = 16
                  Caption = #1058#1080#1087
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CoalRankCombo: TDBLookupComboBox
                  Left = 59
                  Top = 8
                  Width = 150
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  KeyField = 'CoalGradeId'
                  ListField = 'CoalGradeName'
                  ListSource = DMSettings.dsCoalGrades
                  ParentFont = False
                  TabOrder = 0
                  OnCloseUp = CoalRankComboCloseUp
                end
                object CoalTypeCombo: TDBLookupComboBox
                  Left = 258
                  Top = 8
                  Width = 150
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  KeyField = 'CoalTypeId'
                  ListField = 'CoaltypeName'
                  ListSource = DMSettings.dsCoalTypes
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object cxGrid3: TcxGrid
                Left = 0
                Top = 55
                Width = 468
                Height = 572
                Align = alClient
                TabOrder = 1
                OnExit = GridExit
                LookAndFeel.Kind = lfFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.ScrollbarMode = sbmClassic
                object cxGridDBTableView3: TcxGridDBTableView
                  PopupMenu = AssayVarsCRMenu
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Buttons.PriorPage.Visible = False
                  Navigator.Buttons.Prior.Visible = False
                  Navigator.Buttons.Next.Visible = False
                  Navigator.Buttons.NextPage.Visible = False
                  Navigator.Buttons.Insert.Visible = False
                  Navigator.Buttons.Delete.Visible = False
                  Navigator.Buttons.Edit.Visible = False
                  Navigator.Buttons.Post.Visible = False
                  Navigator.Buttons.Cancel.Visible = False
                  Navigator.Buttons.Refresh.Visible = False
                  Navigator.Buttons.SaveBookmark.Visible = False
                  Navigator.Buttons.GotoBookmark.Visible = False
                  Navigator.Buttons.Filter.Visible = False
                  Navigator.InfoPanel.Visible = True
                  Navigator.Visible = True
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DataSource = DMSettings.dsAssayVarsCR
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.GoToNextCellOnEnter = True
                  OptionsBehavior.FocusCellOnCycle = True
                  OptionsBehavior.ImmediateEditor = False
                  OptionsData.Appending = True
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.DataRowHeight = 23
                  OptionsView.GroupByBox = False
                  OptionsView.HeaderHeight = 24
                  OptionsView.Indicator = True
                  OptionsView.IndicatorWidth = 20
                  object cxGridDBTableView3VarId: TcxGridDBColumn
                    Caption = 'Id'
                    DataBinding.FieldName = 'VarId'
                    DataBinding.IsNullValueType = True
                    BestFitMaxWidth = 50
                    HeaderAlignmentHorz = taCenter
                    Width = 30
                  end
                  object cxGridDBTableView3N: TcxGridDBColumn
                    DataBinding.FieldName = 'N'
                    DataBinding.IsNullValueType = True
                    BestFitMaxWidth = 30
                    HeaderAlignmentHorz = taCenter
                    Width = 30
                  end
                  object cxGridDBTableView3VarName: TcxGridDBColumn
                    Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
                    DataBinding.FieldName = 'VarId'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxLookupComboBoxProperties'
                    Properties.KeyFieldNames = 'VarId'
                    Properties.ListColumns = <
                      item
                        FieldName = 'VarName'
                      end>
                    Properties.ListOptions.ShowHeader = False
                    Properties.ListSource = DM.dsAssayVars
                    HeaderAlignmentHorz = taCenter
                    Width = 314
                  end
                end
                object cxGridLevel5: TcxGridLevel
                  GridView = cxGridDBTableView3
                end
              end
            end
            object Panel2: TPanel
              Left = 1
              Top = 1
              Width = 464
              Height = 627
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              object Panel4: TPanel
                Left = 0
                Top = 0
                Width = 464
                Height = 55
                Align = alTop
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 0
                object AssayGroupCombo: TDBLookupComboBox
                  Left = 20
                  Top = 8
                  Width = 249
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  KeyField = 'GroupId'
                  ListField = 'GroupName'
                  ListSource = DMSettings.dsAssayGroups1
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object cxGrid2: TcxGrid
                Left = 0
                Top = 55
                Width = 464
                Height = 572
                Align = alClient
                TabOrder = 1
                OnExit = GridExit
                LookAndFeel.Kind = lfFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.ScrollbarMode = sbmClassic
                object cxGridDBTableView2: TcxGridDBTableView
                  PopupMenu = AssayVarsCRMenu
                  OnDblClick = cxGridDBTableView2DblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Buttons.PriorPage.Visible = False
                  Navigator.Buttons.Prior.Visible = False
                  Navigator.Buttons.Next.Visible = False
                  Navigator.Buttons.NextPage.Visible = False
                  Navigator.Buttons.Insert.Visible = False
                  Navigator.Buttons.Delete.Visible = False
                  Navigator.Buttons.Edit.Visible = False
                  Navigator.Buttons.Post.Visible = False
                  Navigator.Buttons.Cancel.Visible = False
                  Navigator.Buttons.Refresh.Visible = False
                  Navigator.Buttons.SaveBookmark.Visible = False
                  Navigator.Buttons.GotoBookmark.Visible = False
                  Navigator.Buttons.Filter.Visible = False
                  Navigator.InfoPanel.Visible = True
                  Navigator.Visible = True
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DataSource = DMSettings.dsAssayVars1
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.GoToNextCellOnEnter = True
                  OptionsBehavior.FocusCellOnCycle = True
                  OptionsBehavior.ImmediateEditor = False
                  OptionsData.Appending = True
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.DataRowHeight = 23
                  OptionsView.GroupByBox = False
                  OptionsView.HeaderHeight = 24
                  OptionsView.Indicator = True
                  OptionsView.IndicatorWidth = 20
                  object cxGridDBTableView2var_id: TcxGridDBColumn
                    Caption = 'Id'
                    DataBinding.FieldName = 'VarId'
                    DataBinding.IsNullValueType = True
                    BestFitMaxWidth = 50
                    HeaderAlignmentHorz = taCenter
                    Width = 47
                  end
                  object cxGridDBTableView2description: TcxGridDBColumn
                    Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
                    DataBinding.FieldName = 'description'
                    DataBinding.IsNullValueType = True
                    HeaderAlignmentHorz = taCenter
                    Width = 396
                  end
                end
                object cxGridLevel4: TcxGridLevel
                  GridView = cxGridDBTableView2
                end
              end
            end
          end
        end
      end
    end
    object _2_ColumnVarsTab: TcxTabSheet
      Caption = #1052#1072#1088#1082#1080
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object _3_CondsTab: TcxTabSheet
      Caption = #1050#1086#1085#1076#1080#1094#1080#1080
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object CondDefsGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 941
        Height = 671
        Align = alClient
        TabOrder = 0
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object CondDefsTableView: TcxGridDBTableView
          PopupMenu = CondDefsMenu
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DMSettings.dsCondDefs
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsBehavior.ImmediateEditor = False
          OptionsData.Appending = True
          OptionsSelection.MultiSelect = True
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object CondDefsTableViewsection: TcxGridDBColumn
            Caption = #1056#1072#1079#1076#1077#1083
            DataBinding.FieldName = 'section'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              #1055#1088#1086#1089#1083#1086#1081
              #1047#1086#1083#1100#1085#1086#1089#1090#1100
              #1052#1086#1097#1085#1086#1089#1090#1100)
            Visible = False
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 106
          end
          object CondDefsTableViewnn: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'N'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.AutoWidthSizable = False
            Width = 30
          end
          object CondDefsTableViewcondname: TcxGridDBColumn
            Caption = #1050#1086#1085#1076#1080#1094#1080#1103
            DataBinding.FieldName = 'CondName'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 145
          end
          object CondDefsTableViewactual: TcxGridDBColumn
            Caption = #1040#1082#1090#1091#1072#1083#1100#1085#1099#1081
            DataBinding.FieldName = 'Actual'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 149
          end
        end
        object CondDefsGridLevel1: TcxGridLevel
          GridView = CondDefsTableView
        end
      end
    end
    object _4_VersionsTab: TcxTabSheet
      Caption = #1042#1077#1088#1089#1080#1080' '#1087#1086#1076#1089#1095#1077#1090#1072' '#1079#1072#1087#1072#1089#1086#1074
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object VersionsGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 941
        Height = 671
        Align = alClient
        TabOrder = 0
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object VersionsTableView: TcxGridDBTableView
          PopupMenu = VersionsMenu
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DMSettings.dsVersions
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsBehavior.ImmediateEditor = False
          OptionsData.Appending = True
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          object VersionsTableViewVersionId: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'VersionId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.AutoWidthSizable = False
            Width = 30
          end
          object VersionsTableViewVersionName: TcxGridDBColumn
            Caption = #1042#1077#1088#1089#1080#1103
            DataBinding.FieldName = 'VersionName'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 127
          end
          object VersionsTableViewDescription: TcxGridDBColumn
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            DataBinding.FieldName = 'Description'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 500
          end
        end
        object VersionsGridLevel1: TcxGridLevel
          GridView = VersionsTableView
        end
      end
    end
    object _5_BoundariesTab: TcxTabSheet
      Caption = #1043#1088#1072#1085#1080#1094#1099
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Splitter10: TSplitter
        Left = 0
        Top = 276
        Width = 941
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitLeft = 2
        ExplicitTop = 288
        ExplicitWidth = 927
      end
      object BoundaryGrid: TcxGrid
        Left = 0
        Top = 35
        Width = 941
        Height = 241
        Align = alTop
        TabOrder = 0
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object BoundaryTableView: TcxGridDBTableView
          PopupMenu = BoundMenu
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DMSettings.dsBoundaries
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsBehavior.ImmediateEditor = False
          OptionsData.Appending = True
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'Id'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.AutoWidthSizable = False
            Width = 30
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'N'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.AutoWidthSizable = False
            Width = 30
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'Name'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 250
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FullName'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 414
          end
          object BoundaryTableViewActual: TcxGridDBColumn
            Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100
            DataBinding.FieldName = 'Actual'
            DataBinding.IsNullValueType = True
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 97
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = BoundaryTableView
        end
      end
      object BoundaryRelsGrid: TcxGrid
        Left = 0
        Top = 279
        Width = 941
        Height = 392
        Align = alClient
        TabOrder = 1
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object BoundaryRelsTableView: TcxGridDBTableView
          PopupMenu = BoundRefsMenu
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DMSettings.dsBoundRefs
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsBehavior.ImmediateEditor = False
          OptionsData.Appending = True
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object BoundaryRelsTableViewrefname: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072#1088#1085#1072#1103' '#1075#1088#1072#1085#1080#1094#1072
            DataBinding.FieldName = 'RefId'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'Name'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DMSettings.dsBoundSummary
            HeaderAlignmentHorz = taCenter
            Width = 250
          end
          object BoundaryRelsTableViewoperator: TcxGridDBColumn
            Caption = '+/-'
            DataBinding.FieldName = 'Operator'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Items.Strings = (
              '+'
              '-')
            HeaderAlignmentHorz = taCenter
            Width = 43
          end
          object BoundaryRelsTableViewitemname: TcxGridDBColumn
            Caption = #1044#1077#1090#1072#1083#1100#1085#1072#1103' '#1075#1088#1072#1085#1080#1094#1072
            DataBinding.FieldName = 'ItemId'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'Name'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DMSettings.dsBoundDetail
            HeaderAlignmentHorz = taCenter
            Width = 250
          end
        end
        object BoundaryRelsGridLevel1: TcxGridLevel
          GridView = BoundaryRelsTableView
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 941
        Height = 35
        Align = alTop
        TabOrder = 2
        object BoundTypesCombo: TDBLookupComboBox
          Left = 6
          Top = 5
          Width = 255
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'BoundType'
          ListField = 'BoundName'
          ListSource = DMSettings.dsBoundTypes
          ParentFont = False
          TabOrder = 0
          OnCloseUp = BoundTypesComboCloseUp
        end
      end
    end
    object _6_ResParamsTab: TcxTabSheet
      Caption = '_6_ResParamsTab'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object TabControl1: TTabControl
        Left = 0
        Top = 0
        Width = 617
        Height = 671
        Align = alLeft
        TabOrder = 0
        Tabs.Strings = (
          #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1088#1086#1084#1079#1072#1087#1072#1089#1086#1074)
        TabIndex = 0
        object ResParamsGrid: TcxDBVerticalGrid
          Left = 4
          Top = 26
          Width = 609
          Height = 641
          BorderStyle = cxcbsNone
          Align = alClient
          LookAndFeel.Kind = lfFlat
          LookAndFeel.ScrollbarMode = sbmClassic
          OptionsView.GridLineColor = clBtnShadow
          OptionsView.RowHeaderWidth = 396
          OptionsView.RowHeight = 23
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Enabled = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          TabOrder = 0
          DataController.DataSource = DMSettings.dsResParams
          DataController.GridMode = True
          Version = 1
          object ResParamsGridA: TcxDBEditorRow
            Properties.Caption = #1064#1080#1088#1080#1085#1072' '#1101#1082#1089#1082#1072#1074#1072#1090#1086#1088#1085#1086#1081' '#1079#1072#1093#1086#1076#1082#1080', '#1084'.'
            Properties.DataBinding.FieldName = 'A'
            ID = 0
            ParentID = -1
            Index = 0
            Version = 1
          end
          object ResParamsGridBeta: TcxDBEditorRow
            Properties.Caption = #1059#1075#1086#1083' '#1086#1090#1082#1086#1089#1072' '#1091#1089#1090#1091#1087#1072', '#1084'.'
            Properties.DataBinding.FieldName = 'Beta'
            ID = 1
            ParentID = -1
            Index = 1
            Version = 1
          end
          object ResParamsGridH: TcxDBEditorRow
            Properties.Caption = #1042#1099#1089#1086#1090#1072' '#1091#1089#1090#1091#1087#1072', '#1084'.'
            Properties.DataBinding.FieldName = 'H'
            ID = 2
            ParentID = -1
            Index = 2
            Version = 1
          end
          object ResParamsGridB: TcxDBEditorRow
            Properties.Caption = #1055#1072#1088#1072#1084#1077#1090#1088' '#1090#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082#1072' '#1074#1079#1088#1099#1074#1072#1085#1080#1103', '#1084'.'
            Properties.DataBinding.FieldName = 'B'
            ID = 3
            ParentID = -1
            Index = 3
            Version = 1
          end
          object ResParamsGridPTransportBVR: TcxDBEditorRow
            Properties.Caption = #1055#1086#1090#1077#1088#1080' '#1087#1088#1080' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082#1080' '#1080' '#1041#1042#1056', %'
            Properties.DataBinding.FieldName = 'PTransportBVR'
            ID = 4
            ParentID = -1
            Index = 4
            Version = 1
          end
          object ResParamsGridKrovla1: TcxDBEditorRow
            Properties.Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1087#1072#1095#1082#1080' '#1074' '#1082#1088#1086#1074#1083#1077' '#1087#1088#1080' '#1087#1072#1076#1077#1085#1080#1080' '#1087#1083#1072#1090#1072' <= 15 '#1075#1088#1072#1076'., '#1084'.'
            Properties.DataBinding.FieldName = 'Krovla1'
            ID = 5
            ParentID = -1
            Index = 5
            Version = 1
          end
          object ResParamsGridKrovla2: TcxDBEditorRow
            Properties.Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1087#1072#1095#1082#1080' '#1074' '#1082#1088#1086#1074#1083#1077' '#1087#1088#1080' '#1087#1072#1076#1077#1085#1080#1080' '#1087#1083#1072#1090#1072' <= 30 '#1075#1088#1072#1076'., '#1084'.'
            Properties.DataBinding.FieldName = 'Krovla2'
            ID = 6
            ParentID = -1
            Index = 6
            Version = 1
          end
          object ResParamsGridKrovla3: TcxDBEditorRow
            Properties.Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1087#1072#1095#1082#1080' '#1074' '#1082#1088#1086#1074#1083#1077' '#1087#1088#1080' '#1087#1072#1076#1077#1085#1080#1080' '#1087#1083#1072#1090#1072' > 30 '#1075#1088#1072#1076'., '#1084'.'
            Properties.DataBinding.FieldName = 'Krovla3'
            ID = 7
            ParentID = -1
            Index = 7
            Version = 1
          end
          object ResParamsGridPochva: TcxDBEditorRow
            Properties.Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1087#1072#1095#1082#1080' '#1074' '#1087#1086#1095#1074#1077', '#1084'.'
            Properties.DataBinding.FieldName = 'Pochva'
            ID = 8
            ParentID = -1
            Index = 8
            Version = 1
          end
          object ResParamsGridVerch: TcxDBEditorRow
            Properties.Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1087#1072#1095#1082#1080' '#1085#1072' '#1074#1077#1088#1093#1085#1077#1081' '#1087#1083#1086#1097#1072#1076#1082#1077', '#1084'.'
            Properties.DataBinding.FieldName = 'Verch'
            ID = 9
            ParentID = -1
            Index = 9
            Version = 1
          end
          object ResParamsGridOkont: TcxDBEditorRow
            Properties.Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1087#1072#1095#1082#1080' '#1087#1088#1080' '#1086#1082#1086#1085#1090#1091#1088#1080#1074#1072#1085#1080#1080', '#1084'.'
            Properties.DataBinding.FieldName = 'Okont'
            ID = 10
            ParentID = -1
            Index = 10
            Version = 1
          end
          object ResParamsGridZasorPochva: TcxDBEditorRow
            Properties.Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1087#1072#1095#1082#1080' '#1079#1072#1089#1086#1088#1077#1085#1080#1103' '#1082#1088#1086#1074#1083#1080', '#1084'.'
            Properties.DataBinding.FieldName = 'ZasorPochva'
            ID = 11
            ParentID = -1
            Index = 11
            Version = 1
          end
          object ResParamsGridZasorKrovla: TcxDBEditorRow
            Properties.Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1087#1072#1095#1082#1080' '#1079#1072#1089#1086#1088#1077#1085#1080#1103' '#1087#1086#1095#1074#1099', '#1084'.'
            Properties.DataBinding.FieldName = 'ZasorKrovla'
            ID = 12
            ParentID = -1
            Index = 12
            Version = 1
          end
        end
      end
    end
    object _7_DictTab: TcxTabSheet
      Caption = #1044#1088#1091#1075#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DictGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 941
        Height = 671
        Align = alClient
        TabOrder = 0
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object DictTableView: TcxGridDBTableView
          PopupMenu = DictMenu
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DMSettings.dsDictionary
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsBehavior.ImmediateEditor = False
          OptionsData.Appending = True
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'DictionaryId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.AutoWidthSizable = False
            Width = 30
          end
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'N'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.AutoWidthSizable = False
            Width = 30
          end
          object cxGridDBColumn9: TcxGridDBColumn
            Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'Description'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 250
          end
          object cxGridDBColumn10: TcxGridDBColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FullDesc'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 460
          end
          object DictTableViewsection: TcxGridDBColumn
            DataBinding.FieldName = 'section'
            DataBinding.IsNullValueType = True
            Visible = False
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = DictTableView
        end
      end
    end
    object _8_SiteTab: TcxTabSheet
      Caption = '_8_SiteTab'
      ImageIndex = 8
      inline SiteFrame: TSiteFrame
        Left = 0
        Top = 0
        Width = 941
        Height = 671
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 941
        ExplicitHeight = 671
        inherited Splitter1: TSplitter
          Height = 671
          ExplicitHeight = 671
        end
        inherited Panel3: TPanel
          Height = 671
          ExplicitHeight = 671
          inherited TabControl2: TTabControl
            Height = 410
            ExplicitHeight = 410
            inherited ReportsGrid: TcxGrid
              Height = 380
              ExplicitHeight = 380
              inherited ReportsTableView: TcxGridDBTableView
                inherited ReportsTableViewProjectNumber: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited ReportsTableViewProjectDate: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
          end
          inherited TabControl3: TTabControl
            inherited cxDBVerticalGrid1: TcxDBVerticalGrid
              Version = 1
              inherited cxDBVerticalGrid1ProjectDescription: TcxDBEditorRow
                ID = 0
                ParentID = -1
                Index = 0
                Version = 1
              end
              inherited cxDBVerticalGrid1LicenseNumber: TcxDBEditorRow
                ID = 1
                ParentID = -1
                Index = 1
                Version = 1
              end
              inherited cxDBVerticalGrid1SubsoilUser: TcxDBEditorRow
                ID = 2
                ParentID = -1
                Index = 2
                Version = 1
              end
              inherited cxDBVerticalGrid1ProjectNumber: TcxDBEditorRow
                ID = 3
                ParentID = -1
                Index = 3
                Version = 1
              end
              inherited cxDBVerticalGrid1ProjectDate: TcxDBEditorRow
                ID = 4
                ParentID = -1
                Index = 4
                Version = 1
              end
              inherited cxDBVerticalGrid1CoordinateSystem: TcxDBEditorRow
                ID = 5
                ParentID = -1
                Index = 5
                Version = 1
              end
              inherited cxDBVerticalGrid1ContractNumber: TcxDBEditorRow
                ID = 6
                ParentID = -1
                Index = 6
                Version = 1
              end
            end
          end
        end
        inherited TabControl1: TTabControl
          Width = 545
          Height = 671
          ExplicitWidth = 545
          ExplicitHeight = 671
          inherited ObjectCoordsGrid: TcxGrid
            Width = 537
            Height = 641
            ExplicitWidth = 537
            ExplicitHeight = 641
            inherited ObjectCoordsTableView: TcxGridDBBandedTableView
              inherited ObjectCoordsTableViewId: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewN: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewLongDegrees: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewLongMinutes: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewLongSeconds: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewLatDegrees: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewLatMinutes: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewLatSeconds: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewLongitude: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewLatitude: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewX: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewY: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
              inherited ObjectCoordsTableViewObjectName: TcxGridDBBandedColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
        end
      end
    end
  end
  object RocksMenu: TPopupMenu
    Left = 20
    Top = 382
    object N52: TMenuItem
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1089#1088#1077#1076#1085#1102#1102' Ad '#1076#1083#1103' '#1087#1086#1088#1086#1076
      OnClick = N52Click
    end
    object N43: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N43Click
    end
  end
  object AssaysGroupsMenu: TPopupMenu
    Left = 96
    Top = 384
    object N1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N1Click
    end
  end
  object AssayVarsMenu: TPopupMenu
    Left = 176
    Top = 384
    object N3: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1088#1080#1079#1085#1072#1082' "'#1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100'" '#1076#1083#1103' '#1074#1089#1077#1093' '#1087#1086#1082#1072#1079#1072#1090#1077#1083#1077#1081
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1057#1085#1103#1090#1100' '#1087#1088#1080#1079#1085#1072#1082' "'#1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100'" '#1076#1083#1103' '#1074#1089#1077#1093' '#1087#1086#1082#1072#1079#1072#1090#1077#1083#1077#1081
      OnClick = N4Click
    end
    object MenuItem3: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem3Click
    end
  end
  object AssayVarsCRMenu: TPopupMenu
    Left = 248
    Top = 384
    object MenuItem8: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem8Click
    end
  end
  object CondDefsMenu: TPopupMenu
    Left = 16
    Top = 448
    object MenuItem6: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem6Click
    end
  end
  object VariantsMenu: TPopupMenu
    Left = 96
    Top = 448
    object N53: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N53Click
    end
    object N62: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1074#1072#1088#1080#1072#1085#1090#1099' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1088#1086#1089#1083#1086#1103
      OnClick = N62Click
    end
  end
  object VersionsMenu: TPopupMenu
    Left = 176
    Top = 448
    object MenuItem2: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1077#1088#1089#1080#1102
      OnClick = MenuItem2Click
    end
    object MenuItem1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem1Click
    end
  end
  object BoundMenu: TPopupMenu
    Left = 24
    Top = 512
    object MenuItem4: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem4Click
    end
  end
  object BoundRefsMenu: TPopupMenu
    Left = 96
    Top = 512
    object MenuItem5: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem5Click
    end
  end
  object DictMenu: TPopupMenu
    Left = 176
    Top = 512
    object MenuItem7: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem7Click
    end
  end
  object RocksPopup: TPopupMenu
    Left = 321
    Top = 328
    object N2: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem9Click
    end
  end
  object AssayVarsPopup: TPopupMenu
    Left = 321
    Top = 384
    object MenuItem9: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem9Click
    end
  end
end
