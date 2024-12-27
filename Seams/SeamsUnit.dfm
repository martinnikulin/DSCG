object SeamsFrame: TSeamsFrame
  Left = 0
  Top = 0
  Width = 1042
  Height = 700
  TabOrder = 0
  object cxSplitter2: TcxSplitter
    Left = 609
    Top = 0
    Width = 12
    Height = 700
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 700
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object SeamsGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 607
      Height = 698
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      OnExit = GridExit
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmClassic
      object SeamsTableView: TcxGridDBTableView
        PopupMenu = SeamsPopup
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
        OnEditValueChanged = SeamsTableViewEditValueChanged
        DataController.DataSource = DMSeams.dsSeams
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
        OptionsView.GridLineColor = clScrollBar
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 24
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        object SeamsTableViewseam_id: TcxGridDBColumn
          Caption = 'Id'
          DataBinding.FieldName = 'SeamId'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          MinWidth = 30
          Options.Editing = False
          Options.AutoWidthSizable = False
          Options.Grouping = False
          Options.Moving = False
          Width = 30
        end
        object SeamsTableViewdescription: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'Description'
          HeaderAlignmentHorz = taCenter
          Options.Grouping = False
          Width = 235
        end
        object SeamsTableViewshortname: TcxGridDBColumn
          Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'ShortName'
          HeaderAlignmentHorz = taCenter
          Width = 151
        end
        object SeamsTableViewstrata: TcxGridDBColumn
          Caption = #1057#1090#1088#1072#1090#1072
          DataBinding.FieldName = 'Strata'
          HeaderAlignmentHorz = taCenter
          MinWidth = 50
          Options.AutoWidthSizable = False
          Options.Grouping = False
          Width = 50
        end
        object SeamsTableViewnn: TcxGridDBColumn
          Caption = #8470
          DataBinding.FieldName = 'N'
          HeaderAlignmentHorz = taCenter
          MinWidth = 30
          Options.AutoWidthSizable = False
          Options.Grouping = False
          Options.Moving = False
          Width = 30
        end
        object SeamsTableViewactual: TcxGridDBColumn
          Caption = #1042' '#1087#1086#1076#1089#1095#1077#1090
          DataBinding.FieldName = 'Actual'
          HeaderAlignmentHorz = taCenter
          Width = 74
        end
        object SeamsTableViewworktype: TcxGridDBColumn
          Caption = #1042#1072#1088#1080#1072#1085#1090' '#1086#1090#1088#1072#1073#1086#1090#1082#1080
          DataBinding.FieldName = 'worktype'
          DataBinding.IsNullValueType = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 92
        end
        object SeamsTableViewAdRoof: TcxGridDBColumn
          Caption = 'Ad '#1082#1088#1086#1074#1083#1080
          DataBinding.FieldName = 'AdRoof'
        end
        object SeamsTableViewAdBed: TcxGridDBColumn
          Caption = 'Ad '#1087#1086#1095#1074#1099
          DataBinding.FieldName = 'AdBed'
        end
        object SeamsTableViewDdaRoof: TcxGridDBColumn
          Caption = 'Dda '#1082#1088#1086#1074#1083#1080
          DataBinding.FieldName = 'DdaRoof'
        end
        object SeamsTableViewDdaBed: TcxGridDBColumn
          Caption = 'Dda '#1087#1086#1095#1074#1099
          DataBinding.FieldName = 'DdaBed'
        end
      end
      object SeamsGridLevel1: TcxGridLevel
        GridView = SeamsTableView
      end
    end
  end
  object Panel2: TPanel
    Left = 621
    Top = 0
    Width = 421
    Height = 700
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 1
      Top = 313
      Width = 419
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = 0
      ExplicitTop = 209
      ExplicitWidth = 299
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 419
      Height = 312
      ActivePage = TabSheet1
      Align = alTop
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1044#1077#1090#1072#1083#1080
        object PartsGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 411
          Height = 282
          Align = alClient
          BevelKind = bkTile
          BorderStyle = cxcbsNone
          TabOrder = 0
          OnExit = GridExit
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.ScrollbarMode = sbmClassic
          object PartsTableView: TcxGridDBTableView
            PopupMenu = PartsPopup
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
            DataController.DataSource = DMSeams.dsParts
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ImmediateEditor = False
            OptionsData.Appending = True
            OptionsSelection.MultiSelect = True
            OptionsView.NoDataToDisplayInfoText = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 23
            OptionsView.GridLineColor = clScrollBar
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 24
            OptionsView.Indicator = True
            OptionsView.IndicatorWidth = 20
            object PartsTableViewpart_id: TcxGridDBColumn
              Caption = 'Id'
              DataBinding.FieldName = 'PartId'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              MinWidth = 30
              Options.Editing = False
              Options.AutoWidthSizable = False
              Width = 30
            end
            object PartsTableViewchapter: TcxGridDBColumn
              Caption = #1055#1088#1080#1083'.'
              DataBinding.FieldName = 'Chapter'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Width = 45
            end
            object PartsTableViewpart_nn: TcxGridDBColumn
              Caption = #8470' '#1087'/'#1087
              DataBinding.FieldName = 'N'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              MinWidth = 30
              Options.AutoWidthSizable = False
              Options.Grouping = False
              Width = 50
            end
            object PartsTableViewnpart: TcxGridDBColumn
              Caption = #1044#1077#1090#1072#1083#1100' '#8470
              DataBinding.FieldName = 'NPart'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Width = 80
            end
            object PartsTableViewvertical: TcxGridDBColumn
              Caption = #1042#1077#1088#1090'.'
              DataBinding.FieldName = 'Vertical'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Width = 80
            end
            object PartsTableViewdescription: TcxGridDBColumn
              Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              DataBinding.FieldName = 'Description'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Width = 368
            end
            object PartsTableViewColumn1: TcxGridDBColumn
              DataBinding.IsNullValueType = True
              Visible = False
              Options.AutoWidthSizable = False
              Width = 20
            end
          end
          object PartsGridLevel1: TcxGridLevel
            GridView = PartsTableView
          end
        end
      end
    end
    object PageControl2: TPageControl
      Left = 1
      Top = 316
      Width = 419
      Height = 383
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 1
      object TabSheet2: TTabSheet
        Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1101#1085#1090#1099
        object CoeffsGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 411
          Height = 353
          Align = alClient
          BevelKind = bkTile
          BorderStyle = cxcbsNone
          TabOrder = 0
          OnExit = GridExit
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.ScrollbarMode = sbmClassic
          object CoeffsTableView: TcxGridDBTableView
            PopupMenu = CoeffsPopup
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
            DataController.DataSource = DMSeams.dsCoeffs
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
            OptionsView.GridLineColor = clScrollBar
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 24
            OptionsView.Indicator = True
            OptionsView.IndicatorWidth = 20
            object CoeffsTableViewinterbedname: TcxGridDBColumn
              Caption = #1055#1088#1086#1089#1083#1086#1081
              DataBinding.FieldName = 'InterbedId'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'InterbedId'
              Properties.ListColumns = <
                item
                  FieldName = 'InterbedName'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = DM.dsInterbeds
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
            end
            object CoeffsTableViewtypename: TcxGridDBColumn
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
              Options.Filtering = False
              Options.Grouping = False
              Options.Sorting = False
              Width = 100
            end
            object CoeffsTableViewgradename: TcxGridDBColumn
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
              Options.Sorting = False
              Width = 100
            end
            object CoeffsTableViewa: TcxGridDBColumn
              DataBinding.FieldName = 'A'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Sorting = False
              Width = 100
            end
            object CoeffsTableViewb: TcxGridDBColumn
              DataBinding.FieldName = 'B'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Sorting = False
              Width = 100
            end
            object CoeffsTableViewSeamId: TcxGridDBColumn
              DataBinding.FieldName = 'SeamId'
              DataBinding.IsNullValueType = True
              Visible = False
              Options.AutoWidthSizable = False
              Width = 20
            end
            object CoeffsTableViewCoeffId: TcxGridDBColumn
              DataBinding.FieldName = 'CoeffId'
              DataBinding.IsNullValueType = True
              Visible = False
            end
          end
          object CoeffsGridLevel1: TcxGridLevel
            GridView = CoeffsTableView
          end
        end
      end
    end
  end
  object SeamsPopup: TPopupMenu
    Left = 384
    Top = 336
    object N1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N1Click
    end
  end
  object PartsPopup: TPopupMenu
    Left = 696
    Top = 64
    object MenuItem1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MenuItem1Click
    end
  end
  object CoeffsPopup: TPopupMenu
    Left = 652
    Top = 413
    object N55: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1077#1076#1086#1089#1090#1072#1102#1097#1080#1077' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' '#1080#1079' '#1073#1083#1086#1082#1086#1074
      OnClick = N55Click
    end
    object N3: TMenuItem
      Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
      OnClick = N3Click
    end
    object N56: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100'  '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1089#1090#1088#1086#1082
      OnClick = N56Click
    end
    object N2: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N2Click
    end
  end
end
