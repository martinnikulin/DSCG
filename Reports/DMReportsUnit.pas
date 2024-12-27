unit DMReportsUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, ComObj, Math,
  Variants, StrUtils, Dialogs;

Type
  TLayerInfo = record
    SeamName: String;
    LineName: String;
    Borehole: String;
    HoleSeamId: Integer;
    LithName: String;
    DepthFrom: Real;
    DepthTo: Real;
    Dip: Real;
    Th: Real;
    ThNorm: Real;
    Core: Real;
    CoreProc: Real;
    NLayer: String;
    NSample: String;
    SampleType: String;
  end;

Type
  TDMReports = class(TDataModule)
    Parts: TADOQuery;
    BlockUnits: TADOQuery;
    Blocks: TADOQuery;
    SeamConds: TADOQuery;
    dsSeamConds: TDataSource;
    dsParts: TDataSource;
    dsBlocks: TDataSource;
    BlockCount: TADOQuery;
    AssayGroups: TADOQuery;
    dsAssayGroups: TDataSource;
    Interbeds: TADOQuery;
    dsInterbeds: TDataSource;
    Samples: TADOQuery;
    Assays: TADOQuery;
    dsSamples: TDataSource;
  private
  public
    function GetLayerInfo: TLayerInfo;
    function GetGroupName(GroupId: Integer): String;
    function GetRecordCount(InterbedId, GroupId: Integer): Integer;
    procedure OpenDatasets(InterbedId, GroupId: Integer);
  end;

var
  DMReports: TDMReports;

implementation
uses
  DMUnit;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMReports }

function TDMReports.GetGroupName(GroupId: Integer): String;
begin
  AssayGroups.Locate('GroupId', GroupId, []);
  Result := DMReports.AssayGroups.FieldByName('GroupName').AsString;
end;

function TDMReports.GetLayerInfo: TLayerInfo;
begin
  with Result, Samples do begin
    HoleseamId := FieldByName('HoleSeamId').AsInteger;
    SeamName := FieldByName('SeamName').AsString;
    LineName := FieldByName('LineName').AsString;
    Borehole := FieldByName('HoleName').AsString;
    LithName := FieldByName('RockName').AsString;
    DepthFrom := FieldByName('DepthFrom').AsFloat;
    DepthTo := FieldByName('DepthTo').AsFloat;
    Dip := FieldByName('Angle').AsFloat;
    Th := DepthTo - DepthFrom;
    ThNorm := SimpleRoundTo((DepthTo - DepthFrom) * Cos(DegToRad(Dip)));
    Core := FieldByName('Core').AsFloat;
    CoreProc := FieldByName('CoreProc').AsFloat;
    NLayer := FieldByName('NLayer').AsString;
    NSample := FieldByName('NSample').AsString;
    SampleType := FieldByName('SampleType').AsString;
  end;
end;

procedure TDMReports.OpenDatasets(InterbedId, GroupId: Integer);
begin
  Samples.Active := False;
  Assays.Active := False;
  Samples.Parameters.ParamByName('InterbedId').Value := InterbedId;
  Samples.Parameters.ParamByName('GroupId').Value := GroupId;
  Assays.Parameters.ParamByName('GroupId').Value := GroupId;
  Samples.Active := True;
  Assays.Active := True;
end;

function TDMReports.GetRecordCount(InterbedId, GroupId: Integer): Integer;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  Query.SQL.Text := 'select count(*) as cnt from dbo.fSamplesTable(' +
                    IntToStr(InterbedId) + ', ' + IntToStr(GroupId) + ')';
  Query.Connection := DM.GDBConnection;
  Query.Active := True;
  Result := Query.FieldByName('cnt').AsInteger;
  Query.Active := False;
end;

end.
