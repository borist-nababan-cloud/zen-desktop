unit FGiftCertificate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxCalendar, cxCalc, cxCheckBox,
  StdCtrls, cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, DateUtils, Menus,
  cxLookAndFeelPainters, cxButtons, cxNavigator, cxDBNavigator, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  ShellAPI, cxGridExportLink, MyAccess, ExtCtrls,
  cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinscxPCPainter,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, MemDS, DBAccess, cxLabel;

type
  TfrmGiftCertificate = class(TForm)
    Panel2: TPanel;
    pmOption: TPopupMenu;
    PrintTable1: TMenuItem;
    ExportTable1: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    printGrid: TdxGridReportLink;
    dlgSave: TSaveDialog;
    pmView: TPopupMenu;
    Expand1: TMenuItem;
    Collapse1: TMenuItem;
    Label1: TLabel;
    edID: TcxTextEdit;
    Label10: TLabel;
    edStart: TcxTextEdit;
    Label2: TLabel;
    edJumlah: TcxCalcEdit;
    Label3: TLabel;
    edTerbit: TcxDateEdit;
    Label4: TLabel;
    edKadaluarsa: TcxDateEdit;
    Label5: TLabel;
    edMenu: TcxLookupComboBox;
    Label6: TLabel;
    edJenisJasa: TcxTextEdit;
    Label8: TLabel;
    edHargaJasa: TcxCalcEdit;
    Label9: TLabel;
    edHargaJual: TcxCalcEdit;
    btnOK: TcxButton;
    cxButton1: TcxButton;
    qryGCDetail: TMyQuery;
    dsQryGCDetail: TDataSource;
    qryMenu: TMyQuery;
    dsQryMenu: TDataSource;
    cxGrid1: TcxGrid;
    gtbGCDetail: TcxGridDBTableView;
    gtbGCDetailautonum: TcxGridDBColumn;
    gtbGCDetailpaket_number: TcxGridDBColumn;
    gtbGCDetailgc_number: TcxGridDBColumn;
    gtbGCDetailtanggal: TcxGridDBColumn;
    gtbGCDetailexpired_date: TcxGridDBColumn;
    gtbGCDetailjenis_jasa_id: TcxGridDBColumn;
    gtbGCDetailjasa_master_id: TcxGridDBColumn;
    gtbGCDetailnama_menu: TcxGridDBColumn;
    gtbGCDetailharga_jasa: TcxGridDBColumn;
    gtbGCDetailharga_jual: TcxGridDBColumn;
    gtbGCDetailaktif: TcxGridDBColumn;
    gtbGCDetailterjual: TcxGridDBColumn;
    gtbGCDetailnotes: TcxGridDBColumn;
    gtbGCDetailpakai: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel1: TcxLabel;
    ckAktif: TcxCheckBox;
    Label11: TLabel;
    btnSetNonAktif: TcxButton;
    ckJual: TcxCheckBox;
    ckPakai: TcxCheckBox;
    btnSetActive: TcxButton;
    Memo1: TMemo;
    btnSetSatuan: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure edMenuPropertiesChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure PrintTable1Click(Sender: TObject);
    procedure ExportTable1Click(Sender: TObject);
    procedure Expand1Click(Sender: TObject);
    procedure Collapse1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edMenuPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edHargaJasaFocusChanged(Sender: TObject);
    procedure ckAktifPropertiesChange(Sender: TObject);
    procedure ckPakaiPropertiesChange(Sender: TObject);
    procedure ckJualPropertiesChange(Sender: TObject);
    procedure btnSetNonAktifClick(Sender: TObject);
    procedure btnSetActiveClick(Sender: TObject);
    procedure btnSetSatuanClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmGiftCertificate: TfrmGiftCertificate;

implementation

uses FDMdb, FMain;

{$R *.dfm}

procedure TfrmGiftCertificate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qrySearch.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmGiftCertificate.FormCreate(Sender: TObject);
begin
     edTerbit.Date := Date;
     edKadaluarsa.Date := IncYear(Date, 1);
     qrySearch := TMyQuery.Create(Self);
     qrySearch.Connection := DMDB.dbInternal;
     qrySearch.SQL.Add('select * from temptable');
     qrySearch.Active := true;

     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from temptable');
     qryExec.Active := true;

     qryGCDetail.Active := True;
     gtbGCDetail.DataController.Refresh;
     qryMenu.Active := True;
