unit FIjinCutiList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, StdCtrls, DateUtils, cxTextEdit, cxCalc, cxCalendar, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, MyAccess;

type
  TfrmIjinCutiList = class(TForm)
    qryList: TMyQuery;
    dsQryList: TDataSource;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    gtbListnomorcuti: TcxGridDBColumn;
    gtbListtglpengajuan: TcxGridDBColumn;
    gtbListkodekaryawan: TcxGridDBColumn;
    gtbListidkaryawan: TcxGridDBColumn;
    gtbListnamakaryawan: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    gtbListtglstart: TcxGridDBColumn;
    gtbListtglend: TcxGridDBColumn;
    gtbListjumlah: TcxGridDBColumn;
    btnRefresh: TButton;
    btnCancelCuti: TButton;
    btnAddCuti: TButton;
    btnCetakUlang: TButton;
    gtbListketerangan: TcxGridDBColumn;
    gtbListsisa: TcxGridDBColumn;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCancelCutiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddCutiClick(Sender: TObject);
    procedure btnCetakUlangClick(Sender: TObject);
  private
    { Private declarations }
    qryTemp, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmIjinCutiList: TfrmIjinCutiList;

implementation

{$R *.dfm}

uses FdmDB, FMain, FIjinCuti, FIjinCutiCetak;

procedure TfrmIjinCutiList.btnRefreshClick(Sender: TObject);
begin
  qryList.Active := False;
  Sleep(100);
  qryList.Active := True;
  gtbList.DataController.Refresh;
  gtbList.DataController.GotoFirst;
end;

procedure TfrmIjinCutiList.btnAddCutiClick(Sender: TObject);
begin
   if (not frmMain.IsFormOpen('frmIjinCuti')) then
       begin
            Application.CreateForm(TfrmIjinCuti, frmIjinCuti);
            frmIjinCuti.FormStyle := fsMDIChild;
            frmIjinCuti.Show;
            frmIjinCuti.Position := poDesktopCenter;
       end
   else if (frmMain.IsFormOpen('frmIjinCuti')) then
       begin
            frmIjinCuti.Show;
            frmIjinCuti.Position := poDesktopCenter;
       end;
end;

procedure TfrmIjinCutiList.btnCancelCutiClick(Sender: TObject);
var
  tglCuti : TDate;
  recSel, tahun, btnSelected, i : Integer;
  noCuti, kode, strsync, keterangan, noCutiCancel : String;
  jmlh, saldo, sEnd : Double;
  cancelProc : Boolean;
