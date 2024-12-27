unit ConnectionUnit;

interface
  function CheckCredentials(Login, Password: string): Boolean;
  procedure ConnectHomeCat;
  procedure SetRemoteCatConn;

implementation
uses
  DMunit;


function CheckCredentials(Login, Password: string): Boolean;
begin
  Result := (Password = DM.Users.FieldByName('Password').AsString);
end;

end.
