unit FCetakPayroll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBAccess, MemDS, MyAccess;

type
  TfrmCetakPayroll = class(TForm)
    qrpSlip: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel7: TQRLabel;
    lblOutlet: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    lblPeriode: TQRLabel;
    QRLabel8: TQRLabel;
    lblHMasukKerja: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    lblJamLembur: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    lblLate1: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    lblLate2: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    lblSakit: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    lblHIMasuk: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    lblAlpa: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    lblHITidakAbsen: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    lblHUnder: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    lblGapok: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    lblUM: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    lblHLibNas: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    lblHCuti: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    lblHIPulang: TQRDBText;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    lblHFOT: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    lblTunjangan: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    lblSaving: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    lblVBpjs: TQRDBText;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    lblKomisi: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    lblAdjustment: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    lblPotLain: TQRDBText;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    lblDenda: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    lblLembur: TQRDBText;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    lblUmLibNas: TQRDBText;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    lblGpLibNas: TQRDBText;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    lblHITidakMasuk: TQRDBText;
    QRShape1: TQRShape;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    lblNFOT: TQRDBText;
    QRLabel66: TQRLabel;
    lblTHP: TQRDBText;
    lblPenerima: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRShape2: TQRShape;
    QRImage1: TQRImage;
    qryCetak: TMyQuery;
    dsQryCetak: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCetakPayroll: TfrmCetakPayroll;

implementation

{$R *.dfm}

uses FdmDB, FMain, FReportPayroll;

end.
