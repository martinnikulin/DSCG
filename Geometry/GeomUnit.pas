unit GeomUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxCustomListBox,
  cxListBox, Vcl.DBCtrls, cxCheckListBox, cxDBCheckListBox, Data.DB, Vcl.Grids,
  Vcl.DBGrids, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.ExtCtrls,
  DMGeomsUnit, ProjectionUnit,
  dxMapControlTypes, dxMapControlBingMapImageryDataProvider, dxMapLayer,
  dxMapImageTileLayer, dxMapControl,
  dxMapControlOpenStreetMapImageryDataProvider, dxCustomMapItemLayer,
  dxMapItemLayer, dxMapItem, dxCoreGraphics, cxCheckBox, Vcl.ComCtrls,
  dxTree, dxTreeView, dxScrollbarAnnotations;

type
  TGeomType = (ftPolyLine, ftPolygon);

type
  TXYPointArray = array of TXYPoint;

type
  TGeomFrame = class(TFrame)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    MapControl: TdxMapControl;
    BaseLayer: TdxMapImageTileLayer;
    Boundaries: TdxMapItemLayer;
    Pillars: TdxMapItemLayer;
    CoalTypes: TdxMapItemLayer;
    CoalRanks: TdxMapItemLayer;
    VertProjects: TdxMapItemLayer;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1SeamId: TcxGridDBColumn;
    cxGrid2DBTableView1Description: TcxGridDBColumn;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1PartId: TcxGridDBColumn;
    cxGrid3DBTableView1NPart: TcxGridDBColumn;
    Splitter4: TSplitter;
    TreeView: TTreeView;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    Panel3: TPanel;
    cxGrid3DBTableView1Vertical: TcxGridDBColumn;
    Panel4: TPanel;
    InterbedCombo: TDBLookupComboBox;
    Label1: TLabel;
    InterpolationRegion: TdxMapItemLayer;
    Blocks: TdxMapItemLayer;
    DBGrid1: TDBGrid;
    procedure LayersTableViewEditChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure cxGrid3DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TreeViewCheckStateChanged(Sender: TCustomTreeView;
      Node: TTreeNode; CheckState: TNodeCheckState);
    procedure ComboBox1CloseUp(Sender: TObject);
    procedure InterbedComboCloseUp(Sender: TObject);
  private
    Xmin, Xmax, Ymin, Ymax, Scale: Double;
    X, Y: array of Double;
    prj: TProjection;
    FMapKind: TdxBingMapKind;
    FProviderId: Integer;
    Initialized: Boolean;
    function GetMapControlGeoPoints(Points: TXYPointArray):  TdxMapControlGeoPointCollection;
    function GetGeom(s: String; nbrackets: Integer): TXYPointArray;
    function DXBingKey: String;
    function GetTreeNode(TreeView: TTreeView; Index: Integer): TTreeNode;
    function GetMapLayerIndex(LayerName: String): Integer;
    procedure AddFeatureToTree(LayerNode: TTreeNode; FeatureName: String);
    procedure AddFeatureToMap(LayerIndex: Integer; FeatureName: String; GeomText: String);
    procedure DrawFeature(Feature: TdxMapCustomMultiPointItem; Points: TXYPointArray; FeatureName: String);
    procedure DrawLine(Points: TXYPointArray);
    procedure SetFeatureStyle(LayerIndex: Integer; Polygon: TdxMapPolygon);
    function GetColor(LayerIndex: Integer): TColor;
    procedure GetPointArray(GeomText: String; var GeomType: TGeomType; var Points: TXYPointArray);
    procedure InitLayerNodes;
    procedure ClearTreeLayers;
    procedure ClearMapLayers;
    procedure FillLayers;
    procedure SetLayerVisibility(LayerIndex: Integer; Visible: Boolean);
    procedure UpdateProvider;
    procedure UpdateMapKind;
    procedure ZoomToLayer;
  public
    Activated: Boolean;
    procedure Activate;
  end;

var
  Form4: TGeomFrame;

implementation


