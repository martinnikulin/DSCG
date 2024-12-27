unit ImporterUnit;

interface
uses
  DMUnit, Classes, Dialogs, ComObj, Variants, SysUtils, ADODB, Generics.Collections;

type
  TImporter = class
  private
    ExcelApp: OleVariant;
    FTableType: TTableType;
    FValues: String;
    FColumnDefs: TStringList;
    FNCols: Integer;
    ExcelTableDef: TTableDef;
    ImportDoneMsg: String;
    function OpenWorkSheet(FileName: String): OleVariant;
    function GetNotExistentRecords(CommandName, FieldName: String): String;
    function GetSQLStatements(CommandName, Values: String): TStrings;
    function GetRowString(NCols: Integer): String;
    function ReadExcelValues(FileName: String; NCols: Integer): String;
    procedure PrepareTempTable;
    procedure CheckTempTable;
    procedure ReplaceRecords;
    procedure UpdateRecords;
    procedure CalcCoords;
    procedure InitImport(TableType: TTableType);
  public
    constructor Create(TableType: TTableType);
    procedure ImportTable(FileName: String);
  end;

implementation

uses
  MessengerUnit;
{ TImporter }

constructor TImporter.Create(TableType: TTableType);
begin
  InitImport(TableType);
  DM.SQLCommands.Parameters.ParamByName('Section').Value := ExcelTableDef.ImportType;
  DM.SQLCommands.Active := True;
  DM.SQLCommands.Requery();
  FTableType := TableType;
  FNCols := ExcelTableDef.NCols;
  FColumnDefs := ExcelTableDef.ColumnDefs;
end;

procedure TImporter.ImportTable(FileName: String);
begin
  try
    FValues := ReadExcelValues(FileName, FNCols);
    if FValues <> '' then begin
      PrepareTempTable;
      CheckTempTable;
      ReplaceRecords;
      CalcCoords;
      DM.SQLCommands.Active := False;
      Messenger.SendMessage('Importer', 'Main', 'Text', ImportDoneMsg);
    end
    else
      Messenger.SendMessage('Importer', 'Main', 'Text', 'В файле Excel отсутствуют записи.');
  except
    on E: Exception do
    Messenger.SendMessage('Importer', 'Main', 'Text', E.Message + '. Импорт не удался.');
  end;
end;

procedure TImporter.ReplaceRecords;
begin
  DM.DoSQLStatements(GetSQLStatements('Insert', ''));
end;

procedure TImporter.UpdateRecords;
begin
  DM.DoSQLStatements(GetSQLStatements('Update', ''));
end;

procedure TImporter.PrepareTempTable;
var
  Statements: TStrings;
begin
  DM.DoSQLStatements(GetSQLStatements('Create TempTable', ''));
  DM.DoSQLStatements(GetSQLStatements('Fill TempTable', FValues));
  Statements := GetSQLStatements('Calc TempTable', '');
  if Statements.Count > 0 then
    DM.DoSQLStatements(Statements);
end;


procedure TImporter.CheckTempTable;
var
  BoreholesList, RocksList, Errors: String;
begin
  if (FTableType = ttLithology) or (FTableType = ttSurvey) then begin
    BoreholesList := GetNotExistentRecords('Check Boreholes', 'holename');
    if BoreholesList <> '' then
      Errors := 'Эти скважины отсутствуют в базе данных: ' + BoreholesList + '. ';
  end;
  if FTableType = ttLithology then begin
    RocksList := GetNotExistentRecords('Check Rocks', 'RockId');
    if RocksList <> '' then
      Errors := Errors + 'Породы с этими кодами отсутствуют в базе данных: ' + RocksList;
  end;
  if Errors <> '' then
    raise Exception.Create(Errors);
end;

