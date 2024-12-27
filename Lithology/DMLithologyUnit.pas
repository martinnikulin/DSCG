unit DMLithologyUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, ADOint, Dialogs, Controls, Math,
  Datasnap.DBClient, Variants;

Type
  TDMLithology = class(TDataModule)
    SurveyLines: TADOQuery;
    dsSurveyLines: TDataSource;
    LineHoles: TADOQuery;
    dsLineHoles: TDataSource;
    HoleSeams: TADOQuery;
    dsHoleseams: TDataSource;
    dsLithology: TDataSource;
    Samples: TADOQuery;
    dsSamples: TDataSource;
    dsAssays: TDataSource;
    AssayGroups: TADOQuery;
    Assays: TADOQuery;
    dsAssayGroups: TDataSource;
    ColumnLith: TADOQuery;
    ColumnSamps: TADOQuery;
    Lithology: TADOQuery;
    LithologyLithologyId: TAutoIncField;
    Lithologyhole_id: TIntegerField;
    LithologyDepthFrom: TBCDField;
    LithologyDepthTo: TBCDField;
    LithologyAngle: TBCDField;
    LithologyTh: TBCDField;
    LithologyThNorm: TBCDField;
    LithologyCore: TBCDField;
    LithologyCoreNorm: TBCDField;
    LithologyCoreProc: TBCDField;
    LithologyRockId: TIntegerField;
    LithologySolidRock: TBooleanField;
    LithologySvita: TIntegerField;
    LithologySeamName: TWideStringField;
    Samplessample_id: TIntegerField;
    Samplesaccepted: TBooleanField;
    Samplesdepth_from: TBCDField;
    Samplesdepth_to: TBCDField;
    SamplesAd_index: TIntegerField;
    Samplesbad: TBooleanField;
    SamplessampleN: TWideStringField;
    Sampleshole_id: TIntegerField;
    SamplesAd: TFloatField;
    dsAssaysCDS: TDataSource;
    AssaysCDS: TClientDataSet;
    AssaysCDSvar_id: TIntegerField;
    AssaysCDSdescription: TWideStringField;
    AssaysCDSval: TWideStringField;
    AssaysCDSgroup_id: TIntegerField;
    AssaysCDSnn: TFloatField;
    AssaysCDSChanged: TBooleanField;
    SamplesAdFloat: TFloatField;
    SamplesAdGbs: TFloatField;
    SamplesAdGeophys: TFloatField;
    SamplesAdSeam: TFloatField;
    procedure LithologyDepthFromChange(Sender: TField);
    procedure LithologyDepthToChange(Sender: TField);
    procedure LithologyAngleChange(Sender: TField);
    procedure LithologyThNormChange(Sender: TField);
    procedure LithologyCoreChange(Sender: TField);
    procedure LithologyCoreNormChange(Sender: TField);
    procedure LithologyCoreProcChange(Sender: TField);
    procedure HoleseamsAfterPost(DataSet: TDataSet);
    procedure LithologyAfterPost(DataSet: TDataSet);
    procedure SamplesAfterPost(DataSet: TDataSet);
    procedure AssaysAfterPost(DataSet: TDataSet);
    procedure LithologyBeforePost(DataSet: TDataSet);
    procedure LithologyBeforeDelete(DataSet: TDataSet);
    procedure SamplesBeforeDelete(DataSet: TDataSet);
    procedure AssaysCDSvalChange(Sender: TField);
  private
    FieldIsChanging: Boolean;
    VarId: Integer;
    DeleteAssaysString: String;
    InsertAssaysString: String;
    procedure CalculateLithologyFields_1;
    procedure CalculateLithologyFields_2;
    procedure CalculateLithologyFields_3;
    procedure CalculateLithologyFields_4;
    procedure CalculateLithologyFields_5;
  public
    ByHoleSeams: Boolean;
    AssaysByGroup: Boolean;
    procedure Initialize;
    procedure SetLithologyFilter();
    procedure SetLineHolesFilter(ByLines: Boolean);
    procedure SetSamplesFilter();
    procedure DeleteHoleseam;
    procedure DefineHoleSeam(DepthFromId, DepthToId: integer; DrawFrom, DrawTo: Real; IsAdding: Boolean);
    procedure SetInterbed(InterbedId: integer);
    procedure ChangeInterbed;
    procedure UpdateLithology(LithologyId: Integer; FieldName: string; Value: Variant);
    procedure AddEmptyAssays;
    procedure FillCDSAssays;
    procedure CDSAssaysSetGroup(GroupId: Integer);
    procedure StoreVarId;
    procedure RecallVarId;
    procedure MakeAssaysSQLStrings;
    procedure UpdateAssays;
  end;

