unit FPKBjasa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, MyAccess,
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
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxDBLookupComboBox, cxTextEdit,
  cxCalc, cxCheckBox, cxCalendar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxDropDownEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxLabel, Vcl.Menus, cxButtons;

type
  TfrmPKBJasa = class(TForm)
    cxLabel1: TcxLabel;
    edKodeJasa: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNamaJasa: TcxTextEdit;
    edTypeKendaraan: TcxLookupComboBox;
    edCharge: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edHarga: TcxCalcEdit;
    cxLabel5: TcxLabel;
    edCariJasa: TEdit;
    tblJenis: TMyTable;
    dsTbljenis: TMyDataSource;
    edTypeMobilCari: TcxLookupComboBox;
    ckFilter: TcxCheckBox;
    cxGrid1: TcxGrid;
    gtbList: TcxGridDBTableView;
    gtbListautonum: TcxGridDBColumn;
    gtbListType2: TcxGridDBColumn;
    gtbListkodejasa: TcxGridDBColumn;
    gtbListkodetype: TcxGridDBColumn;
    gtbListdeskripsi: TcxGridDBColumn;
    gtbListflatrate: TcxGridDBColumn;
    gtbListkodecharge: TcxGridDBColumn;
    gtbListprice: TcxGridDBColumn;
    gtbListnotes: TcxGridDBColumn;
    gtbListisedit: TcxGridDBColumn;
    gtbListaktif: TcxGridDBColumn;
    gtbListisdelete: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    tblList: TMyQuery;
    dsTblList: TMyDataSource;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    edDisc: TcxCalcEdit;
    cxLabel8: TcxLabel;
    edSubtotal: TcxCalcEdit;
    cxLabel9: TcxLabel;
    btnAdd: TcxButton;
    cxButton2: TcxButton;
    btnSelect: TcxButton;
    tblCharge: TMyTable;
    dsTblCharge: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure ckFilterPropertiesChange(Sender: TObject);
    procedure edCariJasaChange(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure edDiscFocusChanged(Sender: TObject);
    procedure edSubtotalFocusChanged(Sender: TObject);
    procedure edHargaFocusChanged(Sender: TObject);
  private
    { Private declarations }
    qryAdd1, qryAdd2 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmPKBJasa: TfrmPKBJasa;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterPKB;

procedure TfrmPKBJasa.btnAddClick(Sender: TObject);
begin
     edSubtotal.EditValue := edHarga.EditValue - (edHarga.EditValue * edDisc.EditValue / 100);
     if (btnAdd.Tag = 1) then
       begin
            //new
          qryAdd1.Close;
          qryAdd1.SQL.Clear;
          qryAdd1.SQL.Add('select kodedetail from ben_bengkel_pkb_detail ' +
             'where kodedetail = ''' + edKodeJasa.Text + ''' AND pkbnumber = ''' +
         frmMasterPKB.edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');
          qryAdd1.Open;
          if (qryAdd1.IsEmpty) then
            begin
               qryAdd1.SQL.Clear;
               qryAdd1.SQL.Add('insert into ben_bengkel_pkb_detail values(' +
                   '''' + '' + ''',' +
                   '''' + frmMasterPKB.edPKBNumb.Text + ''',' +
                   '''' + FormatDateTime('yyyy-MM-dd', frmMasterPKB.edTglPKB.Date) + ''', ' +
                   '''' + FormatDateTime('hh:mm:ss', frmMasterPKB.edJamPKB.Time) + ''', ' +
                   '''' + 'J' + ''',' +
                   '''' + edKodeJasa.Text + ''',' +
                   QuotedStr(edNamaJasa.Text) + ',' +
                   '''' + '1' + ''',' +
                   '''' + 'PCE' + ''',' +
                   '''' + FloatToStr(edHarga.EditValue) + ''',' +
                   '''' + FloatToStr(edDisc.EditValue) + ''',' +
                   '''' + FloatToStr(edSubtotal.EditValue) + ''',' +
                   '''' + edCharge.Text + ''',' +
                   '''' + 'N' + ''',' +
                   '''' + frmMain.USERAPPS + ''',' +
                 '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
               qryAdd1.ExecSQL;
               frmMasterPKB.qryDetails.Close;
               frmMasterPKB.qryDetails.SQL.Clear;
               frmMasterPKB.qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where ' +
                  'pkbnumber = ''' + frmMasterPKB.edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');
               frmMasterPKB.qryDetails.Open;
               frmMasterPKB.gtbPKB.DataController.Refresh;
               frmPKBJasa.Close;
            end
          else if (NOT qryAdd1.IsEmpty) then
            begin
              ShowMessage('Jasa ' + edNamaJasa.Text + #13 + 'Sudah ada di List PKB');
              Exit;
            end;
       end
     else if (btnAdd.Tag = 2) then
       begin
            //edit
       end;

end;

procedure TfrmPKBJasa.btnSelectClick(Sender: TObject);
var
  recSel : Integer;
  kodeJasa : String;
begin
  recSel := gtbList.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  kodeJasa := vartostr(gtbList.DataController.GetValue(recSel, gtbListkodejasa.Index));
  qryAdd1.Close;
  qryAdd1.SQL.Clear;
  qryAdd1.SQL.Add('select kodejasa, kodecharge, deskripsi, price, isedit, kodetype from ' +
      'ben_bengkel_jasa where kodejasa = ''' + kodeJasa + '''');
  qryAdd1.Open;
  edKodeJasa.Text := qryAdd1.Fields[0].AsString;
  edCharge.Text := qryAdd1.Fields[1].AsString;
  edNamaJasa.Text := qryAdd1.Fields[2].AsString;
  edHarga.EditValue := qryAdd1.Fields[3].AsFloat;
  edTypeKendaraan.EditValue := qryAdd1.Fields[5].AsString;
  if (qryAdd1.Fields[4].AsString = 'Y') then edHarga.Properties.ReadOnly := False
  else if (qryAdd1.Fields[4].AsString = 'N') then edHarga.Properties.ReadOnly := True;
  edDisc.EditValue := 0;
  edSubtotal.EditValue := qryAdd1.Fields[3].AsFloat;
  edDisc.SetFocus;
end;

procedure TfrmPKBJasa.ckFilterPropertiesChange(Sender: TObject);
var
   namaJasa : String;
begin
   if (ckFilter.Checked = True) then
     begin
       namaJasa := '%' + edCariJasa.Text + '%';
       tblList.Close;
       tblList.SQL.Clear;
       tblList.SQL.Add('select * from ben_bengkel_jasa where kodetype = ''' +
              VarToStr(frmMasterPKB.edTypeMobil.EditValue) + ''' AND aktif = ''' + 'Y' +
              ''' AND deskripsi = ' + QuotedStr(namaJasa) + 'AND isdelete = ''' + 'N' + '''');
       tblList.Open;
       gtbList.DataController.Refresh;
     end
   else if (ckFilter.Checked = False) then
     begin
       namaJasa := '%' + edCariJasa.Text + '%';
       tblList.Close;
       tblList.SQL.Clear;
       tblList.SQL.Add('select * from ben_bengkel_jasa where deskripsi like ' +
              QuotedStr(namaJasa) + ' AND aktif = ''' + 'Y' +
              ''' AND isdelete = ''' + 'N' + '''');
       tblList.Open;
       gtbList.DataController.Refresh;
     end;
end;

procedure TfrmPKBJasa.edCariJasaChange(Sender: TObject);
var
  namaJasa : String;
begin
   if (ckFilter.Checked = True) then
     begin
       namaJasa := '%' + edCariJasa.Text + '%';
       tblList.Close;
       tblList.SQL.Clear;
       tblList.SQL.Add('select * from ben_bengkel_jasa where kodetype = ''' +
              VarToStr(frmMasterPKB.edTypeMobil.EditValue) + ''' AND aktif = ''' + 'Y' +
              ''' AND deskripsi LIKE ' + QuotedStr(namaJasa) + 'AND isdelete = ''' + 'N' + '''');
       tblList.Open;
       gtbList.DataController.Refresh;
     end
   else if (ckFilter.Checked = False) then
     begin
       namaJasa := '%' + edCariJasa.Text + '%';
       tblList.Close;
       tblList.SQL.Clear;
       tblList.SQL.Add('select * from ben_bengkel_jasa where deskripsi like ' +
              QuotedStr(namaJasa) + ' AND aktif = ''' + 'Y' +
              ''' AND isdelete = ''' + 'N' + '''');
       tblList.Open;
       gtbList.DataController.Refresh;
     end;
end;

procedure TfrmPKBJasa.edDiscFocusChanged(Sender: TObject);
begin
   edSubtotal.EditValue := edHarga.EditValue - (edHarga.EditValue * edDisc.EditValue / 100);
end;

procedure TfrmPKBJasa.edHargaFocusChanged(Sender: TObject);
begin
   edSubtotal.EditValue := edHarga.EditValue - (edHarga.EditValue * edDisc.EditValue / 100);
end;

procedure TfrmPKBJasa.edSubtotalFocusChanged(Sender: TObject);
begin
   edSubtotal.EditValue := edHarga.EditValue - (edHarga.EditValue * edDisc.EditValue / 100);
end;

procedure TfrmPKBJasa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmPKBJasa.FormCreate(Sender: TObject);
begin
    qryAdd1 := TMyQuery.Create(Self);
    qryAdd1.Connection := DMDB.dbInternal;
    qryAdd1.SQL.Add('select * from temptable');
    qryAdd1.Active := true;

    qryAdd2 := TMyQuery.Create(Self);
    qryAdd2.Connection := DMDB.dbInternal;
    qryAdd2.SQL.Add('select * from temptable');
    qryAdd2.Active := true;

    tblJenis.Active := True;
    tblCharge.Active := True;
end;

end.
