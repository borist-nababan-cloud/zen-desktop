unit FPaketGCInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxLabel, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, cxMaskEdit, cxDropDownEdit, cxCalc, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxClasses,
  cxGridLevel, cxGrid, Vcl.Menus, cxButtons, MyAccess, XSuperJSON, XSuperObject;

type
  TfrmPaketGCInput = class(TForm)
    lblJudulAtas: TLabel;
    cxLabel1: TcxLabel;
    edOutletID: TcxTextEdit;
    edKode: TcxTextEdit;
    edHargaJual: TcxCalcEdit;
    cxLabel2: TcxLabel;
    edExpired: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvAvailble: TcxGridTableView;
    gtvAvailbleNoGC: TcxGridColumn;
    gtvAvailbleNamaMenu: TcxGridColumn;
    gtvAvailbleHarga: TcxGridColumn;
    cxGrid2: TcxGrid;
    tvList: TcxGridTableView;
    tvListNoGC: TcxGridColumn;
    tvListNamaMenu: TcxGridColumn;
    tvListHarga: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    btnSave: TcxButton;
    cxLabel4: TcxLabel;
    edItems: TcxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure tvListTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
  private
    { Private declarations }
    qryCari, qryFind, qrySearch, qryExec : TMyQuery;
    procedure UpdateDetails;
  public
    { Public declarations }
    procedure Cari_Clear_List();
  end;

var
  frmPaketGCInput: TfrmPaketGCInput;

implementation

{$R *.dfm}

uses FMain, FdmDB, FGiftCertificateMaster;

procedure TfrmPaketGCInput.btnSaveClick(Sender: TObject);
var
   keterangan, kodePaket, NoGC, namaMenu, strJson : String;
   i, recSel, totItems, Harga, btnSelected, panjang : Integer;
   jSonItem : XSuperObject.ISuperObject;
