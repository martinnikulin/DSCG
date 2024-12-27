object CopyBlocksForm: TCopyBlocksForm
  Left = 0
  Top = 0
  Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1083#1086#1082#1086#1074
  ClientHeight = 149
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 66
    Height = 14
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 56
    Top = 59
    Width = 26
    Height = 14
    Caption = #1050#1091#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ScopeCombo: TComboBox
    Left = 97
    Top = 13
    Width = 176
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 2
    ParentFont = False
    TabOrder = 0
    Text = #1054#1076#1080#1085' '#1073#1083#1086#1082
    Items.Strings = (
      #1041#1083#1086#1082#1080' '#1087#1083#1072#1089#1090#1072
      #1041#1083#1086#1082#1080' '#1076#1077#1090#1072#1083#1080
      #1054#1076#1080#1085' '#1073#1083#1086#1082)
  end
  object BitBtn2: TBitBtn
    Left = 153
    Top = 104
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 2
  end
  object VariantCombo: TDBLookupComboBox
    Left = 97
    Top = 59
    Width = 176
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ConditionId'
    ListField = 'VariantName'
    ListSource = DMReserves.dsVariants
    ParentFont = False
    TabOrder = 3
    OnCloseUp = VariantComboCloseUp
  end
end
