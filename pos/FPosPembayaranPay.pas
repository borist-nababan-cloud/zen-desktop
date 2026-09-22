unit FPosPembayaranPay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Data.DB, DBAccess, MyAccess, cxLabel, cxCheckBox, MemDS,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxTextEdit, cxMaskEdit, cxCalc, cxDBLookupComboBox, dxBevel, Vcl.Menus,
  cxButtons, strUtils, WinInet, System.Threading, XSuperJSON, XSuperObject,
  DateUtils, Printers, MainSource;

type
  TfrmPosPembayaranPay = class(TForm)
    lblJudulAtas: TLabel;
    Label7: TLabel;
    edSubtPayment: TcxCalcEdit;
    qryPayment: TMyQuery;
    Label1: TLabel;
    edSisaPayment: TcxCalcEdit;
    Label2: TLabel;
    ckRedeem: TcxCheckBox;
    edMemberAvailable: TcxCalcEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edMemberPointToPay: TcxCalcEdit;
    Label3: TLabel;
    edRedeemValue: TcxCalcEdit;
    edCash: TcxCalcEdit;
    Label4: TLabel;
    dsQryPayment: TMyDataSource;
    edReff1: TcxTextEdit;
    edValue1: TcxCalcEdit;
    qryBank: TMyQuery;
    dsQryBank: TMyDataSource;
    edPayment1: TcxLookupComboBox;
    edBank1: TcxLookupComboBox;
    dxBevel1: TdxBevel;
    dxBevel2: TdxBevel;
    cxLabel3: TcxLabel;
    edTambahPoint: TcxCalcEdit;
    cxLabel4: TcxLabel;
    edSisaPoint: TcxCalcEdit;
    cxLabel5: TcxLabel;
    edRounding: TcxCalcEdit;
    Label5: TLabel;
    Label6: TLabel;
    edTotalPayment: TcxCalcEdit;
    Label8: TLabel;
    edkembalian: TcxCalcEdit;
    cxButton1: TcxButton;
    Label9: TLabel;
    edReff2: TcxTextEdit;
    edValue2: TcxCalcEdit;
    edPayment2: TcxLookupComboBox;
    edBank2: TcxLookupComboBox;
    Label10: TLabel;
    Label11: TLabel;
    edValGC: TcxCalcEdit;
    edNOGC: TcxTextEdit;
    Label12: TLabel;
    btnFindGC: TcxButton;
    dxBevel3: TdxBevel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    lblBeliGC: TLabel;
    procedure edCashPropertiesEditValueChanged(Sender: TObject);
    procedure edRedeemValueFocusChanged(Sender: TObject);
    procedure edValue1FocusChanged(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure edValue2PropertiesEditValueChanged(Sender: TObject);
    procedure edValue1PropertiesEditValueChanged(Sender: TObject);
    procedure edTotalPaymentFocusChanged(Sender: TObject);
    procedure edSisaPaymentFocusChanged(Sender: TObject);
    procedure edkembalianFocusChanged(Sender: TObject);
    procedure edPayment2PropertiesEditValueChanged(Sender: TObject);
    procedure edNOGCKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure edPayment1PropertiesEditValueChanged(Sender: TObject);
    procedure ckRedeemPropertiesEditValueChanged(Sender: TObject);
    procedure edRedeemValuePropertiesEditValueChanged(Sender: TObject);
    procedure edValGCPropertiesEditValueChanged(Sender: TObject);
    procedure edReff2FocusChanged(Sender: TObject);
    procedure edReff1FocusChanged(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure btnFindGCClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryExec, qryFind, qryCari, qryTemp : TMyQuery;
    tglServer : TDateTime;
    function CreateAutoNumb : String;
    function CekInternet : Boolean;
    function GenerateRandomString(ALength: Integer): string;
    procedure HitungSisa;
    procedure CetakNota(var kodePayCetak : String);
    procedure CetakRating(var kodePayCetak : String);
    procedure CetakProduk(var kodePayProduk : String);
  public
    { Public declarations }
    totBA, totBG, totBJ, totBP : Double;
    LS_TRANS_ID : TStringList;
    KODEPEMBAYARAN : String;
    procedure UpdateDetails(var kodePayUpdate : String);
    procedure UpdatePayment(var kodePayMaster : String; tPoint : Double; kPoint : Double);
  end;

var
  frmPosPembayaranPay: TfrmPosPembayaranPay;

implementation

{$R *.dfm}

uses FPosPembayaran, FdmDB, FMain, FPrintTrans, FPrintProduk, FPrintRatingCode;

{ TfrmPosPembayaranPay }

procedure TfrmPosPembayaranPay.btnFindGCClick(Sender: TObject);
var
  noGift : String;
  dbCariGC : TMyConnection;
  sQryCari : TMyQuery;
  tglJual : TDate;
  lamaValid : Integer;
  hargaGC : Double;
begin
//  noGift := '%' + edNOGC.Text;
  noGift := edNOGC.Text;
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select harga_jasa, aktif, terjual, pakai, tgl_jual from gc_sold where gc_number like ' +
      QuotedStr(noGift) + ';');
  qrySearch.Open;
  if (qrySearch.IsEmpty) then
    begin
      if (CekInternet = True) then
        begin
           dbCariGC := TMyConnection.Create(nil);
           dbCariGC.Server := frmMain.SERVER_DBHOST;
           dbCariGC.Database := frmMain.MERGERDBNAME;
           dbCariGC.Username := frmMain.SERVER_DBUSER;
           dbCariGC.Password := frmMain.SERVER_DBPASS;
           dbCariGC.Port := StrToInt(frmMain.SERVER_DBPORT);
           try
                dbCariGC.Connected := True;
             Except
               on E : Exception do
               ShowMessage('Sorry Database Not Ready !!');
             end;
           if (dbCariGC.Connected = True) then
             begin
                sQryCari := TMyQuery.Create(Self);
                sQryCari.Connection := dbCariGC;
                sQryCari.SQL.Add('select * from temptable');
                sQryCari.Active := True;

                sQryCari.Close;
                sQryCari.SQL.Clear;
                sQryCari.SQL.Add('select * from gc_detail where gc_number like ' +
                                   QuotedStr(noGift) + ' AND pakai = ''' + 'N' + '''');
                sQryCari.Open;
                if (sQryCari.IsEmpty) then
                  begin
                    ShowMessage('Data GC tidak ditemukan');
                    Exit;
                  end
                else if (NOT sQryCari.IsEmpty) then
                  begin
                     qryExec.SQL.Clear;
                     qryExec.SQL.Add('insert into gc_sold(gc_number, id_members, tanggal, expired_date, ' +
                      'nama_menu, harga_jasa, aktif, payment_jual, terjual, tgl_jual, outlet_jual) values(' +
                      '''' + sQryCari.Fields[1].AsString + ''',' +
                      '''' + sQryCari.Fields[2].AsString + ''',' +
                      '''' + FormatDateTime('yyyy-MM-dd',sQryCari.Fields[3].AsDateTime) + ''',' +
                      '''' + FormatDateTime('yyyy-MM-dd',sQryCari.Fields[4].AsDateTime) + ''',' +
                      QuotedStr(sQryCari.Fields[5].AsString) + ',' +
                      '''' + FloatToStr(sQryCari.Fields[6].AsFloat) + ''',' +
                      '''' + sQryCari.Fields[7].AsString + ''',' +
                      '''' + sQryCari.Fields[8].AsString + ''',' +
                      '''' + sQryCari.Fields[9].AsString + ''',' +
                      '''' + FormatDateTime('yyyy-MM-dd',sQryCari.Fields[10].AsDateTime) + ''',' +
                      '''' + sQryCari.Fields[11].AsString + ''');');
                     qryExec.ExecSQL;
                     tglJual := sQryCari.Fields[10].AsDateTime;
                     //lblBeliGC.Caption := FormatDateTime('dd-MMMM-yyyy', tglJual) + ' [' + IntToStr(lamaValid) + ']';
                     lamaValid := DaysBetween(tglJual, Date);
                     lblBeliGC.Caption := FormatDateTime('dd-MMMM-yyyy', tglJual) + ' [' + IntToStr(lamaValid) + ']';
                     if (lamaValid > 120) then
                         begin
                             ShowMessage('Lama GC sudah lebih dari 120 Hari');
                             edValGC.EditValue := 0;
                             Exit
                         end;
                     //edValGC.EditValue := sQryCari.Fields[6].AsFloat;
                     if (totBJ < sQryCari.Fields[6].AsFloat) then
                         begin
                           edValGC.EditValue := totBJ;
                         end
                       else if (totBJ > sQryCari.Fields[6].AsFloat) then
                         begin
                           edValGC.EditValue := sQryCari.Fields[6].AsFloat;
                         end;
                     edNOGC.Text := sQryCari.Fields[1].AsString;
                     sQryCari.Free;
                     dbCariGC.Disconnect;
                     HitungSisa;
                  end;
             end
           else if (dbCariGC.Connected = False) then
             begin
               ShowMessage('Koneksi Internet Tidak Ada ! ' + #13 +
                       'Gagal Mengambil Data GC dari Server');
               Exit;
             end;
           dbCariGC.Free;
        end
      else if (CekInternet = False) then
        begin
           ShowMessage('Koneksi Internet Tidak Ada ! ' + #13 +
                       'Gagal Mengambil Data GC dari Server');
           Exit;
        end;
    end
  else if (NOT qrySearch.IsEmpty) then
    begin
       //edValGC.EditValue := qrySearch.Fields[0].AsFloat;
       hargaGC := qrySearch.Fields[0].AsFloat;
       if (qrySearch.Fields[1].AsString = 'N') then
         begin
           ShowMessage('Nomor GC tidak Aktif !');
           Exit;
         end;
       if (qrySearch.Fields[2].AsString = 'N') then
         begin
           {btnSelected := MessageDlg('Apakah Anda akan menghapus Data ' + kodemenu + '?',mtConfirmation,mbOKCancel, 0);
           if (btnSelected = mrCancel) then Exit;}
           ShowMessage('Nomor GC belum terjual !');
           Exit;
         end;
       if (qrySearch.Fields[3].AsString = 'Y') then
         begin
           ShowMessage('Nomor GC sudah pernah dipakai !');
           Exit;
         end;
       tglJual := qrySearch.Fields[4].AsDateTime;
       lamaValid := DaysBetween(tglJual, Date);
       lblBeliGC.Caption := FormatDateTime('dd-MMMM-yyyy', tglJual) + ' [' + IntToStr(lamaValid) + ']';
       if (lamaValid > 120) then
         begin
             ShowMessage('Lama GC sudah lebih dari 120 Hari');
             edValGC.EditValue := 0;
             Exit
         end;
       if (totBJ <= hargaGC) then
         begin
           edValGC.EditValue := totBJ;
         end
       else if (totBJ > hargaGC) then
         begin
           edValGC.EditValue := qrySearch.Fields[0].AsFloat;
         end;
       HitungSisa;
    end;
end;

function TfrmPosPembayaranPay.CekInternet: Boolean;
begin
    result := (InternetGetConnectedState(nil, 0));
end;

procedure TfrmPosPembayaranPay.CetakNota(var kodePayCetak: String);
var
   QryPrintMaster, QryPrintDetail : TMyQuery;
   panjang, rCount, pjgDetail, pjgSummary, pjgNote : Integer;
   i: Integer;
  jSonItem : XSuperObject.ISuperObject;
  isCetak, keterangan : String;
begin
    //ShowMessage(kodePayCetak);
    QryPrintMaster := TMyQuery.Create(Self);
    QryPrintMaster.Connection := DMDB.dbInternal;
    QryPrintMaster.SQL.Add('select * from temptable');
    QryPrintMaster.Active := true;

    QryPrintDetail := TMyQuery.Create(Self);
    QryPrintDetail.Connection := DMDB.dbInternal;
    QryPrintDetail.SQL.Add('select * from temptable');
    QryPrintDetail.Active := true;

    Application.CreateForm(TfrmPrintTrans, frmPrintTrans);
    frmPrintTrans.lblJudulAtas.Caption := frmMain.JUDULATAS;
    frmPrintTrans.lblJudul.Caption := frmMain.JUDULBAWAH;
    frmPrintTrans.lblAlamat1.Caption := frmMain.APP_OUTLETADDRESS + ', ' + frmMain.APP_OUTLETCITY;
    frmPrintTrans.lblAlamat2.Caption := frmMain.APP_OUTLETPROVINCE + 'Telp. ' + frmMain.APP_OUTLETPHONE + ', ';
    frmPrintTrans.lbltanggal.Caption := FormatDateTime('dd/MMM/yyyy', tglServer);
    frmPrintTrans.lblGuest.Caption := frmPosPembayaran.edMemberNama.Text;
    rCount := 0;
    QryPrintDetail.Close;
    QryPrintDetail.SQL.Clear;
    QryPrintDetail.SQL.Add('select id_trans, produk_jasa_id, quantity, disc_percent, subtotal, ' +
         'produk_jasa_nama, ' +
         '(select main_menu.notes from main_menu where ' +
         'main_menu.menu_id = trans_detail.produk_jasa_id) as notes ' +
         'from trans_detail where trans_detail.payment_id = ''' +
         kodePayCetak + ''' AND trans_detail.trans_type_id <> ''' + 'BP' +
         ''' AND trans_detail.trans_type_id <> ''' + 'BG' + ''' ' +
         'ORDER BY id_trans ASC');
    QryPrintDetail.Open;
    QryPrintDetail.First;
    for i := 0 to QryPrintDetail.RecordCount -1 do
       begin
            jSonItem := XSuperobject.SO(QryPrintDetail.Fields[6].AsString);
            isCetak := jSonItem.S['cetak'];
            keterangan := jSonItem.S['keterangan'];
            with frmPrintTrans do
               begin
                  lblNamaMenu.Lines.Add(TitleCase(QryPrintDetail.Fields[5].AsString));
                  if (QryPrintDetail.Fields[3].AsFloat > 0) then
                    begin
                      lblNamaMenu.Lines.Add('   ' + QryPrintDetail.Fields[2].AsString + ' X ' +
                           FormatFloat('#,#', StrToFloat(QryPrintDetail.Fields[4].AsString)) + ' (Disc ' +
                           QryPrintDetail.Fields[3].AsString + '%)');
                    end
                  else if (QryPrintDetail.Fields[3].AsFloat <= 0) then
                    begin
                      lblNamaMenu.Lines.Add('   ' + QryPrintDetail.Fields[2].AsString + ' X ' +
                          FormatFloat('#,#', StrToFloat(QryPrintDetail.Fields[4].AsString)));
                    end;

                  //ShowMessage(QryPrintDetail.Fields[5].AsString);
                  //ShowMessage(FormatFloat('#,#', StrToFloat(QryPrintDetail.Fields[4].AsString)));
                  rCount := rCount + 2;
                  if (isCetak = 'Y') then
                    begin
                       lblNamaMenu.Lines.Add('[' + keterangan + ']');
                       rCount := rCount + 1;
                    end;
               end;
            QryPrintDetail.Next;
       end;

    pjgDetail := rCount * 21;
    frmPrintTrans.lblNamaMenu.Height := frmPrintTrans.lblNamaMenu.Height + pjgDetail;
    frmPrintTrans.PageHeaderBand1.Height := frmPrintTrans.PageHeaderBand1.Height + pjgDetail;
    frmPrintTrans.qrpPrintBill.Height := frmPrintTrans.qrpPrintBill.Height + pjgDetail;
    //frmPrintTrans.qrpPrintBill.Height := frmPrintTrans.qrpPrintBill.Height + panjang;
    pjgSummary := 0;
     with  frmPrintTrans do
        begin
            lblSumJudul.Lines.Add('Subtotal');
            if ((frmPosPembayaranPay.totBP > 0) OR (frmPosPembayaranPay.totBG > 0)) then
              begin
                lblSumValue.Lines.Add(FormatFloat('#,#', (edSubtPayment.EditValue - totBP - totBG)));
              end
            else if ((frmPosPembayaranPay.totBP <= 0) OR (frmPosPembayaranPay.totBG <= 0)) then
              begin
                 lblSumValue.Lines.Add(FormatFloat('#,#', frmPosPembayaranPay.edSubtPayment.EditValue));
              end;

            if (frmPosPembayaran.edDiscPromo.EditValue > 0) then
              begin
                 lblSumJudul.Lines.Add(TitleCase(frmPosPembayaran.edPromo.Text));
                 lblSumValue.Lines.Add(frmPosPembayaran.edPromoRef.Text);
              end;
           if (frmPosPembayaran.edDiscPurpose.EditValue > 0) then
              begin
                 lblSumJudul.Lines.Add(frmPosPembayaran.edPurpose.Text);
                 lblSumValue.Lines.Add(FormatFloat('#,#', frmPosPembayaran.edDiscPurpose.EditValue));
              end;
           if (frmPosPembayaranPay.edValGC.EditValue > 0) then
              begin
                 lblSumJudul.Lines.Add('GC#**' + RightStr(frmPosPembayaranPay.edNOGC.Text, 6));
                 lblSumValue.Lines.Add(FormatFloat('#,#', frmPosPembayaranPay.edValGC.EditValue));
              end;

           if (frmPosPembayaranPay.edRedeemValue.EditValue > 0) then
              begin
                 lblSumJudul.Lines.Add('Beginning Point');
                 lblSumValue.Lines.Add(VarToStr(frmPosPembayaranPay.edMemberAvailable.EditValue));
                 lblSumJudul.Lines.Add('Redeem Point');
                 lblSumValue.Lines.Add(FormatFloat('#,#', frmPosPembayaranPay.edMemberPointToPay.EditValue));
                 lblSumJudul.Lines.Add('End Point');
                 lblSumValue.Lines.Add(VarToStr(frmPosPembayaranPay.edSisaPoint.EditValue));
              end;

           if (frmPosPembayaranPay.edCash.EditValue > 0) then
              begin
                 lblSumJudul.Lines.Add('Cash');
                 lblSumValue.Lines.Add(FormatFloat('#,#', frmPosPembayaranPay.edCash.EditValue));
                 lblSumJudul.Lines.Add('Rounding');
                 lblSumValue.Lines.Add(FormatFloat('#,#', Abs(frmPosPembayaranPay.edRounding.EditValue)));
                 lblSumJudul.Lines.Add('Exchange');
                 lblSumValue.Lines.Add(FormatFloat('#,#', frmPosPembayaranPay.edkembalian.EditValue));
              end;
           if (frmPosPembayaranPay.edValue1.EditValue > 0) then
              begin
                 lblSumJudul.Lines.Add(TitleCase(frmPosPembayaranPay.edPayment1.Text) + ' # ' + frmPosPembayaranPay.edBank1.Text);
                 lblSumValue.Lines.Add(FormatFloat('#,#', frmPosPembayaranPay.edValue1.EditValue));
              end;
           if (frmPosPembayaranPay.edValue2.EditValue > 0) then
              begin
                 lblSumJudul.Lines.Add(frmPosPembayaranPay.edPayment2.Text + ' # ' + frmPosPembayaranPay.edBank2.Text);
                 lblSumValue.Lines.Add(FormatFloat('#,#', frmPosPembayaranPay.edValue2.EditValue));
              end;
           if (frmPosPembayaran.lblKodeMember.Caption <> '') then
             begin
               lblSumJudul.Lines.Add('Your Points ');
               lblSumValue.Lines.Add(VarToStr(frmPosPembayaranPay.edSisaPoint.EditValue));
             end;
           pjgSummary := 28 * frmPrintTrans.lblSumJudul.Lines.Count;
           frmPrintTrans.lblSumJudul.Height := frmPrintTrans.lblSumJudul.Height + pjgSummary;
           frmPrintTrans.lblSumValue.Height := frmPrintTrans.lblSumValue.Height + pjgSummary;
           frmPrintTrans.SummaryBand1.Height := frmPrintTrans.SummaryBand1.Height + pjgSummary;
           frmPrintTrans.qrpPrintBill.Height := frmPrintTrans.qrpPrintBill.Height + pjgSummary;
        end;
     
     frmPrintTrans.lblFooter1.Caption := frmMain.FOOTER1;
     frmPrintTrans.lblFooter2.Caption := frmMain.FOOTER2;
     frmPrintTrans.lblFooter3.Caption := frmMain.FOOTER3;
     Printer.PrinterIndex := frmPosPembayaran.cbPrinterPos.ItemIndex;
     frmPrintTrans.qrpPrintBill.Prepare;
     //frmPrintTrans.qrpPrintBill.PrinterSettings.PrinterIndex := frmPosPembayaran.cbPrinterPos.ItemIndex;
     frmPrintTrans.qrpPrintBill.Preview;
     QryPrintMaster.Free;
     QryPrintDetail.Free;

end;

procedure TfrmPosPembayaranPay.CetakProduk(var kodePayProduk: String);
var
   QryPrintMaster, QryPrintDetail : TMyQuery;
   panjang, rCount, pjgDetail, pjgSummary, pjgNote : Integer;
  i: Integer;
  jSonItem : XSuperObject.ISuperObject;
  isCetak, keterangan : String;
begin
    QryPrintMaster := TMyQuery.Create(Self);
    QryPrintMaster.Connection := DMDB.dbInternal;
    QryPrintMaster.SQL.Add('select * from temptable');
    QryPrintMaster.Active := true;

    QryPrintDetail := TMyQuery.Create(Self);
    QryPrintDetail.Connection := DMDB.dbInternal;
    QryPrintDetail.SQL.Add('select * from temptable');
    QryPrintDetail.Active := true;

    Application.CreateForm(TfrmPrintProduk, frmPrintProduk);
    frmPrintProduk.lblJudulAtas.Caption := frmMain.JUDULATAS;
    frmPrintProduk.lblJudul.Caption := frmMain.JUDULBAWAH;
    frmPrintProduk.lblAlamat1.Caption := frmMain.APP_OUTLETADDRESS + ', ' + frmMain.APP_OUTLETCITY;
    frmPrintProduk.lblAlamat2.Caption := frmMain.APP_OUTLETPROVINCE + 'Telp. ' + frmMain.APP_OUTLETPHONE + ', ';
    frmPrintProduk.lbltanggal.Caption := FormatDateTime('dd/MMM/yyyy', tglServer);
    //
    rCount := 0;

    QryPrintDetail.Close;
    QryPrintDetail.SQL.Clear;
    QryPrintDetail.SQL.Add('select id_trans, produk_jasa_id, quantity, disc_percent, subtotal, ' +
         'produk_jasa_nama, ' +
         '(select main_menu.notes from main_menu where ' +
         'main_menu.menu_id = trans_detail.produk_jasa_id) as notes ' +
         'from trans_detail where trans_detail.payment_id = ''' +
         kodePayProduk + ''' AND trans_detail.trans_type_id <> ''' + 'BJ' +
         ''' AND trans_detail.trans_type_id <> ''' + 'BA' + ''' ' +
         'ORDER BY id_trans ASC');
    QryPrintDetail.Open;
    QryPrintDetail.First;
    for i := 0 to QryPrintDetail.RecordCount -1 do
       begin
          with frmPrintProduk do
               begin
                  lblNamaMenu.Lines.Add(QryPrintDetail.Fields[5].AsString);
                  if (QryPrintDetail.Fields[3].AsFloat > 0) then
                    begin
                      lblNamaMenu.Lines.Add('   ' + QryPrintDetail.Fields[2].AsString + ' X ' +
                           FormatFloat('#,#', StrToFloat(QryPrintDetail.Fields[4].AsString)) + ' (Disc ' +
                           QryPrintDetail.Fields[3].AsString + '%)');
                    end
                  else if (QryPrintDetail.Fields[3].AsFloat <= 0) then
                    begin
                      lblNamaMenu.Lines.Add('   ' + QryPrintDetail.Fields[2].AsString + ' X ' +
                          FormatFloat('#,#', StrToFloat(QryPrintDetail.Fields[4].AsString)));
                    end;

                  rCount := rCount + 2;
                  if (isCetak = 'Y') then
                    begin
                       lblNamaMenu.Lines.Add('[' + keterangan + ']');
                       rCount := rCount + 1;
                    end;
               end;
            QryPrintDetail.Next;
       end;

    pjgDetail := rCount * 21;
    frmPrintProduk.lblNamaMenu.Height := frmPrintProduk.lblNamaMenu.Height + pjgDetail;
    frmPrintProduk.PageHeaderBand1.Height := frmPrintProduk.PageHeaderBand1.Height + pjgDetail;
    frmPrintProduk.qrpPrintProduk.Height := frmPrintProduk.qrpPrintProduk.Height + pjgDetail;
    pjgSummary := 0;

    with  frmPrintProduk do
        begin
          lblSumJudul.Lines.Add('Subtotal');
          lblSumValue.Lines.Add(FormatFloat('#,#', (totBP + totBG)));
        end;
   frmPrintProduk.lblFooter1.Caption := frmMain.FOOTER1;
   frmPrintProduk.lblFooter2.Caption := frmMain.FOOTER2;
   frmPrintProduk.lblFooter3.Caption := frmMain.FOOTER3;
   Printer.PrinterIndex := frmPosPembayaran.cbPrinterPos.ItemIndex;
   frmPrintProduk.qrpPrintProduk.Prepare;
   frmPrintProduk.qrpPrintProduk.Preview;

   QryPrintMaster.Free;
   QryPrintDetail.Free;
end;

procedure TfrmPosPembayaranPay.CetakRating(var kodePayCetak: String);
var
   rand1, rand2, code1, RatingCode, idPayment, transID : String;
   i : Integer;
  y: Integer;

begin
     idPayment := kodePayCetak;
     qrySearch.Close;
     qrySearch.SQL.Clear;
     qrySearch.SQL.Add('select trans_id from trans_master where id_payment = ''' + idPayment + '''');
     qrySearch.Open;
     qrySearch.First;
     for i := 0 to qrySearch.RecordCount - 1 do
         begin
               transID := qrySearch.Fields[0].AsString;
               rand1 := GenerateRandomString(5);
               code1 :=  frmMain.APP_OUTLETID + FormatDateTime('yyMMddhhmmss', now);
               rand2 := GenerateRandomString(5);
               RatingCode := rand1 + code1 + rand2;
               qryExec.SQL.Clear;
               qryExec.SQL.Add('insert into ben_guest_rating values(' +
                   '''' + RatingCode + ''',' +
                   '''' + idPayment + ''',' +
                   '''' + transID + ''',' +
                   '''' + 'N' + ''',' +
                   '''' + '2025-01-01 01:01:01' + ''');');
               qryExec.ExecSQL;
               qrySearch.Next;
         end;
    qryFind.Close;
    qryFind.SQL.Clear;
    qryFind.SQL.Add('select ratingcode, id_payment, trans_id from ben_guest_rating where id_payment = ''' + idPayment + '''');
    qryFind.Open;
    qryFind.First;
    for y := 0 to qryFind.RecordCount - 1 do
        begin
              transID := qryFind.Fields[2].AsString;
//              ShowMessage(transID);
              qryCari.Close;
              qryCari.SQL.Clear;
              qryCari.SQL.Add('select room_id, therapist_id from trans_master where trans_id = ''' + transID + '''');
              qryCari.Open;
              ShowMessage(qryCari.Fields[0].AsString + '#' + qryCari.Fields[1].AsString);
              Application.CreateForm(TfrmPrintRatingCode, frmPrintRatingCode);
              with frmPrintRatingCode do
                   begin
                        frmPrintRatingCode.lblRatingApps.BarcodeText := 'https://zfeedback.zenfamilyspa.id/?ratingcode=' + qryFind.Fields[0].AsString;
                        frmPrintRatingCode.lblDetailsRate.Caption := FormatDateTime('dd/MM/yy hh:mm:ss', Now) + ' @ ' +frmMain.APP_OUTLETNAME +
                            ' Room : ' + qryCari.Fields[0].AsString + ' TR ID : ' + qryCari.Fields[1].AsString;
                   end;
              frmPrintRatingCode.qrpPrintRating.Prepare;
              frmPrintRatingCode.qrpPrintRating.Preview;
              qryFind.Next;
        end;

end;

procedure TfrmPosPembayaranPay.ckRedeemPropertiesEditValueChanged(
  Sender: TObject);
begin
   if (ckRedeem.Checked = False) then
     begin
         edSisaPoint.EditValue := edMemberAvailable.EditValue + edTambahPoint.EditValue;
         edRedeemValue.EditValue := 0;
     end
   else if (ckRedeem.Checked = True) then
     begin
         edSisaPoint.EditValue := edMemberAvailable.EditValue - edMemberPointToPay.EditValue;
         edRedeemValue.EditValue := edMemberPointToPay.EditValue * 1000;
     end;
end;

function TfrmPosPembayaranPay.CreateAutoNumb : String;
var
  tmpID, strNewID : String;
  intLastID, intNewID : Integer;
begin
  tmpID := frmMain.APP_OUTLETID + '.' + 'PAY.' + FormatDateTime('yyMMdd', Date) + '%';
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select id_payment from trans_payment where id_payment like ' + QuotedStr(tmpID) +
      ' ORDER by id_payment ASC');
  qrySearch.Open;
  if (qrySearch.IsEmpty) then
    begin
      strNewID := frmMain.APP_OUTLETID + '.' + 'PAY.' + FormatDateTime('yyMMdd', Date) + '001';
    end
  else
    begin
      qrySearch.Last;
      intLastID := StrToInt(RightStr(qrySearch.Fields[0].AsString, 3));
      intNewID := intLastID + 1;
      case Length(IntToStr(intNewID)) of
        1 : strNewID := frmMain.APP_OUTLETID + '.' + 'PAY.' + FormatDateTime('yyMMdd', Date) + '00' + IntToStr(intNewID);
        2 : strNewID := frmMain.APP_OUTLETID + '.' + 'PAY.' + FormatDateTime('yyMMdd', Date) + '0' + IntToStr(intNewID);
        3 : strNewID := frmMain.APP_OUTLETID + '.' + 'PAY.' + FormatDateTime('yyMMdd', Date) + IntToStr(intNewID);
      end;
    end;
    Result := strNewID;
end;

procedure TfrmPosPembayaranPay.cxButton1Click(Sender: TObject);
var
  idPayment, idTrans, kodeMember, keterangan, kodePaket, NomorGC : String;
  i, panjang: Integer;
  pTambah, pKurang, pSisa, pAwal, nSubtotal : Double;

begin
    HitungSisa;
    //frmMain.KirimNotif('Test', 'Test 2');
    if (edkembalian.EditValue > 0) then
      begin
        ShowMessage('Payment masih kurang !!');
        Exit;
      end;
    pAwal := edMemberAvailable.EditValue;
    pSisa := edSisaPoint.EditValue;
    nSubtotal := edSubtPayment.EditValue;
    if (ckRedeem.Checked = True) then
      begin
        pTambah := 0;
        pKurang := edMemberPointToPay.EditValue;
      end
    else if (ckRedeem.Checked = False) then
      begin
        pTambah := edTambahPoint.EditValue;
        pKurang := 0;
      end;
    idPayment := CreateAutoNumb;
    KODEPEMBAYARAN := idPayment;
    kodeMember := frmPosPembayaran.lblKodeMember.Caption;
    panjang := Length(frmPosPembayaran.edScan.Text);
    if (frmPosPembayaran.lblKodeMember.Caption <> '') then
      begin
        if (panjang <= 15) then
          begin
//               ShowMessage('Member Lama');
               TTask.Run(
                    procedure
                      begin
                         TThread.Synchronize(nil,
                            procedure
                            begin
                               frmMain.UpdateMember(kodeMember, idPayment, pTambah, pKurang, pSisa, pAwal, nSubtotal);
                            end);
                      end
                   );
          end
        else if (panjang > 15) then
          begin
//               ShowMessage('Member Baru');

               TTask.Run(
                    procedure
                      begin
                         TThread.Synchronize(nil,
                            procedure
                            begin
                                 frmMain.PutNewMember(kodeMember, idPayment, pTambah, pKurang, pSisa, pAwal, nSubtotal);
                            end);
                      end
                   );
          end;

      end;
    {TTask.Run(
        procedure
          begin
             TThread.Synchronize(nil,
                procedure
                begin
                   frmPosPembayaranPay.UpdatePayment(idPayment, pTambah, pKurang);
                end);
          end
       );}
    UpdatePayment(idPayment, pTambah, pKurang);
    //UpdateDetails(idPayment);
    {
    if (edValGC.EditValue > 0) then
      begin
         update payment_by_gc
      end;
      }
    qrySearch.Close;
    qrySearch.SQL.Clear;
    qrySearch.SQL.Add('select produk_jasa_id from trans_detail where ' +
        'trans_type_id = ''' + 'BG' + ''' AND payment_id = ''' + idPayment + '''');
    qrySearch.Open;
    qrySearch.First;
    if (NOT qrySearch.IsEmpty) then
      begin
         for i := 0 to qrySearch.RecordCount -1 do
           begin
              keterangan := frmMain.USERAPPS+ ' ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', tglServer);
              kodeMember := frmPosPembayaran.lblKodeMember.Caption;
              kodePaket := qrySearch.Fields[0].AsString;
              qryExec.SQL.Clear;
              qryExec.SQL.Add('insert into gc_sold(id_members, gc_number, tanggal, expired_date, ' +
                  'nama_menu, harga_jasa, aktif, payment_jual, terjual, tgl_jual, outlet_jual) ' +
                  'select ' + QuotedStr(frmPosPembayaran.lblKodeMember.Caption) + ',gc_number, tanggal, ' +
                  'expired_date, nama_menu, harga_jasa, ' + QuotedStr('Y') + ',' + QuotedStr(idPayment) +
                  ',' + QuotedStr('Y') + ',' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglServer)) + ',' +
                  QuotedStr(frmMain.APP_OUTLETID) + ' from gc_detail where paket_number = ''' +
                  qrySearch.Fields[0].AsString + ''';');
              qryExec.SQL.Add('update gc_master set ' +
                 'terjual = ''' + 'Y' + ''',' +
                 'notes = ' + QuotedStr(keterangan) +
                 ' where paket_number = ''' + qrySearch.Fields[0].AsString + ''';');
              qryExec.SQL.Add('update gc_detail set ' +
                 'terjual = ''' + 'Y' + ''',' +
                 'notes = ' + QuotedStr(keterangan) +
                 ' where paket_number = ''' + qrySearch.Fields[0].AsString + ''';');
              qryExec.SQL.Add('delete from main_menu ' +
                 'where menu_id = ''' + qrySearch.Fields[0].AsString + ''';');

              qryExec.ExecSQL;
              qrySearch.Next;
           end;
         TTask.Run(
            procedure
              begin
                 TThread.Synchronize(nil,
                    procedure
                    begin
                       frmMain.UpdateBeliGC(kodePaket, idPayment , kodeMember);
                    end);
              end
           );
      end;
    if (edValGC.EditValue > 0) then
      begin
        NomorGC := edNOGC.Text;
        //ShowMessage('Payment By GC ' + NomorGC);
        TTask.Run(
            procedure
              begin
                 TThread.Synchronize(nil,
                    procedure
                    begin
                       frmMain.UpdatePakaiGC(idPayment, NomorGC);
                    end);
              end
           );
      end;

    CetakNota(idPayment);
    if ((frmPosPembayaranPay.totBP > 0) OR (frmPosPembayaranPay.totBG > 0)) then
        begin
          {TTask.Run(
             procedure
                begin
                  TThread.Synchronize(nil,
                    procedure
                    begin
                       frmPosPembayaranPay.CetakProduk(idPayment);
                    end);
                end
                   ); }
             CetakProduk(idPayment);

        end;

    CetakRating(idPayment);
    ShowMessage('Payment Finish !');
    frmPosPembayaran.edPromo.Clear;
    frmPosPembayaran.edPromo.ClearSelection;
    frmPosPembayaran.edPromoRef.Clear;
    frmPosPembayaran.edDiscPromo.EditValue := 0;
    frmPosPembayaran.edDiscPurpose.EditValue := 0;
    frmPosPembayaran.edPurpose.Clear;
    frmPosPembayaran.tvPembayaran.DataController.SelectAll;
    frmPosPembayaran.tvPembayaran.DataController.DeleteSelection;
    frmPosPembayaran.edJasa.EditValue := 0;
    frmPosPembayaran.edAdditional.EditValue := 0;
    frmPosPembayaran.edGift.EditValue := 0;
    frmPosPembayaran.edProduk.EditValue := 0;
    frmPosPembayaran.edMemberNama.Clear;
    frmPosPembayaran.edMemberPoint.EditValue := 0;
    frmPosPembayaran.edSubtotal.EditValue := 0;
    frmPosPembayaran.edGrandTotal.EditValue := 0;
    frmPosPembayaran.edScan.Clear;
    frmPosPembayaran.lblNoKartu.Caption := '';
    frmPosPembayaran.lblKodeMember.Caption := '';
    //frmPosPembayaran.Close;
    frmPosPembayaranPay.Close;
end;

procedure TfrmPosPembayaranPay.cxButton2Click(Sender: TObject);
begin
   edCash.EditValue := edCash.EditValue + 100000;
end;

procedure TfrmPosPembayaranPay.cxButton3Click(Sender: TObject);
begin
   edCash.EditValue := edCash.EditValue + 50000;
end;

procedure TfrmPosPembayaranPay.cxButton4Click(Sender: TObject);
begin
   edCash.EditValue := edCash.EditValue + 20000;
end;

procedure TfrmPosPembayaranPay.cxButton5Click(Sender: TObject);
begin
  edCash.EditValue := 0;
end;

procedure TfrmPosPembayaranPay.cxButton6Click(Sender: TObject);
begin
    edCash.EditValue := edCash.EditValue + 10000;
end;

procedure TfrmPosPembayaranPay.cxButton7Click(Sender: TObject);
begin
   edCash.EditValue := edCash.EditValue + 5000;
end;

procedure TfrmPosPembayaranPay.cxButton8Click(Sender: TObject);
begin
   edNOGC.Clear;
   edValGC.EditValue := 0;
   lblBeliGC.Caption := '';
end;

procedure TfrmPosPembayaranPay.edCashPropertiesEditValueChanged(
  Sender: TObject);
begin
   HitungSisa;
end;

procedure TfrmPosPembayaranPay.edkembalianFocusChanged(Sender: TObject);
begin
     HitungSisa;
end;

procedure TfrmPosPembayaranPay.edNOGCKeyPress(Sender: TObject; var Key: Char);
var
  noGift : String;
  btnSelected : Integer;
begin
    if (key = #13) then
      begin
         btnFindGC.Click;
      end;
end;

procedure TfrmPosPembayaranPay.edPayment1PropertiesEditValueChanged(
  Sender: TObject);
begin
   qrySearch.Close;
    qrySearch.SQL.Clear;
    qrySearch.SQL.Add('select usededc from pos_master_payment where kodepayment = ''' +
        VarToStr(edPayment1.EditValue) + '''');
    qrySearch.Open;
    if (qrySearch.Fields[0].AsString = 'Y') then edBank1.Visible := True
    else if (qrySearch.Fields[0].AsString = 'N') then
      begin
        edBank1.ClearSelection;
        edBank1.Visible := False;
      end;
end;

procedure TfrmPosPembayaranPay.edPayment2PropertiesEditValueChanged(
  Sender: TObject);
begin
    qrySearch.Close;
    qrySearch.SQL.Clear;
    qrySearch.SQL.Add('select usededc from pos_master_payment where kodepayment = ''' +
        VarToStr(edPayment2.EditValue) + '''');
    qrySearch.Open;
    if (qrySearch.Fields[0].AsString = 'Y') then edBank2.Visible := True
    else if (qrySearch.Fields[0].AsString = 'N') then
      begin
        edBank2.ClearSelection;
        edBank2.Visible := False;
      end;
end;

procedure TfrmPosPembayaranPay.edRedeemValueFocusChanged(Sender: TObject);
begin
    HitungSisa;
end;

procedure TfrmPosPembayaranPay.edRedeemValuePropertiesEditValueChanged(
  Sender: TObject);
begin
   HitungSisa;
end;

procedure TfrmPosPembayaranPay.edReff1FocusChanged(Sender: TObject);
begin
   HitungSisa;
end;

procedure TfrmPosPembayaranPay.edReff2FocusChanged(Sender: TObject);
begin
   HitungSisa;
end;

procedure TfrmPosPembayaranPay.edSisaPaymentFocusChanged(Sender: TObject);
begin
   HitungSisa;
end;

procedure TfrmPosPembayaranPay.edTotalPaymentFocusChanged(Sender: TObject);
begin
   HitungSisa;
end;

procedure TfrmPosPembayaranPay.edValGCPropertiesEditValueChanged(
  Sender: TObject);
begin
   HitungSisa;
end;

procedure TfrmPosPembayaranPay.edValue1FocusChanged(Sender: TObject);
begin
    HitungSisa;
end;

procedure TfrmPosPembayaranPay.edValue1PropertiesEditValueChanged(
  Sender: TObject);
begin
    HitungSisa;
end;

procedure TfrmPosPembayaranPay.edValue2PropertiesEditValueChanged(
  Sender: TObject);
begin
   HitungSisa;
end;

procedure TfrmPosPembayaranPay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qrySearch.Free;
  qryExec.Free;
  qryFind.Free;
  LS_TRANS_ID.Free;
  Action := caFree;
end;

procedure TfrmPosPembayaranPay.FormCreate(Sender: TObject);
begin
    qrySearch := TMyQuery.Create(Self);
    qrySearch.Connection := DMDB.dbInternal;
    qrySearch.SQL.Add('select * from temptable');
    qrySearch.Active := true;

    qryCari := TMyQuery.Create(Self);
    qryCari.Connection := DMDB.dbInternal;
    qryCari.SQL.Add('select * from temptable');
    qryCari.Active := true;

    qryTemp := TMyQuery.Create(Self);
    qryTemp.Connection := DMDB.dbInternal;
    qryTemp.SQL.Add('select * from temptable');
    qryTemp.Active := true;

    qryFind := TMyQuery.Create(Self);
    qryFind.Connection := DMDB.dbInternal;
    qryFind.SQL.Add('select * from temptable');
    qryFind.Active := true;

    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;
    //LS_TRANS_ID := := TStringList.Create;

    qrySearch.Close;
    qrySearch.SQL.Clear;
    qrySearch.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
    qrySearch.Open;
    tglServer := qrySearch.Fields[0].AsDateTime;
    qryPayment.Active := True;
    qryBank.Active := True;
    Randomize;

end;

function TfrmPosPembayaranPay.GenerateRandomString(ALength: Integer): string;
const
  // Define the set of characters that can be used in the random string.
  // This includes uppercase letters, lowercase letters, and digits.
  ValidChars: array[0..61] of Char = (
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
  );
var
  I: Integer;
begin
     Result := ''; // Initialize the result string as empty
  // Loop 'ALength' times to build the string
  for I := 1 to ALength do
  begin
    // Append a random character from the ValidChars array to the result string.
    // Random(High(ValidChars) + 1) generates a random index within the bounds of ValidChars.
    Result := Result + ValidChars[Random(High(ValidChars) + 1)];
  end;
end;

procedure TfrmPosPembayaranPay.HitungSisa;
begin
   if (edCash.EditValue > 0) then
     begin
        edTotalPayment.EditValue := edRedeemValue.EditValue + edCash.EditValue +
                                    edValue1.EditValue + edValue2.EditValue + edValGC.EditValue;
        edSisaPayment.EditValue := edSubtPayment.EditValue - edTotalPayment.EditValue - edRounding.EditValue;
        edkembalian.EditValue := edSisaPayment.EditValue;
     end
   else if (edCash.EditValue <= 0) then
     begin
        edTotalPayment.EditValue := edRedeemValue.EditValue + edCash.EditValue +
                                    edValue1.EditValue + edValue2.EditValue + edValGC.EditValue;
        edSisaPayment.EditValue := edSubtPayment.EditValue - edTotalPayment.EditValue;
        edkembalian.EditValue := edSisaPayment.EditValue;
     end;
end;

procedure TfrmPosPembayaranPay.UpdateDetails(var kodePayUpdate: String);
var
   i, recSel : Integer;
   idTrans : String;
   qryUpdateDetails : TMyQuery;
begin
   {qryUpdateDetails := TMyQuery.Create(Self);
   qryUpdateDetails.Connection := DMDB.dbInternal;
   qryUpdateDetails.SQL.Add('select * from temptable');
   qryUpdateDetails.Active := true;}
   {LS_TRANS_ID.Clear;

   vTransID := '';
   tvPembayaran.DataController.GotoFirst;
   for i := 0 to frmPosPembayaran.tvPembayaran.DataController.RecordCount-1 do
    begin
        recSel := frmPosPembayaran.tvPembayaran.DataController.GetFocusedRecordIndex;
        idTrans := vartostr(frmPosPembayaran.tvPembayaran.DataController.GetValue(recSel, frmPosPembayaran.tvPembayaranIDTrans.Index));
        if (vTransID <> idTrans) then
          begin
            frmPosPembayaranPay.LS_TRANS_ID.Add(idTrans);
            vTransID := idTrans;
          end;
        frmPosPembayaran.tvPembayaran.DataController.GotoNext;
    end; }

   for i :=0 to LS_TRANS_ID.Count-1 do
      begin
        idTrans := LS_TRANS_ID[i];
        qryExec.SQL.Clear;
        qryExec.SQL.Add('update trans_detail set ' +
            'payment_id = ''' + kodePayUpdate + ''', ' +
            'taked = ''' + 'F' + ''' ' +
            'where id_trans = ''' + idTrans + ''';');
        qryExec.SQL.Add('update trans_master set ' +
           'status_trans = ''' + 'PAID' + ''',' +
           'id_payment = ''' + kodePayUpdate + ''',' +
           'promo = ''' + 'F' + ''' ' +
           'where trans_id = ''' + idTrans + ''';');
        qryExec.ExecSQL;
      end;
   //qryUpdateDetails.Free;
end;

procedure TfrmPosPembayaranPay.UpdatePayment(var kodePayMaster : String; tPoint : Double; kPoint : Double);
var
  pTambah, pKurang : Double;
  Ada : Boolean;
  //qryExecPayment : TMyQuery;
begin
    {qryExecPayment := TMyQuery.Create(Self);
    qryExecPayment.Connection := DMDB.dbInternal;
    qryExecPayment.SQL.Add('select * from temptable');
    qryExecPayment.Active := true; }
    Ada := True;
    while (ada=True) do
      begin
        qryFind.Close;
        qryFind.SQL.Clear;
        qryFind.SQL.Add('select id_payment from trans_payment where id_payment = ''' + kodePayMaster + '''');
        qryFind.Open;
        if (qryFind.IsEmpty) then Ada := False
        else if (qryFind.IsEmpty) then
           begin
             kodePayMaster := CreateAutoNumb;
             Ada:= True;
           end;
      end;

    if (ckRedeem.Checked = True) then
      begin
        pTambah := 0;
        pKurang := edMemberPointToPay.EditValue;
      end
    else if (ckRedeem.Checked = False) then
      begin
        pTambah := edTambahPoint.EditValue;
        pKurang := 0;
      end;
//update table payment_master
    qryExec.SQL.Clear;
    qryExec.SQL.Add('insert into trans_payment values(' +
        '''' + kodePayMaster + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd', tglServer) + ''',' +
        '''' + FormatDateTime('hh:mm:ss', tglServer) + ''',' +
        '''' + frmPosPembayaran.lblKodeMember.Caption + ''',' +
        QuotedStr(frmPosPembayaran.edMemberNama.Text) + ',' +
        '''' + FloatToStr(edSubtPayment.EditValue) + ''',' +
        '''' + FloatToStr(0) + ''',' +
        '''' + FloatToStr(0) + ''',' +
        '''' + FloatToStr(edSubtPayment.EditValue) + ''',' +
        '''' + FloatToStr(edTotalPayment.EditValue) + ''',' +
        '''' + FloatToStr(edkembalian.EditValue) + ''',' +
        '''' + FloatToStr(edMemberAvailable.EditValue) + ''',' +
        '''' + FloatToStr(pTambah) + ''',' +
        '''' + FloatToStr(pKurang) + ''',' +
        '''' + FloatToStr(edSisaPoint.EditValue) + ''',' +
        '''' + kodePayMaster + ''',' +
        '''' + kodePayMaster + ''',' +
        QuotedStr(frmMain.USERAPPS) + ',' +
        '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', tglServer) + ''',' +
        '''' + frmMain.APP_OUTLETID + ''');');
    //payment_details
    qryExec.SQL.Add('insert into trans_payment_detail values(' +
         '''' + kodePayMaster + ''',' +
         '''' + FormatDateTime('yyyy-MM-dd', tglServer) + ''',' +
         '''' + FloatToStr(frmPosPembayaran.edSubtotal.EditValue) + ''',' +
         '''' + VarToStr(frmPosPembayaran.edPromo.EditValue) + ''',' +
         '''' + frmPosPembayaran.edPromoRef.Text + ''',' +
         '''' + FloatToStr(frmPosPembayaran.edDiscPromo.EditValue) + ''',' +
         '''' + FloatToStr(frmPosPembayaran.edDiscPurpose.EditValue) + ''',' +
         QuotedStr(frmPosPembayaran.edDiscPurpose.Text) + ',' +
         '''' + FloatToStr(edSubtPayment.EditValue) + ''',' +
         '''' + FloatToStr(edRedeemValue.EditValue) + ''',' +
         QuotedStr(edNOGC.Text) + ',' +
         '''' + FloatToStr(edValGC.EditValue) + ''',' +
         '''' + FloatToStr(edCash.EditValue) + ''',' +
         '''' + VarToStr(edPayment1.EditValue) + ''',' +
         '''' + VarToStr(edBank1.EditValue) + ''',' +
         QuotedStr(edReff1.Text) + ',' +
         '''' + FloatToStr(edValue1.EditValue) + ''',' +
         '''' + VarToStr(edPayment2.EditValue) + ''',' +
         '''' + VarToStr(edBank2.EditValue) + ''',' +
         QuotedStr(edReff2.Text) + ',' +
         '''' + FloatToStr(edValue2.EditValue) + ''',' +
         '''' + FloatToStr(Abs(edRounding.EditValue)) + ''',' +
         '''' + FloatToStr(Abs(edkembalian.EditValue)) + ''',' +
         QuotedStr(frmMain.USERAPPS) + ',' +
         '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', tglServer) + ''',' +
         '''' + '' + ''');');
    //qryExec.ExecSQL;
    qryExec.ExecSQL;
