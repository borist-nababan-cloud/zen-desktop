unit FTHRPerhitungan;

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
  cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, StdCtrls, DBAccess, DB,
  Menus, cxButtons, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxClasses, cxGridLevel, cxGrid,
  ShellApi, cxGridExportLink, DateUtils, cxCalc, cxCalendar, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MyAccess, MemDS;

const
  InputBoxNumberMessage = WM_USER + 666;// a custom message

type
  TfrmTHRPerhitungan = class(TForm)
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    qryKode: TMyQuery;
    dsQryKode: TDataSource;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    lblJudulForm: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    edKode: TcxLookupComboBox;
    btnLoad: TcxButton;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvList: TcxGridBandedTableView;
    gtvListKodeTHR: TcxGridBandedColumn;
    gtvListKodeKaryawan: TcxGridBandedColumn;
    gtvListIDFinger: TcxGridBandedColumn;
    gtvListDepartemen: TcxGridBandedColumn;
    gtvListKontrak: TcxGridBandedColumn;
    gtvListTglMasuk: TcxGridBandedColumn;
    gtvListLama: TcxGridBandedColumn;
    gtvListIsAdmin: TcxGridBandedColumn;
    gtvListGapok: TcxGridBandedColumn;
    gtvListNilai: TcxGridBandedColumn;
    gtvListTambahan: TcxGridBandedColumn;
    gtvListPayment: TcxGridBandedColumn;
    gtvListKet: TcxGridBandedColumn;
    gtvListUser: TcxGridBandedColumn;
    gtvListDate: TcxGridBandedColumn;
    gtvListNama: TcxGridBandedColumn;
    btnAddTambahan: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    dlgSave: TSaveDialog;
    tblKontrak: TMyTable;
    dsTblKontrak: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLoadClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btnAddTambahanClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    qryHitung1, qryHitung2, qryHitung3, qryHitung4, qryExec : TMyQuery;
    procedure CariGaji(NIK : String; FocRec : Integer);
    procedure HitungTHR(NIK : String; FocRec : Integer; idDiv : String; nKerj : Integer);
    procedure InputBoxSetOnlyNumbers(var Msg: TMessage);
  public
    { Public declarations }
    ISADMIN  : String;
    TGLCUTOFF : TDate;
  end;

var
  frmTHRPerhitungan: TfrmTHRPerhitungan;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmTHRPerhitungan.InputBoxSetOnlyNumbers(var Msg: TMessage);
var
  hActiveForm : HWND;
  hEdit       : HWND;
  dwLong      : Longint;
begin
   hActiveForm := Screen.ActiveForm.Handle;
  if (hActiveForm <> 0) then
  begin
    hEdit := FindWindowEx(hActiveForm, 0, 'TEdit', nil);//determine the handle of the TEdit
    dwLong := GetWindowLong(hEdit, GWL_STYLE);//get the current style of the control
    SetWindowLong(hEdit, GWL_STYLE, dwLong or ES_NUMBER)//set the new style
  end;
end;

procedure TfrmTHRPerhitungan.HitungTHR(NIK: string; FocRec: Integer; idDiv: string; nKerj: Integer);
var
   nGapok, nTHR : Double;
