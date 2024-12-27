unit RequeryUnit;

interface
uses
  SysUtils, DB, ADODB;

procedure FillRequeryTable;

implementation
uses
  DMUnit, DMBoreholesUnit, DMSeamsUnit, DMLithologyUnit, DMReservesUnit, DMSettingsUnit;

procedure FillRequeryTable;
begin
{
AppendRecord([
ViewName - Название фрейма для которого нужно обновить таблицы,
TableName - таблица, в которую внесено изменение (исходная таблица),
Requery(Boolean) - устанавливается в True при изменении исходной таблицы,
QueryAddress - Ссылка на таблицу, которая зависит от исходной таблицы и которую нужно обновить,
QueryName - Имя обновляемой таблицы (для справки)])
}

  //MainDataModule
//  DM.ListOfTables.AppendRecord(['DM', 'Seams', False, LargeInt(@DM.Seams), 'Seams']);
//  DM.ListOfTables.AppendRecord(['DM', 'Rocks', False, LargeInt(@DM.Rocks), 'Rocks']);

  //Boreholes
  DM.ListOfTables.AppendRecord(['Boreholes', 'Boreholes', False, LargeInt(@DMBoreholes.Boreholes), 'Boreholes']);
  DM.ListOfTables.AppendRecord(['Boreholes', 'Boreholes', False, LargeInt(@DMBoreholes.SurveyLines), 'SurveyLines']);
  DM.ListOfTables.AppendRecord(['Boreholes', 'Boreholes', False, LargeInt(@DMBoreholes.LineHoles), 'LineHoles']);
  DM.ListOfTables.AppendRecord(['Boreholes', 'Survey', False, LargeInt(@DMBoreholes.Survey), 'Survey']);
  DM.ListOfTables.AppendRecord(['Boreholes', 'SurveyLines', False, LargeInt(@DMBoreholes.SurveyLines), 'SurveyLines']);
  DM.ListOfTables.AppendRecord(['Boreholes', 'LineHoles', False, LargeInt(@DMBoreholes.LineHoles), 'LineHoles']);

  //Seams
  DM.ListOfTables.AppendRecord(['Seams', 'Seams', False, LargeInt(@DMSeams.Seams), 'Seams']);
  DM.ListOfTables.AppendRecord(['Seams', 'Parts', False, LargeInt(@DMSeams.Parts), 'Parts']);
  DM.ListOfTables.AppendRecord(['Seams', 'Coeffs', False, LargeInt(@DMSeams.Coeffs), 'Coeffs']);

  //BoreholeData
  DM.ListOfTables.AppendRecord(['BHData', 'Boreholes', False, LargeInt(@DMLithology.SurveyLines), 'SurveyLines']);
  DM.ListOfTables.AppendRecord(['BHData', 'Boreholes', False, LargeInt(@DMLithology.LineHoles), 'LineHoles']);
  DM.ListOfTables.AppendRecord(['BHData', 'SurveyLines', False, LargeInt(@DMLithology.SurveyLines), 'SurveyLines']);
  DM.ListOfTables.AppendRecord(['BHData', 'LineHoles', False, LargeInt(@DMLithology.LineHoles), 'LineHoles']);
  DM.ListOfTables.AppendRecord(['BHData', 'HoleSeams', False, LargeInt(@DMLithology.Holeseams), 'Holeseams']);
  DM.ListOfTables.AppendRecord(['BHData', 'Seams', False, LargeInt(@DMLithology.Lithology), 'Lithology']);
  DM.ListOfTables.AppendRecord(['BHData', 'Lithology', False, LargeInt(@DMLithology.Lithology), 'Lithology']);
  DM.ListOfTables.AppendRecord(['BHData', 'Samples', False, LargeInt(@DMLithology.Samples), 'Samples']);
  DM.ListOfTables.AppendRecord(['BHData', 'Rocks', False, LargeInt(@DM.Rocks), 'Rocks']);
  DM.ListOfTables.AppendRecord(['BHData', 'Dictionary', False, LargeInt(@DM.Formations), 'Formations']);
  DM.ListOfTables.AppendRecord(['BHData', 'Dictionary', False, LargeInt(@DM.CoalTypes), 'CoalTypes']);
  DM.ListOfTables.AppendRecord(['BHData', 'Dictionary', False, LargeInt(@DM.CoalGrades), 'CoalGrades']);
  DM.ListOfTables.AppendRecord(['BHData', 'AssayGroups', False, LargeInt(@DMLithology.Assays), 'Assays']);
  DM.ListOfTables.AppendRecord(['BHData', 'AssayVars', False, LargeInt(@DMLithology.Assays), 'Assays']);
  DM.ListOfTables.AppendRecord(['BHData', 'Assays', False, LargeInt(@DMLithology.Samples), 'Samples']);
  DM.ListOfTables.AppendRecord(['BHData', 'Assays', False, LargeInt(@DMLithology.Assays), 'Assays']);

  //HoleSeams
  DM.ListOfTables.AppendRecord(['HoleSeams', 'Seams', False, LargeInt(@DMReserves.Seams), 'Seams']);
  DM.ListOfTables.AppendRecord(['HoleSeams', 'HoleSeams', False, LargeInt(@DMReserves.HoleSeams), 'HoleSeams']);
  DM.ListOfTables.AppendRecord(['HoleSeams', 'Boreholes', False, LargeInt(@DMReserves.HoleSeams), 'HoleSeams']);
  DM.ListOfTables.AppendRecord(['HoleSeams', 'CalcUnits', False, LargeInt(@DMReserves.HoleSeams), 'HoleSeams']);
  DM.ListOfTables.AppendRecord(['HoleSeams', 'Lithology', False, LargeInt(@DMReserves.Lithology), 'Lithology']);
  DM.ListOfTables.AppendRecord(['HoleSeams', 'LithRes', False, LargeInt(@DMReserves.Lithology), 'Lithology']);
  DM.ListOfTables.AppendRecord(['HoleSeams', 'Samples', False, LargeInt(@DMReserves.Samples), 'Samples']);
  DM.ListOfTables.AppendRecord(['HoleSeams', 'HSSamps', False, LargeInt(@DMReserves.Samples), 'Samples']);
  DM.ListOfTables.AppendRecord(['HoleSeams', 'Rocks', False, LargeInt(@DM.Rocks), 'Rocks']);
  DM.ListOfTables.AppendRecord(['HoleSeams', 'Dictionary', False, LargeInt(@DM.CoalTypes), 'CoalTypes']);
  DM.ListOfTables.AppendRecord(['HoleSeams', 'Dictionary', False, LargeInt(@DM.CoalGrades), 'CoalGrades']);

  //Reserves
  DM.ListOfTables.AppendRecord(['Reserves', 'Seams', False, LargeInt(@DMReserves.Seams), 'Seams']);
  DM.ListOfTables.AppendRecord(['Reserves', 'HoleSeams', False, LargeInt(@DMReserves.HoleSeams), 'HoleSeams']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Boreholes', False, LargeInt(@DMReserves.HoleSeams), 'HoleSeams']);
  DM.ListOfTables.AppendRecord(['Reserves', 'CalcUnits', False, LargeInt(@DMReserves.HoleSeams), 'HoleSeams']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Lithology', False, LargeInt(@DMReserves.Lithology), 'Lithology']);
  DM.ListOfTables.AppendRecord(['Reserves', 'LithRes', False, LargeInt(@DMReserves.Lithology), 'Lithology']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Samples', False, LargeInt(@DMReserves.Samples), 'Samples']);
  DM.ListOfTables.AppendRecord(['Reserves', 'HSSamps', False, LargeInt(@DMReserves.Samples), 'Samples']);
  DM.ListOfTables.AppendRecord(['Reserves', 'SeamConds', False, LargeInt(@DMReserves.SeamConds), 'SeamConds']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Averages', False, LargeInt(@DMReserves.Averages), 'Averages']);
  DM.ListOfTables.AppendRecord(['Reserves', 'CoalType', False, LargeInt(@DMReserves.Averages), 'Averages']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Parts', False, LargeInt(@DMReserves.Parts), 'Parts']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Blocks', False, LargeInt(@DMReserves.Blocks), 'Blocks']);
  DM.ListOfTables.AppendRecord(['Reserves', 'BlockDetails', False, LargeInt(@DMReserves.BlockDetails), 'BlockDetails']);
  DM.ListOfTables.AppendRecord(['Reserves', 'BlockUnits', False, LargeInt(@DMReserves.BlockUnits), 'BlockUnits']);
  DM.ListOfTables.AppendRecord(['Reserves', 'HoleSeams', False, LargeInt(@DMReserves.BlockUnits), 'BlockUnits']);
  DM.ListOfTables.AppendRecord(['Reserves', 'CalcUnits', False, LargeInt(@DMReserves.BlockUnits), 'BlockUnits']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Versions', False, LargeInt(@DMReserves.Versions), 'Versions']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Boundaries', False, LargeInt(@DM.Boundaries), 'Boundaries']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Dictionary', False, LargeInt(@DM.CoalTypes), 'CoalTypes']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Dictionary', False, LargeInt(@DM.CoalGrades), 'CoalGrades']);
  DM.ListOfTables.AppendRecord(['Reserves', 'Dictionary', False, LargeInt(@DM.Pillars), 'Pillars']);


  //Settings
  DM.ListOfTables.AppendRecord(['Settings', 'Boundaries', False, LargeInt(@DMSettings.Boundaries), 'Boundaries']);
  DM.ListOfTables.AppendRecord(['Settings', 'Boundaries', False, LargeInt(@DMSettings.BoundDetail), 'BoundDetail']);
  DM.ListOfTables.AppendRecord(['Settings', 'Boundaries', False, LargeInt(@DMSettings.BoundSummary), 'BoundSummary']);
end;
end.
