object MainForm: TMainForm
  Left = 219
  Top = 123
  Caption = 'MainForm'
  ClientHeight = 750
  ClientWidth = 1234
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 595
    Width = 1234
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    Visible = False
  end
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 1234
    Height = 62
    ApplicationButton.Menu = BackstageView
    BarManager = dxBarManager1
    CapitalizeTabCaptions = bTrue
    Style = rs2016Tablet
    ColorSchemeName = 'Colorful'
    Fonts.AssignedFonts = [afTabHeader]
    Fonts.TabHeader.Charset = DEFAULT_CHARSET
    Fonts.TabHeader.Color = clWindowText
    Fonts.TabHeader.Height = -13
    Fonts.TabHeader.Name = 'Segoe UI'
    Fonts.TabHeader.Style = []
    QuickAccessToolbar.Visible = False
    ShowMinimizeButton = False
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 0
    TabStop = False
    OnTabChanged = dxRibbon1TabChanged
    object dxRibbon1Tab1: TdxRibbonTab
      Active = True
      Caption = #1057#1050#1042#1040#1046#1048#1053#1067
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar10'
        end>
      Index = 0
    end
    object dxRibbon1Tab2: TdxRibbonTab
      Caption = #1055#1051#1040#1057#1058#1067
      Groups = <>
      Index = 1
    end
    object dxRibbon1Tab3: TdxRibbonTab
      Caption = #1044#1040#1053#1053#1067#1045' '#1055#1054' '#1057#1050#1042#1040#1046#1048#1053#1040#1052
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar2'
        end
        item
          ToolbarName = 'dxBarManager1Bar6'
        end
        item
          ToolbarName = 'dxBarManager1Bar9'
        end>
      Index = 2
    end
    object dxRibbon1Tab7: TdxRibbonTab
      Caption = #1055#1051#1040#1057#1058#1054#1055#1045#1056#1045#1057#1045#1063#1045#1053#1048#1071
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar1'
        end>
      Index = 3
    end
    object dxRibbon1Tab4: TdxRibbonTab
      Caption = #1055#1054#1044#1057#1063#1045#1058' '#1047#1040#1055#1040#1057#1054#1042
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar3'
        end
        item
          ToolbarName = 'dxBarManager1Bar8'
        end>
      Index = 4
    end
    object dxRibbon1Tab5: TdxRibbonTab
      Caption = #1047#1040#1055#1056#1054#1057#1067
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar4'
        end>
      Index = 5
    end
    object dxRibbon1Tab8: TdxRibbonTab
      Caption = #1043#1045#1054#1052#1045#1058#1056#1048#1071
      Groups = <>
      Index = 6
    end
    object dxRibbon1Tab6: TdxRibbonTab
      Caption = #1057#1055#1056#1040#1042#1054#1063#1053#1048#1050#1048' '#1048' '#1053#1040#1057#1058#1056#1054#1049#1050#1048
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar5'
        end>
      Index = 7
    end
  end
  object StatusBar: TdxRibbonStatusBar
    Left = 0
    Top = 725
    Width = 1234
    Height = 25
    Color = clBtnFace
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    Ribbon = dxRibbon1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ExplicitTop = 724
    ExplicitWidth = 1230
  end
  object MsgMemo: TMemo
    Left = 0
    Top = 600
    Width = 1234
    Height = 125
    Align = alBottom
    PopupMenu = MemoPopup
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
    ExplicitTop = 599
    ExplicitWidth = 1230
  end
  object PageControl: TcxPageControl
    Left = 0
    Top = 62
    Width = 1234
    Height = 533
    Align = alClient
    TabOrder = 2
    Visible = False
    Properties.ActivePage = LithologyTab
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    OnChange = PageControlChange
    ClientRectBottom = 532
    ClientRectLeft = 1
    ClientRectRight = 1233
    ClientRectTop = 1
    object BoreholesTab: TcxTabSheet
      Caption = 'BoreholesTab'
      ImageIndex = 0
      inline BoreholesFrame: TBoreholesFrame
        Left = 0
        Top = 0
        Width = 1232
        Height = 531
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 1232
        ExplicitHeight = 531
        inherited Splitter15: TSplitter
          Height = 531
          ExplicitHeight = 531
        end
        inherited Panel11: TPanel
          Height = 531
          ExplicitHeight = 531
          inherited Splitter14: TSplitter
            Top = 332
            ExplicitTop = 332
          end
          inherited SurveyGrid: TcxGrid
            Top = 335
            ExplicitTop = 335
            inherited SurveyGridTableView: TcxGridDBTableView
              inherited SurveyGridTableViewdepth: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited SurveyGridTableViewdip: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited SurveyGridTableViewazimuth: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
          inherited BHGrid: TcxGrid
            Height = 332
            ExplicitHeight = 332
            inherited BHTableView: TcxGridDBTableView
              inherited cxGridDBColumn2: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited cxGridDBColumn3: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited cxGridDBColumn4: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited cxGridDBColumn5: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited cxGridDBColumn6: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited cxGridDBColumn7: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited cxGridDBColumn8: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
        end
        inherited Panel21: TPanel
          Width = 629
          Height = 531
          ExplicitWidth = 629
          ExplicitHeight = 531
          inherited Splitter16: TSplitter
            Width = 629
            ExplicitWidth = 629
          end
          inherited TabControl1: TTabControl
            Width = 629
            ExplicitWidth = 629
            inherited SLGrid: TcxGrid
              Width = 621
              ExplicitWidth = 621
              inherited SLGridTableView: TcxGridDBTableView
                inherited SLGridTableViewsl_id: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLGridTableViewnn: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLGridTableViewdescription: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLGridTableViewsltypename: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLGridTableViewX1: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLGridTableViewY1: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLGridTableViewX2: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLGridTableViewY2: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLGridTableViewCalcSpreadAzimuths: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
          end
          inherited TabControl2: TTabControl
            Width = 629
            Height = 223
            ExplicitWidth = 629
            ExplicitHeight = 223
            inherited SLHGrid: TcxGrid
              Width = 621
              Height = 195
              ExplicitWidth = 621
              ExplicitHeight = 195
              inherited SLHGridTableView: TcxGridDBTableView
                inherited SLHGridTableViewhole_id: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLHGridTableViewnn: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLHGridTableViewholename: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLHGridTableViewnode: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLHGridTableViewshift: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLHGridTableViewonprofile: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLHGridTableViewX: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLHGridTableViewY: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SLHGridTableViewZ: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
            inherited CheckBox3: TCheckBox
              Left = 481
              ExplicitLeft = 481
            end
          end
        end
      end
    end
    object SeemsTab: TcxTabSheet
      Caption = 'SeamsTab'
      ImageIndex = 1
      inline SeamsFrame: TSeamsFrame
        Left = 0
        Top = 0
        Width = 1232
        Height = 531
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1232
        ExplicitHeight = 531
        inherited cxSplitter2: TcxSplitter
          Height = 531
          ExplicitHeight = 531
        end
        inherited Panel1: TPanel
          Height = 531
          ExplicitHeight = 531
          inherited SeamsGrid: TcxGrid
            Height = 529
            ExplicitHeight = 529
            inherited SeamsTableView: TcxGridDBTableView
              inherited SeamsTableViewworktype: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
        end
        inherited Panel2: TPanel
          Width = 611
          Height = 531
          ExplicitWidth = 611
          ExplicitHeight = 531
          inherited Splitter1: TSplitter
            Width = 609
            ExplicitWidth = 609
          end
          inherited PageControl1: TPageControl
            Width = 609
            ExplicitWidth = 609
            inherited TabSheet1: TTabSheet
              ExplicitTop = 24
              ExplicitWidth = 601
              ExplicitHeight = 284
              inherited PartsGrid: TcxGrid
                Width = 601
                Height = 284
                ExplicitWidth = 601
                ExplicitHeight = 284
                inherited PartsTableView: TcxGridDBTableView
                  inherited PartsTableViewpart_id: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited PartsTableViewchapter: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited PartsTableViewpart_nn: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited PartsTableViewnpart: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited PartsTableViewvertical: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited PartsTableViewdescription: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited PartsTableViewColumn1: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                end
              end
            end
          end
          inherited PageControl2: TPageControl
            Width = 609
            Height = 214
            ExplicitWidth = 609
            ExplicitHeight = 214
            inherited TabSheet2: TTabSheet
              ExplicitTop = 24
              ExplicitWidth = 601
              ExplicitHeight = 186
              inherited CoeffsGrid: TcxGrid
                Width = 601
                Height = 186
                ExplicitWidth = 601
                ExplicitHeight = 355
                inherited CoeffsTableView: TcxGridDBTableView
                  inherited CoeffsTableViewinterbedname: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited CoeffsTableViewtypename: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited CoeffsTableViewgradename: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited CoeffsTableViewa: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited CoeffsTableViewb: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited CoeffsTableViewSeamId: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited CoeffsTableViewCoeffId: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                end
              end
            end
          end
        end
      end
    end
    object LithologyTab: TcxTabSheet
      Caption = 'LithologyTab'
      ImageIndex = 2
      inline LithologyFrame: TLithologyFrame
        Left = 0
        Top = 0
        Width = 1232
        Height = 531
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        TabOrder = 0
        ExplicitLeft = -518
        ExplicitTop = -219
        inherited Splitter4: TSplitter
          Height = 531
        end
        inherited Panel1: TPanel
          Width = 861
          Height = 531
          inherited Splitter2: TSplitter
            Width = 861
          end
          inherited Panel3: TPanel
            Width = 861
            Height = 296
            inherited Splitter3: TSplitter
              Width = 861
            end
            inherited LithologyPageControl: TPageControl
              Width = 861
              inherited TabSheet1: TTabSheet
                ExplicitTop = 24
                ExplicitWidth = 853
                ExplicitHeight = 278
                inherited LithologyGrid: TcxGrid
                  Width = 853
                  Height = 278
                  ExplicitHeight = 278
                end
              end
            end
            inherited SamplesPageControl: TPageControl
              Width = 861
              inherited TabSheet2: TTabSheet
                ExplicitTop = 24
                ExplicitWidth = 853
                ExplicitHeight = 177
                inherited SamplesGrid: TcxGrid
                  Width = 853
                  Height = 177
                  ExplicitHeight = 177
                  inherited SamplesTableView: TcxGridDBTableView
                    inherited SamplesTableViewColumn1: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewinsum: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewqual: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewlayerN: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewsampletype: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewlevelname: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewwash: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewshow: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                  end
                  inherited SamplesGridDBTableView2: TcxGridDBTableView
                    inherited SamplesGridDBTableView2nn: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesGridDBTableView2Adname: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                  end
                end
              end
            end
            inherited CheckBox2: TCheckBox
              Left = 675
            end
          end
          inherited TabControl1: TTabControl
            Width = 861
            inherited HSGrid: TcxGrid
              Top = 24
              Width = 853
              Height = 203
              ExplicitTop = 24
              ExplicitHeight = 203
              inherited HSTableView: TcxGridDBTableView
                inherited HSTableViewholeseam_id: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewcomments: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewdepth_from: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewdepth_to: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewseamname: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewdetail: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewKB: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewdraw_from: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewdraw_to: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewcoalgradename: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewcoaltypename: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited HSTableViewdip: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
          end
        end
        inherited Panel2: TPanel
          Height = 531
          inherited TabControl2: TTabControl
            Height = 190
            inherited LineHolesGrid: TcxGrid
              Top = 24
              Height = 162
              ExplicitTop = 24
              ExplicitHeight = 381
              inherited LineHolesTableView: TcxGridDBTableView
                inherited LineHolesTableViewhole_id: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited LineHolesTableViewnn: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited LineHolesTableViewholename: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
          end
          inherited TabControl3: TTabControl
            inherited LinesGrid: TcxGrid
              Top = 24
              Height = 310
              ExplicitTop = 24
              ExplicitHeight = 310
              inherited LinesGridTableView: TcxGridDBTableView
                inherited LinesGridTableViewsl_id: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited LinesGridTableViewnn: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited LinesGridTableViewslname: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
          end
        end
      end
    end
    object HoleseamTab: TcxTabSheet
      Caption = 'HoleseamTab'
      ImageIndex = 6
      inline HoleseamsFrame: THoleseamsFrame
        Left = 0
        Top = 0
        Width = 1232
        Height = 531
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 1232
        ExplicitHeight = 531
        inherited Splitter3: TSplitter
          Height = 531
          ExplicitHeight = 531
        end
        inherited Panel19: TPanel
          Height = 531
          ExplicitHeight = 531
          inherited Splitter2: TSplitter
            Top = 380
            ExplicitTop = 380
          end
          inherited SeamsGrid: TcxGrid
            Height = 380
            ExplicitHeight = 380
            inherited SeamsTableView: TcxGridDBTableView
              inherited SeamsTableViewseam_id: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited SeamsTableViewshortname: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited SeamsTableViewdescription: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
          inherited AveragesGrid: TcxGrid
            Top = 383
            ExplicitTop = 383
            inherited AveragesTableView: TcxGridDBTableView
              inherited AveragesTableViewCoalType: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited AveragesTableViewCoalGrade: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited AveragesTableViewVarId: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited AveragesTableViewValue: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited AveragesTableViewUserValue: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
        end
        inherited Panel1: TPanel
          Width = 836
          Height = 531
          ExplicitWidth = 836
          ExplicitHeight = 531
          inherited Splitter1: TSplitter
            Width = 836
            ExplicitWidth = 836
          end
          inherited HSGrid: TcxGrid
            Width = 836
            ExplicitWidth = 836
            inherited HSTableView: TcxGridDBTableView
              inherited HSTableViewholeseam_id: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewholename: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewcomments: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewKB: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewdepth_from: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewdepth_to: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewcoaltypename: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewcoalgradename: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewAd_coal: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewAd_total: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewAdR: TcxGridDBColumn
                DataBinding.IsNullValueType = True
                IsCaptionAssigned = True
              end
              inherited HSTableViewth_coal: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewth_total: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewth_total_R: TcxGridDBColumn
                DataBinding.IsNullValueType = True
                IsCaptionAssigned = True
              end
              inherited HSTableViewAvgCalc: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewOnMap: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewlock: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewstat: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewcalcunit_id: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
          inherited Panel31: TPanel
            Width = 836
            Height = 209
            ExplicitWidth = 836
            ExplicitHeight = 209
            inherited Splitter4: TSplitter
              Height = 209
              ExplicitHeight = 209
            end
            inherited PageControl4: TPageControl
              Width = 416
              Height = 209
              ExplicitWidth = 416
              ExplicitHeight = 209
              inherited TabSheet13: TTabSheet
                ExplicitWidth = 408
                ExplicitHeight = 181
                inherited SamplesGrid: TcxGrid
                  Width = 408
                  Height = 181
                  ExplicitWidth = 408
                  ExplicitHeight = 181
                  inherited SamplesTableView: TcxGridDBTableView
                    inherited SamplesTableViewsample_id: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewaccepted: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewbad: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewdepth_from: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewdepth_to: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewAd: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewAd_float: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewAd_gbs: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewAd_geophys: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewAd_s: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited SamplesTableViewAd_index: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                  end
                end
              end
            end
            inherited PageControl5: TPageControl
              Height = 209
              ExplicitHeight = 209
              inherited TabSheet15: TTabSheet
                ExplicitHeight = 181
                inherited LithologyGrid: TcxGrid
                  Height = 181
                  ExplicitHeight = 181
                  inherited LithologyTableView: TcxGridDBTableView
                    inherited LithologyTableViewlithology_id: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited LithologyTableViewdepth_from: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited LithologyTableViewdepth_to: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited LithologyTableViewth_norm: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited LithologyTableViewcore_proc: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited LithologyTableViewlithname: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited LithologyTableViewreserves: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                  end
                end
              end
            end
          end
          inherited cxGrid1: TcxGrid
            inherited cxGrid1DBTableView1: TcxGridDBTableView
              inherited cxGrid1DBTableView1VarName: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited cxGrid1DBTableView1Value: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
        end
      end
    end
    object ReservesTab: TcxTabSheet
      Caption = 'ReservesTab'
      ImageIndex = 3
      inline ReservesFrame: TReservesFrame
        Left = 0
        Top = 0
        Width = 1232
        Height = 531
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1232
        ExplicitHeight = 531
        inherited Splitter11: TSplitter
          Height = 531
          ExplicitHeight = 531
        end
        inherited Panel19: TPanel
          Height = 531
          ExplicitHeight = 531
          inherited Panel12: TPanel
            inherited SeamsGrid: TcxGrid
              inherited SeamsTableView: TcxGridDBTableView
                inherited SeamsTableViewseam_id: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SeamsTableViewshortname: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited SeamsTableViewdescription: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
            inherited VariantsGrid: TcxGrid
              inherited VariantsTableView: TcxGridDBTableView
                inherited VariantsTableViewId: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited VariantsTableViewnn: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited VariantsTableViewcondname: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited VariantsTableViewrealcondname: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
          end
          inherited HSGrid: TcxGrid
            Height = 319
            ExplicitHeight = 319
            inherited HSTableView: TcxGridDBTableView
              inherited HSTableViewholeseam_id: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewholename: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewcomments: TcxGridDBColumn
                DataBinding.IsNullValueType = True
                IsCaptionAssigned = True
              end
              inherited HSTableViewdepth_from: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewdepth_to: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewcoaltypename: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewcoalgradename: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewAd_coal: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewAd_total: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewAdR: TcxGridDBColumn
                DataBinding.IsNullValueType = True
                IsCaptionAssigned = True
              end
              inherited HSTableViewth_coal: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewth_total: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewThR: TcxGridDBColumn
                DataBinding.IsNullValueType = True
                IsCaptionAssigned = True
              end
              inherited HSTableViewAvgCalc: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewOnMap: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewlock: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewstat: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewAd_avg: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited HSTableViewcalcunit_id: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
        end
        inherited Panel20: TPanel
          Width = 508
          Height = 531
          ExplicitWidth = 508
          ExplicitHeight = 531
          inherited TabControl1: TTabControl
            Width = 508
            Height = 531
            ExplicitWidth = 508
            ExplicitHeight = 531
            inherited Label1: TLabel
              Left = 273
              Height = 13
              ExplicitLeft = 273
              ExplicitHeight = 13
            end
            inherited Splitter1: TSplitter
              Width = 500
              ExplicitWidth = 500
            end
            inherited Splitter2: TSplitter
              Top = 350
              Width = 500
              ExplicitTop = 350
              ExplicitWidth = 500
            end
            inherited BlockDetailsGrid: TcxGrid
              Width = 500
              Height = 83
              ExplicitWidth = 500
              ExplicitHeight = 83
              inherited BlockDetailsTableView: TcxGridDBTableView
                inherited BlockDetailsTableViewId: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockDetailsTableViewarea: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockDetailsTableViewboundaryname: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockDetailsTableViewattr1name: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockDetailsTableViewZ: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockDetailsTableViewcoalgradename: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockDetailsTableViewpillarname: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockDetailsTableViewres_coal: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockDetailsTableViewres_total: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
            inherited PartCombo: TDBLookupComboBox
              Left = 317
              ExplicitLeft = 317
            end
            inherited BlockUnitsGrid: TcxGrid
              Top = 353
              Width = 500
              ExplicitTop = 353
              ExplicitWidth = 500
              inherited BlockUnitsTableView: TcxGridDBTableView
                inherited BlockUnitsTableViewHoleSeamId: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockUnitsTableViewholename: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockUnitsTableViewDepthFrom: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockUnitsTableViewDepthTo: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockUnitsTableViewAdCoal: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockUnitsTableViewAdFull: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockUnitsTableViewAdR: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                  IsCaptionAssigned = True
                end
                inherited BlockUnitsTableViewThCoal: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockUnitsTableViewThFull: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BlockUnitsTableViewThR: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                  IsCaptionAssigned = True
                end
                inherited BlockUnitsTableViewAvgCalc: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
            inherited Panel1: TPanel
              Width = 500
              ExplicitWidth = 500
              inherited BlocksGrid: TcxGrid
                Width = 500
                ExplicitWidth = 500
                inherited BlocksTableView: TcxGridDBTableView
                  inherited BlocksTableViewBlockId: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited BlocksTableViewBalance: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited BlocksTableViewBlockName: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited BlocksTableViewCategory: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited BlocksTableViewColumn1: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited BlocksTableViewDip: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited BlocksTableViewAdCoal: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited BlocksTableViewAdFull: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited BlocksTableViewThCoal: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited BlocksTableViewThFull: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited BlocksTableViewLock: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                end
              end
              inherited cxDBMemo2: TcxDBMemo
                ExplicitWidth = 500
                Width = 500
              end
            end
          end
        end
      end
    end
    object QueryTab: TcxTabSheet
      Caption = 'QueryTab'
      ImageIndex = 4
      inline QueryFrame: TQueryFrame
        Left = 0
        Top = 0
        Width = 1232
        Height = 531
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1232
        ExplicitHeight = 531
        inherited Splitter1: TSplitter
          Height = 531
          ExplicitHeight = 531
        end
        inherited Panel1: TPanel
          Height = 531
          ExplicitHeight = 531
          inherited QueryGrid: TcxGrid
            Height = 531
            ExplicitWidth = 649
            ExplicitHeight = 531
            inherited QueryTableView: TcxGridDBTableView
              inherited QueryTableViewquery_id: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited QueryTableViewquerygroup: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited QueryTableViewdescription: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited QueryTableViewtemplate: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited QueryTableViewusetemplate: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
        end
        inherited Panel2: TPanel
          Width = 580
          Height = 531
          ExplicitLeft = 652
          ExplicitWidth = 580
          ExplicitHeight = 531
          inherited Splitter2: TSplitter
            Width = 580
            ExplicitWidth = 580
          end
          inherited Splitter3: TSplitter
            Width = 580
            ExplicitWidth = 580
          end
          inherited DBMemo1: TDBMemo
            Width = 580
            ExplicitWidth = 548
          end
          inherited PageControl1: TPageControl
            Width = 580
            Height = 321
            ExplicitWidth = 580
            ExplicitHeight = 321
            inherited TabSheet1: TTabSheet
              ExplicitTop = 24
              ExplicitWidth = 572
              ExplicitHeight = 293
              inherited ParamsGrid: TcxGrid
                Width = 572
                Height = 293
                ExplicitWidth = 540
                ExplicitHeight = 253
                inherited ParamsTableView: TcxGridDBTableView
                  inherited ParamsTableViewquery_id: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited ParamsTableViewnparam: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited ParamsTableViewdescription: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited ParamsTableViewparamtype: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited ParamsTableViewreftable: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited ParamsTableViewlistfield: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                  inherited ParamsTableViewkeyfield: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                  end
                end
              end
            end
          end
          inherited DBMemo2: TDBMemo
            Width = 580
            ExplicitWidth = 548
          end
        end
      end
    end
    object GeomTab: TcxTabSheet
      Caption = 'GeomTab'
      ImageIndex = 7
      inline GeomFrame: TGeomFrame
        Left = 0
        Top = 0
        Width = 1232
        Height = 531
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1232
        ExplicitHeight = 531
        inherited Splitter2: TSplitter
          Height = 531
          ExplicitHeight = 531
        end
        inherited Panel1: TPanel
          Height = 531
          ExplicitHeight = 531
          inherited cxGrid2: TcxGrid
            inherited cxGrid2DBTableView1: TcxGridDBTableView
              inherited cxGrid2DBTableView1SeamId: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited cxGrid2DBTableView1Description: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
          inherited cxGrid3: TcxGrid
            inherited cxGrid3DBTableView1: TcxGridDBTableView
              inherited cxGrid3DBTableView1PartId: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited cxGrid3DBTableView1NPart: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited cxGrid3DBTableView1Vertical: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
          inherited TreeView: TTreeView
            Height = 38
            ExplicitHeight = 38
          end
          inherited Panel4: TPanel
            inherited Label1: TLabel
              Width = 116
              Height = 13
              ExplicitWidth = 116
              ExplicitHeight = 13
            end
            inherited InterbedCombo: TDBLookupComboBox
              Height = 21
              ExplicitHeight = 21
            end
          end
          inherited DBGrid1: TDBGrid
            Top = 353
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
          end
        end
        inherited Panel3: TPanel
          Width = 820
          Height = 531
          ExplicitWidth = 820
          ExplicitHeight = 531
          inherited MapControl: TdxMapControl
            Width = 820
            Height = 500
            ExplicitWidth = 820
            ExplicitHeight = 500
          end
          inherited Panel2: TPanel
            Top = 500
            Width = 820
            ExplicitTop = 500
            ExplicitWidth = 820
            inherited ComboBox1: TComboBox
              Height = 21
              ExplicitHeight = 21
            end
          end
        end
      end
    end
    object SettingsTab: TcxTabSheet
      Caption = 'SettingsTab'
      ImageIndex = 5
      inline SettingsFrame: TSettingsFrame
        Left = 0
        Top = 0
        Width = 1232
        Height = 531
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1232
        ExplicitHeight = 531
        inherited dxNavBar1: TdxNavBar
          Height = 531
          ExplicitHeight = 530
          inherited TablesGroup: TdxNavBarGroup
            Links = <
              item
                Item = SettingsFrame.RocksItem
              end
              item
                Item = SettingsFrame.AssayVarsItem
              end>
          end
          inherited ReservesGroup: TdxNavBarGroup
            Links = <
              item
                Item = SettingsFrame.ConditionsItem
              end
              item
                Item = SettingsFrame.VersionsItem
              end>
          end
          inherited DictionariesGroup: TdxNavBarGroup
            Links = <
              item
                Item = SettingsFrame.BoundariesItem
              end
              item
                Item = SettingsFrame.ResParamsItem
              end
              item
                Item = SettingsFrame.CoalRanksItem
              end
              item
                Item = SettingsFrame.CoalTypesItem
              end
              item
                Item = SettingsFrame.PillarsItem
              end
              item
                Item = SettingsFrame.FormationsItem
              end>
          end
          inherited SiteInfoGroup: TdxNavBarGroup
            Links = <
              item
                Item = SettingsFrame.SiteInfoItem
              end>
          end
        end
        inherited SettingsPageControl: TcxPageControl
          Width = 975
          Height = 531
          ExplicitWidth = 975
          ExplicitHeight = 531
          ClientRectBottom = 530
          ClientRectRight = 974
          inherited _0_RocksTab: TcxTabSheet
            inherited RocksGrid: TcxGrid
              inherited RocksTableView: TcxGridDBTableView
                inherited RocksTableViewlith_id: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited RocksTableViewdescription: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited RocksTableViewcoregroup: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited RocksTableViewAd: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited RocksTableViewdensity: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited RocksTableViewautocad: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited RocksTableViewscale_autocad: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited RocksTableViewa: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
          end
          inherited _1_AssaysTab: TcxTabSheet
            inherited AssayPageControl: TcxPageControl
              Width = 943
              Height = 673
              ExplicitWidth = 943
              ExplicitHeight = 673
              ClientRectBottom = 671
              ClientRectRight = 941
              inherited AssayTabSheet1: TcxTabSheet
                inherited AssayGroupGrid: TcxGrid
                  inherited AssayGroupTableView: TcxGridDBTableView
                    inherited AssayGroupTableViewgroup_id: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited AssayGroupTableViewnn: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited AssayGroupTableViewgroupname: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                  end
                end
                inherited AssayVarsGrid: TcxGrid
                  inherited AssayVarsTableView: TcxGridDBTableView
                    inherited AssayVarsTableViewvar_id: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited AssayVarsTableViewnn: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited AssayVarsTableViewdescription: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited AssayVarsTableViewDimension: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited AssayVarsTableViewactual: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited AssayVarsTableViewcomposite: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited AssayVarsTableViewAssayTable: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited AssayVarsTableViewAutocadText: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited AssayVarsTableViewDigits: TcxGridDBColumn
                      DataBinding.IsNullValueType = True
                    end
                  end
                end
              end
              inherited AssayTabSheet2: TcxTabSheet
                inherited Panel7: TPanel
                  Width = 935
                  Height = 633
                  ExplicitWidth = 935
                  ExplicitHeight = 633
                  inherited Splitter3: TSplitter
                    Height = 631
                    ExplicitHeight = 631
                  end
                  inherited Panel3: TPanel
                    Width = 466
                    Height = 631
                    ExplicitWidth = 466
                    ExplicitHeight = 631
                    inherited Panel5: TPanel
                      Width = 466
                      ExplicitWidth = 466
                    end
                    inherited cxGrid3: TcxGrid
                      Width = 466
                      Height = 576
                      ExplicitWidth = 466
                      ExplicitHeight = 576
                      inherited cxGridDBTableView3: TcxGridDBTableView
                        inherited cxGridDBTableView3VarId: TcxGridDBColumn
                          DataBinding.IsNullValueType = True
                        end
                        inherited cxGridDBTableView3N: TcxGridDBColumn
                          DataBinding.IsNullValueType = True
                        end
                        inherited cxGridDBTableView3VarName: TcxGridDBColumn
                          DataBinding.IsNullValueType = True
                        end
                      end
                    end
                  end
                  inherited Panel2: TPanel
                    Height = 631
                    ExplicitHeight = 631
                    inherited cxGrid2: TcxGrid
                      Height = 576
                      ExplicitHeight = 576
                      inherited cxGridDBTableView2: TcxGridDBTableView
                        inherited cxGridDBTableView2var_id: TcxGridDBColumn
                          DataBinding.IsNullValueType = True
                        end
                        inherited cxGridDBTableView2description: TcxGridDBColumn
                          DataBinding.IsNullValueType = True
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          inherited _3_CondsTab: TcxTabSheet
            inherited CondDefsGrid: TcxGrid
              inherited CondDefsTableView: TcxGridDBTableView
                inherited CondDefsTableViewsection: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited CondDefsTableViewnn: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited CondDefsTableViewcondname: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited CondDefsTableViewactual: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
          end
          inherited _4_VersionsTab: TcxTabSheet
            inherited VersionsGrid: TcxGrid
              inherited VersionsTableView: TcxGridDBTableView
                inherited VersionsTableViewVersionId: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited VersionsTableViewVersionName: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited VersionsTableViewDescription: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
          end
          inherited _5_BoundariesTab: TcxTabSheet
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitWidth = 969
            ExplicitHeight = 528
            inherited Splitter10: TSplitter
              Width = 973
              ExplicitWidth = 973
            end
            inherited BoundaryGrid: TcxGrid
              Width = 973
              ExplicitWidth = 969
              inherited BoundaryTableView: TcxGridDBTableView
                inherited cxGridDBColumn1: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited cxGridDBColumn3: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited cxGridDBColumn4: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited cxGridDBColumn5: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BoundaryTableViewActual: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
            inherited BoundaryRelsGrid: TcxGrid
              Width = 973
              Height = 250
              ExplicitWidth = 969
              ExplicitHeight = 249
              inherited BoundaryRelsTableView: TcxGridDBTableView
                inherited BoundaryRelsTableViewrefname: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BoundaryRelsTableViewoperator: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited BoundaryRelsTableViewitemname: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
            inherited Panel1: TPanel
              Width = 973
              ExplicitWidth = 969
            end
          end
          inherited _6_ResParamsTab: TcxTabSheet
            ExplicitWidth = 943
            ExplicitHeight = 673
            inherited TabControl1: TTabControl
              Height = 673
              ExplicitHeight = 673
              inherited ResParamsGrid: TcxDBVerticalGrid
                Top = 24
                Height = 645
                ExplicitTop = 24
                ExplicitHeight = 643
                Version = 1
                inherited ResParamsGridA: TcxDBEditorRow
                  ID = 0
                  ParentID = -1
                  Index = 0
                  Version = 1
                end
                inherited ResParamsGridBeta: TcxDBEditorRow
                  ID = 1
                  ParentID = -1
                  Index = 1
                  Version = 1
                end
                inherited ResParamsGridH: TcxDBEditorRow
                  ID = 2
                  ParentID = -1
                  Index = 2
                  Version = 1
                end
                inherited ResParamsGridB: TcxDBEditorRow
                  ID = 3
                  ParentID = -1
                  Index = 3
                  Version = 1
                end
                inherited ResParamsGridPTransportBVR: TcxDBEditorRow
                  ID = 4
                  ParentID = -1
                  Index = 4
                  Version = 1
                end
                inherited ResParamsGridKrovla1: TcxDBEditorRow
                  ID = 5
                  ParentID = -1
                  Index = 5
                  Version = 1
                end
                inherited ResParamsGridKrovla2: TcxDBEditorRow
                  ID = 6
                  ParentID = -1
                  Index = 6
                  Version = 1
                end
                inherited ResParamsGridKrovla3: TcxDBEditorRow
                  ID = 7
                  ParentID = -1
                  Index = 7
                  Version = 1
                end
                inherited ResParamsGridPochva: TcxDBEditorRow
                  ID = 8
                  ParentID = -1
                  Index = 8
                  Version = 1
                end
                inherited ResParamsGridVerch: TcxDBEditorRow
                  ID = 9
                  ParentID = -1
                  Index = 9
                  Version = 1
                end
                inherited ResParamsGridOkont: TcxDBEditorRow
                  ID = 10
                  ParentID = -1
                  Index = 10
                  Version = 1
                end
                inherited ResParamsGridZasorPochva: TcxDBEditorRow
                  ID = 11
                  ParentID = -1
                  Index = 11
                  Version = 1
                end
                inherited ResParamsGridZasorKrovla: TcxDBEditorRow
                  ID = 12
                  ParentID = -1
                  Index = 12
                  Version = 1
                end
              end
            end
          end
          inherited _7_DictTab: TcxTabSheet
            inherited DictGrid: TcxGrid
              inherited DictTableView: TcxGridDBTableView
                inherited cxGridDBColumn6: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited cxGridDBColumn8: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited cxGridDBColumn9: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited cxGridDBColumn10: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
                inherited DictTableViewsection: TcxGridDBColumn
                  DataBinding.IsNullValueType = True
                end
              end
            end
          end
          inherited _8_SiteTab: TcxTabSheet
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 943
            ExplicitHeight = 673
            inherited SiteFrame: TSiteFrame
              Width = 943
              Height = 673
              ExplicitWidth = 943
              ExplicitHeight = 673
              inherited Splitter1: TSplitter
                Height = 673
                ExplicitHeight = 673
              end
              inherited Panel3: TPanel
                Height = 673
                ExplicitHeight = 673
                inherited TabControl2: TTabControl
                  Height = 412
                  ExplicitHeight = 412
                  inherited ReportsGrid: TcxGrid
                    Top = 24
                    Height = 384
                    ExplicitTop = 24
                    ExplicitHeight = 382
                    inherited ReportsTableView: TcxGridDBTableView
                      inherited ReportsTableViewProjectNumber: TcxGridDBColumn
                        DataBinding.IsNullValueType = True
                      end
                      inherited ReportsTableViewProjectDate: TcxGridDBColumn
                        DataBinding.IsNullValueType = True
                      end
                    end
                  end
                end
                inherited TabControl3: TTabControl
                  inherited cxDBVerticalGrid1: TcxDBVerticalGrid
                    Top = 24
                    Height = 228
                    ExplicitTop = 24
                    ExplicitHeight = 228
                    Version = 1
                    inherited cxDBVerticalGrid1ProjectDescription: TcxDBEditorRow
                      ID = 0
                      ParentID = -1
                      Index = 0
                      Version = 1
                    end
                    inherited cxDBVerticalGrid1LicenseNumber: TcxDBEditorRow
                      ID = 1
                      ParentID = -1
                      Index = 1
                      Version = 1
                    end
                    inherited cxDBVerticalGrid1SubsoilUser: TcxDBEditorRow
                      ID = 2
                      ParentID = -1
                      Index = 2
                      Version = 1
                    end
                    inherited cxDBVerticalGrid1ProjectNumber: TcxDBEditorRow
                      ID = 3
                      ParentID = -1
                      Index = 3
                      Version = 1
                    end
                    inherited cxDBVerticalGrid1ProjectDate: TcxDBEditorRow
                      ID = 4
                      ParentID = -1
                      Index = 4
                      Version = 1
                    end
                    inherited cxDBVerticalGrid1CoordinateSystem: TcxDBEditorRow
                      ID = 5
                      ParentID = -1
                      Index = 5
                      Version = 1
                    end
                    inherited cxDBVerticalGrid1ContractNumber: TcxDBEditorRow
                      ID = 6
                      ParentID = -1
                      Index = 6
                      Version = 1
                    end
                  end
                end
              end
              inherited TabControl1: TTabControl
                Width = 547
                Height = 673
                ExplicitWidth = 547
                ExplicitHeight = 673
                inherited ObjectCoordsGrid: TcxGrid
                  Top = 24
                  Width = 539
                  Height = 645
                  ExplicitTop = 24
                  ExplicitWidth = 539
                  ExplicitHeight = 643
                  inherited ObjectCoordsTableView: TcxGridDBBandedTableView
                    inherited ObjectCoordsTableViewId: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewN: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewLongDegrees: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewLongMinutes: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewLongSeconds: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewLatDegrees: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewLatMinutes: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewLatSeconds: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewLongitude: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewLatitude: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewX: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewY: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                    inherited ObjectCoordsTableViewObjectName: TcxGridDBBandedColumn
                      DataBinding.IsNullValueType = True
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  object BackstageView: TdxRibbonBackstageView
    Left = 200
    Top = 111
    Width = 917
    Height = 483
    Buttons = <>
    Ribbon = dxRibbon1
    OnPopup = BackstageViewPopup
    object ProjectSheet: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Active = True
      Caption = #1054#1090#1082#1088#1099#1090#1100
      object Label1: TLabel
        Left = 34
        Top = 23
        Width = 48
        Height = 16
        Caption = #1057#1077#1088#1074#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 34
        Top = 92
        Width = 60
        Height = 16
        Caption = #1055#1088#1086#1077#1082#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 34
        Top = 311
        Width = 96
        Height = 16
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 34
        Top = 363
        Width = 50
        Height = 16
        Caption = #1055#1072#1088#1086#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object StartButton: TcxButton
        Left = 34
        Top = 447
        Width = 82
        Height = 25
        Caption = 'OK'
        TabOrder = 4
        OnClick = StartButtonClick
      end
      object ServerCombo: TDBLookupComboBox
        Left = 34
        Top = 45
        Width = 213
        Height = 24
        BevelOuter = bvRaised
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'Id'
        ListField = 'ServerName'
        ListSource = DM.dsServers
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnCloseUp = ServerComboCloseUp
      end
      object ProjectsGrid: TcxGrid
        Left = 34
        Top = 120
        Width = 327
        Height = 161
        BorderStyle = cxcbsNone
        TabOrder = 1
        LookAndFeel.NativeStyle = False
        object ProjectsGridView: TcxGridDBTableView
          OnDblClick = ProjectsGridViewDblClick
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DM.dsProjects
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ScrollBars = ssVertical
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          Styles.Background = cxStyle1
          Styles.Content = cxStyle1
          object ProjectsGridViewProjectName: TcxGridDBColumn
            DataBinding.FieldName = 'ProjectName'
            DataBinding.IsNullValueType = True
          end
        end
        object ProjectsGridLevel1: TcxGridLevel
          GridView = ProjectsGridView
        end
      end
      object UserCombo: TcxLookupComboBox
        Left = 34
        Top = 333
        ParentFont = False
        Properties.KeyFieldNames = 'UserId'
        Properties.ListColumns = <
          item
            FieldName = 'UserName'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = DM.dsUsers
        Properties.ReadOnly = False
        Properties.OnChange = UserComboPropertiesChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Width = 207
      end
      object PassEdit: TEdit
        Left = 34
        Top = 385
        Width = 207
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 3
      end
      object PassButton: TcxButton
        Left = 247
        Top = 385
        Width = 24
        Height = 24
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000000F744558745469746C650053686F773B4579653B49E307
          250000011A49444154785EB593BD4AC45010467D0D4BED7C00416C7C02DF465F
          4002018B9401114CCA341682C562639122922289420AED6DC4A08510D8247CDE
          534C931F1156070E5C66E67CBB9BDCDD92B4117F1FE079DEA1E3320C43F9BE0F
          72BD177ACC960210771C77711CAB2C4B354DA3BEEF81333D3163875DF34C3E72
          7C645926EAABED74FFF4AAD3AB078D8B1D76717091F71C9F755D9BACF3EB471D
          9FAD4073C52E0E2E01AB3CCF65C527231A4B85834B40DB759DF97CED5F05E0E0
          2E074C61361B70C38399FC8429CCCC473EC12560D7F15E55D5EC4334E831A3D8
          C5C1B5D7B81F0481D2341DBF46E06C323BC86F38E38BB49D2489A2285251145C
          1E0DC3009CE921668E5B767FBACA078E0BC7B3630D9CE931FB973FD3467C032A
          D008DD4D8C839F0000000049454E44AE426082}
        ParentShowHint = False
        ShowHint = False
        SpeedButtonOptions.GroupIndex = 1
        SpeedButtonOptions.AllowAllUp = True
        TabOrder = 8
        OnClick = PassButtonClick
      end
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 776
    Top = 16
    PixelsPerInch = 96
    object dxBarManager1Bar2: TdxBar
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1212
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarStatic1'
        end
        item
          Visible = True
          ItemName = 'IBCombo1'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1212
      FloatTop = 2
      FloatClientWidth = 150
      FloatClientHeight = 40
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarStatic2'
        end
        item
          Visible = True
          ItemName = 'IBCombo2'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar3: TdxBar
      Caption = 'Custom 3'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1212
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarStatic3'
        end
        item
          Visible = True
          ItemName = 'IBCombo3'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar4: TdxBar
      Caption = 'Custom 4'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1212
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar5: TdxBar
      Caption = 'Custom 5'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1212
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar6: TdxBar
      Caption = 'Custom 6'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1212
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar8: TdxBar
      Caption = 'Custom 8'
      CaptionButtons = <>
      DockedLeft = 297
      DockedTop = 0
      FloatLeft = 1412
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem10'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar9: TdxBar
      Caption = 'Custom 9'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1025
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem12'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar10: TdxBar
      Caption = 'Custom 10'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1025
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem14'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarButton2: TdxBarButton
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      Category = 0
      Hint = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      Visible = ivAlways
    end
    object dxBarStatic1: TdxBarStatic
      Caption = #1056#1072#1079#1076#1077#1083#1103#1102#1097#1080#1081' '#1087#1088#1086#1089#1083#1086#1081
      Category = 0
      Hint = #1056#1072#1079#1076#1077#1083#1103#1102#1097#1080#1081' '#1087#1088#1086#1089#1083#1086#1081
      Visible = ivAlways
    end
    object IBCombo1: TdxBarLookupCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      OnChange = IBCombo1Change
      Glyph.SourceDPI = 96
      Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFF0000FF8080
        80FF808080FFFF0000FF000000FFFF0000FF808080FF808080FF808080FF8080
        80FF808080FF808080FFFF0000FF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FF808080FF808080FF808080FF808080FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF}
      ShowCaption = True
      Width = 150
      KeyField = 'InterbedId'
      ListField = 'InterbedName'
      ListSource = DM.dsInterbeds
      RowCount = 7
    end
    object IBCombo2: TdxBarLookupCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      OnChange = IBCombo2Change
      Glyph.SourceDPI = 96
      Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFF0000FF8080
        80FF808080FFFF0000FF000000FFFF0000FF808080FF808080FF808080FF8080
        80FF808080FF808080FFFF0000FF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FF808080FF808080FF808080FF808080FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF}
      Width = 150
      KeyField = 'InterbedId'
      ListField = 'InterbedName'
      ListSource = DM.dsInterbeds
      RowCount = 7
    end
    object dxBarStatic2: TdxBarStatic
      Caption = #1056#1072#1079#1076#1077#1083#1103#1102#1097#1080#1081' '#1087#1088#1086#1089#1083#1086#1081
      Category = 0
      Hint = #1056#1072#1079#1076#1077#1083#1103#1102#1097#1080#1081' '#1087#1088#1086#1089#1083#1086#1081
      Visible = ivAlways
    end
    object dxBarStatic3: TdxBarStatic
      Caption = #1056#1072#1079#1076#1077#1083#1103#1102#1097#1080#1081' '#1087#1088#1086#1089#1083#1086#1081
      Category = 0
      Hint = #1056#1072#1079#1076#1077#1083#1103#1102#1097#1080#1081' '#1087#1088#1086#1089#1083#1086#1081
      Visible = ivAlways
    end
    object IBCombo3: TdxBarLookupCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      OnChange = IBCombo3Change
      Glyph.SourceDPI = 96
      Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFF0000FF8080
        80FF808080FFFF0000FF000000FFFF0000FF808080FF808080FF808080FF8080
        80FF808080FF808080FFFF0000FF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FF808080FF808080FF808080FF808080FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF}
      Width = 150
      KeyField = 'InterbedId'
      ListField = 'InterbedName'
      ListSource = DM.dsInterbeds
      RowCount = 7
    end
    object dxBarStatic4: TdxBarStatic
      Caption = #1044#1077#1090#1072#1083#1100
      Category = 0
      Hint = #1044#1077#1090#1072#1083#1100
      Visible = ivAlways
    end
    object PartCombo: TdxBarLookupCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.SourceDPI = 96
      Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFF0000FF8080
        80FF808080FFFF0000FF000000FFFF0000FF808080FF808080FF808080FF8080
        80FF808080FF808080FFFF0000FF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FF808080FF808080FF808080FF808080FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF}
      Width = 150
      RowCount = 7
    end
    object dxBarButton1: TdxBarButton
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100'/'#1057#1074#1077#1088#1085#1091#1090#1100' '#1089#1087#1080#1089#1086#1082
      Category = 0
      Hint = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100'/'#1057#1074#1077#1088#1085#1091#1090#1100' '#1089#1087#1080#1089#1086#1082
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object dxBarStatic5: TdxBarStatic
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100'/'#1057#1074#1077#1088#1085#1091#1090#1100' '#1089#1087#1080#1089#1086#1082
      Category = 0
      Hint = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100'/'#1057#1074#1077#1088#1085#1091#1090#1100' '#1089#1087#1080#1089#1086#1082
      Visible = ivAlways
    end
    object dxBarButton3: TdxBarButton
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' / '#1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1089#1087#1080#1089#1086#1082
      Category = 0
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100' / '#1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1089#1087#1080#1089#1086#1082
      Visible = ivAlways
      OnClick = dxBarButton3Click
    end
    object dxBarButton5: TdxBarButton
      Caption = #1050#1086#1083#1086#1085#1082#1072' '#1089#1082#1074#1072#1078#1080#1085#1099
      Category = 0
      Hint = #1050#1086#1083#1086#1085#1082#1072' '#1089#1082#1074#1072#1078#1080#1085#1099
      Visible = ivAlways
      OnClick = dxBarButton5Click
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton13'
        end
        item
          MostRecentlyUsed = False
          Visible = True
          ItemName = 'dxBarSubItem4'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem5'
        end>
      ItemOptions.ShowShortCuts = False
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = #1048#1084#1087#1086#1088#1090
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end>
      ItemOptions.ShowShortCuts = False
    end
    object dxBarSubItem5: TdxBarSubItem
      Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1089#1082#1074#1072#1078#1080#1085
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end
        item
          Visible = True
          ItemName = 'dxBarButton11'
        end>
      ItemOptions.ShowShortCuts = False
    end
    object dxBarSubItem6: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem7: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton6: TdxBarButton
      Caption = #1057#1082#1074#1072#1078#1080#1085#1099
      Category = 0
      Hint = #1057#1082#1074#1072#1078#1080#1085#1099
      Visible = ivAlways
    end
    object dxBarSubItem8: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem9: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton7: TdxBarButton
      Caption = #1048#1085#1082#1083#1080#1085#1086#1084#1077#1090#1088#1080#1103
      Category = 0
      Hint = #1048#1085#1082#1083#1080#1085#1086#1084#1077#1090#1088#1080#1103
      Visible = ivAlways
    end
    object dxBarButton8: TdxBarButton
      Caption = #1051#1080#1090#1086#1083#1086#1075#1080#1103
      Category = 0
      Hint = #1051#1080#1090#1086#1083#1086#1075#1080#1103
      Visible = ivAlways
    end
    object dxBarButton9: TdxBarButton
      Caption = #1040#1085#1072#1083#1080#1079#1099
      Category = 0
      Hint = #1040#1085#1072#1083#1080#1079#1099
      Visible = ivAlways
    end
    object dxBarButton10: TdxBarButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1084#1077#1097#1077#1085#1080#1077
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1084#1077#1097#1077#1085#1080#1077
      Visible = ivAlways
    end
    object dxBarButton11: TdxBarButton
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1084#1077#1089#1090#1072#1084#1080' X '#1080' Y'
      Category = 0
      Hint = #1055#1086#1084#1077#1085#1103#1090#1100' '#1084#1077#1089#1090#1072#1084#1080' X '#1080' Y'
      Visible = ivAlways
    end
    object dxBarButton13: TdxBarButton
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
      Category = 0
      Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
      Visible = ivAlways
      OnClick = dxBarButton13Click
    end
    object dxBarSubItem10: TdxBarSubItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarButton12'
        end
        item
          Visible = True
          ItemName = 'dxBarButton26'
        end
        item
          Visible = True
          ItemName = 'dxBarButton34'
        end>
    end
    object dxBarButton4: TdxBarButton
      Caption = #1057#1088#1077#1076#1085#1080#1077' '#1087#1086' '#1087#1083#1072#1089#1090#1091' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1074#1072#1088#1080#1072#1085#1090#1072
      Category = 0
      Hint = #1057#1088#1077#1076#1085#1080#1077' '#1087#1086' '#1087#1083#1072#1089#1090#1091' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1074#1072#1088#1080#1072#1085#1090#1072
      Visible = ivAlways
      OnClick = dxBarButton4Click
    end
    object dxBarButton12: TdxBarButton
      Caption = #1057#1088#1077#1076#1085#1080#1077' '#1087#1086' '#1074#1089#1077#1084' '#1087#1083#1072#1089#1090#1072#1084' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1074#1072#1088#1080#1072#1085#1090#1072
      Category = 0
      Hint = #1057#1088#1077#1076#1085#1080#1077' '#1087#1086' '#1074#1089#1077#1084' '#1087#1083#1072#1089#1090#1072#1084' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1074#1072#1088#1080#1072#1085#1090#1072
      Visible = ivAlways
      OnClick = dxBarButton12Click
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
    end
    object cxBarEditItem2: TcxBarEditItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
    end
    object dxBarSubItem11: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarListItem1: TdxBarListItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemIndex = 0
      Items.Strings = (
        #1042#1089#1077' '#1087#1086#1088#1086#1076#1099
        #1055#1086#1088#1086#1076#1099' '#1074' '#1087#1083#1072#1089#1090#1086#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1103#1093)
    end
    object dxBarCombo1: TdxBarCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Text = #1042#1089#1077' '#1087#1086#1088#1086#1076#1099
      Items.Strings = (
        #1055#1086#1088#1086#1076#1099' '#1074' '#1087#1083#1072#1089#1090#1086#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1103#1093
        #1042#1089#1077' '#1087#1086#1088#1086#1076#1099
        '')
      ItemIndex = 1
    end
    object dxBarSubItem12: TdxBarSubItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton14'
        end>
    end
    object dxBarSubItem13: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton14: TdxBarButton
      Caption = #1058#1072#1073#1083#1080#1094#1072' '#1072#1085#1072#1083#1080#1079#1086#1074
      Category = 0
      Hint = #1058#1072#1073#1083#1080#1094#1072' '#1072#1085#1072#1083#1080#1079#1086#1074
      Visible = ivAlways
      OnClick = dxBarButton14Click
    end
    object dxBarSubItem14: TdxBarSubItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton15'
        end
        item
          Visible = True
          ItemName = 'dxBarInPlaceSubItem2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton16'
        end
        item
          Visible = True
          ItemName = 'dxBarButton17'
        end
        item
          Visible = True
          ItemName = 'dxBarButton18'
        end
        item
          Visible = True
          ItemName = 'dxBarButton25'
        end
        item
          Visible = True
          ItemName = 'dxBarButton33'
        end
        item
          Visible = True
          ItemName = 'dxBarInPlaceSubItem3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton19'
        end
        item
          Visible = True
          ItemName = 'dxBarButton20'
        end>
    end
    object dxBarInPlaceSubItem1: TdxBarInPlaceSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
      KeepBeginGroupWhileExpanded = False
    end
    object dxBarButton15: TdxBarButton
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
      Category = 0
      Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
      Visible = ivAlways
      OnClick = dxBarButton15Click
    end
    object dxBarInPlaceSubItem2: TdxBarInPlaceSubItem
      Caption = #1048#1084#1087#1086#1088#1090
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
      KeepBeginGroupWhileExpanded = False
    end
    object dxBarButton16: TdxBarButton
      Caption = #1057#1082#1074#1072#1078#1080#1085#1099
      Category = 0
      Hint = #1057#1082#1074#1072#1078#1080#1085#1099
      Visible = ivAlways
      OnClick = dxBarButton16Click
    end
    object dxBarButton17: TdxBarButton
      Caption = #1048#1085#1082#1083#1080#1085#1086#1084#1077#1090#1088#1080#1103
      Category = 0
      Hint = #1048#1085#1082#1083#1080#1085#1086#1084#1077#1090#1088#1080#1103
      Visible = ivAlways
      OnClick = dxBarButton17Click
    end
    object dxBarButton18: TdxBarButton
      Caption = #1051#1080#1090#1086#1083#1086#1075#1080#1103
      Category = 0
      Hint = #1051#1080#1090#1086#1083#1086#1075#1080#1103
      Visible = ivAlways
      OnClick = dxBarButton18Click
    end
    object dxBarInPlaceSubItem3: TdxBarInPlaceSubItem
      Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1089#1082#1074#1072#1078#1080#1085
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
      KeepBeginGroupWhileExpanded = False
    end
    object dxBarButton19: TdxBarButton
      Caption = #1057#1084#1077#1089#1090#1080#1090#1100' X '#1080' Y'
      Category = 0
      Hint = #1057#1084#1077#1089#1090#1080#1090#1100' X '#1080' Y'
      Visible = ivAlways
      OnClick = dxBarButton19Click
    end
    object dxBarButton20: TdxBarButton
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1084#1077#1089#1090#1072#1084#1080' X '#1080' Y'
      Category = 0
      Hint = #1055#1086#1084#1077#1085#1103#1090#1100' '#1084#1077#1089#1090#1072#1084#1080' X '#1080' Y'
      Visible = ivAlways
      OnClick = dxBarButton20Click
    end
    object dxBarButton21: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarSubItem15: TdxBarSubItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton22'
        end
        item
          Visible = True
          ItemName = 'dxBarButton24'
        end>
    end
    object dxBarButton22: TdxBarButton
      Caption = #1043#1077#1086#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1077' '#1074' '#1043#1072#1091#1089#1089'-'#1050#1088#1102#1075#1077#1088
      Category = 0
      Hint = #1043#1077#1086#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1077' '#1074' '#1043#1072#1091#1089#1089'-'#1050#1088#1102#1075#1077#1088
      Visible = ivAlways
    end
    object dxBarButton23: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton24: TdxBarButton
      Caption = #1043#1072#1091#1089#1089'-'#1050#1088#1102#1075#1077#1088' '#1074' '#1043#1077#1086#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1077
      Category = 0
      Hint = #1043#1072#1091#1089#1089'-'#1050#1088#1102#1075#1077#1088' '#1074' '#1043#1077#1086#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1077
      Visible = ivAlways
    end
    object dxBarSubItem16: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton25: TdxBarButton
      Caption = #1040#1085#1072#1083#1080#1079#1099
      Category = 0
      Hint = #1040#1085#1072#1083#1080#1079#1099
      Visible = ivAlways
      OnClick = dxBarButton25Click
    end
    object dxBarButton26: TdxBarButton
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1091#1073#1073#1083#1086#1082#1080' '#1076#1083#1103' '#1087#1083#1072#1089#1090#1072
      Category = 0
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1089#1091#1073#1073#1083#1086#1082#1080' '#1076#1083#1103' '#1087#1083#1072#1089#1090#1072
      Visible = ivAlways
      OnClick = dxBarButton26Click
    end
    object dxBarButton27: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarStatic6: TdxBarStatic
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarSubItem17: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem18: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem19: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarListItem5'
        end>
    end
    object dxBarStatic7: TdxBarStatic
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarStatic8: TdxBarStatic
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarStatic9: TdxBarStatic
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarListItem2: TdxBarListItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
    end
    object dxBarListItem3: TdxBarListItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      Items.Strings = (
        '1'
        '2'
        '3')
    end
    object dxBarListItem4: TdxBarListItem
      Caption = #1048#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1103
      Category = 0
      Visible = ivAlways
      ShowCaption = False
      ItemIndex = 0
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      ShowCheck = True
      ShowNumbers = False
    end
    object dxBarListItem5: TdxBarListItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ShowCaption = False
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
      ShowCheck = True
      ShowNumbers = False
    end
    object dxBarContainerItem1: TdxBarContainerItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem20: TdxBarSubItem
      Caption = #1048#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1103
      Category = 0
      Visible = ivAlways
      AllowCustomizing = False
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton28'
        end
        item
          Visible = True
          ItemName = 'dxBarButton29'
        end
        item
          Visible = True
          ItemName = 'dxBarButton30'
        end
        item
          Visible = True
          ItemName = 'dxBarButton31'
        end>
      ItemOptions.ShowShortCuts = True
    end
    object dxBarButton28: TdxBarButton
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1091#1075#1083#1103
      Category = 0
      Hint = #1052#1086#1097#1085#1086#1089#1090#1100' '#1091#1075#1083#1103
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
    end
    object dxBarButton29: TdxBarButton
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1089' '#1079#1072#1089#1086#1088#1077#1085#1080#1077#1084
      Category = 0
      Hint = #1052#1086#1097#1085#1086#1089#1090#1100' '#1089' '#1079#1072#1089#1086#1088#1077#1085#1080#1077#1084
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
    end
    object dxBarButton30: TdxBarButton
      Caption = 'Ad '#1091#1075#1083#1103
      Category = 0
      Hint = 'Ad '#1091#1075#1083#1103
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
    end
    object dxBarButton31: TdxBarButton
      Caption = 'Ad '#1089' '#1079#1072#1089#1086#1088#1077#1085#1080#1077#1084
      Category = 0
      Hint = 'Ad '#1089' '#1079#1072#1089#1086#1088#1077#1085#1080#1077#1084
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
    end
    object dxBarButton32: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarSubItem21: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton33: TdxBarButton
      Caption = #1047#1072#1087#1072#1089#1099
      Category = 0
      Hint = #1047#1072#1087#1072#1089#1099
      Visible = ivAlways
      OnClick = dxBarButton33Click
    end
    object dxBarButton34: TdxBarButton
      Caption = #1057#1086#1079#1076#1072#1090#1100' 2D-'#1073#1083#1086#1082#1084#1086#1076#1077#1083#1100' '#1087#1083#1072#1089#1090#1072
      Category = 0
      Hint = #1057#1086#1079#1076#1072#1090#1100' 2D-'#1073#1083#1086#1082#1084#1086#1076#1077#1083#1100' '#1087#1083#1072#1089#1090#1072
      Visible = ivAlways
      OnClick = dxBarButton34Click
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2013LightGray'
    Left = 552
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 392
    object Requery1: TMenuItem
      Caption = 'Requery'
      OnClick = Requery1Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 680
    Top = 16
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Excel files|*.csv'
    Left = 456
    Top = 88
  end
  object MemoPopup: TPopupMenu
    Left = 112
    Top = 608
    object N1: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1082#1088#1099#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = N3Click
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 616
    Top = 16
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 504
    Top = 392
  end
  object RocksPopup: TPopupMenu
    Left = 577
    Top = 256
    object MenuItem1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 657
    Top = 272
    object MenuItem2: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    end
  end
end
