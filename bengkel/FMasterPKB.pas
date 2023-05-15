unit FMasterPKB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, DBAccess, MyAccess, MemDS,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, cxGroupBox, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxLabel, strUtils, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxSpinEdit, cxTimeEdit, cxCalendar, cxCalc;

type
  TfrmMasterPKB = class(TForm)
    qryDetails: TMyQuery;
    dsQryDetails: TMyDataSource;
    cxGroupBox1: TcxGroupBox;
    btnNewPKB: TcxButton;
    cxLabel1: TcxLabel;
    edPKBNumb: TcxTextEdit;
    edKodeKonsumen: TcxTextEdit;
    cxLabel2: TcxLabel;
    btnCariCustomer: TcxButton;
    tblJenis: TMyTable;
    dsTbljenis: TMyDataSource;
    cxLabel3: TcxLabel;
    edNamaKonsumen: TcxTextEdit;
    cxLabel4: TcxLabel;
    edPlatNomor: TcxTextEdit;
    cxLabel5: TcxLabel;
    edTypeMobil: TcxLookupComboBox;
    cxLabel6: TcxLabel;
    edWarnaMobil: TcxTextEdit;
    cxLabel7: TcxLabel;
    edTahunMobil: TcxTextEdit;
    cxLabel8: TcxLabel;
    edKilometer: TcxTextEdit;
    edkeluhan: TcxMemo;
    cxLabel9: TcxLabel;
    gtbPKB: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel10: TcxLabel;
    edTglSelesai: TcxDateEdit;
    edJamSelesai: TcxTimeEdit;
    cxLabel11: TcxLabel;
    btnSimpan: TcxButton;
    cxLabel12: TcxLabel;
    edKirimMobil: TcxDateEdit;
    cxLabel13: TcxLabel;
    edTglPKB: TcxDateEdit;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    btnBahan: TcxButton;
    cxButton5: TcxButton;
    edjamPKB: TcxTimeEdit;
    gtbPKBkodedetail: TcxGridDBColumn;
    gtbPKBnamadetail: TcxGridDBColumn;
    gtbPKBjumlah: TcxGridDBColumn;
    gtbPKBsatuan: TcxGridDBColumn;
    gtbPKBharga: TcxGridDBColumn;
    gtbPKBdiscount: TcxGridDBColumn;
    gtbPKBsubtotal: TcxGridDBColumn;
    gtbPKBkodecharge: TcxGridDBColumn;
    gtbPKBlastedituser: TcxGridDBColumn;
    gtbPKBlasteditdate: TcxGridDBColumn;
    gtbPKBautonum: TcxGridDBColumn;
    gtbPKBpkbnumber: TcxGridDBColumn;
    gtbPKBtglmasuk: TcxGridDBColumn;
    gtbPKBwaktumasuk: TcxGridDBColumn;
    gtbPKBtypedetail: TcxGridDBColumn;
    gtbPKBisdelete: TcxGridDBColumn;
    btnCariPKB: TcxButton;
    btnDelete: TcxButton;
    cxButton2: TcxButton;
    btnCetakPKB: TcxButton;
    cxButton4: TcxButton;
    tblCharge: TMyTable;
    dsTblCharge: TMyDataSource;
    btnCekHistory: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewPKBClick(Sender: TObject);
    procedure btnCariCustomerClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnCariPKBClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure btnBahanClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnCetakPKBClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure btnCekHistoryClick(Sender: TObject);
  private
    { Private declarations }
    qryPKB1, qryPKB2, qryExecPKB : TMyQuery;
    procedure ResetFormPKB();
  public
    { Public declarations }
  end;

var
  frmMasterPKB: TfrmMasterPKB;

implementation

{$R *.dfm}

uses FdmDB, FMain, FSearchCustomer, FPKBJasa, FCariMasterPKB, FOPL,
     FPKBSparepart, FPKBBahan, FPKBCetak, FCetakFaktur, FHistoryPKB;

