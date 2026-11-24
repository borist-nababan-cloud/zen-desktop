unit FTherapisFlow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  cxDataStorage, cxEdit, cxNavigator, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, Vcl.Menus, cxButtons,
  Vcl.ExtCtrls, cxTextEdit, cxContainer, cxGroupBox, cxRadioGroup,
  Data.DB, DBAccess, MyAccess, MemDS;

type
  TfrmTherapisFlow = class(TForm)
    Label1: TLabel;
    panelRF: TPanel;
    cxGrid2: TcxGrid;
    gtvRF: TcxGridTableView;
    gtvRFKodeKaryawan: TcxGridColumn;
    gtvRFIDKaryawan: TcxGridColumn;
    gtvRFNama: TcxGridColumn;
    gtvRFGroup: TcxGridColumn;
    gtvRFNoUrut: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    pnlBM: TPanel;
    cxGrid1: TcxGrid;
    gtvBM: TcxGridTableView;
    gtvBMKodeKaryawan: TcxGridColumn;
    gtvBMIDKaryawan: TcxGridColumn;
    gtvBMNama: TcxGridColumn;
    gtvBMGroup: TcxGridColumn;
    gtvBMNoUrut: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    btnSave: TcxButton;
    Label2: TLabel;
    Label3: TLabel;
    rbType: TcxRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryExec: TMyQuery;
    procedure ArrangePanels;
    procedure LoadTherapistFlow;
    function GetBaseRESTUrl: String;
  public
    { Public declarations }
  end;

var
  frmTherapisFlow: TfrmTherapisFlow;

implementation

{$R *.dfm}

uses
  FdmDB, FMain,
  System.DateUtils, System.Net.HttpClient, System.Net.URLClient, XSuperObject;

procedure TfrmTherapisFlow.FormCreate(Sender: TObject);
begin
  qrySearch := TMyQuery.Create(Self);
  qrySearch.Connection := dmDB.dbInternal;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := dmDB.dbInternal;

  ArrangePanels;

  if Assigned(dmDB) and dmDB.dbInternal.Connected then
    LoadTherapistFlow;
end;

procedure TfrmTherapisFlow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(qrySearch);
  FreeAndNil(qryExec);

  Action := caFree;
  frmTherapisFlow := nil;
end;

procedure TfrmTherapisFlow.FormResize(Sender: TObject);
begin
  ArrangePanels;
end;

procedure TfrmTherapisFlow.ArrangePanels;
const
  MARGIN_SIDE = 8;
  GAP_V = 8;
  MIN_PANEL_HEIGHT = 100;
var
  TopStart, BottomTop, AvailHeight, HalfHeight, PanelWidth: Integer;
begin
  TopStart := Label1.Top + Label1.Height + GAP_V;

  // Jaga jarak aman di atas komponen bawah (btnSave & rbType)
  BottomTop := btnSave.Top - GAP_V;
  if (rbType.Top - GAP_V) < BottomTop then
    BottomTop := rbType.Top - GAP_V;

  AvailHeight := BottomTop - TopStart - GAP_V;
  if AvailHeight < (MIN_PANEL_HEIGHT * 2) then
    AvailHeight := MIN_PANEL_HEIGHT * 2;

  HalfHeight := AvailHeight div 2;
  PanelWidth := ClientWidth - (MARGIN_SIDE * 2);
  if PanelWidth < 200 then
    PanelWidth := 200;

  panelRF.SetBounds(MARGIN_SIDE, TopStart, PanelWidth, HalfHeight);
  pnlBM.SetBounds(MARGIN_SIDE, TopStart + HalfHeight + GAP_V, PanelWidth, AvailHeight - HalfHeight);
end;