end;

procedure TfrmGiftCertificate.edHargaJasaFocusChanged(Sender: TObject);
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select jenis_jasa_id, harga from main_menu where menu_id = ''' +
                     VarToStr(edMenu.EditValue) + '''');
   qrySearch.Open;
   edJenisJasa.Text := qrySearch.Fields[0].AsString;
   edHargaJual.EditValue := qrySearch.Fields[1].AsFloat;
   edHargaJasa.EditValue := qrySearch.Fields[1].AsFloat;
end;

procedure TfrmGiftCertificate.edMenuPropertiesChange(Sender: TObject);
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select jenis_jasa_id, harga from main_menu where menu_id = ''' +
                     VarToStr(edMenu.EditValue) + '''');
   qrySearch.Open;
   edJenisJasa.Text := qrySearch.Fields[0].AsString;
   edHargaJual.EditValue := qrySearch.Fields[1].AsFloat;
   edHargaJasa.EditValue := qrySearch.Fields[1].AsFloat;
end;

procedure TfrmGiftCertificate.edMenuPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select jenis_jasa_id, harga from main_menu where menu_id = ''' +
                     VarToStr(edMenu.EditValue) + '''');
   qrySearch.Open;
   edJenisJasa.Text := qrySearch.Fields[0].AsString;
   edHargaJual.EditValue := qrySearch.Fields[1].AsFloat;
   edHargaJasa.EditValue := qrySearch.Fields[1].AsFloat;
end;

procedure TfrmGiftCertificate.btnOKClick(Sender: TObject);
var
   i, jumlah, start_id, jmlItem : Integer;
   id_akhir, id_gc, keterangan : String;
