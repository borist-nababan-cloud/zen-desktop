unit FMasterKontrakAdd;

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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxCalc, cxCheckBox, DBAccess,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, MyAccess;

type
  TfrmMasterKontrakAdd = class(TForm)
    Label1: TLabel;
    Label16: TLabel;
    edDepartemen: TcxLookupComboBox;
    edNama: TEdit;
    Label2: TLabel;
    edLama: TcxCalcEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edGapok: TcxCalcEdit;
    Label6: TLabel;
    edTransport: TcxCalcEdit;
    Label7: TLabel;
    edUM: TcxCalcEdit;
    Label8: TLabel;
    edKomisi: TcxCalcEdit;
    Label9: TLabel;
    edTunjangan: TcxCalcEdit;
    Label10: TLabel;
    Label11: TLabel;
    edPotongan: TcxCalcEdit;
    ckAdmin: TcxCheckBox;
    ckAktif: TcxCheckBox;
    btnSimpan: TButton;
    btnCancel: TButton;
    Label12: TLabel;
    edPot2: TcxCalcEdit;
    lblKodeKontrak: TLabel;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure edDepartemenKeyPress(Sender: TObject; var Key: Char);
    procedure edNamaKeyPress(Sender: TObject; var Key: Char);
    procedure edLamaKeyPress(Sender: TObject; var Key: Char);
    procedure edGapokKeyPress(Sender: TObject; var Key: Char);
    procedure edTransportKeyPress(Sender: TObject; var Key: Char);
    procedure edUMKeyPress(Sender: TObject; var Key: Char);
    procedure edKomisiKeyPress(Sender: TObject; var Key: Char);
    procedure edTunjanganKeyPress(Sender: TObject; var Key: Char);
    procedure edPotonganKeyPress(Sender: TObject; var Key: Char);
    procedure edPot2KeyPress(Sender: TObject; var Key: Char);
    procedure ckAdminKeyPress(Sender: TObject; var Key: Char);
    procedure ckAktifKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    qryAdd1, qryAdd2, qryExec : TMyQuery;
    procedure InsertData;
    procedure UpdateData;
  public
    { Public declarations }
    IDKONTRAK : Integer;
  end;

var
  frmMasterKontrakAdd: TfrmMasterKontrakAdd;

implementation

{$R *.dfm}

uses FMain, FdmDB, FMasterKontrak;

procedure TfrmMasterKontrakAdd.UpdateData;
var
  strSql : String;
begin
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update ben_hrd_kontrak_master set ' +
       'lamakontrak = ''' + vartostr(edLama.EditValue) + ''',' +
       'gapok = ''' + vartostr(edGapok.EditValue) + ''',' +
       'transport = ''' + vartostr(edTransport.EditValue) + ''',' +
       'uangmakan = ''' + vartostr(edUM.EditValue) + ''',' +
       'komisi = ''' + vartostr(edKomisi.EditValue) + ''',' +
       'tunjangan1 = ''' + vartostr(edTunjangan.EditValue) + ''',' +
       'potongan1 = ''' + vartostr(edPotongan.EditValue) + ''',' +
       'potongan2 = ''' + vartostr(edPot2.EditValue) + ''',' +
       'isadmin = ''' + vartostr(ckAdmin.EditValue) + ''',' +
       'aktif = ''' + vartostr(ckAktif.EditValue) + ''',' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where kodekontrak = ''' + lblKodeKontrak.Caption + ''';');
  strSql := 'update ben_hrd_kontrak_master set ' +
       'lamakontrak = ''' + vartostr(edLama.EditValue) + ''',' +
       'gapok = ''' + vartostr(edGapok.EditValue) + ''',' +
       'transport = ''' + vartostr(edTransport.EditValue) + ''',' +
       'uangmakan = ''' + vartostr(edUM.EditValue) + ''',' +
       'komisi = ''' + vartostr(edKomisi.EditValue) + ''',' +
       'tunjangan1 = ''' + vartostr(edTunjangan.EditValue) + ''',' +
       'potongan1 = ''' + vartostr(edPotongan.EditValue) + ''',' +
       'potongan2 = ''' + vartostr(edPot2.EditValue) + ''',' +
       'isadmin = ''' + vartostr(ckAdmin.EditValue) + ''',' +
       'aktif = ''' + vartostr(ckAktif.EditValue) + ''',' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where kodekontrak = ''' + lblKodeKontrak.Caption + ''';';
    qryExec.SQL.Add('insert into ben_hist_sync values(' +
        '''' + '' + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
        QuotedStr(frmMain.USERAPPS) + ',' +
        '''' + frmMain.APP_OUTLETID + ''',' +
        QuotedStr(strSql) + ',' +
        '''' + 'N' + ''');');
    qryExec.ExecSQL;
    frmMasterKontrak.tblKontrak.Refresh;
    frmMasterKontrak.gtbKontrak.DataController.Refresh;
    ShowMessage('Data Master Kontrak Sudah Tersimpan !');
    frmMasterKontrakAdd.Close;
end;

procedure TfrmMasterKontrakAdd.InsertData;
var
   strSql : String;
