unit FLemburList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, DBAccess,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, MyAccess, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.Menus, cxButtons;

type
  TfrmLemburList = class(TForm)
    Label1: TLabel;
    gtbLembur: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    btnRefresh: TButton;
    btnCancelCuti: TButton;
    btnAddCuti: TButton;
    btnCetakUlang: TButton;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    gtbLemburnomorlembur: TcxGridDBColumn;
    gtbLemburtglpengajuan: TcxGridDBColumn;
    gtbLemburkodekaryawan: TcxGridDBColumn;
    gtbLemburtanggal: TcxGridDBColumn;
    gtbLemburidkaryawan: TcxGridDBColumn;
    gtbLemburnamakaryawan: TcxGridDBColumn;
    gtbLemburlastedituser: TcxGridDBColumn;
    gtbLemburlasteditdate: TcxGridDBColumn;
    gtbLemburketerangan: TcxGridDBColumn;
    gtbLemburjstart: TcxGridDBColumn;
    gtbLemburjend: TcxGridDBColumn;
    gtbLemburjumlah: TcxGridDBColumn;
    edTanggal: TcxDateEdit;
    Label2: TLabel;
    btnFilter: TcxButton;
    procedure btnAddCutiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelCutiClick(Sender: TObject);
    procedure btnCetakUlangClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
  private
    { Private declarations }
    qryList1, qryList2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmLemburList: TfrmLemburList;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterKaryawan, FlemburCetak, FlemburInput;

procedure TfrmLemburList.btnAddCutiClick(Sender: TObject);
begin
  Application.CreateForm(TfrmLemburInput, frmLemburInput);
  frmLemburInput.Show;
  frmLemburInput.Position := poDesktopCenter;
  frmLemburInput.edQuickSearch.SetFocus;
end;

procedure TfrmLemburList.btnCancelCutiClick(Sender: TObject);
var
  recSel, btnSelected : Integer;
  NoLembur, strsync, NoLemburCancel : String;
  vCancel : TDateTime;
