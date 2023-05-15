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
  ShellAPI, cxGridExportLink, ExtCtrls, MyAccess,
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
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, DBAccess, MemDS, dxBevel,
  XSuperJSON, XSuperObject;

type
  TfrmGiftCertificate = class(TForm)
    dxComponentPrinter1: TdxComponentPrinter;
    printGrid: TdxGridReportLink;
    dlgSave: TSaveDialog;
    tblGiftCertificate: TMyQuery;
    dsTblGiftCertificate: TMyDataSource;
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
    gbData: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edID: TcxTextEdit;
    edStart: TcxTextEdit;
    edJumlah: TcxCalcEdit;
    edTerbit: TcxDateEdit;
    edKadaluarsa: TcxDateEdit;
    edMenu: TcxLookupComboBox;
    edHargaJasa: TcxCalcEdit;
    edHargaJual: TcxCalcEdit;
    lblJudulAtas: TLabel;
    Panel1: TPanel;
    qryMenu: TMyQuery;
    dsQryMenu: TMyDataSource;
    btnOK: TcxButton;
    btnSetNonAktif: TcxButton;
    edKodeOutlet: TcxTextEdit;
    dxBevel1: TdxBevel;
    btnShowAll: TcxButton;
    ckPaketSatuan: TcxCheckBox;
    lblProgress: TLabel;
    Label6: TLabel;
    edJenisJasa: TcxTextEdit;
    btnSetActive: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure edMenuPropertiesChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure PrintTable1Click(Sender: TObject);
    procedure ExportTable1Click(Sender: TObject);
    procedure Expand1Click(Sender: TObject);
    procedure Collapse1Click(Sender: TObject);
    procedure btnSetNonAktifClick(Sender: TObject);
    procedure edMenuPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnShowAllClick(Sender: TObject);
    procedure edMenuKeyPress(Sender: TObject; var Key: Char);
    procedure btnSetActiveClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, QryExec : TMyQuery;
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
   QryExec.Free;
   Action := caFree;
end;

procedure TfrmGiftCertificate.FormCreate(Sender: TObject);
begin
   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from temptable');
   qrySearch.Active := true;

   qryMenu.Active := True;
   tblGiftCertificate.Active := True;

   gtbGCDetail.DataController.Refresh;

   edTerbit.Date := Date;
   edKadaluarsa.Date := IncYear(Date, 1);
   edKodeOutlet.Text := frmMain.APP_OUTLETID + '.';
end;

