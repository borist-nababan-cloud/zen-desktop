unit FIjinCuti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, DateUtils, cxCalc, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, MemDS, MyAccess, cxLabel, cxGroupBox, strUtils;

type
  TfrmIjinCuti = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edKode: TEdit;
    edID: TEdit;
    edNama: TEdit;
    edStart: TcxDateEdit;
    btnFind: TButton;
    Label6: TLabel;
    edEnd: TcxDateEdit;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    edDivisi: TcxLookupComboBox;
    Label7: TLabel;
    edJumlah: TcxCalcEdit;
    Label8: TLabel;
    Label9: TLabel;
    edSaldo: TcxCalcEdit;
    Label10: TLabel;
    edSisa: TcxCalcEdit;
    btnSave: TButton;
    edKeterangan: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edTglPengajuan: TcxDateEdit;
    btnCancel: TButton;
    Label13: TLabel;
    edQuickSearch: TcxTextEdit;
    gbHistory: TcxGroupBox;
    lblSaldo: TcxLabel;
    lblTerpakai: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edEndPropertiesChange(Sender: TObject);
    procedure edEndPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edStartPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edStartPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure edTglPengajuanKeyPress(Sender: TObject; var Key: Char);
    procedure edStartKeyPress(Sender: TObject; var Key: Char);
    procedure edEndKeyPress(Sender: TObject; var Key: Char);
    procedure edDivisiKeyPress(Sender: TObject; var Key: Char);
    procedure edJumlahKeyPress(Sender: TObject; var Key: Char);
    procedure edSaldoKeyPress(Sender: TObject; var Key: Char);
    procedure edSisaKeyPress(Sender: TObject; var Key: Char);
    procedure edKeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure edQuickSearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryCuti1, qryCuti2, qryExec : TMyQuery;
    function CreateNoLembur : String;
    procedure ClearForm();
  public
    { Public declarations }
    procedure CariCuti(var kodekaryawan : String);
  end;

var
  frmIjinCuti: TfrmIjinCuti;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterKaryawan, FIjinCutiCetak, FIjinCutiList;

procedure TfrmIjinCuti.ClearForm;
begin
  lblSaldo.Caption := '';
  lblTerpakai.Caption := '';
  edKode.Clear;
  edID.Clear;
  edNama.Clear;
  edStart.Date := Date;
  edEnd.Date := Date;
  edDivisi.Clear;
  edJumlah.EditValue := 0;
  edSaldo.EditValue := 0;
  edSisa.EditValue := 0;
  edKeterangan.Clear;
  edTglPengajuan.Date := Date;
  edQuickSearch.Clear;
  edQuickSearch.SetFocus;
end;

function TfrmIjinCuti.CreateNoLembur;
var
   tmpStrLembur, strNewNumb, strlastNumb : String;
   lastNumb, NewNumb : Integer;
begin
   tmpStrLembur := 'C.' + frmMain.APP_OUTLETID + '.' + FormatDateTime('yyyyMM', edStart.Date) + '.' + '%';
   qryCuti2.Close;
   qryCuti2.SQL.Clear;
   qryCuti2.SQL.Add('select nomorcuti from ben_presensi_cuti where nomorcuti like ' + QuotedStr(tmpStrLembur) +
       ' Order By nomorcuti ASC');
   qryCuti2.Open;
   qryCuti2.Last;
   if (qryCuti2.IsEmpty) then
       begin
         Result := 'C.' + frmMain.APP_OUTLETID + '.' + FormatDateTime('yyyyMM', edStart.Date) + '.001';
       end
   else
       begin
           strlastNumb := RightStr(qryCuti2.Fields[0].AsString, 3);
           lastNumb := StrToInt(strlastNumb);
           NewNumb := lastNumb + 1;
           case Length(IntToStr(NewNumb)) of
              1 : strNewNumb := '00' + IntToStr(NewNumb);
              2 : strNewNumb := '0' + IntToStr(NewNumb);
              3 : strNewNumb := IntToStr(NewNumb);
           end;
           Result := 'C.' + frmMain.APP_OUTLETID + '.' + FormatDateTime('yyyyMM', edStart.Date) + '.' + strNewNumb;
       end;


end;

