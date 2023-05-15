unit FReportOtherPayroll;

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
  MemDS;

type
  TfrmReportOtherPayroll = class(TForm)
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
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    Button2: TButton;
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
    qrySlip: TMyQuery;
    dsQrySlip: TDataSource;
    cbPrinter: TComboBox;
    btnExport: TButton;
    Button4: TButton;
    dlgSave: TSaveDialog;
    Button5: TButton;
    Button6: TButton;
    tvListVGapok: TcxGridBandedColumn;
    tvListVTunjangan: TcxGridBandedColumn;
    tvListNilai: TcxGridBandedColumn;
    tvListTambahan: TcxGridBandedColumn;
    tvListTHR: TcxGridBandedColumn;
    tvListLamaKerja: TcxGridBandedColumn;
    tvListTglMsk: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    qryCari, qrySearch, qryFind : TMyQuery;
    INDEXPRINTER : Integer;
  public
    { Public declarations }
    ISADMIN : String;
  end;

var
  frmReportOtherPayroll: TfrmReportOtherPayroll;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmReportOtherPayroll.btnExportClick(Sender: TObject);
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

procedure TfrmReportOtherPayroll.Button1Click(Sender: TObject);
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
         'ben_hrd_karyawan_info.namarek, ben_hrd_karyawan_info.norek, ben_hrd_karyawan_info.tglmasukkerja FROM ben_hrd_karyawan_info ' +
         'WHERE ben_hrd_karyawan_info.isadmin = ''' + 'Y' + ''' ' +
         'AND ben_hrd_karyawan_info.active = ''' + 'Y' + '''';
    end
   else if (ISADMIN = 'N') then
    begin
      strLoad := 'SELECT ben_hrd_karyawan_info.kodekaryawan, ben_hrd_karyawan_info.idkaryawan, ' +
         'ben_hrd_karyawan_info.departemen, ben_hrd_karyawan_info.namakaryawan, ben_hrd_karyawan_info.namabank, ' +
         'ben_hrd_karyawan_info.namarek, ben_hrd_karyawan_info.norek, ben_hrd_karyawan_info.tglmasukkerja FROM ben_hrd_karyawan_info ' +
         'WHERE ben_hrd_karyawan_info.active = ''' + 'Y' + '''';
    end;
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select idoutlet, tglperiode, tglend from ben_payroll_other ' +
      'where kodepayroll = ''' + edPeriode.Text + '''');
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
       tvList.DataController.SetValue(NewRec, tvListTglMsk.Index, qrySearch.Fields[7].AsDateTime);
       kodekaryawan := qrySearch.Fields[0].AsString;
       qryFind.Close;
       qryFind.SQL.Clear;
       qryFind.SQL.Add('select masakerja, vgapok, vtunjangan, nilai, tambahan, total ' +
           'from ben_payroll_other ' +
           'where kodepayroll = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
           kodekaryawan + '''');
       qryFind.Open;
       if (qryFind.IsEmpty) then
         begin
           nTHP := qryFind.Fields[0].AsFloat;
           tvList.DataController.SetValue(NewRec, tvListLamaKerja.Index, 0);
           tvList.DataController.SetValue(NewRec, tvListVGapok.Index, 0);
           tvList.DataController.SetValue(NewRec, tvListVTunjangan.Index, 0);
           tvList.DataController.SetValue(NewRec, tvListNilai.Index, 0);
           tvList.DataController.SetValue(NewRec, tvListTambahan.Index, 0);
           tvList.DataController.SetValue(NewRec, tvListTHR.Index, 0);
           tvList.DataController.PostEditingData;
           tvList.DataController.Post(True);
           Application.ProcessMessages;
         end
       else if (NOT qryFind.IsEmpty) then
         begin
         nTHP := qryFind.Fields[0].AsFloat;
         tvList.DataController.SetValue(NewRec, tvListLamaKerja.Index, qryFind.Fields[0].AsFloat);
         tvList.DataController.SetValue(NewRec, tvListVGapok.Index, qryFind.Fields[1].AsFloat);
         tvList.DataController.SetValue(NewRec, tvListVTunjangan.Index, qryFind.Fields[2].AsFloat);
         tvList.DataController.SetValue(NewRec, tvListNilai.Index, qryFind.Fields[3].AsFloat);
         tvList.DataController.SetValue(NewRec, tvListTambahan.Index, qryFind.Fields[4].AsFloat);
         tvList.DataController.SetValue(NewRec, tvListTHR.Index, qryFind.Fields[5].AsFloat);
         tvList.DataController.PostEditingData;
         tvList.DataController.Post(True);
         Application.ProcessMessages;
         end;
       nTHP := 0;
       qrySearch.Next;
     end;
   Screen.Cursor := crDefault;
