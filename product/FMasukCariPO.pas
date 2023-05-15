unit FMasukCariPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxDBLookupComboBox, cxCalc,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator;

type
  TfrmMasukCariPO = class(TForm)
    Label1: TLabel;
    gtbPO: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbPOid_transaksi: TcxGridDBColumn;
    gtbPOtanggal: TcxGridDBColumn;
    gtbPOwaktu: TcxGridDBColumn;
    gtbPOtgl_tempo: TcxGridDBColumn;
    gtbPOid_supp: TcxGridDBColumn;
    gtbPOgrandtotal: TcxGridDBColumn;
    gtbPOprepared_by: TcxGridDBColumn;
    gtbPOmengetahui: TcxGridDBColumn;
    gtbPOnotes: TcxGridDBColumn;
    gtbPOis_finish: TcxGridDBColumn;
    gtbDetail: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    gtbDetailid_transaksi: TcxGridDBColumn;
    gtbDetailid_produk: TcxGridDBColumn;
    gtbDetailqty: TcxGridDBColumn;
    gtbDetailharga_beli: TcxGridDBColumn;
    gtbDetailtotal: TcxGridDBColumn;
    gtbDetailnama_produk: TcxGridDBColumn;
    gtbDetailnama_satuan: TcxGridDBColumn;
    btnSelectPO: TButton;
    gtbDetailSisa: TcxGridDBColumn;
    btnSelectBeli: TButton;
    procedure FormActivate(Sender: TObject);
    procedure gtbPOFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure gtbPOCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnSelectPOClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelectBeliClick(Sender: TObject);
  private
    { Private declarations }
    STR_SQL : String;
    procedure PREPARE_QRY_SEARCH();
  public
    { Public declarations }
  end;

var
  frmMasukCariPO: TfrmMasukCariPO;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasukBarang, FPembelian;

procedure TfrmMasukCariPO.btnSelectBeliClick(Sender: TObject);
var
   i, recSelect, newRec : Integer;
   idTransaksi, idProduk : String;
   qtyBefore, qtyMasuk, hargaNett, totmasuk, subtotal : Double;
   ketemu : Boolean;
