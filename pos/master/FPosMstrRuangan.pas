unit FPosMstrRuangan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, DBAccess,
  MyAccess, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxContainer, cxGroupBox, cxRadioGroup, cxTextEdit, dxBevel, cxCheckBox;

type
  TfrmPosMstrRuangan = class(TForm)
    Label1: TLabel;
    tblRuangan: TMyTable;
    dsTblRuangan: TMyDataSource;
    gtbMstrRuangan: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbMstrRuanganruangan_id: TcxGridDBColumn;
    gtbMstrRuanganlantai: TcxGridDBColumn;
    gtbMstrRuangannomor: TcxGridDBColumn;
    gtbMstrRuanganjenis_jasa: TcxGridDBColumn;
    gtbMstrRuangannotes: TcxGridDBColumn;
    gtbMstrRuangankondisi: TcxGridDBColumn;
    dxBevel1: TdxBevel;
    Label2: TLabel;
    edKodeRuangan: TcxTextEdit;
    Label3: TLabel;
    edLantai: TcxTextEdit;
    Label4: TLabel;
    edNomor: TcxTextEdit;
    rbJasa: TcxRadioGroup;
    ckAktif: TcxCheckBox;
    btnAdd: TButton;
    btnCancel: TButton;
    btnEdit: TButton;
    rbGender: TcxRadioGroup;
    btnSync: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSyncClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryTemp, qryExec: TMyQuery;
    FIsEditMode: Boolean;
    procedure ResetForm;
    function GetBaseRESTUrl: String;
  public
    { Public declarations }
  end;

var
  frmPosMstrRuangan: TfrmPosMstrRuangan;

implementation

{$R *.dfm}

uses
  FdmDB, FMain,
  System.DateUtils, System.Net.HttpClient, System.Net.URLClient, XSuperObject;

procedure TfrmPosMstrRuangan.FormCreate(Sender: TObject);
begin
  FIsEditMode := False;

  qrySearch := TMyQuery.Create(Self);
  qrySearch.Connection := dmDB.dbInternal;

  qryTemp := TMyQuery.Create(Self);
  qryTemp.Connection := dmDB.dbInternal;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := dmDB.dbInternal;

  if Assigned(dmDB) and dmDB.dbInternal.Connected then
  begin
    tblRuangan.Active := True;
    gtbMstrRuangan.DataController.Refresh;
  end;

  ResetForm;
end;

procedure TfrmPosMstrRuangan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tblRuangan.Active then
    tblRuangan.Close;

  FreeAndNil(qrySearch);
  FreeAndNil(qryTemp);
  FreeAndNil(qryExec);

  Action := caFree;
  frmPosMstrRuangan := nil;
end;

procedure TfrmPosMstrRuangan.ResetForm;
begin
  edKodeRuangan.Clear;
  edLantai.Clear;
  edNomor.Clear;
  rbJasa.ItemIndex := -1;
  rbGender.ItemIndex := -1;
  ckAktif.Checked := True;

  FIsEditMode := False;
  edKodeRuangan.Enabled := True;
  btnAdd.Caption := 'Add';
end;

