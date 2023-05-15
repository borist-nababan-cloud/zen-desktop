unit FPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, Menus, StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxCalc,
  cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, cxLookupEdit, cxDBLookupEdit, cxCheckBox,
  cxMemo, strUtils, DateUtils, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator;

type
  TfrmPembelian = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edTransID: TcxTextEdit;
    edTanggal: TcxDateEdit;
    btnNewTrans: TcxButton;
    Label3: TLabel;
    cxGrid1: TcxGrid;
    gtvPurchase: TcxGridTableView;
    gtvPurchaseIDProduk: TcxGridColumn;
    gtvPurchaseNamaProduk: TcxGridColumn;
    gtvPurchaseQty: TcxGridColumn;
    gtvPurchaseSatuan: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    gtvPurchaseNett: TcxGridColumn;
    btnAddItems: TcxButton;
    edSupp: TcxLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edTglTempo: TcxDateEdit;
    ckKonsinyasi: TcxCheckBox;
    edSubt: TcxCalcEdit;
    Label7: TLabel;
    Label8: TLabel;
    edDisc: TcxCalcEdit;
    Label9: TLabel;
    edTotal: TcxCalcEdit;
    ckTax: TcxCheckBox;
    edTax: TcxCalcEdit;
    Label10: TLabel;
    edGrand: TcxCalcEdit;
    edPrepared: TcxTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    edMengetahui: TcxTextEdit;
    Label13: TLabel;
    edNotes: TcxMemo;
    btnSave: TcxButton;
    btnReset: TcxButton;
    gtvPurchaseSubtotal: TcxGridColumn;
    Label14: TLabel;
    edBiayaKirim: TcxCalcEdit;
    Label15: TLabel;
    edDiscPersen: TcxCalcEdit;
    edJumlhDisc: TcxCalcEdit;
    btnEdit: TcxButton;
    edTempo: TcxCalcEdit;
    pmShort: TPopupMenu;
    NewItems1: TMenuItem;
    EditProduk1: TMenuItem;
    btnPrint: TcxButton;
    Label16: TLabel;
    edNoPO: TcxTextEdit;
    Label17: TLabel;
    edInvoice: TcxTextEdit;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure btnNewTransClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure ckTaxPropertiesChange(Sender: TObject);
    procedure edSuppKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edTempoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddItemsClick(Sender: TObject);
    procedure edDiscKeyPress(Sender: TObject; var Key: Char);
    procedure edDiscPersenKeyPress(Sender: TObject; var Key: Char);
    procedure ckTaxKeyPress(Sender: TObject; var Key: Char);
    procedure edBiayaKirimKeyPress(Sender: TObject; var Key: Char);
    procedure edMengetahuiKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditClick(Sender: TObject);
    procedure NewItems1Click(Sender: TObject);
    procedure EditProduk1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure gtvPurchaseTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure gtvPurchaseEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
  private
    { Private declarations }
    procedure CreateAutonum;
    procedure HitungUlang;
  public
    { Public declarations }
  end;

var
  frmPembelian: TfrmPembelian;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasukCariPO, FPembelianPrint;

procedure TfrmPembelian.HitungUlang;
var
   recSelect, i : Integer;
   qty, Harga, Subtotal : Double;
begin
     gtvPurchase.DataController.PostEditingData;
     gtvPurchase.DataController.Post(True);
     gtvPurchase.DataController.GotoFirst;
     for i := 0 to gtvPurchase.DataController.RecordCount - 1 do
         begin
              recSelect := gtvPurchase.DataController.GetFocusedRecordIndex;
              qty := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseQty.Index);
              Harga := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseNett.Index);
              Subtotal := qty * harga;
              gtvPurchase.DataController.SetValue(recSelect, gtvPurchaseSubtotal.Index, Subtotal);
              gtvPurchase.DataController.PostEditingData;
              gtvPurchase.DataController.Post(True);
         end;

end;

