unit FPrintDriversTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmPintDriversTrans = class(TForm)
    qrpCetak: TQuickRep;
    PageHeaderBand1: TQRBand;
    QlblTransID: TQRLabel;
    Date: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    Subtotal: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QlblDriverID: TQRLabel;
    QlblNama: TQRLabel;
    QlblNopol: TQRLabel;
    QlblSubtotal: TQRLabel;
    QlblTanggal: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    QlblItems: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure qrpCetakAfterPrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPintDriversTrans: TfrmPintDriversTrans;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmPintDriversTrans.FormCreate(Sender: TObject);
begin
     with dmDB do
end;

procedure TfrmPintDriversTrans.QRDBText2Print(sender: TObject; var Value: String);
begin
     Value := FormatDateTime('dd MMMM yyyy', StrToDate(Value));
end;

procedure TfrmPintDriversTrans.qrpCetakAfterPrint(Sender: TObject);
begin
     //frmPintSO.Close;
end;

procedure TfrmPintDriversTrans.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //Action := caFree;
end;

end.
