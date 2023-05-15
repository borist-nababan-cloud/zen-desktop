unit FIjinPulangList;

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
  TfrmIjinPulangList = class(TForm)
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
    procedure btnAddCutiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCetakUlangClick(Sender: TObject);
    procedure btnCancelCutiClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    qryIjin1, qryIjin2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmIjinPulangList: TfrmIjinPulangList;

implementation

{$R *.dfm}

uses FdmDB, FMain, FIjinLainCetak, FIjinPulangInput;

procedure TfrmIjinPulangList.btnAddCutiClick(Sender: TObject);
begin
   Application.CreateForm(TfrmIjinPulangInput, frmIjinPulangInput);
   frmIjinPulangInput.FormStyle := fsMDIChild;
   frmIjinPulangInput.Show;
end;

procedure TfrmIjinPulangList.btnCancelCutiClick(Sender: TObject);
var
  recSel, btnSelected, i : Integer;
  noIjin, strsync, noIjinCancel : String;
  cancelProc : Boolean;
begin
   recSel := gtbList.DataController.GetFocusedRecordIndex;
   noIjin := vartostr(gtbList.DataController.GetValue(recSel, gtbListnomorijin.Index));
   noIjinCancel := 'CANCEL.' + noIjin;
   btnSelected := MessageDlg('Apakah Anda akan menghapus data Sakit ' + noIjin + '?',mtConfirmation,mbOKCancel, 0);
   if (btnSelected = mrCancel) then Exit;
   {cancelProc := False;
   qryIjin1.Close;
   qryIjin1.SQL.Clear;
   qryIjin1.SQL.Add('select tanggal from ben_presensi_ijin where nomorijin = ''' + noIjin + ''' ORDER BY tanggal ASC');
   qryIjin1.Open;
   qryIjin1.First;
   for i := 0 to qryIjin1.RecordCount-1 do
     begin
       if (qryIjin1.Fields[0].AsDateTime < Date) then
         begin
           cancelProc := True;
         end;
       qryIjin1.Next;
     end;
   if (cancelProc = True) then
     begin
       ShowMessage('Tanggal sudah terlewat, Nomor Ijin Sakit tidak dapat dibatalkan');
       Exit;
     end;}
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update ben_presensi_ijin set ' +
        'nomorijin = ''' + noIjinCancel + ''',' +
        'tagpresensi = ''' + 'ID' + ''',' +
        'tanggal = ''' + '1990-01-01' + ''', ' +
        'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
        'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
        'keterangan = ''' + 'CANCEL IJIN' + ''' ' +
        'where nomorijin = ''' + noIjin + ''';');
   qryExec.ExecSQL;
   btnRefresh.Click;
   ShowMessage('Cancel Data Sakit Finish !');
end;

procedure TfrmIjinPulangList.btnCetakUlangClick(Sender: TObject);
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

procedure TfrmIjinPulangList.btnRefreshClick(Sender: TObject);
begin
  qryList.Active := False;
  Sleep(100);
  qryList.Active := True;
end;

procedure TfrmIjinPulangList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryIjin1.Free;
   qryIjin2.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmIjinPulangList.FormCreate(Sender: TObject);
begin


  qryIjin1 := TMyQuery.Create(Self);
  qryIjin1.Connection := DMDB.dbInternal;
  qryIjin1.SQL.Add('select * from temptable');
  qryIjin1.Active := true;

  qryIjin2 := TMyQuery.Create(Self);
  qryIjin2.Connection := DMDB.dbInternal;
  qryIjin2.SQL.Add('select * from temptable');
  qryIjin2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryList.Active := True;

end;

end.
