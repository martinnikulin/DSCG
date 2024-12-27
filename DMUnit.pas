unit DMUnit;

interface

uses
  SysUtils, Classes, DB, ADODB, ADOint, Math, Dialogs, cxStyles, cxClasses, Controls,
  cxGridTableView, cxGridCardView, DBClient, Variants, StrUtils, MidasLib,
  UtilsUnit, MessengerUnit;

type
  TImportType = (ttBoreholes, ttSurvey, ttLithology, ttAssays, ttReserves = 5);

type
  TTableDef = record
    ImportType: String;
    NCols: Integer;
    ColumnDefs: TStringList;
  end;

Type
  TDM = class(TDataModule)
    GDBConnection: TADOConnection;
    DeletePart: TADOStoredProc;
    CopyIBChecks: TADOStoredProc;

    Interbeds: TADOQuery;
    dsInterbeds: TDataSource;
    HoleTypes: TADOQuery;
    dsHoleTypes: TDataSource;
    LineTypes: TADOQuery;
    dsLineTypes: TDataSource;
    CoalTypes: TADOQuery;
    dsCoalTypes: TDataSource;
    CoalGrades: TADOQuery;
    dsCoalGrades: TDataSource;
    Seams: TADOQuery;
    dsSeams: TDataSource;
    Rocks: TADOQuery;
    dsRocks: TDataSource;
    Boundaries: TADOQuery;
    dsBoundaries: TDataSource;
    Pillars: TADOQuery;
    dsPillars: TDataSource;
    Attributes: TADOQuery;
    dsAttributes: TDataSource;
    CoreGroups: TADOQuery;
    dsCoreGroups: TDataSource;
    Categories: TADOQuery;
    dsCategories: TDataSource;
    ADOQuery: TADOQuery;
    dsADOQuery: TDataSource;
    ADOCommand: TADOCommand;
    Formations: TADOQuery;
    dsFormations: TDataSource;
    AdTypes: TADOQuery;
    dsAdTypes: TDataSource;
    Condition: TADOQuery;
    dsCondition: TDataSource;
    dsListOfTables: TDataSource;
    ListOfTables: TClientDataSet;
    ListOfTablesViewName: TStringField;
    ListOfTablesTableName: TStringField;
    ListOfTablesRequery: TBooleanField;
    ListOfTablesQueryAddress: TLargeintField;
    ListOfTablesQueryName: TStringField;
    Settings: TADOQuery;
    ExcelTable: TADOTable;
    ExcelConnection: TADOConnection;
    AssayVars: TADOQuery;
    dsAssayVars: TDataSource;
    HomeCatConn: TADOConnection;
    RemoteCatConn: TADOConnection;
    Servers: TADOQuery;
    dsServers: TDataSource;
    Projects: TADOQuery;
    dsProjects: TDataSource;
    dsUsers: TDataSource;
    Users: TADOQuery;
    PreviousProjects: TADOQuery;
    dsPreviousProjects: TDataSource;
    ObjectsCoords: TADOQuery;
    dsObjectCoords: TDataSource;
    Project: TADOQuery;
    dsProject: TDataSource;
    CondDefs: TADOQuery;
    dsExcelTable: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    FProjectName: string;
    FConfConnString: string;
    FIniConnString: string;
    FProvider: string;
    FUserId: string;
    FUserPass: string;
    function ReadConfConnString(): string;
    function GetProvider(ConnString: string): string;
    function GetRemoteCatConnString(): string;
    function GetGDBConnString(): string;
  public
    DEFAULT_HOLETYPE: Integer;
    DEFAULT_LINETYPE: Integer;
    ConnAttr: TConnAttr;
    GDBConnString: String;
    function  ExecSQL(SQL: string): Boolean;
    function  DoSQLQuery(SQL: TStrings): TADOQuery; overload;
    function  DoSQLQuery(SQL: String): TADOQuery; overload;
    function  DoSQLQuery(SQL: TStrings; Conn: TADOConnection): TADOQuery; overload;
    function  DoSQLQuery(SQL: String; Conn: TADOConnection): TADOQuery; overload;
    function  CheckCredentials(Password: string): Boolean;
    procedure ConnectToHomeCat;
    procedure ConnectToRemoteCatalog;
    procedure ConnectToGDB;
    procedure InitDatabase;
    procedure DoSQLStatements(SQL: String); overload;
    procedure DoSQLStatements(SQL: TStrings); overload;
    procedure DoSQLStatements(SQL: String; Conn: TADOConnection); overload;
    procedure DoSQLStatements(SQL: TStrings; Conn: TADOConnection); overload;
    procedure SetFilter(DataSet: TDataSet; Filter: String);
    procedure OpenExcelTable(FileName: String);
    procedure ActivateSharedResources;
    procedure InitVariables;
    procedure SetTableToRequery(ViewName, TableName: String; TableNotToRequery: LargeInt);
    procedure RequeryTables(ViewName: String);
    procedure SyncProjectName;
  published
    property ProjectName: string read FProjectName write FProjectName;
  end;

