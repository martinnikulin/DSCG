unit DMSettingsUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

Type
  TDMSettings = class(TDataModule)
    Rocks: TADOQuery;
    dsRocks: TDataSource;
    AssayGroups: TADOQuery;
    dsAssayGroups: TDataSource;
    AssayVars: TADOQuery;
    dsAssayVars: TDataSource;
    CondDefs: TADOQuery;
    dsCondDefs: TDataSource;
    Versions: TADOQuery;
    dsVersions: TDataSource;
    BoundRefs: TADOQuery;
    dsBoundRefs: TDataSource;
    BoundDetail: TADOQuery;
    dsBoundDetail: TDataSource;
    BoundSummary: TADOQuery;
    dsBoundSummary: TDataSource;
    dsBoundaries: TDataSource;
    Dictionary: TADOQuery;
    dsDictionary: TDataSource;
    BoundTypes: TADOQuery;
    dsBoundTypes: TDataSource;
    AssayVarsCR: TADOQuery;
    dsAssayVarsCR: TDataSource;
    AssayVars1: TADOQuery;
    dsAssayVars1: TDataSource;
    AssayGroups1: TADOQuery;
    dsAssayGroups1: TDataSource;
    CoalGrades: TADOQuery;
    dsCoalGrades: TDataSource;
    CoalTypes: TADOQuery;
    dsCoalTypes: TDataSource;
    RockGroups: TADOQuery;
    dsRockGroups: TDataSource;
    Boundaries: TADOQuery;
    ResParams: TADOQuery;
    dsResParams: TDataSource;
    procedure RocksAfterPost(DataSet: TDataSet);
    procedure AssayGroupsAfterPost(DataSet: TDataSet);
    procedure AssayVarsAfterPost(DataSet: TDataSet);
    procedure CondDefsAfterPost(DataSet: TDataSet);
    procedure VersionsAfterPost(DataSet: TDataSet);
    procedure BoundariesAfterPost(DataSet: TDataSet);
    procedure DictionaryAfterPost(DataSet: TDataSet);
    procedure BoundRefsAfterPost(DataSet: TDataSet);
    procedure BoundDetailAfterPost(DataSet: TDataSet);
    procedure BoundSummaryAfterPost(DataSet: TDataSet);
    procedure DictionaryAfterInsert(DataSet: TDataSet);
    procedure BoundariesAfterInsert(DataSet: TDataSet);
    procedure BoundariesAfterDelete(DataSet: TDataSet);
    procedure BoundRefsAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure Initialize;
    procedure SetBoundType;
    procedure CopyVersion;
    procedure CreateVariants;
    procedure CalcRockDensity;
    procedure SetDictionarySection(SectionId: Integer);
    procedure AddAssayVarToHS;
    procedure CreateDetailBounds;
    procedure CreateDetailBounds1;
  end;

var
  DMSettings: TDMSettings;

implementation
uses
  DMUnit, DMReservesUnit, MessengerUnit;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSettingsDM }

procedure TDMSettings.CalcRockDensity;
begin
  DM.ExecSQL('exec dbo.CalcRockDensity');
  Rocks.Requery();
end;

procedure TDMSettings.CopyVersion;
var
   VersionFrom, VersionTo: integer;
begin
  VersionFrom := Versions.FieldByName('VersionId').Value;
  Versions.Edit;
  Versions.Append;
  Versions.FieldByName('VersionName').Value := 'Версия новая';
  Versions.Post;
  VersionFrom := Versions.FieldByName('VersionId').Value;
  DM.ExecSQL('EXEC dbo.CopyVersion ' + IntToStr(VersionFrom) + ', ' + IntToStr(VersionTo));
  DMReserves.Versions.Requery();
end;

procedure TDMSettings.CreateDetailBounds;
begin
  DM.ExecSQL('exec CreateDetailBounds');
end;

procedure TDMSettings.CreateDetailBounds1;
begin
  DM.ExecSQL('exec CreateDetailBounds1 ' + DM.Seams.FieldByName('SeamId').AsString + ', null, ' +
            DM.Interbeds.FieldByName('InterbedId').AsString);
end;