//end update table payment_master
    UpdateDetails(kodePayMaster);
    //qryExecPayment.Free;
end;

{ UpdateServerThread }

{procedure TfrmPosPembayaranPay.Button1Click(Sender: TObject);
begin
   KODEPEMBAYARAN := CreateAutoNumb;
   if (CekInternet = True) then
     begin
       with UpdateServerThread.Create do
          begin
            Priority := tpNormal;
            Resume;
          end;
     end
   else if (CekInternet = False) then
     begin
       ShowMessage('No Internet Connection, ' + #13 +
                   'Data Member Not Updated, Contact Member Admin');
     end;
end;}



{constructor UpdateServerThread.Create;
begin
   inherited Create(True);
   dbMembers := TMyConnection.Create(nil);
   dbMembers.Server := frmMain.SERVER_DBHOST;
   dbMembers.Database := frmMain.MEMBERDBNAME;
   dbMembers.Username := frmMain.SERVER_DBUSER;
   dbMembers.Password := frmMain.SERVER_DBPASS;
   dbMembers.Port := StrToInt(frmMain.SERVER_DBPORT);

   kodeMember := frmPosPembayaran.lblKodeMember.Caption;
   strCKRedeem := vartostr(frmPosPembayaranPay.ckRedeem.EditingValue);
   namaUserMain := frmMain.USERAPPS;
   POINTAWAL := frmPosPembayaranPay.edMemberAvailable.EditValue;
   POINTTAMBAH := frmPosPembayaranPay.edTambahPoint.EditValue;
   POINTKURANG := frmPosPembayaranPay.edMemberPointToPay.EditValue;
   POINTSISA := frmPosPembayaranPay.edSisaPoint.EditValue;
   kodeBayar := frmPosPembayaranPay.KODEPEMBAYARAN;
   TOTALPAYMENT := frmPosPembayaranPay.edSubtPayment.EditValue;
   kodeCabang := frmMain.APP_OUTLETID;
   try
        dbMembers.Connected := True;
     Except
       on E : Exception do
       ShowMessage('Sorry Database Not Ready !!');
     end;

end;}

