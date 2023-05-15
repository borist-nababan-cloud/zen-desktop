unit FPayrollOther;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, cxTextEdit,
  DB, cxDBLookupComboBox, cxCalc, DateUtils, cxContainer, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ShellApi, cxGridExportLink, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  Vcl.ComCtrls, dxCore, cxDateUtils, MemDS, MyAccess;

type
  TfrmPayrollOther = class(TForm)
    Label1: TLabel;
    edPeriode: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edKeterangan: TEdit;
    Label5: TLabel;
    gtvOther: TcxGridTableView;
    gtvOtherNIK: TcxGridColumn;
    gtvOtherIDFinger: TcxGridColumn;
    gtvOtherNama: TcxGridColumn;
    gtvOtherDivisi: TcxGridColumn;
    edBulan: TEdit;
    edTahun: TEdit;
    btnLoad: TButton;
    memoStruktur: TMemo;
    Button2: TButton;
    gtvOtherLama: TcxGridColumn;
    gtvOtherVGapok: TcxGridColumn;
    gtvOtherVTunjangan: TcxGridColumn;
    gtvOtherNilai: TcxGridColumn;
    gtvOtherTambahan: TcxGridColumn;
    gtvOtherTotal: TcxGridColumn;
    gtvOtherNotes: TcxGridColumn;
    tblDivisi: TMyTable;
    dsTblDivisi: TDataSource;
    edTglperiode: TcxDateEdit;
    Label6: TLabel;
    btnSimpan: TButton;
    btnExport: TButton;
    dlgSave: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure gtvOtherTotalPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure gtvOtherEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure edPeriodeChange(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
    typePayroll, kodeKaryawan : String;
    newRec, lama : Integer;
    qryOther1, qryOther2, qryOther3: TMyQuery;
    procedure CariKaryawanAdmin;
    procedure CariKaryawanSPV;
    procedure CariGaji;
  public
    { Public declarations }
    ISADMIN: Boolean;
    procedure LoadPeriode;
  end;

var
  frmPayrollOther: TfrmPayrollOther;

implementation

{$R *.dfm}

uses FDMDB, FPayrollOtherNew, FMenuMain;

procedure TfrmPayrollOther.CariGaji;
var
  i: Integer;
  nGP, nTunj, subtotal, tambahan, total, nresult: Double;
begin
  qryOther3.Close;
  qryOther3.SQL.Clear;
  qryOther3.SQL.Add('select gapok, tunjangan1, tglhabis ' +
      'from ben_hrd_kontrak_details where kodekaryawan = ''' +
  qryOther2.Fields[0].AsString + ''' ORDER BY tglhabis DESC');
  qryOther3.Open;
  qryOther3.First;
  if (typePayroll = 'Y') then
    begin
      nGP := qryOther3.Fields[0].AsFloat * 26;
    end
  else if (typePayroll <> 'Y') then
    begin
      nGP := qryOther3.Fields[0].AsFloat;
    end;
  nTunj := qryOther3.Fields[1].AsFloat;
  gtvOther.DataController.SetValue(newRec, gtvOtherVGapok.Index,qryOther3.Fields[0].AsFloat);
  gtvOther.DataController.SetValue(newRec, gtvOtherVTunjangan.Index,qryOther3.Fields[1].AsFloat);
  subtotal := nGP + nTunj;
  tambahan := 0;
  gtvOther.DataController.SetValue(newRec, gtvOtherTambahan.Index, 0);

  if (lama < 12) then
    begin
      total := (lama / 12 * subtotal) + tambahan;
    end
  else if (lama >= 12) then
    begin
      total := subtotal + tambahan;
    end;
  gtvOther.DataController.SetValue(newRec, gtvOtherTotal.Index, total);
  gtvOther.DataController.SetValue(newRec, gtvOtherNilai.Index, total);
  gtvOther.DataController.PostEditingData;
  gtvOther.DataController.Post(True);
  Application.ProcessMessages;
end;

procedure TfrmPayrollOther.LoadPeriode;
begin

end;

procedure TfrmPayrollOther.CariKaryawanAdmin;
var
  i: Integer;
  nGP, nTunj, subtotal, tambahan, total, nresult: Double;
begin
  qryOther2.Close;
  qryOther2.SQL.Clear;
  qryOther2.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, tglmasukkerja, ' +
      '(select ben_payroll_type.harian from ben_payroll_type where ' +
      'ben_payroll_type.typepayroll = ben_hrd_karyawan_info.departemen) as typepayroll ' +
      'from ben_hrd_karyawan_info where isadmin = ''' + 'Y' + ''' ' + 'AND active = ''' + 'Y' + '''');
  qryOther2.Open;
  qryOther2.First;
  for i := 0 to qryOther2.RecordCount - 1 do
    begin
      lama := 0;
      subtotal := 0;
      total := 0;
      nGP := 0;
      nTunj := 0;
      tambahan := 0;
      nresult := 0;
      lama := MonthsBetween(qryOther2.Fields[4].AsDateTime,edTglperiode.Date);
      typePayroll := qryOther2.Fields[5].AsString;
      kodeKaryawan := qryOther2.Fields[0].AsString;
      newRec := gtvOther.DataController.InsertRecord(gtvOther.DataController.RecordCount);
      gtvOther.DataController.SetValue(newRec, gtvOtherNIK.Index, kodeKaryawan);
      gtvOther.DataController.SetValue(newRec, gtvOtherIDFinger.Index,qryOther2.Fields[1].AsString);
      gtvOther.DataController.SetValue(newRec, gtvOtherNama.Index,qryOther2.Fields[2].AsString);
      gtvOther.DataController.SetValue(newRec, gtvOtherDivisi.Index,qryOther2.Fields[3].AsString);
      gtvOther.DataController.SetValue(newRec, gtvOtherLama.Index, lama);
      CariGaji;
      qryOther2.Next;
      Application.ProcessMessages;
    end;
end;

procedure TfrmPayrollOther.CariKaryawanSPV;
var
  i: Integer;
  nGP, nTunj, subtotal, tambahan, total, nresult: Double;
begin
  qryOther2.Close;
  qryOther2.SQL.Clear;
  qryOther2.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, tglmasukkerja, ' +
      '(select ben_payroll_type.harian from ben_payroll_type where ' +
      'ben_payroll_type.typepayroll = ben_hrd_karyawan_info.departemen) as typepayroll ' +
      'from ben_hrd_karyawan_info where active = ''' + 'Y' + '''');
  qryOther2.Open;
  qryOther2.First;
  for i := 0 to qryOther2.RecordCount - 1 do
    begin
      lama := 0;
      subtotal := 0;
      total := 0;
      nGP := 0;
      nTunj := 0;
      tambahan := 0;
      nresult := 0;
      lama := MonthsBetween(qryOther2.Fields[4].AsDateTime,edTglperiode.Date);
      typePayroll := qryOther2.Fields[5].AsString;
      kodeKaryawan := qryOther2.Fields[0].AsString;
      newRec := gtvOther.DataController.InsertRecord(gtvOther.DataController.RecordCount);
      gtvOther.DataController.SetValue(newRec, gtvOtherNIK.Index, kodeKaryawan);
      gtvOther.DataController.SetValue(newRec, gtvOtherIDFinger.Index,qryOther2.Fields[1].AsString);
      gtvOther.DataController.SetValue(newRec, gtvOtherNama.Index,qryOther2.Fields[2].AsString);
      gtvOther.DataController.SetValue(newRec, gtvOtherDivisi.Index,qryOther2.Fields[3].AsString);
      gtvOther.DataController.SetValue(newRec, gtvOtherLama.Index, lama);
      CariGaji;
      qryOther2.Next;
      Application.ProcessMessages;
    end;
end;

procedure TfrmPayrollOther.btnExportClick(Sender: TObject);
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

procedure TfrmPayrollOther.btnLoadClick(Sender: TObject);
var
  i, lama, recSel: Integer;
  nGP, nTunj, subtotal, tambahan, total, nresult: Double;
  ketemu : Boolean;
begin
  if (edPeriode.Text = '') then
    Exit;
  qryOther1.Close;
  qryOther1.SQL.Clear;
  qryOther1.SQL.Add('select kodepayroll, bulan, tahun, tglperiode, tglend, ' +
      'kodekaryawan, idkaryawan, departemen, masakerja, vgapok, vtunjangan, ' +
      'nilai, tambahan, total, ketpayroll, keterangan ' +
      'from ben_payroll_other where kodepayroll = ''' + edPeriode.Text + ''' ' +
      'ORDER BY kodekaryawan ASC ');
  qryOther1.Open;
  if (qryOther1.IsEmpty) then
  begin
    gtvOther.DataController.SelectAll;
    gtvOther.DataController.DeleteSelection;
    if (ISADMIN = True) then
      begin
        CariKaryawanAdmin;
      end
    else if (ISADMIN = False) then
      begin
        CariKaryawanSPV;
      end;
    Application.ProcessMessages;
  end
  else if (NOT qryOther1.IsEmpty) then
    begin
      if (ISADMIN = False) then
        begin
          CariKaryawanSPV;
        end
      else if (ISADMIN = True) then
        begin
         CariKaryawanAdmin;
        end;
      for i := 0 to qryOther1.RecordCount - 1 do
        begin
          gtvOther.DataController.GotoFirst;
          kodeKaryawan := qryOther1.Fields[5].AsString;
          ketemu := False;
          ketemu := gtvOther.DataController.Search.Locate(gtvOtherNIK.Index, kodeKaryawan);
          if (ketemu = True) then
            begin
              recSel := gtvOther.DataController.GetFocusedRecordIndex;
              gtvOther.DataController.SetValue(recSel, gtvOtherLama.Index, qryOther1.Fields[8].AsFloat);
              gtvOther.DataController.SetValue(recSel, gtvOtherVGapok.Index, qryOther1.Fields[9].AsFloat);
              gtvOther.DataController.SetValue(recSel, gtvOtherVTunjangan.Index, qryOther1.Fields[10].AsFloat);
              gtvOther.DataController.SetValue(recSel, gtvOtherNilai.Index, qryOther1.Fields[11].AsFloat);
              gtvOther.DataController.SetValue(recSel, gtvOtherTambahan.Index, qryOther1.Fields[12].AsFloat);
              gtvOther.DataController.SetValue(recSel, gtvOtherTotal.Index, qryOther1.Fields[13].AsFloat);
              gtvOther.DataController.SetValue(recSel, gtvOtherNotes.Index, qryOther1.Fields[14].AsString);
              gtvOther.DataController.PostEditingData;
              gtvOther.DataController.Post(True);
            end;
          qryOther1.Next;
          Application.ProcessMessages;
        end;
      edBulan.Text := qryOther1.Fields[1].AsString;
      edTahun.Text := qryOther1.Fields[2].AsString;
      edTglperiode.Date := qryOther1.Fields[3].AsDateTime;
      edKeterangan.Text := qryOther1.Fields[15].AsString
    end;
  gtvOther.DataController.GotoFirst;
end;

procedure TfrmPayrollOther.btnSimpanClick(Sender: TObject);
var
  recSelect, i: Integer;
  nilai, tambahan, total: Double;
  NIK, idKaryawan: String;
begin
  gtvOther.DataController.PostEditingData;
  gtvOther.DataController.Post;
  gtvOther.DataController.GotoFirst;
  DMDB.qryExec.SQL.Clear;
  for i := 0 to gtvOther.DataController.RecordCount - 1 do
  begin
    recSelect := gtvOther.DataController.GetFocusedRecordIndex;
    nilai := gtvOther.DataController.GetValue(recSelect, gtvOtherNilai.Index);
    tambahan := gtvOther.DataController.GetValue(recSelect,
      gtvOtherTambahan.Index);
    total := nilai + tambahan;
    gtvOther.DataController.SetValue(recSelect, gtvOtherTotal.Index, total);
    NIK := vartostr(gtvOther.DataController.GetValue(recSelect,
        gtvOtherNIK.Index));
    qryOther1.Close;
    qryOther1.SQL.Clear;
    qryOther1.SQL.Add('select autonum from ben_payroll_other where ' +
        'kodepayroll = ''' + edPeriode.Text + ''' ' + 'And kodekaryawan = ''' +
        NIK + '''');
    qryOther1.Open;
    if (NOT qryOther1.IsEmpty) then
    begin
      DMDB.qryExec.SQL.Add('update ben_payroll_other set ' +
          'idoutlet = ''' + frmMenuMain.IDOUTLET + ''',' +
          'bulan = ''' + edBulan.Text + ''',' +
          'tahun = ''' + edTahun.Text + ''',' +
          'tglperiode = ''' + FormatDateTime('yyyy-MM-dd', edTglperiode.Date) + ''',' +
          'tglend = ''' + FormatDateTime('yyyy-MM-dd', edTglperiode.Date) + ''',' +
          'keterangan = ' + QuotedStr(edKeterangan.Text) + ',' +
          'idkaryawan = ''' + vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherIDFinger.Index)) + ''',' +
          'departemen = ''' + vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherDivisi.Index)) + ''',' +
          'masakerja = ''' + vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherLama.Index)) + ''',' +
          'vgapok = ''' + vartostr(gtvOther.DataController.GetValue(recSelect,gtvOtherVGapok.Index)) + ''',' +
          'vtunjangan = ''' + vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherVTunjangan.Index)) + ''',' +
          'nilai = ''' + vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherNilai.Index))+ ''',' +
          'tambahan = ''' + FloatToStr(tambahan) + ''',' +
          'total = ''' + FloatToStr(total) + ''',' +
          'ketpayroll = ' + QuotedStr(vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherNotes.Index))) + ',' +
          'lastedituser = ' + QuotedStr(frmMenuMain.USERAPP) + ',' +
          'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
          'where kodepayroll = ''' + edPeriode.Text + ''' ' +
          'AND kodekaryawan = ''' + vartostr(gtvOther.DataController.GetValue (recSelect, gtvOtherNIK.Index)) + ''';');

    end
    else if (qryOther1.IsEmpty) then
    begin
      DMDB.qryExec.SQL.Add('insert into ben_payroll_other values(' +
          '''' + '' + ''',' +
          '''' + edPeriode.Text + ''',' +
          '''' + frmMenuMain.IDOUTLET + ''',' +
          '''' + edBulan.Text + ''',' +
          '''' + edTahun.Text + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd', edTglperiode.Date) + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd', edTglperiode.Date) + ''',' +
          QuotedStr(edKeterangan.Text) + ',' +
          '''' + vartostr(gtvOther.DataController.GetValue (recSelect, gtvOtherNIK.Index)) + ''',' +
          '''' + vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherIDFinger.Index)) + ''',' +
          '''' + vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherDivisi.Index)) + ''',' +
          '''' + vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherLama.Index)) + ''',' +
          '''' + vartostr(gtvOther.DataController.GetValue(recSelect,gtvOtherVGapok.Index)) + ''',' +
          '''' + vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherVTunjangan.Index)) + ''',' +
          '''' + vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherNilai.Index))+ ''',' +
          '''' + FloatToStr(tambahan) + ''',' +
          '''' + FloatToStr(total) + ''',' +
          QuotedStr(vartostr(gtvOther.DataController.GetValue(recSelect, gtvOtherNotes.Index))) + ',' +
          QuotedStr(frmMenuMain.USERAPP) + ',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
    end;
    gtvOther.DataController.GotoNext;
  end;
  DMDB.qryExec.ExecSQL;
  ShowMessage('Save Data Finish');

