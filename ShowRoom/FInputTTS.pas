unit FInputTTS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridLevel, cxGrid, ExtCtrls,
  StdCtrls, cxTextEdit, cxCalendar, cxCalc, cxContainer, cxMaskEdit,
  cxDropDownEdit, Menus, cxGridExportLink, StrUtils,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  Vcl.ComCtrls, dxCore, cxDateUtils, MyAccess, DBAccess, MemDS;

type
  TfrmInputTTS = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbTTS: TcxGridDBTableView;
    gtbTTSautonum: TcxGridDBColumn;
    gtbTTSid_spk: TcxGridDBColumn;
    gtbTTStanggal: TcxGridDBColumn;
    gtbTTSno_spk: TcxGridDBColumn;
    gtbTTSamount: TcxGridDBColumn;
    Label20: TLabel;
    Bevel4: TBevel;
    edTTSIDSPK: TcxTextEdit;
    Label1: TLabel;
    edTglTTS: TcxDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNoSPKTTS: TcxTextEdit;
    edAmountTTS: TcxCalcEdit;
    Label4: TLabel;
    pmTTS: TPopupMenu;
    btnSave: TButton;
    HapusTerpilih1: TMenuItem;
    Label5: TLabel;
    edNoTTS: TcxTextEdit;
    gtbTTSno_tts: TcxGridDBColumn;
    Label6: TLabel;
    edPaymentTTS: TcxComboBox;
    N2: TMenuItem;
    EditTTS1: TMenuItem;
    btnPrint: TButton;
    gtbTTSpayment_type: TcxGridDBColumn;
    Label7: TLabel;
    edTypeTTS: TcxTextEdit;
    Label8: TLabel;
    edWarnaTTS: TcxTextEdit;
    Label9: TLabel;
    edNamaTTS: TcxTextEdit;
    Label10: TLabel;
    edAlamatTTS: TcxTextEdit;
    Label11: TLabel;
    edKotaTTS: TcxTextEdit;
    Button1: TButton;
    lbNoRek: TLabel;
    edNoRek: TcxLookupComboBox;
    lbBank: TLabel;
    edIDBank: TcxLookupComboBox;
    edNoReff: TcxTextEdit;
    lbNoReff: TLabel;
    edBankReff: TcxTextEdit;
    lbTglMsk: TLabel;
    edTglMskBank: TcxDateEdit;
    lbTglJatuhTempo: TLabel;
    edTglJatuhTempo: TcxDateEdit;
    Label12: TLabel;
    edAuthorize: TcxLookupComboBox;
    lblCoa: TLabel;
    Label14: TLabel;
    N1: TMenuItem;
    N3: TMenuItem;
    Button2: TButton;
    Button3: TButton;
    memPayment: TMemo;
    memUntuk: TMemo;
    memTerimadari: TMemo;
    qryTTS: TMyQuery;
    dsQryTTS: TMyDataSource;
    tblMengetahui: TMyTable;
    dsTblMengetahui: TMyDataSource;
    tblrekening: TMyTable;
    dsTblRekening: TMyDataSource;
    tblBank: TMyTable;
    dsTblBank: TMyDataSource;
    procedure btnSaveClick(Sender: TObject);
    procedure HapusTerpilih1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure EditTTS1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edPaymentTTSPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edNoRekPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryExec,qryCari, qryFind, qryTemp, qryCek : TMyQuery;
    STRSQL : String;
    procedure KirimSms;
    procedure SimpanTtsBaru;
    procedure PREPARE_SEARCH;
  public
    { Public declarations }
    TR_ID_KAS, TR_PERIODE_KAS, TR_NUMBER_KAS, TR_KAS, USERAPP : string;
    TR_ID_BANK, TR_PERIODE_BANK, TR_NUMBER_BANK, TR_BANK : string;
    TR_ID_CG, TR_PERIODE_CG, TR_NUMBER_CG, TR_CG : string;

    function CreateNewAutoNum_kas: string;
    function CreateNewAutoNum_bank: string;
    function CreateNewAutoNum_cg: string;

  end;

var
  frmInputTTS: TfrmInputTTS;

implementation

{$R *.dfm}

uses FdmDB, FInputSPK, FMain, FCetakTTSBaru;

procedure TfrmInputTTS.PREPARE_SEARCH;
begin

end;

function TfrmInputTTS.CreateNewAutoNum_kas: String;
var
    lastID, strTmpNum, strNum, NewID, kodeBwi : string;
    intTmpNum, intNum: integer;
begin
    with dmDB do
        begin
              NewID := TR_ID_KAS + '.' + TR_PERIODE_KAS + '.';

              qrySearch.Close;
              qrySearch.SQL.Clear;
              qrySearch.SQL.Add('SELECT id_transaksi FROM kas_mstr ' +
                                'WHERE id_transaksi LIKE ''' + NewID + '%'' ORDER BY id_transaksi ASC');
              qrySearch.Open;

              if (qrySearch.IsEmpty) then
                  begin
                        Result := TR_ID_KAS + '.' + TR_PERIODE_KAS + '.' + '001';
                        exit;
                  end;

              qrySearch.Last;
              lastID := qrySearch.Fields[0].AsString;
              //strTmpNum := Copy(lastID, length(lastID) - 2, 3);
              strTmpNum := RightStr(lastID, 3);
              intTmpNum := strtoint(strTmpNum);
              intNum := intTmpNum + 1;

              case length(inttostr(intNum)) of
                    // 1 : strNum := '0000' + inttostr(intNum);
                    // 2 : strNum := '000' + inttostr(intNum);
                    1: strNum := '00' + inttostr(intNum);
                    2: strNum := '0' + inttostr(intNum);
                    3: strNum := inttostr(intNum);
              end;

              TR_NUMBER_KAS := strNum;
              TR_KAS := TR_ID_KAS + '.' + TR_PERIODE_KAS + '.' + TR_NUMBER_KAS;
              Result := TR_KAS;
        end;
end;

function TfrmInputTTS.CreateNewAutoNum_bank: String;
var
    lastID, strTmpNum, strNum, NewID: string;
    intTmpNum, intNum: integer;
begin
    with dmDB do
        begin
              NewID := TR_ID_BANK + '.' + TR_PERIODE_BANK + '.';

              qrySearch.Close;
              qrySearch.SQL.Clear;
              qrySearch.SQL.Add('SELECT id_transaksi FROM bank_mstr ' +
                                'WHERE id_transaksi LIKE ''' + NewID + '%'' ORDER BY id_transaksi ASC');
              qrySearch.Open;

              if (qrySearch.IsEmpty) then
                  begin
                        Result := TR_ID_BANK + '.' + TR_PERIODE_BANK + '.' + '001';
                        exit;
                  end;

              qrySearch.Last;
              lastID := qrySearch.Fields[0].AsString;
              strTmpNum := Copy(lastID, length(lastID) - 2, 3);
              intTmpNum := strtoint(strTmpNum);
              intNum := intTmpNum + 1;

              case length(inttostr(intNum)) of
                    // 1 : strNum := '0000' + inttostr(intNum);
                    // 2 : strNum := '000' + inttostr(intNum);
                    1: strNum := '00' + inttostr(intNum);
                    2: strNum := '0' + inttostr(intNum);
                    3: strNum := inttostr(intNum);
              end;

              TR_NUMBER_BANK := strNum;
              TR_BANK := TR_ID_BANK + '.' + TR_PERIODE_BANK + '.' + TR_NUMBER_BANK;
              Result := TR_BANK;
        end;
end;

function TfrmInputTTS.CreateNewAutoNum_cg: String;
var
    lastID, strTmpNum, strNum, NewID: string;
    intTmpNum, intNum: integer;
begin
    with dmDB do
        begin
              NewID := TR_ID_CG + '.' + TR_PERIODE_CG + '.';

              qrySearch.Close;
              qrySearch.SQL.Clear;
              qrySearch.SQL.Add('SELECT id_transaksi FROM cek_giro_mstr ' +
                                'WHERE id_transaksi LIKE ''' + NewID + '%'' ORDER BY id_transaksi ASC');
              qrySearch.Open;

              if (qrySearch.IsEmpty) then
                  begin
                        Result := TR_ID_CG + '.' + TR_PERIODE_CG + '.' + '001';
                        exit;
                  end;

              qrySearch.Last;
              lastID := qrySearch.Fields[0].AsString;
              strTmpNum := Copy(lastID, length(lastID) - 2, 3);
              intTmpNum := strtoint(strTmpNum);
              intNum := intTmpNum + 1;

              case length(inttostr(intNum)) of
                    // 1 : strNum := '0000' + inttostr(intNum);
                    // 2 : strNum := '000' + inttostr(intNum);
                    1: strNum := '00' + inttostr(intNum);
                    2: strNum := '0' + inttostr(intNum);
                    3: strNum := inttostr(intNum);
              end;

              TR_NUMBER_CG := strNum;
              TR_CG := TR_ID_CG + '.' + TR_PERIODE_CG + '.' + TR_NUMBER_CG;
              Result := TR_CG;
        end;
end;

function Terbilang(x :integer):string;
const abil : array[0..11] of string[10]=('','Satu','Dua','Tiga', 'Empat','Lima','Enam','Tujuh','Delapan','Sembilan', 'Sepuluh','Sebelas');
begin

     if (x < 12) then
         Result := ' ' + abil[x]
     else if (x < 20) then
         Result := Terbilang(x-10) + ' Belas'
     else if (x < 100) then
         Result := Terbilang(x div 10) + ' Puluh' + Terbilang(x mod 10)
     else if (x < 200) then
         Result := ' Seratus' + Terbilang(x-100)
     else if (x < 1000) then
         Result := Terbilang(x div 100) + ' Ratus' + Terbilang(x mod 100)
     else if (x < 2000) then
         Result := ' Seribu' + Terbilang(x-1000)
     else if (x < 1000000) then
         Result := Terbilang(x div 1000) + ' Ribu' + Terbilang(x mod 1000)
     else if (x < 1000000000) then
         Result := Terbilang(x div 1000000) + ' Juta' + Terbilang(x mod 1000000);
end;

procedure TfrmInputTTS.SimpanTtsBaru;
var
  TtsSeq : Integer;
  qryTtsBaru : TMyQuery;
