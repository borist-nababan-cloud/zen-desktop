unit FCetakTTSBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmCetakTTSBaru = class(TForm)
    qrpManual: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    lblTerbilang: TQRLabel;
    lblJumlah: TQRLabel;
    lblDate: TQRLabel;
    lblMengetahui: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    lblJudulKuitansi: TQRLabel;
    lblNoKuitansi: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel6: TQRLabel;
    lblUntukPembayaran: TQRMemo;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    lblTerimaDari: TQRMemo;
    lblNumberCek: TQRMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCetakTTSBaru: TfrmCetakTTSBaru;

implementation

{$R *.dfm}

uses FdmDB, FMain;

end.
