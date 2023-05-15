unit FMasukBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, Menus, StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, strUtils,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, cxCalc, cxMemo, DateUtils, dxSkinBlack,
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
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, MemDS, DBAccess, MyAccess;

type
  TfrmMasukBarang = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edTransID: TcxTextEdit;
    edTanggal: TcxDateEdit;
    btnNewTrans: TcxButton;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edSupplier: TcxLookupComboBox;
    Label4: TLabel;
    gtvMasuk: TcxGridTableView;
    gtvMasukIDProduk: TcxGridColumn;
    gtvMasukNamaProduk: TcxGridColumn;
    gtvMasukQtyPO: TcxGridColumn;
    gtvMasukQtyMasuk: TcxGridColumn;
    gtvMasukSisa: TcxGridColumn;
    gtvMasukFinish: TcxGridColumn;
    gtvMasukGudang: TcxGridColumn;
    gtvMasukKet: TcxGridColumn;
    gtvMasukTotMasuk: TcxGridColumn;
    Label5: TLabel;
    edNoPO: TcxTextEdit;
    Label6: TLabel;
    edSJ: TcxTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edPrepared: TcxTextEdit;
    edMengetahui: TcxTextEdit;
    edNotes: TcxMemo;
    btnSave: TcxButton;
    btnReset: TcxButton;
    btnPrint: TcxButton;
    Label7: TLabel;
    edItems: TcxCalcEdit;
    Label8: TLabel;
    edQty: TcxCalcEdit;
    ckFinish: TcxCheckBox;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure btnNewTransClick(Sender: TObject);
    procedure gtvMasukEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure gtvMasukTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure gtvMasukTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure gtvMasukTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure btnResetClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    IDPRODUK : String;
    QTYMASUK : Double;
    procedure CreateAutonum;
    procedure HitungUlang;
    procedure TambahStok;
  public
    { Public declarations }
  end;

var
  frmMasukBarang: TfrmMasukBarang;

implementation

{$R *.dfm}

uses FMain, FdmDB, FMasukCariPO, FMasukBarangPrint;

procedure TfrmMasukBarang.TambahStok;
var
   stokAwal, stokAkhir : Double;
