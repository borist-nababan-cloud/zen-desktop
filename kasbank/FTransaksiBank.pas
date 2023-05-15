unit FTransaksiBank;

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
  cxCalc, AdvGlowButton, AdvToolBar;

type
  TfrmTransaksiBank = class(TForm)
    Label1: TLabel;
    cxGrid1: TcxGrid;
    gtvBank: TcxGridTableView;
    gtvBankNoBank: TcxGridColumn;
    gtvBankCOA: TcxGridColumn;
    gtvBankKeterangan: TcxGridColumn;
    gtvBankJumlah: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    edTglBank: TcxDateEdit;
    edNoBuktiBank: TcxTextEdit;
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
    Label5: TLabel;
    Label9: TLabel;
    edNoRek: TcxLookupComboBox;
    edIDBank: TcxLookupComboBox;
    Label10: TLabel;
    edCabang: TcxLookupComboBox;
    procedure btnBrowseClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure edNoRekPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure gtvBankTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure FormShow(Sender: TObject);
    procedure edCabangPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TR_ID, TR_PERIODE, TR_NUMBER, TR_KAS, USERAPP,
    TR_Bulan, TR_NO, TR_NOKAS, TR_IDKAS, TAG_FROM: string;
    total  : Double;
    function CreateNewAutoNum: string;
    function CreateNewNoKas: string;
    procedure clearFrom();
  end;

var
  frmTransaksiBank: TfrmTransaksiBank;

implementation

uses FdmDB, FMain, FCariTransaksiBank, FPrintBB;

{$R *.dfm}

function TfrmTransaksiBank.CreateNewAutoNum: String;
var
    lastID, strTmpNum, strNum, NewID: string;
    intTmpNum, intNum: integer;
begin
    with dmDB do
        begin
              NewID := TR_ID + '.' + TR_PERIODE + '.';

              qrySearch.Close;
              qrySearch.SQL.Clear;
              qrySearch.SQL.Add('SELECT id_transaksi FROM bank_mstr ' +
                                'WHERE id_transaksi LIKE ''' + NewID + '%'' ORDER BY id_transaksi ASC');
              qrySearch.Open;

              if (qrySearch.IsEmpty) then
                  begin
                        Result := TR_ID + '.' + TR_PERIODE + '.' + '001';
                        exit;
                  end;

              qrySearch.Last;
              lastID := qrySearch.Fields[0].AsString;
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

function TfrmTransaksiBank.CreateNewNoKas: String;
var
  lastID, strTmpNum, strNum, NewID: string;
  intTmpNum, intNum, rec: integer;
begin
      with dmDB do
          begin
                NewID := TR_IDKAS + '/' + TR_Bulan + '/';
                if(gtvBank.DataController.RecordCount = 0 ) then
                    begin
                         qrySearch.Close;
                         qrySearch.SQL.Clear;
                         qrySearch.SQL.Add('SELECT id_transaksi FROM bank_detail ' +
                                           'WHERE id_transaksi LIKE ''' + NewID + '%'' ORDER BY id_transaksi ASC');
                         qrySearch.Open;

                         if (qrySearch.IsEmpty) then
                             begin
                                 Result := TR_IDKAS + '/' + TR_Bulan + '/' + '0001';
                                 exit;
                             end;

                         qrySearch.Last;
                         lastID := qrySearch.Fields[0].AsString;
                         strTmpNum := Copy(lastID, length(lastID) - 3, 4);
                         intTmpNum := strtoint(strTmpNum);
                         intNum := intTmpNum + 1;
                    end
                else
                    begin
                          //gtbTrans.DataController.GotoLast;
                          rec := gtvBank.DataController.RecordCount-1;
                          //ShowMessage(inttostr(rec));
                          lastID := vartostr(gtvBank.DataController.GetValue(rec, gtvBankNoBank.Index));
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

