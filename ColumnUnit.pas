unit ColumnUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

Type
  THoleSeam = record
   BoreholeName: String;
   DepthFrom: Real;
   DepthTo: Real;
  end;

Type
  TLithology = record
   CoreId: Integer;
   ThNorm: Real;
   CoreNorm: Real;
   LithoText: String;
   TextShift: Integer;
   BrushColor: Integer;
  end;

Type
  TSample = record
   DepthFrom: Real;
   DepthTo: Real;
   Accepted: Boolean;
   Shift: Integer;
  end;

Type
  TColumnForm = class(TForm)
    PaintBox: TPaintBox;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Scale: Integer;
    DrawColor: Integer;
    TextShift: Integer;
    DipCoeff: Real;
    function GetLithology(): TLithology;
    function GetSample(): TSample;
    function GetHoleSeam(): THoleSeam;
    procedure WriteHoleName(HoleSeamInt: THoleSeam; X, Y: Integer);
    procedure DrawRoof(HS: THoleSeam; X, Y: Integer);
    procedure DrawBed(HS: THoleSeam; X, Y: Integer);
    procedure DrawInterval(LithInt: TLithology; X, Y: Integer);
    procedure WriteText(X, Y: Integer; TextHeight: Integer; Text: string; FontStyles: TFontStyles);
    procedure DrawRect(X, Y, W, H, BrushColor: Integer);
    procedure DrawColumn;
    procedure DrawLithology(HoleSeamInt: THoleSeam; X, Y: Integer);
    procedure DrawBracket(X, Y, H, Shift: Integer);
    procedure DrawSamples(HS: THoleSeam; X0, Y0: Integer);
  public
    { Public declarations }
  end;

const
  TextHeight: Integer = 15;
  ColumnWidth: Integer = 24;
  RockTextShift: Integer = 150;
  CoalTextShift: Integer = 50;
  TextShiftAd: Integer = 35;
  LevelShift: Integer = 5;
  CircleR: Integer = 3;
  CircleX: Integer = 8;
  X0: Integer = 185;
  Y0: Integer = 75;
  FirstIntervalHeight: Integer = 50;
var
  ColumnForm: TColumnForm;

implementation

uses DMUnit, DMLithologyUnit;

{$R *.dfm}


procedure TColumnForm.FormCreate(Sender: TObject);
begin
  Scale := 50;
end;

procedure TColumnForm.FormPaint(Sender: TObject);
var
  TextShift: Integer;
  H: Integer;
  Text: String;
begin
  TextShift := 20;
  PaintBox.Canvas.Brush.Color := clWindow;
  DipCoeff := 1;//cos(DMLithology.Lithology.FieldByName('Angle').Value / 180 * 57.2958);
  DrawColumn;
end;

procedure TColumnForm.DrawColumn;
var
  HoleSeamInt: THoleSeam;
  X, Y: Integer;
begin
  X := X0;
  Y := Y0;
  HoleSeamInt := GetHoleSeam;
  WriteHoleName(HoleSeamInt, X, Y);
  Y := Y + 50;
  DrawLithology(HoleSeamInt, X, Y);
  Y := Y0 + 50 + FirstIntervalHeight;
  DrawSamples(HoleSeamInt, X, Y);
end;

procedure TColumnForm.WriteHoleName(HoleSeamInt: THoleSeam; X, Y: Integer);
begin
  WriteText(X, Y, Round(TextHeight), HoleSeamInt.BoreholeName, [fsBold]);
end;

procedure TColumnForm.DrawLithology(HoleSeamInt: THoleSeam; X, Y: Integer);
var
  LithInt: TLithology;
begin
  DrawRoof(HoleSeamInt, X, Y);
  Y := Y + FirstIntervalHeight;
  DMLithology.ColumnLith.First;
  while not DMLithology.ColumnLith.Eof do
  begin
    LithInt := GetLithology;
    DrawInterval(LithInt, X, Y);
    Y := Y + Round(LithInt.ThNorm * Scale);
    DMLithology.ColumnLith.Next;
  end;
  DrawBed(HoleSeamInt, X, Y);
end;

procedure TColumnForm.DrawRoof(HS: THoleSeam; X, Y: Integer);
var
  Text: String;
begin
  PaintBox.Canvas.Brush.Color := clWindow;
  PaintBox.Canvas.Rectangle(X, Y, X + ColumnWidth, Y + FirstIntervalHeight);
  Text := FormatFloat('0.00', HS.DepthFrom);
  WriteText(X0 - ColumnWidth * 3,
            Y + FirstIntervalHeight - PaintBox.Canvas.TextHeight(Text),
            TextHeight, Text, [fsBold]);
end;

procedure TColumnForm.DrawBed(HS: THoleSeam; X, Y: Integer);
var
  Text: String;
begin
  PaintBox.Canvas.Brush.Color := clWindow;
  PaintBox.Canvas.Rectangle(X, Y, X + ColumnWidth, Y + FirstIntervalHeight);
  Text := FormatFloat('0.00', HS.DepthTo);
  WriteText(X0 - ColumnWidth * 3,
            Y + PaintBox.Canvas.TextHeight(Text),
            TextHeight, Text, [fsBold]);
end;

