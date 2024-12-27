unit AveragesReportUnit;

interface
uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, ComObj, Math,
  Variants, StrUtils, Dialogs;

  procedure ExportAveragesForOneSeam;
  procedure ExportAveragesForAllSeams;

  procedure OpenAveragesDataSets;
  procedure CloseAveragesDataSets;
  procedure ExportAverages(SeamId, ConditionId: Integer);
  procedure FilterSeamConds(SeamId, ConditionId: Integer);
  procedure WriteAveragesHeader(Row: Integer);
  procedure WriteSeamName(Row: Integer);
  procedure WritePartName(Row: Integer);
  procedure WriteProjectionName(Row: Integer);
  procedure WriteSurveyLineName(Row: Integer);
  procedure WriteBlockUnitName(Row: Integer);
  procedure WriteSeams(var Row: Integer; SeamId, ConditionId: Integer);
  procedure WriteSeam(var Row: Integer);
  procedure WriteParts(var Row: Integer);
  procedure WriteBlocks(var Row: Integer);
  procedure WriteBlockUnits(var Row: Integer);
  procedure WriteBlockUnit(var Row: Integer);
  procedure WriteNumberToCell(Row, Col: Integer; Value: Real; NumberFormat: String; FontSize: Integer);
  procedure WriteStringToCell(Row, Col: Integer; Value: String; Bold: Boolean; FontSize: Integer);
  procedure WriteBlockSumms(Row: Integer);
  procedure WriteBlockCounts(Row: Integer);
  procedure WriteBlockAverages(Row: Integer);
  procedure CreateExcelApp(Template: String; Visible: Boolean);
  procedure fbrac(Worksheet: OleVariant; Row, Column: integer;
    Value: real; Digits: integer);
  procedure fbrac1(Worksheet: OleVariant; Row, Column: integer;
    Value: string);
  procedure DrawTableBorders(Sheet: Olevariant; rowfrom, rowto, columnfrom, columnto: integer);
  function ColName(Index: integer): string;
  procedure WriteBlockUnitValues(var Row: Integer);
  procedure WriteAverages(Row: Integer);

implementation
uses
  DMReservesUnit, DMReportsUnit;
var
  Excel: OleVariant;
  Worksheet: OleVariant;

procedure OpenAveragesDataSets;
begin
  DMReports.SeamConds.Active := True;
  DMReports.Parts.Active := True;
  DMReports.Blocks.Active := True;
  DMReports.BlockUnits.Active := True;
  DMReports.BlockCount.Active := True;
end;

procedure CloseAveragesDataSets;
begin
  DMReports.SeamConds.Active := False;
  DMReports.Blocks.Active := False;
  DMReports.BlockUnits.Active := False;
end;

procedure CreateExcelApp(Template: String; Visible: Boolean);
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.Application.EnableEvents := false;
  Excel.Workbooks.Add(GetCurrentDir + Template);
  WorkSheet := Excel.ActiveWorkbook.ActiveSheet;
  Excel.Visible := Visible;
end;

procedure ExportAveragesForAllSeams;
begin
  ExportAverages(-1, DMReserves.SeamConds.FieldByName('ConditionId').AsInteger);
end;

procedure ExportAveragesForOneSeam;
begin
  ExportAverages(DMReserves.SeamConds.FieldByName('SeamId').AsInteger,
    DMReserves.SeamConds.FieldByName('ConditionId').AsInteger);
end;

procedure ExportAverages(SeamId, ConditionId: Integer);
var
  Row: Integer;
begin
  CreateExcelApp('\Templates\Averages.xltx', True);
  WriteAveragesHeader(2);
  Row := 6;
  WriteSeams(Row, SeamId, ConditionId);
  DrawTableBorders(WorkSheet, 4, Row - 2, 1, 9);
  Excel.Visible := True;
  CloseAveragesDataSets;
  ShowMessage('Вывод завершен.');
end;

procedure WriteAverages(Row: Integer);
begin

end;

procedure WriteAveragesHeader(Row: Integer);
var
  Text: String;