procedure TfrmMasterPKB.ResetFormPKB;
begin
    edPKBNumb.Clear;
    edKodeKonsumen.Clear;
    edNamaKonsumen.Clear;
    edPlatNomor.Clear;
    edTypeMobil.Clear;
    edTahunMobil.Clear;
    edWarnaMobil.Clear;
    edKilometer.Clear;
    edkeluhan.Clear;
    edTglSelesai.Date := Date;
    edJamSelesai.Time := Time;
    edKirimMobil.Date := Date;
    edjamPKB.Time := Time;
    edTglPKB.Date := Date;
    qryDetails.Close;
    qryDetails.SQL.Clear;
    qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where ' +
              'pkbnumber = ''' + 'X' + ''' AND isdelete = ''' + 'N' + '''');
    qryDetails.Open;
    frmMasterPKB.gtbPKB.DataController.Refresh;
end;

procedure TfrmMasterPKB.btnCariPKBClick(Sender: TObject);
begin
   Application.CreateForm(TfrmCariMasterPKB, frmCariMasterPKB);
   with frmCariMasterPKB do
     begin
         qryList.Active := True;
         qryList.Close;
         qryList.SQL.Clear;
         qryList.SQL.Add('select ben_bengkel_pkb.*, ' +
            '(select ben_bengkel_customer.namacust from ben_bengkel_customer where ' +
            'ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as namacust, ' +
            '(select ben_bengkel_customer.nopol from ben_bengkel_customer where ' +
            'ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as nopol ' +
            'from ben_bengkel_pkb where status = ''' + 'S'  + ''' AND isdelete = ''' + 'N' + '''');
         qryList.Open;
         gtbList.DataController.Refresh;
     end;
   //frmCariMasterPKB.qryList.Active := True;
   frmCariMasterPKB.btnSelect.Tag := 1;
   //frmCariMasterPKB.gtbList.DataController.Refresh;
   frmCariMasterPKB.FormStyle := fsNormal;
   frmCariMasterPKB.WindowState := wsNormal;
   frmCariMasterPKB.Show;
   frmCariMasterPKB.Width := 670;
   frmCariMasterPKB.Height := 440;
   frmCariMasterPKB.Position := poDesktopCenter;
end;

procedure TfrmMasterPKB.btnCekHistoryClick(Sender: TObject);
begin
   if (not frmMain.IsFormOpen('frmHistoryPKB')) then
      begin
           Application.CreateForm(TfrmHistoryPKB, frmHistoryPKB);
           frmHistoryPKB.FormStyle := fsMDIChild;
           frmHistoryPKB.Show;
      end
     else if (frmMain.IsFormOpen('frmHistoryPKB')) then
      begin
           frmHistoryPKB.Close;
           Application.CreateForm(TfrmHistoryPKB, frmHistoryPKB);
           frmHistoryPKB.FormStyle := fsMDIChild;
           frmHistoryPKB.Show;
      end;
     with frmHistoryPKB do
         begin
            tblJenis.Active := True;
            qryMaster.Active := True;
            qryMaster.Close;
            qryMaster.SQL.Clear;
            qryMaster.SQL.Add('select pkbnumber, tglmasuk, waktumasuk, keluhan, kilometer ' +
                   'from ben_bengkel_pkb where custcode = ''' + frmMasterPKB.edKodeKonsumen.Text + '''');
            qryMaster.Open;
            gtbMaster.DataController.Refresh;
            qryDetails.Active := True;
            gtbDetails.DataController.Refresh;
            frmHistoryPKB.edKodeKonsumen.Text := frmMasterPKB.edKodeKonsumen.Text;
            frmHistoryPKB.edWarnaMobil.Text := frmMasterPKB.edKodeKonsumen.Text;
            frmHistoryPKB.edPlatNomor.Text := frmMasterPKB.edKodeKonsumen.Text;
            frmHistoryPKB.edTypeMobil.EditValue := frmMasterPKB.edTypeMobil.EditValue;
         end;

end;

procedure TfrmMasterPKB.btnCetakPKBClick(Sender: TObject);
var
  i: Integer;
begin
     //ShowMessage('###');
     if (edPKBNumb.Text = '') then Exit;
     Application.CreateForm(TfrmPKBCetak, frmPKBCetak);
     qryPKB1.Close;
     qryPKB1.SQL.Clear;
     qryPKB1.SQL.Add('select codecust, nopol, namacust, alamatcust, kotacust, telpcust, tglkirim, ' +
           'kodetype, warna, tahun, norangka, nomesin from ben_bengkel_customer where ' +
           'codecust = ''' + edKodeKonsumen.Text + '''');
     qryPKB1.Open;
     with frmPKBCetak do
       begin
            lblDatePKB.Caption := FormatDateTime('dd-MM-yyyy', edTglPKB.Date) + FormatDateTime('hh:mm', edjamPKB.Time);
            lblPKBNumb.Caption := edPKBNumb.Text;
            lblKodeCust.Caption := qryPKB1.Fields[0].AsString;
            lblPlat.Caption := qryPKB1.Fields[1].AsString;
            lblNamaCust.Caption := qryPKB1.Fields[2].AsString;
            lblAlamatCust.Caption := qryPKB1.Fields[3].AsString;
            lblKotaCust.Caption := qryPKB1.Fields[4].AsString;
            lblTelpCust.Caption := qryPKB1.Fields[5].AsString;
            lblTglKirim.Caption := FormatDateTime('dd-MM-yyyy', qryPKB1.Fields[6].AsDateTime);
            lblWarna.Caption := qryPKB1.Fields[8].AsString;
            lblTahun.Caption := qryPKB1.Fields[9].AsString;
            lblNoRangka.Caption := qryPKB1.Fields[10].AsString;
            lblNoMesin.Caption := qryPKB1.Fields[11].AsString;
            lblKilometer.Caption := edKilometer.Text;
            lblType.Caption := edTypeMobil.Text;
            lblUser.Caption := frmMain.NAMEAPPS;
            lblNamaCustBawah.Caption := qryPKB1.Fields[2].AsString;
            lblTelpCustBawah.Caption := qryPKB1.Fields[5].AsString;
            lblKeluhan.Lines.Clear;
            for i := 0 to edkeluhan.Lines.Count do
              begin
                  lblKeluhan.Lines.Add(edkeluhan.Lines[i]);
              end;
       end;
     frmPKBCetak.qrpPKB.Preview;
end;

procedure TfrmMasterPKB.btnDeleteClick(Sender: TObject);
var
   recSel, autonum : Integer;
begin
   if MessageDlg('Anda akan menghapus Item terpilih '+ #13#13 +
     'Yakin menghapus data ini?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrNo then
       begin
           ShowMessage('Cancel Delete');
           Exit;
       end;
   recSel := gtbPKB.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   autonum := gtbPKB.DataController.GetValue(recSel, gtbPKBautonum.Index);
   qryExecPKB.SQL.Clear;
   qryExecPKB.SQL.Add('update ben_bengkel_pkb_detail set ' +
       'isdelete = ''' + 'Y' + ''',' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where autonum = ''' + IntToStr(autonum) + '''');
   qryExecPKB.ExecSQL;

   qryDetails.Close;
   qryDetails.SQL.Clear;
   qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where ' +
              'pkbnumber = ''' + edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');
   qryDetails.Open;
   frmMasterPKB.gtbPKB.DataController.Refresh;