procedure TDMSettings.CreateVariants;
begin
//  DM.ADOCommand.CommandText := 'exec dbo.AddInterbed ' + IntToStr(SettingsDM.CondDefs.FieldByName('N').Value * 100);
//  DM.ADOCommand.CommandText := 'exec dbo.AddVariants 1'
end;

procedure TDMSettings.Initialize;
begin
  Rocks.Active := True;
  RockGroups.Active := True;
  AssayGroups.Active := True;
  AssayVars.Active := True;
  AssayGroups1.Active := True;
  AssayVars1.Active := True;
  CondDefs.Active := True;
  Versions.Active := True;
  Dictionary.Active := True;
  CoalGrades.Active := True;
  CoalTypes.Active := True;
  AssayVarsCR.Active := True;
  Boundaries.Active := True;
  BoundTypes.Active := True;
  BoundRefs.Active := True;
  BoundDetail.Active := True;
  BoundSummary.Active := True;
  ResParams.Active := True;
end;

procedure TDMSettings.RocksAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'Rocks', LargeInt(@Rocks));
end;

procedure TDMSettings.AddAssayVarToHS;
var
  N: Integer;
begin
  N := 1;
  try
  with AssayVarsCR do begin
    DisableControls;
    Edit;
    if not Eof then begin
      FindLast;
      N := FieldbyName('N').AsInteger + 1;
    end;
    Append;
    FieldbyName('CoalRankId').AsInteger := CoalGrades.FieldByName('CoalGradeId').AsInteger;
    FieldbyName('CoalTypeId').AsInteger := CoalTypes.FieldByName('CoalTypeId').AsInteger;
    FieldbyName('VarId').AsInteger := AssayVars1.FieldByName('VarId').AsInteger;
    FieldbyName('N').AsInteger := N;
    Post;
    EnableControls;
    Requery();
  end;
  except
    Messenger.SendMessage('Settings', 'Main', 'Text', 'Не удалось добавить показатель');
  end;
end;

procedure TDMSettings.AssayGroupsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'AssayGroups', LargeInt(@AssayGroups));
end;

procedure TDMSettings.AssayVarsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'AssayVars', LargeInt(@AssayVars));
end;

procedure TDMSettings.BoundariesAfterDelete(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'Boundaries', LargeInt(@Boundaries));
end;

procedure TDMSettings.BoundariesAfterInsert(DataSet: TDataSet);
begin
//  Boundaries.FieldByName('Type').Value := 'var';
  Boundaries.FieldByName('Section').Value := BoundTypes.FieldByName('BoundType').AsString;
end;

procedure TDMSettings.BoundariesAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'Boundaries', LargeInt(@Boundaries));
end;

procedure TDMSettings.BoundDetailAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'BoundDetail', LargeInt(@BoundDetail));
end;

procedure TDMSettings.CondDefsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'CondDefs', LargeInt(@CondDefs));
end;

procedure TDMSettings.VersionsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'Versions', LargeInt(@Versions));
end;

procedure TDMSettings.DictionaryAfterInsert(DataSet: TDataSet);
begin
  Dictionary.FieldByName('Section').AsString := Dictionary.Parameters.ParamByName('Section').Value;
end;

procedure TDMSettings.DictionaryAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'Dictionary', LargeInt(@Dictionary));
end;

procedure TDMSettings.BoundRefsAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('Operator').AsString := '+';
  DataSet.FieldByName('Section').AsString := 'boundary2';
end;

procedure TDMSettings.BoundRefsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'BoundRefs', LargeInt(@BoundRefs));
end;

procedure TDMSettings.BoundSummaryAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Settings', 'BoundSummary', LargeInt(@BoundSummary));
end;

procedure TDMSettings.SetBoundType;
begin
  Boundaries.Parameters.ParamByName('BoundType').Value := BoundTypes.FieldByName('BoundType').Value;
  Boundaries.Requery();
end;

procedure TDMSettings.SetDictionarySection(SectionId: Integer);
begin
  case SectionId of
    7: Dictionary.Parameters.ParamByName('section').Value := 'марка';
    8: Dictionary.Parameters.ParamByName('section').Value := 'тип угля';
    9: Dictionary.Parameters.ParamByName('section').Value := 'pillar';
    10: Dictionary.Parameters.ParamByName('section').Value := 'свита';
  end;
  Dictionary.Requery();
end;

end.
