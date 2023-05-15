unit FCetakKomisi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBAccess, dxGDIPlusClasses;

type
  TfrmCetakKomisi = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblSubtotalPrint(sender: TObject; var Value: string);
    procedure lblTglKomisiPrint(sender: TObject; var Value: string);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCetakKomisi: TfrmCetakKomisi;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmCetakKomisi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCetakKomisi.lblSubtotalPrint(sender: TObject; var Value: string);
begin
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmCetakKomisi.lblTglKomisiPrint(sender: TObject; var Value: string);
begin
  ;
end;

end.
