unit DMQueryUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

Type
  TDMQuery = class(TDataModule)
    Queries: TADOQuery;
    QueryParams: TADOQuery;
    dsQueries: TDataSource;
    dsQueryParams: TDataSource;
    ADOQuery: TADOQuery;
    dsADOQuery: TDataSource;
    Interbeds: TADOQuery;
    dsInterbeds: TDataSource;
    Seams: TADOQuery;
    dsSeams: TDataSource;
    AssayGroups: TADOQuery;
    dsAssayGroups: TDataSource;
    WorkTypes: TADOQuery;
    dsWorkTypes: TDataSource;
    IntervalTypes: TADOQuery;
    dsIntervalTypes: TDataSource;
  private
    { Private declarations }
  public
    procedure Initialize;
  end;

var
  DMQuery: TDMQuery;

implementation
uses
  DMUnit;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMQuery }

procedure TDMQuery.Initialize;
begin
  Queries.Active := True;
  QueryParams.Active := True;
  Interbeds.Active := True;
  Seams.Active := True;
  AssayGroups.Active := True;
  WorkTypes.Active := True;
  IntervalTypes.Active := True;
end;

end.
