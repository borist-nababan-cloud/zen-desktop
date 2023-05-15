unit FProdukDetail;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, cxCalc, cxGroupBox, ExtCtrls, cxRadioGroup,
  Buttons, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, MyAccess;

type
  TfrmProdukDetail = class(TForm)
    Label1: TLabel;
    edBarcode: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edAlternatif: TcxTextEdit;
    cxLabel3: TcxLabel;
    edNama: TcxTextEdit;
    edJenis: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    edSupp: TcxLookupComboBox;
    cxLabel7: TcxLabel;
    edSatuan: TcxLookupComboBox;
    edPriceList: TcxCalcEdit;
    cxLabel10: TcxLabel;
    ckTax: TcxCheckBox;
    ckPoint: TcxCheckBox;
    ckEditHarga: TcxCheckBox;
    ckKonsinyasi: TcxCheckBox;
    ckFormula: TcxCheckBox;
    ckJasa: TcxCheckBox;
    ckBlok: TcxCheckBox;
    gbJual: TcxGroupBox;
    cxLabel11: TcxLabel;
    edhj_disc1: TcxCalcEdit;
    edhj_disc2: TcxCalcEdit;
    edhj_disc3: TcxCalcEdit;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    edhj_nett: TcxCalcEdit;
    cxLabel15: TcxLabel;
    edhd_disc1: TcxCalcEdit;
    edhd_disc2: TcxCalcEdit;
    edhd_disc3: TcxCalcEdit;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    edhd_nett: TcxCalcEdit;
    Bevel1: TBevel;
    gbBeli: TcxGroupBox;
    cxLabel19: TcxLabel;
    edhb_disc1: TcxCalcEdit;
    edhb_disc2: TcxCalcEdit;
    edhb_disc3: TcxCalcEdit;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    edhb_nett: TcxCalcEdit;
    cxLabel23: TcxLabel;
    edhb_disc4: TcxCalcEdit;
    cxLabel24: TcxLabel;
    edhb_disc5: TcxCalcEdit;
    cxLabel25: TcxLabel;
    edMin: TcxCalcEdit;
    cxLabel26: TcxLabel;
    edMax: TcxCalcEdit;
    btnSave: TButton;
    btnSetFormula: TButton;
    btnSetKonveri: TButton;
    btnClear: TButton;
    ckKonversi: TcxCheckBox;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edhj_disc1KeyPress(Sender: TObject; var Key: Char);
    procedure edhj_disc1PropertiesEditValueChanged(Sender: TObject);
    procedure edhj_disc1FocusChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edhj_disc2FocusChanged(Sender: TObject);
    procedure edhj_disc2KeyPress(Sender: TObject; var Key: Char);
    procedure edhj_disc2PropertiesEditValueChanged(Sender: TObject);
    procedure edhj_disc3FocusChanged(Sender: TObject);
    procedure edhj_disc3PropertiesEditValueChanged(Sender: TObject);
    procedure edhj_disc3KeyPress(Sender: TObject; var Key: Char);
    procedure edhb_nettKeyPress(Sender: TObject; var Key: Char);
    procedure edhj_nettKeyPress(Sender: TObject; var Key: Char);
    procedure edhj_nettFocusChanged(Sender: TObject);
    procedure edhd_disc1KeyPress(Sender: TObject; var Key: Char);
    procedure edhd_disc2KeyPress(Sender: TObject; var Key: Char);
    procedure edhd_disc3KeyPress(Sender: TObject; var Key: Char);
    procedure edhd_nettKeyPress(Sender: TObject; var Key: Char);
    procedure edhd_disc1FocusChanged(Sender: TObject);
    procedure edhd_disc2FocusChanged(Sender: TObject);
    procedure edhd_disc3FocusChanged(Sender: TObject);
    procedure edhd_nettFocusChanged(Sender: TObject);
    procedure edhb_disc1KeyPress(Sender: TObject; var Key: Char);
    procedure edhb_disc2KeyPress(Sender: TObject; var Key: Char);
    procedure edhb_disc3KeyPress(Sender: TObject; var Key: Char);
    procedure edhb_disc4KeyPress(Sender: TObject; var Key: Char);
    procedure edhb_disc5KeyPress(Sender: TObject; var Key: Char);
    procedure edhb_disc1FocusChanged(Sender: TObject);
    procedure edhb_disc2FocusChanged(Sender: TObject);
    procedure edhb_disc3FocusChanged(Sender: TObject);
    procedure edhb_disc4FocusChanged(Sender: TObject);
    procedure edhb_disc5FocusChanged(Sender: TObject);
    procedure edhb_nettFocusChanged(Sender: TObject);
    procedure ckFormulaPropertiesChange(Sender: TObject);
    procedure ckKonversiPropertiesChange(Sender: TObject);
    procedure btnSetKonveriClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edAlternatifKeyPress(Sender: TObject; var Key: Char);
    procedure edNamaKeyPress(Sender: TObject; var Key: Char);
    procedure edJenisKeyPress(Sender: TObject; var Key: Char);
    procedure edSuppKeyPress(Sender: TObject; var Key: Char);
    procedure edSatuanKeyPress(Sender: TObject; var Key: Char);
    procedure edMinKeyPress(Sender: TObject; var Key: Char);
    procedure edMaxKeyPress(Sender: TObject; var Key: Char);
    procedure edPriceListKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearClick(Sender: TObject);
    procedure edhj_nettPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edhd_nettPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    STR_SQL : String;
    qryCari, qryExec, qryFind : TMyQuery;
    HJ_NETT, HD_NETT, HB_NETT : Double;
    procedure HITUNG_DETAIL_HJ();
    procedure HITUNG_DETAIL_HD();
    procedure HITUNG_DETAIL_HB();
    procedure CREATEAUTONUM();
    procedure SAVE_DATA();
    procedure INSERT_HN_JUAL();
    procedure INSERT_HN_BELI();
    procedure PREPARE_QRY_CARI();
    procedure PREPARE_QRY_FIND();
  public
    { Public declarations }
  end;

