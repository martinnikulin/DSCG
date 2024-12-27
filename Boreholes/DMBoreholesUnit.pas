unit DMBoreholesUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, StrUtils,
  Variants;

Type
  TDMBoreholes = class(TDataModule)
    dsBoreholes: TDataSource;
    dsSurvey: TDataSource;
    dsSurveyLines: TDataSource;
    dsLineHoles: TDataSource;
    LineHoles: TADOQuery;
    Survey: TADOQuery;
    Boreholes: TADOQuery;
    SurveyLines: TADOQuery;
    procedure BoreholesAfterInsert(DataSet: TDataSet);
    procedure SurveyLinesAfterInsert(DataSet: TDataSet);
    procedure BoreholesAfterPost(DataSet: TDataSet);
    procedure SurveyAfterPost(DataSet: TDataSet);
    procedure SurveyLinesAfterPost(DataSet: TDataSet);
    procedure LineHolesAfterPost(DataSet: TDataSet);
    procedure BoreholesAfterDelete(DataSet: TDataSet);
  private
  public
    procedure Initialize;
    procedure LineHolesFilter(SetOn: Boolean);
    procedure AddToSurveyLine(LineId, BoreholeId: integer);
    procedure DeleteBoreholeFromSL(LineId, BoreholeId: integer);
    procedure CalcStretchAzimuths(LineId: integer);
    procedure DeleteBorehole(BoreholeId: integer);
    procedure OrderBoreholes(LineId: integer);
    procedure ShiftCoordinates(dX, dY: real);
    procedure ExchangeCoordinates;
    procedure CalcSLEnds(LineId: Integer; Distance: Real);
  end;

var
  DMBoreholes: TDMBoreholes;

implementation
uses
  DMUnit, MainUnit;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TBHDM }


procedure TDMBoreholes.Initialize;
begin
  Boreholes.Active := True;
  Survey.Active := True;
  SurveyLines.Active := True;
  LineHoles.Active := True;
end;

procedure TDMBoreholes.SurveyLinesAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('LineType').Value := DM.DEFAULT_LINETYPE;
end;

procedure TDMBoreholes.BoreholesAfterDelete(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Boreholes', 'Boreholes', LargeInt(@Boreholes));
end;

procedure TDMBoreholes.BoreholesAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('HoleType').Value := DM.DEFAULT_HOLETYPE;
end;

procedure TDMBoreholes.BoreholesAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Boreholes', 'Boreholes', LargeInt(@Boreholes));
end;

procedure TDMBoreholes.SurveyAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Boreholes', 'Survey', LargeInt(@Survey));
end;

procedure TDMBoreholes.SurveyLinesAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Boreholes', 'SurveyLines', LargeInt(@SurveyLines));
end;

procedure TDMBoreholes.LineHolesAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Boreholes', 'LineHoles', LargeInt(@LineHoles));
end;

procedure TDMBoreholes.LineHolesFilter(SetOn: Boolean);
begin
  if SetOn then
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

procedure TDMBoreholes.AddToSurveyLine(LineId, BoreholeId: integer);
begin
  DM.ExecSQL('EXEC dbo.AddToLine ' + IntToStr(LineId) + ', ' + IntToStr(BoreholeId));
  DM.SetTableToRequery('Boreholes', 'LineHoles', 0);
end;

procedure TDMBoreholes.CalcSLEnds(LineId: Integer; Distance: Real);
begin
  if LineId = 0 then
    DM.ExecSQL('dbo.AddEndsToLines null, ' + FloatToStr(Distance))
  else
    DM.ExecSQL('dbo.AddEndsToLines ' + IntToStr(LineId) + ', ' + FloatToStr(Distance));
  DM.SetTableToRequery('Boreholes', 'Lines', 0);
end;

procedure TDMBoreholes.CalcStretchAzimuths(LineId: integer);
begin
  DM.ExecSQL('EXEC dbo.CalcStretchAzimuths ' + IntToStr(LineId));
  DM.SetTableToRequery('Boreholes', 'LineHoles', 0);
end;

procedure TDMBoreholes.DeleteBorehole(BoreholeId: integer);
begin
  DM.ExecSQL('EXEC dbo.DeleteHole ' + IntToStr(BoreholeId));
  DM.SetTableToRequery('Boreholes', 'Boreholes', 0);
end;

procedure TDMBoreholes.DeleteBoreholeFromSL(LineId, BoreholeId: integer);
begin
  DM.ExecSQL('EXEC dbo.DeleteFromSL ' + IntToStr(LineId) + ', ' + IntToStr(BoreholeId));
  DM.SetTableToRequery('Boreholes', 'LineHoles', 0);
end;

procedure TDMBoreholes.OrderBoreholes(LineId: integer);
begin
  DM.ExecSQL('EXEC dbo.OrderHoles ' + IntToStr(LineId));
  DM.SetTableToRequery('Boreholes', 'LineHoles', 0);
end;


procedure TDMBoreholes.ShiftCoordinates(dX, dY: real);
begin
  DM.ExecSQL('EXEC dbo.ShiftCoords ' + FloatToStr(dX) + ', ' + FloatToStr(dY));
  DM.SetTableToRequery('Boreholes', 'Boreholes', 0);
  DM.SetTableToRequery('Boreholes', 'Lines', 0);
  DM.SetTableToRequery('Boreholes', 'LineHoles', 0);

end;

procedure TDMBoreholes.ExchangeCoordinates;
begin
  DM.ExecSQL('EXEC dbo.ExchangeCoords');
  DM.SetTableToRequery('Boreholes', 'Boreholes', 0);
  DM.SetTableToRequery('Boreholes', 'Lines', 0);
  DM.SetTableToRequery('Boreholes', 'LineHoles', 0);
end;

end.
