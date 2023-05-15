unit FCetakFaktur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  Data.DB, MemDS, DBAccess, MyAccess;

type
  TfrmCetakFaktur = class(TForm)
    qrpKuitansi: TQuickRep;
    PageHeaderBand1: TQRBand;
    lblOutletName: TQRLabel;
    lblOutletAlamat: TQRLabel;
    lblOutletKota: TQRLabel;
    lblOutletTelepon: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qryMaster: TMyQuery;
    dsQryMaster: TDataSource;
    qryCust: TMyQuery;
    DataSource1: TDataSource;
    QRSubDetail1: TQRSubDetail;
    PageFooterBand1: TQRBand;
    lblNoFaktur: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    lblWarna: TQRLabel;
    lblType: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    lblKilometer: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    lblNamaSA: TQRLabel;
    qryDetails: TMyQuery;
    dsQryDetails: TDataSource;
    QRLabel16: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel18: TQRLabel;
    lblSubtotalDetails: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    lblHargaGross: TQRLabel;
    lblPotongan: TQRLabel;
    lblDPP: TQRLabel;
    QRLabel22: TQRLabel;
    lblPPN: TQRLabel;
    QRLabel23: TQRLabel;
    lblTotal: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel24: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblKilometerPrint(sender: TObject; var Value: string);
    procedure lblNoFakturPrint(sender: TObject; var Value: string);
    procedure lblSubtotalDetailsPrint(sender: TObject; var Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCetakFaktur: TfrmCetakFaktur;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmCetakFaktur.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmCetakFaktur.lblKilometerPrint(sender: TObject; var Value: string);
begin
    Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmCetakFaktur.lblNoFakturPrint(sender: TObject; var Value: string);
begin
     Value := 'F.' + Value;
end;

procedure TfrmCetakFaktur.lblSubtotalDetailsPrint(sender: TObject;
  var Value: string);
begin
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

end.