var
  frmProdukDetail: TfrmProdukDetail;

implementation

{$R *.dfm}

uses FdmDB, FProduk, FMain;

procedure TfrmProdukDetail.PREPARE_QRY_CARI;
begin

end;

procedure TfrmProdukDetail.PREPARE_QRY_FIND;
begin

end;

procedure TfrmProdukDetail.INSERT_HN_JUAL;
var
   selHJ, selHD : Double;
begin
     STR_SQL := 'select id_produk, hj_nett, hd_nett from tbl_hj_normal where id_produk = ''' +
                    edBarcode.Text + '''';
     PREPARE_QRY_CARI;
     if (qryCari.IsEmpty) then
         begin
              STR_SQL := 'insert into tbl_hj_normal values(' +
                              '''' + '' + ''',' +
                              '''' + edBarcode.Text + ''',' +
                              '''' + FloatToStr(edhj_disc1.EditValue) + ''',' +
                              '''' + FloatToStr(edhj_disc2.EditValue) + ''',' +
                              '''' + FloatToStr(edhj_disc3.EditValue) + ''',' +
                              '''' + FloatToStr(edhj_nett.EditValue) + ''',' +
                              '''' + FloatToStr(edhd_disc1.EditValue) + ''',' +
                              '''' + FloatToStr(edhd_disc2.EditValue) + ''',' +
                              '''' + FloatToStr(edhd_disc3.EditValue) + ''',' +
                              '''' + FloatToStr(edhd_nett.EditValue) + ''',' +
                              '''' + 'NONE' + ''')';
              qryExec.SQL.Clear;
              qryExec.SQL.Add(STR_SQL);
              qryExec.ExecSQL;
              //ShowMessage('A');
         end
     else if (NOT qryCari.IsEmpty) then
         begin
              if (edhj_nett.EditValue <> qryCari.Fields[1].AsFloat) then
                  begin
                       STR_SQL := 'update tbl_hj_normal set ' +
                                      'hj_disc1 = ''' + FloatToStr(edhj_disc1.EditValue) + ''',' +
                                      'hj_disc2 = ''' + FloatToStr(edhj_disc2.EditValue) + ''',' +
                                      'hj_disc3 = ''' + FloatToStr(edhj_disc3.EditValue) + ''',' +
                                      'hj_nett = ''' + FloatToStr(edhj_nett.EditValue) + ''' ' +
                                      'where id_produk = ''' + edBarcode.Text + '''';
                       qryExec.SQL.Clear;
                       qryExec.SQL.Add(STR_SQL);
                       qryExec.ExecSQL;
                       //ShowMessage('B');
                       //insert history here...
                       selHJ := qryCari.Fields[1].AsFloat - edhj_nett.EditValue;
                       STR_SQL := 'insert into tbl_hj_history values(' +
                                      '''' + '' + ''',' +
                                      '''' + edBarcode.Text + ''',' +
                                      '''' + FormatDateTime('yyyy-MM-dd', Now) + ''',' +
                                      '''' + FormatDateTime('hh:mm:ss', Now) + ''',' +
                                      '''' + FloatToStr(edhj_nett.EditValue) + ''',' +
                                      '''' + FloatToStr(qryCari.Fields[1].AsFloat) + ''',' +
                                      '''' + FloatToStr(0) + ''',' +
                                      '''' + FloatToStr(0) + ''',' +
                                      '''' + FloatToStr(selHJ) + ''',' +
                                      '''' + FloatToStr(0) + ''',' +
                                      '''' + frmMain.NAMEAPPS + ''',' +
                                      '''' + '' + ''')';
                       qryExec.SQL.Clear;
                       qryExec.SQL.Add(STR_SQL);
                       qryExec.ExecSQL;
                       //ShowMessage('C');
                  end;
              if (edhd_nett.EditValue <> qryCari.Fields[2].AsFloat) then
                  begin
                       //ShowMessage('D');
                       STR_SQL := 'update tbl_hj_normal set ' +
                                       'hd_disc1 = ''' + FloatToStr(edhd_disc1.EditValue) + ''',' +
                                       'hd_disc2 = ''' + FloatToStr(edhd_disc2.EditValue) + ''',' +
                                       'hd_disc3 = ''' + FloatToStr(edhd_disc3.EditValue) + ''',' +
                                       'hd_nett = ''' + FloatToStr(edhd_nett.EditValue) + ''' ' +
                                       'where id_produk = ''' + edBarcode.Text + '''';
                       qryExec.SQL.Clear;
                       qryExec.SQL.Add(STR_SQL);
                       qryExec.ExecSQL;
                       //ShowMessage('E');
                       //insert history here...
                       selHD := qryCari.Fields[2].AsFloat - edhd_nett.EditValue;
                       STR_SQL := 'insert into tbl_hj_history values(' +
                                      '''' + '' + ''',' +
                                      '''' +  edBarcode.Text + ''',' +
                                      '''' + FormatDateTime('yyyy-MM-dd', Now) + ''',' +
                                      '''' + FormatDateTime('hh:mm:ss', Now) + ''',' +
                                      '''' + FloatToStr(0) + ''',' +
                                      '''' + FloatToStr(0) + ''',' +
                                      '''' + FloatToStr(edhd_nett.EditValue) + ''',' +
                                      '''' + FloatToStr(qryCari.Fields[2].AsFloat) + ''',' +
                                      '''' + FloatToStr(0) + ''',' +
                                      '''' + FloatToStr(selHD) + ''',' +
                                      '''' + frmMain.NAMEAPPS + ''',' +
                                      '''' + '' + ''')';
                       qryExec.SQL.Clear;
                       qryExec.SQL.Add(STR_SQL);
                       qryExec.ExecSQL;
                       //ShowMessage('F');
                  end;

         end;