{$R *.dfm}

procedure TGeomFrame.Activate;
begin
  if not Activated then
  begin
    DMGeoms.Initialize;
    FProviderId := 1;
    FMapKind := bmkHybrid;
    Initialized := False;
    //UpdateProvider;
    prj := TProjection.Create(ptGaussKrueger);
    InitLayerNodes;
    FillLayers;
    InterbedCombo.KeyValue := DMGeoms.Interbeds.FieldByName('InterbedId').Value;
    Activated := True;
  end;
end;

procedure TGeomFrame.InitLayerNodes;
var
  i: Integer;
  TreeNode: TTreeNode;
begin
  for TreeNode in TreeView.Items do
      TreeNode.Checked := True;
end;

procedure TGeomFrame.InterbedComboCloseUp(Sender: TObject);
begin
  DMGeoms.PlanGeoms.Parameters.ParamByName('InterbedId').Value := InterbedCombo.KeyValue;
  DMGeoms.PlanGeoms.Parameters.ParamByName('InterbedId1').Value := InterbedCombo.KeyValue;
  DMGeoms.PlanGeoms.Requery();
  FillLayers;
end;

procedure TGeomFrame.FillLayers;
var
  LayerIndex: Integer;
  LayerNode: TTreeNode;
  FeatureName: String;
  GeomText: String;
  LayerList: TdxCustomMapItemLayerList;
begin
  Initialized := False;
  ClearTreeLayers;
  ClearMapLayers;
  LayerList := TdxCustomMapItemLayerList.Create;
  while not DMGeoms.PlanGeoms.Eof do
  begin
    LayerIndex := DMGeoms.PlanGeoms.FieldByName('FeatureType').AsInteger;
    FeatureName := DMGeoms.PlanGeoms.FieldByName('FeatureName').AsString;
    GeomText := DMGeoms.PlanGeoms.FieldByName('GeomText').AsString;
    LayerNode := GetTreeNode(TreeView, LayerIndex);
    AddFeatureToTree(LayerNode, FeatureName);
    if LayerNode.Checked then
      AddFeatureToMap(LayerIndex, FeatureName, GeomText);
    LayerList.Add(MapControl.Layers[LayerIndex] as TdxMapItemLayer);
    DMGeoms.PlanGeoms.Next;
  end;
  try
    MapControl.ZoomToFitLayerItems(LayerList);
  except
  end;
  Initialized := True;
end;

procedure TGeomFrame.ClearTreeLayers;
var
  i: Integer;
  TreeNode: TTreeNode;
begin
  for TreeNode in TreeView.Items do
  begin
    if TreeNode.Parent = nil then
      TreeNode.DeleteChildren;
  end;
end;

procedure TGeomFrame.ComboBox1CloseUp(Sender: TObject);
begin
  DMGeoms.PlanGeoms.Parameters.ParamByName('Vertical1').Value := ComboBox1.ItemIndex;
  DMGeoms.PlanGeoms.Parameters.ParamByName('Vertical2').Value := ComboBox1.ItemIndex;
  DMGeoms.PlanGeoms.Requery();
  FillLayers;
end;

procedure TGeomFrame.ClearMapLayers;
var
  i, n: Integer;
  MapLayer: TdxMapItemLayer;
begin
  for i := 1 to MapControl.Layers.Count - 1 do begin
    MapLayer := MapControl.Layers[i] as TdxMapItemLayer;
    MapLayer.MapItems.Clear;
  end;
end;

procedure TGeomFrame.AddFeatureToTree(LayerNode: TTreeNode; FeatureName: String);
var
  FeatureNode: TTreeNode;
begin
  FeatureNode := TreeView.Items.AddChild(LayerNode, FeatureName);
  FeatureNode.CheckState := ncsNone;
end;

procedure TGeomFrame.AddFeatureToMap(LayerIndex: Integer; FeatureName: String; GeomText: String);
var
  GeomType: TGeomType;
  MapLayer: TdxMapItemLayer;
  Points: TXYPointArray;
  MapItem: TdxMapItemClass;
  Polygon: TdxMapPolygon;
  Polyline: TdxMapPolyline;
