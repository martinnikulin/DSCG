unit BoreholesUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxTextEdit, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  Menus, ComCtrls, cxDBLookupComboBox, dxScrollbarAnnotations, cxCurrencyEdit,
  Vcl.Grids, Vcl.DBGrids;

Type
  TBoreholesFrame = class(TFrame)
    Panel11: TPanel;
    Splitter14: TSplitter;
    SurveyGrid: TcxGrid;
    SurveyGridTableView: TcxGridDBTableView;
    SurveyGridTableViewdepth: TcxGridDBColumn;
    SurveyGridTableViewdip: TcxGridDBColumn;
    SurveyGridTableViewazimuth: TcxGridDBColumn;
    SurveyGridLevel1: TcxGridLevel;
    BHGrid: TcxGrid;
    BHTableView: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Panel21: TPanel;
    Splitter16: TSplitter;
    SLGrid: TcxGrid;
    SLGridTableView: TcxGridDBTableView;
    SLGridTableViewsl_id: TcxGridDBColumn;
    SLGridTableViewnn: TcxGridDBColumn;
    SLGridTableViewdescription: TcxGridDBColumn;
    SLGridTableViewsltypename: TcxGridDBColumn;
    SLGridTableViewX1: TcxGridDBColumn;
    SLGridTableViewY1: TcxGridDBColumn;
    SLGridTableViewX2: TcxGridDBColumn;
    SLGridTableViewY2: TcxGridDBColumn;
    SLGridTableViewCalcSpreadAzimuths: TcxGridDBColumn;
    SLGridLevel1: TcxGridLevel;
    SLHGrid: TcxGrid;
    SLHGridTableView: TcxGridDBTableView;
    SLHGridTableViewhole_id: TcxGridDBColumn;
    SLHGridTableViewnn: TcxGridDBColumn;
    SLHGridTableViewholename: TcxGridDBColumn;
    SLHGridTableViewnode: TcxGridDBColumn;
    SLHGridTableViewshift: TcxGridDBColumn;
    SLHGridTableViewonprofile: TcxGridDBColumn;
    SLHGridTableViewX: TcxGridDBColumn;
    SLHGridTableViewY: TcxGridDBColumn;
    SLHGridTableViewZ: TcxGridDBColumn;
    SLHGridLevel1: TcxGridLevel;
    CheckBox3: TCheckBox;
    Splitter15: TSplitter;
    SLHMenu: TPopupMenu;
    N57: TMenuItem;
    N13: TMenuItem;
    N21: TMenuItem;
    SurveyMenu: TPopupMenu;
    N15: TMenuItem;
    CoordsMenu: TPopupMenu;
    N40: TMenuItem;
    N17: TMenuItem;
    SLMenu: TPopupMenu;
    N24: TMenuItem;
    TabControl1: TTabControl;
    TabControl2: TTabControl;
    N1: TMenuItem;
    N4: TMenuItem;
    procedure CheckBox3Click(Sender: TObject);
    procedure SLHGridTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N13Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure BHTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SLHGridTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure N15Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure GridExit(Sender: TObject);
  private
    procedure AddToSurveyLine;
    procedure DeleteBoreholeFromSL;
    procedure CalcStretchAzimuths;
    procedure DeleteBorehole;
    procedure OrderBoreholes;
    procedure CalcSLEnds(all: Boolean);
  public
    Activated: Boolean;
    procedure Activate;
    procedure ShiftCoordinates;
    procedure ExchangeCoordinates;
  end;

implementation
uses
  DMUnit, DMBoreholesUnit, MainUnit, ParamsFormUnit, MessengerUnit, UtilsUnit;
{$R *.dfm}

procedure TBoreholesFrame.Activate;
begin
  if not Activated then
  begin
    DMBoreholes.Initialize;
    Activated := True;
  end;
  DM.RequeryTables('Boreholes');
end;

procedure TBoreholesFrame.AddToSurveyLine;
begin
    if Checkbox3.Checked then
    begin
      if DMBoreholes.SurveyLines.FieldByName('LineId').Value <> 0 then
        DMBoreholes.AddToSurveyLine(DMBoreholes.SurveyLines.FieldByName('LineId').Value, DMBoreholes.Boreholes.FieldByName('BoreholeId').Value);
    end
    else
      Messenger.SendMessage('Boreholes', 'Main', 'Text', 'Для добавления скважины в разведочную линию установите флажок "По разведочным линиям"');
end;

