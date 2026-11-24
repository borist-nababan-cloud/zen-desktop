unit FReportPayroll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxTextEdit, cxCalc, cxGridBandedTableView, cxDBLookupComboBox,
  cxContainer, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit,
  cxDBLookupEdit, QRCtrls, QuickRpt, ExtCtrls, Printers, ShellApi, cxGridExportLink,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, Vcl.ComCtrls, dxCore, cxDateUtils, MyAccess,
  MemDS, Vcl.Menus, cxButtons;

type
  TfrmReportPayroll = class(TForm)
    edPeriode: TComboBox;
    lblJudulForm: TLabel;
    Button1: TButton;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListkodekaryawan: TcxGridDBColumn;
    gtbListidkaryawan: TcxGridDBColumn;
    gtbListnamakaryawan: TcxGridDBColumn;
    gtbListnamabank: TcxGridDBColumn;
    gtbListnamarek: TcxGridDBColumn;
    gtbListNorek: TcxGridDBColumn;
    gtbListTHP: TcxGridDBColumn;
    tvList: TcxGridBandedTableView;
    tvListKodeKaryawan: TcxGridBandedColumn;
    tvListIDFinger: TcxGridBandedColumn;
    tvListNama: TcxGridBandedColumn;
    tvListDivisi: TcxGridBandedColumn;
    tvListBank: TcxGridBandedColumn;
    tvListNoRek: TcxGridBandedColumn;
    tvListNamaRek: TcxGridBandedColumn;
    tvListTHP: TcxGridBandedColumn;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    btnCetakSlipSatuan: TButton;
    Button3: TButton;
    Label1: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    Label2: TLabel;
    tblOutlet: TMyTable;
    dsTblOutlet: TDataSource;
    Label3: TLabel;
    edOutlet: TcxLookupComboBox;
    mySQLQuery1: TMyQuery;
    qrpSlip: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    lblOutlet: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    lblPeriode: TQRLabel;
    QRLabel8: TQRLabel;
    lblHMasukKerja: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    lblJamLembur: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    lblLate1: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    lblLate2: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    lblSakit: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    lblHIMasuk: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    lblAlpa: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    lblHITidakAbsen: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    lblHUnder: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    lblGapok: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    lblUM: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    lblHLibNas: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    lblHCuti: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    lblHIPulang: TQRDBText;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    lblHFOT: TQRDBText;
    qrySlip: TMyQuery;
    dsQrySlip: TDataSource;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    lblTunjangan: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    lblSaving: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    lblVBpjs: TQRDBText;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    lblKomisi: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    lblAdjustment: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    lblPotLain: TQRDBText;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    lblDenda: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    lblLembur: TQRDBText;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    lblUmLibNas: TQRDBText;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    lblGpLibNas: TQRDBText;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    lblHITidakMasuk: TQRDBText;
    QRShape1: TQRShape;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    lblNFOT: TQRDBText;
    QRLabel66: TQRLabel;
    lblTHP: TQRDBText;
    lblPenerima: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRShape2: TQRShape;
    QRImage1: TQRImage;
    cbPrinter: TComboBox;
    btnExport: TButton;
    Button4: TButton;
    dlgSave: TSaveDialog;
    btnCetakKomisiAll: TButton;
    btnCetakKomisiSatuan: TButton;
    qryKomisi: TMyQuery;
    dsQryKomisi: TDataSource;
    qryInfo: TMyQuery;
    dsQryInfo: TDataSource;
    qrpKomisi: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    lblOutletKomisi: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel73: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel74: TQRLabel;
    lblPeriodeKomisi: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRShape3: TQRShape;
    QRBand2: TQRBand;
    lblTglKomisi: TQRDBText;
    lblSubtotal: TQRDBText;
    QRDBText10: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel81: TQRLabel;
    lblTotalKomisi: TQRLabel;
    QRShape4: TQRShape;
    btnSyncCloud: TcxButton;
    lblSyncProgress: TLabel;
    procedure btnSyncCloudClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure btnCetakSlipSatuanClick(Sender: TObject);
    procedure lblTHPPrint(sender: TObject; var Value: string);
    procedure lblNFOTPrint(sender: TObject; var Value: string);
    procedure lblGpLibNasPrint(sender: TObject; var Value: string);
    procedure lblUmLibNasPrint(sender: TObject; var Value: string);
    procedure lblLemburPrint(sender: TObject; var Value: string);
    procedure lblDendaPrint(sender: TObject; var Value: string);
    procedure lblPotLainPrint(sender: TObject; var Value: string);
    procedure lblAdjustmentPrint(sender: TObject; var Value: string);
    procedure lblKomisiPrint(sender: TObject; var Value: string);
    procedure lblVBpjsPrint(sender: TObject; var Value: string);
    procedure lblSavingPrint(sender: TObject; var Value: string);
    procedure lblTunjanganPrint(sender: TObject; var Value: string);
    procedure lblUMPrint(sender: TObject; var Value: string);
    procedure lblGapokPrint(sender: TObject; var Value: string);
    procedure QRDBText3Print(sender: TObject; var Value: string);
    procedure lblHMasukKerjaPrint(sender: TObject; var Value: string);
    procedure lblHUnderPrint(sender: TObject; var Value: string);
    procedure lblJamLemburPrint(sender: TObject; var Value: string);
    procedure lblLate1Print(sender: TObject; var Value: string);
    procedure lblLate2Print(sender: TObject; var Value: string);
    procedure lblHIMasukPrint(sender: TObject; var Value: string);
    procedure lblHITidakAbsenPrint(sender: TObject; var Value: string);
    procedure lblHITidakMasukPrint(sender: TObject; var Value: string);
    procedure lblHLibNasPrint(sender: TObject; var Value: string);
    procedure lblHCutiPrint(sender: TObject; var Value: string);
    procedure lblHIPulangPrint(sender: TObject; var Value: string);
    procedure lblHFOTPrint(sender: TObject; var Value: string);
    procedure lblSakitPrint(sender: TObject; var Value: string);
    procedure lblAlpaPrint(sender: TObject; var Value: string);
    procedure Button3Click(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnCetakKomisiSatuanClick(Sender: TObject);
    procedure btnCetakKomisiAllClick(Sender: TObject);
    procedure lblTglKomisiPrint(sender: TObject; var Value: string);
    procedure lblSubtotalPrint(sender: TObject; var Value: string);
  private
    { Private declarations }
    qryCari, qrySearch, qryFind : TMyQuery;
    INDEXPRINTER, FTotalPages : Integer;
    VKOMISI : Double;
  public
    { Public declarations }
    ISADMIN : String;
  end;

var
  frmReportPayroll: TfrmReportPayroll;

implementation

{$R *.dfm}

uses FdmDB, FMain, FCetakKomisi,
     System.Net.HttpClient, System.Net.URLClient, XSuperObject;

procedure TfrmReportPayroll.btnSyncCloudClick(Sender: TObject);
var
  HTTP: THTTPClient;
  Resp: IHTTPResponse;
  Headers: TNetHeaders;
  RequestBody: TStringStream;
  JSONObj, JSONData: ISuperObject;
  qryPayroll: TMyQuery;
  BaseURL, sKodeKaryawan, sPeriode, sKodeOutlet, FN: string;
  TotalCount, CurrentIdx, SuccessCount, FailCount, I: Integer;
begin
  sPeriode := Trim(edPeriode.Text);
  if sPeriode = '' then
  begin
    ShowMessage('Silakan pilih Periode Payroll pada dropdown terlebih dahulu!');
    Exit;
  end;

  // 1. Guard check konfigurasi Supabase & Outlet
  BaseURL := Trim(frmMain.SUPABASE_URL);
  if (BaseURL = '') or (Trim(frmMain.SUPABASE_KEY) = '') then
  begin
    ShowMessage('Konfigurasi Cloud Supabase belum lengkap di config.json!' + #13#10 +
                'Pastikan SUPABASE_URL dan SUPABASE_KEY telah terkonfigurasi.');
    lblSyncProgress.Caption := 'Error: Supabase URL / Key belum terisi.';
    Exit;
  end;

  if Trim(frmMain.APP_OUTLETID) = '' then
  begin
    ShowMessage('ID Outlet belum ditentukan (APP_OUTLETID kosong)!');
    lblSyncProgress.Caption := 'Error: APP_OUTLETID kosong.';
    Exit;
  end;

  // Pastikan trailing slash pada BaseURL
  if not (BaseURL[Length(BaseURL)] in ['/', '\']) then
    BaseURL := BaseURL + '/';

  btnSyncCloud.Enabled := False;
  lblSyncProgress.Caption := 'Menyiapkan data payroll periode ' + sPeriode + '...';
  Application.ProcessMessages;

  qryPayroll := TMyQuery.Create(Self);
  HTTP := THTTPClient.Create;
  try
    try
      qryPayroll.Connection := dmDB.dbInternal;

      // Ambil seluruh rincian payroll untuk periode yang dipilih beserta kodeoutlet dari tabel departemen
      qryPayroll.SQL.Text :=
        'SELECT p.*, d.kodeoutlet AS dept_kodeoutlet ' +
        'FROM ben_payroll_details p ' +
        'LEFT JOIN ben_hrd_karyawan_info k ON p.kodekaryawan = k.kodekaryawan ' +
        'LEFT JOIN departemen d ON k.departemen = d.id_departemen ' +
        'WHERE TRIM(p.payrollperiode) = ' + QuotedStr(sPeriode) + ' ' +
        'ORDER BY p.autonum ASC';
      qryPayroll.Open;

      TotalCount := qryPayroll.RecordCount;
      if TotalCount = 0 then
      begin
        lblSyncProgress.Caption := 'Tidak ada data di tabel ben_payroll_details untuk periode ' + sPeriode;
        ShowMessage('Tidak ditemukan data pada tabel "ben_payroll_details" untuk periode: ' + sPeriode + #13#10#13#10 +
                    'Penyebab:' + #13#10 +
                    'Data pada grid layar dimuat dari Master Karyawan (ben_hrd_karyawan_info) dengan THP default 0, ' +
                    'sedangkan sinkronisasi Cloud membutuhkan data rincian kalkulasi gaji dari tabel "ben_payroll_details".' + #13#10#13#10 +
                    'Solusi:' + #13#10 +
                    '1. Pastikan penggajian periode ini sudah diproses dan disimpan (Save) di menu "Payroll Admin", ATAU' + #13#10 +
                    '2. Pilih periode yang sudah pernah diproses penggajiannya (contoh: PYZ.112.2025032120).');
        Exit;
      end;

      SetLength(Headers, 4);
      Headers[0] := TNameValuePair.Create('apikey', frmMain.SUPABASE_KEY);
      Headers[1] := TNameValuePair.Create('Authorization', 'Bearer ' + frmMain.SUPABASE_KEY);
      Headers[2] := TNameValuePair.Create('Content-Type', 'application/json');
      Headers[3] := TNameValuePair.Create('Prefer', 'resolution=merge-duplicates'); // Upsert mode

      HTTP.ConnectionTimeout := 7000;
      HTTP.ResponseTimeout := 15000;

      CurrentIdx := 0;
      SuccessCount := 0;
      FailCount := 0;

      while not qryPayroll.Eof do
      begin
        Inc(CurrentIdx);
        sKodeKaryawan := qryPayroll.FieldByName('kodekaryawan').AsString;
        sKodeOutlet := Trim(qryPayroll.FieldByName('dept_kodeoutlet').AsString);
        if sKodeOutlet = '' then
          sKodeOutlet := Trim(frmMain.APP_OUTLETID);

        lblSyncProgress.Caption := Format('Sinkronisasi [%d/%d]: %s...', [CurrentIdx, TotalCount, sKodeKaryawan]);
        Application.ProcessMessages;

        try
          JSONObj := SO();
          JSONObj.S['kode_outlet'] := sKodeOutlet;
          JSONObj.I['local_autonum'] := qryPayroll.FieldByName('autonum').AsInteger;
          JSONObj.S['kodekaryawan'] := sKodeKaryawan;
          JSONObj.S['payrollperiode'] := sPeriode;

          // Root level nilaithp untuk query dashboard & evaluasi berkecepatan tinggi
          if not qryPayroll.FieldByName('nilaithp').IsNull then
            JSONObj.S['nilaithp'] := StringReplace(FloatToStr(qryPayroll.FieldByName('nilaithp').AsFloat), ',', '.', [rfReplaceAll])
          else
            JSONObj.Null['nilaithp'] := jNull;

          // Buat nested JSONB untuk seluruh kolom metrik dinamis penggajian & absensi
          JSONData := SO();
          for I := 0 to qryPayroll.FieldCount - 1 do
          begin
            FN := LowerCase(qryPayroll.Fields[I].FieldName);
            // Lewati field yang telah dikelola eksplisit di level root atau helper join
            if (FN <> 'autonum') and (FN <> 'idoutlet') and (FN <> 'kodekaryawan') and (FN <> 'dept_kodeoutlet') then
            begin
              if not qryPayroll.Fields[I].IsNull then
              begin
                case qryPayroll.Fields[I].DataType of
                  ftInteger, ftSmallint, ftWord, ftLargeint:
                    JSONData.I[qryPayroll.Fields[I].FieldName] := qryPayroll.Fields[I].AsInteger;
                  ftFloat, ftCurrency, ftBCD, ftFMTBcd:
                    JSONData.S[qryPayroll.Fields[I].FieldName] := StringReplace(FloatToStr(qryPayroll.Fields[I].AsFloat), ',', '.', [rfReplaceAll]);
                  ftDate, ftDateTime, ftTime, ftTimeStamp:
                    JSONData.S[qryPayroll.Fields[I].FieldName] := FormatDateTime('yyyy-mm-dd hh:nn:ss', qryPayroll.Fields[I].AsDateTime);
                  else
                    JSONData.S[qryPayroll.Fields[I].FieldName] := qryPayroll.Fields[I].AsString;
                end;
              end;
            end;
          end;

          // Sematkan objek JSONData ke kolom payroll_data (JSONB)
          JSONObj.O['payroll_data'] := JSONData;

          RequestBody := TStringStream.Create(JSONObj.AsJSON, TEncoding.UTF8);
          try
            Resp := HTTP.Post(BaseURL + 'ot_hrd_karyawan_payroll_details?on_conflict=kode_outlet,local_autonum', RequestBody, nil, Headers);
            if (Resp.StatusCode = 200) or (Resp.StatusCode = 201) then
              Inc(SuccessCount)
            else
              Inc(FailCount);
          finally
            RequestBody.Free;
          end;

        except
          on E: Exception do
          begin
            Inc(FailCount);
          end;
        end;

        qryPayroll.Next;
      end;

      if FailCount = 0 then
        lblSyncProgress.Caption := Format('Selesai! Seluruh %d data payroll periode %s berhasil disinkronkan.', [SuccessCount, sPeriode])
      else
        lblSyncProgress.Caption := Format('Selesai dengan catatan: %d sukses, %d gagal dari %d data.', [SuccessCount, FailCount, TotalCount]);

      ShowMessage(Format('Sinkronisasi Payroll selesai!' + #13#10 +
                         '- Periode              : %s' + #13#10 +
                         '- Total Data Karyawan  : %d' + #13#10 +
                         '- Berhasil Disinkronkan: %d' + #13#10 +
                         '- Gagal / Terlewat     : %d', [sPeriode, TotalCount, SuccessCount, FailCount]));
    except
      on E: Exception do
      begin
        lblSyncProgress.Caption := 'Gagal sinkronisasi: ' + E.Message;
        ShowMessage('Terjadi kesalahan saat sinkronisasi payroll ke Cloud:' + #13#10 + E.Message);
      end;
    end;
  finally
    qryPayroll.Free;
    HTTP.Free;
    btnSyncCloud.Enabled := True;
  end;
end;

procedure TfrmReportPayroll.btnExportClick(Sender: TObject);
begin
   dlgSave.Title := '[Excel 97-2003] Export to...';
     dlgSave.Filter := 'Microsoft Excel 97-2003 (*.xls)|*.xls';
     dlgSave.FileName := '';
     if (dlgSave.Execute) then
        begin
             if (dlgSave.FileName <> '') then
                begin
                     ExportGridToExcel(dlgSave.FileName, cxGrid1, true, true, true, 'xls');
                     if (MessageDlg('Would you like to open exported file now?',
                         mtConfirmation, mbOKCancel, 0) = mrOK) then
                         begin
                              if (ExtractFileExt(dlgSave.FileName) = '.xls') then
                                 ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                              else
                                  ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName + '.xls'), pChar(''), pChar(ExtractFileDir(dlgSave.FileName + '.xls')), SW_MAXIMIZE)
                         end
                     else exit;
                end
             else exit;
        end
     else exit;
end;

procedure TfrmReportPayroll.Button1Click(Sender: TObject);
var
  recCount, NewRec : Integer;
  strLoad, kodekaryawan : String;
  nTHP : Double;
  i: Integer;
begin
if (edPeriode.Text = '') then Exit;
  recCount := tvList.DataController.RecordCount;
   if (recCount > 0) then
     begin
       if (MessageDlg('Data User Exist, ' + #13 +
              'Would You Like to Update Data ?', mtConfirmation, mbOKCancel,0) = mrCancel) then
           begin
              Exit;
           end;
     end;
   Screen.Cursor := crHourGlass;
   tvList.DataController.SelectAll;
   tvList.DataController.DeleteSelection;
   if (ISADMIN = 'Y') then
    begin
      strLoad := 'SELECT ben_hrd_karyawan_info.kodekaryawan, ben_hrd_karyawan_info.idkaryawan, ' +
         'ben_hrd_karyawan_info.departemen, ben_hrd_karyawan_info.namakaryawan, ben_hrd_karyawan_info.namabank, ' +
         'ben_hrd_karyawan_info.namarek, ben_hrd_karyawan_info.norek FROM ben_hrd_karyawan_info ' +
         'WHERE ben_hrd_karyawan_info.isadmin = ''' + 'Y' + ''' ' +
         'AND ben_hrd_karyawan_info.active = ''' + 'Y' + '''';
    end
   else if (ISADMIN = 'N') then
    begin
      strLoad := 'SELECT ben_hrd_karyawan_info.kodekaryawan, ben_hrd_karyawan_info.idkaryawan, ' +
         'ben_hrd_karyawan_info.departemen, ben_hrd_karyawan_info.namakaryawan, ben_hrd_karyawan_info.namabank, ' +
         'ben_hrd_karyawan_info.namarek, ben_hrd_karyawan_info.norek FROM ben_hrd_karyawan_info ' +
         'WHERE ben_hrd_karyawan_info.active = ''' + 'Y' + '''';
    end;
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select idoutlet, tglstart, tglend from ben_payroll_periode ' +
      'where payrollperiode = ''' + edPeriode.Text + '''');
   qryCari.Open;
   edStart.Date := qryCari.Fields[1].AsDateTime;
   edEnd.Date := qryCari.Fields[2].AsDateTime;
   edOutlet.EditValue := qryCari.Fields[0].AsString;
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add(strLoad);
   qrySearch.Open;
   qrySearch.First;
   for i := 0 to qrySearch.RecordCount - 1 do
     begin
       NewRec := tvList.DataController.InsertRecord(tvList.DataController.RecordCount);
       tvList.DataController.SetValue(NewRec, tvListKodeKaryawan.Index, qrySearch.Fields[0].AsString);
       tvList.DataController.SetValue(NewRec, tvListIDFinger.Index, qrySearch.Fields[1].AsString);
       tvList.DataController.SetValue(NewRec, tvListDivisi.Index, qrySearch.Fields[2].AsString);
       tvList.DataController.SetValue(NewRec, tvListNama.Index, qrySearch.Fields[3].AsString);
       tvList.DataController.SetValue(NewRec, tvListBank.Index, qrySearch.Fields[4].AsString);
       tvList.DataController.SetValue(NewRec, tvListNamaRek.Index, qrySearch.Fields[5].AsString);
       tvList.DataController.SetValue(NewRec, tvListNoRek.Index, qrySearch.Fields[6].AsString);
       kodekaryawan := qrySearch.Fields[0].AsString;
       qryFind.Close;
       qryFind.SQL.Clear;
       qryFind.SQL.Add('select nilaithp from ben_payroll_details ' +
           'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
           kodekaryawan + '''');
       qryFind.Open;
       if (qryFind.IsEmpty) then nTHP := 0
       else if (NOT qryFind.IsEmpty) then nTHP := qryFind.Fields[0].AsFloat;

       tvList.DataController.SetValue(NewRec, tvListTHP.Index, nTHP);
       tvList.DataController.PostEditingData;
       tvList.DataController.Post(True);
       Application.ProcessMessages;
       qrySearch.Next;
     end;
   Screen.Cursor := crDefault;
   ShowMessage('Load Data Finish !');
end;

procedure TfrmReportPayroll.btnCetakSlipSatuanClick(Sender: TObject);
var
  strSql, kodeKaryawan : String;
  recSelect : Integer;
begin
  if (cbPrinter.ItemIndex < 0) then
    begin
      ShowMessage('Mohon Pilih Printer');
      Exit;
    end;
  recSelect := tvList.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodeKaryawan := VarToStr(tvList.DataController.GetValue(recSelect, tvListKodeKaryawan.Index));
   strSql := 'select ben_payroll_details.*, ' +
      '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan_info ' +
      'where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_details.kodekaryawan) as namakaryawan, ' +
      '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info ' +
      'where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_details.kodekaryawan) as kodedivisi, ' +
      '(select departemen.nama_departemen from departemen where departemen.id_departemen = kodedivisi) as namadivisi ' +
      'FROM ben_payroll_details WHERE ben_payroll_details.payrollperiode = ''' + edPeriode.Text +
      ''' AND ben_payroll_details.kodekaryawan = ''' + kodeKaryawan + '''';
   //Application.CreateForm(TfrmSlipGaji, frmSlipGaji);
   qrySlip.Active := True;
   qrySlip.Close;
   qrySlip.SQL.Clear;
   qrySlip.SQL.Add(strSql);
   qrySlip.Open;
   lblOutlet.Caption := 'Outlet : ' + edOutlet.Text;
   lblPeriode.Caption := 'Periode ' + FormatDateTime('dd/mm/yy', edStart.Date) +
         ' - ' + FormatDateTime('dd/mm/yy', edEnd.Date);
   qrpSlip.Prepare;
   qrpSlip.PrinterSettings.PrinterIndex := cbPrinter.ItemIndex;
   qrpSlip.Print;
   //ShowMessage(frmSlipGaji.qrySlip.Fields[4].AsString);
end;

procedure TfrmReportPayroll.Button3Click(Sender: TObject);
var
  strSql, kodeKaryawan : String;
  recSelect : Integer;
  i: Integer;
begin
  if (cbPrinter.ItemIndex < 0) then
    begin
      ShowMessage('Mohon Pilih Printer');
      Exit;
    end;
  tvList.DataController.GotoFirst;
  cxGrid1.Enabled := False;
  //recSelect := tvList.DataController.GetFocusedRecordIndex;
  for i := 0 to tvList.DataController.RecordCount - 1 do
    begin
      recSelect := tvList.DataController.GetFocusedRecordIndex;
      if (recSelect < 0) then Exit;
      kodeKaryawan := VarToStr(tvList.DataController.GetValue(recSelect, tvListKodeKaryawan.Index));
       strSql := 'select ben_payroll_details.*, ' +
          '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan_info ' +
          'where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_details.kodekaryawan) as namakaryawan, ' +
          '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info ' +
          'where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_details.kodekaryawan) as kodedivisi, ' +
          '(select departemen.nama_departemen from departemen where departemen.id_departemen = kodedivisi) as namadivisi ' +
          'FROM ben_payroll_details WHERE ben_payroll_details.payrollperiode = ''' + edPeriode.Text +
          ''' AND ben_payroll_details.kodekaryawan = ''' + kodeKaryawan + '''';
       qrySlip.Active := True;
       qrySlip.Close;
       qrySlip.SQL.Clear;
       qrySlip.SQL.Add(strSql);
       qrySlip.Open;
       lblOutlet.Caption := 'Outlet : ' + edOutlet.Text;
       lblPeriode.Caption := 'Periode ' + FormatDateTime('dd/mm/yy', edStart.Date) +
             ' - ' + FormatDateTime('dd/mm/yy', edEnd.Date);
       qrpSlip.Prepare;
       qrpSlip.PrinterSettings.PrinterIndex := cbPrinter.ItemIndex;
       qrpSlip.Print;
       tvList.DataController.GotoNext;
    end;
  cxGrid1.Enabled := False;
end;

procedure TfrmReportPayroll.Button4Click(Sender: TObject);
begin
  dlgSave.Title := '[Text Document] Export to...';
     dlgSave.Filter := 'Text Document (*.txt)|*.txt';
     dlgSave.FileName := '';
     if (dlgSave.Execute) then
        begin
             if (dlgSave.FileName <> '') then
                begin
                     ExportGridToText(dlgSave.FileName, cxGrid1,True, True,#9,'','','txt');
                     //ExportGridToText(dlgSave.FileName, cxGrid1, true, true, true, 'txt');
                     if (MessageDlg('Would you like to open exported file now?',
                         mtConfirmation, mbOKCancel, 0) = mrOK) then
                         begin
                              if (ExtractFileExt(dlgSave.FileName) = '.txt') then
                                 ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                              else
                                  ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName + '.txt'), pChar(''), pChar(ExtractFileDir(dlgSave.FileName + '.txt')), SW_MAXIMIZE)
                         end
                     else exit;
                end
             else exit;
        end
     else exit;
end;

procedure TfrmReportPayroll.btnCetakKomisiAllClick(Sender: TObject);
var
  i, recselect : Integer;
  idkaryawan, namakaryawan, kodekaryawan, departemen, idDept : String;
begin
  if (cbPrinter.ItemIndex < 0) then
    begin
      ShowMessage('Mohon Pilih Printer');
      Exit;
    end;
  tvList.DataController.GotoFirst;
  for i := 0 to tvList.DataController.RecordCount - 1 do
    begin
      recselect := tvList.DataController.GetFocusedRecordIndex;
      idkaryawan := VarToStr(tvList.DataController.GetValue(recselect, tvListIDFinger.Index));
       kodekaryawan := VarToStr(tvList.DataController.GetValue(recselect, tvListKodeKaryawan.Index));
       namakaryawan := VarToStr(tvList.DataController.GetValue(recselect, tvListNama.Index));
       departemen := VarToStr(tvList.DataController.GetDisplayText(recselect, tvListDivisi.Index));
       idDept := VarToStr(tvList.DataController.GetValue(recselect, tvListDivisi.Index));
      if (idDept <> 'TR') AND (idDept <> 'TB') then
       begin
         tvList.DataController.GotoNext;
       end
      else
       begin
         btnCetakKomisiSatuan.Click;
         tvList.DataController.GotoNext;
       end;
    end;
end;

procedure TfrmReportPayroll.btnCetakKomisiSatuanClick(Sender: TObject);
var
  recselect : Integer;
  idkaryawan, namakaryawan, kodekaryawan, departemen, idDept : String;
begin
  if (cbPrinter.ItemIndex < 0) then
    begin
      ShowMessage('Mohon Pilih Printer');
      Exit;
    end;
  recselect := tvList.DataController.GetFocusedRecordIndex;
  if (recselect < 0) then Exit;
 idkaryawan := VarToStr(tvList.DataController.GetValue(recselect, tvListIDFinger.Index));
 kodekaryawan := VarToStr(tvList.DataController.GetValue(recselect, tvListKodeKaryawan.Index));
 namakaryawan := VarToStr(tvList.DataController.GetValue(recselect, tvListNama.Index));
 departemen := VarToStr(tvList.DataController.GetDisplayText(recselect, tvListDivisi.Index));
 idDept := VarToStr(tvList.DataController.GetValue(recselect, tvListDivisi.Index));
  qryCari.Close;
  qryCari.SQL.Clear;
  qryCari.SQL.Add('select komisi, tglkontrak from ben_hrd_kontrak_details where kodekaryawan = ''' +
      kodekaryawan + ''' ORDER BY tglhabis DESC');
  qryCari.Open;
  qryCari.First;
  //ShowMessage(FloatToStr(qryCari.Fields[0].AsFloat));
  VKOMISI := qryCari.Fields[0].AsFloat;

 if (idDept <> 'TR') AND (idDept <> 'TB') then
   begin
     ShowMessage(idDept);
     ShowMessage('Maaf Karyawan bukan divisi Therapist');
     Exit;
   end;
   qryKomisi.Close;
   qryKomisi.SQL.Clear;
   {qryKomisi.SQL.Add('SELECT trans_master.trans_id, trans_master.tanggal, ' +
        'trans_master.therapist_id, trans_detail.produk_jasa_nama, ' +
        'trans_detail.trans_type_id, (trans_detail.subtotal * ''' + FloatToStr(VKOMISI) + ''' / 100)' +
        'FROM trans_master RIGHT JOIN ' +
        'trans_detail ON trans_master.trans_id = trans_detail.id_trans ' +
        'WHERE trans_master.status_trans = ''' + 'PAID' + ''' ' +
        'AND trans_master.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' ' +
        ' AND trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''' ' +
        'AND trans_master.therapist_id = '''  + idkaryawan + ''' ' +
        'AND trans_detail.trans_type_id <> ''' + 'BP'  + ''' ' +
        'AND trans_detail.trans_type_id <> ''' + 'BG' + '''');}
   qryKomisi.SQL.Add('SELECT trans_master.trans_id, trans_master.tanggal, ' +
        'trans_master.therapist_id, trans_detail.produk_jasa_nama, ' +
        'trans_detail.trans_type_id, (trans_detail.subtotal * ''' + FloatToStr(VKOMISI) + ''' / 100) as subtotal ' +
        'FROM trans_master RIGHT JOIN ' +
        'trans_detail ON trans_master.trans_id = trans_detail.id_trans ' +
        'WHERE trans_master.status_trans = ''' + 'PAID' + ''' ' +
        'AND trans_master.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' ' +
        ' AND trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''' ' +
        'AND trans_master.therapist_id = '''  + idkaryawan + ''' ' +
        'AND trans_detail.trans_type_id <> ''' + 'BP'  + ''' ' +
        'AND trans_detail.trans_type_id <> ''' + 'BG' + '''');
   qryKomisi.Open;

   qryInfo.Close;
   qryInfo.SQL.Clear;
   qryInfo.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen ' +
        'FROM ben_hrd_karyawan_info WHERE idkaryawan = ''' + idkaryawan + ''' ' +
        'AND active = ''' + 'Y' + '''');
   qryInfo.Open;

   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select komisi from ben_payroll_details where ' +
      'payrollperiode = ''' + edPeriode.Text + ''' ' +
      'AND kodekaryawan = ''' + kodekaryawan + '''');
   qrySearch.Open;
   lblTotalKomisi.Caption := FormatFloat('#,#', qrySearch.Fields[0].AsFloat);
   lblOutletKomisi.Caption := 'Outlet : ' + edOutlet.Text;
   lblPeriodeKomisi.Caption := 'Periode ' + FormatDateTime('dd/mm/yy', edStart.Date) +
     ' - ' + FormatDateTime('dd/mm/yy', edEnd.Date);
   qrpKomisi.Prepare;
   qrpKomisi.PrinterSettings.PrinterIndex := cbPrinter.ItemIndex;
   FTotalPages := qrpKomisi.QRPRinter.PageCount;
   qrpKomisi.Print;
end;

procedure TfrmReportPayroll.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCari.Free;
  qrySearch.Free;
  qryFind.Free;
  Action := caFree;
end;

procedure TfrmReportPayroll.FormCreate(Sender: TObject);
var
  i : Integer;
begin
   lblSyncProgress.Caption := '';

   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;

   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from temptable');
   qrySearch.Active := true;

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.dbInternal;
   qryFind.SQL.Add('select * from temptable');
   qryFind.Active := true;

   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select payrollperiode from ben_payroll_periode ' +
      'order by tglstart DESC LIMIT 36');
   qryFind.Open;
   qryFind.First;
   for i := 0 to qryFind.RecordCount - 1 do
      begin
        edPeriode.Items.Add(qryFind.Fields[0].AsString);
        qryFind.Next;
      end;
   if (frmReportPayroll.Tag = 1) then
     begin
       ISADMIN := 'Y';
       lblJudulForm.Caption := '  PAYROLL AS ADMIN';
     end
   else if (frmReportPayroll.Tag = 2) then
     begin
       ISADMIN := 'N';
       lblJudulForm.Caption := '  PAYROLL AS SPV';
     end;
   tblDepartemen.Active := True;
   tblOutlet.Active := True;
   qrySlip.Active := True;
   qrpSlip.Visible := False;
   qrpKomisi.Visible := False;
   cbPrinter.Items := Printer.Printers;
   //qryList.Active := True;
   //gtbList.DataController.Refresh;
end;

procedure TfrmReportPayroll.lblAdjustmentPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblAlpaPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari'
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblDendaPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '-'
  else
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblGapokPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblGpLibNasPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblKomisiPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblLate1Print(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblLate2Print(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblLemburPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblNFOTPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '-'
  else
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblPotLainPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '-'
  else
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblSakitPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblSavingPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblSubtotalPrint(sender: TObject;
  var Value: string);
var
  disVal : Double;
begin
  {disVal := StrToFloat(Value) * VKOMISI / 100;
  Value := FormatFloat('#,#', disVal);}
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblTglKomisiPrint(sender: TObject;
  var Value: string);
begin
  Value := FormatDateTime('dd/mm/yy', StrToDate(Value))
end;

procedure TfrmReportPayroll.lblTHPPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '-'
  else
   Value := 'Rp. ' + FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblTunjanganPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblUmLibNasPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblUMPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '-'
  else
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.lblVBpjsPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayroll.QRDBText3Print(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
   value := value + ' Hari';
end;

procedure TfrmReportPayroll.lblHCutiPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblHFOTPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblHIMasukPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblHIPulangPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Jam '
  else
  value := FormatFloat('#.0', StrToFloat(Value)) + ' Jam';
end;

procedure TfrmReportPayroll.lblHITidakAbsenPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblHITidakMasukPrint(sender: TObject;
  var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
   value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblHLibNasPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblHMasukKerjaPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
   value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblHUnderPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
   value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayroll.lblJamLemburPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Jam '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Jam';
end;

end.