var
  DM: TDM;

implementation
uses
  MainUnit, RequeryUnit, ProfileUnit, ParamsFormUnit;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  HomeCatConn.Connected := False;
  RemoteCatConn.Connected := False;
  GDBConnection.Connected := False;
  FillRequeryTable;
end;

procedure TDM.InitDatabase;
begin
//
end;

procedure TDM.InitVariables;
begin
  DEFAULT_HOLETYPE := 31;
  DEFAULT_LINETYPE := 37;
end;

function TDM.CheckCredentials(Password: string): Boolean;
begin
  Result := (Password = Users.FieldByName('Password').AsString);
end;

procedure TDM.ConnectToHomeCat;
begin
  FConfConnString := ReadConfConnString() + 'Persist Security Info=True;User ID=DSCG;Password=DSCG;';
  FIniConnString := FConfConnString + 'Initial Catalog=DSCGSystem';
  FProvider := GetProvider(FIniConnString);
  HomeCatConn.Connected := False;
  HomeCatConn.ConnectionString := FIniConnString;
  HomeCatConn.Connected := True;
  Servers.Active := True;
end;

procedure TDM.ConnectToRemoteCatalog;
begin
  RemoteCatConn.Connected := False;
  RemoteCatConn.ConnectionString := GetRemoteCatConnString();
  //ShowMessage('ConnectToRemoteCatalog' + RemoteCatConn.ConnectionString);
  RemoteCatConn.Connected := True;
  Users.Active := True;
  Projects.Active := True;
end;

procedure TDM.ConnectToGDB;
begin
  GDBConnection.Connected := False;
  GDBConnString := GetGDBConnString();
  GDBConnString := Copy(GDBConnString, Pos(';', GDBConnString) + 1, MaxInt);
  GDBConnection.ConnectionString := GetGDBConnString();
  GDBConnection.Connected := True;
  FProjectName := Projects.FieldByName('ProjectName').AsString;
end;

function TDM.ReadConfConnString: string;
var
  Strings: TStrings;
begin
  Strings := TStringList.Create;
  Strings.LoadFromFile('DSCG.conf');
  Result := Strings[0];
end;


function TDM.GetRemoteCatConnString: string;
begin
  if Servers.FieldByName('Id').AsInteger = 1 then
    Result := FIniConnString
  else
    Result := FProvider + ';Initial Catalog=DSCGSystem;Data Source=' +
            Servers.FieldByName('RemoteServer').AsString +
            ';User ID=DSCG;Password=DSCG';
end;

function TDM.GetGDBConnString: string;
begin
  if Servers.FieldByName('Id').AsInteger = 1 then
    Result := FConfConnString + ';Initial Catalog=' + Projects.FieldByName('Database').AsString
  else
    Result := FProvider + ';Data Source=' + Servers.FieldByName('RemoteServer').AsString +
            ';Initial Catalog=' + Projects.FieldByName('Database').AsString +
            ';User ID=DSCG;Password=DSCG';
end;

function TDM.GetProvider(ConnString: string): string;
var
  Strings: TStringList;
begin
  Strings := TStringList.Create;
  Strings.Delimiter := ';';
  Strings.StrictDelimiter := True;
  Strings.DelimitedText := ConnString;
  Result := Strings[0];
end;

procedure TDM.SetFilter(DataSet: TDataSet; Filter: String);
begin
  DataSet.Filtered := False;
  DataSet.Filter := Filter;
  DataSet.Filtered := True;
end;

procedure TDM.SyncProjectName;
begin
  if Settings.Locate('Section;ParamName', VarArrayOf(['Project','ProjectName']), []) then begin
    Settings.Edit;
    Settings.FieldByName('ParamValue').AsString := FProjectName;
    Settings.Post;
  end;
end;

procedure TDM.RequeryTables(ViewName: String);
var
  P: ^TADOQuery;
  Query: TADOQuery;
begin
  SetFilter(DM.ListOfTables, 'ViewName=' + QuotedStr(ViewName));
  ListOfTables.First;
  while not ListOfTables.Eof do
  begin
    if ListOfTablesRequery.Value then
    begin
      P := Pointer(ListOfTablesQueryAddress.Value);
      Query := P^;
      Query.Requery();
      ListOfTables.Edit;
      ListOfTablesRequery.Value := False;
      ListOfTables.Post;
    end;
    ListOfTables.Next;
  end;
  ListOfTables.Filtered := False;
end;

procedure TDM.SetTableToRequery(ViewName, TableName: String; TableNotToRequery: LargeInt);
begin
  SetFilter(DM.ListOfTables, 'TableName=' + QuotedStr(TableName) + 'and QueryAddress <> ' + IntToStr(TableNotToRequery));
  ListOfTables.First;
  with ListOfTables do
    while not Eof do
    begin
      Edit;
      ListOfTablesRequery.Value := True;
      Post;
      Next;
    end;
  ListOfTables.Filtered := False;
  RequeryTables(ViewName);
end;