procedure TfrmGiftCertificate.edMenuKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
       qrySearch.Close;
       qrySearch.SQL.Clear;
       qrySearch.SQL.Add('select menu_id, harga, jenis_jasa_id from ' +
                'main_menu where menu_id = ''' + VarToStr(edMenu.EditValue) + '''');
       qrySearch.Open;

       edHargaJasa.EditValue := qrySearch.Fields[1].AsFloat;
       edHargaJual.EditValue := qrySearch.Fields[1].AsFloat;
       edJenisJasa.Text := qrySearch.Fields[2].AsString;
       edHargaJual.SetFocus;
    end;
end;

procedure TfrmGiftCertificate.edMenuPropertiesChange(Sender: TObject);
begin
   {qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select * from menu_master where nama_menu = ''' +
                     edMenu.Text + '''');
   qrySearch.Open;
   edJenisJasa.Text := qrySearch.Fields[2].AsString;
   edJasaMaster.Text := qrySearch.Fields[1].AsString;
   edHargaJasa.EditValue := qrySearch.Fields[8].AsFloat;}

end;

procedure TfrmGiftCertificate.edMenuPropertiesEditValueChanged(Sender: TObject);
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select menu_id, harga, jenis_jasa_id from ' +
            'main_menu where menu_id = ''' + VarToStr(edMenu.EditValue) + '''');
   qrySearch.Open;

   edHargaJasa.EditValue := qrySearch.Fields[1].AsFloat;
   edHargaJual.EditValue := qrySearch.Fields[1].AsFloat;
   edJenisJasa.Text := qrySearch.Fields[2].AsString;
end;

procedure TfrmGiftCertificate.btnOKClick(Sender: TObject);
var
   i, jumlah, start_id : Integer;
   id_akhir, id_gc, kodePaket, keterangan, strJson : String;
   jSonItem : XSuperObject.ISuperObject;
begin
     if (edID.Text = '') then
        begin
             ShowMessage('ID Gift Certificate masih kosong mohon isi terlebih dahulu');
             edID.SetFocus;
             Exit;

        end;
     jumlah := edJumlah.EditValue;
     start_id := StrToInt(edStart.Text);
     for i:=0 to jumlah-1 do
         begin
            case Length(IntToStr(start_id)) of
               1 : begin
                     id_akhir := '000' + IntToStr(start_id);
                     id_gc := edKodeOutlet.Text + edID.Text + '.' + id_akhir;
                   end;
               2 : begin
                     id_akhir := '00' + IntToStr(start_id);
                     id_gc := edKodeOutlet.Text + edID.Text + '.' + id_akhir;
                   end;
               3 : begin
                     id_akhir := '0' + IntToStr(start_id);
                     id_gc := edKodeOutlet.Text + edID.Text + '.' + id_akhir;
                   end;
               4 : begin
                     id_akhir := IntToStr(start_id);
                     id_gc := edKodeOutlet.Text + edID.Text + '.' + id_akhir;
                   end;

            end;
            lblProgress.Caption := id_gc;
            Application.ProcessMessages;
            if (ckPaketSatuan.Checked = True) then kodePaket := id_gc
            else if (ckPaketSatuan.Checked = False) then kodePaket := '';

            keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
            qrySearch.Close;
            qrySearch.SQL.Clear;
            qrySearch.SQL.Add('select autonum from gc_detail where gc_number = ''' +
                id_gc + '''');
            qrySearch.Open;
            if (NOT qrySearch.IsEmpty) then
              begin
                ShowMessage('Nomor GC ' + id_gc + ' Sudah Ada');
                Exit;
              end;

            QryExec.SQL.Clear;
            QryExec.SQL.Add('INSERT INTO gc_detail VALUES(' +
                            '''' + '' + ''', ' +
                            '''' + kodePaket + ''', ' +
                            '''' + id_gc + ''', ' +
                            '''' + FormatDateTime('YYYY-MM-dd hh:mm:ss', edTerbit.Date) + ''',' +
                            '''' + FormatDateTime('YYYY-MM-dd hh:mm:ss', edKadaluarsa.Date) + ''',' +
                            '''' + VarToStr(edMenu.EditValue) + ''', ' +
                            '''' + edJenisJasa.Text + ''',' +
                            QuotedStr(edMenu.Text) + ',' +
                            '''' + vartostr(edHargaJasa.EditValue) + ''',' +
                            '''' + vartostr(edHargaJasa.EditValue) + ''',' +
                            '''' + 'Y' + ''',' +
                            '''' + 'N' + ''',' +
                            '''' + 'N' + ''',' +
                            QuotedStr(keterangan) + ');');
            if (ckPaketSatuan.Checked = True) then
              begin
                QryExec.SQL.Add('insert into gc_master values(' +
                    '''' + kodePaket + ''',' +
                    '''' + FormatDateTime('YYYY-MM-dd hh:mm:ss', edTerbit.Date) + ''',' +
                    '''' + FormatDateTime('YYYY-MM-dd hh:mm:ss', edKadaluarsa.Date) + ''',' +
                    '''' + vartostr(edHargaJual.EditValue) + ''',' +
                    '''' + '1' + ''',' +
                    '''' + 'N' + ''',' +
                    '''' + 'N' + ''',' +
                   QuotedStr(keterangan) + ');');
                 jSonItem :=  XSuperObject.SO('{}');
                 jSonItem.S['keterangan'] := '';
                 jSonItem.S['cetak'] := 'N';
                 strJson := jSonItem.AsJSON(False, False);

                qryExec.SQL.Add('insert into main_menu values(' +
                    '''' + kodePaket + ''',' +
                    '''' + 'BG' + ''',' +
                    '''' + 'BG' + ''',' +
                    QuotedStr(kodePaket) + ',' +
                    '''' + FloatToStr(edHargaJual.EditValue) + ''',' +
                    '''' + IntToStr(0) + ''','  +
                    '''' + FloatToStr(0) + ''',' +
                    '''' + FloatToStr(0) + ''',' +
                    '''' + FloatToStr(edHargaJual.EditValue) + ''',' +
                    '''' + FloatToStr(edHargaJual.EditValue) + ''',' +
                    QuotedStr(strJson) + ',' +
                    '''' + 'N' + ''',' +
                    '''' + frmMain.USERAPPS + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
              end;
            QryExec.ExecSQL;
              lblProgress.Caption := 'Inserting Data GC ' + id_gc + ' Done';
              tblGiftCertificate.Refresh;
              gtbGCDetail.DataController.Refresh;
              start_id := start_id + 1;
              Application.ProcessMessages;
         end;
     lblProgress.Caption := 'Finish Inserting Data GC ' + IntToStr(start_id) + ' Item[s]';
     edID.Clear;
     edStart.Text := '0001';
     edJumlah.EditValue := 0;
     edHargaJasa.EditValue := 0;
     edHargaJual.EditValue := 0;
     edMenu.ClearSelection;
     edJenisJasa.Clear;
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

procedure TfrmGiftCertificate.Collapse1Click(Sender: TObject);
begin
     gtbGCDetail.ViewData.Collapse(True);
end;

procedure TfrmGiftCertificate.btnSetActiveClick(Sender: TObject);
var
   recSel, btnSelected : Integer;
   noGC, keterangan : String;
begin
   recSel := gtbGCDetail.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;

  noGC := vartostr(gtbGCDetail.DataController.GetValue(recSel, gtbGCDetailgc_number.Index));
  btnSelected := MessageDlg('Apakah Anda akan mengaktitfkan Data ' + noGC + '?',mtConfirmation,mbOKCancel, 0);
   if (btnSelected = mrCancel) then Exit;
  keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('dd MMMM yyyy hh:mm:ss', Now);
  QryExec.SQL.Clear;
  QryExec.SQL.Add('update gc_detail set ' +
      'aktif = ''' + 'Y' + ''', ' +
      'notes = ' + QuotedStr(keterangan) +
      ' where gc_number = ''' + noGC + '''');
  QryExec.ExecSQL;
  tblGiftCertificate.Refresh;
  gtbGCDetail.DataController.Refresh;
end;

procedure TfrmGiftCertificate.btnSetNonAktifClick(Sender: TObject);
var
   recSel, btnSelected : Integer;
   noGC, keterangan : String;
begin
  recSel := gtbGCDetail.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;

  noGC := vartostr(gtbGCDetail.DataController.GetValue(recSel, gtbGCDetailgc_number.Index));
  btnSelected := MessageDlg('Apakah Anda akan menghapus Data ' + noGC + '?',mtConfirmation,mbOKCancel, 0);
   if (btnSelected = mrCancel) then Exit;
  keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('dd MMMM yyyy hh:mm:ss', Now);
  QryExec.SQL.Clear;
  QryExec.SQL.Add('update gc_detail set ' +
      'paket_number = ''' + '' + ''',' +
      'aktif = ''' + 'N' + ''', ' +
      'notes = ' + QuotedStr(keterangan) +
      ' where gc_number = ''' + noGC + ''';');
  QryExec.SQL.Add('update main_menu set ' +
       'aktif = ''' + 'N' + ''',' +
       'lastuser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) +
       ''' where menu_id = ''' + noGC + ''';');
  QryExec.ExecSQL;
  tblGiftCertificate.Refresh;
  gtbGCDetail.DataController.Refresh;
end;

procedure TfrmGiftCertificate.btnShowAllClick(Sender: TObject);
begin
   tblGiftCertificate.Close;
   tblGiftCertificate.SQL.Clear;
   tblGiftCertificate.SQL.Add('select * from gc_detail');
   tblGiftCertificate.Open;
   gtbGCDetail.DataController.Refresh;
end;

end.
