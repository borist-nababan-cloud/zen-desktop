unit FTransaksiKas;

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
  TfrmTransaksiKas = class(TForm)
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
    edCabang: TcxLookupComboBox;
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
    procedure edCabangPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TR_ID, TR_PERIODE, TR_NUMBER, TR_KAS, USERAPP,
    TR_Bulan, TR_NO, TR_NOKAS, TR_IDKAS: string;
    total  : Double;
    function CreateNewAutoNum: string;
    function CreateNewNoKas: string;
    procedure clearFrom();
  end;

var
  frmTransaksiKas: TfrmTransaksiKas;

implementation

uses FdmDB, FMenuMain, FPrintBMK, FCariTransaksiKas;

{$R *.dfm}

function TfrmTransaksiKas.CreateNewAutoNum: String;
var
    lastID, strTmpNum, strNum, NewID: string;
    intTmpNum, intNum: integer;
begin
    with dmDB do
        begin
              NewID := TR_ID + '.' + TR_PERIODE + '.';

              qrySearch.Close;
              qrySearch.SQL.Clear;
              qrySearch.SQL.Add('SELECT id_transaksi FROM kas_kecil_mstr ' +
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

function TfrmTransaksiKas.CreateNewNoKas: String;
var
  lastID, strTmpNum, strNum, NewID: string;
  intTmpNum, intNum, rec: integer;
begin
      with dmDB do
          begin
                NewID := TR_IDKAS + '/' + TR_Bulan + '/';
                if(gtvKas.DataController.RecordCount = 0 ) then
                    begin
                         qrySearch.Close;
                         qrySearch.SQL.Clear;
                         qrySearch.SQL.Add('SELECT id_transaksi FROM kas_kecil_detail ' +
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

procedure TfrmTransaksiKas.edCabangPropertiesChange(Sender: TObject);
begin
     with dmDB do
          begin
               STRSQL := 'select * from coa_detail where id_cabang = ''' +
                         vartostr(edCabang.EditValue) + '''';
               PREPARE_CARI;
          end;
end;

procedure TfrmTransaksiKas.FormCreate(Sender: TObject);
begin
    edTglKas.EditValue := Date;
    TR_ID := 'KK';
    TR_NUMBER := '001';
    TR_NO := '0001';
    USERAPP := frmMain.APPUSER;
end;

procedure TfrmTransaksiKas.FormShow(Sender: TObject);
begin
     with dmDB do
          begin
               STRSQL := 'select * from coa_detail where id_cabang = ''' + '1' + '''';
               PREPARE_CARI;
          end;
end;

procedure TfrmTransaksiKas.gtvKasTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
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

procedure TfrmTransaksiKas.clearFrom();
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

    btnTambah.Enabled := True;
    btnClear.Enabled  := True;
end;

procedure TfrmTransaksiKas.btnBrowseClick(Sender: TObject);
begin
    clearFrom;
    gtvKas.OptionsView.Navigator  := False;
    with dmDB do
        begin
              qryMaster.Close;
              qryMaster.SQL.Clear;
              qryMaster.SQL.Add('SELECT * FROM kas_kecil_mstr WHERE ' +
                                'status <> ''' + 'TEMP' + '''');
              qryMaster.Open;
        end;

    Application.CreateForm(TfrmCariTransaksiKas, frmCariTransaksiKas);
    frmCariTransaksiKas.ShowModal;
end;

procedure TfrmTransaksiKas.btnClearClick(Sender: TObject);
begin
    edCOA.Clear;
    edKeterangan.Clear;
    edJumlah.EditValue  := 0;
end;

procedure TfrmTransaksiKas.btnDeleteClick(Sender: TObject);
var
    no_reff : string;
begin
    with dmDB do
        begin
            if (MessageDlg('Anda yakin untuk menghapus bukti kas ini?', mtConfirmation, mbOKCancel, 0) = mrOK) then
                begin
                    qrySearch.Close;
                    qrySearch.SQL.Clear;
                    qrySearch.SQL.Add('SELECT notes FROM kas_kecil_mstr WHERE ' +
                                      'id_transaksi = ''' + edNoBuktiKas.Text + ''' AND ' +
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
                    qryExec.SQL.Add('DELETE FROM kas_kecil_mstr ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiKas.Text + '''');
                    qryExec.ExecSQL;

                    //hapus detail
                    qryExec.SQL.Clear;
                    qryExec.SQL.Add('DELETE FROM kas_kecil_detail ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiKas.Text + '''');
                    qryExec.ExecSQL;

                    clearFrom;
                    gtvKas.OptionsView.Navigator  := True;
                end;
      end;
end;

procedure TfrmTransaksiKas.btnNewClick(Sender: TObject);
begin
    TR_PERIODE := FormatDateTime('ddmmyy', Date);
    gtvKas.OptionsView.Navigator  := True;

    with dmDB do
        begin
             if(btnNew.Tag = 0) then
                 begin
                     clearFrom;

                     TR_KAS := CreateNewAutoNum();
                     edNoBuktiKas.Text := TR_KAS;

                     qryExec.SQL.Clear;
                     qryExec.SQL.Add('INSERT INTO kas_kecil_mstr VALUES(' +
                                     '''' + edNoBuktiKas.Text + ''' , ' +
                                     '''' + FormatDateTime('yyyy-mm-dd', edTglKas.EditValue) + ''' , ' +
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
                              qryExec.Sql.Add('DELETE FROM kas_kecil_mstr ' +
                                              'WHERE id_transaksi = ''' +  edNoBuktiKas.Text + ''' AND ' +
                                              'status = ''' + 'TEMP' + '''');
                              qryExec.ExecSql;

                              btnNew.Tag := 0;
                              btnNew.Caption := 'NEW';

                              clearFrom;
                          end;
                 end;
        end;
end;

procedure TfrmTransaksiKas.btnPrintClick(Sender: TObject);
var
    bukti : string;
begin
    btnSave.Click;

    with dmDB do
        begin
            qryPrintMaster.Close;
            qryPrintMaster.SQL.Clear;
            qryPrintMaster.SQL.Add('SELECT * FROM kas_kecil_mstr ' +
                                   'WHERE id_transaksi = ''' + edNoBuktiKas.Text + '''');
            qryPrintMaster.open;

            if(qryPrintMaster.Fields[3].asString = 'MASUK' ) then
                bukti := 'BUKTI KAS KECIL MASUK'
            else
                bukti := 'BUKTI KAS KECIL KELUAR';

            qryPrintDetail.Close;
            qryPrintDetail.SQL.Clear;
            qryPrintDetail.SQL.Add('SELECT * FROM kas_kecil_detail ' +
                                   'WHERE id_transaksi = ''' + edNoBuktiKas.Text + '''');
            qryPrintDetail.open;

            Application.CreateForm(TfrmPrintBMK, frmPrintBMK);
            frmPrintBMK.qrpPrintBMK.Preview;
        end;
end;

procedure TfrmTransaksiKas.btnSaveClick(Sender: TObject);
var
    i : integer;
begin
    with dmDB do
        begin
            if(edNoBuktiKas.EditValue = NULL) then
                begin
                     ShowMessage('Bukti Kas Kecil Masih Kosong.');
                     Exit;
                end;

            if(edStatus.EditValue = NULL) then
                begin
                     ShowMessage('Status Masih Kosong.');
                     Exit;
                end;


            qryExec.SQL.Clear;
            qryExec.SQL.Add('UPDATE kas_kecil_mstr SET ' +
                            'tanggal = ''' + FormatDateTime('yyyy-mm-dd', edTglKas.Date) + ''' , ' +
                            'total = ''' + FloatToStr(total) + ''' , ' +
                            'status = ''' + VarToStr(edStatus.EditValue) + ''', ' +
                            'user_id = ''' + USERAPP + ''' ' +
                            'Where id_transaksi = ''' + edNoBuktiKas.Text + '''');
            qryExec.ExecSQL;

            qrySearch.Close;
            qrySearch.SQL.Clear;
            qrySearch.SQL.Add('SELECT * FROM kas_kecil_detail ' +
                              'WHERE id_transaksi = ''' + edNoBuktiKas.Text + '''');
            qrySearch.Open;

            if(qrySearch.IsEmpty) then
                begin
                    gtvKas.DataController.PostEditingData;
                    gtvKas.DataController.Post;

                    gtvKas.DataController.GotoFirst;

                    for i:= 0 to gtvKas.DataController.RecordCount - 1 do
                         begin
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('INSERT INTO kas_kecil_detail VALUES(' +
                                               '''' + ''  + ''' , ' +
                                               '''' + edNoBuktiKas.Text + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglKas.EditValue) + ''' , ' +
                                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasNoKas.Index)) + ''' , ' +
                                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasCOA.Index)) + ''' , ' +
                                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasKeterangan.Index)) + ''' , ' +
                                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasJumlah.Index)) + ''' , ' +
                                               '''' + vartostr(edStatus.EditValue) + ''' , ' +
                                               '''' + '' + ''' , ' +
                                               '''' + '' + ''')');
                               qryExec.ExecSQL;

                               gtvKas.DataController.GotoNext;
                         end;
                end
            else
                begin
                    qryExec.SQL.Clear;
                    qryExec.SQL.Add('DELETE FROM kas_kecil_detail ' +
                                    'WHERE id_transaksi = ''' + edNoBuktiKas.Text + '''');
                    qryExec.ExecSQL;

                    gtvKas.DataController.PostEditingData;
                    gtvKas.DataController.Post;

                    gtvKas.DataController.GotoFirst;

                    for i:= 0 to gtvKas.DataController.RecordCount - 1 do
                         begin
                               qryExec.SQL.Clear;
                               qryExec.SQL.Add('INSERT INTO kas_kecil_detail VALUES(' +
                                               '''' + ''  + ''' , ' +
                                               '''' + edNoBuktiKas.Text + ''' , ' +
                                               '''' + FormatDateTime('yyyy-mm-dd', edTglKas.EditValue) + ''' , ' +
                                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasNoKas.Index)) + ''' , ' +
                                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasCOA.Index)) + ''' , ' +
                                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasKeterangan.Index)) + ''' , ' +
                                               '''' + vartostr(gtvKas.DataController.GetValue(i, gtvKasJumlah.Index)) + ''' , ' +
                                               '''' + vartostr(edStatus.EditValue) + ''' , ' +
                                               '''' + '' + ''' , ' +
                                               '''' + '' + ''')');
                               qryExec.ExecSQL;

                               gtvKas.DataController.GotoNext;
                         end;
                end;
        end;

    btnNew.Caption := 'NEW';
    btnNew.Tag := 0;

    gtvKas.OptionsView.Navigator  := False;
end;

procedure TfrmTransaksiKas.btnTambahClick(Sender: TObject);
var
    newRec : integer;
begin
      if(edNoBuktiKas.EditValue = NULL) then
          begin
             ShowMessage('Bukti Kas Kecil Masih Kosong.');
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
              TR_IDKAS := 'BKM';
          end
      else
          begin
              TR_IDKAS := 'BKK';
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
end;

end.
