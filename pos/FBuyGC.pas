unit FBuyGC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView, cxClasses,
  cxGridLevel, cxGrid, cxTextEdit, cxCalc, cxContainer, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB,
  cxDBData, cxGridDBTableView, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, AdvGlowButton, cxCalendar, AppEvnts, cxLookAndFeels, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator, MyAccess,
  DBAccess, MemDS, XSuperJson, XSuperObject;

type
  TfrmBuyGC = class(TForm)
    dsQryMenu: TDataSource;
    QryMenu: TMyQuery;
    Label3: TLabel;
    edHarga: TcxCalcEdit;
    btnFinish: TcxButton;
    btnCancel: TcxButton;
    Label6: TLabel;
    lblKodeTrans: TLabel;
    Label10: TLabel;
    edNamaMenu: TcxLookupComboBox;
    Label1: TLabel;
    edQty: TcxCalcEdit;
    Label2: TLabel;
    edSubtotal: TcxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNamaMenuPropertiesEditValueChanged(Sender: TObject);
    procedure edNamaMenuKeyPress(Sender: TObject; var Key: Char);
    procedure edQtyPropertiesEditValueChanged(Sender: TObject);
    procedure edQtyKeyPress(Sender: TObject; var Key: Char);
    procedure edQtyFocusChanged(Sender: TObject);
    procedure edHargaFocusChanged(Sender: TObject);
    procedure edSubtotalFocusChanged(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
  private
    { Private declarations }
    qryCari, qryFind, qrySearch, qryExec : TMyQuery;
  public
    { Public declarations }
    ID_TR, CUSTNAME, ID_ROOM : String;
    varTanggal : TDate;
    varJam     : TTime;
  end;

var
  frmBuyGC: TfrmBuyGC;

implementation

uses FDMDB, FMain, FPosTransMain;

{$R *.dfm}

procedure TfrmBuyGC.btnFinishClick(Sender: TObject);
var
   keterangan : String;
   subtotal : Double;
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select menu_id, harga, lama, disc_hh, disc_normal, harga_hh, harga_normal from ' +
        'main_menu where menu_id = ''' + VarToStr(edNamaMenu.EditValue) + '''');
   qrySearch.Open;
   edHarga.EditValue := qrySearch.Fields[6].AsFloat;
   edSubtotal.EditValue := edHarga.EditValue * edQty.EditValue;
   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd', varTanggal) + '@' + FormatDateTime('hh:mm:ss', varJam);

   qryExec.SQL.Clear;
   qryExec.SQL.Add('INSERT INTO trans_detail VALUES(' +
                    '''' + '' + ''', ' +
                    '''' + lblKodeTrans.Caption + ''', ' +
                    '''' + FormatDateTime('yyyy-MM-dd', varTanggal) + ''', ' +
                    '''' + 'BG' + ''', ' +
                    QuotedStr(vartostr(edNamaMenu.EditValue)) + ',' +
                    QuotedStr(edNamaMenu.Text) + ',' +
                    '''' + FormatDateTime('hh:mm:ss', varJam) + ''', ' +
                    '''' + FormatDateTime('hh:mm:ss', varJam) + ''', ' +
                    '''' + vartostr(edHarga.EditValue) + ''', ' +
                    '''' + '0' + ''', ' +
                    '''' + '0' + ''', ' +
                    '''' + vartostr(edSubtotal.EditValue) + ''', ' +
                    '''' + '' + ''', ' +
                    '''' + '' + ''', ' +
                    '''' + vartostr(edQty.EditValue) + ''', ' +
                    '''' + '' + ''', ' +
                    '''' + '0' + ''', ' +
                    '''' + '(NONE)' + ''', ' +
                    QuotedStr(CUSTNAME) + ',' +
                    '''' + 'N' + ''', ' +
                    '''' + '(NONE)' + ''', ' +
                    '''' + 'N' + ''', ' +
                    QuotedStr(keterangan) + ');');
   qryExec.SQL.Add('update main_menu set ' +
       'aktif = ''' + 'S' +
       ''' where menu_id = ''' + VarToStr(edNamaMenu.EditValue) + ''';');
   qryExec.ExecSQL;

   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select sum(subtotal) from trans_detail where id_trans = ''' +
       lblKodeTrans.Caption + '''');
   qryFind.Open;
   subtotal := qryFind.Fields[0].AsFloat;

   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
      'subtotal = ''' + FloatToStr(subtotal) + ''',' +
      'promo = ''' + 'S' + ''',' +
      'cabang = ' + QuotedStr(keterangan) + ' ' +
      'where trans_id = ''' + lblKodeTrans.Caption + ''';');
   qryExec.ExecSQL;

   frmPosTransMain.qryMaster.Refresh;
   frmPosTransMain.gtbMaster.DataController.Refresh;
   frmPosTransMain.qryDetails.Refresh;
   frmPosTransMain.tbDetails.DataController.Refresh;
   frmBuyGC.Close;
end;

procedure TfrmBuyGC.edHargaFocusChanged(Sender: TObject);
begin
   edSubtotal.EditValue := edHarga.EditValue * edQty.EditValue;
end;

procedure TfrmBuyGC.edNamaMenuKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
     begin
       qrySearch.Close;
       qrySearch.SQL.Clear;
       qrySearch.SQL.Add('select menu_id, harga, lama, disc_hh, disc_normal, harga_hh, harga_normal from ' +
            'main_menu where menu_id = ''' + VarToStr(edNamaMenu.EditValue) + '''');
       qrySearch.Open;
       edHarga.EditValue := qrySearch.Fields[6].AsFloat;
       edSubtotal.EditValue := edHarga.EditValue * edQty.EditValue;

       edQty.SetFocus;
     end;
end;

procedure TfrmBuyGC.edNamaMenuPropertiesEditValueChanged(Sender: TObject);
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select menu_id, harga, lama, disc_hh, disc_normal, harga_hh, harga_normal from ' +
        'main_menu where menu_id = ''' + VarToStr(edNamaMenu.EditValue) + '''');
   qrySearch.Open;
   edHarga.EditValue := qrySearch.Fields[6].AsFloat;
   edSubtotal.EditValue := edHarga.EditValue * edQty.EditValue;


end;

procedure TfrmBuyGC.edQtyFocusChanged(Sender: TObject);
begin
   edSubtotal.EditValue := edHarga.EditValue * edQty.EditValue;
end;

procedure TfrmBuyGC.edQtyKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
     begin
       edSubtotal.EditValue := edHarga.EditValue * edQty.EditValue;
       btnFinish.SetFocus;
     end;
end;

procedure TfrmBuyGC.edQtyPropertiesEditValueChanged(Sender: TObject);
begin
   edSubtotal.EditValue := edHarga.EditValue * edQty.EditValue;
end;

procedure TfrmBuyGC.edSubtotalFocusChanged(Sender: TObject);
begin
   edSubtotal.EditValue := edHarga.EditValue * edQty.EditValue;
end;

procedure TfrmBuyGC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'promo = ''' + 'S' + ''' ' +
       'where trans_id = ''' + lblKodeTrans.Caption + ''';');
   qryExec.ExecSQL;

  qrySearch.Free;
  qryCari.Free;
  qryFind.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmBuyGC.FormCreate(Sender: TObject);
begin
    qrySearch := TMyQuery.Create(Self);
    qrySearch.Connection := dmDB.dbInternal;
    qrySearch.SQL.Add('select * from temptable');
    qrySearch.Active := true;

    qryCari := TMyQuery.Create(Self);
    qryCari.Connection := dmDB.dbInternal;
    qryCari.SQL.Add('select * from temptable');
    qryCari.Active := true;

    qryFind := TMyQuery.Create(Self);
    qryFind.Connection := dmDB.dbInternal;
    qryFind.SQL.Add('select * from temptable');
    qryFind.Active := true;

    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := dmDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;
end;

end.
