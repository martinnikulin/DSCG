unit LithologyUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, Menus,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxButtonEdit, cxDropDownEdit, cxDBExtLookupComboBox, cxDBLookupComboBox,
  cxTextEdit, cxBlobEdit, dxBarBuiltInMenu, Vcl.DBCtrls, cxPC, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  Vcl.ComCtrls, cxSplitter, dxScrollbarAnnotations;

Type
  TLithologyFrame = class(TFrame)
    LithologyMenu: TPopupMenu;
    N30: TMenuItem;
    N41: TMenuItem;
    N63: TMenuItem;
    N14: TMenuItem;
    Panel1: TPanel;
    HSGrid: TcxGrid;
    HSTableView: TcxGridDBTableView;
    HSTableViewholeseam_id: TcxGridDBColumn;
    HSTableViewcomments: TcxGridDBColumn;
    HSTableViewdepth_from: TcxGridDBColumn;
    HSTableViewdepth_to: TcxGridDBColumn;
    HSTableViewseamname: TcxGridDBColumn;
    HSTableViewdetail: TcxGridDBColumn;
    HSTableViewKB: TcxGridDBColumn;
    HSTableViewdraw_from: TcxGridDBColumn;
    HSTableViewdraw_to: TcxGridDBColumn;
    HSTableViewcoalgradename: TcxGridDBColumn;
    HSTableViewcoaltypename: TcxGridDBColumn;
    HSTableViewdip: TcxGridDBColumn;
    HSGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    LithologyPageControl: TPageControl;
    TabSheet1: TTabSheet;
    LithologyGrid: TcxGrid;
    LithologyTableView: TcxGridDBTableView;
    LithologyGridLevel1: TcxGridLevel;
    SamplesPageControl: TPageControl;
    TabSheet2: TTabSheet;
    SamplesGrid: TcxGrid;
    SamplesTableView: TcxGridDBTableView;
    SamplesTableViewsample_id: TcxGridDBColumn;
    SamplesTableViewaccepted: TcxGridDBColumn;
    SamplesTableViewbad: TcxGridDBColumn;
    SamplesTableViewinsum: TcxGridDBColumn;
    SamplesTableViewqual: TcxGridDBColumn;
    SamplesTableViewlayerN: TcxGridDBColumn;
    SamplesTableViewsampleN: TcxGridDBColumn;
    SamplesTableViewsampletype: TcxGridDBColumn;
    SamplesTableViewlevelname: TcxGridDBColumn;
    SamplesTableViewdepth_from: TcxGridDBColumn;
    SamplesTableViewdepth_to: TcxGridDBColumn;
    SamplesTableViewAd: TcxGridDBColumn;
    SamplesTableViewAd_float: TcxGridDBColumn;
    SamplesTableViewAd_gbs: TcxGridDBColumn;
    SamplesTableViewAd_geophys: TcxGridDBColumn;
    SamplesTableViewAd_s: TcxGridDBColumn;
    SamplesTableViewAd_index: TcxGridDBColumn;
    SamplesTableViewwash: TcxGridDBColumn;
    SamplesTableViewshow: TcxGridDBColumn;
    SamplesGridDBTableView2: TcxGridDBTableView;
    SamplesGridDBTableView2nn: TcxGridDBColumn;
    SamplesGridDBTableView2Adname: TcxGridDBColumn;
    SamplesGridLevel1: TcxGridLevel;
    CheckBox2: TCheckBox;
    Panel2: TPanel;
    LinesGrid: TcxGrid;
    LinesGridTableView: TcxGridDBTableView;
    LinesGridTableViewsl_id: TcxGridDBColumn;
    LinesGridTableViewnn: TcxGridDBColumn;
    LinesGridTableViewslname: TcxGridDBColumn;
    LinesGridLevel1: TcxGridLevel;
    LineHolesGrid: TcxGrid;
    LineHolesTableView: TcxGridDBTableView;
    LineHolesTableViewhole_id: TcxGridDBColumn;
    LineHolesTableViewnn: TcxGridDBColumn;
    LineHolesTableViewholename: TcxGridDBColumn;
    LineHolesGridLevel1: TcxGridLevel;
    HSMenu: TPopupMenu;
    N4: TMenuItem;
    N44: TMenuItem;
    TabControl1: TTabControl;
    SamplesTableViewColumn1: TcxGridDBColumn;
    TabControl2: TTabControl;
    TabControl3: TTabControl;
    CheckBox3: TCheckBox;
    Splitter1: TSplitter;
    SLMenu: TPopupMenu;
    N1: TMenuItem;
    SLHMenu: TPopupMenu;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    SamplesMenu: TPopupMenu;
    MenuItem2: TMenuItem;
    Splitter3: TSplitter;
    Splitter2: TSplitter;
    Splitter4: TSplitter;
    LithologyTableViewLithologyId: TcxGridDBColumn;
    LithologyTableViewBoreholeId: TcxGridDBColumn;
    LithologyTableViewDepthFrom: TcxGridDBColumn;
    LithologyTableViewDepthTo: TcxGridDBColumn;
    LithologyTableViewAngle: TcxGridDBColumn;
    LithologyTableViewTh: TcxGridDBColumn;
    LithologyTableViewThNorm: TcxGridDBColumn;
    LithologyTableViewCore: TcxGridDBColumn;
    LithologyTableViewCoreNorm: TcxGridDBColumn;
    LithologyTableViewCoreProc: TcxGridDBColumn;
    LithologyTableViewRockId: TcxGridDBColumn;
    LithologyTableViewFormation: TcxGridDBColumn;
    LithologyTableViewSeamName: TcxGridDBColumn;
    LithologyTableViewRockName: TcxGridDBColumn;
    procedure CheckBox2Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure LithologyTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure LithologyTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure N4Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure SamplesTableViewDblClick(Sender: TObject);
    procedure SamplesTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure LithologyMenuPopup(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure LineHolesTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure N1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure SamplesTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure N44Click(Sender: TObject);
  private
    procedure DeleteHoleSeam;
    procedure DefineHoleSeam(Add: Boolean);
    procedure ShowAssaysForm;
  public
    Activated: Boolean;
    procedure Activate();
    procedure ChangeInterbed;
  end;

implementation
uses
  DMUnit, DMSeamsUnit, DMLithologyUnit, MainUnit, AssaysUnit, ParamsFormUnit, UtilsUnit;
{$R *.dfm}

procedure TLithologyFrame.Activate;
begin
  if not Activated then
  begin
    DMLithology.Initialize;
    Activated := True;
  end;
  DM.RequeryTables('BHData');
  MainForm.IBCombo1.KeyValue := DM.Interbeds.FieldByName('InterbedId').Value;
end;

procedure TLithologyFrame.ChangeInterbed;
begin
  DMLithology.ChangeInterbed;
end;

procedure TLithologyFrame.CheckBox2Click(Sender: TObject);
begin
  LithologyTableView.OptionsData.Appending := not CheckBox2.Checked;
  LithologyTableView.OptionsData.Inserting := not CheckBox2.Checked;
  SamplesTableView.OptionsData.Appending := not CheckBox2.Checked;
  SamplesTableView.OptionsData.Inserting := not CheckBox2.Checked;
  DMLithology.ByHoleSeams := CheckBox2.Checked;
  DMLithology.SetLithologyFilter();
  DMLithology.SetSamplesFilter();
  SamplesTableView.OptionsData.Deleting := not CheckBox2.Checked;
end;

procedure TLithologyFrame.CheckBox3Click(Sender: TObject);
begin
  DMLithology.SetLineHolesFilter(CheckBox3.Checked);
end;

procedure TLithologyFrame.DefineHoleSeam(Add: Boolean);
var
  DepthFromId, DepthToId: Integer;
  DrawFrom, DrawTo: Real;
  FirstRecord: Integer;
  Bookmark: TBookmark;
begin
  DepthFromId := LithologyTableView.Controller.SelectedRows[0].Values[LithologyTableViewLithologyId.Index];
  DepthToId := LithologyTableView.Controller.SelectedRows[LithologyTableView.Controller.SelectedRowCount - 1].Values[LithologyTableViewLithologyId.Index];
  DrawFrom := LithologyTableView.Controller.SelectedRows[0].Values[LithologyTableViewDepthFrom.Index];
  DrawTo := LithologyTableView.Controller.SelectedRows[LithologyTableView.Controller.SelectedRowCount - 1].Values[LithologyTableViewDepthTo.Index];
  DMLithology.DefineHoleSeam(DepthFromId, DepthToId, DrawFrom, DrawTo, Add);
  RequeryGridView(HSTableView);
  RequeryGridView(LithologyTableView);
end;

procedure TLithologyFrame.DeleteHoleSeam;
begin
  if MessageDlg('Пластопересечение будет удалено. Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DMLithology.DeleteHoleSeam;
end;

procedure TLithologyFrame.GridExit(Sender: TObject);
var
 DataSet: TDataSet;
begin
  DataSet := ((Sender as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSource.DataSet;
  if (DataSet.State = dsEdit) or (DataSet.State = dsInsert)then DataSet.Post;
end;

procedure TLithologyFrame.LineHolesTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if not Checkbox3.Checked then
    DMLithology.SurveyLines.Locate('LineId', DMLithology.LineHoles.FieldByName('LineId').Value, []);
end;

procedure TLithologyFrame.LithologyMenuPopup(Sender: TObject);
begin
  N30.Enabled := not CheckBox2.Checked;
  N41.Enabled := not CheckBox2.Checked;
end;

procedure TLithologyFrame.LithologyTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ARec: TRect;
  val1, val2: String;
begin
  ARec := AViewInfo.Bounds;
  if not AViewInfo.GridRecord.Selected then
  begin
    val1 := VarAsType(AViewInfo.GridRecord.DisplayTexts[LithologyTableViewRockId.Index], varString);
    if val1 = '7' then
      ACanvas.Canvas.Brush.Color := RGB(192, 220, 192);
    ACanvas.Canvas.FillRect(ARec);
  end;
end;

procedure TLithologyFrame.LithologyTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if LithologyTableView.ViewData.RowCount > 0 then
  if (VarToStr(LithologyTableView.ViewData.Rows[AFocusedRecord.Index].Values[LithologyTableViewDepthTo.Index]) = '1000000') then
  begin
    LithologyTableView.Items[LithologyTableViewDepthTo.Index].EditValue := '';
    if AFocusedRecord.Index > 0 then
      LithologyTableView.Items[LithologyTableViewDepthFrom.Index].EditValue :=
      LithologyTableView.ViewData.Rows[AFocusedRecord.Index - 1].Values[LithologyTableViewDepthTo.Index];
  end;
end;

procedure TLithologyFrame.MenuItem1Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TLithologyFrame.MenuItem2Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TLithologyFrame.N14Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TLithologyFrame.N1Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TLithologyFrame.N2Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TLithologyFrame.N30Click(Sender: TObject);
begin
  DefineHoleSeam(False);
end;

procedure TLithologyFrame.N41Click(Sender: TObject);
begin
  DefineHoleSeam(True);
end;

procedure TLithologyFrame.N44Click(Sender: TObject);
begin
  N44.Checked := not N44.Checked;
end;

procedure TLithologyFrame.N4Click(Sender: TObject);
begin
  DeleteHoleSeam;
end;

procedure TLithologyFrame.N63Click(Sender: TObject);
var
  i, LithologyId, FormationId: integer;
  ParamsForm: TParamsForm;
  Params: TParamsArray;
begin
  SetLength(Params, 1);
  Params[0].Name := 'Свита';
  Params[0].ParamType := ptLookup;
  Params[0].ListSource := DM.dsFormations;
  Params[0].Listfield := 'FormationName';
  Params[0].KeyField := 'Id';
  ParamsForm := TParamsForm.Create(self, 'Определение свиты', Params);
  if ParamsForm.ShowModal = mrOK then
    begin
      FormationId := ParamsForm.Output[0];
      for i := 0 to LithologyTableView.Controller.SelectedRowCount - 1 do
      begin
        LithologyId := LithologyTableView.Controller.SelectedRows[i].Values[LithologyTableViewLithologyId.Index];
        DMLithology.UpdateLithology(LithologyId, 'Formation', FormationId);
      end;
    end;
end;

procedure TLithologyFrame.SamplesTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  i: integer;
  FValue: string;
  FBounds: TRect;
begin
  if AViewInfo.Item.Index = 0 then
  begin
    FBounds := AViewInfo.Bounds;
    ACanvas.FillRect(FBounds);
    FValue := IntToStr(AViewInfo.GridRecord.RecordIndex + 1);
    ACanvas.Font.Color := clBlack;
    ACanvas.Brush.Style := bsClear;
    InflateRect(FBounds, -10, -2);
    ACanvas.DrawText(FValue, FBounds, cxAlignRight or cxAlignTop);
    ADone := True;
  end;
end;

procedure TLithologyFrame.SamplesTableViewDblClick(Sender: TObject);
begin
  ShowAssaysForm;
end;

procedure TLithologyFrame.ShowAssaysForm;
begin
  if (DMLithology.Samples.State = dsEdit) or (DMLithology.Samples.State = dsInsert) then
    DMLithology.Samples.Post;
  if DMLithology.Samples.FieldByName('SampleId').Value = 0 then
    RequeryGridView(SamplesTableView);
  AssaysForm.Show;
end;

procedure TLithologyFrame.SamplesTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if AssaysForm.Visible then AssaysForm.FillGrid;
end;

end.
