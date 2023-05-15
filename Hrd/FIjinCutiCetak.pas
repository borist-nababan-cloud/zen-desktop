unit FIjinCutiCetak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls;

type
  TfrmIjinCutiCetak = class(TForm)
    qrpCuti: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    lblTanggal: TQRLabel;
    lblStart: TQRLabel;
    lblEnd: TQRLabel;
    lblKode: TQRLabel;
    lblNama: TQRLabel;
    lblKet: TQRLabel;
    lblCuti: TQRLabel;
    DetailBand1: TQRBand;
    lblNomor: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIjinCutiCetak: TfrmIjinCutiCetak;

implementation

{$R *.dfm}

end.
