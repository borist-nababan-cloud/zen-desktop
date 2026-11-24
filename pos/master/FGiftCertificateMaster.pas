unit FGiftCertificateMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyAccess, Data.DB, DBAccess, MemDS,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxTextEdit, cxCalc, Vcl.Menus,
  cxButtons, Vcl.ExtCtrls, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  XSuperJSON, XSuperObject, DateUtils, System.Net.HttpClient, System.Net.URLClient;

type
  TfrmGiftCertificateMaster = class(TForm)
    lblJudulAtas: TLabel;
    qryMaster: TMyQuery;
    dsQryMaster: TMyDataSource;
    qryDetail: TMyQuery;
    dsQryDetail: TMyDataSource;
    gtbMaster: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbMasterpaket_number: TcxGridDBColumn;
    gtbMastertanggal: TcxGridDBColumn;
    gtbMasterexpired_date: TcxGridDBColumn;
    gtbMasterharga_jual: TcxGridDBColumn;
    gtbMastertotal_items: TcxGridDBColumn;
    gtbMasteraktif: TcxGridDBColumn;
    gtbMasterterjual: TcxGridDBColumn;
    gtbMasternotes: TcxGridDBColumn;
    Panel1: TPanel;
    btnNewPacket: TcxButton;
    cxGrid2: TcxGrid;
    tbDetails: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    cxButton4: TcxButton;
    tbDetailspaket_number: TcxGridDBColumn;
    tbDetailsgc_number: TcxGridDBColumn;
    tbDetailsnama_menu: TcxGridDBColumn;
    tbDetailsharga_jual: TcxGridDBColumn;
    btnActivatedPacket: TcxButton;
    btnEditPacket: TcxButton;
    btnrefresh: TcxButton;
    btnRemovePacket: TcxButton;
    btnSyncCloud: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewPacketClick(Sender: TObject);
    procedure btnRemovePacketClick(Sender: TObject);
    procedure btnEditPacketClick(Sender: TObject);
    procedure btnrefreshClick(Sender: TObject);
    procedure btnActivatedPacketClick(Sender: TObject);
    procedure btnSyncCloudClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryFind, qryCari : TMyQuery;
    function GetBaseRESTUrl: String;
    function GenerateGCQRCode(ALength: Integer = 24): String;
  public
    { Public declarations }
  end;

var
  frmGiftCertificateMaster: TfrmGiftCertificateMaster;

implementation

{$R *.dfm}

uses FdmDB, FMain, FPaketGCInput;

