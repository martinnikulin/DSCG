unit ImporterUnit1;

interface
uses
  Classes, SysUtils, Dialogs, ADODB, Vcl.Controls,
  DMUnit, DMImporterUnit;


type
  TImporter = class
  private
    FTableType: TImportType;
    procedure ImportReservesSeams();
    procedure ImportReserves();
    procedure CreateReservesTempTables();
    procedure DoImportReserves();
    procedure RepairReservesTempTables();
    procedure CheckReservesTempTables();
    procedure ImportReservesBoreholes();
    procedure ImportReservesLines();
    procedure ImportReservesLineHoles;
    procedure ImportReservesCoalTypes;
    procedure ImportReservesCoalRanks;

    procedure ImportAssays();
    procedure CreateAssaysTempTable();
    procedure CheckAssaysTempTable();
    procedure DoImportAssays();
    procedure ImportAssaysSamples;
    procedure ImportAssaysAssays;
    procedure ProcessErrors();
  public
    ErrorsList: TStringList;
    Messages: TStrings;
    constructor Create(TableType: TImportType);
    destructor Destroy(); override;
    procedure ImportTable();
  end;

implementation

{ TImporter }

constructor TImporter.Create(TableType: TImportType);
begin
  ImportPath := 'C:\DSCG';
  FTableType := TableType;
  Messages := TStringList.Create;
end;

destructor TImporter.Destroy;
begin
  Tasks.Free;
  inherited;
end;

procedure TImporter.ImportTable();
begin
  case FTableType of
    ttAssays: ImportAssays;
    ttReserves: ImportReserves;
  end;
end;

procedure TImporter.ImportAssays;
begin
  CreateAssaysTempTable;
  CheckAssaysTempTable;
  if ErrorsList.Count > 0 then
    ProcessErrors
  else
    DoImportAssays;
end;

procedure TImporter.CreateAssaysTempTable;
begin
  InitCommands(ttAssays, ttCreateTempTable);
  DM.DoSQLStatements((Tasks.Objects[0] as TStringList));
end;

procedure TImporter.CheckAssaysTempTable;
var
  i: Integer;
begin
  InitCommands(ttAssays, ttCheckTempTable);
  ErrorsList := TStringList.Create;
  for i := 0 to Tasks.Count - 1 do
  begin
    ErrorsList := GetErrors(i);
    if ErrorsList.Count > 0 then
      ErrorsList.AddPair(Tasks[i], i.ToString, ErrorsList);
  end;
end;

procedure TImporter.DoImportAssays;
begin
  ImportAssaysSamples;
  ImportAssaysAssays;
end;

procedure TImporter.ImportAssaysSamples;
var
  SQL: String;
begin
  try
    SQL :=  'with q1 as ( ' +
            'select		distinct ' +
            '      bh.BoreholeId, ' +
            '      DepthFrom, ' +
            '      DepthTo, ' +
            '      NSample ' +
            'from		TempTable1 t ' +
            'inner join	Boreholes bh on bh.HoleName = t.HoleName ' +
            ') ' +
            'insert into SampleDefs (BoreholeId, DepthFrom, DepthTo, NSample) ' +
            'select		q1.BoreholeId, q1.DepthFrom, q1.DepthTo, q1.NSample ' +
            'from		q1 ' +
            'left join	SampleDefs sd on ' +
            '      sd.BoreholeId = q1.BoreholeId ' +
            '      and sd.DepthFrom = q1.DepthFrom ' +
            '      and sd.DepthTo = q1.DepthTo ' +
            '      and sd.NSample = q1.NSample ' +
            'where		sd.SampleId is null';
    DM.DoSQLStatements(SQL);
    ////DM.SetTableToRequery('Boreholes', 'Seams', 0);
  except
    Messages.Add('Анализы не импортированы')
  end;
end;

procedure TImporter.ImportAssaysAssays;
var
  SQL: String;
begin
  try
    SQL :=  'with q1 as ( ' +
            'select		sd.SampleId, ' +
            '      t.VarId, ' +
            '      REPLACE(t.Val, ''.'', '','') as Val ' +
            'from		TempTable1 t ' +
            'inner join	Boreholes bh on bh.HoleName = t.HoleName ' +
            'inner join	SampleDefs sd on ' +
            '      sd.BoreholeId = bh.BoreholeId ' +
            '      and sd.DepthFrom = t.DepthFrom ' +
            '      and sd.DepthTo = t.DepthTo ' +
            '      and (sd.NSample = t.NSample or t.NSample is null) ' +
            ') ' +
            'insert into Assays (SampleId, VarId, Val) ' +
            'select		q1.SampleId, q1.VarId, q1.Val ' +
            'from		q1 ' +
            'left join	Assays a on ' +
            '      a.SampleId = q1.SampleId ' +
            '      and a.VarId = q1.VarId ' +
            'where		a.SampleId is null';
    DM.DoSQLStatements(SQL);
    Messages.Add('Анализы импортированы')
    ////DM.SetTableToRequery('Boreholes', 'Seams', 0);
  except
    Messages.Add('Анализы не импортированы')
  end;
end;

procedure TImporter.ImportReserves;
begin
//  CreateReservesTempTables;
//  RepairReservesTempTables;
  CheckReservesTempTables;
  if ErrorsList.Count > 0 then
    ProcessErrors
//  else
//    DoImportReserves;
end;

procedure TImporter.ProcessErrors;
var
  i, j: Integer;
  Errors: TStrings;
  VarName, VarNames: String;
begin
  for i := 0 to ErrorsList.Count - 1 do
  begin
    Errors := (ErrorsList.Objects[i] as TStrings);
    if Errors.Count > 0 then
    begin
       Messages.Add(ErrorsList.Names[0]);
      for j := 0 to Errors.Count - 1 do
      begin
        Messages.Add((j + 1).ToString + '. ' + Errors[j]);
      end;
    end;
  end;