begin
  Text := 'Расчет средних мощностей и зольностей' + #10 +
          'Вариант ' + IntToStr(DMReserves.SeamConds.FieldByName('N').Value) +
          '. (Мощность разделяющего прослоя ' + DMReserves.SeamConds.FieldByName('IbCond').Value + ' м' +
          '. Мощность пласта ' + DMReserves.SeamConds.FieldByName('ThCond').Value + ' м' +
          '. Зольность пласта ' + DMReserves.SeamConds.FieldByName('AshCond').Value + ' %.)';
  Worksheet.Cells[Row, 1].Font.Size := 11;
  Worksheet.Cells[Row, 1].Font.Bold := True;
  Worksheet.Cells[Row, 1] := Text;
end;

procedure WriteSeams(var Row: Integer; SeamId, ConditionId: Integer);
begin
  FilterSeamConds(SeamId, ConditionId);
  OpenAveragesDataSets;
  DMReports.SeamConds.First;
  while not DMReports.SeamConds.Eof do begin
    WriteSeam(Row);
    DMReports.SeamConds.Next;
  end;
end;

procedure FilterSeamConds(SeamId, ConditionId: Integer);
begin
  DMReports.SeamConds.Active := False;
  DMReports.SeamConds.Parameters.ParamByName('SeamId').Value := DMReserves.SeamConds.FieldByName('SeamId').Value;
  DMReports.SeamConds.Parameters.ParamByName('ConditionId').Value := DMReserves.SeamConds.FieldByName('ConditionId').Value;
  if SeamId < 0 then
    DMReports.SeamConds.Parameters.ParamByName('allseams').Value := 1
  else
    DMReports.SeamConds.Parameters.ParamByName('allseams').Value := 0;
end;

procedure WriteSeam(var Row: Integer);
var
  hs_comments: String;
begin
  DMReports.Parts.First;
  if not DMReports.Parts.Eof then begin
    WriteSeamName(Row);
    inc(Row);
    WriteParts(Row);
  end;
end;

procedure WriteSeamName(Row: Integer);
begin
  Worksheet.Range[Worksheet.Cells[Row, 1], Worksheet.Cells[Row, 9]].Merge;
  WriteStringToCell(Row, 1, 'Пласт ' + DMReports.SeamConds.FieldByName('seamname').AsString, True, 12);
end;

procedure WriteParts(var Row: Integer);
begin
  DMReports.Parts.First;
  while not DMReports.Parts.Eof do
  begin
    if DMReports.Blocks.RecordCount > 0 then
    begin
      WritePartName(Row);
      inc(Row);
      WriteProjectionName(Row);
      inc(Row);
      if DMReports.Blocks.RecordCount > 0 then
        WriteBlocks(Row);
    end;
    DMReports.Parts.Next;
  end;
end;

procedure WritePartName(Row: Integer);
begin
  Worksheet.Range[Worksheet.Cells[Row, 1], Worksheet.Cells[Row, 9]].Merge;
  WriteStringToCell(Row, 1, 'Деталь ' + DMReports.Parts.FieldByName('NPart').AsString +
      IfThen(DMReports.Parts.FieldByName('Description').AsString = '', '', ' (' +DMReports.Parts.FieldByName('Description').AsString + ')'), True, 12);
end;

procedure WriteProjectionName(Row: Integer);
begin
  Worksheet.Range[Worksheet.Cells[Row, 1], Worksheet.Cells[Row, 9]].Merge;
  if DMReports.Parts.FieldByName('Vertical').AsBoolean then WriteStringToCell(Row, 1, 'вертикальная проекция', True, 12)
    else WriteStringToCell(Row, 1, 'горизонтальная проекция', True, 12);
end;

procedure WriteBlocks(var Row: Integer);
var
  FirstRow: Integer;
  RowHeight, CommentHeight, CalcHeight: Real;
