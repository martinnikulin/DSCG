unit DMReservesUnit;

interface

uses
  System.SysUtils, System.Classes, System.Math, DB, ADODB, Variants, ShellAPI, Vcl.Forms;

Type
  TBlockUnitType = (utHoleSeam, utIsoAd, utIsoTh, utProbe);

Type
  TDMReserves = class(TDataModule)
    Seams: TADOQuery;
    dsSeams: TDataSource;
    HoleSeams: TADOQuery;
    dsHoleSeams: TDataSource;
    Lithology: TADOQuery;
    dsLithology: TDataSource;
    Samples: TADOQuery;
    dsSamples: TDataSource;
    SeamConds: TADOQuery;
    dsSeamConds: TDataSource;
    Averages: TADOQuery;
    dsAverages: TDataSource;
    dsAvgRefs: TDataSource;
    AvgRefs: TADOQuery;
    Blocks: TADOQuery;
    dsBlocks: TDataSource;
    BlockDetails: TADOQuery;
    dsBlockDetails: TDataSource;
    Parts: TADOQuery;
    dsParts: TDataSource;
    BlockUnits: TADOQuery;
    dsBlockUnits: TDataSource;
    Versions: TADOQuery;
    dsVersions: TDataSource;
    Query: TADOQuery;
    dsQuery: TDataSource;
    Composites: TADOQuery;
    dsComposites: TDataSource;
    Variants: TADOQuery;
    dsVariants: TDataSource;
    procedure BlockUnitsAfterPost(DataSet: TDataSet);
    procedure BlockUnitsBeforeDelete(DataSet: TDataSet);
    procedure BlocksAfterPost(DataSet: TDataSet);
    procedure BlocksAfterInsert(DataSet: TDataSet);
    procedure BlockDetailsAfterInsert(DataSet: TDataSet);
    procedure BlockDetailsAfterPost(DataSet: TDataSet);
    procedure SeamCondsAfterPost(DataSet: TDataSet);
    procedure HoleSeamsAfterPost(DataSet: TDataSet);
    procedure LithologyAfterPost(DataSet: TDataSet);
    procedure SamplesAfterPost(DataSet: TDataSet);
    procedure AveragesAfterPost(DataSet: TDataSet);
    procedure AvgRefsAfterPost(DataSet: TDataSet);
  private
    Category, CoalType, CoalGrade, Boundary: Integer;
    Balance: Boolean;
    Area, Dip, Z: Real;
    function GetInsertBlockUnitSQL(BlockId: Integer; ConditionId: Integer; VersionId: Integer; BlockUnitType: String; AdFull, ThFull: String): String;
  public
    procedure Initialize;
    procedure EnableControls;
    procedure DisableControls;
    procedure ChangeInterbed;
    procedure SetInterbed(InterbedId: integer);
    procedure ChangePart;
    procedure ChangeVersion;
    procedure InsertBlockUnit(BlockUnitType: TBlockUnitType; Value: Real);
    procedure CalculateBlock;
    procedure CalculateBlocks;
    procedure MoveBlockToVariant(BlockId, SourceCondId, TargetCondId, VersionId: Integer);
    procedure MoveBlockToPart(TargetPartId: Integer);
    procedure PasteBlock(BlockId, CondFrom, CondTo, VersionFrom, VersionTo: Integer);
    procedure DeleteBlock();
    procedure SetHoleseamCheckValue(CalcUnitId: Integer; FieldName: String; Value: Boolean);
    procedure CalcCalcUnits;
    procedure CalcAverages(CalcType: Integer);
    procedure CopyBlocks(Scope: Integer);
    procedure CreateBlockDetails;
    function CheckGeomObjects(): Boolean;
    procedure CreatePointsTable;
  end;

var
  DMReserves: TDMReserves;

implementation
uses
  DMUnit, MessengerUnit, BlockModelUnit;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TReservesDM }

{$REGION 'Initialization'}

procedure TDMReserves.Initialize;
begin
  Seams.Active := True;
  HoleSeams.Active := True;
  Lithology.Active := True;
  Samples.Active := True;
  SeamConds.Active := True;
  Averages.Active := True;
  Composites.Active := True;
  Parts.Active := True;
  Blocks.Active := True;
  BlockDetails.Active := True;
  BlockUnits.Active := True;
  Versions.Active := True;
  Variants.Active := True;
  Balance := True;
  Dip := 0;
  Category := DM.Categories.FieldByName('Id').AsInteger;
end;

procedure TDMReserves.DisableControls;
begin
  Seams.DisableControls;
  HoleSeams.DisableControls;
  Lithology.DisableControls;
  Samples.DisableControls;
  SeamConds.DisableControls;
  Averages.DisableControls;
  Parts.DisableControls;
  Blocks.DisableControls;
  BlockDetails.DisableControls;
  BlockUnits.DisableControls;
  Versions.DisableControls;
  Variants.DisableControls;
