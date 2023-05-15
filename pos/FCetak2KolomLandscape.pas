unit FCetak2KolomLandscape;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, mySQLDbTables, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmCetak2KolomLandscape = class(TForm)
    qryCetakMaster: TmySQLQuery;
    dsQryCetakMaster: TDataSource;
    qryCetakDetail: TmySQLQuery;
    dsQryCetakDetail: TDataSource;
    RepCetak: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    lblNamaToko: TQRLabel;
    lblAlamatToko: TQRLabel;
    lblTelepon: TQRLabel;
    lblHandphone: TQRLabel;
    qlblPageNumber: TQRLabel;
    QRLabel9: TQRLabel;
    lblTanggal: TQRDBText;
    QRLabel2: TQRLabel;
    lblNamaCust: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    lblNo: TQRDBText;
    lblDoz: TQRDBText;
    lblPcs: TQRDBText;
    lblHarga: TQRDBText;
    lblSubtotal: TQRDBText;
    QRShape2: TQRShape;
    SummaryBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    lblTotItems: TQRLabel;
    lblJudulSubtotal: TQRLabel;
    lblSubSum: TQRDBText;
    lblJudulDisc: TQRLabel;
    lblJudulRetur: TQRLabel;
    lblJudulGrand: TQRLabel;
    lblDisc: TQRDBText;
    lblRetur: TQRDBText;
    lblGrand: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape3: TQRShape;
    lblPaymentID: TQRDBText;
    lblTotDoz: TQRLabel;
    lblTotPcs: TQRLabel;
    lblTotSeri: TQRLabel;
    PageFooterBand1: TQRBand;
    lbluser: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    lblBarangID: TQRDBText;
    procedure lblHargaPrint(sender: TObject; var Value: string);
    procedure lblSubtotalPrint(sender: TObject; var Value: string);
    procedure lblSubSumPrint(sender: TObject; var Value: string);
    procedure lblGrandPrint(sender: TObject; var Value: string);
    procedure qlblPageNumberPrint(sender: TObject; var Value: string);
  private
    { Private declarations }
    qryPrint1, qryPrint2 : TmySQLQuery;
  public
    { Public declarations }
    AMOUNT_TERBILANG, QrpTotPageNumb : Integer;
  end;

var
  frmCetak2KolomLandscape: TfrmCetak2KolomLandscape;

implementation

{$R *.dfm}

procedure TfrmCetak2KolomLandscape.lblGrandPrint(sender: TObject;
  var Value: string);
begin
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmCetak2KolomLandscape.lblHargaPrint(sender: TObject;
  var Value: string);
var
   hrgPcs : Double;
begin
  hrgPcs := StrToFloat(Value) / 12;
  Value := FormatFloat('#,#', hrgPcs);
end;

procedure TfrmCetak2KolomLandscape.lblSubSumPrint(sender: TObject;
  var Value: string);
begin
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmCetak2KolomLandscape.lblSubtotalPrint(sender: TObject;
  var Value: string);
begin
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmCetak2KolomLandscape.qlblPageNumberPrint(sender: TObject;
  var Value: string);
begin
  Value := 'Page: ' + IntToStr(RepCetak.QRPrinter.PageNumber) + ' of ' + IntToStr(QrpTotPageNumb);
end;

end.