begin
  recSel := gtbLembur.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  NoLembur := vartostr(gtbLembur.DataController.GetValue(recSel, gtbLemburnomorlembur.Index));
  btnSelected := MessageDlg('Apakah Anda akan menghapus data lembur ' + NoLembur + '?',mtConfirmation,mbOKCancel, 0);
  if (btnSelected = mrCancel) then Exit;
  NoLemburCancel := NoLembur + '.CANCEL';
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update ben_presensi_lembur set ' +
           'nomorlembur = ''' + NoLemburCancel + ''',' +
           'tglpengajuan = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
           'tanggal = ''' + '1990-01-01' + ''',' +
           'keterangan = ' + QuotedStr('CANCEL') + ',' +
           'jstart = ''' + '00:00:00' + ''',' +
           'jend = ''' + '00:00:00' + ''',' +
           'jmasuk = ''' + '1990-01-01 00:00:00' + ''',' +
           'jkeluar = ''' + '1990-01-01 00:00:00' + ''',' +
           'lembstart = ''' + '1990-01-01 00:00:00' + ''',' +
           'lembend = ''' + '1990-01-01 00:00:00' + ''',' +
           'jumlah = ''' + FloatToStr(0) + ''',' +
           'lastedituser = ''' + frmMain.USERAPPS + ''',' +
           'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
           'where nomorlembur = ''' + NoLembur + ''';');

  {strsync := 'update ben_presensi_lembur set ' +
           'tglpengajuan = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
           'tanggal = ''' + '1990-01-01' + ''',' +
           'keterangan = ''' + QuotedStr('CANCEL') + ',' +
           'jstart = ''' + '00:00:00' + ''',' +
           'jend = ''' + '00:00:00' + ''',' +
           'jumlah = ''' + FloatToStr(0) + ''',' +
           'lastedituser = ''' + frmMain.USERAPPS + ''',' +
           'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
           'where nomorlembur = ''' + NoLembur + ''';';

  qryExec.SQL.Add('insert into ben_hist_sync values(' +
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
  ShowMessage('Cancel Lembur Finish !');

end;

procedure TfrmLemburList.btnCetakUlangClick(Sender: TObject);
var
  recSel, lama : Integer;
  tglLembur, tglAju : TDate;
  jStart, jEnd : TTime;
  kode, idFinger, nama, keterangan, NoLembur : String;
begin
  recSel := gtbLembur.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  kode := vartostr(gtbLembur.DataController.GetValue(recSel, gtbLemburkodekaryawan.Index));
  idFinger := vartostr(gtbLembur.DataController.GetValue(recSel, gtbLemburidkaryawan.Index));
  nama := vartostr(gtbLembur.DataController.GetValue(recSel, gtbLemburnamakaryawan.Index));
  keterangan := vartostr(gtbLembur.DataController.GetValue(recSel, gtbLemburketerangan.Index));
  NoLembur := vartostr(gtbLembur.DataController.GetValue(recSel, gtbLemburnomorlembur.Index));
  tglAju := VarToDateTime(gtbLembur.DataController.GetValue(recSel, gtbLemburtglpengajuan.Index));
  tglLembur := VarToDateTime(gtbLembur.DataController.GetValue(recSel, gtbLemburtglpengajuan.Index));
  jStart := VarToDateTime(gtbLembur.DataController.GetValue(recSel, gtbLemburjstart.Index));
  jEnd := VarToDateTime(gtbLembur.DataController.GetValue(recSel, gtbLemburjend.Index));
  lama := gtbLembur.DataController.GetValue(recSel, gtbLemburjumlah.Index);
  Application.CreateForm(TfrmLemburCetak, frmLemburCetak);
  with frmLemburCetak do
     begin
       lblTanggal.Caption := FormatDateTime('yyyy-MM-dd', tglAju);
       lblTglLembur.Caption := FormatDateTime('yyyy-MM-dd', tglLembur);
       lblJLembur.Caption := FormatDateTime('hh:mm', jStart) + ' - ' +
                             FormatDateTime('hh:mm', jEnd);
       lblKode.Caption := kode + ' / ' + idFinger;
       lblNama.Caption := nama;
       lblNoLembur.Caption := NoLembur;
       lblKet.Caption := keterangan;
       lblJumlahLembur.Caption := FloatToStr(lama) + ' Jam ';
       lblNoLembur.Caption := 'No Lembur : ' + lblNoLembur.Caption;
     end;
   frmLemburCetak.qrpLembur.Preview;
end;

procedure TfrmLemburList.btnFilterClick(Sender: TObject);
begin
  qryList.Close;
  qryList.SQL.Clear;
  qryList.SQL.Add('select nomorlembur, tglpengajuan, kodekaryawan, tanggal, ' +
       '(select ben_hrd_karyawan_info.idkaryawan from ben_hrd_karyawan_info ' +
       'where ben_hrd_karyawan_info.kodekaryawan = ben_presensi_lembur.kodekaryawan) ' +
       'as idkaryawan, (select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan_info ' +
       'where ben_hrd_karyawan_info.kodekaryawan = ben_presensi_lembur.kodekaryawan) as namakaryawan, ' +
       'lastedituser, lasteditdate, keterangan, jstart, jend, jumlah from ben_presensi_lembur ' +
       'WHERE ben_presensi_lembur.tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + '''');
  qryList.Open;
  gtbLembur.DataController.Refresh;
end;

procedure TfrmLemburList.btnRefreshClick(Sender: TObject);
begin
  qryList.Active := False;
  Sleep(100);
  qryList.Active := True;
  gtbLembur.DataController.Refresh;
end;

procedure TfrmLemburList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryList1.Free;
   qryList2.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmLemburList.FormCreate(Sender: TObject);
begin
  qryList1 := TMyQuery.Create(Self);
  qryList1.Connection := DMDB.dbInternal;
  qryList1.SQL.Add('select * from temptable');
  qryList1.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryList2 := TMyQuery.Create(Self);
  qryList2.Connection := DMDB.dbInternal;
  qryList2.SQL.Add('select * from temptable');
  qryList2.Active := true;

  edTanggal.Date := Date;
  qryList.Active := True;

end;

end.
