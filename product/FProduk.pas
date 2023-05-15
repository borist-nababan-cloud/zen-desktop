unit FProduk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox, cxCalc,
  cxDBLookupComboBox, cxMaskEdit, cxDropDownEdit, Menus, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinsdxBarPainter, dxBarSkinnedCustForm, dxSkinsdxRibbonPainter, dxPSCore,
  dxPScxCommon, ShellApi, cxGridExportLink, cxButtons,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  MyAccess, MemDS, DBAccess;

type
  TfrmProduk = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edNamaCari: TcxTextEdit;
    gtbProduk: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edLimit: TcxCalcEdit;
    ckLimit: TcxCheckBox;
    pmOption: TPopupMenu;
    LIHATDETAIL1: TMenuItem;
    EXPAND1: TMenuItem;
    COLLAPSE1: TMenuItem;
    Label3: TLabel;
    edCariBarcode: TcxTextEdit;
    btnNewProduk: TButton;
    Button1: TButton;
    ProdukBaru1: TMenuItem;
    pmMenu: TPopupMenu;
    Expand2: TMenuItem;
    Collapse2: TMenuItem;
    ExportExcel1: TMenuItem;
    Cetak1: TMenuItem;
    dlgSave: TSaveDialog;
    dxComponentPrinter1: TdxComponentPrinter;
    PrintGrid: TdxGridReportLink;
    cxButton1: TcxButton;
    gtbProdukautonum: TcxGridDBColumn;
    gtbProdukid_produk: TcxGridDBColumn;
    gtbProdukbarcode: TcxGridDBColumn;
    gtbProduknama_produk: TcxGridDBColumn;
    gtbProdukid_jenis: TcxGridDBColumn;
    gtbProdukid_satuan: TcxGridDBColumn;
    gtbProdukmin_stok: TcxGridDBColumn;
    gtbProdukmax_stok: TcxGridDBColumn;
    gtbProdukis_blok: TcxGridDBColumn;
    gtbProdukid_supp: TcxGridDBColumn;
    gtbProdukh_list: TcxGridDBColumn;
    gtbProdukhj_nett: TcxGridDBColumn;
    gtbProdukhd_nett: TcxGridDBColumn;
    gtbProdukhb_nett: TcxGridDBColumn;
    gtbProdukkonsinyasi: TcxGridDBColumn;
    gtbProdukis_jasa: TcxGridDBColumn;
    qryProduct: TMyQuery;
    dsQryProduct: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edLimitKeyPress(Sender: TObject; var Key: Char);
    procedure ckLimitPropertiesChange(Sender: TObject);
    procedure LIHATDETAIL1Click(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure EXPAND1Click(Sender: TObject);
    procedure COLLAPSE1Click(Sender: TObject);
    procedure edCariBarcodePropertiesChange(Sender: TObject);
    procedure edCariBarcodeFocusChanged(Sender: TObject);
    procedure edNamaCariFocusChanged(Sender: TObject);
    procedure btnNewProdukClick(Sender: TObject);
    procedure gtbProdukDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Expand2Click(Sender: TObject);
    procedure Collapse2Click(Sender: TObject);
    procedure ExportExcel1Click(Sender: TObject);
    procedure Cetak1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    STR_SQL : String;
    qrySearch, qryFind, qryCari, qryExec : TMyQuery;
    procedure PREPARE_QRY_SEARCH();
    procedure PREPARE_QRY_FIND();
    procedure PREPARE_QRY_CARI();
  public
    { Public declarations }
    procedure REFRESH_GRID();
  end;

var
  frmProduk: TfrmProduk;

implementation

{$R *.dfm}

uses FdmDB, FMain, FProdukDetail;

procedure TfrmProduk.PREPARE_QRY_SEARCH;
begin
     qrySearch.Close;
     qrySearch.SQL.Clear;
     qrySearch.SQL.Add(STR_SQL);
     qrySearch.Open;
     qrySearch.First;
end;

procedure TfrmProduk.PREPARE_QRY_FIND;
begin
     qryFind.Close;
     qryFind.SQL.Clear;
     qryFind.SQL.Add(STR_SQL);
     qryFind.Open;
     qryFind.First;
end;

procedure TfrmProduk.PREPARE_QRY_CARI;
begin
     qryCari.Close;
     qryCari.SQL.Clear;
     qryCari.SQL.Add(STR_SQL);
     qryCari.Open;
     qryCari.First;
end;

procedure TfrmProduk.REFRESH_GRID;
begin

   qryProduct.Close;
   qryProduct.SQL.Clear;
   qryProduct.SQL.Add('SELECT autonum, id_produk, barcode, nama_produk, id_jenis, id_supp, ' +
                     'id_merek, id_satuan, id_warna, id_ukuran,hj_nett, hb_nett, ' +
                     'min_stok, max_stok, is_tax, tambah_point, price_edit, ' +
                     'konsinyasi, formula, is_jasa, is_blok from tbl_produk ' +
                     'ORDER BY autonum DESC LIMIT 100');
   qryProduct.Open;
   ckLimit.Checked := True;
   gtbProduk.DataController.Refresh;

end;

procedure TfrmProduk.btnNewProdukClick(Sender: TObject);
begin
     Application.CreateForm(TfrmProdukDetail, frmProdukDetail);
     frmProdukDetail.FormStyle := fsNormal;
     frmProdukDetail.Show;
     frmProdukDetail.Width := 770;
     frmProdukDetail.Height := 565;
     frmProdukDetail.Position := poDesktopCenter;
     //frmProdukDetail.rbHargaJual.ItemIndex := 0;
     //frmProdukDetail.rbHargaBeli.ItemIndex := 0;
     frmProdukDetail.btnSave.Caption := 'Save';
     frmProdukDetail.btnClear.Caption := 'Clear';
     frmProdukDetail.edBarcode.Text := 'AUTO';

end;

procedure TfrmProduk.Button1Click(Sender: TObject);
begin
     LIHATDETAIL1.Click;
end;

procedure TfrmProduk.Cetak1Click(Sender: TObject);
begin
     PrintGrid.Preview(True);
end;

procedure TfrmProduk.ckLimitPropertiesChange(Sender: TObject);
begin
     if (ckLimit.Checked = True) then
         begin
              edLimit.Enabled := True;
              edLimit.EditValue := 100;
              edLimit.SetFocus;
              qryProduct.Close;
              qryProduct.SQL.Clear;
              qryProduct.SQL.Add('SELECT autonum, id_produk, barcode, nama_produk, id_jenis, id_supp, ' +
                                     'id_merek, id_satuan, id_warna, id_ukuran, hj_nett, hb_nett, ' +
                                     'min_stok, max_stok, is_tax, tambah_point, price_edit, ' +
                                     'konsinyasi, formula, is_jasa, is_blok from tbl_produk ' +
                                     'ORDER BY autonum DESC LIMIT ' +
                                      FloatToStr(edLimit.EditValue));
               qryProduct.Open;
               ckLimit.Checked := True;
               gtbProduk.DataController.Refresh;
         end
     else if (ckLimit.Checked = False) then
         begin
              edLimit.Enabled := False;
              qryProduct.Close;
              qryProduct.SQL.Clear;
              qryProduct.SQL.Add('SELECT autonum, id_produk, barcode, nama_produk, id_jenis, id_supp, ' +
                                 'id_merek, id_satuan, id_warna, id_ukuran, hj_nett, hb_nett, ' +
                                 'min_stok, max_stok, is_tax, tambah_point, price_edit, ' +
                                 'konsinyasi, formula, is_jasa, is_blok from tbl_produk ' +
                                 'ORDER BY autonum');
               qryProduct.Open;
               gtbProduk.DataController.Refresh;
         end;
end;

procedure TfrmProduk.COLLAPSE1Click(Sender: TObject);
begin
     gtbProduk.ViewData.Collapse(True);
end;

procedure TfrmProduk.Collapse2Click(Sender: TObject);
begin
     gtbProduk.ViewData.Collapse(False);
end;

procedure TfrmProduk.cxTextEdit1PropertiesChange(Sender: TObject);
var
   namaCari : String;
begin
     namaCari := QuotedStr('%' + edNamaCari.Text + '%');
     //ShowMessage(namaCari);
     with dmDB do
          begin
               qryProduct.Close;
               qryProduct.SQL.Clear;
               qryProduct.SQL.Add('SELECT * from tbl_produk ' +
                                 'where nama_produk like ' + namaCari +
                                 'ORDER BY autonum DESC LIMIT ' +
                                 FloatToStr(edLimit.EditValue));

               qryProduct.Open;
               //ckLimit.Checked := True;
               gtbProduk.DataController.Refresh;
          end;
end;

procedure TfrmProduk.edCariBarcodeFocusChanged(Sender: TObject);
begin
     edNamaCari.Clear;
end;

procedure TfrmProduk.edCariBarcodePropertiesChange(Sender: TObject);
var
   namaCari : String;
begin

     namaCari := QuotedStr('%' + edCariBarcode.Text + '%');
     //ShowMessage(namaCari);
     with dmDB do
          begin
               qryProduct.Close;
               qryProduct.SQL.Clear;
               qryProduct.SQL.Add('SELECT  * from tbl_produk ' +
                                 'where id_produk like ' + namaCari +
                                 ' OR barcode like ' + namaCari +
                                 'ORDER BY autonum DESC LIMIT ' +
                                 FloatToStr(edLimit.EditValue));

               qryProduct.Open;
               ckLimit.Checked := True;
               gtbProduk.DataController.Refresh;
          end;
end;

procedure TfrmProduk.edLimitKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
               qryProduct.Close;
               qryProduct.SQL.Clear;
               qryProduct.SQL.Add('SELECT * from tbl_produk ' +
                                 'ORDER BY autonum DESC LIMIT ' +
                                 FloatToStr(edLimit.EditValue));

               qryProduct.Open;
               ckLimit.Checked := True;
               gtbProduk.DataController.Refresh;
         end;
end;

procedure TfrmProduk.edNamaCariFocusChanged(Sender: TObject);
begin
     edCariBarcode.Clear;
end;

procedure TfrmProduk.EXPAND1Click(Sender: TObject);
begin
     gtbProduk.ViewData.Expand(True);
end;

procedure TfrmProduk.Expand2Click(Sender: TObject);
begin
     gtbProduk.ViewData.Expand(True);
end;

procedure TfrmProduk.ExportExcel1Click(Sender: TObject);
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

procedure TfrmProduk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     qrySearch.Free;
     qryFind.Free;
     qryCari.Free;
     qryExec.Free;
     Action := caFree;
end;

procedure TfrmProduk.FormCreate(Sender: TObject);
begin
     qryProduct.Active := True;

     qryCari := TMyQuery.Create(Self);
     qryCari.Connection := DMDB.dbInternal;
     qryCari.SQL.Add('select * from tmptable');
     qryCari.Active := true;

     qrySearch := TMyQuery.Create(Self);
     qrySearch.Connection := DMDB.dbInternal;
     qrySearch.SQL.Add('select * from tmptable');
     qrySearch.Active := true;

     qryFind := TMyQuery.Create(Self);
     qryFind.Connection := DMDB.dbInternal;
     qryFind.SQL.Add('select * from tmptable');
     qryFind.Active := true;

     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from tmptable');
     qryExec.Active := true;
end;

procedure TfrmProduk.FormShow(Sender: TObject);
begin
     REFRESH_GRID;
     gtbProduk.DataController.Refresh;
end;

procedure TfrmProduk.gtbProdukDblClick(Sender: TObject);
begin
     //LIHATDETAIL1.Click;
end;

procedure TfrmProduk.LIHATDETAIL1Click(Sender: TObject);
var
   RecSelect, rbIndex, rjIndex : Integer;
   idProduk : String;
begin
     //frmMain.Call_Detail_Produk;
     Application.CreateForm(TfrmProdukDetail, frmProdukDetail);
     frmProdukDetail.ckKonsinyasi.Properties.ReadOnly := True;
     frmProdukDetail.ckJasa.Properties.ReadOnly := True;
     frmProdukDetail.ckFormula.Properties.ReadOnly := True;
     frmProdukDetail.edBarcode.Properties.ReadOnly := True;
     frmProdukDetail.ckKonversi.Properties.ReadOnly := True;
     RecSelect := gtbProduk.DataController.GetFocusedRecordIndex;
     idProduk := VarToStr(gtbProduk.DataController.GetValue(RecSelect, gtbProdukid_produk.Index));
     with dmDB do
          begin
               STR_SQL := 'select * from tbl_produk where id_produk = ''' +
                                idProduk + '''';
               PREPARE_QRY_SEARCH;
               
               with frmProdukDetail do
                    begin
                         edBarcode.Text := qrySearch.Fields[1].AsString;
                         edAlternatif.Text := qrySearch.Fields[2].AsString;
                         edNama.Text := qrySearch.Fields[3].AsString;
                         edJenis.EditValue := qrySearch.Fields[4].AsString;
                         edSupp.EditValue := qrySearch.Fields[5].AsString;
                         //edMerek.EditValue := qrySearch.Fields[6].AsString;
                         edSatuan.EditValue := qrySearch.Fields[7].AsString;
                         //edWarna.EditValue := qrySearch.Fields[8].AsString;
                         //edUkuran.EditValue := qrySearch.Fields[9].AsString;
                         //rbHargaJual.ItemIndex := qrySearch.Fields[16].AsInteger;
                         rjIndex := qrySearch.Fields[16].AsInteger;
                         //rbHargaBeli.ItemIndex := qrySearch.Fields[17].AsInteger;
                         rbIndex := qrySearch.Fields[17].AsInteger;
                         //ckHjQty.EditValue := qrySearch.Fields[10].AsString;
                         edPriceList.EditValue := qrySearch.Fields[10].AsString;
                         if (rjIndex = 0) then
                             begin
                                  STR_SQL := 'select * from tbl_hj_normal ' +
                                                 'where id_produk = ''' + idProduk + '''';
                                  PREPARE_QRY_FIND;
                                  if (not qryFind.IsEmpty) then
                                      begin
                                           edhj_disc1.EditValue := qryFind.Fields[2].AsFloat;
                                           edhj_disc2.EditValue := qryFind.Fields[3].AsFloat;
                                           edhj_disc3.EditValue := qryFind.Fields[4].AsFloat;
                                           edhj_nett.EditValue := qryFind.Fields[5].AsFloat;
                                                //
                                           edhd_disc1.EditValue := qryFind.Fields[6].AsFloat;
                                           edhd_disc2.EditValue := qryFind.Fields[7].AsFloat;
                                           edhd_disc3.EditValue := qryFind.Fields[8].AsFloat;
                                           edhd_nett.EditValue := qryFind.Fields[9].AsFloat;
                                      end;
                             end;
                         if (rbIndex = 0) then
                             begin
                                  STR_SQL := 'select * from tbl_hb_normal ' +
                                                 'where id_produk = ''' + idProduk + '''';
                                  PREPARE_QRY_CARI;
                                  if (not qryCari.IsEmpty) then
                                      begin
                                           edhb_disc1.EditValue := qryCari.Fields[2].AsFloat;
                                           edhb_disc2.EditValue := qryCari.Fields[3].AsFloat;
                                           edhb_disc3.EditValue := qryCari.Fields[4].AsFloat;
                                           edhb_disc4.EditValue := qryCari.Fields[5].AsFloat;
                                           edhb_disc5.EditValue := qryCari.Fields[6].AsFloat;
                                           edhb_nett.EditValue := qryCari.Fields[7].AsFloat;
                                      end;
                             end;
                         edMin.EditValue := qrySearch.Fields[11].AsFloat;
                         edMax.EditValue := qrySearch.Fields[12].AsFloat;
                         ckTax.EditValue := qrySearch.Fields[13].AsString;
                         ckPoint.EditValue := qrySearch.Fields[14].AsString;
                         ckEditHarga.EditValue := qrySearch.Fields[15].AsString;
                         ckKonsinyasi.EditValue := qrySearch.Fields[21].AsString;
                         ckFormula.EditValue := qrySearch.Fields[22].AsString;
                         ckJasa.EditValue := qrySearch.Fields[23].AsString;
                         ckKonversi.EditValue := qrySearch.Fields[24].AsString;
                         ckBlok.EditValue := qrySearch.Fields[27].AsString;
                         btnClear.Caption := 'Close';
                         btnSave.Caption := 'Update';
                    end;
          end;
     frmProdukDetail.ShowModal;
end;

end.
