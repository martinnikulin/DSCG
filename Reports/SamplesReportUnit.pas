unit SamplesReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, ExtCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBCtrls, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  ComObj, System.Math, Data.Win.ADODB,
  DMReportsUnit;


Type
  TSamplesReportForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    IsNewHoleSeam: Boolean;
    procedure ExportAssays(InterbedId, GroupId: Integer);
    procedure ShowProgressForm;
    function GetRecordCount(InterbedId, GroupId: Integer): Integer;
    function GetExcelCols: TStringList;
    procedure OpenExcelFile(TemplateName: String; Visible: Boolean);
    procedure WriteLayerInfo(Row: Integer; LayerInfo: TLayerInfo);
    procedure WriteLayerValues(Row: Integer; ExcelCols: TStringList);
    procedure DrawTopBorder(Row, ColCount: Integer);
    procedure DrawBorders;
    procedure OpenDatasets(InterbedId: Integer; GroupId: Integer);
  public
  end;

var
  SamplesReportForm: TSamplesReportForm;

implementation
uses
  DMUnit, ProgressFormUnit;
{$R *.dfm}

procedure TSamplesReportForm.FormShow(Sender: TObject);
begin
  DMReports.Interbeds.Active := True;
  DMReports.AssayGroups.Active := True;
  DBLookupComboBox1.KeyValue := 100;
  DBLookupComboBox2.KeyValue := 1;
end;

procedure TSamplesReportForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMReports.Interbeds.Active := False;
  DMReports.AssayGroups.Active := False;
end;

procedure TSamplesReportForm.BitBtn1Click(Sender: TObject);
begin
  ExportAssays(DBLookupComboBox1.KeyValue, DBLookupComboBox2.KeyValue);
end;

procedure TSamplesReportForm.ShowProgressForm;
begin
  ProgressForm.Caption := 'Таблица анализов';
  ProgressForm.Show;
  ProgressForm.Refresh;
end;

procedure TSamplesReportForm.ExportAssays(InterbedId, GroupId: Integer);
var
  RecordCount, ColCount: Integer;
  ExcelCols: TStringList;
  i1, i, HoleSeamId: Integer;
  ProgressPosition: Integer;
  LayerInfo: TLayerInfo;
begin
  ShowProgressForm;
  RecordCount := GetRecordCount(InterbedId, GroupId);
  OpenDatasets(InterbedId, GroupId);
  OpenExcelFile('Технический анализ', False);
  ExcelCols := GetExcelCols;

  ColCount := WorkSheet.UsedRange.Columns.Count;
  i1 := WorkSheet.UsedRange.Rows.Count;
  i := i1;
  DMReports.Samples.First;
  IsNewHoleSeam := True;
  ProgressPosition := 0;
  while not DMReports.Samples.Eof do begin
    LayerInfo := DMReports.GetLayerInfo();
    if HoleSeamId <> LayerInfo.HoleSeamId then begin
      HoleSeamId := LayerInfo.HoleSeamId;
      IsNewHoleSeam := True;
    end;
    WriteLayerInfo(i, LayerInfo);
    WriteLayerValues(i, ExcelCols);
    DrawTopBorder(i, ColCount);
    IsNewHoleSeam := False;
    DMReports.Samples.Next;
    if Round(i / RecordCount * 100) > (ProgressPosition + 4) then begin
      ProgressPosition := Round(i / RecordCount * 100);
      ProgressForm.ProgressBar1.Position := ProgressPosition;
      ProgressForm.Refresh;
    end;
    Inc(i);
  end;
  ProgressForm.ProgressBar1.Position := 100;
  ProgressForm.Close;
  DrawBorders;
  ExcelAp.Visible := True;
end;

procedure TSamplesReportForm.DrawBorders;
var
  NRows, NCols: Integer;
begin
  NRows := WorkSheet.UsedRange.Rows.Count;
  NCols := WorkSheet.UsedRange.Columns.Count;
  Worksheet.Range[Worksheet.Cells[NRows, 1], Worksheet.Cells[NRows, NCols]].Borders[4].Weight := 2;
  Worksheet.Range[Worksheet.Cells[1, 1], Worksheet.Cells[NRows, NCols]].Borders[2].Weight := 2;
