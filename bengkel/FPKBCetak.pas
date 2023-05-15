unit FPKBCetak;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls;

type
  TfrmPKBCetak = class(TForm)
    qrpPKB: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    lblDatePKB: TQRLabel;
    lblPKBNumb: TQRLabel;
    lblNoRangka: TQRLabel;
    lblNamaCust: TQRLabel;
    lblKodeCust: TQRLabel;
    lblNoMesin: TQRLabel;
    lblType: TQRLabel;
    lblWarna: TQRLabel;
    lblTahun: TQRLabel;
    lblTglKirim: TQRLabel;
    lblKilometer: TQRLabel;
    lblAlamatCust: TQRLabel;
    lblKotaCust: TQRLabel;
    lblTelpCust: TQRLabel;
    lblKeluhan: TQRMemo;
    QRLabel15: TQRLabel;
    lblPlat: TQRLabel;
    lblUser: TQRLabel;
    lblNamaCustBawah: TQRLabel;
    lblTelpCustBawah: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPKBCetak: TfrmPKBCetak;

implementation

{$R *.dfm}

end.
