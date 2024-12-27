unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  ShellAPI, StrUtils, ADODB,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, cxBarEditItem,
  dxRibbonCustomizationForm, cxTextEdit, cxContainer, cxEdit, dxSkinsForm,
  dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery, dxGalleryControl,
  dxRibbonBackstageViewGalleryControl, dxBarBuiltInMenu, cxPC,
  DMUnit, BoreholesUnit, LithologyUnit, ReservesUnit, SeamsUnit, QueryUnit, SettingsUnit, DMReportsUnit,
  MessengerUnit, ImporterUnit, UtilsUnit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, Data.DB, cxDBData, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxButtons, cxCheckBox, Vcl.DBCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, HoleseamsUnit, cxDropDownEdit, dxBarExtDBItems, dxBarExtItems,
  cxDBLookupComboBox, Vcl.Grids, Vcl.DBGrids, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxCustomListBox, cxListBox, Vcl.ComCtrls, dxCore,
  dxScrollbarAnnotations, GeomUnit, SiteUnit;

const
  UM_SHOWBACKSTAGE = WM_USER +1001;

Type
  TMainForm = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    BackstageView: TdxRibbonBackstageView;
    ProjectSheet: TdxRibbonBackstageViewTabSheet;
    StatusBar: TdxRibbonStatusBar;
    dxSkinController1: TdxSkinController;
    PageControl: TcxPageControl;
    BoreholesTab: TcxTabSheet;
    SeemsTab: TcxTabSheet;
    LithologyTab: TcxTabSheet;
    ReservesTab: TcxTabSheet;
    SettingsTab: TcxTabSheet;
    dxRibbon1Tab2: TdxRibbonTab;
    dxRibbon1Tab3: TdxRibbonTab;
    dxRibbon1Tab4: TdxRibbonTab;
    dxRibbon1Tab5: TdxRibbonTab;
    dxRibbon1Tab6: TdxRibbonTab;
    HoleseamTab: TcxTabSheet;
    dxRibbon1Tab7: TdxRibbonTab;
    dxBarManager1Bar2: TdxBar;
    dxBarButton2: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    IBCombo1: TdxBarLookupCombo;
    dxBarManager1Bar1: TdxBar;
    IBCombo2: TdxBarLookupCombo;
    dxBarStatic2: TdxBarStatic;
    dxBarManager1Bar3: TdxBar;
    dxBarStatic3: TdxBarStatic;
    IBCombo3: TdxBarLookupCombo;
    dxBarStatic4: TdxBarStatic;
    PartCombo: TdxBarLookupCombo;
    dxBarManager1Bar4: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarManager1Bar5: TdxBar;
    dxBarStatic5: TdxBarStatic;
    dxBarButton3: TdxBarButton;
    PopupMenu1: TPopupMenu;
    Requery1: TMenuItem;
    dxBarManager1Bar6: TdxBar;
    dxBarButton5: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem4: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    dxBarSubItem6: TdxBarSubItem;
    dxBarSubItem7: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarSubItem8: TdxBarSubItem;
    dxBarSubItem9: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton13: TdxBarButton;
    QueryTab: TcxTabSheet;
    dxBarManager1Bar8: TdxBar;
    dxBarSubItem10: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarButton12: TdxBarButton;
    cxBarEditItem1: TcxBarEditItem;
    cxBarEditItem2: TcxBarEditItem;
    dxBarSubItem11: TdxBarSubItem;
    dxBarListItem1: TdxBarListItem;
    dxBarCombo1: TdxBarCombo;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dxBarManager1Bar9: TdxBar;
    dxBarSubItem12: TdxBarSubItem;
    dxBarSubItem13: TdxBarSubItem;
    dxBarButton14: TdxBarButton;
    OpenDialog1: TOpenDialog;
    MsgMemo: TMemo;
    MemoPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    dxBarManager1Bar10: TdxBar;
    dxBarSubItem14: TdxBarSubItem;
    dxBarInPlaceSubItem1: TdxBarInPlaceSubItem;
    dxBarButton15: TdxBarButton;
    dxBarInPlaceSubItem2: TdxBarInPlaceSubItem;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarInPlaceSubItem3: TdxBarInPlaceSubItem;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    StartButton: TcxButton;
    ServerCombo: TDBLookupComboBox;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    Label1: TLabel;
    Label4: TLabel;
    ProjectsGridView: TcxGridDBTableView;
    ProjectsGridLevel1: TcxGridLevel;
    ProjectsGrid: TcxGrid;
    ProjectsGridViewProjectName: TcxGridDBColumn;
    Label2: TLabel;
    UserCombo: TcxLookupComboBox;
    Label3: TLabel;
    PassEdit: TEdit;
    PopupMenu2: TPopupMenu;
    RocksPopup: TPopupMenu;
    MenuItem1: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem2: TMenuItem;
    PassButton: TcxButton;
    dxRibbon1Tab8: TdxRibbonTab;
    GeomTab: TcxTabSheet;
    dxBarSubItem15: TdxBarSubItem;
    dxBarButton22: TdxBarButton;
    dxBarButton23: TdxBarButton;
    dxBarButton24: TdxBarButton;
    dxBarSubItem16: TdxBarSubItem;
    dxBarButton25: TdxBarButton;
    dxBarButton26: TdxBarButton;
    dxBarButton27: TdxBarButton;
    dxBarStatic6: TdxBarStatic;
    dxBarSubItem17: TdxBarSubItem;
    dxBarSubItem18: TdxBarSubItem;
    dxBarSubItem19: TdxBarSubItem;
    dxBarStatic7: TdxBarStatic;
    dxBarStatic8: TdxBarStatic;
    dxBarStatic9: TdxBarStatic;
    dxBarListItem2: TdxBarListItem;
    dxBarListItem3: TdxBarListItem;
    dxBarListItem4: TdxBarListItem;
    dxBarListItem5: TdxBarListItem;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarSubItem20: TdxBarSubItem;
    dxBarButton28: TdxBarButton;
    dxBarButton29: TdxBarButton;
    dxBarButton30: TdxBarButton;
    dxBarButton31: TdxBarButton;
    dxBarButton32: TdxBarButton;
    dxBarSubItem21: TdxBarSubItem;
    dxBarButton33: TdxBarButton;
    Splitter1: TSplitter;
    N3: TMenuItem;
    dxBarButton34: TdxBarButton;
    GeomFrame: TGeomFrame;
    HoleseamsFrame: THoleseamsFrame;
    QueryFrame: TQueryFrame;
    ReservesFrame: TReservesFrame;
    SeamsFrame: TSeamsFrame;
    SettingsFrame: TSettingsFrame;
    BoreholesFrame: TBoreholesFrame;
    LithologyFrame: TLithologyFrame;
    procedure FormCreate(Sender: TObject);
    procedure dxRibbon1TabChanged(Sender: TdxCustomRibbon);
    procedure PageControlChange(Sender: TObject);
    procedure BackstageViewPopup(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure Requery1Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton13Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton12Click(Sender: TObject);
    procedure IBCombo2Change(Sender: TObject);
    procedure IBCombo3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBCombo1Change(Sender: TObject);
    procedure dxBarButton14Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dxBarButton15Click(Sender: TObject);
    procedure dxBarButton16Click(Sender: TObject);
    procedure dxBarButton17Click(Sender: TObject);
    procedure dxBarButton18Click(Sender: TObject);
    procedure dxBarButton19Click(Sender: TObject);
    procedure dxBarButton20Click(Sender: TObject);
    procedure dxBarButton23Click(Sender: TObject);
    procedure ServerComboCloseUp(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure UserComboPropertiesChange(Sender: TObject);
    procedure UserComboPropertiesCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PassButtonClick(Sender: TObject);
    procedure dxBarButton25Click(Sender: TObject);
    procedure dxBarButton26Click(Sender: TObject);
    procedure ProjectsGridViewDblClick(Sender: TObject);
    procedure dxBarButton33Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure dxBarButton34Click(Sender: TObject);
  private
    IsCreated: Boolean;
    Logins: TStrings;
    ProjectId: Integer;
    UserRole: TUserRole;
    function  GetPass(Server: string; UserId: string): string;
    procedure InitFrames;
    procedure StartWork;
    procedure UmShowBackstage(var Message: TMessage); message UM_SHOWBACKSTAGE;
    procedure ProcessingMessage(Sender: TObject);
    procedure ChangePage;
    procedure Import(ImportType: TImportType);
    procedure RequeryTables(ImportType: TImportType);
    procedure CheckErrors;
    procedure ProcessText(Text: string);
    procedure ProcessCommand(ViewName: string; CommandText: string);
    procedure EnableControls;
    procedure ProjectIsChosen;
    procedure ShowMessages(Msg: String); overload;
    procedure ShowMessages(Msg: TStrings); overload;
    procedure HideMessages;
  public
  end;

var
  MainForm: TMainForm;
  IsProjectOpened: Boolean;

implementation
{$R *.dfm}
uses
  DMReservesUnit, ColumnUnit, ProfileUnit, ParamsFormUnit, ErrorsUnit, AveragesReportUnit,
  AssaysReport, DMLithologyUnit, LoginUnit;


{ TForm3 }

{$REGION 'BackstageView'}

procedure TMainForm.BackstageViewPopup(Sender: TObject);
begin
  PageControl.Visible := False;
  MainForm.Caption := '';
  DM.ConnectToHomeCat;
  ServerCombo.KeyValue := DM.Servers.FieldByName('Id').AsInteger;
  Logins := ReadLogins('GDBLogins');
  DM.ConnectToRemoteCatalog;
  UserCombo.EditValue := DM.Users.FieldByName('UserId').AsString;
end;

procedure TMainForm.ServerComboCloseUp(Sender: TObject);
begin
  DM.ConnectToRemoteCatalog;
  UserCombo.EditValue := DM.Users.FieldByName('UserId').AsString;
end;

procedure TMainForm.StartButtonClick(Sender: TObject);
begin
  ProjectIsChosen;
end;

procedure TMainForm.ProjectsGridViewDblClick(Sender: TObject);
begin
  ProjectIsChosen;
end;

procedure TMainForm.ProjectIsChosen;
begin
  if DM.CheckCredentials(PassEdit.Text) then begin
    UserRole := TUserRole(DM.Users.FieldByName('RoleId').AsInteger);
    StartWork;
  end;
end;

procedure TMainForm.StartWork;
var
  GDBConnAttr: TGDBConnAttr;
begin
  try
    DM.ConnectToGDB;
    StoreIniRecord('GDBLogins', ServerCombo.Text + ', ' + UserCombo.EditValue, PassEdit.Text);
    DM.InitDatabase;
    Caption := DM.ProjectName + IfThen(UserRole = urSuperAdmin, ' (' +DM.Projects.FieldByName('Database').AsString + ')');
    DM.ActivateSharedResources;
    InitFrames;
    RestoreSettings;
    ActivateProfile(UserRole);
    PageControl.Visible := True;
    dxRibbon1.Tabs[0].Active := True;
    //PageControl.ActivePageIndex := 0;
    ChangePage;
    IsProjectOpened := True;
    StatusBar.Panels[0].Text := '';
    BackStageView.ClosePopup;
  except
    on E: EDatabaseError do
      ShowMessage('Ну удалось подключиться базе данных');
    on E: Exception do
      ShowMessage(E.ClassName + ',  ' + E.Message);
  end;
end;

procedure TMainForm.TabControl1Change(Sender: TObject);
begin

end;

{$ENDREGION}

{$REGION 'Form'}
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StoreSettings;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DisableAero := True;
  dxBarWaitForSubMenuTime := 10000;
  IsCreated := True;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  PostMessage(Handle, UM_SHOWBACKSTAGE, Integer(Sender), 0);
  Messenger.OnMessage := ProcessingMessage;
end;

procedure TMainForm.ShowMessages(Msg: String);
begin
  MsgMemo.Clear;
  MsgMemo.Text := Msg;
  MsgMemo.Visible := True;
  Splitter1.Visible := True;
end;

procedure TMainForm.ShowMessages(Msg: TStrings);
begin
  MsgMemo.Clear;
  MsgMemo.Lines := Msg;
  MsgMemo.Visible := True;
  Splitter1.Visible := True;
end;

procedure TMainForm.HideMessages;
begin
  MsgMemo.Clear;
  Splitter1.Visible := False;
  MsgMemo.Visible := False;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  MsgMemo.Clear;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  Splitter1.Visible := False;
  MsgMemo.Clear;
  MsgMemo.Visible := False;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  MsgMemo.CopyToClipboard;
end;

procedure TMainForm.IBCombo1Change(Sender: TObject);
begin
  LithologyFrame.ChangeInterbed;
end;

procedure TMainForm.IBCombo2Change(Sender: TObject);
begin
  HoleSeamsFrame.ChangeInterbed;
end;

procedure TMainForm.IBCombo3Change(Sender: TObject);
begin
  ReservesFrame.ChangeInterbed;
end;

procedure TMainForm.Import(ImportType: TImportType);
var
  SaveDialog: TSaveDialog;
  Importer: TImporter;
  Files: TStrings;
  Msg: String;
begin
  SaveDialog := TSaveDialog.Create(nil);
  SaveDialog.DefaultExt := 'txt';
  SaveDialog.Filter := 'Файлы Excel (*.xlsx)|*.xlsx';
  if SaveDialog.Execute then
  begin
    Importer := TImporter.Create();
    Files := TStringList.Create;
    Files.Append(SaveDialog.FileName);
    ShowMessages('Импортирование данных началось. Ждите...');
    MainForm.Repaint;
    if Importer.Import(ImportType, Files) then
    begin
      RequeryTables(ImportType);
    end;
    if Importer.Messages.Count > 0 then
      ShowMessages(Importer.Messages);
    Importer.Free;
  end;
end;

procedure TMainForm.InitFrames;
begin
  BoreholesFrame.Activated := False;
  SeamsFrame.Activated := False;
  LithologyFrame.Activated := False;
  HoleSeamsFrame.Activated := False;
  ReservesFrame.Activated := False;
  QueryFrame.Activated := False;
  SettingsFrame.Activated := False;
end;

procedure TMainForm.PageControlChange(Sender: TObject);
begin
  ChangePage;
end;

procedure TMainForm.dxBarButton13Click(Sender: TObject);
begin
  CheckErrors;
end;

procedure TMainForm.dxBarButton14Click(Sender: TObject);
var
  Report: TAssaysReport;
  ParamsForm: TParamsForm;
  Params: TParamsArray;
begin
  DMReports.Interbeds.Active := True;
  DMReports.AssayGroups.Active := True;
  SetLength(Params, 2);
  with Params[0] do begin
    Name := 'Прослой';
    ParamType := ptLookup;
    ListSource := DMReports.dsInterbeds;
    ListField := 'InterbedName';
    KeyField := 'InterbedId';
  end;
  with Params[1] do begin
    Name := 'Группа';
    ParamType := ptLookup;
    ListSource := DMReports.dsAssayGroups;
    ListField := 'GroupName';
    KeyField := 'GroupId';
  end;
  ParamsForm := TParamsForm.Create(self, 'Таблица анализов', Params);
  if ParamsForm.ShowModal = mrOK then begin
    Report := TAssaysReport.Create(ParamsForm.Output[0], ParamsForm.Output[1]);
    Report.Write;
  end;
  ParamsForm.Destroy;
  DMReports.Interbeds.Active := False;
  DMReports.AssayGroups.Active := False;
end;

procedure TMainForm.dxBarButton15Click(Sender: TObject);
begin
  CheckErrors;
end;

procedure TMainForm.dxBarButton16Click(Sender: TObject);
begin
  Import(itBoreholes);
  DM.SetTableToRequery('Boreholes', 'Boreholes', 0);
end;

procedure TMainForm.dxBarButton17Click(Sender: TObject);
begin
  Import(itSurvey);
  DM.SetTableToRequery('Boreholes', 'Survey', 0);
end;

procedure TMainForm.dxBarButton18Click(Sender: TObject);
begin
  Import(itLithology);
  DM.SetTableToRequery('Boreholes', 'Lithology', 0);
end;

procedure TMainForm.dxBarButton25Click(Sender: TObject);
begin
//  Import(itAssays);
//  DM.SetTableToRequery('Lithology', 'Samples', 0);
end;

procedure TMainForm.dxBarButton33Click(Sender: TObject);
begin
//  Import(itReserves);
end;

procedure TMainForm.dxBarButton34Click(Sender: TObject);
begin
  ReservesFrame.CreateBlockModel;
end;

procedure TMainForm.dxBarButton26Click(Sender: TObject);
begin
  if MessageDlg('Существующие субблоки для всего пласта будут удалены. Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DMReserves.CreateBlockDetails;
end;

procedure TMainForm.dxBarButton19Click(Sender: TObject);
begin
  BoreholesFrame.ShiftCoordinates;
end;

procedure TMainForm.dxBarButton1Click(Sender: TObject);
begin
  QueryFrame.SwitchView;
end;

procedure TMainForm.dxBarButton20Click(Sender: TObject);
begin
  BoreholesFrame.ExchangeCoordinates;
end;

procedure TMainForm.dxBarButton23Click(Sender: TObject);
begin
  //SettingsFrame.CreateDetailBoundaries;
end;

procedure TMainForm.dxBarButton3Click(Sender: TObject);
begin
  SettingsFrame.SwitchView;
end;

procedure TMainForm.dxBarButton4Click(Sender: TObject);
begin
  ExportAveragesForOneSeam;
end;

procedure TMainForm.dxBarButton12Click(Sender: TObject);
begin
  ExportAveragesForAllSeams;
end;

procedure TMainForm.dxBarButton5Click(Sender: TObject);
begin
  ColumnForm.Show;
end;

procedure TMainForm.dxRibbon1TabChanged(Sender: TdxCustomRibbon);
begin
  PageControl.ActivePageIndex := dxRibbon1.ActiveTab.Index;
end;

procedure TMainForm.EnableControls;
begin

end;

procedure TMainForm.ProcessingMessage(Sender: TObject);
begin
  if Messenger.TargetView = 'Main' then
  begin
    if Messenger.CommandText = 'Text' then
      ProcessText(Messenger.MessageText)
    else
      ProcessCommand(Messenger.SourceView, Messenger.CommandText);
  end;
end;

procedure TMainForm.ProcessText(Text: string);
begin
  MsgMemo.Visible := True;
  Splitter1.Visible := True;
  MsgMemo.Lines.Add(Text);
  MsgMemo.SetFocus;
end;

procedure TMainForm.ProcessCommand(ViewName, CommandText: string);
begin
//  if ViewName = 'Settings' then
//  begin
//    if CommandText = 'Tools' then
//      dxBarManager1Bar7.Visible := True
//    else
//      dxBarManager1Bar7.Visible := False;
//  end;
end;

procedure TMainForm.ChangePage;
begin
  if MainForm.IsCreated then
    Case PageControl.ActivePageIndex of
      0: BoreholesFrame.Activate;
      1: SeamsFrame.Activate;
      2: LithologyFrame.Activate;
      3: HoleseamsFrame.Activate;
      4: ReservesFrame.Activate;
      5: QueryFrame.Activate;
      6: GeomFrame.Activate;
      7: SettingsFrame.Activate;
    End;
end;

procedure TMainForm.CheckErrors;
begin
  if not FindErrors then
    Messenger.SendMessage('Main', 'Main', 'Text', 'Ошибок не обнаружено')
  else
  begin
    Messenger.SendMessage('Main', 'Main', 'Text', 'Обнаружены ошибки');
    ShellExecute(Handle, 'open', 'c:\windows\notepad.exe', PChar(GetEnvironmentVariable('TEMP') + '\DSCGErrors.txt'), nil, SW_SHOWNORMAL);
  end;
end;

procedure TMainForm.PassButtonClick(Sender: TObject);
begin
  if PassButton.Down Then
    PassEdit.PasswordChar := Char(#0)
  else
    PassEdit.PasswordChar := '*';
end;

procedure TMainForm.Requery1Click(Sender: TObject);
begin
  DM.ListOfTables.Refresh;
end;

procedure TMainForm.RequeryTables(ImportType: TImportType);
begin
  if ImportType = itReserves then
  begin
    DM.SetTableToRequery('Boreholes', 'Boreholes', 0);
    DM.SetTableToRequery('Boreholes', 'Lines', 0);
    DM.SetTableToRequery('Boreholes', 'LineHoles', 0);
  end;
end;

procedure TMainForm.UmShowBackstage(var Message: TMessage);
begin
  dxRibbon1.ApplicationMenuPopup;
end;

procedure TMainForm.UserComboPropertiesChange(Sender: TObject);
begin
  PassEdit.Text := GetPass(ServerCombo.Text, UserCombo.EditValue);
  EnableControls;
end;

function TMainForm.GetPass(Server: string; UserId: string): string;
begin
  Result := Logins.Values[Server + ', ' + UserId];
end;

procedure TMainForm.UserComboPropertiesCloseUp(Sender: TObject);
begin

end;

{$ENDREGION}
end.
