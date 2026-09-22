unit FReportPosPayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Menus, cxButtons, DateUtils, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, MemDS,
  DBAccess, MyAccess, cxCalc, ShellApi, cxGridExportLink, cxDBLookupComboBox,
  System.Threading, XSuperJSON, XSuperObject,
  Printers, MainSource, strUtils;

type
  TfrmReportPosPayment = class(TForm)
    Label1: TLabel;
    gtbDayli: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    dsQryList: TMyDataSource;
    qryList: TMyQuery;
    dlgSave: TSaveDialog;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    gtbDayliid_payment: TcxGridDBColumn;
    gtbDaylitanggal: TcxGridDBColumn;
    gtbDayliid_member: TcxGridDBColumn;
    gtbDaylinama_member: TcxGridDBColumn;
    gtbDaylipoint_awal: TcxGridDBColumn;
    gtbDaylitambah_point: TcxGridDBColumn;
    gtbDaylikurang_point: TcxGridDBColumn;
    gtbDaylisisa: TcxGridDBColumn;
    gtbDayliid_payment_1: TcxGridDBColumn;
    gtbDaylitanggal_1: TcxGridDBColumn;
    gtbDaylisubtotal: TcxGridDBColumn;
    gtbDaylikodepromo: TcxGridDBColumn;
    gtbDaylirefpromo: TcxGridDBColumn;
    gtbDaylivpromo: TcxGridDBColumn;
    gtbDaylirefdisc: TcxGridDBColumn;
    gtbDaylivdisc: TcxGridDBColumn;
    gtbDaylitotal: TcxGridDBColumn;
    gtbDaylivredeem: TcxGridDBColumn;
    gtbDaylirefgift: TcxGridDBColumn;
    gtbDaylivgift: TcxGridDBColumn;
    gtbDaylivcash: TcxGridDBColumn;
    gtbDaylikodepayment1: TcxGridDBColumn;
    gtbDaylikodebank1: TcxGridDBColumn;
    gtbDaylirefpayment1: TcxGridDBColumn;
    gtbDaylivpayment1: TcxGridDBColumn;
    gtbDaylikodepayment2: TcxGridDBColumn;
    gtbDaylikodebank2: TcxGridDBColumn;
    gtbDaylirefpayment2: TcxGridDBColumn;
    gtbDaylivpayment2: TcxGridDBColumn;
    gtbDaylirounding: TcxGridDBColumn;
    gtbDayliexchange: TcxGridDBColumn;
    gtbDaylilastuser: TcxGridDBColumn;
    gtbDaylilasteditdate: TcxGridDBColumn;
    gtbDaylinotes: TcxGridDBColumn;
    qryPromo: TMyQuery;
    dsQryPromo: TMyDataSource;
    qryPayment: TMyQuery;
    dsQryPayment: TMyDataSource;
    btnCetakUlang: TcxButton;
    cxButton3: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCetakUlangClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    qryCari, qryExec, qrySearch, qryFind : TMyQuery;
    procedure deleteDouble;
  public
    { Public declarations }
  end;

var
  frmReportPosPayment: TfrmReportPosPayment;

implementation

{$R *.dfm}

uses FdmDB, FMain, FPrintTrans, FPrintRatingCode;

procedure TfrmReportPosPayment.btnCetakUlangClick(Sender: TObject);
var
   QryPrintMaster, QryPrintDetail : TMyQuery;
   panjang, rCount, pjgDetail, pjgSummary, pjgNote : Integer;
   i, recSel : Integer;
  jSonItem : XSuperObject.ISuperObject;
  isCetak, keterangan, idPayment : String;
  totBP : Double;
