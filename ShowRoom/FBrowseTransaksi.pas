unit FBrowseTransaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxCalendar, StdCtrls, Menus, cxButtons, cxCalc, cxDBLookupComboBox,
  cxContainer, cxCheckBox, cxMaskEdit, cxDropDownEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, DBAccess, MyAccess;

type
  TfrmBrowseTransaksi = class(TForm)
    gtbMstrTransaksi: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    btnSelect: TcxButton;
    btnView: TcxButton;
    gtbMstrTransaksiid_spk: TcxGridDBColumn;
    gtbMstrTransaksitanggal: TcxGridDBColumn;
    gtbMstrTransaksino_spk: TcxGridDBColumn;
    gtbMstrTransaksiid_kendaraan: TcxGridDBColumn;
    gtbMstrTransaksipayment: TcxGridDBColumn;
    gtbMstrTransaksinama_pembeli: TcxGridDBColumn;
    gtbMstrTransaksialamat_pembeli: TcxGridDBColumn;
    gtbMstrTransaksikota_pembeli: TcxGridDBColumn;
    gtbMstrTransaksitelepon_pembeli: TcxGridDBColumn;
    gtbMstrTransaksihandphone_pembeli: TcxGridDBColumn;
    gtbMstrTransaksinama_bpkb: TcxGridDBColumn;
    gtbMstrTransaksialamat_bpkb: TcxGridDBColumn;
    gtbMstrTransaksiktp_bpkb: TcxGridDBColumn;
    gtbMstrTransaksikota_bpkb: TcxGridDBColumn;
    gtbMstrTransaksinama_kuitansi: TcxGridDBColumn;
    gtbMstrTransaksialamat_kuitansi: TcxGridDBColumn;
    gtbMstrTransaksikota_kuitansi: TcxGridDBColumn;
    gtbMstrTransaksilunas: TcxGridDBColumn;
    gtbMstrTransaksihead_sales: TcxGridDBColumn;
    gtbMstrTransaksisales: TcxGridDBColumn;
    gtbMstrTransaksileasing: TcxGridDBColumn;
    gtbMstrTransaksilama_angsuran: TcxGridDBColumn;
    gtbMstrTransaksijumlah_angsuran: TcxGridDBColumn;
    gtbMstrTransaksiColumn1: TcxGridDBColumn;
    gtbMstrTransaksiColumn2: TcxGridDBColumn;
    ckLimit: TcxCheckBox;
    edLimit: TcxCalcEdit;
    cxButton1: TcxButton;
    dsQryMstrSPK: TMyDataSource;
    qryMstrSpk: TMyQuery;
    procedure btnViewClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure ckLimitPropertiesChange(Sender: TObject);
    procedure edLimitKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qrySPK1, qrySPK2, qrySearch, qryCari, qryFind, qryTemp : TMyQuery;
    STRSQL : String;
    procedure PREPARE_TEMP;
    procedure PREPARE_FIND;
    procedure PREPARE_CARI;
    procedure PREPARE_SEARCH;
  public
    { Public declarations }
  end;

var
  frmBrowseTransaksi: TfrmBrowseTransaksi;

implementation

{$R *.dfm}

uses FdmDB, FMain, FInputSPK;

procedure TfrmBrowseTransaksi.PREPARE_TEMP;
begin
     qryTemp.Close;
     qryTemp.SQL.Clear;
     qryTemp.SQL.Add(STRSQL);
     qryTemp.Open;
     qryTemp.First;
end;

procedure TfrmBrowseTransaksi.PREPARE_FIND;
begin
     qryFind.Close;
     qryFind.SQL.Clear;
     qryFind.SQL.Add(STRSQL);
     qryFind.Open;
     qryFind.First;
end;

procedure TfrmBrowseTransaksi.PREPARE_CARI;
begin
     qryCari.Close;
     qryCari.SQL.Clear;
     qryCari.SQL.Add(STRSQL);
     qryCari.Open;
     qryCari.First;
end;

procedure TfrmBrowseTransaksi.PREPARE_SEARCH;
begin
     qrySearch.Close;
     qrySearch.SQL.Clear;
     qrySearch.SQL.Add(STRSQL);
     qrySearch.Open;
     qrySearch.First;
end;

procedure TfrmBrowseTransaksi.btnSelectClick(Sender: TObject);
var
   recSelect : Integer;
   idSPK, idKendaraan : String;
