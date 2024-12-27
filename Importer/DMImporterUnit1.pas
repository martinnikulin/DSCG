unit DMImporterUnit;

interface
uses
  System.Classes, SysUtils, ADODB, DMUnit;

type
  TTask = (ttCreateTempTable = 1, ttRepairTempTable = 2, ttCheckTempTable = 3, ttImportTempTempTable = 4);

type
  TCheckArgs = record
    Section: String;
    FieldName: String;
    Msg: String;
  end;

  function GetErrors(Index: Integer): TStringList;
  procedure InitCommands(TableType: TImportType; TaskType: TTask);

var
  ImportPath: String;
  Tasks: TStringList;
  Checks: array[1..10] of TCheckArgs;

implementation


function GetErrors(Index: Integer): TStringList;
var
  Query: TADOQuery;
  Values: String;
begin
  Result := TStringList.Create;
  Query := DM.DoSQLQuery((Tasks.Objects[Index] as TStrings));
  if Query.RecordCount <> 0 then begin
    Query.First;
    while not Query.Eof do begin
      Result.Add(Query.Fields.FieldByName('VarName').AsString);
      Query.Next;
    end;
  end;
end;

procedure InitCommands(TableType: TImportType; TaskType: TTask);
var
  SQLCommands: TStrings;
  t1, t2, f1, f2: String;
begin
  Tasks := TStringList.Create;
  if TableType = ttReserves then
  begin
    if TaskType = ttCreateTempTable then
    begin
      //Create TempTables
      SQLCommands := TStringList.Create;
      SQLCommands.Add('if object_id(''dbo.TempTable1'') is not null drop table dbo.TempTable1');
      SQLCommands.Add('create table dbo.TempTable1(' +
                      'Id int not null primary key identity,' +
                      'SeamName nvarchar(50),' +
                      'Variant int,' +
                      'BlockName nvarchar(5),' +
                      'CategoryName nvarchar(5),' +
                      'CoalTypeName nvarchar(20),' +
                      'CoalRankName nvarchar(5),' +
                      'LineName nvarchar(50),' +
                      'HoleName nvarchar(10),' +
                      'ThCoal numeric(18, 2),' +
                      'ThFull numeric(18, 2),' +
                      'AdCoal numeric(18, 1),' +
                      'AdFull numeric(18, 1),' +
                      'Comments nvarchar(max));');
      t1 := ImportPath + '\HoleSeams.csv';
      f1 := ImportPath + '\HoleSeams.fmt';
      SQLCommands.Add('insert into TempTable1 (SeamName, Variant, BlockName, CategoryName, CoalTypeName, CoalRankName, LineName, HoleName, ThCoal, ThFull, AdCoal, AdFull, Comments) ' +
                      'select SeamName, Variant, BlockName, CategoryName, CoalTypeName, CoalRankName, LineName, HoleName, ThCoal, ThFull, AdCoal, AdFull, Comments ' +
                      'from openrowset(bulk ' + QuotedStr(t1) + ', formatfile = ' + QuotedStr(f1) + ', firstrow = 2) t ' +
                      'where not SeamName is null');