begin
   if (nKerj >= 12) then
     begin
       nGapok := gtvList.DataController.GetValue(FocRec, gtvListGapok.Index);
       gtvList.DataController.SetValue(FocRec, gtvListTambahan.Index, 0);
       gtvList.DataController.SetValue(FocRec, gtvListNilai.Index, nGapok);
       gtvList.DataController.SetValue(FocRec, gtvListPayment.Index, nGapok);
       gtvList.DataController.PostEditingData;
       gtvList.DataController.Post(True);
     end
   else if (nKerj < 12) then
     begin
       qryHitung3.Close;
       qryHitung3.SQL.Clear;
       qryHitung3.SQL.Add('select nilai from ben_thr_parameter where ' +
           'kodethr = ''' + edKode.Text + ''' AND ' +
           'departemen = ''' + idDiv + ''' AND ' +
           'lamakerja = ''' + IntToStr(nKerj) + ''' AND ' +
           'aktif = ''' + 'Y' + '''');
       qryHitung3.Open;
       if (qryHitung3.IsEmpty) then
         begin
           nGapok := gtvList.DataController.GetValue(FocRec, gtvListGapok.Index);
           nTHR := (nGapok / 12) * nKerj;
           gtvList.DataController.SetValue(FocRec, gtvListTambahan.Index, 0);
           gtvList.DataController.SetValue(FocRec, gtvListNilai.Index, nTHR);
           gtvList.DataController.SetValue(FocRec, gtvListPayment.Index, nTHR);
           gtvList.DataController.PostEditingData;
           gtvList.DataController.Post(True);
         end
       else if (NOT qryHitung3.IsEmpty) then
         begin
           nTHR := qryHitung3.Fields[0].AsFloat;
           gtvList.DataController.SetValue(FocRec, gtvListTambahan.Index, 0);
           gtvList.DataController.SetValue(FocRec, gtvListNilai.Index, nTHR);
           gtvList.DataController.SetValue(FocRec, gtvListPayment.Index, nTHR);
           gtvList.DataController.PostEditingData;
           gtvList.DataController.Post(True);
         end;
     end;
end;

procedure TfrmTHRPerhitungan.CariGaji(NIK: string; FocRec : Integer);
var
   nThp, vTHR, vTunj : Double;
   kodeKontrak : String;
   typepayroll : Integer;
begin
  qryHitung3.Close;
  qryHitung3.SQL.Clear;
  qryHitung3.SQL.Add('select gapok, kodekontrak, typepayroll, tunjangan1 ' +
        'from ben_hrd_kontrak_details where kodekaryawan = ''' + NIK +
        ''' ORDER BY tglhabis DESC');
  qryHitung3.Open;
  qryHitung3.First;
  kodeKontrak := qryHitung3.Fields[1].AsString;
  vTunj := qryHitung3.Fields[3].AsFloat;
  typepayroll := qryHitung3.Fields[2].AsInteger;
  qryHitung4.Close;
  qryHitung4.SQL.Clear;
  qryHitung4.SQL.Add('select harian from ben_payroll_type where autonum = ''' +
      IntToStr(typepayroll) + '''');
  qryHitung4.Open;
  if (qryHitung4.Fields[0].AsString = 'Y') then
     begin
       nThp := (qryHitung3.Fields[0].AsFloat * 26) + vTunj;
     end
  else if (qryHitung4.Fields[0].AsString = 'N') then
     begin
       nThp := qryHitung3.Fields[0].AsFloat + vTunj;
     end;
  gtvList.DataController.SetValue(FocRec, gtvListKontrak.Index, qryHitung3.Fields[1].AsString);
  gtvList.DataController.SetValue(FocRec, gtvListGapok.Index, nThp);
  gtvList.DataController.PostEditingData;
  gtvList.DataController.Post(True);
end;

procedure TfrmTHRPerhitungan.btnAddTambahanClick(Sender: TObject);
var
  recSel : Integer;
  nThr, nTambahan, nPayment : Double;
  s : String;
  MyClass: TObject;
begin
  recSel := gtvList.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  nThr := gtvList.DataController.GetValue(recSel, gtvListNilai.Index);
  PostMessage(Handle, InputBoxNumberMessage, 0, 0);
  s := InputBox('Input', 'Enter a number only', '');
  try
     nTambahan := StrToFloat(s);
  Except
    ShowMessage('Invalid Value Inserted');
    Exit;
  end;
  nPayment := nThr + nTambahan;
  gtvList.DataController.SetValue(recSel, gtvListTambahan.Index, nTambahan);
  gtvList.DataController.SetValue(recSel, gtvListPayment.Index, nPayment);
  gtvList.DataController.PostEditingData;
  gtvList.DataController.Post(True);
end;

procedure TfrmTHRPerhitungan.btnLoadClick(Sender: TObject);
var
   recCount, i, recSel, newRec, lamaKerja : Integer;
   tglMasuk : TDate;
begin
  if (edKode.Text = '') then Exit;
  recCount := gtvList.DataController.RecordCount;
   if (recCount > 0) then
     begin
       if (MessageDlg('Data User Exist, ' + #13 +
              'Would You Like to Update Data ?', mtConfirmation, mbOKCancel,0) = mrCancel) then
           begin
              Exit;
           end;
     end;
   Screen.Cursor := crHourGlass;
   qryHitung2.Close;
   qryHitung2.SQL.Clear;
   qryHitung2.SQL.Add('select tanggal from ben_thr_periode where kodethr = ''' +
       edKode.Text + ''' AND aktif = ''' + 'Y' + '''');
   qryHitung2.Open;
   TGLCUTOFF := qryHitung2.Fields[0].AsDateTime;
   gtvList.DataController.SelectAll;
   gtvList.DataController.DeleteSelection;
   qryHitung1.Close;
   qryHitung1.SQL.Clear;
   qryHitung1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, ' +
       'kodekontrak, tglmasukkerja, isadmin from ben_hrd_karyawan_info where ' +
       'isadmin = ''' + ISADMIN + ''' and active = ''' + 'Y' + '''');
   qryHitung1.Open;
   qryHitung1.First;
   cxGrid1.Enabled := False;
   for i := 0 to qryHitung1.RecordCount - 1 do
     begin
       Screen.Cursor := crHourGlass;
       newRec := gtvList.DataController.InsertRecord(gtvList.DataController.RecordCount);
       gtvList.DataController.SetValue(newRec, gtvListKodeTHR.Index, edKode.Text);
       gtvList.DataController.SetValue(newRec, gtvListKodeKaryawan.Index, qryHitung1.Fields[0].AsString);
       gtvList.DataController.SetValue(newRec, gtvListIDFinger.Index, qryHitung1.Fields[1].AsString);
       gtvList.DataController.SetValue(newRec, gtvListNama.Index, qryHitung1.Fields[2].AsString);
       gtvList.DataController.SetValue(newRec, gtvListDepartemen.Index, qryHitung1.Fields[3].AsString);
       gtvList.DataController.SetValue(newRec, gtvListKontrak.Index, qryHitung1.Fields[4].AsString);
       gtvList.DataController.SetValue(newRec, gtvListTglMasuk.Index, qryHitung1.Fields[5].AsDateTime);
       gtvList.DataController.SetValue(newRec, gtvListIsAdmin.Index, qryHitung1.Fields[6].AsString);
       gtvList.DataController.SetValue(newRec, gtvListUser.Index, frmMain.USERAPPS);
       tglMasuk :=qryHitung1.Fields[5].AsDateTime;
       lamaKerja := MonthsBetween(tglMasuk, TGLCUTOFF);
       gtvList.DataController.SetValue(newRec, gtvListLama.Index, lamaKerja);
       CariGaji(qryHitung1.Fields[0].AsString, newRec);
       HitungTHR(qryHitung1.Fields[0].AsString, newRec, qryHitung1.Fields[3].AsString, lamaKerja);
       gtvList.DataController.PostEditingData;
       gtvList.DataController.Post(True);
       Screen.Cursor := crDefault;
       Application.ProcessMessages;
       qryHitung1.Next;
     end;
   cxGrid1.Enabled := True;
   ShowMessage('Load Data Finish');
end;

procedure TfrmTHRPerhitungan.cxButton2Click(Sender: TObject);
var
  i, recSel, autonum : Integer;
  kodeKaryawan : String;
begin
   gtvList.DataController.GotoFirst;
   cxGrid1.Enabled := False;
   qryExec.SQL.Clear;
   for i := 0 to gtvList.DataController.RecordCount - 1 do
      begin
        recSel := gtvList.DataController.GetFocusedRecordIndex;
        kodeKaryawan := VarToStr(gtvList.DataController.GetValue(recSel, gtvListKodeKaryawan.Index));
        qryHitung1.Close;
        qryHitung1.SQL.Clear;
        qryHitung1.SQL.Add('select autonum from ben_thr_value where ' +
            'kodethr = ''' + edKode.Text + ''' ' +
            'AND kodekaryawan = ''' + kodeKaryawan + '''');
        qryHitung1.Open;
        autonum := qryHitung1.Fields[0].AsInteger;
        if (NOT qryHitung1.IsEmpty) then
          begin
            qryExec.SQL.Add('update ben_thr_value set ' +
                 'idkaryawan = ''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListIDFinger.Index)) + ''',' +
                 'namakaryawan = ''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListNama.Index)) + ''',' +
                 'idoutlet = ''' + frmMain.APP_OUTLETID + ''',' +
                 'departemen = ''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListDepartemen.Index)) + ''',' +
                 'kodekontrak = ''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListKontrak.Index)) + ''',' +
                 'tglmasukkerja = ''' + FormatDateTime('yyyy-MM-dd', VarToDateTime(gtvList.DataController.GetValue(recSel, gtvListTglMasuk.Index))) + ''',' +
                 'gapok = ''' + FloatToStr(gtvList.DataController.GetValue(recSel, gtvListGapok.Index)) + ''',' +
                 'lamakerja = ''' + FloatToStr(gtvList.DataController.GetValue(recSel, gtvListLama.Index)) + ''',' +
                 'isadmin = ''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListIsAdmin.Index)) + ''',' +
                 'value = ''' + FloatToStr(gtvList.DataController.GetValue(recSel, gtvListNilai.Index)) + ''',' +
                 'tambahan = ''' + FloatToStr(gtvList.DataController.GetValue(recSel, gtvListTambahan.Index)) + ''',' +
                 'payment = ''' + FloatToStr(gtvList.DataController.GetValue(recSel, gtvListPayment.Index)) + ''',' +
                 'keterangan = ''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListKet.Index)) + ''',' +
                 'lastedituser = ''' + frmMain.USERAPPS + ''',' +
                 'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
                 'where kodethr = ''' + edKode.Text + ''' ' +
                 'AND kodekaryawan = ''' + kodeKaryawan + ''';');
          end
        else if (qryHitung1.IsEmpty) then
          begin
             qryExec.SQL.Add('insert into ben_thr_value values(' +
                 '''' + '' + ''',' +
                 '''' + edKode.Text + ''',' +
                 '''' + kodeKaryawan + ''',' +
                 '''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListIDFinger.Index)) + ''',' +
                 '''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListNama.Index)) + ''',' +
                 '''' + frmMain.APP_OUTLETID + ''',' +
                 '''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListDepartemen.Index)) + ''',' +
                 '''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListKontrak.Index)) + ''',' +
                 '''' + FormatDateTime('yyyy-MM-dd', VarToDateTime(gtvList.DataController.GetValue(recSel, gtvListTglMasuk.Index))) + ''',' +
                 '''' + FloatToStr(gtvList.DataController.GetValue(recSel, gtvListGapok.Index)) + ''',' +
                 '''' + FloatToStr(gtvList.DataController.GetValue(recSel, gtvListLama.Index)) + ''',' +
                 '''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListIsAdmin.Index)) + ''',' +
                 '''' + FloatToStr(gtvList.DataController.GetValue(recSel, gtvListNilai.Index)) + ''',' +
                 '''' + FloatToStr(gtvList.DataController.GetValue(recSel, gtvListTambahan.Index)) + ''',' +
                 '''' + FloatToStr(gtvList.DataController.GetValue(recSel, gtvListPayment.Index)) + ''',' +
                 '''' + vartostr(gtvList.DataController.GetValue(recSel, gtvListKet.Index)) + ''',' +
                 '''' + frmMain.USERAPPS + ''',' +
                 '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
          end;
        gtvList.DataController.GotoNext;
        Application.ProcessMessages;
      end;
   qryExec.ExecSQL;
   ShowMessage('Insert Data Finish !');
   cxGrid1.Enabled := True;
end;

procedure TfrmTHRPerhitungan.cxButton3Click(Sender: TObject);
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

procedure TfrmTHRPerhitungan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryHitung1.Free;
  qryHitung2.Free;
  qryHitung3.Free;
  qryHitung4.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmTHRPerhitungan.FormCreate(Sender: TObject);
begin
  qryHitung1 := TMyQuery.Create(Self);
  qryHitung1.Connection := DMDB.dbInternal;
  qryHitung1.SQL.Add('select * from temptable');
  qryHitung1.Active := true;

  qryHitung2 := TMyQuery.Create(Self);
  qryHitung2.Connection := DMDB.dbInternal;
  qryHitung2.SQL.Add('select * from temptable');
  qryHitung2.Active := true;

  qryHitung3 := TMyQuery.Create(Self);
  qryHitung3.Connection := DMDB.dbInternal;
  qryHitung3.SQL.Add('select * from temptable');
  qryHitung3.Active := true;

  qryHitung4 := TMyQuery.Create(Self);
  qryHitung4.Connection := DMDB.dbInternal;
  qryHitung4.SQL.Add('select * from temptable');
  qryHitung4.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  {qryHitung2.Close;
  qryHitung2.SQL.Clear;
  qryHitung2.SQL.Add('SELECT * FROM information_schema.tables ' +
    'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_thr_value'));
  qryHitung2.Open;
  if (qryHitung2.IsEmpty) then
  begin
    qryExec.SQL.Clear;
    qryExec.SQL.Add(memStruktur.Text);
    qryExec.ExecSQL;
  end;}

  tblDepartemen.Active := True;
  qryKode.Active := True;
  tblKontrak.Active := True;
end;

end.
