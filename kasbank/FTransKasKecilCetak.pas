unit FTransKasKecilCetak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBAccess, MemDS, MyAccess;

type
  TfrmTransKasKecilCetak = class(TForm)
    qrpPrintBMK: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    qryTransMaster: TMyQuery;
    dsQryTransMaster: TDataSource;
    qryTransDetail: TMyQuery;
    dsQryTransDetail: TDataSource;
    lblJudul: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    lblOutlet: TQRLabel;
    lblKodeKas: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    lblSubtotal: TQRDBText;
    SummaryBand1: TQRBand;
    lblTotal: TQRDBText;
    QRLabel5: TQRLabel;
    procedure QRDBText2Print(sender: TObject; var Value: string);
    procedure QRDBText3Print(sender: TObject; var Value: string);
    procedure lblTotalPrint(sender: TObject; var Value: string);
    procedure qrpPrintBMKEndPage(Sender: TCustomQuickRep);
    procedure QRDBText1Print(sender: TObject; var Value: string);
    procedure lblSubtotalPrint(sender: TObject; var Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransKasKecilCetak: TfrmTransKasKecilCetak;

implementation

uses FdmDB;

{$R *.dfm}

procedure TfrmTransKasKecilCetak.QRDBText1Print(sender: TObject;
  var Value: string);
begin
  Value := FormatDateTime('dd/mm/yyyy', StrToDate(Value));
end;

procedure TfrmTransKasKecilCetak.QRDBText2Print(sender: TObject; var Value: string);
begin
      //Value := FormatDateTime('dd/mm/yyyy', StrToDate(Value));
end;

procedure TfrmTransKasKecilCetak.QRDBText3Print(sender: TObject; var Value: string);
begin
      //Value := FormatFloat('#,0.#0', StrToFloat(Value));
end;

procedure TfrmTransKasKecilCetak.lblSubtotalPrint(sender: TObject;
  var Value: string);
begin
  Value := FormatFloat('#,0.#0', StrToFloat(Value));
end;

procedure TfrmTransKasKecilCetak.lblTotalPrint(sender: TObject; var Value: string);
begin
      Value := FormatFloat('#,0.#0', StrToFloat(Value));
end;

procedure TfrmTransKasKecilCetak.qrpPrintBMKEndPage(Sender: TCustomQuickRep);
begin
    //QRDBText3.Font.Color  := clWindowText;
end;

end.
