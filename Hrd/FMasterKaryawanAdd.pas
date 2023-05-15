unit FMasterKaryawanAdd;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxCheckBox,
  dxSkinscxPCPainter, cxPC, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DBAccess, cxCalendar, MyAccess,
  StrUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxBarBuiltInMenu, Vcl.ComCtrls, dxCore, cxDateUtils;

type
  TfrmMasterKaryawanAdd = class(TForm)
    Label2: TLabel;
    edKodekaryawan: TEdit;
    Label3: TLabel;
    edIdkaryawan: TEdit;
    Label4: TLabel;
    edNamaKaryawan: TEdit;
    ckAktif: TcxCheckBox;
    btnSave: TButton;
    Button2: TButton;
    pgKaryawanAdd: TcxPageControl;
    pgInfo: TcxTabSheet;
    edOutlet: TcxLookupComboBox;
    Label5: TLabel;
    ckJadwalTetap: TcxCheckBox;
    btnCopyOld: TButton;
    Label1: TLabel;
    pgDetails: TcxTabSheet;
    edTglMasuk: TcxDateEdit;
    Label6: TLabel;
    ckNonJadwal: TcxCheckBox;
    edKodeJadwal: TcxLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edAlamatKtp: TEdit;
    edAlamatTinggal: TEdit;
    edTelpHome: TEdit;
    edHape: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edTmptLahir: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edGoldar: TEdit;
    Label14: TLabel;
    edEmail: TEdit;
    edTglLahir: TcxDateEdit;
    edAgama: TComboBox;
    Label15: TLabel;
    edDepartemen: TcxLookupComboBox;
    Label16: TLabel;
    btnAutoNIK: TButton;
    btnAutoKode: TButton;
    edKodeKontrak: TcxLookupComboBox;
    Label17: TLabel;
    Label18: TLabel;
    edSex: TComboBox;
    Label19: TLabel;
    edNoKtp: TEdit;
    edBank: TComboBox;
    edNoRek: TEdit;
    ckAdmin: TcxCheckBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edNamaRekening: TEdit;
    edEndKontrak: TcxDateEdit;
    Label23: TLabel;
    ckJadwalharian: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCopyOldClick(Sender: TObject);
    procedure ckJadwalTetapPropertiesChange(Sender: TObject);
    procedure ckNonJadwalPropertiesChange(Sender: TObject);
    procedure btnAutoNIKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAutoKodeClick(Sender: TObject);
    procedure ckJadwalharianPropertiesChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }

    qryAdd1, qryAdd2, qryExec : TMyQuery;
    function autoNik(const tglMasuk : TDate) : String;
    function autoFPID : String;
    procedure InsertNew();
    procedure UpdateOld();
    procedure CreateNewNik();
  public
    { Public declarations }
  end;

var
  frmMasterKaryawanAdd: TfrmMasterKaryawanAdd;

implementation

{$R *.dfm}

uses FdmDB, FMasterKaryawan, FMain, FKaryawanOld;

function TfrmMasterKaryawanAdd.autoNik(const tglMasuk: TDate) : String;
var
  nBulan, nTahun, strNik, lastNik, oldStrNik : String;
  intLastNik, newLastNik : Integer;
  NEW_NIK : String;
