unit FReportPendapatanBulanan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMemo, MyAccess, strUtils, DateUtils,
  Vcl.StdCtrls, Vcl.Menus, cxButtons, System.Threading, XSuperJSON, XSuperObject,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxGridCustomTableView, cxGridTableView, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, cxGridExportLink, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  dxPSCore, dxPScxCommon, MainSource, WinInet, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdGlobal,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdText,
  IdAttachmentFile;

type
  TfrmReportPendapatanBulanan = class(TForm)
    lblJudulAtas: TLabel;
    cxButton1: TcxButton;
    edServerTime: TcxDateEdit;
    Label1: TLabel;
    lblTanggal: TLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    tvreport: TcxGridTableView;
    tvreportColumn1: TcxGridColumn;
    tvreportColumn2: TcxGridColumn;
    tvreportColumn3: TcxGridColumn;
    tvreportColumn4: TcxGridColumn;
    cxButton2: TcxButton;
    PrintGrid: TdxComponentPrinter;
    PrintGridLink1: TdxGridReportLink;
    memSend: TMemo;
    memNotes: TMemo;
    edYear: TcxComboBox;
    Label2: TLabel;
    edMonth: TcxComboBox;
    Label3: TLabel;
    Button1: TButton;
    lblTtest: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    qryCari, qryPayment, qrySearch, qryFind : TMyQuery;
    tglCari, tglAwal, tglAkhir : TDate;
    function CekInternet : Boolean;
    procedure CariPembayaran;
    procedure CariSummary;
    procedure CariDetails;
    procedure CreateCharts;
    procedure CreateBar;
  public
    { Public declarations }
  end;

var
  frmReportPendapatanBulanan: TfrmReportPendapatanBulanan;

implementation

{$R *.dfm}

uses FdmDB, FMain;

function GetAccessToken(ClientID, ClientSecret, RedirectURI: string): string;
begin
  // Implement OAuth2 flow to get access token using ClientID, ClientSecret, and RedirectURI
  // ...
end;

procedure TfrmReportPendapatanBulanan.Button1Click(Sender: TObject);
begin
  CreateCharts;
end;

procedure TfrmReportPendapatanBulanan.CariDetails;
var
  i , byReq, newRec, cntTR, cntHari : Integer;
  totProd, totBM, totRF, rasioTR, totTrans : Double;
  keterangan, strSql : String;
  jSonItem : XSuperObject.ISuperObject;
begin
   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, ' ');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, ' ');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, ' ');
   tvreport.DataController.SetValue(newRec, tvreportColumn4.Index, ' ');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, '|OTHERS|');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, '*');
   tvreport.DataController.SetValue(newRec, tvreportColumn4.Index, '*');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select trans_master.therapist_id, count(trans_master.therapist_id) ' +
       'as jumlah, (select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info ' +
       'where ben_hrd_karyawan_info.idkaryawan = trans_master.therapist_id AND ben_hrd_karyawan_info.active = ''' + 'Y' +
       ''') as departemen from trans_master where trans_master.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', tglAwal) +
       ''' AND trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) +
       ''' AND trans_master.therapist_id <> ''' + '' + ''' AND trans_master.therapist_id <> ''' + 'NONE' +
       ''' GROUP BY trans_master.therapist_id ORDER BY jumlah ASC');
   qryFind.Open;
   qryFind.First;
   for i := 0 to qryFind.RecordCount -1 do
     begin
       if (qryFind.Fields[2].AsString = 'TR') then
         begin
           totRF := totRF + qryFind.Fields[1].AsFloat;
         end
       else if (qryFind.Fields[2].AsString = 'TB') then
         begin
           totBM := totBM + qryFind.Fields[1].AsFloat;
         end;
       qryFind.Next;
     end;

   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '1.');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, 'Total RF Count');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', totRF));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '2.');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, 'Total BM Count ');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', totBm));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qryFind.First;
   keterangan := 'Fewest Handled guests [' + qryFind.Fields[0].AsString + ']';
   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '3');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, keterangan);
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', qryFind.Fields[1].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qryFind.Last;
   keterangan := 'Most Handled guests [' + qryFind.Fields[0].AsString + ']';
   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '4');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, keterangan);
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', qryFind.Fields[1].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   cntTR := qryFind.RecordCount;
   cntHari := DaysBetween(tglAwal, tglAkhir);

   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '5');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, 'On Duty Therapist');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', qryFind.RecordCount));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);


   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select count(trans_master.therapist_id) as jumlah ' +
       'from trans_master where trans_master.tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal) +
       ''' AND trans_master.promo = ''' + 'F' +
       ''' AND trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) +
       ''' AND trans_master.therapist_id <> ''' + '' + ''' AND trans_master.therapist_id <> ''' + 'NONE' + '''');

   qrySearch.Open;
   totTrans := qrySearch.Fields[0].AsFloat;
   rasioTR := totTrans / cntTR / cntHari;

   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '6');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, 'Therapist Ratio');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#.0', rasioTR));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select trans_reject.jenis_jasa, count(trans_reject.jenis_jasa) as jumlah ' +
        'from trans_reject where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', tglAwal) +
        ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) + ''' AND iscancel = ''' + 'N' +
        ''' GROUP BY trans_reject.jenis_jasa');
   qrySearch.Open;
   if (NOT qrySearch.IsEmpty) then
     begin
        if (qrySearch.RecordCount > 1) then
          begin
             qrySearch.First;
             keterangan := 'Rejected Guests ' + qrySearch.Fields[0].AsString;
             newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
             tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '7');
             tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, keterangan);
             tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', qrySearch.Fields[1].AsFloat));
             tvreport.DataController.PostEditingData;
             tvreport.DataController.Post(True);

             qrySearch.Last;
             keterangan := 'Rejected Guests ' + qrySearch.Fields[0].AsString;
             newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
             tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '8');
             tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, keterangan);
             tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', qrySearch.Fields[1].AsFloat));
             tvreport.DataController.PostEditingData;
             tvreport.DataController.Post(True);
          end
        else if (qrySearch.RecordCount = 1) then
          begin
             qrySearch.First;
             keterangan := 'Rejected Guests ' + qrySearch.Fields[0].AsString;
             newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
             tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '7');
             tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, keterangan);
             tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', qrySearch.Fields[1].AsFloat));
             tvreport.DataController.PostEditingData;
             tvreport.DataController.Post(True);
          end;
     end;

end;

procedure TfrmReportPendapatanBulanan.CariPembayaran;
var
  idPayment, keterangan : String;
  subtotal, totalSales, totalPromo, totalDisc, driversFee, netSales : Double;
  i, recSel: Integer;
