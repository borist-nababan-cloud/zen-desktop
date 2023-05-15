unit FTransBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxTextEdit, cxDBLookupComboBox, cxContainer, Menus,
  StdCtrls, cxButtons, cxMemo, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxSpinEdit, cxTimeEdit, cxMaskEdit, cxCalendar, cxGroupBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  cxCalc, AdvGlowButton, AdvToolBar, DBAccess, DB, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  Vcl.ComCtrls, dxCore, cxDateUtils, MyAccess, MemDS;

type
  TfrmTransBank = class(TForm)
    Label1: TLabel;
    cxGrid1: TcxGrid;
    gtvKas: TcxGridTableView;
    gtvKasNoKas: TcxGridColumn;
    gtvKasCOA: TcxGridColumn;
    gtvKasKeterangan: TcxGridColumn;
    gtvKasJumlah: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    edTglKas: TcxDateEdit;
    edNoBuktiKas: TcxTextEdit;
    edStatus: TcxComboBox;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    btnDelete: TcxButton;
    btnBrowse: TcxButton;
    btnPrint: TcxButton;
    btnSave: TcxButton;
    btnNew: TcxButton;
    edCOA: TcxLookupComboBox;
    edJumlah: TcxCalcEdit;
    edKeterangan: TcxTextEdit;
    Label3: TLabel;
    btnTambah: TcxButton;
    btnClear: TcxButton;
    Label10: TLabel;
    edTypeKas: TcxLookupComboBox;
    tblBank: TMyQuery;
    dsTblBank: TDataSource;
    tblCoa: TMyTable;
    dsblCoa: TDataSource;
    Label5: TLabel;
    edNotes: TEdit;
    procedure btnBrowseClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gtvKasTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure btnPrintClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCOAKeyPress(Sender: TObject; var Key: Char);
    procedure edKeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure edJumlahKeyPress(Sender: TObject; var Key: Char);
    procedure edStatusKeyPress(Sender: TObject; var Key: Char);
    procedure edTypeKasKeyPress(Sender: TObject; var Key: Char);
    procedure edNotesKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryTrans1, qryTrans2, qryTrans3 : TMyQuery;
    TOTAL  : Double;
  public
    { Public declarations }
    TR_ID, TR_PERIODE, TR_NUMBER, TR_KAS, USERAPP,
    TR_Bulan, TR_NO, TR_NOKAS, TR_IDKAS: string;
    function CreateNewAutoNum: string;
    function CreateNewNoKas: string;
    procedure clearFrom();
  end;

var
  frmTransBank: TfrmTransBank;

implementation

uses FdmDB, FMenuMain, FTransKasKecilCari, FTransBankCetak;

{$R *.dfm}

function TfrmTransBank.CreateNewAutoNum: String;
var
    lastID, strTmpNum, strNum, NewID: string;
    intTmpNum, intNum: integer;
begin
    with dmDB do
        begin
              NewID := TR_ID + '.' + TR_PERIODE + '.';

              qryTrans1.Close;
              qryTrans1.SQL.Clear;
              qryTrans1.SQL.Add('SELECT id_transaksi FROM ben_trans_bank_master ' +
                                'WHERE id_transaksi LIKE ''' + NewID + '%'' ORDER BY id_transaksi ASC');
              qryTrans1.Open;

              if (qryTrans1.IsEmpty) then
                  begin
                        Result := TR_ID + '.' + TR_PERIODE + '.' + '001';
                        exit;
                  end;

              qryTrans1.Last;
              lastID := qryTrans1.Fields[0].AsString;
              strTmpNum := Copy(lastID, length(lastID) - 2, 3);
              intTmpNum := strtoint(strTmpNum);
              intNum := intTmpNum + 1;

              case length(inttostr(intNum)) of
                    // 1 : strNum := '0000' + inttostr(intNum);
                    // 2 : strNum := '000' + inttostr(intNum);
                    1: strNum := '00' + inttostr(intNum);
                    2: strNum := '0' + inttostr(intNum);
                    3: strNum := inttostr(intNum);
              end;

              TR_NUMBER := strNum;
              TR_KAS := TR_ID + '.' + TR_PERIODE + '.' + TR_NUMBER;
              Result := TR_KAS;
        end;
