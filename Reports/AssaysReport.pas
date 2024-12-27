unit AssaysReport;

interface
uses
  Classes, SysUtils, Dialogs, ComObj, System.Math, Data.Win.ADODB,
  DMUnit, DMReportsUnit, ProgressFormUnit;

Type TAssaysReport = class
  private
    IsNewHoleSeam: Boolean;
    Excel: OleVariant;
    Worksheet: OleVariant;
    FRowsCount: Integer;
    FColumnsCount: Integer;
    FExcelCols: TStringList;
    FRecordCount: Integer;
    FInterbedId: Integer;
    FGroupId: Integer;
    FReportName: String;
    function GetExcelCols(): TStringList;
    function GetUsedRows(): Integer;
    function GetUsedColumns(): Integer;
    procedure ShowProgressForm;
    procedure OpenExcelFile(TemplateName: String; Visible: Boolean);
    procedure WriteLayerInfo(Row: Integer; LayerInfo: TLayerInfo);
    procedure WriteLayerValues(Row: Integer);
    procedure DrawRowLine(Row, ColCount: Integer);
    procedure DrawBorders;
  public
    constructor Create(InterbedId, GroupId: Integer);
    procedure Write;
  published
    property RowsCount: Integer read GetUsedRows;
    property ColumnsCount: Integer read FColumnsCount;
    property ExcelCols: TStringList read FExcelCols;
end;

implementation

{ TAssaysReport }

constructor TAssaysReport.Create(InterbedId, GroupId: Integer);
begin
  FInterbedId := InterbedId;
  FGroupId := GroupId;
  FReportName := DMReports.GetGroupName(GroupId);
  FRecordCount := DMReports.GetRecordCount(InterbedId, GroupId);
  DMReports.OpenDatasets(InterbedId, GroupId);
  OpenExcelFile(FReportName, False);
  FColumnsCount := GetUsedColumns();
  FExcelCols := GetExcelCols();
end;

procedure TAssaysReport.Write;
var
  Row, HoleSeamId: Integer;
  ProgressPosition: Integer;
  LayerInfo: TLayerInfo;
begin
  ShowProgressForm;
  Row := RowsCount;
  DMReports.Samples.First;
  ProgressPosition := 0;
  while not DMReports.Samples.Eof do begin
    LayerInfo := DMReports.GetLayerInfo();
    IsNewHoleSeam := False;
    if HoleSeamId <> LayerInfo.HoleSeamId then begin
      HoleSeamId := LayerInfo.HoleSeamId;
      IsNewHoleSeam := True;
    end;
    WriteLayerInfo(Row, LayerInfo);
    WriteLayerValues(Row);
    DrawRowLine(Row, ColumnsCount);
    DMReports.Samples.Next;
    if Round(Row / FRecordCount * 100) > (ProgressPosition + 4) then begin
      ProgressPosition := Round(Row / FRecordCount * 100);
      ProgressForm.ProgressBar1.Position := ProgressPosition;
      ProgressForm.Refresh;
    end;
    Row := Row + 1;
  end;
  ProgressForm.ProgressBar1.Position := 100;
  ProgressForm.Close;
  DrawBorders;
  Excel.Visible := True;
end;

procedure TAssaysReport.ShowProgressForm;
begin
  ProgressForm.Caption := 'Таблица анализов';
  ProgressForm.Show;
  ProgressForm.Refresh;
end;

procedure TAssaysReport.DrawBorders;
begin
  Worksheet.Range[Worksheet.Cells[RowsCount, 1], Worksheet.Cells[RowsCount, ColumnsCount]].Borders[4].Weight := 2;
  Worksheet.Range[Worksheet.Cells[1, 1], Worksheet.Cells[RowsCount, ColumnsCount]].Borders[2].Weight := 2;
end;

procedure TAssaysReport.DrawRowLine(Row, ColCount: Integer);
var
  Weight: Integer;
begin
  if IsNewHoleSeam then Weight := 3 else Weight := 2;
  Worksheet.Range[Worksheet.Cells[Row, 1], Worksheet.Cells[Row, ColCount]].Borders[3].LineStyle := 0;
  Worksheet.Range[Worksheet.Cells[Row, 1], Worksheet.Cells[Row, ColCount]].Borders[3].Weight := Weight;
end;

function TAssaysReport.GetExcelCols: TStringList;
var
  i: Integer;
  Code: String;
begin
  Result := TStringList.Create;
  for i := 1 to ColumnsCount do begin
    Code := WorkSheet.Cells[1, i];
    if Code <> '' then
      Result.Add(Code + '=' + IntToStr(i));
  end;
end;

function TAssaysReport.GetUsedColumns: Integer;
begin
  Result := WorkSheet.UsedRange.Columns.Count;
end;

function TAssaysReport.GetUsedRows: Integer;
begin
  Result := WorkSheet.UsedRange.Rows.Count;
end;

procedure TAssaysReport.OpenExcelFile(TemplateName: String; Visible: Boolean);
var
  Path: String;
begin
  GetDir(0, Path);
  Excel := CreateOleObject('Excel.Application');
  Excel.Workbooks.Add(Path + '\Templates\' + TemplateName + '.xltx');
  WorkSheet := Excel.ActiveWorkbook.ActiveSheet;
  Excel.Visible := Visible;
end;

procedure TAssaysReport.WriteLayerInfo(Row: Integer; LayerInfo: TLayerInfo);
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

procedure TAssaysReport.WriteLayerValues(Row: Integer);
var
  Column: Integer;
  ColStr, Value: String;
begin
  while not DMReports.Assays.Eof do begin
    ColStr := ExcelCols.Values[DMReports.Assays.FieldByName('ExcelCode').Value];
    if ColStr <> '' then begin
      Column := StrToInt(ColStr);
      Value := DMReports.Assays.FieldByName('Val').AsString;
      Worksheet.Cells[Row, Column] := StringReplace(Value, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
    end;
    DMReports.Assays.Next;
  end;
end;
end.
