unit FPKBSparepart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxDropDownEdit,
  cxCalc, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, cxLabel, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxCheckBox, cxCalendar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, MyAccess, DBAccess, MemDS;

type
  TfrmPKBSparepart = class(TForm)
    cxLabel1: TcxLabel;
    edKodeSparepart: TcxTextEdit;
    edNamaSparepart: TcxTextEdit;
    edCharge: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edHarga: TcxCalcEdit;
    cxLabel5: TcxLabel;
    btnReset: TcxButton;
    btnSave: TcxButton;
    edSatuan: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    cxLabel6: TcxLabel;
    edQty: TcxCalcEdit;
    cxLabel7: TcxLabel;
    edDisc: TcxCalcEdit;
    cxLabel8: TcxLabel;
    edSubtotal: TcxCalcEdit;
    tblList: TMyQuery;
    dsTblList: TMyDataSource;
    tblSatuan: TMyTable;
    dsTblSatuan: TMyDataSource;
    tblCharge: TMyTable;
    dsTblCharge: TMyDataSource;
    cxGrid1: TcxGrid;
    gtbList: TcxGridDBTableView;
    gtbListautonum: TcxGridDBColumn;
    gtbListkodesparepart: TcxGridDBColumn;
    gtbListdeskripsi: TcxGridDBColumn;
    gtbListkodecharge: TcxGridDBColumn;
    gtbListprice: TcxGridDBColumn;
    gtbListnotes: TcxGridDBColumn;
    gtbListsatuan: TcxGridDBColumn;
    gtbListisedit: TcxGridDBColumn;
    gtbListaktif: TcxGridDBColumn;
    gtbListisdelete: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    btnSelect: TcxButton;
    cxLabel9: TcxLabel;
    edCariNama: TcxTextEdit;
    cxLabel10: TcxLabel;
    edCariKode: TcxTextEdit;
    cxLabel11: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure edCariKodePropertiesChange(Sender: TObject);
    procedure edCariTypePropertiesChange(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure edHargaFocusChanged(Sender: TObject);
    procedure edQtyFocusChanged(Sender: TObject);
    procedure edDiscFocusChanged(Sender: TObject);
    procedure edSubtotalFocusChanged(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edQtyKeyPress(Sender: TObject; var Key: Char);
    procedure edDiscKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryPart1, qryPart2 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmPKBSparepart: TfrmPKBSparepart;

implementation

{$R *.dfm}

uses FdmDB, FMain, FmasterPKB;

procedure TfrmPKBSparepart.btnSaveClick(Sender: TObject);
begin
      edSubtotal.EditValue := (edHarga.EditValue - (edHarga.EditValue * edDisc.EditValue / 100)) * edQty.EditValue;
      qryPart1.Close;
      qryPart1.SQL.Clear;
      qryPart1.SQL.Add('select kodedetail from ben_bengkel_pkb_detail ' +
         'where kodedetail = ''' + edKodeSparepart.Text + ''' AND pkbnumber = ''' +
         frmMasterPKB.edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');
      qryPart1.Open;

      if (qryPart1.IsEmpty) then
            begin
               qryPart1.SQL.Clear;
               qryPart1.SQL.Add('insert into ben_bengkel_pkb_detail values(' +
                   '''' + '' + ''',' +
                   '''' + frmMasterPKB.edPKBNumb.Text + ''',' +
                   '''' + FormatDateTime('yyyy-MM-dd', frmMasterPKB.edTglPKB.Date) + ''', ' +
                   '''' + FormatDateTime('hh:mm:ss', frmMasterPKB.edJamPKB.Time) + ''', ' +
                   '''' + 'S' + ''',' +
                   '''' + edKodeSparepart.Text + ''',' +
                   QuotedStr(edNamaSparepart.Text) + ',' +
                   '''' + FloatToStr(edQty.EditValue) + ''',' +
                   '''' + 'PCE' + ''',' +
                   '''' + FloatToStr(edHarga.EditValue) + ''',' +
                   '''' + FloatToStr(edDisc.EditValue) + ''',' +
                   '''' + FloatToStr(edSubtotal.EditValue) + ''',' +
                   '''' + edCharge.Text + ''',' +
                   '''' + 'N' + ''',' +
                   '''' + frmMain.USERAPPS + ''',' +
                 '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
               qryPart1.ExecSQL;
               frmMasterPKB.qryDetails.Close;
               frmMasterPKB.qryDetails.SQL.Clear;
               frmMasterPKB.qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where ' +
                  'pkbnumber = ''' + frmMasterPKB.edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');
               frmMasterPKB.qryDetails.Open;
               frmMasterPKB.gtbPKB.DataController.Refresh;
               frmPKBSparepart.Close;
            end
          else if (NOT qryPart1.IsEmpty) then
            begin
              ShowMessage('Jasa ' + edNamaSparepart.Text + #13 + 'Sudah ada di List PKB');
              Exit;
            end;
end;

procedure TfrmPKBSparepart.btnSelectClick(Sender: TObject);
var
  recSel : Integer;
  kode : String;
begin
  recSel := gtbList.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  kode := vartostr(gtbList.DataController.GetValue(recSel, gtbListkodesparepart.Index));
  qryPart1.Close;
  qryPart1.SQL.Clear;
  qryPart1.SQL.Add('select kodepart, kodecharge, deskripsi, price, satuan from '+
     'ben_bengkel_sparepart where kodepart = ''' + kode + '''');
  qryPart1.Open;
  edKodeSparepart.Text := qryPart1.Fields[0].AsString;
  edCharge.EditValue := qryPart1.Fields[1].AsString;
  edNamaSparepart.Text := qryPart1.Fields[2].AsString;
  edHarga.EditValue := qryPart1.Fields[3].AsFloat;
  edSatuan.EditValue := qryPart1.Fields[4].AsString;
  edQty.EditValue := 1;
  edDisc.EditValue := 0;
  edSubtotal.EditValue := qryPart1.Fields[3].AsFloat;
  edQty.SetFocus;
end;

procedure TfrmPKBSparepart.edCariKodePropertiesChange(Sender: TObject);
var
   kodeCari : String;
begin
     kodeCari := '%' + edCariKode.Text + '%';
     tblList.Close;
     tblList.SQL.Clear;
     tblList.SQL.Add('select * from ben_bengkel_sparepart where kodepart LIKE ' +
       QuotedStr(kodeCari) + ' AND aktif = ''' + 'Y' + ''' AND isdelete = ''' + 'N' + '''');
     tblList.Open;
     gtbList.DataController.Refresh;
end;

procedure TfrmPKBSparepart.edCariTypePropertiesChange(Sender: TObject);
var
   kodeCari : String;
begin
     kodeCari := '%' + edCariNama.Text + '%';
     tblList.Close;
     tblList.SQL.Clear;
     tblList.SQL.Add('select * from ben_bengkel_sparepart where deskripsi LIKE ' +
       QuotedStr(kodeCari) + ' AND aktif = ''' + 'Y' + ''' AND isdelete = ''' + 'N' + '''');
     tblList.Open;
     gtbList.DataController.Refresh;
end;

procedure TfrmPKBSparepart.edDiscFocusChanged(Sender: TObject);
begin
     edSubtotal.EditValue := (edHarga.EditValue - (edHarga.EditValue * edDisc.EditValue / 100)) * edQty.EditValue;
end;

procedure TfrmPKBSparepart.edDiscKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then btnSave.SetFocus;
     if (key = #27) then edQty.SetFocus;
end;

procedure TfrmPKBSparepart.edHargaFocusChanged(Sender: TObject);
begin
     edSubtotal.EditValue := (edHarga.EditValue - (edHarga.EditValue * edDisc.EditValue / 100)) * edQty.EditValue;
end;

procedure TfrmPKBSparepart.edQtyFocusChanged(Sender: TObject);
begin
     edSubtotal.EditValue := (edHarga.EditValue - (edHarga.EditValue * edDisc.EditValue / 100)) * edQty.EditValue;
end;

procedure TfrmPKBSparepart.edQtyKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edDisc.SetFocus;
     if (key = #27) then edCharge.SetFocus;
end;

procedure TfrmPKBSparepart.edSubtotalFocusChanged(Sender: TObject);
begin
     edSubtotal.EditValue := (edHarga.EditValue - (edHarga.EditValue * edDisc.EditValue / 100)) * edQty.EditValue;
end;

procedure TfrmPKBSparepart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    qryPart1.Free;
    qryPart2.Free;
    Action := caFree;
end;

procedure TfrmPKBSparepart.FormCreate(Sender: TObject);
begin
   qryPart1 := TMyQuery.Create(Self);
   qryPart1.Connection := DMDB.dbInternal;
   qryPart1.SQL.Add('select * from temptable');
   qryPart1.Active := true;

   qryPart2 := TMyQuery.Create(Self);
   qryPart2.Connection := DMDB.dbInternal;
   qryPart2.SQL.Add('select * from temptable');
   qryPart2.Active := true;

   tblList.Active := True;
   gtbList.DataController.Refresh;
   tblSatuan.Active := True;
   tblCharge.Active := True;
   //edCariKode.SetFocus;
end;

end.