end;

procedure TDMReserves.EnableControls;
begin
  Seams.EnableControls;
  HoleSeams.EnableControls;
  Lithology.EnableControls;
  Samples.EnableControls;
  SeamConds.EnableControls;
  Averages.EnableControls;
  Parts.EnableControls;
  Blocks.EnableControls;
  BlockDetails.EnableControls;
  BlockUnits.EnableControls;
  Versions.EnableControls;
  Variants.EnableControls;
end;

function TDMReserves.CheckGeomObjects: Boolean;
begin
  result := DM.DoSQLQuery('select * from PlanGeoms where FeatureType = 7').RecordCount > 0;
end;

procedure TDMReserves.CreatePointsTable;
begin
  DM.ExecSQL('CreateBlockModelPoints');
end;

{$ENDREGION}

procedure TDMReserves.InsertBlockUnit(BlockUnitType: TBlockUnitType; Value: Real);
var
  SQL: string;
begin
  if BlockUnitType = utHoleSeam then
    SQL := 'insert into BlockUnits(BlockId, HoleSeamId, VersionId, HoleName, AdCoal, AdFull, ThCoal, ThFull, AdR, ThR, ConditionId)' +
            ' select ' +
            VarToStr(Blocks.FieldByName('BlockId').Value) + ', ' +
            'sd.HoleSeamId, ' +
            VarToStr(Versions.FieldByName('Id').Value) + ', ' +
            'bh.HoleName, ' +
            'sd.AdCoal, sd.AdFull, sd.ThCoal, sd.ThFull, sd.AdR, sd.ThR, ' + VarToStr(Blocks.FieldByName('ConditionId').Value) + ' ' +
            'from SeamDefs sd inner join Boreholes bh on bh.BoreholeId = sd.BoreholeId ' +
            'where HoleSeamId = ' + VarToStr(HoleSeams.FieldByName('HoleSeamId').Value);

  if BlockUnitType = utIsoAd then begin
    SQL := GetInsertBlockUnitSQL(Blocks.FieldByName('BlockId').AsInteger,
                                  Blocks.FieldByName('ConditionId').AsInteger,
                                  Blocks.FieldByName('VersionId').AsInteger,
                                  'IsoAd', StringReplace(FloatToStr(Value), ',', '.', []), 'NULL');
  end;
  if BlockUnitType = utIsoTh then begin
    SQL := GetInsertBlockUnitSQL(Blocks.FieldByName('BlockId').AsInteger,
                                  Blocks.FieldByName('ConditionId').AsInteger,
                                  Blocks.FieldByName('VersionId').AsInteger,
                                  'IsoTh', 'NULL', StringReplace(FloatToStr(Value), ',', '.', []));
  end;
  if BlockUnitType = utProbe then
    SQL := GetInsertBlockUnitSQL(Blocks.FieldByName('BlockId').AsInteger,
                                  Blocks.FieldByName('ConditionId').AsInteger,
                                  Blocks.FieldByName('VersionId').AsInteger,
                                  'Probe', 'NULL', 'NULL');

  DM.ExecSQL(SQL);
  BlockUnits.Requery();
end;

procedure TDMReserves.LithologyAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Reserves', 'Lithology', LargeInt(@Lithology));
end;

procedure TDMReserves.MoveBlockToPart(TargetPartId: Integer);
var
  BlockId: Integer;
  ConditionId: Integer;
  VersionId: Integer;
begin
  BlockId := Blocks.FieldByName('BlockId').AsInteger;
  ConditionId := Blocks.FieldByName('ConditionId').AsInteger;
  VersionId := Blocks.FieldByName('VersionId').AsInteger;
  DM.ExecSQL('update Blocks set PartId = ' + TargetPartId.ToString + ' where ' +
              'BlockId = ' + BlockId.ToString + ' and ' +
              'ConditionId = ' + ConditionId.ToString + ' and ' +
              'VersionId = ' + VersionId.ToString);
end;

procedure TDMReserves.MoveBlockToVariant(BlockId, SourceCondId, TargetCondId, VersionId: Integer);
begin
  DM.ExecSQL('exec MoveBlockToCondition ' + BlockId.ToString + ', ' +
                                            SourceCondId.ToString + ', ' +
                                            TargetCondId.ToString + ', ' +
                                            VersionId.ToString);
end;

procedure TDMReserves.PasteBlock(BlockId, CondFrom, CondTo, VersionFrom, VersionTo: Integer);
begin
  DM.ExecSQL('exec CopyBlock ' + BlockId.ToString + ', ' + CondFrom.ToString + ', ' + CondTo.ToString +
              ', ' + VersionFrom.ToString + ', ' + VersionTo.ToString );
  Blocks.Requery();
  BlockUnits.Requery();
  BlockDetails.Requery();