procedure TfrmPembelian.ckTaxKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then edBiayaKirim.SetFocus;
     if (key = #27) then edDisc.SetFocus;
end;

procedure TfrmPembelian.ckTaxPropertiesChange(Sender: TObject);
begin
     if (ckTax.Checked = True) then
         begin
              edTax.EditValue := edTotal.EditValue * 0.1;
              edGrand.EditValue := edTotal.EditValue + edTax.EditValue + edBiayaKirim.EditValue;
         end
     else if (ckTax.Checked = False) then
         begin
              edGrand.EditValue := edTotal.EditValue + edBiayaKirim.EditValue;
              edTax.EditValue := 0;
         end;
end;

procedure TfrmPembelian.CreateAutonum;
var
   strDate, strCari, newTransID, oldTransID, strLastID, strNewID, strWeek : String;
   intLastID, panjang, intNewID, intWeek : Integer;
begin
     with dmDB do
          begin
               intWeek := WeekOfTheYear(Now);
               strWeek := 'W' + inttostr(intWeek) + '.';
               strDate := 'BL' + FormatDateTime('yyMM', Now);
               strCari := strWeek + 'BL' + FormatDateTime('yyMM', Now) + '%';
               STR_SQL := 'select id_transaksi from tbl_beli_master where id_transaksi like ''' +
                          strCari + ''' order by id_transaksi ASC';
               PREPARE_QRY_CARI;
               qryCari.Last;
               //ShowMessage(qryCari.Fields[0].AsString);
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

procedure TfrmPembelian.btnAddItemsClick(Sender: TObject);
begin
     {if (edTransID.Text = '') then
         begin
              ShowMessage('Maaf No Transaksi Masih Kosong !!');
              Exit;
         end;
     Application.CreateForm(TfrmPurchaseOrderDetail, frmPurchaseOrderDetail);
     //dmDB.tblProduk.Active :=
     dmDB.tblProduk.Refresh;
     frmPurchaseOrderDetail.btnTambah.Caption := 'TAMBAH';
     frmPurchaseOrderDetail.ShowModal;}

end;

procedure TfrmPembelian.btnSaveClick(Sender: TObject);
var
   recSelect, i : Integer;

begin
     if (edTransID.Text = '') then
         begin
              ShowMessage('Nomor Transaksi masih kosong !');
              Exit;
         end;
     if (edInvoice.Text = '') then
         begin
              ShowMessage('No Invoice masih kosong !');
              Exit;
         end;
     if (edMengetahui.Text = '') then
         begin
              ShowMessage('Nama mengetahui masih kosong !');
              Exit;
         end;
     Screen.Cursor := crHourGlass;
     HitungUlang;
     edJumlhDisc.EditValue := edSubt.EditValue * edDiscPersen.EditValue / 100;
     edTotal.EditValue := edSubt.EditValue - edJumlhDisc.EditValue - edDisc.EditValue;
     edGrand.EditValue := edTotal.EditValue + edTax.EditValue + edBiayaKirim.EditValue;
     //edDisc.SetFocus;
     with dmDB do
          begin
               STR_SQL := 'select id_transaksi from tbl_beli_master where id_transaksi = ''' +
                          edTransID.Text + '''';
               PREPARE_QRY_SEARCH;
               if (not qrySearch.IsEmpty) then
                   begin
                        CreateAutonum;
                   end;
               STR_SQL := 'insert into tbl_beli_master values(' +
                          '''' + edTransID.Text + ''',' +
                          '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
                          '''' + FormatDateTime('hh:mm:ss', Now) + ''',' +
                          '''' + edNoPO.Text + ''',' +
                          '''' + edInvoice.Text + ''',' +
                          '''' + '' + ''',' +
                          '''' + vartostr(edTempo.EditValue) + ''',' +
                          '''' + FormatDateTime('yyyy-MM-dd', edTglTempo.Date) + ''',' +
                          '''' + vartostr(edSupp.EditValue) + ''',' +
                          '''' + 'N' + ''',' +
                          '''' + FloatToStr(0) + ''',' +
                          '''' + vartostr(edSubt.EditValue) + ''',' +
                          '''' + vartostr(edDiscPersen.EditValue) + ''',' +
                          '''' + vartostr(edJumlhDisc.EditValue) + ''',' +
                          '''' + vartostr(edDisc.EditValue) + ''',' +
                          '''' + vartostr(edTotal.EditValue) + ''',' +
                          '''' + vartostr(ckTax.EditValue) + ''',' +
                          '''' + vartostr(edTax.EditValue) + ''',' +
                          '''' + vartostr(edBiayaKirim.EditValue) + ''',' +
                          '''' + vartostr(edGrand.EditValue) + ''',' +
                          '''' + edPrepared.Text + ''',' +
                          '''' + edMengetahui.Text + ''',' +
                          '''' + edNotes.Text + ''',' +
                          '''' + 'N' + ''',' +
                          '''' + 'N' + ''')';
               qryExec.SQL.Clear;
               qryExec.SQL.Add(STR_SQL);
               qryExec.ExecSQL;
               Sleep(100);
               STR_SQL := 'update tbl_po_master set ' +
                          'is_finish = ''' + 'Y' + ''', ' +
                          'is_validate = ''' + 'Y' + ''' ' +
                          'where id_transaksi = ''' + edNoPO.Text + '''';
               qryExec.SQL.Clear;
               qryExec.SQL.Add(STR_SQL);
               qryExec.ExecSQL;
               gtvPurchase.DataController.GotoFirst;

               for i := 0 to gtvPurchase.DataController.RecordCount - 1 do
                   begin
                        recSelect := gtvPurchase.DataController.GetFocusedRecordIndex;
                        STR_SQL := 'insert into tbl_beli_detail values(' +
                                   '''' + '' + ''',' +
                                   '''' + edTransID.Text + ''',' +
                                   '''' + edNoPO.Text + ''',' +
                                   '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
                                   '''' + vartostr(gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseIDProduk.Index)) + ''',' +
                                   '''' + vartostr(gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseNamaProduk.Index)) + ''',' +
                                   '''' + vartostr(gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseQty.Index)) + ''',' +
                                   '''' + vartostr(gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseNett.Index)) + ''',' +
                                   '''' + vartostr(gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseSubtotal.Index)) + ''',' +
                                   '''' + 'N' + ''',' +
                                   '''' + 'N' + ''',' +
                                   '''' + 'N' + ''')';
                        qryExec.SQL.Clear;
                        qryExec.SQL.Add(STR_SQL);
                        qryExec.ExecSQL;
                        gtvPurchase.DataController.GotoNext;

                   end;
               Screen.Cursor := crDefault;
               btnPrint.Click;
          end;

     btnReset.Click;