procedure TDM.OpenExcelTable(FileName: String);
begin
  ExcelConnection.ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=' + FileName +
                                    ';Extended Properties="Excel 12.0;HDR=YES"';
  ExcelConnection.Connected := True;
  ExcelTable.Active := True;
end;

function TDM.ExecSQL(SQL: string): Boolean;
begin
  try
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add(SQL);
    ADOQuery.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TDM.DoSQLQuery(SQL: String): TADOQuery;
begin
  Result := DoSQLQuery(SQL, DM.GDBConnection);
end;

function TDM.DoSQLQuery(SQL: String; Conn: TADOConnection): TADOQuery;
var
  ADOQuery: TADOQuery;
begin
  ADOQuery := TADOQuery.Create(nil);
  ADOQuery.Connection := Conn;
  ADOQuery.SQL.Text := SQL;
  ADOQuery.Active := True;
  Result := ADOQuery;
end;

function TDM.DoSQLQuery(SQL: TStrings): TADOQuery;
begin
  Result := DoSQLQuery(SQL, DM.GDBConnection);
end;

function TDM.DoSQLQuery(SQL: TStrings; Conn: TADOConnection): TADOQuery;
var
  ADOQuery: TADOQuery;
begin
  ADOQuery := TADOQuery.Create(nil);
  ADOQuery.Connection := Conn;
  ADOQuery.SQL := SQL;
  ADOQuery.Active := True;
  Result := ADOQuery;
end;

procedure TDM.DoSQLStatements(SQL: String);
begin
  DoSQLStatements(SQL, GDBConnection);
end;

procedure TDM.DoSQLStatements(SQL: String; Conn: TADOConnection);
var
  ADOQuery: TADOQuery;
begin
  if SQL <> '' then
    try
      ADOQuery := TADOQuery.Create(nil);
      ADOQuery.Connection := Conn;
      ADOQuery.SQL.Text := SQL;
      Conn.BeginTrans;
      ADOQuery.ExecSQL;
      Conn.CommitTrans;
    except
      on E: Exception do begin
        Conn.RollbackTrans;
        raise Exception.Create(E.Message);
      end;
    end;
end;

procedure TDM.DoSQLStatements(SQL: TStrings);
begin
  DoSQLStatements(SQL, GDBConnection);
end;

procedure TDM.DoSQLStatements(SQL: TStrings; Conn: TADOConnection);
var
  ADOQuery: TADOQuery;
begin
  if SQL.Count > 0 then
    try
      ADOQuery := TADOQuery.Create(nil);
      ADOQuery.Connection := Conn;
      ADOQuery.SQL := SQL;
      Conn.BeginTrans;
      ADOQuery.ExecSQL;
      Conn.CommitTrans;
    except
      on E: Exception do begin
        DM.GDBConnection.RollbackTrans;
        raise Exception.Create(E.Message);
      end;
    end;
end;

procedure TDM.ActivateSharedResources;
begin
  InitVariables;
  Project.Active := True;
  PreviousProjects.Active := True;
  ObjectsCoords.Active := True;
  HoleTypes.Active := True;
  LineTypes.Active := True;
  Categories.Active := True;
  CoalTypes.Active := True;
  CoalGrades.Active := True;
  CoreGroups.Active := True;
  Interbeds.Active := True;
  Formations.Active := True;
  AdTypes.Active := True;
  Seams.Active := True;
  Rocks.Active := True;
  AssayVars.Active := True;
  Boundaries.Active := True;
  Pillars.Active := True;
  Attributes.Active := True;
  CondDefs.Active := True;
  Condition.Active := True;
  Settings.Active := True;
  Settings.Locate('section; paramname', VarArrayOf(['project', 'projectname']), []);
end;
//procedure TDM.CreateProject(ProjectName: String);
//var
//  ADOQuery: TADOQuery;
//begin
//  ADOQuery := TADOQuery.Create(nil);
//  ADOQuery.SQL.Add('declare @Database nvarchar(100);');
//  ADOQuery.SQL.Add('exec dbo.CreateGDB ' + QuotedStr(ProjectName) + ', 1, NULL');
//  ConnAttr.Database := 'DSCGSystem';
//  ADOQuery.Connection := GetConnection(ConnAttr);
//  ADOQuery.ExecSQL;
//  AdminProjects.Requery;
//  Projects.Requery;
//end;
//
//procedure TDM.CopyProject(DatabaseToCopy, NewProjectName: String);
//var
//  ADOQuery: TADOQuery;
//begin
//  ADOQuery := TADOQuery.Create(nil);
//  ADOQuery.SQL.Add('declare @Database nvarchar(100);');
//  ADOQuery.SQL.Add('exec dbo.CopyGDB ' +
//                    QuotedStr(NewProjectName) +
//                    ', 1, ' + QuotedStr(DatabaseToCopy) + ', NULL');
//  ConnAttr.Database := 'DSCGSystem';
//  ADOQuery.Connection := GetConnection(ConnAttr);
//  ADOQuery.ExecSQL;
//  AdminProjects.Requery;
//  Projects.Requery;
//end;


end.