function TImporter.GetSQLStatements(CommandName, Values: String): TStrings;
begin
  Result := TStringList.Create;
  DM.SQLCommands.Parameters.ParamByName('CommandName').Value := CommandName;
  DM.SQLCommands.Requery();
  while not DM.SQLCommands.Eof do begin
    Result.Add(DM.SQLCommands.FieldByName('CommandText').AsString + Values);
    DM.SQLCommands.Next;
  end;
end;

function TImporter.GetNotExistentRecords(CommandName, FieldName: String): String;
var
  SQLStrings: TStrings;
  Query: TADOQuery;
  Values: String;
begin
  SQLStrings := GetSQLStatements(CommandName, '');
  Query := DM.DoSQLQuery(SQLStrings);
  if Query.RecordCount <> 0 then begin
    Query.First;
    while not Query.Eof do begin
      Values := Values + ', ' + Query.Fields.FieldByName(FieldName).AsString;
      Query.Next;
    end;
    Result := Copy(Values, 3, MaxInt);
  end;
end;

function TImporter.GetRowString(NCols: Integer): String;
var
  i: Integer;
  ValueString: String;
  Value: Real;
begin
  Result := QuotedStr(DM.ExcelTable.Fields[0].AsString);
  for i := 1 to NCols - 1 do begin
    ValueString := DM.ExcelTable.Fields[i].AsString;
    if ValueString = '' then
      ValueString := 'NULL'
    else begin
      if ExcelTableDef.ColumnDefs[i] = 'number' then
        Value := StrToFloat(ValueString);
      if ExcelTableDef.ColumnDefs[i] = 'text' then
        ValueString := QuotedStr(Trim(ValueString));
    end;
    Result := Result + ', ' + StringReplace(ValueString, ',', '.', [rfReplaceAll]);
  end;
  Result := '(' + Result + ')';
end;

function TImporter.ReadExcelValues(FileName: String; NCols: Integer): String;
begin
  try
    DM.OpenExcelTable(FileName);
    DM.ExcelTable.First;
    while not DM.ExcelTable.Eof do begin
      if DM.ExcelTable.Fields[0].AsString = '' then
        Break;
      Result := Result + ', ' + GetRowString(NCols);
      DM.ExcelTable.Next;
    end;
    Result := Copy(Result, 3, MaxInt);
  finally
    DM.ExcelConnection.Connected := False;
  end;
end;

function TImporter.OpenWorkSheet(FileName: String): OleVariant;
var
  Workbook: OleVariant;
begin
  ExcelApp := CreateOleObject('Excel.Application');
  Workbook := ExcelApp.Workbooks.Open(FileName);
  Result := ExcelApp.ActiveWorkbook.Sheets.Item[1];
end;

procedure TImporter.CalcCoords;
begin
  DM.DoSQLStatements('exec CalcCoords 0');
end;

procedure TImporter.InitImport(TableType: TTableType);
begin
  if TableType = ttBoreholes then begin
    ExcelTableDef.ImportType := 'Import Boreholes';
    ExcelTableDef.NCols := 6;
    ExcelTableDef.ColumnDefs := TStringList.Create;
    ExcelTableDef.ColumnDefs.CommaText := 'text, number, number, number, number, text';
    ImportDoneMsg := 'Импорт скважин завершен.';
  end;
  if TableType = ttSurvey then begin
    ExcelTableDef.ImportType := 'Import Survey';
    ExcelTableDef.NCols := 4;
    ExcelTableDef.ColumnDefs := TStringList.Create;
    ExcelTableDef.ColumnDefs.CommaText := 'text, number, number, number';
    ImportDoneMsg := 'Импорт инклинометрии завершен.';
  end;
  if TableType = ttLithology then begin
    ExcelTableDef.ImportType := 'Import Lithology';
    ExcelTableDef.NCols := 9;
    ExcelTableDef.ColumnDefs := TStringList.Create;
    ExcelTableDef.ColumnDefs.CommaText := 'text, number, number, number, number, number, number, number, number';
    ImportDoneMsg := 'Импорт литологии завершен.';
  end;
end;

end.