begin
  MapLayer := MapControl.Layers[LayerIndex] as TdxMapItemLayer;
  GetPointArray(GeomText, GeomType, Points);
  if GeomType = ftPolyLine then
  begin
    Polyline := MapLayer.AddItem(TdxMapPolyline) as TdxMapPolyline;
    //Polyline. := FeatureName;
    Polyline.Hint := FeatureName;
    DrawFeature(Polyline, Points, FeatureName);
    Polyline.Style.BorderColor := clBlack;
    Polyline.Style.BorderWidth := 3;
  end
  else if GeomType = ftPolygon then
  begin
    Polygon := MapLayer.AddItem(TdxMapPolygon) as TdxMapPolygon;
    Polygon.TitleOptions.Text := FeatureName;
    Polygon.Hint := FeatureName;
    DrawFeature(Polygon, Points, FeatureName);
    SetFeatureStyle(LayerIndex, Polygon);
  end;
end;

function TGeomFrame.GetTreeNode(TreeView: TTreeView; Index: Integer): TTreeNode;
var
  i, m: Integer;
  TreeNode: TTreeNode;
begin
  m := 1;
  for i := 1 to TreeView.Items.Count - 1 do
  begin
    TreeNode := TreeView.Items[i];
    if TreeNode.Parent = nil then
    begin
      if m = Index then begin
        Result := TreeNode;
        exit;
      end;
      m := m + 1;
    end;
  end;
end;

procedure TGeomFrame.DrawFeature(Feature: TdxMapCustomMultiPointItem; Points: TXYPointArray; FeatureName: String);
var
  i: Integer;
  GeoPoint: TGeoPoint;
  GeoPointCollection: TdxMapControlGeoPointCollection;
  MapPoint: TdxMapControlGeoPointItem;
begin
  for i := 0 to Length(Points) - 2 do begin
    GeoPoint := prj.GetGeoPoint(Points[i].X, Points[i].Y);
    MapPoint := Feature.GeoPoints.Add;
    MapPoint.Longitude := GeoPoint.Longitude;
    MapPoint.Latitude := GeoPoint.Latitude;
  end;
end;

procedure TGeomFrame.SetFeatureStyle(LayerIndex: Integer; Polygon: TdxMapPolygon);
var
  color: TColor;
begin
  color := GetColor(LayerIndex);
  Polygon.Style.BorderColor := dxColorToAlphaColor(color, 255);
  Polygon.Style.BorderWidth := 3;
  Polygon.Style.Color := dxColorToAlphaColor(color, 80);
end;

function TGeomFrame.GetColor(LayerIndex: Integer): TColor;
begin
  case LayerIndex of
    1: Result := $785F8B95;
    2: Result := $78799689;
    3: Result := $78A2A875;
    4: Result := $78CEBB5F;
    5: Result := $78F2CB4E;
    6: Result := $78F1C149;
    7: Result := $78E5A84D;
    8: Result := $78D6864E;
  end;
end;

function TGeomFrame.GetMapControlGeoPoints(
  Points: TXYPointArray): TdxMapControlGeoPointCollection;
var
  i: Integer;
  GeoPoint: TGeoPoint;
begin
  for i := 0 to Length(Points) - 1 do begin
    GeoPoint := prj.GetGeoPoint(Points[i].X, Points[i].Y);
  end;
end;

function TGeomFrame.GetMapLayerIndex(LayerName: String): Integer;
begin
  if LayerName = 'Топо' then Result := 0
  else if LayerName = 'Границы' then Result := 1
  else if LayerName = 'Целики' then Result := 2
  else if LayerName = 'Типы угля' then Result := 3
  else if LayerName = 'Марки' then Result := 4
  else if LayerName = 'Объекты вертикальной проекции' then Result := 5
  else if LayerName = 'Область интерполяции' then Result := 6
  else if LayerName = 'Блоки' then Result := 7;