end;

procedure TSamplesReportForm.DrawTopBorder(Row, ColCount: Integer);
var
  Weight: Integer;
begin
  if IsNewHoleSeam then Weight := 3 else Weight := 2;
  Worksheet.Range[Worksheet.Cells[Row, 1], Worksheet.Cells[Row, ColCount]].Borders[3].LineStyle := 0;
  Worksheet.Range[Worksheet.Cells[Row, 1], Worksheet.Cells[Row, ColCount]].Borders[3].Weight := Weight;
end;

function TSamplesReportForm.GetExcelCols: TStringList;
var
  NCol, i: Integer;
  Code: String;
begin
  NCol := WorkSheet.UsedRange.Columns.Count;
  Result := TStringList.Create;
  for i := 1 to Ncol do begin
    Code := WorkSheet.Cells[1, i];
    if Code <> '' then
      Result.Add(Code + '=' + IntToStr(i));
  end;
end;

function TSamplesReportForm.GetRecordCount(InterbedId, GroupId: Integer): Integer;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  Query.SQL.Text := 'select count(*) as cnt from dbo.f_Utils_TableSample(' +
                    IntToStr(InterbedId) + ', ' + IntToStr(GroupId) + ')';
  Query.Connection := DM.DSCGConnection;
  Query.Active := True;
  Result := Query.FieldByName('cnt').AsInteger;
  Query.Active := False;
end;

procedure TSamplesReportForm.OpenDatasets(InterbedId, GroupId: Integer);
begin
  DMReports.Samples.Active := False;
  DMReports.Assays.Active := False;
  DMReports.Samples.Parameters.ParamByName('InterbedId').Value := InterbedId;
  DMReports.Samples.Parameters.ParamByName('GroupId').Value := GroupId;
  DMReports.Assays.Parameters.ParamByName('GroupId').Value := GroupId;
  DMReports.Samples.Active := True;
  DMReports.Assays.Active := True;
end;

procedure TSamplesReportForm.OpenExcelFile(TemplateName: String; Visible: Boolean);
var
  Path: String;
begin
  GetDir(0, Path);
  ExcelAp := CreateOleObject('Excel.Application');
  ExcelAp.Workbooks.Add(Path + '\Templates\' + TemplateName + '.xltx');
  WorkSheet := ExcelAp.ActiveWorkbook.ActiveSheet;
  ExcelAp.Visible := Visible;
end;

procedure TSamplesReportForm.WriteLayerInfo(Row: Integer; LayerInfo: TLayerInfo);
begin
  with LayerInfo do begin
    Worksheet.Cells[Row, 1] := SeamName;
    Worksheet.Cells[Row, 2] := LineName;
    Worksheet.Cells[Row, 3] := Borehole;
    if LithName = '' then
      Worksheet.Cells[Row, 4].Font.Bold := true;
    Worksheet.Cells[Row, 4] := FloatToStrF(DepthFrom, ffFixed, 10, 2) + ' - ' + FloatToStrF(DepthTo, ffFixed, 10, 2);
    Worksheet.Cells[Row, 5] := NLayer;
    Worksheet.Cells[Row, 6] := Th;
    if LithName <> '' then begin
      Worksheet.Cells[Row, 7] := Dip;
      Worksheet.Cells[Row, 8] := ThNorm;
      Worksheet.Cells[Row, 9] := Core;
      Worksheet.Cells[Row, 10] := CoreProc;
      Worksheet.Cells[Row, 11] := LithName;
    end;
    Worksheet.Cells[Row, 12] := SampleType;
    Worksheet.Cells[Row, 14] := NSample;
  end;
end;

procedure TSamplesReportForm.WriteLayerValues(Row: Integer; ExcelCols: TStringList);
var
  Column: Integer;
  ColStr, Value: String;
begin
  while not DMReports.Assays.Eof do begin
    ColStr := ExcelCols.Values[DMReports.Assays.FieldByName('ExcelCode').Value];
    if ColStr <> '' then
      Column := StrToInt(ColStr);
    Value := DMReports.Assays.FieldByName('Val').AsString;
    Worksheet.Cells[Row, Column] := StringReplace(Value, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
    DMReports.Assays.Next;
  end;

end;

end.