procedure TfrmTransaksiBank.edCabangPropertiesChange(Sender: TObject);
begin
     with dmDB do
          begin
               STRSQL := 'select * from coa_detail where id_cabang = ''' +
                         vartostr(edCabang.EditValue) + '''';
               PREPARE_CARI;
          end;
end;

procedure TfrmTransaksiBank.edNoRekPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     if ((edNoRek.EditValue = NULL) or (edNoRek.EditValue = '')) then
        begin
             if ((DisplayValue = NULL) or (DisplayValue = '')) then
                DisplayValue := '(NONE)';
             edNoRek.EditValue := DisplayValue;
             edNoRek.PostEditValue;
        end;

     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('SELECT id_bank FROM rekening ' +
                                 'WHERE no_rek = ''' + edNoRek.EditValue + '''');
               qrySearch.Open;
               qrySearch.First;

               if (not qrySearch.IsEmpty) then
                  begin
                       if (qrySearch.Fields[0].AsString <> '') then
                          edIDBank.EditValue := qrySearch.Fields[0].AsString
                       else
                           edIDBank.EditValue := 'NONE';
                       edIDBank.PostEditValue;
                  end;
          end;
end;

procedure TfrmTransaksiBank.FormCreate(Sender: TObject);
begin
    edTglBank.EditValue := Date;
    TR_ID := 'BANK';
    TR_NUMBER := '001';
    TR_NO := '0001';
    USERAPP := frmMain.APPUSER;
end;

procedure TfrmTransaksiBank.FormShow(Sender: TObject);
begin
     with dmDB do
          begin
               STRSQL := 'select * from coa_detail where id_cabang = ''' + '1' + '''';
               PREPARE_CARI;

          end;
end;

procedure TfrmTransaksiBank.gtvBankTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
    if (AValue = NULL) then
        begin
            total := 0;
        end
    else
        begin
            total := AValue;
        end;
end;

procedure TfrmTransaksiBank.clearFrom();
begin
    edNoBuktiBank.Clear;
    edTglBank.Date := date;
    edStatus.Clear;
    if (TAG_FROM = 'BENGKEL') then
        begin
             //edNoRek.Clear;
             //edIDBank.Clear;
             edCabang.EditValue := '2';
        end
    else
        begin
             edNoRek.Clear;
             edIDBank.Clear;
        end;



    edCOA.Clear;
    edKeterangan.Clear;
    edJumlah.EditValue  := 0;

    gtvBank.DataController.SelectAll;
    gtvBank.DataController.DeleteSelection;

    edCOA.Enabled := True;
    edKeterangan.Enabled  := True;
    edJumlah.Enabled  := True;

    btnTambah.Enabled := True;
    btnClear.Enabled  := True;
end;

procedure TfrmTransaksiBank.btnBrowseClick(Sender: TObject);
var
   idBank : String;
begin
    idBank := vartostr(edNoRek.EditValue);
    clearFrom;
    gtvBank.OptionsView.Navigator  := False;
    edNoRek.EditValue := idBank;
    if (edNoRek.Text = '') then
        begin
             ShowMessage('Mohon pilih nomor rekening terlebih dahulu !');
             Exit;
        end;

    with dmDB do
        begin
              qryMaster.Close;
              qryMaster.SQL.Clear;
              qryMaster.SQL.Add('SELECT * FROM bank_mstr WHERE ' +
                                'status <> ''' + 'TEMP' + ''' and no_rek = ''' + vartostr(edNoRek.EditValue) + '''');
              qryMaster.Open;
        end;

    Application.CreateForm(TfrmCariTransaksiBank, frmCariTransaksiBank);
    frmCariTransaksiBank.ShowModal;
end;

procedure TfrmTransaksiBank.btnClearClick(Sender: TObject);
begin
    edCOA.Clear;
    edKeterangan.Clear;
    edJumlah.EditValue  := 0;
end;

procedure TfrmTransaksiBank.btnDeleteClick(Sender: TObject);
var
    no_reff : string;
begin
    with dmDB do
        begin
            if (MessageDlg('Anda yakin untuk menghapus bukti kas ini?', mtConfirmation, mbOKCancel, 0) = mrOK) then
                begin
                    qrySearch.Close;
                    qrySearch.SQL.Clear;
                    qrySearch.SQL.Add('SELECT notes FROM bank_mstr WHERE ' +
                                      'id_transaksi = ''' + edNoBuktiBank.Text + ''' AND ' +
                                      'notes LIKE ''' + 'PENCAIRAN%' + '''');
                    qrySearch.Open;

                    if (not qrySearch.IsEmpty) then
                          begin
                                no_reff := Copy(qrySearch.Fields[0].AsString, length(qrySearch.Fields[0].AsString) - 12, 13);

                                qryExec.SQL.Clear;
                                qryExec.SQL.Add('UPDATE cek_giro_mstr SET ' +
                                                'cair = ''' + 'N' + ''', ' +
                                                'tgl_cair = ''' + '2011-01-01' + ''', ' +
                                                'user_id = ''' + USERAPP + ''' ' +
                                                'Where id_transaksi = ''' + no_reff + '''');
                                qryExec.ExecSQL;

                                qryExec.SQL.Clear;
                                qryExec.SQL.Add('UPDATE cek_giro_detail SET ' +
                                                'cair = ''' + 'N' + ''', ' +
                                                'tgl_cair = ''' + '2011-01-01' + ''' ' +
                                                'Where id_transaksi = ''' + no_reff + '''');
                                qryExec.ExecSQL;
                          end;

                    //hapus master
                    qryExec.SQL.Clear;
                    qryExec.SQL.Add('DELETE FROM bank_mstr ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiBank.Text + '''');
                    qryExec.ExecSQL;

                    //hapus detail
                    qryExec.SQL.Clear;
                    qryExec.SQL.Add('DELETE FROM bank_detail ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiBank.Text + '''');
                    qryExec.ExecSQL;

                    clearFrom;
                end;
      end;
end;

procedure TfrmTransaksiBank.btnNewClick(Sender: TObject);
begin
    TR_PERIODE := FormatDateTime('ddmmyy', Date);
    gtvBank.OptionsView.Navigator  := True;

    with dmDB do
        begin
             if(btnNew.Tag = 0) then
                 begin
                     clearFrom;

                     TR_KAS := CreateNewAutoNum();
                     edNoBuktiBank.Text := TR_KAS;

                     qryExec.SQL.Clear;
                     qryExec.SQL.Add('INSERT INTO bank_mstr VALUES(' +
                                     '''' + edNoBuktiBank.Text + ''' , ' +
                                     '''' + FormatDateTime('yyyy-mm-dd', edTglBank.EditValue) + ''' , ' +
                                     '''' + VarToStr(edIDBank.EditValue) + ''' , ' +
                                     '''' + VarToStr(edNoRek.EditValue) + ''' , ' +
                                     '''' + '0' + ''' , ' +
                                     '''' + 'TEMP' + ''' , ' +
                                     '''' + USERAPP + ''' , ' +
                                     '''' + '' + ''' , ' +
                                     '''' + '' + ''')');
                     qryExec.ExecSQL;

                     btnNew.Tag := 1;
                     btnNew.Caption := 'CANCEL';
                 end
             else
             if(btnNew.Tag = 1) then
                 begin
                      if (MessageDlg('Anda yakin untuk membatalkan bukti kas ini?', mtConfirmation, mbOKCancel, 0) = mrOK) then
                          begin
                              qryExec.Sql.Clear;
                              qryExec.Sql.Add('DELETE FROM bank_mstr ' +
                                              'WHERE id_transaksi = ''' +  edNoBuktiBank.Text + ''' AND ' +
                                              'status = ''' + 'TEMP' + '''');
                              qryExec.ExecSql;

                              btnNew.Tag := 0;
                              btnNew.Caption := 'NEW';

                              clearFrom;
                          end;
                 end;
        end;
end;

procedure TfrmTransaksiBank.btnPrintClick(Sender: TObject);
var
    bukti : string;
begin
    btnSave.Click;

    with dmDB do
        begin
            qryPrintMaster.Close;
            qryPrintMaster.SQL.Clear;
            qryPrintMaster.SQL.Add('SELECT * FROM bank_mstr ' +
                                   'WHERE id_transaksi = ''' + edNoBuktiBank.Text + '''');
            qryPrintMaster.open;

            if(qryPrintMaster.Fields[3].asString = 'MASUK' ) then
                bukti := 'BUKTI BANK MASUK'
            else
                bukti := 'BUKTI BANK KELUAR';

            qryPrintDetail.Close;
            qryPrintDetail.SQL.Clear;
            qryPrintDetail.SQL.Add('SELECT * FROM bank_detail ' +
                                   'WHERE id_transaksi = ''' + edNoBuktiBank.Text + '''');
            qryPrintDetail.open;

            Application.CreateForm(TfrmPrintBB, frmPrintBB);
            frmPrintBB.qrlBank.Caption  := qryPrintMaster.Fields[2].AsString + ' ' + qryPrintMaster.Fields[3].AsString;
            frmPrintBB.qrpPrintBB.Preview;
        end;
end;

procedure TfrmTransaksiBank.btnSaveClick(Sender: TObject);
var
    i : integer;
begin
    with dmDB do
        begin
            if(edNoBuktiBank.EditValue = NULL) then
                begin
                     ShowMessage('Bukti Bank Masih Kosong.');
                     Exit;
                end;

            if(edStatus.EditValue = NULL) then
                begin
                     ShowMessage('Status Masih Kosong.');
                     Exit;
                end;


            qryExec.SQL.Clear;
            qryExec.SQL.Add('UPDATE bank_mstr SET ' +
                            'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglBank.Date) + ''' , ' +
                            'id_bank = ''' + VarToStr(edIDBank.EditValue) + ''', ' +
                            'no_rek = ''' + VarToStr(edNoRek.EditValue) + ''', ' +
                            'total = ''' + FloatToStr(total) + ''' , ' +
                            'status = ''' + VarToStr(edStatus.EditValue) + ''', ' +
                            'user_id = ''' + USERAPP + ''' ' +
                            'Where id_transaksi = ''' + edNoBuktiBank.Text + '''');
            qryExec.ExecSQL;

            qrySearch.Close;
            qrySearch.SQL.Clear;
            qrySearch.SQL.Add('SELECT * FROM bank_detail ' +
                              'WHERE id_transaksi = ''' + edNoBuktiBank.Text + '''');
            qrySearch.Open;

            if(qrySearch.IsEmpty) then
                begin
                    gtvBank.DataController.PostEditingData;
                    gtvBank.DataController.Post;

                    gtvBank.DataController.GotoFirst;

                    for i:= 0 to gtvBank.DataController.RecordCount - 1 do
                         begin
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('INSERT INTO bank_detail VALUES(' +
                                               '''' + ''  + ''' , ' +
                                               '''' + edNoBuktiBank.Text + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglBank.EditValue) + ''' , ' +
                                               '''' + vartostr(gtvBank.DataController.GetValue(i, gtvBankNoBank.Index)) + ''' , ' +
                                               '''' + vartostr(gtvBank.DataController.GetValue(i, gtvBankCOA.Index)) + ''' , ' +
                                               '''' + vartostr(gtvBank.DataController.GetValue(i, gtvBankKeterangan.Index)) + ''' , ' +
                                               '''' + vartostr(gtvBank.DataController.GetValue(i, gtvBankJumlah.Index)) + ''' , ' +
                                               '''' + vartostr(edStatus.EditValue) + ''' , ' +
                                               '''' + VarToStr(edIDBank.EditValue) + ''' , ' +
                                               '''' + VarToStr(edNoRek.EditValue) + ''' , ' +
                                               '''' + '' + ''' , ' +
                                               '''' + '' + ''')');
                               qryExec.ExecSQL;

                               gtvBank.DataController.GotoNext;
                         end;
                end
            else
                begin
                    qryExec.SQL.Clear;
                    qryExec.SQL.Add('DELETE FROM bank_detail ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiBank.Text + '''');
                    qryExec.ExecSQL;

                    gtvBank.DataController.PostEditingData;
                    gtvBank.DataController.Post;

                    gtvBank.DataController.GotoFirst;

                    for i:= 0 to gtvBank.DataController.RecordCount - 1 do
                         begin
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('INSERT INTO bank_detail VALUES(' +
                                               '''' + ''  + ''' , ' +
                                               '''' + edNoBuktiBank.Text + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglBank.EditValue) + ''' , ' +
                                               '''' + vartostr(gtvBank.DataController.GetValue(i, gtvBankNoBank.Index)) + ''' , ' +
                                               '''' + vartostr(gtvBank.DataController.GetValue(i, gtvBankCOA.Index)) + ''' , ' +
                                               '''' + vartostr(gtvBank.DataController.GetValue(i, gtvBankKeterangan.Index)) + ''' , ' +
                                               '''' + vartostr(gtvBank.DataController.GetValue(i, gtvBankJumlah.Index)) + ''' , ' +
                                               '''' + vartostr(edStatus.EditValue) + ''' , ' +
                                               '''' + VarToStr(edIDBank.EditValue) + ''' , ' +
                                               '''' + VarToStr(edNoRek.EditValue) + ''' , ' +
                                               '''' + '' + ''' , ' +
                                               '''' + '' + ''')');
                               qryExec.ExecSQL;

                               gtvBank.DataController.GotoNext;
                         end;
                end;
        end;

    btnNew.Caption := 'NEW';
    btnNew.Tag := 0;

    gtvBank.OptionsView.Navigator  := False;
