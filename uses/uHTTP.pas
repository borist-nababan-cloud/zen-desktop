unit uHTTP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.UITypes, System.SysUtils, System.Variants,
  System.Classes, System.Threading, System.SyncObjs, System.IOUtils, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdURI,
  IdGlobal, IdMultipartFormData, IdHeaderList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,
  XSuperObject, XSuperJSON;

type
  TRequestMethod = (mGET, mPOST, mPUT, mDELETE);
  TRequestContentType = (rctJSON, rctWWWFormUrlEncoded, rctMultipartFormData);

  TQueryParam = class(TObject)
    FParams: TStringList;
  public
    constructor Create;
    destructor  Destroy;
  published
    procedure Add(aVariable, aValue: string);
    procedure Update(aVariable, aValue: string);
    procedure Delete(aVariable: string);
    function AsString: string;
  end;

  TFormEncodedParam = class(TObject)
    FToStream: TStringStream;
    FParams: TStringList;
  public
    constructor Create;
    destructor  Destroy;
  published
    procedure Add(aVariable, aValue: string);
    procedure Update(aVariable, aValue: string);
    procedure Delete(aVariable: string);
    function AsStream: TStringStream;
  end;

  TRequestURL = record
    URLPath: string;
    FilePath: string;
    FileName: string;
    Params: TQueryParam;
  end;

  TRequestPayload = record
    Data: TQueryParam;
    Files: TFileStream;
  end;

  TRequestCallbackAsVariant = reference to procedure(value: Variant; iHTTP: TIdHTTP);
  TRequestCallbackAsStream = reference to procedure(value: TMemoryStream; iHTTP: TIdHTTP);
  TRequestCallbackAsPicture = reference to procedure(value: TPicture; iHTTP: TIdHTTP);
  TRequestCallbackAsJSONObject = reference to procedure(value: XSuperObject.ISuperObject; iHTTP: TIdHTTP);
  TRequestCallbackAsJSONArray = reference to procedure(value: XSuperObject.ISuperArray; iHTTP: TIdHTTP);

  THTTPRequest_OnWorkBegin = reference to procedure(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
  THTTPRequest_OnWorkEnd = reference to procedure(ASender: TObject; AWorkMode: TWorkMode);
  THTTPRequest_OnWork = reference to procedure(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);

  TResponse = record
    Code: integer;
    Name: string;
    Info: string;
  end;

  THTTPRequest = class(TObject)
    FContentType: TRequestContentType;
    FAuthorization: string;
    FBaseURL: string;
    FQuery: TQueryParam;
    FPayload: TIdMultiPartFormDataStream;
    FFormEncoded: TFormEncodedParam;
    FResponse: TResponse;
    IHTTP: TIdHTTP;
    ISSL : TIdSSLIOHandlerSocketOpenSSL;
    FWorkCount: integer;
    FWorkCountMax: integer;
    evWorkBegin: TWorkBeginEvent;
    evWorkEnd: TWorkEndEvent;
    evWork: TWorkEvent;
  private
    function GetBaseURL: string;
    procedure SetBaseURL(const URL: string);
    function GetHTTP: TIdHTTP;
    procedure SetHTTP(const Client: TIdHTTP);
    function GetContentType: TRequestContentType;
    procedure SetContentType(const ContentType: TRequestContentType);
    function GetAuthorization: string;
    procedure SetAuthorization(const Token: string);
    function GetQuery: TQueryParam;
    procedure SetQuery(const QueryParam: TQueryParam);
    function GetPayload: TIdMultiPartFormDataStream;
    procedure SetPayload(const Payload: TIdMultiPartFormDataStream);
    function GetFormEncoded: TFormEncodedParam;
    procedure SetFormEncoded(const Body: TFormEncodedParam);
    function GetResponse: TResponse;
    procedure SetResponse(const Response: TResponse);
  public
    constructor Create;
    destructor  Destroy;

    function ResponseToJSONObject(Response: string): XSuperObject.ISuperObject;
    function TranslateResponse: TResponse;
    function GET(Callback: TRequestCallbackAsVariant): ITask; overload;
    function GET(Callback: TRequestCallbackAsJSONObject): ITask; overload;
    function GETSyncAsVariant: Variant;
    function GETSyncAsJSON: XSuperObject.ISuperObject;
    function GETIMAGE(Callback: TRequestCallbackAsStream): ITask;
    function GETFILESyncAsStream: TMemoryStream;
    function POST(RequestContentType: TRequestContentType; Callback: TRequestCallbackAsVariant): ITask; overload;
    function POST(RequestContentType: TRequestContentType;Callback: TRequestCallbackAsJSONObject): ITask; overload;
    function POSTSyncAsVariant(RequestContentType: TRequestContentType): Variant;
    function POSTSyncAsJSON(RequestContentType: TRequestContentType): XSuperObject.ISuperObject;
    function DELETE(Callback: TRequestCallbackAsVariant): ITask; overload;
    function DELETE(Callback: TRequestCallbackAsJSONObject): ITask; overload;
    function DELETESyncAsVariant: Variant;
    function DELETESyncAsJSON: XSuperObject.ISuperObject;
    function PUT(RequestContentType: TRequestContentType;Callback: TRequestCallbackAsVariant): ITask; overload;
    function PUT(RequestContentType: TRequestContentType;Callback: TRequestCallbackAsJSONObject): ITask; overload;
    function PUTSyncAsVariant(RequestContentType: TRequestContentType): Variant;
    function PUTSyncAsJSON(RequestContentType: TRequestContentType): XSuperObject.ISuperObject;
  published
    property BaseURL: string read GetBaseURL write SetBaseURL;
    property HTTP: TIdHTTP read IHTTP write IHTTP;
    property ContentType: TRequestContentType read GetContentType write SetContentType;
    property Authorization: string read GetAuthorization write SetAuthorization;
    property Query: TQueryParam read GetQuery write SetQuery;
    property Payload: TIdMultiPartFormDataStream read GetPayload write SetPayload;
    property FormEncoded: TFormEncodedParam read GetFormEncoded write SetFormEncoded;
    property Response: TResponse read GetResponse write SetResponse;
    property OnWorkBegin: TWorkBeginEvent read evWorkBegin write evWorkBegin;
    property OnWorkEnd: TWorkEndEvent read evWorkEnd write evWorkEnd;
    property OnWork: TWorkEvent read evWork write evWork;
  end;

  TDataJSON = class(TObject)
    data: XSuperObject.ISuperObject;
  end;

implementation

{$REGION 'TQueryParam'}
    constructor TQueryParam.Create;
    begin
         FParams := TStringList.Create;
         FParams.Clear;
         FParams.Delimiter := '&';
         FParams.NameValueSeparator := '=';
         FParams.StrictDelimiter := true;
    end;
    destructor TQueryParam.Destroy;
    begin
         FParams.Clear;
         FParams.Free;
    end;

    procedure TQueryParam.Add(aVariable, aValue: string);
    begin
         FParams.Add(
             TIdURI.ParamsEncode(aVariable, IndyTextEncoding_UTF8) +
             '=' +
             TIdURI.ParamsEncode(aValue, IndyTextEncoding_UTF8)
         );
    end;
    procedure TQueryParam.Update(aVariable, aValue: string);
    var VarIdx: integer;
    begin
         VarIdx := FParams.IndexOfName(aVariable);
         FParams.Strings[VarIdx] := aValue;
    end;
    procedure TQueryParam.Delete(aVariable: string);
    var VarIdx: integer;
    begin
         VarIdx := FParams.IndexOfName(aVariable);
         FParams.Delete(VarIdx);
    end;
    function TQueryParam.AsString: string;
    begin
         if (FParams.Count > 0)
            then Result := '?' + FParams.DelimitedText
            else Result := '';
    end;
{$ENDREGION}


{$REGION 'TFormEncodedParam'}
    constructor TFormEncodedParam.Create;
    begin
         FToStream := TStringStream.Create('');

         FParams := TStringList.Create;
         FParams.Clear;
         FParams.Delimiter := '&';
         FParams.NameValueSeparator := '=';
         FParams.StrictDelimiter := true;
    end;
    destructor TFormEncodedParam.Destroy;
    begin
         FToStream.Clear;
         FToStream.Free;

         FParams.Clear;
         FParams.Free;
    end;

    procedure TFormEncodedParam.Add(aVariable, aValue: string);
    begin
         FParams.Add(
             TIdURI.ParamsEncode(aVariable, IndyTextEncoding_UTF8) +
             '=' +
             TIdURI.ParamsEncode(aValue, IndyTextEncoding_UTF8)
         );
    end;
    procedure TFormEncodedParam.Update(aVariable, aValue: string);
    var VarIdx: integer;
    begin
         VarIdx := FParams.IndexOfName(aVariable);
         FParams.Strings[VarIdx] := aValue;
    end;
    procedure TFormEncodedParam.Delete(aVariable: string);
    var VarIdx: integer;
    begin
         VarIdx := FParams.IndexOfName(aVariable);
         FParams.Delete(VarIdx);
    end;
    function TFormEncodedParam.AsStream: TStringStream;
    begin
         if (FParams.Count > 0)
            then FToStream.WriteString(FParams.DelimitedText);
         Result := FToStream;
    end;
{$ENDREGION}


{$REGION 'THTTPRequest'}
    constructor THTTPRequest.Create;
    begin
         FQuery := TQueryParam.Create;
         FPayload := TIdMultiPartFormDataStream.Create;
         FFormEncoded := TFormEncodedParam.Create;

         ISSL  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
         with ISSL do
              begin
                   //Name := 'iSSL';
                   BoundPort := 0;
                   DefaultPort := 443;
                   IPVersion := Id_IPv4;
                   MaxLineAction := maException;
                   MaxLineLength := 16384;
                   Port := 0;
                   ReadTimeout := -1;
                   RecvBufferSize := 32768;
                   ReuseSocket := rsOSDependent;
                   SendBufferSize := 32768;

                   SSLOptions.Method := sslvSSLv23;
                   SSLOptions.Mode := sslmUnassigned;
                   SSLOptions.SSLVersions := [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
                   SSLOptions.VerifyDepth := 0;
                   UseNagle := true;
              end;

         IHTTP := TIdHTTP.Create(nil);
         with IHTTP do
              begin
                   //Name := 'iHTTP';
                   AllowCookies := true;
                   HandleRedirects := false;

                   IOHandler := ISSL;

                   //HTTPOptions := [hoForceEncodeParams, hoNonSSLProxyUseConnectVerb, hoNoProtocolErrorException];
                   HTTPOptions := [hoForceEncodeParams, hoNonSSLProxyUseConnectVerb];
                   MaxAuthRetries := 3;
                   ProtocolVersion := pv1_1;
                   RedirectMaximum := 15;
                   ReadTimeout := 6000;
                   ConnectTimeout := 6000;

                   //ProxyParams.ProxyServer := '127.0.0.1';
                   //ProxyParams.ProxyPort := 8888;

                   Request.Accept := 'application/json;text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
                   Request.CharSet := 'utf-8';
                   Request.ContentLength := -1;
                   Request.ContentRangeEnd := -1;
                   Request.ContentRangeInstanceLength := -1;
                   Request.ContentRangeStart := -1;
                   Request.ContentType := 'application/json';
                   Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2465.2 Safari/537.36';

                   OnWorkBegin := THTTPRequest(Self).evWorkBegin;
                   OnWorkEnd := THTTPRequest(Self).evWorkEnd;
                   OnWork := THTTPRequest(Self).evWork;
              end;
    end;
    destructor THTTPRequest.Destroy;
    begin
         IHTTP.IOHandler := nil;
         ISSL.Free;
         IHTTP.Free;
         FQuery.Free;
         FPayload.Free;
         FFormEncoded.Free;
    end;

    function  THTTPRequest.GetBaseURL: string;
    begin
         Result := FBaseURL;
    end;
    procedure THTTPRequest.SetBaseURL(const URL: string);
    begin
         FBaseURL := URL;
    end;
    function  THTTPRequest.GetHTTP: TIdHTTP;
    begin
         Result := IHTTP;
    end;
    procedure THTTPRequest.SetHTTP(const Client: TIdHTTP);
    begin
         IHTTP := Client;
    end;
    function  THTTPRequest.GetContentType: TRequestContentType;
    begin
         Result := FContentType;
    end;
    procedure THTTPRequest.SetContentType(const ContentType: TRequestContentType);
    begin
         case (ContentType) of
              rctJSON : begin
                  IHTTP.Request.ContentType := 'application/json';
              end;
              rctWWWFormUrlEncoded : begin
                  IHttp.Request.ContentType := 'application/x-www-form-urlencoded';
              end;
              rctMultipartFormData : begin
                  IHttp.Request.ContentType := 'multipart/form-data';
              end;
         end;
    end;
    function  THTTPRequest.GetAuthorization: string;
    begin
         Result := FAuthorization;
    end;
    procedure THTTPRequest.SetAuthorization(const Token: string);
    var
       authHeaderIdx: integer;
    begin
         if ((TOKEN <> '') and (FAuthorization <> TOKEN))
            then FAuthorization := TOKEN
            else FAuthorization := TOKEN;

         authHeaderIdx := iHttp.Request.CustomHeaders.IndexOfName('Authorization');
         if (authHeaderIdx < 0)
            then iHttp.Request.CustomHeaders.AddValue('Authorization', 'Token ' + FAuthorization)
            else iHttp.Request.CustomHeaders[authHeaderIdx] := 'Authorization: Token ' + FAuthorization;
    end;
    function  THTTPRequest.GetQuery: TQueryParam;
    begin
         Result := FQuery;
    end;
    procedure THTTPRequest.SetQuery(const QueryParam: TQueryParam);
    begin
         FQuery := QueryParam;
    end;
    function  THTTPRequest.GetPayload: TIdMultiPartFormDataStream;
    begin
         Result := FPayload;
    end;
    procedure THTTPRequest.SetPayload(const Payload: TIdMultiPartFormDataStream);
    begin
         FPayload := Payload;
    end;
    function  THTTPRequest.GetFormEncoded: TFormEncodedParam;
    begin
         Result := FFormEncoded;
    end;
    procedure THTTPRequest.SetFormEncoded(const Body: TFormEncodedParam);
    begin
         FFormEncoded := Body;
    end;

    function  THTTPRequest.GetResponse: TResponse;
    begin
         Result := FResponse;
    end;
    procedure THTTPRequest.SetResponse(const Response: TResponse);
    begin
         FResponse := Response;
    end;

    function THTTPRequest.ResponseToJSONObject(Response: string): XSuperObject.ISuperObject;
    var
       JSON, JSONX: XSuperObject.ISuperObject;
    begin
         JSON := XSuperObject.TSuperObject.Create(Response, false);
         JSONX := XSuperObject.TSuperObject.Create('{}', false);
         if (JSON.DataType = XSuperJSON.dtObject) then
            begin
                 JSONX.O['data'] := JSON.AsObject;
            end
         else if (JSON.DataType = XSuperJSON.dtArray) then
                 begin
                      JSONX.A['data'] := JSON.AsArray;
                 end;
         Result := JSONX;
    end;
    function THTTPRequest.TranslateResponse: TResponse;
    var
       RES : TResponse;
    begin
         RES.Code := IHTTP.ResponseCode;
         RES.Info := IHTTP.ResponseText;

         case (RES.Code) of
              200: begin
                  RES.Name := 'OK';
              end;
              201: begin
                  RES.Name := 'CREATED';
              end;
              202: begin
                  RES.Name := 'ACCEPTED';
              end;
              301: begin
                  RES.Name := 'MOVED_PERMANENTLY';
              end;
              400: begin
                  RES.Name := 'BAD_REQUEST';
              end;
              403: begin
                  RES.Name := 'FORBIDDEN';
              end;
              404: begin
                  RES.Name := 'NOT_FOUND';
              end;
              409: begin
                  RES.Name := 'CONFLICT';
              end;
              429: begin
                  RES.Name := 'TOO_MANY_REQUESTS';
              end;
              440: begin
                  RES.Name := 'REPO_PASSWD_REQUIRED';
              end;
              441: begin
                  RES.Name := 'REPO_PASSWD_MAGIC_REQUIRED';
              end;
              500: begin
                  RES.Name := 'INTERNAL_SERVER_ERROR';
              end;
              520: begin
                  RES.Name := 'OPERATION_FAILED';
              end;
         end;
         SetResponse(RES);
         Result := GetResponse;
    end;

    function THTTPRequest.GET(Callback: TRequestCallbackAsVariant): ITask;
    var
       aTask : ITask;
       rawResponse : string;
       objResponse : TResponse;
    begin
         aTask := TTask.Create(
             procedure
             begin
                  try
                     rawResponse := IHTTP.Get(FBaseURL + FQuery.AsString);
                     objResponse := TranslateResponse;
                  except on E: Exception do
                         begin
                              objResponse := TranslateResponse;
                              objResponse.Info := E.Message;
                              //Continue;
                         end;
                  end;

                  if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
                     begin
                          if ( (LeftStr(rawResponse, 1) = '"') and (RightStr(rawResponse, 1) = '"') )
                             then Callback(StringReplace(rawResponse, '"', '', [rfReplaceAll]), IHTTP)
                             else Callback(objResponse.Info, IHTTP);
                     end
                  else
                      begin
                           Callback(objResponse.Info, IHTTP);
                      end;
             end
         );
         //aTask.Start;
         Result := aTask;
    end;
    function THTTPRequest.GET(Callback: TRequestCallbackAsJSONObject): ITask;
    var
       aTask : ITask;
       rawResponse : string;
       objResponse : TResponse;
       JSONX : XSuperObject.ISuperObject;
    begin
         aTask := TTask.Create(
             procedure
             begin
                  try
                     rawResponse := IHTTP.Get(FBaseURL + FQuery.AsString);
                     objResponse := TranslateResponse;
                  except on E: Exception do
                         begin
                              objResponse := TranslateResponse;
                              objResponse.Info := E.Message;
                         end;
                  end;

                  if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
                     begin
                          JSONX := ResponseToJSONObject(rawResponse);
                          JSONX.B['ok'] := true;
                     end
                  else
                      begin
                           JSONX := XSuperObject.TSuperObject.Create('{}', false);
                           JSONX.B['ok'] := false;
                           JSONX.O['error'].AsObject.I['code'] := FResponse.Code;
                           JSONX.O['error'].AsObject.S['name'] := FResponse.Name;
                           JSONX.O['error'].AsObject.S['info'] := FResponse.Info;
                      end;

                  Callback(JSONX, IHTTP);
             end
         );
         //aTask.Start;
         Result := aTask;
    end;

    function THTTPRequest.GETSyncAsVariant: Variant;
    var
       rawResponse : string;
       objResponse : TResponse;
    begin
         try
            rawResponse := IHTTP.Get(FBaseURL + FQuery.AsString);
            objResponse := TranslateResponse;
         except on E: Exception do
                begin
                     objResponse := TranslateResponse;
                     objResponse.Info := E.Message;
                     //Continue;
                end;
         end;

         if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
            begin
                 if ( (LeftStr(rawResponse, 1) = '"') and (RightStr(rawResponse, 1) = '"') )
                    then Result := (StringReplace(rawResponse, '"', '', [rfReplaceAll]))
                    else Result := (objResponse.Info);
            end
         else Result := (objResponse.Info);
    end;
    function THTTPRequest.GETSyncAsJSON: XSuperObject.ISuperObject;
    var
       rawResponse : string;
       objResponse : TResponse;
       JSONX : XSuperObject.ISuperObject;
    begin
         try
            rawResponse := IHTTP.Get(FBaseURL + FQuery.AsString);
            objResponse := TranslateResponse;
         except on E: Exception do
                begin
                     objResponse := TranslateResponse;
                     objResponse.Info := E.Message;
                end;
         end;

         if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
            begin
                 JSONX := ResponseToJSONObject(rawResponse);
                 JSONX.B['ok'] := true;
            end
         else
             begin
                  JSONX := XSuperObject.TSuperObject.Create('{}', false);
                  JSONX.B['ok'] := false;
                  JSONX.O['error'].AsObject.I['code'] := FResponse.Code;
                  JSONX.O['error'].AsObject.S['name'] := FResponse.Name;
                  JSONX.O['error'].AsObject.S['info'] := FResponse.Info;
             end;

         Result := (JSONX);
    end;

    function THTTPRequest.GETIMAGE(Callback: TRequestCallbackAsStream): ITask;
    var
       aTask : ITask;
       response, url : string;
       mStream: TMemoryStream;
       jsonStream: XSuperObject.ISuperObject;
    begin
         mStream := TMemoryStream.Create;

         aTask := TTask.Create(
             procedure
             begin
                  try
                     mStream.Position := 0;
                     IHTTP.Get(FBaseURL, mStream);
                  except on E: Exception do
                         begin
                              jsonStream := XSuperObject.TSuperObject.Create('{}', false);
                              jsonStream.SaveTo(mStream, false, false);
                         end;
                  end;

                  //TranslateResponse;

                  if ( ( (IHTTP.ResponseCode = 200) or (IHTTP.ResponseCode = 201) or (IHTTP.ResponseCode = 202) ) and (mStream.Size > 0) ) then
                     begin
                          Callback(mStream, IHTTP);
                     end
                  else
                      begin
                           Callback(mStream, IHTTP);
                      end;
             end
         );
         //aTask.Start;
         Result := aTask;
    end;
    function THTTPRequest.GETFILESyncAsStream: TMemoryStream;
    var
       response, url : string;
       mStream: TMemoryStream;
       jsonStream: XSuperObject.ISuperObject;
    begin
         mStream := TMemoryStream.Create;

         try
            mStream.Position := 0;
            IHTTP.Get(FBaseURL, mStream);
         except on E: Exception do
                begin
                     jsonStream := XSuperObject.TSuperObject.Create('{}', false);
                     jsonStream.SaveTo(mStream, false, false);
                end;
         end;

         //TranslateResponse;

         if ( ( (IHTTP.ResponseCode = 200) or (IHTTP.ResponseCode = 201) or (IHTTP.ResponseCode = 202) ) and (mStream.Size > 0) ) then
            begin
                 Result := mStream;
            end
         else
             begin
                  Result := mStream;
             end;
    end;

    function THTTPRequest.POST(RequestContentType: TRequestContentType; Callback: TRequestCallbackAsVariant): ITask;
    var
       aTask : ITask;
       rawResponse : string;
       objResponse : TResponse;
    begin
         aTask := TTask.Create(
             procedure
             begin
                  try
                     case (RequestContentType) of
                          rctMultipartFormData: begin
                              SetContentType(rctMultipartFormData);
                              rawResponse := IHTTP.Post(FBaseURL + FQuery.AsString, FPayload);
                          end;
                          rctWWWFormUrlEncoded: begin
                              SetContentType(rctWWWFormUrlEncoded);
                              rawResponse := IHTTP.Post(FBaseURL + FQuery.AsString, FFormEncoded.AsStream);
                          end;
                     end;
                     objResponse := TranslateResponse;
                  except on E: Exception do
                         begin
                              objResponse := TranslateResponse;
                              objResponse.Info := E.Message;
                              //Continue;
                         end
                  end;

                  if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
                     begin
                          if ( (LeftStr(rawResponse, 1) = '"') and (RightStr(rawResponse, 1) = '"') )
                             then Callback(StringReplace(rawResponse, '"', '', [rfReplaceAll]), IHTTP)
                             else Callback(objResponse.Info, IHTTP);
                     end
                  else
                      begin
                           Callback(objResponse.Info, IHTTP);
                      end;
             end
         );
         //aTask.Start;
         Result := aTask;
    end;
    function THTTPRequest.POST(RequestContentType: TRequestContentType; Callback: TRequestCallbackAsJSONObject): ITask;
    var
       aTask : ITask;
       rawResponse : string;
       objResponse : TResponse;
       JSONX : XSuperObject.ISuperObject;
    begin
         aTask := TTask.Create(
             procedure
             begin
                  try
                     case (RequestContentType) of
                          rctMultipartFormData: begin
                              SetContentType(rctMultipartFormData);
                              rawResponse := IHTTP.Post(FBaseURL + FQuery.AsString, FPayload);
                          end;
                          rctWWWFormUrlEncoded: begin
                              SetContentType(rctWWWFormUrlEncoded);
                              rawResponse := IHTTP.Post(FBaseURL + FQuery.AsString, FFormEncoded.AsStream);
                          end;
                     end;
                     objResponse := TranslateResponse;
                  except on E: Exception do
                         begin
                              objResponse := TranslateResponse;
                              objResponse.Info := E.Message;
                         end;
                  end;

                  if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
                     begin
                          JSONX := ResponseToJSONObject(rawResponse);
                          JSONX.B['ok'] := true;
                     end
                  else
                      begin
                           JSONX := XSuperObject.TSuperObject.Create('{}', false);
                           JSONX.B['ok'] := false;
                           JSONX.O['error'].AsObject.I['code'] := FResponse.Code;
                           JSONX.O['error'].AsObject.S['name'] := FResponse.Name;
                           JSONX.O['error'].AsObject.S['info'] := FResponse.Info;
                      end;

                  Callback(JSONX, IHTTP);
             end
         );
         //aTask.Start;
         Result := aTask;
    end;

    function THTTPRequest.POSTSyncAsVariant(RequestContentType: TRequestContentType): Variant;
    var
       rawResponse : string;
       objResponse : TResponse;
    begin
         try
            case (RequestContentType) of
                 rctMultipartFormData: begin
                     SetContentType(rctMultipartFormData);
                     rawResponse := IHTTP.Post(FBaseURL + FQuery.AsString, FPayload);
                 end;
                 rctWWWFormUrlEncoded: begin
                     SetContentType(rctWWWFormUrlEncoded);
                     rawResponse := IHTTP.Post(FBaseURL + FQuery.AsString, FFormEncoded.AsStream);
                 end;
            end;
            objResponse := TranslateResponse;
         except on E: Exception do
                begin
                     objResponse := TranslateResponse;
                     objResponse.Info := E.Message;
                     //Continue;
                end
         end;

         if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
            begin
                 if ( (LeftStr(rawResponse, 1) = '"') and (RightStr(rawResponse, 1) = '"') )
                    then Result := (StringReplace(rawResponse, '"', '', [rfReplaceAll]))
                    else Result := (objResponse.Info);
            end
         else Result := (objResponse.Info);
    end;
    function THTTPRequest.POSTSyncAsJSON(RequestContentType: TRequestContentType): XSuperObject.ISuperObject;
    var
       rawResponse : string;
       objResponse : TResponse;
       JSONX : XSuperObject.ISuperObject;
    begin
         try
            case (RequestContentType) of
                 rctMultipartFormData: begin
                     SetContentType(rctMultipartFormData);
                     rawResponse := IHTTP.Post(FBaseURL + FQuery.AsString, FPayload);
                 end;
                 rctWWWFormUrlEncoded: begin
                     SetContentType(rctWWWFormUrlEncoded);
                     rawResponse := IHTTP.Post(FBaseURL + FQuery.AsString, FFormEncoded.AsStream);
                 end;
            end;
            objResponse := TranslateResponse;
         except on E: Exception do
                begin
                     objResponse := TranslateResponse;
                     objResponse.Info := E.Message;
                end;
         end;

         if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
            begin
                 JSONX := ResponseToJSONObject(rawResponse);
                 JSONX.B['ok'] := true;
            end
         else
             begin
                  JSONX := XSuperObject.TSuperObject.Create('{}', false);
                  JSONX.B['ok'] := false;
                  JSONX.O['error'].AsObject.I['code'] := FResponse.Code;
                  JSONX.O['error'].AsObject.S['name'] := FResponse.Name;
                  JSONX.O['error'].AsObject.S['info'] := FResponse.Info;
             end;

         Result := (JSONX);
    end;

    function THTTPRequest.DELETE(Callback: TRequestCallbackAsVariant): ITask;
    var
       aTask : ITask;
       rawResponse : string;
       objResponse : TResponse;
    begin
         aTask := TTask.Create(
             procedure
             begin
                  try
                     rawResponse := IHTTP.Delete(FBaseURL + FQuery.AsString);
                     objResponse := TranslateResponse;
                  except on E: Exception do
                         begin
                              objResponse := TranslateResponse;
                              objResponse.Info := E.Message;
                              //Continue;
                         end;
                  end;

                  if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
                     begin
                          if ( (LeftStr(rawResponse, 1) = '"') and (RightStr(rawResponse, 1) = '"') )
                             then Callback(StringReplace(rawResponse, '"', '', [rfReplaceAll]), IHTTP)
                             else Callback(objResponse.Info, IHTTP);
                     end
                  else
                      begin
                           Callback(objResponse.Info, IHTTP);
                      end;
             end
         );
         //aTask.Start;
         Result := aTask;
    end;
    function THTTPRequest.DELETE(Callback: TRequestCallbackAsJSONObject): ITask;
    var
       aTask : ITask;
       rawResponse : string;
       objResponse : TResponse;
       JSONX : XSuperObject.ISuperObject;
    begin
         aTask := TTask.Create(
             procedure
             begin
                  try
                     rawResponse := IHTTP.Delete(FBaseURL + FQuery.AsString);
                     objResponse := TranslateResponse;
                  except on E: Exception do
                         begin
                              objResponse := TranslateResponse;
                              objResponse.Info := E.Message;
                         end;
                  end;

                  if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
                     begin
                          JSONX := ResponseToJSONObject(rawResponse);
                          JSONX.B['ok'] := true;
                     end
                  else
                      begin
                           JSONX := XSuperObject.TSuperObject.Create('{}', false);
                           JSONX.B['ok'] := false;
                           JSONX.O['error'].AsObject.I['code'] := FResponse.Code;
                           JSONX.O['error'].AsObject.S['name'] := FResponse.Name;
                           JSONX.O['error'].AsObject.S['info'] := FResponse.Info;
                      end;

                  Callback(JSONX, IHTTP);
             end
         );
         //aTask.Start;
         Result := aTask;
    end;

    function THTTPRequest.DELETESyncAsVariant: Variant;
    var
       rawResponse : string;
       objResponse : TResponse;
    begin
         try
            rawResponse := IHTTP.Delete(FBaseURL + FQuery.AsString);
            objResponse := TranslateResponse;
         except on E: Exception do
                begin
                     objResponse := TranslateResponse;
                     objResponse.Info := E.Message;
                     //Continue;
                end;
         end;

         if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
            begin
                 if ( (LeftStr(rawResponse, 1) = '"') and (RightStr(rawResponse, 1) = '"') )
                    then Result := (StringReplace(rawResponse, '"', '', [rfReplaceAll]))
                    else Result := (objResponse.Info);
            end
         else Result := (objResponse.Info);
    end;
    function THTTPRequest.DELETESyncAsJSON: XSuperObject.ISuperObject;
    var
       rawResponse : string;
       objResponse : TResponse;
       JSONX : XSuperObject.ISuperObject;
    begin
         try
            rawResponse := IHTTP.Delete(FBaseURL + FQuery.AsString);
            objResponse := TranslateResponse;
         except on E: Exception do
                begin
                     objResponse := TranslateResponse;
                     objResponse.Info := E.Message;
                end;
         end;

         if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
            begin
                 JSONX := ResponseToJSONObject(rawResponse);
                 JSONX.B['ok'] := true;
            end
         else
             begin
                  JSONX := XSuperObject.TSuperObject.Create('{}', false);
                  JSONX.B['ok'] := false;
                  JSONX.O['error'].AsObject.I['code'] := FResponse.Code;
                  JSONX.O['error'].AsObject.S['name'] := FResponse.Name;
                  JSONX.O['error'].AsObject.S['info'] := FResponse.Info;
             end;

         Result := (JSONX);
    end;

    function THTTPRequest.PUT(RequestContentType: TRequestContentType; Callback: TRequestCallbackAsVariant): ITask;
    var
       aTask : ITask;
       rawResponse : string;
       objResponse : TResponse;
    begin
         aTask := TTask.Create(
             procedure
             begin
                  try
                     case (RequestContentType) of
                          rctMultipartFormData: begin
                              SetContentType(rctMultipartFormData);
                              rawResponse := IHTTP.Put(FBaseURL + FQuery.AsString, FPayload);
                          end;
                          rctWWWFormUrlEncoded: begin
                              SetContentType(rctWWWFormUrlEncoded);
                              rawResponse := IHTTP.Put(FBaseURL + FQuery.AsString, FFormEncoded.AsStream);
                          end;
                     end;
                     objResponse := TranslateResponse;
                  except on E: Exception do
                         begin
                              objResponse := TranslateResponse;
                              objResponse.Info := E.Message;
                              //Continue;
                         end
                  end;

                  if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
                     begin
                          if ( (LeftStr(rawResponse, 1) = '"') and (RightStr(rawResponse, 1) = '"') )
                             then Callback(StringReplace(rawResponse, '"', '', [rfReplaceAll]), IHTTP)
                             else Callback(objResponse.Info, IHTTP);
                     end
                  else
                      begin
                           Callback(objResponse.Info, IHTTP);
                      end;
             end
         );
         //aTask.Start;
         Result := aTask;
    end;
    function THTTPRequest.PUT(RequestContentType: TRequestContentType; Callback: TRequestCallbackAsJSONObject): ITask;
    var
       aTask : ITask;
       rawResponse : string;
       objResponse : TResponse;
       JSONX : XSuperObject.ISuperObject;
    begin
         aTask := TTask.Create(
             procedure
             begin
                  try
                     case (RequestContentType) of
                          rctMultipartFormData: begin
                              SetContentType(rctMultipartFormData);
                              rawResponse := IHTTP.Put(FBaseURL + FQuery.AsString, FPayload);
                          end;
                          rctWWWFormUrlEncoded: begin
                              SetContentType(rctWWWFormUrlEncoded);
                              rawResponse := IHTTP.Put(FBaseURL + FQuery.AsString, FFormEncoded.AsStream);
                          end;
                     end;
                     objResponse := TranslateResponse;
                  except on E: Exception do
                         begin
                              objResponse := TranslateResponse;
                              objResponse.Info := E.Message;
                         end;
                  end;

                  if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
                     begin
                          JSONX := ResponseToJSONObject(rawResponse);
                          JSONX.B['ok'] := true;
                     end
                  else
                      begin
                           JSONX := XSuperObject.TSuperObject.Create('{}', false);
                           JSONX.B['ok'] := false;
                           JSONX.O['error'].AsObject.I['code'] := FResponse.Code;
                           JSONX.O['error'].AsObject.S['name'] := FResponse.Name;
                           JSONX.O['error'].AsObject.S['info'] := FResponse.Info;
                      end;

                  Callback(JSONX, IHTTP);
             end
         );
         //aTask.Start;
         Result := aTask;
    end;

    function THTTPRequest.PUTSyncAsVariant(RequestContentType: TRequestContentType): Variant;
    var
       rawResponse : string;
       objResponse : TResponse;
    begin
         try
            case (RequestContentType) of
                 rctMultipartFormData: begin
                     SetContentType(rctMultipartFormData);
                     rawResponse := IHTTP.Put(FBaseURL + FQuery.AsString, FPayload);
                 end;
                 rctWWWFormUrlEncoded: begin
                     SetContentType(rctWWWFormUrlEncoded);
                     rawResponse := IHTTP.Put(FBaseURL + FQuery.AsString, FFormEncoded.AsStream);
                 end;
            end;
            objResponse := TranslateResponse;
         except on E: Exception do
                begin
                     objResponse := TranslateResponse;
                     objResponse.Info := E.Message;
                     //Continue;
                end
         end;

         if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
            begin
                 if ( (LeftStr(rawResponse, 1) = '"') and (RightStr(rawResponse, 1) = '"') )
                    then Result := (StringReplace(rawResponse, '"', '', [rfReplaceAll]))
                    else Result := (objResponse.Info);
            end
         else Result := (objResponse.Info);
    end;
    function THTTPRequest.PUTSyncAsJSON(RequestContentType: TRequestContentType): XSuperObject.ISuperObject;
    var
       rawResponse : string;
       objResponse : TResponse;
       JSONX : XSuperObject.ISuperObject;
    begin
         try
            case (RequestContentType) of
                 rctMultipartFormData: begin
                     SetContentType(rctMultipartFormData);
                     rawResponse := IHTTP.Put(FBaseURL + FQuery.AsString, FPayload);
                 end;
                 rctWWWFormUrlEncoded: begin
                     SetContentType(rctWWWFormUrlEncoded);
                     rawResponse := IHTTP.Put(FBaseURL + FQuery.AsString, FFormEncoded.AsStream);
                 end;
            end;
            objResponse := TranslateResponse;
         except on E: Exception do
                begin
                     objResponse := TranslateResponse;
                     objResponse.Info := E.Message;
                end;
         end;

         if ( ( (objResponse.Code = 200) or (objResponse.Code = 201) or (objResponse.Code = 202) ) and (rawResponse <> '') ) then
            begin
                 JSONX := ResponseToJSONObject(rawResponse);
                 JSONX.B['ok'] := true;
            end
         else
             begin
                  JSONX := XSuperObject.TSuperObject.Create('{}', false);
                  JSONX.B['ok'] := false;
                  JSONX.O['error'].AsObject.I['code'] := FResponse.Code;
                  JSONX.O['error'].AsObject.S['name'] := FResponse.Name;
                  JSONX.O['error'].AsObject.S['info'] := FResponse.Info;
             end;

         Result := (JSONX);
    end;

{$ENDREGION}


end.
