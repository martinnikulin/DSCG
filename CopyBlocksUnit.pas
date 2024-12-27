unit CopyBlocksUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxLabel;

type
  TCopyBlocksForm = class(TForm)
    Label1: TLabel;
    ScopeCombo: TComboBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    VariantCombo: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure VariantComboCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CopyBlocksForm: TCopyBlocksForm;

implementation
uses
  DMReservesUnit;

{$R *.dfm}

procedure TCopyBlocksForm.FormShow(Sender: TObject);
begin
  VariantCombo.KeyValue := DMReserves.Variants.FieldByName('ConditionId').AsInteger;
end;

procedure TCopyBlocksForm.VariantComboCloseUp(Sender: TObject);
begin
  if DMReserves.Variants.FieldByName('ConditionId').AsInteger =
    DMReserves.Variants.FieldByName('InterbedId').AsInteger then
    //cxLabel1.Caption := 'Копирование всех блоков'
  else
    //cxLabel1.Caption := 'Копирование блоков данного варианта';
end;

end.
