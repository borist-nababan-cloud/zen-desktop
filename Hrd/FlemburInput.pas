unit FlemburInput;

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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  StdCtrls, cxSpinEdit, cxTimeEdit, DBAccess, cxCalc, DateUtils, ExtCtrls, MyAccess,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmLemburInput = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    edKode: TEdit;
    edID: TEdit;
    edNama: TEdit;
    edTglLembur: TcxDateEdit;
    btnFind: TButton;
    edStart: TcxTimeEdit;
    edEnd: TcxTimeEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edKeterangan: TEdit;
    btnSimpan: TButton;
    Label8: TLabel;
    edTglMasuk: TcxDateEdit;
    Label9: TLabel;
    edTglKeluar: TcxDateEdit;
    edNamaShift: TEdit;
    Label10: TLabel;
    edJmasuk: TcxTimeEdit;
    edJKeluar: TcxTimeEdit;
    edLama: TcxCalcEdit;
    Label11: TLabel;
    edTglLemburStart: TcxDateEdit;
    edTglLemburEnd: TcxDateEdit;
    lblNoLembur: TLabel;
    btnCancel: TButton;
    Label13: TLabel;
    edQuickSearch: TcxTextEdit;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edTglLemburPropertiesChange(Sender: TObject);
    procedure edEndPropertiesChange(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edStartPropertiesChange(Sender: TObject);
    procedure edJKeluarPropertiesChange(Sender: TObject);
    procedure edJmasukPropertiesChange(Sender: TObject);
    procedure edTglMasukKeyPress(Sender: TObject; var Key: Char);
    procedure edJmasukKeyPress(Sender: TObject; var Key: Char);
    procedure edTglKeluarKeyPress(Sender: TObject; var Key: Char);
    procedure edJKeluarKeyPress(Sender: TObject; var Key: Char);
    procedure edNamaShiftKeyPress(Sender: TObject; var Key: Char);
    procedure edTglLemburStartKeyPress(Sender: TObject; var Key: Char);
    procedure edStartKeyPress(Sender: TObject; var Key: Char);
    procedure edTglLemburEndKeyPress(Sender: TObject; var Key: Char);
    procedure edEndKeyPress(Sender: TObject; var Key: Char);
    procedure edKeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure edLamaKeyPress(Sender: TObject; var Key: Char);
    procedure edTglLemburPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edQuickSearchKeyPress(Sender: TObject; var Key: Char);
    procedure edTglLemburEndPropertiesChange(Sender: TObject);
    procedure edTglLemburStartPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    qryLembur1, qryLembur2, qryExec : TMyQuery;
  public
    { Public declarations }
    procedure CariJadwal;
    procedure CetakData;
    procedure ClearForm;
  end;

var
  frmLemburInput: TfrmLemburInput;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterKaryawan, FlemburCetak, FLemburList;

procedure TfrmLemburInput.ClearForm;
begin
   edQuickSearch.Clear;
   edKode.Clear;
   edID.Clear;
   edNama.Clear;
   edTglMasuk.Date := Date;
   edTglKeluar.Date := Date;
   edJmasuk.Time := Time;
   edJKeluar.Time := Time;
   edTglLemburStart.Date := Date;
   edTglLemburEnd.Date := Date;
   edStart.Time := Time;
   edEnd.Time := Time;
   edKeterangan.Clear;
   edQuickSearch.SetFocus;
   lblNoLembur.Caption := '';
end;

procedure TfrmLemburInput.CetakData;
begin
  Application.CreateForm(TfrmLemburCetak, frmLemburCetak);
   with frmLemburCetak do
     begin
       lblTanggal.Caption := FormatDateTime('yyyy-MM-dd', Date);
       lblTglLembur.Caption := FormatDateTime('yyyy-MM-dd', edTglLembur.Date);
       lblJLembur.Caption := FormatDateTime('hh:mm', edStart.Time) + ' - ' +
                             FormatDateTime('hh:mm', edEnd.Time);
       lblKode.Caption := edKode.Text + ' / ' + edID.Text;
       lblNama.Caption := edNama.Text;
       lblKet.Caption := edKeterangan.Text;
       lblJumlahLembur.Caption := FloatToStr(edLama.EditValue) + ' Jam ';
       lblNoLembur.Caption := 'No Lembur : ' + frmLemburInput.lblNoLembur.Caption;

     end;
   frmLemburCetak.qrpLembur.Preview;
end;

procedure TfrmLemburInput.btnSimpanClick(Sender: TObject);
var
  noLembur, strSync, tagPresensi, divisi, TJadwal, strNewNumb : String;
  jMasuk, jKeluar, lemStart, lemEnd : TDateTime;
  lastNumb, NewNumb : Integer;
begin
   if (edKeterangan.Text = '') then
      begin
        ShowMessage('Keterangan masih kosong !!');
        Exit;
      end;
     noLembur := '';
     qryLembur2.Close;
     qryLembur2.SQL.Clear;
     qryLembur2.SQL.Add('select count(tanggal) from ben_presensi_lembur where MONTH(ben_presensi_lembur.tanggal) = MONTH(CURRENT_DATE)');
     qryLembur2.Open;
     lastNumb := qryLembur2.Fields[0].AsInteger;
     NewNumb := lastNumb + 1;
     case Length(IntToStr(NewNumb)) of
        1 : strNewNumb := '0000' + IntToStr(NewNumb);
        2 : strNewNumb := '000' + IntToStr(NewNumb);
        3 : strNewNumb := '00' + IntToStr(NewNumb);
        4 : strNewNumb := '0' + IntToStr(NewNumb);
        5 : strNewNumb := IntToStr(NewNumb);
     end;
     qryLembur1.Close;
     qryLembur1.SQL.Clear;
     qryLembur1.SQL.Add('select jadwaltetap from ben_hrd_karyawan_info ' +
         'where kodekaryawan = ''' + edKode.Text + '''');
     qryLembur1.Open;
     TJadwal := qryLembur1.Fields[0].AsString;
     jMasuk := edTglMasuk.Date + edJmasuk.Time;
     jKeluar := edTglKeluar.Date + edJKeluar.Time;
     lemStart := edTglLemburStart.Date + edStart.Time;
     lemEnd := edTglLemburEnd.Date + edEnd.Time;
     noLembur := 'L.' + frmMain.APP_OUTLETID + '.' + FormatDateTime('MMyy', edTglLembur.Date) + FormatDateTime('hhmmss', time) + '.' + strNewNumb;
     lblNoLembur.Caption := noLembur;

     qryLembur1.Close;
     qryLembur1.SQL.Clear;
     qryLembur1.SQL.Add('select nomorlembur from ben_presensi_lembur where tanggal = ''' +
         FormatDateTime('yyyy-MM-dd', edTglLembur.Date) + ''' AND kodekaryawan = ''' +
         edKode.Text + '''');
     qryLembur1.Open;
     tagPresensi := 'OT';

   {close here}
   if (edLama.EditValue >= 4) then
     begin
       qryLembur2.Close;
       qryLembur2.SQL.Clear;
       qryLembur2.SQL.Add('select departemen from ben_hrd_karyawan_info where ' +
            'kodekaryawan = ''' + edKode.Text + '''');
       qryLembur2.Open;
       if ((qryLembur2.Fields[0].AsString = 'RC') OR (qryLembur2.Fields[0].AsString = 'ADM')) then
         begin
           if (edNamaShift.Text = 'OFF') then
             begin
               tagPresensi := 'OT';
             end

           else if (edNamaShift.Text <> 'OFF') then
             begin
               tagPresensi := 'FOT';
             end
         end
       else
         begin
           tagPresensi := 'OT';
         end
     end;
     {close here}

   if (qryLembur1.IsEmpty) then
     begin
       qryExec.SQL.Clear;
       qryExec.SQL.Add('insert into ben_presensi_lembur values(' +
           '''' + '' + ''',' +
           '''' + noLembur + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
           '''' + edKode.Text + ''',' +
           '''' + edID.Text + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', edTglLembur.Date) + ''',' +
           QuotedStr(edKeterangan.Text) + ',' +
           '''' + FormatDateTime('hh:mm:ss', edStart.Time) + ''',' +
           '''' + FormatDateTime('hh:mm:ss', edEnd.Time) + ''',' +
           '''' + FloatToStr(edLama.EditValue) + ''',' +
           '''' + tagPresensi + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jMasuk) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jKeluar) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', lemStart) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', lemEnd) + ''',' +
           '''' + frmMain.USERAPPS + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');

       {strSync := 'insert into ben_presensi_lembur values(' +
           '''' + '' + ''',' +
           '''' + noLembur + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
           '''' + edKode.Text + ''',' +
           '''' + edID.Text + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', edTglLembur.Date) + ''',' +
           QuotedStr(edKeterangan.Text) + ',' +
           '''' + FormatDateTime('hh:mm:ss', edStart.Time) + ''',' +
           '''' + FormatDateTime('hh:mm:ss', edEnd.Time) + ''',' +
           '''' + FloatToStr(edLama.EditValue) + ''',' +
           '''' + tagPresensi + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jMasuk) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jKeluar) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', lemStart) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', lemEnd) + ''',' +
           '''' + frmMain.USERAPPS + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');';}
        if (TJadwal = 'H') then
         begin
           qryExec.SQL.Add('update ben_hrd_jadwal_local set ' +
               'jmasuk = ''' + FormatDateTime('hh:mm:ss', edJmasuk.Time) + ''',' +
               'tglkeluar = ''' + FormatDateTime('yyyy-MM-dd', edTglKeluar.Date) + ''',' +
               'jkeluar = ''' + FormatDateTime('hh:mm:ss', edJKeluar.Time) + ''' ' +
               'where kodekaryawan = ''' + edKode.Text + ''' ' +
               'AND tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''';');
         end;
        {qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''');');}
        qryExec.ExecSQL;
        frmLemburList.qryList.Active := False;
        Sleep(100);
        frmLemburList.qryList.Active := True;
        frmLemburList.gtbLembur.DataController.Refresh;

     end
   else if (NOT qryLembur1.IsEmpty) then
     begin
       ShowMessage('Data sudah ada, Proses akan mengupdate data sebelumnya');
       qryLembur1.Close;
       {qryLembur1.SQL.Clear;
       qryLembur1.SQL.Add('select nomorlembur from ben_presensi_lembur where tanggal = ''' +
           FormatDateTime('yyyy-MM-dd', edTglLembur.Date) + ''' AND kodekaryawan = ''' +
           edKode.Text + '''');
       qryLembur1.Open;}
       noLembur := '';
       qryLembur2.Close;
       qryLembur2.SQL.Clear;
       qryLembur2.SQL.Add('select count(tanggal) from ben_presensi_lembur where MONTH(ben_presensi_lembur.tanggal) = MONTH(CURRENT_DATE)');
       qryLembur2.Open;
       lastNumb := qryLembur2.Fields[0].AsInteger;
       NewNumb := lastNumb + 1;
       case Length(IntToStr(NewNumb)) of
          1 : strNewNumb := '0000' + IntToStr(NewNumb);
          2 : strNewNumb := '000' + IntToStr(NewNumb);
          3 : strNewNumb := '00' + IntToStr(NewNumb);
          4 : strNewNumb := '0' + IntToStr(NewNumb);
          5 : strNewNumb := IntToStr(NewNumb);
       end;
       //lblNoLembur.Caption := qryLembur1.Fields[0].AsString;
       noLembur := 'L.' + frmMain.APP_OUTLETID + '.' + FormatDateTime('MMyy', edTglLembur.Date) + FormatDateTime('hhmmss', time) + '.' + strNewNumb;
       lblNoLembur.Caption := noLembur;
       qryExec.SQL.Clear;
       qryExec.SQL.Add('update ben_presensi_lembur set ' +
           'nomorlembur = ''' + noLembur + ''',' +
           'keterangan = ' + QuotedStr(edKeterangan.Text) + ',' +
           'jstart = ''' + FormatDateTime('hh:mm:ss', edStart.Time) + ''',' +
           'jend = ''' + FormatDateTime('hh:mm:ss', edEnd.Time) + ''',' +
           'tagpresensi = ''' + tagPresensi + ''',' +
           'jmasuk = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jMasuk) + ''',' +
           'jkeluar = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jKeluar) + ''',' +
           'lembstart = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', lemStart) + ''',' +
           'lembend = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', lemEnd) + ''',' +
           'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''',' +
           'jumlah = ''' + FloatToStr(edLama.EditValue) + ''',' +
           'lastedituser = ''' + frmMain.USERAPPS + ''',' +
           'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
           'where tanggal = ''' +
           FormatDateTime('yyyy-MM-dd', edTglLembur.Date) + ''' AND kodekaryawan = ''' +
           edKode.Text + ''';');

       {strSync := 'update ben_presensi_lembur set ' +
           'keterangan = ' + QuotedStr(edKeterangan.Text) + ',' +
           'jstart = ''' + FormatDateTime('hh:mm:ss', edStart.Time) + ''',' +
           'tagpresensi = ''' + tagPresensi + ''',' +
           'jmasuk = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jMasuk) + ''',' +
           'jkeluar = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jKeluar) + ''',' +
           'lembstart = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', lemStart) + ''',' +
           'lembend = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', lemEnd) + ''',' +
           'jend = ''' + FormatDateTime('hh:mm:ss', edEnd.Time) + ''',' +
           'jumlah = ''' + FloatToStr(edLama.EditValue) + ''',' +
           'lastedituser = ''' + frmMain.USERAPPS + ''',' +
           'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
           'where nomorlembur = ''' + qryLembur1.Fields[0].AsString + ''';';}

       {qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''');');}

       if (TJadwal = 'H') then
         begin
           qryExec.SQL.Add('update ben_hrd_jadwal_local set ' +
               'jmasuk = ''' + FormatDateTime('hh:mm:ss', edJmasuk.Time) + ''',' +
               'tglkeluar = ''' + FormatDateTime('yyyy-MM-dd', edTglKeluar.Date) + ''',' +
               'jkeluar = ''' + FormatDateTime('hh:mm:ss', edJKeluar.Time) + ''' ' +
               'where kodekaryawan = ''' + edKode.Text + ''' ' +
               'AND tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''';');
         end;

        qryExec.ExecSQL;
        frmLemburList.qryList.Active := False;
        Sleep(100);
        frmLemburList.qryList.Active := True;
        frmLemburList.gtbLembur.DataController.Refresh;
        //ShowMessage('Update Data Finish !');
     end;
   CetakData;
   ShowMessage('Update Data Finish !');
   //frmLemburInput.Close;
   ClearForm;
end;

procedure TfrmLemburInput.CariJadwal;
var
  intHari : Integer;
  kodejadwal : String;
begin
  intHari := DayOfWeek(edTglLembur.Date);
  qryLembur2.Close;
  qryLembur2.SQL.Clear;
  qryLembur2.SQL.Add('select jadwaltetap, kodejadwal from ben_hrd_karyawan_info ' +
      'where kodekaryawan = ''' + edKode.Text + '''');
  qryLembur2.Open;
  if (qryLembur2.Fields[0].AsString = 'Y') then
    begin
       kodejadwal := qryLembur2.Fields[1].AsString;
       //ShowMessage(IntToStr(intHari) + '#' + kodejadwal);
       case intHari of
         1 : begin
               qryLembur1.Close;
               qryLembur1.SQL.Clear;
               qryLembur1.SQL.Add('select ben_hrd_jadwal_tetap.ssun, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryLembur1.Open;
               edTglMasuk.Date := edTglLembur.Date;
               if (qryLembur1.Fields[4].AsString = 'Y') then
                 begin
                   edTglKeluar.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburStart.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburEnd.Date := IncDay(edTglMasuk.Date, 1);
                 end
               else if (qryLembur1.Fields[4].AsString = 'N') then
                 begin
                   edTglKeluar.Date := edTglLembur.Date;
                   edTglLemburEnd.Date := edTglLembur.Date;
                   edTglLemburStart.Date := edTglLembur.Date;
                 end;
                edJmasuk.Time := qryLembur1.Fields[2].AsDateTime;
                edJKeluar.Time := qryLembur1.Fields[3].AsDateTime;
                edNamaShift.Text := qryLembur1.Fields[1].AsString;
                edStart.Time := edJKeluar.Time;
                edEnd.Time := IncSecond(edJKeluar.Time, 1);
                edLama.EditValue := 0;
             end;
         2 : begin
               qryLembur1.Close;
               qryLembur1.SQL.Clear;
               qryLembur1.SQL.Add('select ben_hrd_jadwal_tetap.smonday, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryLembur1.Open;
               edTglMasuk.Date := edTglLembur.Date;
               if (qryLembur1.Fields[4].AsString = 'Y') then
                 begin
                   edTglKeluar.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburStart.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburEnd.Date := IncDay(edTglMasuk.Date, 1);
                 end
               else if (qryLembur1.Fields[4].AsString = 'N') then
                 begin
                   edTglKeluar.Date := edTglLembur.Date;
                   edTglLemburEnd.Date := edTglLembur.Date;
                   edTglLemburStart.Date := edTglLembur.Date;
                 end;
                edJmasuk.Time := qryLembur1.Fields[2].AsDateTime;
                edJKeluar.Time := qryLembur1.Fields[3].AsDateTime;
                edNamaShift.Text := qryLembur1.Fields[1].AsString;
                edStart.Time := edJKeluar.Time;
                edEnd.Time := IncSecond(edJKeluar.Time, 1);
                edLama.EditValue := 0;
             end;
         3 : begin
               qryLembur1.Close;
               qryLembur1.SQL.Clear;
               qryLembur1.SQL.Add('select ben_hrd_jadwal_tetap.stues, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryLembur1.Open;
               edTglMasuk.Date := edTglLembur.Date;
               if (qryLembur1.Fields[4].AsString = 'Y') then
                 begin
                   edTglKeluar.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburStart.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburEnd.Date := IncDay(edTglMasuk.Date, 1);
                 end
               else if (qryLembur1.Fields[4].AsString = 'N') then
                 begin
                   edTglKeluar.Date := edTglLembur.Date;
                   edTglLemburEnd.Date := edTglLembur.Date;
                   edTglLemburStart.Date := edTglLembur.Date;
                 end;
                edJmasuk.Time := qryLembur1.Fields[2].AsDateTime;
                edJKeluar.Time := qryLembur1.Fields[3].AsDateTime;
                edNamaShift.Text := qryLembur1.Fields[1].AsString;
                edStart.Time := edJKeluar.Time;
                edEnd.Time := IncSecond(edJKeluar.Time, 1);
                edLama.EditValue := 0;
             end;
         4 : begin
               qryLembur1.Close;
               qryLembur1.SQL.Clear;
               qryLembur1.SQL.Add('select ben_hrd_jadwal_tetap.swed, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryLembur1.Open;
               edTglMasuk.Date := edTglLembur.Date;
               if (qryLembur1.Fields[4].AsString = 'Y') then
                 begin
                   edTglKeluar.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburStart.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburEnd.Date := IncDay(edTglMasuk.Date, 1);
                 end
               else if (qryLembur1.Fields[4].AsString = 'N') then
                 begin
                   edTglKeluar.Date := edTglLembur.Date;
                   edTglLemburEnd.Date := edTglLembur.Date;
                   edTglLemburStart.Date := edTglLembur.Date;
                 end;
                edJmasuk.Time := qryLembur1.Fields[2].AsDateTime;
                edJKeluar.Time := qryLembur1.Fields[3].AsDateTime;
                edNamaShift.Text := qryLembur1.Fields[1].AsString;
                edStart.Time := edJKeluar.Time;
                edEnd.Time := IncSecond(edJKeluar.Time, 1);
                edLama.EditValue := 0;
             end;
         5 : begin
               qryLembur1.Close;
               qryLembur1.SQL.Clear;
               qryLembur1.SQL.Add('select ben_hrd_jadwal_tetap.sthur, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryLembur1.Open;
               edTglMasuk.Date := edTglLembur.Date;
               if (qryLembur1.Fields[4].AsString = 'Y') then
                 begin
                   edTglKeluar.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburStart.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburEnd.Date := IncDay(edTglMasuk.Date, 1);
                 end
               else if (qryLembur1.Fields[4].AsString = 'N') then
                 begin
                   edTglKeluar.Date := edTglLembur.Date;
                   edTglLemburEnd.Date := edTglLembur.Date;
                   edTglLemburStart.Date := edTglLembur.Date;
                 end;
                edJmasuk.Time := qryLembur1.Fields[2].AsDateTime;
                edJKeluar.Time := qryLembur1.Fields[3].AsDateTime;
                edNamaShift.Text := qryLembur1.Fields[1].AsString;
                edStart.Time := edJKeluar.Time;
                edEnd.Time := IncSecond(edJKeluar.Time, 1);
                edLama.EditValue := 0;
             end;
         6 : begin
               qryLembur1.Close;
               qryLembur1.SQL.Clear;
               qryLembur1.SQL.Add('select ben_hrd_jadwal_tetap.sfri, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryLembur1.Open;
               edTglMasuk.Date := edTglLembur.Date;
               if (qryLembur1.Fields[4].AsString = 'Y') then
                 begin
                   edTglKeluar.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburStart.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburEnd.Date := IncDay(edTglMasuk.Date, 1);
                 end
               else if (qryLembur1.Fields[4].AsString = 'N') then
                 begin
                   edTglKeluar.Date := edTglLembur.Date;
                   edTglLemburEnd.Date := edTglLembur.Date;
                   edTglLemburStart.Date := edTglLembur.Date;
                 end;
                edJmasuk.Time := qryLembur1.Fields[2].AsDateTime;
                edJKeluar.Time := qryLembur1.Fields[3].AsDateTime;
                edNamaShift.Text := qryLembur1.Fields[1].AsString;
                edStart.Time := edJKeluar.Time;
                edEnd.Time := IncSecond(edJKeluar.Time, 1);
                edLama.EditValue := 0;
             end;
         7 : begin
               qryLembur1.Close;
               qryLembur1.SQL.Clear;
               qryLembur1.SQL.Add('select ben_hrd_jadwal_tetap.ssat, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryLembur1.Open;
               edTglMasuk.Date := edTglLembur.Date;
               if (qryLembur1.Fields[4].AsString = 'Y') then
                 begin
                   edTglKeluar.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburStart.Date := IncDay(edTglMasuk.Date, 1);
                   edTglLemburEnd.Date := IncDay(edTglMasuk.Date, 1);
                 end
               else if (qryLembur1.Fields[4].AsString = 'N') then
                 begin
                   edTglKeluar.Date := edTglLembur.Date;
                   edTglLemburEnd.Date := edTglLembur.Date;
                   edTglLemburStart.Date := edTglLembur.Date;
                 end;
                edJmasuk.Time := qryLembur1.Fields[2].AsDateTime;
                edJKeluar.Time := qryLembur1.Fields[3].AsDateTime;
                edNamaShift.Text := qryLembur1.Fields[1].AsString;
                edStart.Time := edJKeluar.Time;
                edEnd.Time := IncSecond(edJKeluar.Time, 1);
                edLama.EditValue := 0;
             end;

       end;
    end
  else if (qryLembur2.Fields[0].AsString = 'H') then
    begin
      qryLembur1.Close;
      qryLembur1.SQL.Clear;
      qryLembur1.SQL.Add('select kodeshift, tglmasuk, jmasuk, tglkeluar, jkeluar ' +
          'from ben_hrd_jadwal_local where kodekaryawan = ''' + edKode.Text + ''' ' +
          'and tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', edTglLembur.Date) + '''');
      qryLembur1.Open;
      edTglMasuk.Date := qryLembur1.Fields[1].AsDateTime;
      edTglKeluar.Date := qryLembur1.Fields[3].AsDateTime;
      edJmasuk.Time := qryLembur1.Fields[2].AsDateTime;
      edJKeluar.Time := qryLembur1.Fields[4].AsDateTime;
      edNamaShift.Text := qryLembur1.Fields[0].AsString;
      edTglLemburStart.Date := edTglKeluar.Date;
      edTglLemburEnd.Date := edTglKeluar.Date;
      edStart.Time := edJKeluar.Time;
      edEnd.Time := IncSecond(edJKeluar.Time, 1);
      edLama.EditValue := 0;
    end;

end;

procedure TfrmLemburInput.edEndKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edKeterangan.SetFocus;
end;

procedure TfrmLemburInput.edEndPropertiesChange(Sender: TObject);
var
  nMasuk, nKeluar, jMasuk, jKeluar, jLmbMasuk, jLmbKeluar  : TDateTime;
  iNormal, iTotal, iLembur : Integer;
begin
  jMasuk := edTglMasuk.Date + edJmasuk.Time;
   jKeluar := edTglKeluar.Date + edJKeluar.Time;
   jLmbMasuk := edTglLemburStart.Date + edStart.Time;
   jLmbKeluar := edTglLemburEnd.Date + edEnd.Time;
   iNormal := HoursBetween(jMasuk, jKeluar);
   iLembur := HoursBetween(jLmbMasuk, jLmbKeluar);
   iTotal := iLembur - iNormal;
   edLama.EditValue := iLembur;
   
end;

procedure TfrmLemburInput.edJKeluarKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edNamaShift.SetFocus;
end;

procedure TfrmLemburInput.edJKeluarPropertiesChange(Sender: TObject);
var
  nMasuk, nKeluar : TDateTime;
begin
  nMasuk := edTglLemburStart.Date + edStart.Time;
  nKeluar := edTglLemburEnd.Date + edEnd.Time;
  edLama.EditValue := HoursBetween(nMasuk, nKeluar);
end;

procedure TfrmLemburInput.edJmasukKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edTglKeluar.SetFocus;
end;

procedure TfrmLemburInput.edJmasukPropertiesChange(Sender: TObject);
var
  nMasuk, nKeluar : TDateTime;
begin
  nMasuk := edTglLemburStart.Date + edStart.Time;
  nKeluar := edTglLemburEnd.Date + edEnd.Time;
  edLama.EditValue := HoursBetween(nMasuk, nKeluar);
end;

procedure TfrmLemburInput.edKeteranganKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edLama.SetFocus;
end;

procedure TfrmLemburInput.edLamaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then btnSimpan.SetFocus;
end;

procedure TfrmLemburInput.edNamaShiftKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edTglLemburStart.SetFocus;
end;

procedure TfrmLemburInput.edQuickSearchKeyPress(Sender: TObject; var Key: Char);
var
   strSearch : String;
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
         qryLembur1.Close;
         qryLembur1.SQL.Clear;
         qryLembur1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen ' +
           'from ben_hrd_karyawan_info where idkaryawan = ' + QuotedStr(strSearch) +
           ' and active = ''' + 'Y' + '''');
         qryLembur1.Open;
         if (qryLembur1.IsEmpty) then
           begin
             ShowMessage('ID Finger Tidak Ditemukan !');
             Exit;
           end;
         edKode.Text := qryLembur1.Fields[0].AsString;
         edID.Text := qryLembur1.Fields[1].AsString;
         edNama.Text := qryLembur1.Fields[2].AsString;
         //ed := qryChange1.Fields[3].AsString;
         CariJadwal;
         edQuickSearch.Clear;
         edTglLembur.SetFocus;
     end;
end;

procedure TfrmLemburInput.edStartKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edTglLemburEnd.SetFocus;
end;

procedure TfrmLemburInput.edStartPropertiesChange(Sender: TObject);
var
  nMasuk, nKeluar, jMasuk, jKeluar, jLmbMasuk, jLmbKeluar  : TDateTime;
  iNormal, iTotal, iLembur : Integer;
begin
   jMasuk := edTglMasuk.Date + edJmasuk.Time;
   jKeluar := edTglKeluar.Date + edJKeluar.Time;
   jLmbMasuk := edTglLemburStart.Date + edStart.Time;
   jLmbKeluar := edTglLemburEnd.Date + edEnd.Time;
   iNormal := HoursBetween(jMasuk, jKeluar);
   iLembur := HoursBetween(jLmbMasuk, jLmbKeluar);
   iTotal := iLembur - iNormal;
   edLama.EditValue := iLembur;
  
end;

procedure TfrmLemburInput.edTglKeluarKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edJKeluar.SetFocus;
end;

procedure TfrmLemburInput.edTglLemburEndKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edEnd.SetFocus;
end;

procedure TfrmLemburInput.edTglLemburEndPropertiesChange(Sender: TObject);
var
  nMasuk, nKeluar, jMasuk, jKeluar, jLmbMasuk, jLmbKeluar  : TDateTime;
  iNormal, iTotal, iLembur : Integer;
begin
   jMasuk := edTglMasuk.Date + edJmasuk.Time;
   jKeluar := edTglKeluar.Date + edJKeluar.Time;
   jLmbMasuk := edTglLemburStart.Date + edStart.Time;
   jLmbKeluar := edTglLemburEnd.Date + edEnd.Time;
   iNormal := HoursBetween(jMasuk, jKeluar);
   iLembur := HoursBetween(jLmbMasuk, jLmbKeluar);
   iTotal := iLembur - iNormal;
   edLama.EditValue := iTotal;
end;

procedure TfrmLemburInput.edTglLemburPropertiesChange(Sender: TObject);
begin
  CariJadwal;
end;

procedure TfrmLemburInput.edTglLemburPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  CariJadwal;
end;

procedure TfrmLemburInput.edTglLemburStartKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edStart.SetFocus;
end;

procedure TfrmLemburInput.edTglLemburStartPropertiesChange(Sender: TObject);
var
  nMasuk, nKeluar, jMasuk, jKeluar, jLmbMasuk, jLmbKeluar  : TDateTime;
  iNormal, iTotal, iLembur : Integer;
begin
   jMasuk := edTglMasuk.Date + edJmasuk.Time;
   jKeluar := edTglKeluar.Date + edJKeluar.Time;
   jLmbMasuk := edTglLemburStart.Date + edStart.Time;
   jLmbKeluar := edTglLemburEnd.Date + edEnd.Time;
   iNormal := HoursBetween(jMasuk, jKeluar);
   iLembur := HoursBetween(jLmbMasuk, jLmbKeluar);
   iTotal := iLembur - iNormal;
   edLama.EditValue := iTotal;
end;

procedure TfrmLemburInput.edTglMasukKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edJmasuk.SetFocus;
end;

procedure TfrmLemburInput.btnCancelClick(Sender: TObject);
begin
  frmLemburInput.Close;
end;

procedure TfrmLemburInput.btnFindClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 5;
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
      frmMasterKaryawan.btnSelect.Tag := 5;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
      frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmLemburInput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryLembur1.Free;
  qryLembur2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmLemburInput.FormCreate(Sender: TObject);
begin
  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryLembur1 := TMyQuery.Create(Self);
  qryLembur1.Connection := DMDB.dbInternal;
  qryLembur1.SQL.Add('select * from temptable');
  qryLembur1.Active := true;

  qryLembur2 := TMyQuery.Create(Self);
  qryLembur2.Connection := DMDB.dbInternal;
  qryLembur2.SQL.Add('select * from temptable');
  qryLembur2.Active := true;
  edTglLembur.Date := Date;
  //edTglMasuk.Date := Date;
  //edTglKeluar.Date := Date;
  //edTglLembur.Date := Date;
end;

end.