begin
  qryAdd1.Close;
  qryAdd1.SQL.Clear;
  qryAdd1.SQL.Add('select autonum from ben_hrd_kontrak_master where namakontrak = ' +
          QuotedStr(edNama.Text) + ' and idoutlet = ''' +
          frmMain.APP_OUTLETID + '''');
  qryAdd1.Open;
  if (NOT qryAdd1.IsEmpty) then
    begin
      ShowMessage('Nama Kontrak ' + edNama.Text + #13 + ' Sudah Ada !');
      Exit;
    end;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('insert into ben_hrd_kontrak_master values(' +
       '''' + '' + ''',' +
       '''' + frmMain.APP_OUTLETID + ''',' +
       '''' + VarToStr(edDepartemen.EditValue) + ''',' +
       '''' + lblKodeKontrak.Caption + ''',' +
       QuotedStr(edNama.Text) + ',' +
       '''' + vartostr(edLama.EditValue) + ''',' +
       '''' + vartostr(edGapok.EditValue) + ''',' +
       '''' + vartostr(edTransport.EditValue) + ''',' +
       '''' + vartostr(edUM.EditValue) + ''',' +
       '''' + vartostr(edKomisi.EditValue) + ''',' +
       '''' + vartostr(edTunjangan.EditValue) + ''',' +
       '''' + '0' + ''',' +
       '''' + vartostr(edPotongan.EditValue) + ''',' +
       '''' + vartostr(edPot2.EditValue) + ''',' +
       '''' + vartostr(ckAdmin.EditValue) + ''',' +
       '''' + vartostr(ckAktif.EditValue) + ''',' +
       '''' + frmMain.USERAPPS + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');

  strSql := 'insert into ben_hrd_kontrak_master values(' +
       '''' + '' + ''',' +
       '''' + frmMain.APP_OUTLETID + ''',' +
       '''' + VarToStr(edDepartemen.EditValue) + ''',' +
       '''' + lblKodeKontrak.Caption + ''',' +
       QuotedStr(edNama.Text) + ',' +
       '''' + vartostr(edLama.EditValue) + ''',' +
       '''' + vartostr(edGapok.EditValue) + ''',' +
       '''' + vartostr(edTransport.EditValue) + ''',' +
       '''' + vartostr(edUM.EditValue) + ''',' +
       '''' + vartostr(edKomisi.EditValue) + ''',' +
       '''' + vartostr(edTunjangan.EditValue) + ''',' +
       '''' + '0' + ''',' +
       '''' + vartostr(edPotongan.EditValue) + ''',' +
       '''' + vartostr(edPot2.EditValue) + ''',' +
       '''' + vartostr(ckAdmin.EditValue) + ''',' +
       '''' + vartostr(ckAktif.EditValue) + ''',' +
       '''' + frmMain.USERAPPS + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');';

    //ShowMessage(strSql);
    qryExec.SQL.Add('insert into ben_hist_sync values(' +
        '''' + '' + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
        QuotedStr(frmMain.USERAPPS) + ',' +
        '''' + frmMain.APP_OUTLETID + ''',' +
        QuotedStr(strSql) + ',' +
        '''' + 'Y' + ''');');

    qryExec.ExecSQL;
    frmMasterKontrak.tblKontrak.Refresh;
    frmMasterKontrak.gtbKontrak.DataController.Refresh;
    ShowMessage('Data Master Kontrak Sudah Tersimpan !');
    frmMasterKontrakAdd.Close;
end;

procedure TfrmMasterKontrakAdd.btnCancelClick(Sender: TObject);
begin
  frmMasterKontrakAdd.Close;
end;

procedure TfrmMasterKontrakAdd.btnSimpanClick(Sender: TObject);
begin
  if (edNama.Text = '') then
    begin
      ShowMessage('Mohon isi Nama Kontrak !');
      Exit;
    end;

  if (btnSimpan.Tag = 1) then
    begin
       InsertData;
    end
  else if (btnSimpan.Tag = 2) then
    begin
       UpdateData;
    end;
end;

procedure TfrmMasterKontrakAdd.ckAdminKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then ckAktif.SetFocus;
end;

procedure TfrmMasterKontrakAdd.ckAktifKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then btnSimpan.SetFocus;
end;

procedure TfrmMasterKontrakAdd.edDepartemenKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edNama.SetFocus;
end;

procedure TfrmMasterKontrakAdd.edGapokKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edTransport.SetFocus;
end;

procedure TfrmMasterKontrakAdd.edKomisiKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edTunjangan.SetFocus;
end;

procedure TfrmMasterKontrakAdd.edLamaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edGapok.SetFocus;
end;

procedure TfrmMasterKontrakAdd.edNamaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edLama.SetFocus;
end;

procedure TfrmMasterKontrakAdd.edPot2KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then ckAdmin.SetFocus;
end;

procedure TfrmMasterKontrakAdd.edPotonganKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edPot2.SetFocus;
end;

procedure TfrmMasterKontrakAdd.edTransportKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edUM.SetFocus;
end;

procedure TfrmMasterKontrakAdd.edTunjanganKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edPotongan.SetFocus;
end;

procedure TfrmMasterKontrakAdd.edUMKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edKomisi.SetFocus;
end;

procedure TfrmMasterKontrakAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryAdd1.Free;
   qryAdd2.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmMasterKontrakAdd.FormCreate(Sender: TObject);
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

end.