end;

procedure TfrmProdukDetail.INSERT_HN_BELI;
var
   selHB : Double;
begin
     STR_SQL := 'select id_produk, hb_nett from tbl_hb_normal where id_produk = ''' +
                    edBarcode.Text + '''';
     PREPARE_QRY_CARI;
          if (qryCari.IsEmpty) then
              begin
                   STR_SQL := 'insert into tbl_hb_normal values(' +
                                  '''' + '' + ''',' +
                                  '''' +  edBarcode.Text + ''',' +
                                  '''' + FloatToStr(edhb_disc1.EditValue) + ''',' +
                                  '''' + FloatToStr(edhb_disc2.EditValue) + ''',' +
                                  '''' + FloatToStr(edhb_disc3.EditValue) + ''',' +
                                  '''' + FloatToStr(edhb_disc4.EditValue) + ''',' +
                                  '''' + FloatToStr(edhb_disc5.EditValue) + ''',' +
                                  '''' + FloatToStr(edhb_nett.EditValue) + ''',' +
                                  '''' + '' + ''')';
                   qryExec.SQL.Clear;
                   qryExec.SQL.Add(STR_SQL);
                   qryExec.ExecSQL;
              end
          else if (NOT qryCari.IsEmpty) then
              begin
                   if (edhb_nett.EditValue <> qryCari.Fields[1].AsFloat) then
                       begin
                            STR_SQL := 'update tbl_hb_normal set ' +
                                           'hb_disc1 = ''' + FloatToStr(edhb_disc1.EditValue) + ''',' +
                                           'hb_disc2 = ''' + FloatToStr(edhb_disc2.EditValue) + ''',' +
                                           'hb_disc3 = ''' + FloatToStr(edhb_disc3.EditValue) + ''',' +
                                           'hb_disc4 = ''' + FloatToStr(edhb_disc4.EditValue) + ''',' +
                                           'hb_disc5 = ''' + FloatToStr(edhb_disc5.EditValue) + ''',' +
                                           'hb_nett = ''' + FloatToStr(edhb_nett.EditValue) + ''' ' +
                                           'where id_produk = ''' + edBarcode.Text + '''';
                            qryExec.SQL.Clear;
                            qryExec.SQL.Add(STR_SQL);
                            qryExec.ExecSQL;

                            selHB := qryCari.Fields[1].AsFloat - edhb_nett.EditValue;
                            STR_SQL := 'insert into tbl_hb_history values(' +
                                      '''' + '' + ''',' +
                                      '''' + edBarcode.Text + ''',' +
                                      '''' + FormatDateTime('yyyy-MM-dd', Now) + ''',' +
                                      '''' + FormatDateTime('hh:mm:ss', Now) + ''',' +
                                      '''' + FloatToStr(qryCari.Fields[1].AsFloat) + ''',' +
                                      '''' + FloatToStr(edhb_nett.EditValue) + ''',' +
                                      '''' + FloatToStr(selHB) + ''',' +
                                      '''' + frmMain.NAMEAPPS + ''',' +
                                      '''' + '' + ''')';
                            qryExec.SQL.Clear;
                            qryExec.SQL.Add(STR_SQL);
                            qryExec.ExecSQL;
                       end;
              end;
end;

