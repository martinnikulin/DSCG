unit LoginUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.StdCtrls, cxButtons, Vcl.Buttons;

type
  TLoginForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    UserCombo: TcxLookupComboBox;
    PassEdit: TEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation
uses
  DMUnit;
{$R *.dfm}

procedure TLoginForm.CancelButtonClick(Sender: TObject);
begin
    LoginForm.ModalResult := mrCancel;
    LoginForm.CloseModal;
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  UserCombo.EditValue := DM.Users.FieldByName('UserId').AsString;
end;

procedure TLoginForm.OKButtonClick(Sender: TObject);
begin
  if DM.CheckCredentials(PassEdit.Text) then begin
    LoginForm.ModalResult := mrOk;
    LoginForm.CloseModal;
  end;
end;

end.
