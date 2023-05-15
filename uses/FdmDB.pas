unit FdmDB;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, MyAccess;

type
  TdmDB = class(TDataModule)
    dbInternal: TMyConnection;
    dbExternal: TMyConnection;
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
