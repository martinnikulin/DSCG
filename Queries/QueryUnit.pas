unit QueryUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, cxGridLevel,
  cxGridCardView, cxGridDBCardView, cxGridCustomLayoutView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Buttons, cxTextEdit, cxCalc, ADODB, StrUtils, ComObj,
  dxScrollbarAnnotations;

Type
  TQueryFrame = class(TFrame)
    Panel1: TPanel;
    QueryGrid: TcxGrid;
    QueryTableView: TcxGridDBTableView;
    QueryTableViewquerygroup: TcxGridDBColumn;
    QueryTableViewdescription: TcxGridDBColumn;
    QueryTableViewtemplate: TcxGridDBColumn;
    QueryTableViewusetemplate: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    DBMemo1: TDBMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ParamsGrid: TcxGrid;
    ParamsTableView: TcxGridDBTableView;
    ParamsTableViewnparam: TcxGridDBColumn;
    ParamsTableViewdescription: TcxGridDBColumn;
    ParamsTableViewparamtype: TcxGridDBColumn;
    ParamsTableViewreftable: TcxGridDBColumn;
    ParamsTableViewlistfield: TcxGridDBColumn;
    ParamsTableViewkeyfield: TcxGridDBColumn;
    ParamsGridLevel1: TcxGridLevel;
    DBMemo2: TDBMemo;
    QueryMenu: TPopupMenu;
    N1: TMenuItem;
    Splitter1: TSplitter;
    QueryTableViewquery_id: TcxGridDBColumn;
    ParamsTableViewquery_id: TcxGridDBColumn;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    procedure QueryTableViewDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
  private
    Expanded: Boolean;
    procedure MakeReport;
  public
    Activated: Boolean;
    procedure Activate();
    procedure SwitchView;
  end;

implementation
uses
  DMUnit, DMQueryUnit, QueryResultUnit, UtilsUnit;

{$R *.dfm}

{ TQueryFrame }

procedure TQueryFrame.Activate;
begin
  if not Activated then
  begin
    DMQuery.Initialize;
    QueryTableView.ViewData.Expand(True);
    Expanded := True;
    Activated := True;
  end;
end;

procedure TQueryFrame.DBMemo1Exit(Sender: TObject);
begin
  if (DMQuery.Queries.State = dsEdit) or (DMQuery.Queries.State = dsInsert)then DMQuery.Queries.Post;
end;

procedure TQueryFrame.GridExit(Sender: TObject);
var
 DataSet: TDataSet;
