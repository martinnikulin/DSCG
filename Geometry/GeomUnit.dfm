object GeomFrame: TGeomFrame
  Left = 0
  Top = 0
  Width = 1048
  Height = 677
  TabOrder = 0
  object Splitter2: TSplitter
    Left = 409
    Top = 0
    Height = 677
    ExplicitLeft = 472
    ExplicitTop = 72
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 677
    Align = alLeft
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 188
      Width = 407
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = 0
      ExplicitTop = 264
      ExplicitWidth = 454
    end
    object Splitter4: TSplitter
      Left = 1
      Top = 312
      Width = 407
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 465
      ExplicitWidth = 186
    end
    object cxGrid2: TcxGrid
      Left = 1
      Top = 34
      Width = 407
      Height = 154
      Align = alTop
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmClassic
      object cxGrid2DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DMGeoms.dsSeams
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 22
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 22
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        object cxGrid2DBTableView1SeamId: TcxGridDBColumn
          DataBinding.FieldName = 'SeamId'
          DataBinding.IsNullValueType = True
          Visible = False
        end
        object cxGrid2DBTableView1Description: TcxGridDBColumn
          Caption = #1055#1083#1072#1089#1090
          DataBinding.FieldName = 'Description'
          DataBinding.IsNullValueType = True
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object cxGrid3: TcxGrid
      Left = 1
      Top = 191
      Width = 407
      Height = 121
      Align = alTop
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmClassic
      object cxGrid3DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnFocusedRecordChanged = cxGrid3DBTableView1FocusedRecordChanged
        DataController.DataSource = DMGeoms.dsParts
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 22
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 22
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        object cxGrid3DBTableView1PartId: TcxGridDBColumn
          DataBinding.FieldName = 'PartId'
          DataBinding.IsNullValueType = True
          Visible = False
          Width = 68
        end
        object cxGrid3DBTableView1NPart: TcxGridDBColumn
          Caption = #1044#1077#1090#1072#1083#1100
          DataBinding.FieldName = 'NPart'
          DataBinding.IsNullValueType = True
          Width = 320
        end
        object cxGrid3DBTableView1Vertical: TcxGridDBColumn
          Caption = #1042#1077#1088#1090'.'
          DataBinding.FieldName = 'Vertical'
          DataBinding.IsNullValueType = True
          Options.Editing = False
          Width = 65
        end
      end
      object cxGrid3Level1: TcxGridLevel
        GridView = cxGrid3DBTableView1
      end
    end
    object TreeView: TTreeView
      Left = 1
      Top = 315
      Width = 407
      Height = 184
      Align = alClient
      CheckBoxes = True
      Indent = 19
      TabOrder = 2
      OnCheckStateChanged = TreeViewCheckStateChanged
      Items.NodeData = {
        0308000000260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010422043E043F043E042C0000000000000000000000FFFFFFFFFF
        FFFFFF00000000000000000000000001071304400430043D04380446044B042A
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
        06260435043B0438043A043804300000000000000000000000FFFFFFFFFFFFFF
        FF0000000000000000000000000109220438043F044B042000430433043B044F
        04280000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        0001051C04300440043A043804580000000000000000000000FFFFFFFFFFFFFF
        FF000000000000000000000000011D1E0431044A0435043A0442044B04200032
        0435044004420438043A0430043B044C043D043E04390420003F0440043E0435
        043A04460438043804460000000000000000000000FFFFFFFFFFFFFFFF000000
        00000000000000000001141E0431043B043004410442044C04200038043D0442
        04350440043F043E043B044F04460438043804280000000000000000000000FF
        FFFFFFFFFFFFFF000000000000000000000000010511043B043E043A043804}
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 407
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Label1: TLabel
        Left = 16
        Top = 9
        Width = 129
        Height = 15
        Caption = #1056#1072#1079#1076#1077#1083#1103#1102#1097#1080#1081' '#1087#1088#1086#1089#1083#1086#1081
      end
      object InterbedCombo: TDBLookupComboBox
        Left = 168
        Top = 5
        Width = 145
        Height = 23
        KeyField = 'InterbedId'
        ListField = 'InterbedName'
        ListSource = DMGeoms.dsInterbeds
        TabOrder = 0
        OnCloseUp = InterbedComboCloseUp
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 499
      Width = 407
      Height = 177
      Align = alBottom
      DataSource = DMGeoms.dsPlanGeoms
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 412
    Top = 0
    Width = 636
    Height = 677
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object MapControl: TdxMapControl
      Left = 0
      Top = 0
      Width = 636
      Height = 646
      Align = alClient
      NavigationPanel.ShowMilesScale = False
      NavigationPanel.ShowScrollButtons = False
      NavigationPanel.ShowZoomTrackBar = False
      NavigationPanel.Style.CoordinateFont.Charset = DEFAULT_CHARSET
      NavigationPanel.Style.CoordinateFont.Color = clWindowText
      NavigationPanel.Style.CoordinateFont.Height = -21
      NavigationPanel.Style.CoordinateFont.Name = 'Tahoma'
      NavigationPanel.Style.CoordinateFont.Style = []
      NavigationPanel.Style.ScaleFont.Charset = DEFAULT_CHARSET
      NavigationPanel.Style.ScaleFont.Color = clWindowText
      NavigationPanel.Style.ScaleFont.Height = -16
      NavigationPanel.Style.ScaleFont.Name = 'Tahoma'
      NavigationPanel.Style.ScaleFont.Style = []
      NavigationPanel.Visible = False
      NavigationPanel.XCoordinateDisplayMask = '{D}'#176' {M}'#39' {S}'#39#39'{CP}'
      NavigationPanel.YCoordinateDisplayMask = '{D}'#176' {M}'#39' {S}'#39#39'{CP}'
      TabOrder = 0
      ZoomLevel = 4.000000000000000000
      object BaseLayer: TdxMapImageTileLayer
        ProviderClassName = 'TdxMapControlOpenStreetMapImageryDataProvider'
        Provider.Subdomains.Strings = (
          'a'
          'b'
          'c')
        Provider.UrlTemplate = 'http://[subdomain].tile.openstreetmap.org/[z]/[x]/[y].png'
      end
      object Boundaries: TdxMapItemLayer
        ProjectionClassName = 'TdxMapControlSphericalMercatorProjection'
        AllowHotTrack = False
      end
      object Pillars: TdxMapItemLayer
        ProjectionClassName = 'TdxMapControlSphericalMercatorProjection'
        AllowHotTrack = False
      end
      object CoalTypes: TdxMapItemLayer
        ProjectionClassName = 'TdxMapControlSphericalMercatorProjection'
        AllowHotTrack = False
      end
      object CoalRanks: TdxMapItemLayer
        ProjectionClassName = 'TdxMapControlSphericalMercatorProjection'
        AllowHotTrack = False
      end
      object VertProjects: TdxMapItemLayer
        ProjectionClassName = 'TdxMapControlSphericalMercatorProjection'
        AllowHotTrack = False
      end
      object InterpolationRegion: TdxMapItemLayer
        ProjectionClassName = 'TdxMapControlSphericalMercatorProjection'
      end
      object Blocks: TdxMapItemLayer
        ProjectionClassName = 'TdxMapControlSphericalMercatorProjection'
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 646
      Width = 636
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object ComboBox1: TComboBox
        Left = 8
        Top = 6
        Width = 145
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = #1055#1083#1072#1085
        Items.Strings = (
          #1055#1083#1072#1085
          #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1072#1103' '#1087#1088#1086#1077#1082#1094#1080#1103)
      end
    end
  end
end
