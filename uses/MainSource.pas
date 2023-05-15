unit MainSource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, DB, StdCtrls, shellapi, strUtils,
  DateUtils, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, FdmDB, WinInet, WinSock, uHTTP,
  XSUperObject, XSuperJSON, RegularExpressions;

  function EncryptPass(const UserPass : String) : String;
  function DecryptPass(const InputPass : String) : String;
  function CekPayed : Boolean;
  Function GetIPAddress():String;
  function RemoveSpecialChars(CONST teks : String) : Boolean;
  function IsConnectedToInternet: Boolean;
  procedure SplitString (var arrDes : TStringList; str_src : string);
  function TitleCase(const s : string) : string;
  function ValidateEmail(const emailAddress: string): Boolean;
  function isDate ( const DateString: string ): boolean;
  function isTime ( const TimeString: string ): boolean;
Var
   StrPassword : String;
implementation

function ValidateEmail(const emailAddress: string): Boolean;
var
  RegEx: TRegEx;
begin
  RegEx := TRegex.Create('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]*[a-zA-Z0-9]+$');
  Result := RegEx.Match(emailAddress).Success;
end;

function isDate ( const DateString: string ): boolean;
begin
  try
    StrToDate ( DateString );
    result := true;
  except
    result := false;
  end;
end;

function isTime ( const TimeString: string ): boolean;
begin
  try
    StrToTime ( TimeString );
    result := true;
  except
    result := false;
  end;
end;

function TitleCase(const s : string) : string;
var
   i : integer;
begin
   if s = '' then
     Result := ''
   else begin
     Result := Uppercase(s[1]);
     for i := 2 to Length(s) do
       if s[i - 1] = ' ' then
         Result := Result + Uppercase(s[i])
       else
         Result := Result + Lowercase(s[i]);
   end;
end;

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

Function GetIPAddress():String;
type
  pu_long = ^u_long;
var
  varTWSAData : TWSAData;
  varPHostEnt : PHostEnt;
  varTInAddr : TInAddr;
  namebuf : Array[0..255] of AnsiChar;
begin
  If WSAStartup($101,varTWSAData) <> 0 Then
  Result := 'No. IP Address'
  Else Begin
    gethostname(namebuf,sizeof(namebuf));
    varPHostEnt := gethostbyname(namebuf);
    varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
    Result := inet_ntoa(varTInAddr);
  End;
  WSACleanup;
end;


function IsConnectedToInternet: Boolean;
begin
  with TIdHTTP.Create(nil) do
    try
      try
        HandleRedirects := True;
        Result := Get('https://www.google.com/') <> '';
      except
        on E : EIdHTTPProtocolException do
           begin
              //frmMain.StatusBar1.Panels[0].Text := 'Check Your Connection !!';
              Result := false;
           end;
        on E: Exception do
          begin
              //frmMain.StatusBar1.Panels[0].Text := 'Check Your Connection !!';
              Result := false;
          end;

      end;
    finally
      free;
    end;
end;

function CekPayed : Boolean;
begin
    {DMDB.qryServer1.Close;
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
    else if (DMDB.qryServer1.IsEmpty) then Result := False;}
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