begin

    QryPrintMaster := TMyQuery.Create(Self);
    QryPrintMaster.Connection := DMDB.dbInternal;
    QryPrintMaster.SQL.Add('select * from temptable');
    QryPrintMaster.Active := true;

    QryPrintDetail := TMyQuery.Create(Self);
    QryPrintDetail.Connection := DMDB.dbInternal;
    QryPrintDetail.SQL.Add('select * from temptable');
    QryPrintDetail.Active := true;

    recSel := gtbDayli.DataController.GetFocusedRecordIndex;
    idPayment := vartostr(gtbDayli.DataController.GetValue(recSel, gtbDayliid_payment.Index));
    qryCari.Close;
    qryCari.SQL.Clear;
    qryCari.SQL.Add('select * from trans_payment_detail where id_payment = ''' + idPayment + '''');
    qryCari.Open;

    qryFind.Close;
    qryFind.SQL.Clear;
    qryFind.SQL.Add('select id_member, nama_member, point_awal, tambah_point, kurang_point, sisa from trans_payment where id_payment = ''' + idPayment + '''');
    qryFind.Open;

    Application.CreateForm(TfrmPrintTrans, frmPrintTrans);
    frmPrintTrans.lblJudulAtas.Caption := frmMain.JUDULATAS;
    frmPrintTrans.lblJudul.Caption := frmMain.JUDULBAWAH;
    frmPrintTrans.lblAlamat1.Caption := frmMain.APP_OUTLETADDRESS + ', ' + frmMain.APP_OUTLETCITY;
    frmPrintTrans.lblAlamat2.Caption := frmMain.APP_OUTLETPROVINCE + 'Telp. ' + frmMain.APP_OUTLETPHONE + ', ';
    frmPrintTrans.lbltanggal.Caption := FormatDateTime('dd/MMM/yyyy', qryCari.Fields[1].AsDateTime);
    frmPrintTrans.lblGuest.Caption := qryFind.Fields[1].AsString;

    rCount := 0;
    QryPrintDetail.Close;
    QryPrintDetail.SQL.Clear;
    QryPrintDetail.SQL.Add('select id_trans, produk_jasa_id, quantity, disc_percent, subtotal, ' +
         'produk_jasa_nama, ' +
         '(select main_menu.notes from main_menu where ' +
         'main_menu.menu_id = trans_detail.produk_jasa_id) as notes ' +
         'from trans_detail where trans_detail.payment_id = ''' +
         idPayment + ''' AND trans_detail.trans_type_id <> ''' + 'BP' +
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
            lblSumValue.Lines.Add(FormatFloat('#,#', qryCari.Fields[2].AsFloat));
            {if ((totBP > 0) OR (frmPosPembayaranPay.totBG > 0)) then
              begin
                lblSumValue.Lines.Add(FormatFloat('#,#', (edSubtPayment.EditValue - totBP - totBG)));
              end
            else if ((frmPosPembayaranPay.totBP <= 0) OR (frmPosPembayaranPay.totBG <= 0)) then
              begin
                 lblSumValue.Lines.Add(FormatFloat('#,#', frmPosPembayaranPay.edSubtPayment.EditValue));
              end;}
            {promo traveloka dll}
            if (qryCari.Fields[5].AsFloat > 0) then
              begin
                 lblSumJudul.Lines.Add(TitleCase(qryCari.Fields[3].AsString));
                 lblSumValue.Lines.Add(qryCari.Fields[4].AsString);
              end;
            {disc Add}
           if (qryCari.Fields[7].AsFloat > 0) then
              begin
                 lblSumJudul.Lines.Add(qryCari.Fields[6].AsString);
                 lblSumValue.Lines.Add(FormatFloat('#,#', qryCari.Fields[7].AsFloat));
              end;
           {gc}
           if (qryCari.Fields[11].AsFloat > 0) then
              begin
                 lblSumJudul.Lines.Add('GC#**' + RightStr(qryCari.Fields[10].AsString, 6));
                 lblSumValue.Lines.Add(FormatFloat('#,#', qryCari.Fields[11].AsFloat));
              end;
           {redeem}
           if (qryCari.Fields[9].AsFloat > 0) then
              begin
                 lblSumJudul.Lines.Add('Beginning Point');
                 lblSumValue.Lines.Add(FloatToStr(qryFind.Fields[2].AsFloat));
                 lblSumJudul.Lines.Add('Redeem Point');
                 lblSumValue.Lines.Add(FloatToStr(qryFind.Fields[4].AsFloat));
                 lblSumJudul.Lines.Add('End Point');
                 lblSumValue.Lines.Add(FloatToStr(qryFind.Fields[5].AsFloat));
              end;
           {cash}
           if (qryCari.Fields[12].AsFloat > 0) then
              begin
                 lblSumJudul.Lines.Add('Cash');
                 lblSumValue.Lines.Add(FormatFloat('#,#', qryCari.Fields[9].AsFloat));
                 lblSumJudul.Lines.Add('Rounding');
                 lblSumValue.Lines.Add(FormatFloat('#,#', Abs(qryCari.Fields[21].AsFloat)));
                 lblSumJudul.Lines.Add('Exchange');
                 lblSumValue.Lines.Add(FormatFloat('#,#', qryCari.Fields[22].AsFloat));
              end;
           {Payment Val 1}
           if (qryCari.Fields[16].AsFloat > 0) then
              begin
                 lblSumJudul.Lines.Add(TitleCase(qryCari.Fields[14].AsString) + ' # ' + qryCari.Fields[15].AsString);
                 lblSumValue.Lines.Add(FormatFloat('#,#', qryCari.Fields[16].AsFloat));
              end;

           {Payment Val 2}
           if (qryCari.Fields[20].AsFloat > 0) then
              begin
                 lblSumJudul.Lines.Add(TitleCase(qryCari.Fields[18].AsString) + ' # ' + qryCari.Fields[19].AsString);
                 lblSumValue.Lines.Add(FormatFloat('#,#', qryCari.Fields[20].AsFloat));
              end;

           if (qryFind.Fields[0].AsString <> '') then
             begin
               lblSumJudul.Lines.Add('Your Points ');
               lblSumValue.Lines.Add(FloatToStr(qryFind.Fields[5].AsFloat));
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
     Printer.PrinterIndex := 0;
     frmPrintTrans.qrpPrintBill.Prepare;
     //frmPrintTrans.qrpPrintBill.PrinterSettings.PrinterIndex := frmPosPembayaran.cbPrinterPos.ItemIndex;
     frmPrintTrans.qrpPrintBill.Preview;
     QryPrintMaster.Free;
     QryPrintDetail.Free;
end;

procedure TfrmReportPosPayment.cxButton1Click(Sender: TObject);
begin
  dlgSave.Title := '[Excel 97-2003] Export to...';
     dlgSave.Filter := 'Microsoft Excel 97-2003 (*.xls)|*.xls';
     dlgSave.FileName := '';
     if (dlgSave.Execute) then
        begin
             if (dlgSave.FileName <> '') then
                begin
                     ExportGridToExcel(dlgSave.FileName, cxGrid1, true, true, true, 'xls');
                     if (MessageDlg('Would you like to open exported file now?',
                         mtConfirmation, mbOKCancel, 0) = mrOK) then
                         begin
                              if (ExtractFileExt(dlgSave.FileName) = '.xls') then
                                 ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                              else
                                  ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName + '.xls'), pChar(''), pChar(ExtractFileDir(dlgSave.FileName + '.xls')), SW_MAXIMIZE)
                         end
                     else exit;
                end
             else exit;
        end
     else exit;
