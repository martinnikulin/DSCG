program DSCG1;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DMLithologyUnit in 'Lithology\DMLithologyUnit.pas' {DMLithology: TDataModule},
  LithologyUnit in 'Lithology\LithologyUnit.pas' {LithologyFrame: TFrame},
  DMUnit in 'DMUnit.pas' {DM: TDataModule},
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
  RequeryUnit in 'RequeryUnit.pas',
  ColumnUnit in 'ColumnUnit.pas' {ColumnForm},
  ErrorsUnit in 'Reports\ErrorsUnit.pas',
  ParamsFormUnit in 'ParamsFormUnit.pas' {ParamsForm},
  AveragesReportUnit in 'Reports\AveragesReportUnit.pas',
  DMReportsUnit in 'Reports\DMReportsUnit.pas' {DMReports: TDataModule},
  ProgressFormUnit in 'ProgressFormUnit.pas' {ProgressForm},
  AssaysReport in 'Reports\AssaysReport.pas' {$R *.res},
  ConnManagerUnit in '..\DSCG\ConnManagerUnit.pas',
  UtilsUnit in '..\DSCG\UtilsUnit.pas',
  ProfileUnit in '..\DSCG\ProfileUnit.pas',
  MessengerUnit in '..\DSCG\MessengerUnit.pas',
  AddServerUnit in '..\DSCG\AddServerUnit.pas' {ServerForm},
  ImporterUnit in '..\DSCG\ImporterUnit.pas';

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
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