end;

procedure TGeomFrame.DrawLine(Points: TXYPointArray);
begin
//
end;

procedure TGeomFrame.GetPointArray(GeomText: String; var GeomType: TGeomType; var Points: TXYPointArray);
begin
    if Copy(GeomText, 1, 10) = 'LINESTRING' then begin
      GeomType := ftPolyline;
      Points := GetGeom(Copy(GeomText, 13), 1);
    end
    else
      if Copy(GeomText, 1, 7) = 'POLYGON' then begin
        GeomType := ftPolygon;
        Points := GetGeom(Copy(GeomText, 11), 2);
      end;
end;

procedure TGeomFrame.LayersTableViewEditChanged(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem);
var
  Row: Integer;
begin
  with Sender.DataController do
  begin
    Post;
    Row := DataControllerInfo.FocusedRecordIndex;
    SetLayerVisibility(Values[Row, 0], AItem.EditValue);
  end;
end;

procedure TGeomFrame.SetLayerVisibility(LayerIndex: Integer; Visible: Boolean);
begin
  MapControl.Layers[LayerIndex].Visible := Visible;
end;

procedure TGeomFrame.TreeViewCheckStateChanged(Sender: TCustomTreeView;
  Node: TTreeNode; CheckState: TNodeCheckState);
var
  Visible: Boolean;
  LayerIndex: Integer;
begin
  if Initialized then
  begin
    if CheckState = ncsChecked then
      Visible := True
    else
      Visible := False;
    LayerIndex := GetMapLayerIndex(Node.Text);
    SetLayerVisibility(LayerIndex, Visible);
  end;
end;

function TGeomFrame.GetGeom(s: String; nbrackets: Integer): TXYPointArray;
var
  i, j, m: Integer;
  ps, sv: String;
begin
  try
    s := LeftStr(s, Length(s) - nbrackets) + ',';
    i := 0;
    while s <> '' do begin
      j := Pos(',', s, 1);
      ps := Copy(s, 1, j - 1);
      m := Pos(' ', s, 1);
      SetLength(X, i + 1);
      SetLength(Y, i + 1);
      SetLength(Result, i + 1);
      sv := ReplaceStr(LeftStr(ps, m - 1), '.', ',');
      X[i] := Round(StrToFloat(sv));
      sv := ReplaceStr(Copy(ps, m + 1), '.', ',');
      Y[i] := Round(StrToFloat(sv));
      Result[i].X := X[i];
      Result[i].Y := Y[i];
      s := Copy(s, j + 2);
      i := i + 1;
    end;
  except
//    on E: Exception do
//      MessageDlg (E.Message + '  ' + sv, mtError, [mbOK], 0);
  end;
end;

procedure TGeomFrame.UpdateProvider;
begin
  MapControl.BeginUpdate;
  try
    if FProviderId = 1 then
    begin
      BaseLayer.ProviderClass := TdxMapControlBingMapImageryDataProvider;
      (BaseLayer.Provider as TdxMapControlBingMapImageryDataProvider).BingKey := DXBingKey;
      UpdateMapKind;
    end
    else
      BaseLayer.ProviderClass := TdxMapControlOpenStreetMapImageryDataProvider;
    BaseLayer.Provider.MaxParallelConnectionCount := 30;
  finally
    MapControl.EndUpdate;
  end;
end;

procedure TGeomFrame.ZoomToLayer;
begin
//
end;

procedure TGeomFrame.UpdateMapKind;
begin
  if BaseLayer.Provider is TdxMapControlBingMapImageryDataProvider then
    TdxMapControlBingMapImageryDataProvider(BaseLayer.Provider).Kind := FMapKind;
end;

function TGeomFrame.DXBingKey: String;
var
  Buffer: array [0..255] of Char;
begin
  SetString(Result, Buffer, LoadString(FindResourceHInstance(HInstance), 102, Buffer, Length(Buffer)));
end;

procedure TGeomFrame.cxGrid3DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  //if Initialized then
    FillLayers;
end;

end.
