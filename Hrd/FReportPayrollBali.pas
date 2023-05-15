unit FReportPayrollBali;

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
  TfrmReportPayrollBali = class(TForm)
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
    QRDBText10: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel81: TQRLabel;
    lblTotalKomisi: TQRLabel;
    QRShape4: TQRShape;
    QRLabel69: TQRLabel;
    btnKomisiDetail: TButton;
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
    procedure btnKomisiDetailClick(Sender: TObject);
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
  frmReportPayrollBali: TfrmReportPayrollBali;

implementation

{$R *.dfm}

uses FdmDB, FMenuMain, FCetakPayroll, FCetakKomisi, FReportDetail;

procedure TfrmReportPayrollBali.btnExportClick(Sender: TObject);
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

procedure TfrmReportPayrollBali.btnKomisiDetailClick(Sender: TObject);
var
  recselect : Integer;
  idkaryawan, namakaryawan, kodekaryawan, departemen, idDept : String;
begin
  {if (cbPrinter.ItemIndex < 0) then
    begin
      ShowMessage('Mohon Pilih Printer');
      Exit;
    end;}
  recselect := tvList.DataController.GetFocusedRecordIndex;
  if (recselect < 0) then Exit;
  idkaryawan := VarToStr(tvList.DataController.GetValue(recselect, tvListIDFinger.Index));
  kodekaryawan := VarToStr(tvList.DataController.GetValue(recselect, tvListKodeKaryawan.Index));
  namakaryawan := VarToStr(tvList.DataController.GetValue(recselect, tvListNama.Index));
  departemen := VarToStr(tvList.DataController.GetDisplayText(recselect, tvListDivisi.Index));
  idDept := VarToStr(tvList.DataController.GetValue(recselect, tvListDivisi.Index));

  Application.CreateForm(TfrmReportDetail, frmReportDetail);
  frmReportDetail.IDFINGER := idkaryawan;
  frmReportDetail.KODEPAYROLL := edPeriode.Text;
  frmReportDetail.edStart.Date := frmReportPayrollBali.edStart.Date;
  frmReportDetail.edEnd.Date := frmReportPayrollBali.edEnd.Date;
  frmReportDetail.Show;
end;

procedure TfrmReportPayrollBali.Button1Click(Sender: TObject);
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

procedure TfrmReportPayrollBali.btnCetakSlipSatuanClick(Sender: TObject);
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

procedure TfrmReportPayrollBali.Button3Click(Sender: TObject);
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

procedure TfrmReportPayrollBali.Button4Click(Sender: TObject);
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

procedure TfrmReportPayrollBali.btnCetakKomisiAllClick(Sender: TObject);
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

procedure TfrmReportPayrollBali.btnCetakKomisiSatuanClick(Sender: TObject);
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
  {VKOMISI := qryCari.Fields[0].AsFloat;}

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
   {qryKomisi.SQL.Add('SELECT trans_master.trans_id, trans_master.tanggal, ' +
        'trans_master.therapist_id, trans_detail.produk_jasa_nama, ' +
        'trans_detail.trans_type_id, (trans_detail.subtotal * ''' + FloatToStr(VKOMISI) + ''' / 100) as subtotal ' +
        'FROM trans_master RIGHT JOIN ' +
        'trans_detail ON trans_master.trans_id = trans_detail.id_trans ' +
        'WHERE trans_master.status_trans = ''' + 'PAID' + ''' ' +
        'AND trans_master.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' ' +
        ' AND trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''' ' +
        'AND trans_master.therapist_id = '''  + idkaryawan + ''' ' +
        'AND trans_detail.trans_type_id <> ''' + 'BP'  + ''' ' +
        'AND trans_detail.trans_type_id <> ''' + 'BG' + '''');}
   qryKomisi.SQL.Add('SELECT ben_trans_master.trans_id, ben_trans_master.tanggal, ' +
        'ben_trans_master.id_therapist, ben_trans_master.id_room, ' +
        'ben_trans_detail.nama_menu, ben_trans_detail.n_nett ' +
        'FROM ben_trans_master RIGHT JOIN ' +
        'ben_trans_detail ON ben_trans_master.trans_id = ben_trans_detail.trans_id ' +
        'WHERE ben_trans_master.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' ' +
        'AND ben_trans_master.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''' ' +
        'AND ben_trans_master.id_therapist = ''' + idkaryawan + ''' ' +
        'AND ben_trans_detail.type_menu <> ''' + 'P' + ''' ' +
        'ORDER BY ben_trans_master.tanggal ASC');
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

procedure TfrmReportPayrollBali.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCari.Free;
  qrySearch.Free;
  qryFind.Free;
  Action := caFree;
end;

procedure TfrmReportPayrollBali.FormCreate(Sender: TObject);
var
  i : Integer;
begin
   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.StoreDB;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;

   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.StoreDB;
   qrySearch.SQL.Add('select * from temptable');
   qrySearch.Active := true;

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.StoreDB;
   qryFind.SQL.Add('select * from temptable');
   qryFind.Active := true;

   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select payrollperiode from ben_payroll_periode ' +
      'order by tglstart DESC LIMIT 12');
   qryFind.Open;
   qryFind.First;
   for i := 0 to qryFind.RecordCount - 1 do
      begin
        edPeriode.Items.Add(qryFind.Fields[0].AsString);
        qryFind.Next;
      end;
   if (frmReportPayrollBali.Tag = 1) then
     begin
       ISADMIN := 'Y';
       //lblJudulForm.Caption := '  PAYROLL AS ADMIN';
     end
   else if (frmReportPayrollBali.Tag = 2) then
     begin
       ISADMIN := 'N';
       //lblJudulForm.Caption := '  PAYROLL AS SPV';
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

procedure TfrmReportPayrollBali.lblAdjustmentPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblAlpaPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari'
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblDendaPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '-'
  else
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblGapokPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblGpLibNasPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblKomisiPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblLate1Print(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblLate2Print(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblLemburPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblNFOTPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '-'
  else
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblPotLainPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '-'
  else
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblSakitPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblSavingPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblTglKomisiPrint(sender: TObject;
  var Value: string);
begin
  Value := FormatDateTime('dd/mmm/yyyy', StrToDate(Value))
end;

procedure TfrmReportPayrollBali.lblTHPPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '-'
  else
   Value := 'Rp. ' + FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblTunjanganPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblUmLibNasPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblUMPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '-'
  else
   Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.lblVBpjsPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '-'
  else
  Value := FormatFloat('#,#', StrToFloat(Value));
end;

procedure TfrmReportPayrollBali.QRDBText3Print(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
   value := value + ' Hari';
end;

procedure TfrmReportPayrollBali.lblHCutiPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblHFOTPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblHIMasukPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblHIPulangPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Jam '
  else
  value := FormatFloat('#.0', StrToFloat(Value)) + ' Jam';
end;

procedure TfrmReportPayrollBali.lblHITidakAbsenPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblHITidakMasukPrint(sender: TObject;
  var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
   value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblHLibNasPrint(sender: TObject; var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblHMasukKerjaPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
   value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblHUnderPrint(sender: TObject; var Value: string);
begin
   if (StrToFloat(Value) <= 0) then Value := '- Hari '
  else
   value := FormatFloat('0', StrToFloat(Value)) + ' Hari';
end;

procedure TfrmReportPayrollBali.lblJamLemburPrint(sender: TObject;
  var Value: string);
begin
  if (StrToFloat(Value) <= 0) then Value := '- Jam '
  else
  value := FormatFloat('0', StrToFloat(Value)) + ' Jam';
end;

end.
