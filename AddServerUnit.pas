unit AddServerUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  DMUnit, ConnManagerUnit, UtilsUnit;

type
  TServerForm = class(TForm)
    LoginEdit: TEdit;
    PasswordEdit: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    NetTypeCombo: TComboBox;
    Label4: TLabel;
    ServerCombo: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure FillServerCombo;
  public
    ConnAttr: TConnAttr;
  end;

var
  ServerForm: TServerForm;

implementation

{$R *.dfm}

procedure TServerForm.BitBtn1Click(Sender: TObject);
begin
  ConnAttr.ServerName := ServerCombo.Text;
  ConnAttr.Login := LoginEdit.Text;
  ConnAttr.Password := PasswordEdit.Text;
  ConnAttr.NetType := TNetType(NetTypeCombo.ItemIndex);
end;

procedure TServerForm.FillServerCombo;
begin
  ServerCombo.Items := ConnMan.GetCatalogServerNames;
  if ServerCombo.Items.Count > 0 then
    ServerCombo.ItemIndex := 0;
end;

procedure TServerForm.FormShow(Sender: TObject);
begin
  FillServerCombo;
  if ConnAttr.ServerName <> '' then begin
    ServerCombo.ItemIndex := ServerCombo.Items.IndexOf(ConnAttr.ServerName);
    LoginEdit.Text := ConnAttr.Login;
    PasswordEdit.Text := ConnAttr.Password;
    NetTypeCombo.ItemIndex := Ord(ConnAttr.NetType);
  end;
end;

end.
