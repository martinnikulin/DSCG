object BlockModelForm: TBlockModelForm
  Left = 0
  Top = 0
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1073#1083#1086#1082'-'#1084#1086#1076#1077#1083#1100
  ClientHeight = 241
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    403
    241)
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 50
    Height = 15
    Caption = #1055#1088#1086#1089#1083#1086#1081
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 33
    Height = 15
    Caption = #1055#1083#1072#1089#1090
  end
  object Label3: TLabel
    Left = 24
    Top = 112
    Width = 63
    Height = 15
    Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
  end
  object Label4: TLabel
    Left = 24
    Top = 152
    Width = 82
    Height = 15
    Caption = #1056#1072#1079#1084#1077#1088' '#1103#1095#1077#1081#1082#1080
  end
  object InterbedCombo: TDBLookupComboBox
    Left = 168
    Top = 24
    Width = 201
    Height = 23
    KeyField = 'InterbedId'
    ListField = 'InterbedName'
    ListSource = DM.dsInterbeds
    TabOrder = 0
  end
  object SeamCombo: TDBLookupComboBox
    Left = 168
    Top = 64
    Width = 201
    Height = 23
    KeyField = 'SeamId'
    ListField = 'SeamName'
    ListSource = DM.dsSeams
    TabOrder = 1
  end
  object VarCombo: TComboBox
    Left = 168
    Top = 104
    Width = 201
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'Ad '#1091#1075#1083#1103
    Items.Strings = (
      'Ad '#1091#1075#1083#1103
      'Ad '#1075#1086#1088#1085#1086#1081' '#1084#1072#1089#1089#1099
      #1052#1086#1097#1085#1086#1089#1090#1100' '#1091#1075#1083#1103
      #1052#1086#1097#1085#1086#1089#1090#1100' '#1075#1086#1088#1085#1086#1081' '#1084#1072#1089#1089#1099)
  end
  object BitBtn1: TBitBtn
    Left = 126
    Top = 208
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
    ExplicitTop = 207
  end
  object BitBtn2: TBitBtn
    Left = 207
    Top = 208
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
    ExplicitTop = 207
  end
  object CellSizeEdit: TcxSpinEdit
    Left = 168
    Top = 149
    Properties.MinValue = 1.000000000000000000
    Properties.ZeroLargeIncrement = True
    TabOrder = 3
    Value = 10
    Width = 121
  end
end
