unit FKontrakKerjaUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, DateUtils, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DB, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  StdCtrls, cxCalc, cxCalendar, ExtCtrls, Buttons, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls,
  dxCore, cxDateUtils, MyAccess, MemDS;

type
  TfrmKontrakKerjaUpdate = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edKodekaryawan: TEdit;
    edIdkaryawan: TEdit;
    edNamaKaryawan: TEdit;
    Label1: TLabel;
    Label17: TLabel;
    edOldKodeKontrak: TcxLookupComboBox;
    tblKontrak: TMyTable;
    dsTblKontrak: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edLama: TcxCalcEdit;
    edGapok: TcxCalcEdit;
    edTransport: TcxCalcEdit;
    edUM: TcxCalcEdit;
    edKomisi: TcxCalcEdit;
    edTunjangan: TcxCalcEdit;
    edPot1: TcxCalcEdit;
    btnUpdate: TButton;
    btnCancel: TButton;
    qryKontrak: TMyQuery;
    dsQryKontrak: TDataSource;
    Label16: TLabel;
    edDepartemen: TcxLookupComboBox;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edOldLama: TcxCalcEdit;
    edOldGapok: TcxCalcEdit;
    edOldTransport: TcxCalcEdit;
    edOldUM: TcxCalcEdit;
    edOldKomisi: TcxCalcEdit;
    edOldTunjangan: TcxCalcEdit;
    edOldPotongan: TcxCalcEdit;
    Bevel1: TBevel;
    Label25: TLabel;
    edTglMasuk: TcxDateEdit;
    edTglEnd: TcxDateEdit;
    Label26: TLabel;
    Label27: TLabel;
    edOldTglEnd: TcxDateEdit;
    Label28: TLabel;
    edKodeKontrak: TcxLookupComboBox;
    Bevel2: TBevel;
    Label29: TLabel;
    Label30: TLabel;
    edPot2: TcxCalcEdit;
    Label31: TLabel;
    edOldPot2: TcxCalcEdit;
    edNoKontrak: TEdit;
    edOldNoKontrak: TcxTextEdit;
    tblDivisi: TMyTable;
    dsTblDivisi: TDataSource;
    BitBtn1: TBitBtn;
    Label32: TLabel;
    Label33: TLabel;
    tblType: TMyTable;
    dsTblType: TDataSource;
    Label34: TLabel;
    edTypePayroll: TcxLookupComboBox;
    Label35: TLabel;
    edOldType: TcxLookupComboBox;
    Label36: TLabel;
    edTambLain: TcxCalcEdit;
    Label37: TLabel;
    edOldTambLain: TcxCalcEdit;
    Label38: TLabel;
    edOldTHP: TcxCalcEdit;
    Label39: TLabel;
    edTHP: TcxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure edKodeKontrakPropertiesEditValueChanged(Sender: TObject);
    procedure edKodeKontrakPropertiesChange(Sender: TObject);
    procedure edLamaKeyPress(Sender: TObject; var Key: Char);
    procedure edGapokKeyPress(Sender: TObject; var Key: Char);
    procedure edTransportKeyPress(Sender: TObject; var Key: Char);
    procedure edUMKeyPress(Sender: TObject; var Key: Char);
    procedure edKomisiKeyPress(Sender: TObject; var Key: Char);
    procedure edTunjanganKeyPress(Sender: TObject; var Key: Char);
    procedure edPot1KeyPress(Sender: TObject; var Key: Char);
    procedure edPot2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryKont1, qryKont2, qryExec : TMyQuery;
  public
    { Public declarations }
    ASDAMIN : Boolean;
  end;

var
  frmKontrakKerjaUpdate: TfrmKontrakKerjaUpdate;

implementation

{$R *.dfm}
uses FdmDB, FMain;

