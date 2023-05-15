unit FSearchCustomer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, DBAccess, MyAccess, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, MemDS, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxClasses,
  cxGridLevel, cxGrid, cxDBData, cxGridDBTableView, cxGroupBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TfrmSearchCustomer = class(TForm)
    cxLabel1: TcxLabel;
    edNopolTengah: TcxTextEdit;
    edNopolBelakang: TcxTextEdit;
    btnCari: TcxButton;
    edNopolDepan: TcxTextEdit;
    tblJenis: TMyTable;
    dsTbljenis: TMyDataSource;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    qryList: TMyQuery;
    dsQryList: TMyDataSource;
    tblWarna: TMyTable;
    dsTblWarna: TMyDataSource;
    gtbSearch: TcxGridDBTableView;
    cxGroupBox1: TcxGroupBox;
    btnAddPkb: TcxButton;
    btnSave: TcxButton;
    btnReset: TcxButton;
    btnSelect: TcxButton;
    cxLabel2: TcxLabel;
    edCustCode: TcxTextEdit;
    cxLabel3: TcxLabel;
    edNopol: TcxTextEdit;
    cxLabel4: TcxLabel;
    edAlamat: TcxTextEdit;
    cxLabel5: TcxLabel;
    edkota: TcxTextEdit;
    cxLabel6: TcxLabel;
    edTelp: TcxTextEdit;
    cxLabel7: TcxLabel;
    edEmail: TcxTextEdit;
    cxLabel8: TcxLabel;
    edNPWP: TcxTextEdit;
    edType: TcxLookupComboBox;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    edWarna: TcxLookupComboBox;
    edTglKirim: TcxDateEdit;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    edTahun: TcxTextEdit;
    cxLabel13: TcxLabel;
    edCutNama: TcxTextEdit;
    gtbSearchcodecust: TcxGridDBColumn;
    gtbSearchnopol: TcxGridDBColumn;
    gtbSearchnamacust: TcxGridDBColumn;
    gtbSearchkodetype: TcxGridDBColumn;
    gtbSearchwarna: TcxGridDBColumn;
    cxLabel14: TcxLabel;
    edNoRangka: TcxTextEdit;
    cxLabel15: TcxLabel;
    edNoMesin: TcxTextEdit;
    gtbSearchnorangka: TcxGridDBColumn;
    gtbSearchnomesin: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCariClick(Sender: TObject);
    procedure edNopolTengahKeyPress(Sender: TObject; var Key: Char);
    procedure edNopolBelakangKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelectClick(Sender: TObject);
    procedure btnAddPkbClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edNopolDepanKeyPress(Sender: TObject; var Key: Char);
    procedure edNopolKeyPress(Sender: TObject; var Key: Char);
    procedure edCutNamaKeyPress(Sender: TObject; var Key: Char);
    procedure edAlamatKeyPress(Sender: TObject; var Key: Char);
    procedure edkotaKeyPress(Sender: TObject; var Key: Char);
    procedure edTelpKeyPress(Sender: TObject; var Key: Char);
    procedure edEmailKeyPress(Sender: TObject; var Key: Char);
    procedure edNPWPKeyPress(Sender: TObject; var Key: Char);
    procedure edTypeKeyPress(Sender: TObject; var Key: Char);
    procedure edTahunKeyPress(Sender: TObject; var Key: Char);
    procedure edWarnaKeyPress(Sender: TObject; var Key: Char);
    procedure edTglKirimKeyPress(Sender: TObject; var Key: Char);
    procedure edNoRangkaKeyPress(Sender: TObject; var Key: Char);
    procedure edNoMesinKeyPress(Sender: TObject; var Key: Char);
    procedure edNopolDepanPropertiesChange(Sender: TObject);
    procedure edNopolTengahPropertiesChange(Sender: TObject);
    procedure edNopolBelakangPropertiesChange(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch1, qrySearch2, qrySearch3, qrySearchExec : TMyQuery;
    procedure AddToPKB();
    procedure CariNoPol();
  public
    { Public declarations }
  end;

var
  frmSearchCustomer: TfrmSearchCustomer;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterPKB;

procedure TfrmSearchCustomer.AddToPKB;
begin

end;

procedure TfrmSearchCustomer.CariNoPol;
var
   noPol : String;
begin
   noPol := edNopolDepan.Text + ' ' + edNopolTengah.Text +  ' ' + edNopolBelakang.Text + '%';
   qryList.Close;
   qryList.SQL.Clear;
   qryList.SQL.Add('select codecust, nopol, namacust, kodetype, warna, norangka, nomesin ' +
          'from ben_bengkel_customer where nopol like ' +
          QuotedStr(noPol) + ' ORDER BY codecust ASC LIMIT 100');
   qryList.Open;
   gtbSearch.DataController.Refresh;
end;

procedure TfrmSearchCustomer.btnAddPkbClick(Sender: TObject);
var
  custCode : String;
begin
   if (edCustCode.Text = '') then
      begin
         custCode := frmMain.APP_OUTLETID + '-C-' + FormatDateTime('yyMMddmmhhss', Now);
         edCustCode.Text := custCode;
      end;

   qrySearch1.Close;
   qrySearch1.SQL.Clear;
   qrySearch1.SQL.Add('select codecust from ben_bengkel_customer where codecust = ''' +
       edCustCode.Text + '''');
   qrySearch1.Open;
   if (qrySearch1.IsEmpty) then
     begin
       qrySearchExec.SQL.Clear;
       qrySearchExec.SQL.Add('insert into ben_bengkel_customer values(' +
           '''' + '' + ''',' +
           '''' + edCustCode.Text + ''',' +
           QuotedStr(edNopol.Text) + ',' +
           QuotedStr(edCutNama.Text) + ',' +
           QuotedStr(edAlamat.Text) + ',' +
           QuotedStr(edkota.Text) + ',' +
           QuotedStr(edTelp.Text) + ',' +
           QuotedStr(edNPWP.Text) + ',' +
           QuotedStr(edEmail.Text) + ',' +
           QuotedStr(FormatDateTime('yyyy-MM-dd', edTglKirim.Date)) + ',' +
           QuotedStr(vartostr(edType.EditValue)) + ',' +
           QuotedStr(edWarna.Text) + ',' +
           QuotedStr(edTahun.Text) + ',' +
           QuotedStr(edNoRangka.Text) + ',' +
           QuotedStr(edNoMesin.Text) + ',' +
           QuotedStr('') + ',' +
           QuotedStr(frmMain.USERAPPS) + ',' +
           QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ');');
       qrySearchExec.ExecSQL;

        qrySearch2.Close;
        qrySearch2.SQL.Clear;
        qrySearch2.SQL.Add('select * from ben_bengkel_customer where codecust = ''' +
           edCustCode.Text + '''');
        qrySearch2.Open;
        with frmMasterPKB do
            begin
                edKodeKonsumen.Text := qrySearch2.Fields[1].AsString;
                edPlatNomor.Text := qrySearch2.Fields[2].AsString;
                edNamaKonsumen.Text := qrySearch2.Fields[3].AsString;
                edKirimMobil.date := qrySearch2.Fields[9].AsDateTime;
                edTypeMobil.EditValue := qrySearch2.Fields[10].AsString;
                edWarnaMobil.Text := qrySearch2.Fields[11].AsString;
                edTahunMobil.Text := qrySearch2.Fields[12].AsString;
            end;
        btnReset.Click;
        frmSearchCustomer.Close;

     end
   else if (NOT qrySearch1.IsEmpty) then
     begin
       qrySearchExec.SQL.Clear;
       qrySearchExec.SQL.Add('update ben_bengkel_customer set ' +
           'nopol = ' + QuotedStr(edNopol.Text) + ',' +
           'namacust = ' + QuotedStr(edCutNama.Text) + ',' +
           'alamatcust = ' + QuotedStr(edAlamat.Text) + ',' +
           'kotacust = ' + QuotedStr(edkota.Text) + ',' +
           'telpcust = ' + QuotedStr(edTelp.Text) + ',' +
           'npwp = ' + QuotedStr(edNPWP.Text) + ',' +
           'email = ' + QuotedStr(edEmail.Text) + ',' +
           'tglkirim = ' + QuotedStr(FormatDateTime('yyyy-MM-dd', edTglKirim.Date)) + ',' +
           'kodetype = ' + QuotedStr(vartostr(edType.EditValue)) + ',' +
           'warna = ' + QuotedStr(edWarna.Text) + ',' +
           'tahun = ' + QuotedStr(edTahun.Text) + ',' +
           'norangka = ' + QuotedStr(edNoRangka.Text) + ',' +
           'nomesin = ' + QuotedStr(edNoMesin.Text) + ',' +
           'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
           'lasteditdate = ' + QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) +
           ' where codecust = ''' + edCustCode.Text + ''';');
       qrySearchExec.ExecSQL;

       qrySearch2.Close;
        qrySearch2.SQL.Clear;
        qrySearch2.SQL.Add('select * from ben_bengkel_customer where codecust = ''' +
           edCustCode.Text + '''');
        qrySearch2.Open;
        with frmMasterPKB do
            begin
                edKodeKonsumen.Text := qrySearch2.Fields[1].AsString;
                edPlatNomor.Text := qrySearch2.Fields[2].AsString;
                edNamaKonsumen.Text := qrySearch2.Fields[3].AsString;
                edKirimMobil.date := qrySearch2.Fields[9].AsDateTime;
                edTypeMobil.EditValue := qrySearch2.Fields[10].AsString;
                edWarnaMobil.Text := qrySearch2.Fields[11].AsString;
                edTahunMobil.Text := qrySearch2.Fields[12].AsString;
            end;
        btnReset.Click;
        frmSearchCustomer.Close;
     end;


end;

procedure TfrmSearchCustomer.btnCariClick(Sender: TObject);
var
  noPol, idSPK, idKendaraan, custCode : String;
  i: Integer;
begin
  noPol := edNopolDepan.Text + ' ' + edNopolTengah.Text + ' ' + UpperCase(edNopolBelakang.Text);
  edNopol.Text := noPol;
  edCutNama.SetFocus;
  //edCustCode.Text := 'C-' + frmMain.APP_OUTLETID + FormatDateTime('yyMMddmmhhss', Now);
end;


procedure TfrmSearchCustomer.btnResetClick(Sender: TObject);
begin
  edNopolTengah.Clear;
  edNopolBelakang.Clear;
  edAlamat.Clear;
  edkota.Clear;
  edCustCode.Clear;
  edCutNama.Clear;
  edEmail.Clear;
  edType.Clear;
  edNPWP.Clear;
  edWarna.Clear;
  edTglKirim.Date := Date;
  edTahun.Clear;
  edNoRangka.Clear;
  edNoMesin.Clear;
  edTelp.Clear;
  edNopol.Clear;
end;

procedure TfrmSearchCustomer.btnSaveClick(Sender: TObject);
var
  custCode : String;
begin
   if (edCustCode.Text = '') then
      begin
         custCode := frmMain.APP_OUTLETID + '-C-' + FormatDateTime('yyMMddmmhhss', Now);
         edCustCode.Text := custCode;
      end;

   qrySearch1.Close;
   qrySearch1.SQL.Clear;
   qrySearch1.SQL.Add('select codecust from ben_bengkel_customer where codecust = ''' +
       edCustCode.Text + '''');
   qrySearch1.Open;
   if (qrySearch1.IsEmpty) then
     begin
       qrySearchExec.SQL.Clear;
       qrySearchExec.SQL.Add('insert into ben_bengkel_customer values(' +
           '''' + '' + ''',' +
           '''' + edCustCode.Text + ''',' +
           QuotedStr(edNopol.Text) + ',' +
           QuotedStr(edCutNama.Text) + ',' +
           QuotedStr(edAlamat.Text) + ',' +
           QuotedStr(edkota.Text) + ',' +
           QuotedStr(edTelp.Text) + ',' +
           QuotedStr(edNPWP.Text) + ',' +
           QuotedStr(edEmail.Text) + ',' +
           QuotedStr(FormatDateTime('yyyy-MM-dd', edTglKirim.Date)) + ',' +
           QuotedStr(vartostr(edType.EditValue)) + ',' +
           QuotedStr(edWarna.Text) + ',' +
           QuotedStr(edTahun.Text) + ',' +
           QuotedStr(edNoRangka.Text) + ',' +
           QuotedStr(edNoMesin.Text) + ',' +
           QuotedStr('') + ',' +
           QuotedStr(frmMain.USERAPPS) + ',' +
           QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ');');
       qrySearchExec.ExecSQL;
       btnReset.Click;
     end
   else if (NOT qrySearch1.IsEmpty) then
     begin
       qrySearchExec.SQL.Clear;
       qrySearchExec.SQL.Add('update ben_bengkel_customer set ' +
           'nopol = ' + QuotedStr(edNopol.Text) + ',' +
           'namacust = ' + QuotedStr(edCutNama.Text) + ',' +
           'alamatcust = ' + QuotedStr(edAlamat.Text) + ',' +
           'kotacust = ' + QuotedStr(edkota.Text) + ',' +
           'telpcust = ' + QuotedStr(edTelp.Text) + ',' +
           'npwp = ' + QuotedStr(edNPWP.Text) + ',' +
           'email = ' + QuotedStr(edEmail.Text) + ',' +
           'tglkirim = ' + QuotedStr(FormatDateTime('yyyy-MM-dd', edTglKirim.Date)) + ',' +
           'kodetype = ' + QuotedStr(vartostr(edType.EditValue)) + ',' +
           'warna = ' + QuotedStr(edWarna.Text) + ',' +
           'tahun = ' + QuotedStr(edTahun.Text) + ',' +
           'norangka = ' + QuotedStr(edNoRangka.Text) + ',' +
           'nomesin = ' + QuotedStr(edNoMesin.Text) + ',' +
           'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
           'lasteditdate = ' + QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) +
           ' where codecust = ''' + edCustCode.Text + ''';');
       qrySearchExec.ExecSQL;
       btnReset.Click;
     end;

   qryList.Close;
   qryList.SQL.Clear;
   qryList.SQL.Add('select codecust, nopol, namacust, kodetype, warna, norangka, nomesin ' +
          'from ben_bengkel_customer order by lasteditdate DESC LIMIT 100');
   qryList.Open;
   gtbSearch.DataController.Refresh;
   ShowMessage('Update Supplier Finish !');
end;

procedure TfrmSearchCustomer.btnSelectClick(Sender: TObject);
var
  recSel : Integer;
  codeCust : String;
begin
   case btnSelect.Tag of
      1 : begin
               //from PKB
            recSel := gtbSearch.DataController.GetFocusedRecordIndex;
            if (recSel < 0) then Exit;
            codeCust := vartostr(gtbSearch.DataController.GetValue(recSel, gtbSearchcodecust.Index));
            qrySearch1.Close;
            qrySearch1.SQL.Clear;
            qrySearch1.SQL.Add('select * from ben_bengkel_customer where codecust = ''' +
               codeCust + '''');
            qrySearch1.Open;
            with frmMasterPKB do
                begin
                    edKodeKonsumen.Text := qrySearch1.Fields[1].AsString;
                    edPlatNomor.Text := qrySearch1.Fields[2].AsString;
                    edNamaKonsumen.Text := qrySearch1.Fields[3].AsString;
                    //edAlamat.Text := qrySearch1.Fields[4].AsString;
                    //edkota.Text := qrySearch1.Fields[5].AsString;
                    //edTelp.Text := qrySearch1.Fields[6].AsString;
                    //edNPWP.Text := qrySearch1.Fields[7].AsString;
                    //edEmail.Text := qrySearch1.Fields[8].AsString;
                    edKirimMobil.date := qrySearch1.Fields[9].AsDateTime;
                    edTypeMobil.EditValue := qrySearch1.Fields[10].AsString;
                    edWarnaMobil.Text := qrySearch1.Fields[11].AsString;
                    edTahunMobil.Text := qrySearch1.Fields[12].AsString;
                    //edNoRangka.Text := qrySearch1.Fields[13].AsString;
                    //edNoMesin.Text := qrySearch1.Fields[14].AsString;
                end;
            frmSearchCustomer.Close;
          end;
      2 : begin
            //EDIT DATA
            recSel := gtbSearch.DataController.GetFocusedRecordIndex;
            if (recSel < 0) then Exit;
            codeCust := vartostr(gtbSearch.DataController.GetValue(recSel, gtbSearchcodecust.Index));
            qrySearch1.Close;
            qrySearch1.SQL.Clear;
            qrySearch1.SQL.Add('select * from ben_bengkel_customer where codecust = ''' +
               codeCust + '''');
            qrySearch1.Open;
            edCustCode.Text := qrySearch1.Fields[1].AsString;
            edNopol.Text := qrySearch1.Fields[2].AsString;
            edCutNama.Text := qrySearch1.Fields[3].AsString;
            edAlamat.Text := qrySearch1.Fields[4].AsString;
            edkota.Text := qrySearch1.Fields[5].AsString;
            edTelp.Text := qrySearch1.Fields[6].AsString;
            edNPWP.Text := qrySearch1.Fields[7].AsString;
            edEmail.Text := qrySearch1.Fields[8].AsString;
            edTglKirim.date := qrySearch1.Fields[9].AsDateTime;
            edType.EditValue := qrySearch1.Fields[10].AsString;
            edWarna.Text := qrySearch1.Fields[11].AsString;
            edTahun.Text := qrySearch1.Fields[12].AsString;
            edNoRangka.Text := qrySearch1.Fields[13].AsString;
            edNoMesin.Text := qrySearch1.Fields[14].AsString;
          end;
   end;
end;

procedure TfrmSearchCustomer.edAlamatKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edkota.SetFocus;
   if (key = #27) then edCutNama.SetFocus;
end;

procedure TfrmSearchCustomer.edCutNamaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edAlamat.SetFocus;
   if (key = #27) then edNopol.SetFocus;
end;

procedure TfrmSearchCustomer.edEmailKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then edNPWP.SetFocus;
   if (key = #27) then edTelp.SetFocus;
end;

procedure TfrmSearchCustomer.edkotaKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edTelp.SetFocus;
   if (key = #27) then edAlamat.SetFocus;
end;

procedure TfrmSearchCustomer.edNoMesinKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edTglKirim.SetFocus;
     if (key = #27) then edNoRangka.SetFocus;
end;

procedure TfrmSearchCustomer.edNopolBelakangKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then btnCari.Click;;
   if (key = #27) then edNopolTengah.SetFocus;
end;

procedure TfrmSearchCustomer.edNopolBelakangPropertiesChange(Sender: TObject);
begin
    CariNoPol;
end;

procedure TfrmSearchCustomer.edNopolDepanKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then edNopolTengah.SetFocus;
   if (key = #27) then edNopolDepan.SetFocus;
end;

procedure TfrmSearchCustomer.edNopolDepanPropertiesChange(Sender: TObject);
begin
    CariNoPol;
end;

procedure TfrmSearchCustomer.edNopolKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edCutNama.SetFocus;
   if (key = #27) then edNopolBelakang.SetFocus;
end;

procedure TfrmSearchCustomer.edNopolTengahKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then edNopolBelakang.SetFocus;
   if (key = #27) then edNopolDepan.SetFocus;
end;

procedure TfrmSearchCustomer.edNopolTengahPropertiesChange(Sender: TObject);
begin
    CariNoPol;
end;

procedure TfrmSearchCustomer.edNoRangkaKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edNoMesin.SetFocus;
     if (key = #27) then edWarna.SetFocus;
end;

procedure TfrmSearchCustomer.edNPWPKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then edType.SetFocus;
   if (key = #27) then edEmail.SetFocus;
end;

procedure TfrmSearchCustomer.edTahunKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edWarna.SetFocus;
   if (key = #27) then edType.SetFocus;
end;

procedure TfrmSearchCustomer.edTelpKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edEmail.SetFocus;
   if (key = #27) then edkota.SetFocus;
end;

procedure TfrmSearchCustomer.edTglKirimKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #27) then edNoMesin.SetFocus;
end;

procedure TfrmSearchCustomer.edTypeKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then edTahun.SetFocus;
   if (key = #27) then edNPWP.SetFocus;
end;

procedure TfrmSearchCustomer.edWarnaKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edNoRangka.SetFocus;
     if (key = #27) then edTahun.SetFocus;
end;

procedure TfrmSearchCustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qrySearch1.Free;
   qrySearch2.Free;
   qrySearch3.Free;
   qrySearchExec.Free;
   Action := caFree;
end;

procedure TfrmSearchCustomer.FormCreate(Sender: TObject);
begin
   qrySearch1 := TMyQuery.Create(Self);
   qrySearch1.Connection := DMDB.dbInternal;
   qrySearch1.SQL.Add('select * from temptable');
   qrySearch1.Active := true;

   qrySearch2 := TMyQuery.Create(Self);
   qrySearch2.Connection := DMDB.dbInternal;
   qrySearch2.SQL.Add('select * from temptable');
   qrySearch2.Active := true;

   qrySearch3 := TMyQuery.Create(Self);
   qrySearch3.Connection := DMDB.dbInternal;
   qrySearch3.SQL.Add('select * from temptable');
   qrySearch3.Active := true;

   qrySearchExec := TMyQuery.Create(Self);
   qrySearchExec.Connection := DMDB.dbInternal;
   qrySearchExec.SQL.Add('select * from temptable');
   qrySearchExec.Active := true;

   qryList.Active := True;
   gtbSearch.DataController.Refresh;
   tblJenis.Active := True;
   tblWarna.Active := True;
   edTglKirim.Date := Date;
   edNopolDepan.Text := frmMain.APP_OUTLETPLAT;
end;

end.
