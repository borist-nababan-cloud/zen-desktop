unit FNewPrintStrukBesar2Kolom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmNewPrintStrukBesar2Kolom = class(TForm)
    qrStruk: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape14: TQRShape;
    qLblKet: TQRMemo;
    qLblNilai: TQRMemo;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qrLblNamaToko: TQRLabel;
    qrLblAlamat: TQRLabel;
    qrLblTelp: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape17: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewPrintStrukBesar2Kolom: TfrmNewPrintStrukBesar2Kolom;

implementation

uses FdmDB, FMaster1;

{$R *.dfm}

procedure TfrmNewPrintStrukBesar2Kolom.QRDBText7Print(sender: TObject;
  var Value: String);
begin
     Value := Value + '.';
end;

procedure TfrmNewPrintStrukBesar2Kolom.QRDBText5Print(sender: TObject;
  var Value: String);
var
   hargaAwal, hrgSatuan : Double;
begin
     hargaAwal := StrToFloat(Value);
     hrgSatuan := hargaAwal / 12;
     Value := FormatFloat('#,#', hrgSatuan);
end;

procedure TfrmNewPrintStrukBesar2Kolom.QRDBText6Print(sender: TObject;
  var Value: String);
begin
     value := FormatFloat('#,#', StrToFloat(value));
end;

procedure TfrmNewPrintStrukBesar2Kolom.QRLabel2Print(sender: TObject;
  var Value: String);
begin
     Value := FormatDateTime('hh:mm:ss', Time);
end;

end.
