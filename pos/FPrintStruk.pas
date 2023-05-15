unit FPrintStruk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, Data.DB, MemDS, DBAccess, MyAccess;

type
  TfrmStruk = class(TForm)
    qrStruk: TQuickRep;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    qrLblNamaToko: TQRLabel;
    qrLblAlamat: TQRLabel;
    qrLblTelp: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    qrdbDoz: TQRLabel;
    qrdbPcs: TQRLabel;
    qrdbDis: TQRDBText;
    qrlblDis: TQRLabel;
    QRShape14: TQRShape;
    qrTransId: TQRLabel;
    qrdbKet: TQRDBText;
    QRLabel10: TQRLabel;
    QRShape17: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    qlblTotalSeri: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure qrStrukBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrdbDisPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStruk: TfrmStruk;

implementation

uses FdmDB, FMaster1;

{$R *.dfm}

procedure TfrmStruk.QRDBText10Print(sender: TObject; var Value: String);
begin
     Value := FormatDateTime('dd MMMM yyyy', StrToDate(Value));
end;

procedure TfrmStruk.QRDBText5Print(sender: TObject; var Value: String);
var
   hargaAwal, hrgSatuan : Double;
begin
     //value := FormatFloat('#,#', StrToFloat(value));
     hargaAwal := StrToFloat(Value);
     hrgSatuan := hargaAwal / 12;
     Value := FormatFloat('#,#', hrgSatuan);
end;

procedure TfrmStruk.QRDBText6Print(sender: TObject; var Value: String);
begin
     value := FormatFloat('#,#', StrToFloat(value));
end;

procedure TfrmStruk.QRDBText8Print(sender: TObject; var Value: String);
begin
     value := FormatFloat('#,#', StrToFloat(value));
end;

procedure TfrmStruk.QRLabel2Print(sender: TObject; var Value: String);
begin
     Value := FormatDateTime('hh:mm:ss', Time);
end;

procedure TfrmStruk.QRDBText7Print(sender: TObject; var Value: String);
begin
     value := FormatFloat('#,#', StrToFloat(value)) + '.';
end;

procedure TfrmStruk.qrStrukBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   rTot: Integer;
begin
     //pcs_var := tblCMT1.Fields[3].AsInteger;
     rTot := Round(frmMaster1.qryPrintMstr.Fields[4].AsFloat);
     qrdbDoz.Caption := IntToStr(rTot div 12) + ' Doz';
     qrdbPcs.Caption := IntToStr(rTot mod 12) + ' Pcs';

end;

procedure TfrmStruk.qrdbDisPrint(sender: TObject; var Value: String);
begin
     //value := FormatFloat('#,#', StrToFloat(value));
end;

end.