begin
  //ShowMessage(FormatDateTime('yyyy-MMMM-dd', tglMasuk));
  nBulan := FormatDateTime('MM', tglMasuk);
  nTahun := FormatDateTime('yy', tglMasuk);
  //ShowMessage(nTahun + '#' + nBulan);
  strNik := VarToStr(edOutlet.EditValue) + nTahun + nBulan + '%';
  qryAdd1.Close;
  qryAdd1.SQL.Clear;
  qryAdd1.SQL.Add('select kodekaryawan from ben_hrd_karyawan_info where kodekaryawan like ''' +
      strNik + ''' Order By kodekaryawan ASC ');
  qryAdd1.Open;
  if (qryAdd1.IsEmpty) then NEW_NIK := frmMain.APP_OUTLETID + nTahun + nBulan + '001'
  else if (NOT qryAdd1.IsEmpty) then
    begin
      qryAdd1.Last;
      oldStrNik := qryAdd1.Fields[0].AsString;
      //ShowMessage(oldStrNik);
      intLastNik := StrToInt(RightStr(oldStrNik, 3));
      newLastNik := intLastNik + 1;
      case Length(inttostr(newLastNik)) of
         1 : strNik := frmMain.APP_OUTLETID + nTahun + nBulan + '00' + inttostr(newLastNik);
         2 : strNik := frmMain.APP_OUTLETID + nTahun + nBulan + '0' + inttostr(newLastNik);
         3 : strNik := frmMain.APP_OUTLETID + nTahun + nBulan + inttostr(newLastNik);
      end;
      NEW_NIK := strNik;
    end;
    Result := NEW_NIK;
end;

function TfrmMasterKaryawanAdd.autoFPID : String;
var
  ketemu : Boolean;
  intLastID, newLastID : Integer;
  NewKaryawan : String;
begin
   ketemu := True;
   qryAdd1.Close;
   qryAdd1.SQL.Clear;
   qryAdd1.SQL.Add('select idkaryawan from ben_hrd_karyawan_info where active = ''' + 'Y' + ''' ORDER BY idkaryawan ASC');
   qryAdd1.Open;
   qryAdd1.Last;
   if (qryAdd1.IsEmpty) then
     begin
       NewKaryawan := '00001';
       //edIdkaryawan.Text := '00001';
     end
   else if (NOt qryAdd1.IsEmpty) then
     begin
       intLastID := StrToInt(qryAdd1.Fields[0].AsString);
           newLastID := intLastID + 1;
           case Length(inttostr(newLastID)) of
              1 : NewKaryawan := '0000' + inttostr(newLastID);
              2 : NewKaryawan := '000' + inttostr(newLastID);
              3 : NewKaryawan := '00' + inttostr(newLastID);
              4 : NewKaryawan := '0' + inttostr(newLastID);
              5 : NewKaryawan := inttostr(newLastID);
           end;
     end;
   Result := NewKaryawan;
end;

procedure TfrmMasterKaryawanAdd.CreateNewNik;

begin

end;

procedure TfrmMasterKaryawanAdd.InsertNew;
var
   strSync, strTypeJadwal : String;
   kodeJadwal : Integer;
begin
  if ((ckJadwalTetap.Checked = False) AND (ckJadwalharian.Checked = True) AND (ckNonJadwal.Checked = False)) then
    begin
      strTypeJadwal := 'H';
      kodeJadwal := 99;
    end
  else if ((ckJadwalTetap.Checked = True) AND (ckNonJadwal.Checked = False) AND (ckJadwalharian.Checked = False)) then
    begin
      strTypeJadwal := 'Y';
      kodeJadwal := edKodeJadwal.EditValue;
    end
  else if ((ckJadwalTetap.Checked = False) AND (ckJadwalharian.Checked = False) AND (ckNonJadwal.Checked = True)) then
    begin
      strTypeJadwal := 'N';
      kodeJadwal := 99;
    end;
  //ShowMessage('2');
  qryAdd1.Close;
  qryAdd1.SQL.Clear;
  qryAdd1.SQL.Add('select kodekaryawan from ben_hrd_karyawan_info where kodekaryawan = ''' +
          edKodekaryawan.Text + ''' OR idkaryawan = ''' + edIdkaryawan.Text + ''' AND ' +
          'active = ''' + 'Y' + '''');
  qryAdd1.Open;
  if (qryAdd1.IsEmpty) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into ben_hrd_karyawan_info values(' +
           '''' + edKodekaryawan.Text + ''',' +
           '''' + edIdkaryawan.Text + ''',' +
           QuotedStr(edNamaKaryawan.Text) + ',' +
           '''' + vartostr(edOutlet.EditValue) + ''',' +
           '''' + vartostr(edDepartemen.EditValue) + ''',' +
           '''' + strTypeJadwal + ''',' +
           '''' + IntToStr(kodeJadwal) + ''',' +
           '''' + vartostr(edKodeKontrak.EditValue) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''' ,' +
           '''' + FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''' ,' +
           '''' + edBank.Text + ''',' +
           '''' + edNorek.Text + ''',' +
           QuotedStr(edNamaRekening.Text) + ',' +
           '''' + 'I' + ''',' +
           QuotedStr(frmMain.USERAPPS) + ' ,' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ,' +
           '''' + vartostr(ckAdmin.EditValue) + ''',' +
           '''' + vartostr(ckAktif.EditValue) + ''');');

      strSync := 'insert into ben_hrd_karyawan_info values(' +
           '''' + edKodekaryawan.Text + ''',' +
           '''' + edIdkaryawan.Text + ''',' +
           QuotedStr(edNamaKaryawan.Text) + ',' +
           '''' + vartostr(edOutlet.EditValue) + ''',' +
           '''' + vartostr(edDepartemen.EditValue) + ''',' +
           '''' + strTypeJadwal + ''',' +
           '''' + IntToStr(kodeJadwal) + ''',' +
           '''' + vartostr(edKodeKontrak.EditValue) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''' ,' +
           '''' + FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''' ,' +
           '''' + edBank.Text + ''',' +
           '''' + edNorek.Text + ''',' +
           QuotedStr(edNamaRekening.Text) + ',' +
           '''' + 'I' + ''',' +
           QuotedStr(frmMain.USERAPPS) + ' ,' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ,' +
           '''' + vartostr(ckAdmin.EditValue) + ''',' +
           '''' + vartostr(ckAktif.EditValue) + ''');';

      qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');

      qryExec.SQL.Add('insert into ben_hrd_karyawan_details values(' +
           '''' + edKodekaryawan.Text + ''',' +
           '''' + edIdkaryawan.Text + ''',' +
           QuotedStr(edNamaKaryawan.Text) + ',' +
           QuotedStr(edNoKtp.Text) + ',' +
           '''' + edSex.Text + ''',' +
           QuotedStr(edAlamatKtp.Text) + ',' +
           QuotedStr(edAlamatTinggal.Text) + ',' +
           QuotedStr(edTelpHome.Text) + ',' +
           QuotedStr(edHape.Text) + ',' +
           QuotedStr(edTmptLahir.Text) + ',' +
           '''' + FormatDateTime('yyyy-MM-dd', edTglLahir.Date) + ''' ,' +
           QuotedStr(edAgama.Text) + ',' +
           QuotedStr(edGoldar.Text) + ',' +
           QuotedStr(edEmail.Text) + ',' +
           '''' + vartostr(ckAktif.EditValue) + ''');');
      strSync := 'insert into ben_hrd_karyawan_details values(' +
           '''' + edKodekaryawan.Text + ''',' +
           '''' + edIdkaryawan.Text + ''',' +
           QuotedStr(edNamaKaryawan.Text) + ',' +
           QuotedStr(edNoKtp.Text) + ',' +
           '''' + edSex.Text + ''',' +
           QuotedStr(edAlamatKtp.Text) + ',' +
           QuotedStr(edAlamatTinggal.Text) + ',' +
           QuotedStr(edTelpHome.Text) + ',' +
           QuotedStr(edHape.Text) + ',' +
           QuotedStr(edTmptLahir.Text) + ',' +
           '''' + FormatDateTime('yyyy-MM-dd', edTglLahir.Date) + ''' ,' +
           QuotedStr(edAgama.Text) + ',' +
           QuotedStr(edGoldar.Text) + ',' +
           QuotedStr(edEmail.Text) + ',' +
           '''' + vartostr(ckAktif.EditValue) + ''');';

      qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');
      qryExec.ExecSQL;
      ShowMessage('Data Karyawan Tersimpan !');


      if (frmMasterKaryawan.ckFilter.Checked = True) then
        begin
        frmMasterKaryawan.qryKaryawan.Close;
        frmMasterKaryawan.qryKaryawan.SQL.Clear;
        frmMasterKaryawan.qryKaryawan.SQL.Add('select * from ben_hrd_karyawan_info ' +
            'where active = ''' + 'Y' + '''');
        frmMasterKaryawan.qryKaryawan.Open;
        frmMasterKaryawan.gtbKaryawan.DataController.Refresh;
        frmMasterKaryawanAdd.Close;
        end
      else if (frmMasterKaryawan.ckFilter.Checked = False) then
        begin
          frmMasterKaryawan.qryKaryawan.Close;
        frmMasterKaryawan.qryKaryawan.SQL.Clear;
        frmMasterKaryawan.qryKaryawan.SQL.Add('select * from ben_hrd_karyawan_info');
        frmMasterKaryawan.qryKaryawan.Open;
        frmMasterKaryawan.gtbKaryawan.DataController.Refresh;
        frmMasterKaryawanAdd.Close;
        end;
    end
  else if (NOT qryAdd1.IsEmpty) then
    begin
      ShowMessage('Data NIK Karyawan atau DI Finger sudah ada' + #13 +
         'Mohon Generate terlebih dahulu');
      Exit;
    end;
end;

procedure TfrmMasterKaryawanAdd.UpdateOld;
var
  strSync, strTypeJadwal : String;
  kodeJadwal : Integer;
begin
  if ((ckJadwalTetap.Checked = False) AND (ckJadwalharian.Checked = True) AND (ckNonJadwal.Checked = False)) then
    begin
      strTypeJadwal := 'H';
      kodeJadwal := 99;
    end
  else if ((ckJadwalTetap.Checked = True) AND (ckNonJadwal.Checked = False) AND (ckJadwalharian.Checked = False)) then
    begin
      strTypeJadwal := 'Y';
      kodeJadwal := edKodeJadwal.EditValue;
    end
  else if ((ckJadwalTetap.Checked = False) AND (ckJadwalharian.Checked = False) AND (ckNonJadwal.Checked = True)) then
    begin
      strTypeJadwal := 'N';
      kodeJadwal := 99;
    end;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update ben_hrd_karyawan_info set ' +
           'idkaryawan = ''' + edIdkaryawan.Text + ''',' +
           'namakaryawan = ' + QuotedStr(edNamaKaryawan.Text) + ',' +
           'departemen = ''' + vartostr(edDepartemen.EditValue) + ''',' +
           'jadwaltetap = ''' + strTypeJadwal + ''',' +
           'kodejadwal = ''' + IntToStr(kodeJadwal) + ''',' +
           'tglmasukkerja = ''' + FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''' ,' +
           'namabank = ''' + edBank.Text + ''',' +
           'norek = ''' + edNorek.Text + ''',' +
           'namarek = ' + QuotedStr(edNamaRekening.Text) + ',' +
           'tagedit = ''' + 'E' + ''',' +
           'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ' ,' +
           'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ,' +
           'isadmin = ''' + vartostr(ckAdmin.EditValue) + ''',' +
           'active = ''' + vartostr(ckAktif.EditValue) + ''' ' +
           'where kodekaryawan = ''' + edKodekaryawan.Text + ''';');
  
  qryExec.SQL.Add('update ben_hrd_karyawan_details set ' +
           'idkaryawan = ''' + edIdkaryawan.Text + ''',' +
           'namakaryawan = ' +QuotedStr(edNamaKaryawan.Text) + ',' +
           'noidentitas = ' + QuotedStr(edNoKtp.Text) + ',' +
           'sex = ''' + edSex.Text + ''',' +
           'alamatktp = ' + QuotedStr(edAlamatKtp.Text) + ',' +
           'alamattinggal = ' +QuotedStr(edAlamatTinggal.Text) + ',' +
           'telpfixline = ' + QuotedStr(edTelpHome.Text) + ',' +
           'telpponsel = ' + QuotedStr(edHape.Text) + ',' +
           'tempatlahir = ' +QuotedStr(edTmptLahir.Text) + ',' +
           'tgllahir = ''' + FormatDateTime('yyyy-MM-dd', edTglLahir.Date) + ''' ,' +
           'agamaid = ' + QuotedStr(edAgama.Text) + ',' +
           'goldarah = ' + QuotedStr(edGoldar.Text) + ',' +
           'alamatemail = ' + QuotedStr(edEmail.Text) + ',' +
           'active = ''' + vartostr(ckAktif.EditValue) + ''' ' +
           'where kodekaryawan = ''' + edKodekaryawan.Text + ''';');
  
  qryExec.ExecSQL;
  ShowMessage('Data Karyawan Tersimpan !');

  if (frmMasterKaryawan.ckFilter.Checked = True) then
    begin
    frmMasterKaryawan.qryKaryawan.Close;
    frmMasterKaryawan.qryKaryawan.SQL.Clear;
    frmMasterKaryawan.qryKaryawan.SQL.Add('select * from ben_hrd_karyawan_info ' +
        'where active = ''' + 'Y' + '''');
    frmMasterKaryawan.qryKaryawan.Open;
    frmMasterKaryawan.gtbKaryawan.DataController.Refresh;
    frmMasterKaryawanAdd.Close;
    end
  else if (frmMasterKaryawan.ckFilter.Checked = False) then
    begin
      frmMasterKaryawan.qryKaryawan.Close;
    frmMasterKaryawan.qryKaryawan.SQL.Clear;
    frmMasterKaryawan.qryKaryawan.SQL.Add('select * from ben_hrd_karyawan_info');
    frmMasterKaryawan.qryKaryawan.Open;
    frmMasterKaryawan.gtbKaryawan.DataController.Refresh;
    frmMasterKaryawanAdd.Close;
    end;
end;

procedure TfrmMasterKaryawanAdd.btnCopyOldClick(Sender: TObject);
begin
  Application.CreateForm(TfrmKaryawanOld, frmKaryawanOld);
  frmKaryawanOld.Show;
end;

procedure TfrmMasterKaryawanAdd.btnSaveClick(Sender: TObject);
begin
  if (edNamaKaryawan.Text = '') then
   begin
     ShowMessage('Nama Karyawan Masih Kosong !');
     Exit;
   end;
  if (edKodekaryawan.Text = '') then
   begin
     ShowMessage('NIK Karyawan Masih Kosong !');
     Exit;
   end;
  if (edIdkaryawan.Text = '') then
   begin
     ShowMessage('ID Karyawan Masih Kosong !');
     Exit;
   end;

  if (btnSave.Tag = 1) then
    begin
      InsertNew;
    end
  else if (btnSave.Tag = 2) then
    begin
      UpdateOld;
    end;
end;

procedure TfrmMasterKaryawanAdd.Button2Click(Sender: TObject);
begin
  frmMasterKaryawanAdd.Close;
end;

procedure TfrmMasterKaryawanAdd.btnAutoNIKClick(Sender: TObject);
begin
   {CreateNewNik;
   edKodekaryawan.Text := NEW_NIK;}
   //ShowMessage('Pastikan Tanggal Masuk Karyawan Sudah Benar');
   if (edOutlet.EditValue = Null) then
     begin
       ShowMessage('Mohon Pilih Outlet Terlebih Dahulu');
       exit;
     end;
   edKodekaryawan.Text := autoNik(edTglMasuk.Date);
end;

procedure TfrmMasterKaryawanAdd.btnAutoKodeClick(Sender: TObject);
begin
   edIdkaryawan.Text := autoFPID;
end;

procedure TfrmMasterKaryawanAdd.ckJadwalharianPropertiesChange(Sender: TObject);
begin
  if (ckJadwalharian.Checked = True) then
    begin
      ckJadwalTetap.Checked := False;
      ckNonJadwal.Checked := False;
    end;
end;

procedure TfrmMasterKaryawanAdd.ckJadwalTetapPropertiesChange(Sender: TObject);
begin
  if (ckJadwalTetap.Checked = True) then
    begin
      ckNonJadwal.Checked := False;
      ckJadwalharian.Checked := False;
    end;
end;

procedure TfrmMasterKaryawanAdd.ckNonJadwalPropertiesChange(Sender: TObject);
begin
  if (ckNonJadwal.Checked = True) then
    begin
      ckJadwalTetap.Checked := False;
      ckJadwalharian.Checked := False;
    end;
end;

procedure TfrmMasterKaryawanAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryAdd1.Free;
  qryAdd2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmMasterKaryawanAdd.FormCreate(Sender: TObject);
begin
  qryAdd1 := TMyQuery.Create(Self);
  qryAdd1.Connection := DMDB.dbInternal;
  qryAdd1.SQL.Add('select * from temptable');
  qryAdd1.Active := true;

  qryAdd2 := TMyQuery.Create(Self);
  qryAdd2.Connection := DMDB.dbInternal;
  qryAdd2.SQL.Add('select * from temptable');
  qryAdd2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

end;

procedure TfrmMasterKaryawanAdd.FormShow(Sender: TObject);
begin
  pgKaryawanAdd.ActivePage := pgInfo;
end;

end.
