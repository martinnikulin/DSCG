unit DMSeamsUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

Type
  TDMSeams = class(TDataModule)
    Seams: TADOQuery;
    dsSeams: TDataSource;
    Parts: TADOQuery;
    dsParts: TDataSource;
    Coeffs: TADOQuery;
    dsCoeffs: TDataSource;
    SeamsSeamId: TAutoIncField;
    SeamsDescription: TWideStringField;
    SeamsShortName: TWideStringField;
    SeamsStrata: TFloatField;
    SeamsN: TFloatField;
    SeamsActual: TBooleanField;
    SeamsGroupSeamId: TWideStringField;
    SeamsDateCreated: TDateTimeField;
    SeamsDateModified: TDateTimeField;
    SeamsAdRoof: TBCDField;
    SeamsAdBed: TBCDField;
    SeamsDdaRoof: TBCDField;
    SeamsDdaBed: TBCDField;
    procedure PartsAfterPost(DataSet: TDataSet);
    procedure SeamsAfterPost(DataSet: TDataSet);
    procedure CoeffsAfterPost(DataSet: TDataSet);
    procedure SeamsStrataChange(Sender: TField);
  private
    { Private declarations }
  public
    procedure Initialize;
    procedure AddCoeffs;
    procedure SetCoeffs(CoeffId: Integer; a, b: Real);
  end;

var
  DMSeams: TDMSeams;

implementation
uses
  DMUnit;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSeamsDM }


procedure TDMSeams.Initialize;
begin
  Seams.Active := True;
  Parts.Active := True;
  Coeffs.Active := True;
end;

procedure TDMSeams.PartsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Seams', 'Parts', LargeInt(@Parts));
end;

procedure TDMSeams.SeamsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Seams', 'Seams', LargeInt(@Seams));
end;

procedure TDMSeams.SeamsStrataChange(Sender: TField);
begin
  SeamsN.Value := SeamsStrata.Value;
end;

procedure TDMSeams.SetCoeffs(CoeffId: Integer; a, b: Real);
begin
  Coeffs.Locate('CoeffId', CoeffId, []);
  Coeffs.Edit;
  Coeffs.FieldByName('a').Value := a;
  Coeffs.FieldByName('b').Value := b;
  Coeffs.Post;
end;

procedure TDMSeams.AddCoeffs;
begin
  DM.ExecSQL('exec AddCoeffs ' + Seams.FieldByName('SeamId').AsString);
  Coeffs.Requery();
end;

procedure TDMSeams.CoeffsAfterPost(DataSet: TDataSet);
begin
  DM.SetTableToRequery('Seams', 'Coeffs', LargeInt(@Coeffs));
end;

end.