begin
   idPayment := frmMain.APP_OUTLETID + '.PAY.' + FormatDateTime('yyMMdd', tglCari) + '%';
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, ' ');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, ' ');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, ' ');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'DETAIL PAYMENT');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '|PAYMENT BY CASH|');
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, '*');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(vcash), sum(rounding), sum(exchange) from trans_payment_detail ' +
       'where tanggal >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAwal)) +
       ' AND tanggal <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAkhir)) +
       ' AND vcash > 0 ');
   qryPayment.Open;
   //memoPayment.Lines.Add('Total Cash' + #9#9 + FormatFloat('#,#', qryPayment.Fields[0].AsFloat));
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'Cash Received');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[0].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   //memoPayment.Lines.Add('Tot. Rounding' + #9#9 + FormatFloat('#,#', qryPayment.Fields[1].AsFloat));
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'Rounding');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[1].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'Exchange');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[2].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   subtotal := qryPayment.Fields[0].AsFloat - qryPayment.Fields[2].AsFloat;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'TOTAL CASH');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', subtotal));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '|PAYMENT NON CASH|');
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, '*');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   //------------------------------------------------------------------------------
//   ShowMessage(FormatDateTime('yyyy-MM-dd', tglAwal) + ' - ' + FormatDateTime('yyyy-MM-dd', tglAkhir));
   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select kodepayment1, kodebank1, sum(vpayment1), ' +
              '(SELECT pos_master_payment.namapayment from pos_master_payment ' +
              'where pos_master_payment.kodepayment = trans_payment_detail.kodepayment1) ' +
              'as nama_payment from trans_payment_detail where tanggal >= ' +
              QuotedStr(FormatDateTime('yyyy-MM-dd', tglAwal)) +
              ' AND tanggal <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAkhir)) +
              ' AND vpayment1 > 0 GROUP BY kodepayment1, kodebank1');
   qryPayment.Open;
   qryPayment.First;
   for i := 0 to qryPayment.RecordCount -1 do
      begin
         keterangan := '#1# ' + qryPayment.Fields[3].AsString + ' ' + qryPayment.Fields[1].AsString;
         recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
         tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan);
         tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[2].AsFloat));
         tvreport.DataController.PostEditingData;
         tvreport.DataController.Post(True);
         qryPayment.Next;
         Application.ProcessMessages;
      end;

   //-----------------------------------------------------------------------------------------
   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select kodepayment2, kodebank2, sum(vpayment2), ' +
              '(SELECT pos_master_payment.namapayment from pos_master_payment ' +
              'where pos_master_payment.kodepayment = trans_payment_detail.kodepayment2) ' +
              'as nama_payment from trans_payment_detail where tanggal >= ' +
              QuotedStr(FormatDateTime('yyyy-MM-dd', tglAwal)) +
              ' AND tanggal <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAkhir)) +
              ' AND vpayment2 > 0 GROUP BY kodepayment2, kodebank2');
   qryPayment.Open;
   qryPayment.First;
   for i := 0 to qryPayment.RecordCount -1 do
      begin
         keterangan := '#2# ' + qryPayment.Fields[3].AsString + ' ' + qryPayment.Fields[1].AsString;
         recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
         tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan);
         tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[2].AsFloat));
         tvreport.DataController.PostEditingData;
         tvreport.DataController.Post(True);
         qryPayment.Next;
         Application.ProcessMessages;
      end;

   //-----------------------------------------------------------------------------------------
   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(vredeem) from trans_payment_detail ' +
         'where tanggal >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAwal)) +
         ' AND tanggal <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAkhir)) +
         ' AND vredeem > 0');
   qryPayment.Open;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'REDEEM VALUE');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[0].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(vgift) from trans_payment_detail ' +
         'where tanggal >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAwal)) +
         ' AND tanggal <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAkhir)) +
         ' AND vgift > 0');
   qryPayment.Open;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'GC VALUE');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[0].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select kodepromo, sum(vpromo), (select pos_master_promo.namapromo ' +
        'from pos_master_promo where pos_master_promo.kodepromo = trans_payment_detail.kodepromo) ' +
        'as namapromo from trans_payment_detail where tanggal >= ' +
        QuotedStr(FormatDateTime('yyyy-MM-dd', tglAwal)) +
        ' AND tanggal <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAkhir)) +
        ' AND vpromo > 0 GROUP BY kodepromo');
   qryPayment.Open;
   qryPayment.First;
   for i := 0 to qryPayment.RecordCount - 1 do
     begin
         keterangan := 'PROMO ' + qryPayment.Fields[2].AsString;
         recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
         tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan);
         tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[1].AsFloat));
         tvreport.DataController.PostEditingData;
         tvreport.DataController.Post(True);
         qryPayment.Next;
         Application.ProcessMessages;
     end;

   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(vdisc) from trans_payment_detail where tanggal >= ' +
        QuotedStr(FormatDateTime('yyyy-MM-dd', tglAwal)) +
        ' AND tanggal <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAkhir)));
   qryPayment.Open;
   qryPayment.First;
   for i := 0 to qryPayment.RecordCount - 1 do
     begin
         keterangan := 'DISC ';
         recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
         tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan);
         tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[0].AsFloat));
         tvreport.DataController.PostEditingData;
         tvreport.DataController.Post(True);
         qryPayment.Next;
         Application.ProcessMessages;
     end;

   // Get Total Sales
   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(subtotal) from trans_detail ' +
         'where tanggal >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAwal)) +
         ' AND tanggal <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAkhir)));
   qryPayment.Open;
   if not qryPayment.Fields[0].IsNull then totalSales := qryPayment.Fields[0].AsFloat else totalSales := 0;

   // Get Total Promos & Discounts
   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(vpromo), sum(vdisc) from trans_payment_detail ' +
         'where tanggal >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAwal)) +
         ' AND tanggal <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAkhir)));
   qryPayment.Open;
   if not qryPayment.Fields[0].IsNull then totalPromo := qryPayment.Fields[0].AsFloat else totalPromo := 0;
   if not qryPayment.Fields[1].IsNull then totalDisc := qryPayment.Fields[1].AsFloat else totalDisc := 0;

   // Get Driver's Fee
   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(total_fee) from ben_drivers_trans_master ' +
         'where tanggal >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAwal)) +
         ' AND tanggal <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglAkhir)));
   qryPayment.Open;

   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'DRIVERS FEE');
   if (not qryPayment.IsEmpty) and (not qryPayment.Fields[0].IsNull) and (qryPayment.Fields[0].AsFloat > 0) then
   begin
     driversFee := qryPayment.Fields[0].AsFloat;
     tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', driversFee));
   end
   else
   begin
     driversFee := 0;
     tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, '');
   end;
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   // Calculate Net Sales
   netSales := totalSales - totalPromo - totalDisc - driversFee;

   // Blank Spacer Row
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, ' ');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, ' ');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   // Insert NET SALES Row
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '|NET SALES|');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', netSales));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
end;

procedure TfrmReportPendapatanBulanan.CariSummary;
var
  qrySum1, qrySum2, qrySum3 : TMyQuery;
  subtotal,  byReq, totBM, totRF, totTrans, rasioTR, totBave, totNonBave,
  rpBM, rpRF, qtyRoomRF, qtyRoomBM, qtyRF, qtyBM, ratioRP_RF, ratioRP_BM, ratioRoom_RF, ratioRoom_BM: Double;
  i, cntTR, cntHari, totFm, totML : Integer;
  tglStart, tglEnd : TDate;
  keterangan, typeJasa, strReq, isBaverage : String;
  jSonItem : XSuperObject.ISuperObject;