procedure TfrmProdukDetail.SAVE_DATA;
begin
     CREATEAUTONUM;
     STR_SQL := 'select id_produk from tbl_produk where id_produk = ''' +
                              edBarcode.Text + '''';
     PREPARE_QRY_CARI;
     if (NOT qryCari.IsEmpty) then
         begin
              CREATEAUTONUM;
         end;

     STR_SQL := 'insert into tbl_produk values(' +
                    '''' + '' + ''',' +
                    '''' + edBarcode.Text + ''',' +
                    ''''  + edAlternatif.Text + ''',' +
                    QuotedStr(edNama.Text) + ',' +
                    '''' + vartostr(edJenis.EditValue) + ''',' +
                    '''' + vartostr(edSupp.EditValue) + ''',' +
                    '''' + '' + ''',' +
                    '''' + vartostr(edSatuan.EditValue) + ''',' +
                    '''' + '' + ''',' +
                    '''' + '' + ''',' +
                    '''' + vartostr(edPriceList.EditValue) + ''',' +
                    '''' + vartostr(edMin.EditValue) + ''',' +
                    '''' + vartostr(edMax.EditValue) + ''',' +
                    '''' + vartostr(ckTax.EditValue) + ''',' +
                    '''' + vartostr(ckPoint.EditValue) + ''',' +
                    '''' + vartostr(ckEditHarga.EditValue) + ''',' +
                    '''' + '0' + ''',' +
                    '''' + '0' + ''',' +
                    '''' + vartostr(edhj_nett.EditValue) + ''',' +
                    '''' + vartostr(edhd_nett.EditValue) + ''',' +
                    '''' + vartostr(edhb_nett.EditValue) + ''',' +
                    '''' + vartostr(ckKonsinyasi.EditValue) + ''',' +
                    '''' + vartostr(ckFormula.EditValue) + ''',' +
                    '''' + vartostr(ckJasa.EditValue) + ''',' +
                    '''' + vartostr(ckKonversi.EditValue) + ''',' +
                    '''' + '' + ''',' +
                    '''' + '' + ''',' +
                    '''' + vartostr(ckBlok.EditValue) + ''')';
     qryExec.SQL.Clear;
     qryExec.SQL.Add(STR_SQL);
     qryExec.ExecSQL;
     ckKonsinyasi.Properties.ReadOnly := True;
     ckFormula.Properties.ReadOnly := True;
     ckJasa.Properties.ReadOnly := True;
     ckKonversi.Properties.ReadOnly := True;
     btnSave.Caption := 'Update';
     btnClear.Caption := 'Close';
end;

procedure TfrmProdukDetail.CREATEAUTONUM;
var
   oldID, strOldID, strNewID : String;
   intOldId, panjang : Integer;
begin
     with dmDB do
          begin
               STR_SQL := 'select id_produk from tbl_produk order by id_produk DESC';
               PREPARE_QRY_FIND;
               if (qryFind.IsEmpty) then
                   begin
                        edBarcode.Text := '00000001';
                        Exit;
                   end;
               qryFind.First;
               oldID := qryFind.Fields[0].AsString;
               intOldId := StrToInt(oldID) + 1;

               strOldID := inttostr(intOldId);
               panjang := Length(strOldID);
               case panjang of
                    1 : strNewID := '0000000' + strOldID;
                    2 : strNewID := '000000' + strOldID;
                    3 : strNewID := '00000' + strOldID;
                    4 : strNewID := '0000' + strOldID;
                    5 : strNewID := '000' + strOldID;
                    6 : strNewID := '00' + strOldID;
                    7 : strNewID := '0' + strOldID;
                    8 : strNewID := strOldID;
               end;
              //ShowMessage(oldID + '#' + inttostr(intOldId) + '#' + strNewID);
          end;
     edBarcode.Text := strNewID;
end;

procedure TfrmProdukDetail.btnClearClick(Sender: TObject);
begin
     frmProdukDetail.Close;
end;

procedure TfrmProdukDetail.btnSaveClick(Sender: TObject);
var
   RUBAH_HJ, RUBAH_HD, RUBAH_HB : Boolean;
