unit FInputSPK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, StdCtrls, cxTextEdit, AdvToolBar, AdvToolBarStylers,
  AdvGlowButton, Menus, AdvMenus, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, cxCalc, cxCheckBox,
  cxGroupBox, cxButtons, dxSkinscxPCPainter, cxPC, strUtils, DBAccess, MyAccess, DB,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxBarBuiltInMenu, Vcl.ComCtrls, dxCore, cxDateUtils, MemDS;

type
  TfrmInputSPK = class(TForm)
    AdvToolBar1: TAdvToolBar;
    btnNew: TAdvGlowButton;
    btnPilihKendaraan: TAdvGlowButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    btnPerhitungan: TAdvGlowButton;
    btnCariSPK: TAdvGlowButton;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    btnTTS: TAdvGlowButton;
    btnAksesoris: TAdvGlowButton;
    btnOption: TAdvGlowButton;
    pmPrintOut: TPopupMenu;
    UpdateChecklist1: TMenuItem;
    PrintPernyataan1: TMenuItem;
    PrintPermohonanTransfer1: TMenuItem;
    PrintSuratjalan1: TMenuItem;
    AdvToolBarSeparator3: TAdvToolBarSeparator;
    AdvToolBarSeparator4: TAdvToolBarSeparator;
    AdvToolBarSeparator5: TAdvToolBarSeparator;
    AdvToolBarSeparator6: TAdvToolBarSeparator;
    AdvToolBarSeparator7: TAdvToolBarSeparator;
    AdvGlowButton1: TAdvGlowButton;
    AdvToolBarSeparator8: TAdvToolBarSeparator;
    AdvGlowButton2: TAdvGlowButton;
    AdvToolBarSeparator9: TAdvToolBarSeparator;
    AdvGlowButton3: TAdvGlowButton;
    pgPenjualan: TcxPageControl;
    pgSPK: TcxTabSheet;
    edIDSpk: TcxTextEdit;
    edHeadSales: TcxTextEdit;
    edWarna: TcxLookupComboBox;
    edIDProspektifOld: TcxTextEdit;
    ckProspektif: TcxCheckBox;
    edNoProspektif: TcxTextEdit;
    edTanggalProspektif: TcxDateEdit;
    edIDProspektif: TcxTextEdit;
    ckTglLahir: TcxCheckBox;
    edTglLahir: TcxDateEdit;
    btnBatal: TAdvGlowButton;
    btnSave: TAdvGlowButton;
    edTypeKendaraan: TcxLookupComboBox;
    edJumlahAngsuran: TcxCalcEdit;
    edLamaAngsuran: TcxCalcEdit;
    edLeasing: TcxLookupComboBox;
    edSales: TcxLookupComboBox;
    edKotaBPKB: TcxTextEdit;
    edNoMesin: TcxTextEdit;
    edNoSPK: TcxTextEdit;
    edKotaKuitansi: TcxTextEdit;
    edAlamatKuitansi: TcxTextEdit;
    edNamaKuitansi: TcxTextEdit;
    edPayment: TcxComboBox;
    edStatusStock: TcxTextEdit;
    edNoRangka: TcxTextEdit;
    edIDKendaraan: TcxTextEdit;
    edHPPembeli: TcxTextEdit;
    edTelponPembeli: TcxTextEdit;
    edNoKTP: TcxTextEdit;
    edAlamatBPKB: TcxTextEdit;
    edNamaBpkb: TcxTextEdit;
    edKotaPembeli: TcxTextEdit;
    edAlamatPembeli: TcxTextEdit;
    edNamaPembeli: TcxTextEdit;
    edTanggal: TcxDateEdit;
    Label36: TLabel;
    Label35: TLabel;
    Label2: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Bevel5: TBevel;
    Label24: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Bevel4: TBevel;
    Label20: TLabel;
    Bevel3: TBevel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Bevel2: TBevel;
    Label12: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    est1: TMenuItem;
    btnHome: TAdvGlowButton;
    AdvToolBarSeparator10: TAdvToolBarSeparator;
    cxGroupBox1: TcxGroupBox;
    edQuickSearch: TcxTextEdit;
    btnFind: TcxButton;
    pgDetail: TcxTabSheet;
    Label34: TLabel;
    edSumberSpk: TcxComboBox;
    Label37: TLabel;
    Label38: TLabel;
    edPekerjaan: TcxTextEdit;
    Label39: TLabel;
    edBidangUsaha: TcxTextEdit;
    Label40: TLabel;
    edJabatan: TcxTextEdit;
    Bevel7: TBevel;
    Label41: TLabel;
    Label42: TLabel;
    edRegSPK: TcxTextEdit;
    Label43: TLabel;
    edNoKuitansi: TcxTextEdit;
    edDiscAwal: TcxCalcEdit;
    Label44: TLabel;
    Label45: TLabel;
    edStatus: TcxComboBox;
    edLastLoc: TEdit;
    edLastdateLoc: TcxDateEdit;
    Label33: TLabel;
    Label46: TLabel;
    AdvGlowButton4: TAdvGlowButton;
    AdvToolBarSeparator11: TAdvToolBarSeparator;
    cbQuick: TcxComboBox;
    tblMstrSales: TMyTable;
    dsTblMasterSales: TMyDataSource;
    tblJenis: TMyTable;
    dsTbljenis: TMyDataSource;
    tblLeasing: TMyTable;
    dsTblLeasing: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnTTSClick(Sender: TObject);
    procedure btnCariSPKClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure ckTglLahirPropertiesChange(Sender: TObject);
    procedure ckProspektifPropertiesChange(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure edQuickSearchKeyPress(Sender: TObject; var Key: Char);
    procedure edSalesPropertiesChange(Sender: TObject);
    procedure est1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure pgPenjualanPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure edIDSpkPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPilihKendaraanClick(Sender: TObject);
  private
    { Private declarations }
    qrySPK1, qrySPK2, qrySearch, qryExec, qryCari, qryTemp, qryFind : TMyQuery;
    STRSQL : String;
  public
    { Public declarations }
    TR_STORE, TR_PERIODE, TR_SESSION, TR_NUMBER, TR_FAKTUR, IDKENDARAAN : string;
    function CreateNewAutoNum: string;
    function Terbilang(x :integer):string;
    procedure ClosePageForm();
    procedure InputAP();
    procedure CariLogStock;
    procedure PREPARE_SEARCH();
    procedure PREPARE_FIND();
    procedure PREPARE_CARI();
    procedure PREPARE_TEMP();
  end;

var
  frmInputSPK: TfrmInputSPK;

implementation

{$R *.dfm}

uses FdmDB, FInputTTS, FMain, FBrowseTransaksi;

procedure TfrmInputSPK.PREPARE_SEARCH();
begin
     qrySearch.Close;
     qrySearch.SQL.Clear;
     qrySearch.SQL.Add(STRSQL);
     qrySearch.Open;
     qrySearch.First;
end;

procedure TfrmInputSPK.PREPARE_FIND();
begin
    qryFind.Close;
     qryFind.SQL.Clear;
     qryFind.SQL.Add(STRSQL);
     qryFind.Open;
     qryFind.First;
end;

procedure TfrmInputSPK.PREPARE_CARI();
begin
     qryCari.Close;
     qryCari.SQL.Clear;
     qryCari.SQL.Add(STRSQL);
     qryCari.Open;
     qryCari.First;
end;

procedure TfrmInputSPK.PREPARE_TEMP();
begin
     qryTemp.Close;
     qryTemp.SQL.Clear;
     qryTemp.SQL.Add(STRSQL);
     qryTemp.Open;
     qryTemp.First;
end;

function TfrmInputSPK.CreateNewAutoNum: string;
var
   lastID, strTmpNum, strNum, NewID : string;
   intTmpNum, intNum : integer;
begin
     with dmDB do
          begin
               NewID := TR_STORE + '.' + TR_PERIODE + '.';
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('SELECT id_spk FROM mstr_spk ' +
                               'WHERE id_spk LIKE ''' + NewID + '%'' ORDER BY id_spk ASC');
               qrySearch.Open;

               if (qrySearch.IsEmpty) then
                  begin
                       Result := TR_STORE + '.' + TR_PERIODE + '.' + '001';
                       exit;
                  end;

               qrySearch.Last;

               lastID    := qrySearch.Fields[0].AsString;
               strTmpNum := Copy(lastID, length(lastID)-2, 3);
               intTmpNum := strtoint(strTmpNum);
               intNum    := intTmpNum + 1;

               case length(inttostr(intNum)) of
                    //1 : strNum := '0000' + inttostr(intNum);
                    //2 : strNum := '000' + inttostr(intNum);
                    1 : strNum := '00' + inttostr(intNum);
                    2 : strNum := '0' + inttostr(intNum);
                    3 : strNum := inttostr(intNum);
               end;

               TR_NUMBER := strNum;
               TR_FAKTUR := TR_STORE + '.' + TR_PERIODE + '.' + TR_NUMBER;
               Result := TR_FAKTUR;
          end;
end;

procedure TfrmInputSPK.CariLogStock;
begin
   qrySPK1.Close;
   qrySPK1.SQL.Clear;
   qrySPK1.SQL.Add('select id_kendaraan, tanggal, jam, tujuan from log_stock ' +
        'where id_kendaraan = ''' + IDKENDARAAN + ''' ORDER BY tanggal, jam ASC');
   qrySPK1.Open;
   qrySPK1.Last;
   if (NOT qrySPK1.IsEmpty) then
     begin
       edLastLoc.Text := qrySPK1.Fields[3].AsString;
       edLastdateLoc.Date := qrySPK1.Fields[1].AsDateTime;
     end
   else if (qrySPK1.IsEmpty) then
     begin
        edLastLoc.Text := 'NO LAST LOCATION';
        edLastdateLoc.Date := StrToDate('01/01/1970');;
     end
end;

procedure TfrmInputSPK.ClosePageForm;
begin
     if (pgDetail.ControlCount > 0) then
         begin
              if (pgDetail.Controls[0] is TForm) then
                  begin
                       (pgDetail.Controls[0] as TForm).Close;
                  end
              else ShowMessage(pgDetail.Controls[0].Name + #13 +
                              'Cannot be close, duplicate form action.');
         end;
end;

procedure TfrmInputSPK.InputAP;
var
   idCoaTTS, idCabang, keterangan, idBank : String;
   nilai : Double;
begin
     {with dmDB do
          begin
               STRSQL := 'select sum(amount) from mstr_tts where id_spk = ''' +
                         edIDSpk.Text + '''';
               PREPARE_SEARCH;
               if (not qrySearch.IsEmpty) then
                   begin
                        if (qrySearch.Fields[0].AsFloat > 0) then
                            begin
                                 if (LeftStr(frmInputSPK.edNoSpk.Text, 1) = 'P') then idCabang := '3'
                                 else if (LeftStr(frmInputSPK.edNoSpk.Text, 1) = 'B') then idCabang := '1'
                                 else idCabang := '4';

                                 STRSQL := 'select id_coa_master from coa_config where trans_config = ''' +
                                 'PENGEMBALIAN TTS' + ''' and id_cabang = ''' + idCabang + '''';
                                 PREPARE_FIND;
                                 idCoaTTS := qryFind.Fields[0].AsString;
                                 nilai := qrySearch.Fields[0].AsFloat;

                                 STRSQL := 'select id_spk, id_transaksi, amount from trans_hu where id_spk = ''' +
                                         frmInputSPK.edIDSpk.Text + ''' and id_detail = ''' + idCoaTTS + '''';
                                 PREPARE_TEMP;
                                 //showMessage('B');
                                 keterangan := 'PEMBATALAN SPK | ' + frmInputSPK.edNamaKuitansi.Text + ' | ' +
                                            frmInputSPK.edIDSpk.Text + ' | ' + 'No. SPK. ' + frmInputSPK.edNoSPK.Text;
                                 if (qryTemp.IsEmpty) then
                                     begin
                                          qryExec.SQL.Clear;
                                          qryExec.SQL.Add('insert into trans_hu values(' +
                                                 '''' + '' + ''',' +
                                                 '''' + frmInputSPK.edIDSpk.Text + ''',' +
                                                 '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                                                 '''' + idCoaTTS + ''',' +
                                                 '''' + keterangan + ''',' +
                                                 '''' + FloatToStr(nilai) + ''',' +
                                                 '''' + frmInputSPK.edNamaKuitansi.Text + ''',' +
                                                 '''' + 'N' + ''',' +
                                                 '''' + '' + ''',' +
                                                 '''' + '' + ''',' +
                                                 '''' + '' + ''')');
                                          qryExec.ExecSQL;
                                     end
                                 else if (NOT qryTemp.IsEmpty) then
                                     begin
                                         idBank := qryTemp.Fields[1].AsString;
                                         qryExec.SQL.Clear;
                                         qryExec.SQL.Add('update trans_hu set ' +
                                                'amount = ''' + FloatToStr(nilai) + ''' ' +
                                                'where id_spk = ''' + frmInputSPK.edIDSpk.Text + ''' AND id_detail = ''' +
                                                idCoaTTS + '''');
                                         qryExec.ExecSQL;
                                         Sleep(100);
                                         qryExec.SQL.Clear;
                                         qryExec.SQL.Add('update bank_mstr set ' +
                                                'total = ''' + FloatToStr(nilai) + ''' ' +
                                                'where id_transaksi = ''' + idBank + '''');
                                                qryExec.ExecSQL;
                                                Sleep(100);
                                         qryExec.SQL.Clear;
                                         qryExec.SQL.Add('update bank_detail set ' +
                                                'subtotal = ''' + FloatToStr(nilai) + ''' ' +
                                                'where id_transaksi = ''' + idBank + '''');
                                         qryExec.ExecSQL;
                                         Sleep(100);
                                         qryExec.SQL.Clear;
                                         qryExec.SQL.Add('update kas_kecil_detail set ' +
                                                'subtotal = ''' + FloatToStr(nilai) + ''' ' +
                                                'where id_transaksi = ''' + idBank + '''');
                                         qryExec.ExecSQL;

                                         qryExec.SQL.Clear;
                                         qryExec.SQL.Add('update kas_kecil_mstr set ' +
                                                'total = ''' + FloatToStr(nilai) + ''' ' +
                                                'where id_transaksi = ''' + idBank + '''');
                                         qryExec.ExecSQL;
                                     end;
                            end;
                   end;
          end;}
end;

procedure TfrmInputSPK.edIDSpkPropertiesChange(Sender: TObject);
begin
     with dmDB do
          begin
               STRSQL := 'select penjualan from checklist where id_spk = ''' +
                          edIDSpk.Text + '''';
               PREPARE_TEMP;
               if (qryTemp.IsEmpty) then edLeasing.Properties.ReadOnly := False
               else if (NOT qryTemp.IsEmpty) then
                   begin
                         if (qryTemp.Fields[0].AsString = 'Y') then
                             begin
                                  edLeasing.Properties.ReadOnly := True;
                                  edHeadSales.Properties.ReadOnly := True;
                                  edSales.Properties.ReadOnly := True;
                                  edJumlahAngsuran.Properties.ReadOnly := True;
                                  edLamaAngsuran.Properties.ReadOnly := True;
                             end
                         else if (qryTemp.Fields[0].AsString = 'N') then
                             begin
                                  edLeasing.Properties.ReadOnly := False;
                                  edHeadSales.Properties.ReadOnly := False;
                                  edSales.Properties.ReadOnly := False;
                                  edJumlahAngsuran.Properties.ReadOnly := False;
                                  edLamaAngsuran.Properties.ReadOnly := False;
                             end;
                   end;
          end;
end;

procedure TfrmInputSPK.edQuickSearchKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then btnFind.Click;
     if (key = #27) then edQuickSearch.Clear;
end;

procedure TfrmInputSPK.edSalesPropertiesChange(Sender: TObject);
begin

   qryTemp.Close;
   qryTemp.SQL.Clear;
   qryTemp.SQL.Add('select nama_supervisor from master_sales where nama_staff = ''' +
                     edSales.Text + ''' and aktif = ''' + 'Y' + '''');
   qryTemp.Open;
   edHeadSales.Text := qryTemp.Fields[0].AsString;

end;

procedure TfrmInputSPK.est1Click(Sender: TObject);
begin
     {if Assigned(frmChecklist) then Exit
     else
         begin
              Application.CreateForm(TfrmChecklist, frmChecklist);
              frmChecklist.BorderStyle := bsNone;
              frmChecklist.Parent := frmInputSPK.pgPerhitungan;
              frmChecklist.Show;
              frmChecklist.WindowState := wsMaximized;
         end; }

end;

function tanggal(t:integer):string;
begin
      if t=1 then
         Result:='Januari'
      else
      if t=2 then
         Result:='Februari'
      else
      if t=3 then
         Result:='Maret'
      else
      if t=4 then
         Result:='April'
      else
      if t=5 then
         Result:='Mei'
      else
      if t=6 then
         Result:='Juni'
      else
      if t=7 then
         Result:='Juli'
      else
      if t=8 then
         Result:='Agustus'
      else
      if t=9 then
         Result:='September'
      else
      if t=10 then
         Result:='Oktober'
      else
      if t=11 then
         Result:='November'
      else
      if t=12 then
         Result:='Desember';
end;

function TfrmInputSPK.Terbilang(x :integer):string;
const abil : array[0..11] of string[10]=('','Satu','Dua','Tiga', 'Empat','Lima','Enam','Tujuh','Delapan','Sembilan', 'Sepuluh','Sebelas');
begin

     if (x < 12) then
         Result := ' ' + abil[x]
     else if (x < 20) then
         Result := Terbilang(x-10) + ' Belas'
     else if (x < 100) then
         Result := Terbilang(x div 10) + ' Puluh' + Terbilang(x mod 10)
     else if (x < 200) then
         Result := ' Seratus' + Terbilang(x-100)
     else if (x < 1000) then
         Result := Terbilang(x div 100) + ' Ratus' + Terbilang(x mod 100)
     else if (x < 2000) then
         Result := ' Seribu' + Terbilang(x-1000)
     else if (x < 1000000) then
         Result := Terbilang(x div 1000) + ' Ribu' + Terbilang(x mod 1000)
     else if (x < 1000000000) then
         Result := Terbilang(x div 1000000) + ' Juta' + Terbilang(x mod 1000000);
     
end;

procedure TfrmInputSPK.btnSaveClick(Sender: TObject);
begin
     with dmDB do
          begin
               if (edIDSpk.EditValue = Null) then
                   begin
                        ShowMessage('ID Transaksi masih kosong');
                        Exit;
                   end;

               edWarna.SetFocus;
               ShowMessage('Pastikan tanggal SPK sudah benar!');
               qryExec.SQL.Clear;
               qryExec.SQL.Add('update mstr_spk set ' +
                               'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
                               'no_spk = ''' + edNoSPK.Text + ''',' +
                               'id_kendaraan = ''' + edIDKendaraan.Text + ''',' +
                               'payment = ''' + edPayment.Text + ''',' +
                               'nama_pembeli = ''' + edNamaPembeli.Text + ''',' +
                               'alamat_pembeli = ''' + edAlamatPembeli.Text + ''',' +
                               'telepon_pembeli = ''' + edTelponPembeli.Text + ''',' +
                               'handphone_pembeli = ''' + edHPPembeli.Text + ''',' +
                               'kota_pembeli = ''' + edKotaPembeli.Text + ''',' +
                               'nama_bpkb = ''' + edNamaBpkb.Text + ''',' +
                               'alamat_bpkb = ''' + edAlamatBPKB.Text + ''',' +
                               'ktp_bpkb = ''' + edNoKTP.Text + ''',' +
                               'kota_bpkb = ''' + edKotaBPKB.Text + ''',' +
                               'nama_kuitansi = ''' + edNamaKuitansi.Text + ''',' +
                               'alamat_kuitansi = ''' + edAlamatKuitansi.Text + ''',' +
                               'kota_kuitansi = ''' + edKotaKuitansi.Text + ''',' +
                               'head_sales = ''' + edHeadSales.Text + ''','  +
                               'leasing = ''' + edLeasing.Text + ''',' +
                               'sales = ''' + edSales.Text + ''',' +
                               'lunas = ''' + edStatus.Text + ''',' +
                               'lama_angsuran = ''' + FloatToStr(edLamaAngsuran.EditValue) + ''',' +
                               'jumlah_angsuran = ''' + FloatToStr(edJumlahAngsuran.EditValue) + ''' ' +
                               'where id_spk = ''' + edIDSpk.Text + '''');
               qryExec.ExecSQL;

               //simpan data pembeli
               qryFind.Close;
               qryFind.SQL.Clear;
               qryFind.SQL.Add('SELECT * FROM mstr_pembeli ' +
                                'WHERE id_spk = ''' + VarToStr(edIDSpk.EditValue) + '''');
               qryFind.Open;

               if (qryFind.IsEmpty) then
                  begin
                      qryExec.SQL.Clear;
                      qryExec.SQL.Add('INSERT INTO mstr_pembeli VALUES('+
                                      '''' + '' + ''', ' +
                                      '''' + VarToStr(edIDSpk.EditValue) + ''', ' +
                                      '''' + VarToStr(edNamaPembeli.EditValue) + ''', ' +
                                      '''' + VarToStr(edAlamatPembeli.EditValue) + ''', ' +
                                      '''' + VarToStr(edKotaPembeli.EditValue) + ''', ' +
                                      '''' + VarToStr(edTelponPembeli.EditValue) + ''', ' +
                                      '''' + VarToStr(edHPPembeli.EditValue) + ''', ' +
                                      '''' + VarToStr(edNamaBpkb.EditValue) + ''', ' +
                                      '''' + VarToStr(edAlamatBPKB.EditValue) + ''', ' +
                                      '''' + VarToStr(edNoKTP.EditValue) + ''', ' +
                                      '''' + VarToStr(edKotaBPKB.EditValue) + ''', ' +
                                      '''' + FormatDateTime('yyyy-MM-dd', edTglLahir.Date) + ''', ' +
                                      '''' + VarToStr(edNamaKuitansi.EditValue) + ''', ' +
                                      '''' + VarToStr(edAlamatKuitansi.EditValue) + ''', ' +
                                      '''' + VarToStr(edKotaKuitansi.EditValue) + ''', ' +
                                      '''' + VarToStr(ckTglLahir.EditValue) + ''', ' +
                                      '''' + edPekerjaan.Text + ''', ' +
                                      '''' + edBidangUsaha.Text + ''', ' +
                                      '''' + edJabatan.Text + ''', ' +
                                      '''' + edSumberSpk.Text + ''', ' +
                                      '''' + '' + ''', ' +
                                      '''' + edRegSPK.Text + ''', ' +
                                      '''' + edNoKuitansi.Text + ''', ' +
                                      '''' + vartostr(edDiscAwal.EditValue) + ''')');
                      qryExec.ExecSQL;
                  end
               else
                  begin
                      qryExec.SQL.Clear;
                      qryExec.SQL.Add('UPDATE mstr_pembeli SET ' +
                                      'nama_pmbl = ''' + VarToStr(edNamaPembeli.EditValue) + ''', ' +
                                      'alamat_pmbl = ''' + VarToStr(edAlamatPembeli.EditValue) + ''', ' +
                                      'kota_pmbl = ''' + VarToStr(edKotaPembeli.EditValue) + ''', ' +
                                      'telepon_pmbl = ''' + VarToStr(edTelponPembeli.EditValue) + ''', ' +
                                      'mobile_pmbl = ''' + VarToStr(edHPPembeli.EditValue) + ''', ' +
                                      'nama_bpkb = ''' + VarToStr(edNamaBpkb.EditValue) + ''', ' +
                                      'alamat_bpkb = ''' + VarToStr(edAlamatBPKB.EditValue) + ''', ' +
                                      'ktp_bpkb = ''' + VarToStr(edNoKTP.EditValue) + ''', ' +
                                      'kota_bpkb = ''' + VarToStr(edKotaBPKB.EditValue) + ''', ' +
                                      'tgl_lahir = ''' + FormatDateTime('yyyy-MM-dd', edTglLahir.EditValue) + ''', ' +
                                      'check_tgl_lahir = ''' + VarToStr(ckTglLahir.EditValue) + ''', ' +
                                      'nama_kuitansi = ''' + VarToStr(edNamaKuitansi.EditValue) + ''', ' +
                                      'alamat_kuitansi = ''' + VarToStr(edAlamatKuitansi.EditValue) + ''', ' +
                                      'pekerjaan = ''' + edPekerjaan.Text + ''', ' +
                                      'bidang_usaha = ''' + edBidangUsaha.Text + ''', ' +
                                      'jabatan = ''' + edJabatan.Text + ''', ' +
                                      'sumber_spk = ''' + edSumberSpk.Text + ''', ' +
                                      'no_register = ''' + edRegSPK.Text + ''', ' +
                                      'no_kuitansi = ''' + edNoKuitansi.Text + ''', ' +
                                      'disc_awal = ''' + vartostr(edDiscAwal.EditValue) + ''', ' +
                                      'kota_kuitansi = ''' + VarToStr(edKotaKuitansi.EditValue) + ''' ' +
                                      'WHERE id_spk = ''' + VarToStr(edIDSpk.EditValue) + '''');
                      qryExec.ExecSQL;
                  end;

               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from checklist where id_spk = ''' +
                                 edIDSpk.Text + '''');
               qrySearch.Open;
               if (qrySearch.IsEmpty) then
                   begin
                        qryExec.SQL.Clear;
                        qryExec.SQL.Add('insert into checklist values(' +
                                       '''' + frmInputSPK.edIDSpk.Text + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + '' + ''',' +
                                       '''' + '' + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + 'N' + ''',' +
                                       '''' + '2011-01-01' + ''',' +
                                       '''' + 'N' + ''', ' +
                                       '''' + '2011-01-01' + ''')');
                        qryExec.ExecSQL;
                   end;

               //INPUT PROSPEKTIF
               if (edIDProspektif.Text = '') AND (edIDProspektifOld.Text <> '') then
                    begin
                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('update prospektif set ' +
                                         'spk = ''' + 'N' + ''',' +
                                         'id_spk = ''' + '' + ''',' +
                                         'tanggal_spk = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                                         'no_spk = ''' + '' + ''' ' +
                                         'where id_prospektif = ''' + edIDProspektifOld.Text + '''');
                          qryExec.ExecSQL;
                    end;

               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('SELECT * FROM prospektif WHERE id_prospektif = ''' +
                                 edIDProspektif.Text + '''');
               qrySearch.Open;

               if (not qrySearch.IsEmpty) then
                    begin
                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('update prospektif set ' +
                                         'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggalProspektif.Date) + ''',' +
                                         'no_prospektif = ''' + edNoProspektif.Text + ''',' +
                                         'no_ktp = ''' + edNoKTP.Text + ''',' +
                                         'check_tgl_lahir = ''' + VarToStr(ckTglLahir.EditValue) + ''',' +
                                         'tgl_lahir = ''' + FormatDateTime('yyyy-MM-dd', edTglLahir.Date) + ''',' +
                                         'nama_pembeli = ''' + edNamaPembeli.Text + ''',' +
                                         'alamat_pembeli = ''' + edAlamatPembeli.Text + ''',' +
                                         'kota_pembeli = ''' + edKotaPembeli.Text + ''',' +
                                         'telepon_pembeli = ''' + edTelponPembeli.Text + ''',' +
                                         'handphone_pembeli = ''' + edHPPembeli.Text + ''',' +
                                         'head_sales = ''' + edHeadSales.Text + ''','  +
                                         'sales = ''' + edSales.Text + ''',' +
                                         'spk = ''' + 'Y' + ''',' +
                                         'id_spk = ''' + edIDSpk.Text + ''',' +
                                         'tanggal_spk = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
                                         'no_spk = ''' + edNoSPK.Text + ''',' +
                                         'notes = ''' + '' + ''' ' +
                                         'where id_prospektif = ''' + edIDProspektif.Text + '''');
                          qryExec.ExecSQL;
                    end;

               ShowMessage('Data telah berhasil disimpan');
          end;
end;

procedure TfrmInputSPK.btnBatalClick(Sender: TObject);
var
   autorisasi : String;
begin
     if (MessageDlg('Apakah Anda yakin akan membatalkan transaksi ini?',
                    mtConfirmation, mbOKCancel, 0) = mrOK) then
        begin
             qryCari.Close;
             qryCari.SQL.Clear;
             qryCari.SQL.Add('select kode_batal from kode_batal');
             qryCari.Open;
             qryCari.First;
             autorisasi := UpperCase(InputBox('Kode Pembatalan', 'Isi Kode Pembatalan', ''));
             if (autorisasi <> qryCari.Fields[0].AsString) then
                 begin
                     ShowMessage('Maaf Kode Pembatalan Salah');
                     Exit;
                 end;
             with dmDB do
                begin
                    InputAP;
                    qryExec.SQL.Clear;
                    qryExec.SQL.Add('update mstr_spk set ' +
                                    'lunas = ''' + 'BATAL' + ''' ' +
                                    'where id_spk = ''' + edIDSpk.Text + '''');
                    qryExec.ExecSQL;
                    Sleep(100);

                    qryExec.SQL.Clear;
                    qryExec.SQL.Add('update stock set ' +
                                    'id_transaksi = ''' + 'NONE' + ''', ' +
                                    'jual = ''' + 'N' + ''', ' +
                                    'kirim = ''' + 'N' + ''', ' +
                                    'taked = ''' + 'N' + ''' ' +
                                    'where id_kendaraan = ''' + edIDKendaraan.Text + '''');
                    qryExec.ExecSQL;

                end;

                {frmMain.close_clientForm;
                frmMain.close_clientForm;
                frmMain.pgControl.Enabled := True;
                Application.CreateForm(TfrmLogo, frmLogo);
                frmLogo.BorderStyle := bsNone;
                frmLogo.Parent := frmMain.pnlMain;
                frmLogo.Show;
                frmLogo.WindowState := wsMaximized;}
                frmInputSPK.Close;
        end
     else
        begin
            Exit;
        end;
end;

procedure TfrmInputSPK.btnCariSPKClick(Sender: TObject);
begin

     Application.CreateForm(TfrmBrowseTransaksi, frmBrowseTransaksi);
     frmBrowseTransaksi.qryMstrSpk.Active := True;
     frmBrowseTransaksi.qryMstrSpk.Refresh;
     frmBrowseTransaksi.gtbMstrTransaksi.DataController.Refresh;
     frmBrowseTransaksi.ShowModal;

end;

procedure TfrmInputSPK.btnFindClick(Sender: TObject);
var
   idSPK, NoSpk, IdKendaraan : String;
begin
     {NO SPK, NO RANGKA, NO MESIN}
     case cbQuick.ItemIndex of
         0 : NoSpk := edQuickSearch.Text;
         1 : begin
               qryFind.Close;
               qryFind.SQL.Clear;
               qryFind.SQL.Add('select id_kendaraan from stock where no_rangka = ''' +
                    edQuickSearch.Text + '''');
               qryFind.Open;
               IdKendaraan := qryFind.Fields[0].AsString;

               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select no_spk from mstr_spk where id_kendaraan = ''' +
                    IdKendaraan + '''');
               qryCari.Open;
               NoSpk := qryCari.Fields[0].AsString;
             end;
         2 : begin
               qryFind.Close;
               qryFind.SQL.Clear;
               qryFind.SQL.Add('select id_kendaraan from stock where no_mesin = ''' +
                    edQuickSearch.Text + '''');
               qryFind.Open;
               IdKendaraan := qryFind.Fields[0].AsString;

               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select no_spk from mstr_spk where id_kendaraan = ''' +
                    IdKendaraan + '''');
               qryCari.Open;
               NoSpk := qryCari.Fields[0].AsString;
             end;
     end;
     pgPenjualan.ActivePage := pgSPK;
     //idKendaraan := vartostr(gtbMstrTransaksi.DataController.GetValue(recSelect, gtbMstrTransaksiid_kendaraan.Index));
     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from mstr_spk where no_spk = ''' +
                                 NoSpk + ''' and lunas <> ''' + 'BATAL' + '''');
               qrySearch.Open;
               if (qrySearch.Fields[22].AsString = 'BATAL') then
                   begin
                        ShowMessage('MAAF No SPK ' + edQuickSearch.Text + ' Sudah Dibatalkan');
                        Exit;
                   end
               else if (qrySearch.Fields[22].AsString = 'SELESAI') then
                   begin
                        ShowMessage('MAAF No SPK ' + edQuickSearch.Text + ' Sudah Selesai');
                        Exit;
                   end;

               IDKENDARAAN := qrySearch.Fields[3].AsString;
               idSPK := qrySearch.Fields[0].AsString;
               CariLogStock;
               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from stock where id_kendaraan = ''' +
                               IDKENDARAAN + '''');
               qryCari.Open;

               qryFind.Close;
               qryFind.SQL.Clear;
               qryFind.SQL.Add('SELECT * FROM mstr_pembeli ' +
                                'WHERE id_spk = ''' + idSPK + '''');
               qryFind.Open;

               frmInputSPK.edTglLahir.Date := qryFind.Fields[11].AsDateTime;
               frmInputSPK.edPekerjaan.Text := qryFind.Fields[16].AsString;
               frmInputSPK.edBidangUsaha.Text := qryFind.Fields[17].AsString;
               frmInputSPK.edJabatan.Text := qryFind.Fields[18].AsString;
               frmInputSPK.edSumberSpk.Text := qryFind.Fields[19].AsString;
               frmInputSPK.edRegSPK.Text := qryFind.Fields[21].AsString;
               frmInputSPK.edNoKuitansi.Text := qryFind.Fields[22].AsString;
               frmInputSPK.edDiscAwal.EditValue := qryFind.Fields[23].AsFloat;
               if (qryFind.Fields[15].AsString = 'Y') then
                  begin
                      frmInputSPK.ckTglLahir.Checked := True;
                      frmInputSPK.edTglLahir.Visible := True;
                  end
               else
                  begin
                      frmInputSPK.ckTglLahir.Checked := False;
                      frmInputSPK.edTglLahir.Visible := False;
                  end;

               frmInputSPK.edIDSpk.Text := qrySearch.Fields[0].AsString;
               frmInputSPK.edTanggal.Date := qrySearch.Fields[1].AsDateTime;
               frmInputSPK.edNoSPK.Text := qrySearch.Fields[2].AsString;
               frmInputSPK.edStatus.Text := qrySearch.Fields[22].AsString;
               frmInputSPK.edIDKendaraan.Text := qrySearch.Fields[3].AsString;
               frmInputSPK.edPayment.Text := qrySearch.Fields[4].AsString;
               frmInputSPK.edNamaPembeli.Text := qrySearch.Fields[5].AsString;
               frmInputSPK.edAlamatPembeli.Text := qrySearch.Fields[6].AsString;
               frmInputSPK.edKotaPembeli.Text := qrySearch.Fields[7].AsString;
               frmInputSPK.edTelponPembeli.Text := qrySearch.Fields[8].AsString;
               frmInputSPK.edHPPembeli.Text := qrySearch.Fields[9].AsString;
               frmInputSPK.edNamaBpkb.Text := qrySearch.Fields[10].AsString;
               frmInputSPK.edAlamatBPKB.Text := qrySearch.Fields[11].AsString;
               frmInputSPK.edNoKTP.Text := qrySearch.Fields[12].AsString;
               frmInputSPK.edKotaBPKB.Text := qrySearch.Fields[13].AsString;
               frmInputSPK.edNamaKuitansi.Text := qrySearch.Fields[14].AsString;
               frmInputSPK.edAlamatKuitansi.Text := qrySearch.Fields[15].AsString;
               frmInputSPK.edKotaKuitansi.Text := qrySearch.Fields[16].AsString;
               frmInputSPK.edHeadSales.Text := qrySearch.Fields[17].AsString;
               frmInputSPK.edSales.Text := qrySearch.Fields[18].AsString;
               frmInputSPK.edLeasing.Text := qrySearch.Fields[19].AsString;
               frmInputSPK.edLamaAngsuran.EditValue := qrySearch.Fields[20].AsFloat;
               frmInputSPK.edJumlahAngsuran.EditValue := qrySearch.Fields[21].AsFloat;

               frmInputSPK.edTypeKendaraan.EditValue := qryCari.Fields[4].AsString;
               frmInputSPK.edNoRangka.Text := qryCari.Fields[2].AsString;
               frmInputSPK.edNoMesin.Text := qryCari.Fields[3].AsString;
               frmInputSPK.edWarna.Text := qryCari.Fields[5].AsString;
               frmInputSPK.edStatusStock.Text := qryCari.Fields[1].AsString;


               STRSQL := 'select penjualan from checklist where id_spk = ''' +
                          edIDSpk.Text + '''';
               PREPARE_TEMP;
               if (qryTemp.IsEmpty) then edLeasing.Properties.ReadOnly := False
               else if (NOT qryTemp.IsEmpty) then
                   begin
                         if (qryTemp.Fields[0].AsString = 'Y') then
                             begin
                                  edLeasing.Properties.ReadOnly := True;
                                  edHeadSales.Properties.ReadOnly := True;
                                  edSales.Properties.ReadOnly := True;
                                  edJumlahAngsuran.Properties.ReadOnly := True;
                                  edLamaAngsuran.Properties.ReadOnly := True;
                             end
                         else if (qryTemp.Fields[0].AsString = 'N') then
                             begin
                                  edLeasing.Properties.ReadOnly := False;
                                  edHeadSales.Properties.ReadOnly := False;
                                  edSales.Properties.ReadOnly := False;
                                  edJumlahAngsuran.Properties.ReadOnly := False;
                                  edLamaAngsuran.Properties.ReadOnly := False;
                             end;
                   end;


          end;
     edQuickSearch.SelectAll;
end;

procedure TfrmInputSPK.btnHomeClick(Sender: TObject);
begin
     pgPenjualan.ActivePage := pgSPK;
end;

procedure TfrmInputSPK.btnNewClick(Sender: TObject);
begin
     edTanggal.Date := Date;
     edNamaPembeli.Clear;
     edAlamatPembeli.Clear;
     edKotaPembeli.Clear;
     edNamaBpkb.Clear;
     edAlamatBPKB.Clear;
     edKotaBPKB.Clear;
     edNamaKuitansi.Clear;
     edAlamatKuitansi.Clear;
     edKotaKuitansi.Clear;
     edTelponPembeli.Clear;
     edHPPembeli.Clear;
     edNoKTP.Clear;
     edIDKendaraan.Clear;
     edIDSpk.Clear;
     edNoRangka.Clear;
     edNoMesin.Clear;
     edWarna.Clear;
     edLeasing.Clear;
     edLamaAngsuran.EditValue := 0;
     edJumlahAngsuran.EditValue := 0;
     edPayment.Text := 'TUNAI';
     edHeadSales.Clear;
     edSales.Clear;
     edStatusStock.Clear;
     edStatus.Text := 'AKTIF';
     TR_FAKTUR := CreateNewAutoNum;
     edIDSpk.Text := TR_FAKTUR;

     with dmDB do
          begin
               qryExec.SQL.Clear;
               qryExec.SQL.Add('insert into mstr_spk values(' +
                               '''' + edIDSpk.Text + ''',' +
                               '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '' + ''',' +
                               '''' + '0' + ''',' +
                               '''' + '0' + ''',' +
                               '''' + 'AKTIF' + ''')');
               qryExec.ExecSQL;
          end;
    frmInputSPK.edLeasing.Properties.ReadOnly := False;
    frmInputSPK.edHeadSales.Properties.ReadOnly := False;
    frmInputSPK.edSales.Properties.ReadOnly := False;
    frmInputSPK.edJumlahAngsuran.Properties.ReadOnly := False;
    frmInputSPK.edLamaAngsuran.Properties.ReadOnly := False;
end;

procedure TfrmInputSPK.btnPilihKendaraanClick(Sender: TObject);
begin
     //
end;

procedure TfrmInputSPK.btnTTSClick(Sender: TObject);
begin
     //Application.CreateForm(TfrmInputTTS, frmInputTTS);
     ClosePageForm;
     Application.CreateForm(TfrmInputTTS, frmInputTTS);
     frmInputTTS.BorderStyle := bsNone;
     frmInputTTS.Parent := frmInputSPK.pgDetail;
     frmInputTTS.Show;
     frmInputTTS.WindowState := wsMaximized;

     pgPenjualan.ActivePage := pgDetail;
     with dmDB do
          begin
               qryExec.SQL.Clear;
               qryExec.SQL.Add('update mstr_spk set ' +
                               'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
                               'no_spk = ''' + edNoSPK.Text + ''',' +
                               'id_kendaraan = ''' + edIDKendaraan.Text + ''',' +
                               'payment = ''' + edPayment.Text + ''',' +
                               'nama_pembeli = ''' + edNamaPembeli.Text + ''',' +
                               'alamat_pembeli = ''' + edAlamatPembeli.Text + ''',' +
                               'telepon_pembeli = ''' + edTelponPembeli.Text + ''',' +
                               'handphone_pembeli = ''' + edHPPembeli.Text + ''',' +
                               'nama_bpkb = ''' + edNamaBpkb.Text + ''',' +
                               'alamat_bpkb = ''' + edAlamatBPKB.Text + ''',' +
                               'ktp_bpkb = ''' + edNoKTP.Text + ''',' +
                               'kota_bpkb = ''' + edKotaBPKB.Text + ''',' +
                               'nama_kuitansi = ''' + edNamaKuitansi.Text + ''',' +
                               'alamat_kuitansi = ''' + edAlamatKuitansi.Text + ''',' +
                               'kota_kuitansi = ''' + edKotaKuitansi.Text + ''',' +
                               'head_sales = ''' + edHeadSales.Text + ''','  +
                               'sales = ''' + edSales.Text + ''',' +
                               'leasing = ''' + edLeasing.Text + ''',' +
                               'lama_angsuran = ''' + FloatToStr(edLamaAngsuran.EditValue) + ''',' +
                               'jumlah_angsuran = ''' + FloatToStr(edJumlahAngsuran.EditValue) + ''' ' +
                               'where id_spk = ''' + edIDSpk.Text + '''');
               qryExec.ExecSQL;
          end;

     frmInputTTS.qryTTS.Close;
     frmInputTTS.qryTTS.SQL.Clear;
     frmInputTTS.qryTTS.SQL.Add('select * from mstr_tts where id_spk = ''' +
                frmInputSPK.edIDSpk.Text + '''');
     frmInputTTS.qryTTS.Open;
     frmInputTTS.gtbTTS.DataController.Refresh;

     frmInputTTS.edTTSIDSPK.Text := frmInputSPK.edIDSpk.Text;
     frmInputTTS.edNoSPKTTS.Text := frmInputSPK.edNoSPK.Text;
     frmInputTTS.edTypeTTS.Text := frmInputSPK.edTypeKendaraan.Text;
     frmInputTTS.edWarnaTTS.Text := frmInputSPK.edWarna.Text;
     frmInputTTS.edNamaTTS.Text := frmInputSPK.edNamaKuitansi.Text;
     frmInputTTS.edAlamatTTS.Text := frmInputSPK.edAlamatKuitansi.Text;
     frmInputTTS.edKotaTTS.Text := frmInputSPK.edKotaKuitansi.Text;
     frmInputTTS.edTglTTS.Date := Date;
     frmInputTTS.edTglTTS.SetFocus;
     //frmInputTTS.ShowModal;
end;

procedure TfrmInputSPK.ckProspektifPropertiesChange(Sender: TObject);
begin
      if (ckProspektif.Checked = False) then
          begin
                edIDProspektif.Clear;
                edTanggalProspektif.Date := Date;
                edNoProspektif.Clear;
          end;
end;

procedure TfrmInputSPK.ckTglLahirPropertiesChange(Sender: TObject);
begin
     if (ckTglLahir.Checked = True) then
         begin
              edTglLahir.Visible := True;
         end
     else
         begin
              edTglLahir.Visible := False;
         end;
end;

procedure TfrmInputSPK.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     qrySPK1.Free;
     qrySPK2.Free;
     qrySearch.Free;
     qryTemp.Free;
     qryCari.Free;
     qryExec.Free;
     qryFind.Free;
     //qrySPK1, qrySPK2, qrySearch, qryExec, qryCari, qryTemp, qryFind : TMyQuery;
     Action := caFree;
end;

procedure TfrmInputSPK.FormCreate(Sender: TObject);
begin
     tblMstrSales.Active := True;
     tblJenis.Active := True;
     tblLeasing.Active := True;
     TR_STORE := 'T';
     TR_PERIODE := FormatDateTime('ddMMyy', Date);
     TR_NUMBER := '001';
     edTanggal.Date := Date;
     edTglLahir.Date := StrToDate('01/01/1970');
     edTanggalProspektif.Date := Date;

     qrySPK2 := TMyQuery.Create(Self);
     qrySPK2.Connection := DMDB.dbInternal;
     qrySPK2.SQL.Add('select * from emptyx');
     qrySPK2.Active := true;

     qrySPK1 := TMyQuery.Create(Self);
     qrySPK1.Connection := DMDB.dbInternal;
     qrySPK1.SQL.Add('select * from emptyx');
     qrySPK1.Active := true;

     {dmDB.MstrSales.Close;
     dmDB.MstrSales.SQL.Clear;
     dmDB.MstrSales.SQL.Add('select * from staff where nama_depart = ''' + 'Y' + '''');
     dmDB.MstrSales.Open;}

     //qrySPK1, qrySPK2, qrySearch, qryExec, qryCari, qryTemp, qryFind : TMyQuery;
     qrySearch := TMyQuery.Create(Self);
     qrySearch.Connection := DMDB.dbInternal;
     qrySearch.SQL.Add('select * from emptyx');
     qrySearch.Active := true;

     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from emptyx');
     qryExec.Active := true;

     qryCari := TMyQuery.Create(Self);
     qryCari.Connection := DMDB.dbInternal;
     qryCari.SQL.Add('select * from emptyx');
     qryCari.Active := true;

     qryTemp := TMyQuery.Create(Self);
     qryTemp.Connection := DMDB.dbInternal;
     qryTemp.SQL.Add('select * from emptyx');
     qryTemp.Active := true;

     qryFind := TMyQuery.Create(Self);
     qryFind.Connection := DMDB.dbInternal;
     qryFind.SQL.Add('select * from emptyx');
     qryFind.Active := true;

end;

procedure TfrmInputSPK.FormShow(Sender: TObject);
var
  i: Integer;
begin
     cbQuick.ItemIndex := 0;
     frmInputSPK.pgPenjualan.HideTabs := True;
     with dmDB do
          begin
               STRSQL := 'select sumber_spk from sumber_spk';
               PREPARE_TEMP;
               qryTemp.First;
               for i := 0 to qryTemp.RecordCount - 1 do
                   begin
                        frmInputSPK.edSumberSpk.Properties.Items.Add(qryTemp.Fields[0].AsString);
                        qryTemp.Next;
                   end;
          end;
     pgPenjualan.ActivePage := pgSPK;
end;

procedure TfrmInputSPK.pgPenjualanPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
     case pgPenjualan.ActivePageIndex of
          0 : begin

              end;
          1 : begin

              end;
          2 : begin

              end;

     end;
end;

end.