end;

procedure TfrmPembelian.btnResetClick(Sender: TObject);
begin
     gtvPurchase.DataController.SelectAll;
     gtvPurchase.DataController.DeleteSelection;
     edTransID.Clear;
     edSupp.Clear;
     edPrepared.Clear;
     edMengetahui.Clear;
     edNotes.Clear;
     edTglTempo.Date := Date;
     edTanggal.Date := Date;
     ckTax.Checked := false;
     ckKonsinyasi.Checked := false;
     edTempo.EditValue := 0;
     edSubt.EditValue := 0;
     edDisc.EditValue := 0;
     edJumlhDisc.EditValue := 0;
     edTotal.EditValue := 0;
     edTax.EditValue := 0;
     edBiayaKirim.EditValue := 0;
     edGrand.EditValue := 0;
     btnNewTrans.SetFocus;
end;

procedure TfrmPembelian.edBiayaKirimKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (key = #13) then
         begin
              edGrand.EditValue := edTotal.EditValue + edTax.EditValue + edBiayaKirim.EditValue;
              edMengetahui.SetFocus;
         end;
      if (key = #27) then ckTax.SetFocus;

end;

procedure TfrmPembelian.edDiscKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              edTotal.EditValue := edSubt.EditValue - edJumlhDisc.EditValue - edDisc.EditValue;
              edGrand.EditValue := edTotal.EditValue + edTax.EditValue + edBiayaKirim.EditValue;
              ckTax.SetFocus;
         end;
     if (key = #27) then edDiscPersen.SetFocus;

end;

procedure TfrmPembelian.edDiscPersenKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key = #13) then
         begin
              edJumlhDisc.EditValue := edSubt.EditValue * edDiscPersen.EditValue / 100;
              edTotal.EditValue := edSubt.EditValue - edJumlhDisc.EditValue - edDisc.EditValue;
              edGrand.EditValue := edTotal.EditValue + edTax.EditValue + edBiayaKirim.EditValue;
              edDisc.SetFocus;
         end;
end;

procedure TfrmPembelian.EditProduk1Click(Sender: TObject);
begin
     btnEdit.Click;
end;

procedure TfrmPembelian.edMengetahuiKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key = #13) then edNotes.SetFocus;
     if (key = #27) then edBiayaKirim.SetFocus;
end;

procedure TfrmPembelian.edSuppKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then
        begin
             dmDB.STR_SQL := 'select nama_supp, tempo, is_kosinyasi ' +
                             'from tbl_supplier where id_supp = ''' + vartostr(edSupp.EditValue) + '''';
             dmDB.PREPARE_QRY_CARI;
             edTempo.EditValue := dmDB.qryCari.Fields[1].AsInteger;
             ckKonsinyasi.EditValue := dmDB.qryCari.Fields[2].asstring;
             edTglTempo.Date := IncDay(edTanggal.Date, edTempo.EditValue);
             edTempo.SetFocus;
        end;
    if (key = #27) then edTanggal.SetFocus;

end;

procedure TfrmPembelian.edTempoKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
              edTglTempo.Date := IncDay(edTanggal.Date, edTempo.EditValue);
              edTglTempo.SetFocus;
         end;
     if (key = #27) then edTglTempo.SetFocus;
     
end;

procedure TfrmPembelian.FormCreate(Sender: TObject);
begin
     edTanggal.Date := Date;
     edTglTempo.Date := Date;
end;

procedure TfrmPembelian.btnEditClick(Sender: TObject);
var
   recSelect : Integer;
begin
     {recSelect := gtvPurchase.DataController.GetFocusedRecordIndex;
     Application.CreateForm(TfrmPurchaseOrderDetail, frmPurchaseOrderDetail);
     frmPurchaseOrderDetail.btnTambah.Caption := 'UPDATE';
     frmPurchaseOrderDetail.edPRodukID.Text := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseIDProduk.Index);
     frmPurchaseOrderDetail.edNamaProduk.Text := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseNamaProduk.Index);
     frmPurchaseOrderDetail.edQty.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseQty.Index);
     frmPurchaseOrderDetail.edHarga.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseHBeli.Index);
     frmPurchaseOrderDetail.edDisc1.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseDisc1.Index);
     frmPurchaseOrderDetail.edDisc2.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseDisc2.Index);
     frmPurchaseOrderDetail.edDisc3.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseDisc3.Index);
     frmPurchaseOrderDetail.edDiscRp.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseDiscRp.Index);
     frmPurchaseOrderDetail.edTotDisc.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseTotDisc.Index);
     frmPurchaseOrderDetail.edNett.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseNett.Index);
     frmPurchaseOrderDetail.edSubtotal.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseSubtotal.Index);
     frmPurchaseOrderDetail.edSatuan.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseSatuan.Index);
     frmPurchaseOrderDetail.edTotal.EditValue := gtvPurchase.DataController.GetValue(recSelect, gtvPurchaseTotal.Index);
     frmPurchaseOrderDetail.SELECTREC := recSelect;
     frmPurchaseOrderDetail.ShowModal;}

end;

procedure TfrmPembelian.btnNewTransClick(Sender: TObject);
begin
     CreateAutonum;
     edTanggal.Date := Date;
     edPrepared.Text := frmMain.NAMAAPP;
     gtvPurchase.DataController.SelectAll;
     gtvPurchase.DataController.DeleteSelection;
     Application.CreateForm(TfrmMasukCariPO, frmMasukCariPO);
     frmMasukCariPO.btnSelectBeli.Visible := True;
     frmMasukCariPO.btnSelectPO.Visible := False;
     {with dmDB do
          begin
               if (btnSelectPO.Visible = True) then
                   begin
                        qryCariPO.Close;
                        qryCariPO.SQL.Clear;
                        qryCariPO.SQL.Add('select * from tbl_po_master where is_finish = ''' + 'N' +
                                ''' and is_del = ''' + 'N' + '''');
                        qryCariPO.Open;
                        frmMasukCariPO.gtbPO.DataController.Refresh;

                        qryPODetail.Close;
                        qryPODetail.SQL.Clear;
                        qryPODetail.SQL.Add('select * from view_po_detail where id_transaksi = ''' + 'X' + '''');
                        qryPODetail.Open;
                        gtbDetail.DataController.Refresh;
                   end
               else if (btnSelectPO.Visible = False) then
                   begin
                        qryCariPO.Close;
                        qryCariPO.SQL.Clear;
                        qryCariPO.SQL.Add('select * from tbl_po_master where is_validate = ''' + 'N' +
                                ''' and is_del = ''' + 'N' + ''' and is_konsinyasi = ''' + 'N' + '''');
                        qryCariPO.Open;
                        gtbPO.DataController.Refresh;

                        qryPODetail.Close;
                        qryPODetail.SQL.Clear;
                        qryPODetail.SQL.Add('select * from view_po_detail where id_transaksi = ''' + 'X' + '''');
                        qryPODetail.Open;
                        gtbDetail.DataController.Refresh;
                   end;


          end;}
     frmMasukCariPO.ShowModal;
end;

procedure TfrmPembelian.btnPrintClick(Sender: TObject);
begin
     Application.CreateForm(TfrmPembelianPrint, frmPembelianPrint);
     dmDB.viewBeliMaster.Close;
     dmDB.viewBeliMaster.SQL.Clear;
     dmDB.viewBeliMaster.SQL.Add('select * from view_beli_master where id_transaksi = ''' +
                             edTransID.Text + '''');
     dmDB.viewBeliMaster.Open;

     dmDB.viewBeliDetail.Close;
     dmDB.viewBeliDetail.SQL.Clear;
     dmDB.viewBeliDetail.SQL.Add('select * from view_beli_detail where id_transaksi = ''' +
                             edTransID.Text + '''');
     dmDB.viewBeliDetail.Open;
     frmPembelianPrint.qrpPembelian.Preview;
end;

procedure TfrmPembelian.gtvPurchaseEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
     gtvPurchaseSubtotal.EditValue := gtvPurchaseQty.EditValue * gtvPurchaseNett.EditValue;
end;

procedure TfrmPembelian.gtvPurchaseTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
     if (AValue = Null) then
         begin
              edSubt.EditValue := 0;
              edTax.EditValue := 0;
              edTotal.EditValue := 0;
              edGrand.EditValue := 0;
              //edSubt.EditValue := 0;
         end
     else if (AValue <> Null) then
         begin
              edSubt.EditValue := AValue;
              edTotal.EditValue := edSubt.EditValue - edDisc.EditValue - edJumlhDisc.EditValue;
              if (ckTax.Checked = True) then
                  begin
                       edTax.EditValue := edTotal.EditValue * 0.1;
                       edGrand.EditValue := edTotal.EditValue + edTax.EditValue + edBiayaKirim.EditValue;
                  end
              else if (ckTax.Checked = False) then
                  begin
                       edTax.EditValue := 0;
                       edGrand.EditValue := edTotal.EditValue + edBiayaKirim.EditValue;
                  end;

         end;
end;

procedure TfrmPembelian.NewItems1Click(Sender: TObject);
begin
     btnAddItems.Click;
end;

end.
