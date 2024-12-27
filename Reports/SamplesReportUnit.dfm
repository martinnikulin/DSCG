object SamplesReportForm: TSamplesReportForm
  Left = 772
  Top = 337
  BorderStyle = bsDialog
  Caption = #1042#1099#1074#1086#1076' '#1090#1072#1073#1083#1080#1094#1099' '#1072#1085#1072#1083#1080#1079#1086#1074' '#1074' Excel'
  ClientHeight = 164
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 49
    Height = 13
    Caption = #1055#1088#1086#1089#1083#1086#1081': '
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 40
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072':'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 72
    Top = 24
    Width = 209
    Height = 21
    KeyField = 'InterbedId'
    Listfield = 'InterbedName'
    ListSource = DMReports.dsInterbeds
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 122
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 160
    Top = 122
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 72
    Top = 64
    Width = 209
    Height = 21
    Enabled = False
    KeyField = 'GroupId'
    Listfield = 'GroupName'
    ListSource = DMReports.dsAssayGroups
    TabOrder = 3
  end
end
