unit FEmpty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmEmpty = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpty: TfrmEmpty;

implementation

{$R *.dfm}

procedure TfrmEmpty.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

end.