procedure TfrmKontrakKerjaUpdate.BitBtn1Click(Sender: TObject);
begin
   if (edNoKontrak.Text <> '') then Exit;
   if (edKodeKontrak.EditValue = Null) then Exit;
   edNoKontrak.Text := frmMain.APP_OUTLETID + '/' + edKodekaryawan.Text + '/' +
       FormatDateTime('yyMM', Date);
   qryKont1.Close;
   qryKont1.SQL.Clear;
   qryKont1.SQL.Add('select lamakontrak, gapok, transport, uangmakan, komisi, tunjangan1, ' +
       'potongan1, potongan2 from ben_hrd_kontrak_master where kodekontrak = ''' +
       vartostr(edKodeKontrak.EditValue) + '''');
   qryKont1.Open;
   edLama.EditValue := qryKont1.Fields[0].AsFloat;
   edGapok.EditValue := qryKont1.Fields[1].AsFloat;
   edTransport.EditValue := qryKont1.Fields[2].AsFloat;
   edUM.EditValue := qryKont1.Fields[3].AsFloat;
   edKomisi.EditValue := qryKont1.Fields[4].AsFloat;
   edTunjangan.EditValue := qryKont1.Fields[5].AsFloat;
   edPot1.EditValue := qryKont1.Fields[6].AsFloat;
   edPot2.EditValue := qryKont1.Fields[7].AsFloat;
   edTglEnd.Date := IncMonth(edOldTglEnd.Date, edLama.EditValue);
   edLama.SetFocus;

end;

procedure TfrmKontrakKerjaUpdate.btnCancelClick(Sender: TObject);
begin
   frmKontrakKerjaUpdate.Close;
end;

procedure TfrmKontrakKerjaUpdate.btnUpdateClick(Sender: TObject);
var
  strSync : String;
begin
  if (edNoKontrak.Text = '') then
    begin
      ShowMessage('No Kontrak Masih Kosong !!');
      Exit;
    end;
  if (edKodeKontrak.EditValue = Null) then
    begin
      ShowMessage('Kode Kontrak Masih Kosong !!');
      Exit;
    end;

  qryExec.SQL.Clear;
  qryExec.SQL.Add('insert into ben_hrd_kontrak_details values(' +
       '''' + '' + ''',' +
       '''' + edNoKontrak.Text + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
       '''' + edKodekaryawan.Text + ''',' +
       '''' + vartostr(edKodeKontrak.EditValue) + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', edTglEnd.Date) + ''',' +
       '''' + vartostr(edLama.EditValue) + ''',' +
       '''' + vartostr(edTHP.EditValue) + ''',' +
       '''' + vartostr(edGapok.EditValue) + ''',' +
       '''' + vartostr(edTransport.EditValue) + ''',' +
       '''' + vartostr(edUM.EditValue) + ''',' +
       '''' + vartostr(edKomisi.EditValue) + ''',' +
       '''' + vartostr(edTunjangan.EditValue) + ''',' +
       '''' + vartostr(edTambLain.EditValue) + ''',' +
       '''' + vartostr(edPot1.EditValue) + ''',' +
       '''' + vartostr(edPot2.EditValue) + ''',' +
       '''' + vartostr(edTypePayroll.EditValue) + ''',' +
       '''' + frmMain.USERAPPS + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');

  strSync := 'insert into ben_hrd_kontrak_details values(' +
       '''' + '' + ''',' +
       '''' + edNoKontrak.Text + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
       '''' + edKodekaryawan.Text + ''',' +
       '''' + vartostr(edKodeKontrak.EditValue) + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', edTglEnd.Date) + ''',' +
       '''' + vartostr(edLama.EditValue) + ''',' +
       '''' + vartostr(edTHP.EditValue) + ''',' +
       '''' + vartostr(edGapok.EditValue) + ''',' +
       '''' + vartostr(edTransport.EditValue) + ''',' +
       '''' + vartostr(edUM.EditValue) + ''',' +
       '''' + vartostr(edKomisi.EditValue) + ''',' +
       '''' + vartostr(edTunjangan.EditValue) + ''',' +
       '''' + vartostr(edTambLain.EditValue) + ''',' +
       '''' + vartostr(edPot1.EditValue) + ''',' +
       '''' + vartostr(edPot2.EditValue) + ''',' +
       '''' + vartostr(edTypePayroll.EditValue) + ''',' +
       '''' + frmMain.USERAPPS + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');';
  qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');
  qryExec.SQL.Add('update ben_hrd_karyawan_info set ' +
      'kodekontrak = ''' + vartostr(edKodeKontrak.EditValue) + ''',' +
      'tglhabiskontrak = ''' + FormatDateTime('yyyy-MM-dd', edTglEnd.Date) + ''' ' +
      'where kodekaryawan = ''' + edKodekaryawan.Text + ''';');
  strSync := 'update ben_hrd_karyawan_info set ' +
      'kodekontrak = ''' + vartostr(edKodeKontrak.EditValue) + ''',' +
      'tglhabiskontrak = ''' + FormatDateTime('yyyy-MM-dd', edTglEnd.Date) + ''' ' +
      'where kodekaryawan = ''' + edKodekaryawan.Text + ''';';
  qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');
  qryExec.ExecSQL;
  ShowMessage('Data Kontrak Sudah Di Update !!');
  frmKontrakKerjaUpdate.Close;
end;

procedure TfrmKontrakKerjaUpdate.edGapokKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then edTransport.SetFocus;
end;

procedure TfrmKontrakKerjaUpdate.edKodeKontrakPropertiesChange(Sender: TObject);
begin
  //ShowMessage('On Change');
end;

procedure TfrmKontrakKerjaUpdate.edKodeKontrakPropertiesEditValueChanged(
  Sender: TObject);
begin
   {qryKont1.Close;
   qryKont1.SQL.Clear;
   qryKont1.SQL.Add('')}
   //ShowMessage('On Edit Value Change');
end;

procedure TfrmKontrakKerjaUpdate.edKomisiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edTunjangan.SetFocus;
end;

procedure TfrmKontrakKerjaUpdate.edLamaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edGapok.SetFocus;
end;

procedure TfrmKontrakKerjaUpdate.edPot1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edPot2.SetFocus;
end;

procedure TfrmKontrakKerjaUpdate.edPot2KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then btnUpdate.SetFocus;
end;

procedure TfrmKontrakKerjaUpdate.edTransportKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edUM.SetFocus;
end;

procedure TfrmKontrakKerjaUpdate.edTunjanganKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edPot1.SetFocus;
end;

procedure TfrmKontrakKerjaUpdate.edUMKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edKomisi.SetFocus;
end;

procedure TfrmKontrakKerjaUpdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryKont1.Free;
   qryKont2.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmKontrakKerjaUpdate.FormCreate(Sender: TObject);
begin
  qryKont1 := TMyQuery.Create(Self);
  qryKont1.Connection := DMDB.dbInternal;
  qryKont1.SQL.Add('select * from temptable');
  qryKont1.Active := true;

  qryKont2 := TMyQuery.Create(Self);
  qryKont2.Connection := DMDB.dbInternal;
  qryKont2.SQL.Add('select * from temptable');
  qryKont2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  tblKontrak.Active := True;
  tblDivisi.Active := True;
  tblType.Active := True;
end;

end.