begin
     STR_SQL := 'select * from tbl_jenis where id_jenis = ''' +
                     vartostr(edJenis.EditValue) + '''';
     PREPARE_QRY_CARI;
     if (qryCari.Fields[3].AsString = 'Y') then
         begin
              ShowMessage('Maaf Jenis Barang di Blok, Mohon ganti terlebih dahulu !!');
              Exit;
         end;
      STR_SQL := 'select id_supp, blok from tbl_supplier where id_supp = ''' +
                     vartostr(edSupp.EditValue) + '''';
     PREPARE_QRY_CARI;
     if (qryCari.Fields[1].AsString = 'Y') then
         begin
              ShowMessage('Maaf Supplier di Blok, Mohon ganti terlebih dahulu !!');
              Exit;
         end;

     if (btnSave.Caption = 'Update') then
         begin
              //ShowMessage('1');
              STR_SQL := 'update tbl_produk set ' +
                             'barcode = '''  + edAlternatif.Text + ''',' +
                             'nama_produk = ' + QuotedStr(edNama.Text) + ',' +
                             'id_jenis = ''' + vartostr(edJenis.EditValue) + ''',' +
                             'id_supp = ''' + vartostr(edSupp.EditValue) + ''',' +
                             'id_satuan = ''' + vartostr(edSatuan.EditValue) + ''',' +
                             'h_list = ''' + vartostr(edPriceList.EditValue) + ''',' +
                             'min_stok = ''' + vartostr(edMin.EditValue) + ''',' +
                             'max_stok = ''' + vartostr(edMax.EditValue) + ''',' +
                             'is_tax = ''' + vartostr(ckTax.EditValue) + ''',' +
                             'tambah_point = ''' + vartostr(ckPoint.EditValue) + ''',' +
                             'price_edit = ''' + vartostr(ckEditHarga.EditValue) + ''',' +
                             'hj_nett = ''' + vartostr(edhj_nett.EditValue) + ''',' +
                             'hb_nett = ''' + vartostr(edhb_nett.EditValue) + ''',' +
                             'hd_nett = ''' + vartostr(edhd_nett.EditValue) + ''',' +
                             'is_blok = ''' + vartostr(ckBlok.EditValue) + ''' ' +
                             'where id_produk = ''' + edBarcode.Text + '''';
              qryExec.SQL.Clear;
              qryExec.SQL.Add(STR_SQL);
              qryExec.ExecSQL;
              //ShowMessage('2');
              //showm
              Sleep(100);
              HITUNG_DETAIL_HJ;
              //ShowMessage('3');
              HITUNG_DETAIL_HD;
              //ShowMessage('4');
              INSERT_HN_JUAL;
              INSERT_HN_BELI;
             frmProduk.REFRESH_GRID;
             frmProdukDetail.Close;
         end
     else if (btnSave.Caption = 'Save') then
         begin
              CREATEAUTONUM;
              //ShowMessage('1');
              STR_SQL := 'select id_produk from tbl_produk where id_produk = ''' +
                              edBarcode.Text + '''';
              PREPARE_QRY_CARI;
              if (NOT qryCari.IsEmpty) then
                  begin
                       CREATEAUTONUM;
                  end;

              STR_SQL := 'insert into tbl_produk values(' +
                             '''' + '' + ''',' +
                             '''' + edBarcode.Text + ''',' +
                             ''''  + edAlternatif.Text + ''',' +
                             QuotedStr(edNama.Text) + ',' +
                             '''' + vartostr(edJenis.EditValue) + ''',' +
                             '''' + vartostr(edSupp.EditValue) + ''',' +
                             '''' + '' + ''',' +
                             '''' + vartostr(edSatuan.EditValue) + ''',' +
                             '''' + '' + ''',' +
                             '''' + '' + ''',' +
                             '''' + vartostr(edPriceList.EditValue) + ''',' +
                             '''' + vartostr(edMin.EditValue) + ''',' +
                             '''' + vartostr(edMax.EditValue) + ''',' +
                             '''' + vartostr(ckTax.EditValue) + ''',' +
                             '''' + vartostr(ckPoint.EditValue) + ''',' +
                             '''' + vartostr(ckEditHarga.EditValue) + ''',' +
                             '''' + '0' + ''',' +
                             '''' + '0' + ''',' +
                             '''' + vartostr(edhj_nett.EditValue) + ''',' +
                             '''' + vartostr(edhd_nett.EditValue) + ''',' +
                             '''' + vartostr(edhb_nett.EditValue) + ''',' +
                             '''' + vartostr(ckKonsinyasi.EditValue) + ''',' +
                             '''' + vartostr(ckFormula.EditValue) + ''',' +
                             '''' + vartostr(ckJasa.EditValue) + ''',' +
                             '''' + vartostr(ckKonversi.EditValue) + ''',' +
                             '''' + '' + ''',' +
                             '''' + '' + ''',' +
                             '''' + vartostr(ckBlok.EditValue) + ''')';
              qryExec.SQL.Clear;
              qryExec.SQL.Add(STR_SQL);
              qryExec.ExecSQL;
              HITUNG_DETAIL_HJ;
              HITUNG_DETAIL_HD;
              INSERT_HN_JUAL;
              INSERT_HN_BELI;
              ShowMessage('Data Disimpan');
              frmProduk.REFRESH_GRID;
              frmProdukDetail.Close;
         end;

end;

procedure TfrmProdukDetail.HITUNG_DETAIL_HB;
var
   ndisc1, rpDisc1, PriceList, subTotal1,
   ndisc2, subtotal2, ndisc3, nDisc4, nDisc5,
   subtotal3, subtotal4, subtotal5 : Double;
