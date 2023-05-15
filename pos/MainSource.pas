unit MainSource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, MySQLMacroQuery, mySQLDbTables, DB, StdCtrls, shellapi, strUtils,
  DateUtils, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, FdmDB;
  function EncryptPass(const UserPass : String) : String;
  function DecryptPass(const InputPass : String) : String;
  function CekPayed : Boolean;
  function RemoveSpecialChars(CONST teks : String) : Boolean;
  procedure SplitString (var arrDes : TStringList; str_src : string);

Var
   StrPassword : String;
implementation


procedure SplitString (var arrDes : TStringList; str_src : string);
var
    delimeter : string;
    current_position : integer;
    current_string : string;

begin
    arrDes.Clear;
    delimeter := '?';
    current_string := str_src;
    while true do
    begin
        current_position := Pos (delimeter, current_string);
        if current_position = 0 then  // last item
        begin
            arrDes.Add (current_string);
            break;
        end;
        arrDes.Add (Copy (current_string, 1, current_position - 1));
        current_string := Copy (current_string, current_position + 1,
        length (current_string)- current_position);
    end;
end;

function CekPayed : Boolean;
begin
    DMDB.qryServer1.Close;
    DMDB.qryServer1.SQL.Clear;
    DMDB.qryServer1.SQL.Add('select valueconfig from app_config ' +
        'where namaconfig = ''' + 'SERVER_PAYED' + '''');
    DMDB.qryServer1.Open;
    if (not DMDB.qryServer1.IsEmpty) then
      begin
        if (DMDB.qryServer1.Fields[0].AsString = 'Y') then
          Result := True
        else if (DMDB.qryServer1.Fields[0].AsString = 'N') then
          Result := False;
      end
    else if (DMDB.qryServer1.IsEmpty) then Result := False;
end;


function EncryptPass(const UserPass : String) : String;
var
   i, jmlh, huruf : Integer;
   target, hasil : String;
   kodeEncript : Char;

begin
     hasil := '';
     jmlh := Length(UserPass);
     for i := 1 to jmlh  do
       begin
           target := Copy(UserPass, i, 1);
           kodeEncript := target[1];
           huruf := Ord(kodeEncript);
           huruf := huruf - 2;
           hasil := hasil + IntToStr(huruf) + '?';
       end;
       Result := hasil;
end;

function DecryptPass(const InputPass : String) : String;
var
    slNames : TStringList;
    i, vOrd, panjang : integer;
    dekript, nilai : String;
begin
     slNames := TStringList.Create;
     SplitString(slNames, InputPass);
     nilai := '';
     for i := 0 to slNames.Count - 1 do
        begin
             dekript := slNames[i];
             if (dekript <> '') then
               begin
                    vOrd := (StrToInt(dekript)) + 2;
                    nilai := nilai + Chr(vOrd);
                    //ShowMessage(nilai);
               end;
        end;
     Result := nilai;
     slNames.Free;
end;

function RemoveSpecialChars(CONST teks : STRING) : Boolean;
CONST
    InvalidChars : SET OF CHAR = ['\',',','.','/','!','@','#','$','%','^','&','*','''','"',';','_','(',')',':','|','[',']'];
VAR
    I : Cardinal;
begin
    Result:=True;
    FOR I:=1 TO LENGTH(teks) DO
      IF (teks[I] IN InvalidChars) THEN
         begin
             Result:=False;
         end
end;

END.