begin
  RowHeight := Worksheet.Cells[Row, 1].Height;
  DMReports.Blocks.First;
  while not DMReports.Blocks.Eof do
  begin
    FirstRow := Row;
    if DMReports.BlockUnits.RecordCount > 0 then
      WriteBlockUnits(Row);
    WriteBlockSumms(Row); Inc(Row);
    WriteBlockCounts(Row); Inc(Row);
    WriteBlockAverages(Row);

    if not DMReports.Blocks.FieldByName('Comments').isNull then
      Worksheet.Cells[Row, 9] := Trim(DMReports.Blocks.FieldByName('Comments').Value);

    CommentHeight := Worksheet.Cells[Row, 9].Height;
    Worksheet.Range[Worksheet.Cells[FirstRow,9], Worksheet.Cells[Row, 9]].Merge;
    CalcHeight := (Row - FirstRow) * RowHeight;
    if CommentHeight > CalcHeight then
      begin
        Worksheet.Range[Worksheet.Rows[FirstRow], Worksheet.Rows[Row]].Rowheight := CommentHeight/(Row - FirstRow + 1)
      end
    else
      begin
        Worksheet.Rows[Row].RowHeight := RowHeight;
      end;

    WriteStringToCell(Row, 1, Trim(DMReports.Blocks.FieldByName('BlockName').AsString), False, 11);
    Worksheet.Range[Worksheet.Cells[FirstRow,1], Worksheet.Cells[Row, 1]].Merge;
    Worksheet.Cells[Row, 2] := Trim(DMReports.Blocks.FieldByName('categoryname').Value);
    Worksheet.Range[Worksheet.Cells[FirstRow,2], Worksheet.Cells[Row, 2]].Merge;

    Inc(Row);
    Worksheet.Range[Worksheet.Cells[Row, 1], Worksheet.Cells[Row, 9]].Merge;
    Inc(Row);
    DMReports.Blocks.Next;
  end;
end;

procedure WriteBlockSumms(Row: Integer);
begin
  Worksheet.Cells[Row, 3] := 'Сумма'; Worksheet.Range[Worksheet.Cells[Row, 3], Worksheet.Cells[Row, 4]].Merge;
  Worksheet.Range[Worksheet.Cells[Row, 5], Worksheet.Cells[Row, 6]].NumberFormat := '0,00';
  Worksheet.Range[Worksheet.Cells[Row, 7], Worksheet.Cells[Row, 8]].NumberFormat := '0,0';

  if DMReports.Blocks.FieldByName('Sum_th_coal').IsNull then Worksheet.Cells[Row, 5] := '-' else
  Worksheet.Cells[Row, 5] := DMReports.Blocks.FieldByName('Sum_th_coal').AsFloat;

  if DMReports.Blocks.FieldByName('Sum_th_total').IsNull then Worksheet.Cells[Row, 6] := '-' else
  Worksheet.Cells[Row, 6] := DMReports.Blocks.FieldByName('Sum_th_total').AsFloat;

  if DMReports.Blocks.FieldByName('Sum_Ad_coal').IsNull then Worksheet.Cells[Row, 7] := '-' else
  Worksheet.Cells[Row, 7] := DMReports.Blocks.FieldByName('Sum_Ad_coal').AsFloat;

  if DMReports.Blocks.FieldByName('Sum_Ad_total').IsNull then Worksheet.Cells[Row, 8] := '-' else
  Worksheet.Cells[Row, 8] := DMReports.Blocks.FieldByName('Sum_Ad_total').AsFloat;
end;

