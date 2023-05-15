unit FPKBCetakKuitansi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, Data.DB,
  DBAccess, MyAccess, MemDS, QRCtrls;

type
  TfrmPKBCetakKuitansi = class(TForm)
    qrpKuitansi: TQuickRep;
    PageHeaderBand1: TQRBand;
    MyQuery1: TMyQuery;
    MyDataSource1: TMyDataSource;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    lblOutletName: TQRLabel;
    lblOutletAlamat: TQRLabel;
    lblOutletKota: TQRLabel;
    lblOutletTelepon: TQRLabel;
    QRLabel5: TQRLabel;
    lblNoKutansi: TQRLabel;
    QRLabel7: TQRLabel;
    lblTglKuitansi: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    lblNamaCust: TQRLabel;
    lblAlamat: TQRLabel;
    lblKota: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    lblTerbilang: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    lblCaption1: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    lblNoFaktur: TQRLabel;
    lblKeterangan: TQRLabel;
    QRLabel29: TQRLabel;
    lblTotal: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel22: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel37: TQRLabel;
    lblBeaMaterai: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape1: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPKBCetakKuitansi: TfrmPKBCetakKuitansi;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterPKB;

end.
