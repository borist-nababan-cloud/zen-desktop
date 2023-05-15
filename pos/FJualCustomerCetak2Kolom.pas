unit FJualCustomerCetak2Kolom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, StdCtrls, DB, DBAccess, MyAccess,
  MemDS;

type
  TfrmJualCustomerCetak2Kolom = class(TForm)
    RepCetak: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    SummaryBand1: TQRBand;
    lblNamaToko: TQRLabel;
    lblTelepon: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    lblGrandTotal: TQRLabel;
    lblTotDoz: TQRLabel;
    qrDBSubtotal: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel23: TQRLabel;
    qrDBGrand: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    lblJudulRetur: TQRLabel;
    qrDBRetur: TQRDBText;
    lblJudulDisc: TQRLabel;
    lblTotPcs: TQRLabel;
    qrDBDisc: TQRDBText;
    QRDBText11: TQRDBText;
    lblIDBarang: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText12: TQRDBText;
    lblNoNota: TQRDBText;
    qlblPageNumber: TQRLabel;
    lblAlamatToko: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    lblJudulCetak: TQRLabel;
    lblTotSeri: TQRLabel;
    dsQryCetakDetail: TDataSource;
    dsQryCetakMaster: TDataSource;
    QRDBText1: TQRDBText;
    lblTotItems: TQRLabel;
    PageFooterBand1: TQRBand;
    lblUser: TQRLabel;
    QRLabel3: TQRLabel;
    lblPayment: TQRLabel;
    QryCetakDetail: TMyQuery;
    QryCetakMaster: TMyQuery;
    procedure qrPrintJualoldBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure qrDBSubtotalPrint(sender: TObject; var Value: String);
    procedure qrdbDiscPrint(sender: TObject; var Value: String);
    procedure qrDBTaxPrint(sender: TObject; var Value: String);
    procedure qrDBGrandPrint(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure qrDBReturPrint(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure qrPrintJualBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblNoNotaPrint(sender: TObject; var Value: string);
    procedure qlblPageNumberPrint(sender: TObject; var Value: string);
    procedure lblSatJualPrint(sender: TObject; var Value: string);
    procedure QRDBText11Print(sender: TObject; var Value: string);
    procedure QRDBText1Print(sender: TObject; var Value: string);
    procedure lblJudulCetakPrint(sender: TObject; var Value: string);
    procedure lblIDBarangPrint(sender: TObject; var Value: string);
    procedure lblPaymentPrint(sender: TObject; var Value: string);
    //function Terbilang(x:integer):string;
  private
    { Private declarations }
    qryPrint1, qryPrint2 : TMyQuery;
  public
      AMOUNT_TERBILANG, QrpTotPageNumb : Integer;

    { Public declarations }
  end;

var
  frmJualCustomerCetak2Kolom: TfrmJualCustomerCetak2Kolom;

implementation

uses FdmDB, FMain;

{$R *.dfm}



procedure TfrmJualCustomerCetak2Kolom.qrPrintJualoldBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);

begin
     //qterbilang.Caption := '# ' + Terbilang(AMOUNT_TERBILANG) + ' Rupiah' + ' #';
end;

procedure TfrmJualCustomerCetak2Kolom.QRDBText11Print(sender: TObject;
  var Value: string);
begin
  Value := Value + '.';
end;

procedure TfrmJualCustomerCetak2Kolom.QRDBText1Print(sender: TObject;
  var Value: string);
begin
   Value := UpperCase(Value);
end;

procedure TfrmJualCustomerCetak2Kolom.QRDBText2Print(sender: TObject; var Value: String);
begin
     Value := FormatDateTime('dd MMMM yyyy', strtodate(Value));
end;

procedure TfrmJualCustomerCetak2Kolom.qrDBSubtotalPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak2Kolom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {qryPrint1.Free;
  qryPrint2.Free;
  Action := caFree;}
end;

procedure TfrmJualCustomerCetak2Kolom.FormCreate(Sender: TObject);
begin
  {qryPrint1 := TmySQLQuery.Create(Self);
  qryPrint1.Database := DMDB.StoreDB;
  qryPrint1.SQL.Add('select * from ben_temptable');
  qryPrint1.Active := true;

  qryPrint2 := TmySQLQuery.Create(Self);
  qryPrint2.Database := DMDB.StoreDB;
  qryPrint2.SQL.Add('select * from ben_temptable');
  qryPrint2.Active := true;}

end;

procedure TfrmJualCustomerCetak2Kolom.lblIDBarangPrint(sender: TObject;
  var Value: string);
begin
  Value := UpperCase(Value);
end;

procedure TfrmJualCustomerCetak2Kolom.lblJudulCetakPrint(sender: TObject;
  var Value: string);
begin
  Value := UpperCase(Value);
end;

procedure TfrmJualCustomerCetak2Kolom.lblNoNotaPrint(sender: TObject;
  var Value: string);
begin
   value := 'No Nota : ' + Value;
end;

procedure TfrmJualCustomerCetak2Kolom.lblPaymentPrint(sender: TObject;
  var Value: string);
begin
  //Value := 'PAYMENT VIA [ ' + UpperCase(Value) + ' ]';
end;

procedure TfrmJualCustomerCetak2Kolom.lblSatJualPrint(sender: TObject;
  var Value: string);
begin
  if (Value = 'P') then Value := '/pt'
   else if (Value = 'L') then Value := '';
end;

procedure TfrmJualCustomerCetak2Kolom.qlblPageNumberPrint(sender: TObject;
  var Value: string);
begin
  Value := 'Page: ' + IntToStr(RepCetak.QRPrinter.PageNumber) + ' of ' + IntToStr(QrpTotPageNumb);
end;

procedure TfrmJualCustomerCetak2Kolom.qrdbDiscPrint(sender: TObject;
  var Value: String);
begin
     //Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak2Kolom.qrDBTaxPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak2Kolom.qrDBGrandPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak2Kolom.QRDBText7Print(sender: TObject;
  var Value: String);
var
  nLsn, nPcs : Double;
begin
     if (frmMain.SATJUAL = 'L') then
       begin
         Value := FormatFloat('#,0.#', StrToFloat(Value));
       end
     else if (frmMain.SATJUAL = 'P') then
       begin
         nLsn := StrToFloat(Value);
         nPcs := nLsn / 12;
         Value := FormatFloat('#,0.#', nPcs);
       end;
end;

procedure TfrmJualCustomerCetak2Kolom.QRDBText4Print(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak2Kolom.qrDBReturPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak2Kolom.QRDBText9Print(sender: TObject;
  var Value: String);
begin
     {qryPrint1.Close;
     qryPrint1.SQL.Clear;
     qryPrint1.SQL.Add('select * from jenis_brg ' +
                            'where id_jenis = ''' + Value + '''' );
     qryPrint1.Open;
     Value := qryPrint1.Fields[2].AsString;}
end;

procedure TfrmJualCustomerCetak2Kolom.qrPrintJualBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  //qterbilang.Caption := '# ' + Terbilang(AMOUNT_TERBILANG) + ' Rupiah' + ' #';
end;

end.