function TfrmPosMstrRuangan.GetBaseRESTUrl: String;
begin
  Result := Trim(frmMain.SUPABASE_URL);
  if (Result <> '') and (Result[Length(Result)] <> '/') and (Result[Length(Result)] <> '\') then
    Result := Result + '/';
end;

procedure TfrmPosMstrRuangan.btnCancelClick(Sender: TObject);
begin
  ResetForm;
  if edKodeRuangan.CanFocus then
    edKodeRuangan.SetFocus;
end;

procedure TfrmPosMstrRuangan.btnEditClick(Sender: TObject);
var
  recSel: Integer;
  sRuanganID, sJasa, sGender, sKondisi: String;
begin
  if (not Assigned(dmDB)) or (not dmDB.dbInternal.Connected) then
  begin
    MessageDlg('Koneksi database lokal belum aktif.', mtError, [mbOK], 0);
    Exit;
  end;

  recSel := gtbMstrRuangan.DataController.GetFocusedRecordIndex;
  if recSel < 0 then
  begin
    MessageDlg('Silakan pilih data ruangan pada tabel terlebih dahulu.', mtWarning, [mbOK], 0);
    Exit;
  end;

  sRuanganID := Trim(VarToStr(gtbMstrRuangan.DataController.GetValue(recSel, gtbMstrRuanganruangan_id.Index)));
  if sRuanganID = '' then
  begin
    MessageDlg('ID Ruangan pada baris terpilih kosong.', mtWarning, [mbOK], 0);
    Exit;
  end;

  try
    qrySearch.Close;
    qrySearch.SQL.Clear;
    qrySearch.SQL.Add(
      'SELECT ruangan_id, lantai, nomor, jenis_jasa, notes, kondisi ' +
      'FROM ruangan ' +
      'WHERE ruangan_id = :ruangan_id ' +
      'LIMIT 1'
    );
    qrySearch.ParamByName('ruangan_id').AsString := sRuanganID;
    qrySearch.Open;

    if qrySearch.IsEmpty then
    begin
      MessageDlg(Format('Data ruangan "%s" tidak ditemukan di database.', [sRuanganID]), mtWarning, [mbOK], 0);
      Exit;
    end;

    edKodeRuangan.Text := Trim(qrySearch.FieldByName('ruangan_id').AsString);
    edLantai.Text := Trim(qrySearch.FieldByName('lantai').AsString);
    edNomor.Text := Trim(qrySearch.FieldByName('nomor').AsString);

    sJasa := UpperCase(Trim(qrySearch.FieldByName('jenis_jasa').AsString));
    if sJasa = 'RF' then
      rbJasa.ItemIndex := 0
    else if sJasa = 'BM' then
      rbJasa.ItemIndex := 1
    else
      rbJasa.ItemIndex := -1;

    sGender := UpperCase(Trim(qrySearch.FieldByName('notes').AsString));
    if (sGender = 'MALE') or (sGender = 'PRIA') then
      rbGender.ItemIndex := 0
    else if (sGender = 'FEMALE') or (sGender = 'WANITA') then
      rbGender.ItemIndex := 1
    else if sGender = 'COUPLE' then
      rbGender.ItemIndex := 2
    else if (sGender = 'NONE') or (sGender = '(NONE)') or (sGender = '') then
      rbGender.ItemIndex := 3
    else
      rbGender.ItemIndex := -1;

    sKondisi := UpperCase(Trim(qrySearch.FieldByName('kondisi').AsString));
    ckAktif.Checked := (sKondisi = 'Y');

    FIsEditMode := True;
    edKodeRuangan.Enabled := False;
    btnAdd.Caption := 'Update';

    if edLantai.CanFocus then
      edLantai.SetFocus;
  except
    on E: Exception do
      MessageDlg('Gagal memuat data ruangan untuk diedit: ' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmPosMstrRuangan.btnAddClick(Sender: TObject);
var
  sKode, sLantai, sNomor, sJasa, sGender, sKondisi: String;
begin
  if (not Assigned(dmDB)) or (not dmDB.dbInternal.Connected) then
  begin
    MessageDlg('Koneksi database lokal belum aktif.', mtError, [mbOK], 0);
    Exit;
  end;

  sKode := Trim(edKodeRuangan.Text);
  sLantai := Trim(edLantai.Text);
  sNomor := Trim(edNomor.Text);

  if sKode = '' then
  begin
    MessageDlg('Kode Ruangan tidak boleh kosong.', mtWarning, [mbOK], 0);
    if edKodeRuangan.CanFocus then
      edKodeRuangan.SetFocus;
    Exit;
  end;

  if sLantai = '' then
  begin
    MessageDlg('Lantai tidak boleh kosong.', mtWarning, [mbOK], 0);
    if edLantai.CanFocus then
      edLantai.SetFocus;
    Exit;
  end;

  if sNomor = '' then
  begin
    MessageDlg('Nomor Ruangan tidak boleh kosong.', mtWarning, [mbOK], 0);
    if edNomor.CanFocus then
      edNomor.SetFocus;
    Exit;
  end;

  case rbJasa.ItemIndex of
    0: sJasa := 'RF';
    1: sJasa := 'BM';
  else
    MessageDlg('Silakan pilih Jenis Jasa (RF / BM).', mtWarning, [mbOK], 0);
    Exit;
  end;

  case rbGender.ItemIndex of
    0: sGender := 'MALE';
    1: sGender := 'FEMALE';
    2: sGender := 'COUPLE';
    3: sGender := 'NONE';
  else
    MessageDlg('Silakan pilih Gender (MALE / FEMALE / COUPLE / NONE).', mtWarning, [mbOK], 0);
    Exit;
  end;

  if ckAktif.Checked then
    sKondisi := 'Y'
  else
    sKondisi := 'N';

  try
    if not FIsEditMode then
    begin
      // Mode Tambah: Cek duplikasi ruangan_id terlebih dahulu
      qrySearch.Close;
      qrySearch.SQL.Clear;
      qrySearch.SQL.Add('SELECT ruangan_id FROM ruangan WHERE ruangan_id = :ruangan_id LIMIT 1');
      qrySearch.ParamByName('ruangan_id').AsString := sKode;
      qrySearch.Open;

      if not qrySearch.IsEmpty then
      begin
        MessageDlg(Format('Kode Ruangan "%s" sudah terdaftar di database!', [sKode]), mtWarning, [mbOK], 0);
        if edKodeRuangan.CanFocus then
          edKodeRuangan.SetFocus;
        Exit;
      end;

      qryExec.Close;
      qryExec.SQL.Clear;
      qryExec.SQL.Add(
        'INSERT INTO ruangan ' +
        '  (ruangan_id, lantai, nomor, jenis_jasa, notes, kondisi, ' +
        '   status, nama_cust, start_time, end_time, therapist_id, trans_id) ' +
        'VALUES ' +
        '  (:ruangan_id, :lantai, :nomor, :jenis_jasa, :notes, :kondisi, ' +
        '   :status, :nama_cust, :start_time, :end_time, :therapist_id, :trans_id)'
      );
      qryExec.ParamByName('ruangan_id').AsString := sKode;
      qryExec.ParamByName('lantai').AsString := sLantai;
      qryExec.ParamByName('nomor').AsString := sNomor;
      qryExec.ParamByName('jenis_jasa').AsString := sJasa;
      qryExec.ParamByName('notes').AsString := sGender;
      qryExec.ParamByName('kondisi').AsString := sKondisi;
      qryExec.ParamByName('status').AsString := 'AVAILABLE';
      qryExec.ParamByName('nama_cust').AsString := 'NONE';
      qryExec.ParamByName('start_time').AsString := '00:00:00';
      qryExec.ParamByName('end_time').AsString := '00:00:00';
      qryExec.ParamByName('therapist_id').AsString := 'NONE';
      qryExec.ParamByName('trans_id').AsString := 'NONE';
      qryExec.ExecSQL;

      tblRuangan.Refresh;
      gtbMstrRuangan.DataController.Refresh;
      ResetForm;
      MessageDlg(Format('Data ruangan "%s" berhasil ditambahkan.', [sKode]), mtInformation, [mbOK], 0);
    end
    else
    begin
      // Mode Edit: Perbarui hanya kolom master, jaga kolom operasional live tetap utuh
      qryExec.Close;
      qryExec.SQL.Clear;
      qryExec.SQL.Add(
        'UPDATE ruangan SET ' +
        '  lantai = :lantai, ' +
        '  nomor = :nomor, ' +
        '  jenis_jasa = :jenis_jasa, ' +
        '  notes = :notes, ' +
        '  kondisi = :kondisi ' +
        'WHERE ruangan_id = :ruangan_id'
      );
      qryExec.ParamByName('lantai').AsString := sLantai;
      qryExec.ParamByName('nomor').AsString := sNomor;
      qryExec.ParamByName('jenis_jasa').AsString := sJasa;
      qryExec.ParamByName('notes').AsString := sGender;
      qryExec.ParamByName('kondisi').AsString := sKondisi;
      qryExec.ParamByName('ruangan_id').AsString := sKode;
      qryExec.ExecSQL;

      tblRuangan.Refresh;
      gtbMstrRuangan.DataController.Refresh;
      ResetForm;
      MessageDlg(Format('Data ruangan "%s" berhasil diperbarui.', [sKode]), mtInformation, [mbOK], 0);
    end;
  except
    on E: Exception do
      MessageDlg('Gagal menyimpan data ruangan: ' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmPosMstrRuangan.btnSyncClick(Sender: TObject);
const
  BATCH_SIZE = 50;
var
  HTTP: THTTPClient;
  Resp: IHTTPResponse;
  Headers: TNetHeaders;
  RequestBody: TStringStream;
  BulkRoom: ISuperArray;
  JSONRoom: ISuperObject;
  SeenRoomIDs: TStringList;
  BaseURL, sOutletID, sLocalRoomID, sRoomID, sKondisi, sStatus, sLantai, sUpdateBy, sUpdateAt: String;
  TotalSynced: Integer;
  OldCaption: String;

  function FlushBatch(const BatchArray: ISuperArray): Boolean;
  begin
    Result := True;
    if BatchArray.Length = 0 then
      Exit;

    RequestBody := TStringStream.Create(BatchArray.AsJSON, TEncoding.UTF8);
    try
      Resp := HTTP.Post(BaseURL + 'ot_master_room?on_conflict=kode_outlet,room_id', RequestBody, nil, Headers);
      if (Resp.StatusCode = 200) or (Resp.StatusCode = 201) then
      begin
        TotalSynced := TotalSynced + BatchArray.Length;
      end
      else
      begin
        Result := False;
        MessageDlg(
          Format('Gagal sinkronisasi Master Ruangan ke Cloud Supabase (HTTP %d):%s%s',
            [Resp.StatusCode, sLineBreak, Resp.ContentAsString]),
          mtError, [mbOK], 0
        );
      end;
    finally
      RequestBody.Free;
    end;
  end;

begin
  if (not Assigned(dmDB)) or (not dmDB.dbInternal.Connected) then
  begin
    MessageDlg('Koneksi database lokal belum aktif.', mtError, [mbOK], 0);
    Exit;
  end;

  BaseURL := GetBaseRESTUrl;
  sOutletID := Trim(frmMain.APP_OUTLETID);

  if (BaseURL = '') or (Trim(frmMain.SUPABASE_KEY) = '') then
  begin
    MessageDlg('Konfigurasi Supabase (REST URL / Key) belum diatur pada Config Setup!', mtError, [mbOK], 0);
    Exit;
  end;

  if sOutletID = '' then
  begin
    MessageDlg('Kode Outlet (APP_OUTLETID) belum diatur!', mtError, [mbOK], 0);
    Exit;
  end;

  OldCaption := btnSync.Caption;
  btnSync.Enabled := False;
  btnAdd.Enabled := False;
  btnEdit.Enabled := False;
  btnCancel.Enabled := False;
  btnSync.Caption := 'Syncing...';
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  HTTP := THTTPClient.Create;
  SeenRoomIDs := TStringList.Create;
  try
    HTTP.ConnectionTimeout := 10000;
    HTTP.ResponseTimeout := 30000;

    SeenRoomIDs.Sorted := True;
    SeenRoomIDs.CaseSensitive := False;
    SeenRoomIDs.Duplicates := dupIgnore;

    try
      qryTemp.Close;
      qryTemp.SQL.Clear;
      qryTemp.SQL.Add(
        'SELECT ruangan_id, lantai, nomor, jenis_jasa, notes, kondisi, status ' +
        'FROM ruangan ' +
        'ORDER BY ruangan_id ASC'
      );
      qryTemp.Open;

      if qryTemp.IsEmpty then
      begin
        MessageDlg('Tidak ada data ruangan di database lokal untuk disinkronkan.', mtInformation, [mbOK], 0);
        Exit;
      end;

      SetLength(Headers, 4);
      Headers[0] := TNameValuePair.Create('apikey', Trim(frmMain.SUPABASE_KEY));
      Headers[1] := TNameValuePair.Create('Authorization', 'Bearer ' + Trim(frmMain.SUPABASE_KEY));
      Headers[2] := TNameValuePair.Create('Content-Type', 'application/json');
      Headers[3] := TNameValuePair.Create('Prefer', 'resolution=merge-duplicates');

      sUpdateBy := Trim(frmMain.USERAPPS);
      if sUpdateBy = '' then
        sUpdateBy := 'ZenSystem';
      sUpdateAt := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss"Z"', TTimeZone.Local.ToUniversalTime(Now));

      TotalSynced := 0;
      BulkRoom := SA();

      while not qryTemp.Eof do
      begin
        Application.ProcessMessages;

        sLocalRoomID := Trim(qryTemp.FieldByName('ruangan_id').AsString);
        if sLocalRoomID <> '' then
        begin
          sRoomID := sOutletID + '.' + sLocalRoomID;

          // Guard anti-duplikat key dalam satu batch (mencegah Postgres Error 21000)
          if SeenRoomIDs.IndexOf(sRoomID) < 0 then
          begin
            SeenRoomIDs.Add(sRoomID);

            sKondisi := UpperCase(Trim(qryTemp.FieldByName('kondisi').AsString));
            sStatus := UpperCase(Trim(qryTemp.FieldByName('status').AsString));
            sLantai := Trim(qryTemp.FieldByName('lantai').AsString);

            JSONRoom := SO();
            JSONRoom.S['kode_outlet'] := sOutletID;
            JSONRoom.S['room_id'] := sRoomID;
            JSONRoom.B['active'] := (sKondisi = 'Y');
            JSONRoom.S['jenis_jasa'] := Trim(qryTemp.FieldByName('jenis_jasa').AsString);
            JSONRoom.S['room_gender'] := Trim(qryTemp.FieldByName('notes').AsString);
            JSONRoom.B['available'] := (sStatus = 'AVAILABLE');
            JSONRoom.S['keterangan'] := 'floor ' + sLantai;
            JSONRoom.Null['fasilitas'] := jNull;
            JSONRoom.S['update_at'] := sUpdateAt;
            JSONRoom.S['update_by'] := sUpdateBy;

            BulkRoom.Add(JSONRoom);

            if BulkRoom.Length >= BATCH_SIZE then
            begin
              if not FlushBatch(BulkRoom) then
                Exit;
              BulkRoom := SA();
            end;
          end;
        end;

        qryTemp.Next;
      end;

      // Kirim sisa record pada batch terakhir
      if BulkRoom.Length > 0 then
      begin
        if not FlushBatch(BulkRoom) then
          Exit;
      end;

      MessageDlg(
        Format('Sinkronisasi berhasil! %d data ruangan telah dikirim ke Cloud Supabase (ot_master_room).', [TotalSynced]),
        mtInformation, [mbOK], 0
      );
    except
      on E: Exception do
        MessageDlg('Terjadi kesalahan saat sinkronisasi Master Ruangan ke Cloud: ' + E.Message, mtError, [mbOK], 0);
    end;
  finally
    SeenRoomIDs.Free;
    HTTP.Free;
    Screen.Cursor := crDefault;
    btnSync.Caption := OldCaption;
    btnSync.Enabled := True;
    btnAdd.Enabled := True;
    btnEdit.Enabled := True;
    btnCancel.Enabled := True;
  end;
end;

end.
