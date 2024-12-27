object QueryFrame: TQueryFrame
  Left = 0
  Top = 0
  Width = 1200
  Height = 491
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 649
    Top = 0
    Height = 491
    ExplicitLeft = 754
    ExplicitTop = -374
    ExplicitHeight = 800
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 491
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object QueryGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 649
      Height = 491
      Align = alClient
      TabOrder = 0
      OnExit = GridExit
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmClassic
      ExplicitWidth = 753
      object QueryTableView: TcxGridDBTableView
        PopupMenu = QueryMenu
        OnDblClick = QueryTableViewDblClick
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
        DataController.DataSource = DMQuery.dsQueries
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
        object QueryTableViewquery_id: TcxGridDBColumn
          Caption = 'Id'
          DataBinding.FieldName = 'QueryId'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 30
          Options.AutoWidthSizable = False
          Width = 30
        end
        object QueryTableViewquerygroup: TcxGridDBColumn
          Caption = #1056#1072#1079#1076#1077#1083
          DataBinding.FieldName = 'QueryGroup'
          DataBinding.IsNullValueType = True
          Visible = False
          GroupIndex = 0
          Width = 199
        end
        object QueryTableViewdescription: TcxGridDBColumn
          Caption = #1047#1072#1087#1088#1086#1089
          DataBinding.FieldName = 'Description'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 262
        end
        object QueryTableViewtemplate: TcxGridDBColumn
          Caption = #1064#1072#1073#1083#1086#1085' Excel'
          DataBinding.FieldName = 'Template'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 101
        end
        object QueryTableViewusetemplate: TcxGridDBColumn
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1096#1072#1073#1083#1086#1085
          DataBinding.FieldName = 'UseTemplate'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          HeaderHint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1096#1072#1073#1083#1086#1085
          Width = 113
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = QueryTableView
      end
    end
  end
  object Panel2: TPanel
    Left = 652
    Top = 0
    Width = 548
    Height = 491
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 756
    ExplicitWidth = 444
    object Splitter2: TSplitter
      Left = 0
      Top = 204
      Width = 548
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = 3
      ExplicitTop = 249
      ExplicitWidth = 444
    end
    object Splitter3: TSplitter
      Left = 0
      Top = 207
      Width = 548
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = 3
      ExplicitTop = 246
      ExplicitWidth = 245
    end
    object DBMemo1: TDBMemo
      Left = 0
      Top = 0
      Width = 548
      Height = 81
      Align = alTop
      BevelInner = bvNone
      DataField = 'Comments'
      DataSource = DMQuery.dsQueries
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnExit = DBMemo1Exit
      ExplicitWidth = 444
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 210
      Width = 548
      Height = 281
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 444
      object TabSheet1: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1087#1088#1086#1089#1072
        object ParamsGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 540
          Height = 251
          Align = alClient
          TabOrder = 0
          OnExit = GridExit
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.ScrollbarMode = sbmClassic
          ExplicitWidth = 436
          object ParamsTableView: TcxGridDBTableView
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
            DataController.DataSource = DMQuery.dsQueryParams
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Appending = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 23
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 24
            OptionsView.Indicator = True
            OptionsView.IndicatorWidth = 20
            object ParamsTableViewquery_id: TcxGridDBColumn
              Caption = 'Id'
              DataBinding.FieldName = 'QueryId'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              MinWidth = 30
              Options.AutoWidthSizable = False
              Width = 30
            end
            object ParamsTableViewnparam: TcxGridDBColumn
              Caption = #8470
              DataBinding.FieldName = 'NParam'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              MinWidth = 30
              Options.AutoWidthSizable = False
              Width = 30
            end
            object ParamsTableViewdescription: TcxGridDBColumn
              Caption = #1055#1072#1088#1072#1084#1077#1090#1088
              DataBinding.FieldName = 'Description'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object ParamsTableViewparamtype: TcxGridDBColumn
              Caption = #1058#1080#1087' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
              DataBinding.FieldName = 'ParamType'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object ParamsTableViewreftable: TcxGridDBColumn
              Caption = #1058#1072#1073#1083#1080#1094#1072' '#1079#1085#1072#1095#1077#1085#1080#1081
              DataBinding.FieldName = 'RefTable'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object ParamsTableViewlistfield: TcxGridDBColumn
              Caption = #1055#1086#1083#1077' '#1079#1085#1072#1095#1077#1085#1080#1081
              DataBinding.FieldName = 'Listfield'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object ParamsTableViewkeyfield: TcxGridDBColumn
              Caption = #1050#1083#1102#1095#1077#1074#1086#1077' '#1087#1086#1083#1077
              DataBinding.FieldName = 'KeyField'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
          end
          object ParamsGridLevel1: TcxGridLevel
            GridView = ParamsTableView
          end
        end
      end
    end
    object DBMemo2: TDBMemo
      Left = 0
      Top = 81
      Width = 548
      Height = 123
      Align = alTop
      DataField = 'SQLText'
      DataSource = DMQuery.dsQueries
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 2
      OnExit = DBMemo1Exit
      ExplicitWidth = 444
    end
  end
  object QueryMenu: TPopupMenu
    Left = 216
    Top = 96
    object N1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N1Click
    end
  end
end