function TfrmTherapisFlow.GetBaseRESTUrl: String;
begin
  Result := Trim(frmMain.SUPABASE_URL);
  if (Result <> '') and (Result[Length(Result)] <> '/') and (Result[Length(Result)] <> '\') then
    Result := Result + '/';
end;

procedure TfrmTherapisFlow.LoadTherapistFlow;
var
  recIdx: Integer;
  sDept, sStatus: String;
  bStatusLoaded: Boolean;
begin
  if (not Assigned(dmDB)) or (not dmDB.dbInternal.Connected) then
    Exit;

  bStatusLoaded := False;

  gtvRF.BeginUpdate;
  gtvBM.BeginUpdate;
  try
    gtvRF.DataController.RecordCount := 0;
    gtvBM.DataController.RecordCount := 0;

    qrySearch.Close;
    qrySearch.SQL.Clear;
    qrySearch.SQL.Add(
      'SELECT k.kodekaryawan, k.idkaryawan, k.namakaryawan, k.departemen, ' +
      '       (SELECT s.ngroup FROM ben_tr_status s WHERE s.lastedituser = k.kodekaryawan ORDER BY s.autonum DESC LIMIT 1) AS ngroup, ' +
      '       (SELECT s.noslot FROM ben_tr_status s WHERE s.lastedituser = k.kodekaryawan ORDER BY s.autonum DESC LIMIT 1) AS noslot, ' +
      '       (SELECT s.status FROM ben_tr_status s WHERE s.lastedituser = k.kodekaryawan ORDER BY s.autonum DESC LIMIT 1) AS status ' +
      'FROM ben_hrd_karyawan_info k ' +
      'WHERE k.departemen IN (''TR'', ''TB'') AND k.active = ''Y'' ' +
      'ORDER BY k.departemen ASC, k.namakaryawan ASC'
    );
    qrySearch.Open;

    while not qrySearch.Eof do
    begin
      sDept := UpperCase(Trim(qrySearch.FieldByName('departemen').AsString));

      if not bStatusLoaded then
      begin
        sStatus := Trim(qrySearch.FieldByName('status').AsString);
        if (sStatus = '0') or (sStatus = '1') then
        begin
          rbType.ItemIndex := StrToIntDef(sStatus, 0);
          bStatusLoaded := True;
        end;
      end;

      if sDept = 'TR' then
      begin
        recIdx := gtvRF.DataController.AppendRecord;
        gtvRF.DataController.Values[recIdx, gtvRFKodeKaryawan.Index] := Trim(qrySearch.FieldByName('kodekaryawan').AsString);
        gtvRF.DataController.Values[recIdx, gtvRFIDKaryawan.Index] := Trim(qrySearch.FieldByName('idkaryawan').AsString);
        gtvRF.DataController.Values[recIdx, gtvRFNama.Index] := Trim(qrySearch.FieldByName('namakaryawan').AsString);
        gtvRF.DataController.Values[recIdx, gtvRFGroup.Index] := Trim(qrySearch.FieldByName('ngroup').AsString);
        gtvRF.DataController.Values[recIdx, gtvRFNoUrut.Index] := Trim(qrySearch.FieldByName('noslot').AsString);
      end
      else if sDept = 'TB' then
      begin
        recIdx := gtvBM.DataController.AppendRecord;
        gtvBM.DataController.Values[recIdx, gtvBMKodeKaryawan.Index] := Trim(qrySearch.FieldByName('kodekaryawan').AsString);
        gtvBM.DataController.Values[recIdx, gtvBMIDKaryawan.Index] := Trim(qrySearch.FieldByName('idkaryawan').AsString);
        gtvBM.DataController.Values[recIdx, gtvBMNama.Index] := Trim(qrySearch.FieldByName('namakaryawan').AsString);
        gtvBM.DataController.Values[recIdx, gtvBMGroup.Index] := Trim(qrySearch.FieldByName('ngroup').AsString);
        gtvBM.DataController.Values[recIdx, gtvBMNoUrut.Index] := Trim(qrySearch.FieldByName('noslot').AsString);
      end;

      qrySearch.Next;
    end;
  finally
    gtvRF.EndUpdate;
    gtvBM.EndUpdate;
  end;
end;

procedure TfrmTherapisFlow.btnSaveClick(Sender: TObject);
const
  BATCH_SIZE = 50;
var
  I, TotalLocal, TotalCloudDetail: Integer;
  sKodeKaryawan, sIDKaryawan, sNama, sGroup, sNoUrut, sStatusStr: String;
  sNowMySQL, sTodayDate, sOutletID, sUser, BaseURL, OldCaption: String;
  HTTP: THTTPClient;
  Resp: IHTTPResponse;
  Headers, DeleteHeaders: TNetHeaders;
  RequestBody: TStringStream;
  JSONMaster, JSONDetail: ISuperObject;
  BulkDetail, BatchSlice: ISuperArray;
  SeenKode: TStringList;
  bStartedTx: Boolean;

  procedure CollectAndInsertGrid(
    const AView: TcxGridTableView;
    const AColKode, AColID, AColNama, AColGroup, AColNoUrut: TcxGridColumn;
    const ADept: String
  );
  var
    R: Integer;
    ObjDetail: ISuperObject;
  begin
    for R := 0 to AView.DataController.RecordCount - 1 do
    begin
      sKodeKaryawan := Trim(VarToStr(AView.DataController.Values[R, AColKode.Index]));
      sIDKaryawan := Trim(VarToStr(AView.DataController.Values[R, AColID.Index]));
      sNama := Trim(VarToStr(AView.DataController.Values[R, AColNama.Index]));
      sGroup := Trim(VarToStr(AView.DataController.Values[R, AColGroup.Index]));
      sNoUrut := Trim(VarToStr(AView.DataController.Values[R, AColNoUrut.Index]));

      if sKodeKaryawan = '' then
        Continue;

      // 1. Insert ke MySQL lokal ben_tr_status
      qryExec.Close;
      qryExec.SQL.Clear;
      qryExec.SQL.Add(
        'INSERT INTO ben_tr_status ' +
        '  (idkaryawan, ngroup, noslot, status, lastedituser, lasteditdate) ' +
        'VALUES ' +
        '  (:idkaryawan, :ngroup, :noslot, :status, :lastedituser, :lasteditdate)'
      );
      qryExec.ParamByName('idkaryawan').AsString := sIDKaryawan;
      qryExec.ParamByName('ngroup').AsString := sGroup;
      qryExec.ParamByName('noslot').AsString := sNoUrut;
      qryExec.ParamByName('status').AsString := sStatusStr;
      qryExec.ParamByName('lastedituser').AsString := sKodeKaryawan;
      qryExec.ParamByName('lasteditdate').AsString := sNowMySQL;
      qryExec.ExecSQL;
      Inc(TotalLocal);

      // 2. Kumpulkan payload unik untuk Supabase ot_pos_tr_flow_detail
      if SeenKode.IndexOf(sKodeKaryawan) < 0 then
      begin
        SeenKode.Add(sKodeKaryawan);

        ObjDetail := SO();
        ObjDetail.S['kode_outlet'] := sOutletID;
        ObjDetail.S['kodekaryawan'] := sKodeKaryawan;
        ObjDetail.S['idkaryawan'] := sIDKaryawan;
        ObjDetail.S['namakaryawan'] := sNama;
        ObjDetail.S['departemen'] := ADept;
        ObjDetail.S['ngroup'] := sGroup;
        ObjDetail.S['noslot'] := sNoUrut;
        ObjDetail.S['updated_by'] := sUser;
        BulkDetail.Add(ObjDetail);
      end;
    end;
  end;

  function FlushDetailBatch(const ABatch: ISuperArray): Boolean;
  begin
    Result := True;
    if ABatch.Length = 0 then
      Exit;

    RequestBody := TStringStream.Create(ABatch.AsJSON, TEncoding.UTF8);
    try
      Resp := HTTP.Post(BaseURL + 'ot_pos_tr_flow_detail?on_conflict=kode_outlet,kodekaryawan', RequestBody, nil, Headers);
      if (Resp.StatusCode = 200) or (Resp.StatusCode = 201) then
        TotalCloudDetail := TotalCloudDetail + ABatch.Length
      else
      begin
        Result := False;
        MessageDlg(
          Format('Data lokal tersimpan, tetapi gagal sync ot_pos_tr_flow_detail (HTTP %d):%s%s',
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

  // Pastikan sel yang sedang diedit di grid langsung di-commit sebelum dibaca
  if gtvRF.Controller.EditingController.IsEditing then
    gtvRF.Controller.EditingController.HideEdit(True);
  if gtvBM.Controller.EditingController.IsEditing then
    gtvBM.Controller.EditingController.HideEdit(True);
  gtvRF.DataController.Post(True);
  gtvBM.DataController.Post(True);

  if (rbType.ItemIndex < 0) or (rbType.ItemIndex > 1) then
  begin
    MessageDlg('Silakan pilih Type Slot (ATAS / BAWAH) terlebih dahulu.', mtWarning, [mbOK], 0);
    Exit;
  end;

  sStatusStr := IntToStr(rbType.ItemIndex);
  sNowMySQL := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
  sTodayDate := FormatDateTime('yyyy-mm-dd', Now);
  sOutletID := Trim(frmMain.APP_OUTLETID);
  sUser := Trim(frmMain.USERAPPS);
  if sUser = '' then
    sUser := 'ZenSystem';

  OldCaption := btnSave.Caption;
  btnSave.Enabled := False;
  rbType.Enabled := False;
  btnSave.Caption := 'Saving...';
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  SeenKode := TStringList.Create;
  BulkDetail := SA();
  TotalLocal := 0;
  TotalCloudDetail := 0;
  try
    SeenKode.Sorted := True;
    SeenKode.CaseSensitive := False;
    SeenKode.Duplicates := dupIgnore;

    // =========================================================================
    // TAHAP 1: Simpan ke MySQL Lokal (ben_tr_status) secara Atomik (Transaksi)
    // =========================================================================
    bStartedTx := False;
    try
      if not dmDB.dbInternal.InTransaction then
      begin
        dmDB.dbInternal.StartTransaction;
        bStartedTx := True;
      end;

      qryExec.Close;
      qryExec.SQL.Clear;
      qryExec.SQL.Add('DELETE FROM ben_tr_status');
      qryExec.ExecSQL;

      CollectAndInsertGrid(gtvRF, gtvRFKodeKaryawan, gtvRFIDKaryawan, gtvRFNama, gtvRFGroup, gtvRFNoUrut, 'TR');
      CollectAndInsertGrid(gtvBM, gtvBMKodeKaryawan, gtvBMIDKaryawan, gtvBMNama, gtvBMGroup, gtvBMNoUrut, 'TB');

      if bStartedTx then
        dmDB.dbInternal.Commit;
    except
      on E: Exception do
      begin
        if bStartedTx and dmDB.dbInternal.InTransaction then
          dmDB.dbInternal.Rollback;
        MessageDlg('Gagal menyimpan Therapist Flow ke database lokal (ben_tr_status): ' + E.Message, mtError, [mbOK], 0);
        Exit;
      end;
    end;

    // =========================================================================
    // TAHAP 2: Sync ke Supabase Cloud (ot_pos_tr_flow_master & detail)
    // =========================================================================
    BaseURL := GetBaseRESTUrl;
    if (BaseURL = '') or (Trim(frmMain.SUPABASE_KEY) = '') or (sOutletID = '') then
    begin
      MessageDlg(
        Format('Data lokal (%d terapis) berhasil disimpan ke ben_tr_status, tetapi sinkronisasi Cloud dilewati karena konfigurasi Supabase / Kode Outlet belum lengkap.', [TotalLocal]),
        mtWarning, [mbOK], 0
      );
      Exit;
    end;

    btnSave.Caption := 'Syncing...';
    Application.ProcessMessages;

    HTTP := THTTPClient.Create;
    try
      HTTP.ConnectionTimeout := 10000;
      HTTP.ResponseTimeout := 30000;

      SetLength(Headers, 4);
      Headers[0] := TNameValuePair.Create('apikey', Trim(frmMain.SUPABASE_KEY));
      Headers[1] := TNameValuePair.Create('Authorization', 'Bearer ' + Trim(frmMain.SUPABASE_KEY));
      Headers[2] := TNameValuePair.Create('Content-Type', 'application/json');
      Headers[3] := TNameValuePair.Create('Prefer', 'resolution=merge-duplicates');

      SetLength(DeleteHeaders, 3);
      DeleteHeaders[0] := TNameValuePair.Create('apikey', Trim(frmMain.SUPABASE_KEY));
      DeleteHeaders[1] := TNameValuePair.Create('Authorization', 'Bearer ' + Trim(frmMain.SUPABASE_KEY));
      DeleteHeaders[2] := TNameValuePair.Create('Content-Type', 'application/json');

      try
        // 2A. Post / Upsert ot_pos_tr_flow_master (tanggal hari ini; trigger DB menjaga retensi 2 hari)
        JSONMaster := SO();
        JSONMaster.S['kode_outlet'] := sOutletID;
        JSONMaster.S['tanggal'] := sTodayDate;
        JSONMaster.I['status_slot'] := rbType.ItemIndex;
        JSONMaster.S['source'] := 'DESKTOP';
        JSONMaster.S['updated_by'] := sUser;

        RequestBody := TStringStream.Create(JSONMaster.AsJSON, TEncoding.UTF8);
        try
          Resp := HTTP.Post(BaseURL + 'ot_pos_tr_flow_master?on_conflict=kode_outlet,tanggal', RequestBody, nil, Headers);
          if (Resp.StatusCode <> 200) and (Resp.StatusCode <> 201) then
          begin
            MessageDlg(
              Format('Data lokal tersimpan, tetapi gagal sync ot_pos_tr_flow_master (HTTP %d):%s%s',
                [Resp.StatusCode, sLineBreak, Resp.ContentAsString]),
              mtError, [mbOK], 0
            );
            Exit;
          end;
        finally
          RequestBody.Free;
        end;

        // 2B. Bersihkan detail lama milik outlet ini agar tidak ada terapis non-aktif tersisa
        Resp := HTTP.Delete(BaseURL + 'ot_pos_tr_flow_detail?kode_outlet=eq.' + sOutletID, nil, DeleteHeaders);
        if (Resp.StatusCode <> 200) and (Resp.StatusCode <> 204) then
        begin
          MessageDlg(
            Format('Data lokal & master tersimpan, tetapi gagal membersihkan ot_pos_tr_flow_detail lama (HTTP %d):%s%s',
              [Resp.StatusCode, sLineBreak, Resp.ContentAsString]),
            mtError, [mbOK], 0
          );
          Exit;
        end;

        // 2C. Batch Upsert ot_pos_tr_flow_detail (chunk per 50 baris)
        BatchSlice := SA();
        for I := 0 to BulkDetail.Length - 1 do
        begin
          Application.ProcessMessages;
          JSONDetail := BulkDetail.O[I];
          BatchSlice.Add(JSONDetail);

          if BatchSlice.Length >= BATCH_SIZE then
          begin
            if not FlushDetailBatch(BatchSlice) then
              Exit;
            BatchSlice := SA();
          end;
        end;

        if BatchSlice.Length > 0 then
        begin
          if not FlushDetailBatch(BatchSlice) then
            Exit;
        end;

        MessageDlg(
          Format('Berhasil! %d data terapis tersimpan di MySQL lokal (ben_tr_status) dan %d detail + master tanggal %s (Type Slot: %d) berhasil disinkronkan ke Cloud Supabase.',
            [TotalLocal, TotalCloudDetail, sTodayDate, rbType.ItemIndex]),
          mtInformation, [mbOK], 0
        );
      except
        on E: Exception do
          MessageDlg('Data lokal tersimpan, tetapi terjadi kesalahan jaringan saat sync ke Cloud Supabase: ' + E.Message, mtError, [mbOK], 0);
      end;
    finally
      HTTP.Free;
    end;
  finally
    SeenKode.Free;
    Screen.Cursor := crDefault;
    btnSave.Caption := OldCaption;
    btnSave.Enabled := True;
    rbType.Enabled := True;
  end;
end;

end.