end;

procedure TDMReserves.DeleteBlock();
begin
  DM.ExecSQL('exec DeleteBlock ' + Blocks.FieldByName('BlockId').AsString + ', ' + Blocks.FieldByName('ConditionId').AsString + ', ' + Blocks.FieldByName('VersionId').AsString);
end;

function TDMReserves.GetInsertBlockUnitSQL(BlockId: Integer; ConditionId: Integer; VersionId: Integer; BlockUnitType: String; AdFull, ThFull: String): String;
begin
  Result := 'InsertBlockUnit ' + BlockId.ToString + ', ' + ConditionId.ToString + ', ' + VersionId.ToString + ', ' +
            QuotedStr(BlockUnitType) + ', ' + AdFull + ', ' + AdFull + ', ' + ThFull + ', ' + ThFull;
end;

procedure TDMReserves.HoleSeamsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Reserves', 'HoleSeams', LargeInt(@HoleSeams));
end;

procedure TDMReserves.CalculateBlock;
begin
  DM.ExecSQL('exec CalcBlock ' + Blocks.FieldByName('BlockId').AsString + ', ' +
              Parts.FieldByName('ConditionId').AsString + ', ' +
              Versions.FieldByName('Id').AsString);
end;

procedure TDMReserves.CalculateBlocks;
begin
  DM.ExecSQL('exec CalcBlocks ' + Parts.FieldByName('PartId').AsString + ', ' +
              Parts.FieldByName('ConditionId').AsString + ', ' +
              Versions.FieldByName('Id').AsString);
end;

procedure TDMReserves.ChangeInterbed;
begin
  SetInterbed(DM.Interbeds.FieldByName('InterbedId').Value);
end;

procedure TDMReserves.ChangePart;
begin
  Blocks.Parameters.ParamByName('PartId').Value := Parts.FieldByName('PartId').Value;
end;

procedure TDMReserves.ChangeVersion;
begin
  Blocks.Parameters.ParamByName('VersionId').Value := Versions.FieldByName('Id').Value;
end;

procedure TDMReserves.CopyBlocks(Scope: Integer);
var
  SeamId, PartId, BlockId, IntFrom, IntTo, CondFrom, CondTo: string;
  SQL: string;
begin
  SeamId := IntToStr(Seams.FieldByName('SeamId').AsInteger);
  PartId := IntToStr(Parts.FieldByName('PartId').AsInteger);
  BlockId := IntToStr(Blocks.FieldByName('BlockId').AsInteger);
  IntFrom := IntToStr(SeamConds.FieldByName('InterbedId').AsInteger);
  IntTo := IntToStr(Variants.FieldByName('InterbedId').AsInteger);
  CondFrom := IntToStr(SeamConds.FieldByName('ConditionId').AsInteger);
  CondTo := IntToStr(Variants.FieldByName('ConditionId').AsInteger);
  case Scope of
    0: begin PartId := '0'; BlockId := '0' end;
    1: begin SeamId := '0'; BlockId := '0' end;
    2: begin SeamId := '0'; PartId := '0' end;
  end;
  if CondTo = IntTo then begin
    CondFrom := '0';
    CondTo := '0';
  end;
  SQL := 'exec CopyBlocks ' + SeamId + ', ' + PartId + ', ' + BlockId + ', ' +
          IntFrom + ', ' + IntTo + ', ' + CondFrom + ', ' + CondTo;
  DM.ExecSQL(SQL);
end;

procedure TDMReserves.CreateBlockDetails;
var
  SeamId: Integer;
  ConditionId: Integer;
  InterbedId: Integer;
  VersionId: Integer;
begin
  SeamId := Seams.FieldByName('SeamId').AsInteger;
  ConditionId := SeamConds.FieldByName('ConditionId').AsInteger;
  InterbedId := SeamConds.FieldByName('InterbedId').AsInteger;
  VersionId := 1;
  DM.ADOQuery.SQL.Clear;
  DM.ADOQuery.SQL.Add('exec E005 ' + IntToStr(SeamId));
  DM.ADOQuery.Open;
  if DM.ADOQuery.RecordCount > 0 then
  begin
    Messenger.SendMessage('Reserves', 'Main', 'Text', 'Эти обязательные объекты отсутствуют в базе данных: ');
    while not DM.ADOQuery.Eof do begin
      Messenger.SendMessage('Reserves', 'Main', 'Text', DM.ADOQuery.FieldByName('Тип объекта').AsString);
      DM.ADOQuery.Next;
    end;
  end
  else begin
    DM.ExecSQL('CreateBlockDetails ' + IntToStr(SeamId) + ', null, null, ' + IntToStr(InterbedId) + ', ' + IntToStr(VersionId));
    BlockDetails.Requery();
  end;
  DM.ADOQuery.Close;
