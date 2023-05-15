unit FNewPrintStruk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmNewPrintStruk = class(TForm)
    qrStruk: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    qrLblNamaToko: TQRLabel;
    qrLblAlamat: TQRLabel;
    qrLblTelp: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape17: TQRShape;
    QRDBText11: TQRDBText;
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
    QRShape2: TQRShape;
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
  frmNewPrintStruk: TfrmNewPrintStruk;

implementation

uses FdmDB, FMaster1;

{$R *.dfm}

procedure TfrmNewPrintStruk.QRDBText7Print(sender: TObject;
  var Value: String);
begin
     Value := Value + '.';
end;

procedure TfrmNewPrintStruk.QRDBText5Print(sender: TObject;
  var Value: String);
var
   hargaAwal, hrgSatuan : Double;
begin
     hargaAwal := StrToFloat(Value);
     hrgSatuan := hargaAwal / 12;
     Value := FormatFloat('#,#', hrgSatuan);
end;

procedure TfrmNewPrintStruk.QRDBText6Print(sender: TObject;
  var Value: String);
begin
     value := FormatFloat('#,#', StrToFloat(value));
end;

procedure TfrmNewPrintStruk.QRLabel2Print(sender: TObject;
  var Value: String);
begin
     Value := FormatDateTime('hh:mm:ss', Time);
end;

end.