begin
     if (HB_NETT <> edhb_nett.EditValue) then
         begin
              ndisc1 := ((edPriceList.EditValue - edhb_nett.EditValue) / edPriceList.EditValue) * 100;
              edhb_disc1.EditValue := ndisc1;
              HB_NETT := edhb_nett.EditValue;
              edhb_disc2.EditValue := 0;
              edhb_disc3.EditValue := 0;
              edhb_disc4.EditValue := 0;
              edhb_disc5.EditValue := 0;
         end;

     ndisc1 := 0;
     ndisc2 := 0;
     ndisc3 := 0;
     subTotal1 := 0;
     subTotal2 := 0;
     subTotal3 := 0;
     PriceList := edPriceList.EditValue;
     ndisc1 := (PriceList * edhb_disc1.EditValue) / 100;
     subTotal1 := PriceList - ndisc1;
     edhb_nett.EditValue := subTotal1;
     HB_NETT := subTotal1;
     if (edhb_disc2.EditValue = 0) then
         begin
              Exit;
         end;
     ndisc2 := (subTotal1 * edhb_disc2.EditValue) / 100;
     subtotal2 := subTotal1 - ndisc2;
     edhb_nett.EditValue := subTotal2;
     HB_NETT := subTotal2;
     if (edhb_disc3.EditValue = 0) then
         begin
              Exit;
         end;
     ndisc3 := (subTotal2 * edhb_disc3.EditValue) / 100;
     subtotal3 := subTotal2 - ndisc3;
     edhb_nett.EditValue := subTotal3;
     HB_NETT := subTotal3;
     //--
     if (edhb_disc4.EditValue = 0) then
         begin
              Exit;
         end;
     ndisc4 := (subTotal3 * edhb_disc4.EditValue) / 100;
     subtotal4 := subTotal3 - ndisc4;
     edhb_nett.EditValue := subTotal4;
     HB_NETT := subTotal4;
     //--
     if (edhb_disc5.EditValue = 0) then
         begin
              Exit;
         end;
     ndisc5 := (subTotal4 * edhb_disc5.EditValue) / 100;
     subtotal5 := subTotal4 - ndisc5;
     edhb_nett.EditValue := subTotal5;
     HB_NETT := subTotal5;

end;

procedure TfrmProdukDetail.HITUNG_DETAIL_HD;
var
   ndisc1, rpDisc1, PriceList, subTotal1,
   ndisc2, subtotal2, ndisc3,
   subtotal3 : Double;
begin
     if (HD_NETT <> edhd_nett.EditValue) then
         begin
              if ((edhd_disc1.EditValue = 0) AND (edhd_disc2.EditValue = 0) AND (edhd_disc3.EditValue = 0)) then
                 begin
                      ndisc1 := ((edPriceList.EditValue - edhd_nett.EditValue) / edPriceList.EditValue) * 100;
                      edhd_disc1.EditValue := ndisc1;
                      HD_NETT := edhd_nett.EditValue;
                      edhd_disc2.EditValue := 0;
                      edhd_disc3.EditValue := 0;
                      Exit;
                 end;
         end;

     ndisc1 := 0;
     ndisc2 := 0;
     ndisc3 := 0;
     subTotal1 := 0;
     subTotal2 := 0;
     subTotal3 := 0;
     PriceList := edPriceList.EditValue;
     ndisc1 := (PriceList * edhd_disc1.EditValue) / 100;
     subTotal1 := PriceList - ndisc1;
     edhd_nett.EditValue := subTotal1;
     HD_NETT := subTotal1;
     if (edhd_disc2.EditValue = 0) then
         begin
              Exit;
         end;
     ndisc2 := (subTotal1 * edhd_disc2.EditValue) / 100;
     subtotal2 := subTotal1 - ndisc2;
     edhd_nett.EditValue := subTotal2;
     HD_NETT := subTotal2;
     if (edhd_disc3.EditValue = 0) then
         begin
              Exit;
         end;
     ndisc3 := (subTotal2 * edhd_disc3.EditValue) / 100;
     subtotal3 := subTotal2 - ndisc3;
     edhd_nett.EditValue := subTotal3;
     HD_NETT := subTotal3;
end;

procedure TfrmProdukDetail.HITUNG_DETAIL_HJ;
var
   ndisc1, rpDisc1, PriceList, subTotal1,
   ndisc2, subtotal2, ndisc3,
   subtotal3 : Double;

