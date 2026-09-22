unit FLogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmLogo = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogo: TfrmLogo;

implementation

{$R *.dfm}

procedure TfrmLogo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

end.
