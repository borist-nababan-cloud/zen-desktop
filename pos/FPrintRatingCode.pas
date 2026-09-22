unit FPrintRatingCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  QRQRBarcode, Data.DB, MemDS, DBAccess, MyAccess;

type
  TfrmPrintRatingCode = class(TForm)
    qrpPrintRating: TQuickRep;
    PageHeaderBand1: TQRBand;
    lblJudulAtas: TQRLabel;
    lblJudul: TQRLabel;
    lblAlamat1: TQRLabel;
    lblAlamat2: TQRLabel;
    QRLabel3: TQRLabel;
    lblRatingApps: TQRQRBarcode;
    SummaryBand1: TQRBand;
    lblDetailsRate: TQRLabel;
    QRLabel1: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintRatingCode: TfrmPrintRatingCode;

implementation

{$R *.dfm}

uses FMain, FdmDB;

procedure TfrmPrintRatingCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

end.