begin
   recSel := gtbList.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   noCuti := vartostr(gtbList.DataController.GetValue(recSel, gtbListnomorcuti.Index));
   kode := vartostr(gtbList.DataController.GetValue(recSel, gtbListkodekaryawan.Index));
   jmlh := gtbList.DataController.GetValue(recSel, gtbListjumlah.Index);
   tglCuti := VarToDateTime(gtbList.DataController.GetValue(recSel, gtbListtglstart.Index));
   keterangan := vartostr(gtbList.DataController.GetValue(recSel, gtbListketerangan.Index));
   qryTemp.Close;
   qryTemp.SQL.Clear;
   qryTemp.SQL.Add('select tanggal from ben_presensi_cuti where nomorcuti = ''' + noCuti + ''' ORDER BY tanggal ASC');
   qryTemp.Open;
   qryTemp.First;
   cancelProc := False;
   for i :=0 to qryTemp.RecordCount-1 do
     begin
       if (qryTemp.Fields[0].AsDateTime < Date) then
         begin
             cancelProc := True;
             ShowMessage('Data Cuti sudah terlewat, Cuti tidak dapat dibatalkan !');
         end;
       qryTemp.Next;
     end;
   if (cancelProc = True) then Exit;
   if (keterangan = 'CANCEL') then
     begin
       ShowMessage('Maaf Cuti sudah di cancel');
       Exit;
     end;
   btnSelected := MessageDlg('Apakah Anda akan menghapus data Cuti ' + noCuti + '?',mtConfirmation,mbOKCancel, 0);
   if (btnSelected = mrCancel) then Exit;
   tahun := YearOf(tglCuti);
   qryTemp.Close;
   qryTemp.SQL.Clear;
   qryTemp.SQL.Add('select sisa from ben_saldo_cuti where kodekaryawan = ''' +
       kode + ''' AND tahun = ''' + IntToStr(tahun) + '''');
   qryTemp.Open;
   saldo := qryTemp.Fields[0].AsFloat;
   sEnd := saldo + jmlh;
   noCutiCancel := 'CANCEL.' + noCuti;
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update ben_presensi_cuti set ' +
      'nomorcuti = ''' + noCutiCancel + ''',' +
      'tanggal = ''' + '1900-01-01' + ''',' +
      'tglstart = ''' + '1900-01-01' + ''',' +
      'tglend = ''' + '1900-01-01' + ''',' +
      'jumlah = ''' + '0' + ''',' +
      'saldo = ''' + '0' + ''',' +
      'sisa = ''' + '0' + ''',' +
      'tagpresensi = ''' + 'ID' + ''',' +
      'keterangan = ''' + 'CANCEL' + ''', ' +
      'lastedituser = ''' + frmMain.USERAPPS + ''',' +
      'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
      'where nomorcuti = ''' + noCuti + ''';');

   {strsync := 'update ben_presensi_cuti set ' +
      'tanggal = ''' + '1900-01-01' + ''',' +
      'keterangan = ''' + 'CANCEL' + ''' ' +
      'where nomorcuti = ''' + noCuti + ''';';

   qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMenuMain.IDOUTLET + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');'); }
   qryExec.SQL.Add('update ben_saldo_cuti set ' +
       'sisa = ''' + FloatToStr(sEnd) + ''' WHERE kodekaryawan = ''' +
       kode + ''' AND tahun = ''' + IntToStr(tahun) + '''');
   qryExec.ExecSQL;
   ShowMessage('Cancel Data Cuti Selesai');
   btnRefresh.Click;
end;

procedure TfrmIjinCutiList.btnCetakUlangClick(Sender: TObject);
var
  recSel : Integer;
  noCuti, kode, idKaryawan, nama, keterangan : String;
  jmlh, sisa : Double;
  tglStart, tglEnd, tglAju : TDate;
begin
   recSel := gtbList.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   noCuti := vartostr(gtbList.DataController.GetValue(recSel, gtbListnomorcuti.Index));
   kode := vartostr(gtbList.DataController.GetValue(recSel, gtbListkodekaryawan.Index));
   nama := vartostr(gtbList.DataController.GetValue(recSel, gtbListnamakaryawan.Index));
   keterangan := vartostr(gtbList.DataController.GetValue(recSel, gtbListketerangan.Index));
   idKaryawan := vartostr(gtbList.DataController.GetValue(recSel, gtbListidkaryawan.Index));
   jmlh := gtbList.DataController.GetValue(recSel, gtbListjumlah.Index);
   sisa := gtbList.DataController.GetValue(recSel, gtbListsisa.Index);
   tglStart := VarToDateTime(gtbList.DataController.GetValue(recSel, gtbListtglstart.Index));
   tglEnd := VarToDateTime(gtbList.DataController.GetValue(recSel, gtbListtglend.Index));
   tglAju := VarToDateTime(gtbList.DataController.GetValue(recSel, gtbListtglpengajuan.Index));
  Application.CreateForm(TfrmIjinCutiCetak, frmIjinCutiCetak);
   with frmIjinCutiCetak do
     begin
       lblTanggal.Caption := FormatDateTime('yyyy-MM-dd', tglAju);
       lblStart.Caption := FormatDateTime('yyyy-MM-dd', tglStart);
       lblEnd.Caption := FormatDateTime('yyyy-MM-dd', tglEnd);
       lblKode.Caption := kode + ' / ' + idKaryawan;
       lblNama.Caption := nama;
       lblKet.Caption := keterangan;
       lblCuti.Caption := 'Jumlah : ' + FloatToStr(jmlh) +
            ' Sisa : ' + FloatToStr(sisa) + ' hari';
       lblNomor.Caption :=  'No Cuti ' + noCuti;
     end;
   frmIjinCutiCetak.qrpCuti.Preview;
end;

procedure TfrmIjinCutiList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryTemp.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmIjinCutiList.FormCreate(Sender: TObject);
begin
  qryTemp := TMyQuery.Create(Self);
  qryTemp.Connection := DMDB.dbInternal;
  qryTemp.SQL.Add('select * from temptable');
  qryTemp.Active := true;
  qryList.Active := True;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryList.Active := True;
  gtbList.DataController.Refresh;
  gtbList.DataController.GotoFirst;
end;

end.
