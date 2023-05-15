unit FSlipGaji;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBAccess, MemDS, MyAccess;

type
  TfrmSlipGaji = class(TForm)
    qrpSlip: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrySlip: TMyQuery;
    dsQrySlip: TDataSource;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
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
    QRLabel7: TQRLabel;
    lblPeriode: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText20: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRDBText3Print(sender: TObject; var Value: string);
    procedure QRDBText4Print(sender: TObject; var Value: string);
  private
    { Private declarations }
    qrySlip1, qrySlip2 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmSlipGaji: TfrmSlipGaji;

implementation

{$R *.dfm}

uses FdmDB, FMenuMain;

procedure TfrmSlipGaji.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmSlipGaji.QRDBText3Print(sender: TObject; var Value: string);
begin
   Value := Value + ' Hari';
end;

procedure TfrmSlipGaji.QRDBText4Print(sender: TObject; var Value: string);
begin
  Value := Value + ' Hari';
end;

end.