//                      'from openrowset(bulk ''C:\Users\Administrator\Documents\MEGA\DSCG\Blocks.csv'', formatfile = ''C:\Users\Administrator\Documents\MEGA\DSCG\Blocks.fmt'', firstrow = 2) t  ' +
//                      'from openrowset(bulk ''C:\Users\Administrator\Documents\MEGA\DSCG\Blocks.csv'', formatfile = ''C:\Users\Administrator\Documents\MEGA\DSCG\Blocks.fmt'', firstrow = 2) t  ' +


      SQLCommands.Add('if object_id(''dbo.TempTable2'') is not null drop table dbo.TempTable2');
      SQLCommands.Add('create table dbo.TempTable2(' +
      	              'Id int not null primary key identity,' +
                      'SeamName nvarchar(50),' +
                      'Variant int,' +
                      'BlockName nvarchar(5),' +
                      'Balance nvarchar(5),' +
                      'Pillar nvarchar(50),' +
                      'Boundary nvarchar(5),' +
                      'CategoryName nvarchar(5),' +
                      'CoalTypeName nvarchar(20),' +
                      'CoalRankName nvarchar(5),' +
                      'Area numeric(18, 2),' +
                      'Dip numeric(18, 2),' +
                      'ThCoal numeric(18, 2),' +
                      'DdaCoal numeric(18, 2),' +
                      'ThFull numeric(18, 2),' +
                      'DdaFull numeric(18, 2));');
      t2 := ImportPath + '\Blocks.csv';
      f2 := ImportPath + '\Blocks.fmt';
      SQLCommands.Add('insert into TempTable2(SeamName, Variant, BlockName, Balance, Pillar, Boundary, CategoryName, CoalTypeName, CoalRankName, Area, Dip, ThCoal, DdaCoal, ThFull, DdaFull)  ' +
                      'select SeamName, Variant, BlockName, Balance, Pillar, Boundary, CategoryName, CoalTypeName, CoalRankName, Area, Dip, ThCoal, DdaCoal, ThFull, DdaFull ' +
                      'from openrowset(bulk ' + QuotedStr(t2) +', formatfile = ' + QuotedStr(f2) + ', firstrow = 2) t  ' +
                      'where not SeamName is null');