begin
     if (HJ_NETT <> edhj_nett.EditValue) then
         begin
              if ((edhj_disc1.EditValue = 0) AND (edhj_disc2.EditValue = 0) AND (edhj_disc3.EditValue = 0)) then
                   begin
                        ndisc1 := ((edPriceList.EditValue - edhj_nett.EditValue) / edPriceList.EditValue) * 100;
                        edhj_disc1.EditValue := ndisc1;
                        HJ_NETT := edhj_nett.EditValue;
                        edhj_disc2.EditValue := 0;
                        edhj_disc3.EditValue := 0;
                        Exit;
                   end;
         end;
     {if ((edhj_disc1.EditValue = 0) AND (edhj_disc2.EditValue = 0) AND (edhj_disc3.EditValue = 0) AND (edhj_nett.EditValue <> HJ_NETT)) then
         begin
              ndisc1 := ((edPriceList.EditValue - edhj_nett.EditValue) / edPriceList.EditValue) * 100;
              edhj_disc1.EditValue := ndisc1;
              HJ_NETT := edhj_nett.EditValue;
              edhj_disc2.EditValue := 0;
              edhj_disc3.EditValue := 0;
              Exit;
         end;}
     ndisc1 := 0;
     ndisc2 := 0;
     ndisc3 := 0;
     subTotal1 := 0;
     subTotal2 := 0;
     subTotal3 := 0;
     PriceList := edPriceList.EditValue;
     ndisc1 := (PriceList * edhj_disc1.EditValue) / 100;
     subTotal1 := PriceList - ndisc1;
     edhj_nett.EditValue := subTotal1;
     HJ_NETT := subTotal1;
     if (edhj_disc2.EditValue = 0) then
         begin
              Exit;
         end;
     ndisc2 := (subTotal1 * edhj_disc2.EditValue) / 100;
     subtotal2 := subTotal1 - ndisc2;
     edhj_nett.EditValue := subTotal2;
     HJ_NETT := subTotal2;
     if (edhj_disc3.EditValue = 0) then
         begin
              Exit;
         end;
     ndisc3 := (subTotal2 * edhj_disc3.EditValue) / 100;
     subtotal3 := subTotal2 - ndisc3;
     edhj_nett.EditValue := subTotal3;
     HJ_NETT := subTotal3;
end;

procedure TfrmProdukDetail.btnSetKonveriClick(Sender: TObject);
begin
     //
end;

procedure TfrmProdukDetail.ckFormulaPropertiesChange(Sender: TObject);
begin
     if (ckFormula.Checked = True) then
         begin
              ckKonversi.Checked := False;
              btnSetFormula.Visible := True;
         end
     else if (ckFormula.Checked = False) then
         begin
              //ckKonversi.Checked := False;
              btnSetFormula.Visible := False;
         end
end;

procedure TfrmProdukDetail.ckKonversiPropertiesChange(Sender: TObject);
begin
     if (ckKonversi.Checked = True) then
         begin
              ckFormula.Checked := False;
              btnSetKonveri.Visible := True;
         end
     else if (ckKonversi.Checked = False) then
         begin
              //ckKonversi.Checked := False;
              btnSetKonveri.Visible := False;
         end
end;

