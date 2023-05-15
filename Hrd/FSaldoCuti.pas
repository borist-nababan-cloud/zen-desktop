unit FSaldoCuti;

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
  cxMaskEdit, cxDropDownEdit, cxCalc, DBAccess, MyAccess, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxLabel,
  cxGroupBox, DateUtils, strUtils;

type
  TfrmSaldoCuti = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edKode: TEdit;
    edID: TEdit;
    Label3: TLabel;
    edNama: TEdit;
    btnFind: TButton;
    edTahun: TComboBox;
    Label5: TLabel;
    edJumlah: TcxCalcEdit;
    Label6: TLabel;
    btnSimpan: TButton;
    Label13: TLabel;
    edQuickSearch: TcxTextEdit;
    gbHistory: TcxGroupBox;
    lblSaldo: TcxLabel;
    lblTerpakai: TcxLabel;
    btnClose: TButton;
    Label7: TLabel;
    edRevisi: TcxCalcEdit;
    memStruktur: TMemo;
    procedure btnFindClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edQuickSearchKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure edTahunChange(Sender: TObject);
  private
    { Private declarations }
    qryCuti1, qryExec, qryCuti2 : TMyQuery;
    procedure ClearForm;

  public
    { Public declarations }
    ISADMIN : Boolean;
    procedure CariCuti(var kodekaryawan : String);
  end;

var
  frmSaldoCuti: TfrmSaldoCuti;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterKaryawan;

procedure TfrmSaldoCuti.ClearForm;
begin
  edKode.Clear;
  edQuickSearch.Clear;
  edID.Clear;
  edTahun.Clear;
  edNama.Clear;
  edJumlah.EditValue := 0;
  edRevisi.EditValue := 0;
  lblSaldo.Caption := '';
  lblTerpakai.Caption := '';
  gbHistory.Caption := '';
end;

procedure TfrmSaldoCuti.CariCuti(var kodekaryawan : String);
var
  iTahun : Integer;
