unit FKontrakKerjaDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DBAccess,
  DB, Buttons, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCalendar, cxTextEdit, cxMaskEdit, cxCalc, ExtCtrls, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls,
  dxCore, cxDateUtils, MyAccess, MemDS;

type
  TfrmKontrakKerjaDetails = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    edLama: TcxCalcEdit;
    edGapok: TcxCalcEdit;
    edTransport: TcxCalcEdit;
    edUM: TcxCalcEdit;
    edKomisi: TcxCalcEdit;
    edTunjangan: TcxCalcEdit;
    edPot1: TcxCalcEdit;
    Button1: TButton;
    btnCancel: TButton;
    edTglEnd: TcxDateEdit;
    edKodeKontrak: TcxLookupComboBox;
    edPot2: TcxCalcEdit;
    edNoKontrak: TEdit;
    BitBtn1: TBitBtn;
    tblKontrak: TMyTable;
    dsTblKontrak: TDataSource;
    qryKontrak: TMyQuery;
    dsQryKontrak: TDataSource;
    tblDivisi: TMyTable;
    dsTblDivisi: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblKodeKaryawan: TLabel;
    lblNamaKaryawan: TLabel;
    tblType: TMyTable;
    dsTblType: TDataSource;
    Label16: TLabel;
    edTypePayroll: TcxLookupComboBox;
    Label17: TLabel;
    edTambLain: TcxCalcEdit;
    Label18: TLabel;
    edTHP: TcxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    qryKK1, qryKK2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmKontrakKerjaDetails: TfrmKontrakKerjaDetails;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmKontrakKerjaDetails.BitBtn1Click(Sender: TObject);
begin
  qryKK1.Close;
  qryKK1.SQL.Clear;
  qryKK1.SQL.Add('select * from ben_hrd_kontrak_master where kodekontrak = ''' +
      vartostr(edKodeKontrak.EditValue) + '''');
  qryKK1.Open;
  //qryKK1.Last;
  edLama.EditValue := qryKK1.Fields[5].AsFloat;
  edGapok.EditValue := qryKK1.Fields[6].AsFloat;
  edTransport.EditValue := qryKK1.Fields[7].AsFloat;
  edUM.EditValue := qryKK1.Fields[8].AsFloat;
  edKomisi.EditValue := qryKK1.Fields[9].AsFloat;
  edTunjangan.EditValue := qryKK1.Fields[10].AsFloat;
  edPot1.EditValue := qryKK1.Fields[12].AsFloat;
  edPot2.EditValue := qryKK1.Fields[13].AsFloat;
end;

procedure TfrmKontrakKerjaDetails.btnCancelClick(Sender: TObject);
begin
     frmKontrakKerjaDetails.Close;
end;

procedure TfrmKontrakKerjaDetails.Button1Click(Sender: TObject);
var
  strSync : String;
begin
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update ben_hrd_kontrak_details set ' +
       'tglhabis = ''' + FormatDateTime('yyyy-MM-dd', edTglEnd.Date) + ''',' +
       'lama = ''' + vartostr(edLama.EditValue) + ''',' +
       'nthp = ''' + vartostr(edTHP.EditValue) + ''',' +
       'gapok = ''' + vartostr(edGapok.EditValue) + ''',' +
       'transport = ''' + vartostr(edTransport.EditValue) + ''',' +
       'uangmakan = ''' + vartostr(edUM.EditValue) + ''',' +
       'komisi = ''' + vartostr(edKomisi.EditValue) + ''',' +
       'tunjangan1 = ''' + vartostr(edTunjangan.EditValue) + ''',' +
       'tunjangan2 = ''' + vartostr(edTambLain.EditValue) + ''',' +
       'potongan1 = ''' + vartostr(edPot1.EditValue) + ''',' +
       'potongan2 = ''' + vartostr(edPot2.EditValue) + ''',' +
       'typepayroll = ''' + vartostr(edTypePayroll.EditValue) + ''',' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where nokontrak = ''' + edNoKontrak.Text + ''';');
   strSync := 'update ben_hrd_kontrak_details set ' +
       'tglhabis = ''' + FormatDateTime('yyyy-MM-dd', edTglEnd.Date) + ''',' +
       'lama = ''' + vartostr(edLama.EditValue) + ''',' +
       'nthp = ''' + vartostr(edTHP.EditValue) + ''',' +
       'gapok = ''' + vartostr(edGapok.EditValue) + ''',' +
       'transport = ''' + vartostr(edTransport.EditValue) + ''',' +
       'uangmakan = ''' + vartostr(edUM.EditValue) + ''',' +
       'komisi = ''' + vartostr(edKomisi.EditValue) + ''',' +
       'tunjangan1 = ''' + vartostr(edTunjangan.EditValue) + ''',' +
       'tunjangan2 = ''' + vartostr(edTambLain.EditValue) + ''',' +
       'potongan1 = ''' + vartostr(edPot1.EditValue) + ''',' +
       'potongan2 = ''' + vartostr(edPot2.EditValue) + ''',' +
       'typepayroll = ''' + vartostr(edTypePayroll.EditValue) + ''',' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where nokontrak = ''' + edNoKontrak.Text + ''';';
   {qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');}
   qryExec.SQL.Add('update ben_hrd_karyawan_info set ' +
      'tglhabiskontrak = ''' + FormatDateTime('yyyy-MM-dd', edTglEnd.Date) + ''', ' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
      'where kodekaryawan = ''' + lblKodeKaryawan.Caption + ''';');

   strSync := 'update ben_hrd_karyawan_info set ' +
      'tglhabiskontrak = ''' + FormatDateTime('yyyy-MM-dd', edTglEnd.Date) + ''', ' +
      'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
      'where kodekaryawan = ''' + lblKodeKaryawan.Caption + ''';';
   {qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');}
   qryExec.ExecSQL;
   ShowMessage('Data Kontrak Berhasil di Update !');
   frmKontrakKerjaDetails.Close;
end;

procedure TfrmKontrakKerjaDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryKK1.Free;
  qryKK2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmKontrakKerjaDetails.FormCreate(Sender: TObject);
begin
  qryKK1 := TMyQuery.Create(Self);
  qryKK1.Connection := DMDB.dbInternal;
  qryKK1.SQL.Add('select * from temptable');
  qryKK1.Active := true;

  qryKK2 := TMyQuery.Create(Self);
  qryKK2.Connection := DMDB.dbInternal;
  qryKK2.SQL.Add('select * from temptable');
  qryKK2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  tblKontrak.Active := True;
  tblDivisi.Active := True;
  tblType.Active := True;
end;

end.