begin
     Memo1.Clear;
     if (edID.Text = '') then
        begin
             ShowMessage('ID Gift Certificate masih kosong mohon isi terlebih dahulu');
             edID.SetFocus;
             Exit;
        end;
     jumlah := edJumlah.EditValue;
     start_id := StrToInt(edStart.Text);
     jmlItem := 0;
     qryExec.Close;
     qryExec.SQL.Clear;
     for i:=0 to jumlah-1 do
         begin

              if (Length(IntToStr(start_id)) = 1) then
                  begin
                       id_akhir := '000' + IntToStr(start_id);
                       id_gc := frmMain.APP_OUTLETID + '.' + edID.Text + '.' + id_akhir;
                  end
              else if (Length(IntToStr(start_id)) = 2) then
                  begin
                       id_akhir := '00' + IntToStr(start_id);
                       id_gc := frmMain.APP_OUTLETID + '.' + edID.Text + '.' + id_akhir;
                  end
              else if (Length(IntToStr(start_id)) = 3) then
                  begin
                       id_akhir := '0' + IntToStr(start_id);
                       id_gc := frmMain.APP_OUTLETID + '.' + edID.Text + '.' + id_akhir;
                  end
              else if (Length(IntToStr(start_id)) = 4) then
                  begin
                       id_akhir := IntToStr(start_id);
                       id_gc := frmMain.APP_OUTLETID + '.' + edID.Text + '.' + id_akhir;
                  end;
            keterangan := 'By : ' + frmMain.USERAPPS + ' at ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
            //Memo1.Lines.Add(id_gc);
            qrySearch.Close;
            qrySearch.SQL.Clear;
            qrySearch.SQL.Add('select gc_number from gc_detail where gc_number = ''' +
                id_gc + '''');
            qrySearch.Open;
            if (qrySearch.IsEmpty) then
              begin
                   jmlItem := jmlItem + 1;
                   qryExec.SQL.Add('INSERT INTO gc_detail VALUES(' +
                        '''' + '' + ''', ' +
                        '''' + 'NONE' + ''', ' +
                        '''' + id_gc + ''', ' +
                        '''' + FormatDateTime('YYYY-MM-dd', edTerbit.Date) + ''', ' +
                        '''' + FormatDateTime('YYYY-MM-dd', edKadaluarsa.Date) + ''', ' +
                        quotedstr(edJenisJasa.Text) + ',' +
                        quotedstr(edJenisJasa.Text) + ',' +
                        quotedstr(edMenu.Text) + ',' +
                        '''' + vartostr(edHargaJual.EditValue) + ''', ' +
                        '''' + vartostr(edHargaJasa.EditValue) + ''', ' +
                        '''' + 'N' + ''', ' +
                        '''' + 'N' + ''', ' +
                        '''' + 'N' + ''', ' +
                        '''' + keterangan + ''');');
              end
            else if (NOT qrySearch.IsEmpty) then
              begin
                   Memo1.Lines.Add('=========================================');
                   Memo1.Lines.Add('GC number ' + id_gc + ' SUDAH ADA ');
              end;

            start_id := start_id + 1;
            Application.ProcessMessages;
         end;
     if (jmlItem > 0) then
        begin
             qryExec.ExecSQL;
             qryGCDetail.Refresh;
             gtbGCDetail.DataController.Refresh;
             edID.Clear;
             edStart.Text := '0001';
             edJenisJasa.Clear;
             edJumlah.EditValue := 0;
             edHargaJasa.EditValue := 0;
             edHargaJual.EditValue := 0;
             Memo1.Lines.Add('=========================================');
             Memo1.Lines.Add('Success Inserting ' + inttostr(jmlItem) + ' Record');
             ShowMessage('Update Finish ' + #13#13 + 'Please Check Memo');
        end;
end;

procedure TfrmGiftCertificate.PrintTable1Click(Sender: TObject);
begin
     printGrid.Preview;
end;

procedure TfrmGiftCertificate.ExportTable1Click(Sender: TObject);
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

procedure TfrmGiftCertificate.Expand1Click(Sender: TObject);
begin
     gtbGCDetail.ViewData.Expand(True);
end;

procedure TfrmGiftCertificate.ckAktifPropertiesChange(Sender: TObject);
var
   isAktif, isSold, isUsed : String;
begin
     qryGCDetail.Close;
     qryGCDetail.SQL.Clear;
     qryGCDetail.SQL.Add('select * from gc_detail where aktif = ''' +
         VarToStr(ckAktif.EditValue) + ''' AND terjual = ''' +
         VarToStr(ckJual.EditValue) + ''' AND pakai = ''' +
         VarToStr(ckPakai.EditValue) + '''');
     qryGCDetail.Open;
     gtbGCDetail.DataController.Refresh;
end;

procedure TfrmGiftCertificate.ckJualPropertiesChange(Sender: TObject);
begin
     qryGCDetail.Close;
     qryGCDetail.SQL.Clear;
     qryGCDetail.SQL.Add('select * from gc_detail where aktif = ''' +
         VarToStr(ckAktif.EditValue) + ''' AND terjual = ''' +
         VarToStr(ckJual.EditValue) + ''' AND pakai = ''' +
         VarToStr(ckPakai.EditValue) + '''');
     qryGCDetail.Open;
     gtbGCDetail.DataController.Refresh;
end;

procedure TfrmGiftCertificate.ckPakaiPropertiesChange(Sender: TObject);
begin
     qryGCDetail.Close;
     qryGCDetail.SQL.Clear;
     qryGCDetail.SQL.Add('select * from gc_detail where aktif = ''' +
         VarToStr(ckAktif.EditValue) + ''' AND terjual = ''' +
         VarToStr(ckJual.EditValue) + ''' AND pakai = ''' +
         VarToStr(ckPakai.EditValue) + '''');
     qryGCDetail.Open;
     gtbGCDetail.DataController.Refresh;
end;

procedure TfrmGiftCertificate.Collapse1Click(Sender: TObject);
begin
     gtbGCDetail.ViewData.Collapse(True);
end;

procedure TfrmGiftCertificate.btnSetActiveClick(Sender: TObject);
var
  recSel, btnPilih : Integer;
  gcNumber, keterangan : String;
begin
  recSel := gtbGCDetail.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
  gcNumber:= vartostr(gtbGCDetail.DataController.GetValue(recSel, gtbGCDetailgc_number.Index));
  qryExec.Close;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update gc_detail set ' +
      'notes = ''' + keterangan + ''',' +
      'aktif = ''' + 'Y' + ''' Where gc_number = ''' + gcNumber + '''');
  qryExec.ExecSQL;
  qryGCDetail.Refresh;
  ShowMessage('GC Number ' + gcNumber + #13 + 'Has Been Activated');
  gtbGCDetail.DataController.Refresh;
end;

procedure TfrmGiftCertificate.btnSetNonAktifClick(Sender: TObject);
var
  recSel, btnPilih : Integer;
  gcNumber, keterangan : String;
begin
  recSel := gtbGCDetail.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  keterangan := 'By : ' + frmMain.USERAPPS + ' at ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
  gcNumber:= vartostr(gtbGCDetail.DataController.GetValue(recSel, gtbGCDetailgc_number.Index));
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select expired_date, aktif, terjual, pakai from gc_detail ' +
      'where gc_number = ''' + gcNumber + '''');
  qrySearch.Open;
  if (qrySearch.Fields[0].AsDateTime > Date) then
     begin
         btnPilih := messagedlg('Masa Aktif GC masih berlaku ' + #13 +
                     'Apakah GC akan di-nonaktifkan?',mtConfirmation, mbOKCancel, 0);
         if (btnPilih = mrCancel) then Exit;
     end;
  qryExec.Close;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update gc_detail set ' +
      'notes = ''' + keterangan + ''',' +
      'aktif = ''' + 'N' + ''' Where gc_number = ''' + gcNumber + '''');
  qryExec.ExecSQL;
  qryGCDetail.Refresh;
  ShowMessage('GC Number ' + gcNumber + #13 + 'Has Been Deactivated');
  gtbGCDetail.DataController.Refresh;
end;

procedure TfrmGiftCertificate.btnSetSatuanClick(Sender: TObject);
var
  recSel, btnPilih : Integer;
  gcNumber, keterangan, gcPaket, gcPaketOld : String;
  tglHabis, tglTerbit : TDate;
  hargaJual : Double;
begin
  recSel := gtbGCDetail.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  keterangan := 'By : ' + frmMain.USERAPPS + ' at ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
  gcNumber:= vartostr(gtbGCDetail.DataController.GetValue(recSel, gtbGCDetailgc_number.Index));
  gcPaketOld := vartostr(gtbGCDetail.DataController.GetValue(recSel, gtbGCDetailpaket_number.Index));

  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select paket_number from gc_master where paket_number = ''' +
                     gcPaketOld + '''');
  qrySearch.Open;

  hargaJual := gtbGCDetail.DataController.GetValue(recSel, gtbGCDetailharga_jual.Index);

  gcPaket := 'SGC.' + gcNumber;


  if (qrySearch.IsEmpty) then
    begin
        tglTerbit := Date;
        tglHabis := IncYear(tglTerbit, 1);
        qryExec.Close;
        qryExec.Sql.Clear;
        qryExec.SQL.Add('INSERT INTO gc_master VALUES(' +
                        QuotedStr(gcPaket) + ',' +
                        '''' + FormatDateTime('yyyy-MM-dd', tglTerbit) + ''', ' +
                        '''' + FormatDateTime('yyyy-MM-dd', tglHabis) + ''', ' +
                        '''' + FloatToStr(hargaJual) + ''', ' +
                        '''' + '0' + ''', ' +
                        '''' + 'Y' + ''', ' +
                        '''' + 'N' + ''', ' +
                        '''' + keterangan + ''');');
        qryExec.SQL.Add('update gc_detail set ' +
          'notes = ''' + keterangan + ''',' +
          'tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglTerbit) + ''', ' +
          'expired_date = ''' + FormatDateTime('yyyy-MM-dd', tglHabis) + ''', ' +
          'paket_number = ''' + gcPaket + ''' Where gc_number = ''' + gcNumber + ''';');
        qryExec.ExecSql;
        qryGCDetail.Refresh;
        gtbGCDetail.DataController.Refresh;
    end
  else if (NOT qrySearch.IsEmpty) then
    begin
      ShowMessage('GC Paket ' + gcPaket + ' Sudah Ada' + #13 + 'Transaksi Dibatalkan');
    end;
end;

end.