end;

procedure TDMReserves.SamplesAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Reserves', 'Samples', LargeInt(@Samples));
end;

procedure TDMReserves.SeamCondsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Reserves', 'SeamConds', LargeInt(@SeamConds));
end;

procedure TDMReserves.AveragesAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Reserves', 'Averages', LargeInt(@Averages));
end;

procedure TDMReserves.AvgRefsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Reserves', 'AvgRefs', LargeInt(@AvgRefs));
end;

procedure TDMReserves.BlocksAfterInsert(DataSet: TDataSet);
begin
  Blocks.FieldByName('Category').Value := Category;
  Blocks.FieldByName('CoalType').Value := CoalType;
  Blocks.FieldByName('Balance').Value := Balance;
  Blocks.FieldByName('Dip').Value := Dip;
  Blocks.FieldByName('VersionId').Value := Versions.FieldByName('Id').Value;
end;

procedure TDMReserves.BlocksAfterPost(DataSet: TDataSet);
begin
  Category := Blocks.FieldByName('Category').Value;
  CoalType := Blocks.FieldByName('CoalType').Value;
  Balance := Blocks.FieldByName('Balance').Value;
  Dip := Blocks.FieldByName('Dip').Value;
  DM.SetTableToRequery('Reserves', 'Blocks', LargeInt(@Blocks));
end;

procedure TDMReserves.BlockUnitsAfterPost(DataSet: TDataSet);
begin
//  if BlockUnits.FieldByName('HoleSeamId').IsNull then
//  begin
//    AdTotal := BlockUnits.FieldByName('AdFull').AsFloat;
//    ThTotal := BlockUnits.FieldByName('ThFull').AsFloat;
//  end;
//  DM.SetTableToRequery('Reserves', 'BlockUnits', LargeInt(@BlockUnits));
end;

procedure TDMReserves.BlockDetailsAfterPost(DataSet: TDataSet);
begin
  Boundary := BlockDetails.FieldByName('Boundary').Value;
  CoalGrade := BlockDetails.FieldByName('CoalGrade').Value;
  Area := BlockDetails.FieldByName('Area').Value;
  Z := BlockDetails.FieldByName('Z').Value;
  DM.SetTableToRequery('Reserves', 'BlockDetails', LargeInt(@BlockDetails));
end;

procedure TDMReserves.SetInterbed(InterbedId: integer);
begin
  SeamConds.Parameters.ParamByName('InterbedId').Value := InterbedId;
  SeamConds.Requery();
  HoleSeams.Parameters.ParamByName('InterbedId').Value := InterbedId;
  HoleSeams.Requery();
end;

procedure TDMReserves.SetHoleseamCheckValue(CalcUnitId: Integer;
  FieldName: String; Value: Boolean);
begin
  HoleSeams.Locate('CalcUnitId', CalcUnitId, []);
  HoleSeams.Edit;
  HoleSeams.FieldByName(FieldName).Value := Value;
  HoleSeams.Post;
end;

procedure TDMReserves.BlockDetailsAfterInsert(DataSet: TDataSet);
begin
  BlockDetails.FieldByName('Boundary').Value := Boundary;
  BlockDetails.FieldByName('Pillar').Value := 12;
  BlockDetails.FieldByName('CoalGrade').Value := CoalGrade;
  BlockDetails.FieldByName('Area').Value := Area;
  BlockDetails.FieldByName('Z').Value := Z;
end;

procedure TDMReserves.BlockUnitsBeforeDelete(DataSet: TDataSet);
begin
  DM.ExecSQL('delete from BlockUnits where Id = ' + IntToStr(BlockUnits.FieldByName('Id').Value));
  BlockUnits.Requery();
  Abort;
end;

procedure TDMReserves.CalcAverages(CalcType: Integer);
begin
  DM.ExecSQL('exec CalcAverages ' +
              SeamConds.FieldByName('SeamId').AsString + ', ' +
              DM.Interbeds.FieldByName('InterbedId').AsString + ', ' +
              IntToStr(CalcType));
  Averages.Requery();
end;

procedure TDMReserves.CalcCalcUnits;
begin
  DM.ExecSQL('exec CalcThickness ' +
              Seamconds.FieldByName('SeamId').AsString + ', ' +
              DM.Interbeds.FieldByName('InterbedId').AsString);
  DM.ExecSQL('exec CalcComposites ' +
              Seams.FieldByName('SeamId').AsString + ', ' +
              DM.Interbeds.FieldByName('InterbedId').AsString);
  //HoleSeams.Requery();
  BlockUnits.Requery();
end;

end.
