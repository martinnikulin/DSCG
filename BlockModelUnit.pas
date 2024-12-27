unit BlockModelUnit;

interface
uses
  System.SysUtils, ADODB;

const
  minPoints: Integer = 3;

type
  TInterpolationResult = (irDone, irNoParcel, irNoSeamDefs);

type
  TBlockModel = class
  private
    FSeamId: Integer;
    FPartId: Integer;
    FInterbedId: Integer;
    chSeamDefs: Boolean;
    chPoints: Boolean;
    chSeamPoints: Boolean;
    chParcel: Boolean;
    doThCoal: Boolean;
    doThFull: Boolean;
    doAdCoal: Boolean;
    doAdFull: Boolean;
    Done: Boolean;
    procedure CheckSeamDefs();
    procedure CheckSeamPoints();
    procedure CheckPoints();
    procedure CheckParcel();
    procedure DoInterpolation;
    procedure CreatePoints();
    procedure CreateSeamPoints;
  public
    constructor Create(SeamId, PartId, InterbedId: Integer);
    procedure CheckConditions;
    function Interpolate(): Boolean;
  end;


implementation
uses
  DMUnit;

{ TBlockModel }

constructor TBlockModel.Create(SeamId, PartId, InterbedId: Integer);
begin
  FSeamId := SeamId;
  FPartId := PartId;
  FInterbedId := InterbedId;
end;

function TBlockModel.Interpolate(): Boolean;
begin
  if not chSeamDefs then begin
    Result := False;
    Exit;
  end;
  if not chPoints then begin
    CreatePoints;
    Interpolate;
  end;
  if not chSeamPoints then begin
    CreateSeamPoints;
    Interpolate;
  end
  else
    if not Done then
      DoInterpolation;
  Result := True;
end;

procedure TBlockModel.CheckConditions;
begin
  CheckSeamDefs;
  CheckPoints;
  CheckSeamPoints;
  CheckParcel;
end;

procedure TBlockModel.CheckSeamDefs;
var
  SeamId, PartId, RowCount: Integer;
  Query: TADOQuery;
begin
  Query := DM.DoSQLQuery('select count(*) as cnt from SeamDefs where not ThCoal is null');
  doThCoal := Query.FieldByName('cnt').AsInteger > minPoints;
  Query := DM.DoSQLQuery('select count(*) as cnt from SeamDefs where not ThFull is null');
  doThFull := Query.FieldByName('cnt').AsInteger > minPoints;
  Query := DM.DoSQLQuery('select count(*) as cnt from SeamDefs where not AdCoal is null');
  doAdCoal := Query.FieldByName('cnt').AsInteger > minPoints;
  Query := DM.DoSQLQuery('select count(*) as cnt from SeamDefs where not AdFull is null');
  doAdFull := Query.FieldByName('cnt').AsInteger > minPoints;
  chSeamDefs := doThCoal or doThFull or doAdCoal or doAdFull;
end;

procedure TBlockModel.CheckPoints;
var
  RowCount: Integer;
  Query: TADOQuery;
begin
  Query := DM.DoSQLQuery('select count(*) as cnt from Points');
  RowCount := Query.FieldByName('cnt').AsInteger;
  chPoints := RowCount > 0;
end;

procedure TBlockModel.CheckSeamPoints;
var
  SeamId, PartId, RowCount: Integer;
  Query: TADOQuery;
begin
  Query := DM.DoSQLQuery('select count(*) as cnt from SeamPoints where SeamId = ' + FSeamId.ToString + ' and PartId = ' + FPartId.ToString);
  RowCount := Query.FieldByName('cnt').AsInteger;
  chSeamPoints := RowCount > 0;
end;

procedure TBlockModel.CheckParcel;
begin
  chParcel := False;
end;

procedure TBlockModel.CreatePoints;
begin
  chPoints := True;
end;

procedure TBlockModel.CreateSeamPoints;
begin
  chSeamPoints := True;
end;

procedure TBlockModel.DoInterpolation;
begin
  Done := True;
end;

end.