end;

procedure TImporter.CreateReservesTempTables;
begin
  InitCommands(ttReserves, ttCreateTempTable);
  DM.DoSQLStatements((Tasks.Objects[0] as TStringList));
end;

procedure TImporter.RepairReservesTempTables;
begin
  InitCommands(ttReserves, ttRepairTempTable);
  DM.DoSQLStatements((Tasks.Objects[0] as TStrings));
end;

procedure TImporter.CheckReservesTempTables;
var
  i: Integer;
  Errors: TStrings;
begin
  InitCommands(ttReserves, ttCheckTempTable);
  ErrorsList := TStringList.Create;
  for i := 0 to Tasks.Count - 1 do
  begin
    Errors := GetErrors(i);
    if Errors.Count > 0 then
      ErrorsList.AddPair(Tasks[i], i.ToString, Errors);
  end;
end;

procedure TImporter.DoImportReserves;
begin
//  ImportReservesSeams;
//  ImportReservesBoreholes;
//  ImportReservesLines;
//  ImportReservesLineHoles;
//  ImportReservesCoalTypes;
//  ImportReservesCoalRanks;
end;

procedure TImporter.ImportReservesSeams;
var
  SQL: String;
begin
  try
    SQL :=  'with q1 as ( ' +
            'select		distinct SeamName ' +
            'from		TempTable1 t ' +
            'left join	Seams s on s.Description = t.SeamName ' +
            'where		s.SeamId is null ' +
            ') ' +
            'insert into Seams([Description], ShortName) ' +
            'select		SeamName as [Description], SeamName as ShortName ' +
            'from		q1';
    DM.DoSQLStatements(SQL);
    Messages.Add('Пласты импортированы');
    ////DM.SetTableToRequery('Boreholes', 'Seams', 0);
  except
    Messages.Add('Пласты не импортированы')
  end;
end;

procedure TImporter.ImportReservesBoreholes;
var
  SQL: String;
begin
  try
    SQL :=  'with q1 as ( ' +
            'select		distinct t.HoleName ' +
            'from		TempTable1 t ' +
            'left join	Boreholes bh on bh.HoleName = t.HoleName ' +
            'where		bh.BoreholeId is null ' +
            ') ' +
            'insert into	Boreholes(HoleName, X, Y, Z, Depth) ' +
            'select		HoleName, 0, 0, 0, 0 ' +
            'from		q1';
    DM.DoSQLStatements(SQL);
    Messages.Add('Скважины импортированы');
    //DM.SetTableToRequery('Boreholes', 'Boreholes', 0);
  except
    Messages.Add('Скважины не импортированы')
  end;
end;

procedure TImporter.ImportReservesLines;
var
  SQL: String;
begin
  try
    SQL :=  'with q1 as ( ' +
            'select		distinct LineName ' +
            'from		TempTable1 t ' +
            'left join	Lines l on l.Description = t.LineName ' +
            'where		l.LineId is null ' +
            ') ' +
            'insert into Lines([Description]) ' +
            'select		LineName ' +
            'from		q1';
    DM.DoSQLStatements(SQL);
    //DM.SetTableToRequery('Boreholes', 'Lines', 0);
  except
    Messages.Add('Разведочные линии не импортированы')
  end;
end;

procedure TImporter.ImportReservesLineHoles;
var
  SQL: String;
begin
  try
    SQL :=  'insert into LineHoles (LineId, BoreholeId) ' +
            'select		distinct LineId, BoreholeId ' +
            'from		TempTable1 t1 ' +
            'inner join	Boreholes bh on bh.HoleName = t1.HoleName ' +
            'inner join	Lines l on l.Description = t1.LineName';
    DM.DoSQLStatements(SQL);
    Messages.Add('Разведочные линии импортированы');
    //DM.SetTableToRequery('Boreholes', 'LineHoles', 0);
  except
    Messages.Add('Разведочные линии не импортированы')
  end;
end;

procedure TImporter.ImportReservesCoalRanks;
var
  SQL: String;
begin
  try
    SQL :=  'with q1 as ( ' +
            'select		distinct CoalRankName as CoalRank ' +
            'from		TempTable2 t2 ' +
            'left join	Dictionary d on ' +
            '      d.Description = t2.CoalRankName ' +
            'where		d.DictionaryId is null ' +
            ') ' +
            'insert into Dictionary(Type, Section, N, Description) ' +
            'select		''var'' as Type, ''марка'' as Section, ROW_NUMBER() over(order by CoalRank) as N, CoalRank ' +
            'from		q1 ' +
            'where		not CoalRank is null';
    DM.DoSQLStatements(SQL);
    Messages.Add('Типы угля импортированы');
  except
    Messages.Add('Типы угля не импортированы')
  end;
end;

procedure TImporter.ImportReservesCoalTypes;
var
  SQL: String;
begin
  try
    SQL :=  'with q1 as ( ' +
            'select		distinct CoalTypeName ' +
            'from		TempTable2 t2 ' +
            'left join	Dictionary d on ' +
            '      d.Description = t2.CoalTypeName ' +
            'where		d.DictionaryId is null ' +
            ') ' +
            'insert into Dictionary(Type, Section, N, Description) ' +
            'select		''var'' as Type, ''тип угля'' as Section, ROW_NUMBER() over(order by CoalTypeName) as N, CoalTypeName ' +
            'from		q1 ' +
            'where		not CoalTypeName is null';
    DM.DoSQLStatements(SQL);
    Messages.Add('Марки импортированы');
  except
    Messages.Add('Марки не импортированы')
  end;
end;

end.
