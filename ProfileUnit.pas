unit ProfileUnit;

interface
uses
  Classes, SysUtils, Forms, Winapi.Windows, Controls, ExtCtrls, Vcl.ComCtrls,
  IOUtils, IniFiles,
  cxGridDBTableView, cxPC,
  MainUnit, DMUnit, QueryUnit, UtilsUnit;

function GetPermission(): Boolean;

procedure ActivateProfile(UserRole: TUserRole);
procedure TuneFrame(Frame: TFrame);
procedure TuneTabSheet(TabSheet: TcxTabSheet);
procedure TuneGrid(Grid: TcxGridDBTableView);
procedure TuneColumn(Grid: TcxGridDBTableView; Column: TcxGridDBColumn);
procedure TuneQueriesFrame;
procedure StoreSettings;
procedure RestoreSettings;
procedure StoreFormSettings;
procedure RestoreFormSettings;
procedure StoreFramesSettings;
procedure RestoreFramesSettings;
procedure StoreFrame(SettingsFile: TIniFile; Frame: TFrame);
procedure RestoreFrame(SettingsFile: TIniFile; Frame: TFrame);

implementation

var
  FUserRole: TUserRole;

procedure StoreSettings;
begin
  if IsProjectOpened then
  begin
    StoreFormSettings;
    StoreFramesSettings;
  end;
end;

procedure RestoreSettings;
begin
  RestoreFormSettings;
  RestoreFramesSettings;
end;

procedure StoreFormSettings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := OpenIniFile();
  try
    SettingsFile.WriteInteger ('MainForm', 'Top', MainForm.Top);
    SettingsFile.WriteInteger ('MainForm', 'Left', MainForm.Left);
    SettingsFile.WriteInteger ('MainForm', 'Width', MainForm.Width);
    SettingsFile.WriteInteger ('MainForm', 'Height', MainForm.Height);
    SettingsFile.WriteBool    ('MainForm', 'InitMax', MainForm.WindowState = wsMaximized );
    SettingsFile.WriteDateTime('MainForm', 'LastRun', Now);
  finally
    SettingsFile.Free;
  end;
end;

procedure RestoreFormSettings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := OpenIniFile();
  try
    MainForm.Top     := SettingsFile.ReadInteger('MainForm', 'Top', MainForm.Top );
    MainForm.Left    := SettingsFile.ReadInteger('MainForm', 'Left', MainForm.Left );
    MainForm.Width   := SettingsFile.ReadInteger('MainForm', 'Width', MainForm.Width );
    MainForm.Height  := SettingsFile.ReadInteger('MainForm', 'Height', MainForm.Height );
    case SettingsFile.ReadBool('MainForm', 'InitMax', MainForm.WindowState = wsMaximized) of
      true : MainForm.WindowState := wsMaximized;
      false: MainForm.WindowState := wsNormal;
    end
  finally
    SettingsFile.Free;
  end;
end;

procedure StoreFramesSettings;
var
  SettingsFile: TIniFile;
  Comp: TComponent;
  i: Integer;
begin
  SettingsFile := OpenIniFile();
  for i := 0 to MainForm.ComponentCount - 1 do
  begin
    Comp := MainForm.Components[i];
    if Comp is TFrame then
      StoreFrame(SettingsFile, Comp as TFrame);
  end;
  SettingsFile.Free;
end;

procedure StoreFrame(SettingsFile: TIniFile; Frame: TFrame);
var
  i: Integer;
  Comp: TComponent;
  Ctrl: TControl;
begin
  for i := 0 to Frame.ComponentCount - 1 do
  begin
    Comp := Frame.Components[i];
    if (Comp is TPanel) or (Comp is TPageControl) or (Comp is TTabControl) then
    begin
      SettingsFile.WriteInteger (Frame.Name + '.' + Comp.Name, 'Width', (Comp as TControl).Width);
      SettingsFile.WriteInteger (Frame.Name + '.' + Comp.Name, 'Height', (Comp as TControl).Height);
    end;
  end;
end;

procedure RestoreFrame(SettingsFile: TIniFile; Frame: TFrame);
var
  i: Integer;
  Comp: TComponent;
  Ctrl: TControl;
begin
  for i := 0 to Frame.ComponentCount - 1 do
  begin
    Comp := Frame.Components[i];
    if (Comp is TPanel) or (Comp is TPageControl) or (Comp is TTabControl) then
    begin
      (Comp as TControl).Width := SettingsFile.ReadInteger (Frame.Name + '.' + Comp.Name, 'Width', (Comp as TControl).Width);
      (Comp as TControl).Height := SettingsFile.ReadInteger (Frame.Name + '.' + Comp.Name, 'Height', (Comp as TControl).Height);
    end;
  end;
end;

procedure RestoreFramesSettings;
var
  SettingsFile: TIniFile;
  Comp: TComponent;
  i: Integer;
begin
  SettingsFile := OpenIniFile();
  for i := 0 to MainForm.ComponentCount - 1 do
  begin
    Comp := MainForm.Components[i];
    if Comp is TFrame then
      RestoreFrame(SettingsFile, Comp as TFrame);
  end;
  SettingsFile.Free;
end;

procedure ActivateProfile(UserRole: TUserRole);
var
  i: Integer;
  Comp: TComponent;
begin
  FUserRole := UserRole;
  for i := 0 to MainForm.ComponentCount - 1 do
  begin
    Comp := MainForm.Components[i];
    if Comp is TFrame then
      TuneFrame(Comp as TFrame);
  end;
end;

procedure TuneFrame(Frame: TFrame);
var
  i: Integer;
  Comp: TComponent;
begin
  for i := 0 to Frame.ComponentCount - 1 do
  begin
    Comp := Frame.Components[i];
    if Comp is TcxGridDBTableView then
      TuneGrid(Comp as TcxGridDBTableView);
    if Comp is TcxTabSheet then
      TuneTabSheet(Comp as TcxTabSheet);
  end;
  if Frame.Name = 'Queries' then
    TuneQueriesFrame;
end;

procedure TuneTabSheet(TabSheet: TcxTabSheet);
begin
  if TabSheet.Name = 'DebugSheet' then
  begin
    if (FUserRole = urSuperAdmin) then
      TabSheet.Visible := True
    else
      TabSheet.Visible := False;
  end;
end;

procedure TuneGrid(Grid: TcxGridDBTableView);
begin
  if Grid.ColumnCount > 0 then
    if Grid.Columns[0].Caption = 'Id' then begin
      TuneColumn(Grid, Grid.Columns[0]);
    end;
end;

procedure TuneColumn(Grid: TcxGridDBTableView; Column: TcxGridDBColumn);
begin
  if (FUserRole = urSuperAdmin) then
    Column.Visible := True
  else begin
    if (Grid.Name = 'RocksTableView') or
       (Grid.Name = 'AssayVarsTableView')
    then
      Column.Visible := True
    else
      Column.Visible := False;
  end;
end;

procedure TuneQueriesFrame;
begin
  MainForm.QueryFrame.DBMemo1.Enabled := GetPermission();
  MainForm.QueryFrame.DBMemo2.Enabled := GetPermission();
  MainForm.QueryFrame.ParamsGrid.Enabled := GetPermission();
  MainForm.QueryFrame.QueryTableView.Navigator.Visible := GetPermission();
end;

function GetPermission(): Boolean;
begin
  if (FUserRole = urSuperAdmin) then
    Result := True
  else
    Result := False;
end;

end.
