unit FPrintTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, Printers, strUtils;

type
  TPassThroughData = Record
       nLen : Word;
       data : array[0..255] of byte;
  end;
  TfrmPrintTrans = class(TForm)
    qrpPrintBill: TQuickRep;
    PageHeaderBand1: TQRBand;
    lblJudulAtas: TQRLabel;
    SummaryBand1: TQRBand;
    PrintDialog1: TPrintDialog;
    lblJudul: TQRLabel;
    PageFooterBand1: TQRBand;
    lblSumJudul: TQRMemo;
    lblSumValue: TQRMemo;
    lblAlamat1: TQRLabel;
    lblAlamat2: TQRLabel;
    lblNamaMenu: TQRMemo;
    lblTanggal: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    lblFooter1: TQRLabel;
    lblFooter2: TQRLabel;
    lblFooter3: TQRLabel;
    QRLabel5: TQRLabel;
    lblGuest: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmPrintTrans: TfrmPrintTrans;

implementation

uses FDMDB;

{$R *.dfm}
procedure printteks(s : String);
var
   ptblock : TPassThroughData;
begin
     ptblock.nLen := length(s);
     StrPCopy(@ptblock.data, s);
     Escape(printer.Handle, PASSTHROUGH, 0, @ptblock, nil);
     //ptblock
end;

procedure TfrmPrintTrans.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

end.
