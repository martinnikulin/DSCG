unit AssaysUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, Buttons, cxPC, ExtCtrls, cxVGrid,
  cxDBVGrid, cxInplaceContainer, Menus, dxSkinsCore, dxSkinsDefaultPainters,
  dxDateRanges, cxButtons, cxContainer, cxCheckBox, cxTextEdit,
  dxScrollbarAnnotations;

Type
  TAssaysForm = class(TForm)
    AssaysGrid: TcxGrid;
    AssaysTableView: TcxGridDBTableView;
    AssaysGridLevel1: TcxGridLevel;
    AssaysTableViewdescription: TcxGridDBColumn;
    AssaysTableViewval: TcxGridDBColumn;
    AssaysTableViewGroupName: TcxGridDBColumn;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    AssaysTableViewnn: TcxGridDBColumn;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    AssaysTableViewChanged: TcxGridDBColumn;
    TabControl: TcxTabControl;
    procedure FormShow(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    Collapsed: Boolean;
    Tabs: TStrings;
    ActualTabIndex: Integer;
    TopRowIndex: Integer;
    procedure CreateTabs;
    procedure StoreAssayView;
    procedure RestoreAssayView;
  public
    procedure FillGrid;
  end;

var
  AssaysForm: TAssaysForm;

implementation
uses
  DMUnit, DMLithologyUnit;
{$R *.dfm}


procedure TAssaysForm.Button1Click(Sender: TObject);
begin
  StoreAssayView;
  DMLithology.UpdateAssays;
  Close;
end;

procedure TAssaysForm.Button2Click(Sender: TObject);
begin
  StoreAssayView;
  Close;
end;

procedure TAssaysForm.CheckBox1Click(Sender: TObject);
begin
  DMLithology.AssaysByGroup := CheckBox1.Checked;
  DMLithology.CDSAssaysSetGroup(1);
  TabControl.TabIndex := 0;
end;

procedure TAssaysForm.CreateTabs;
begin
  TabControl.OnChange := nil;
  TabControl.Tabs.Clear;
  Tabs := TStringList.Create;
  DMLithology.AssayGroups.First;
  while not DMLithology.AssayGroups.Eof do
  begin
    Tabs.Add(DMLithology.AssayGroups.FieldByName('GroupId').AsString);
    TabControl.Tabs.Add(DMLithology.AssayGroups.FieldByName('GroupName').AsString);
    DMLithology.AssayGroups.Next;
  end;
  TabControl.TabIndex := TabControl.Tabs.Count - 1;
  TabControl.OnChange := TabControlChange;
end;

procedure TAssaysForm.TabControlChange(Sender: TObject);
begin
  ActualTabIndex := TabControl.TabIndex;
  DMLithology.CDSAssaysSetGroup(StrToInt(Tabs[ActualTabIndex]));
end;

procedure TAssaysForm.FillGrid;
begin
  DMLithology.FillCDSAssays;
end;

procedure TAssaysForm.FormCreate(Sender: TObject);
begin
  ActualTabIndex := 0;
end;

procedure TAssaysForm.FormShow(Sender: TObject);
begin
  CreateTabs;
  FillGrid;
  RestoreAssayView;
  AssaysGrid.SetFocus;
end;

procedure TAssaysForm.Panel1Click(Sender: TObject);
begin
  DMLithology.AssaysByGroup := CheckBox1.Checked;
  DMLithology.CDSAssaysSetGroup(1);
  TabControl.TabIndex := 0;
end;

procedure TAssaysForm.RestoreAssayView;
begin
  TabControl.TabIndex := ActualTabIndex;
  DMLithology.RecallVarId;
  AssaysTableView.Controller.TopRowIndex := TopRowIndex;

end;

procedure TAssaysForm.StoreAssayView;
begin
  DMLithology.StoreVarId;
  TopRowIndex := AssaysTableView.Controller.TopRowIndex;
  ActualTabIndex := TabControl.TabIndex;
end;

end.
