unit FCetakBesar1KolomPotrait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, StdCtrls, DB, MemDS, DBAccess,
  MyAccess;

type
  TfrmCetakBesar1KolomPotrait = class(TForm)
    //qryCetakMaster: TmySQLQuery;
    dsQryCetakMaster: TDataSource;
    //qryCetakDetail: TmySQLQuery;
    dsQryCetakDetail: TDataSource;
    RepCetak: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    TitleBand1: TQRBand;
    SummaryBand1: TQRBand;
    lblAlamatToko: TQRLabel;
    lblHandphone: TQRLabel;
    QRLabel4: TQRLabel;
    qlblTanggal: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    qrDoz: TQRLabel;
    qrDBSubtotal: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    qrDBGrand: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel22: TQRLabel;
    qrDBRetur: TQRDBText;
    QRLabel26: TQRLabel;
    qrPcs: TQRLabel;
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
    lblNoNota: TQRDBText;
    qlblPageNumber: TQRLabel;
    lblTelepon: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    qrDBPayment: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel17: TQRLabel;
    qrDBDisc: TQRDBText;
    lblNamaToko: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel19: TQRLabel;
    lblUser: TQRLabel;
    qLblTotItems: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    qryCetakDetail: TMyQuery;
    qryCetakMaster: TMyQuery;
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
    procedure qrDBReturPrint(sender: TObject; var Value: String);
    procedure qrPcsPrint(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure qrPrintJualBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRDBText1Print(sender: TObject; var Value: string);
    procedure lblNoNotaPrint(sender: TObject; var Value: string);
    procedure QRDBText8Print(sender: TObject; var Value: string);
    procedure QRDBText5Print(sender: TObject; var Value: string);
    procedure qlblPageNumberPrint(sender: TObject; var Value: string);
    procedure lblSatuJualPrint(sender: TObject; var Value: string);
    procedure QRDBText6Print(sender: TObject; var Value: string);
    //function Terbilang(x:integer):string;
  private
    { Private declarations }
    qryPrint1, qryPrint2 : TMyQuery;
  public
      AMOUNT_TERBILANG, QrpTotPageNumb : Integer;

    { Public declarations }
  end;

var
  frmCetakBesar1KolomPotrait: TfrmCetakBesar1KolomPotrait;

implementation

uses FdmDB, FMain;

{$R *.dfm}



procedure TfrmCetakBesar1KolomPotrait.qrPrintJualoldBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);

begin
     //qterbilang.Caption := '# ' + Terbilang(AMOUNT_TERBILANG) + ' Rupiah' + ' #';
end;

procedure TfrmCetakBesar1KolomPotrait.qlblPageNumberPrint(sender: TObject;
  var Value: string);
begin
  Value := 'Page: ' + IntToStr(RepCetak.QRPrinter.PageNumber) + ' of ' + IntToStr(QrpTotPageNumb);
end;

procedure TfrmCetakBesar1KolomPotrait.qlblTanggalPrint(sender: TObject; var Value: String);
begin
     Value := FormatDateTime('dd MMMM yyyy', strtodate(Value));
end;

procedure TfrmCetakBesar1KolomPotrait.qrDBSubtotalPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;



procedure TfrmCetakBesar1KolomPotrait.FormCreate(Sender: TObject);
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

procedure TfrmCetakBesar1KolomPotrait.lblNoNotaPrint(sender: TObject;
  var Value: string);
begin
  value := 'No Nota : ' + Value;
end;

procedure TfrmCetakBesar1KolomPotrait.lblSatuJualPrint(sender: TObject;
  var Value: string);
begin
   {if (Value = 'P') then Value := '/pt'
   else if (Value = 'L') then Value := '';}


end;

procedure TfrmCetakBesar1KolomPotrait.qrdbDiscPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmCetakBesar1KolomPotrait.qrDBTaxPrint(sender: TObject;
  var Value: String);
begin
     //Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmCetakBesar1KolomPotrait.qrDBGrandPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmCetakBesar1KolomPotrait.QRDBText7Print(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmCetakBesar1KolomPotrait.QRDBText8Print(sender: TObject;
  var Value: string);
begin
   Value := Value + ' Lsn';
end;

procedure TfrmCetakBesar1KolomPotrait.QRDBText4Print(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmCetakBesar1KolomPotrait.QRDBText5Print(sender: TObject;
  var Value: string);
begin
  Value := Value + ' Ptg';
end;

procedure TfrmCetakBesar1KolomPotrait.QRDBText6Print(sender: TObject;
  var Value: string);
begin
  Value := UpperCase(Value);
end;

procedure TfrmCetakBesar1KolomPotrait.qrDozPrint(sender: TObject;
  var Value: String);
begin
  Value := Value + ' Lsn';
end;

procedure TfrmCetakBesar1KolomPotrait.qrDBReturPrint(sender: TObject;
  var Value: String);
begin
     Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmCetakBesar1KolomPotrait.QRDBText1Print(sender: TObject;
  var Value: string);
begin
  Value := FormatFloat('#,0.#', StrToFloat(Value));
end;

procedure TfrmCetakBesar1KolomPotrait.qrPcsPrint(sender: TObject;
  var Value: String);
begin
     Value := Value + ' Ptg';
end;

procedure TfrmCetakBesar1KolomPotrait.QRDBText9Print(sender: TObject;
  var Value: String);
begin
     {qryPrint1.Close;
     qryPrint1.SQL.Clear;
     qryPrint1.SQL.Add('select * from jenis_brg ' +
                            'where id_jenis = ''' + Value + '''' );
     qryPrint1.Open;
     Value := qryPrint1.Fields[2].AsString;}
end;

procedure TfrmCetakBesar1KolomPotrait.qrPrintJualBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  //qterbilang.Caption := '# ' + Terbilang(AMOUNT_TERBILANG) + ' Rupiah' + ' #';
end;

end.