begin
     with dmDB do
          begin
               STR_SQL := 'select id_produk, qty from tbl_stok where id_produk = ''' +
                           IDPRODUK + '''';
               PREPARE_QRY_CARI;
               if (qryCari.IsEmpty) then
                   begin
                        STR_SQL := 'insert into tbl_stok values(' +
                                               '''' + '' + ''',' +
                                               '''' + IDPRODUK + ''',' +
                                               '''' + floattostr(QTYMASUK) + ''',' +
                                               '''' + 'N' + ''')';
                        qryExec.SQL.Clear;
                        qryExec.SQL.Add(STR_SQL);
                        qryExec.ExecSQL;
                   end
               else if (NOT qryCari.IsEmpty) then
                   begin
                        stokAwal := qryCari.Fields[1].AsFloat;
                        stokAkhir := stokAwal + QTYMASUK;
                        //ShowMessage(floattostr(stokAkhir));
                        STR_SQL := 'update tbl_stok set ' +
                                               'qty = ''' + floattostr(stokAkhir) + ''' ' +
                                               'where id_produk = ''' + IDPRODUK + ''' ';
                        qryExec.SQL.Clear;
                        qryExec.SQL.Add(STR_SQL);
                        qryExec.ExecSQL;
                   end;

          end;
end;

procedure TfrmMasukBarang.HitungUlang;
var
   recSelect, i : Integer;
   qtyPO, qtyMasuk,QtySisa, QtyTotal : Double;
begin
     gtvMasuk.DataController.PostEditingData;
     gtvMasuk.DataController.Post(True);
     gtvMasuk.DataController.GotoFirst;

     for i := 0 to gtvMasuk.DataController.RecordCount - 1 do
         begin
              recSelect := gtvMasuk.DataController.GetFocusedRecordIndex;
              qtyPO := gtvMasuk.DataController.GetValue(recSelect, gtvMasukQtyPO.Index);
              qtyMasuk := gtvMasuk.DataController.GetValue(recSelect, gtvMasukQtyMasuk.Index);
              QtyTotal := gtvMasuk.DataController.GetValue(recSelect, gtvMasukTotMasuk.Index);
              QtySisa := qtyPO - (qtyMasuk + QtyTotal);
              gtvMasuk.DataController.SetValue(recSelect, gtvMasukSisa.Index, QtySisa);
              gtvMasuk.DataController.PostEditingData;
              gtvMasuk.DataController.Post(True);
              gtvMasuk.DataController.GotoNext;
         end;
end;

procedure TfrmMasukBarang.btnPrintClick(Sender: TObject);
begin
     Application.CreateForm(TfrmMasukBarangPrint, frmMasukBarangPrint);
     qryMasukMaster.Close;
     qryMasukMaster.SQL.Clear;
     dmDB.qryMasukMaster.SQL.Add('select * from view_masuk_master where id_transaksi = ''' +
                                 edTransID.Text + '''');
     dmDB.qryMasukMaster.Open;

     dmDB.qryMasukDetail.Close;
     dmDB.qryMasukDetail.SQL.Clear;
     dmDB.qryMasukDetail.SQL.Add('select * from view_masuk_detail where id_transaksi = ''' +
                                 edTransID.Text + '''');
     dmDB.qryMasukDetail.Open;
     frmMasukBarangPrint.qrpMasuk.Preview;
end;

procedure TfrmMasukBarang.btnResetClick(Sender: TObject);
begin
     edTransID.Clear;
     edSupplier.Clear;
     edNoPO.Clear;
     edSJ.Clear;
     edMengetahui.Clear;
     edPrepared.Clear;
     edNotes.Clear;
     gtvMasuk.DataController.SelectAll;
     gtvMasuk.DataController.DeleteSelection;
end;

procedure TfrmMasukBarang.btnSaveClick(Sender: TObject);
var
   recSelect, i : Integer;
begin
     Screen.Cursor := crHourGlass;
     HitungUlang;
     with dmDB do
          begin
               STR_SQL := 'select id_transaksi from tbl_masuk_master where id_transaksi = ''' +
                          edTransID.Text + '''';
               PREPARE_QRY_SEARCH;
               if (NOT qrySearch.IsEmpty) then
                   begin
                        CreateAutonum;
                   end;
              STR_SQL := 'insert into tbl_masuk_master values(' +
                         '''' + edTransID.Text + ''',' +
                         '''' + edNoPO.Text + ''',' +
                         '''' + vartostr(edSupplier.EditValue) + ''',' +
                         '''' + edSJ.Text + ''',' +
                         '''' + '' + ''',' +
                         '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
                         '''' + FormatDateTime('hh:mm:ss', Now) + ''',' +
                         '''' + floattostr(edQty.EditValue) + ''',' +
                         '''' + floattostr(edItems.EditValue) + ''',' +
                         '''' + edPrepared.Text + ''',' +
                         '''' + edMengetahui.Text + ''',' +
                         '''' + edNotes.Text + ''')';
              qryExec.SQL.Clear;
              qryExec.SQL.Add(STR_SQL);
              qryExec.ExecSQL;
              if (ckFinish.Checked = True) then
                  begin
                       STR_SQL := 'update tbl_po_master set is_finish = ''' + 'Y' +
                                  ''' where id_transaksi = ''' + edTransID.Text + '''';
                       qryExec.SQL.Clear;
                       qryExec.SQL.Add(STR_SQL);
                       qryExec.ExecSQL;
                  end;
              gtvMasuk.DataController.GotoFirst;
              for i  := 0 to gtvMasuk.DataController.RecordCount - 1 do
                  begin
                       recSelect := gtvMasuk.DataController.GetFocusedRecordIndex;
                       IDPRODUK := vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukIDProduk.Index));
                       QTYMASUK := gtvMasuk.DataController.GetValue(recSelect, gtvMasukQtyMasuk.Index);
                       STR_SQL := 'insert into tbl_masuk_detail values(' +
                                  '''' + '' + ''',' +
                                  '''' + edTransID.Text + ''',' +
                                  '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
                                  '''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukIDProduk.Index)) + ''',' +
                                  '''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukNamaProduk.Index)) + ''',' +
                                  '''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukQtyMasuk.Index)) + ''',' +
                                  '''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukSisa.Index)) + ''',' +
                                  '''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukFinish.Index)) + ''',' +
                                  '''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukGudang.Index)) + ''',' +
                                  '''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukKet.Index)) + ''')';
                       qryExec.SQL.Clear;
                       qryExec.SQL.Add(STR_SQL);
                       qryExec.ExecSQL;
                       Sleep(100);
                       STR_SQL := 'insert into tbl_stok_log values(' +
                                  '''' + '' + ''',' +
                                  '''' + edTransID.Text + ''',' +
                                  '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
                                  '''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukGudang.Index)) + ''',' +
                                  '''' + 'MASUK' + ''',' +
                                  '''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukIDProduk.Index)) + ''',' +
                                  '''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukQtyMasuk.Index)) + ''',' +
                                  '''' + '' + ''',' +
                                  '''' + '' + ''')';
                       qryExec.SQL.Clear;
                       qryExec.SQL.Add(STR_SQL);
                       qryExec.ExecSQL;
                       Sleep(100);
                       STR_SQL := 'select id_produk, is_jasa from tbl_produk where id_produk = ''' +
                                  IDPRODUK + '''';
                       PREPARE_QRY_FIND;
                       if (qryFind.Fields[1].AsString = 'N') then
                           begin
                                TambahStok;
                           end;
                       STR_SQL := 'update tbl_po_detail set ' +
                                  'sisa_qty = ''' + vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukSisa.Index)) + ''' ' +
                                  'where id_transaksi = ''' + edNoPO.Text + ''' and id_produk = ''' +
                                  vartostr(gtvMasuk.DataController.GetValue(recSelect, gtvMasukIDProduk.Index)) + '''';
                       qryExec.SQL.Clear;
                       qryExec.SQL.Add(STR_SQL);
                       qryExec.ExecSQL;
                       gtvMasuk.DataController.GotoNext;
                  end;
              Screen.Cursor := crDefault;
          end;
     btnPrint.Click;
     btnReset.Click;
end;

procedure TfrmMasukBarang.CreateAutonum;
var
   strDate, strCari, newTransID, oldTransID, strLastID, strNewID, strWeek : String;
   intLastID, panjang, intNewID, intWeek : Integer;
begin
     with dmDB do
          begin
               intWeek := WeekOfTheYear(now);
               strWeek :=  'W' + inttostr(intWeek) + '.';
               strDate := 'MB' + FormatDateTime('yyMM', Now);
               strCari := strWeek + 'MB' + FormatDateTime('yyMM', Now) + '%';
               STR_SQL := 'select id_transaksi from tbl_masuk_master where id_transaksi like ''' +
                          strCari + ''' order by id_transaksi ASC';
               PREPARE_QRY_CARI;
               qryCari.Last;
               if (qryCari.IsEmpty) then
                   begin
                        newTransID := strWeek + strDate + '0001';
                        edTransID.Text := newTransID;
                   end
               else if (not qryCari.IsEmpty) then
                   begin
                       strLastID :=  RightStr(qryCari.Fields[0].AsString, 4);
                       intLastID := StrToInt(strLastID);
                       intNewID := intLastID + 1;
                       panjang := Length(inttostr(intNewID));
                       case panjang of
                            1 : newTransID := strWeek + strDate + '000' + IntToStr(intNewID);
                            2 : newTransID := strWeek + strDate + '00' + IntToStr(intNewID);
                            3 : newTransID := strWeek + strDate + '0' + IntToStr(intNewID);
                            4 : newTransID := strWeek + strDate + IntToStr(intNewID);
                       end;
                       edTransID.Text := newTransID;
                   end;
          end;
end;

procedure TfrmMasukBarang.FormCreate(Sender: TObject);
begin
     ckFinish.Checked := False;
     edTanggal.Date := Date;
end;

procedure TfrmMasukBarang.gtvMasukEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
     gtvMasukSisa.EditValue := gtvMasukQtyPO.EditValue - (gtvMasukQtyMasuk.EditValue + gtvMasukTotMasuk.EditValue);
end;

procedure TfrmMasukBarang.gtvMasukTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
     if (AValue = Null) then
         begin
              ckFinish.Checked := False;
         end
     else if (AValue <> Null) then
         begin
              if AValue = 0 then
                 begin
                      ckFinish.Checked := True;
                 end
              else if (AValue <> 0) then
                 begin
                      ckFinish.Checked := False;
                 end;
         end

end;

procedure TfrmMasukBarang.gtvMasukTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
     if (AValue = Null) then
         begin
              edItems.EditValue := 0;
         end
     else if (AValue <> Null) then
         begin
              edItems.EditValue := AValue;
         end;
end;

procedure TfrmMasukBarang.gtvMasukTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
     if (AValue = Null) then
         begin
              edQty.EditValue := 0;
         end
     else if (AValue <> Null) then
         begin
              edQty.EditValue := AValue;
         end;
end;

procedure TfrmMasukBarang.btnNewTransClick(Sender: TObject);
begin
     CreateAutonum;
     edTanggal.Date := Date;
     edPrepared.Text := frmMain.APP_NAME;
     gtvMasuk.DataController.SelectAll;
     gtvMasuk.DataController.DeleteSelection;
     Application.CreateForm(TfrmMasukCariPO, frmMasukCariPO);
     frmMasukCariPO.btnSelectBeli.Visible := False;
     frmMasukCariPO.btnSelectPO.Visible := True;
     frmMasukCariPO.ShowModal;
end;

end.