end;

function TfrmTransBank.CreateNewNoKas: String;
var
  lastID, strTmpNum, strNum, NewID: string;
  intTmpNum, intNum, rec: integer;
begin
      with dmDB do
          begin
                NewID := TR_IDKAS + '/' + TR_Bulan + '/';
                if(gtvKas.DataController.RecordCount = 0 ) then
                    begin
                         qryTrans1.Close;
                         qryTrans1.SQL.Clear;
                         qryTrans1.SQL.Add('SELECT id_transaksi FROM ben_trans_bank_detail ' +
                                           'WHERE id_transaksi LIKE ''' + NewID + '%'' ORDER BY id_transaksi ASC');
                         qryTrans1.Open;

                         if (qryTrans1.IsEmpty) then
                             begin
                                 Result := TR_IDKAS + '/' + TR_Bulan + '/' + '0001';
                                 exit;
                             end;

                         qryTrans1.Last;
                         lastID := qryTrans1.Fields[0].AsString;
                         strTmpNum := Copy(lastID, length(lastID) - 3, 4);
                         intTmpNum := strtoint(strTmpNum);
                         intNum := intTmpNum + 1;
                    end
                else
                    begin
                          //gtbTrans.DataController.GotoLast;
                          rec := gtvKas.DataController.RecordCount-1;
                          //ShowMessage(inttostr(rec));
                          lastID := vartostr(gtvKas.DataController.GetValue(rec, gtvKasNoKas.Index));
                          strTmpNum := Copy(lastID, length(lastID) - 3, 4);
                          intTmpNum := strtoint(strTmpNum);
                          intNum := intTmpNum + 1;
                    end;

                case length(inttostr(intNum)) of
                       1: strNum := '000' + inttostr(intNum);
                       2: strNum := '00' + inttostr(intNum);
                       3: strNum := '0' + inttostr(intNum);
                       4: strNum := inttostr(intNum);
                end;

                TR_NO := strNum;
                TR_NOKAS := TR_IDKAS + '/' + TR_Bulan + '/' +  TR_NO;
                Result := TR_NOKAS;
          end;
end;

