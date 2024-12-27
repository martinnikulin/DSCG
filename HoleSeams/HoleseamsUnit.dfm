object HoleseamsFrame: THoleseamsFrame
  Left = 0
  Top = 0
  Width = 1200
  Height = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Splitter3: TSplitter
    Left = 393
    Top = 0
    Height = 800
    ExplicitLeft = 520
    ExplicitTop = 200
    ExplicitHeight = 100
  end
  object Panel19: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 800
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel19'
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 0
      Top = 649
      Width = 393
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 372
      ExplicitWidth = 329
    end
    object SeamsGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 393
      Height = 649
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
        Navigator.Buttons.Edit.Visible = False
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
    object AveragesGrid: TcxGrid
      Left = 0
      Top = 652
      Width = 393
      Height = 148
      Align = alBottom
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmClassic
      object AveragesTableView: TcxGridDBTableView
        PopupMenu = AvgMenu
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
        DataController.DataSource = DMReserves.dsAverages
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ImmediateEditor = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 23
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 24
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        object AveragesTableViewCoalType: TcxGridDBColumn
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
        end
        object AveragesTableViewCoalGrade: TcxGridDBColumn
          Caption = ' '#1052#1072#1088#1082#1072
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
        end
        object AveragesTableViewVarId: TcxGridDBColumn
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
        end
        object AveragesTableViewValue: TcxGridDBColumn
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          DataBinding.FieldName = 'Value'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
        end
        object AveragesTableViewUserValue: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079'.'
          DataBinding.FieldName = 'UserValue'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
        end
      end
      object AveragesGridLevel: TcxGridLevel
        GridView = AveragesTableView
      end
    end
  end
  object Panel1: TPanel
    Left = 396
    Top = 0
    Width = 804
    Height = 800
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 319
      Width = 804
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitWidth = 353
    end
    object HSGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 804
      Height = 319
      Hint = #1047#1086#1083#1100#1085#1086#1089#1090#1100' - 10 %'
      Align = alTop
      TabOrder = 0
      OnExit = GridExit
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmClassic
      object HSTableView: TcxGridDBTableView
        PopupMenu = HSMenu
        OnMouseDown = HSTableViewMouseDown
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
        OnCellClick = HSTableViewCellClick
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
          Width = 38
        end
        object HSTableViewcomments: TcxGridDBColumn
          Caption = #1050#1086#1084#1084#1077#1085#1090
          DataBinding.FieldName = 'hs_comments'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 60
          Width = 60
        end
        object HSTableViewKB: TcxGridDBColumn
          DataBinding.FieldName = 'KB'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 31
        end
        object HSTableViewdepth_from: TcxGridDBColumn
          Caption = #1054#1090
          DataBinding.FieldName = 'DepthFrom'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Grouping = False
          Options.Moving = False
          Width = 49
        end
        object HSTableViewdepth_to: TcxGridDBColumn
          Caption = #1044#1086
          DataBinding.FieldName = 'DepthTo'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Grouping = False
          Options.Moving = False
          Width = 51
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
          Options.Grouping = False
          Options.Moving = False
          Width = 49
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
          Options.Grouping = False
          Options.Moving = False
          Width = 51
        end
        object HSTableViewAd_coal: TcxGridDBColumn
          Caption = 'Ad '#1091#1075#1083#1103
          DataBinding.FieldName = 'AdCoal'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = '##0.0'
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Options.Moving = False
          Width = 50
        end
        object HSTableViewAd_total: TcxGridDBColumn
          Caption = 'Ad '#1079#1072#1089#1086#1088'.'
          DataBinding.FieldName = 'AdFull'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = '##0.0'
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Options.Moving = False
          Width = 50
        end
        object HSTableViewAdR: TcxGridDBColumn
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
        object HSTableViewth_coal: TcxGridDBColumn
          Caption = #1052' '#1091#1075#1083#1103
          DataBinding.FieldName = 'ThCoal'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.ClearKey = 16449
          Properties.DisplayFormat = '##0.00'
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Options.Moving = False
          Width = 53
        end
        object HSTableViewth_total: TcxGridDBColumn
          Caption = #1052' '#1079#1072#1089#1086#1088'.'
          DataBinding.FieldName = 'ThFull'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = '##0.00'
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Options.Moving = False
          Width = 52
        end
        object HSTableViewth_total_R: TcxGridDBColumn
          DataBinding.FieldName = 'ThR'
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
          Width = 50
        end
        object HSTableViewlock: TcxGridDBColumn
          DataBinding.FieldName = 'Lock'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 51
        end
        object HSTableViewstat: TcxGridDBColumn
          Caption = #1057#1090#1072#1090'.'
          DataBinding.FieldName = 'Stat'
          DataBinding.IsNullValueType = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 45
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
    object Panel31: TPanel
      Left = 0
      Top = 322
      Width = 804
      Height = 478
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel31'
      TabOrder = 1
      object Splitter4: TSplitter
        Left = 417
        Top = 0
        Height = 478
        ExplicitLeft = 512
        ExplicitTop = 448
        ExplicitHeight = 100
      end
      object PageControl4: TPageControl
        Left = 420
        Top = 0
        Width = 384
        Height = 478
        ActivePage = TabSheet13
        Align = alClient
        TabOrder = 0
        object TabSheet13: TTabSheet
          Caption = #1040#1085#1072#1083#1080#1079#1099
          object SamplesGrid: TcxGrid
            Left = 0
            Top = 0
            Width = 376
            Height = 450
            Align = alClient
            TabOrder = 0
            OnExit = GridExit
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object SamplesTableView: TcxGridDBTableView
              PopupMenu = SamplesMenu
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
              DataController.DataSource = DMReserves.dsSamples
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsData.Deleting = False
              OptionsData.Inserting = False
              OptionsSelection.MultiSelect = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 23
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 24
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 20
              object SamplesTableViewsample_id: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'SampleId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 30
                Options.AutoWidthSizable = False
                Width = 30
              end
              object SamplesTableViewaccepted: TcxGridDBColumn
                Caption = #1055#1088#1080#1085'.'
                DataBinding.FieldName = 'Accepted'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 50
                Options.Filtering = False
                Options.Grouping = False
                Options.HorzSizing = False
                Options.Moving = False
                Width = 50
              end
              object SamplesTableViewbad: TcxGridDBColumn
                Caption = #1041#1088#1072#1082
                DataBinding.FieldName = 'Bad'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 50
              end
              object SamplesTableViewdepth_from: TcxGridDBColumn
                Caption = #1054#1090
                DataBinding.FieldName = 'DepthFrom'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Filtering = False
                Options.Grouping = False
                Options.Moving = False
                Width = 50
              end
              object SamplesTableViewdepth_to: TcxGridDBColumn
                Caption = #1044#1086
                DataBinding.FieldName = 'DepthTo'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Grouping = False
                Options.Moving = False
                Width = 50
              end
              object SamplesTableViewAd: TcxGridDBColumn
                DataBinding.FieldName = 'Ad'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Grouping = False
                Options.Moving = False
                Width = 50
              end
              object SamplesTableViewAd_float: TcxGridDBColumn
                Caption = 'Ad '#1092#1083#1086#1090
                DataBinding.FieldName = 'AdFloat'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Grouping = False
                Options.Moving = False
                Width = 50
              end
              object SamplesTableViewAd_gbs: TcxGridDBColumn
                Caption = 'Ad '#1075#1073#1089
                DataBinding.FieldName = 'AdGbs'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Width = 50
              end
              object SamplesTableViewAd_geophys: TcxGridDBColumn
                Caption = 'Ad '#1075#1077#1086#1092#1080#1079
                DataBinding.FieldName = 'AdGeophys'
                DataBinding.IsNullValueType = True
                Options.Editing = False
                Width = 50
              end
              object SamplesTableViewAd_s: TcxGridDBColumn
                Caption = 'Ad '#1087#1083#1072#1089#1090
                DataBinding.FieldName = 'AdSeam'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Width = 50
              end
              object SamplesTableViewAd_index: TcxGridDBColumn
                Caption = #1055#1086
                DataBinding.FieldName = 'AdIndex'
                DataBinding.IsNullValueType = True
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'Id'
                Properties.ListColumns = <
                  item
                    FieldName = 'AdTypeName'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = DM.dsAdTypes
                HeaderAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 50
              end
            end
            object SamplesGridLevel1: TcxGridLevel
              GridView = SamplesTableView
            end
          end
        end
      end
      object PageControl5: TPageControl
        Left = 0
        Top = 0
        Width = 417
        Height = 478
        ActivePage = TabSheet15
        Align = alLeft
        TabOrder = 1
        object TabSheet15: TTabSheet
          Caption = #1051#1080#1090#1086#1083#1086#1075#1080#1103
          object LithologyGrid: TcxGrid
            Left = 0
            Top = 0
            Width = 409
            Height = 450
            Align = alClient
            TabOrder = 0
            OnExit = GridExit
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object LithologyTableView: TcxGridDBTableView
              PopupMenu = LithologyMenu
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
              DataController.DataSource = DMReserves.dsLithology
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsBehavior.ImmediateEditor = False
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnHiding = True
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
              object LithologyTableViewlithology_id: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'LithologyId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 30
                Options.AutoWidthSizable = False
                Width = 30
              end
              object LithologyTableViewdepth_from: TcxGridDBColumn
                Caption = #1054#1090
                DataBinding.FieldName = 'DepthFrom'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Grouping = False
                Options.Moving = False
                Options.Sorting = False
                Width = 65
              end
              object LithologyTableViewdepth_to: TcxGridDBColumn
                Caption = #1044#1086
                DataBinding.FieldName = 'DepthTo'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Grouping = False
                Options.Moving = False
                Options.Sorting = False
                Width = 65
              end
              object LithologyTableViewth_norm: TcxGridDBColumn
                Caption = #1052' '#1085#1086#1088#1084'.'
                DataBinding.FieldName = 'ThNorm'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Focusing = False
                Options.Grouping = False
                Options.Moving = False
                Options.Sorting = False
                Width = 65
              end
              object LithologyTableViewcore_proc: TcxGridDBColumn
                Caption = #1050#1077#1088#1085', %'
                DataBinding.FieldName = 'CoreProc'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Grouping = False
                Options.Moving = False
                Options.Sorting = False
                Width = 65
              end
              object LithologyTableViewlithname: TcxGridDBColumn
                Caption = #1055#1086#1088#1086#1076#1072
                DataBinding.FieldName = 'RockId'
                DataBinding.IsNullValueType = True
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'RockId'
                Properties.ListColumns = <
                  item
                    FieldName = 'RockName'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = DM.dsRocks
                HeaderAlignmentHorz = taCenter
                Options.Grouping = False
                Options.Moving = False
                Options.Sorting = False
                Width = 131
              end
              object LithologyTableViewreserves: TcxGridDBColumn
                Caption = #1055#1086#1076#1089#1095#1077#1090
                DataBinding.FieldName = 'Reserves'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Options.Grouping = False
                Options.Moving = False
                Options.Sorting = False
                Width = 60
              end
            end
            object LithologyGridLevel1: TcxGridLevel
              GridView = LithologyTableView
            end
          end
        end
      end
    end
    object cxGrid1: TcxGrid
      Left = 103
      Top = 64
      Width = 280
      Height = 360
      BorderWidth = 3
      TabOrder = 2
      Visible = False
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmDefault
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DMReserves.dsComposites
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ScrollBars = ssNone
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        object cxGrid1DBTableView1VarName: TcxGridDBColumn
          Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'VarName'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 186
        end
        object cxGrid1DBTableView1Value: TcxGridDBColumn
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          DataBinding.FieldName = 'Value'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object SeamsMenu: TPopupMenu
    Left = 136
    Top = 88
    object N1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N1Click
    end
  end
  object LithologyMenu: TPopupMenu
    Left = 408
    Top = 400
    object MenuItem2: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem2Click
    end
  end
  object SamplesMenu: TPopupMenu
    Left = 792
    Top = 448
    object MenuItem3: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem3Click
    end
  end
  object AvgMenu: TPopupMenu
    Left = 40
    Top = 704
    object MenuItem4: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem4Click
    end
  end
  object HSMenu: TPopupMenu
    Left = 364
    Top = 88
    object N22: TMenuItem
      Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100' '#1087#1083#1072#1089#1090#1086#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1103
      OnClick = N22Click
    end
    object N50: TMenuItem
      Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100' '#1089#1088#1077#1076#1085#1080#1077
      OnClick = N50Click
    end
    object N49: TMenuItem
      Caption = '     '#1089' '#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077#1084' '#1087#1086' '#1090#1080#1087#1072#1084
      OnClick = N49Click
    end
    object N4: TMenuItem
      Caption = '     '#1089' '#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077#1084' '#1087#1086' '#1090#1080#1087#1072#1084' '#1080' '#1084#1072#1088#1082#1072#1084
      OnClick = N4Click
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object N48: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' "'#1042' '#1087#1086#1076#1089#1095#1077#1090'"'
      OnClick = N48Click
    end
    object N2: TMenuItem
      Caption = #1057#1085#1103#1090#1100' "'#1042' '#1087#1086#1076#1089#1095#1077#1090'"'
      OnClick = N2Click
    end
    object N61: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' "'#1055#1086' '#1089#1088#1077#1076#1085#1077#1084#1091'"'
      OnClick = N61Click
    end
    object N3: TMenuItem
      Caption = #1057#1085#1103#1090#1100' "'#1055#1086' '#1089#1088#1077#1076#1085#1077#1084#1091'"'
      OnClick = N3Click
    end
    object Lock1: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' Lock'
      OnClick = Lock1Click
    end
    object Lock2: TMenuItem
      Caption = #1057#1085#1103#1090#1100' Lock'
      OnClick = Lock2Click
    end
    object N32: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N32Click
    end
  end
end
