object VariantForm: TVariantForm
  Left = 0
  Top = 0
  Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074' '#1074#1072#1088#1080#1072#1085#1090
  ClientHeight = 123
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 35
    Width = 42
    Height = 13
    Caption = #1042#1072#1088#1080#1072#1085#1090
  end
  object BitBtn2: TBitBtn
    Left = 80
    Top = 81
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
  end
  object BitBtn3: TBitBtn
    Left = 161
    Top = 81
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 64
    Top = 35
    Width = 233
    Height = 21
    KeyField = 'Id'
    ListField = 'Variant'
    ListSource = DM.dsCondition
    TabOrder = 2
  end
end