begin
   if (edKode.Text = '') then
    begin
      ShowMessage('Please Input Kode Packet First');
      Exit;
    end;
   kodePaket := edOutletID.Text + edKode.Text;
   panjang := Length(kodePaket);
   if (panjang >= 50) then
     begin
       ShowMessage('Kode Paket > 50 Karakter !!');
       Exit;
     end;
   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);

   qryExec.SQL.Clear;
   qryExec.SQL.Add('update gc_detail set ' +
      'paket_number = ''' + '' + ''',' +
      'notes = ' + QuotedStr(keterangan) +
      ' where paket_number = ''' + kodePaket + '''');
   qryExec.ExecSQL;

   //ShowMessage(kodePaket);
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select paket_number from gc_master where paket_number = ''' +
       kodePaket + '''');
   qryCari.Open;
   if (qryCari.IsEmpty) then
     begin
       qryExec.SQL.Clear;
       qryExec.SQL.Add('insert into gc_master values(' +
           '''' + kodePaket + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', edExpired.Date) + ''',' +
           '''' + FloatToStr(edHargaJual.EditValue) + ''',' +
           '''' + IntToStr(edItems.EditValue) + ''',' +
           '''' + 'N' + ''',' +
           '''' + 'N' + ''',' +
           QuotedStr(keterangan) + ');');
       qryExec.ExecSQL;
     end
   else if (NOT qryCari.IsEmpty) then
     begin
       btnSelected := MessageDlg('Data Paket ' + kodePaket +
          'Sudah Ada' + #13#13 + ' Apakah Anda akan mengupdate data sebelumnya?',mtConfirmation,mbOKCancel, 0);
       if (btnSelected = mrCancel) then Exit;
       qryExec.SQL.Clear;
       qryExec.SQL.Add('update gc_master set ' +
           'tanggal = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
           'expired_date = ''' + FormatDateTime('yyyy-MM-dd', edExpired.Date) + ''',' +
           'harga_jual = ''' + FloatToStr(edHargaJual.EditValue) + ''',' +
           'total_items = ''' + IntToStr(edItems.EditValue) + ''',' +
           'aktif = ''' + 'N' + ''',' +
           'notes = ' + QuotedStr(keterangan) +
           ' where paket_number = ''' + kodePaket + ''';');
       qryExec.ExecSQL;
     end;

   {update main menu}
   jSonItem :=  XSuperObject.SO('{}');
   jSonItem.S['keterangan'] := '';
   jSonItem.S['cetak'] := 'N';
   strJson := jSonItem.AsJSON(False, False);
   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select menu_id from main_menu where menu_id = ''' +
      kodePaket + '''');
   qryFind.Open;
   if (qryFind.IsEmpty) then
     begin
       qryExec.SQL.Clear;
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
       qryExec.ExecSQL;
     end
   else if (NOT qryFind.IsEmpty) then
     begin
        qryExec.SQL.Clear;
        qryExec.SQL.Add('update main_menu set ' +
                    'type_menu = ''' + 'BG' + ''',' +
                    'jenis_jasa_id = ''' + 'BG' + ''',' +
                    'nama_menu = ' + QuotedStr(kodePaket) + ',' +
                    'harga = ''' + FloatToStr(edHargaJual.EditValue) + ''',' +
                    'lama = ''' + IntToStr(0) + ''','  +
                    'disc_hh = ''' + FloatToStr(0) + ''',' +
                    'disc_normal = ''' + FloatToStr(0) + ''',' +
                    'harga_hh = ''' + FloatToStr(edHargaJual.EditValue) + ''',' +
                    'harga_normal = ''' + FloatToStr(edHargaJual.EditValue) + ''',' +
                    'notes = ' + QuotedStr(strJson) + ',' +
                    'aktif = ''' + 'N' + ''',' +
                    'lastuser = ''' + frmMain.USERAPPS + ''',' +
                    'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
                    'where menu_id = ''' + kodePaket + '''');
        qryExec.ExecSQL;
     end;
   {end update main menu}
   if (tvList.DataController.RecordCount <= 0) then Exit;
   qryExec.SQL.Clear;
   tvList.DataController.GotoFirst;

   for i := 0 to tvList.DataController.RecordCount-1 do
     begin
        recSel := tvList.DataController.GetFocusedRecordIndex;
        if (recSel < 0) then Exit;
        NoGC := vartostr(tvList.DataController.GetValue(recSel, tvListNoGC.Index));
        {namaMenu := vartostr(tvList.DataController.GetValue(recSel, tvListNamaMenu.Index));
        Harga := tvList.DataController.GetValue(recSel, tvListHarga.Index);}
        qryExec.SQL.Add('update gc_detail set ' +
            'paket_number = ''' + kodePaket + ''',' +
            'notes = ' + QuotedStr(keterangan) + ',' +
            'tanggal = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
            'expired_date = ''' + FormatDateTime('yyyy-MM-dd', edExpired.Date) + ''' ' +
            'where gc_number = ''' + NoGC + ''';');
        tvList.DataController.GotoNext;
     end;
   qryExec.ExecSQL;
   frmGiftCertificateMaster.qryMaster.Refresh;
   frmGiftCertificateMaster.qryDetail.Refresh;
   frmGiftCertificateMaster.gtbMaster.DataController.Refresh;
   frmGiftCertificateMaster.tbDetails.DataController.Refresh;
   ShowMessage('Update Data Master Finish');
   frmPaketGCInput.Close;
end;

procedure TfrmPaketGCInput.Cari_Clear_List;
var
  i, newRec, recSel : Integer;
  kodePaket : String;
begin
   gtvAvailble.DataController.SelectAll;
   gtvAvailble.DataController.DeleteSelection;
   tvList.DataController.SelectAll;
   tvList.DataController.DeleteSelection;

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select gc_number, nama_menu, harga_jual from gc_detail ' +
       'where paket_number = ''' + '' + ''' ' +
       'and aktif = ''' + 'Y' + ''' ORDER BY gc_number ASC');
   qryCari.Open;
   qryCari.First;
   for i := 0 to qryCari.RecordCount-1 do
     begin
        newRec := gtvAvailble.DataController.InsertRecord(gtvAvailble.DataController.RecordCount);
        gtvAvailble.DataController.SetValue(newRec, gtvAvailbleNoGC.Index, qryCari.Fields[0].AsString);
        gtvAvailble.DataController.SetValue(newRec, gtvAvailbleNamaMenu.Index, qryCari.Fields[1].AsString);
        gtvAvailble.DataController.SetValue(newRec, gtvAvailbleHarga.Index, qryCari.Fields[2].AsFloat);
        gtvAvailble.DataController.PostEditingData;
        gtvAvailble.DataController.Post(True);
        qryCari.Next;
        Application.ProcessMessages;
     end;

   kodePaket := edOutletID.Text + edKode.Text;
   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select gc_number, nama_menu, harga_jual from gc_detail ' +
       'where paket_number = ''' + kodePaket + ''' ' +
       'and terjual = ''' + 'N' + ''' ORDER BY gc_number ASC');
   qryFind.Open;
   qryFind.First;
   for i := 0 to qryFind.RecordCount-1 do
     begin
        newRec := tvList.DataController.InsertRecord(tvList.DataController.RecordCount);
        tvList.DataController.SetValue(newRec, tvListNoGC.Index, qryFind.Fields[0].AsString);
        tvList.DataController.SetValue(newRec, tvListNamaMenu.Index, qryFind.Fields[1].AsString);
        tvList.DataController.SetValue(newRec, tvListHarga.Index, qryFind.Fields[2].AsFloat);
        tvList.DataController.PostEditingData;
        tvList.DataController.Post(True);
        qryFind.Next;
        Application.ProcessMessages;
     end;

end;

procedure TfrmPaketGCInput.cxButton1Click(Sender: TObject);
begin
   Cari_Clear_List;
end;

procedure TfrmPaketGCInput.cxButton3Click(Sender: TObject);
var
  i, newRec, recSel : Integer;
  NoGC, namaMenu, Harga : String;
  isFind : Boolean;
begin
  if (edKode.Text = '') then
    begin
      ShowMessage('Please Input Kode Packet First');
      Exit;
    end;
  recSel := gtvAvailble.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  NoGC := vartostr(gtvAvailble.DataController.GetValue(recSel, gtvAvailbleNoGC.Index));
  namaMenu := vartostr(gtvAvailble.DataController.GetValue(recSel, gtvAvailbleNamaMenu.Index));
  Harga := gtvAvailble.DataController.GetValue(recSel, gtvAvailbleHarga.Index);
  tvList.DataController.GotoFirst;
  isFind := tvList.DataController.Search.Locate(tvListNoGC.Index, NoGC);
  if (isFind = True) then
      begin
        ShowMessage('No GC is On List');
        gtvAvailble.DataController.DeleteRecord(recSel);
      end
  else if (isFind = False) then
    begin
      newRec := tvList.DataController.InsertRecord(tvList.DataController.RecordCount);
        tvList.DataController.SetValue(newRec, tvListNoGC.Index, NoGC);
        tvList.DataController.SetValue(newRec, tvListNamaMenu.Index, namaMenu);
        tvList.DataController.SetValue(newRec, tvListHarga.Index, Harga);
        tvList.DataController.PostEditingData;
        tvList.DataController.Post(True);
        gtvAvailble.DataController.DeleteRecord(recSel);
    end;
end;

procedure TfrmPaketGCInput.cxButton4Click(Sender: TObject);
var
  i, newRec, recSel : Integer;
  NoGC, namaMenu, Harga : String;
  isFind : Boolean;
begin
  if (edKode.Text = '') then
    begin
      ShowMessage('Please Input Kode Packet First');
      Exit;
    end;
  recSel := tvList.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  NoGC := vartostr(tvList.DataController.GetValue(recSel, tvListNoGC.Index));
  namaMenu := vartostr(tvList.DataController.GetValue(recSel, tvListNamaMenu.Index));
  Harga := tvList.DataController.GetValue(recSel, tvListHarga.Index);
  gtvAvailble.DataController.GotoFirst;
  isFind := gtvAvailble.DataController.Search.Locate(gtvAvailbleNoGC.Index, NoGC);
  if (isFind = True) then
      begin
        tvList.DataController.DeleteRecord(recSel);
      end
  else if (isFind = False) then
    begin
        newRec := gtvAvailble.DataController.InsertRecord(gtvAvailble.DataController.RecordCount);
        gtvAvailble.DataController.SetValue(newRec, gtvAvailbleNoGC.Index, NoGC);
        gtvAvailble.DataController.SetValue(newRec, gtvAvailbleNamaMenu.Index, namaMenu);
        gtvAvailble.DataController.SetValue(newRec, gtvAvailbleHarga.Index, Harga);
        gtvAvailble.DataController.PostEditingData;
        gtvAvailble.DataController.Post(True);
        tvList.DataController.DeleteRecord(recSel);
    end;
end;

procedure TfrmPaketGCInput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryCari.Free;
   qrySearch.Free;
   qryFind.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmPaketGCInput.FormCreate(Sender: TObject);
begin
   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from empty_x');
   qrySearch.Active := true;

   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from empty_x');
   qryCari.Active := true;

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.dbInternal;
   qryFind.SQL.Add('select * from empty_x');
   qryFind.Active := true;

   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from empty_x');
   qryExec.Active := true;
end;

procedure TfrmPaketGCInput.FormShow(Sender: TObject);
begin
   Cari_Clear_List;
end;

procedure TfrmPaketGCInput.tvListTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  if (AValue = null) then edItems.EditValue := 0
  else if (AValue <> null) then edItems.EditValue := AValue;
end;

procedure TfrmPaketGCInput.UpdateDetails;
var
  i, recSel : Integer;
  noGCDetails, packCode, keterangan : String;
  qryExecDetail : TMyQuery;

begin
   {qryExecDetail := TMyQuery.Create(Self);
   qryExecDetail.Connection := DMDB.dbInternal;
   qryExecDetail.SQL.Add('select * from empty_x');
   qryExecDetail.Active := true;
   packCode := edOutletID.Text + edKode.Text;
   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
   qryExecDetail.SQL.Clear;
   tvList.DataController.GotoFirst;
   for i := 0 to tvList.DataController.RecordCount - 1 do
     begin
       recSel := tvList.DataController.GetFocusedRecordIndex;
       noGCDetails := vartostr(tvList.DataController.GetValue(recSel, tvListNoGC.Index));
       qryExecDetail.SQL.Add('update gc_detail set ' +
            'paket_number = ''' + packCode + ''',' +
            'notes = ' + QuotedStr(keterangan) + ',' +
            'tanggal = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
            'expired_date = ''' + FormatDateTime('yyyy-MM-dd', edExpired.Date) + ''' ' +
            'where gc_number = ''' + noGCDetails + ''';');
     end;}
end;

end.
