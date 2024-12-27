unit SeamsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxDropDownEdit, cxDBLookupComboBox, dxBarBuiltInMenu, Vcl.ExtCtrls, cxPC,
  cxGridLevel, cxGridCustomLayoutView, cxGridCardView, cxGridDBCardView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid,
  Vcl.ComCtrls, cxSplitter, Vcl.Menus, dxScrollbarAnnotations;

Type
  TSeamsFrame = class(TFrame)
    cxSplitter2: TcxSplitter;
    Panel1: TPanel;
    SeamsGrid: TcxGrid;
    SeamsTableView: TcxGridDBTableView;
    SeamsTableViewseam_id: TcxGridDBColumn;
    SeamsTableViewdescription: TcxGridDBColumn;
    SeamsTableViewshortname: TcxGridDBColumn;
    SeamsTableViewstrata: TcxGridDBColumn;
    SeamsTableViewnn: TcxGridDBColumn;
    SeamsTableViewactual: TcxGridDBColumn;
    SeamsTableViewworktype: TcxGridDBColumn;
    SeamsGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PartsGrid: TcxGrid;
    PartsTableView: TcxGridDBTableView;
    PartsTableViewpart_id: TcxGridDBColumn;
    PartsTableViewchapter: TcxGridDBColumn;
    PartsTableViewpart_nn: TcxGridDBColumn;
    PartsTableViewnpart: TcxGridDBColumn;
    PartsTableViewvertical: TcxGridDBColumn;
    PartsTableViewdescription: TcxGridDBColumn;
    PartsTableViewColumn1: TcxGridDBColumn;
    PartsGridLevel1: TcxGridLevel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    CoeffsGrid: TcxGrid;
    CoeffsTableView: TcxGridDBTableView;
    CoeffsTableViewinterbedname: TcxGridDBColumn;
    CoeffsTableViewtypename: TcxGridDBColumn;
    CoeffsTableViewgradename: TcxGridDBColumn;
    CoeffsTableViewa: TcxGridDBColumn;
    CoeffsTableViewb: TcxGridDBColumn;
    CoeffsTableViewSeamId: TcxGridDBColumn;
    CoeffsGridLevel1: TcxGridLevel;
    SeamsPopup: TPopupMenu;
    N1: TMenuItem;
    PartsPopup: TPopupMenu;
    MenuItem1: TMenuItem;
    CoeffsPopup: TPopupMenu;
    N55: TMenuItem;
    N56: TMenuItem;
    N2: TMenuItem;
    SeamsTableViewAdRoof: TcxGridDBColumn;
    SeamsTableViewAdBed: TcxGridDBColumn;
    SeamsTableViewDdaRoof: TcxGridDBColumn;
    SeamsTableViewDdaBed: TcxGridDBColumn;
    CoeffsTableViewCoeffId: TcxGridDBColumn;
    N3: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SeamsTableViewEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
  private
    a: Real;
    b: Real;
    procedure SetCoeffs();
  public
    Activated: Boolean;
    procedure Activate();
  end;

implementation
uses
  DMUnit, DMSeamsUnit, UtilsUnit;
{$R *.dfm}

{ TSeamsFrame }

procedure TSeamsFrame.Activate;
begin
  if not Activated then
  begin
    DMSeams.Initialize;
    Activated := True;
  end;
  DM.RequeryTables('Seams');
end;

procedure TSeamsFrame.GridExit(Sender: TObject);
var
 DataSet: TDataSet;
begin
  DataSet := ((Sender as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSource.DataSet;
  if (DataSet.State = dsEdit) or (DataSet.State = dsInsert)then DataSet.Post;
end;

procedure TSeamsFrame.MenuItem1Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSeamsFrame.N1Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSeamsFrame.N2Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSeamsFrame.N3Click(Sender: TObject);
begin
  a := CoeffsTableView.Controller.SelectedRows[0].Values[CoeffsTableViewa.Index];
  b := CoeffsTableView.Controller.SelectedRows[0].Values[CoeffsTableViewb.Index];
end;

procedure TSeamsFrame.N55Click(Sender: TObject);
begin
  DMSeams.AddCoeffs;
end;

procedure TSeamsFrame.N56Click(Sender: TObject);
begin
  SetCoeffs;
end;

procedure TSeamsFrame.SeamsTableViewEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
var
  s: Variant;
begin

end;

procedure TSeamsFrame.SetCoeffs();
var
  CoeffId, i: Integer;
begin
  DMSeams.Coeffs.DisableControls;
  with CoeffsTableView.Controller do
    for i := 0 to SelectedRowCount - 1 do begin
      CoeffId := CoeffsTableView.Controller.SelectedRows[i].Values[CoeffsTableViewCoeffId.Index];
      DMSeams.SetCoeffs(CoeffId, a, b);
    end;
  DMSeams.Coeffs.EnableControls;
end;

end.
