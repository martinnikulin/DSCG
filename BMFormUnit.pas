unit BMFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  DMUnit, Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TBlockModelForm = class(TForm)
    InterbedCombo: TDBLookupComboBox;
    SeamCombo: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    VarCombo: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    CellSizeEdit: TcxSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BlockModelForm: TBlockModelForm;

implementation

{$R *.dfm}

end.