begin
  DataSet := ((Sender as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSource.DataSet;
  if (DataSet.State = dsEdit) or (DataSet.State = dsInsert)then DataSet.Post;

  //if (DMQuery.Queries.State = dsEdit) or (DMQuery.Queries.State = dsInsert)then DMQuery.Queries.Post;
end;


procedure TQueryFrame.N1Click(Sender: TObject);
begin
  RequeryGridView(Sender);
  DMQuery.QueryParams.Requery();
end;


procedure TQueryFrame.MakeReport;
begin

end;

procedure TQueryFrame.QueryTableViewDblClick(Sender: TObject);
var
  ParamsForm: TForm;
  ParamFields: array of TControl;
  ParamLabels: array of TLabel;
  BitBtnOK: TBitBtn;
  BitBtnCancel: TBitBtn;
  i, j, k, ColCount, RowCount, FieldCount, BeginCol, BeginRow: integer;
  ExcelApp, Workbook, Worksheet, Range, Cell1, Cell2, ArrayData: OleVariant;
  s: string;
begin
  if DMQuery.QueryParams.RecordCount > 0 then
  begin
    ParamsForm := TForm.Create(self);
    ParamsForm.Width := 400;
    ParamsForm.Height := DMQuery.QueryParams.RecordCount * 40 + 80 + 35;
    ParamsForm.Position := poScreenCenter;
    ParamsForm.Caption := DMQuery.Queries.FieldByName('Description').Value;
    i := 0;
    DMQuery.QueryParams.First;
    while not DMQuery.QueryParams.Eof do
    begin
      SetLength(ParamFields, i + 1);
      SetLength(ParamLabels, i + 1);
      ParamLabels[i] := TLabel.Create(self);
      ParamLabels[i].Top := 30 + i * 40;
      ParamLabels[i].Left := 80;
      ParamLabels[i].Width := 5;
      ParamLabels[i].Alignment := taRightJustify;
      ParamLabels[i].Caption := DMQuery.QueryParams.FieldByName('Description').Value;
      ParamLabels[i].Parent := ParamsForm;

      if DMQuery.QueryParams.FieldByName('ParamType').Value = 'Lookup' then
        begin
          ParamFields[i] := TDBLookupComboBox.Create(self);
          for j := 0 to DMQuery.ComponentCount - 1 do
            begin
              if DMQuery.Components[j].Name = 'ds' + DMQuery.QueryParams.FieldByName('RefTable').Value then
                k := j;
            end;
          (ParamFields[i] as TDBLookupCombobox).ListSource := DMQuery.Components[k] as TDataSource;
          (ParamFields[i] as TDBLookupCombobox).Listfield := DMQuery.QueryParams.FieldByName('Listfield').Value;
          (ParamFields[i] as TDBLookupCombobox).KeyField := DMQuery.QueryParams.FieldByName('KeyField').Value;
          (ParamFields[i] as TDBLookupCombobox).Name := 'Combobox' + IntToStr(i);
        end;
      if DMQuery.QueryParams.FieldByName('ParamType').Value = 'String' then
        begin
          ParamFields[i] := TcxTextEdit.Create(self);
          (ParamFields[i] as TcxTextEdit).Name := 'TextEdit' + IntToStr(i);
          (ParamFields[i] as TcxTextEdit).EditValue := '';
        end;
      if DMQuery.QueryParams.FieldByName('ParamType').Value = 'Number' then
        begin
          ParamFields[i] := TcxCalcEdit.Create(self);
          (ParamFields[i] as TcxCalcEdit).Name := 'NumbEdit' + IntToStr(i);
        end;

      with ParamFields[i] do
        begin
          Parent := ParamsForm;
          Top := 30 + i * 40;
          Left := 100;
          Width := 250;
        end;
        i := i + 1;
      DMQuery.QueryParams.Next;
    end;
    i := i - 1;
    BitBtnOK := TBitBtn.Create(self);
    BitBtnOK.Parent := ParamsForm;
    BitBtnOK.ModalResult := mrOK;
    BitBtnOK.Caption := 'OK';
    BitBtnOK.Top := i * 40 + 80 + 5;
    BitBtnOK.Left := 119;
    BitBtnCancel := TBitBtn.Create(self);
    BitBtnCancel.Parent := ParamsForm;
    BitBtnCancel.ModalResult := mrCancel;
    BitBtnCancel.Caption := 'Отмена';
    BitBtnCancel.Top := i * 40 + 80 + 5;
    BitBtnCancel.Left := 207;
    try
      if ParamsForm.ShowModal = mrOK then
        begin
          DMQuery.ADOQuery.SQL.Clear;
          DMQuery.ADOQuery.SQL.Add(DMQuery.Queries.FieldByName('SQLText').Value);
          DMQuery.ADOQuery.Parameters.ParseSQL(DMQuery.Queries.FieldByName('SQLText').Value, true);
          for i := 0 to Length(ParamFields) - 1 do
            begin
              if leftstr(ParamFields[i].Name, 8) = 'Combobox' then
                begin
                  DMQuery.ADOQuery.Parameters[i].Attributes := [paNullable];
                  DMQuery.ADOQuery.Parameters[i].DataType := (ParamFields[i] as TDBLookupCombobox).ListSource.DataSet.FieldByName((ParamFields[i] as TDBLookupCombobox).KeyField).DataType;
                  if VarToStr((ParamFields[i] as TDBLookupCombobox).KeyValue) = '' then
                  DMQuery.ADOQuery.Parameters[i].Value := NULL
                else
                  DMQuery.ADOQuery.Parameters[i].Value := (ParamFields[i] as TDBLookupCombobox).KeyValue;
              end;
            if leftstr(ParamFields[i].Name, 8) = 'TextEdit' then
              begin
                DMQuery.ADOQuery.Parameters[i].Attributes := [paNullable];
                DMQuery.ADOQuery.Parameters[i].DataType := ftString;
                if VarToStr((ParamFields[i] as TcxTextEdit).EditValue) = '' then
                  DMQuery.ADOQuery.Parameters[i].Value := NULL
                else
                  DMQuery.ADOQuery.Parameters[i].Value := (ParamFields[i] as TcxTextEdit).EditValue;
              end;

          end;
      end;
    finally
      ParamsForm.Free;
    end;
  end
  else
  begin
    DMQuery.ADOQuery.SQL.Clear;
    DMQuery.ADOQuery.SQL.Add(DMQuery.Queries.FieldByName('SQLText').AsString);
  end;
  DMQuery.ADOQuery.Active := true;
  if (Trim(DMQuery.Queries.FieldByName('Template').AsString) = '') or DMQuery.Queries.FieldByName('Template').IsNull or (not DMQuery.Queries.FieldByName('UseTemplate').AsBoolean) then
    QueryResultForm.Show
  else
  begin
    GetDir(0, s);
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Workbooks.Add(s + '\Templates\' + Trim(DMQuery.Queries.FieldByName('Template').Value));
    WorkSheet := ExcelApp.ActiveWorkbook.ActiveSheet;
    ExcelApp.Visible := true;

    BeginCol := 1;
    BeginRow := WorkSheet.UsedRange.Rows.Count + 1;
    if not DMQuery.ADOQuery.Eof then
    begin
      // Размеры выводимого массива данных
      RowCount := DMQuery.ADOQuery.RecordCount;
      ColCount := DMQuery.ADOQuery.FieldCount;
      DMQuery.ADOQuery.First;
      ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
      for i := 1 to RowCount do
        begin
          for j := 0 to ColCount - 1 do
            begin
              if (DMQuery.ADOQuery.Fields.Fields[j].AsVariant <> null) then
                ArrayData[i, j + 1] := trimright(DMQuery.ADOQuery.Fields.Fields[j].AsVariant)
              else
                ArrayData[i, j + 1] := '';
            end;
          DMQuery.ADOQuery.Next;
        end;
      ExcelApp.Cells[1, 1].Select;
      Cell1 := WorkSheet.Cells[BeginRow, BeginCol];
      Cell2 := WorkSheet.Cells[BeginRow  + RowCount - 1, BeginCol + ColCount - 1];
      Range := WorkSheet.Range[Cell1, Cell2];
      Range.Value := ArrayData;
    end;
  end;
end;

procedure TQueryFrame.SwitchView;
begin
  if Expanded then
    QueryTableView.ViewData.Collapse(True)
  else
    QueryTableView.ViewData.Expand(True);
  Expanded := not Expanded;
end;

end.
