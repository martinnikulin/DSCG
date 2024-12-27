unit ParamsFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Data.DB, ADODB,
  cxCalc;

const
  FORM_WIDTH = 400;
  CONTROLS_LEFT = 200;
  CONTROLS_INTERVAL = 30;
  CONTROLS_WIDTH = 150;

Type
  TParamType = (ptString, ptNumber, ptLookup);

Type
 TParamDefs = record
  Name: String;
  ParamType: TParamType;
  ParamValue: Variant;
  ListSource: TDataSource;
  Listfield: String;
  KeyField: String;
 end;

Type
  TParamsArray = array of TParamDefs;

Type
  TParamsForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    Parameters: TParamsArray;
    procedure PlaceControls;
    procedure CreateControls;
    procedure SetFormSize;
    procedure CreateOutput;
    function  CreateEdit(): TEdit;
    function  CreateCalcEdit(Value: Variant): TcxCalcEdit;
    function  CreateCombo(Parameter: TParamDefs): TDBLookupCombobox;
  public
    Output: array of Variant;
    Controls: array of TControl;
    constructor Create(Owner: TComponent; Caption: String; Params: TParamsArray); overload;
  end;

implementation

{$R *.dfm}

{ TParamsForm }

constructor TParamsForm.Create(Owner: TComponent;
  Caption: String;
  Params: TParamsArray);
begin
  inherited Create(Owner);
  Parameters := Copy(Params, 0, MaxInt);
  self.Caption := Caption;
  SetFormSize;
  SetLength(Output, Length(Params));
  CreateControls;
  PlaceControls;
end;

procedure TParamsForm.CreateControls;
var
  i: Integer;
begin
  SetLength(Controls, Length(Parameters));
  for i := 0 to Length(Parameters) - 1 do
    case Parameters[i].ParamType of
      ptString: Controls[i] := CreateEdit();
      ptNumber: Controls[i] := CreateCalcEdit(Parameters[i].ParamValue);
      ptLookup: Controls[i] := CreateCombo(Parameters[i]);
    end;
end;

function TParamsForm.CreateEdit: TEdit;
begin
  Result := TEdit.Create(self);
end;

function TParamsForm.CreateCalcEdit(Value: Variant): TcxCalcEdit;
begin
  Result := TcxCalcEdit.Create(self);
  Result.Value := Value;
end;

function TParamsForm.CreateCombo(Parameter: TParamDefs): TDBLookupCombobox;
var
  DataSource: TDataSource;
begin
  Result := TDBLookupComboBox.Create(self);
  (Result as TDBLookupCombobox).ListSource := Parameter.ListSource;
  (Result as TDBLookupCombobox).Listfield := Parameter.Listfield;
  (Result as TDBLookupCombobox).KeyField := Parameter.KeyField;
  (Result as TDBLookupCombobox).KeyValue :=
    (Parameter.ListSource.DataSet as TADOQuery).FieldByName(Parameter.KeyField).Value;

end;

procedure TParamsForm.PlaceControls;
var
  i: Integer;
  ControlLabel: TLabel;
begin
  for i := 0 to Length(Controls) - 1 do
  begin
    if not (Controls[i] = nil) then
    begin
      ControlLabel := TLabel.Create(self);
      ControlLabel.Top := CONTROLS_INTERVAL * i + 20;
      ControlLabel.Left := CONTROLS_LEFT - 20;
      ControlLabel.Width := 0;
      ControlLabel.Parent := self;
      ControlLabel.Alignment := taRightJustify;
      ControlLabel.Caption := Parameters[i].Name;

      Controls[i].Parent := self;
      Controls[i].Top := CONTROLS_INTERVAL * i + 20;
      Controls[i].Left := CONTROLS_LEFT;
      Controls[i].Width := CONTROLS_WIDTH;
    end;
  end;
end;

procedure TParamsForm.SetFormSize;
begin
  Width := FORM_WIDTH;
  Height := Length(Parameters) * CONTROLS_INTERVAL + 120;
end;

procedure TParamsForm.BitBtn1Click(Sender: TObject);
begin
  CreateOutput;
end;

procedure TParamsForm.CreateOutput;
var
  i: Integer;
begin
  for i := 0 to Length(Parameters) - 1 do
    case Parameters[i].ParamType of
      ptString: Output[i] := (Controls[i] as TEdit).Text;
      ptNumber: Output[i] := (Controls[i] as TcxCalcEdit).Value;
      ptLookup: Output[i] := (Controls[i] as TDBLookupComboBox).KeyValue;
    end;
end;

end.