begin
    memSend.Clear;
    totFm := 0;
    totML := 0;
    qrySum1 := TMyQuery.Create(Self);
    qrySum1.Connection := dmDB.dbInternal;
    qrySum1.SQL.Add('select * from temptable');
    qrySum1.Active := true;

    qrySum2 := TMyQuery.Create(Self);
    qrySum2.Connection := dmDB.dbInternal;
    qrySum2.SQL.Add('select * from temptable');
    qrySum2.Active := true;

    qrySum3 := TMyQuery.Create(Self);
    qrySum3.Connection := dmDB.dbInternal;
    qrySum3.SQL.Add('select * from temptable');
    qrySum3.Active := true;


    memSend.Lines.Add('<!DOCTYPE html>');
    memSend.Lines.Add('<html>' + #13 + ' <head>');
    memSend.Lines.Add('<meta name="viewport" content="width=device-width, initial-scale=1">');
    memSend.Lines.Add('<title> Summary Report ' + frmMain.APP_OUTLETNAME + '</title>');
    memSend.Lines.Add('</head>' + #13 + '<body style="font-family: Arial, sans-serif; background-color: #f4f7f6; padding: 2px; margin: 0;">');
    memSend.Lines.Add('<div style="width: 100%; max-width: 100%; margin: 0 auto; background-color: #ffffff; padding: 5px; border-radius: 8px; box-sizing: border-box;">');
    memSend.Lines.Add('  <div style="text-align: center; margin-bottom: 10px; border-bottom: 2px solid #3498db; padding-bottom: 10px;">');
    memSend.Lines.Add('    <img src="https://drive.google.com/uc?export=view&id=1XqSBvnRkiLJ7VyuQJMxsT7BTf9cZRdK3" alt="ZEN" width="50" height="50" />');
    memSend.Lines.Add('    <h2 style="color: #2c3e50; margin: 10px 0 5px 0; font-size: 16px;">Summary Report Periodic ' + frmMain.APP_OUTLETNAME + '</h2>');
    memSend.Lines.Add('    <h4 style="color: #7f8c8d; margin: 0; font-size: 13px;">Date ' + FormatDateTime('dd/MMM/yyyy', tglAwal) + ' To ' + FormatDateTime('dd/MMM/yyyy', tglAkhir) + '</h4>');
    memSend.Lines.Add('  </div>');
    memSend.Lines.Add('    <table width="100%" border="1" cellpadding="4" cellspacing="0" style="border-collapse: collapse; width: 100%; max-width: 100%; font-size: 12px; border-color: #dddddd; word-wrap: break-word;">');
    memSend.Lines.Add('      <tbody>');
    memSend.Lines.Add('        <tr style="background-color: #e8f4f8; font-weight: bold;"><td colspan="3"><b>Report Details</b></td></tr>');

    qrySum1.Close;
    qrySum1.SQL.Clear;
    qrySum1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) +
       ''' AND trans_type_id = ''' + 'BJ' + '''');
    qrySum1.Open;

    memSend.Lines.Add('<tr><td>1.</td><td>Total Jasa </td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum1.Fields[0].AsFloat) + '</td></tr>');

    qrySum1.Close;
    qrySum1.SQL.Clear;
    qrySum1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) +
       ''' AND trans_type_id = ''' + 'BA' + '''');
    qrySum1.Open;
    memSend.Lines.Add('<tr><td>2.</td><td>Total Additional </td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum1.Fields[0].AsFloat) + '</td></tr>');

    qrySum3.Close;
    qrySum3.SQL.Clear;
    qrySum3.SQL.Add('select trans_detail.trans_type_id, trans_detail.produk_jasa_id, ' +
       'trans_detail.subtotal, (select main_menu.jenis_jasa_id from main_menu ' +
       'where main_menu.menu_id = trans_detail.produk_jasa_id) as type_jasa ' +
       'from trans_detail where trans_detail.tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal) + ''' AND trans_detail.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) + '''');
    qrySum3.Open;
    qrySum3.First;
    rpBM := 0;
    rpRF := 0;
    for i := 0 to qrySum3.RecordCount -1  do
      begin
        if (qrySum3.Fields[3].AsString = 'RF') then rpRF := rpRF + qrySum3.Fields[2].AsFloat
        else if (qrySum3.Fields[3].AsString = 'BM') then rpBM := rpBM + qrySum3.Fields[2].AsFloat;
        qrySum3.Next;
      end;
    memSend.Lines.Add('<tr><td></td><td>Total RF </td><td align="right" text-align= "right">' + FormatFloat('#,#', rpRF) + '</td></tr>');
    memSend.Lines.Add('<tr><td></td><td>Total BM </td><td align="right" text-align= "right">' + FormatFloat('#,#', rpBM) + '</td></tr>');
//    memNotes.Lines.Add('Rupiah RF = ' + FormatFloat('#,#', rpRF));
//    memNotes.Lines.Add('Rupiah BM = ' + FormatFloat('#,#', rpBM));
    memSend.Lines.Add('<tr><td>3.</td><td> Product </td><td align="right" text-align= "right">' + '' + '</td></tr>');
    qrySum2.Close;
    qrySum2.SQL.Clear;
    qrySum2.SQL.Add('select trans_detail.produk_jasa_id ,sum(trans_detail.subtotal) ' +
        'FROM trans_detail where trans_detail.tanggal >= ''' +
        FormatDateTime('yyyy-MM-dd', tglAwal) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) +
        ''' AND trans_detail.trans_type_id = ''' + 'BP' + ''' GROUP BY trans_detail.produk_jasa_id');
    qrySum2.Open;
    qrySum2.First;
    totBave := 0;
    totNonBave := 0;
    for i := 0 to qrySum2.RecordCount -1 do
      begin
          qrySum3.Close;
          qrySum3.SQL.Clear;
          qrySum3.SQL.Add('select notes from main_menu where menu_id = ''' + qrySum2.Fields[0].AsString + '''');
          qrySum3.Open;
          jSonItem := XSuperobject.SO(qrySum3.Fields[0].AsString);
          if (jSonItem.Contains('isbaverage')) then
              begin
                isbaverage := jSonItem.S['isbaverage'];
              end
          else if (NOT jSonItem.Contains('isbaverage')) then
              begin
                isbaverage := 'N';
              end;
          if (isbaverage = 'Y') then
            begin
              totBave := totBave + qrySum2.Fields[1].AsFloat;
            end
          else if (isbaverage = 'N') then
            begin
               totNonBave := totNonBave + qrySum2.Fields[1].AsFloat;
            end;
          qrySum2.Next;
      end;
    memSend.Lines.Add('<tr><td> </td><td>Baverage </td><td align="right" text-align= "right">' + FormatFloat('#,#', totBave) + '</td></tr>');
    memSend.Lines.Add('<tr><td> </td><td>Non Baverage </td><td align="right" text-align= "right">' + FormatFloat('#,#', totNonBave) + '</td></tr>');
    qrySum1.Close;
    qrySum1.SQL.Clear;
    qrySum1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) +
       ''' AND trans_type_id = ''' + 'BP' + '''');
    qrySum1.Open;
    memSend.Lines.Add('<tr><td></td><td>Total Product </td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum1.Fields[0].AsFloat) + '</td></tr>');

    qrySum1.Close;
    qrySum1.SQL.Clear;
    qrySum1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) +
       ''' AND trans_type_id = ''' + 'BG' + '''');
    qrySum1.Open;
    memSend.Lines.Add('<tr><td>4.</td><td>Total GC </td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum1.Fields[0].AsFloat) + '</td></tr>');

    qrySum1.Close;
    qrySum1.SQL.Clear;
    qrySum1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) + '''');
    qrySum1.Open;
    memSend.Lines.Add('<tr><td colspan="2"><strong>Total</strong></td><td align="right" text-align= "right"><strong>' + FormatFloat('#,#', qrySum1.Fields[0].AsFloat) + '</strong></td></tr>');

   qrySum1.Close;
   qrySum1.SQL.Clear;
   qrySum1.SQL.Add('select trans_master.therapist_id, count(trans_master.therapist_id) ' +
       'as jumlah, (select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info ' +
       'where ben_hrd_karyawan_info.idkaryawan = trans_master.therapist_id AND ben_hrd_karyawan_info.active = ''' + 'Y' +
       ''') as departemen from trans_master where trans_master.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', tglAwal) +
       ''' AND trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) +
       ''' AND trans_master.therapist_id <> ''' + '' + ''' AND trans_master.therapist_id <> ''' + 'NONE' +
       ''' AND trans_master.promo = ''' + 'F' +
       ''' GROUP BY trans_master.therapist_id ORDER BY jumlah ASC');
   qrySum1.Open;
   totRF := 0;
   totBM := 0;
   qtyRF := 0;
   qtyBM := 0;
   qrySum1.First;
   for i := 0 to qrySum1.RecordCount -1 do
     begin
       if (qrySum1.Fields[2].AsString = 'TR') then
         begin
           totRF := totRF + qrySum1.Fields[1].AsFloat;
           qtyRF := qtyRF + 1;
         end
       else if (qrySum1.Fields[2].AsString = 'TB') then
         begin
           totBM := totBM + qrySum1.Fields[1].AsFloat;
           qtyBM := qtyBM + 1;
         end;
       qrySum1.Next;
     end;
   qrySum3.Close;
  qrySum3.SQL.Clear;
  qrySum3.SQL.Add('select trans_master.room_id, ' +
                 '(select ruangan.jenis_jasa from ruangan where ruangan.ruangan_id = trans_master.room_id) as type_jasa ' +
                 'from trans_master where trans_master.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', tglAwal) +
                 ''' AND trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) +
                 ''' GROUP BY trans_master.room_id ORDER BY type_jasa ASC');

  qrySum3.Open;
  qrySum3.First;
  qtyRoomRF := 0;
  qtyRoomBM := 0;
  for i := 0 to qrySum3.RecordCount - 1 do
     begin
       if (qrySum3.Fields[1].AsString = 'RF') then qtyRoomRF := qtyRoomRF + 1
       else if (qrySum3.Fields[1].AsString = 'BM') then qtyRoomBM := qtyRoomBM + 1;
       qrySum3.Next;
     end;

//   memNotes.Lines.Add('Jumlah Available Room RF = ' + FormatFloat('#,#', qtyRoomRF));
//   memNotes.Lines.Add('Jumlah Available RooM BM = ' + FormatFloat('#,#', qtyRoomBM));

   cntTR := qrySum1.RecordCount;
   cntHari := DaysBetween(tglAwal, tglAkhir);
   memSend.Lines.Add('<tr><td colspan="3">Therapist & Menu Report</td></tr>');
   memSend.Lines.Add('<tr><td>1.</td><td>Total RF </td><td align="right" text-align= "right">' + FormatFloat('#,#', totRF) + '</td></tr>');
   memSend.Lines.Add('<tr><td>2.</td><td>Total BM </td><td align="right" text-align= "right">' + FormatFloat('#,#', totBM) + '</td></tr>');

//   memNotes.Lines.Add('Jumlah Available TR RF = ' + FormatFloat('#,#', qtyRF));
//   memNotes.Lines.Add('Jumlah Available TR BM = ' + FormatFloat('#,#', qtyBM));

   qrySum2.Close;
   qrySum2.SQL.Clear;
   qrySum2.SQL.Add('select count(trans_master.therapist_id) as jumlah ' +
       'from trans_master where trans_master.tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal) +
       ''' AND trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) +
       ''' AND trans_master.therapist_id <> ''' + '' + '''');

   qrySum2.Open;
   totTrans := qrySum2.Fields[0].AsFloat;
   rasioTR := totTrans / cntTR / cntHari;
   if ((qtyRoomRF > 0) OR (rpRF > 0) OR (qtyRF > 0)) then
       begin
            ratioRoom_RF := rpRF / qtyRoomRF;
            ratioRP_RF := rpRF / qtyRF;
       end
   else if ((qtyRoomRF <= 0) OR (rpRF <= 0) OR (qtyRF <= 0)) then
       begin
            ratioRoom_RF := 0;
            ratioRP_RF := 0;
       end;


   ratioRoom_BM := rpBM / qtyRoomBM;

   ratioRP_BM := rpRF / qtyBM;

   {memNotes.Lines.Add('Produktifitas Rp : Room RF ' + FormatFloat('#,#.0', ratioRoom_RF));
   memNotes.Lines.Add('Produktifitas Rp : Room BM ' + FormatFloat('#,#.0', ratioRoom_BM));

   memNotes.Lines.Add('Produktifitas Rp : TR RF ' + FormatFloat('#,#.0', ratioRP_RF));
   memNotes.Lines.Add('Produktifitas Rp : TR BM ' + FormatFloat('#,#.0', ratioRP_BM));}



   memSend.Lines.Add('<tr><td>3.</td><td>Therapist Ratio </td><td align="right" text-align= "right">' + FormatFloat('#,#.0', rasioTR) + '</td></tr>');
   memSend.Lines.Add('<tr><td>-</td><td>Produktifitas Rp : Room RF </td><td align="right" text-align= "right">' + FormatFloat('#,#.0', ratioRoom_RF) + '</td></tr>');
   memSend.Lines.Add('<tr><td>-</td><td>Produktifitas Rp : Room BM </td><td align="right" text-align= "right">' + FormatFloat('#,#.0', ratioRoom_BM) + '</td></tr>');

   memSend.Lines.Add('<tr><td>-</td><td>Produktifitas Rp : TR RF </td><td align="right" text-align= "right">' + FormatFloat('#,#.0', ratioRP_RF) + '</td></tr>');
   memSend.Lines.Add('<tr><td>-</td><td>Produktifitas Rp : TR BM </td><td align="right" text-align= "right">' + FormatFloat('#,#.0', ratioRP_BM) + '</td></tr>');

  qrySum1.First;
  keterangan := 'Fewest Handled guests [' + qrySum1.Fields[0].AsString + ']';
  memSend.Lines.Add('<tr><td>4.</td><td> ' + keterangan + ' </td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');

  qrySum1.Last;
  keterangan := 'Most Handled guests [' + qrySum1.Fields[0].AsString + ']';
  memSend.Lines.Add('<tr><td>5.</td><td> ' + keterangan + ' </td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');

   qrySum2.Close;
   qrySum2.SQL.Clear;
   qrySum2.SQL.Add('select trans_detail.produk_jasa_nama, sum(subtotal) as ' +
       'grantotal, count(trans_detail.produk_jasa_nama) as jumlah, ' +
       'trans_detail.produk_jasa_id from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal)  + ''' and trans_detail.tanggal <= ''' +
       FormatDateTime('yyyy-MM-dd', tglAkhir)  +
       ''' AND trans_detail.taked = ''' + 'F'  + ''' AND trans_type_id = ''' + 'BJ' +
       ''' Group By trans_detail.produk_jasa_id ORDER BY jumlah ASC');
   qrySum2.Open;
   qrySum2.Last;
   keterangan := 'Best Seller Jasa [ ' + TitleCase(qrySum2.Fields[0].AsString) + ' | Qty : ' + FormatFloat('#,#', qrySum2.Fields[2].AsFloat) + ' ]';
   memSend.Lines.Add('<tr><td>6.</td><td> ' + keterangan + ' </td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum2.Fields[1].AsFloat) + '</td></tr>');

   qrySum2.First;
   keterangan := 'Fewest Seller Jasa [ ' + TitleCase(qrySum2.Fields[0].AsString) + ' | Qty : ' + FormatFloat('#,#', qrySum2.Fields[2].AsFloat)+ ' ]';
   memSend.Lines.Add('<tr><td>7.</td><td> ' + keterangan + ' </td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum2.Fields[1].AsFloat) + '</td></tr>');
   memSend.Lines.Add('<tr><td>8.</td><td>Guest Count By Gender </td><td align="right" text-align= "right"></td></tr>');
   qrySum1.Close;
   qrySum1.SQL.Clear;
   qrySum1.SQL.Add('select trans_master.gender,count(trans_master.gender) as grandtotal ' +
       'from trans_master where trans_master.tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal)  + ''' and trans_master.tanggal <= ''' +
       FormatDateTime('yyyy-MM-dd', tglAkhir)  +
       ''' AND trans_master.promo = ''' + 'F' +
       ''' AND trans_master.therapist_id <> ''' + '' +
       ''' AND trans_master.therapist_id <> ''' + 'NONE' +
       ''' group by trans_master.gender ORDER BY tanggal ASC');
   qrySum1.Open;
   qrySum1.First;
   for i := 0 to qrySum1.RecordCount -1 do
     begin
       if (qrySum1.Fields[0].AsString = 'F') then keterangan := 'Female'
       else if (qrySum1.Fields[0].AsString = 'M') then keterangan := 'Male';
       memSend.Lines.Add('<tr><td></td><td> ' + keterangan + ' </td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');
       qrySum1.Next;
     end;
   memSend.Lines.Add('<tr><td>9.</td><td>Rejected Guest</td><td align="right"></td></tr>');
   qrySum1.Close;
   qrySum1.SQL.Clear;
   qrySum1.SQL.Add('select trans_reject.jenis_jasa, count(trans_reject.jenis_jasa) as jumlah ' +
        'from trans_reject where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', tglAwal) +
        ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) + ''' AND iscancel = ''' + 'N' +
        ''' GROUP BY trans_reject.jenis_jasa');
   qrySum1.Open;
   if (NOT qrySum1.IsEmpty) then
     begin
        if (qrySum1.RecordCount > 1) then
          begin
             qrySum1.First;
             keterangan := 'Guests ' + qrySum1.Fields[0].AsString;
             memSend.Lines.Add('<tr><td></td><td>'+ keterangan +'</td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');
             qrySum1.Last;
             keterangan := 'Guests ' + qrySum1.Fields[0].AsString;
             memSend.Lines.Add('<tr><td></td><td>'+ keterangan +'</td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');
          end
        else if (qrySum1.RecordCount <= 1) then
          begin
             qrySum1.First;
             keterangan := 'Guests ' + qrySum1.Fields[0].AsString;
             memSend.Lines.Add('<tr><td></td><td>'+ keterangan +'</td><td align="right" text-align= "right">' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');
          end;
     end
   else if (NOT qrySum1.IsEmpty) then
     begin
       memSend.Lines.Add('<tr><td></td><td>'+ 'Null' +'</td><td></td></tr>');
     end;

   // Table and body left open so grid rows can be appended in cxButton1Click
   qrySum1.Free;
   qrySum2.Free;
   qrySum3.Free;
end;

procedure TfrmReportPendapatanBulanan.cxButton1Click(Sender: TObject);
var
  i, noUrut, recSel, intTahun, intBulan : Integer;
  keterangan1, keterangan2 : String;
  GrandPenjualan, totBm, totRF, totGC, totProd, qtyRoomRF, qtyRoomBM : Double;
  inOthersSection: Boolean;
begin
  intTahun := StrToInt(edYear.Text);
  intBulan := StrToInt(edMonth.Text);
  totBm := 0;
  totRF := 0;
  totProd := 0;
  totGC := 0;
  tglAwal := EncodeDate(intTahun, intBulan, 1);
  lblTtest.Caption := FormatDateTime('yyyy-MM-dd', tglAwal);
  tglAkhir := EndOfTheMonth(tglAwal);
  lblTtest.Caption := 'Load ' + FormatDateTime('dd MMMM yyyy', tglAwal) + ' to ' + FormatDateTime('dd MMMM yyyy', tglAkhir);
  Application.ProcessMessages;

   CariSummary;

   GrandPenjualan := 0;
   tvreport.DataController.SelectAll;
   tvreport.DataController.DeleteSelection;
   //JASA
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama), produk_jasa_id ' +
                    'from trans_detail where tanggal >= ''' +
                    FormatDateTime('yyyy-MM-dd', tglAwal)  + ''' and tanggal <= ''' +
                    FormatDateTime('yyyy-MM-dd', tglAkhir) +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BJ' + ''' group by produk_jasa_id, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '|PENJUALAN JASA|');
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, '*');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   for i := 0 to qryCari.RecordCount - 1 do
      begin
          noUrut := noUrut + 1;
          if (qryCari.Fields[1].AsString = 'Y') then
              begin
                   keterangan1 :='HH ' + qryCari.Fields[0].AsString;
              end
          else if (qryCari.Fields[1].AsString = 'N') then
              begin
                   keterangan1 := qryCari.Fields[0].AsString;
              end;

           recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
           tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, FormatFloat('#,#', noUrut) + '.');
           tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan1);
           tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, FormatFloat('#,#', qryCari.Fields[3].AsFloat));
           tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryCari.Fields[2].AsFloat));
           tvreport.DataController.PostEditingData;
           tvreport.DataController.Post(True);
           qrySearch.Close;
           qrySearch.SQL.Clear;
           qrySearch.SQL.Add('select jenis_jasa_id from main_menu where menu_id = ''' + qryCari.Fields[4].AsString + '''');
           qrySearch.Open;
           if (qrySearch.Fields[0].AsString = 'BM') then
             begin
                totBm := totBm + qryCari.Fields[3].AsFloat;
             end
           else if (qrySearch.Fields[0].AsString = 'RF') then
             begin
                totRF := totRF + qryCari.Fields[3].AsFloat;
             end;
           qryCari.Next;

           Application.ProcessMessages;
           //GrandPenjualan := GrandPenjualan + qryCari.Fields[2].AsFloat;
      end;

   //ADDITIONAL

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama), produk_jasa_id ' +
                    'from trans_detail where tanggal >= ''' +
                    FormatDateTime('yyyy-MM-dd', tglAwal)  +  ''' AND tanggal <= ''' +
                    FormatDateTime('yyyy-MM-dd', tglAkhir) +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BA' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '|PENJUALAN ADDITIONAL|');
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, '*');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   for i := 0 to qryCari.RecordCount - 1 do
      begin
          noUrut := noUrut + 1;
          if (qryCari.Fields[1].AsString = 'Y') then
              begin
                   keterangan1 :='HH ' + qryCari.Fields[0].AsString;
              end
          else if (qryCari.Fields[1].AsString = 'N') then
              begin
                   keterangan1 := qryCari.Fields[0].AsString;
              end;
           recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
           tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, FormatFloat('#,#', noUrut) + '.');
           tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan1);
           tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, FormatFloat('#,#', qryCari.Fields[3].AsFloat));
           tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryCari.Fields[2].AsFloat));
           tvreport.DataController.PostEditingData;
           tvreport.DataController.Post(True);
           qrySearch.Close;
           qrySearch.SQL.Clear;
           qrySearch.SQL.Add('select jenis_jasa_id from main_menu where menu_id = ''' + qryCari.Fields[4].AsString + '''');
           qrySearch.Open;
           if (qrySearch.Fields[0].AsString = 'BM') then
             begin
                totBm := totBm + qryCari.Fields[3].AsFloat;
             end
           else if (qrySearch.Fields[0].AsString = 'RF') then
             begin
                totRF := totRF + qryCari.Fields[3].AsFloat;
             end;

           qryCari.Next;
           Application.ProcessMessages;
           //GrandPenjualan := GrandPenjualan + qryCari.Fields[2].AsFloat;
      end;

   //PRODUK

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama) ' +
                    'from trans_detail where tanggal >= ''' +
                    FormatDateTime('yyyy-MM-dd', tglAwal)  + ''' and tanggal <= ''' +
                    FormatDateTime('yyyy-MM-dd', tglAkhir) +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BP' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '|PENJUALAN PRODUK|');
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, '*');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   for i := 0 to qryCari.RecordCount - 1 do
      begin
          noUrut := noUrut + 1;
          if (qryCari.Fields[1].AsString = 'Y') then
              begin
                   keterangan1 :='HH ' + qryCari.Fields[0].AsString;
              end
          else if (qryCari.Fields[1].AsString = 'N') then
              begin
                   keterangan1 := qryCari.Fields[0].AsString;
              end;
           recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
           tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, FormatFloat('#,#', noUrut) + '.');
           tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan1);
           tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, FormatFloat('#,#', qryCari.Fields[3].AsFloat));
           tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryCari.Fields[2].AsFloat));
           tvreport.DataController.PostEditingData;
           tvreport.DataController.Post(True);
           totProd := totProd + qryCari.Fields[3].AsFloat;
           qryCari.Next;
           Application.ProcessMessages;
           GrandPenjualan := GrandPenjualan + qryCari.Fields[2].AsFloat;
      end;
   //GC


   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama) ' +
                    'from trans_detail where tanggal >= ''' +
                    FormatDateTime('yyyy-MM-dd', tglAwal)  + ''' and tanggal <= ''' +
                    FormatDateTime('yyyy-MM-dd', tglAkhir) +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BG' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '|PENJUALAN GC|');
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, '*');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   for i := 0 to qryCari.RecordCount - 1 do
      begin
          noUrut := noUrut + 1;
          if (qryCari.Fields[1].AsString = 'Y') then
              begin
                   keterangan1 :='HH ' + qryCari.Fields[0].AsString;
              end
          else if (qryCari.Fields[1].AsString = 'N') then
              begin
                   keterangan1 := qryCari.Fields[0].AsString;
              end;
           recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
           tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, FormatFloat('#,#', noUrut) + '.');
           tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan1);
           tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, FormatFloat('#,#', qryCari.Fields[3].AsFloat));
           tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryCari.Fields[2].AsFloat));
           tvreport.DataController.PostEditingData;
           tvreport.DataController.Post(True);
           qryCari.Next;
           Application.ProcessMessages;
           GrandPenjualan := GrandPenjualan + qryCari.Fields[2].AsFloat;
      end;

   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '--------------------------------------------------------------------------------------------');

   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);


   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '|GROSS SALES|');
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglAkhir) + '''');
   qryCari.Open;
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryCari.Fields[0].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   //CariPembayaran;

   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select trans_detail.produk_jasa_nama, sum(subtotal) as ' +
       'grantotal, count(trans_detail.produk_jasa_nama) as jumlah, ' +
       'trans_detail.produk_jasa_id from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal)  + ''' and trans_detail.tanggal <= ''' +
       FormatDateTime('yyyy-MM-dd', tglAkhir)  +
       ''' AND trans_detail.taked = ''' + 'F'  + ''' AND trans_type_id = ''' + 'BJ' +
       ''' Group By trans_detail.produk_jasa_id ORDER BY jumlah ASC');
   qryFind.Open;

   qryFind.Last;
   keterangan1 := 'Best Seller Jasa [ ' + qryFind.Fields[0].AsString + ' ]';
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, 'a)');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan1);
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, FormatFloat('#,#', qryFind.Fields[2].AsFloat));
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryFind.Fields[1].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qryFind.First;
   keterangan1 := 'Fewest Seller Jasa [ ' + qryFind.Fields[0].AsString + ' ]';
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, 'b)');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan1);
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, FormatFloat('#,#', qryFind.Fields[2].AsFloat));
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryFind.Fields[1].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   //---------------
   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select trans_detail.produk_jasa_nama, sum(subtotal) as ' +
       'grantotal, count(trans_detail.produk_jasa_nama) as jumlah, ' +
       'trans_detail.produk_jasa_id from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglAwal)  + ''' and trans_detail.tanggal <= ''' +
       FormatDateTime('yyyy-MM-dd', tglAkhir)  +
       ''' AND trans_detail.taked = ''' + 'F'  + ''' AND trans_type_id = ''' + 'BA' +
       ''' Group By trans_detail.produk_jasa_id ORDER BY jumlah ASC');
   qryFind.Open;

   qryFind.Last;
   keterangan1 := 'Best Seller Additional [ ' + qryFind.Fields[0].AsString + ' ]';
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, 'a)');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan1);
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, FormatFloat('#,#', qryFind.Fields[2].AsFloat));
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryFind.Fields[1].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qryFind.First;
   keterangan1 := 'Fewest Seller Additional [ ' + qryFind.Fields[0].AsString + ' ]';
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, 'b)');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan1);
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, FormatFloat('#,#', qryFind.Fields[2].AsFloat));
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryFind.Fields[1].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   CariDetails;
   CariPembayaran;

   memSend.Lines.Add('        <tr style="background-color: #e8f4f8; font-weight: bold;">');
   memSend.Lines.Add('          <td colspan="3" style="text-align: center; border-top: 2px solid #3498db; padding-top: 20px;"><b>Detail Laporan Penjualan (Grid Report)</b></td>');
   memSend.Lines.Add('        </tr>');

   inOthersSection := False;

   for i := 0 to tvreport.DataController.RecordCount - 1 do
   begin
     keterangan1 := VarToStr(tvreport.DataController.Values[i, tvreportColumn2.Index]);
     
     if Pos('|OTHERS|', keterangan1) > 0 then inOthersSection := True;
     if Pos('|PAYMENT BY CASH|', keterangan1) > 0 then inOthersSection := False;

     if not inOthersSection then
     begin
       if (Pos('|PENJUALAN', keterangan1) > 0) or (Pos('|PAYMENT', keterangan1) > 0) or (Pos('GROSS SALES', keterangan1) > 0) or (Pos('NET SALES', keterangan1) > 0) or (Pos('DETAIL PAYMENT', keterangan1) > 0) then
       begin
         memSend.Lines.Add('        <tr style="background-color: #fbfbfb; font-weight: bold;">');
       end
       else
       begin
         memSend.Lines.Add('        <tr>');
       end;
       
       memSend.Lines.Add('          <td>' + VarToStr(tvreport.DataController.Values[i, tvreportColumn1.Index]) + '</td>');
       memSend.Lines.Add('          <td>' + keterangan1 + '</td>');
       memSend.Lines.Add('          <td style="text-align: right;">' + VarToStr(tvreport.DataController.Values[i, tvreportColumn4.Index]) + '</td>');
       memSend.Lines.Add('        </tr>');
     end;
   end;
   
   memSend.Lines.Add('      </tbody>');
   memSend.Lines.Add('    </table>');
   memSend.Lines.Add('</div>'); // close report container

   // Render Sales By Month graphic at the very bottom
   memSend.Lines.Add('  <br>');
   memSend.Lines.Add('  <div style="width: 100%; max-width: 100%; margin: 0 auto; background-color: #ffffff; padding: 15px; border-radius: 8px; box-sizing: border-box; text-align: left;">');
   memSend.Lines.Add('    <h3 style="color: #2c3e50; font-size: 14px; margin-bottom: 15px; border-bottom: 1px solid #eee; padding-bottom: 5px;">Sales By Month Current Year</h3>');
   CreateBar;
   memSend.Lines.Add('  </div>');
   
   memSend.Lines.Add('</body></html>');

   ShowMessage('Closing Done' + #13 + 'Please Check Your Data !!');
end;

procedure TfrmReportPendapatanBulanan.cxButton2Click(Sender: TObject);
var
   ConfigDir, namaFile, subject, MailAcc, MailPass, emailAddress,
   NamaCnt, txtCodeGenerator : String;
   i : Integer;
   isOkMail : Boolean;
   lTextPart : TIdText;
   Attachmentfile: TIdAttachmentFile;
   lsBody : TStringList;
begin
   //AccessToken := GetAccessToken('<removed-client-id>', '<removed-client-secret>', 'https://developers.google.com/oauthplayground');

   ConfigDir := ExtractFilePath(Application.ExeName);
   namaFile := ConfigDir + 'report\' + FormatDateTime('yyyyMMdd', tglAwal) + FormatDateTime('dd', tglAkhir) + '.pdf';
   PrintGrid.ExportToPDF(namaFile, False, nil);

   if (CekInternet = False) then
       begin
         ShowMessage('No Internet Active, Send Mail Failed !');
         Exit;
       end;
  subject := 'Summary Report ' + frmMain.APP_OUTLETNAME + ' ' + FormatDateTime('dd/MMM/yyyy', tglAwal) + ' - ' + FormatDateTime('dd/MMM/yyyy', tglAkhir);

  qryCari.Close;
  qryCari.SQL.Clear;
  qryCari.SQL.Add('select passkey from ben_master_password where moduleinfo = ''' +
      'MAIN_MAIL_PASSWORD' + '''');
  qryCari.Open;
  MailPass := DecryptPass(qryCari.Fields[0].AsString);
  qryPayment.Close;
  qryPayment.SQL.Clear;
  qryPayment.SQL.Add('select passkey from ben_master_password where moduleinfo = ''' +
      'MAIN_MAIL' + '''');
  qryPayment.Open;
  MailAcc := qryPayment.Fields[0].AsString;

  {
  IO HANDLER SETTINGS GOOGLE
  With frmMain.IdSSLIOHandlerSocketOpenSSL1 do
      begin
        //Destination := 'smtp.gmail.com:587';
        //https://mail.zenfamilyspa.com:2080
        Host := 'smtp.gmail.com';
        MaxLineAction := maException;
        Port := 587;
        SSLOptions.Method := sslvTLSv1;
        SSLOptions.Mode := sslmUnassigned;
        SSLOptions.VerifyMode := [];
        SSLOptions.VerifyDepth := 0;
      end;
      }
  //IO SETTING ZENFAMILYSPA.COM
//  With frmMain.IdSSLIOHandlerSocketOpenSSL1 do
//      begin
//        {Destination := 'srv149.niagahoster.com:2096';
//        Host := 'srv149.niagahoster.com:2096';
//        MaxLineAction := maException;
//        Port := 587;
////        SSLOptions.Method := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
////        SSLOptions.ver
//        SSLOptions.Mode := sslmUnassigned;
//        SSLOptions.VerifyMode := [];
//        SSLOptions.VerifyDepth := 0;}
////        new
//        Destination := 'srv149.niagahoster.com:2096';
//        Host := 'srv149.niagahoster.com:2096';
//        MaxLineAction := maException;
//        Port := 587;
////        SSLOptions.Method := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
//        //SSLOptions.Method := ssl
//        SSLOptions.Mode := sslmBoth;
//        SSLOptions.VerifyMode := [];
//        SSLOptions.VerifyDepth := 0;
//      end;
  //
  //SETTING SMTP COMPONENT mail.zenfamilyspa.com //

  {frmMain.IdSMTP1.Host := 'mail.zenfamilyspa.com';
  frmMain.IdSMTP1.Port := 587;
  frmMain.IdSMTP1.Username := MailAcc; // please change to your gmail address //
  frmMain.IdSMTP1.Password := MailPass;
  frmMain.IdSMTP1.IOHandler := frmMain.IdSSLIOHandlerSocketOpenSSL1;
  frmMain.IdSMTP1.AuthType := satDefault;
  frmMain.IdSMTP1.UseTLS := utUseRequireTLS;}



  //END-SETTING SMTP COMPONENT mail.zenfamilyspa.com //


   //SETTING SMTP COMPONENT google mail //

  frmMain.IdSMTP1.Host := 'smtp.gmail.com';
  frmMain.IdSMTP1.Port := 587;
  frmMain.IdSMTP1.Username := 'support@zenfamilyspa.id'; // please change to your gmail address //
  frmMain.IdSMTP1.Password := 'tdbzlxfdfmepfbeb';
  frmMain.IdSMTP1.IOHandler := frmMain.IdSSLIOHandlerSocketOpenSSL1;
  frmMain.IdSMTP1.AuthType := satDefault;
  frmMain.IdSMTP1.UseTLS := utUseExplicitTLS;
  With frmMain.IdSSLIOHandlerSocketOpenSSL1 do
      begin

        MaxLineAction := maException;
        Port := 587;
        SSLOptions.Method := sslvTLSv1_2;;
        SSLOptions.Mode := sslmClient;
        SSLOptions.VerifyMode := [];
        SSLOptions.VerifyDepth := 0;
      end;


  //END-SETTING SMTP COMPONENT google mail //

  {

//  SETTING SMTP COMPONENT DATA //
//
//  frmMain.IdSMTP1.Host := 'smtp.gmail.com';
//  frmMain.IdSMTP1.Port := 587;
//  frmMain.IdSMTP1.Username := MailAcc; // please change to your gmail address //
//  frmMain.IdSMTP1.Password := MailPass;
//  frmMain.IdSMTP1.IOHandler := frmMain.IdSSLIOHandlerSocketOpenSSL1;
//  frmMain.IdSMTP1.AuthType := satDefault;
//  frmMain.IdSMTP1.UseTLS := utUseExplicitTLS;
//  }



  // SETTING email MESSAGE DATA //
  frmMain.IdMessage1.Clear;
  qryCari.Close;
  qryCari.SQL.Clear;
  qryCari.SQL.Add('select nama_kontak, mail_kontak from ben_mail_report where aktif = ''' + 'Y' + '''');
  qryCari.Open;
  qryCari.First;
  for i := 0 to qryCari.RecordCount -1 do
    begin
        NamaCnt := qryCari.Fields[0].AsString;
        emailAddress := qryCari.Fields[1].AsString;
        //memNotes.Lines.Add('Mail To "' + NamaCnt + '" <' + emailAddress + '>');
        isOkMail := ValidateEmail(emailAddress);
        if (isOkMail = True) then
          begin
            with frmMain.IdMessage1.Recipients.Add do
                begin
                  Name := NamaCnt;
                  Address := emailAddress;
                end;
          end;
        qryCari.Next;
    end;
  lsBody := TStringList.Create;
  for i := 0 to memNotes.Lines.Count-1 do
    begin
      lsBody.Add(memNotes.Lines[i]);
      //ShowMessage(memNotes.Lines[i]);
    end;

  {lTextPart := TIdText.Create(frmMain.IdMessage1.MessageParts);
  lTextPart.Body.Text := '<html><body><img src="https://drive.google.com/uc?export=view&id=1XqSBvnRkiLJ7VyuQJMxsT7BTf9cZRdK3" alt="ZEN" width="64" height="64" /></body></html>';
  lTextPart.ContentType := 'text/html'; }



  lTextPart := TIdText.Create(frmMain.IdMessage1.MessageParts);
  lTextPart.Body.Text := memSend.Text;
  lTextPart.ContentType := 'text/html';

  lTextPart := TIdText.Create(frmMain.IdMessage1.MessageParts);
  lTextPart.Body.Text := lsBody.Text;
  lTextPart.ContentType := 'text/plain';


  txtCodeGenerator := '<html><body><hr>' +
                      '<small>This email and any files transmitted with it are confidential and intended solely for the use of the ' +
                      'individual or entity to whom they are addressed. If you have received this email in error ' +
                      'please notify the author and delete this email from your system. This message contains ' +
                      'confidential information and is intended only for the individual named. ' +
                      'If you are not the named addressee you should not disseminate, ' +
                      'distribute or copy this e-mail. Unauthorized use of this message and its contents  ' +
                      'in any manner or form is strictly prohibited and may be unlawful. Zen Family Spa And Reflexology ' +
                      'and the author give no warranty as to the accuracy or completeness of this message ' +
                      'and its contents. Any opinion expressed in this message and its contents may be personal to the author and ' +
                      'not reflect the opinion of Zen Family Spa And Reflexology. ' +
                      'Any confidentiality or privilege is not waived or lost because this message ' +
                      'and its contents have been sent to you by mistake. </small>' +
                      '</body></html>';
  lTextPart := TIdText.Create(frmMain.IdMessage1.MessageParts);
  lTextPart.Body.Text := txtCodeGenerator;
  lTextPart.ContentType := 'text/html';


  //lsBody.Add(memNotes.Text);
  Attachmentfile := TIdAttachmentFile.Create(frmMain.IdMessage1.MessageParts,namaFile);
  frmMain.IdMessage1.From.Address :=  MailAcc;
  frmMain.IdMessage1.Subject := subject;
  frmMain.IdMessage1.Body := lsBody;
  frmMain.IdMessage1.Priority := mpHigh;

  TRY
      frmMain.IdSMTP1.Connect();
      frmMain.IdSMTP1.Send(frmMain.IdMessage1);
      frmMain.IdSMTP1.Disconnect();
      ShowMessage('Send Mail Success !');
    except on e:Exception do
      begin
        memNotes.Lines.Add('Exception class name = '+E.ClassName);
        memNotes.Lines.Add('Exception message = '+E.Message);
        frmMain.IdSMTP1.Disconnect();
        AttachmentFile.Free;
        lsBody.Free;
        ShowMessage('No Internet Active, Send Mail Failed !');
        Exit;
      end;
  end;
  AttachmentFile.Free;
  lsBody.Free;
  //--
end;

function TfrmReportPendapatanBulanan.CekInternet: Boolean;
begin
    result := (InternetGetConnectedState(nil, 0));
end;

procedure TfrmReportPendapatanBulanan.CreateBar;
var
  intBulan, intTahun, intHari, intBulanBar : Word;
  tglBarAwal, tglBarAkhir : TDate;
  i, barWidth: Integer;
  qryBar1 : TMyQuery;
  nMaxSales, nCurrentSales: Double;
begin
  qryBar1 := TMyQuery.Create(Self);
  qryBar1.Connection := dmDB.dbInternal;

  DecodeDate(tglAwal, intTahun, intBulan, intHari);
  
  // First pass: find maximum sales to calculate percentages relative to the highest month
  nMaxSales := 0;
  intBulanBar := 1;
  for i := 0 to intBulan - 1 do
  begin
    tglBarAwal :=  EncodeDate(intTahun, intBulanBar, 1);
    tglBarAkhir := EndOfTheMonth(tglBarAwal);
    qryBar1.Close;
    qryBar1.SQL.Clear;
    qryBar1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
        FormatDateTime('yyyy-MM-dd', tglBarAwal) + ''' and tanggal <= ''' +
        FormatDateTime('yyyy-MM-dd', tglBarAkhir) + ''' and payment_id <> ''' +
        '(NONE)' + '''');
    qryBar1.Open;
    if qryBar1.Fields[0].AsFloat > nMaxSales then
       nMaxSales := qryBar1.Fields[0].AsFloat;
    intBulanBar := intBulanBar + 1;
  end;
  
  if nMaxSales = 0 then nMaxSales := 1; // prevent division by zero

  // Second pass: Generate HTML
  intBulanBar := 1;
  for i := 0 to intBulan -1 do
    begin
      tglBarAwal :=  EncodeDate(intTahun, intBulanBar, 1);
      tglBarAkhir := EndOfTheMonth(tglBarAwal);
      qryBar1.Close;
      qryBar1.SQL.Clear;
      qryBar1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
          FormatDateTime('yyyy-MM-dd', tglBarAwal) + ''' and tanggal <= ''' +
          FormatDateTime('yyyy-MM-dd', tglBarAkhir) + ''' and payment_id <> ''' +
          '(NONE)' + '''');
      qryBar1.Open;
      
      nCurrentSales := qryBar1.Fields[0].AsFloat;
      barWidth := Round((nCurrentSales / nMaxSales) * 100);
      if barWidth < 5 then barWidth := 5; // ensure it's at least visible
      
      memSend.Lines.Add('<div style="margin-bottom: 10px;">');
      memSend.Lines.Add('  <div style="font-size: 12px; color: #555; margin-bottom: 3px;">' + FormatDateTime('MMMM yyyy', tglBarAwal) + '</div>');
      memSend.Lines.Add('  <div style="width: 100%; background-color: #f1f1f1; border-radius: 4px; overflow: hidden;">');
      memSend.Lines.Add('    <div style="width: ' + IntToStr(barWidth) + '%; background-color: #3498db; color: white; padding: 4px 8px; text-align: right; font-size: 11px; font-weight: bold; box-sizing: border-box; border-radius: 4px; white-space: nowrap;">' + FormatFloat('#,#', nCurrentSales) + '</div>');
      memSend.Lines.Add('  </div>');
      memSend.Lines.Add('</div>');
      
      intBulanBar := intBulanBar + 1;
    end;
    
  qryBar1.Free;
end;

procedure TfrmReportPendapatanBulanan.CreateCharts;
var
  intTahun, intBulan, intMinggu : Integer;
  i: Integer;
  tglEOM, tglStart, tglEnd : TDate;
  qryBuild1, qryBuild2 : TMyQuery;
  notes1, notes2 : String;
  totOmzet : Double;
begin
  memSend.Lines.Add('<div id="piechart"></div>');
  memSend.Lines.Add('<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>');
  memSend.Lines.Add('<script type="text/javascript">');
  memSend.Lines.Add('google.charts.load(' + QuotedStr('current') + ', {' + QuotedStr('packages') + ':[' + QuotedStr('corechart') + ']});');
  memSend.Lines.Add('google.charts.setOnLoadCallback(drawChart);');
  memSend.Lines.Add('function drawChart() {');
  memSend.Lines.Add('var data = google.visualization.arrayToDataTable([');
  memSend.Lines.Add('[' + QuotedStr('Days') + ',' + QuotedStr('Values') + '],');
  qryBuild1 := TMyQuery.Create(Self);
  qryBuild1.Connection := dmDB.dbInternal;
  qryBuild1.SQL.Add('select * from temptable');
  qryBuild1.Active := true;

  qryBuild2 := TMyQuery.Create(Self);
  qryBuild2.Connection := dmDB.dbInternal;
  qryBuild2.SQL.Add('select * from temptable');
  qryBuild2.Active := true;

  intTahun := StrToInt(edYear.Text);
  intBulan := StrToInt(edMonth.Text);

  tglStart := EncodeDate(intTahun, intBulan, 1);
  lblTtest.Caption := FormatDateTime('yyyy-MM-dd', tglStart);
  tglEnd := EndOfTheMonth(tglStart);
  intMinggu := WeeksBetween(tglStart, tglEnd);

  tglEOM := EndOfTheMonth(tglStart);
  for i := 0 to intMinggu -1 do
    begin
      if (i = intMinggu -1) then
        begin
          tglEnd := tglEOM;
          //memSend.Lines.Add('Tanggal Awal = ' + FormatDateTime('yyyy-MM-dd', tglAwal));
          //memSend.Lines.Add('Tanggal Akhir = ' + FormatDateTime('yyyy-MM-dd', tglAkhir));

          qryBuild1.Close;
          qryBuild1.SQL.Clear;
          qryBuild1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
             FormatDateTime('yyyy-MM-dd', tglStart) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglEnd) + '''');
          qryBuild1.Open;
          totOmzet := qryBuild1.Fields[0].AsFloat / 1000;
          notes1 := FormatDateTime('dd', tglStart) + '-' + FormatDateTime('dd', tglEnd) +
                '/' + FormatDateTime('MM/dd', tglEnd) + ' ' + FormatFloat('#,#', totOmzet);
          //['Task', 'Hours per Day'],
          //['Work 8000000', 8000000],
          memSend.Lines.Add('[' + QuotedStr(notes1) + ', ' + FloatToStr(totOmzet) + ']');
        end
      else if (i < intMinggu -1) then
        begin
          tglEnd := IncDay(tglStart, 6);
          if (tglEnd > tglEOM) then tglEnd := tglEOM;
          qryBuild1.Close;
          qryBuild1.SQL.Clear;
          qryBuild1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
             FormatDateTime('yyyy-MM-dd', tglStart) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglEnd) + '''');
          qryBuild1.Open;
          totOmzet := qryBuild1.Fields[0].AsFloat / 1000;
          notes1 := FormatDateTime('dd', tglStart) + '-' + FormatDateTime('dd', tglEnd) + '/' + FormatDateTime('MM/dd', tglEnd) + ' ' + FormatFloat('#,#', totOmzet);
          //['Task', 'Hours per Day'],
          //['Work 8000000', 8000000],
          memSend.Lines.Add('[' + QuotedStr(notes1) + ', ' + FloatToStr(totOmzet) + '],');
        end;
        tglStart := IncDay(tglEnd, 1);
    end;
    memSend.Lines.Add(']);');
    memSend.Lines.Add('var options = {' + QuotedStr('title') + ':' +
         QuotedStr('Revenue By Week on ' + FormatDateTime('MMMM', tglEOM)) +
         ' ,' + QuotedStr('width') + ':550,' + QuotedStr('height') + ':400};');
    memSend.Lines.Add('var chart = new google.visualization.PieChart(document.getElementById(' + QuotedStr('piechart') + '));');
    memSend.Lines.Add('chart.draw(data, options);');
    memSend.Lines.Add('}');
    memSend.Lines.Add('</script>');
    qryBuild1.Free;
    qryBuild2.Free;
end;

procedure TfrmReportPendapatanBulanan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryCari.Free;
   qryPayment.Free;
   qrySearch.Free;
   qryFind.Free;
   Action := caFree;
end;

procedure TfrmReportPendapatanBulanan.FormCreate(Sender: TObject);
var
   HariIni : TDateTime;
   tahun, bulan, tanggal : Word;
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

    qryPayment := TMyQuery.Create(Self);
    qryPayment.Connection := dmDB.dbInternal;
    qryPayment.SQL.Add('select * from temptable');
    qryPayment.Active := true;

    qryCari.Close;
    qryCari.SQL.Clear;
    qryCari.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
    qryCari.Open;
    edServerTime.Date := qryCari.Fields[0].AsDateTime;
    HariIni := StartOfTheDay(qryCari.Fields[0].AsDateTime);
    DecodeDate(edServerTime.Date, tahun, bulan, tanggal);
    edYear.Text := IntToStr(tahun);
    edMonth.Text := IntToStr(bulan);
end;

end.