procedure WriteBlockCounts(Row: Integer);
begin
    Worksheet.Cells[Row, 3] := 'Количество'; Worksheet.Range[Worksheet.Cells[Row, 3], Worksheet.Cells[Row, 4]].Merge;
    Worksheet.Range[Worksheet.Cells[Row, 5], Worksheet.Cells[Row, 6]].NumberFormat := '0';
    Worksheet.Range[Worksheet.Cells[Row, 7], Worksheet.Cells[Row, 8]].NumberFormat := '0';

    if DMReports.Blocks.FieldByName('Count_th_coal').IsNull then Worksheet.Cells[Row, 5] := '-' else
    Worksheet.Cells[Row, 5] := DMReports.Blocks.FieldByName('Count_th_coal').Value;

    if DMReports.Blocks.FieldByName('Count_th_total').IsNull then Worksheet.Cells[Row, 6] := '-' else
    Worksheet.Cells[Row, 6] := DMReports.Blocks.FieldByName('Count_th_total').Value;

    if DMReports.Blocks.FieldByName('Count_Ad_coal').IsNull then Worksheet.Cells[Row, 7] := '-' else
    Worksheet.Cells[Row, 7] := DMReports.Blocks.FieldByName('Count_Ad_coal').Value;

    if DMReports.Blocks.FieldByName('Count_Ad_total').IsNull then Worksheet.Cells[Row, 8] := '-' else
    Worksheet.Cells[Row, 8] := DMReports.Blocks.FieldByName('Count_Ad_total').Value;
end;

procedure WriteBlockAverages(Row: Integer);
begin
  Worksheet.Cells[Row, 3] := 'Среднее'; Worksheet.Range[Worksheet.Cells[Row, 3], Worksheet.Cells[Row, 4]].Merge;
  Worksheet.Range[Worksheet.Cells[Row, 5], Worksheet.Cells[Row, 6]].NumberFormat := '0,00';
  Worksheet.Range[Worksheet.Cells[Row, 7], Worksheet.Cells[Row, 8]].NumberFormat := '0,0';

  if DMReports.Blocks.FieldByName('ThCoal').IsNull then Worksheet.Cells[Row, 5] := '-' else
  Worksheet.Cells[Row, 5] := DMReports.Blocks.FieldByName('ThCoal').AsFloat;

  if DMReports.Blocks.FieldByName('ThFull').IsNull then Worksheet.Cells[Row, 6] := '-' else
  Worksheet.Cells[Row, 6] := DMReports.Blocks.FieldByName('ThFull').AsFloat;

  if DMReports.Blocks.FieldByName('AdCoal').IsNull then Worksheet.Cells[Row, 7] := '-' else
  Worksheet.Cells[Row, 7] := DMReports.Blocks.FieldByName('AdCoal').AsFloat;

  if DMReports.Blocks.FieldByName('AdFull').IsNull then Worksheet.Cells[Row, 8] := '-' else
  Worksheet.Cells[Row, 8] := DMReports.Blocks.FieldByName('AdFull').AsFloat;
end;

procedure WriteBlockUnits(var Row: Integer);
begin
  DMReports.BlockUnits.First;
  while not DMReports.BlockUnits.Eof do
  begin
    WriteBlockUnit(Row);
    Row := Row + 1;
    DMReports.BlockUnits.Next;
  end;
end;

procedure WriteNumberToCell(Row, Col: Integer; Value: Real; NumberFormat: String; FontSize: Integer);
begin
  Worksheet.Cells[Row, Col].Font.Size := FontSize;
  Worksheet.Cells[Row, Col].NumberFormat := NumberFormat;
  Worksheet.Cells[Row, Col] := Value;
end;

procedure WriteBlockUnit(var Row: Integer);
begin
  WriteSurveyLineName(Row);
  WriteBlockUnitName(Row);
  WriteBlockUnitValues(Row);
end;


procedure WriteBlockUnitValues(var Row: Integer);
begin
  if DMReports.BlockUnits.FieldByName('ThCoal').IsNull then
    Worksheet.Cells[Row, 5] := '-'
  else
    WriteNumberToCell(Row, 5, DMReports.BlockUnits.FieldByName('ThCoal').AsFloat, '0,00', 11);

  if DMReports.BlockUnits.FieldByName('ThFull').IsNull then
    Worksheet.Cells[Row, 6] := '-'
  else
    WriteNumberToCell(Row, 6, DMReports.BlockUnits.FieldByName('ThFull').AsFloat, '0,00', 11);

  if DMReports.BlockUnits.FieldByName('AdCoal').IsNull then
    Worksheet.Cells[Row, 7] := '-'
  else
    WriteNumberToCell(Row, 7, DMReports.BlockUnits.FieldByName('AdCoal').AsFloat, '0,0', 11);

  if DMReports.BlockUnits.FieldByName('AdFull').IsNull then
    Worksheet.Cells[Row, 8] := '-'
  else
    WriteNumberToCell(Row, 8, DMReports.BlockUnits.FieldByName('AdFull').AsFloat, '0,0', 11);
