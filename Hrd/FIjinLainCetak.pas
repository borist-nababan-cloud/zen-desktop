unit FIjinLainCetak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmIjinLainCetak = class(TForm)
    qrpIjin: TQuickRep;
    PageHeaderBand1: TQRBand;
    lblJudul: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    lblTanggal: TQRLabel;
    lblTglIjin: TQRLabel;
    lblKode: TQRLabel;
    lblNama: TQRLabel;
    lblKet: TQRLabel;
    lblNoIjin: TQRLabel;
    DetailBand1: TQRBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIjinLainCetak: TfrmIjinLainCetak;

implementation

{$R *.dfm}

end.
