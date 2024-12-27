unit ReservesUnit;

interface

uses
  ShellApi, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxDBLookupComboBox, cxDBExtLookupComboBox, cxContainer, Vcl.StdCtrls,
  cxGridCardView, cxGridDBCardView, cxGridCustomLayoutView, cxTextEdit, cxMemo,
  cxDBEdit, cxGridBandedTableView, cxGridDBBandedTableView, Vcl.ComCtrls,
  Vcl.DBCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, Vcl.Menus, StrUtils,
  cxCurrencyEdit,
  DMReservesUnit, ParamsFormUnit, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  dxScrollbarAnnotations;

Type
  TCopyMarks = record
   SeamId: Integer;
   ConditionId: Integer;
   Done: Boolean;
end;
Type
  TCopyBlock = record
   BlockId: Integer;
   ConditionId: Integer;
   VersionId: Integer;
   Done: Boolean;
end;
Type
  TReservesFrame = class(TFrame)
    Panel19: TPanel;
    Splitter8: TSplitter;
    Panel12: TPanel;
    SeamsGrid: TcxGrid;
    SeamsTableView: TcxGridDBTableView;
    SeamsTableViewshortname: TcxGridDBColumn;
    SeamsTableViewdescription: TcxGridDBColumn;
    SeamsGridLevel1: TcxGridLevel;
    VariantsGrid: TcxGrid;
    VariantsTableView: TcxGridDBTableView;
    VariantsTableViewnn: TcxGridDBColumn;
    VariantsTableViewcondname: TcxGridDBColumn;
    VariantsTableViewrealcondname: TcxGridDBColumn;
    VariantsGridLevel1: TcxGridLevel;
    HSGrid: TcxGrid;
    HSTableView: TcxGridDBTableView;
    HSTableViewholename: TcxGridDBColumn;
    HSTableViewcomments: TcxGridDBColumn;
    HSTableViewdepth_from: TcxGridDBColumn;
    HSTableViewdepth_to: TcxGridDBColumn;
    HSTableViewcoaltypename: TcxGridDBColumn;
    HSTableViewcoalgradename: TcxGridDBColumn;
    HSTableViewAd_coal: TcxGridDBColumn;
    HSTableViewAd_total: TcxGridDBColumn;
    HSTableViewth_coal: TcxGridDBColumn;
    HSTableViewth_total: TcxGridDBColumn;
    HSTableViewAvgCalc: TcxGridDBColumn;
    HSTableViewOnMap: TcxGridDBColumn;
    HSTableViewlock: TcxGridDBColumn;
    HSTableViewstat: TcxGridDBColumn;
    HSTableViewAd_avg: TcxGridDBColumn;
    HSTableViewcalcunit_id: TcxGridDBColumn;
    HSGridLevel1: TcxGridLevel;
    Panel20: TPanel;
    BlocksGrid: TcxGrid;
    BlocksTableView: TcxGridDBTableView;
    BlocksGridLevel1: TcxGridLevel;
    cxDBMemo2: TcxDBMemo;
    BlockDetailsGrid: TcxGrid;
    BlockDetailsTableView: TcxGridDBTableView;
    BlockDetailsTableViewarea: TcxGridDBColumn;
    BlockDetailsTableViewboundaryname: TcxGridDBColumn;
    BlockDetailsTableViewattr1name: TcxGridDBColumn;
    BlockDetailsTableViewZ: TcxGridDBColumn;
    BlockDetailsTableViewcoalgradename: TcxGridDBColumn;
    BlockDetailsTableViewpillarname: TcxGridDBColumn;
    BlockDetailsTableViewres_coal: TcxGridDBColumn;
    BlockDetailsTableViewres_total: TcxGridDBColumn;
    BlockDetailsGridLevel1: TcxGridLevel;
    Splitter11: TSplitter;
    HSMenu: TPopupMenu;
    N32: TMenuItem;
    TabControl1: TTabControl;
    PartCombo: TDBLookupComboBox;
    Label1: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    BlocksMenu: TPopupMenu;
    N10: TMenuItem;
    N45: TMenuItem;
    N18: TMenuItem;
    N46: TMenuItem;
    N65: TMenuItem;
    VariantsMenu: TPopupMenu;
    N27: TMenuItem;
    N28: TMenuItem;
    BlockUnitsMenu: TPopupMenu;
    IsoAdItem: TMenuItem;
    IsoThItem: TMenuItem;
    ProbeItem: TMenuItem;
    MenuItem6: TMenuItem;
    BlockUnitsGrid: TcxGrid;
    BlockUnitsTableView: TcxGridDBTableView;
    BlockUnitsTableViewholename: TcxGridDBColumn;
    BlockUnitsTableViewDepthFrom: TcxGridDBColumn;
    BlockUnitsTableViewDepthTo: TcxGridDBColumn;
    BlockUnitsTableViewAdCoal: TcxGridDBColumn;
    BlockUnitsTableViewAdFull: TcxGridDBColumn;
    BlockUnitsTableViewAdR: TcxGridDBColumn;
    BlockUnitsTableViewThCoal: TcxGridDBColumn;
    BlockUnitsTableViewThFull: TcxGridDBColumn;
    BlockUnitsTableViewThR: TcxGridDBColumn;
    BlockUnitsTableViewAvgCalc: TcxGridDBColumn;
    BlockUnitsGridLevel1: TcxGridLevel;
    Splitter3: TSplitter;
    SeamsMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BlockDetailsMenu: TPopupMenu;
    MenuItem10: TMenuItem;
    SeamsTableViewseam_id: TcxGridDBColumn;
    HSTableViewholeseam_id: TcxGridDBColumn;
    BlockUnitsTableViewHoleSeamId: TcxGridDBColumn;
    Panel1: TPanel;
    VariantsTableViewId: TcxGridDBColumn;
    N3: TMenuItem;
    HSTableViewAdR: TcxGridDBColumn;
    HSTableViewThR: TcxGridDBColumn;
    BlocksTableViewBlockId: TcxGridDBColumn;
    BlocksTableViewBlockName: TcxGridDBColumn;
    BlocksTableViewAdCoal: TcxGridDBColumn;
    BlocksTableViewAdFull: TcxGridDBColumn;
    BlocksTableViewThCoal: TcxGridDBColumn;
    BlocksTableViewThFull: TcxGridDBColumn;
    BlocksTableViewBalance: TcxGridDBColumn;
    BlocksTableViewCategory: TcxGridDBColumn;
    BlocksTableViewDip: TcxGridDBColumn;
    BlocksTableViewLock: TcxGridDBColumn;
    N4: TMenuItem;
    N5: TMenuItem;
    BlocksTableViewColumn1: TcxGridDBColumn;
    BlockDetailsTableViewId: TcxGridDBColumn;
    N6: TMenuItem;
    procedure HSTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N61Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure InterbedComboCloseUp(Sender: TObject);
    procedure PartComboCloseUp(Sender: TObject);
    procedure VersionComboCloseUp(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure VariantsMenuPopup(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure ProbeItemClick(Sender: TObject);
    procedure IsoThItemClick(Sender: TObject);
    procedure IsoAdItemClick(Sender: TObject);
    procedure HSTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure BlockUnitsTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure BlocksMenuPopup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure cxDBMemo2Exit(Sender: TObject);
    procedure cxDBMemo3Exit(Sender: TObject);
    procedure VariantsTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure VariantsTableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BlocksTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure HSTableViewDblClick(Sender: TObject);
    procedure BlockUnitsMenuPopup(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BlockDetailsTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    ACopyMarks: TCopyMarks;
    ACopyBlock: TCopyBlock;
    BlockId: integer;
    BlockName: string;
    procedure PaintAvgCalc(ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; AvgCalcFieldIndex: Integer);
    procedure MoveBlockToVariant;
    procedure MoveBlockToPart;
    procedure CopyBlock;
    procedure PasteBlock;
    procedure CopyMarks;
    procedure InsertHSBlockUnit;
    procedure InsertFreeBlockUnit(BlockUnitType: TBlockUnitType);
    procedure FillIsoMenu(MenuItem: TMenuItem; BlockUnitType: TBlockUnitType; Section: String; UnitName: String);
    procedure InsertIsoBlockUnit(Sender: TObject);
    procedure Interpolate(SeamId, InterbedId, CellSize, VarIndex: Integer; FileName: string);
  public
    Activated: Boolean;
    procedure Activate();
    procedure ChangeInterbed;
    procedure ExportBlokcAverages(AllSeams: Integer);
    procedure CreateBlockDetails;
    procedure CreateBlockModel;
  end;

implementation
uses
  MainUnit, VariantUnit, DMUnit, MessengerUnit, UtilsUnit, CopyBlocksUnit, BMFormUnit;

{$R *.dfm}

procedure TReservesFrame.Activate;
begin
  if not Activated then
  begin
    DMReserves.DisableControls;
    DMReserves.Initialize;
    DMReserves.EnableControls;
    Activated := True;
  end;
  DM.RequeryTables('Reserves');
  MainForm.IBCombo3.KeyValue := DM.Interbeds.FieldByName('InterbedId').Value;
end;

procedure TReservesFrame.HSTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  PaintAvgCalc(ACanvas, AViewInfo, HSTableViewAvgCalc.Index);
end;

procedure TReservesFrame.HSTableViewDblClick(Sender: TObject);
begin
  InsertHSBlockUnit;
end;

procedure TReservesFrame.BlockDetailsTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  val: String;
  AString: string;
  ARect: TRect;
  begin
    if AViewInfo.Item.Caption = 'Граница' then
    begin
      ARect := AViewInfo.Bounds;
      //ACanvas.DrawTexT('null1', ARect, 0, True);
      //LithologyTableView.Items[LithologyTableViewDepthFrom.Index].EditValue :=
      //BlockDetailsTableView.Controller.
      //val := BlockDetailsTableView.ViewData.Rows[AFocusedRecord.Index - 1].Values[LithologyTableViewDepthTo.Index];
      //ACanvas.Canvas.Brush.Color := RGB(192, 220, 192);
    end;
  end;

procedure TReservesFrame.BlocksMenuPopup(Sender: TObject);
begin
  N65.Enabled := ACopyBlock.Done;
end;

procedure TReservesFrame.BlocksTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  //Messenger.SendMessage('Reserve', 'Main', 'Text', 'BlockFRChanged');
end;

procedure TReservesFrame.BlockUnitsMenuPopup(Sender: TObject);
begin
  FillIsoMenu(IsoAdItem, utIsoAd, 'Зольность', '%');
  FillIsoMenu(IsoThItem, utIsoTh, 'Мощность', 'м')
end;

procedure TReservesFrame.FillIsoMenu(MenuItem: TMenuItem; BlockUnitType: TBlockUnitType; Section: String; UnitName: String);
var
  NewItem: TMenuItem;
  Value: Real;
begin
  DM.CondDefs.Parameters.ParamByName('Section').Value := Section;
  DM.CondDefs.Requery();
  DM.CondDefs.First;
  MenuItem.Clear;
  while not DM.CondDefs.Eof do
  begin
    NewItem := TMenuItem.Create(BlockUnitsMenu);
    MenuItem.Add(NewItem);
    NewItem.Caption := DM.CondDefs.Fields.FieldByName('CondName').AsString + ' ' + UnitName;
    NewItem.Tag := Round(StrToFloat(DM.CondDefs.Fields.FieldByName('CondName').AsString)*10.0);
    NewItem.OnClick := InsertIsoBlockUnit;
    DM.CondDefs.Next;
  end;
end;

procedure TReservesFrame.InsertIsoBlockUnit(Sender: TObject);
var
  MenuItem: TMenuItem;
  Value: Real;
begin
  MenuItem := Sender as TMenuItem;
  Value := MenuItem.Tag / 10;
  if MenuItem.Parent = IsoAdItem then
    DMReserves.InsertBlockUnit(utIsoAd, Value)
  else if MenuItem.Parent = IsoThItem then
    DMReserves.InsertBlockUnit(utIsoTh, Value);
end;

procedure TReservesFrame.BlockUnitsTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  PaintAvgCalc(ACanvas, AViewInfo, BlockUnitsTableViewAvgCalc.Index);
end;

procedure TReservesFrame.ChangeInterbed;
begin
  DMReserves.ChangeInterbed;
  PartCombo.KeyValue := DMReserves.Parts.FieldByName('PartId').Value;
end;

procedure TReservesFrame.CopyBlock;
begin
  ACopyBlock.BlockId := DMReserves.Blocks.FieldByName('BlockId').Value;
  ACopyBlock.ConditionId := DMReserves.Blocks.FieldByName('ConditionId').Value;
  ACopyBlock.VersionId := DMReserves.Blocks.FieldByName('VersionId').Value;
  ACopyBlock.Done := True;
end;

procedure TReservesFrame.CopyMarks;
begin
  ACopyMarks.SeamId := DMReserves.SeamConds.FieldByName('SeamId').Value;
  ACopyMarks.ConditionId := DMReserves.SeamConds.FieldByName('RealCondId').Value;
  ACopyMarks.Done := True;
end;

procedure TReservesFrame.CreateBlockDetails;
begin
  DMReserves.CreateBlockDetails;
end;

procedure TReservesFrame.CreateBlockModel;
var
  BlockModelForm: TBlockModelForm;
  SaveDialog: TSaveDialog;
begin
  BlockModelForm := TBlockModelForm.Create(nil);
  if BlockModelForm.ShowModal = mrOK then
  begin
    DMReserves.CreatePointsTable;
    SaveDialog := TSaveDialog.Create(nil);
    SaveDialog.DefaultExt := 'txt';
    SaveDialog.Filter := 'Текстовые файлы (*.txt)|*.txt';
    if SaveDialog.Execute then
      Interpolate(DM.Seams.FieldbyName('SeamId').Value,
                  DM.Interbeds.FieldByName('InterbedId').Value,
                  BlockModelForm.CellSizeEdit.Value,
                  BlockModelForm.VarCombo.ItemIndex + 1,
                  SaveDialog.FileName);
  end;
end;

procedure TReservesFrame.Interpolate(SeamId, InterbedId, CellSize, VarIndex: Integer; FileName: string);
var
  ParamString: String;
  Res: DWord;
  LibPath: String;
begin
  GetDir(0, LibPath);
  LibPath := LibPath + '\lib\Kriging.exe';
  ParamString := '"' + DM.GDBConnString + '" ' +  SeamId.ToString + ' ' +
                                                  InterbedId.ToString + ' ' +
                                                  VarIndex.ToString + ' ' +
                                                  CellSize.ToString + ' ' +
                                                  FileName;
  ExecAppAndWait(LibPath, ParamString);
end;

procedure TReservesFrame.cxDBMemo2Exit(Sender: TObject);
begin
  if (DMReserves.Blocks.State = dsEdit) or (DMReserves.Blocks.State = dsInsert)then DMReserves.Blocks.Post;
end;

procedure TReservesFrame.cxDBMemo3Exit(Sender: TObject);
begin
  if (DMReserves.BlockUnits.State = dsEdit) or (DMReserves.BlockUnits.State = dsInsert)then DMReserves.BlockUnits.Post;
end;

procedure TReservesFrame.HSTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ([ssCtrl] = Shift) and (key = VK_RETURN) then
    InsertHSBlockUnit;
end;

procedure TReservesFrame.InsertHSBlockUnit;
begin
    if DMReserves.HoleSeams.FieldByName('OnMap').AsBoolean then
      DMReserves.InsertBlockUnit(utHoleSeam, 0)
    else
      Messenger.SendMessage('Reservs', 'Main', 'Text', 'Это пластопересечение не помечено в подсчет');
end;

procedure TReservesFrame.InsertFreeBlockUnit(BlockUnitType: TBlockUnitType);
var
  ParamsForm: TParamsForm;
begin
    //DMReserves.InsertBlockUnit(BlockUnitType, ParamsForm.Output[0]);
end;

procedure TReservesFrame.InterbedComboCloseUp(Sender: TObject);
begin
  DMReserves.ChangeInterbed;
end;

procedure TReservesFrame.ExportBlokcAverages(AllSeams: Integer);
begin
//
end;

procedure TReservesFrame.GridExit(Sender: TObject);
var
 DataSet: TDataSet;
begin
  DataSet := ((Sender as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSource.DataSet;
  if (DataSet.State = dsEdit) or (DataSet.State = dsInsert)then DataSet.Post;
end;

procedure TReservesFrame.PaintAvgCalc(ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; AvgCalcFieldIndex: Integer);
var
  FieldName: string;
  Value: String;
begin
  FieldName := (AViewInfo.Item as TcxGridDBColumn).DataBinding.FieldName;
  if (FieldName = 'AdCoal') or (FieldName = 'AdFull') or
      (FieldName = 'ThCoal') or (FieldName = 'ThFull') or
      (FieldName = 'AdAvg') then
  begin
    Value := VarToStr(AViewInfo.GridRecord.Values[AvgCalcFieldIndex]);
    if (Value = 'True') and not (AViewInfo.GridRecord.Selected)
        then ACanvas.Canvas.Brush.Color := RGB(207, 222, 241);
  end;
end;

procedure TReservesFrame.MenuItem10Click(Sender: TObject);
begin
  DM.Boundaries.Requery();
  RequeryGridView(Sender);
end;

procedure TReservesFrame.IsoAdItemClick(Sender: TObject);
begin
  InsertFreeBlockUnit(utIsoAd);
end;

procedure TReservesFrame.IsoThItemClick(Sender: TObject);
begin
  InsertFreeBlockUnit(utIsoTh);
end;

procedure TReservesFrame.ProbeItemClick(Sender: TObject);
begin
  InsertFreeBlockUnit(utProbe);
end;

procedure TReservesFrame.MenuItem6Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TReservesFrame.MoveBlockToPart;
 var
  ParamsForm: TParamsForm;
  Params: TParamsArray;
  BlockId, PartId: Integer;
begin
  SetLength(Params, 1);
  Params[0].Name := 'Деталь'; Params[0].ParamType := ptLookup;
  DMReserves.Query.SQL.Text := 'select PartId, NPart from Parts where SeamId = :SeamId order by N';
  DMReserves.Query.DataSource := DMReserves.dsSeamConds;
  DMReserves.Query.Active := True;
  Params[0].ListSource := DMReserves.dsQuery;
  Params[0].Listfield := 'NPart';
  Params[0].KeyField := 'PartId';
  ParamsForm := TParamsForm.Create(self, 'Перенос блока в другую деталь', Params);
  if ParamsForm.ShowModal = mrOK then begin
    BlockId := DMReserves.Blocks.FieldByName('BlockId').AsInteger;
    PartId := ParamsForm.Output[0];
    DMReserves.MoveBlockToPart(PartId);
    RequeryGridView(BlocksTableView);
  end;
  DMReserves.Query.Active := False;
end;

procedure TReservesFrame.MoveBlockToVariant;
var
  BlockId, SourceCondId, TargetCondId, VersionId: Integer;
begin
  if VariantForm.ShowModal = mrOK then
  begin
    BlockId := DMReserves.Blocks.FieldByName('BlockId').AsInteger;
    SourceCondId := DMReserves.Blocks.FieldByName('ConditionId').AsInteger;
    TargetCondId := DM.Condition.FieldByName('Id').AsInteger;
    VersionId := DMReserves.Blocks.FieldByName('VersionId').AsInteger;
    if Int(SourceCondId / 100) = Int(TargetCondId / 100) then
    begin
      DMReserves.MoveBlockToVariant(BlockId, SourceCondId, TargetCondId, VersionId);
      RequeryGridView(BlocksTableView);
    end;
  end
    else
      Messenger.SendMessage('Reservs', 'Main', 'Text', 'Перенос разрешается только в пределах одного и того же разделющего прослоя');
end;

procedure TReservesFrame.N6Click(Sender: TObject);
begin
  DMReserves.CalculateBlock;
  RequeryGridView(BlocksTableView);
  RequeryGridView(BlockDetailsTableView);
end;

procedure TReservesFrame.N10Click(Sender: TObject);
begin
  DMReserves.CalculateBlocks;
  RequeryGridView(BlocksTableView);
  RequeryGridView(BlockDetailsTableView);
end;

procedure TReservesFrame.N18Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TReservesFrame.N1Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TReservesFrame.N22Click(Sender: TObject);
begin
  DMReserves.CalcCalcUnits;
end;

procedure TReservesFrame.N27Click(Sender: TObject);
begin
  CopyMarks;
end;

procedure TReservesFrame.N2Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TReservesFrame.N32Click(Sender: TObject);
begin
  RequeryGridView(Sender);
end;

procedure TReservesFrame.N3Click(Sender: TObject);
begin
  MoveBlockToPart;
end;

procedure TReservesFrame.N45Click(Sender: TObject);
begin
  MoveBlockToVariant;
end;

procedure TReservesFrame.N46Click(Sender: TObject);
begin
  CopyBlock;
end;

procedure TReservesFrame.N65Click(Sender: TObject);
begin
  PasteBlock;
end;

procedure TReservesFrame.N48Click(Sender: TObject);
var
  i: integer;
begin
//
end;

procedure TReservesFrame.N50Click(Sender: TObject);
begin
  DMReserves.CalcAverages(1);
end;

procedure TReservesFrame.N5Click(Sender: TObject);
begin
  if CopyBlocksForm.ShowModal = mrOK then
    DMReserves.CopyBlocks(CopyBlocksForm.ScopeCombo.ItemIndex);
end;

procedure TReservesFrame.N49Click(Sender: TObject);
begin
  DMReserves.CalcAverages(2);
end;

procedure TReservesFrame.N4Click(Sender: TObject);
begin
  DMReserves.DeleteBlock();
  RequeryGridView(BlocksTableView);
end;

procedure TReservesFrame.N61Click(Sender: TObject);
var
  i: integer;
begin
//
end;

procedure TReservesFrame.PartComboCloseUp(Sender: TObject);
begin
  DMReserves.ChangePart;
end;

procedure TReservesFrame.PasteBlock;
begin
  if ACopyBlock.Done then
    DMReserves.PasteBlock(ACopyBlock.BlockId,
                        ACopyBlock.ConditionId,
                        DMReserves.SeamConds.FieldByName('RealCondId').AsInteger,
                        ACopyBlock.VersionId,
                        DMReserves.Versions.FieldByName('Id').AsInteger);
end;

procedure TReservesFrame.VariantsMenuPopup(Sender: TObject);
begin
  N28.Enabled := ACopyMarks.Done;
end;

procedure TReservesFrame.VariantsTableViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  //Messenger.SendMessage('Reserve', 'Main', 'Text', 'SeamCondsFRChanged');
  //DMReserves.Blocks.Locate('BlockName;ConditionId', VarArrayOf([BlockName, DMReserves.SeamConds.FieldByName('RealCondId').AsInteger]), [])
end;

procedure TReservesFrame.VariantsTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  PartCombo.KeyValue := DMReserves.Parts.FieldByName('PartId').Value;
end;

procedure TReservesFrame.VersionComboCloseUp(Sender: TObject);
begin
  DMReserves.ChangeVersion;
end;

end.