end;

procedure TfrmReportPosPayment.cxButton2Click(Sender: TObject);
begin
  qryList.Close;
  qryList.SQL.Clear;
  qryList.SQL.Add('SELECT trans_payment.id_payment, trans_payment.tanggal, ' +
      'trans_payment.id_member, trans_payment.nama_member, trans_payment.point_awal, ' +
      'trans_payment.tambah_point, trans_payment.kurang_point, trans_payment.sisa, ' +
      'trans_payment_detail.* FROM trans_payment INNER JOIN trans_payment_detail ON ' +
      'trans_payment.id_payment = trans_payment_detail.id_payment ' +
      'WHERE trans_payment.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND trans_payment.tanggal <= ''' +
      FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
  qryList.Open;
  gtbDayli.DataController.Refresh;
end;

procedure TfrmReportPosPayment.cxButton3Click(Sender: TObject);
var
   transID, idPayment : String;
   y, recSel : Integer;
begin
    recSel := gtbDayli.DataController.GetFocusedRecordIndex;
    idPayment := vartostr(gtbDayli.DataController.GetValue(recSel, gtbDayliid_payment.Index));

    qryFind.Close;
    qryFind.SQL.Clear;
    qryFind.SQL.Add('select ratingcode, id_payment, trans_id from ben_guest_rating where id_payment = ''' + idPayment + '''');
    qryFind.Open;
    qryFind.First;
    for y := 0 to qryFind.RecordCount - 1 do
        begin
              transID := qryFind.Fields[2].AsString;
              qryCari.Close;
              qryCari.SQL.Clear;
              qryCari.SQL.Add('select room_id, therapist_id from trans_master where trans_id = ''' + transID + '''');
              qryCari.Open;
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

procedure TfrmReportPosPayment.deleteDouble;
var
  i: Integer;
  idPayment : String;
begin
  qryCari.SQL.Clear;
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select id_payment from trans_payment_detail where tanggal >= ''' +
     FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND tanggal <= ''' +
     FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
  qrySearch.Open;
  qrySearch.First;
  for i := 0 to qrySearch.RecordCount -1 do
    begin
       idPayment := qrySearch.Fields[0].AsString;
       qryFind.Close;
       qryFind.SQL.Clear;
       qryFind.SQL.Add('select id_payment from trans_master where id_payment = ''' +
          idPayment + '''');
       qryFind.Open;
       if (qryFind.IsEmpty) then
         begin
           //ShowMessage(idPayment);
           qryCari.SQL.Add('delete from trans_payment_detail where id_payment = ''' +
              idPayment + ''';');
           qryCari.SQL.Add('delete from trans_payment where id_payment = ''' +
              idPayment + ''';');
         end;
       qrySearch.Next;
    end;
  if (qryCari.SQL.Count <= 0) then Exit;
  qryCari.ExecSQL;
end;

procedure TfrmReportPosPayment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryCari.Free;
   qrySearch.Free;
   qryFind.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmReportPosPayment.FormCreate(Sender: TObject);
begin
    qryCari := TMyQuery.Create(Self);
    qryCari.Connection := dmDB.dbInternal;
    qryCari.SQL.Add('select * from temptable');
    qryCari.Active := true;

    qrySearch := TMyQuery.Create(Self);
    qrySearch.Connection := dmDB.dbInternal;
    qrySearch.SQL.Add('select * from temptable');
    qrySearch.Active := true;

    qryFind := TMyQuery.Create(Self);
    qryFind.Connection := dmDB.dbInternal;
    qryFind.SQL.Add('select * from temptable');
    qryFind.Active := true;

    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := dmDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

    deleteDouble;
    edStart.Date := Date;
    edEnd.Date := Date;
    qryPromo.Active := True;
    qryPayment.Active := True;
    qryList.Active := True;
    gtbDayli.DataController.Refresh;

end;

end.
