unit FJadwalOutletAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, cxCalc, DB,
  cxDBLookupComboBox, DateUtils, cxTimeEdit, cxLookupEdit, cxDBLookupEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, MyAccess;

type
  TfrmJadwalOutletAdd = class(TForm)
    Label1: TLabel;
    edStart: TcxDateEdit;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvJadwal: TcxGridTableView;
    gtvJadwalKodeStaff: TcxGridColumn;
    gtvJadwalNamaStaff: TcxGridColumn;
    gtvJadwalMon: TcxGridColumn;
    gtvJadwalTue: TcxGridColumn;
    gtvJadwalWed: TcxGridColumn;
    gtvJadwalThu: TcxGridColumn;
    gtvJadwalFri: TcxGridColumn;
    gtvJadwalSat: TcxGridColumn;
    gtvJadwalSun: TcxGridColumn;
    edCount: TcxCalcEdit;
    Label2: TLabel;
    tblShift: TMyTable;
    dsTblShift: TDataSource;
    Button1: TButton;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    tvAdd: TcxGridTableView;
    tvAddNik: TcxGridColumn;
    tvAddStaff: TcxGridColumn;
    tvAddTglMasuk: TcxGridColumn;
    tvAddShift: TcxGridColumn;
    tvAddMasuk: TcxGridColumn;
    tvAddKeluar: TcxGridColumn;
    btnClearJadwal: TButton;
    btnPost: TButton;
    Label3: TLabel;
    tblDivisi: TMyTable;
    dsTblDivisi: TDataSource;
    edDivisi: TcxLookupComboBox;
    btnLoadstaff: TButton;
    gtvJadwalIDStaff: TcxGridColumn;
    tvAddTglKeluar: TcxGridColumn;
    Label5: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edStartPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure btnClearJadwalClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnLoadstaffClick(Sender: TObject);
  private
    { Private declarations }
    qryAdd1, qryAdd2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmJadwalOutletAdd: TfrmJadwalOutletAdd;

implementation

{$R *.dfm}

uses FdmDB, FJadwalOutlet, FMain;

procedure TfrmJadwalOutletAdd.btnLoadstaffClick(Sender: TObject);
var
  i, NewRec : Integer;
