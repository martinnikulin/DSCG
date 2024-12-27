unit ImporterUnit;

interface
uses
  Classes, SysUtils, Dialogs, ADODB, Vcl.Controls, ShellApi, Winapi.Windows,
  DMUnit;

type
  TImportType = (itBoreholes = 1, itSurvey = 2, itLithology = 3, itAssays = 4, itReserves = 5);

const
  ProcNames: array[1 .. 5] of string =
      ('ImportBoreholes', 'ImportSurvey', 'ImportLithology', 'ImportAssays', 'ImportReserves');

type
  TImporter = class
  private
    FImportType: TImportType;
    FProcName: string;
    FFiles: TStrings;
    procedure CreateTempTables();
    procedure FillTargetTables();
  public
    Messages: TStringList;
    constructor Create();
    destructor Destroy(); override;
    function Import(ImportType: TImportType; Files: TStrings): Boolean;
  end;

implementation
uses
  UtilsUnit;

{ TImporter }

constructor TImporter.Create();
begin
  Messages := TStringList.Create
end;

destructor TImporter.Destroy;
begin
  inherited;
end;

function TImporter.Import(ImportType: TImportType; Files: TStrings): Boolean;
begin
  FImportType := ImportType;
  FFiles := Files;
  FProcName := ProcNames[ord(FImportType)];
  CreateTempTables;
  FillTargetTables;
end;

procedure TImporter.CreateTempTables;
var
  Path, ParamString, LibPath: String;
  Res: DWord;
begin
  GetDir(0, Path);
  LibPath := 'lib\net5.0\DSCGImport.exe';
  ParamString := '"' + DM.GDBConnString + ';TrustServerCertificate=True" ' + (ord(FImportType)).ToString() + ' ' + FFiles.CommaText;
  ExecAppAndWait(LibPath, ParamString);
end;

procedure TImporter.FillTargetTables;
var
  Query: TADOQuery;
begin
  Query := DM.DoSQLQuery('exec ' + FProcName);
  Query.First;
  while not Query.Eof do
  begin
    Messages.Add(Query.FieldByName('Msg').AsString);
    Query.Next;
  end;
end;

end.
