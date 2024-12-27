unit SettingsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, cxDBLookupComboBox, cxDropDownEdit,
  Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxPC, dxNavBarCollns,
  dxNavBarBase, dxNavBar, Vcl.Menus, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, ADODB, cxVGrid, cxDBVGrid, cxInplaceContainer,
  dxScrollbarAnnotations, SiteUnit, Vcl.ComCtrls,
  ParamsFormUnit;

Type
  TSettingsFrame = class(TFrame)
    dxNavBar1: TdxNavBar;
    TablesGroup: TdxNavBarGroup;
    ReservesGroup: TdxNavBarGroup;
    DictionariesGroup: TdxNavBarGroup;
    RocksItem: TdxNavBarItem;
    AssayVarsItem: TdxNavBarItem;
    ConditionsItem: TdxNavBarItem;
    VersionsItem: TdxNavBarItem;
    BoundariesItem: TdxNavBarItem;
    CoalRanksItem: TdxNavBarItem;
    CoalTypesItem: TdxNavBarItem;
    PillarsItem: TdxNavBarItem;
    FormationsItem: TdxNavBarItem;
    SettingsPageControl: TcxPageControl;
    _0_RocksTab: TcxTabSheet;
    RocksGrid: TcxGrid;
    RocksTableView: TcxGridDBTableView;
    RocksTableViewlith_id: TcxGridDBColumn;
    RocksTableViewdescription: TcxGridDBColumn;
    RocksTableViewcoregroup: TcxGridDBColumn;
    RocksTableViewAd: TcxGridDBColumn;
    RocksTableViewdensity: TcxGridDBColumn;
    RocksTableViewautocad: TcxGridDBColumn;
    RocksTableViewscale_autocad: TcxGridDBColumn;
    RocksTableViewa: TcxGridDBColumn;
    RocksGridLevel1: TcxGridLevel;
    _1_AssaysTab: TcxTabSheet;
    AssayPageControl: TcxPageControl;
    AssayTabSheet1: TcxTabSheet;
    AssayTabSheet2: TcxTabSheet;
    Splitter5: TSplitter;
    AssayGroupGrid: TcxGrid;
    AssayGroupTableView: TcxGridDBTableView;
    AssayGroupTableViewgroup_id: TcxGridDBColumn;
    AssayGroupTableViewnn: TcxGridDBColumn;
    AssayGroupTableViewgroupname: TcxGridDBColumn;
    AssayGroupGridLevel1: TcxGridLevel;
    AssayVarsGrid: TcxGrid;
    AssayVarsTableView: TcxGridDBTableView;
    AssayVarsTableViewvar_id: TcxGridDBColumn;
    AssayVarsTableViewnn: TcxGridDBColumn;
    AssayVarsTableViewdescription: TcxGridDBColumn;
    AssayVarsTableViewDimension: TcxGridDBColumn;
    AssayVarsTableViewactual: TcxGridDBColumn;
    AssayVarsTableViewcomposite: TcxGridDBColumn;
    AssayVarsTableViewAssayTable: TcxGridDBColumn;
    AssayVarsTableViewAutocadText: TcxGridDBColumn;
    AssayVarsTableViewDigits: TcxGridDBColumn;
    AssayVarsGridLevel1: TcxGridLevel;
    Panel7: TPanel;
    Splitter3: TSplitter;
    Panel3: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CoalRankCombo: TDBLookupComboBox;
    CoalTypeCombo: TDBLookupComboBox;
    cxGrid3: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3VarId: TcxGridDBColumn;
    cxGridDBTableView3N: TcxGridDBColumn;
    cxGridDBTableView3VarName: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Panel2: TPanel;
    Panel4: TPanel;
    AssayGroupCombo: TDBLookupComboBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2var_id: TcxGridDBColumn;
    cxGridDBTableView2description: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    _2_ColumnVarsTab: TcxTabSheet;
    _3_CondsTab: TcxTabSheet;
    CondDefsGrid: TcxGrid;
    CondDefsTableView: TcxGridDBTableView;
    CondDefsTableViewsection: TcxGridDBColumn;
    CondDefsTableViewnn: TcxGridDBColumn;
    CondDefsTableViewcondname: TcxGridDBColumn;
    CondDefsTableViewactual: TcxGridDBColumn;
    CondDefsGridLevel1: TcxGridLevel;
    _4_VersionsTab: TcxTabSheet;
    VersionsGrid: TcxGrid;
    VersionsTableView: TcxGridDBTableView;
    VersionsTableViewVersionId: TcxGridDBColumn;
    VersionsTableViewVersionName: TcxGridDBColumn;
    VersionsTableViewDescription: TcxGridDBColumn;
    VersionsGridLevel1: TcxGridLevel;
    _5_BoundariesTab: TcxTabSheet;
    Splitter10: TSplitter;
    BoundaryGrid: TcxGrid;
    BoundaryTableView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    BoundaryRelsGrid: TcxGrid;
    BoundaryRelsTableView: TcxGridDBTableView;
    BoundaryRelsTableViewrefname: TcxGridDBColumn;
    BoundaryRelsTableViewoperator: TcxGridDBColumn;
    BoundaryRelsTableViewitemname: TcxGridDBColumn;
    BoundaryRelsGridLevel1: TcxGridLevel;
    Panel1: TPanel;
    BoundTypesCombo: TDBLookupComboBox;
    _7_DictTab: TcxTabSheet;
    DictGrid: TcxGrid;
    DictTableView: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    DictTableViewsection: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    RocksMenu: TPopupMenu;
    N52: TMenuItem;
    N43: TMenuItem;
    AssaysGroupsMenu: TPopupMenu;
    N1: TMenuItem;
    AssayVarsMenu: TPopupMenu;
    MenuItem3: TMenuItem;
    AssayVarsCRMenu: TPopupMenu;
    MenuItem8: TMenuItem;
    CondDefsMenu: TPopupMenu;
    MenuItem6: TMenuItem;
    VariantsMenu: TPopupMenu;
    N53: TMenuItem;
    N62: TMenuItem;
    VersionsMenu: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem1: TMenuItem;
    BoundMenu: TPopupMenu;
    MenuItem4: TMenuItem;
    BoundRefsMenu: TPopupMenu;
    MenuItem5: TMenuItem;
    DictMenu: TPopupMenu;
    MenuItem7: TMenuItem;
    RocksPopup: TPopupMenu;
    N2: TMenuItem;
    AssayVarsPopup: TPopupMenu;
    MenuItem9: TMenuItem;
    BoundaryTableViewActual: TcxGridDBColumn;
    _6_ResParamsTab: TcxTabSheet;
    ResParamsItem: TdxNavBarItem;
    ResParamsGrid: TcxDBVerticalGrid;
    ResParamsGridA: TcxDBEditorRow;
    ResParamsGridBeta: TcxDBEditorRow;
    ResParamsGridH: TcxDBEditorRow;
    ResParamsGridB: TcxDBEditorRow;
    ResParamsGridPTransportBVR: TcxDBEditorRow;
    ResParamsGridKrovla1: TcxDBEditorRow;
    ResParamsGridKrovla2: TcxDBEditorRow;
    ResParamsGridKrovla3: TcxDBEditorRow;
    ResParamsGridPochva: TcxDBEditorRow;
    ResParamsGridVerch: TcxDBEditorRow;
    ResParamsGridOkont: TcxDBEditorRow;
    ResParamsGridZasorPochva: TcxDBEditorRow;
    ResParamsGridZasorKrovla: TcxDBEditorRow;
    SiteInfoGroup: TdxNavBarGroup;
    SiteInfoItem: TdxNavBarItem;
    _8_SiteTab: TcxTabSheet;
    SiteFrame: TSiteFrame;
    TabControl1: TTabControl;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure dxNavBar1LinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure N52Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure BoundTypesComboCloseUp(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure cxGridDBTableView2DblClick(Sender: TObject);
    procedure SettingsPageControlChange(Sender: TObject);
    procedure CoalRankComboCloseUp(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    RocksExpanded, CondsExpanded: Boolean;
    procedure SwitchView1(AView: TcxGridDBTableView; var Expanded: Boolean);
    procedure CalcRockDensity;
    procedure CreateVariants;
    procedure CopyVersion;
    procedure SetVarsActual(Value: Boolean);
    function DetailBoundsForm: TParamsForm;
  public
    Activated: Boolean;
    procedure Activate();
    procedure SwitchView;
  end;

implementation
uses
  DMUnit, DMSettingsUnit, MessengerUnit, UtilsUnit;

{$R *.dfm}

{ TSettingsFrame }

procedure TSettingsFrame.Activate;
begin
  if not Activated then
  begin
    DMSettings.Initialize;
    SettingsPageControl.ActivePageIndex := 0;
    BoundTypesCombo.KeyValue := DMSettings.BoundTypes.FieldByName('BoundType').Value;
    AssayGroupCombo.KeyValue := DMSettings.AssayGroups.FieldByName('GroupId').AsInteger;
    CoalRankCombo.KeyValue := DMSettings.CoalGrades.FieldByName('CoalGradeId').Value;
    CoalTypeCombo.KeyValue := DMSettings.CoalTypes.FieldByName('CoalTypeId').Value;
    DMSettings.SetBoundType;
    RocksTableView.ViewData.Expand(True);
    CondDefsTableView.ViewData.Expand(True);
    RocksExpanded := True;
    CondsExpanded := True;
    Panel1.Height := 35;
  end;
  DM.RequeryTables('Settings');
  Activated := True;
end;

procedure TSettingsFrame.BoundTypesComboCloseUp(Sender: TObject);
begin
  DMSettings.SetBoundType;
  if DMSettings.BoundTypes.FieldByName('BoundType').AsString = 'boundary detail' then
    BoundaryTableViewActual.Visible := False
  else
    BoundaryTableViewActual.Visible := True;
end;

procedure TSettingsFrame.Button1Click(Sender: TObject);
var
  ParamsForm: TParamsForm;
begin
  //if MessageDlg('Существующие детальные границы будут удалены. Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
//  DMSettings.CreateDetailBounds;
//  DMSettings.CreateDetailBounds1;
//  if ComboBox1.ItemIndex = 1 then
//  begin
//    ParamsForm := DetailBoundsForm();
//    if ParamsForm.ShowModal = mrOK then begin
//      DMSettings.CreateDetailBounds1;
//    end;
//    ParamsForm.Destroy;
//  end;
//  DMSettings.Boundaries.Requery();
end;


//  if ParamsForm.ShowModal = mrOK then begin
//
//  end;
//  ParamsForm.Destroy;
//end;

procedure TSettingsFrame.CalcRockDensity;
begin
  DMSettings.CalcRockDensity;
end;

procedure TSettingsFrame.CoalRankComboCloseUp(Sender: TObject);
begin
  CoalTypeCombo.KeyValue := DMSettings.CoalTypes.FieldByName('CoalTypeId').Value;
end;

procedure TSettingsFrame.CopyVersion;
begin
  DMSettings.CopyVersion;
end;

procedure TSettingsFrame.CreateVariants;
begin
  DMSettings.CreateVariants;
end;

procedure TSettingsFrame.cxGridDBTableView2DblClick(Sender: TObject);
begin
  DMSettings.AddAssayVarToHS;
end;

function TSettingsFrame.DetailBoundsForm: TParamsForm;
var
  Params: TParamsArray;
begin
  DM.Interbeds.Active := True;
  DM.Seams.Active := True;
  SetLength(Params, 2);
  with Params[0] do begin
    Name := 'Прослой';
    ParamType := ptLookup;
    ListSource := DM.dsInterbeds;
    ListField := 'InterbedName';
    KeyField := 'InterbedId';
  end;
  with Params[1] do begin
    Name := 'Группа';
    ParamType := ptLookup;
    ListSource := DM.dsSeams;
    ListField := 'SeamName';
    KeyField := 'SeamId';
  end;
  Result := TParamsForm.Create(self, 'Таблица анализов', Params);
end;

procedure TSettingsFrame.dxNavBar1LinkClick(Sender: TObject;
  ALink: TdxNavBarItemLink);
var
  PageIndex: Integer;
begin
  if ALink.Item.Tag <= 6 then
      SettingsPageControl.ActivePageIndex := ALink.Item.Tag
  else if ALink.Item.Tag <= 10 then
  begin
    SettingsPageControl.ActivePageIndex := 7;
    DMSettings.SetDictionarySection(ALink.Item.Tag);
  end
  else
    SettingsPageControl.ActivePageIndex := 8;
end;

procedure TSettingsFrame.GridExit(Sender: TObject);
var
 DataSet: TDataSet;
begin
  DataSet := ((Sender as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSource.DataSet;
  if (DataSet.State = dsEdit) or (DataSet.State = dsInsert)then DataSet.Post;
end;

procedure TSettingsFrame.MenuItem1Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.MenuItem2Click(Sender: TObject);
begin
  CopyVersion;
end;

procedure TSettingsFrame.MenuItem3Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.MenuItem4Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.MenuItem5Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.MenuItem6Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.MenuItem7Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.MenuItem8Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.MenuItem9Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.N1Click(Sender: TObject);
begin
  RequeryGridView(Sender);
  RequeryGridView(AssayVarsTableView);
end;

procedure TSettingsFrame.N3Click(Sender: TObject);
begin
  SetVarsActual(True);
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.N43Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.N4Click(Sender: TObject);
begin
  SetVarsActual(False);
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.N52Click(Sender: TObject);
begin
  CalcRockDensity;
end;

procedure TSettingsFrame.N53Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSettingsFrame.N62Click(Sender: TObject);
begin
  CreateVariants;
end;

procedure TSettingsFrame.SettingsPageControlChange(Sender: TObject);
begin
  case SettingsPageControl.ActivePageIndex of
    4: Messenger.SendMessage('Settings', 'Main', 'Tools', '');
    else
       Messenger.SendMessage('Settings', 'Main', 'Else', '');
  end;
end;

procedure TSettingsFrame.SwitchView;
begin
  if SettingsPageControl.ActivePage.Name = 'RocksTab' then
    SwitchView1(RocksTableView, RocksExpanded);
  if SettingsPageControl.ActivePage.Name = 'CondsTab' then
    SwitchView1(CondDefsTableView, CondsExpanded);
end;


procedure TSettingsFrame.SwitchView1(AView: TcxGridDBTableView;
  var Expanded: Boolean);
begin
  if Expanded then
    AView.ViewData.Collapse(True)
  else
    AView.ViewData.Expand(True);
  Expanded := not Expanded;
end;

procedure TSettingsFrame.SetVarsActual(Value: Boolean);
begin
  DM.ExecSQL('update AssayVars set Actual = ' + Value.ToInteger.ToString);
end;

end.
