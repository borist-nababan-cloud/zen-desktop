unit FIjinTidakMasukList;

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
  dxSkinXmas2008Blue, DB, DBAccess, cxCalc, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxTextEdit, cxMaskEdit,
  cxCalendar, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, MyAccess;

type
  TfrmIjinTidakMasukList = class(TForm)
    Label1: TLabel;
    cxGrid1: TcxGrid;
    gtbList: TcxGridDBTableView;
    gtbListtglpengajuan: TcxGridDBColumn;
    gtbListkodekaryawan: TcxGridDBColumn;
    gtbListidkaryawan: TcxGridDBColumn;
    gtbListnamakaryawan: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    gtbListketerangan: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    btnRefresh: TButton;
    btnCancelCuti: TButton;
    btnAddCuti: TButton;
    btnCetakUlang: TButton;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    gtbListnomorijin: TcxGridDBColumn;
    gtbListtanggal: TcxGridDBColumn;
    gtbListtagpresensi: TcxGridDBColumn;
    gtbListnamatag: TcxGridDBColumn;
    btnAddSakit: TButton;
    procedure btnAddCutiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCetakUlangClick(Sender: TObject);
    procedure btnCancelCutiClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnAddSakitClick(Sender: TObject);
  private
    { Private declarations }
    qryIjin1, qryIjin2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmIjinTidakMasukList: TfrmIjinTidakMasukList;

implementation

{$R *.dfm}

uses FdmDB, FMain, FIjinTidakMasuk, FIjinLainCetak, FSakitInput;

procedure TfrmIjinTidakMasukList.btnAddCutiClick(Sender: TObject);
begin
   Application.CreateForm(TfrmIjinTidakMasuk, frmIjinTidakMasuk);
   frmIjinTidakMasuk.Show;
end;

procedure TfrmIjinTidakMasukList.btnAddSakitClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSakitInput, frmSakitInput);
   frmSakitInput.Show;
end;

procedure TfrmIjinTidakMasukList.btnCancelCutiClick(Sender: TObject);
var
  recSel : Integer;
  noIjin, strsync : String;
begin
   recSel := gtbList.DataController.GetFocusedRecordIndex;
   noIjin := vartostr(gtbList.DataController.GetValue(recSel, gtbListnomorijin.Index));
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update ben_presensi_ijin set ' +
        'tanggal = ''' + '1990-01-01' + ''', ' +
        'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
        'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
        'keterangan = ''' + 'CANCEL IJIN' + ''' ' +
        'where nomorijin = ''' + noIjin + ''';');
   strsync := 'update ben_presensi_ijin set ' +
        'tanggal = ''' + '1990-01-01' + ''', ' +
        'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
        'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
        'keterangan = ''' + 'CANCEL IJIN' + ''' ' +
        'where nomorijin = ''' + noIjin + ''';';
   qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''');');
   qryExec.ExecSQL;
   btnRefresh.Click;
   ShowMessage('Cancel Data Cuti Finish !');
end;

procedure TfrmIjinTidakMasukList.btnCetakUlangClick(Sender: TObject);
var
  recSel : Integer;
  tglAju, tglIjin : TDate;
  kode, idFinger, nama, keterangan, judul, noIjin : String;
begin
  recSel := gtbList.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  Application.CreateForm(TfrmIjinLainCetak, frmIjinLainCetak);
  kode := vartostr(gtbList.DataController.GetValue(recSel, gtbListkodekaryawan.Index));
  idFinger := vartostr(gtbList.DataController.GetValue(recSel, gtbListidkaryawan.Index));
  nama := vartostr(gtbList.DataController.GetValue(recSel, gtbListnamakaryawan.Index));
  keterangan := vartostr(gtbList.DataController.GetValue(recSel, gtbListketerangan.Index));
  judul := vartostr(gtbList.DataController.GetValue(recSel, gtbListnamatag.Index));
  noIjin := vartostr(gtbList.DataController.GetValue(recSel, gtbListnomorijin.Index));

   with frmIjinLainCetak do
     begin
       lblTanggal.Caption := FormatDateTime('yyyy-MM-dd', tglAju);
       lblTglIjin.Caption := FormatDateTime('yyyy-MM-dd', tglIjin);
       lblKode.Caption := kode + ' / ' + idFinger;
       lblNama.Caption := nama;
       lblKet.Caption := keterangan;
       //lblJumlahLembur.Caption := FloatToStr(edLama.EditValue) + ' Jam ';
       lblNoIjin.Caption := 'No Ijin : ' + noIjin;
       lblJudul.Caption := 'SURAT ' + UpperCase(judul);
     end;
   frmIjinLainCetak.qrpIjin.Prepare;
   frmIjinLainCetak.qrpIjin.Preview;
end;

procedure TfrmIjinTidakMasukList.btnRefreshClick(Sender: TObject);
begin
  qryList.Active := False;
  Sleep(100);
  qryList.Active := True;
end;

procedure TfrmIjinTidakMasukList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryIjin1.Free;
   qryIjin2.Free;
   Action := caFree;
end;

procedure TfrmIjinTidakMasukList.FormCreate(Sender: TObject);
begin
  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryIjin1 := TMyQuery.Create(Self);
  qryIjin1.Connection := DMDB.dbInternal;
  qryIjin1.SQL.Add('select * from temptable');
  qryIjin1.Active := true;

  qryIjin2 := TMyQuery.Create(Self);
  qryIjin2.Connection := DMDB.dbInternal;
  qryIjin2.SQL.Add('select * from temptable');
  qryIjin2.Active := true;

  qryList.Active := True;

end;

end.