procedure TfrmTransBank.edCOAKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edKeterangan.SetFocus;
   if (key = #27) then edNotes.SetFocus;
end;

procedure TfrmTransBank.edJumlahKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then btnTambah.SetFocus;
   if (key = #27) then edKeterangan.SetFocus;
end;

procedure TfrmTransBank.edKeteranganKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edJumlah.SetFocus;
   if (key = #27) then edCOA.SetFocus;
end;

procedure TfrmTransBank.edNotesKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edCOA.SetFocus;
   if (key = #27) then edTypeKas.SetFocus;
end;

procedure TfrmTransBank.edStatusKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edTypeKas.SetFocus;
end;

procedure TfrmTransBank.edTypeKasKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edNotes.SetFocus;
  if (key = #27) then edStatus.SetFocus;
end;

procedure TfrmTransBank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryTrans1.Free;
   qryTrans2.Free;
   qryTrans3.Free;
   //qryKasMaster.Active := False;
   Action := caFree;
end;

procedure TfrmTransBank.FormCreate(Sender: TObject);
begin
    edTglKas.EditValue := Date;
    TR_ID := 'TB';
    TR_NUMBER := '001';
    TR_NO := '0001';
    USERAPP := frmMenuMain.USERAPP;
   qryTrans1 := TMyQuery.Create(Self);
   qryTrans1.Connection := DMDB.StoreDB;
   qryTrans1.SQL.Add('select * from temptable');
   qryTrans1.Active := true;

   qryTrans2 := TMyQuery.Create(Self);
   qryTrans2.Connection := DMDB.StoreDB;
   qryTrans2.SQL.Add('select * from temptable');
   qryTrans2.Active := true;

   qryTrans3 := TMyQuery.Create(Self);
   qryTrans3.Connection := DMDB.StoreDB;
   qryTrans3.SQL.Add('select * from temptable');
   qryTrans3.Active := true;
   tblBank.Active := True;
   tblBank.Close;
   tblBank.SQL.Clear;
   tblBank.SQL.Add('select kodebank from ben_master_bank where ' +
         'idoutlet = ''' + frmMenuMain.IDOUTLET + '''');
   tblBank.Open;
   tblCoa.Active := True;
end;

procedure TfrmTransBank.FormShow(Sender: TObject);
begin
   {STRSQL := 'select * from coa_detail where id_cabang = ''' + '1' + '''';
   PREPARE_CARI;}

end;

procedure TfrmTransBank.gtvKasTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
    if (AValue = NULL) then
        begin
            TOTAL := 0;
        end
    else
        begin
            TOTAL := AValue;
        end;
end;

procedure TfrmTransBank.clearFrom();
begin
    edNoBuktiKas.Clear;
    edTglKas.Date := date;
    edStatus.Clear;

    edCOA.Clear;
    edKeterangan.Clear;
    edJumlah.EditValue  := 0;

    gtvKas.DataController.SelectAll;
    gtvKas.DataController.DeleteSelection;

    edCOA.Enabled := True;
    edKeterangan.Enabled  := True;
    edJumlah.Enabled  := True;
    edTypeKas.Clear;
    edTypeKas.Properties.ReadOnly := False;
    btnTambah.Enabled := True;
    btnClear.Enabled  := True;
end;

procedure TfrmTransBank.btnBrowseClick(Sender: TObject);
begin
    clearFrom;
    //gtvKas.OptionsView.Navigator  := False;
    {qryKasMaster.Close;
    qryKasMaster.SQL.Clear;
    qryKasMaster.SQL.Add('SELECT * FROM kas_kecil_mstr WHERE ' +
                      'status <> ''' + 'TEMP' + '''');
    qryKasMaster.Open;}

    Application.CreateForm(TfrmTransKasKecilCari, frmTransKasKecilCari);
    frmTransKasKecilCari.Show;
end;

procedure TfrmTransBank.btnClearClick(Sender: TObject);
begin
    edCOA.Clear;
    edKeterangan.Clear;
    edJumlah.EditValue  := 0;
end;

procedure TfrmTransBank.btnDeleteClick(Sender: TObject);
var
    no_reff, strSync : string;
begin
    with dmDB do
        begin
            if (MessageDlg('Anda yakin untuk menghapus bukti Bank ini?', mtConfirmation, mbOKCancel, 0) = mrOK) then
                begin

                    //hapus master
                    qryExec.SQL.Clear;
                    qryExec.SQL.Add('DELETE FROM ben_trans_bank_master ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiKas.Text + ''';');
                    strSync := 'DELETE FROM ben_trans_bank_master ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiKas.Text + ''';';
                    DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                             '''' + '' + ''',' +
                             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                             QuotedStr(frmMenuMain.USERAPP) + ',' +
                             '''' + frmMenuMain.IDOUTLET + ''',' +
                             QuotedStr(strsync) + ',' +
                             '''' + 'N' + ''');');
                    //hapus detail
                    qryExec.SQL.Add('DELETE FROM ben_trans_bank_detail ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiKas.Text + ''';');
                    strSync := 'DELETE FROM ben_trans_bank_detail ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiKas.Text + ''';';
                    DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                             '''' + '' + ''',' +
                             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                             QuotedStr(frmMenuMain.USERAPP) + ',' +
                             '''' + frmMenuMain.IDOUTLET + ''',' +
                             QuotedStr(strsync) + ',' +
                             '''' + 'N' + ''');');
                    qryExec.ExecSQL;

                    clearFrom;
                    //gtvKas.OptionsView.Navigator  := True;
                end;
      end;
end;

procedure TfrmTransBank.btnNewClick(Sender: TObject);
var
  strSync : String;
begin
    TR_PERIODE := FormatDateTime('ddmmyy', Date);
    //gtvKas.OptionsView.Navigator  := True;
    {if (edTypeKas.EditValue = null) then Exit;
    if (edTypeKas.Text = '') then Exit;}

    with dmDB do
        begin
             if(btnNew.Tag = 0) then
                 begin
                     clearFrom;

                     TR_KAS := CreateNewAutoNum();
                     edNoBuktiKas.Text := TR_KAS;

                     qryExec.SQL.Clear;
                     qryExec.SQL.Add('INSERT INTO ben_trans_bank_master VALUES(' +
                         '''' + edNoBuktiKas.Text + ''' , ' +
                         '''' + vartostr(edTypeKas.EditValue) + ''',' +
                         '''' + frmMenuMain.IDOUTLET + ''',' +
                         '''' + FormatDateTime('yyyy-mm-dd', edTglKas.EditValue) + ''' , ' +
                         '''' + '0' + ''' , ' +
                         '''' + 'TEMP' + ''' , ' +
                         '''' + frmMenuMain.USERAPP + ''' , ' +
                         '''' + '' + ''' , ' +
                         '''' + '' + ''',' +
                         '''' + frmMenuMain.USERAPP + ''',' +
                         '''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ''');');

                     strSync := 'INSERT INTO ben_trans_bank_master VALUES(' +
                         '''' + edNoBuktiKas.Text + ''' , ' +
                         '''' + vartostr(edTypeKas.EditValue) + ''',' +
                         '''' + frmMenuMain.IDOUTLET + ''',' +
                         '''' + FormatDateTime('yyyy-mm-dd', edTglKas.EditValue) + ''' , ' +
                         '''' + '0' + ''' , ' +
                         '''' + 'TEMP' + ''' , ' +
                         '''' + frmMenuMain.USERAPP + ''' , ' +
                         '''' + '' + ''' , ' +
                         '''' + '' + ''',' +
                         '''' + frmMenuMain.USERAPP + ''',' +
                         '''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ''');';

                     DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                         '''' + '' + ''',' +
                         '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                         QuotedStr(frmMenuMain.USERAPP) + ',' +
                         '''' + frmMenuMain.IDOUTLET + ''',' +
                         QuotedStr(strsync) + ',' +
                         '''' + 'N' + ''');');
                     qryExec.ExecSQL;

                     btnNew.Tag := 1;
                     btnNew.Caption := 'CANCEL';
                     edStatus.SetFocus;
                 end
             else
             if(btnNew.Tag = 1) then
                 begin
                      if (MessageDlg('Anda yakin untuk membatalkan bukti Bank ini?', mtConfirmation, mbOKCancel, 0) = mrOK) then
                          begin
                              qryExec.Sql.Clear;
                              qryExec.Sql.Add('DELETE FROM ben_trans_bank_master ' +
                                    'WHERE id_transaksi = ''' +  edNoBuktiKas.Text + ''' AND ' +
                                    'status = ''' + 'TEMP' + ''';');
                              strSync := 'DELETE FROM ben_trans_bank_master ' +
                                    'WHERE id_transaksi = ''' +  edNoBuktiKas.Text + ''' AND ' +
                                    'status = ''' + 'TEMP' + ''';';
                              DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                                   '''' + '' + ''',' +
                                   '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                                   QuotedStr(frmMenuMain.USERAPP) + ',' +
                                   '''' + frmMenuMain.IDOUTLET + ''',' +
                                   QuotedStr(strsync) + ',' +
                                   '''' + 'N' + ''');');
                              qryExec.ExecSql;
                              btnNew.Tag := 0;
                              btnNew.Caption := 'NEW';

                              clearFrom;
                          end;
                 end;
        end;
end;

procedure TfrmTransBank.btnPrintClick(Sender: TObject);
var
    bukti : string;
begin
    btnSave.Click;

    with dmDB do
        begin

            Application.CreateForm(TfrmTransBankCetak, frmTransBankCetak);
            frmTransBankCetak.qryTransMaster.Active := True;
            frmTransBankCetak.qryTransMaster.Close;
            frmTransBankCetak.qryTransMaster.SQL.Clear;
            frmTransBankCetak.qryTransMaster.SQL.Add('select * from ben_trans_bank_master ' +
                'where id_transaksi = ''' + edNoBuktiKas.Text + '''');
            frmTransBankCetak.qryTransMaster.Open;

            frmTransBankCetak.qryTransDetail.Active := True;
            frmTransBankCetak.qryTransDetail.Close;
            frmTransBankCetak.qryTransDetail.SQL.Clear;
            frmTransBankCetak.qryTransDetail.SQL.Add('select * from ben_trans_bank_detail ' +
                'where id_transaksi = ''' + edNoBuktiKas.Text + ''' ORDER BY autonum');
            frmTransBankCetak.qryTransDetail.Open;

            if (edStatus.Text = 'MASUK') then
            frmTransBankCetak.lblJudul.Caption := ' BUKTI BANK MASUK '
            else if (edStatus.Text = 'KELUAR') then
            frmTransBankCetak.lblJudul.Caption := ' BUKTI BANK KELUAR ';
            frmTransBankCetak.lblKodeKas.Caption := edTypeKas.Text;
            qryTrans1.Close;
            qryTrans1.SQL.Clear;
            qryTrans1.SQL.Add('select namaoutlet from ben_outlet where kodeoutlet = ''' +
                  frmMenuMain.IDOUTLET + '''');
            qryTrans1.Open;
            frmTransBankCetak.lblOutlet.Caption := qryTrans1.Fields[0].AsString;
            frmTransBankCetak.qrpPrintTrans.Preview;
        end;
end;

procedure TfrmTransBank.btnSaveClick(Sender: TObject);
var
    i : integer;
    strSync : String;
begin
    with dmDB do
        begin
            if(edNoBuktiKas.EditValue = NULL) then
                begin
                     ShowMessage('Bukti Bank Kecil Masih Kosong.');
                     Exit;
                end;

            if(edStatus.EditValue = NULL) then
                begin
                     ShowMessage('Status Masih Kosong.');
                     Exit;
                end;


            qryExec.SQL.Clear;
            qryExec.SQL.Add('UPDATE ben_trans_bank_master SET ' +
                  'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglKas.Date) + ''' , ' +
                  'total = ''' + FloatToStr(total) + ''' , ' +
                  'status = ''' + VarToStr(edStatus.EditValue) + ''', ' +
                  'kodebank = ''' + vartostr(edTypeKas.EditValue) + ''',' +
                  'notes = ' + QuotedStr(edNotes.Text) + ',' +
                  'lastuseredit = ''' + frmMenuMain.USERAPP + ''',' +
                  'lasteditdate = ''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ''' ' +
                  'Where id_transaksi = ''' + edNoBuktiKas.Text + ''';');
            strSync := 'UPDATE ben_trans_bank_master SET ' +
                  'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglKas.Date) + ''' , ' +
                  'total = ''' + FloatToStr(total) + ''' , ' +
                  'status = ''' + VarToStr(edStatus.EditValue) + ''', ' +
                  'kodebank = ''' + vartostr(edTypeKas.EditValue) + ''',' +
                  'notes = ' + QuotedStr(edNotes.Text) + ',' +
                  'lastuseredit = ''' + frmMenuMain.USERAPP + ''',' +
                  'lasteditdate = ''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ''' ' +
                  'Where id_transaksi = ''' + edNoBuktiKas.Text + ''';';
            DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                 '''' + '' + ''',' +
                 '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                 QuotedStr(frmMenuMain.USERAPP) + ',' +
                 '''' + frmMenuMain.IDOUTLET + ''',' +
                 QuotedStr(strsync) + ',' +
                 '''' + 'N' + ''');');
            qryExec.ExecSQL;

            qryTrans1.Close;
            qryTrans1.SQL.Clear;
            qryTrans1.SQL.Add('SELECT * FROM ben_trans_bank_detail ' +
                              'WHERE id_transaksi = ''' + edNoBuktiKas.Text + '''');
            qryTrans1.Open;

            if(qryTrans1.IsEmpty) then
                begin
                    gtvKas.DataController.PostEditingData;
                    gtvKas.DataController.Post;

                    gtvKas.DataController.GotoFirst;
                    qryExec.SQL.Clear;
                    for i:= 0 to gtvKas.DataController.RecordCount - 1 do
                         begin
                           qryExec.SQL.Add('INSERT INTO ben_trans_bank_detail VALUES(' +
                               '''' + ''  + ''' , ' +
                               '''' + edNoBuktiKas.Text + ''' , ' +
                               '''' + vartostr(edTypeKas.EditValue) + ''',' +
                               '''' + frmMenuMain.IDOUTLET + ''',' +
                               '''' + FormatDateTime('yyyy-mm-dd', edTglKas.EditValue) + ''' , ' +
                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasNoKas.Index)) + ''' , ' +
                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasCOA.Index)) + ''' , ' +
                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasKeterangan.Index)) + ''' , ' +
                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasJumlah.Index)) + ''' , ' +
                               '''' + vartostr(edStatus.EditValue) + ''' , ' +
                               '''' + '' + ''' , ' +
                               '''' + frmMenuMain.USERAPP + ''',' +
                               '''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ''');');

                           strSync := 'INSERT INTO ben_trans_bank_detail VALUES(' +
                               '''' + ''  + ''' , ' +
                               '''' + edNoBuktiKas.Text + ''' , ' +
                               '''' + vartostr(edTypeKas.EditValue) + ''',' +
                               '''' + frmMenuMain.IDOUTLET + ''',' +
                               '''' + FormatDateTime('yyyy-mm-dd', edTglKas.EditValue) + ''' , ' +
                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasNoKas.Index)) + ''' , ' +
                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasCOA.Index)) + ''' , ' +
                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasKeterangan.Index)) + ''' , ' +
                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasJumlah.Index)) + ''' , ' +
                               '''' + vartostr(edStatus.EditValue) + ''' , ' +
                               '''' + '' + ''' , ' +
                               '''' + frmMenuMain.USERAPP + ''',' +
                               '''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ''');';
                           DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                               '''' + '' + ''',' +
                               '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                               QuotedStr(frmMenuMain.USERAPP) + ',' +
                               '''' + frmMenuMain.IDOUTLET + ''',' +
                               QuotedStr(strsync) + ',' +
                               '''' + 'N' + ''');');
                           gtvKas.DataController.GotoNext;
                         end;
                    DMDB.qryExec.ExecSQL;
                end
            else
                begin
                    qryExec.SQL.Clear;
                    qryExec.SQL.Add('DELETE FROM ben_trans_bank_detail ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiKas.Text + ''';');
                    strSync := 'DELETE FROM ben_trans_bank_detail ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiKas.Text + ''';';
                    DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                               '''' + '' + ''',' +
                               '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                               QuotedStr(frmMenuMain.USERAPP) + ',' +
                               '''' + frmMenuMain.IDOUTLET + ''',' +
                               QuotedStr(strsync) + ',' +
                               '''' + 'N' + ''');');
                    qryExec.ExecSQL;

                    gtvKas.DataController.PostEditingData;
                    gtvKas.DataController.Post;

                    gtvKas.DataController.GotoFirst;
                    qryExec.SQL.Clear;
                    for i:= 0 to gtvKas.DataController.RecordCount - 1 do
                         begin
                               qryExec.SQL.Add('INSERT INTO ben_trans_bank_detail VALUES(' +
                                   '''' + ''  + ''' , ' +
                                   '''' + edNoBuktiKas.Text + ''' , ' +
                                   '''' + vartostr(edTypeKas.EditValue) + ''',' +
                                   '''' + frmMenuMain.IDOUTLET + ''',' +
                                   '''' + FormatDateTime('yyyy-mm-dd', edTglKas.EditValue) + ''' , ' +
                                   '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasNoKas.Index)) + ''' , ' +
                                   '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasCOA.Index)) + ''' , ' +
                                   '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasKeterangan.Index)) + ''' , ' +
                                   '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasJumlah.Index)) + ''' , ' +
                                   '''' + vartostr(edStatus.EditValue) + ''' , ' +
                                   '''' + '' + ''' , ' +
                                   '''' + frmMenuMain.USERAPP + ''',' +
                                   '''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ''');');
                               strSync := 'INSERT INTO ben_trans_bank_detail VALUES(' +
                                   '''' + ''  + ''' , ' +
                                   '''' + edNoBuktiKas.Text + ''' , ' +
                                   '''' + vartostr(edTypeKas.EditValue) + ''',' +
                                   '''' + frmMenuMain.IDOUTLET + ''',' +
                                   '''' + FormatDateTime('yyyy-mm-dd', edTglKas.EditValue) + ''' , ' +
                                   '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasNoKas.Index)) + ''' , ' +
                                   '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasCOA.Index)) + ''' , ' +
                                   '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasKeterangan.Index)) + ''' , ' +
                                   '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasJumlah.Index)) + ''' , ' +
                                   '''' + vartostr(edStatus.EditValue) + ''' , ' +
                                   '''' + '' + ''' , ' +
                                   '''' + frmMenuMain.USERAPP + ''',' +
                                   '''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ''');';
                               DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                                   '''' + '' + ''',' +
                                   '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                                   QuotedStr(frmMenuMain.USERAPP) + ',' +
                                   '''' + frmMenuMain.IDOUTLET + ''',' +
                                   QuotedStr(strsync) + ',' +
                                   '''' + 'N' + ''');');
                               gtvKas.DataController.GotoNext;
                         end;
                    qryExec.ExecSQL;
                end;
        end;

    btnNew.Caption := 'NEW';
    btnNew.Tag := 0;
    edTypeKas.Properties.ReadOnly := True;
    //gtvKas.OptionsView.Navigator  := False;