procedure TBoreholesFrame.BHTableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ([ssCtrl] = Shift) and (key = VK_RETURN) then
    AddToSurveyLine;
end;

procedure TBoreholesFrame.CalcSLEnds(all: Boolean);
 var
  ParamsForm: TParamsForm;
  Params: TParamsArray;
begin
  SetLength(Params, 1);
  Params[0].Name := 'Дистанция'; Params[0].ParamType := ptNumber;
  ParamsForm := TParamsForm.Create(self, 'Рассчет концов разведочных линий', Params);
  if ParamsForm.ShowModal = mrOK then
  begin
    if all then
      DMBoreholes.CalcSLEnds(0, ParamsForm.Output[0])
    else
      DMBoreholes.CalcSLEnds(DMBoreholes.SurveyLines.FieldByName('sl_id').AsInteger, ParamsForm.Output[0]);
  end;
end;

procedure TBoreholesFrame.CalcStretchAzimuths;
begin
  if MessageDlg('Азимуты проецирования будут пересчитаны. Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DMBoreholes.CalcStretchAzimuths(DMBoreholes.SurveyLines.FieldByName('LineId').Value);
end;

procedure TBoreholesFrame.DeleteBorehole;
begin
   if MessageDlg('Скважина будет удалена из всех таблиц. Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DMBoreholes.DeleteBorehole(DMBoreholes.Boreholes.FieldByName('BoreholeId').Value);
end;

procedure TBoreholesFrame.DeleteBoreholeFromSL;
begin
  if MessageDlg('Скважина будет удалена из разведочной линии. Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DMBoreholes.DeleteBoreholeFromSL(DMBoreholes.SurveyLines.FieldByName('LineId').Value,
            DMBoreholes.LineHoles.FieldByName('BoreholeId').Value);
end;

procedure TBoreholesFrame.OrderBoreholes;
begin
  DMBoreholes.OrderBoreholes(DMBoreholes.SurveyLines.FieldByName('LineId').Value);
end;

procedure TBoreholesFrame.ShiftCoordinates;
var
  ParamsForm: TParamsForm;
  Params: TParamsArray;
begin
  SetLength(Params, 2);
  Params[0].Name := 'Сдвиг X'; Params[0].ParamType := ptNumber;
  Params[1].Name := 'Сдвиг Y'; Params[1].ParamType := ptNumber;
  ParamsForm := TParamsForm.Create(self, 'Сдвиг координат', Params);
  if ParamsForm.ShowModal = mrOK then
    DMBoreholes.ShiftCoordinates(ParamsForm.Output[0], ParamsForm.Output[1]);
end;

procedure TBoreholesFrame.ExchangeCoordinates;
begin
  if MessageDlg('Координаты скважины поменяются местами. Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DMBoreholes.ExchangeCoordinates;
end;

procedure TBoreholesFrame.GridExit(Sender: TObject);
var
 DataSet: TDataSet;
begin
  DataSet := ((Sender as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSource.DataSet;
  if (DataSet.State = dsEdit) or (DataSet.State = dsInsert)then DataSet.Post;
end;

procedure TBoreholesFrame.SLHGridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if not Checkbox3.Checked then
    DMBoreholes.SurveyLines.Locate('LineId', DMBoreholes.LineHoles.FieldByName('LineId').Value, []);
end;

procedure TBoreholesFrame.SLHGridTableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key = VK_DELETE) and
    (Checkbox3.Checked) and
    (DMBoreholes.SurveyLines.FieldByName('LineId').Value <> 0) then
        DeleteBoreholeFromSL;
end;

procedure TBoreholesFrame.CheckBox3Click(Sender: TObject);
begin
  DMBoreholes.LineHolesFilter(CheckBox3.Checked);
end;

procedure TBoreholesFrame.N13Click(Sender: TObject);
begin
  CalcStretchAzimuths;
end;

procedure TBoreholesFrame.N15Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TBoreholesFrame.N17Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TBoreholesFrame.N21Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TBoreholesFrame.N24Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TBoreholesFrame.N2Click(Sender: TObject);
begin
  CalcSLEnds(False);
end;

procedure TBoreholesFrame.N3Click(Sender: TObject);
begin
  CalcSLEnds(True);
end;

procedure TBoreholesFrame.N40Click(Sender: TObject);
begin
  DeleteBorehole;
end;

procedure TBoreholesFrame.N57Click(Sender: TObject);
begin
  OrderBoreholes;
end;

end.
