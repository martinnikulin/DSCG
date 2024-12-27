object QueryResultForm: TQueryResultForm
  Left = 482
  Top = 235
  Caption = 'QueryResultForm'
  ClientHeight = 711
  ClientWidth = 1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 692
    Width = 1072
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitTop = 691
    ExplicitWidth = 1068
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 1072
    Height = 692
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.ScrollbarMode = sbmClassic
    ExplicitWidth = 1068
    ExplicitHeight = 691
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 72
    object Excel1: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      OnClick = Excel1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 184
    Top = 64
  end
end