end;

procedure WriteSurveyLineName(Row: Integer);
begin
  if not (DMReports.BlockUnits.FieldByName('LineName').IsNull or (DMReports.BlockUnits.FieldByName('LineName').Value = '')) then
    WriteStringToCell(Row, 3, DMReports.BlockUnits.FieldByName('LineName').AsString, False, 11);
end;

procedure WriteBlockUnitName(Row: Integer);
begin
  if not (DMReports.BlockUnits.FieldByName('HoleName').IsNull or (DMReports.BlockUnits.FieldByName('HoleName').AsString = '')) then
      WriteStringToCell(Row, 4, DMReports.BlockUnits.FieldByName('HoleName').AsString + '  ' +
          Trim(DMReports.BlockUnits.FieldByName('Comments').AsString) + ' ' +
          IfThen(DMReports.BlockUnits.FieldByName('HsComments').IsNull, '', Trim(DMReports.BlockUnits.FieldByName('HsComments').AsString)),
          False, 11)
  else
    begin
      Worksheet.Range[Worksheet.Cells[Row, 3], Worksheet.Cells[Row, 4]].Merge;
      Worksheet.Cells[Row, 3] := DMReports.BlockUnits.FieldByName('Comments').AsString;
    end;
end;

procedure WriteStringToCell(Row, Col: Integer; Value: String; Bold: Boolean; FontSize: Integer);
begin
  Worksheet.Cells[Row, Col].Font.Size := FontSize;
  Worksheet.Cells[Row, Col].Font.Bold := Bold;
  Worksheet.Cells[Row, Col] := Value;
end;

procedure DrawTableBorders(Sheet: Olevariant; rowfrom, rowto,
  columnfrom, columnto: integer);
begin
  Sheet.Range[Sheet.Cells[rowfrom, columnfrom], Sheet.Cells[rowto, columnto]].Borders[1].LineStyle := 0;
  Sheet.Range[Sheet.Cells[rowfrom, columnfrom], Sheet.Cells[rowto, columnto]].Borders[1].Weight := 2;
  Sheet.Range[Sheet.Cells[rowfrom, columnfrom], Sheet.Cells[rowto, columnto]].Borders[2].LineStyle := 0;
  Sheet.Range[Sheet.Cells[rowfrom, columnfrom], Sheet.Cells[rowto, columnto]].Borders[2].Weight := 2;
  Sheet.Range[Sheet.Cells[rowfrom, columnfrom], Sheet.Cells[rowto, columnto]].Borders[3].LineStyle := 0;
  Sheet.Range[Sheet.Cells[rowfrom, columnfrom], Sheet.Cells[rowto, columnto]].Borders[3].Weight := 2;
  Sheet.Range[Sheet.Cells[rowfrom, columnfrom], Sheet.Cells[rowto, columnto]].Borders[4].LineStyle := 0;
  Sheet.Range[Sheet.Cells[rowfrom, columnfrom], Sheet.Cells[rowto, columnto]].Borders[4].Weight := 2;
end;

function ColName(Index: integer): string;
begin
    Result := EmptyStr;
    repeat
      Dec(Index);
      Result := Char(65 + Index mod 26) + Result;
      Index := Index div 26;
    until Index < 1;
end;

procedure fbrac(Worksheet: OleVariant; Row, Column: integer;
  Value: real; Digits: integer);
begin
  if Value < 0 then Worksheet.Cells[Row, Column] := FloatToStrF(abs(Value), ffFixed, 10, Digits) + '*'
  else Worksheet.Cells[Row, Column] := Value;
end;

procedure fbrac1(Worksheet: OleVariant; Row, Column: integer;
  Value: string);
begin
  Worksheet.Cells[Row, Column] := StringReplace(Value, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]) + ' ';
end;


end.
