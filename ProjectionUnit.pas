unit ProjectionUnit;

interface

uses
  System.Classes, System.DateUtils, System.SysUtils;

type
  TProjectionType = (ptGaussKrueger);

type
  TXYPoint = record
    X: Double;
    Y: Double;
  end;

type
  TGeoPoint = record
    Latitude: Double;
    Longitude: Double;
  end;

type
  TProjection = class
    private
      FProjectionType: TProjectionType;
      function GetGKGeoPoint(x, y: Double): TGeoPoint;
    published
      property Name: TProjectionType read FProjectionType write FProjectionType;
    public
      constructor Create(ProjectionType: TProjectionType);
      function GetGeoPoint(x, y: Double): TGeoPoint;
  end;

implementation

{ TProjection }

function TProjection.GetGKGeoPoint(x, y: Double): TGeoPoint;
var
  c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26: Double;
  L, B: Double;
begin
  c12 := y;
  c13 := x - Int(x / 1000000) * 1000000 - 500000;
  c15 := c12 / 6367558.4969;
  c14 := Cos(c15) * Cos(c15);
  c16 := c15 + (50221746 + (293622 + (2350 + 22 * c14) * c14) * c14) * Sin(c15) * Cos(c15) / 10000000000;
  c17 := Cos(c16) * Cos(c16);
  c18 := 6399698.902 - (21562.267 - (108.973 - 0.612 * c17) * c17) * c17;
  c23 := c13 / (c18 * Cos(C16));
  c24 := c23 * c23;
  c22 := 0.2 - (0.166666667 - 0.0088 * c17) * c17;
  c20 := 0.3333333333 - (0.166667 - 0.001123 * c17) * c17;
  c25 := (1 - (c20 - c22 * c24) * c24) * c23 * 57.2957795131;
  c21 := 0.25 + (0.16161 + 0.00562 * c17) * c17;
  c19 := (0.5 + 0.003369 * c17) * Sin(c16) * cos(c16);
  result.Longitude := Int(x / 1000000) * 6 - 3 + c25;
  result.Latitude := (c16 - (1 - (c21 - 0.12 * c24) * c24) * c24 * c19) * 57.2957795131;
end;

constructor TProjection.Create(ProjectionType: TProjectionType);
begin
  FProjectionType := ProjectionType;
end;

function TProjection.GetGeoPoint(x, y: Double): TGeoPoint;
begin
  case FProjectionType of
    ptGaussKrueger:
      result := GetGKGeoPoint(x, y);
  end;
end;

end.