var
  DMUnit, DMLithology: TDMLithology;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DMUnit, MainUnit, MessengerUnit;

{$R *.dfm}

{ TBHDataDM }

procedure TDMLithology.Initialize;
begin
  SurveyLines.Active := True;
  LineHoles.Active := True;
  HoleSeams.Active := True;
  Lithology.Active := True;
  Samples.Active := True;
  AssayGroups.Active := True;
  Assays.Active := True;
  ColumnLith.Active := True;
  ColumnSamps.Active := True;
  AssaysByGroup := True;
end;

procedure TDMLithology.HoleseamsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('BHData', 'HoleSeams', LargeInt(@HoleSeams));
end;

procedure TDMLithology.LithologyAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('BHData', 'Lithology', LargeInt(@Lithology));
end;

procedure TDMLithology.SamplesAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('BHData', 'Samples', LargeInt(@Samples));
end;

procedure TDMLithology.SamplesBeforeDelete(DataSet: TDataSet);
begin
  DM.ExecSQL('delete from SampleDefs where SampleId = ' + SamplesSample_id.AsString);
  DM.SetTableToRequery('BHData', 'Samples', 0);
  Abort;
end;

procedure TDMLithology.AssaysAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('BHData', 'Assays', LargeInt(@Assays));
end;

procedure TDMLithology.AssaysCDSvalChange(Sender: TField);
begin
  AssaysCDSChanged.Value := True;
end;

procedure TDMLithology.LithologyAngleChange(Sender: TField);
begin
  if not FieldIsChanging then
    CalculateLithologyFields_1;
end;

procedure TDMLithology.LithologyBeforeDelete(DataSet: TDataSet);
begin
  DM.ExecSQL('delete from Lithology where LithologyId = ' + LithologyLithologyId.AsString);
  DM.SetTableToRequery('BHData', 'Lithology', 0);
  Abort;
end;

procedure TDMLithology.LithologyBeforePost(DataSet: TDataSet);
var
  test: Integer;
begin
  test := DataSet.FieldByName('HoleId').AsInteger;
end;

procedure TDMLithology.LithologyCoreChange(Sender: TField);
begin
  if not FieldIsChanging then
    CalculateLithologyFields_3;
end;

procedure TDMLithology.LithologyCoreNormChange(Sender: TField);
begin
  if not FieldIsChanging then
    CalculateLithologyFields_4;
end;

procedure TDMLithology.LithologyCoreProcChange(Sender: TField);
begin
  if not FieldIsChanging then
    CalculateLithologyFields_5;
end;

procedure TDMLithology.LithologyDepthFromChange(Sender: TField);
begin
  if not FieldIsChanging then
    CalculateLithologyFields_1;
end;

procedure TDMLithology.LithologyDepthToChange(Sender: TField);
begin
  if not FieldIsChanging then
    CalculateLithologyFields_1;
end;

procedure TDMLithology.LithologyThNormChange(Sender: TField);
begin
  if not FieldIsChanging then
    CalculateLithologyFields_2;
end;

procedure TDMLithology.AddEmptyAssays;
var
  SQL, SampleId: string;
begin
  SampleId := Samples.FieldByName('SampleId').AsString;
  DM.ExecSQL(
  'insert into Assays (SampleId, VarId) ' +
  'select ' + SampleId + ' as SampleId, av.VarId ' +
  'from AssayVars av ' +
  'left join (select * from Assays A where SampleId = ' + SampleId + ') as A ' +
  'on A.VarId = av.VarId ' +
  'where av.Actual = 1 and A.VarId is null');
  Assays.Requery();
  //DM.SetTableToRequery('BHData', 'Assays', 0);
end;

procedure TDMLithology.CalculateLithologyFields_1;
begin
  FieldIsChanging := True;
  LithologyTh.Value := LithologyDepthTo.Value - LithologyDepthFrom.Value;
  LithologyThNorm.Value := SimpleRoundTo(LithologyTh.Value * Cos(DegToRad(LithologyAngle.Value)), -2);
  LithologyCoreNorm.Value := SimpleRoundTo(LithologyCore.Value * Cos(DegToRad(LithologyAngle.Value)), -2);
  if LithologyTh.Value <> 0 then
    LithologyCoreProc.Value := SimpleRoundTo(LithologyCore.Value / LithologyTh.Value * 100, 0);
  FieldIsChanging := False;
end;

