unit FBALIReportPendapatanHarian;

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
  IdAttachmentFile, Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,
  REST.Authenticator.OAuth;

type
  TfrmBALIReportPendapatanHarian = class(TForm)
    lblJudulAtas: TLabel;
    btnClosing: TcxButton;
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
    btnTest1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnClosingClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTest1Click(Sender: TObject);
  private
    { Private declarations }
    qryCari, qryPayment, qrySearch, qryFind : TMyQuery;
    tglCari : TDate;
    function CekInternet : Boolean;
    procedure CariPembayaran;
    procedure CariSummary;
    procedure CariDetails;
    procedure DeleteDouble;
  public
    { Public declarations }
  end;

var
  frmBALIReportPendapatanHarian: TfrmBALIReportPendapatanHarian;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmBALIReportPendapatanHarian.btnTest1Click(Sender: TObject);
var
  i, noUrut, recSel: Integer;
  keterangan1, keterangan2, val1, val2, val3, val4 : String;
  GrandPenjualan : Double;
begin
     tglCari := edServerTime.Date;
//   memLogs.Lines.Add('Step 1 Pass !');
   DeleteDouble;
//   memLogs.Lines.Add('Step 2 Pass !');
   CariSummary;
//   memLogs.Lines.Add('Step 3 Pass !');
   GrandPenjualan := 0;
   tvreport.DataController.SelectAll;
   tvreport.DataController.DeleteSelection;
   //JASA
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama) ' +
                    'from trans_detail where tanggal = ''' +
                    FormatDateTime('yyyy-MM-dd', tglCari)  +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BJ' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'PENJUALAN JASA');
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

   //ADDITIONAL
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama) ' +
                    'from trans_detail where tanggal = ''' +
                    FormatDateTime('yyyy-MM-dd', tglCari)  +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BA' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'PENJUALAN ADDITIONAL');
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

   //PRODUK
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama) ' +
                    'from trans_detail where tanggal = ''' +
                    FormatDateTime('yyyy-MM-dd', tglCari)  +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BP' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'PENJUALAN PRODUK');
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
   //GC
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama) ' +
                    'from trans_detail where tanggal = ''' +
                    FormatDateTime('yyyy-MM-dd', tglCari)  +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BG' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'PENJUALAN GC');
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
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'GROSS SALES');

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select sum(subtotal) from trans_detail where tanggal = ''' +
       FormatDateTime('yyyy-MM-dd', tglCari) + '''');
   qryCari.Open;
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryCari.Fields[0].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   CariPembayaran;
//   CariDetails;

   // Inject Grid to HTML body by stripping footers and appending rows to the existing table
   while memSend.Lines.Count > 0 do
   begin
     if (Pos('</body>', memSend.Lines[memSend.Lines.Count-1]) > 0) or
        (Pos('</html>', memSend.Lines[memSend.Lines.Count-1]) > 0) or
        (Pos('</table>', memSend.Lines[memSend.Lines.Count-1]) > 0) or
        (Pos('</tbody>', memSend.Lines[memSend.Lines.Count-1]) > 0) or
        (Pos('</div>', memSend.Lines[memSend.Lines.Count-1]) > 0) then
     begin
       memSend.Lines.Delete(memSend.Lines.Count - 1);
     end
     else
       Break;
   end;

   memSend.Lines.Add('        <tr style="background-color: #e8f4f8; font-weight: bold;">');
   memSend.Lines.Add('          <td colspan="3" style="text-align: center; border-top: 2px solid #3498db; padding-top: 20px;"><b>Detail Laporan Penjualan (Grid Report)</b></td>');
   memSend.Lines.Add('        </tr>');

   for i := 0 to tvreport.DataController.RecordCount - 1 do
   begin
     val1 := VarToStr(tvreport.DataController.Values[i, tvreportColumn1.Index]);
     val2 := VarToStr(tvreport.DataController.Values[i, tvreportColumn2.Index]);
     val3 := VarToStr(tvreport.DataController.Values[i, tvreportColumn3.Index]);
     val4 := VarToStr(tvreport.DataController.Values[i, tvreportColumn4.Index]);
     
     if (Pos('|PENJUALAN', val2) > 0) or (Pos('|PAYMENT', val2) > 0) or (Pos('|OTHERS|', val2) > 0) or (Pos('GROSS SALES', val2) > 0) or (Pos('NET SALES', val2) > 0) or (Pos('DETAIL PAYMENT', val2) > 0) then
     begin
       memSend.Lines.Add('        <tr style="background-color: #fbfbfb; font-weight: bold;">');
     end
     else
     begin
       memSend.Lines.Add('        <tr>');
     end;
     
     memSend.Lines.Add('          <td>' + val1 + '</td>');
     memSend.Lines.Add('          <td>' + val2 + '</td>');
     memSend.Lines.Add('          <td style="text-align: right;">' + val4 + '</td>');
     memSend.Lines.Add('        </tr>');
   end;
   
   memSend.Lines.Add('      </tbody>');
   memSend.Lines.Add('    </table>');
   memSend.Lines.Add('</div>'); // close report container
   memSend.Lines.Add('</body></html>');

   ShowMessage('Closing Done' + #13 + 'Please Check Your Data !!');
end;

procedure TfrmBALIReportPendapatanHarian.CariDetails;
var
  i, newRec : Integer;
  strReq, typeJasa, keterangan : String;
  jSonItem : XSuperObject.ISuperObject;
  cntTR, rasioTR, totTrans, totBM, totRF, byReq,
  availTR, rpRF, rpBM : Double;
begin
   rpRF := 0;
   rpBM := 0;
   availTR := 0;
   cntTR := 0;
   rasioTR := 0;
   totTrans := 0;
   totBM := 0;
   totRF := 0;
   byReq := 0;
   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, ' ');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, ' ');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, ' ');
   tvreport.DataController.SetValue(newRec, tvreportColumn4.Index, ' ');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, 'OTHERS');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, '*');
   tvreport.DataController.SetValue(newRec, tvreportColumn4.Index, '*');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   {
   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select trans_master.therapist_id, count(trans_master.therapist_id) ' +
       'as jumlah, (select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info ' +
       'where ben_hrd_karyawan_info.idkaryawan = trans_master.therapist_id AND ben_hrd_karyawan_info.active = ''' + 'Y' +
       ''') as departemen from trans_master where trans_master.tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
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

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select trans_detail.trans_type_id, trans_detail.produk_jasa_id, ' +
       'trans_detail.subtotal, (select main_menu.jenis_jasa_id from main_menu ' +
       'where main_menu.menu_id = trans_detail.produk_jasa_id) as type_jasa ' +
       'from trans_detail where trans_detail.tanggal = ''' +
       FormatDateTime('yyyy-MM-dd', tglCari) + '''');
   qryCari.Open;
   qryCari.First;
   for i := 0 to qryCari.RecordCount -1  do
     begin
        if (qryCari.Fields[3].AsString = 'RF') then rpRF := rpRF + qryCari.Fields[2].AsFloat
        else if (qryCari.Fields[3].AsString = 'BM') then rpBM := rpBM + qryCari.Fields[2].AsFloat;
        qryCari.Next;
     end;
   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '1.');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, 'Total RF Count');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', totRF));
   tvreport.DataController.SetValue(newRec, tvreportColumn4.Index, FormatFloat('#,#', rpRF));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   tvreport.DataController.PostEditingData;


   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '2.');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, 'Total BM Count ');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', totBm));
   tvreport.DataController.SetValue(newRec, tvreportColumn4.Index, FormatFloat('#,#', rpBM));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   cntTR := qryFind.RecordCount;

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select count(available_tr.id_therapist) as jumlah ' +
       'from available_tr where (available_tr.departemen = ''' + 'TR' + ''' OR available_tr.departemen = ''' +
       'TB' + ''') AND available_tr.tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglCari) + '''');
   qryCari.Open;
   availTR := qryCari.Fields[0].AsFloat;



   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '3.');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, 'On Duty Therapist');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('#,#', availTR));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   if availTR > 0 then
     rasioTR := cntTR / availTR
   else
     rasioTR := 0;

   //rasioTR := (totBM + totBM) / cntTR;

   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '4.');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, 'Therapist Ratio');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, FormatFloat('0.0', rasioTR));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select notes, trans_id from trans_master where tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
           ''' AND promo = ''' + 'F' + '''');
   qryCari.Open;
   qryCari.First;
   for i := 0 to qryCari.RecordCount -1 do
    begin
      jSonItem := XSuperobject.SO(qryCari.Fields[0].AsString);
      strReq := jSonItem.S['byrequest'];
      if (strReq = 'Y') then byReq := byReq + 1;
      qryCari.Next;
    end;

   newRec := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(newRec, tvreportColumn1.Index, '5.');
   tvreport.DataController.SetValue(newRec, tvreportColumn2.Index, 'By Request');
   tvreport.DataController.SetValue(newRec, tvreportColumn3.Index, byReq);
   //tvreport.DataController.SetValue(newRec, tvreportColumn4.Index, FormatFloat('#,#', qryCari.Fields[2].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select trans_reject.jenis_jasa, count(trans_reject.jenis_jasa) as jumlah ' +
        'from trans_reject where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
        ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) + ''' AND iscancel = ''' + 'N' +
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
     end;}
end;

procedure TfrmBALIReportPendapatanHarian.CariPembayaran;
var
  idPayment, keterangan : String;
  subtotal, kembalian, totCash, CashKeras, totalSales, totalPromo, totalDisc, driversFee, netSales : Double;
  i, recSel: Integer;
begin
   kembalian := 0;
   totCash := 0;
   CashKeras := 0;
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
   {
   source payment cash
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '****');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '|PAYMENT BY CASH|');
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, '****');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, '****');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);}

   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(vcash), sum(rounding), sum(exchange) from trans_payment_detail ' +
       'where tanggal = ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)) + ' AND vcash > 0 ');
   qryPayment.Open;
   //memoPayment.Lines.Add('Total Cash' + #9#9 + FormatFloat('#,#', qryPayment.Fields[0].AsFloat));
   {recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'Cash Received');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[0].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   //memoPayment.Lines.Add('Tot. Rounding' + #9#9 + FormatFloat('#,#', qryPayment.Fields[1].AsFloat));
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'Rounding');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[1].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);}
   //memoPayment.Lines.Add('Tot. Exchange' + #9#9 + FormatFloat('#,#', qryPayment.Fields[2].AsFloat));
   {recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'Exchange');
   kembalian := qryPayment.Fields[2].AsFloat;
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[2].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);}
   subtotal := qryPayment.Fields[0].AsFloat - qryPayment.Fields[2].AsFloat;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'CASH');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', subtotal));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   {recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '****');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, '|PAYMENT NON CASH|');
   tvreport.DataController.SetValue(recSel, tvreportColumn3.Index, '****');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, '****');
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);}
   //payment1
   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select kodepayment1, kodebank1, sum(vpayment1), ' +
              '(SELECT pos_master_payment.namapayment from pos_master_payment ' +
              'where pos_master_payment.kodepayment = trans_payment_detail.kodepayment1) ' +
              'as nama_payment from trans_payment_detail where tanggal= ' +
              QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)) + ' AND vpayment1 > 0 GROUP BY kodepayment1, kodebank1');
   qryPayment.Open;
   qryPayment.First;
   for i := 0 to qryPayment.RecordCount -1 do
      begin
         keterangan := '#1#'+ qryPayment.Fields[3].AsString + ' ' + qryPayment.Fields[1].AsString;
         recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
         tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan);
         tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[2].AsFloat));
         tvreport.DataController.PostEditingData;
         tvreport.DataController.Post(True);
         qryPayment.Next;
         Application.ProcessMessages;
      end;
   //payment2
   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select kodepayment2, kodebank2, sum(vpayment2), ' +
              '(SELECT pos_master_payment.namapayment from pos_master_payment ' +
              'where pos_master_payment.kodepayment = trans_payment_detail.kodepayment2) ' +
              'as nama_payment from trans_payment_detail where tanggal= ' +
              QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)) + ' AND vpayment2 > 0 GROUP BY kodepayment2, kodebank2');
   qryPayment.Open;
   qryPayment.First;
   for i := 0 to qryPayment.RecordCount -1 do
      begin
         keterangan := '#2#'+ qryPayment.Fields[3].AsString + ' ' + qryPayment.Fields[1].AsString;
         recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
         tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, keterangan);
         tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[2].AsFloat));
         tvreport.DataController.PostEditingData;
         tvreport.DataController.Post(True);
         qryPayment.Next;
         Application.ProcessMessages;
      end;

   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(vredeem) from trans_payment_detail ' +
         'where tanggal = ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)) + ' AND vredeem > 0');
   qryPayment.Open;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'REDEEM VALUE');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[0].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(vgift) from trans_payment_detail ' +
         'where tanggal = ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)) + ' AND vgift > 0');
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
        'as namapromo from trans_payment_detail where tanggal = ' +
        QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)) + ' AND vpromo > 0 GROUP BY kodepromo');
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
   qryPayment.SQL.Add('select sum(vdisc) from trans_payment_detail ' +
         'where tanggal = ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)) + ' AND vdisc > 0');
   qryPayment.Open;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'DISC VALUE');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryPayment.Fields[0].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);

   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(total_fee) from ben_drivers_trans_master ' +
         'where tanggal = ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)));
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

   // Get Total Sales
   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(subtotal) from trans_detail ' +
         'where tanggal = ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)));
   qryPayment.Open;
   if not qryPayment.Fields[0].IsNull then totalSales := qryPayment.Fields[0].AsFloat else totalSales := 0;

   // Get Total Promos & Discounts
   qryPayment.Close;
   qryPayment.SQL.Clear;
   qryPayment.SQL.Add('select sum(vpromo), sum(vdisc) from trans_payment_detail ' +
         'where tanggal = ' + QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)));
   qryPayment.Open;
   if not qryPayment.Fields[0].IsNull then totalPromo := qryPayment.Fields[0].AsFloat else totalPromo := 0;
   if not qryPayment.Fields[1].IsNull then totalDisc := qryPayment.Fields[1].AsFloat else totalDisc := 0;

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
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'NET SALES');
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', netSales));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
end;

procedure TfrmBALIReportPendapatanHarian.CariSummary;
var
  qrySum1, qrySum2, qrySum3,qrySum4 : TMyQuery;
  subtotal, totFm, totML, totBave, totNonBave, totRF,
  totBM, totTrans, rasioTR, rasioTB, avaiTR, rpBM, rpRF, roomRFRatio, roomBMRatio : Double;
  i, byReq, cntTR, cntHari, onDutiTR, onDutiTB, cntRF, cntBM, cntRoomRF, cntRoomBM : Integer;
  tglStart, tglEnd : TDate;
  keterangan, typeJasa, strReq, isbaverage : String;
  jSonItem : XSuperObject.ISuperObject;
begin
    tglCari := edServerTime.Date;
//    memLogs.Lines.Add('Step 2A Start !');
//    memLogs.Lines.Add('Tanggal Server = ' + FormatDateTime('yyyy-MM-dd', tglCari));
    memSend.Clear;
    totFm := 0;
    totML := 0;
    rasioTR := 0;
    rasioTB := 0;
    cntRoomRF := 0;
    cntRoomBM := 0;
    roomRFRatio:= 0;
    roomBMRatio := 0;
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

    qrySum4 := TMyQuery.Create(Self);
    qrySum4.Connection := dmDB.dbInternal;
    qrySum4.SQL.Add('select * from temptable');
    qrySum4.Active := true;


    memSend.Lines.Add('<!DOCTYPE html>');
    memSend.Lines.Add('<html>' + #13 + ' <head>');
    memSend.Lines.Add('<meta name="viewport" content="width=device-width, initial-scale=1">');
    memSend.Lines.Add('<title> Summary Report ' + frmMain.APP_OUTLETNAME + '</title>');
    memSend.Lines.Add('</head>' + #13 + '<body style="font-family: Arial, sans-serif; background-color: #f4f7f6; padding: 2px; margin: 0;">');
    memSend.Lines.Add('<div style="width: 100%; max-width: 100%; margin: 0 auto; background-color: #ffffff; padding: 5px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); box-sizing: border-box;">');
    memSend.Lines.Add('  <div style="text-align: center; margin-bottom: 10px; border-bottom: 2px solid #3498db; padding-bottom: 10px;">');
    memSend.Lines.Add('    <img src="https://drive.google.com/uc?export=view&id=1XqSBvnRkiLJ7VyuQJMxsT7BTf9cZRdK3" alt="ZEN" width="50" height="50" />');
    memSend.Lines.Add('    <h2 style="color: #2c3e50; margin: 10px 0 5px 0; font-size: 16px;">Summary Report ' + frmMain.APP_OUTLETNAME + '</h2>');
    memSend.Lines.Add('    <h4 style="color: #7f8c8d; margin: 0; font-size: 13px;">Date ' + FormatDateTime('dd/MMM/yyyy', tglCari) + '</h4>');
    memSend.Lines.Add('  </div>');
    memSend.Lines.Add('    <table width="100%" border="1" cellpadding="4" cellspacing="0" style="border-collapse: collapse; width: 100%; max-width: 100%; font-size: 12px; border-color: #dddddd; word-wrap: break-word;">');
    memSend.Lines.Add('      <tbody>');
    memSend.Lines.Add('        <tr style="background-color: #e8f4f8; font-weight: bold;"><td colspan="3"><b>Report Details</b></td></tr>');

    qrySum1.Close;
    qrySum1.SQL.Clear;
    qrySum1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
       ''' AND trans_type_id = ''' + 'BJ' + '''');
    qrySum1.Open;

    memSend.Lines.Add('<tr><td>1.</td><td>Total Jasa </td><td align="right">' + FormatFloat('#,#', qrySum1.Fields[0].AsFloat) + '</td></tr>');

    qrySum1.Close;
    qrySum1.SQL.Clear;
    qrySum1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
       ''' AND trans_type_id = ''' + 'BA' + '''');
    qrySum1.Open;
    memSend.Lines.Add('<tr><td>2.</td><td>Total Additional </td><td align="right">' + FormatFloat('#,#', qrySum1.Fields[0].AsFloat) + '</td></tr>');


    memSend.Lines.Add('<tr><td>3.</td><td> Product </td><td align="right">' + '' + '</td></tr>');
    qrySum2.Close;
    qrySum2.SQL.Clear;
    qrySum2.SQL.Add('select trans_detail.produk_jasa_id ,sum(trans_detail.subtotal) ' +
        'FROM trans_detail where trans_detail.tanggal >= ''' +
        FormatDateTime('yyyy-MM-dd', tglCari) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
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
    memSend.Lines.Add('<tr><td> </td><td>Beverage </td><td align="right">' + FormatFloat('#,#', totBave) + '</td></tr>');
    memSend.Lines.Add('<tr><td> </td><td>Non Beverage </td><td align="right">' + FormatFloat('#,#', totNonBave) + '</td></tr>');
    qrySum1.Close;
    qrySum1.SQL.Clear;
    qrySum1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
       ''' AND trans_type_id = ''' + 'BP' + '''');
    qrySum1.Open;
    memSend.Lines.Add('<tr><td colspan="2" align="right"><b>Total Product</b></td><td align="right"><b>' + FormatFloat('#,#', qrySum1.Fields[0].AsFloat) + '</b></td></tr>');

    qrySum1.Close;
    qrySum1.SQL.Clear;
    qrySum1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
       ''' AND trans_type_id = ''' + 'BG' + '''');
    qrySum1.Open;
    memSend.Lines.Add('<tr><td>4.</td><td>Total GC </td><td align="right">' + FormatFloat('#,#', qrySum1.Fields[0].AsFloat) + '</td></tr>');

