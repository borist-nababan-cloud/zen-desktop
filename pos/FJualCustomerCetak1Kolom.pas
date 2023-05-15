unit FJualCustomerCetak1Kolom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, StdCtrls, DB, mySQLDbTables;

type
  TfrmJualCustomerCetak1Kolom = class(TForm)
    qryCetakMaster: TmySQLQuery;
    dsQryCetakMaster: TDataSource;
    qryCetakDetail: TmySQLQuery;
    dsQryCetakDetail: TDataSource;
    RepCetak: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    TitleBand1: TQRBand;
    SummaryBand1: TQRBand;
    imgLogo: TQRImage;
    lblAlamatToko: TQRLabel;
    lblHandphone: TQRLabel;
    QRLabel4: TQRLabel;
    qlblTanggal: TQRDBText;
    QRLabel7: TQRLabel;
    lblAlamatCust: TQRLabel;
    QRLabel1: TQRLabel;
    lblIsiTerbilang: TQRLabel;
    QRLabel18: TQRLabel;
    lblTerbilang: TQRLabel;
    qrDBTax: TQRDBText;
    qrTax: TQRLabel;
    QRLabel20: TQRLabel;
    qrTaxRp: TQRLabel;
    qrDoz: TQRLabel;
    qrDBSubtotal: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel25: TQRLabel;
    qrDBGrand: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel17: TQRLabel;
    qrPcs: TQRLabel;
    qrStaf1: TQRLabel;
    qrStaf2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText1: TQRDBText;
    lblUser: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel3: TQRLabel;
    lblNoNota: TQRDBText;
    qlblPageNumber: TQRLabel;
    lblTelepon: TQRLabel;
    QRLabel16: TQRLabel;
    lblSatuJual: TQRDBText;
    procedure qrPrintJualoldBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qlblTanggalPrint(sender: TObject; var Value: String);
    procedure qrDBSubtotalPrint(sender: TObject; var Value: String);
    procedure qrdbDiscPrint(sender: TObject; var Value: String);
    procedure qrDBTaxPrint(sender: TObject; var Value: String);
    procedure qrDBGrandPrint(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure qrDozPrint(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure qrPcsPrint(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure qrPrintJualBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRDBText1Print(sender: TObject; var Value: string);
    procedure lblNoNotaPrint(sender: TObject; var Value: string);
    procedure QRDBText8Print(sender: TObject; var Value: string);
    procedure QRDBText5Print(sender: TObject; var Value: string);
    procedure qlblPageNumberPrint(sender: TObject; var Value: string);
    procedure lblSatuJualPrint(sender: TObject; var Value: string);
    //function Terbilang(x:integer):string;
  private
    { Private declarations }
    qryPrint1, qryPrint2 : TmySQLQuery;
  public
      AMOUNT_TERBILANG, QrpTotPageNumb : Integer;

    { Public declarations }
  end;

var
  frmJualCustomerCetak1Kolom: TfrmJualCustomerCetak1Kolom;

implementation

uses FdmDB, FMenuMain;

{$R *.dfm}



procedure TfrmJualCustomerCetak1Kolom.qrPrintJualoldBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);

begin
     //qterbilang.Caption := '# ' + Terbilang(AMOUNT_TERBILANG) + ' Rupiah' + ' #';
end;

procedure TfrmJualCustomerCetak1Kolom.qlblPageNumberPrint(sender: TObject;
  var Value: string);
begin
  Value := 'Page: ' + IntToStr(RepCetak.QRPrinter.PageNumber) + ' of ' + IntToStr(QrpTotPageNumb);
end;

procedure TfrmJualCustomerCetak1Kolom.qlblTanggalPrint(sender: TObject; var Value: String);
begin
     Value := FormatDateTime('dd MMMM yyyy', strtodate(Value));
end;

procedure TfrmJualCustomerCetak1Kolom.qrDBSubtotalPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak1Kolom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {qryPrint1.Free;
  qryPrint2.Free;
  Action := caFree;}
end;

procedure TfrmJualCustomerCetak1Kolom.FormCreate(Sender: TObject);
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

procedure TfrmJualCustomerCetak1Kolom.lblNoNotaPrint(sender: TObject;
  var Value: string);
begin
  value := 'No Nota : ' + Value;
end;

procedure TfrmJualCustomerCetak1Kolom.lblSatuJualPrint(sender: TObject;
  var Value: string);
begin
   if (Value = 'P') then Value := '/pt'
   else if (Value = 'L') then Value := '';


end;

procedure TfrmJualCustomerCetak1Kolom.qrdbDiscPrint(sender: TObject;
  var Value: String);
begin
     //Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak1Kolom.qrDBTaxPrint(sender: TObject;
  var Value: String);
begin
     //Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak1Kolom.qrDBGrandPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak1Kolom.QRDBText7Print(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak1Kolom.QRDBText8Print(sender: TObject;
  var Value: string);
begin
   Value := Value + ' Lsn';
end;

procedure TfrmJualCustomerCetak1Kolom.QRDBText4Print(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak1Kolom.QRDBText5Print(sender: TObject;
  var Value: string);
begin
  Value := Value + ' Ptg';
end;

procedure TfrmJualCustomerCetak1Kolom.qrDozPrint(sender: TObject;
  var Value: String);
begin
  Value := Value + ' Lsn';
end;

procedure TfrmJualCustomerCetak1Kolom.QRDBText14Print(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak1Kolom.QRDBText1Print(sender: TObject;
  var Value: string);
begin
  Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmJualCustomerCetak1Kolom.qrPcsPrint(sender: TObject;
  var Value: String);
begin
     Value := Value + ' Ptg';
end;

procedure TfrmJualCustomerCetak1Kolom.QRDBText9Print(sender: TObject;
  var Value: String);
begin
     {qryPrint1.Close;
     qryPrint1.SQL.Clear;
     qryPrint1.SQL.Add('select * from jenis_brg ' +
                            'where id_jenis = ''' + Value + '''' );
     qryPrint1.Open;
     Value := qryPrint1.Fields[2].AsString;}
end;

procedure TfrmJualCustomerCetak1Kolom.qrPrintJualBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  //qterbilang.Caption := '# ' + Terbilang(AMOUNT_TERBILANG) + ' Rupiah' + ' #';
end;

end.