procedure TfrmGiftCertificateMaster.btnActivatedPacketClick(Sender: TObject);
var
   recSel, btnSelected : Integer;
   kodePaket, keterangan : String;
   expireDate : TDate;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   expireDate := IncYear(Date, 1);
   kodePaket := vartostr(gtbMaster.DataController.GetValue(recSel, gtbMasterpaket_number.Index));
   btnSelected := MessageDlg('Apakah Anda akan mengaktifkan GC Packet ' + kodePaket + '?',mtConfirmation,mbOKCancel, 0);
   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
   if (btnSelected = mrCancel) then Exit;

   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('update gc_master set ' +
           'tanggal = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
           'expired_date = ''' + FormatDateTime('yyyy-MM-dd', expireDate) + ''',' +
           'aktif = ''' + 'Y' + ''',' +
           'notes = ' + QuotedStr(keterangan) +
           ' where paket_number = ''' + kodePaket + ''';');

   qrySearch.SQL.Add('update main_menu set ' +
                    'aktif = ''' + 'Y' + ''',' +
                    'lastuser = ''' + frmMain.USERAPPS + ''',' +
                    'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
                    'where menu_id = ''' + kodePaket + '''');
   qrySearch.ExecSQL;
   qryMaster.Refresh;
   gtbMaster.DataController.Refresh;
end;

procedure TfrmGiftCertificateMaster.btnEditPacketClick(Sender: TObject);
var
  recSel : Integer;
  kodePaket : String;
  harga : Double;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   kodePaket := vartostr(gtbMaster.DataController.GetValue(recSel, gtbMasterpaket_number.Index));
   harga := gtbMaster.DataController.GetValue(recSel, gtbMasterharga_jual.Index);
   Application.CreateForm(TfrmPaketGCInput, frmPaketGCInput);
   frmPaketGCInput.edOutletID.Text := frmMain.APP_OUTLETID + '.';
   frmPaketGCInput.FormStyle := fsNormal;
   frmPaketGCInput.Height := 728;
   frmPaketGCInput.Width := 1100;
   frmPaketGCInput.Position := poDesktopCenter;
   //frmPaketGCInput.edOutletID.Text := frmMain.APP_OUTLETID + '.';
   frmPaketGCInput.edKode.Text := Copy(kodePaket,5,50);
   frmPaketGCInput.edHargaJual.EditValue := harga;
   frmPaketGCInput.edExpired.Date := IncYear(Date, 1);
   //frmNewMenuTrans.lblKodeTrans.Caption := NewKodeTrans;
   //frmNewMenuTrans.PACKETHH := vPackHH;
   //frmNewMenuTrans.varJam := vWaktu;
   //frmNewMenuTrans.varTanggal := vTanggal;
   frmPaketGCInput.Show;
end;

procedure TfrmGiftCertificateMaster.btnNewPacketClick(Sender: TObject);
begin
   Application.CreateForm(TfrmPaketGCInput, frmPaketGCInput);
   frmPaketGCInput.edOutletID.Text := frmMain.APP_OUTLETID + '.';
   frmPaketGCInput.edExpired.Date := IncYear(Date, 1);
   frmPaketGCInput.FormStyle := fsNormal;
   frmPaketGCInput.Height := 728;
   frmPaketGCInput.Width := 1100;
   frmPaketGCInput.Position := poDesktopCenter;
   //frmNewMenuTrans.lblKodeTrans.Caption := NewKodeTrans;
   //frmNewMenuTrans.PACKETHH := vPackHH;
   //frmNewMenuTrans.varJam := vWaktu;
   //frmNewMenuTrans.varTanggal := vTanggal;
   frmPaketGCInput.Show;
end;

procedure TfrmGiftCertificateMaster.btnrefreshClick(Sender: TObject);
begin
   qryMaster.Refresh;
   gtbMaster.DataController.Refresh;
end;

procedure TfrmGiftCertificateMaster.btnRemovePacketClick(Sender: TObject);
var
   recSel, btnSelected : Integer;
   kodePaket, keterangan : String;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   kodePaket := vartostr(gtbMaster.DataController.GetValue(recSel, gtbMasterpaket_number.Index));
   btnSelected := MessageDlg('Apakah Anda akan menghapus Data ' + kodePaket + '?',mtConfirmation,mbOKCancel, 0);
   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
   if (btnSelected = mrCancel) then Exit;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('update gc_master set ' +
      'aktif = ''' + 'D' + ''',' +
      'notes = ' + QuotedStr(keterangan) +
      ' where paket_number = ''' + kodePaket + ''';');
   qrySearch.SQL.Add('update gc_detail set ' +
      'aktif = ''' + 'Y' + ''',' +
      'paket_number = ''' + '' + ''',' +
      'notes = ' + QuotedStr(keterangan) +
      ' where paket_number = ''' + kodePaket + ''';');
   qrySearch.SQL.Add('update main_menu set ' +
       'aktif = ''' + 'N' + ''',' +
       'lastuser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) +
       ''' where menu_id = ''' + kodePaket + ''';');
   qrySearch.ExecSQL;

   qryMaster.Refresh;
   qryDetail.Refresh;
   gtbMaster.DataController.Refresh;
   tbDetails.DataController.Refresh;

end;

procedure TfrmGiftCertificateMaster.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qrySearch.Free;
   qryFind.Free;
   qryCari.Free;
   Action := caFree;
end;

procedure TfrmGiftCertificateMaster.FormCreate(Sender: TObject);
begin
   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from empty_x');
   qrySearch.Active := true;

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.dbInternal;
   qryFind.SQL.Add('select * from empty_x');
   qryFind.Active := true;

   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from empty_x');
   qryCari.Active := true;

   qryMaster.Active := True;
   qryDetail.Active := True;
   gtbMaster.DataController.Refresh;
   tbDetails.DataController.Refresh;
end;

function TfrmGiftCertificateMaster.GetBaseRESTUrl: String;
begin
  Result := Trim(frmMain.SUPABASE_URL);
  if (Result <> '') and (Result[Length(Result)] <> '/') and (Result[Length(Result)] <> '\') then
    Result := Result + '/';
end;

function TfrmGiftCertificateMaster.GenerateGCQRCode(ALength: Integer): String;
const
  // 32 karakter alfanumerik kapital tanpa karakter ambigu (0/O, 1/I) -> nol modulo bias
  ValidChars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
var
  G1, G2: TGUID;
  Bytes: array[0..31] of Byte;
  I: Integer;
begin
  Result := '';
  if ALength < 15 then ALength := 15;
  if ALength > 32 then ALength := 32;
  G1 := TGUID.NewGuid;
  G2 := TGUID.NewGuid;
  Move(G1, Bytes[0], 16);
  Move(G2, Bytes[16], 16);
  for I := 0 to ALength - 1 do
    Result := Result + ValidChars[(Bytes[I] mod Length(ValidChars)) + 1];
end;

procedure TfrmGiftCertificateMaster.btnSyncCloudClick(Sender: TObject);
var
  BaseURL, sOrigCaption, sGCNumber, sPack, sMember, sNotes, sPakai: String;
  sPayBuy, sPayUsed, sOutBuy, sOutUsed, sLastErr: String;
  bUsed, bActive: Boolean;
  dtBuyAt, dtExpired: TDateTime;
  TotalCount, SentCount, QRGeneratedCount, BatchCount, FailBatchCount: Integer;
  qryGC, qryUpdNotes: TMyQuery;
  HTTP: THTTPClient;
  Headers: TNetHeaders;
  BulkGC: ISuperArray;
  JSONGC: ISuperObject;
  ReqBody: TStringStream;
  Resp: IHTTPResponse;
  SeenGC: TStringList;
begin
  if (not Assigned(dmDB)) or (not dmDB.dbInternal.Connected) then
  begin
    MessageDlg('Koneksi database lokal belum aktif.', mtError, [mbOK], 0);
    Exit;
  end;

  BaseURL := GetBaseRESTUrl;
  if (BaseURL = '') or (Trim(frmMain.SUPABASE_KEY) = '') then
  begin
    MessageDlg('Konfigurasi Cloud Supabase (SUPABASE_URL / SUPABASE_KEY) belum lengkap di config.json.', mtError, [mbOK], 0);
    Exit;
  end;

  if MessageDlg(
       'Sinkronisasi data gc_sold ke Supabase Cloud (Insert-Only)?' + #13#10 +
       '- Baris yang sudah ada di Supabase tidak akan ditimpa.' + #13#10 +
       '- Jika kolom notes lokal masih kosong / (NONE), sistem akan otomatis membuat kode QR 24 karakter dan menyimpannya ke gc_sold.notes.',
       mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  sOrigCaption := btnSyncCloud.Caption;
  btnSyncCloud.Enabled := False;
  Screen.Cursor := crHourGlass;

  qryGC := TMyQuery.Create(nil);
  qryUpdNotes := TMyQuery.Create(nil);
  HTTP := THTTPClient.Create;
  SeenGC := TStringList.Create;
  try
    SeenGC.Sorted := True;
    SeenGC.Duplicates := dupIgnore;
    SeenGC.CaseSensitive := False;

    HTTP.ConnectionTimeout := 10000;
    HTTP.ResponseTimeout := 30000;

    qryGC.Connection := dmDB.dbInternal;
    qryUpdNotes.Connection := dmDB.dbInternal;

    qryGC.SQL.Text :=
      'SELECT s.*, ' +
      '  (SELECT d.paket_number FROM gc_detail d WHERE d.gc_number = s.gc_number LIMIT 1) AS pack_number ' +
      'FROM gc_sold s ' +
      'WHERE s.gc_number IS NOT NULL AND s.gc_number <> '''' AND s.gc_number <> ''(NONE)'' ' +
      'ORDER BY s.autonum ASC';
    qryGC.Open;

    if qryGC.IsEmpty then
    begin
      MessageDlg('Tidak ditemukan data GC terjual yang valid pada tabel gc_sold.', mtInformation, [mbOK], 0);
      Exit;
    end;

    TotalCount := qryGC.RecordCount;
    SentCount := 0;
    QRGeneratedCount := 0;
    BatchCount := 0;
    FailBatchCount := 0;
    sLastErr := '';

    SetLength(Headers, 4);
    Headers[0] := TNameValuePair.Create('apikey', frmMain.SUPABASE_KEY);
    Headers[1] := TNameValuePair.Create('Authorization', 'Bearer ' + frmMain.SUPABASE_KEY);
    Headers[2] := TNameValuePair.Create('Content-Type', 'application/json');
    // Insert-Only: jangan pernah menimpa data GC yang sudah ada di Supabase
    Headers[3] := TNameValuePair.Create('Prefer', 'resolution=ignore-duplicates');

    BulkGC := SA();
    while not qryGC.Eof do
    begin
      Application.ProcessMessages;

      sGCNumber := Trim(qryGC.FieldByName('gc_number').AsString);

      // Guard anti-duplikat gc_number dalam batch
      if (sGCNumber = '') or (SeenGC.IndexOf(sGCNumber) >= 0) then
      begin
        qryGC.Next;
        Continue;
      end;
      SeenGC.Add(sGCNumber);

      // Cek gc_sold.notes: jika NULL / kosong / '(NONE)' -> generate QR 24 char & update lokal kolom notes saja
      sNotes := Trim(qryGC.FieldByName('notes').AsString);
      if (sNotes = '') or (UpperCase(sNotes) = '(NONE)') then
      begin
        sNotes := GenerateGCQRCode(24);
        qryUpdNotes.SQL.Text := 'UPDATE gc_sold SET notes = :pNotes WHERE autonum = :pAutonum';
        qryUpdNotes.ParamByName('pNotes').AsString := sNotes;
        qryUpdNotes.ParamByName('pAutonum').AsLargeInt := qryGC.FieldByName('autonum').AsLargeInt;
        qryUpdNotes.ExecSQL;
        Inc(QRGeneratedCount);
      end;

      sPack := Trim(qryGC.FieldByName('pack_number').AsString);
      sMember := Trim(qryGC.FieldByName('id_members').AsString);
      sPakai := UpperCase(Trim(qryGC.FieldByName('pakai').AsString));
      bUsed := (sPakai = 'Y');
      bActive := (UpperCase(Trim(qryGC.FieldByName('aktif').AsString)) <> 'N');

      JSONGC := SO();
      // uid tidak dikirim -> auto-generated oleh Supabase PostgreSQL
      if (sMember <> '') and (sMember <> '(NONE)') then
        JSONGC.S['user_uid'] := sMember
      else
        JSONGC.Null['user_uid'] := jNull;

      JSONGC.S['gc_number'] := sGCNumber;
      JSONGC.S['gc_barcode'] := sGCNumber;
      JSONGC.S['qrcode'] := sNotes;

      if (sPack <> '') and (sPack <> '(NONE)') then
        JSONGC.S['pack_number'] := sPack
      else
        JSONGC.Null['pack_number'] := jNull;

      JSONGC.S['nama_gc'] := qryGC.FieldByName('nama_menu').AsString;
      JSONGC.F['value'] := qryGC.FieldByName('harga_jasa').AsFloat;

      // buy_at & expired_date (selalu 120 hari dari tanggal beli)
      if (not qryGC.FieldByName('tgl_jual').IsNull) and (FormatDateTime('yyyy', qryGC.FieldByName('tgl_jual').AsDateTime) <> '2000') then
      begin
        dtBuyAt := qryGC.FieldByName('tgl_jual').AsDateTime;
        JSONGC.S['buy_at'] := FormatDateTime('yyyy-mm-dd"T"00:00:00"+07:00"', dtBuyAt);
        dtExpired := IncDay(DateOf(dtBuyAt), 120);
        JSONGC.S['expired_date'] := FormatDateTime('yyyy-mm-dd', dtExpired);
      end
      else if (not qryGC.FieldByName('tanggal').IsNull) and (FormatDateTime('yyyy', qryGC.FieldByName('tanggal').AsDateTime) <> '2000') then
      begin
        dtBuyAt := qryGC.FieldByName('tanggal').AsDateTime;
        JSONGC.S['buy_at'] := FormatDateTime('yyyy-mm-dd"T"00:00:00"+07:00"', dtBuyAt);
        dtExpired := IncDay(DateOf(dtBuyAt), 120);
        JSONGC.S['expired_date'] := FormatDateTime('yyyy-mm-dd', dtExpired);
      end
      else
      begin
        JSONGC.Null['buy_at'] := jNull;
        JSONGC.Null['expired_date'] := jNull;
      end;

      JSONGC.B['is_active'] := bActive;
      JSONGC.B['has_used'] := bUsed;

      if bUsed and (not qryGC.FieldByName('tgl_pakai').IsNull) and (FormatDateTime('yyyy', qryGC.FieldByName('tgl_pakai').AsDateTime) <> '2000') then
        JSONGC.S['used_at'] := FormatDateTime('yyyy-mm-dd"T"00:00:00"+07:00"', qryGC.FieldByName('tgl_pakai').AsDateTime)
      else
        JSONGC.Null['used_at'] := jNull;

      sPayBuy := Trim(qryGC.FieldByName('payment_jual').AsString);
      if (sPayBuy <> '') and (sPayBuy <> '(NONE)') then
        JSONGC.S['id_payment_buy'] := sPayBuy
      else
        JSONGC.Null['id_payment_buy'] := jNull;

      sPayUsed := Trim(qryGC.FieldByName('payment_pakai').AsString);
      if bUsed and (sPayUsed <> '') and (sPayUsed <> '(NONE)') then
        JSONGC.S['id_payment_used'] := sPayUsed
      else
        JSONGC.Null['id_payment_used'] := jNull;

      sOutBuy := Trim(qryGC.FieldByName('outlet_jual').AsString);
      if (sOutBuy <> '') and (sOutBuy <> '(NONE)') then
        JSONGC.S['kode_outlet_buy'] := sOutBuy
      else
        JSONGC.S['kode_outlet_buy'] := frmMain.APP_OUTLETID;

      sOutUsed := Trim(qryGC.FieldByName('outlet_pakai').AsString);
      if bUsed and (sOutUsed <> '') and (sOutUsed <> '(NONE)') then
        JSONGC.S['kode_outlet_used'] := sOutUsed
      else
        JSONGC.Null['kode_outlet_used'] := jNull;

      BulkGC.Add(JSONGC);

      if BulkGC.Length >= 50 then
      begin
        Inc(BatchCount);
        btnSyncCloud.Caption := Format('Sync %d/%d', [SentCount + BulkGC.Length, TotalCount]);
        frmMain.barLog.EditValue := Format('[GC-SYNC] Mengirim batch %d (%d/%d)...', [BatchCount, SentCount + BulkGC.Length, TotalCount]);
        Application.ProcessMessages;

        ReqBody := TStringStream.Create(BulkGC.AsJSON, TEncoding.UTF8);
        try
          try
            Resp := HTTP.Post(BaseURL + 'ot_pos_gc_transaction?on_conflict=gc_number', ReqBody, nil, Headers);
            if (Resp.StatusCode = 200) or (Resp.StatusCode = 201) then
              SentCount := SentCount + BulkGC.Length
            else
            begin
              Inc(FailBatchCount);
              sLastErr := Format('HTTP %d: %s', [Resp.StatusCode, Resp.ContentAsString]);
            end;
          except
            on E: Exception do
            begin
              Inc(FailBatchCount);
              sLastErr := E.Message;
            end;
          end;
        finally
          ReqBody.Free;
        end;
        BulkGC := SA();
      end;

      qryGC.Next;
    end;

    // Flush batch terakhir
    if BulkGC.Length > 0 then
    begin
      Inc(BatchCount);
      btnSyncCloud.Caption := Format('Sync %d/%d', [SentCount + BulkGC.Length, TotalCount]);
      frmMain.barLog.EditValue := Format('[GC-SYNC] Mengirim batch akhir %d (%d/%d)...', [BatchCount, SentCount + BulkGC.Length, TotalCount]);
      Application.ProcessMessages;

      ReqBody := TStringStream.Create(BulkGC.AsJSON, TEncoding.UTF8);
      try
        try
          Resp := HTTP.Post(BaseURL + 'ot_pos_gc_transaction?on_conflict=gc_number', ReqBody, nil, Headers);
          if (Resp.StatusCode = 200) or (Resp.StatusCode = 201) then
            SentCount := SentCount + BulkGC.Length
          else
          begin
            Inc(FailBatchCount);
            sLastErr := Format('HTTP %d: %s', [Resp.StatusCode, Resp.ContentAsString]);
          end;
        except
          on E: Exception do
          begin
            Inc(FailBatchCount);
            sLastErr := E.Message;
          end;
        end;
      finally
        ReqBody.Free;
      end;
    end;

    frmMain.barLog.EditValue := Format('[GC-SYNC] Selesai: %d/%d GC diproses (QR baru: %d, Batch gagal: %d).',
      [SentCount, TotalCount, QRGeneratedCount, FailBatchCount]);

    if FailBatchCount = 0 then
      MessageDlg(
        Format('Sinkronisasi GC ke Supabase (Insert-Only) selesai!' + #13#10 +
               '- Total GC dibaca: %d' + #13#10 +
               '- Total GC terkirim: %d' + #13#10 +
               '- QR Code baru di-generate (gc_sold.notes): %d',
               [TotalCount, SentCount, QRGeneratedCount]),
        mtInformation, [mbOK], 0)
    else
      MessageDlg(
        Format('Sinkronisasi GC selesai dengan %d batch gagal.' + #13#10 +
               '- Total GC terkirim: %d / %d' + #13#10 +
               '- QR Code baru di-generate: %d' + #13#10 +
               '- Error terakhir: %s',
               [FailBatchCount, SentCount, TotalCount, QRGeneratedCount, sLastErr]),
        mtWarning, [mbOK], 0);
  finally
    SeenGC.Free;
    HTTP.Free;
    qryUpdNotes.Free;
    qryGC.Free;
    btnSyncCloud.Caption := sOrigCaption;
    btnSyncCloud.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

end.
