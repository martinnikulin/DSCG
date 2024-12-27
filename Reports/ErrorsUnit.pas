unit ErrorsUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, ComObj, Math,
  Variants, StrUtils, ShellAPI;

function FindErrors: Boolean;

implementation
uses
  DMUnit;

function FindErrors;
var
  TestList: TADOQuery;
  ErrorsList: TADOQuery;
  i, j: longint;
  errors: boolean;
  f1: TextFile;
  s: string;
  tempfile: string;
begin
  tempfile := GetEnvironmentVariable('TEMP') + '\DSCGErrors.txt';
  errors := false;
  TestList := TADOQuery.Create(nil);
  TestList.Connection := DM.GDBConnection;
  ErrorsList := TADOQuery.Create(nil);
  ErrorsList.Connection := DM.GDBConnection;
  TestList.SQL.Text := 'select sqltext, [description] from Queries where QueryGroup = ' + '''Errors''' + ' order by QueryId';
  TestList.Open;
  if not TestList.Eof then
  begin
    try
      AssignFile(f1, tempfile);
      Rewrite(f1);
      TestList.First;
      while not TestList.Eof do
      begin
        ErrorsList.SQL.Text := TestList.FieldByName('sqltext').Value ;
        ErrorsList.Open;
        if not ErrorsList.Eof then
        begin
          errors := true;
          Writeln(f1, TestList.FieldByName('description').Value);
          Writeln(f1, '');
          s := '';
          for j := 0 to ErrorsList.FieldCount - 1 do
          s := s + RightStr('                    ' + VarToStr(ErrorsList.Fields[j].FieldName), 20);
          Writeln(f1, s);
          Writeln(f1, '');
          while not ErrorsList.Eof do
          begin
            s := '';
            for j := 0 to ErrorsList.FieldCount - 1 do
              s := s + RightStr('                    ' + trim(VarToStr(ErrorsList.Fields[j].Value)), 20);
            Writeln(f1, s);
            ErrorsList.Next;
          end;
          Writeln(f1, '');
          Writeln(f1, '------------------------------------------------------------------------');
        end;
        ErrorsList.Close;
        TestList.Next;
      end;
    finally
      CloseFile(f1);
    end;
    Result := errors;
  end;
end;
end.
