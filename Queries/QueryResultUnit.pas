unit QueryResultUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, ComCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, cxExport, OleServer, Comobj,
  cxLookAndFeels, cxLookAndFeelPainters, cxDataStorage, cxNavigator, cxGridExportLink,
  dxDateRanges, dxScrollbarAnnotations;

Type
  TQueryResultForm = class(TForm)
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Excel1: TMenuItem;
    SaveDialog1: TSaveDialog;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryResultForm: TQueryResultForm;

implementation

uses DMUnit, DMQueryUnit;

{$R *.dfm}

procedure TQueryResultForm.FormShow(Sender: TObject);
var
  i: integer;
  pum: TPopupMenu;
  ARootLevel: TcxGridLevel;
  AView: TcxGridDBTableView;

begin
  Caption := DMQuery.Queries.FieldByName('Description').AsString;
  StatusBar1.SimpleText := 'Количество записей: ' + IntToStr(DMQuery.ADOQuery.RecordCount);
  AView := TcxGridDBTableView(cxGrid1.CreateView(TcxGridDBTableView));

  cxGrid1Level1.GridView := AView;
  AView.OptionsView.Indicator := True;
  AView.OptionsView.IndicatorWidth := 20;
  AView.OptionsView.DataRowHeight := 23;
  AView.OptionsView.HeaderHeight := 24;
  AView.OptionsView.GroupByBox := False;
  AView.OptionsCustomize.ColumnFiltering := false;

  AView.DataController.DataSource := DMQuery.dsADOQuery;
  AView.OptionsData.Appending := false;
  AView.OptionsData.Inserting := false;
  AView.OptionsData.Editing := false;
  AView.DataController.CreateAllItems;
  for i := 0 to AView.ColumnCount - 1 do
  begin
    if AView.Columns[i].DataBinding.Field.DataType = ftBCD	then
      (AView.Columns[i].DataBinding.Field as TBCDField).displayformat := '0.00';
  end;
end;

procedure TQueryResultForm.Excel1Click(Sender: TObject);
var
  ExcelAp, Workbook, Worksheet: OleVariant;
begin
  SaveDialog1.DefaultExt := 'xlsx';
  SaveDialog1.Filter := 'Файлы Excel (*.xlsx)|*.xlsx';
  if SaveDialog1.Execute then
    begin
      ExportGridToXLSX(SaveDialog1.FileName, cxGrid1);
      ExcelAp := CreateOleObject('Excel.Application');
      ExcelAp.Workbooks.Open(SaveDialog1.FileName);
      ExcelAp.visible := true;
    end;
end;
end.
