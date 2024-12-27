unit DMGeomsUnit;

interface

uses
  System.SysUtils, System.Classes, ADODB, Data.DB;

type
  TDMGeoms = class(TDataModule)
    PlanGeoms: TADOQuery;
    dsPlanGeoms: TDataSource;
    Seams: TADOQuery;
    dsSeams: TDataSource;
    Parts: TADOQuery;
    dsParts: TDataSource;
    Interbeds: TADOQuery;
    dsInterbeds: TDataSource;
  private
  public
    procedure Initialize;
  end;

var
  DMGeoms: TDMGeoms;

implementation
uses
  DMUnit;
{$R *.dfm}


{ TDM }

{ TDM }

procedure TDMGeoms.Initialize;
begin
  Seams.Active := True;
  Parts.Active := True;
  Interbeds.Active := True;
  PlanGeoms.Parameters.ParamByName('Vertical1').Value := 0;
  PlanGeoms.Parameters.ParamByName('Vertical2').Value := 0;
  PlanGeoms.Active := True;
end;

end.
