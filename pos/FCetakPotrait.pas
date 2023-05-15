unit FCetakPotrait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, QuickRpt,
  ExtCtrls, QRCtrls, MemDS, DBAccess;

type
  TfrmCetakPotrait = class(TForm)
    //qryCetakDetail: TMyQuery;
    dsQryCetakDetail: TDataSource;
    //qryCetakMaster: TMyQuery;
    dsQryCetakMaster: TDataSource;
    RepCetak: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    lblNo: TQRDBText;
    lblJenis: TQRDBText;
    lblID: TQRDBText;
    lblDoz: TQRDBText;
    lblPcs: TQRDBText;
    lblHarga: TQRDBText;
    lblSubtotal: TQRDBText;
    lblNamaToko: TQRLabel;
    lblAlamatToko: TQRLabel;
    lblTelepon: TQRLabel;
    lblHandphone: TQRLabel;
    qlblPageNumber: TQRLabel;
    QRLabel9: TQRLabel;
    lblTanggal: TQRDBText;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
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
    QRLabel15: TQRLabel;
    QRLabel2: TQRLabel;
    lblNamaCust: TQRDBText;
    lblTotDoz: TQRLabel;
    lblTotPcs: TQRLabel;
    lblTotSeri: TQRLabel;
    lbluser: TQRLabel;
    qryCetakMaster: TMyQuery;
    qryCetakDetail: TMyQuery;
    procedure QRDBText2Print(sender: TObject; var Value: string);
    procedure lblGrandPrint(sender: TObject; var Value: string);
    procedure lblReturPrint(sender: TObject; var Value: string);
    procedure lblDiscPrint(sender: TObject; var Value: string);
    procedure lblSubSumPrint(sender: TObject; var Value: string);
    procedure lblHargaPrint(sender: TObject; var Value: string);
    procedure lblSubtotalPrint(sender: TObject; var Value: string);
    procedure qlblPageNumberPrint(sender: TObject; var Value: string);
    procedure lblPaymentIDPrint(sender: TObject; var Value: string);
    procedure lblIDPrint(sender: TObject; var Value: string);
    procedure lblTanggalPrint(sender: TObject; var Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
    QrpTotPageNumb : Integer;
  end;

var
  frmCetakPotrait: TfrmCetakPotrait;

implementation

{$R *.dfm}

uses FdmDB;

procedure TfrmCetakPotrait.qlblPageNumberPrint(sender: TObject;
  var Value: string);
begin
  Value := 'Page: ' + IntToStr(RepCetak.QRPrinter.PageNumber) + ' of ' + IntToStr(QrpTotPageNumb);
end;

procedure TfrmCetakPotrait.lblTanggalPrint(sender: TObject; var Value: string);
begin
    Value := FormatDateTime('dd-MM-yyyy', StrToDate(Value));
end;

procedure TfrmCetakPotrait.lblHargaPrint(sender: TObject; var Value: string);
begin
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmCetakPotrait.lblSubtotalPrint(sender: TObject; var Value: string);
begin
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmCetakPotrait.lblPaymentIDPrint(sender: TObject; var Value: string);
begin
  Value := 'Payment Via # ' + Value;
end;

procedure TfrmCetakPotrait.QRDBText2Print(sender: TObject; var Value: string);
begin
  Value := 'INV#' + Value;
end;

procedure TfrmCetakPotrait.lblIDPrint(sender: TObject; var Value: string);
begin
  Value := UpperCase(Value);
end;

procedure TfrmCetakPotrait.lblSubSumPrint(sender: TObject; var Value: string);
begin
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmCetakPotrait.lblDiscPrint(sender: TObject; var Value: string);
begin
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmCetakPotrait.lblReturPrint(sender: TObject; var Value: string);
begin
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmCetakPotrait.lblGrandPrint(sender: TObject; var Value: string);
begin
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

end.