///                      'from openrowset(bulk ''C:\Users\Administrator\Documents\MEGA\DSCG\Blocks.csv'', formatfile = ''C:\Users\Administrator\Documents\MEGA\DSCG\Blocks.fmt'', firstrow = 2) t  ' +
//                      'from openrowset(bulk ''C:\Users\Administrator\Documents\MEGA\DSCG\Blocks.csv'', formatfile = ''C:\Users\Administrator\Documents\MEGA\DSCG\Blocks.fmt'', firstrow = 2) t  ' +

      Tasks.AddObject('CreateTempTables', SQLCommands);
    end;
    if TaskType = ttRepairTempTable then
    begin
      //Repair TempTables
      SQLCommands := TStringList.Create;
      SQLCommands.Add('update TempTable1 set CategoryName = ''A''  where Trim(CategoryName) = ''А''; ' +
                      'update TempTable1 set CategoryName = ''B''  where Trim(CategoryName) = ''В''; ' +
                      'update TempTable1 set CategoryName = ''C1'' where Trim(CategoryName) = ''С1''; ' +
                      'update TempTable1 set CategoryName = ''C2'' where Trim(CategoryName) = ''С2''; ' +
                      'update TempTable1 set CategoryName = ''P1'' where Trim(CategoryName) = ''Р1''; ' +
                      'update TempTable1 set CategoryName = ''P2'' where Trim(CategoryName) = ''Р2'';');
      SQLCommands.Add('update TempTable2 set CategoryName = ''A''  where Trim(CategoryName) = ''А''; ' +
                      'update TempTable2 set CategoryName = ''B''  where Trim(CategoryName) = ''В''; ' +
                      'update TempTable2 set CategoryName = ''C1'' where Trim(CategoryName) = ''С1''; ' +
                      'update TempTable2 set CategoryName = ''C2'' where Trim(CategoryName) = ''С2''; ' +
                      'update TempTable2 set CategoryName = ''P1'' where Trim(CategoryName) = ''Р1''; ' +
                      'update TempTable2 set CategoryName = ''P2'' where Trim(CategoryName) = ''Р2'';');
      SQLCommands.Add('update	TempTable1 set ' +
                      'SeamName = Trim(SeamName), ' +
                      'BlockName = Trim(BlockName), ' +
                      'CoalTypeName = Trim(CoalTypeName), ' +
                      'CoalRankName = Trim(CoalRankName), ' +
                      'LineName = Trim(LineName), ' +
                      'HoleName = Trim(HoleName);');
      SQLCommands.Add('update	TempTable2 set ' +
                      'SeamName = Trim(SeamName), ' +
                      'BlockName = Trim(BlockName), ' +
                      'CoalTypeName = Trim(CoalTypeName), ' +
                      'CoalRankName = Trim(CoalRankName); ');
      Tasks.AddObject('RepairTempTables', SQLCommands);
    end;
    if TaskType = ttCheckTempTable then
    begin
      //Проверка TempTables
      //Проверка на согласованность между файлами импорта ----------------------------------------------------------

      //0. Пласты в Средних, которых нет в Запасах
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct t1.SeamName as VarName ' +
                      'from		TempTable1 t1 ' +
                      'left join	TempTable2 t2 on t1.SeamName = t2.SeamName ' +
                      'where		t2.SeamName is null');
      Tasks.AddObject('Пласты в Средних, которых нет в Запасах', SQLCommands);

      //1. Пласты в Запасах, которых нет в Средних
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct t2.SeamName as VarName ' +
                      'from		TempTable2 t2 ' +
                      'left join	TempTable1 t1 on t1.SeamName = t2.SeamName ' +
                      'where		t1.SeamName is null');
      Tasks.AddObject('Пласты в Запасах, которых нет в Средних', SQLCommands);

      //2. Блоки в Средних, которых нет в Запасах
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'select	distinct t1.SeamName + '':  ''  + t1.BlockName as VarName ' +
                      'from		TempTable1 t1 ' +
                      'left join	TempTable2 t2 on ' +
                      't1.SeamName = t2.SeamName and ' +
                      't1.BlockName = t2.BlockName COLLATE Cyrillic_General_100_CS_AS ' +
                      'where		t2.SeamName is null '
                      );
      Tasks.AddObject('Блоки в Запасах, которых нет в Средних', SQLCommands);

      //3. Блоки в Запасах, которых нет в Средних
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'select	distinct t2.SeamName + '':  ''  + t2.BlockName as VarName ' +
                      'from		TempTable2 t2 ' +
                      'left join	TempTable1 t1 on ' +
                      't1.SeamName = t2.SeamName and ' +
                      't1.BlockName = t2.BlockName COLLATE Cyrillic_General_100_CS_AS ' +
                      'where		t1.SeamName is null '
                      );
      Tasks.AddObject('Блоки в Средних, которых нет в Запасах', SQLCommands);

      //4. Марки, содержащие символы латиницы в Средних
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'select		distinct CoalRankName ' +
                      'from		TempTable1 ' +
                      'where		CoalRankName like N''%[A-HJ-Za-z]%'' and not CoalRankName like N''%I%'''
                      );
      Tasks.AddObject('Марки, содержащие символы латиницы в Средних', SQLCommands);

      //5. Марки, содержащие символы латиницы в Запасах
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'select		distinct CoalRankName as VarName ' +
                      'from		TempTable2 ' +
                      'where		CoalRankName like N''%[A-Za-z]%'' and not CoalRankName like N''%I%'''
                      );
      Tasks.AddObject('Марки, содержащие символы латиницы в Запасах', SQLCommands);

      //6. Типы угля, содержащие символы латиницы в Средних
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'select		distinct CoalTypeName as VarName ' +
                      'from		TempTable1 ' +
                      'where		CharIndex(''O'', CoalTypeName) > 0 or CharIndex(''K'', CoalTypeName) > 0'
                      );
      Tasks.AddObject('Типы угля, содержащие символы латиницы в Средних', SQLCommands);

      //7. Типы угля, содержащие символы латиницы в Запасах
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'select		distinct CoalTypeName as VarName ' +
                      'from		TempTable2 ' +
                      'where		CharIndex(''O'', CoalTypeName) > 0 or CharIndex(''K'', CoalTypeName) > 0'
                      );
      Tasks.AddObject('Типы угля, содержащие символы латиницы в Запасах', SQLCommands);

      //4. Повторяющиеся строки в Средних
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'select		SeamName + ''  '' + HoleName + ''  '' + BlockName as VarName ' +
                      'from		TempTable1 ' +
                      'group by	SeamName, BlockName, HoleName ,convert(binary, BlockName) ' +
                      'having		count(*) > 1'
                      );
      Tasks.AddObject('Повторяющиеся строки в Средних (Пласт, Скважина, Блок)', SQLCommands);

      //5. Повторяющиеся строки в Запасах
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'with q1 as ( ' +
                      'select		SeamName, Variant, BlockName, Boundary, CoalRankName, Pillar  ' +
                      'from		TempTable2 ' +
                      'group by	SeamName, Variant, BlockName, Boundary, CoalRankName, Pillar ' +
                      'having		count(*) > 1 ' +
                      ') ' +
                      'select '''#13#10''' + ''строка '' + convert(nvarchar(3), t2.Id + 1) + '':    '' ' +
                      '       + t2.SeamName + '',   '' ' +
                      '       + convert(nvarchar(2), t2.Variant) + '',   '' ' +
                      '       + t2.BlockName + '',   '' ' +
                      '       + t2.Boundary + '',   '' ' +
                      '       + t2.CoalRankName + '',   '' ' +
                      '       + t2.Pillar as VarName ' +
                      'from		q1 ' +
                      'inner join	TempTable2 t2 on ' +
                      '      t2.SeamName = q1.SeamName ' +
                      '      and t2.Variant = q1.Variant ' +
                      '      and t2.BlockName = q1.BlockName COLLATE Cyrillic_General_100_CS_AS ' +
                      '      and t2.Boundary = q1.Boundary ' +
                      '      and t2.CoalRankName = q1.CoalRankName ' +
                      '      and t2.Pillar = q1.Pillar ' +
                      'order by	t2.SeamName, t2.Variant, t2.BlockName, t2.Boundary, t2.CoalRankName, t2.Pillar '
                      );
      Tasks.AddObject('Повторяющиеся строки в Запасах', SQLCommands);
    end;
    if TaskType = ttImportTempTempTable then
    begin
      //Импорт недостающих записей -----------------------------------------------------------------

      //1. Пласты в Средних, которых не в базе данных
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct SeamName as VarName ' +
                      'from		TempTable1 t ' +
                      'left join	Seams s on s.Description = t.SeamName ' +
                      'where		s.SeamId is null');
      Tasks.AddObject('Пласты в Средних, которых нет в базе данных', SQLCommands);

      //2. Скважины в Средних, которых не в базе данных
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct t.HoleName as VarName ' +
                      'from		TempTable1 t ' +
                      'left join	Boreholes bh on bh.HoleName = t.HoleName ' +
                      'where		bh.BoreholeId is null');
      Tasks.AddObject('Скважины в Средних, которых не в базе данных', SQLCommands);

      //3. Разведочные линии в Средних, которых не в базе данных
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct LineName as VarName ' +
                      'from		TempTable1 t ' +
                      'left join	Lines l on l.Description = t.LineName ' +
                      'where		l.LineId is null');
      Tasks.AddObject('Разведочные линии в Средних, которых не в базе данных', SQLCommands);

      //4. Категории в Средних, которых не в базе данных
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct CategoryName as VarName ' +
                      'from		TempTable1 t ' +
                      'left join	Dictionary d on ' +
                      'd.Section = ''категории запасов'' and ' +
                      'd.Description = t.CategoryName ' +
                      'where		d.DictionaryId is null');
      Tasks.AddObject('Категории в Средних, которых не в базе данных', SQLCommands);

      //5. Категории в Запасах, которых не в базе данных
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct CategoryName as VarName ' +
                      'from		TempTable2 t ' +
                      'left join	Dictionary d on ' +
                      'd.Section = ''категории запасов'' and ' +
                      'd.Description = t.CategoryName ' +
                      'where		d.DictionaryId is null');
      Tasks.AddObject('Категории в Запасах, которых не в базе данных', SQLCommands);

      //6. Марки в Средних, которых не в базе данных
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct Trim(CoalRankName) as VarName ' +
                      'from		TempTable1 t ' +
                      'left join	Dictionary d on ' +
                      'd.Description = t.CoalRankName ' +
                      'where		d.DictionaryId is null');
      Tasks.AddObject('Марки в Средних, которых не в базе данных', SQLCommands);

      //7. Типы угля в Средних, которых не в базе данных
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct Trim(CoalTypeName) as VarName ' +
                      'from		TempTable1 t ' +
                      'left join	Dictionary d on ' +
                      'd.Description = t.CoalTypeName ' +
                      'where		d.DictionaryId is null');
      Tasks.AddObject('Типы угля в Средних, которых не в базе данных', SQLCommands);

      //8. Марки в Запасах, которых не в базе данных
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct Trim(CoalRankName) as VarName ' +
                      'from		TempTable2 t ' +
                      'left join	Dictionary d on ' +
                      'd.Description = t.CoalRankName ' +
                      'where		d.DictionaryId is null');
      Tasks.AddObject('Марки в Запасах, которых не в базе данных', SQLCommands);


      //9. Типы угля в Средних, которых не в базе данных
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct Trim(CoalTypeName) as VarName ' +
                      'from		TempTable1 t ' +
                      'left join	Dictionary d on ' +
                      'd.Description = t.CoalTypeName ' +
                      'where		d.DictionaryId is null');
      Tasks.AddObject('Типы угля в Средних, которых не в базе данных', SQLCommands);

      //10. Типы угля в Запасах, которых не в базе данных
      SQLCommands := TStringList.Create;
      SQLCommands.Add('select		distinct Trim(CoalTypeName) as VarName ' +
                      'from		TempTable2 t ' +
                      'left join	Dictionary d on ' +
                      'd.Description = t.CoalTypeName ' +
                      'where		d.DictionaryId is null');
      Tasks.AddObject('Типы угля в Запасах, которых не в базе данных', SQLCommands);
    end;
  end;
  if TableType = ttAssays then
  begin
    if TaskType = ttCreateTempTable then
    begin
      SQLCommands := TStringList.Create;
      SQLCommands.Add('if object_id(''dbo.TempTable1'') is not null drop table dbo.TempTable1');
      SQLCommands.Add(
                  'create table dbo.TempTable1( ' +
                  'Id int identity(1,1) not null, ' +
                  'HoleName nvarchar(50) null, ' +
                  'DepthFrom numeric(18, 2) null, ' +
                  'DepthTo numeric(18, 2) null, ' +
                  'NSample nvarchar(200) null, ' +
                  'N int null, ' +
                  'VarId int null, ' +
                  'Val nvarchar(100) null)'
                  );
      t1 := ImportPath + '\Assays.csv';
      f1 := ImportPath + '\Assays.fmt';
      SQLCommands.Add(
                  'insert into TempTable1 (HoleName, DepthFrom, DepthTo, NSample, N, VarId, Val) ' +
                  'select HoleName, DepthFrom, DepthTo, NSample, N, VarId, Val ' +
                  'from openrowset(bulk ' + QuotedStr(t1) + ', formatfile = ' + QuotedStr(f1) + ', firstrow = 2) t '
                  );
      Tasks.AddObject('CreateTempTables', SQLCommands);
    end;
    if TaskType = ttCheckTempTable then
    begin
      //Проверка TempTables
      //0. Check Boreholes
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'select	t.HoleName as VarName ' +
                      'from		TempTable1 t ' +
                      'left join	Boreholes bh on bh.HoleName = t.HoleName ' +
                      'where		bh.BoreholeId is null'
                      );
      Tasks.AddObject('Скважины, которых нет в базе данных', SQLCommands);

      //1. Check VarId
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'select	t.VarId as VarName ' +
                      'from		TempTable1 t ' +
                      'left join	AssayVars av on av.VarId = t.VarId ' +
                      'where		av.VarId is null'
                      );
      Tasks.AddObject('Id показателей, которых нет в базе данных', SQLCommands);

      //3. Check duplicate records
      SQLCommands := TStringList.Create;
      SQLCommands.Add(
                      'with q1 as ( ' +
                      'select		distinct HoleName, DepthFrom, DepthTo, NSample, N ' +
                      'from		TempTable1 ' +
                      ') ' +
                      'select		HoleName + ''  '' + convert(nvarchar(10), DepthFrom) + ''  '' + convert(nvarchar(10), DepthTo) + ''  '' + NSample as VarName ' +
                      'from		q1 ' +
                      'group by	HoleName, DepthFrom, DepthTo, NSample ' +
                      'having		count(*) > 1'
                      );
      Tasks.AddObject('Повторяющиеся записи (Скважина, От, До, №Анализа)', SQLCommands);
    end;
  end;
end;

end.