//--> Total Rupiah by Type Jasa
    qrySum3.Close;
    qrySum3.SQL.Clear;
    qrySum3.SQL.Add('select trans_detail.trans_type_id, trans_detail.produk_jasa_id, ' +
       'trans_detail.subtotal, (select main_menu.jenis_jasa_id from main_menu ' +
       'where main_menu.menu_id = trans_detail.produk_jasa_id) as type_jasa ' +
       'from trans_detail where trans_detail.tanggal = ''' +
       FormatDateTime('yyyy-MM-dd', tglCari) + '''');
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

    memSend.Lines.Add('<tr><td>5.</td><td> Total by Type Jasa </td><td align="right">' + '' + '</td></tr>');
    memSend.Lines.Add('<tr><td> </td><td>RF </td><td align="right">' + FormatFloat('#,#', rpRF) + '</td></tr>');
    memSend.Lines.Add('<tr><td> </td><td>BM </td><td align="right">' + FormatFloat('#,#', rpBM) + '</td></tr>');

    qrySum1.Close;
    qrySum1.SQL.Clear;
    qrySum1.SQL.Add('select sum(subtotal) from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) + '''');
    qrySum1.Open;
    memSend.Lines.Add('<tr><td colspan="2"><b>Grand Total</b></td><td align="right"><b>' + FormatFloat('#,#', qrySum1.Fields[0].AsFloat) + '</b></td></tr>');
// END --> Total Rupiah by Type Jasa

   {qrySum1.Close;
   qrySum1.SQL.Clear;
   qrySum1.SQL.Add('select trans_master.therapist_id, count(trans_master.therapist_id) ' +
       'as jumlah, (select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info ' +
       'where ben_hrd_karyawan_info.idkaryawan = trans_master.therapist_id AND ben_hrd_karyawan_info.active = ''' + 'Y' +
       ''') as departemen from trans_master where trans_master.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
       ''' AND trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
       ''' AND trans_master.therapist_id <> ''' + '' + ''' AND trans_master.therapist_id <> ''' + 'NONE' +
       ''' AND trans_master.promo = ''' + 'F' +
       ''' GROUP BY trans_master.therapist_id ORDER BY jumlah ASC');
   qrySum1.Open;
   qrySum1.First;
   for i := 0 to qrySum1.RecordCount -1 do
     begin
       if (qrySum1.Fields[2].AsString = 'TR') then
         begin
           totRF := totRF + qrySum1.Fields[1].AsFloat;
         end
       else if (qrySum1.Fields[2].AsString = 'TB') then
         begin
           totBM := totBM + qrySum1.Fields[1].AsFloat;
         end;
       qrySum1.Next;
     end;

   cntTR := qrySum1.RecordCount;
   cntHari := DaysBetween(tglCari, tglCari);
   memSend.Lines.Add('<tr><td colspan="3"></td></tr>');
   memSend.Lines.Add('<tr><td colspan="3"><b>Therapist & Menu Report</b></td></tr>');
   memSend.Lines.Add('<tr><td>1.</td><td>Total RF </td><td align="right">' + FormatFloat('#,#', totRF) + '</td></tr>');
   memSend.Lines.Add('<tr><td>2.</td><td>Total BM </td><td align="right">' + FormatFloat('#,#', totBM) + '</td></tr>');}

   {qrySum2.Close;
   qrySum2.SQL.Clear;
   qrySum2.SQL.Add('select count(available_tr.id_therapist) as jumlah ' +
           'from available_tr where (available_tr.departemen = ''' + 'TR' + ''' OR available_tr.departemen = ''' +
           'TB' + ''') AND available_tr.tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglCari) + '''');
   qrySum2.Open;
   avaiTR := qrySum2.Fields[0].AsInteger;

   qrySum2.Close;
   qrySum2.SQL.Clear;
   qrySum2.SQL.Add('select count(trans_master.therapist_id) as jumlah ' +
       'from trans_master where trans_master.tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari) +
       ''' AND trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
       ''' AND trans_master.therapist_id <> ''' + '' + '''');

   qrySum2.Open;
   totTrans := qrySum2.Fields[0].AsFloat;

   rasioTR := cntTR / avaiTR;}
   //memSend.Lines.Add('<tr><td>3.</td><td>Therapist Ratio </td><td align="right">' + FormatFloat('0.0', rasioTR) + '</td></tr>');

   //memSend.Lines.Add('<tr><td>4.</td><td>On Duty </td><td align="right">' + FormatFloat('#,#', avaiTR) + '</td></tr>');
   memSend.Lines.Add('<tr><td colspan="3"></td></tr>');
   memSend.Lines.Add('<tr><td colspan="3"><b>Therapist & Menu Report</b></td></tr>');
//--> CALC COUNT RF & BM
   qrySum4.Close;
   qrySum4.SQL.Clear;
   {qrySum4.SQL.Add('select count(trans_detail.trans_type_id) as jumlah ' +
         'from trans_detail where trans_detail.tanggal >= ''' +
         FormatDateTime('yyyy-MM-dd', tglCari) +
         ''' AND trans_detail.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
         ''' AND trans_detail.trans_type_id = ''' + 'BJ' +
         ''' AND trans_detail.room_id LIKE ' + QuotedStr('RF%'));}
   qrySum4.SQL.Add('SELECT COUNT(trans_master.trans_id) as jumlah ' +
                   'FROM trans_master WHERE trans_master.tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
                   ''' AND trans_master.room_id LIKE ' + QuotedStr('RF%') +
                   'AND trans_master.status_trans = ' + QuotedStr('PAID') + ';');

   qrySum4.Open;

   cntRF := StrToInt(qrySum4.Fields[0].AsString);
//   memLogs.Lines.Add('cntRF = ' + IntToStr(cntRF));
   qrySum2.Close;
   qrySum2.SQL.Clear;
   {qrySum2.SQL.Add('select count(trans_detail.trans_type_id) as jumlah ' +
         'from trans_detail where trans_detail.tanggal = ''' +
         FormatDateTime('yyyy-MM-dd', tglCari) +
         ''' AND trans_detail.tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
         ''' AND trans_detail.trans_type_id = ''' + 'BJ' +
         ''' AND NOT trans_detail.room_id LIKE ' + QuotedStr('RF%')); }
   qrySum2.SQL.Add('SELECT COUNT(trans_master.trans_id) as jumlah ' +
                   'FROM trans_master WHERE trans_master.tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
                   ''' AND NOT trans_master.room_id LIKE ' + QuotedStr('RF%') +
                   ' AND trans_master.room_id <> ' + QuotedStr('') +
                   ' AND trans_master.status_trans = ' + QuotedStr('PAID') + ';');
   qrySum2.Open;
   cntBM := qrySum2.Fields[0].AsInteger;
//   memLogs.Lines.Add('cntBM = ' + IntToStr(cntBM));
   memSend.Lines.Add('<tr><td>1.</td><td>Count By Type Jasa </td><td align="right"></td></tr>');
   memSend.Lines.Add('<tr><td></td><td>RF </td><td align="right">' + FormatFloat('#,#', cntRF) + '</td></tr>');
   memSend.Lines.Add('<tr><td></td><td>BM </td><td align="right">' + FormatFloat('#,#', cntBM) + '</td></tr>');

//--> END CALC COUNT RF & BM

//--> ON DUTY CALC
   qrySum2.Close;
   qrySum2.SQL.Clear;
   {qrySum2.SQL.Add('select available_tr.departemen, count(available_tr.departemen) from available_tr ' +
        'where available_tr.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
       ''' AND available_tr.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) + ''' group by available_tr.departemen');}

   {qrySum2.SQL.Add('SELECT ben_hrd_karyawan_info.departemen, COUNT(ben_hrd_karyawan_info.departemen) as jumlah ' +
                   'FROM ben_hrd_jadwal_local INNER JOIN ben_hrd_karyawan_info ON ben_hrd_jadwal_local.kodekaryawan = ' +
                   'ben_hrd_karyawan_info.kodekaryawan WHERE ' +
                   'ben_hrd_jadwal_local.tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
                   ''' GROUP BY ben_hrd_karyawan_info.departemen;');}
   qrySum2.SQL.Add('SELECT absen_harian.id_karyawan, absen_harian.tanggal, ' +
                    'ben_hrd_karyawan_info.departemen ' +
                    'FROM absen_harian LEFT JOIN ' +
                    'ben_hrd_karyawan_info ON absen_harian.id_karyawan = ' +
                    'ben_hrd_karyawan_info.idkaryawan WHERE ' +
                    'absen_harian.tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
                    ''' AND absen_harian.waktu < ''' + '16:00:00' +
                    ''' GROUP BY absen_harian.id_karyawan;');
   qrySum2.Open;
   qrySum2.First;
   onDutiTR := 0;
   onDutiTB := 0;
   for i := 0 to qrySum2.RecordCount-1 do
       begin
           if qrySum2.Fields[2].AsString = 'TR' then
             begin
//                onDutiTR := qrySum2.Fields[1].AsInteger;
                  onDutiTR := onDutiTR + 1;
             end
           else if (qrySum2.Fields[2].AsString = 'TB') then
             begin
//                onDutiTB := qrySum2.Fields[1].AsInteger;
                  onDutiTB := onDutiTB + 1;
             end;
          qrySum2.Next;
       end;
//   memLogs.Lines.Add('On Duty TR = ' + IntToStr(onDutiTR));
//   memLogs.Lines.Add('On Duty TB = ' + IntToStr(onDutiTB));
   memSend.Lines.Add('<tr><td>2.</td><td>Therapist On Duty </td><td align="right"></td></tr>');
   memSend.Lines.Add('<tr><td></td><td>RF</td><td align="right">' + FormatFloat('#,#', onDutiTR) + '</td></tr>');
   memSend.Lines.Add('<tr><td></td><td>BM</td><td align="right">' + FormatFloat('#,#', onDutiTB) + '</td></tr>');
//--> END ON DUTY CALC

//--> RATIO THERAPIST

//   memLogs.Lines.Add('Step 2B Start !');
   memSend.Lines.Add('<tr><td>3.</td><td>Therapist Ratio </td><td align="right"></td></tr>');
   if onDutiTR > 0 then
     rasioTR := cntRF / onDutiTR
   else
     rasioTR := 0;
//   memLogs.Lines.Add('Ratio RF = ' + FloatToStr(rasioTR));
//   memLogs.Lines.Add('Step 2B-1 Pass !');
   memSend.Lines.Add('<tr><td></td><td>RF</td><td align="right">' + FormatFloat('0.0', rasioTR) + '</td></tr>');
   
   if onDutiTB > 0 then
     rasioTB := cntBM / onDutiTB
   else
     rasioTB := 0;
//   memLogs.Lines.Add('Ratio BM = ' + FloatToStr(rasioTB));
//   memLogs.Lines.Add('Step 2B-2 Pass !');
   memSend.Lines.Add('<tr><td></td><td>BM</td><td align="right">' + FormatFloat('0.0', rasioTB) + '</td></tr>');

//--> END RATIO THERAPIST

//--> BEST FEWEST SALE
   {
   memSend.Lines.Add('<tr><td>4.</td><td>Best & Fewest RF </td><td align="right"></td></tr>');
   qrySum2.Close;
   qrySum2.SQL.Clear;
   qrySum2.SQL.Add('select trans_detail.produk_jasa_nama, sum(subtotal) as ' +
       'grantotal, count(trans_detail.produk_jasa_nama) as jumlah, ' +
       'trans_detail.produk_jasa_id from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari)  + ''' and trans_detail.tanggal <= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari)  +
       ''' AND trans_detail.taked = ''' + 'F'  + ''' AND trans_type_id = ''' + 'BJ' +
       ''' AND trans_detail.room_id LIKE ' + QuotedStr('RF%') +
       ' Group By trans_detail.produk_jasa_id ORDER BY jumlah ASC');
   qrySum2.Open;
   qrySum2.Last;
   keterangan := 'Best Seller Jasa [ ' + TitleCase(qrySum2.Fields[0].AsString) + ' | Qty : ' + FormatFloat('#,#', qrySum2.Fields[2].AsFloat) + ' ]';
   memSend.Lines.Add('<tr><td></td><td> ' + keterangan + ' </td><td align="right">' + FormatFloat('#,#', qrySum2.Fields[1].AsFloat) + '</td></tr>');
   qrySum2.First;
   keterangan := 'Fewest Seller Jasa [ ' + TitleCase(qrySum2.Fields[0].AsString) + ' | Qty : ' + FormatFloat('#,#', qrySum2.Fields[2].AsFloat)+ ' ]';
   memSend.Lines.Add('<tr><td></td><td> ' + keterangan + ' </td><td align="right">' + FormatFloat('#,#', qrySum2.Fields[1].AsFloat) + '</td></tr>');
   //--BM
   memSend.Lines.Add('<tr><td>5.</td><td>Best & Fewest BM </td><td align="right"></td></tr>');
   qrySum2.Close;
   qrySum2.SQL.Clear;
   qrySum2.SQL.Add('select trans_detail.produk_jasa_nama, sum(subtotal) as ' +
       'grantotal, count(trans_detail.produk_jasa_nama) as jumlah, ' +
       'trans_detail.produk_jasa_id from trans_detail where tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari)  + ''' and trans_detail.tanggal <= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari)  +
       ''' AND trans_detail.taked = ''' + 'F'  + ''' AND trans_type_id = ''' + 'BJ' +
       ''' AND trans_detail.room_id NOT LIKE ' + QuotedStr('RF%') +
       ' Group By trans_detail.produk_jasa_id ORDER BY jumlah ASC');
   qrySum2.Open;
   qrySum2.Last;
   keterangan := 'Best Seller Jasa [ ' + TitleCase(qrySum2.Fields[0].AsString) + ' | Qty : ' + FormatFloat('#,#', qrySum2.Fields[2].AsFloat) + ' ]';
   memSend.Lines.Add('<tr><td></td><td> ' + keterangan + ' </td><td align="right">' + FormatFloat('#,#', qrySum2.Fields[1].AsFloat) + '</td></tr>');
   qrySum2.First;
   keterangan := 'Fewest Seller Jasa [ ' + TitleCase(qrySum2.Fields[0].AsString) + ' | Qty : ' + FormatFloat('#,#', qrySum2.Fields[2].AsFloat)+ ' ]';
   memSend.Lines.Add('<tr><td></td><td> ' + keterangan + ' </td><td align="right">' + FormatFloat('#,#', qrySum2.Fields[1].AsFloat) + '</td></tr>');
 }

//--> END  BEST FEWEST SALE

//--> ROOM RATIO
     memSend.Lines.Add('<tr><td>4.</td><td>Room Ratio</td><td align="right"></td></tr>');

     qrySum1.Close;
     qrySum1.SQL.Clear;
     qrySum1.SQL.Add('select COUNT(ruangan.ruangan_id) as jumlah from ruangan ' +
                     'where ruangan.jenis_jasa = ''' + 'RF' + '''');
     qrySum1.Open;
     cntRoomRF := qrySum1.Fields[0].AsInteger;
//     memLogs.Lines.Add('Room RF = ' + FloatToStr(cntRoomRF));
     if cntRoomRF > 0 then
       roomRFRatio := cntRF / cntRoomRF
     else
       roomRFRatio := 0;
//     memLogs.Lines.Add('Rasio Room RF = ' + FloatToStr(roomRFRatio));
     memSend.Lines.Add('<tr><td></td><td>Room RF</td><td align="right">' + FormatFloat('0.0', roomRFRatio) + '</td></tr>');

     qrySum1.Close;
     qrySum1.SQL.Clear;
     qrySum1.SQL.Add('select COUNT(ruangan.ruangan_id) as jumlah from ruangan ' +
                     'where ruangan.jenis_jasa = ''' + 'BM' + '''');
     qrySum1.Open;
     cntRoomBM := qrySum1.Fields[0].AsInteger;
//     memLogs.Lines.Add('Room BM = ' + FloatToStr(cntRoomBM));
     
     if cntRoomBM > 0 then
       roomBMRatio := cntBM / cntRoomBM
     else
       roomBMRatio := 0;
//     memLogs.Lines.Add('Rasio Room BM = ' + FloatToStr(roomBMRatio));
     memSend.Lines.Add('<tr><td></td><td>Room BM</td><td align="right">' + FormatFloat('0.0', roomBMRatio) + '</td></tr>');
 //--> END ROOM RATIO
//--> GENDER COUNT
   memSend.Lines.Add('<tr><td>5.</td><td>Guest Count By Gender </td><td align="right"></td></tr>');
   {qrySum1.Close;
   qrySum1.SQL.Clear;
   qrySum1.SQL.Add('select trans_master.gender,count(trans_master.gender) as grandtotal ' +
       'from trans_master where trans_master.tanggal >= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari)  + ''' and trans_master.tanggal <= ''' +
       FormatDateTime('yyyy-MM-dd', tglCari)  +
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
       memSend.Lines.Add('<tr><td></td><td> ' + keterangan + ' </td><td align="right">' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');
       qrySum1.Next;
     end;}
     qrySum1.Close;
     qrySum1.SQL.Clear;
     qrySum1.SQL.Add('SELECT trans_master.gender, COUNT(trans_master.gender) as jumlah ' +
                     'FROM trans_master WHERE trans_master.tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
                     ''' AND trans_master.room_id <> ''' + '' + ''' ' +
                     'AND trans_master.status_trans = ''' + 'PAID' + ''' ' +
                     'GROUP BY trans_master.gender;');
     qrySum1.Open;
     qrySum1.First;
     for i := 0 to qrySum1.RecordCount -1 do
       begin
            if (qrySum1.Fields[0].AsString = 'F') then
               begin
                    keterangan := 'Female';
                    memSend.Lines.Add('<tr><td></td><td> ' + keterangan + ' </td><td align="right">' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');
//                    memLogs.Lines.Add('Female = ' + FloatToStr(qrySum1.Fields[1].AsFloat));
               end
           else if (qrySum1.Fields[0].AsString = 'M') then
               begin
                    keterangan := 'Male';
                    memSend.Lines.Add('<tr><td></td><td> ' + keterangan + ' </td><td align="right">' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');
//                    memLogs.Lines.Add('Male = ' + FloatToStr(qrySum1.Fields[1].AsFloat));
               end;

           qrySum1.Next;
       end;

//--> END GENDER COUNT

   memSend.Lines.Add('<tr><td>6.</td><td>Rejected Guest</td><td align="right"></td></tr>');
   qrySum1.Close;
   qrySum1.SQL.Clear;
   qrySum1.SQL.Add('select trans_reject.jenis_jasa, count(trans_reject.jenis_jasa) as jumlah ' +
        'from trans_reject where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
        ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', tglCari) + ''' AND iscancel = ''' + 'N' +
        ''' GROUP BY trans_reject.jenis_jasa');
   qrySum1.Open;
   if (NOT qrySum1.IsEmpty) then
     begin
        if (qrySum1.RecordCount > 1) then
          begin
             qrySum1.First;
             keterangan := 'Guests ' + qrySum1.Fields[0].AsString;
             memSend.Lines.Add('<tr><td></td><td>'+ keterangan +'</td><td>' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');
             qrySum1.Last;
             keterangan := 'Guests ' + qrySum1.Fields[0].AsString;
             memSend.Lines.Add('<tr><td></td><td>'+ keterangan +'</td><td>' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');
          end
        else if (qrySum1.RecordCount <= 1) then
          begin
             qrySum1.First;
             keterangan := 'Guests ' + qrySum1.Fields[0].AsString;
             memSend.Lines.Add('<tr><td></td><td>'+ keterangan +'</td><td>' + FormatFloat('#,#', qrySum1.Fields[1].AsFloat) + '</td></tr>');
          end;
     end
   else if (NOT qrySum1.IsEmpty) then
     begin
       memSend.Lines.Add('<tr><td></td><td>'+ 'Null' +'</td><td></td></tr>');
     end;

   memSend.Lines.Add('</table>');
   memSend.Lines.Add('</div>');
   //CreateCharts;
   memSend.Lines.Add('</body>');
   memSend.Lines.Add('</html>');
   qrySum1.Free;
   qrySum2.Free;
   qrySum3.Free;
   qrySum4.Free;
//   memLogs.Lines.Add('Step 2A End !');
end;

procedure TfrmBALIReportPendapatanHarian.btnClosingClick(Sender: TObject);
var
  i, noUrut, recSel: Integer;
  keterangan1, keterangan2 : String;
  GrandPenjualan : Double;
begin
   tglCari := edServerTime.Date;
//   memLogs.Lines.Add('Step 1 Pass !');
   DeleteDouble;
//   memLogs.Lines.Add('Step 2 Pass !');
   TTask.Run(
        procedure
          begin
             TThread.Synchronize(nil,
                procedure
                begin
                   frmBALIReportPendapatanHarian.CariSummary;
                end);
          end
       );
//   memLogs.Lines.Add('Step 3 Pass !');
   GrandPenjualan := 0;
   tvreport.DataController.SelectAll;
   tvreport.DataController.DeleteSelection;
   //JASA
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama) ' +
                    'from trans_detail where tanggal = ''' +
                    FormatDateTime('yyyy-MM-dd', tglCari)  +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BJ' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'PENJUALAN JASA*');
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

   //ADDITIONAL
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama) ' +
                    'from trans_detail where tanggal = ''' +
                    FormatDateTime('yyyy-MM-dd', tglCari)  +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BA' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'PENJUALAN ADDITIONAL');
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

   //PRODUK
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama) ' +
                    'from trans_detail where tanggal = ''' +
                    FormatDateTime('yyyy-MM-dd', tglCari)  +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BP' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'PENJUALAN PRODUK');
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
   //GC
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select produk_jasa_nama, paket, sum(subtotal), count(produk_jasa_nama) ' +
                    'from trans_detail where tanggal = ''' +
                    FormatDateTime('yyyy-MM-dd', tglCari)  +
                    ''' AND taked = ''' + 'F' + ''' AND trans_type_id = ''' +
                    'BG' + ''' group by produk_jasa_nama, paket ORDER BY produk_jasa_nama ASC');
   qryCari.Open;
   qryCari.First;
   noUrut := 0;
   recSel := tvreport.DataController.InsertRecord(tvreport.DataController.RecordCount);
   tvreport.DataController.SetValue(recSel, tvreportColumn1.Index, '*');
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'PENJUALAN GC');
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
   tvreport.DataController.SetValue(recSel, tvreportColumn2.Index, 'GROSS SALES');

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select sum(subtotal) from trans_detail where tanggal = ''' +
       FormatDateTime('yyyy-MM-dd', tglCari) + '''');
   qryCari.Open;
   tvreport.DataController.SetValue(recSel, tvreportColumn4.Index, FormatFloat('#,#', qryCari.Fields[0].AsFloat));
   tvreport.DataController.PostEditingData;
   tvreport.DataController.Post(True);
   CariPembayaran;
//   CariDetails;
   ShowMessage('Closing Done' + #13 + 'Please Check Your Data !!');
end;

procedure TfrmBALIReportPendapatanHarian.cxButton2Click(Sender: TObject);
var
   ConfigDir, namaFile, subject, MailAcc, MailPass, emailAddress,
   NamaCnt, txtCodeGenerator : String;
   i : Integer;
   isOkMail : Boolean;
   lTextPart : TIdText;
   Attachmentfile: TIdAttachmentFile;
   lsBody : TStringList;
begin
   ConfigDir := ExtractFilePath(Application.ExeName);
   namaFile := ConfigDir + 'report\' + FormatDateTime('yyyyMMdd', tglCari) + '.pdf';
   PrintGrid.ExportToPDF(namaFile, False, nil);

   if (CekInternet = False) then
       begin
         ShowMessage('No Internet Active, Send Mail Failed !');
         Exit;
       end;
  subject := 'Summary Report ' + frmMain.APP_OUTLETNAME + ' ' + FormatDateTime('dd/MMM/yyyy', tglCari);

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


  //IO SETTING ZENFAMILYSPA.COM
  {With frmMain.IdSSLIOHandlerSocketOpenSSL1 do
      begin

        Destination := 'srv60.niagahoster.com:2096';
        Host := 'srv60.niagahoster.com:2096';
        MaxLineAction := maException;
        Port := 587;
        SSLOptions.Method := sslvTLSv1;
        SSLOptions.Mode := sslmUnassigned;
        SSLOptions.VerifyMode := [];
        SSLOptions.VerifyDepth := 0;
      end;
  //
  //SETTING SMTP COMPONENT mail.zenfamilyspa.com //

//  frmMain.IdSMTP1.Host := 'srv60.niagahoster.com:2096';
  frmMain.IdSMTP1.Host := 'mail.zenfamilyspa.com';
  frmMain.IdSMTP1.Port := 587;
  frmMain.IdSMTP1.Username := MailAcc; // please change to your gmail address //
  frmMain.IdSMTP1.Password := MailPass;
  frmMain.IdSMTP1.IOHandler := frmMain.IdSSLIOHandlerSocketOpenSSL1;
  frmMain.IdSMTP1.AuthType := satDefault;
  frmMain.IdSMTP1.UseTLS := utUseExplicitTLS;

  // SETTING email MESSAGE DATA //
   }

  frmMain.IdMessage1.Clear;
  qryCari.Close;
  qryCari.SQL.Clear;
  qryCari.SQL.Add('select nama_kontak, mail_kontak from ben_mail_master where aktif = ''' + 'Y' + '''');
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
  lTextPart.Body.Text := '<html><body></body></html>';
  lTextPart.ContentType := 'text/html';}



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
        //ShowMessage('Exception class name = '+E.ClassName);
        //ShowMessage('Exception message = '+E.Message);

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

procedure TfrmBALIReportPendapatanHarian.DeleteDouble;
var
  i: Integer;
  idPayment : String;
begin
  qryCari.SQL.Clear;
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select id_payment from trans_payment_detail where tanggal = ''' +
     FormatDateTime('yyyy-MM-dd', tglCari) + '''');
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

function TfrmBALIReportPendapatanHarian.CekInternet: Boolean;
begin
    result := (InternetGetConnectedState(nil, 0));
end;

procedure TfrmBALIReportPendapatanHarian.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryCari.Free;
   qryPayment.Free;
   qryFind.Free;
   qrySearch.Free;
   Action := caFree;
end;

procedure TfrmBALIReportPendapatanHarian.FormCreate(Sender: TObject);
var
   HariIni : TDateTime;
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

    if (frmBALIReportPendapatanHarian.Tag = 0) then
      begin
        qryCari.Close;
        qryCari.SQL.Clear;
        qryCari.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
        qryCari.Open;
        edServerTime.Date := qryCari.Fields[0].AsDateTime;
        HariIni := StartOfTheDay(qryCari.Fields[0].AsDateTime);

        if (HoursBetween(HariIni,qryCari.Fields[0].AsDateTime) > 1) then
          begin
             tglCari := HariIni;
             lblTanggal.Caption := FormatDateTime('dd-MMMM-yyyy', tglCari);
          end
        else if (HoursBetween(HariIni,qryCari.Fields[0].AsDateTime) <= 1) then
          begin
             tglCari := IncDay(HariIni, -1);
             lblTanggal.Caption := FormatDateTime('dd-MMMM-yyyy', tglCari);
          end;
      end
    else if (frmBALIReportPendapatanHarian.Tag = 1) then
      begin
         edServerTime.Date := Now;
         edServerTime.Properties.ReadOnly := False;
         HariIni := Now;
         tglCari := edServerTime.Date;
      end;


end;

end.