begin
  iTahun := YearOf(Date);
  {qryCuti1.Close;
  qryCuti1.SQL.Clear;
  qryCuti1.SQL.Add('select sisa from ben_saldo_cuti where kodekaryawan = ''' +
     edKode.Text + ''' AND tahun = ''' + inttostr(iTahun) + '''');
  qryCuti1.Open;
  edSaldo.EditValue := qryCuti1.Fields[0].AsInteger;
  edSisa.EditValue := edSaldo.EditValue - edJumlah.EditValue;}
  qryCuti1.Close;
  qryCuti1.SQL.Clear;
  qryCuti1.SQL.Add('select count(tanggal) from ben_presensi_cuti where year(tanggal) = year(CURRENT_DATE) ' +
         'AND kodekaryawan = ''' + kodekaryawan + '''');
  qryCuti1.Open;
  lblTerpakai.Caption := 'Jumlah Terpakai ' + IntToStr(qryCuti1.Fields[0].AsInteger) + ' Hari';

  qryCuti2.Close;
  qryCuti2.SQL.Clear;
  qryCuti2.SQL.Add('select saldoawal from ben_saldo_cuti where kodekaryawan = ''' +
     kodekaryawan + ''' AND tahun = ''' + inttostr(iTahun) + '''');
  qryCuti2.Open;
  lblSaldo.Caption := 'Saldo Awal ' + IntToStr(qryCuti2.Fields[0].AsInteger) + ' Hari';
  edJumlah.EditValue := qryCuti2.Fields[0].AsInteger - qryCuti1.Fields[0].AsInteger;
end;

procedure TfrmSaldoCuti.btnCloseClick(Sender: TObject);
begin
  frmSaldoCuti.Close;
end;

procedure TfrmSaldoCuti.btnFindClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 3;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
      frmMasterKaryawan.Position := poDesktopCenter;
    end
  else if (frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 3;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
      frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmSaldoCuti.btnSimpanClick(Sender: TObject);
var
   selisih : Integer;
begin
  if (edTahun.Text = '') then Exit;
  qryCuti1.Close;
  qryCuti1.SQL.Clear;
  qryCuti1.SQL.Add('select autonum from ben_saldo_cuti where kodekaryawan = ''' +
      edKode.Text + ''' AND tahun = ''' + edTahun.Text + '''');
  qryCuti1.Open;
  if (qryCuti1.IsEmpty) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into ben_saldo_cuti values(' +
       '''' + '' + ''',' +
       '''' + edKode.Text + ''',' +
       '''' + edID.Text + ''',' +
       '''' + edTahun.Text + ''',' +
       '''' + vartostr(edRevisi.EditValue) + ''',' +
       '''' + vartostr(edRevisi.EditValue) + ''',' +
       '''' + frmMain.USERAPPS + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
       '''' + 'I' + ''');');
    end
  else if (NOT qryCuti1.IsEmpty) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('update ben_saldo_cuti set ' +
       'saldoawal = ''' + vartostr(edRevisi.EditValue) + ''',' +
       'sisa = ''' + vartostr(edRevisi.EditValue) + ''',' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
       'tag = ''' + 'E' + ''' ' +
       'where autonum = ''' + inttostr(qryCuti1.Fields[0].AsInteger) + ''';');
    end;
  selisih := edRevisi.EditValue - edJumlah.EditValue;
  qryExec.SQL.Add('insert into ben_saldo_cuti_history values(' +
      '''' + '' + ''',' +
      '''' + edKode.Text + ''',' +
       '''' + edID.Text + ''',' +
       '''' + edTahun.Text + ''',' +
       '''' + vartostr(edJumlah.EditValue) + ''',' +
       '''' + vartostr(edRevisi.EditValue) + ''',' +
       '''' + vartostr(selisih) + ''',' +
       '''' + '' + ''',' +
       '''' + frmMain.USERAPPS + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
  qryExec.ExecSQL;
  ShowMessage('Data Saldo Berhasil Di Update');
  //frmSaldoCuti.Close;
  ClearForm;
end;

procedure TfrmSaldoCuti.edQuickSearchKeyPress(Sender: TObject; var Key: Char);
var
  strSearch, kodekaryawan : String;
begin
   if (key = #13) then
        begin
          case Length(edQuickSearch.Text) of
           1 : strSearch := '0000' + edQuickSearch.Text;
           2 : strSearch := '000' + edQuickSearch.Text;
           3 : strSearch := '00' + edQuickSearch.Text;
           4 : strSearch := '0' + edQuickSearch.Text;
           5 : strSearch := edQuickSearch.Text;
          end;
         qryCuti1.Close;
         qryCuti1.SQL.Clear;
         qryCuti1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen ' +
           'from ben_hrd_karyawan_info where idkaryawan = ' + QuotedStr(strSearch) +
           ' and active = ''' + 'Y' + '''');
         qryCuti1.Open;
         if (qryCuti1.IsEmpty) then
           begin
             ShowMessage('ID Finger Tidak Ditemukan !');
             Exit;
           end;
         edKode.Text := qryCuti1.Fields[0].AsString;
         edID.Text := qryCuti1.Fields[1].AsString;
         edNama.Text := qryCuti1.Fields[2].AsString;
         //edDivisi.EditValue := qryCuti1.Fields[3].AsString;
         edQuickSearch.Clear;
         kodekaryawan := edKode.Text;
         CariCuti(kodekaryawan);
         //edTglPengajuan.SetFocus;
     end;
end;

procedure TfrmSaldoCuti.edTahunChange(Sender: TObject);
var
   tglCari : TDate;
begin
  tglCari := EncodeDate(StrToInt(edTahun.Text), 01, 01);
  qryCuti1.Close;
  qryCuti1.SQL.Clear;
  qryCuti1.SQL.Add('select count(tanggal) from ben_presensi_cuti where year(''' +
      FormatDateTime('yyyy-MM-dd', tglCari) + ''') = year(''' +
      FormatDateTime('yyyy-MM-dd', tglCari) + ''')' +
         'AND kodekaryawan = ''' + edKode.Text + '''');
  qryCuti1.Open;
  gbHistory.Caption := 'Saldo Cuti Tahun ' + edTahun.Text;
  lblTerpakai.Caption := 'Jumlah Terpakai ' + IntToStr(qryCuti1.Fields[0].AsInteger) + ' Hari';

  qryCuti2.Close;
  qryCuti2.SQL.Clear;
  qryCuti2.SQL.Add('select saldoawal from ben_saldo_cuti where kodekaryawan = ''' +
     edKode.Text + ''' AND tahun = ''' + edTahun.Text + '''');
  qryCuti2.Open;
  lblSaldo.Caption := 'Saldo Awal ' + IntToStr(qryCuti2.Fields[0].AsInteger) + ' Hari';
  edJumlah.EditValue := qryCuti2.Fields[0].AsInteger - qryCuti1.Fields[0].AsInteger;
end;

procedure TfrmSaldoCuti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryCuti1.Free;
   qryCuti2.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmSaldoCuti.FormCreate(Sender: TObject);
var
  intTahun : Integer;
begin
  intTahun := YearOf(Date);
  qryCuti1 := TMyQuery.Create(Self);
  qryCuti1.Connection := DMDB.dbInternal;
  qryCuti1.SQL.Add('select * from temptable');
  qryCuti1.Active := true;

  qryCuti2 := TMyQuery.Create(Self);
  qryCuti2.Connection := DMDB.dbInternal;
  qryCuti2.SQL.Add('select * from temptable');
  qryCuti2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;
  edTahun.Text := IntToStr(intTahun);

  gbHistory.Caption := 'Saldo Cuti Tahun ' + FormatDateTime('yyyy', Date);

  qryCuti1.Close;
  qryCuti1.SQL.Clear;
  qryCuti1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_saldo_cuti_history'));
  qryCuti1.Open;
  if (qryCuti1.IsEmpty) then
  begin
    qryExec.SQL.Clear;
    qryExec.SQL.Add(memStruktur.Text);
    qryExec.ExecSQL;
  end;
                                               ;
end;

end.