procedure TfrmProdukDetail.edAlternatifKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edNama.SetFocus;
     if (key = #27) then frmProdukDetail.Close;
end;

procedure TfrmProdukDetail.edhb_disc1FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HB;
end;

procedure TfrmProdukDetail.edhb_disc1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              edhb_disc2.SetFocus;
              HITUNG_DETAIL_HB;
         end;
     if (key = #27) then
         begin

         end;

end;

procedure TfrmProdukDetail.edhb_disc2FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HB;
end;

procedure TfrmProdukDetail.edhb_disc2KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
             edhb_disc3.SetFocus;
             HITUNG_DETAIL_HB;
         end;
     if (key = #27) then
         begin
              edhb_disc1.SetFocus;
         end;
end;

procedure TfrmProdukDetail.edhb_disc3FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HB;
end;

procedure TfrmProdukDetail.edhb_disc3KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
             edhb_disc4.SetFocus;
             HITUNG_DETAIL_HB;
         end;
     if (key = #27) then
         begin
              edhb_disc2.SetFocus;
         end;
end;

procedure TfrmProdukDetail.edhb_disc4FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HB;
end;

procedure TfrmProdukDetail.edhb_disc4KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
             edhb_disc5.SetFocus;
             HITUNG_DETAIL_HB;
         end;
     if (key = #27) then
         begin
              edhb_disc3.SetFocus;
         end;
end;

procedure TfrmProdukDetail.edhb_disc5FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HB;
end;

procedure TfrmProdukDetail.edhb_disc5KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
             edhb_nett.SetFocus;
             HITUNG_DETAIL_HB;
         end;
     if (key = #27) then
         begin
              edhb_disc4.SetFocus;
         end;
end;

procedure TfrmProdukDetail.edhb_nettFocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HB;
end;

procedure TfrmProdukDetail.edhb_nettKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              btnSave.SetFocus;
              HITUNG_DETAIL_HB;
         end;
end;

procedure TfrmProdukDetail.edhd_disc1FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HD;
end;

procedure TfrmProdukDetail.edhd_disc1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              edhd_disc2.SetFocus;
              HITUNG_DETAIL_HD;
         end;
     if (key = #27) then
         begin
              edhj_nett.SetFocus;
         end;
end;

procedure TfrmProdukDetail.edhd_disc2FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HD;
end;

procedure TfrmProdukDetail.edhd_disc2KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              edhd_disc3.SetFocus;
              HITUNG_DETAIL_HD;
         end;
     if (key = #27) then
         begin
              edhd_disc1.SetFocus;
         end;
end;

procedure TfrmProdukDetail.edhd_disc3FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HD;
end;

procedure TfrmProdukDetail.edhd_disc3KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              edhd_nett.SetFocus;
              HITUNG_DETAIL_HD;
         end;
     if (key = #27) then
         begin
              edhd_disc2.SetFocus;
         end;
end;

procedure TfrmProdukDetail.edhd_nettFocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HD;
end;

procedure TfrmProdukDetail.edhd_nettKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              HITUNG_DETAIL_HD;
              edhb_disc1.SetFocus;
         end;
     if (key = #27) then
         begin
              edhd_disc3.SetFocus;
         end;
end;

procedure TfrmProdukDetail.edhd_nettPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     edhd_disc1.EditValue := 0;
     edhd_disc2.EditValue := 0;
     edhd_disc3.EditValue := 0;
end;

procedure TfrmProdukDetail.edhj_disc1FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HJ;
end;

procedure TfrmProdukDetail.edhj_disc1KeyPress(Sender: TObject; var Key: Char);
var
   disc1, disc2, disc3, NilaiDisc,
   subTotal, totDisc : Double;
begin
     if (key = #13) then
         begin
              edhj_disc2.SetFocus;
              HITUNG_DETAIL_HJ;
         end;
    if (key = #27) then edPriceList.SetFocus;
    
end;

procedure TfrmProdukDetail.edhj_disc1PropertiesEditValueChanged(
  Sender: TObject);
begin
     //HITUNG_DETAIL_HJ;
end;

procedure TfrmProdukDetail.edhj_disc2FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HJ;
end;

procedure TfrmProdukDetail.edhj_disc2KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              edhj_disc3.SetFocus;
              HITUNG_DETAIL_HJ;
         end;
     if (key = #27) then edhj_disc1.SetFocus;
end;

procedure TfrmProdukDetail.edhj_disc2PropertiesEditValueChanged(
  Sender: TObject);
begin
     //HITUNG_DETAIL_HJ;
end;

procedure TfrmProdukDetail.edhj_disc3FocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HJ;
end;

procedure TfrmProdukDetail.edhj_disc3KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              edhj_nett.SetFocus;
              HITUNG_DETAIL_HJ;
         end;
     if (key = #27) then
         begin
              edhj_disc2.SetFocus;
         end;
end;

procedure TfrmProdukDetail.edhj_disc3PropertiesEditValueChanged(
  Sender: TObject);
begin
     //HITUNG_DETAIL_HJ;
end;

procedure TfrmProdukDetail.edhj_nettFocusChanged(Sender: TObject);
begin
     HITUNG_DETAIL_HJ;
end;

procedure TfrmProdukDetail.edhj_nettKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              HITUNG_DETAIL_HJ;
              edhd_disc1.SetFocus;
         end;
     if (key = #27) then
         begin
              edhj_disc3.SetFocus;
         end;

end;

procedure TfrmProdukDetail.edhj_nettPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     edhj_disc1.EditValue := 0;
     edhj_disc2.EditValue := 0;
     edhj_disc3.EditValue := 0;
end;

procedure TfrmProdukDetail.edJenisKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edSupp.SetFocus;
     if (key = #27) then edNama.SetFocus;
end;

procedure TfrmProdukDetail.edMaxKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edPriceList.SetFocus;
     if (key = #27) then edMin.SetFocus;
end;

procedure TfrmProdukDetail.edMinKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edMax.SetFocus;
     if (key = #27) then edSatuan.SetFocus;
end;

procedure TfrmProdukDetail.edNamaKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edJenis.SetFocus;
     if (key = #27) then edAlternatif.SetFocus;
end;

procedure TfrmProdukDetail.edPriceListKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              edhj_disc1.SetFocus;
              edhd_disc1.EditValue := 0;
              edhd_disc2.EditValue := 0;
              edhd_disc3.EditValue := 0;
              edhj_disc1.EditValue := 0;
              edhj_disc2.EditValue := 0;
              edhj_disc3.EditValue := 0;
              edhd_nett.EditValue := edPriceList.EditValue;
              edhj_nett.EditValue := edPriceList.EditValue;
              edhb_disc1.EditValue := 0;
              edhb_disc1.EditValue := 0;
              edhb_disc1.EditValue := 0;
              edhb_disc1.EditValue := 0;
              edhb_disc1.EditValue := 0;
              edhb_nett.EditValue := edPriceList.EditValue;
         end;
     if (key = #27) then edMax.SetFocus;
     
end;

procedure TfrmProdukDetail.edSatuanKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edMin.SetFocus;
     if (key = #27) then edSupp.SetFocus;
end;

procedure TfrmProdukDetail.edSuppKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edSatuan.SetFocus;
     if (key = #27) then edJenis.SetFocus;
end;

procedure TfrmProdukDetail.FormActivate(Sender: TObject);
begin
     HJ_NETT := edhj_nett.EditValue;
     HD_NETT := edhd_nett.EditValue;
     HB_NETT := edhb_nett.EditValue;
end;

procedure TfrmProdukDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmProdukDetail.FormCreate(Sender: TObject);
begin
     STR_SQL := 'select * from tmptable';
     qryCari := TMyQuery.Create(Self);
     qryCari.Connection := DMDB.dbInternal;
     qryCari.SQL.Add('select * from tmptable');
     qryCari.Active := true;

     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from tmptable');
     qryExec.Active := true;
end;

end.
