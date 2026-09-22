unit FdmDB;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, MyAccess,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TdmDB = class(TDataModule)
    dbInternal: TMyConnection;
    dbExternal: TMyConnection;
    vRequest: TRESTRequest;
    vPOST: TRESTRequest;
    vClient: TRESTClient;
    vResponse: TRESTResponse;
    vPUT: TRESTRequest;
    vDELETE: TRESTRequest;
    vPATCH: TRESTRequest;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDB.DataModuleCreate(Sender: TObject);
begin
  //
end;

end.