begin
  qryTtsBaru := TMyQuery.Create(Self);
  qryTtsBaru.Connection := DMDB.dbInternal;
  qryTtsBaru.SQL.Add('select * from temptable');
  qryTtsBaru.Active := true;
  //qryTtsBaru.SQL.Add('select * from emptyx');

  with dmDB do
    begin
     if ((edPaymentTTS.EditValue = 'DEBET') OR (edPaymentTTS.EditValue = 'TRANSFER') OR (edPaymentTTS.EditValue = 'KREDIT')) then
     begin
       memPayment.Lines.Add(edPaymentTTS.Text);
       memPayment.Lines.Add(edNoRek.Text);
       memPayment.Lines.Add(edIDBank.Text);
     end
   else if ((edPaymentTTS.EditValue = 'CEK') OR (edPaymentTTS.EditValue = 'GIRO')) then
     begin
       memPayment.Lines.Add(edPaymentTTS.Text);
       memPayment.Lines.Add(edNoReff.Text);
       memPayment.Lines.Add(edBankReff.Text);
     end
   else
     begin
       memPayment.Lines.Add(edPaymentTTS.Text);
       memPayment.Lines.Add(edNoReff.Text);
     end;

     TtsSeq := StrToInt(edNoTTS.Text);

     //Amount := Round(frmInputTTS.edAmountTTS.EditValue);
     //JumlahUang := Terbilang(Amount) + ' Rupiah';
     //frmCetakTTSBaru.lblTerbilang.Caption := JumlahUang;
     MemTerimaDari.Lines.Add(frmInputTTS.edNamaTTS.Text);
     MemTerimaDari.Lines.Add(frmInputTTS.edAlamatTTS.Text);
     MemTerimaDari.Lines.Add(frmInputTTS.edKotaTTS.Text);
     memUntuk.Lines.Add('Uang Muka Kendaraan DAIHATSU');
     memUntuk.Lines.Add(frmInputTTS.edTypeTTS.Text + ' ' + frmInputTTS.edWarnaTTS.Text);
     //Amount := Round(frmInputTTS.edAmountTTS.EditValue);
     //JumlahUang := Terbilang(Amount) + ' Rupiah';
     //frmCetakTTSBaru.lblTerbilang.Caption := JumlahUang;
     //frmCetakTTSBaru.lblUntukPembayaran.Caption := 'Uang Muka Kendaraan DAIHATSU' + #13 +
             //frmInputTTS.edTypeTTS.Text + ' ' + frmInputTTS.edWarnaTTS.Text;
     //memPayment.Lines.Add(frmInputTTS.edPaymentTTS.Text + ' ' + frmInputTTS.edNoReff.Text);
     //frmCetakTTSBaru.lblJumlah.Caption := FormatFloat('#,#', frmInputTTS.edAmountTTS.EditValue);
     //frmCetakTTSBaru.lblDate.Caption := FormatDateTime('dd MMMM yyyy', frmInputTTS.edTglTTS.Date);
     //frmCetakTTSBaru.lblMengetahui.Caption := edAuthorize.Text;
     //memPayment.Lines.Add(edPaymentTTS.Text);
    qryTtsBaru.Close;
    qryTtsBaru.SQL.Clear;
    qryTtsBaru.SQL.Add('select autonum from ben_logku where nokuitansi = ''' +
        IntToStr(TtsSeq) + '''');
    qryTtsBaru.Open;
    if (qryTtsBaru.IsEmpty) then
      begin
        //ShowMessage('1');
        qryExec.SQL.Clear;
        qryExec.SQL.Add('insert into ben_logku values(' +
             '''' + '' + ''',' +
             '''' + inttostr(TtsSeq) + ''',' +
             '''' + frmInputSPK.edIDSpk.Text + ''',' +
             '''' + 'UM' + ''',' +
             '''' + 'TTS' + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
             '''' + MemTerimaDari.Text + ''',' +
             '''' + FloatToStr(edAmountTTS.EditValue) + ''',' +
             '''' + MemUntuk.Text + ''',' +
             '''' + MemPayment.Text + ''',' +
             '''' + edAuthorize.Text + ''',' +
             '''' + frmMain.NAMEAPPS + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
        qryExec.ExecSQL;
      end
    else if (NOT qryTtsBaru.IsEmpty) then
      begin
        qryExec.SQL.Clear;
        qryExec.SQL.Add('update ben_logku set ' +
             'id_spk = ''' + frmInputSPK.edIDSpk.Text + ''',' +
             'tglcetak = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
             'terima_dari = ''' + MemTerimaDari.Text + ''',' +
             'jumlah = ''' + FloatToStr(edAmountTTS.EditValue) + ''',' +
             'untuk_pembayaran = ''' + MemUntuk.Text + ''',' +
             'cek_giro = ''' + MemPayment.Text + ''',' +
             'mengetahui = ''' + edAuthorize.Text + ''',' +
             'userapp = ''' + frmMain.USERAPPS + ''',' +
             'log_cetak = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
             'where nokuitansi = ''' + IntToStr(TtsSeq) + ''';');
        qryExec.ExecSQL;
      end;
    end;
  qryTtsBaru.Free;
end;

procedure TfrmInputTTS.KirimSms;
var
  isiSMS : String;
begin
  edNoTTS.PostEditValue;
     if (edNoTTS.Text = 'LUNAS') then
          begin
               with dmDB do
                    begin
                        qryCari.Close;
                        qryCari.SQL.Clear;
                        qryCari.SQL.Add('SELECT isi_text FROM mstr_sms WHERE ' +
                                        'id_jenis = ''' + 'TTS_LUNAS' + '''');
                        qryCari.Open;

                        //ISI NAMA PEMBELI
                        isiSMS := ReplaceStr(qryCari.Fields[0].AsString, 'NAMA_PEMBELI', edNamaTTS.Text);

                        //ISI JUMLAH UANG
                        isiSMS := ReplaceStr(isiSMS, 'JUMLAH_UANG', FormatFloat('#,0.#', edAmountTTS.EditValue));

                        //ISI TYPE KENDARAAN
                        isiSMS := ReplaceStr(isiSMS, 'ID_TYPE', frmInputSPK.edTypeKendaraan.Text);

                        //ISI WARNA KENDARAAN
                        isiSMS := ReplaceStr(isiSMS, 'ID_WARNA', frmInputSPK.edWarna.Text);

                        //ISI TANGGAL BAYAR
                        isiSMS := ReplaceStr(isiSMS, 'TGL_BAYAR', FormatDateTime('dd-mm-yyyy', edTglTTS.Date));
                        //isiSms := ReplaceStr(isiSMS, )

                    end;

               if (frmInputSPK.edHPPembeli.EditValue = NULL) then
                    begin
                         ShowMessage('No. HP pembeli kosong' + #13 +
                                    'Auto SMS gagal dikirim');
                    end
               else
                    begin
                        qrySearch.Close;
                        qrySearch.SQL.Clear;
                        qrySearch.SQL.Add('SELECT * FROM bcsmsdb.sent_items WHERE ' +
                                                'no_tujuan = ''' + frmInputSPK.edHPPembeli.Text + ''' AND ' +
                                                'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''' AND ' +
                                                'isi_text = ''' + isiSMS + '''');
                        qrySearch.Open;

                        if (qrySearch.IsEmpty) then
                            begin
                                  {qryFind.Close;
                                  qryFind.SQL.Clear;
                                  qryFind.SQL.Add('SELECT * FROM bcsmsdb.out_box WHERE ' +
                                                          'no_tujuan = ''' + frmInputSPK.edHPPembeli.Text + ''' AND ' +
                                                          'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''' AND ' +
                                                          'isi_text = ''' + isiSMS + '''');
                                  qryFind.Open;

                                  if (qryFind.IsEmpty) then
                                      begin
                                             qrySMSExec.SQL.Clear;
                                             qrySMSExec.SQL.Add('INSERT INTO bcsmsdb.out_box VALUES(' +
                                                                '''' + '' + ''', ' +
                                                                '''' + '1' + ''', ' +
                                                                '''' + '1' + ''', ' +
                                                                '''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''', ' +
                                                                '''' + FormatDateTime('HH:MM:SS', Time) + ''', ' +
                                                                '''' + edNamaTTS.Text + ''', ' +
                                                                '''' + frmInputSPK.edHPPembeli.Text + ''', ' +
                                                                '''' + isiSMS + ''', ' +
                                                                '''' + 'N' + ''', ' +
                                                                '''' + 'SHOWROOM' + ''')');
                                             qrySMSExec.ExecSQL;
                                      end;}
                            end;
                    end;
          end
     else
          begin
               with dmDB do
                    begin
                        qryCari.Close;
                        qryCari.SQL.Clear;
                        qryCari.SQL.Add('SELECT isi_text FROM mstr_sms WHERE ' +
                                        'id_jenis = ''' + 'TTS' + '''');
                        qryCari.Open;

                        //ISI NAMA PEMBELI
                        isiSMS := ReplaceStr(qryCari.Fields[0].AsString, 'NAMA_PEMBELI', edNamaTTS.Text);

                        //ISI JUMLAH UANG
                        isiSMS := ReplaceStr(isiSMS, 'JUMLAH_UANG', FormatFloat('#,0.#', edAmountTTS.EditValue));

                        //ISI TYPE KENDARAAN
                        isiSMS := ReplaceStr(isiSMS, 'ID_TYPE', frmInputSPK.edTypeKendaraan.Text);

                        //ISI WARNA KENDARAAN
                        isiSMS := ReplaceStr(isiSMS, 'ID_WARNA', frmInputSPK.edWarna.Text);

                        //ISI TANGGAL BAYAR
                        isiSMS := ReplaceStr(isiSMS, 'TGL_BAYAR', FormatDateTime('dd-mm-yyyy', edTglTTS.Date));
                    end;

               if (frmInputSPK.edHPPembeli.EditValue = NULL) then
                    begin
                         ShowMessage('No. HP pembeli kosong' + #13 +
                                    'Auto SMS gagal dikirim');
                    end
               else
                    begin
                        {dmDB.qrySearch.Close;
                        dmDB.qrySearch.SQL.Clear;
                        dmDB.qrySearch.SQL.Add('SELECT * FROM bcsmsdb.sent_items WHERE ' +
                                                'no_tujuan = ''' + frmInputSPK.edHPPembeli.Text + ''' AND ' +
                                                'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''' AND ' +
                                                'isi_text = ''' + isiSMS + '''');
                        dmDB.qrySearch.Open;

                        if (dmDB.qrySearch.IsEmpty) then
                            begin
                                  dmDB.qryFind.Close;
                                  dmDB.qryFind.SQL.Clear;
                                  dmDB.qryFind.SQL.Add('SELECT * FROM bcsmsdb.out_box WHERE ' +
                                                          'no_tujuan = ''' + frmInputSPK.edHPPembeli.Text + ''' AND ' +
                                                          'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''' AND ' +
                                                          'isi_text = ''' + isiSMS + '''');
                                  dmDB.qryFind.Open;

                                  if (dmDB.qryFind.IsEmpty) then
                                      begin
                                             qrySMSExec.SQL.Clear;
                                             qrySMSExec.SQL.Add('INSERT INTO bcsmsdb.out_box VALUES(' +
                                                                '''' + '' + ''', ' +
                                                                '''' + '1' + ''', ' +
                                                                '''' + '1' + ''', ' +
                                                                '''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''', ' +
                                                                '''' + FormatDateTime('HH:MM:SS', Time) + ''', ' +
                                                                '''' + edNamaTTS.Text + ''', ' +
                                                                '''' + frmInputSPK.edHPPembeli.Text + ''', ' +
                                                                '''' + isiSMS + ''', ' +
                                                                '''' + 'N' + ''', ' +
                                                                '''' + 'SHOWROOM' + ''')');
                                             qrySMSExec.ExecSQL;
                                      end;
                            end;}
                    end;
          end;

     with dmDB do
          begin
                qrySearch.Close;
                qrySearch.SQL.Clear;
                qrySearch.SQL.Add('SELECT * FROM print_kuitansi WHERE ' +
                                  'id_spk = ''' + edTTSIDSPK.Text + ''' AND ' +
                                  'tanggal_print = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + '''');
                qrySearch.Open;

                if (qrySearch.IsEmpty) then
                      begin
                            qryExec.SQL.Clear;
                            qryExec.SQL.Add('INSERT INTO print_kuitansi VALUES(' +
                                            '''' + '' + ''',' +
                                            '''' + edTTSIDSPK.Text + ''',' +
                                            '''' + frmInputSPK.edIDKendaraan.Text + ''',' +
                                            '''' + frmInputSPK.edTypeKendaraan.EditValue + ''',' +
                                            '''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''',' +
                                            '''' + edNoTTS.Text + ''',' +
                                            '''' + FloatToStr(edAmountTTS.EditValue) + ''',' +
                                            '''' + edPaymentTTS.Text + ''',' +
                                            '''' + '' + ''',' +
                                            '''' + '' + ''',' +
                                            '''' + '' + ''',' +
                                            '''' + '' + ''',' +
                                            '''' + '' + ''',' +
                                            '''' + '' + ''')');
                            qryExec.ExecSQL;
                      end
                else
                      begin
                             qryExec.SQL.Clear;
                             qryExec.SQL.Add('UPDATE print_kuitansi SET ' +
                                             'id_kendaraan = ''' + frmInputSPK.edIDKendaraan.Text + ''',' +
                                             'id_type = ''' + frmInputSPK.edTypeKendaraan.EditValue + ''',' +
                                             'no_tts = ''' + edNoTTS.Text + ''',' +
                                             'amount_tts = ''' + FloatToStr(edAmountTTS.EditValue) + ''',' +
                                             'payment_type_tts = ''' + edPaymentTTS.Text + ''' ' +
                                             'where id_spk = ''' + edTTSIDSPK.Text + ''' AND ' +
                                             'tanggal_print = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + '''');
                             qryExec.ExecSQL;
                      end;

                //authorize
                qryCek.Close;
                qryCek.SQL.Clear;
                qryCek.SQL.Add('SELECT * FROM authorize_printout WHERE id_spk = ''' +
                                edTTSIDSPK.Text + ''' AND ' +
                                'jenis = ''' + 'TTS' + ''' AND ' +
                                'notes = ''' + edNoTTS.Text + '''');
                qryCek.Open;

                if (qryCek.IsEmpty) then
                    begin
                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('INSERT INTO authorize_printout VALUES(' +
                                          '''' + '' + ''', ' +
                                          '''' + edTTSIDSPK.Text + ''', ' +
                                          '''' + edAuthorize.Text + ''', ' +
                                          '''' + 'TTS' + ''', ' +
                                          '''' + edNoTTS.Text + ''')');
                          qryExec.ExecSQL;
                    end
                else
                    begin
                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('UPDATE authorize_printout SET ' +
                                          'authorize = ''' + edAuthorize.Text + ''' ' +
                                          'WHERE id_spk = ''' + edTTSIDSPK.Text + ''' AND ' +
                                          'jenis = ''' + 'TTS' + ''' AND ' +
                                          'notes = ''' + edNoTTS.Text + '''');
                          qryExec.ExecSQL;
                    end;
          end;
end;

procedure TfrmInputTTS.btnPrintClick(Sender: TObject);
var
   JumlahUang, isiSMS : String;
   Amount : Integer;
begin
     {if (edAuthorize.EditValue = NULL) then
          begin
              ShowMessage('Kolom Mengetahui masih kosong.' + #13 +
                          'Silahkan isi terlebih dahulu!');
              Exit;
          end;

     btnSave.Click;

     Application.CreateForm(TfrmPrintTTS, frmPrintTTS);
     frmPrintTTS.qlTerimaDari.Caption := frmInputTTS.edNamaTTS.Text + ' ' + frmInputTTS.edAlamatTTS.Text +
                                         ' ' + frmInputTTS.edKotaTTS.Text;
     Amount := Round(frmInputTTS.edAmountTTS.EditValue);
     JumlahUang := Terbilang(Amount) + ' Rupiah';
     frmPrintTTS.qlBanyakUang.Caption := JumlahUang;
     frmPrintTTS.qlType.Caption := frmInputTTS.edTypeTTS.Text + ' ' + frmInputTTS.edWarnaTTS.Text;
     frmPrintTTS.qlJenisByr.Caption := frmInputTTS.edPaymentTTS.Text + ' ' + frmInputTTS.edNoReff.Text;
     frmPrintTTS.qlJumlahRp.Caption := FormatFloat('#,#', frmInputTTS.edAmountTTS.EditValue);
     frmPrintTTS.qlLocDate.Caption := FormatDateTime('dd MMMM yyyy', frmInputTTS.edTglTTS.Date);

     frmPrintTTS.qrlPICAuthorize.Caption := edAuthorize.Text;

     //INPUT TO OUTBOX AUTOSMS
     edNoTTS.PostEditValue;
     if (edNoTTS.Text = 'LUNAS') then
          begin
               with dmDB do
                    begin
                        qryCari.Close;
                        qryCari.SQL.Clear;
                        qryCari.SQL.Add('SELECT isi_text FROM mstr_sms WHERE ' +
                                        'id_jenis = ''' + 'TTS_LUNAS' + '''');
                        qryCari.Open;

                        //ISI NAMA PEMBELI
                        isiSMS := ReplaceStr(qryCari.Fields[0].AsString, 'NAMA_PEMBELI', edNamaTTS.Text);

                        //ISI JUMLAH UANG
                        isiSMS := ReplaceStr(isiSMS, 'JUMLAH_UANG', FormatFloat('#,0.#', edAmountTTS.EditValue));

                        //ISI TYPE KENDARAAN
                        isiSMS := ReplaceStr(isiSMS, 'ID_TYPE', frmInputSPK.edTypeKendaraan.Text);

                        //ISI WARNA KENDARAAN
                        isiSMS := ReplaceStr(isiSMS, 'ID_WARNA', frmInputSPK.edWarna.Text);

                        //ISI TANGGAL BAYAR
                        isiSMS := ReplaceStr(isiSMS, 'TGL_BAYAR', FormatDateTime('dd-mm-yyyy', edTglTTS.Date));
                        //isiSms := ReplaceStr(isiSMS, )

                    end;

               if (frmInputSPK.edHPPembeli.EditValue = NULL) then
                    begin
                         ShowMessage('No. HP pembeli kosong' + #13 +
                                    'Auto SMS gagal dikirim');
                    end
               else
                    begin
                        dmDB.qrySearch.Close;
                        dmDB.qrySearch.SQL.Clear;
                        dmDB.qrySearch.SQL.Add('SELECT * FROM bcsmsdb.sent_items WHERE ' +
                                                'no_tujuan = ''' + frmInputSPK.edHPPembeli.Text + ''' AND ' +
                                                'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''' AND ' +
                                                'isi_text = ''' + isiSMS + '''');
                        dmDB.qrySearch.Open;

                        if (dmDB.qrySearch.IsEmpty) then
                            begin
                                  dmDB.qryFind.Close;
                                  dmDB.qryFind.SQL.Clear;
                                  dmDB.qryFind.SQL.Add('SELECT * FROM bcsmsdb.out_box WHERE ' +
                                                          'no_tujuan = ''' + frmInputSPK.edHPPembeli.Text + ''' AND ' +
                                                          'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''' AND ' +
                                                          'isi_text = ''' + isiSMS + '''');
                                  dmDB.qryFind.Open;

                                  if (dmDB.qryFind.IsEmpty) then
                                      begin
                                             qrySMSExec.SQL.Clear;
                                             qrySMSExec.SQL.Add('INSERT INTO bcsmsdb.out_box VALUES(' +
                                                                '''' + '' + ''', ' +
                                                                '''' + '1' + ''', ' +
                                                                '''' + '1' + ''', ' +
                                                                '''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''', ' +
                                                                '''' + FormatDateTime('HH:MM:SS', Time) + ''', ' +
                                                                '''' + edNamaTTS.Text + ''', ' +
                                                                '''' + frmInputSPK.edHPPembeli.Text + ''', ' +
                                                                '''' + isiSMS + ''', ' +
                                                                '''' + 'N' + ''', ' +
                                                                '''' + 'SHOWROOM' + ''')');
                                             qrySMSExec.ExecSQL;
                                      end;
                            end;
                    end;
          end
     else
          begin
               with dmDB do
                    begin
                        qryCari.Close;
                        qryCari.SQL.Clear;
                        qryCari.SQL.Add('SELECT isi_text FROM mstr_sms WHERE ' +
                                        'id_jenis = ''' + 'TTS' + '''');
                        qryCari.Open;

                        //ISI NAMA PEMBELI
                        isiSMS := ReplaceStr(qryCari.Fields[0].AsString, 'NAMA_PEMBELI', edNamaTTS.Text);

                        //ISI JUMLAH UANG
                        isiSMS := ReplaceStr(isiSMS, 'JUMLAH_UANG', FormatFloat('#,0.#', edAmountTTS.EditValue));

                        //ISI TYPE KENDARAAN
                        isiSMS := ReplaceStr(isiSMS, 'ID_TYPE', frmInputSPK.edTypeKendaraan.Text);

                        //ISI WARNA KENDARAAN
                        isiSMS := ReplaceStr(isiSMS, 'ID_WARNA', frmInputSPK.edWarna.Text);

                        //ISI TANGGAL BAYAR
                        isiSMS := ReplaceStr(isiSMS, 'TGL_BAYAR', FormatDateTime('dd-mm-yyyy', edTglTTS.Date));
                    end;

               if (frmInputSPK.edHPPembeli.EditValue = NULL) then
                    begin
                         ShowMessage('No. HP pembeli kosong' + #13 +
                                    'Auto SMS gagal dikirim');
                    end
               else
                    begin
                        dmDB.qrySearch.Close;
                        dmDB.qrySearch.SQL.Clear;
                        dmDB.qrySearch.SQL.Add('SELECT * FROM bcsmsdb.sent_items WHERE ' +
                                                'no_tujuan = ''' + frmInputSPK.edHPPembeli.Text + ''' AND ' +
                                                'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''' AND ' +
                                                'isi_text = ''' + isiSMS + '''');
                        dmDB.qrySearch.Open;

                        if (dmDB.qrySearch.IsEmpty) then
                            begin
                                  dmDB.qryFind.Close;
                                  dmDB.qryFind.SQL.Clear;
                                  dmDB.qryFind.SQL.Add('SELECT * FROM bcsmsdb.out_box WHERE ' +
                                                          'no_tujuan = ''' + frmInputSPK.edHPPembeli.Text + ''' AND ' +
                                                          'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''' AND ' +
                                                          'isi_text = ''' + isiSMS + '''');
                                  dmDB.qryFind.Open;

                                  if (dmDB.qryFind.IsEmpty) then
                                      begin
                                             qrySMSExec.SQL.Clear;
                                             qrySMSExec.SQL.Add('INSERT INTO bcsmsdb.out_box VALUES(' +
                                                                '''' + '' + ''', ' +
                                                                '''' + '1' + ''', ' +
                                                                '''' + '1' + ''', ' +
                                                                '''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''', ' +
                                                                '''' + FormatDateTime('HH:MM:SS', Time) + ''', ' +
                                                                '''' + edNamaTTS.Text + ''', ' +
                                                                '''' + frmInputSPK.edHPPembeli.Text + ''', ' +
                                                                '''' + isiSMS + ''', ' +
                                                                '''' + 'N' + ''', ' +
                                                                '''' + 'SHOWROOM' + ''')');
                                             qrySMSExec.ExecSQL;
                                      end;
                            end;
                    end;
          end;

     with dmDB do
          begin
                qrySearch.Close;
                qrySearch.SQL.Clear;
                qrySearch.SQL.Add('SELECT * FROM print_kuitansi WHERE ' +
                                  'id_spk = ''' + edTTSIDSPK.Text + ''' AND ' +
                                  'tanggal_print = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + '''');
                qrySearch.Open;

                if (qrySearch.IsEmpty) then
                      begin
                            qryExec.SQL.Clear;
                            qryExec.SQL.Add('INSERT INTO print_kuitansi VALUES(' +
                                            '''' + '' + ''',' +
                                            '''' + edTTSIDSPK.Text + ''',' +
                                            '''' + frmInputSPK.edIDKendaraan.Text + ''',' +
                                            '''' + frmInputSPK.edTypeKendaraan.EditValue + ''',' +
                                            '''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''',' +
                                            '''' + edNoTTS.Text + ''',' +
                                            '''' + FloatToStr(edAmountTTS.EditValue) + ''',' +
                                            '''' + edPaymentTTS.Text + ''',' +
                                            '''' + '' + ''',' +
                                            '''' + '' + ''',' +
                                            '''' + '' + ''',' +
                                            '''' + '' + ''',' +
                                            '''' + '' + ''',' +
                                            '''' + '' + ''')');
                            qryExec.ExecSQL;
                      end
                else
                      begin
                             qryExec.SQL.Clear;
                             qryExec.SQL.Add('UPDATE print_kuitansi SET ' +
                                             'id_kendaraan = ''' + frmInputSPK.edIDKendaraan.Text + ''',' +
                                             'id_type = ''' + frmInputSPK.edTypeKendaraan.EditValue + ''',' +
                                             'no_tts = ''' + edNoTTS.Text + ''',' +
                                             'amount_tts = ''' + FloatToStr(edAmountTTS.EditValue) + ''',' +
                                             'payment_type_tts = ''' + edPaymentTTS.Text + ''' ' +
                                             'where id_spk = ''' + edTTSIDSPK.Text + ''' AND ' +
                                             'tanggal_print = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + '''');
                             qryExec.ExecSQL;
                      end;

                //authorize
                qryCek.Close;
                qryCek.SQL.Clear;
                qryCek.SQL.Add('SELECT * FROM authorize_printout WHERE id_spk = ''' +
                                edTTSIDSPK.Text + ''' AND ' +
                                'jenis = ''' + 'TTS' + ''' AND ' +
                                'notes = ''' + edNoTTS.Text + '''');
                qryCek.Open;

                if (qryCek.IsEmpty) then
                    begin
                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('INSERT INTO authorize_printout VALUES(' +
                                          '''' + '' + ''', ' +
                                          '''' + edTTSIDSPK.Text + ''', ' +
                                          '''' + edAuthorize.Text + ''', ' +
                                          '''' + 'TTS' + ''', ' +
                                          '''' + edNoTTS.Text + ''')');
                          qryExec.ExecSQL;
                    end
                else
                    begin
                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('UPDATE authorize_printout SET ' +
                                          'authorize = ''' + edAuthorize.Text + ''' ' +
                                          'WHERE id_spk = ''' + edTTSIDSPK.Text + ''' AND ' +
                                          'jenis = ''' + 'TTS' + ''' AND ' +
                                          'notes = ''' + edNoTTS.Text + '''');
                          qryExec.ExecSQL;
                    end;
          end;

     frmPrintTTS.qrpTTS.Preview; }
end;

procedure TfrmInputTTS.btnSaveClick(Sender: TObject);
var
   noUrut : Integer;
   jenisTTS, coa, noSPK, noTTS, pembeli, tipe : string;
begin
     if (LeftStr(frmInputSPK.edNoSPK.Text, 1) = 'B') then noTTS := 'B' + edNoTTS.Text
     else noTTS := edNoTTS.Text;

     with dmDB do
          begin
               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from mstr_tts where id_spk = ''' +
                               edTTSIDSPK.Text + ''' and no_tts = ''' +
                               noTTS + '''');
               qryCari.Open;
               if (qryCari.IsEmpty) then
                   begin
                        //ShowMessage('data gak ada');
                        qryExec.SQL.Clear;
                        qryExec.SQL.Add('insert into mstr_tts values(' +
                                        '''' + '' + ''',' +
                                        '''' + edTTSIDSPK.Text + ''',' +
                                        '''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''',' +
                                        '''' + edNoSPKTTS.Text + ''',' +
                                        '''' + FloatToStr(edAmountTTS.EditValue) + ''',' +
                                        '''' + noTTS + ''',' +
                                        '''' + edPaymentTTS.Text + ''')');
                        qryExec.ExecSQL;
                   end
               else if (NOT qryCari.IsEmpty) then
                   begin
                        //ShowMessage('data ada');
                        noUrut := qryCari.Fields[0].AsInteger;
                        //ShowMessage(IntToStr(noUrut));
                        qryExec.SQL.Clear;
                        qryExec.SQL.Add('update mstr_tts set ' +
                                        'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTglTTS.Date) + ''',' +
                                        'amount = ''' + FloatToStr(edAmountTTS.EditValue) + ''',' +
                                        'payment_type = ''' + edPaymentTTS.Text + ''', ' +
                                        'no_tts = ''' + noTTS + ''' ' +
                                        'where autonum = ''' + IntToStr(noUrut) + '''');
                        qryExec.ExecSQL;
                   end;


               qryTTS.Close;
               qryTTS.SQL.Clear;
               qryTTS.SQL.Add('select * from mstr_tts where id_spk = ''' +
                        frmInputSPK.edIDSpk.Text + '''');
               qryTTS.Open;
               gtbTTS.DataController.Refresh;

               //INPUT KAS & BANK
               //cari no urut tts
               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from mstr_tts where id_spk = ''' +
                               edTTSIDSPK.Text + ''' and no_tts = ''' +
                               noTTS + '''');
               qryCari.Open;
               noUrut := qryCari.Fields[0].AsInteger;
               {if (LeftStr(edNoSPKTTS.Text,1) = 'P') then idCabang := '.3'
               else if (LeftStr(edNoSPKTTS.Text,1) <> 'P') then idCabang := '.1';}

               if (edNoTTS.EditValue = 'LUNAS') then
                    begin
                        jenisTTS  := 'TTS PELUNASAN';
                        coa       := lblCoa.Caption;
                        noSPK     := 'No. SPK : ' + edNoSPKTTS.EditValue;
                        noTTS   := '';
                        pembeli   := ' - ' + edNamaTTS.Text;
                        tipe      := ' - ' + frmInputSPK.edTypeKendaraan.Text;
                    end
               else
                    begin
                        jenisTTS  := 'TTS UANG MUKA';
                        coa       := lblCoa.Caption;
                        noSPK     := 'No. SPK : ' + edNoSPKTTS.EditValue;
                        noTTS     := ' - No. TTS : ' + noTTS;
                        pembeli   := ' - ' + edNamaTTS.Text;
                        tipe      := ' - ' + frmInputSPK.edTypeKendaraan.Text;
                    end;

               if (edPaymentTTS.EditValue = 'TUNAI') then
                  begin
                      qryCari.Close;
                      qryCari.SQL.Clear;
                      qryCari.SQL.Add('select * from kas_mstr where notes LIKE ''' +
                                       'TTS%' + ''' AND ' +
                                       'no_reff_trans = ''' + IntToStr(noUrut) + '''');
                      qryCari.Open;

                      if (qryCari.IsEmpty) then
                          begin
                                //master
                                TR_KAS := CreateNewAutoNum_kas();

                                qryExec.SQL.Clear;
                                qryExec.SQL.Add('INSERT INTO kas_mstr VALUES(' +
                                               '''' + TR_KAS + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglTTS.Date) + ''' , ' +
                                               '''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               '''' + 'MASUK' + ''' , ' +
                                               '''' + USERAPP + ''' , ' +
                                               '''' + jenisTTS + ''' , ' +
                                               '''' + IntToStr(noUrut) + ''')');
                               qryExec.ExecSQL;

                               //detail
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('INSERT INTO kas_detail VALUES(' +
                                               '''' + ''  + ''' , ' +
                                               '''' + TR_KAS + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglTTS.Date) + ''' , ' +
                                               '''' + 'BKM/' + FormatDateTime('mm', edTglTTS.Date) + '/0001' + ''' , ' +
                                               '''' + coa + ''' , ' +
                                               '''' + noSPK + noTTS + pembeli + tipe + ''' , ' +
                                               '''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               '''' + 'MASUK' + ''' , ' +
                                               '''' + VarToStr(edTTSIDSPK.EditValue) + ''' , ' +
                                               '''' + VarToStr(edNoTTS.EditValue) + ''')');
                               qryExec.ExecSQL;
                          end
                      else
                          begin
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('UPDATE kas_mstr SET ' +
                                              'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglTTS.Date) + ''' , ' +
                                              'total = ''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                              'status = ''' + 'MASUK' + ''', ' +
                                              'user_id = ''' + USERAPP + ''' ' +
                                              'Where id_transaksi = ''' + qryCari.Fields[0].AsString + '''');
                               qryExec.ExecSQL;

                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('UPDATE kas_detail SET ' +
                                               'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglTTS.Date) + ''' , ' +
                                               'id_coa = ''' + coa + ''', ' +
                                               'keterangan = ''' + noSPK + noTTS + pembeli + tipe + ''', ' +
                                               'subtotal = ''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               'status = ''' + 'MASUK' + ''' ' +
                                               'Where id_transaksi = ''' + qryCari.Fields[0].AsString + '''');
                               qryExec.ExecSQL;
                          end;

                      //masuk bank
                      edNoReff.Clear;
                      edBankReff.Clear;

                      lbTglMsk.Visible := True;
                      edTglMskBank.Visible := True;

                      qryCari.Close;
                      qryCari.SQL.Clear;
                      qryCari.SQL.Add('select * from bank_mstr where notes LIKE ''' +
                                       'TTS%' + ''' AND ' +
                                       'no_reff_trans = ''' + IntToStr(noUrut) + '''');
                      qryCari.Open;

                      if (qryCari.IsEmpty) then
                          begin
                                //master
                                TR_BANK := CreateNewAutoNum_bank();

                                qryExec.SQL.Clear;
                                qryExec.SQL.Add('INSERT INTO bank_mstr VALUES(' +
                                               '''' + TR_BANK + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglMskBank.Date) + ''' , ' +
                                               '''' + VarToStr(edIDBank.EditValue) + ''' , ' +
                                               '''' + VarToStr(edNoRek.EditValue) + ''' , ' +
                                               '''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               '''' + 'MASUK' + ''' , ' +
                                               '''' + USERAPP + ''' , ' +
                                               '''' + jenisTTS + ''' , ' +
                                               '''' + IntToStr(noUrut) + ''')');
                               qryExec.ExecSQL;

                               //detail
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('INSERT INTO bank_detail VALUES(' +
                                               '''' + ''  + ''' , ' +
                                               '''' + TR_BANK + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglMskBank.Date) + ''' , ' +
                                               '''' + 'BBM/' + FormatDateTime('mm', edTglMskBank.Date) + '/0001' + ''' , ' +
                                               '''' + coa + ''' , ' +
                                               '''' + noSPK + noTTS + pembeli + tipe + ''' , ' +
                                               '''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               '''' + 'MASUK' + ''' , ' +
                                               '''' + VarToStr(edIDBank.EditValue) + ''' , ' +
                                               '''' + VarToStr(edNoRek.EditValue) + ''' , ' +
                                               '''' + VarToStr(edTTSIDSPK.EditValue) + ''' , ' +
                                               '''' + VarToStr(edNoTTS.EditValue) + ''')');
                               qryExec.ExecSQL;
                          end
                      else
                          begin
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('UPDATE bank_mstr SET ' +
                                              'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglMskBank.Date) + ''' , ' +
                                              'id_bank = ''' + VarToStr(edIDBank.EditValue) + ''', ' +
                                              'no_rek = ''' + VarToStr(edNoRek.EditValue) + ''', ' +
                                              'total = ''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                              'status = ''' + 'MASUK' + ''', ' +
                                              'user_id = ''' + USERAPP + ''' ' +
                                              'Where id_transaksi = ''' + qryCari.Fields[0].AsString + '''');
                               qryExec.ExecSQL;

                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('UPDATE bank_detail SET ' +
                                               'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglMskBank.Date) + ''' , ' +
                                               'id_coa = ''' + coa + ''', ' +
                                               'keterangan = ''' + noSPK + noTTS + pembeli + tipe + ''', ' +
                                               'subtotal = ''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               'id_bank = ''' + VarToStr(edIDBank.EditValue) + ''', ' +
                                               'no_rek = ''' + VarToStr(edNoRek.EditValue) + ''', ' +
                                               'status = ''' + 'MASUK' + ''' ' +
                                               'Where id_transaksi = ''' + qryCari.Fields[0].AsString + '''');
                               qryExec.ExecSQL;
                          end;
                  end
               else
               if ((edPaymentTTS.EditValue = 'DEBET') OR (edPaymentTTS.EditValue = 'TRANSFER') OR (edPaymentTTS.EditValue = 'KREDIT')) then
                  begin
                      edNoRek.Enabled   := True;
                      edIDBank.Enabled  := True;

                      edNoReff.Clear;
                      edBankReff.Clear;

                      lbTglMsk.Visible := True;
                      edTglMskBank.Visible := True;

                      //edTglMskBank.Date  := edTglTTS.Date;
                      //edTglJatuhTempo.Date  := Date;

                      qryCari.Close;
                      qryCari.SQL.Clear;
                      qryCari.SQL.Add('select * from bank_mstr where notes LIKE ''' +
                                       'TTS%' + ''' AND ' +
                                       'no_reff_trans = ''' + IntToStr(noUrut) + '''');
                      qryCari.Open;

                      if (qryCari.IsEmpty) then
                          begin
                                //master
                                TR_BANK := CreateNewAutoNum_bank();

                                qryExec.SQL.Clear;
                                qryExec.SQL.Add('INSERT INTO bank_mstr VALUES(' +
                                               '''' + TR_BANK + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglMskBank.Date) + ''' , ' +
                                               '''' + VarToStr(edIDBank.EditValue) + ''' , ' +
                                               '''' + VarToStr(edNoRek.EditValue) + ''' , ' +
                                               '''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               '''' + 'MASUK' + ''' , ' +
                                               '''' + USERAPP + ''' , ' +
                                               '''' + jenisTTS + ''' , ' +
                                               '''' + IntToStr(noUrut) + ''')');
                               qryExec.ExecSQL;

                               //detail
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('INSERT INTO bank_detail VALUES(' +
                                               '''' + ''  + ''' , ' +
                                               '''' + TR_BANK + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglMskBank.Date) + ''' , ' +
                                               '''' + 'BBM/' + FormatDateTime('mm', edTglMskBank.Date) + '/0001' + ''' , ' +
                                               '''' + coa + ''' , ' +
                                               '''' + noSPK + noTTS + pembeli + tipe + ''' , ' +
                                               '''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               '''' + 'MASUK' + ''' , ' +
                                               '''' + VarToStr(edIDBank.EditValue) + ''' , ' +
                                               '''' + VarToStr(edNoRek.EditValue) + ''' , ' +
                                               '''' + VarToStr(edTTSIDSPK.EditValue) + ''' , ' +
                                               '''' + VarToStr(edNoTTS.EditValue) + ''')');
                               qryExec.ExecSQL;
                          end
                      else
                          begin
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('UPDATE bank_mstr SET ' +
                                              'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglMskBank.Date) + ''' , ' +
                                              'id_bank = ''' + VarToStr(edIDBank.EditValue) + ''', ' +
                                              'no_rek = ''' + VarToStr(edNoRek.EditValue) + ''', ' +
                                              'total = ''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                              'status = ''' + 'MASUK' + ''', ' +
                                              'user_id = ''' + USERAPP + ''' ' +
                                              'Where id_transaksi = ''' + qryCari.Fields[0].AsString + '''');
                               qryExec.ExecSQL;

                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('UPDATE bank_detail SET ' +
                                               'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglMskBank.Date) + ''' , ' +
                                               'id_coa = ''' + coa + ''', ' +
                                               'keterangan = ''' + noSPK + noTTS + pembeli + tipe + ''', ' +
                                               'subtotal = ''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               'id_bank = ''' + VarToStr(edIDBank.EditValue) + ''', ' +
                                               'no_rek = ''' + VarToStr(edNoRek.EditValue) + ''', ' +
                                               'status = ''' + 'MASUK' + ''' ' +
                                               'Where id_transaksi = ''' + qryCari.Fields[0].AsString + '''');
                               qryExec.ExecSQL;
                          end;
                  end
               else
               if ((edPaymentTTS.EditValue = 'CEK') OR (edPaymentTTS.EditValue = 'GIRO')) then
                  begin
                      lbNoRek.Visible := False;
                      edNoRek.Visible := False;

                      edIDBank.Visible  := False;

                      lbNoReff.Visible  := True;
                      edNoReff.Visible  := True;

                      edBankReff.Visible  := True;

                      lbTglMsk.Visible := False;
                      edTglMskBank.Visible := False;

                      lbTglJatuhTempo.Visible := True;
                      edTglJatuhTempo.Visible := True;

                      edNoRek.Clear;
                      edIDBank.Clear;

                      qryCari.Close;
                      qryCari.SQL.Clear;
                      qryCari.SQL.Add('select * from cek_giro_mstr where notes LIKE ''' +
                                       'TTS%' + ''' AND ' +
                                       'no_reff_trans = ''' + IntToStr(noUrut) + '''');
                      qryCari.Open;

                      if (qryCari.IsEmpty) then
                          begin
                                //master
                                TR_CG := CreateNewAutoNum_cg();

                                qryExec.SQL.Clear;
                                qryExec.SQL.Add('INSERT INTO cek_giro_mstr VALUES(' +
                                               '''' + TR_CG + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglTTS.Date) + ''' , ' +
                                               '''' + VarToStr(edBankReff.EditValue) + ''' , ' +
                                               '''' + VarToStr(edNoReff.EditValue) + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglJatuhTempo.Date) + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglJatuhTempo.Date) + ''' , ' +
                                               '''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               '''' + VarToStr(edPaymentTTS.EditValue) + ''' , ' +
                                               '''' + 'N' + ''' , ' +
                                               '''' + '2011-01-01' + ''' , ' +
                                               '''' + 'MASUK' + ''' , ' +
                                               '''' + USERAPP + ''' , ' +
                                               '''' + jenisTTS + ''' , ' +
                                               '''' + IntToStr(noUrut) + ''')');
                               qryExec.ExecSQL;

                               //detail
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('INSERT INTO cek_giro_detail VALUES(' +
                                               '''' + ''  + ''' , ' +
                                               '''' + TR_CG + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglTTS.Date) + ''' , ' +
                                               '''' + coa + ''' , ' +
                                               '''' + noSPK + noTTS + pembeli + tipe + ''' , ' +
                                               '''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               '''' + 'MASUK' + ''' , ' +
                                               '''' + VarToStr(edBankReff.EditValue) + ''' , ' +
                                               '''' + VarToStr(edTTSIDSPK.EditValue) + ''' , ' +
                                               '''' + noTTS + ''' , ' +
                                               '''' + VarToStr(edNoReff.EditValue) + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglJatuhTempo.Date) + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglJatuhTempo.Date) + ''' , ' +
                                               '''' + VarToStr(edPaymentTTS.EditValue) + ''' , ' +
                                               '''' + 'N' + ''' , ' +
                                               '''' + '2011-01-01' + ''')');
                               qryExec.ExecSQL;
                          end
                      else
                          begin
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('UPDATE cek_giro_mstr SET ' +
                                              'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglTTS.Date) + ''' , ' +
                                              'id_bank = ''' + VarToStr(edBankReff.EditValue) + ''', ' +
                                              'no_cg = ''' + VarToStr(edNoReff.EditValue) + ''', ' +
                                              'tgl_cg = ''' + FormatDateTime('yyyy-mm-dd', edTglJatuhTempo.Date) + ''' , ' +
                                              'tgl_jatuh_tempo = ''' + FormatDateTime('yyyy-mm-dd', edTglJatuhTempo.Date) + ''' , ' +
                                              'total = ''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                              'jenis = ''' + VarToStr(edPaymentTTS.EditValue) + ''', ' +
                                              'status = ''' + 'MASUK' + ''', ' +
                                              'user_id = ''' + USERAPP + ''' ' +
                                              'Where id_transaksi = ''' + qryCari.Fields[0].AsString + '''');
                               qryExec.ExecSQL;

                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('UPDATE cek_giro_detail SET ' +
                                               'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglTTS.Date) + ''' , ' +
                                               'id_coa = ''' + coa + ''', ' +
                                               'keterangan = ''' + noSPK + noTTS + pembeli + tipe + ''', ' +
                                               'subtotal = ''' + FloatToStr(edAmountTTS.EditValue) + ''' , ' +
                                               'id_bank = ''' + VarToStr(edBankReff.EditValue) + ''', ' +
                                               'no_cg = ''' + VarToStr(edNoReff.EditValue) + ''', ' +
                                               'tgl_cg = ''' + FormatDateTime('yyyy-mm-dd', edTglJatuhTempo.Date) + ''' , ' +
                                               'tgl_jatuh_tempo = ''' + FormatDateTime('yyyy-mm-dd', edTglJatuhTempo.Date) + ''' , ' +
                                               'status = ''' + 'MASUK' + ''' ' +
                                               'Where id_transaksi = ''' + qryCari.Fields[0].AsString + '''');
                               qryExec.ExecSQL;
                          end;
                  end;
             SimpanTtsBaru;
          end;
    //edAmountTTS.EditValue := 0;
    //edNoTTS.Clear;
    edPaymentTTS.Enabled  := False;
    edNoTTS.Properties.ReadOnly  := True;
    edAmountTTS.Properties.ReadOnly := True;
    edAuthorize.Properties.ReadOnly := True;
end;

procedure TfrmInputTTS.Button1Click(Sender: TObject);
begin
     frmInputSPK.btnHome.Click;
end;

procedure TfrmInputTTS.Button2Click(Sender: TObject);
var
   Amount : Integer;
   AmountTot : Double;
   xAmountTot, intNumb, i : Integer;
   JumlahUang, nRupiah, isiSMS, typeKuitansi, strNumb, tagLoc, terimaDari, untukBayar, kodeBWI : String;
   mUntukBayar, mTerimaDari : tstringlist;
begin
  if (edAuthorize.EditValue = NULL) then
    begin
      ShowMessage('Kolom Mengetahui masih kosong.' + #13 +
                          'Silahkan isi terlebih dahulu!');
      Exit;
    end;
  btnSave.Click;
  Application.CreateForm(TfrmCetakTTSBaru, frmCetakTTSBaru);
  kodeBWI := LeftStr(edNoSPKTTS.Text, 1);
  if (kodeBWI <> 'B') then frmCetakTTSBaru.lblNoKuitansi.Caption := edNoTTS.Text
  else if (kodeBWI = 'B') then frmCetakTTSBaru.lblNoKuitansi.Caption := 'B' + edNoTTS.Text;

  {frmCetakTTSBaru.lblTerimaDari.Caption := frmInputTTS.edNamaTTS.Text + ' ' + frmInputTTS.edAlamatTTS.Text +
                                         ' ' + frmInputTTS.edKotaTTS.Text;}
   Amount := Round(frmInputTTS.edAmountTTS.EditValue);
   JumlahUang := Terbilang(Amount) + ' Rupiah';
   frmCetakTTSBaru.lblTerbilang.Caption := JumlahUang;
   frmCetakTTSBaru.lblTerimaDari.Lines.Add(frmInputTTS.edNamaTTS.Text);
   frmCetakTTSBaru.lblTerimaDari.Lines.Add(frmInputTTS.edAlamatTTS.Text);
   frmCetakTTSBaru.lblTerimaDari.Lines.Add(frmInputTTS.edKotaTTS.Text);

   frmCetakTTSBaru.lblUntukPembayaran.Lines.Add('Uang Muka Kendaraan DAIHATSU');
   frmCetakTTSBaru.lblUntukPembayaran.Lines.Add(frmInputTTS.edTypeTTS.Text + ' ' + frmInputTTS.edWarnaTTS.Text);
   Amount := Round(frmInputTTS.edAmountTTS.EditValue);
   JumlahUang := Terbilang(Amount) + ' Rupiah';
   frmCetakTTSBaru.lblTerbilang.Caption := JumlahUang;
   //frmCetakTTSBaru.lblUntukPembayaran.Caption := 'Uang Muka Kendaraan DAIHATSU' + #13 +
           //frmInputTTS.edTypeTTS.Text + ' ' + frmInputTTS.edWarnaTTS.Text;

   frmCetakTTSBaru.lblJumlah.Caption := FormatFloat('#,#', frmInputTTS.edAmountTTS.EditValue);
   frmCetakTTSBaru.lblDate.Caption := FormatDateTime('dd MMMM yyyy', frmInputTTS.edTglTTS.Date);
   frmCetakTTSBaru.lblMengetahui.Caption := edAuthorize.Text;
   if ((edPaymentTTS.EditValue = 'DEBET') OR (edPaymentTTS.EditValue = 'TRANSFER') OR (edPaymentTTS.EditValue = 'KREDIT')) then
     begin
       frmCetakTTSBaru.lblNumberCek.Lines.Add(edPaymentTTS.Text);
       frmCetakTTSBaru.lblNumberCek.Lines.Add(edNoRek.Text);
       frmCetakTTSBaru.lblNumberCek.Lines.Add(edIDBank.Text);
     end
   else if ((edPaymentTTS.EditValue = 'CEK') OR (edPaymentTTS.EditValue = 'GIRO')) then
     begin
       frmCetakTTSBaru.lblNumberCek.Lines.Add(edPaymentTTS.Text);
       frmCetakTTSBaru.lblNumberCek.Lines.Add(edNoReff.Text);
       frmCetakTTSBaru.lblNumberCek.Lines.Add(edBankReff.Text);
     end
   else
     begin
       frmCetakTTSBaru.lblNumberCek.Lines.Add(edPaymentTTS.Text);
       frmCetakTTSBaru.lblNumberCek.Lines.Add(edNoReff.Text);
     end;



   KirimSms;
   frmCetakTTSBaru.qrpManual.Preview;
   edNoSPKTTS.Clear;
   edAmountTTS.EditValue := 0;
   edAuthorize.Clear;
end;

procedure TfrmInputTTS.Button3Click(Sender: TObject);
var
  tagLoc, typeKuitansi, strNumb, bwi : String;
  intNumb, lastIntNumb : Integer;
  qryTts1, qryTts2 : TMyQuery;
begin
   qryTts1 := TMyQuery.Create(Self);
   qryTts1.Connection := DMDB.dbInternal;
   qryTts1.SQL.Add('select * from temptable');
   qryTts1.Active := true;

   qryTts2 := TMyQuery.Create(Self);
   qryTts2.Connection := DMDB.dbInternal;
   qryTts2.SQL.Add('select * from temptable');
   qryTts2.Active := true;


  bwi := LeftStr(frmInputSPK.edNoSPK.Text,1);
  if (bwi = 'B') then
    begin
        tagLoc := 'TTS-B';
        typeKuitansi := 'UM-B';
    end
  else if (bwi <> 'B') then
    begin
      tagLoc := 'TTS';
      typeKuitansi := 'UM';
    end;
  //ShowMessage(tagLoc + '#' + typeKuitansi);
  qryTts1.Close;
  qryTts1.SQL.Clear;
  qryTts1.SQL.Add('select nokuitansi from ben_logku where type_kuitansi = ''' +
             typeKuitansi + ''' ORDER BY nokuitansi ASC');
  qryTts1.Open;

  if (qryTts1.IsEmpty) then
     begin
       //lastIntNumb := StrToInt(RightStr())
       intNumb := 0 + 1;
       case Length(inttostr(intNumb)) of
          1 : strNumb := '000000' + IntToStr(intNumb);
          2 : strNumb := '00000' + IntToStr(intNumb);
          3 : strNumb := '0000' + IntToStr(intNumb);
          4 : strNumb := '000' + IntToStr(intNumb);
          5 : strNumb := '00' + IntToStr(intNumb);
          6 : strNumb := '0' + IntToStr(intNumb);
          7 : strNumb := IntToStr(intNumb);
        end;
        edNoTTS.Text := strNumb;
    end
  else if (NOT qryTts1.IsEmpty) then
       begin
          qryTts1.Last;
          intNumb := qryTts1.Fields[0].AsInteger + 1;
          case Length(inttostr(intNumb)) of
            1 : strNumb := '000000' + IntToStr(intNumb);
            2 : strNumb := '00000' + IntToStr(intNumb);
            3 : strNumb := '0000' + IntToStr(intNumb);
            4 : strNumb := '000' + IntToStr(intNumb);
            5 : strNumb := '00' + IntToStr(intNumb);
            6 : strNumb := '0' + IntToStr(intNumb);
            7 : strNumb := IntToStr(intNumb);
          end;
          edNoTTS.Text := strNumb;
       end;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('insert into ben_logku values(' +
       '''' + '' + ''',' +
       '''' + inttostr(intNumb) + ''',' +
       '''' + frmInputSPK.edIDSpk.Text + ''',' +
       '''' + typeKuitansi + ''',' +
       '''' + tagLoc + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
       '''' + 'terima dari' + ''',' +
       '''' + '0' + ''',' +
       '''' + 'untuk pembayaran' + ''',' +
       '''' + 'cek_giro' + ''',' +
       '''' + 'mengetahui' + ''',' +
       '''' + frmMain.USERAPPS + ''',' +
       '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''')');
  qryExec.ExecSQL;


        //frmCetakTTSBaru.lblNoKuitansi.Caption := strNumb;

        //frmCetakTTSBaru.lblNoKuitansi.Caption := strNumb;

   edAmountTTS.Properties.ReadOnly := False;
   edAuthorize.Properties.ReadOnly := False;
   qryTts1.Free;
   qryTts2.Free;
end;

procedure TfrmInputTTS.EditTTS1Click(Sender: TObject);
var
   recSelect, noUrut : Integer;
   //idSpk, NoTTS : String;
begin
     recSelect := gtbTTS.DataController.GetFocusedRecordIndex;
     edNoTTS.EditValue := gtbTTS.DataController.GetValue(recSelect, gtbTTSno_tts.Index);
     edTglTTS.Date := gtbTTS.DataController.GetValue(recSelect, gtbTTStanggal.Index);
     edPaymentTTS.EditValue := gtbTTS.DataController.GetValue(recSelect, gtbTTSpayment_type.Index);
     edAmountTTS.EditValue := gtbTTS.DataController.GetValue(recSelect, gtbTTSamount.Index);

     noUrut := gtbTTS.DataController.GetValue(recSelect, gtbTTSautonum.Index);

     edPaymentTTS.Enabled := False;
     edNoTTS.Enabled  := False;

     edPaymentTTS.PostEditValue;

     //cari data transaksi
     if (edPaymentTTS.EditValue = 'TUNAI') then
        begin
            edNoRek.Visible   := True;
            edIDBank.Visible  := True;
            edNoRek.Enabled   := False;
            edIDBank.Enabled  := False;
            //edNoRek.EditValue := '3947';
            //edIDBank.EditValue:= 'BCA';

            lbNoReff.Visible    := False;
            edNoReff.Visible    := False;
            edBankReff.Visible  := False;
            edNoReff.Clear;
            edBankReff.Clear;

            lbTglMsk.Visible := True;
            lbTglJatuhTempo.Visible := False;
            edTglMskBank.Visible := True;
            edTglJatuhTempo.Visible := False;
            //edTglMskBank.Date  := Date;
            edTglJatuhTempo.Date  := Date;

            with dmDB do
                begin
                     qryCek.Close;
                     qryCek.SQL.Clear;
                     qryCek.SQL.Add('select no_rek, id_bank, tanggal from bank_mstr where notes LIKE ''' +
                                     'TTS%' + ''' AND ' +
                                     'no_reff_trans = ''' + IntToStr(noUrut) + '''');
                     qryCek.Open;

                     if (not qryCek.IsEmpty) then
                          begin
                              edNoRek.EditValue  := qryCek.Fields[0].AsString;
                              edIDBank.EditValue := qryCek.Fields[1].AsString;
                              edTglMskBank.Date  := qryCek.Fields[2].AsDateTime;
                          end;
                end;

        enD
     else
     if ((edPaymentTTS.EditValue = 'DEBET') OR (edPaymentTTS.EditValue = 'TRANSFER') OR (edPaymentTTS.EditValue = 'KREDIT')) then
        begin
            edNoRek.Visible := True;
            edIDBank.Visible  := True;
            lbNoRek.Visible   := True;
            edNoRek.Enabled   := True;
            edIDBank.Enabled  := True;

            lbNoReff.Visible    := False;
            edNoReff.Visible    := False;
            edBankReff.Visible  := False;
            edNoReff.Clear;
            edBankReff.Clear;

            lbTglMsk.Visible := True;
            lbTglJatuhTempo.Visible := False;
            edTglMskBank.Visible := True;
            edTglJatuhTempo.Visible := False;

            edTglJatuhTempo.Date  := Date;

            with dmDB do
                begin
                     qryCek.Close;
                     qryCek.SQL.Clear;
                     qryCek.SQL.Add('select no_rek, id_bank, tanggal from bank_mstr where notes LIKE ''' +
                                     'TTS%' + ''' AND ' +
                                     'no_reff_trans = ''' + IntToStr(noUrut) + '''');
                     qryCek.Open;

                     if (not qryCek.IsEmpty) then
                          begin
                              edNoRek.EditValue  := qryCek.Fields[0].AsString;
                              edIDBank.EditValue := qryCek.Fields[1].AsString;
                              edTglMskBank.Date  := qryCek.Fields[2].AsDateTime;
                          end;
                end;
        end
     else
     if ((edPaymentTTS.EditValue = 'CEK') OR (edPaymentTTS.EditValue = 'GIRO')) then
        begin
            lbNoRek.Visible := False;
            edNoRek.Visible := False;

            edIDBank.Visible  := False;

            edNoRek.Enabled   := False;
            edIDBank.Enabled  := False;
            edNoRek.Clear;
            edIDBank.Clear;

            lbNoReff.Visible  := True;
            edNoReff.Visible  := True;

            edBankReff.Visible  := True;

            lbTglMsk.Visible := False;
            edTglMskBank.Visible := False;

            lbTglJatuhTempo.Visible := True;
            edTglJatuhTempo.Visible := True;

            with dmDB do
                begin
                     qryCek.Close;
                     qryCek.SQL.Clear;
                     qryCek.SQL.Add('select no_cg, id_bank, tgl_cg, tgl_jatuh_tempo from cek_giro_mstr where notes LIKE ''' +
                                     'TTS%' + ''' AND ' +
                                     'no_reff_trans = ''' + IntToStr(noUrut) + '''');
                     qryCek.Open;

                     if (not qryCek.IsEmpty) then
                          begin
                              edNoReff.EditValue    := qryCek.Fields[0].AsString;
                              edBankReff.EditValue  := qryCek.Fields[1].AsString;
                              edTglJatuhTempo.Date  := qryCek.Fields[3].AsDateTime;
                          end;
                end;
        end;
     edAuthorize.Properties.ReadOnly := False;
     edAuthorize.Enabled := True;
     edAmountTTS.Enabled := True;
     edAmountTTS.Properties.ReadOnly := False;
end;

procedure TfrmInputTTS.edNoRekPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     if ((edNoRek.EditValue = NULL) or (edNoRek.EditValue = '')) then
        begin
             if ((DisplayValue = NULL) or (DisplayValue = '')) then
                DisplayValue := '(NONE)';
             edNoRek.EditValue := DisplayValue;
             edNoRek.PostEditValue;
        end;


       qrySearch.Close;
       qrySearch.SQL.Clear;
       qrySearch.SQL.Add('SELECT id_bank FROM rekening ' +
                         'WHERE no_rek = ''' + edNoRek.EditValue + '''');
       qrySearch.Open;
       qrySearch.First;

       if (not qrySearch.IsEmpty) then
          begin
               if (qrySearch.Fields[0].AsString <> '') then
                  edIDBank.EditValue := qrySearch.Fields[0].AsString
               else
                   edIDBank.EditValue := 'NONE';
               edIDBank.PostEditValue;
          end;

end;

procedure TfrmInputTTS.edPaymentTTSPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     if ((edPaymentTTS.EditValue = NULL) or (edPaymentTTS.EditValue = '')) then
        begin
             if ((DisplayValue = NULL) or (DisplayValue = '')) then
                DisplayValue := '(NONE)';
             edPaymentTTS.EditValue := DisplayValue;
             edPaymentTTS.PostEditValue;
        end;

     if (edPaymentTTS.ItemIndex = 0) then
        begin
            edNoRek.Visible     := True;
            edIDBank.Visible    := True;
            edNoRek.Enabled     := True;
            edIDBank.Enabled    := True;
            edNoRek.EditValue   := '3947';
            edIDBank.EditValue  := 'BCA';

            lbNoReff.Visible    := False;
            edNoReff.Visible    := False;
            edBankReff.Visible  := False;
            edNoReff.Clear;
            edBankReff.Clear;

            lbTglMsk.Visible := True;
            lbTglJatuhTempo.Visible := False;
            edTglMskBank.Visible := True;
            edTglJatuhTempo.Visible := False;
            edTglMskBank.Date  := Date;
            edTglJatuhTempo.Date  := Date;
        enD
     else
     if ((edPaymentTTS.ItemIndex = 1) OR (edPaymentTTS.ItemIndex = 2) OR (edPaymentTTS.ItemIndex = 3)) then
        begin
            edNoRek.Visible := True;
            edIDBank.Visible  := True;
            lbNoRek.Visible   := True;
            edNoRek.Enabled   := True;
            edIDBank.Enabled  := True;

            lbNoReff.Visible    := False;
            edNoReff.Visible    := False;
            edBankReff.Visible  := False;
            edNoReff.Clear;
            edBankReff.Clear;
            edNoRek.Clear;
            edIDBank.Clear;

            lbTglMsk.Visible := True;
            lbTglJatuhTempo.Visible := False;
            edTglMskBank.Visible := True;
            edTglJatuhTempo.Visible := False;
            edTglMskBank.Date  := edTglTTS.Date;
            edTglJatuhTempo.Date  := Date;
        end
     else
        begin
            lbNoRek.Visible := False;
            edNoRek.Visible := False;

            edIDBank.Visible  := False;

            edNoRek.Enabled   := False;
            edIDBank.Enabled  := False;
            edNoRek.Clear;
            edIDBank.Clear;
            edNoReff.Clear;
            edBankReff.Clear;

            lbNoReff.Visible  := True;
            edNoReff.Visible  := True;

            edBankReff.Visible  := True;

            lbTglMsk.Visible := False;
            edTglMskBank.Visible := False;
            edTglMskBank.Date := edTglTTS.Date;

            lbTglJatuhTempo.Visible := True;
            edTglJatuhTempo.Visible := True;
        end;
end;

procedure TfrmInputTTS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     {dbSMS.Connected := False;}
     Action := caFree;
end;

procedure TfrmInputTTS.FormCreate(Sender: TObject);
begin
     {dbSMS.Connected := False;
     dbSMS.Host := frmMain.DBHOST;
     dbSMS.DatabaseName := 'bcsmsdb';
     dbSMS.UserName := frmMain.DBUSER;
     dbSMS.UserPassword := frmMain.DBPASS;
     dbSMS.Connected := True;}
     tblMengetahui.Active := True;
     tblrekening.Active := True;
     tblBank.Active := True;

     TR_ID_KAS := 'KR';
     TR_PERIODE_KAS := FormatDateTime('ddmmyy', Date);
     TR_NUMBER_KAS := '001';

     TR_ID_BANK := 'BANK';
     TR_NUMBER_BANK := '001';
     TR_PERIODE_BANK := FormatDateTime('ddmmyy', Date);

     TR_ID_CG := 'CG';
     TR_NUMBER_CG := '001';
     TR_PERIODE_CG := FormatDateTime('ddmmyy', Date);

     USERAPP := frmMain.USERAPPS;
     edTglMskBank.Date := Date;
     edTglJatuhTempo.Date := Date;
     edNoRek.EditValue   := '3947';
     edIDBank.EditValue  := 'BCA';
     lbTglMsk.Visible := True;
     edTglMskBank.Visible  := True;
     //qrySearch, qryExec,qryCari, qryFind, qryTemp, qryCek : TMyQuery;

     qrySearch := TMyQuery.Create(Self);
     qrySearch.Connection := DMDB.dbInternal;
     qrySearch.SQL.Add('select * from temptable');
     qrySearch.Active := true;

     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from temptable');
     qryExec.Active := true;

     qryCari := TMyQuery.Create(Self);
     qryCari.Connection := DMDB.dbInternal;
     qryCari.SQL.Add('select * from temptable');
     qryCari.Active := true;

     qryFind := TMyQuery.Create(Self);
     qryFind.Connection := DMDB.dbInternal;
     qryFind.SQL.Add('select * from temptable');
     qryFind.Active := true;

     qryTemp := TMyQuery.Create(Self);
     qryTemp.Connection := DMDB.dbInternal;
     qryTemp.SQL.Add('select * from temptable');
     qryTemp.Active := true;

     qryCek := TMyQuery.Create(Self);
     qryCek.Connection := DMDB.dbInternal;
     qryCek.SQL.Add('select * from temptable');
     qryCek.Active := true;
end;

procedure TfrmInputTTS.FormShow(Sender: TObject);
var
   idCabang : String;
begin
     if (LeftStr(frmInputSPK.edNoSPK.Text, 1) = 'P') then idCabang := '3'
     else if (LeftStr(frmInputSPK.edNoSPK.Text, 1) = 'B') then idCabang := '4'
     else idCabang := '1';
     with dmDB do
          begin
               STRSQL := 'select id_coa_master from coa_config where trans_config = ''' +
                         'TTS' + ''' and id_cabang = ''' + idCabang + '''';
               PREPARE_SEARCH;
               lblCoa.Caption := qrySearch.Fields[0].AsString;

          end;
end;

procedure TfrmInputTTS.HapusTerpilih1Click(Sender: TObject);
var
   recSelect, autonum : Integer;
   amount : Double;
   idSpk, no_spk, noTTS, payment : String;
   tanggal : Tdate;

begin
     if (MessageDlg('Proses Ini Akan Menghapus Data Transaksi TTS'+ #13#13 +
                    'Click [OK] untuk Melanjutkan Proses..', mtConfirmation, mbOKCancel, 0) = mrCancel) then
         begin
              exit;
         end;

     with dmDB do
          begin
               recSelect := gtbTTS.DataController.GetFocusedRecordIndex;
               idSpk := vartostr(gtbTTS.DataController.GetValue(recSelect, gtbTTSid_spk.Index));
               no_spk := vartostr(gtbTTS.DataController.GetValue(recSelect, gtbTTSno_spk.Index));
               noTTS := vartostr(gtbTTS.DataController.GetValue(recSelect, gtbTTSno_tts.Index));
               amount := gtbTTS.DataController.GetValue(recSelect, gtbTTSamount.Index);
               tanggal := VarToDateTime(gtbTTS.DataController.GetValue(recSelect, gtbTTStanggal.Index));
               payment  := vartostr(gtbTTS.DataController.GetValue(recSelect, gtbTTSpayment_type.Index));

               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from mstr_tts where id_spk = ''' +
                              idSpk + ''' and no_spk = ''' +
                              no_spk + ''' and tanggal = ''' +
                              FormatDateTime('yyyy-MM-dd', tanggal) + ''' and amount = ''' +
                              FloatToStr(amount) + ''' and no_tts = ''' +
                              noTTS + '''');
               qrySearch.Open;
               autonum := qrySearch.Fields[0].AsInteger;

               qryExec.SQL.Clear;
               qryExec.SQL.Add('delete from mstr_tts where autonum = ''' +
                              inttostr(autonum) + '''');
               qryExec.ExecSQL;

               if (payment = 'TUNAI') then
                    begin
                          qryCek.Close;
                          qryCek.SQL.Clear;
                          qryCek.SQL.Add('select id_transaksi from kas_mstr where notes LIKE ''' +
                                         'TTS%' + ''' AND ' +
                                         'no_reff_trans = ''' + IntToStr(autonum) + '''');
                          qryCek.Open;

                          //hapus kas
                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('delete from kas_detail where id_transaksi = ''' +
                                          qryCek.Fields[0].AsString + '''');
                          qryExec.ExecSQL;

                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('delete from kas_mstr where id_transaksi = ''' +
                                          qryCek.Fields[0].AsString + '''');
                          qryExec.ExecSQL;

                          //hapus bank
                          qryCek.Close;
                          qryCek.SQL.Clear;
                          qryCek.SQL.Add('select id_transaksi from bank_mstr where notes LIKE ''' +
                                         'TTS%' + ''' AND ' +
                                         'no_reff_trans = ''' + IntToStr(autonum) + '''');
                          qryCek.Open;

                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('delete from bank_detail where id_transaksi = ''' +
                                          qryCek.Fields[0].AsString + '''');
                          qryExec.ExecSQL;

                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('delete from bank_mstr where id_transaksi = ''' +
                                          qryCek.Fields[0].AsString + '''');
                          qryExec.ExecSQL;
                    enD
                 else
                 if ((payment = 'DEBET') OR (payment = 'TRANSFER') OR (payment = 'KREDIT')) then
                    begin
                          qryCek.Close;
                          qryCek.SQL.Clear;
                          qryCek.SQL.Add('select id_transaksi from bank_mstr where notes LIKE ''' +
                                         'TTS%' + ''' AND ' +
                                         'no_reff_trans = ''' + IntToStr(autonum) + '''');
                          qryCek.Open;

                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('delete from bank_detail where id_transaksi = ''' +
                                          qryCek.Fields[0].AsString + '''');
                          qryExec.ExecSQL;

                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('delete from bank_mstr where id_transaksi = ''' +
                                          qryCek.Fields[0].AsString + '''');
                          qryExec.ExecSQL;
                    end
                 else
                 if ((payment = 'CEK') OR (payment = 'GIRO')) then
                    begin
                          qryCek.Close;
                          qryCek.SQL.Clear;
                          qryCek.SQL.Add('select id_transaksi from cek_giro_mstr where notes LIKE ''' +
                                         'TTS%' + ''' AND ' +
                                         'no_reff_trans = ''' + IntToStr(autonum) + '''');
                          qryCek.Open;

                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('delete from cek_giro_detail where id_transaksi = ''' +
                                          qryCek.Fields[0].AsString + '''');
                          qryExec.ExecSQL;

                          qryExec.SQL.Clear;
                          qryExec.SQL.Add('delete from cek_giro_mstr where id_transaksi = ''' +
                                          qryCek.Fields[0].AsString + '''');
                          qryExec.ExecSQL;
                    end;


               qryTTS.Close;
               qryTTS.SQL.Clear;
               qryTTS.SQL.Add('select * from mstr_tts where id_spk = ''' +
                        frmInputSPK.edIDSpk.Text + '''');
               qryTTS.Open;
               gtbTTS.DataController.Refresh;

               ShowMessage('Data telah berhasil dihapus');
               frmInputTTS.Close;
          end;
end;

end.


