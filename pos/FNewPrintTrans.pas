unit FNewPrintTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, Printers;

type
  TPassThroughData = Record
       nLen : Word;
       data : array[0..255] of byte;
  end;
  TfrmNewPrintTrans = class(TForm)
    qrpPrintBill: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText13: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    lblDiskon: TQRLabel;
    lblDiscAmount: TQRLabel;
    qrdbDiscAmount: TQRDBText;
    qrdbDiscPersen: TQRDBText;
    lblGrandTotal: TQRLabel;
    qrdbTotal: TQRDBText;
    qrSisa: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText9: TQRDBText;
    PrintDialog1: TPrintDialog;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    lblPoint: TQRLabel;
    lblNotes: TQRLabel;
    lblCopy: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure qrdbTotalPrint(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure qrdbDiscAmountPrint(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrpPrintBillAfterPrint(Sender: TObject);
    procedure qrdbDiscPersenPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmNewPrintTrans: TfrmNewPrintTrans;

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

procedure TfrmNewPrintTrans.FormCreate(Sender: TObject);
begin
     with dmDB do
end;

procedure TfrmNewPrintTrans.QRDBText5Print(sender: TObject;
  var Value: String);
begin
    Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmNewPrintTrans.QRDBText6Print(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmNewPrintTrans.qrdbTotalPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmNewPrintTrans.QRDBText14Print(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmNewPrintTrans.qrdbDiscAmountPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmNewPrintTrans.QRDBText9Print(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmNewPrintTrans.QRDBText3Print(sender: TObject;
  var Value: String);
begin
     Value := FormatDateTime('dd MMMM yyyy', StrToDate(Value));
end;

procedure TfrmNewPrintTrans.QRDBText2Print(sender: TObject;
  var Value: String);
begin
     Value :=  Copy(Value, 0, 7);
end;

procedure TfrmNewPrintTrans.QRDBText10Print(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmNewPrintTrans.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmNewPrintTrans.qrpPrintBillAfterPrint(Sender: TObject);
begin
     //
     {Printer.BeginDoc;
     printteks(#7#27#100'&122D' + '-end-'#7#27#100);
     Printer.EndDoc;}

end;

procedure TfrmNewPrintTrans.qrdbDiscPersenPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,#', StrToFloat(Value));
end;

end.