procedure TColumnForm.DrawSamples(HS: THoleSeam; X0, Y0: Integer);
var
  Sample: TSample;
  Y, H: Integer;
begin
  DMLithology.ColumnSamps.First;
  while not DMLithology.ColumnSamps.Eof do
  begin
    Sample := GetSample;
    Y := Y0 + Round((Sample.DepthFrom - HS.DepthFrom) * Scale);
    H := Round((Sample.DepthTo - Sample.DepthFrom) * Scale);
    DrawBracket(X0, Y, H, Sample.Shift);
    DMLithology.ColumnSamps.Next;
  end;
end;

procedure TColumnForm.DrawBracket(X, Y, H, Shift: Integer);
begin
  PaintBox.Canvas.MoveTo(X - Shift + 3, Y);
  PaintBox.Canvas.LineTo(X - Shift, Y);
  PaintBox.Canvas.LineTo(X - Shift, Y + H);
  PaintBox.Canvas.LineTo(X - Shift + 3, Y + H);
end;

function TColumnForm.GetHoleSeam: THoleSeam;
begin
  with Result do
  begin
    BoreholeName := DMLithology.LineHoles.FieldByName('HoleName').AsString;
    DepthFrom := DMLithology.HoleSeams.FieldByName('DepthFrom').Value;
    DepthTo := DMLithology.HoleSeams.FieldByName('DepthTo').Value;
  end;
end;

function TColumnForm.GetLithology(): TLithology;
begin
  with Result do
  begin
    CoreId := DMLithology.ColumnLith.FieldByName('RockGroupId').Value;
    ThNorm := DipCoeff * DMLithology.ColumnLith.FieldByName('Th').Value;
    CoreNorm := DipCoeff * DMLithology.ColumnLith.FieldByName('Core').Value;
    LithoText := DMLithology.ColumnLith.FieldByName('lithtext').Value;
    BrushColor := clWindow;
    TextShift := RockTextShift;
    if CoreId = 0 then
    begin
      BrushColor := clBlack;
      TextShift := CoalTextShift;
    end;
  end;
end;

function TColumnForm.GetSample: TSample;
begin
  with Result do
  begin
    DepthFrom := DMLithology.ColumnSamps.FieldByName('DepthFrom').Value;
    DepthTo := DMLithology.ColumnSamps.FieldByName('DepthTo').Value;
    Accepted := DMLithology.ColumnSamps.FieldByName('Accepted').Value;
    Shift := DMLithology.ColumnSamps.FieldByName('SampStage').Value * LevelShift + 10;
  end;
end;

procedure TColumnForm.DrawInterval(LithInt: TLithology; X, Y: Integer);
begin
  WriteText(X + LithInt.TextShift, Y + Round(LithInt.ThNorm * Scale / 2) - Round(TextHeight / 2), TextHeight, LithInt.LithoText, []);
  DrawRect(X, Y, ColumnWidth, Round(LithInt.ThNorm * Scale), LithInt.BrushColor);
end;

procedure TColumnForm.DrawRect(X, Y, W, H, BrushColor: Integer);
begin
  PaintBox.Canvas.Brush.Color := BrushColor;
  PaintBox.Canvas.Rectangle(X, Y, X + W, Y + H);
end;

procedure TColumnForm.WriteText(X, Y: Integer; TextHeight: Integer; Text: string; FontStyles: TFontStyles);
begin
  PaintBox.Canvas.Brush.Color := clWindow;
  PaintBox.Canvas.Font.Height := TextHeight;
  PaintBox.Canvas.Font.Style := FontStyles;
  PaintBox.Canvas.TextOut(X, Y, Text);
end;

// рисование анализов
//  PaintBox.Canvas.Font.Height := 12;
//  dm.qrySampleDraw.First;
//  i := 1;
//  while not dm.qrySampleDraw.Eof do
//    begin
//      if true then
//        begin
//          H := round(dm.qrySampleDrawth_norm.Value * columnscale);
//          Y := round((Y0 + dm.qrySampleDrawZ0.Value) * columnscale);
//
//          if dm.qrySampleDrawsampstage.Value = 1 then SW := l1;
//          if dm.qrySampleDrawsampstage.Value = 2 then SW := l2;
//          if dm.qrySampleDrawsampstage.Value = 3 then SW := l3;
//
//          if dm.qrySampleDrawaccepted.Value then
//            PaintBox.Canvas.Pen.Width := 2
//          else
//            PaintBox.Canvas.Pen.Width := 1;
//          PaintBox.Canvas.MoveTo(X - SW + 3, Y);
//          PaintBox.Canvas.LineTo(X - SW, Y);
//          PaintBox.Canvas.LineTo(X - SW, Y + H);
//          PaintBox.Canvas.LineTo(X - SW + 3, Y + H);
//
//          str := IntTostr(i);
//          PaintBox.Canvas.TextOut(X - SW - 10 , Y + round(H/2) - round(textheight/2), str);
//        end;
//        i := i + 1;
//        dm.qrySampleDraw.Next;
//      end;
//      Shape1.Height := Ymax + round(1 * columnscale);
//      ColumnForm.VertScrollBar.Range := Shape1.Height;
//      ColumnForm.Canvas.Draw(Shape1.Left, Shape1.Top,PaintBox);
//      PaintBox.Free;
end.
