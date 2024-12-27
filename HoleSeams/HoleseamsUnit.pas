unit HoleseamsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxGraphics, cxControls,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxDBLookupComboBox, cxDBExtLookupComboBox, cxContainer, Vcl.StdCtrls,
  cxGridCardView, cxGridDBCardView, cxGridCustomLayoutView, cxTextEdit, cxMemo,
  cxDBEdit, cxGridBandedTableView, cxGridDBBandedTableView, Vcl.ComCtrls,
  Vcl.DBCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  cxButtonEdit, cxCalc, dxScrollbarAnnotations, Vcl.Grids, Vcl.DBGrids,
  cxCurrencyEdit;

Type
  THoleseamsFrame = class(TFrame)
    Panel19: TPanel;
    SeamsGrid: TcxGrid;
    SeamsTableView: TcxGridDBTableView;
    SeamsTableViewshortname: TcxGridDBColumn;
    SeamsTableViewdescription: TcxGridDBColumn;
    SeamsGridLevel1: TcxGridLevel;
    AveragesGrid: TcxGrid;
    AveragesTableView: TcxGridDBTableView;
    AveragesGridLevel: TcxGridLevel;
    HSGrid: TcxGrid;
    HSTableView: TcxGridDBTableView;
    HSTableViewholename: TcxGridDBColumn;
    HSTableViewcomments: TcxGridDBColumn;
    HSTableViewdepth_from: TcxGridDBColumn;
    HSTableViewdepth_to: TcxGridDBColumn;
    HSTableViewcoaltypename: TcxGridDBColumn;
    HSTableViewcoalgradename: TcxGridDBColumn;
    HSTableViewAd_coal: TcxGridDBColumn;
    HSTableViewAd_total: TcxGridDBColumn;
    HSTableViewAdR: TcxGridDBColumn;
    HSTableViewth_coal: TcxGridDBColumn;
    HSTableViewth_total: TcxGridDBColumn;
    HSTableViewth_total_R: TcxGridDBColumn;
    HSTableViewAvgCalc: TcxGridDBColumn;
    HSTableViewOnMap: TcxGridDBColumn;
    HSTableViewlock: TcxGridDBColumn;
    HSTableViewstat: TcxGridDBColumn;
    HSTableViewcalcunit_id: TcxGridDBColumn;
    HSGridLevel1: TcxGridLevel;
    Panel31: TPanel;
    PageControl5: TPageControl;
    TabSheet15: TTabSheet;
    LithologyGrid: TcxGrid;
    LithologyTableView: TcxGridDBTableView;
    LithologyTableViewdepth_from: TcxGridDBColumn;
    LithologyTableViewdepth_to: TcxGridDBColumn;
    LithologyTableViewth_norm: TcxGridDBColumn;
    LithologyTableViewcore_proc: TcxGridDBColumn;
    LithologyTableViewlithname: TcxGridDBColumn;
    LithologyTableViewreserves: TcxGridDBColumn;
    LithologyGridLevel1: TcxGridLevel;
    PageControl4: TPageControl;
    TabSheet13: TTabSheet;
    SamplesGrid: TcxGrid;
    SamplesTableView: TcxGridDBTableView;
    SamplesTableViewaccepted: TcxGridDBColumn;
    SamplesTableViewbad: TcxGridDBColumn;
    SamplesTableViewdepth_from: TcxGridDBColumn;
    SamplesTableViewdepth_to: TcxGridDBColumn;
    SamplesTableViewAd: TcxGridDBColumn;
    SamplesTableViewAd_float: TcxGridDBColumn;
    SamplesTableViewAd_gbs: TcxGridDBColumn;
    SamplesTableViewAd_geophys: TcxGridDBColumn;
    SamplesTableViewAd_s: TcxGridDBColumn;
    SamplesTableViewAd_index: TcxGridDBColumn;
    SamplesGridLevel1: TcxGridLevel;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    SeamsMenu: TPopupMenu;
    N1: TMenuItem;
    LithologyMenu: TPopupMenu;
    MenuItem2: TMenuItem;
    SamplesMenu: TPopupMenu;
    MenuItem3: TMenuItem;
    AvgMenu: TPopupMenu;
    MenuItem4: TMenuItem;
    SeamsTableViewseam_id: TcxGridDBColumn;
    HSTableViewholeseam_id: TcxGridDBColumn;
    LithologyTableViewlithology_id: TcxGridDBColumn;
    SamplesTableViewsample_id: TcxGridDBColumn;
    HSMenu: TPopupMenu;
    N22: TMenuItem;
    N48: TMenuItem;
    N61: TMenuItem;
    N20: TMenuItem;
    N50: TMenuItem;
    N49: TMenuItem;
    N32: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    AveragesTableViewCoalType: TcxGridDBColumn;
    AveragesTableViewCoalGrade: TcxGridDBColumn;
    AveragesTableViewVarId: TcxGridDBColumn;
    AveragesTableViewValue: TcxGridDBColumn;
    Splitter4: TSplitter;
    AveragesTableViewUserValue: TcxGridDBColumn;
    N4: TMenuItem;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1VarName: TcxGridDBColumn;
    cxGrid1DBTableView1Value: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    HSTableViewKB: TcxGridDBColumn;
    Lock1: TMenuItem;
    Lock2: TMenuItem;
    procedure InterbedComboCloseUp(Sender: TObject);
    procedure ChangeInterbed;
    procedure HSTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure N1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure HSTableViewColumn1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure HSTableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure HSTableViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Lock1Click(Sender: TObject);
    procedure Lock2Click(Sender: TObject);
  private
    procedure PaintAvgCalc(ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; AvgCalcFieldIndex: Integer);
    procedure SetHSCheckColumn(ColIndex: Integer; Value: Boolean);
  public
    Activated: Boolean;
    procedure Activate();
  end;