end;

procedure TfrmPayrollOther.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPayrollOtherNew, frmPayrollOtherNew);
  frmPayrollOtherNew.Show;
end;

procedure TfrmPayrollOther.edPeriodeChange(Sender: TObject);
begin
  btnLoad.Click;
end;

procedure TfrmPayrollOther.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryOther1.Free;
  qryOther2.Free;
  qryOther3.Free;
  Action := caFree;
end;

procedure TfrmPayrollOther.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  qryOther1 := TMyQuery.Create(Self);
  qryOther1.Connection := DMDB.StoreDB;
  qryOther1.SQL.Add('select * from temptable');
  qryOther1.Active := True;

  qryOther2 := TMyQuery.Create(Self);
  qryOther2.Connection := DMDB.StoreDB;
  qryOther2.SQL.Add('select * from temptable');
  qryOther2.Active := True;

  qryOther3 := TMyQuery.Create(Self);
  qryOther3.Connection := DMDB.StoreDB;
  qryOther3.SQL.Add('select * from temptable');
  qryOther3.Active := True;

  tblDivisi.Active := True;

  qryOther2.Close;
  qryOther2.SQL.Clear;
  qryOther2.SQL.Add('select count(*) from information_schema.tables ' +
      'where table_schema = ''' + frmMenuMain.DBNAME + ''' ' +
      'and table_name = ''' + 'ben_payroll_other' + '''');
  qryOther2.Open;
  if (qryOther2.IsEmpty) then
  begin
    DMDB.qryExec.SQL.Clear;
    DMDB.qryExec.SQL.Add(memoStruktur.Text);
    DMDB.qryExec.ExecSQL;
  end;
  edPeriode.SelectAll;
  edPeriode.DeleteSelected;
  qryOther1.Close;
  qryOther1.SQL.Clear;
  qryOther1.SQL.Add('select kodepayroll, tglperiode from ben_payroll_other ' +
      'GROUP BY kodepayroll ORDER BY tglperiode  DESC LIMIT 6');
  qryOther1.Open;
  qryOther1.First;
  for i := 0 to qryOther1.RecordCount - 1 do
  begin
    edPeriode.Items.Add(qryOther1.Fields[0].AsString);
    qryOther1.Next;
  end;
  edTglperiode.Date := Date;
end;

procedure TfrmPayrollOther.gtvOtherEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
var
  recSelect: Integer;
  nilai, tambahan, total: Double;
begin
  recSelect := gtvOther.DataController.GetFocusedRecordIndex;
  nilai := gtvOther.DataController.GetValue(recSelect, gtvOtherNilai.Index);
  tambahan := gtvOther.DataController.GetValue(recSelect, gtvOtherTambahan.Index);
  total := nilai + tambahan;
  gtvOther.DataController.SetValue(recSelect, gtvOtherTotal.Index, total);
  gtvOther.DataController.PostEditingData;
  gtvOther.DataController.Post(True);
end;

procedure TfrmPayrollOther.gtvOtherTotalPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  gtvOtherTotal.EditValue := gtvOtherNilai.EditValue +
    gtvOtherTambahan.EditValue;
end;

end.
