object LithologyFrame: TLithologyFrame
  Left = 0
  Top = 0
  Width = 1750
  Height = 750
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  TabOrder = 0
  PixelsPerInch = 120
  object Splitter4: TSplitter
    Left = 368
    Top = 0
    Height = 750
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  object Panel1: TPanel
    Left = 371
    Top = 0
    Width = 1379
    Height = 750
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 0
      Top = 231
      Width = 1379
      Height = 4
      Cursor = crVSplit
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
    end
    object Panel3: TPanel
      Left = 0
      Top = 235
      Width = 1379
      Height = 515
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        1379
        515)
      object Splitter3: TSplitter
        Left = 0
        Top = 306
        Width = 1379
        Height = 4
        Cursor = crVSplit
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
      end
      object LithologyPageControl: TPageControl
        Left = 0
        Top = 0
        Width = 1379
        Height = 306
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = TabSheet1
        Align = alTop
        TabOrder = 0
        object TabSheet1: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1051#1080#1090#1086#1083#1086#1075#1080#1103
          object LithologyGrid: TcxGrid
            Left = 0
            Top = 0
            Width = 1371
            Height = 276
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            TabOrder = 0
            OnExit = GridExit
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object LithologyTableView: TcxGridDBTableView
              PopupMenu = LithologyMenu
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.First.Visible = True
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Visible = False
              Navigator.Buttons.Next.Visible = False
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Last.Visible = True
              Navigator.Buttons.Edit.Enabled = False
              Navigator.Buttons.Edit.Visible = False
              Navigator.Buttons.Cancel.Enabled = False
              Navigator.Buttons.Cancel.Visible = False
              Navigator.Buttons.Refresh.Visible = False
              Navigator.Buttons.SaveBookmark.Visible = False
              Navigator.Buttons.GotoBookmark.Visible = False
              Navigator.Buttons.Filter.Enabled = False
              Navigator.Buttons.Filter.Visible = False
              Navigator.InfoPanel.Visible = True
              Navigator.Visible = True
              ScrollbarAnnotations.CustomAnnotations = <>
              OnCustomDrawCell = LithologyTableViewCustomDrawCell
              OnFocusedRecordChanged = LithologyTableViewFocusedRecordChanged
              DataController.DataSource = DMLithology.dsLithology
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.SeparatorWidth = 8
              FixedDataRows.SeparatorWidth = 8
              NewItemRow.SeparatorWidth = 8
              OptionsBehavior.ImmediateEditor = False
              OptionsData.Appending = True
              OptionsSelection.MultiSelect = True
              OptionsView.NavigatorOffset = 63
              OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 23
              OptionsView.FixedColumnSeparatorWidth = 3
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 24
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 25
              Preview.LeftIndent = 25
              Preview.RightIndent = 6
              RowLayout.MinValueWidth = 100
              object LithologyTableViewLithologyId: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'LithologyId'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 38
              end
              object LithologyTableViewBoreholeId: TcxGridDBColumn
                DataBinding.FieldName = 'BoreholeId'
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 88
              end
              object LithologyTableViewDepthFrom: TcxGridDBColumn
                Caption = #1054#1090
                DataBinding.FieldName = 'DepthFrom'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 88
              end
              object LithologyTableViewDepthTo: TcxGridDBColumn
                Caption = #1044#1086
                DataBinding.FieldName = 'DepthTo'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 88
              end
              object LithologyTableViewAngle: TcxGridDBColumn
                Caption = #1059#1075#1086#1083
                DataBinding.FieldName = 'Angle'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 88
              end
              object LithologyTableViewTh: TcxGridDBColumn
                Caption = #1052' '#1086#1089#1077#1074#1072#1103
                DataBinding.FieldName = 'Th'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 88
              end
              object LithologyTableViewThNorm: TcxGridDBColumn
                Caption = #1052' '#1085#1086#1088#1084
                DataBinding.FieldName = 'ThNorm'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 88
              end
              object LithologyTableViewCore: TcxGridDBColumn
                Caption = #1050#1077#1088#1085
                DataBinding.FieldName = 'Core'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 88
              end
              object LithologyTableViewCoreNorm: TcxGridDBColumn
                Caption = #1050#1077#1088#1085' '#1085#1086#1088#1084
                DataBinding.FieldName = 'CoreNorm'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 88
              end
              object LithologyTableViewCoreProc: TcxGridDBColumn
                Caption = #1050#1077#1088#1085' %'
                DataBinding.FieldName = 'CoreProc'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 88
              end
              object LithologyTableViewRockId: TcxGridDBColumn
                Caption = #1050#1086#1076' '#1087#1086#1088#1086#1076#1099
                DataBinding.FieldName = 'RockId'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 88
              end
              object LithologyTableViewRockName: TcxGridDBColumn
                Caption = #1055#1086#1088#1086#1076#1072
                DataBinding.FieldName = 'RockId'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'RockId'
                Properties.ListColumns = <
                  item
                    FieldName = 'RockName'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = DM.dsRocks
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 256
              end
              object LithologyTableViewSeamName: TcxGridDBColumn
                Caption = #1055#1083#1072#1089#1090
                DataBinding.FieldName = 'SeamName'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 125
              end
              object LithologyTableViewFormation: TcxGridDBColumn
                Caption = #1057#1074#1080#1090#1072
                DataBinding.FieldName = 'Formation'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'Id'
                Properties.ListColumns = <
                  item
                    FieldName = 'FormationName'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = DM.dsFormations
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 75
              end
            end
            object LithologyGridLevel1: TcxGridLevel
              GridView = LithologyTableView
            end
          end
        end
      end
      object SamplesPageControl: TPageControl
        Left = 0
        Top = 310
        Width = 1379
        Height = 205
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 1
        object TabSheet2: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1040#1085#1072#1083#1080#1079#1099
          object SamplesGrid: TcxGrid
            Left = 0
            Top = 0
            Width = 1371
            Height = 175
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            TabOrder = 0
            OnExit = GridExit
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object SamplesTableView: TcxGridDBTableView
              PopupMenu = SamplesMenu
              OnDblClick = SamplesTableViewDblClick
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
              OnCustomDrawCell = SamplesTableViewCustomDrawCell
              OnFocusedRecordChanged = SamplesTableViewFocusedRecordChanged
              DataController.DataSource = DMLithology.dsSamples
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.SeparatorWidth = 8
              FixedDataRows.SeparatorWidth = 8
              NewItemRow.SeparatorWidth = 8
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsBehavior.ImmediateEditor = False
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.Appending = True
              OptionsSelection.MultiSelect = True
              OptionsView.NavigatorOffset = 63
              OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 23
              OptionsView.FixedColumnSeparatorWidth = 3
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 24
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 25
              Preview.LeftIndent = 25
              Preview.RightIndent = 6
              RowLayout.MinValueWidth = 100
              object SamplesTableViewColumn1: TcxGridDBColumn
                DataBinding.IsNullValueType = True
                MinWidth = 25
                Width = 41
              end
              object SamplesTableViewsample_id: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'SampleId'
                HeaderAlignmentHorz = taCenter
                MinWidth = 38
                Options.Editing = False
                Options.AutoWidthSizable = False
                Width = 48
              end
              object SamplesTableViewaccepted: TcxGridDBColumn
                Caption = #1055#1088#1080#1085'.'
                DataBinding.FieldName = 'Accepted'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 94
              end
              object SamplesTableViewbad: TcxGridDBColumn
                Caption = #1041#1088#1072#1082
                DataBinding.FieldName = 'Bad'
                HeaderAlignmentHorz = taCenter
                MinWidth = 50
                Width = 71
              end
              object SamplesTableViewinsum: TcxGridDBColumn
                Caption = #1057#1086#1089#1090
                DataBinding.FieldName = 'InSum'
                DataBinding.IsNullValueType = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 35
              end
              object SamplesTableViewqual: TcxGridDBColumn
                Caption = #1050#1072#1095
                DataBinding.FieldName = 'Qual'
                DataBinding.IsNullValueType = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 35
              end
              object SamplesTableViewlayerN: TcxGridDBColumn
                Caption = #8470' '#1089#1083#1086#1103
                DataBinding.FieldName = 'NLayer'
                DataBinding.IsNullValueType = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 90
              end
              object SamplesTableViewsampleN: TcxGridDBColumn
                Caption = #8470' '#1072#1085#1072#1083#1080#1079#1072
                DataBinding.FieldName = 'NSample'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 103
              end
              object SamplesTableViewsampletype: TcxGridDBColumn
                Caption = #1061#1072#1088#1072#1082#1090#1077#1088
                DataBinding.FieldName = 'SampleType'
                DataBinding.IsNullValueType = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 98
              end
              object SamplesTableViewlevelname: TcxGridDBColumn
                Caption = #1042#1080#1076' '#1072#1085#1072#1083#1080#1079#1072
                DataBinding.FieldName = 'levelname'
                DataBinding.IsNullValueType = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Options.Grouping = False
                Options.Moving = False
                Width = 100
              end
              object SamplesTableViewdepth_from: TcxGridDBColumn
                Caption = #1054#1090
                DataBinding.FieldName = 'DepthFrom'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Options.Grouping = False
                Options.Moving = False
                Width = 123
              end
              object SamplesTableViewdepth_to: TcxGridDBColumn
                Caption = #1044#1086
                DataBinding.FieldName = 'DepthTo'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Options.Grouping = False
                Options.Moving = False
                Width = 121
              end
              object SamplesTableViewAd: TcxGridDBColumn
                DataBinding.FieldName = 'Ad'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Options.Editing = False
                Options.Grouping = False
                Options.Moving = False
                Width = 115
              end
              object SamplesTableViewAd_float: TcxGridDBColumn
                Caption = 'Ad '#1092#1083#1086#1090
                DataBinding.FieldName = 'AdFloat'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Options.Editing = False
                Options.Grouping = False
                Options.Moving = False
                Width = 116
              end
              object SamplesTableViewAd_gbs: TcxGridDBColumn
                Caption = 'Ad '#1075#1073#1089
                DataBinding.FieldName = 'AdGbs'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Options.Editing = False
                Width = 115
              end
              object SamplesTableViewAd_geophys: TcxGridDBColumn
                Caption = 'Ad '#1075#1077#1086#1092#1080#1079
                DataBinding.FieldName = 'AdGeophys'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Options.Editing = False
                Width = 114
              end
              object SamplesTableViewAd_s: TcxGridDBColumn
                Caption = 'Ad '#1087#1083#1072#1089#1090
                DataBinding.FieldName = 'AdSeam'
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Options.Editing = False
                Width = 116
              end
              object SamplesTableViewAd_index: TcxGridDBColumn
                Caption = #1055#1088#1080#1085#1080#1084#1072#1090#1100' '#1087#1086
                DataBinding.FieldName = 'AdIndex'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'Id'
                Properties.ListColumns = <
                  item
                    FieldName = 'AdTypeName'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = DM.dsAdTypes
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 139
              end
              object SamplesTableViewwash: TcxGridDBColumn
                Caption = #1054#1073
                DataBinding.FieldName = 'Wash'
                DataBinding.IsNullValueType = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 41
              end
              object SamplesTableViewshow: TcxGridDBColumn
                Caption = #1055#1086#1082#1072#1079
                DataBinding.FieldName = 'Show'
                DataBinding.IsNullValueType = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Width = 51
              end
            end
            object SamplesGridDBTableView2: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.KeyFieldNames = 'N'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.SeparatorWidth = 8
              FixedDataRows.SeparatorWidth = 8
              NewItemRow.SeparatorWidth = 8
              OptionsView.NavigatorOffset = 63
              OptionsView.FixedColumnSeparatorWidth = 3
              OptionsView.GroupByBox = False
              OptionsView.Header = False
              OptionsView.IndicatorWidth = 15
              Preview.LeftIndent = 25
              Preview.RightIndent = 6
              RowLayout.MinValueWidth = 100
              object SamplesGridDBTableView2nn: TcxGridDBColumn
                DataBinding.FieldName = 'N'
                DataBinding.IsNullValueType = True
                Visible = False
                MinWidth = 25
              end
              object SamplesGridDBTableView2Adname: TcxGridDBColumn
                DataBinding.FieldName = 'Adname'
                DataBinding.IsNullValueType = True
                MinWidth = 25
                Width = 75
              end
            end
            object SamplesGridLevel1: TcxGridLevel
              GridView = SamplesTableView
            end
          end
        end
      end
      object CheckBox2: TCheckBox
        Left = 1193
        Top = 1
        Width = 172
        Height = 20
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Anchors = [akTop, akRight]
        Caption = #1055#1086' '#1087#1083#1072#1089#1090#1086#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1103#1084
        TabOrder = 2
        OnClick = CheckBox2Click
      end
    end
    object TabControl1: TTabControl
      Left = 0
      Top = 0
      Width = 1379
      Height = 231
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      TabOrder = 1
      Tabs.Strings = (
        #1055#1083#1072#1089#1090#1086#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1103)
      TabIndex = 0
      object HSGrid: TcxGrid
        Left = 4
        Top = 26
        Width = 1371
        Height = 201
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        TabOrder = 0
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object HSTableView: TcxGridDBTableView
          PopupMenu = HSMenu
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Enabled = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Enabled = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DMLithology.dsHoleseams
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.SeparatorWidth = 8
          FixedDataRows.SeparatorWidth = 8
          NewItemRow.SeparatorWidth = 8
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Appending = True
          OptionsData.Deleting = False
          OptionsSelection.MultiSelect = True
          OptionsView.NavigatorOffset = 63
          OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 23
          OptionsView.FixedColumnSeparatorWidth = 3
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 25
          Preview.LeftIndent = 25
          Preview.RightIndent = 6
          RowLayout.MinValueWidth = 100
          object HSTableViewholeseam_id: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'HoleSeamId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 38
            Options.Editing = False
            Options.AutoWidthSizable = False
            Width = 48
          end
          object HSTableViewcomments: TcxGridDBColumn
            Caption = #1050#1086#1084#1084#1077#1085#1090
            DataBinding.FieldName = 'Comments'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 79
          end
          object HSTableViewdepth_from: TcxGridDBColumn
            Caption = #1054#1090
            DataBinding.FieldName = 'DepthFrom'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Options.Editing = False
            Width = 65
          end
          object HSTableViewdepth_to: TcxGridDBColumn
            Caption = #1044#1086
            DataBinding.FieldName = 'DepthTo'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Options.Editing = False
            Width = 64
          end
          object HSTableViewseamname: TcxGridDBColumn
            Caption = #1055#1083#1072#1089#1090
            DataBinding.FieldName = 'SeamId'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.KeyFieldNames = 'SeamId'
            Properties.ListColumns = <
              item
                FieldName = 'SeamName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DM.dsSeams
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 145
          end
          object HSTableViewdetail: TcxGridDBColumn
            Caption = #1044#1077#1090#1072#1083'.'
            DataBinding.FieldName = 'Detail'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 65
          end
          object HSTableViewKB: TcxGridDBColumn
            Caption = #1050#1041
            DataBinding.FieldName = 'KB'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              #1041
              #1041' ('#1073#1077#1079' '#1082#1077#1088#1085#1072')'
              #1050
              #1050' + '#1041
              #1041' ('#1050')'
              #1041' ('#1053#1050')'
              #1053#1077#1090' '#1076#1072#1085#1085#1099#1093)
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 76
          end
          object HSTableViewdraw_from: TcxGridDBColumn
            Caption = #1057#1090#1086#1087#1082#1080' '#1086#1090
            DataBinding.FieldName = 'DrawFrom'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 74
          end
          object HSTableViewdraw_to: TcxGridDBColumn
            Caption = #1057#1090#1086#1087#1082#1080' '#1076#1086
            DataBinding.FieldName = 'DrawTo'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 76
          end
          object HSTableViewcoalgradename: TcxGridDBColumn
            Caption = #1052#1072#1088#1082#1072
            DataBinding.FieldName = 'CoalGrade'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'CoalGradeName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DM.dsCoalGrades
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Options.Grouping = False
            Options.Moving = False
            Width = 74
          end
          object HSTableViewcoaltypename: TcxGridDBColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'CoalType'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'CoaltypeName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DM.dsCoalTypes
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Options.Grouping = False
            Options.Moving = False
            Width = 76
          end
          object HSTableViewdip: TcxGridDBColumn
            Caption = #1059#1075#1086#1083' '#1087#1086' '#1088#1072#1079#1088#1077#1079#1091
            DataBinding.FieldName = 'Dip'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 118
          end
        end
        object HSGridLevel1: TcxGridLevel
          GridView = HSTableView
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 368
    Height = 750
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 338
      Width = 368
      Height = 3
      Cursor = crVSplit
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
    end
    object TabControl2: TTabControl
      Left = 0
      Top = 341
      Width = 368
      Height = 409
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 0
      Tabs.Strings = (
        #1057#1082#1074#1072#1078#1080#1085#1099)
      TabIndex = 0
      DesignSize = (
        368
        409)
      object LineHolesGrid: TcxGrid
        Left = 4
        Top = 26
        Width = 360
        Height = 379
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BevelKind = bkTile
        BorderStyle = cxcbsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object LineHolesTableView: TcxGridDBTableView
          PopupMenu = SLHMenu
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
          OnFocusedRecordChanged = LineHolesTableViewFocusedRecordChanged
          DataController.DataSource = DMLithology.dsLineHoles
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.SeparatorWidth = 8
          FixedDataRows.SeparatorWidth = 8
          NewItemRow.SeparatorWidth = 8
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
          OptionsView.NavigatorOffset = 63
          OptionsView.NoDataToDisplayInfoText = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093
          OptionsView.DataRowHeight = 23
          OptionsView.FixedColumnSeparatorWidth = 3
          OptionsView.GridLineColor = clScrollBar
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 25
          Preview.LeftIndent = 25
          Preview.RightIndent = 6
          RowLayout.MinValueWidth = 100
          object LineHolesTableViewhole_id: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'BoreholeId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 38
            Options.Editing = False
            Options.AutoWidthSizable = False
            Width = 48
          end
          object LineHolesTableViewnn: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'N'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 38
            Options.AutoWidthSizable = False
            Options.Grouping = False
            Options.Moving = False
            Width = 48
          end
          object LineHolesTableViewholename: TcxGridDBColumn
            Caption = #1057#1082#1074#1072#1078#1080#1085#1072
            DataBinding.FieldName = 'HoleName'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Options.Editing = False
            Width = 129
          end
        end
        object LineHolesGridLevel1: TcxGridLevel
          GridView = LineHolesTableView
        end
      end
      object CheckBox3: TCheckBox
        Left = 184
        Top = 3
        Width = 181
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Anchors = [akTop, akRight]
        Caption = #1055#1086' '#1088#1072#1079#1074#1077#1076#1086#1095#1085#1099#1084' '#1083#1080#1085#1080#1103#1084
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox3Click
      end
    end
    object TabControl3: TTabControl
      Left = 0
      Top = 0
      Width = 368
      Height = 338
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      TabOrder = 1
      Tabs.Strings = (
        #1056#1072#1079#1074#1077#1076#1086#1095#1085#1099#1077' '#1083#1080#1085#1080#1080)
      TabIndex = 0
      object LinesGrid: TcxGrid
        Left = 4
        Top = 26
        Width = 360
        Height = 308
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BevelKind = bkTile
        BorderStyle = cxcbsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object LinesGridTableView: TcxGridDBTableView
          PopupMenu = SLMenu
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
          DataController.DataSource = DMLithology.dsSurveyLines
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.SeparatorWidth = 8
          FixedDataRows.SeparatorWidth = 8
          NewItemRow.SeparatorWidth = 8
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Appending = True
          OptionsView.NavigatorOffset = 63
          OptionsView.NoDataToDisplayInfoText = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 23
          OptionsView.FixedColumnSeparatorWidth = 3
          OptionsView.GridLineColor = clScrollBar
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 25
          Preview.LeftIndent = 25
          Preview.RightIndent = 6
          RowLayout.MinValueWidth = 100
          object LinesGridTableViewsl_id: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'LineId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 38
            Options.Editing = False
            Options.AutoWidthSizable = False
            Width = 48
          end
          object LinesGridTableViewnn: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'N'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 38
            Options.AutoWidthSizable = False
            Width = 48
          end
          object LinesGridTableViewslname: TcxGridDBColumn
            Caption = #1056#1072#1079#1074#1077#1076#1086#1095#1085#1072#1103' '#1083#1080#1085#1080#1103
            DataBinding.FieldName = 'slname'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 290
          end
        end
        object LinesGridLevel1: TcxGridLevel
          GridView = LinesGridTableView
        end
      end
    end
  end
  object LithologyMenu: TPopupMenu
    OnPopup = LithologyMenuPopup
    Left = 588
    Top = 308
    object N41: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1089#1090#1086#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077
      Enabled = False
      OnClick = N41Click
    end
    object N30: TMenuItem
      Caption = #1055#1077#1088#1077#1086#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1087#1083#1072#1089#1090#1086#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077
      Enabled = False
      OnClick = N30Click
    end
    object N63: TMenuItem
      Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1089#1074#1080#1090#1091
      OnClick = N63Click
    end
    object N14: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N14Click
    end
  end
  object HSMenu: TPopupMenu
    Left = 524
    Top = 64
    object N4: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1083#1072#1089#1090#1086#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077
      OnClick = N4Click
    end
    object N44: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1103#1090#1100' '#1057#1090#1086#1087#1082#1080' '#1086#1090' '#1080' '#1057#1090#1086#1087#1082#1080' '#1076#1086
      Checked = True
      OnClick = N44Click
    end
    object N2: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N2Click
    end
  end
  object SLMenu: TPopupMenu
    Left = 40
    Top = 96
    object N1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N1Click
    end
  end
  object SLHMenu: TPopupMenu
    Left = 48
    Top = 368
    object MenuItem1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem1Click
    end
  end
  object SamplesMenu: TPopupMenu
    Left = 584
    Top = 520
    object MenuItem2: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem2Click
    end
  end
end