{destructor UpdateServerThread.Destroy;
begin
  qryExecMember.Free;
  qrySearchMember.Free;
  dbMembers.Free;
  inherited;
end;}

{procedure UpdateServerThread.Execute;
begin
    if (dbMembers.Connected = True) then
      begin
         qryExecMember := TMyQuery.Create(nil);
         qryExecMember.Connection := dbMembers;
         qryExecMember.SQL.Add('select * from empty_x');
         qryExecMember.Active := true;
         qrySearchMember := TMyQuery.Create(nil);
         qrySearchMember.Connection := dbMembers;
         qrySearchMember.SQL.Add('select * from empty_x');
         qrySearchMember.Active := true;
         if (kodeMember = '') then Exit;
         qryExecMember.SQL.Clear;
         qrySearchMember.Close;
         qrySearchMember.SQL.Clear;
         qrySearchMember.SQL.Add('select id_members from saldoawal where id_members = ''' +
             kodeMember + '''');
         qrySearchMember.Open;

         if (qrySearchMember.IsEmpty) then
           begin

             qryExecMember.SQL.Add('insert into saldoawal values(' +
                 '''' + kodeMember + ''',' +
                 '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                 '''' + FloatToStr(POINTSISA) + ''',' +
                 QuotedStr(namaUserMain) + ',' +
                 '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                 '''' + 'NONE' + ''');');

           end;

         if (strCKRedeem = 'Y') then
           begin

               qryExecMember.Sql.Add('insert into history_trans(trans_id, tanggal, waktu, jumlah_trans, id_member, point_a,' +
                     'point_t, point_k, point_end, id_outlet, user_input) values(' +
                                        '''' + kodeBayar + ''',' +
                                        '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                                        '''' + FormatDateTime('hh:mm:ss', Time) + ''',' +
                                        '''' + FloatToStr(TOTALPAYMENT) + ''',' +
                                        '''' + kodeMember + ''',' +
                                        '''' + FloatToStr(POINTAWAL) + ''',' +
                                        '''' + FloatToStr(0) + ''',' +
                                        '''' + FloatToStr(POINTKURANG) + ''',' +
                                        '''' + FloatToStr(POINTSISA) + ''',' +
                                        '''' + kodeCabang + ''',' +
                                        '''' + 'AUTOMATIC' + ''');');

           end
         else if (strCKRedeem = 'N') then
           begin

             qryExecMember.Sql.Add('insert into history_trans(trans_id, tanggal, waktu, jumlah_trans, id_member, point_a,' +
                     'point_t, point_k, point_end, id_outlet, user_input) values(' +
                                        '''' + kodeBayar + ''',' +
                                        '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                                        '''' + FormatDateTime('hh:mm:ss', Time) + ''',' +
                                        '''' + FloatToStr(TOTALPAYMENT) + ''',' +
                                        '''' + kodeMember + ''',' +
                                        '''' + FloatToStr(POINTAWAL) + ''',' +
                                        '''' + FloatToStr(POINTTAMBAH) + ''',' +
                                        '''' + FloatToStr(0) + ''',' +
                                        '''' + FloatToStr(POINTSISA) + ''',' +
                                        '''' + kodeCabang + ''',' +
                                        '''' + 'AUTOMATIC' + ''');');

           end;

         qryExecMember.SQL.Add('update members set ' +
             'tot_point = ''' + FloatToStr(POINTSISA) + ''' ' +
             'where id_members = ''' + kodeMember + ''';');
         qryExecMember.ExecSQL;
      end;

end;}

end.