implementation
uses
  DMUnit, MainUnit, DMReservesUnit, UtilsUnit;
{$R *.dfm}

{ THoleseamsFrame }

procedure THoleseamsFrame.Activate;
begin
  if not Activated then
  begin
    DMReserves.DisableControls;
    DMReserves.Initialize;
    DMReserves.EnableControls;
    Activated := True;
  end;
  DM.RequeryTables('HoleSeams');
  MainForm.IBCombo2.KeyValue := DM.Interbeds.FieldByName('InterbedId').Value;
end;

procedure THoleseamsFrame.ChangeInterbed;
begin
  DMReserves.ChangeInterbed;
end;

procedure THoleseamsFrame.GridExit(Sender: TObject);
var
 DataSet: TDataSet;
begin
  DataSet := ((Sender as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSource.DataSet;
  if (DataSet.State = dsEdit) or (DataSet.State = dsInsert)then DataSet.Post;
end;

procedure THoleseamsFrame.HSTableViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if AButton = mbLeft then begin
    if ACellViewInfo.Item.Index = HSTableViewholeseam_id.Index then begin
        cxGrid1.Visible := True;
        Exit;
      end;
  end;
end;

procedure THoleseamsFrame.HSTableViewColumn1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowMessage('');
end;

procedure THoleseamsFrame.HSTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  PaintAvgCalc(ACanvas, AViewInfo, HSTableViewAvgCalc.Index);
end;

procedure THoleseamsFrame.HSTableViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  cxGrid1.Visible := False;
  cxGrid1.Left := X;
  cxGrid1.Top := Y;
end;

procedure THoleseamsFrame.InterbedComboCloseUp(Sender: TObject);
begin
  DMReserves.ChangeInterbed;
end;

procedure THoleseamsFrame.Lock1Click(Sender: TObject);
begin
  SetHSCheckColumn(HSTableViewLock.Index, True);
end;

procedure THoleseamsFrame.Lock2Click(Sender: TObject);
begin
  SetHSCheckColumn(HSTableViewLock.Index, False);
end;

procedure THoleseamsFrame.MenuItem1Click(Sender: TObject);
begin
  DMReserves.HoleSeams.Requery();
end;

procedure THoleseamsFrame.MenuItem2Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure THoleseamsFrame.MenuItem3Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure THoleseamsFrame.MenuItem4Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure THoleseamsFrame.N1Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure THoleseamsFrame.N22Click(Sender: TObject);
begin
  DMReserves.CalcCalcUnits;
  RequeryGridView(Sender);
end;

procedure THoleseamsFrame.N32Click(Sender: TObject);
begin
  //DMReserves.HoleSeams.Requery();
  RequeryGridView(Sender);
end;

procedure THoleseamsFrame.N48Click(Sender: TObject);
begin
  SetHSCheckColumn(HSTableViewOnMap.Index, True);
end;

procedure THoleseamsFrame.N2Click(Sender: TObject);
begin
  SetHSCheckColumn(HSTableViewOnMap.Index, False);
end;

procedure THoleseamsFrame.N61Click(Sender: TObject);
begin
  SetHSCheckColumn(HSTableViewAvgCalc.Index, True);
end;

procedure THoleseamsFrame.N3Click(Sender: TObject);
begin
  SetHSCheckColumn(HSTableViewAvgCalc.Index, False);
end;

procedure THoleseamsFrame.SetHSCheckColumn(ColIndex: Integer; Value: Boolean);
var
  i: Integer;
  CalcUnitId: Integer;
  FieldName: String;
begin
  DMreserves.HoleSeams.DisableControls;
  with HSTableView.Controller do
    for i := 0 to SelectedRowCount - 1 do begin
      CalcUnitId := HSTableView.Controller.SelectedRows[i].Values[HSTableViewcalcunit_id.Index];
      FieldName := HSTableView.Columns[ColIndex].DataBinding.FieldName;
      DMreserves.SetHoleseamCheckValue(CalcUnitId, FieldName, Value);
    end;
  DMreserves.HoleSeams.EnableControls;
end;

procedure THoleseamsFrame.N50Click(Sender: TObject);
begin
  DMReserves.CalcAverages(1);
end;

procedure THoleseamsFrame.N49Click(Sender: TObject);
begin
  DMReserves.CalcAverages(2);
end;

procedure THoleseamsFrame.N4Click(Sender: TObject);
begin
  DMReserves.CalcAverages(3);
end;


procedure THoleseamsFrame.PaintAvgCalc(ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; AvgCalcFieldIndex: Integer);
var
  FieldName: string;
  Value: String;
begin
  FieldName := (AViewInfo.Item as TcxGridDBColumn).DataBinding.FieldName;
  if (FieldName = 'AdCoal') or (FieldName = 'AdFull') or
      (FieldName = 'ThCoal') or (FieldName = 'ThFull') or
      (FieldName = 'AdAvg') then
  begin
    Value := VarToStr(AViewInfo.GridRecord.Values[AvgCalcFieldIndex]);
    if (Value = 'True') and not (AViewInfo.GridRecord.Selected)
        then ACanvas.Canvas.Brush.Color := RGB(207, 222, 241);
  end;
end;

end.