procedure TDMLithology.CalculateLithologyFields_2;
begin
  FieldIsChanging := True;
  LithologyTh.Value := SimpleRoundTo(LithologyThNorm.Value / Cos(DegToRad(LithologyAngle.Value)), -2);
  LithologyDepthTo.Value := LithologyDepthFrom.Value + LithologyTh.Value;
  LithologyCoreNorm.Value := SimpleRoundTo(LithologyCore.Value * Cos(DegToRad(LithologyAngle.Value)), -2);
  if LithologyTh.Value <> 0 then
    LithologyCoreProc.Value := SimpleRoundTo(LithologyCore.Value / LithologyTh.Value * 100, 0);
  FieldIsChanging := False;
end;

procedure TDMLithology.CalculateLithologyFields_3;
begin
  FieldIsChanging := True;
  if LithologyCore.IsNull then
  begin
    LithologyCoreNorm.Clear;
    LithologyCoreProc.Clear;
  end
  else
  begin
    LithologyCoreNorm.Value := SimpleRoundTo(LithologyCore.Value * Cos(DegToRad(LithologyAngle.Value)), -2);
    if LithologyTh.Value <> 0 then
      LithologyCoreProc.Value := SimpleRoundTo(LithologyCore.Value / LithologyTh.Value * 100, 0);
  end;
  FieldIsChanging := False;
end;

procedure TDMLithology.CalculateLithologyFields_4;
begin
  FieldIsChanging := True;
  if LithologyCoreNorm.IsNull then
  begin
    LithologyCore.Clear;
    LithologyCoreProc.Clear;
  end
  else
  begin
    LithologyCore.Value := SimpleRoundTo(LithologyCoreNorm.Value / Cos(DegToRad(LithologyAngle.Value)), -2);
    if LithologyTh.Value <> 0 then
      LithologyCoreProc.Value := SimpleRoundTo(LithologyCore.Value / LithologyTh.Value * 100, 0);
  end;
  FieldIsChanging := False;
end;

procedure TDMLithology.CalculateLithologyFields_5;
begin
  FieldIsChanging := True;
  if LithologyCoreProc.IsNull then
  begin
    LithologyCore.Clear;
    LithologyCoreNorm.Clear;
  end
  else
  begin
    LithologyCore.Value := SimpleRoundTo(LithologyCoreProc.Value / 100 * LithologyTh.Value, -2);
    LithologyCoreNorm.Value := SimpleRoundTo(LithologyCore.Value * Cos(DegToRad(LithologyAngle.Value)), -2);
  end;
  FieldIsChanging := False;
end;

procedure TDMLithology.CDSAssaysSetGroup(GroupId: Integer);
begin
  AssaysCDS.Active := False;
  AssaysCDS.Filter := 'GroupId = ' + IntToStr(GroupId);
  AssaysCDS.Filtered := AssaysByGroup;
  AssaysCDS.Active := True;
end;

procedure TDMLithology.ChangeInterbed;
begin
  SetInterbed(DM.Interbeds.FieldByName('InterbedId').Value);
end;

procedure TDMLithology.DefineHoleSeam(DepthFromId, DepthToId: integer; DrawFrom,
  DrawTo: Real; IsAdding: Boolean);
var
  BoreholeId: Variant;
begin
  if Lithology.State = dsEdit then
    Lithology.Post;
  if HoleSeams.State <> dsEdit then
    HoleSeams.Edit;
  if IsAdding then begin
    HoleSeams.Append;
    HoleSeams.FieldByName('BoreholeId').Value := LineHoles.FieldByName('BoreholeId').Value;
    HoleSeams.FieldByName('SeamId').Value := 0;
  end;
  HoleSeams.FieldByName('DepthFromId').Value := DepthFromId;
  HoleSeams.FieldByName('DepthToId').Value := DepthToId;
  HoleSeams.FieldByName('DrawFrom').Value := DrawFrom;
  HoleSeams.FieldByName('DrawTo').Value := DrawTo;
  HoleSeams.Post;
end;

procedure TDMLithology.DeleteHoleseam;
begin
  DM.ExecSQL('delete from SeamDefs where HoleSeamId = ' + IntToStr(HoleSeams.FieldByName('HoleSeamId').Value));
  HoleSeams.Requery();
end;

procedure TDMLithology.FillCDSAssays;
begin
  dsAssaysCDS.Enabled := False;
  AssaysCDSval.OnChange := nil;
  AssaysCDS.EmptyDataSet;
  Assays.First;
  while not Assays.Eof do
  begin
    AssaysCDS.Append;
    AssaysCDS.FieldByName('VarId').Value := Assays.FieldByName('VarId').Value;
    AssaysCDS.FieldByName('Description').Value := Assays.FieldByName('Description').Value;
    AssaysCDS.FieldByName('Val').Value := Assays.FieldByName('Val').Value;
    AssaysCDS.FieldByName('GroupId').Value := Assays.FieldByName('GroupId').Value;
    AssaysCDS.FieldByName('N').Value := Assays.FieldByName('N').Value;
    AssaysCDS.FieldByName('Changed').Value := False;
    AssaysCDS.Post;
    Assays.Next;
  end;
  AssaysCDSval.OnChange := AssaysCDSvalChange;
  dsAssaysCDS.Enabled := True;
