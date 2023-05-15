unit FPrintRedeem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, Data.DB, DBAccess, MyAccess, MemDS;

type
  TfrmPrintRedeem = class(TForm)
    qrpRedeem: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    Date: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText4: TQRDBText;
    PrintRedeem: TMyQuery;
    dsPrintRedeem: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure QRDBText5Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintRedeem: TfrmPrintRedeem;

implementation

uses FDMDB, FTransRedeem;

{$R *.dfm}

procedure TfrmPrintRedeem.FormCreate(Sender: TObject);
begin
     with dmDB do
end;

procedure TfrmPrintRedeem.QRDBText5Print(sender: TObject;
  var Value: String);
begin
     Value :=  Copy(Value, 0, 7);

end;

end.