end;

procedure TfrmTransaksiBank.btnTambahClick(Sender: TObject);
var
    newRec : integer;
begin
      if(edNoBuktiBank.EditValue = NULL) then
          begin
             ShowMessage('Bukti Bank Masih Kosong.');
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

      TR_Bulan := FormatDateTime('mm', edTglBank.EditValue);

      if(edStatus.EditValue = 'MASUK') then
          begin
              TR_IDKAS := 'BBM';
          end
      else
          begin
              TR_IDKAS := 'BBK';
          end;

      TR_NOKAS  := CreateNewNoKas();
      newRec    := gtvBank.DataController.InsertRecord(gtvBank.DataController.RecordCount);

      gtvBank.DataController.SetValue(newRec, gtvBankNoBank.Index, TR_NOKAS);
      gtvBank.DataController.SetValue(newRec, gtvBankCOA.Index, edCOA.EditValue);
      gtvBank.DataController.SetValue(newRec, gtvBankKeterangan.Index, edKeterangan.Text);
      gtvBank.DataController.SetValue(newRec, gtvBankJumlah.Index, edJumlah.EditValue);

      gtvBank.DataController.PostEditingData;
      gtvBank.DataController.Post;

      gtvBank.DataController.FocusedRecordIndex := gtvBank.DataController.RecordCount-1;

      edCOA.Clear;
      edKeterangan.Clear;
      edJumlah.EditValue := 0;
end;

end.