procedure TfrmIjinCuti.btnSaveClick(Sender: TObject);
var
  nCuti, strsync, kodekaryawan : String;
  nHari : TDate;
  jmlhHari, i, nTahun, lastNumb, NewNumb : Integer;
  isCancel : Boolean;
begin
   kodekaryawan := edKode.Text;
   qryExec.SQL.Clear;
   CariCuti(kodekaryawan);
   edJumlah.EditValue := DaysBetween(edStart.Date, edEnd.Date) + 1;
   edSisa.EditValue := edSaldo.EditValue - edJumlah.EditValue;
   if (edSisa.EditValue < 0) then
     begin
       ShowMessage('Maaf Sisa cuti kurang dari 0');
       Exit;
     end;
   nHari := edStart.Date;
   jmlhHari := DaysBetween(edStart.Date, edEnd.Date);
   isCancel := False;
   //ShowMessage(BoolToStr(isCancel));
   for i := 0 to jmlhHari do
     begin
       qryCuti1.Close;
       qryCuti1.SQL.Clear;
       qryCuti1.SQL.Add('select nomorcuti from ben_presensi_cuti where kodekaryawan = ''' +
          edKode.Text + ''' AND tanggal = ''' +
          FormatDateTime('yyyy-MM-dd', nHari) + '''');
       qryCuti1.Open;
       if (NOT qryCuti1.IsEmpty) then
         begin
           ShowMessage('Data Cuti Tanggal ' + datetostr(nHari) +
           ' Sudah Ada');
           isCancel := True;
           Exit;
         end;
       nHari := IncDay(nHari, 1);
     end;
   //ShowMessage(BoolToStr(isCancel));
   if (isCancel = True) then Exit;
   nHari := edStart.Date;
   jmlhHari := DaysBetween(edStart.Date, edEnd.Date);
   nCuti := CreateNoLembur;
   for i := 0 to jmlhHari do
     begin

       qryExec.SQL.Add('insert into ben_presensi_cuti values(' +
       '''' + '' + ''',' +
       '''' + nCuti + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', edTglPengajuan.Date) + ''',' +
       '''' + edKode.Text + ''',' +
       '''' + edID.Text + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', nHari) + ''',' +
       QuotedStr(edKeterangan.Text) + ',' +
       '''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''',' +
       '''' + FloatToStr(edJumlah.EditValue) + ''',' +
       '''' + FloatToStr(edSaldo.EditValue) + ''',' +
       '''' + FloatToStr(edSisa.EditValue) + ''',' +
       '''' + 'C' + ''',' +
       '''' + frmMain.USERAPPS + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');

       {strsync := 'insert into ben_presensi_cuti values(' +
       '''' + '' + ''',' +
       '''' + nCuti + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', edTglPengajuan.Date) + ''',' +
       '''' + edKode.Text + ''',' +
       '''' + edID.Text + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', nHari) + ''',' +
       QuotedStr(edKeterangan.Text) + ',' +
       '''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''',' +
       '''' + FloatToStr(edJumlah.EditValue) + ''',' +
       '''' + FloatToStr(edSaldo.EditValue) + ''',' +
       '''' + FloatToStr(edSisa.EditValue) + ''',' +
       '''' + 'C' + ''',' +
       '''' + frmMain.USERAPPS + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');';

       qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');}
       nHari := IncDay(nHari, 1);
     end;

   nTahun := strtoint( FormatDateTime('yyyy', edStart.Date));
   qryExec.SQL.Add('update ben_saldo_cuti set ' +
       'sisa = ''' + FloatToStr(edSisa.EditValue) + ''' ' +
       'where kodekaryawan = ''' + edKode.Text + ''' AND tahun = ''' +
       IntToStr(nTahun) + ''';');
   qryExec.ExecSQL;
   Application.CreateForm(TfrmIjinCutiCetak, frmIjinCutiCetak);
   with frmIjinCutiCetak do
     begin
       lblTanggal.Caption := FormatDateTime('yyyy-MM-dd', Date);
       lblStart.Caption := FormatDateTime('yyyy-MM-dd', edStart.Date);
       lblEnd.Caption := FormatDateTime('yyyy-MM-dd', edEnd.Date);
       lblKode.Caption := edKode.Text + ' / ' + edID.Text;
       lblNama.Caption := edNama.Text;
       lblKet.Caption := edKeterangan.Text;
       lblCuti.Caption := 'Jumlah : ' + FloatToStr(edJumlah.EditValue) +
            ' Sisa : ' + FloatToStr(edSisa.EditValue) + ' hari';
       lblNomor.Caption :=  'No Cuti ' + nCuti;
     end;
   frmIjinCutiCetak.qrpCuti.Preview;
   ShowMessage('Input Cuti Selesai !');
   frmIjinCutiList.btnRefresh.Click;
   //frmIjinCuti.Close;
   ClearForm;

end;

procedure TfrmIjinCuti.CariCuti(var kodekaryawan : String);
var
  iTahun : Integer;
begin
  iTahun := YearOf(edStart.Date);
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
  edSaldo.EditValue := qryCuti2.Fields[0].AsInteger - qryCuti1.Fields[0].AsInteger;
  edSisa.EditValue := edSaldo.EditValue - edJumlah.EditValue;
end;

procedure TfrmIjinCuti.edDivisiKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edJumlah.SetFocus;
end;

procedure TfrmIjinCuti.edEndKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edDivisi.SetFocus;
end;

procedure TfrmIjinCuti.edEndPropertiesChange(Sender: TObject);
begin
  edJumlah.EditValue := DaysBetween(edStart.Date, edEnd.Date) + 1;
  edSisa.EditValue := edSaldo.EditValue - edJumlah.EditValue;
end;

procedure TfrmIjinCuti.edEndPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  edJumlah.EditValue := DaysBetween(edStart.Date, edEnd.Date) + 1;
  edSisa.EditValue := edSaldo.EditValue - edJumlah.EditValue;
end;

procedure TfrmIjinCuti.edJumlahKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edSaldo.SetFocus;
end;

procedure TfrmIjinCuti.edKeteranganKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then btnSave.SetFocus;
end;

procedure TfrmIjinCuti.edQuickSearchKeyPress(Sender: TObject; var Key: Char);
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
         edDivisi.EditValue := qryCuti1.Fields[3].AsString;
         edQuickSearch.Clear;
         kodekaryawan := edKode.Text;
         CariCuti(kodekaryawan);
         edTglPengajuan.SetFocus;
     end;
end;

procedure TfrmIjinCuti.edSaldoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edSisa.SetFocus;
end;

procedure TfrmIjinCuti.edSisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edKeterangan.SetFocus;
end;

procedure TfrmIjinCuti.edStartKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edEnd.SetFocus;
end;

procedure TfrmIjinCuti.edStartPropertiesChange(Sender: TObject);
begin
  edJumlah.EditValue := DaysBetween(edStart.Date, edEnd.Date + 1);
  edSisa.EditValue := edSaldo.EditValue - edJumlah.EditValue;
end;

procedure TfrmIjinCuti.edStartPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  edJumlah.EditValue := DaysBetween(edStart.Date, edEnd.Date)+ 1;
  edSisa.EditValue := edSaldo.EditValue - edJumlah.EditValue;
end;

procedure TfrmIjinCuti.edTglPengajuanKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edStart.SetFocus;
end;

procedure TfrmIjinCuti.btnCancelClick(Sender: TObject);
begin
   frmIjinCuti.Close;
end;

procedure TfrmIjinCuti.btnFindClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 4;
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
      frmMasterKaryawan.btnSelect.Tag := 4;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
    end;
end;

procedure TfrmIjinCuti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryCuti1.Free;
  qryCuti2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmIjinCuti.FormCreate(Sender: TObject);
begin
  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryCuti1 := TMyQuery.Create(Self);
  qryCuti1.Connection := DMDB.dbInternal;
  qryCuti1.SQL.Add('select * from temptable');
  qryCuti1.Active := true;

  qryCuti2 := TMyQuery.Create(Self);
  qryCuti2.Connection := DMDB.dbInternal;
  qryCuti2.SQL.Add('select * from temptable');
  qryCuti2.Active := true;
  edStart.Date := Date;
  edEnd.Date := Date;
  edTglPengajuan.Date := Date;
  tblDepartemen.Active := True;
  gbHistory.Caption := 'Saldo Cuti Tahun '  + FormatDateTime('YYYY', Date);
end;

end.