end;

procedure TfrmReportOtherPayroll.Button2Click(Sender: TObject);
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
   strSql := 'select ben_payroll_other.*, ' +
      '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan_info ' +
      'where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_other.kodekaryawan) as namakaryawan, ' +
      '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info ' +
      'where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_other.kodekaryawan) as kodedivisi, ' +
      '(select departemen.nama_departemen from departemen where departemen.id_departemen = kodedivisi) as namadivisi ' +
      'FROM ben_payroll_other WHERE ben_payroll_other.payrollperiode = ''' + edPeriode.Text +
      ''' AND ben_payroll_other.kodekaryawan = ''' + kodeKaryawan + '''';
   //Application.CreateForm(TfrmSlipGaji, frmSlipGaji);
   qrySlip.Active := True;
   qrySlip.Close;
   qrySlip.SQL.Clear;
   qrySlip.SQL.Add(strSql);
   qrySlip.Open;
   //ShowMessage(frmSlipGaji.qrySlip.Fields[4].AsString);
end;

procedure TfrmReportOtherPayroll.Button3Click(Sender: TObject);
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
       strSql := 'select ben_payroll_other.*, ' +
          '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan_info ' +
          'where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_other.kodekaryawan) as namakaryawan, ' +
          '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info ' +
          'where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_other.kodekaryawan) as kodedivisi, ' +
          '(select departemen.nama_departemen from departemen where departemen.id_departemen = kodedivisi) as namadivisi ' +
          'FROM ben_payroll_other WHERE ben_payroll_other.payrollperiode = ''' + edPeriode.Text +
          ''' AND ben_payroll_other.kodekaryawan = ''' + kodeKaryawan + '''';
       qrySlip.Active := True;
       qrySlip.Close;
       qrySlip.SQL.Clear;
       qrySlip.SQL.Add(strSql);
       qrySlip.Open;

       tvList.DataController.GotoNext;
    end;
  cxGrid1.Enabled := False;
end;

procedure TfrmReportOtherPayroll.Button4Click(Sender: TObject);
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

procedure TfrmReportOtherPayroll.Button5Click(Sender: TObject);
begin
  //
end;

procedure TfrmReportOtherPayroll.Button6Click(Sender: TObject);
var
  i : Integer;
begin
  tvList.DataController.GotoFirst;
  for i := 0 to tvList.DataController.RecordCount - 1 do
    begin

    end;

end;

procedure TfrmReportOtherPayroll.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCari.Free;
  qrySearch.Free;
  qryFind.Free;
  Action := caFree;
end;

procedure TfrmReportOtherPayroll.FormCreate(Sender: TObject);
var
  i : Integer;
begin
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
   qryFind.SQL.Add('select kodepayroll from ben_payroll_other ' +
      'GROUP BY kodepayroll order by tglperiode DESC LIMIT 12');
   qryFind.Open;
   qryFind.First;
   for i := 0 to qryFind.RecordCount - 1 do
      begin
        edPeriode.Items.Add(qryFind.Fields[0].AsString);
        qryFind.Next;
      end;
   if (frmReportOtherPayroll.Tag = 1) then
     begin
       ISADMIN := 'Y';
       lblJudulForm.Caption := '  PAYROLL OTHER AS ADMIN';
     end
   else if (frmReportOtherPayroll.Tag = 2) then
     begin
       ISADMIN := 'N';
       lblJudulForm.Caption := '  PAYROLL OTHER AS SPV';
     end;
   tblDepartemen.Active := True;
   tblOutlet.Active := True;
   qrySlip.Active := True;
   //qrpSlip.Visible := False;
   cbPrinter.Items := Printer.Printers;
   //qryList.Active := True;
   //gtbList.DataController.Refresh;
end;

end.