end;

procedure TDMLithology.MakeAssaysSQLStrings;
var
  sql1, sql2, Filter: String;
begin
  if AssaysCDS.State = dsEdit then AssaysCDS.Post;
  dsAssaysCDS.Enabled := False;
  AssaysCDS.Filter := 'Changed = 1 and not Val is null';
  AssaysCDS.First;
  if AssaysCDS.RecordCount > 0 then
  begin
    while not AssaysCDS.Eof do
    begin
      sql1 := sql1 + ', ' + AssaysCDS.FieldByName('VarId').AsString;
      if Trim(AssaysCDS.FieldByName('Val').AsString) <> '' then
        sql2 := sql2 + ', (' + Samples.FieldByName('SampleId').AsString + ', ' + AssaysCDS.FieldByName('VarId').AsString + ', ''' + AssaysCDS.FieldByName('Val').Value + ''')';
      AssaysCDS.Next;
    end;
    DeleteAssaysString := 'delete from Assays where SampleId = ' + Samples.FieldByName('SampleId').AsString + ' and VarId in (' + Copy(sql1, 2, MaxInt) + ')';
    if Copy(sql2, 3, MaxInt) <> '' then
      InsertAssaysString := 'insert into Assays (SampleId, VarId, Val) values ' + Copy(sql2, 3, MaxInt)
    else
      InsertAssaysString := '';
  end;
end;

procedure TDMLithology.SetLineHolesFilter(ByLines: Boolean);
begin
  if ByLines then
  begin
    LineHoles.DataSource := dsSurveyLines;
    LineHoles.Parameters.ParamByName('all').Value := 0;
  end
  else
   begin
    LineHoles.DataSource := nil;
    LineHoles.Parameters.ParamByName('all').Value := 1;
   end;
   LineHoles.Requery();
end;

procedure TDMLithology.SetLithologyFilter();
begin
  if ByHoleSeams then
    begin
      Lithology.Parameters.ParamByName('all').Value := 0;
      Lithology.DataSource := dsHoleSeams;
    end
  else
    begin
      Lithology.Parameters.ParamByName('all').Value := 1;
      Lithology.DataSource := dsLineHoles;
    end;
  Lithology.Requery;
end;

procedure TDMLithology.SetSamplesFilter();
begin
  Samples.Active := False;
  if ByHoleSeams then
    begin
      Samples.SQL.Text := 'select * from SeamSamples where HoleSeamId = :HoleSeamId order by DepthTo asc, DepthFrom desc';
      Samples.DataSource := dsHoleSeams;
    end
  else
    begin
      Samples.SQL.Text := 'select 0 as HoleSeamId, 0 as SampLevel, CONVERT(bit, 0) as Accepted, Samples.* from Samples where BoreholeId = :BoreholeId order by DepthTo asc, DepthFrom desc';
      Samples.Active := True;
      Samples.DataSource := dsLineHoles;
    end;
  Samples.Active := True;
end;

procedure TDMLithology.StoreVarId;
begin
  VarId := 0;
  if not AssaysCDS.Eof then
    VarId := AssaysCDS.FieldByName('VarId').Value;
end;

procedure TDMLithology.RecallVarId;
begin
  if VarId = 0 then
    AssaysCDS.First
  else
    AssaysCDS.Locate('VarId', VarId, []);
end;

procedure TDMLithology.UpdateAssays;
begin
  MakeAssaysSQLStrings;
  DM.ExecSQL(DeleteAssaysString + ';' + InsertAssaysString);
  DM.SetTableToRequery('BHData', 'Assays', 0);
end;

procedure TDMLithology.UpdateLithology(LithologyId: Integer; FieldName: string;
  Value: Variant);
begin
  Lithology.Locate('LithologyId', LithologyId, []);
  Lithology.Edit;
  Lithology.FieldByName(FieldName).Value := Value;
  Lithology.Post;
end;

procedure TDMLithology.SetInterbed(InterbedId: integer);
var
  SeamId, LithologyId: Integer;
begin
  SeamId := Holeseams.FieldByName('SeamId').AsInteger;
  LithologyId := Lithology.FieldByName('LithologyId').AsInteger;
  LineHoles.Parameters.ParamByName('InterbedId').Value := InterbedId;
  LineHoles.Requery();
  Holeseams.Locate('SeamId', SeamId, []);
  Lithology.Locate('LithologyId', LithologyId, []);
end;
end.
