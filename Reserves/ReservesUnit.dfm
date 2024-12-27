object ReservesFrame: TReservesFrame
  Left = 0
  Top = 0
  Width = 1541
  Height = 700
  TabOrder = 0
  object Splitter11: TSplitter
    Left = 721
    Top = 0
    Height = 700
    ExplicitLeft = 888
    ExplicitTop = -103
    ExplicitHeight = 758
  end
  object Panel19: TPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 700
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel19'
    TabOrder = 0
    object Splitter8: TSplitter
      Left = 0
      Top = 209
      Width = 721
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitWidth = 961
    end
    object Panel12: TPanel
      Left = 0
      Top = 0
      Width = 721
      Height = 209
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Splitter3: TSplitter
        Left = 337
        Top = 0
        Height = 209
        ExplicitLeft = 240
        ExplicitTop = 80
        ExplicitHeight = 100
      end
      object SeamsGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 337
        Height = 209
        Align = alLeft
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object SeamsTableView: TcxGridDBTableView
          PopupMenu = SeamsMenu
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
          DataController.DataSource = DMReserves.dsSeams
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object SeamsTableViewseam_id: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'SeamId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.AutoWidthSizable = False
            Width = 30
          end
          object SeamsTableViewshortname: TcxGridDBColumn
            Caption = #1057#1086#1082#1088'.'
            DataBinding.FieldName = 'ShortName'
            DataBinding.IsNullValueType = True
            Width = 68
          end
          object SeamsTableViewdescription: TcxGridDBColumn
            Caption = #1055#1083#1072#1089#1090
            DataBinding.FieldName = 'SeamName'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Grouping = False
            Options.Moving = False
            Width = 151
          end
        end
        object SeamsGridLevel1: TcxGridLevel
          GridView = SeamsTableView
        end
      end
      object VariantsGrid: TcxGrid
        Left = 340
        Top = 0
        Width = 381
        Height = 209
        Align = alClient
        TabOrder = 1
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object VariantsTableView: TcxGridDBTableView
          PopupMenu = VariantsMenu
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Visible = False
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
          OnCellClick = VariantsTableViewCellClick
          OnFocusedRecordChanged = VariantsTableViewFocusedRecordChanged
          DataController.DataSource = DMReserves.dsSeamConds
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnMoving = False
          OptionsData.Appending = True
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object VariantsTableViewId: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'ConditionId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
          end
          object VariantsTableViewnn: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'N'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.Editing = False
            Options.AutoWidthSizable = False
            Options.Grouping = False
            Options.Moving = False
            Width = 30
          end
          object VariantsTableViewcondname: TcxGridDBColumn
            Caption = #1042#1072#1088#1080#1072#1085#1090
            DataBinding.FieldName = 'ConditionId'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'CondName'
              end>
            Properties.ListSource = DM.dsCondition
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Grouping = False
            Options.Moving = False
            Width = 250
          end
          object VariantsTableViewrealcondname: TcxGridDBColumn
            Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1074#1072#1088#1080#1072#1085#1090
            DataBinding.FieldName = 'RealCondId'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'CondName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DM.dsCondition
            HeaderAlignmentHorz = taCenter
            Options.Grouping = False
            Options.Moving = False
            Width = 250
          end
        end
        object VariantsGridLevel1: TcxGridLevel
          GridView = VariantsTableView
        end
      end
    end
    object HSGrid: TcxGrid
      Left = 0
      Top = 212
      Width = 721
      Height = 488
      Hint = #1047#1086#1083#1100#1085#1086#1089#1090#1100' - 10 %'
      Align = alClient
      PopupMenu = HSMenu
      TabOrder = 1
      OnExit = GridExit
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmClassic
      object HSTableView: TcxGridDBTableView
        PopupMenu = HSMenu
        OnDblClick = HSTableViewDblClick
        OnKeyDown = HSTableViewKeyDown
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Enabled = False
        Navigator.Buttons.Append.Visible = False
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
        OnCustomDrawCell = HSTableViewCustomDrawCell
        DataController.DataSource = DMReserves.dsHoleSeams
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = HSTableViewholename
        OptionsBehavior.FocusCellOnCycle = True
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnMoving = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 23
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 24
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        object HSTableViewholeseam_id: TcxGridDBColumn
          Caption = 'Id'
          DataBinding.FieldName = 'HoleSeamId'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 30
          Options.AutoWidthSizable = False
          Width = 30
        end
        object HSTableViewholename: TcxGridDBColumn
          Caption = #1057#1082#1074
          DataBinding.FieldName = 'HoleName'
          DataBinding.IsNullValueType = True
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 45
        end
        object HSTableViewcomments: TcxGridDBColumn
          DataBinding.FieldName = 'hs_comments'
          DataBinding.IsNullValueType = True
          Visible = False
          Width = 25
          IsCaptionAssigned = True
        end
        object HSTableViewdepth_from: TcxGridDBColumn
          Caption = #1054#1090
          DataBinding.FieldName = 'DepthFrom'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Grouping = False
          Options.Moving = False
          Width = 56
        end
        object HSTableViewdepth_to: TcxGridDBColumn
          Caption = #1044#1086
          DataBinding.FieldName = 'DepthTo'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Grouping = False
          Options.Moving = False
          Width = 57
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
          Properties.ListSource = DM.dsCoalTypes
          Visible = False
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Options.Moving = False
          Width = 74
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
          Properties.ListSource = DM.dsCoalGrades
          Visible = False
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Options.Moving = False
          Width = 74
        end
        object HSTableViewAd_coal: TcxGridDBColumn
          Caption = 'Ad '#1091#1075#1083#1103
          DataBinding.FieldName = 'AdCoal'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = ',0.0'
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Options.Moving = False
          Width = 58
        end
        object HSTableViewAd_total: TcxGridDBColumn
          Caption = 'Ad '#1079#1072#1089#1086#1088'.'
          DataBinding.FieldName = 'AdFull'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = ',0.0'
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Options.Moving = False
          Width = 57
        end
        object HSTableViewAdR: TcxGridDBColumn
          DataBinding.FieldName = 'AdR'
          DataBinding.IsNullValueType = True
          Width = 25
          IsCaptionAssigned = True
        end
        object HSTableViewth_coal: TcxGridDBColumn
          Caption = #1052' '#1091#1075#1083#1103
          DataBinding.FieldName = 'ThCoal'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00'
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Options.Moving = False
          Width = 60
        end
        object HSTableViewth_total: TcxGridDBColumn
          Caption = #1052' '#1079#1072#1089#1086#1088'.'
          DataBinding.FieldName = 'ThFull'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00'
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Options.Moving = False
          Width = 60
        end
        object HSTableViewThR: TcxGridDBColumn
          DataBinding.FieldName = 'ThR'
          DataBinding.IsNullValueType = True
          Width = 25
          IsCaptionAssigned = True
        end
        object HSTableViewAvgCalc: TcxGridDBColumn
          DataBinding.FieldName = 'AvgCalc'
          DataBinding.IsNullValueType = True
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object HSTableViewOnMap: TcxGridDBColumn
          Caption = #1042' '#1087#1086#1076#1089#1095#1077#1090
          DataBinding.FieldName = 'OnMap'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 65
        end
        object HSTableViewlock: TcxGridDBColumn
          DataBinding.FieldName = 'Lock'
          DataBinding.IsNullValueType = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 54
        end
        object HSTableViewstat: TcxGridDBColumn
          Caption = #1057#1090#1072#1090'.'
          DataBinding.FieldName = 'Stat'
          DataBinding.IsNullValueType = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 45
        end
        object HSTableViewAd_avg: TcxGridDBColumn
          Caption = 'Ad '#1089#1088#1077#1076#1085'.'
          DataBinding.FieldName = 'AdAvg'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = ',0.0'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 42
        end
        object HSTableViewcalcunit_id: TcxGridDBColumn
          DataBinding.FieldName = 'CalcUnitId'
          DataBinding.IsNullValueType = True
          Visible = False
        end
      end
      object HSGridLevel1: TcxGridLevel
        GridView = HSTableView
      end
    end
  end
  object Panel20: TPanel
    Left = 724
    Top = 0
    Width = 817
    Height = 700
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object TabControl1: TTabControl
      Left = 0
      Top = 0
      Width = 817
      Height = 700
      Align = alClient
      TabHeight = 25
      TabOrder = 0
      Tabs.Strings = (
        #1041#1083#1086#1082#1080)
      TabIndex = 0
      DesignSize = (
        817
        700)
      object Label1: TLabel
        Left = 582
        Top = 6
        Width = 38
        Height = 15
        Anchors = [akTop, akRight]
        Caption = #1044#1077#1090#1072#1083#1100
      end
      object Splitter1: TSplitter
        Left = 4
        Top = 264
        Width = 809
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitLeft = 3
        ExplicitTop = 312
      end
      object Splitter2: TSplitter
        Left = 4
        Top = 519
        Width = 809
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 477
        ExplicitWidth = 259
      end
      object BlockDetailsGrid: TcxGrid
        Left = 4
        Top = 267
        Width = 809
        Height = 252
        Align = alClient
        TabOrder = 0
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object BlockDetailsTableView: TcxGridDBTableView
          PopupMenu = BlockDetailsMenu
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
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
          OnCustomDrawCell = BlockDetailsTableViewCustomDrawCell
          DataController.DataSource = DMReserves.dsBlockdetails
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsData.Appending = True
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          object BlockDetailsTableViewId: TcxGridDBColumn
            DataBinding.FieldName = 'Id'
            DataBinding.IsNullValueType = True
            BestFitMaxWidth = 40
            Width = 40
          end
          object BlockDetailsTableViewarea: TcxGridDBColumn
            Caption = #1055#1083#1086#1097#1072#1076#1100
            DataBinding.FieldName = 'Area'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Grouping = False
            Width = 80
          end
          object BlockDetailsTableViewboundaryname: TcxGridDBColumn
            Caption = #1043#1088#1072#1085#1080#1094#1072
            DataBinding.FieldName = 'Boundary'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'BoundaryName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DM.dsBoundaries
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Grouping = False
            Width = 80
          end
          object BlockDetailsTableViewattr1name: TcxGridDBColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082
            DataBinding.FieldName = 'Attr'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'AttrName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DM.dsAttributes
            Visible = False
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Grouping = False
            Width = 73
          end
          object BlockDetailsTableViewZ: TcxGridDBColumn
            DataBinding.FieldName = 'Z'
            DataBinding.IsNullValueType = True
            Visible = False
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Grouping = False
            Width = 30
          end
          object BlockDetailsTableViewcoalgradename: TcxGridDBColumn
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
            Options.Filtering = False
            Options.Grouping = False
            Width = 80
          end
          object BlockDetailsTableViewpillarname: TcxGridDBColumn
            Caption = #1062#1077#1083#1080#1082
            DataBinding.FieldName = 'Pillar'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'PillarName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DM.dsPillars
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object BlockDetailsTableViewres_coal: TcxGridDBColumn
            Caption = #1059#1075#1086#1083#1100
            DataBinding.FieldName = 'ResCoal'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object BlockDetailsTableViewres_total: TcxGridDBColumn
            Caption = #1043#1052
            DataBinding.FieldName = 'ResFull'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
        end
        object BlockDetailsGridLevel1: TcxGridLevel
          GridView = BlockDetailsTableView
        end
      end
      object PartCombo: TDBLookupComboBox
        Left = 626
        Top = 3
        Width = 177
        Height = 22
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'PartId'
        ListField = 'NPart'
        ListSource = DMReserves.dsParts
        ParentFont = False
        TabOrder = 1
        OnCloseUp = PartComboCloseUp
      end
      object BlockUnitsGrid: TcxGrid
        Left = 4
        Top = 522
        Width = 809
        Height = 174
        Align = alBottom
        PopupMenu = BlockUnitsMenu
        TabOrder = 2
        OnExit = GridExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object BlockUnitsTableView: TcxGridDBTableView
          PopupMenu = BlockUnitsMenu
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
          OnCustomDrawCell = BlockUnitsTableViewCustomDrawCell
          DataController.DataSource = DMReserves.dsBlockUnits
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 23
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 24
          OptionsView.Indicator = True
          object BlockUnitsTableViewHoleSeamId: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'HoleSeamId'
            DataBinding.IsNullValueType = True
            BestFitMaxWidth = 40
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.AutoWidthSizable = False
            Width = 40
          end
          object BlockUnitsTableViewholename: TcxGridDBColumn
            Caption = #1057#1082#1074
            DataBinding.FieldName = 'HoleName'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Grouping = False
            Options.Moving = False
            Width = 60
          end
          object BlockUnitsTableViewDepthFrom: TcxGridDBColumn
            Caption = #1054#1090
            DataBinding.FieldName = 'DepthFrom'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Grouping = False
            Options.Moving = False
            Width = 60
          end
          object BlockUnitsTableViewDepthTo: TcxGridDBColumn
            Caption = #1044#1086
            DataBinding.FieldName = 'DepthTo'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Grouping = False
            Options.Moving = False
            Width = 60
          end
          object BlockUnitsTableViewAdCoal: TcxGridDBColumn
            Caption = 'Ad '#1091#1075#1083#1103
            DataBinding.FieldName = 'AdCoal'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 1
            Properties.DisplayFormat = ',0.0'
            HeaderAlignmentHorz = taCenter
            Options.Grouping = False
            Width = 60
          end
          object BlockUnitsTableViewAdFull: TcxGridDBColumn
            Caption = 'Ad  '#1079#1072#1089#1086#1088'.'
            DataBinding.FieldName = 'AdFull'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 1
            Properties.DisplayFormat = ',0.0'
            HeaderAlignmentHorz = taCenter
            Options.Grouping = False
            Width = 60
          end
          object BlockUnitsTableViewAdR: TcxGridDBColumn
            DataBinding.FieldName = 'AdR'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 25
            IsCaptionAssigned = True
          end
          object BlockUnitsTableViewThCoal: TcxGridDBColumn
            Caption = #1052' '#1091#1075#1083#1103
            DataBinding.FieldName = 'ThCoal'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            HeaderAlignmentHorz = taCenter
            Options.Grouping = False
            Width = 60
          end
          object BlockUnitsTableViewThFull: TcxGridDBColumn
            Caption = #1052' '#1079#1072#1089#1086#1088'.'
            DataBinding.FieldName = 'ThFull'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            HeaderAlignmentHorz = taCenter
            Options.Grouping = False
            Width = 60
          end
          object BlockUnitsTableViewThR: TcxGridDBColumn
            DataBinding.FieldName = 'ThR'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Sorting = False
            Width = 25
            IsCaptionAssigned = True
          end
          object BlockUnitsTableViewAvgCalc: TcxGridDBColumn
            DataBinding.FieldName = 'AvgCalc'
            DataBinding.IsNullValueType = True
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
        end
        object BlockUnitsGridLevel1: TcxGridLevel
          GridView = BlockUnitsTableView
        end
      end
      object Panel1: TPanel
        Left = 4
        Top = 31
        Width = 809
        Height = 233
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 3
        object BlocksGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 809
          Height = 183
          Align = alClient
          TabOrder = 0
          OnExit = GridExit
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.ScrollbarMode = sbmClassic
          object BlocksTableView: TcxGridDBTableView
            PopupMenu = BlocksMenu
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
            DataController.DataSource = DMReserves.dsBlocks
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ImmediateEditor = False
            OptionsData.Appending = True
            OptionsSelection.MultiSelect = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 23
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 24
            OptionsView.Indicator = True
            OptionsView.IndicatorWidth = 20
            object BlocksTableViewBlockId: TcxGridDBColumn
              Caption = 'Id'
              DataBinding.FieldName = 'BlockId'
              DataBinding.IsNullValueType = True
              BestFitMaxWidth = 40
              HeaderAlignmentHorz = taCenter
              Width = 40
            end
            object BlocksTableViewBalance: TcxGridDBColumn
              Caption = #1041#1072#1083#1072#1085#1089
              DataBinding.FieldName = 'Balance'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object BlocksTableViewBlockName: TcxGridDBColumn
              Caption = #1041#1083#1086#1082
              DataBinding.FieldName = 'BlockName'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object BlocksTableViewCategory: TcxGridDBColumn
              Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
              DataBinding.FieldName = 'Category'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'Id'
              Properties.ListColumns = <
                item
                  FieldName = 'CatName'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = DM.dsCategories
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object BlocksTableViewColumn1: TcxGridDBColumn
              Caption = #1058#1080#1087' '#1091#1075#1083#1103
              DataBinding.FieldName = 'CoalType'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'Id'
              Properties.ListColumns = <
                item
                  FieldName = 'CoaltypeName'
                end>
              Properties.ListSource = DM.dsCoalTypes
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object BlocksTableViewDip: TcxGridDBColumn
              Caption = #1059#1075#1086#1083
              DataBinding.FieldName = 'Dip'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object BlocksTableViewAdCoal: TcxGridDBColumn
              Caption = 'Ad '#1091#1075#1083#1103
              DataBinding.FieldName = 'AdCoal'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 1
              Properties.DisplayFormat = ',0.0'
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object BlocksTableViewAdFull: TcxGridDBColumn
              Caption = 'Ad '#1079#1072#1089#1086#1088
              DataBinding.FieldName = 'AdFull'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 1
              Properties.DisplayFormat = ',0.0'
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object BlocksTableViewThCoal: TcxGridDBColumn
              Caption = #1052' '#1091#1075#1083#1103
              DataBinding.FieldName = 'ThCoal'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00'
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object BlocksTableViewThFull: TcxGridDBColumn
              Caption = #1052' '#1079#1072#1089#1086#1088
              DataBinding.FieldName = 'ThFull'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00'
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object BlocksTableViewLock: TcxGridDBColumn
              DataBinding.FieldName = 'Lock'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Width = 61
            end
          end
          object BlocksGridLevel1: TcxGridLevel
            GridView = BlocksTableView
          end
        end
        object cxDBMemo2: TcxDBMemo
          Left = 0
          Top = 183
          Hint = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1073#1083#1086#1082#1091
          Align = alBottom
          DataBinding.DataField = 'Comments'
          DataBinding.DataSource = DMReserves.dsBlocks
          TabOrder = 1
          OnExit = cxDBMemo2Exit
          Height = 50
          Width = 809
        end
      end
    end
  end
  object HSMenu: TPopupMenu
    Left = 196
    Top = 368
    object N32: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N32Click
    end
  end
  object BlocksMenu: TPopupMenu
    OnPopup = BlocksMenuPopup
    Left = 916
    Top = 98
    object N6: TMenuItem
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1073#1083#1086#1082
      OnClick = N6Click
    end
    object N10: TMenuItem
      Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100' '#1073#1083#1086#1082#1080' '#1076#1083#1103' '#1074#1089#1077#1081' '#1076#1077#1090#1072#1083#1080
      OnClick = N10Click
    end
    object N45: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1073#1083#1086#1082' '#1074' '#1076#1088#1091#1075#1086#1081' '#1074#1072#1088#1080#1072#1085#1090
      OnClick = N45Click
    end
    object N3: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1073#1083#1086#1082' '#1074' '#1076#1088#1091#1075#1091#1102' '#1076#1077#1090#1072#1083#1100
      OnClick = N3Click
    end
    object N46: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1073#1083#1086#1082
      OnClick = N46Click
    end
    object N65: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1073#1083#1086#1082
      Enabled = False
      OnClick = N65Click
    end
    object N5: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1073#1083#1086#1082#1080
      Enabled = False
      OnClick = N5Click
    end
    object N4: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1073#1083#1086#1082
      OnClick = N4Click
    end
    object N18: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N18Click
    end
  end
  object VariantsMenu: TPopupMenu
    OnPopup = VariantsMenuPopup
    Left = 348
    Top = 62
    object N27: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1075#1072#1083#1086#1095#1082#1080
      OnClick = N27Click
    end
    object N28: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1075#1072#1083#1086#1095#1082#1080
      Enabled = False
    end
    object N2: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N2Click
    end
  end
  object BlockUnitsMenu: TPopupMenu
    OnPopup = BlockUnitsMenuPopup
    Left = 908
    Top = 522
    object IsoAdItem: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079#1086#1079#1086#1083#1100#1085#1086#1089#1090#1100
    end
    object IsoThItem: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079#1086#1084#1086#1097#1085#1086#1089#1090#1100
    end
    object ProbeItem: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1073#1091
      OnClick = ProbeItemClick
    end
    object MenuItem6: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem6Click
    end
  end
  object SeamsMenu: TPopupMenu
    Left = 64
    Top = 56
    object N1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N1Click
    end
  end
  object BlockDetailsMenu: TPopupMenu
    OnPopup = BlocksMenuPopup
    Left = 908
    Top = 402
    object MenuItem10: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem10Click
    end
  end
end
