unit FIjinLainInput;

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
  dxSkinXmas2008Blue, DBAccess, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, DB, StdCtrls, cxTextEdit, cxMaskEdit,
  cxCalendar, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, MemDS, MyAccess;

type
  TfrmIjinLainInput = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edKode: TEdit;
    edID: TEdit;
    edNama: TEdit;
    edTglIjin: TcxDateEdit;
    btnFind: TButton;
    btnSave: TButton;
    edKeterangan: TEdit;
    edTglPengajuan: TcxDateEdit;
    btnCancel: TButton;
    edTagIjin: TcxLookupComboBox;
    tblTag: TMyQuery;
    dsTblTag: TDataSource;
    Label6: TLabel;
    lblNoIjin: TLabel;
    procedure btnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure edTglPengajuanKeyPress(Sender: TObject; var Key: Char);
    procedure edTglIjinKeyPress(Sender: TObject; var Key: Char);
    procedure edKeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure edTagIjinKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryLain1, qryLain2, qryExec : TMyQuery;
    procedure CetakData;
  public
    { Public declarations }
  end;

var
  frmIjinLainInput: TfrmIjinLainInput;

implementation

{$R *.dfm}

uses FdmDB, FMain, FIjinLainList, FIjinLainCetak, FMasterKaryawan;

procedure TfrmIjinLainInput.CetakData;
begin
  Application.CreateForm(TfrmIjinLainCetak, frmIjinLainCetak);
   with frmIjinLainCetak do
     begin
       lblTanggal.Caption := FormatDateTime('yyyy-MM-dd', edTglPengajuan.Date);
       lblTglIjin.Caption := FormatDateTime('yyyy-MM-dd', edTglIjin.Date);
       lblKode.Caption := edKode.Text + ' / ' + edID.Text;
       lblNama.Caption := edNama.Text;
       lblKet.Caption := edKeterangan.Text;
       //lblJumlahLembur.Caption := FloatToStr(edLama.EditValue) + ' Jam ';
       lblNoIjin.Caption := 'No Ijin : ' + frmIjinLainInput.lblNoIjin.Caption;
       lblJudul.Caption := 'SURAT ' + UpperCase(edTagIjin.Text);
     end;
   frmIjinLainCetak.qrpIjin.Preview;
end;

procedure TfrmIjinLainInput.edKeteranganKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edTagIjin.SetFocus;
end;

procedure TfrmIjinLainInput.edTagIjinKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then btnSave.SetFocus;
end;

procedure TfrmIjinLainInput.edTglIjinKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edKeterangan.SetFocus;
end;

procedure TfrmIjinLainInput.edTglPengajuanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edTglIjin.SetFocus;
end;

procedure TfrmIjinLainInput.btnCancelClick(Sender: TObject);
begin
  frmIjinLainInput.Close;
end;

procedure TfrmIjinLainInput.btnFindClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 6;
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
      frmMasterKaryawan.btnSelect.Tag := 6;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
    end;
end;

procedure TfrmIjinLainInput.btnSaveClick(Sender: TObject);
var
  noIjin, strSync : String;
begin
  noIjin := 'I.' + frmMain.APP_OUTLETID + '.' + edKode.Text + '.' +
          FormatDateTime('ddMMyy', edTglIjin.Date);
  lblNoIjin.Caption := noIjin;

  qryLain1.Close;
  qryLain1.SQL.Clear;
  qryLain1.SQL.Add('select nomorijin from ben_presensi_ijin where kodekaryawan = ''' +
     edKode.Text + ''' and tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglIjin.Date) + '''');
  qryLain1.Open;
  if (qryLain1.IsEmpty) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into ben_presensi_ijin values(' +
          '''' + '' + ''',' +
          '''' + lblNoIjin.Caption + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd', edTglPengajuan.Date) + ''',' +
          '''' + edKode.Text + ''',' +
          '''' + edID.Text + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd', edTglIjin.Date) + ''',' +
          QuotedStr(edKeterangan.Text) + ',' +
          '''' + vartostr(edTagIjin.EditValue) + ''',' +
          '''' + frmMain.USERAPPS + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
      strSync := 'insert into ben_presensi_ijin values(' +
          '''' + '' + ''',' +
          '''' + lblNoIjin.Caption + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd', edTglPengajuan.Date) + ''',' +
          '''' + edKode.Text + ''',' +
          '''' + edID.Text + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd', edTglIjin.Date) + ''',' +
          QuotedStr(edKeterangan.Text) + ',' +
          '''' + vartostr(edTagIjin.EditValue) + ''',' +
          '''' + frmMain.USERAPPS + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');';

      qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''');');
      qryExec.ExecSQL;
      ShowMessage('Insert data finish');
      frmIjinLainList.qryList.Active := False;
      Sleep(100);
      frmIjinLainList.qryList.Active := True;
      frmIjinLainList.gtbList.DataController.Refresh;

    end
  else if (NOT qryLain1.IsEmpty) then
    begin
      ShowMessage('Data sudah ada, Proses akan mengupdate data sebelumnya');
      lblNoIjin.Caption := qryLain1.Fields[0].AsString;
      qryExec.SQL.Clear;
      qryExec.SQL.Add('update ben_presensi_ijin set ' +
          'tglpengajuan = ''' + FormatDateTime('yyyy-MM-dd', edTglPengajuan.Date) + ''',' +
          'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglIjin.Date) + ''',' +
          'keterangan = ' + QuotedStr(edKeterangan.Text) + ',' +
          'tagpresensi = ''' + vartostr(edTagIjin.EditValue) + ''',' +
          'lastedituser = ''' + frmMain.USERAPPS + ''',' +
          'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
          'where nomorijin = ''' + qryLain1.Fields[0].AsString + ''';');
      strSync := 'update ben_presensi_ijin set ' +
          'tglpengajuan = ''' + FormatDateTime('yyyy-MM-dd', edTglPengajuan.Date) + ''',' +
          'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglIjin.Date) + ''',' +
          'keterangan = ' + QuotedStr(edKeterangan.Text) + ',' +
          'tagpresensi = ''' + vartostr(edTagIjin.EditValue) + ''',' +
          'lastedituser = ''' + frmMain.USERAPPS + ''',' +
          'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
          'where nomorijin = ''' + qryLain1.Fields[0].AsString + ''';';

      qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''');');
      qryExec.ExecSQL;

      ShowMessage('Update data finish');
      frmIjinLainList.qryList.Active := False;
      Sleep(100);
      frmIjinLainList.qryList.Active := True;
      frmIjinLainList.gtbList.DataController.Refresh;
      //frmIjinLainInput.Close;

    end;
    CetakData;
    frmIjinLainInput.Close;
end;

procedure TfrmIjinLainInput.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryLain1.Free;
   qryLain2.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmIjinLainInput.FormCreate(Sender: TObject);
begin
  qryLain1 := TMyQuery.Create(Self);
  qryLain1.Connection := DMDB.dbInternal;
  qryLain1.SQL.Add('select * from temptable');
  qryLain1.Active := true;

  qryLain2 := TMyQuery.Create(Self);
  qryLain2.Connection := DMDB.dbInternal;
  qryLain2.SQL.Add('select * from temptable');
  qryLain2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;


  edTglIjin.Date := Date;
  edTglPengajuan.Date := Date;

  tblTag.Active := True;
end;

end.