begin
     Screen.Cursor := crHourGlass;
     with dmDB do
          begin
               recSelect := gtbPO.DataController.GetFocusedRecordIndex;
               idTransaksi := vartostr(gtbPO.DataController.GetValue(recSelect, gtbPOid_transaksi.Index));
               STR_SQL := 'select * from tbl_po_master where id_transaksi = ''' +
                           idTransaksi + '''';
               PREPARE_QRY_SEARCH;
               with frmPembelian do
                    begin
                         ednoPO.text := idTransaksi;
                         edSupp.EditValue := qrySearch.Fields[5].AsString;
                         edTglTempo.Date := qrySearch.Fields[4].AsDateTime;
                         edTempo.EditValue := qrySearch.Fields[3].AsFloat;
                         ckTax.EditValue := qrySearch.Fields[13].AsString;
                         edDiscPersen.EditValue := qrySearch.Fields[9].AsFloat;
                         edJumlhDisc.EditValue := qrySearch.Fields[10].AsFloat;
                         edTax.EditValue := qrySearch.Fields[14].AsFloat;
                         edDisc.EditValue := qrySearch.Fields[11].AsFloat;
                         edBiayaKirim.EditValue := qrySearch.Fields[15].AsFloat;
                         STR_SQL := 'select * from view_masuk_detail where id_po = ''' +
                                    idTransaksi + '''';
                         PREPARE_QRY_CARI;
                         qryCari.First;
                         for i := 0 to qryCari.RecordCount - 1 do
                             begin
                                  idProduk := qryCari.Fields[2].AsString;
                                  //ShowMessage(idProduk);
                                  ketemu := gtvPurchase.DataController.Search.Locate(gtvPurchaseIDProduk.Index, idProduk);
                                  if (ketemu = True) then
                                      begin
                                           recSelect := gtvPurchase.DataController.GetFocusedRecordIndex;
                                           qtyBefore := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseQty.Index);
                                           hargaNett := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseNett.Index);
                                           qtyMasuk := qryCari.Fields[3].AsFloat;
                                           totmasuk := qtyBefore + qtyMasuk;
                                           subtotal := hargaNett * totmasuk;
                                           gtvPurchase.DataController.SetValue(recSelect, gtvPurchaseQty.Index, totmasuk);
                                           gtvPurchase.DataController.SetValue(recSelect, gtvPurchaseSubtotal.Index, subtotal);
                                      end
                                  else  if (ketemu = False) then
                                      begin
                                           STR_SQL := 'select id_produk, hb_nett, nama_produk from tbl_po_detail where id_produk = ''' +
                                              idProduk + ''' and id_transaksi = ''' + idTransaksi + '''';
                                           PREPARE_QRY_FIND;
                                           hargaNett := qryFind.Fields[1].AsFloat;
                                           totmasuk := qryCari.Fields[3].AsFloat;
                                           subtotal := hargaNett * totmasuk;
                                           newRec := gtvPurchase.DataController.InsertRecord(gtvPurchase.DataController.RecordCount);
                                           gtvPurchase.DataController.SetValue(newRec, gtvPurchaseIDProduk.Index, idProduk);
                                           gtvPurchase.DataController.SetValue(newRec, gtvPurchaseNamaProduk.Index, qryCari.Fields[8].AsString);
                                           gtvPurchase.DataController.SetValue(newRec, gtvPurchaseSatuan.Index, qryCari.Fields[9].AsString);
                                           gtvPurchase.DataController.SetValue(newRec, gtvPurchaseNett.Index, hargaNett);
                                           gtvPurchase.DataController.SetValue(newRec, gtvPurchaseQty.Index, totmasuk);
                                           gtvPurchase.DataController.SetValue(newRec, gtvPurchaseSubtotal.Index, subtotal);

                                      end;
                                  gtvPurchase.DataController.PostEditingData;
                                  gtvPurchase.DataController.Post(True);
                                  qryCari.Next;
                             end;


                    end;
          end;
     Screen.Cursor := crDefault;
     frmMasukCariPO.Close;
end;

procedure TfrmMasukCariPO.btnSelectPOClick(Sender: TObject);
var
   i, recSelect, newRec : Integer;
   idTransaksi : String;
   totMasuk : Double;
begin
     with dmDB do
          begin
               recSelect := gtbPO.DataController.GetFocusedRecordIndex;
               idTransaksi := vartostr(gtbPO.DataController.GetValue(recSelect, gtbPOid_transaksi.Index));
               frmMasukBarang.edSupplier.editvalue := gtbPO.DataController.GetValue(recSelect, gtbPOid_supp.Index);
               frmMasukBarang.edNoPO.Text := idTransaksi;
               STR_SQL := 'select id_produk, nama_produk, qty, sisa_qty from tbl_po_detail where id_transaksi = ''' +
                          idTransaksi + ''' and sisa_qty <> ''' + FloatToStr(0) + '''';
               PREPARE_QRY_SEARCH;
               qrySearch.First;
               for i := 0 to qrySearch.RecordCount - 1 do
                   begin
                        totMasuk := qrySearch.Fields[2].AsFloat - qrySearch.Fields[3].AsFloat;
                        with frmMasukBarang do
                             begin
                                  newRec := gtvMasuk.DataController.InsertRecord(gtvMasuk.DataController.RecordCount);
                                  gtvMasuk.DataController.SetValue(newRec, gtvMasukIDProduk.Index, qrySearch.Fields[0].AsString);
                                  gtvMasuk.DataController.SetValue(newRec, gtvMasukNamaProduk.Index, qrySearch.Fields[1].AsString);
                                  gtvMasuk.DataController.SetValue(newRec, gtvMasukQtyPO.Index, qrySearch.Fields[2].AsFloat);
                                  gtvMasuk.DataController.SetValue(newRec, gtvMasukTotMasuk.Index, totMasuk);
                                  gtvMasuk.DataController.SetValue(newRec, gtvMasukQtyMasuk.Index, 0);
                                  gtvMasuk.DataController.SetValue(newRec, gtvMasukSisa.Index, qrySearch.Fields[3].AsFloat);
                                  gtvMasuk.DataController.SetValue(newRec, gtvMasukGudang.Index, '1');
                                  gtvMasuk.DataController.SetValue(newRec, gtvMasukFinish.Index, 'N');
                                  gtvMasuk.DataController.PostEditingData;
                                  gtvMasuk.DataController.Post(True);
                             end;
                        qrySearch.Next;
                   end;
          end;
     frmMasukCariPO.Close;
end;

procedure TfrmMasukCariPO.FormActivate(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with dmDB do
          begin
               if (btnSelectPO.Visible = True) then
                   begin
                        qryCariPO.Close;
                        qryCariPO.SQL.Clear;
                        qryCariPO.SQL.Add('select * from tbl_po_master where is_finish = ''' + 'N' +
                                ''' and is_del = ''' + 'N' + '''');
                        qryCariPO.Open;
                        frmMasukCariPO.gtbPO.DataController.Refresh;

                        qryPODetail.Close;
                        qryPODetail.SQL.Clear;
                        qryPODetail.SQL.Add('select * from view_po_detail where id_transaksi = ''' + 'X' + '''');
                        qryPODetail.Open;
                        gtbDetail.DataController.Refresh;
                   end
               else if (btnSelectPO.Visible = False) then
                   begin
                        qryCariPO.Close;
                        qryCariPO.SQL.Clear;
                        qryCariPO.SQL.Add('select * from tbl_po_master where is_validate = ''' + 'N' +
                                ''' and is_del = ''' + 'N' + ''' and is_konsinyasi = ''' + 'N' + '''');
                        qryCariPO.Open;
                        gtbPO.DataController.Refresh;

                        qryPODetail.Close;
                        qryPODetail.SQL.Clear;
                        qryPODetail.SQL.Add('select * from view_po_detail where id_transaksi = ''' + 'X' + '''');
                        qryPODetail.Open;
                        gtbDetail.DataController.Refresh;
                   end;


          end;
     Screen.Cursor := crDefault;;
end;

procedure TfrmMasukCariPO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmMasukCariPO.gtbPOCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
   recSelect : Integer;
   idTransaksi : String;
begin
     recSelect := gtbPO.DataController.GetFocusedRecordIndex;
     idTransaksi := vartostr(gtbPO.DataController.GetValue(recSelect, gtbPOid_transaksi.Index));
     dmDb.qryPODetail.Close;
     dmDb.qryPODetail.SQL.Clear;
     dmDb.qryPODetail.SQL.Add('select * from view_po_detail where id_transaksi = ''' + idTransaksi + '''');
     dmDb.qryPODetail.Open;
     gtbDetail.DataController.Refresh;
end;

procedure TfrmMasukCariPO.gtbPOFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
   recSelect : Integer;
   idTransaksi : String;
begin
     recSelect := gtbPO.DataController.GetFocusedRecordIndex;
     idTransaksi := vartostr(gtbPO.DataController.GetValue(recSelect, gtbPOid_transaksi.Index));
     dmDb.qryPODetail.Close;
     dmDb.qryPODetail.SQL.Clear;
     dmDb.qryPODetail.SQL.Add('select * from view_po_detail where id_transaksi = ''' + idTransaksi + '''');
     dmDb.qryPODetail.Open;
     gtbDetail.DataController.Refresh;
end;

end.