end;

procedure TfrmTransBank.btnTambahClick(Sender: TObject);
var
    newRec : integer;
begin
      if(edNoBuktiKas.EditValue = NULL) then
          begin
             ShowMessage('Bukti Bank Kecil Masih Kosong.');
             Exit;
          end;

      if(edStatus.EditValue = NULL) then
          begin
             ShowMessage('Status Masih Kosong.');
             exit;
          end;

      if(edCOA.EditValue = NULL) then
          begin
             ShowMessage('COA Masih Kosong.');
             Exit;
          end;

      if(edKeterangan.Text = '') then
          begin
             ShowMessage('Keterangan Masih Kosong.');
             Exit;
          end;

      TR_Bulan := FormatDateTime('mm', edTglKas.EditValue);

      if(edStatus.EditValue = 'MASUK') then
          begin
              TR_IDKAS := 'BBM';
          end
      else
          begin
              TR_IDKAS := 'BBK';
          end;

      TR_NOKAS  := CreateNewNoKas();
      newRec    := gtvKas.DataController.InsertRecord(gtvKas.DataController.RecordCount);

      gtvKas.DataController.SetValue(newRec, gtvKasNoKas.Index, TR_NOKAS);
      gtvKas.DataController.SetValue(newRec, gtvKasCOA.Index, edCOA.EditValue);
      gtvKas.DataController.SetValue(newRec, gtvKasKeterangan.Index, edKeterangan.Text);
      gtvKas.DataController.SetValue(newRec, gtvKasJumlah.Index, edJumlah.EditValue);

      gtvKas.DataController.PostEditingData;
      gtvKas.DataController.Post;

      gtvKas.DataController.FocusedRecordIndex := gtvKas.DataController.RecordCount-1;

      edCOA.Clear;
      edKeterangan.Clear;
      edJumlah.EditValue := 0;
      edCOA.SetFocus;
end;

end.