end;

procedure TfrmMasterPKB.btnNewPKBClick(Sender: TObject);
var
  tmpPKB, frstCode, pkbNumb : String;
  lastInt, newLastInt : Integer;
begin
   frstCode := frmMain.APP_OUTLETID + '.' + FormatDateTime('yyMM', Date);
   //ShowMessage(frstCode);
   tmpPKB := frstCode + '%';
   if (edPKBNumb.Text <> '') then
    begin
      if MessageDlg('Anda akan membuat PKB baru '+ #13#13 +
          'Apakah data PKB sudah disimpan?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrNo then
       begin
           ShowMessage('Cancel New PKB');
           Exit;
       end;
      ResetFormPKB;
      qryPKB1.Close;
      qryPKB1.SQL.Clear;
      qryPKB1.SQL.Add('select pkbnumber from ben_bengkel_pkb where ' +
          'pkbnumber like ''' + tmpPKB + ''' ORDER BY pkbnumber ASC');
      qryPKB1.Open;
      if (qryPKB1.IsEmpty) then pkbNumb := frstCode + '0001'
      else
        begin
           qryPKB1.Last;
           //ShowMessage(qryPKB1.Fields[0].AsString);
           lastInt := StrToInt(RightStr(qryPKB1.Fields[0].AsString, 4));
           newLastInt := lastInt + 1;
           case Length(IntToStr(newLastInt)) of
             1 : pkbNumb := frstCode + '000' + IntToStr(newLastInt);
             2 : pkbNumb := frstCode + '00' + IntToStr(newLastInt);
             3 : pkbNumb := frstCode + '0' + IntToStr(newLastInt);
             4 : pkbNumb := frstCode + IntToStr(newLastInt);
           end;
        end;
      edPKBNumb.Text := pkbNumb;
      qryExecPKB.Close;
      qryExecPKB.SQL.Clear;
      qryExecPKB.SQL.Add('insert into ben_bengkel_pkb (pkbnumber, tglmasuk) values(' +
           '''' + edPKBNumb.Text + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', Date) + ''');');
      qryExecPKB.ExecSQL;
      edTglPKB.Date := Date;
      edjamPKB.Time := Time;
      edTglSelesai.Date := Date;
      edJamSelesai.Time := Time;
      qryDetails.Close;
      qryDetails.SQL.Clear;
      qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where ' +
                  'pkbnumber = ''' + edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');
      qryDetails.Open;
      frmMasterPKB.gtbPKB.DataController.Refresh;
      btnCariCustomer.Visible := True;

    end
   else
    begin
      qryPKB1.Close;
      qryPKB1.SQL.Clear;
      qryPKB1.SQL.Add('select pkbnumber from ben_bengkel_pkb where ' +
          'pkbnumber like ''' + tmpPKB + ''' ORDER BY pkbnumber ASC');
      qryPKB1.Open;
      if (qryPKB1.IsEmpty) then pkbNumb := frstCode + '0001'
      else
        begin
           qryPKB1.Last;
           //ShowMessage(qryPKB1.Fields[0].AsString);
           lastInt := StrToInt(RightStr(qryPKB1.Fields[0].AsString, 4));
           newLastInt := lastInt + 1;
           case Length(IntToStr(newLastInt)) of
             1 : pkbNumb := frstCode + '000' + IntToStr(newLastInt);
             2 : pkbNumb := frstCode + '00' + IntToStr(newLastInt);
             3 : pkbNumb := frstCode + '0' + IntToStr(newLastInt);
             4 : pkbNumb := frstCode + IntToStr(newLastInt);
           end;
        end;
      edPKBNumb.Text := pkbNumb;
      qryExecPKB.Close;
      qryExecPKB.SQL.Clear;
      qryExecPKB.SQL.Add('insert into ben_bengkel_pkb (pkbnumber, tglmasuk) values(' +
           '''' + edPKBNumb.Text + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', Date) + ''');');
      qryExecPKB.ExecSQL;
      edTglPKB.Date := Date;
      edjamPKB.Time := Time;
      edTglSelesai.Date := Date;
      edJamSelesai.Time := Time;
      qryDetails.Close;
      qryDetails.SQL.Clear;
      qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where ' +
                  'pkbnumber = ''' + edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');
      qryDetails.Open;
      frmMasterPKB.gtbPKB.DataController.Refresh;
      btnCariCustomer.Visible := True;
    end;

end;

procedure TfrmMasterPKB.btnSimpanClick(Sender: TObject);
begin
     if (edKodeKonsumen.Text = '') then
       begin
           ShowMessage('Kode Konsumen masih kosong !');
           Exit;
       end;
     qryExecPKB.SQL.Clear;
     qryExecPKB.SQL.Add('update ben_bengkel_pkb set ' +
          'custcode = ''' + edKodeKonsumen.Text + ''',' +
          'tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', edTglPKB.Date) + ''',' +
          'waktumasuk = ''' + FormatDateTime('hh:mm:ss', edjamPKB.Time) + ''',' +
          'tglselesai = ''' + FormatDateTime('yyyy-MM-dd', edTglSelesai.Date) + ''',' +
          'waktuselesai = ''' + FormatDateTime('hh:mm:ss', edJamSelesai.Time) + ''',' +
          'keluhan = ' + QuotedStr(edkeluhan.Text) + ',' +
          'kilometer = ''' + edKilometer.Text + ''',' +
          'status = ''' + 'S' + ''',' +
          'lastedituser = ''' + frmMain.USERAPPS + ''',' +
          'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
            'where pkbnumber = ''' + edPKBNumb.Text + ''';');
          qryExecPKB.ExecSQL;
     qryDetails.Close;
      qryDetails.SQL.Clear;
      qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where ' +
                  'pkbnumber = ''' + edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');
      qryDetails.Open;
      frmMasterPKB.gtbPKB.DataController.Refresh;
     ShowMessage('PKB Tersimpan');
     btnCariCustomer.Visible := False;
end;

procedure TfrmMasterPKB.cxButton1Click(Sender: TObject);
begin
    if (edPKBNumb.Text = '') then
        begin
            ShowMessage('Nomor PKB Masih Kosong !');
            Exit;
        end;
    if (edKodeKonsumen.Text = '') then
        begin
            ShowMessage('Nomor PKB Masih Kosong !');
            Exit;
        end;
    Application.CreateForm(TfrmPKBJasa, frmPKBJasa);
    frmPKBJasa.FormStyle := fsNormal;
    frmPKBJasa.WindowState := wsNormal;
    frmPKBJasa.btnAdd.Tag := 1;
    frmPKBJasa.edTypeMobilCari.EditValue := frmMasterPKB.edTypeMobil.EditValue;
    frmPKBJasa.ckFilter.Checked := True;
    //frmPKBJasa.btnSave.Visible := False;
    //frmPKBJasa.btnSelect.Tag := 1;

    with frmPKBJasa do
      begin
          frmPKBJasa.tblList.Active := True;
          frmPKBJasa.tblList.Close;
          frmPKBJasa.tblList.SQL.Clear;
          frmPKBJasa.tblList.SQL.Add('select * from ben_bengkel_jasa where kodetype = ''' +
              VarToStr(frmMasterPKB.edTypeMobil.EditValue) + ''' AND aktif = ''' + 'Y' +
              ''' AND isdelete = ''' + 'N' + '''');
          frmPKBJasa.tblList.Open;
          frmPKBJasa.gtbList.DataController.Refresh;
      end;

    frmPKBJasa.Show;
    frmPKBJasa.Width := 775;
    frmPKBJasa.Height := 540;
    frmPKBJasa.Position := poDesktopCenter;
end;

procedure TfrmMasterPKB.cxButton2Click(Sender: TObject);
begin
   if (edPKBNumb.Text = '') then Exit;
   if MessageDlg('Proses ini akan menutup PKB '+ #13#13 +
     'Apakah anda yakin akan menutup PKB ini?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrNo then
       begin
           ShowMessage('Cancel Finish PKB');
           Exit;
       end;
   qryExecPKB.SQL.Clear;
   qryExecPKB.SQL.Add('update ben_bengkel_pkb set ' +
       'status = ''' + 'F' + ''', ' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where pkbnumber = ''' + edPKBNumb.Text + '''');
   qryExecPKB.ExecSQL;
   ShowMessage('PKB Selesai');
   ResetFormPKB;
end;

procedure TfrmMasterPKB.cxButton3Click(Sender: TObject);
begin
     if (edPKBNumb.Text = '') then
        begin
            ShowMessage('Nomor PKB Masih Kosong !');
            Exit;
        end;
    if (edKodeKonsumen.Text = '') then
        begin
            ShowMessage('Nomor PKB Masih Kosong !');
            Exit;
        end;
   Application.CreateForm(TfrmPKBSparepart, frmPKBSparepart);
   frmPKBSparepart.FormStyle := fsNormal;
   frmPKBSparepart.WindowState := wsNormal;
   frmPKBSparepart.Show;
   frmPKBSparepart.Width := 950;
   frmPKBSparepart.Height := 553;
   frmPKBSparepart.Position := poDesktopCenter;
end;

procedure TfrmMasterPKB.cxButton4Click(Sender: TObject);
var
  i : Integer;
  harga, subtotal, totalPot, hDPP, hPPN : Double;
begin
     {SELECT ben_bengkel_pkb.pkbnumber, ben_bengkel_pkb.custcode, ben_bengkel_pkb.tglmasuk, ben_bengkel_pkb.kilometer,
(select ben_bengkel_customer.nopol from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as nopol,
(select ben_bengkel_customer.namacust from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as namacust,
(select ben_bengkel_customer.alamatcust from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as alamatcust,
(select ben_bengkel_customer.kotacust from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as kotacust,
(select ben_bengkel_customer.telpcust from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as telpcust
FROM ben_bengkel_pkb WHERE ben_bengkel_pkb.pkbnumber = 'X'}
   if (edPKBNumb.Text = '') then Exit;
   Application.CreateForm(TfrmCetakFaktur, frmCetakFaktur);
     with frmCetakFaktur do
       begin
         lblOutletName.Caption := frmMain.APP_OUTLETNAME;
           lblOutletAlamat.Caption := frmMain.APP_OUTLETADDRESS;
           lblOutletKota.Caption := frmMain.APP_OUTLETCITY + ' ' + frmMain.APP_OUTLETPROVINCE;
           lblOutletTelepon.Caption := 'Telp. ' + frmMain.APP_OUTLETPHONE;

         qryMaster.Active := True;
         qryDetails.Active := True;
         qryMaster.Close;
         qryMaster.SQL.Clear;
         qryMaster.SQL.Add('SELECT ben_bengkel_pkb.pkbnumber, ben_bengkel_pkb.custcode, ' +
             'ben_bengkel_pkb.tglmasuk, ben_bengkel_pkb.kilometer, ' +
             '(select ben_bengkel_customer.nopol from ben_bengkel_customer ' +
             'where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as nopol, ' +
             '(select ben_bengkel_customer.namacust from ben_bengkel_customer ' +
             'where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as namacust, ' +
             '(select ben_bengkel_customer.alamatcust from ben_bengkel_customer where ' +
             'ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as alamatcust, ' +
             '(select ben_bengkel_customer.kotacust from ben_bengkel_customer where ' +
             'ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as kotacust, ' +
             '(select ben_bengkel_customer.telpcust from ben_bengkel_customer where ' +
             'ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as telpcust ' +
             'FROM ben_bengkel_pkb WHERE ben_bengkel_pkb.pkbnumber = ''' + edPKBNumb.Text + '''');
         qryMaster.Open;

         lblType.Caption := edTypeMobil.Text + ' Tahun ' + edTahunMobil.Text;
         lblWarna.Caption := edWarnaMobil.Text;
         lblNamaSA.Caption := UpperCase(frmMain.NAMEAPPS);

         qryDetails.Close;
         qryDetails.SQL.Clear;
         qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where pkbnumber = ''' +
             edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + ''' AND kodecharge = ''' + '01' + '''');
         qryDetails.Open;
         harga := 0;
         subtotal := 0;
         totalPot := 0;
         qryDetails.First;
         for i := 0 to qryDetails.RecordCount-1 do
             begin
                  harga := harga + (qryDetails.Fields[7].AsFloat * qryDetails.Fields[9].AsFloat);
                  subtotal := subtotal + qryDetails.Fields[11].AsFloat;
                  qryDetails.Next;
             end;
         totalPot := subtotal - harga;
         lblPotongan.Caption := FormatFloat('#,#', totalPot);
         hDPP := subtotal / 1.1;
         hPPN := subtotal - hDPP;
         lblPPN.Caption := FormatFloat('#,#', hPPN);
         lblDPP.Caption := FormatFloat('#,#', hDPP);
         lblHargaGross.Caption := FormatFloat('#,#', harga);
         lblTotal.Caption := FormatFloat('#,#', subtotal);
       end;
   frmCetakFaktur.qrpKuitansi.Preview;

end;

procedure TfrmMasterPKB.btnBahanClick(Sender: TObject);
begin
    if (edPKBNumb.Text = '') then
        begin
            ShowMessage('Nomor PKB Masih Kosong !');
            Exit;
        end;
    if (edKodeKonsumen.Text = '') then
        begin
            ShowMessage('Nomor PKB Masih Kosong !');
            Exit;
        end;
   Application.CreateForm(TfrmPKBBahan, frmPKBBahan);
   frmPKBBahan.FormStyle := fsNormal;
   frmPKBBahan.WindowState := wsNormal;
   frmPKBBahan.Show;
   frmPKBBahan.Width := 950;
   frmPKBBahan.Height := 553;
   frmPKBBahan.Position := poDesktopCenter;
end;

procedure TfrmMasterPKB.cxButton5Click(Sender: TObject);
begin
   if (edPKBNumb.Text = '') then
        begin
            ShowMessage('Nomor PKB Masih Kosong !');
            Exit;
        end;
    if (edKodeKonsumen.Text = '') then
        begin
            ShowMessage('Nomor PKB Masih Kosong !');
            Exit;
        end;

   Application.CreateForm(TfrmOPL, frmOPL);
   frmOPL.FormStyle := fsNormal;
   frmOPL.WindowState := wsNormal;
   frmOPL.Show;
   frmOPL.Width := 500;
   frmOPL.Height := 351;
   frmOPL.Position := poDesktopCenter;
end;

procedure TfrmMasterPKB.btnCariCustomerClick(Sender: TObject);
begin
   {if (edPKBNumb.Text = '') then
        begin
            ShowMessage('Nomor PKB Masih Kosong !');
            Exit;
        end;}
   Application.CreateForm(TfrmSearchCustomer, frmSearchCustomer);
   frmSearchCustomer.FormStyle := fsNormal;
   frmSearchCustomer.WindowState := wsNormal;
   frmSearchCustomer.btnAddPkb.Visible := True;
   frmSearchCustomer.btnSave.Visible := False;
   frmSearchCustomer.btnSelect.Tag := 1;
   frmSearchCustomer.Show;
   frmSearchCustomer.Width := 928;
   frmSearchCustomer.Height := 575;
   frmSearchCustomer.Position := poDesktopCenter;

end;

procedure TfrmMasterPKB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    qryPKB1.Free;
    qryPKB2.Free;
    qryExecPKB.Free;
    Action := caFree;
end;

procedure TfrmMasterPKB.FormCreate(Sender: TObject);
begin
   qryPKB1 := TMyQuery.Create(Self);
   qryPKB1.Connection := DMDB.dbInternal;
   qryPKB1.SQL.Add('select * from temptable');
   qryPKB1.Active := true;

   qryPKB2 := TMyQuery.Create(Self);
   qryPKB2.Connection := DMDB.dbInternal;
   qryPKB2.SQL.Add('select * from temptable');
   qryPKB2.Active := true;

   qryExecPKB := TMyQuery.Create(Self);
   qryExecPKB.Connection := DMDB.dbInternal;
   qryExecPKB.SQL.Add('select * from temptable');
   qryExecPKB.Active := true;
   tblJenis.Active := True;
   tblCharge.Active := True;
end;

end.
