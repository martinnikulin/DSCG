unit SiteUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxFilter,
  dxScrollbarAnnotations, cxEdit, cxVGrid, cxDBVGrid, cxInplaceContainer,
  cxCustomData, cxData, cxDataStorage, cxNavigator, dxDateRanges, Data.DB,
  cxDBData, Vcl.StdCtrls, Vcl.ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGridBandedTableView, cxGridDBBandedTableView, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, Vcl.ClipBrd, Vcl.Grids, Vcl.DBGrids, Vcl.Menus;

type
  TSiteFrame = class(TFrame)
    cxDBVerticalGrid1: TcxDBVerticalGrid;
    cxDBVerticalGrid1ProjectDescription: TcxDBEditorRow;
    cxDBVerticalGrid1LicenseNumber: TcxDBEditorRow;
    cxDBVerticalGrid1SubsoilUser: TcxDBEditorRow;
    cxDBVerticalGrid1ProjectNumber: TcxDBEditorRow;
    cxDBVerticalGrid1ProjectDate: TcxDBEditorRow;
    cxDBVerticalGrid1CoordinateSystem: TcxDBEditorRow;
    cxDBVerticalGrid1ContractNumber: TcxDBEditorRow;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Splitter2: TSplitter;
    ReportsTableView: TcxGridDBTableView;
    ReportsGridLevel: TcxGridLevel;
    ReportsGrid: TcxGrid;
    ReportsTableViewProjectDate: TcxGridDBColumn;
    ReportsTableViewProjectNumber: TcxGridDBColumn;
    ObjectCoordsGrid: TcxGrid;
    ObjectCoordsTableView: TcxGridDBBandedTableView;
    ObjectCoordsTableViewId: TcxGridDBBandedColumn;
    ObjectCoordsTableViewN: TcxGridDBBandedColumn;
    ObjectCoordsTableViewLongDegrees: TcxGridDBBandedColumn;
    ObjectCoordsTableViewLongMinutes: TcxGridDBBandedColumn;
    ObjectCoordsTableViewLongSeconds: TcxGridDBBandedColumn;
    ObjectCoordsTableViewLatDegrees: TcxGridDBBandedColumn;
    ObjectCoordsTableViewLatMinutes: TcxGridDBBandedColumn;
    ObjectCoordsTableViewLatSeconds: TcxGridDBBandedColumn;
    ObjectCoordsTableViewLongitude: TcxGridDBBandedColumn;
    ObjectCoordsTableViewLatitude: TcxGridDBBandedColumn;
    ObjectCoordsTableViewX: TcxGridDBBandedColumn;
    ObjectCoordsTableViewY: TcxGridDBBandedColumn;
    ObjectCoordsGridLevel: TcxGridLevel;
    TabControl1: TTabControl;
    TabControl2: TTabControl;
    TabControl3: TTabControl;
    ObjectCoordsTableViewObjectName: TcxGridDBBandedColumn;
    CoordsMenu: TPopupMenu;
    N17: TMenuItem;
    ActionList: TActionList;
    Paste: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure ObjectCoordsTableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ObjectCoordsGridEnter(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure PasteExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    FieldIndex: Integer;
    RowIndex: Integer;
    procedure CtrlV;
  public
    { Public declarations }
  end;

implementation
{$R *.dfm}
uses
  DMUnit, UtilsUnit;

procedure TSiteFrame.N17Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TSiteFrame.N1Click(Sender: TObject);
begin
  CtrlV;
end;

procedure TSiteFrame.ObjectCoordsGridEnter(Sender: TObject);
var
 View: TcxGridDBTableView;
begin
 View := TcxGridDBTableView((Sender as TcxGrid).FocusedView);
 if View.DataController.DataSet.IsEmpty then
 begin
   View.DataController.DataSet.Append;
   View.Controller.EditingController.ShowEdit;
 end;
end;

procedure TSiteFrame.ObjectCoordsTableViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  FieldIndex := ObjectCoordsTableView.Controller.FocusedColumnIndex;
  RowIndex := ObjectCoordsTableView.Controller.FocusedRowIndex;
end;

procedure TSiteFrame.PasteExecute(Sender: TObject);
var
  ClipBoardData: TStrings;
  i, j, n: Integer;
  SplittedData: TArray<String>;
begin
  try
    ClipBoardData := TStringList.Create;
    ClipBoardData.Text := Clipboard.AsText;
    if ClipBoardData.Count > 0 then begin
      DM.ObjectsCoords.DisableControls;
      for i := 0 to ClipBoardData.Count - 1 do
      begin
        SplittedData := ClipBoardData.Strings[i].Split([Chr(9)]);
        n := Length(SplittedData);
        try
          DM.ObjectsCoords.Edit;
          if DM.ObjectsCoords.Eof then
            DM.ObjectsCoords.Append;
          for j := 0 to n - 1 do begin
            if FieldIndex + j <= DM.ObjectsCoords.Fields.Count - 1  then
              DM.ObjectsCoords.Fields[FieldIndex + j].AsString := SplittedData[j];
          end;
          DM.ObjectsCoords.Next;
        except
          DM.ObjectsCoords.Cancel;
          raise;
        end;
      end;
      DM.ObjectsCoords.EnableControls;
    end;
  finally
    ClipBoardData.Free;
    DM.ObjectsCoords.Requery();
  end;
end;

procedure TSiteFrame.CtrlV;
begin

end;
end.