begin
     recSelect := gtbMstrTransaksi.DataController.GetFocusedRecordIndex;
     idSPK := vartostr(gtbMstrTransaksi.DataController.GetValue(recSelect, gtbMstrTransaksiid_spk.Index));
     idKendaraan := vartostr(gtbMstrTransaksi.DataController.GetValue(recSelect, gtbMstrTransaksiid_kendaraan.Index));
     frmInputSPK.IDKENDARAAN := vartostr(gtbMstrTransaksi.DataController.GetValue(recSelect, gtbMstrTransaksiid_kendaraan.Index));
     frmInputSPK.CariLogStock;
     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from mstr_spk where id_spk = ''' +
                                 idSPK + '''');
               qrySearch.Open;

               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from stock where id_kendaraan = ''' +
                               idKendaraan + '''');
               qryCari.Open;

               qryFind.Close;
               qryFind.SQL.Clear;
               qryFind.SQL.Add('SELECT * FROM mstr_pembeli ' +
                                'WHERE id_spk = ''' + idSPK + '''');
               qryFind.Open;

               //frmInputSPK.ckTglLahir.EditValue := qryFind.Fields[15].AsString;
               frmInputSPK.edTglLahir.Date := qryFind.Fields[11].AsDateTime;
               frmInputSPK.edPekerjaan.Text := qryFind.Fields[16].AsString;
               frmInputSPK.edBidangUsaha.Text := qryFind.Fields[17].AsString;
               frmInputSPK.edJabatan.Text := qryFind.Fields[18].AsString;
               frmInputSPK.edSumberSpk.Text := qryFind.Fields[19].AsString;
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

               //PROSPEKTIF
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('SELECT * FROM prospektif WHERE id_spk = ''' +
                                 idSPK + '''');
               qrySearch.Open;

               if (not qrySearch.IsEmpty) then
                    begin
                         frmInputSPK.ckProspektif.Checked := True;
                         frmInputSPK.edIDProspektif.Text := qrySearch.Fields[0].AsString;
                         frmInputSPK.edTanggalProspektif.Date := qrySearch.Fields[1].AsDateTime;
                         frmInputSPK.edNoProspektif.Text  := qrySearch.Fields[2].Text;
                         frmInputSPK.edIDProspektifOld.Text := qrySearch.Fields[0].AsString;
                    end
               else
                    begin
                         frmInputSPK.ckProspektif.Checked := False;
                         frmInputSPK.edIDProspektif.Clear;
                         frmInputSPK.edTanggalProspektif.Date := Date;
                         frmInputSPK.edNoProspektif.Clear;
                         frmInputSPK.edIDProspektifOld.Clear;
                    end;
               with dmDB do
          begin
               STRSQL := 'select penjualan from checklist where id_spk = ''' +
                          frmInputSPK.edIDSpk.Text + '''';
               PREPARE_TEMP;
               if (qryTemp.IsEmpty) then frmInputSPK.edLeasing.Properties.ReadOnly := False
               else if (NOT qryTemp.IsEmpty) then
                   begin
                         if (qryTemp.Fields[0].AsString = 'Y') then
                             begin
                                  frmInputSPK.edLeasing.Properties.ReadOnly := True;
                                  frmInputSPK.edHeadSales.Properties.ReadOnly := True;
                                  frmInputSPK.edSales.Properties.ReadOnly := True;
                                  frmInputSPK.edJumlahAngsuran.Properties.ReadOnly := True;
                                  frmInputSPK.edLamaAngsuran.Properties.ReadOnly := True;
                             end
                         else if (qryTemp.Fields[0].AsString = 'N') then
                             begin
                                  frmInputSPK.edLeasing.Properties.ReadOnly := False;
                                  frmInputSPK.edHeadSales.Properties.ReadOnly := False;
                                  frmInputSPK.edSales.Properties.ReadOnly := False;
                                  frmInputSPK.edJumlahAngsuran.Properties.ReadOnly := False;
                                  frmInputSPK.edLamaAngsuran.Properties.ReadOnly := False;
                             end;
                   end;
          end;
          end;
     frmInputSPK.pgPenjualan.ActivePage := frmInputSPK.pgSPK;
     frmBrowseTransaksi.Close;
end;

procedure TfrmBrowseTransaksi.btnViewClick(Sender: TObject);
begin
     if  (btnView.Caption = 'Expand') then
          begin
               gtbMstrTransaksi.ViewData.Expand(True);
               btnView.Caption := 'Collapse'
          end
     else if (btnView.Caption = 'Collapse') then
          begin
               gtbMstrTransaksi.ViewData.Collapse(True);
               btnView.Caption := 'Expand';
          end;
end;

procedure TfrmBrowseTransaksi.ckLimitPropertiesChange(Sender: TObject);
begin
     if (ckLimit.Checked = True) then
         begin
              qryMstrSpk.Close;
              qryMstrSpk.SQL.Clear;
              qryMstrSpk.SQL.Add('select * from mstr_spk where lunas <> ''' + 'BATAL' +
                                      ''' and lunas <> ''' + 'SELESAI'  + ''' ORDER BY tanggal DESC LIMIT ' + inttostr(edLimit.EditValue));
              qryMstrSpk.Open;
              frmBrowseTransaksi.gtbMstrTransaksi.DataController.Refresh;
         end
     else if (ckLimit.Checked = False) then
         begin
              qryMstrSpk.Close;
              qryMstrSpk.SQL.Clear;
              qryMstrSpk.SQL.Add('select * from mstr_spk where lunas <> ''' + 'BATAL' +
                                      ''' and lunas <> ''' + 'SELESAI'  + ''' ORDER BY tanggal DESC');
              qryMstrSpk.Open;
              frmBrowseTransaksi.gtbMstrTransaksi.DataController.Refresh;
         end;
end;

procedure TfrmBrowseTransaksi.cxButton1Click(Sender: TObject);
begin
     if (ckLimit.Checked = True) then
         begin
              qryMstrSpk.Close;
              qryMstrSpk.SQL.Clear;
              qryMstrSpk.SQL.Add('select * from mstr_spk where lunas <> ''' + 'BATAL' +
                                      ''' and lunas <> ''' + 'SELESAI'  + ''' ORDER BY tanggal DESC LIMIT ' + inttostr(edLimit.EditValue));
              qryMstrSpk.Open;
              frmBrowseTransaksi.gtbMstrTransaksi.DataController.Refresh;
         end
     else if (ckLimit.Checked = False) then
         begin
              qryMstrSpk.Close;
              qryMstrSpk.SQL.Clear;
              qryMstrSpk.SQL.Add('select * from mstr_spk where lunas <> ''' + 'BATAL' +
                                      ''' and lunas <> ''' + 'SELESAI'  + ''' ORDER BY tanggal DESC');
              qryMstrSpk.Open;
              frmBrowseTransaksi.gtbMstrTransaksi.DataController.Refresh;
         end;
end;

procedure TfrmBrowseTransaksi.edLimitKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              if (ckLimit.Checked = True) then
         begin
              qryMstrSpk.Close;
              qryMstrSpk.SQL.Clear;
              qryMstrSpk.SQL.Add('select * from mstr_spk where lunas <> ''' + 'BATAL' +
                                      ''' and lunas <> ''' + 'SELESAI'  + ''' ORDER BY tanggal DESC LIMIT ' + inttostr(edLimit.EditValue));
              qryMstrSpk.Open;
              frmBrowseTransaksi.gtbMstrTransaksi.DataController.Refresh;
         end
     else if (ckLimit.Checked = False) then
         begin
              qryMstrSpk.Close;
              qryMstrSpk.SQL.Clear;
              qryMstrSpk.SQL.Add('select * from mstr_spk where lunas <> ''' + 'BATAL' +
                                      ''' and lunas <> ''' + 'SELESAI'  + ''' ORDER BY tanggal DESC');
              qryMstrSpk.Open;
              frmBrowseTransaksi.gtbMstrTransaksi.DataController.Refresh;
         end;
         end;
end;

procedure TfrmBrowseTransaksi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //qrySPK1, qrySPK2, qrySearch, qryCari, qryFind, qryTemp : TMyQuery;
     qrySPK1.Free;
     qrySPK2.Free;
     qrySearch.Free;
     qryCari.Free;
     qryFind.Free;
     qryTemp.Free;
     Action := caFree;
end;

procedure TfrmBrowseTransaksi.FormCreate(Sender: TObject);
begin
     {qryMstrSpk.Refresh;
     gtbMstrTransaksi.DataController.Refresh;}
     //qrySPK1, qrySPK2, qrySearch, qryCari, qryFind, qryTemp : TMyQuery;

     qrySPK1 := TMyQuery.Create(Self);
     qrySPK1.Connection := DMDB.dbInternal;
     qrySPK1.SQL.Add('select * from temptable');
     qrySPK1.Active := true;

     qrySPK2 := TMyQuery.Create(Self);
     qrySPK2.Connection := DMDB.dbInternal;
     qrySPK2.SQL.Add('select * from temptable');
     qrySPK2.Active := true;

     qrySearch := TMyQuery.Create(Self);
     qrySearch.Connection := DMDB.dbInternal;
     qrySearch.SQL.Add('select * from temptable');
     qrySearch.Active := true;

     qryCari := TMyQuery.Create(Self);
     qryCari.Connection := DMDB.dbInternal;
     qryCari.SQL.Add('select * from temptable');
     qryCari.Active := true;

     qryFind := TMyQuery.Create(Self);
     qryFind.Connection := DMDB.dbInternal;
     qryFind.SQL.Add('select * from temptable');
     qryFind.Active := true;

     qryTemp := TMyQuery.Create(Self);
     qryTemp.Connection := DMDB.dbInternal;
     qryTemp.SQL.Add('select * from temptable');
     qryTemp.Active := true;
end;

end.
