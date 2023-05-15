unit FOPL;

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
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Data.DB, DBAccess, MyAccess, MemDS, cxCalc;

type
  TfrmOPL = class(TForm)
    cxLabel2: TcxLabel;
    qrySupplier: TMyQuery;
    dsQrySupplier: TMyDataSource;
    edKodeSupp: TcxLookupComboBox;
    edNamaJasa: TcxTextEdit;
    edCharge: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    edHarga: TcxCalcEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    edDisc: TcxCalcEdit;
    cxLabel8: TcxLabel;
    edSubtotal: TcxCalcEdit;
    cxLabel9: TcxLabel;
    btnAdd: TcxButton;
    btnReset: TcxButton;
    tblCharge: TMyTable;
    dsTblCharge: TMyDataSource;
    cxLabel1: TcxLabel;
    edHargaJual: TcxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure edHargaFocusChanged(Sender: TObject);
    procedure edHargaJualFocusChanged(Sender: TObject);
    procedure edDiscFocusChanged(Sender: TObject);
    procedure edSubtotalFocusChanged(Sender: TObject);
    procedure edKodeSuppKeyPress(Sender: TObject; var Key: Char);
    procedure edChargeKeyPress(Sender: TObject; var Key: Char);
    procedure edNamaJasaKeyPress(Sender: TObject; var Key: Char);
    procedure edHargaKeyPress(Sender: TObject; var Key: Char);
    procedure edHargaJualKeyPress(Sender: TObject; var Key: Char);
    procedure edDiscKeyPress(Sender: TObject; var Key: Char);
    procedure edSubtotalKeyPress(Sender: TObject; var Key: Char);
    procedure btnResetClick(Sender: TObject);
    procedure btnAddKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmOPL: TfrmOPL;

implementation

{$R *.dfm}

uses FdmDB,FMain, FMasterPKB;

procedure TfrmOPL.btnAddClick(Sender: TObject);
var
   h3Persen, hargaJual, HargaDPP : Double;
begin
     if (edKodeSupp.EditValue = '') then
       begin
           ShowMessage('Kode Supplier Masih kosong !');
           Exit;
       end;

     h3Persen := edHarga.EditValue + (edHarga.EditValue * 3 / 100);
     hargaJual := h3Persen + (h3Persen * 40/100);
     edHargaJual.EditValue := hargaJual;
     edSubtotal.EditValue := hargaJual - (hargaJual * edDisc.EditValue / 100);

       qryExec.SQL.Clear;
       qryExec.SQL.Add('insert into ben_bengkel_pkb_detail values(' +
           '''' + '' + ''',' +
           '''' + frmMasterPKB.edPKBNumb.Text + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', frmMasterPKB.edTglPKB.Date) + ''', ' +
           '''' + FormatDateTime('hh:mm:ss', frmMasterPKB.edJamPKB.Time) + ''', ' +
           '''' + 'O' + ''',' +
           '''' + vartostr(edKodeSupp.EditValue) + ''',' +
           QuotedStr(edNamaJasa.Text) + ',' +
           '''' + '1' + ''',' +
           '''' + 'PCE' + ''',' +
           '''' + FloatToStr(edHargaJual.EditValue) + ''',' +
           '''' + FloatToStr(edDisc.EditValue) + ''',' +
           '''' + FloatToStr(edSubtotal.EditValue) + ''',' +
           '''' + edCharge.Text + ''',' +
           '''' + 'N' + ''',' +
           '''' + frmMain.USERAPPS + ''',' +
         '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
       qryExec.ExecSQL;
       frmMasterPKB.qryDetails.Close;
       frmMasterPKB.qryDetails.SQL.Clear;
       frmMasterPKB.qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where ' +
          'pkbnumber = ''' + frmMasterPKB.edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');
       frmMasterPKB.qryDetails.Open;
       frmMasterPKB.gtbPKB.DataController.Refresh;
     frmOPL.Close;
end;

procedure TfrmOPL.btnAddKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #27) then edSubtotal.SetFocus;
end;

procedure TfrmOPL.btnResetClick(Sender: TObject);
begin
    frmOPL.Close;
end;

procedure TfrmOPL.edChargeKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #13) then edNamaJasa.SetFocus;
     if (Key = #27) then edKodeSupp.SetFocus;
end;

procedure TfrmOPL.edDiscFocusChanged(Sender: TObject);
var
   h3Persen, hargaJual : Double;
begin
     h3Persen := edHarga.EditValue + (edHarga.EditValue * 3 / 100);
     hargaJual := h3Persen + (h3Persen * 40/100);
     edHargaJual.EditValue := hargaJual;
     edSubtotal.EditValue := hargaJual - (hargaJual * edDisc.EditValue / 100);
end;

procedure TfrmOPL.edDiscKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #13) then edSubtotal.SetFocus;
     if (Key = #27) then edHargaJual.SetFocus;
end;

procedure TfrmOPL.edHargaFocusChanged(Sender: TObject);
var
   h3Persen, hargaJual : Double;
begin
     h3Persen := edHarga.EditValue + (edHarga.EditValue * 3 / 100);
     hargaJual := h3Persen + (h3Persen * 40/100);
     edHargaJual.EditValue := hargaJual;
     edSubtotal.EditValue := hargaJual - (hargaJual * edDisc.EditValue / 100);
end;

procedure TfrmOPL.edHargaJualFocusChanged(Sender: TObject);
var
   h3Persen, hargaJual : Double;
begin
     h3Persen := edHarga.EditValue + (edHarga.EditValue * 3 / 100);
     hargaJual := h3Persen + (h3Persen * 40/100);
     edHargaJual.EditValue := hargaJual;
     edSubtotal.EditValue := hargaJual - (hargaJual * edDisc.EditValue / 100);
end;

procedure TfrmOPL.edHargaJualKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #13) then edDisc.SetFocus;
     if (Key = #27) then edHarga.SetFocus;
end;

procedure TfrmOPL.edHargaKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13) then edHargaJual.SetFocus;
     if (Key = #27) then edNamaJasa.SetFocus;
end;

procedure TfrmOPL.edKodeSuppKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #13) then edCharge.SetFocus;
     if (Key = #27) then frmOPL.Close;
end;

procedure TfrmOPL.edNamaJasaKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #13) then edHarga.SetFocus;
     if (Key = #27) then edCharge.SetFocus;
end;

procedure TfrmOPL.edSubtotalFocusChanged(Sender: TObject);
var
   h3Persen, hargaJual : Double;
begin
   h3Persen := edHarga.EditValue + (edHarga.EditValue * 3 / 100);
     hargaJual := h3Persen + (h3Persen * 40/100);
     edHargaJual.EditValue := hargaJual;
     edSubtotal.EditValue := hargaJual - (hargaJual * edDisc.EditValue / 100);
end;

procedure TfrmOPL.edSubtotalKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #13) then btnAdd.SetFocus;
     if (Key = #27) then edDisc.SetFocus;
end;

procedure TfrmOPL.FormCreate(Sender: TObject);
begin
   qrySupplier.Active := true;
   tblCharge.Active := True;

   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;
end;

end.
