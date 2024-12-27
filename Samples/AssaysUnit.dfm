object AssaysForm: TAssaysForm
  Left = 431
  Top = 164
  Caption = #1040#1085#1072#1083#1080#1079#1099
  ClientHeight = 598
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    OnClick = Panel1Click
    ExplicitWidth = 512
    object CheckBox1: TCheckBox
      Left = 16
      Top = 10
      Width = 97
      Height = 17
      Caption = #1055#1086' '#1075#1088#1091#1087#1087#1072#1084
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 560
    Width = 516
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 559
    ExplicitWidth = 512
    object Button1: TButton
      Left = 175
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 256
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object TabControl: TcxTabControl
    Left = 0
    Top = 33
    Width = 516
    Height = 527
    Align = alClient
    TabOrder = 2
    Properties.CustomButtons.Buttons = <>
    Properties.MultiLineTabCaptions = True
    Properties.NavigatorPosition = npLeftBottom
    Properties.Rotate = True
    Properties.TabCaptionAlignment = taLeftJustify
    Properties.TabHeight = 50
    Properties.TabPosition = tpLeft
    Properties.TabWidth = 150
    LookAndFeel.NativeStyle = True
    ExplicitWidth = 512
    ExplicitHeight = 526
    ClientRectBottom = 523
    ClientRectLeft = 4
    ClientRectRight = 512
    ClientRectTop = 4
    object AssaysGrid: TcxGrid
      Left = 4
      Top = 4
      Width = 508
      Height = 519
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.ScrollbarMode = sbmClassic
      ExplicitWidth = 504
      ExplicitHeight = 518
      object AssaysTableView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DMLithology.dsAssaysCDS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ImmediateEditor = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsView.ScrollBars = ssVertical
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 23
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 24
        OptionsView.IndicatorWidth = 20
        object AssaysTableViewnn: TcxGridDBColumn
          Caption = #8470
          DataBinding.FieldName = 'N'
          HeaderAlignmentHorz = taCenter
          MinWidth = 30
          Options.Editing = False
          Options.AutoWidthSizable = False
          Width = 30
        end
        object AssaysTableViewGroupName: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1087#1072
          DataBinding.FieldName = 'GroupName'
          DataBinding.IsNullValueType = True
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object AssaysTableViewdescription: TcxGridDBColumn
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088
          DataBinding.FieldName = 'Description'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 205
        end
        object AssaysTableViewval: TcxGridDBColumn
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          DataBinding.FieldName = 'Val'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          HeaderAlignmentHorz = taCenter
          MinWidth = 80
          Width = 80
        end
        object AssaysTableViewChanged: TcxGridDBColumn
          DataBinding.FieldName = 'Changed'
          Visible = False
        end
      end
      object AssaysGridLevel1: TcxGridLevel
        GridView = AssaysTableView
      end
    end
  end
end
