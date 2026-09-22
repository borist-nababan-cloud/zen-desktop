unit FIjinKeluar;

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
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DB, DBAccess, cxCalc, Menus, cxButtons, cxCalendar, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls,
  dxCore, cxDateUtils, MemDS, MyAccess;

type
  TfrmIjinKeluar = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edKode: TEdit;
    edID: TEdit;
    edNama: TEdit;
    btnFind: TButton;
    Label1: TLabel;
    tblTag: TMyQuery;
    dsTblTag: TDataSource;
    Label5: TLabel;
    edSearchID: TcxTextEdit;
    Label6: TLabel;
    edDepartemen: TEdit;
    Label7: TLabel;
    edJam: TcxCalcEdit;
    Label8: TLabel;
    memoStruktur1: TMemo;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label9: TLabel;
    edTanggal: TcxDateEdit;
    Label10: TLabel;
    edKeterangan: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edSearchIDKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFindClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    noIjin : String;
    qrykeluar1, qryKeluar2, qryExec : TMyQuery;
    procedure CetakData();
  public
    { Public declarations }
  end;

var
  frmIjinKeluar: TfrmIjinKeluar;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterKaryawan, FIjinLainCetak;

procedure TfrmIjinKeluar.CetakData;
begin
  Application.CreateForm(TfrmIjinLainCetak, frmIjinLainCetak);
   with frmIjinLainCetak do
     begin
       lblTanggal.Caption := FormatDateTime('dd/MMM/yyyy', Date);
       lblTglIjin.Caption := FormatDateTime('dd/MMM/yyyy', edTanggal.Date);
       lblKode.Caption := edKode.Text + ' / ' + edID.Text;
       lblNama.Caption := edNama.Text;
       lblKet.Caption := edKeterangan.Text + ' ' + IntToStr(edJam.EditValue) + ' Jam';
       //lblJumlahLembur.Caption := FloatToStr(edLama.EditValue) + ' Jam ';
       lblNoIjin.Caption := 'No Ijin : ' + noIjin;
       lblJudul.Caption := 'SURAT IJIN KELUAR';
     end;
   frmIjinLainCetak.qrpIjin.Preview;
end;

procedure TfrmIjinKeluar.btnFindClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 11;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
    end
  else if (frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 11;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
    end;
end;

procedure TfrmIjinKeluar.cxButton1Click(Sender: TObject);
begin
  qrykeluar1.Close;
  qrykeluar1.SQL.Clear;
  qrykeluar1.SQL.Add('select autonum from ben_presensi_keluar ' +
     'where kodekaryawan = ''' + edKode.Text + ''' AND tanggal = ''' +
     FormatDateTime('yyyy-MM-dd', edTanggal.Date) + '''');
  qrykeluar1.Open;
  if (NOT qrykeluar1.IsEmpty) then
    begin
      ShowMessage('Data Ijin Keluar Sudah Ada ' + #13 +
          'Data Akan diupdate !');

    end
  else if (qrykeluar1.IsEmpty) then
    begin
      noIjin := 'IK.' + frmMain.APP_OUTLETID + '.' + edKode.Text + '.' +
          FormatDateTime('ddMMyy', edTanggal.Date);

      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into ben_presensi_keluar values(' +
        '''' + '' + ''',' +
        '''' + noIjin + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
        '''' + edKode.Text + ''',' +
        '''' + edID.Text + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
        QuotedStr(edKeterangan.Text) + ',' +
        '''' + IntToStr(edJam.EditValue) + ''',' +
        '''' + 'IK' + ''',' +
        '''' + frmMain.USERAPPS + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
      qryExec.ExecSQL;
    end;
  CetakData;
  frmIjinKeluar.Close;
end;

procedure TfrmIjinKeluar.cxButton2Click(Sender: TObject);
begin
  frmIjinKeluar.Close;
end;

procedure TfrmIjinKeluar.edSearchIDKeyPress(Sender: TObject; var Key: Char);
var
  strSearch : String;
begin
  if (key = #13) then
     begin
       case Length(edSearchID.Text) of
         1 : strSearch := '0000' + edSearchID.Text;
         2 : strSearch := '000' + edSearchID.Text;
         3 : strSearch := '00' + edSearchID.Text;
         4 : strSearch := '0' + edSearchID.Text;
         5 : strSearch := edSearchID.Text;
       end;
       qrykeluar1.Close;
       qrykeluar1.SQL.Clear;
       qrykeluar1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen ' +
         'from ben_hrd_karyawan_info where idkaryawan = ' + QuotedStr(strSearch) +
         ' and active = ''' + 'Y' + '''');
       qrykeluar1.Open;
       if (qrykeluar1.IsEmpty) then
         begin
           ShowMessage('ID Finger Tidak Ditemukan !');
           Exit;
         end;
       frmIjinKeluar.edKode.Text := qrykeluar1.Fields[0].AsString;
       frmIjinKeluar.edID.Text := qrykeluar1.Fields[1].AsString;
       frmIjinKeluar.edNama.Text := qrykeluar1.Fields[2].AsString;
       frmIjinKeluar.edDepartemen.Text := qrykeluar1.Fields[3].AsString;
       frmIjinKeluar.edTanggal.SetFocus;
     end;
end;

procedure TfrmIjinKeluar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qrykeluar1.Free;
  qryKeluar2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmIjinKeluar.FormCreate(Sender: TObject);
begin
  edTanggal.Date := Date;
  qrykeluar1 := TMyQuery.Create(Self);
  qrykeluar1.Connection := DMDB.dbInternal;
  qrykeluar1.SQL.Add('select * from temptable');
  qrykeluar1.Active := true;

  qryKeluar2 := TMyQuery.Create(Self);
  qryKeluar2.Connection := DMDB.dbInternal;
  qryKeluar2.SQL.Add('select * from temptable');
  qryKeluar2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  tblTag.Active := True;

  qrykeluar1.Close;
  qrykeluar1.SQL.Clear;
  qrykeluar1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_presensi_keluar'));
  qrykeluar1.Open;
  if (qrykeluar1.IsEmpty) then
  begin
    qryExec.SQL.Clear;
    qryExec.SQL.Add(memoStruktur1.Text);
    qryExec.ExecSQL;
  end;

  qryKeluar2.Close;
  qryKeluar2.SQL.Clear;
  qryKeluar2.SQL.Add('select tagid from ben_presensi_tag where tagid = ''' + 'IK' +
     '''');
  qryKeluar2.Open;
  if (qrykeluar2.IsEmpty) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into ben_presensi_tag values(' +
         '''' + 'IK' + ''',' +
         '''' + 'IJIN KELUAR' + ''',' +
         '''' + '1' + ''',' +
         '''' + '1' + ''',' +
         '''' + '0' + ''',' +
         '''' + 'Y' + ''',' +
         '''' + '0' + ''');');
      qryExec.ExecSQL;
    end;
end;

end.
