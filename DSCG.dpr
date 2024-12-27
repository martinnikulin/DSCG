program DSCG;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DMLithologyUnit in 'Lithology\DMLithologyUnit.pas' {DMLithology: TDataModule},
  LithologyUnit in 'Lithology\LithologyUnit.pas' {LithologyFrame: TFrame},
  DMUnit in 'DMUnit.pas' {DM: TDataModule},
  MessengerUnit in 'MessengerUnit.pas',
  DMBoreholesUnit in 'Boreholes\DMBoreholesUnit.pas' {DMBoreholes: TDataModule},
  BoreholesUnit in 'Boreholes\BoreholesUnit.pas' {BoreholesFrame: TFrame},
  DMSeamsUnit in 'Seams\DMSeamsUnit.pas' {DMSeams: TDataModule},
  SeamsUnit in 'Seams\SeamsUnit.pas' {SeamsFrame: TFrame},
  AssaysUnit in 'Samples\AssaysUnit.pas' {AssaysForm},
  DMQueryUnit in 'Queries\DMQueryUnit.pas' {DMQuery: TDataModule},
  QueryResultUnit in 'Queries\QueryResultUnit.pas' {QueryResultForm},
  QueryUnit in 'Queries\QueryUnit.pas' {QueryFrame: TFrame},
  DMSettingsUnit in 'Settings\DMSettingsUnit.pas' {DMSettings: TDataModule},
  SettingsUnit in 'Settings\SettingsUnit.pas' {SettingsFrame: TFrame},
  DMReservesUnit in 'Reserves\DMReservesUnit.pas' {DMReserves: TDataModule},
  ReservesUnit in 'Reserves\ReservesUnit.pas' {ReservesFrame: TFrame},
  VariantUnit in 'VariantUnit.pas' {VariantForm},
  HoleseamsUnit in 'HoleSeams\HoleseamsUnit.pas' {HoleseamsFrame: TFrame},
  RequeryUnit in 'RequeryUnit.pas' {$R *.res},
  ColumnUnit in 'ColumnUnit.pas' {ColumnForm},
  ErrorsUnit in 'Reports\ErrorsUnit.pas',
  ProfileUnit in 'ProfileUnit.pas',
  ParamsFormUnit in 'ParamsFormUnit.pas' {ParamsForm},
  AveragesReportUnit in 'Reports\AveragesReportUnit.pas',
  DMReportsUnit in 'Reports\DMReportsUnit.pas' {DMReports: TDataModule},
  ProgressFormUnit in 'ProgressFormUnit.pas' {ProgressForm},
  AssaysReport in 'Reports\AssaysReport.pas' {$R *.res},
  UtilsUnit in 'UtilsUnit.pas' {$R *.res},
  LoginUnit in 'LoginUnit.pas' {LoginForm},
  CopyBlocksUnit in 'CopyBlocksUnit.pas' {CopyBlocksForm},
  ProjectionUnit in 'ProjectionUnit.pas',
  GeomUnit in 'Geometry\GeomUnit.pas' {GeomFrame: TFrame},
  DMGeomsUnit in 'Geometry\DMGeomsUnit.pas' {DMGeoms: TDataModule},
  SiteUnit in 'Site\SiteUnit.pas' {SiteFrame: TFrame},
  ImporterUnit in 'Importer\ImporterUnit.pas' {$R *.res},
  BMFormUnit in 'BMFormUnit.pas' {BlockModelForm},
  Vcl.Dialogs;
{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDMBoreholes, DMBoreholes);
  Application.CreateForm(TDMLithology, DMLithology);
  Application.CreateForm(TDMSeams, DMSeams);
  Application.CreateForm(TDMQuery, DMQuery);
  Application.CreateForm(TDMSettings, DMSettings);
  Application.CreateForm(TDMReserves, DMReserves);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TAssaysForm, AssaysForm);
  Application.CreateForm(TQueryResultForm, QueryResultForm);
  Application.CreateForm(TVariantForm, VariantForm);
  Application.CreateForm(TColumnForm, ColumnForm);
  Application.CreateForm(TDMReports, DMReports);
  Application.CreateForm(TProgressForm, ProgressForm);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TCopyBlocksForm, CopyBlocksForm);
  Application.CreateForm(TDMGeoms, DMGeoms);
  Application.CreateForm(TBlockModelForm, BlockModelForm);
  Application.Run;
end.