begin
  gtvJadwal.DataController.SelectAll;
  gtvJadwal.DataController.DeleteSelection;
  qryAdd1.Close;
  qryAdd1.SQL.Clear;
  qryAdd1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan ' +
       'from ben_hrd_karyawan_info where idoutlet = ''' +
       frmMain.APP_OUTLETID + ''' AND departemen = ''' + vartostr(edDivisi.EditValue) + ''' AND ' +
       'active = ''' + 'Y' + '''');
  qryAdd1.Open;
  qryAdd1.First;
  for i := 0 to qryAdd1.RecordCount - 1 do
     begin
       newRec := gtvJadwal.DataController.InsertRecord(gtvJadwal.DataController.RecordCount);
       gtvJadwal.DataController.SetValue(newRec, gtvJadwalKodeStaff.Index, qryAdd1.Fields[0].AsString);
       gtvJadwal.DataController.SetValue(newRec, gtvJadwalIDStaff.Index, qryAdd1.Fields[1].AsString);
       gtvJadwal.DataController.SetValue(newRec, gtvJadwalNamaStaff.Index, qryAdd1.Fields[2].AsString);
       gtvJadwal.DataController.PostEditingData;
       gtvJadwal.DataController.Post(True);
       qryAdd1.Next;
     end;
end;

procedure TfrmJadwalOutletAdd.btnPostClick(Sender: TObject);
var
  i, recSelect, kodeshift, newRec : Integer;
  kodeStaff, strSync, idOutlet : String;
  dMasuk, dKeluar : TDate;
  jMasuk, jKeluar : TTime;
begin
  if (tvAdd.DataController.RecordCount < 0) then Exit;
  tvAdd.DataController.GotoFirst;
  qryExec.SQL.Clear;
  for i := 0 to tvAdd.DataController.RecordCount - 1 do
    begin
      recSelect := tvAdd.DataController.GetFocusedRecordIndex;
      kodeStaff := vartostr(tvAdd.DataController.GetValue(recSelect, tvAddNik.Index));
      dMasuk := tvAdd.DataController.GetValue(recSelect, tvAddTglMasuk.Index);
      dKeluar := tvAdd.DataController.GetValue(recSelect, tvAddTglKeluar.Index);
      qryAdd2.Close;
      qryAdd2.SQL.Clear;
      qryAdd2.SQL.Add('select autonum from ben_hrd_jadwal_local where kodekaryawan = ''' +
          kodeStaff + ''' and tglmasuk = ''' +
          FormatDateTime('yyyy-MM-dd', dMasuk) + '''');
      qryAdd2.Open;
      if (qryAdd2.IsEmpty) then
        begin
          jMasuk := tvAdd.DataController.GetValue(recSelect, tvAddMasuk.Index);
          jKeluar := tvAdd.DataController.GetValue(recSelect, tvAddKeluar.Index);
          kodeshift := tvAdd.DataController.GetValue(recSelect, tvAddShift.Index);
          qryExec.SQL.Add('insert into ben_hrd_jadwal_local values(' +
             '''' + '' + ''',' +
             '''' + kodeStaff + ''',' +
             '''' + frmMain.APP_OUTLETID + ''',' +
             '''' + IntToStr(kodeshift) + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd', dMasuk) + ''',' +
             '''' + FormatDateTime('hh:mm:ss', jMasuk) + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd', dKeluar) + ''',' +
             '''' + FormatDateTime('hh:mm:ss', jKeluar) + ''',' +
             '''' + '' + ''',' +
             '''' + 'N' + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
             QuotedStr(frmMain.USERAPPS) + ',' +
             '''' + 'I' + ''');');
          {strSync := 'insert into ben_hrd_jadwal_local values(' +
             '''' + '' + ''',' +
             '''' + kodeStaff + ''',' +
             '''' + frmMenuMain.IDOUTLET + ''',' +
             '''' + IntToStr(kodeshift) + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd', dMasuk) + ''',' +
             '''' + FormatDateTime('hh:mm:ss', jMasuk) + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd', dKeluar) + ''',' +
             '''' + FormatDateTime('hh:mm:ss', jKeluar) + ''',' +
             '''' + '' + ''',' +
             '''' + 'N' + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
             QuotedStr(frmMenuMain.USERAPP) + ',' +
             '''' + 'I' + ''');';

          DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMenuMain.USERAPP) + ',' +
          '''' + frmMenuMain.IDOUTLET + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');}
         tvAdd.DataController.GotoNext;
        end
      else if (NOT qryAdd2.IsEmpty) then
        begin
           jMasuk := tvAdd.DataController.GetValue(recSelect, tvAddMasuk.Index);
          jKeluar := tvAdd.DataController.GetValue(recSelect, tvAddKeluar.Index);
          kodeshift := tvAdd.DataController.GetValue(recSelect, tvAddShift.Index);
          qryExec.SQL.Add('update ben_hrd_jadwal_local set ' +
             'kodeshift = ''' + IntToStr(kodeshift) + ''',' +
             'tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', dMasuk) + ''',' +
             'jmasuk = ''' + FormatDateTime('hh:mm:ss', jMasuk) + ''',' +
             'tglkeluar = ''' + FormatDateTime('yyyy-MM-dd', dKeluar) + ''',' +
             'jkeluar = ''' + FormatDateTime('hh:mm:ss', jKeluar) + ''',' +
             'notes = ''' + '' + ''',' +
             'isupload = ''' + 'N' + ''',' +
             'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
             'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
             'tagedit = ''' + 'E' + ''' ' +
             'where autonum = ''' + IntToStr(qryAdd2.Fields[0].AsInteger) + ''';');
          {strSync := 'insert into ben_hrd_jadwal_local values(' +
             '''' + '' + ''',' +
             '''' + kodeStaff + ''',' +
             '''' + frmMenuMain.IDOUTLET + ''',' +
             '''' + IntToStr(kodeshift) + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd', dMasuk) + ''',' +
             '''' + FormatDateTime('hh:mm:ss', jMasuk) + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd', dKeluar) + ''',' +
             '''' + FormatDateTime('hh:mm:ss', jKeluar) + ''',' +
             '''' + '' + ''',' +
             '''' + 'N' + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
             QuotedStr(frmMenuMain.USERAPP) + ',' +
             '''' + 'I' + ''');';

          DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMenuMain.USERAPP) + ',' +
          '''' + frmMenuMain.IDOUTLET + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');}
           tvAdd.DataController.GotoNext;
        end;
    end;
    qryExec.ExecSQL;
    ShowMessage('Jadwal Telah Di Posting');
    btnPost.Visible := False;
    btnClearJadwal.Click;

    qryAdd1.Close;
    qryAdd1.SQL.Clear;
    qryAdd1.SQL.Add('select kodekaryawan, namakaryawan, idkaryawan ' +
         'from ben_hrd_karyawan_info where idoutlet = ''' +
         frmMain.APP_OUTLETID + '''');
    qryAdd1.Open;
    qryAdd1.First;
    gtvJadwal.DataController.SelectAll;
    gtvJadwal.DataController.DeleteSelection;

    for i := 0 to qryAdd1.RecordCount - 1 do
       begin
         newRec := gtvJadwal.DataController.InsertRecord(gtvJadwal.DataController.RecordCount);
         gtvJadwal.DataController.SetValue(newRec, gtvJadwalKodeStaff.Index, qryAdd1.Fields[0].AsString);
         gtvJadwal.DataController.SetValue(newRec, gtvJadwalNamaStaff.Index, qryAdd1.Fields[1].AsString);
         gtvJadwal.DataController.SetValue(newRec, gtvJadwalIDStaff.Index, qryAdd1.Fields[2].AsString);
         gtvJadwal.DataController.PostEditingData;
         gtvJadwal.DataController.Post(True);
         qryAdd1.Next;
       end;
end;

procedure TfrmJadwalOutletAdd.Button1Click(Sender: TObject);
var
  wHari, i, y, recSelect, NewRec, kodeShift : Integer;
  dSenin, dStart, dOver : TDate;
  kodeStaff, namaStaff : String;
begin
  wHari := DayOfWeek(edStart.Date);
  //ShowMessage(IntToStr(wHari));
  if (wHari <> 2) then
   begin
        ShowMessage('Tanggal terpilih bukan hari Senin !!');
        Exit;
   end;

  tvAdd.DataController.SelectAll;
  tvAdd.DataController.DeleteSelection;
  gtvJadwal.DataController.GotoFirst;
  for i := 0 to gtvJadwal.DataController.RecordCount - 1 do
    begin
      gtvJadwal.DataController.PostEditingData;
      gtvJadwal.DataController.Post(True);
      gtvJadwal.DataController.GotoNext;
    end;

   dStart := edStart.Date;
   gtvJadwal.DataController.GotoFirst;
   for i := 0 to gtvJadwal.DataController.RecordCount - 1 do
     begin
       recSelect := gtvJadwal.DataController.GetFocusedRecordIndex;
       dSenin := edStart.Date;
       dStart := edStart.Date;
       kodeStaff := vartostr(gtvJadwal.DataController.GetValue(recSelect, gtvJadwalKodeStaff.Index));
       namaStaff := vartostr(gtvJadwal.DataController.GetValue(recSelect, gtvJadwalNamaStaff.Index));
       for y := 0 to edCount.EditValue - 1 do
         begin
           NewRec := tvAdd.DataController.InsertRecord(tvAdd.DataController.RecordCount);
           tvAdd.DataController.SetValue(NewRec, tvAddNik.Index, kodeStaff);
           tvAdd.DataController.SetValue(NewRec, tvAddStaff.Index, namaStaff);
           tvAdd.DataController.SetValue(NewRec, tvAddTglMasuk.Index, dStart);
           kodeShift := gtvJadwal.DataController.GetValue(recSelect, gtvJadwalMon.Index);
           if (kodeShift < 0) then
             begin
               ShowMessage('Data Belum Lengkap !!');
               btnClearJadwal.Click;
               Exit;
             end;

           qryAdd1.Close;
           qryAdd1.SQL.Clear;
           qryAdd1.SQL.Add('select jmasuk, jkeluar, overnight from ben_shift where autonum = ''' +
              inttostr(kodeShift) + '''');
           qryAdd1.Open;
           if (qryAdd1.Fields[2].AsString = 'Y') then
             begin
               dOver := IncDay(dStart, 1);
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dOver);
             end
           else if (qryAdd1.Fields[2].AsString = 'N') then
             begin
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dStart);
             end;
           tvAdd.DataController.SetValue(NewRec, tvAddShift.Index, kodeShift);
           tvAdd.DataController.SetValue(NewRec, tvAddMasuk.Index, qryAdd1.Fields[0].AsDateTime);
           tvAdd.DataController.SetValue(NewRec, tvAddKeluar.Index, qryAdd1.Fields[1].AsDateTime);
           tvAdd.DataController.PostEditingData;
           tvAdd.DataController.Post(True);

           NewRec := tvAdd.DataController.InsertRecord(tvAdd.DataController.RecordCount);
           tvAdd.DataController.SetValue(NewRec, tvAddNik.Index, kodeStaff);
           tvAdd.DataController.SetValue(NewRec, tvAddStaff.Index, namaStaff);
           dStart := IncDay(dStart, 1);
           tvAdd.DataController.SetValue(NewRec, tvAddTglMasuk.Index, dStart);
           kodeShift := gtvJadwal.DataController.GetValue(recSelect, gtvJadwalTue.Index);
           qryAdd1.Close;
           qryAdd1.SQL.Clear;
           qryAdd1.SQL.Add('select jmasuk, jkeluar, overnight from ben_shift where autonum = ''' +
              inttostr(kodeShift) + '''');
           qryAdd1.Open;
           if (qryAdd1.Fields[2].AsString = 'Y') then
             begin
               dOver := IncDay(dStart, 1);
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dOver);
             end
           else if (qryAdd1.Fields[2].AsString = 'N') then
             begin
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dStart);
             end;
           tvAdd.DataController.SetValue(NewRec, tvAddShift.Index, kodeShift);
           tvAdd.DataController.SetValue(NewRec, tvAddMasuk.Index, qryAdd1.Fields[0].AsDateTime);
           tvAdd.DataController.SetValue(NewRec, tvAddKeluar.Index, qryAdd1.Fields[1].AsDateTime);
           tvAdd.DataController.PostEditingData;
           tvAdd.DataController.Post(True);

           NewRec := tvAdd.DataController.InsertRecord(tvAdd.DataController.RecordCount);
           tvAdd.DataController.SetValue(NewRec, tvAddNik.Index, kodeStaff);
           tvAdd.DataController.SetValue(NewRec, tvAddStaff.Index, namaStaff);
           dStart := IncDay(dStart, 1);
           tvAdd.DataController.SetValue(NewRec, tvAddTglMasuk.Index, dStart);
           kodeShift := gtvJadwal.DataController.GetValue(recSelect, gtvJadwalWed.Index);
           qryAdd1.Close;
           qryAdd1.SQL.Clear;
           qryAdd1.SQL.Add('select jmasuk, jkeluar, overnight from ben_shift where autonum = ''' +
              inttostr(kodeShift) + '''');
           qryAdd1.Open;
           if (qryAdd1.Fields[2].AsString = 'Y') then
             begin
               dOver := IncDay(dStart, 1);
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dOver);
             end
           else if (qryAdd1.Fields[2].AsString = 'N') then
             begin
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dStart);
             end;
           tvAdd.DataController.SetValue(NewRec, tvAddShift.Index, kodeShift);
           tvAdd.DataController.SetValue(NewRec, tvAddMasuk.Index, qryAdd1.Fields[0].AsDateTime);
           tvAdd.DataController.SetValue(NewRec, tvAddKeluar.Index, qryAdd1.Fields[1].AsDateTime);
           tvAdd.DataController.PostEditingData;
           tvAdd.DataController.Post(True);

           NewRec := tvAdd.DataController.InsertRecord(tvAdd.DataController.RecordCount);
           tvAdd.DataController.SetValue(NewRec, tvAddNik.Index, kodeStaff);
           tvAdd.DataController.SetValue(NewRec, tvAddStaff.Index, namaStaff);
           dStart := IncDay(dStart, 1);
           tvAdd.DataController.SetValue(NewRec, tvAddTglMasuk.Index, dStart);
           kodeShift := gtvJadwal.DataController.GetValue(recSelect, gtvJadwalThu.Index);
           qryAdd1.Close;
           qryAdd1.SQL.Clear;
           qryAdd1.SQL.Add('select jmasuk, jkeluar, overnight from ben_shift where autonum = ''' +
              inttostr(kodeShift) + '''');
           qryAdd1.Open;
           if (qryAdd1.Fields[2].AsString = 'Y') then
             begin
               dOver := IncDay(dStart, 1);
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dOver);
             end
           else if (qryAdd1.Fields[2].AsString = 'N') then
             begin
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dStart);
             end;
           tvAdd.DataController.SetValue(NewRec, tvAddShift.Index, kodeShift);
           tvAdd.DataController.SetValue(NewRec, tvAddMasuk.Index, qryAdd1.Fields[0].AsDateTime);
           tvAdd.DataController.SetValue(NewRec, tvAddKeluar.Index, qryAdd1.Fields[1].AsDateTime);
           tvAdd.DataController.PostEditingData;
           tvAdd.DataController.Post(True);

           NewRec := tvAdd.DataController.InsertRecord(tvAdd.DataController.RecordCount);
           tvAdd.DataController.SetValue(NewRec, tvAddNik.Index, kodeStaff);
           tvAdd.DataController.SetValue(NewRec, tvAddStaff.Index, namaStaff);
           dStart := IncDay(dStart, 1);
           tvAdd.DataController.SetValue(NewRec, tvAddTglMasuk.Index, dStart);
           kodeShift := gtvJadwal.DataController.GetValue(recSelect, gtvJadwalFri.Index);
           qryAdd1.Close;
           qryAdd1.SQL.Clear;
           qryAdd1.SQL.Add('select jmasuk, jkeluar, overnight from ben_shift where autonum = ''' +
              inttostr(kodeShift) + '''');
           qryAdd1.Open;
           if (qryAdd1.Fields[2].AsString = 'Y') then
             begin
               dOver := IncDay(dStart, 1);
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dOver);
             end
           else if (qryAdd1.Fields[2].AsString = 'N') then
             begin
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dStart);
             end;
           tvAdd.DataController.SetValue(NewRec, tvAddShift.Index, kodeShift);
           tvAdd.DataController.SetValue(NewRec, tvAddMasuk.Index, qryAdd1.Fields[0].AsDateTime);
           tvAdd.DataController.SetValue(NewRec, tvAddKeluar.Index, qryAdd1.Fields[1].AsDateTime);
           tvAdd.DataController.PostEditingData;
           tvAdd.DataController.Post(True);

           NewRec := tvAdd.DataController.InsertRecord(tvAdd.DataController.RecordCount);
           tvAdd.DataController.SetValue(NewRec, tvAddNik.Index, kodeStaff);
           tvAdd.DataController.SetValue(NewRec, tvAddStaff.Index, namaStaff);
           dStart := IncDay(dStart, 1);
           tvAdd.DataController.SetValue(NewRec, tvAddTglMasuk.Index, dStart);
           kodeShift := gtvJadwal.DataController.GetValue(recSelect, gtvJadwalSat.Index);
           qryAdd1.Close;
           qryAdd1.SQL.Clear;
           qryAdd1.SQL.Add('select jmasuk, jkeluar, overnight from ben_shift where autonum = ''' +
              inttostr(kodeShift) + '''');
           qryAdd1.Open;
           if (qryAdd1.Fields[2].AsString = 'Y') then
             begin
               dOver := IncDay(dStart, 1);
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dOver);
             end
           else if (qryAdd1.Fields[2].AsString = 'N') then
             begin
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dStart);
             end;
           tvAdd.DataController.SetValue(NewRec, tvAddShift.Index, kodeShift);
           tvAdd.DataController.SetValue(NewRec, tvAddMasuk.Index, qryAdd1.Fields[0].AsDateTime);
           tvAdd.DataController.SetValue(NewRec, tvAddKeluar.Index, qryAdd1.Fields[1].AsDateTime);
           tvAdd.DataController.PostEditingData;
           tvAdd.DataController.Post(True);

           NewRec := tvAdd.DataController.InsertRecord(tvAdd.DataController.RecordCount);
           tvAdd.DataController.SetValue(NewRec, tvAddNik.Index, kodeStaff);
           tvAdd.DataController.SetValue(NewRec, tvAddStaff.Index, namaStaff);
           dStart := IncDay(dStart, 1);
           tvAdd.DataController.SetValue(NewRec, tvAddTglMasuk.Index, dStart);
           kodeShift := gtvJadwal.DataController.GetValue(recSelect, gtvJadwalSun.Index);
           qryAdd1.Close;
           qryAdd1.SQL.Clear;
           qryAdd1.SQL.Add('select jmasuk, jkeluar, overnight from ben_shift where autonum = ''' +
              inttostr(kodeShift) + '''');
           qryAdd1.Open;
           if (qryAdd1.Fields[2].AsString = 'Y') then
             begin
               dOver := IncDay(dStart, 1);
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dOver);
             end
           else if (qryAdd1.Fields[2].AsString = 'N') then
             begin
               tvAdd.DataController.SetValue(NewRec, tvAddTglKeluar.Index, dStart);
             end;
           tvAdd.DataController.SetValue(NewRec, tvAddShift.Index, kodeShift);
           tvAdd.DataController.SetValue(NewRec, tvAddMasuk.Index, qryAdd1.Fields[0].AsDateTime);
           tvAdd.DataController.SetValue(NewRec, tvAddKeluar.Index, qryAdd1.Fields[1].AsDateTime);
           tvAdd.DataController.PostEditingData;
           tvAdd.DataController.Post(True);

           {NewRec := tvAdd.DataController.InsertRecord(tvAdd.DataController.RecordCount);
           tvAdd.DataController.SetValue(NewRec, tvAddNik.Index, kodeStaff);
           tvAdd.DataController.SetValue(NewRec, tvAddStaff.Index, namaStaff);}
           tvAdd.DataController.PostEditingData;
           tvAdd.DataController.Post(True);
           dStart := IncDay(dStart, 1);
           Application.ProcessMessages;
         end;
         gtvJadwal.DataController.GotoNext;
     end;
   btnPost.Visible := True;
end;

procedure TfrmJadwalOutletAdd.btnClearJadwalClick(Sender: TObject);
begin
  tvAdd.DataController.SelectAll;
  tvAdd.DataController.DeleteSelection;
end;

procedure TfrmJadwalOutletAdd.edStartPropertiesChange(Sender: TObject);
var
  wHari : Integer;
begin
  wHari := DayOfWeek(edStart.Date);
  //ShowMessage(IntToStr(wHari));
  if (wHari <> 2) then
   begin
        ShowMessage('Tanggal terpilih bukan hari Senin !!');
        Exit;
   end;

end;

procedure TfrmJadwalOutletAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryAdd1.Free;
   qryAdd2.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmJadwalOutletAdd.FormCreate(Sender: TObject);
var
  i, newRec: Integer;
begin
  //
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

  tblShift.Active := True;
  tblShift.Filtered := False;
  tblShift.Filter := '[aktif] = ' + QuotedStr('Y');
  tblShift.Filtered := True;
  tblDivisi.Active := True;
  {}
  edStart.Date := Date;
end;

end.
