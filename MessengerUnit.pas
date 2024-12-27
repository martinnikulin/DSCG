unit MessengerUnit;

interface

uses
  System.Classes, System.DateUtils, System.SysUtils;

type
  TMessenger = class
    private
      FSourceView: String;
      FTargetView: String;
      FCommandText: String;
      FMessageText: String;
      FOnMessage: TNotifyEvent;
    protected
      procedure DoMessage; dynamic;
    public
      procedure SendMessage(SourceView: String; TargetView: String; CommandText: String; Text: String);
    published
      property SourceView: String read FSourceView write FSourceView;
      property TargetView: String read FTargetView write FTargetView;
      property CommandText: String read FCommandText write FCommandText;
      property MessageText: String read FMessageText write FMessageText;
      property OnMessage: TNotifyEvent read FOnMessage write FOnMessage;
  end;

var
  Messenger: TMessenger;

implementation

procedure TMessenger.DoMessage;
begin
  if Assigned(FOnMessage) then
    FOnMessage(Self);
end;

procedure TMessenger.SendMessage(SourceView: String; TargetView: String; CommandText: String; Text: String);
begin
  FSourceView := SourceView;
  FTargetView := TargetView;
  FCommandText := CommandText;
  FMessageText := Text;
  DoMessage;
end;

initialization

Messenger := TMessenger.Create;

end.

