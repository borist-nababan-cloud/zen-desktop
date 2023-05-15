unit FMaster1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxButtonEdit, cxCalc, cxGridLevel,
  cxGridBandedTableView, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, ExtCtrls,
  ToolWin, ComCtrls, DBCtrls, ImgList, DB, cxDBData,
  cxGridDBBandedTableView, cxDBLookupComboBox, cxTextEdit, cxCheckBox,
  Buttons, cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxLabel, cxDBLabel, Menus, cxLookAndFeelPainters,
  cxButtons, cxDBEdit, cxGroupBox, cxCalendar, cxNavigator,
  cxDBNavigator, cxSplitter, cxListBox,DateUtils, strUtils,
  cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Printers, dxCore,
  cxDateUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, System.ImageList,
  MemDS, DBAccess, MyAccess;

const
InputBoxMessage = WM_USER + 200;
type
  TfrmMaster1 = class(TForm)
    imgNor: TImageList;
    imgHot: TImageList;
    imgDis: TImageList;
    imgCtrlDis: TImageList;
    imgCtrlHot: TImageList;
    imgCtrlNor: TImageList;
    PrintDialog1: TPrintDialog;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label10: TLabel;
    edTanggal: TcxDateEdit;
    edTglShow: TEdit;
    cbJenisTrans: TcxComboBox;
    lcbTransID: TcxLookupComboBox;
    edCustomer: TcxTextEdit;
    EQty: TcxCalcEdit;
    EdSubTotal: TcxCalcEdit;
    edDiscount: TcxCalcEdit;
    edRetur: TcxCalcEdit;
    edPayment: TcxComboBox;
    edDP: TcxCalcEdit;
    edPayment2: TcxComboBox;
    edBayar2: TcxCalcEdit;
    edNamaBank: TcxTextEdit;
    edNoGiro: TcxTextEdit;
    edJatuhTempo: TcxDateEdit;
    edEditTgl: TEdit;
    edTotBayar: TcxCalcEdit;
    edKembalian: TcxCalcEdit;
    edNotes: TcxTextEdit;
    edToko: TcxLookupComboBox;
    Panel1: TPanel;
    cxGroupBox2: TcxGroupBox;
    btnStopScanner1: TcxButton;
    btnStartScanner1: TcxButton;
    cxDBNavigator1: TcxDBNavigator;
    btnNew: TcxButton;
    btnDelete: TcxButton;
    btnBrowse: TcxButton;
    edNoNota: TcxTextEdit;
    btnSave: TcxButton;
    btnPrint: TcxButton;
    btnUpdateHarga: TcxButton;
    cxGroupBox3: TcxGroupBox;
    Label8: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    lblSisaBayar: TLabel;
    lblRp: TLabel;
    Label15: TLabel;
    edGrand: TcxCalcEdit;
    edFaktur: TcxTextEdit;
    edSisaBayar: TcxCalcEdit;
    edUser: TcxTextEdit;
    grdItems: TcxGrid;
    gtvItem: TcxGridBandedTableView;
    gtvItemNo: TcxGridBandedColumn;
    gtvItemId: TcxGridBandedColumn;
    gtvItemJenis: TcxGridBandedColumn;
    gtvItemDoz: TcxGridBandedColumn;
    gtvItemPcs: TcxGridBandedColumn;
    gtvItemQty: TcxGridBandedColumn;
    gtvItemHarga: TcxGridBandedColumn;
    gtvItemSubTotal: TcxGridBandedColumn;
    gtvItemKet: TcxGridBandedColumn;
    gtvItemUpdate: TcxGridBandedColumn;
    glvItems: TcxGridLevel;
    cxLabel1: TcxLabel;
    edScan: TcxTextEdit;
    memBenPrint: TMemo;
    qryPrintMstr: TMyQuery;
    dsQryPrintMstr: TDataSource;
    QryPrintDetail: TMyQuery;
    dsQryPrintDetail: TDataSource;
    qryTrans1: TMyQuery;
    dsqryTrans1: TDataSource;
    qryTrans2: TMyQuery;
    dsQryTrans2: TDataSource;
    qryJenisTrans: TMyQuery;
    dsQryJenisTrans: TDataSource;
    qryDelete: TMyQuery;
    dsQryDelete: TDataSource;
    tblTrans1: TMyTable;
    dsTblTrans1: TDataSource;
    qryToko: TMyQuery;
    dsQryToko: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure k(Sender: TObject);
    procedure gtvItemIdPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure gtvItemDozPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure gtvItemPcsPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure btnDeleteClick(Sender: TObject);
    procedure gtvItemTcxGridDataControllerTcxDataSummaryFooterSummaryItems9GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure gtvItemTcxGridDataControllerTcxDataSummaryFooterSummaryItems10GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure gtvItemHargaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxTextEdit1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure edNotesPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure lcbTransIDPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure btnStartScanner1Click(Sender: TObject);
    procedure btnStopScanner1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gtvItemNavigatorButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure btnPrintClick(Sender: TObject);
    procedure cxDBNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure bcSessID1BarcodeReady(Sender: TObject; Barcode: String);
    procedure lcbTransIDClick(Sender: TObject);
    procedure edTanggalPropertiesChange(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure cbJenisTransClick(Sender: TObject);
    procedure edDiscountPropertiesChange(Sender: TObject);
    procedure edReturPropertiesChange(Sender: TObject);
    procedure edDPPropertiesChange(Sender: TObject);
    procedure edPaymentPropertiesChange(Sender: TObject);
    procedure edJatuhTempoPropertiesChange(Sender: TObject);
    procedure edPayment2PropertiesChange(Sender: TObject);
    procedure edBayar2PropertiesChange(Sender: TObject);
    procedure edTokoPropertiesChange(Sender: TObject);
    procedure btnUpdateHargaClick(Sender: TObject);
    procedure edScanClick(Sender: TObject);
    procedure edScanKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edScanFocusChanged(Sender: TObject);
  private
    { Private declarations }
    qryCari, qrySearchKiri, qryFindKiri, qryCariKiri2, qryExecKiri,
    qryCariKiri, qryExeKiri, qrySearch, qryExec : TMyQuery;
    procedure InputBoxSetPasswordChar(var Msg: TMessage);
    message InputBoxMessage;
    procedure CetakPotraitBaru;
  public
    { Public declarations }
    TR_STORE, TR_PERIODE, TR_SESSION, TR_NUMBER, TR_TIME, TR_FAKTUR,TR_DELETE : string;
    TRFAKTURDEL, TR_NO : String;
    TOT_QTY, TOT_SUB, qty_brg : Double;
    jenis_brg, no_seri, hargab,namaBarang: string;
    c, d : integer;
    N_LOLOS : Boolean;
    idbarcode : string;
    function CreateNewAutoNum: string;
    function CreateAutoNumDelete: string;
    function tambah_stock : string;
    function kurang_stock : string;
    procedure cekhargabarang;
    procedure CetakKecil;
    procedure CetakBesar;
    procedure CetakBesar2Kolom;
    procedure CetakPotrait;
    procedure Cetak2KolomLandscape;

  end;

var
  frmMaster1: TfrmMaster1;

implementation

uses FdmDB, FMain, FPrintStruk, FLogin, FBrowse1, FJualCustomerCetak2Kolom,
  FCetakPotrait, FCetakBesar1KolomPotrait, FNewPrintStrukBesar2Kolom,
  FNewPrintStruk, FNewPrintStrukBesar;

{$R *.dfm}

procedure TfrmMaster1.Cetak2KolomLandscape;
var
   filePath, appDir, namaToko, alamatToko, TeleponToko, Kota, namaCustomer,
   alamatCustomer, totalQty, handphoneToko, strSql, idfaktur, idtrans,
   isSeri, strSeri, strBayar1, strBayar2 : String;
   rQty, rDoz, rPcs, y, intTerbilang, totItems, QrpTotPageNumb : Integer;
   hargaJual, qtyLsn, qtyPcs,  satScan, jmlSeri, TotSeri, bayar1, bayar2,
   totbayar, GrandTotal, sisaBayar : Double;
   i, totQty, qtySeri, recSelect    : Integer;
   qryVar1, qryVar2 : TMyQuery;
begin
  cekhargabarang;
  TotSeri := 0;
  satScan := 0;
  gtvItem.DataController.GotoFirst;
  for i:= 0 to gtvItem.DataController.RecordCount - 1 do
     begin
      recSelect := gtvItem.DataController.GetFocusedRecordIndex;
      isSeri := vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemKet.Index));
      jmlSeri := gtvItem.DataController.GetValue(recSelect, gtvItemQty.Index);
      if ((isSeri <> 'NONE') OR (isSeri <> '-') OR (isSeri <> '0') OR (isSeri <> '') OR (isSeri <> 'LS') OR (isSeri <> 'ST')) then
         begin
           if (TryStrToFloat(isSeri, satScan) = False) then
             begin
               //ShowMessage(FormatFloat('#,#.0', satScan));
               TotSeri := TotSeri + 0;
             end
           else if (TryStrToFloat(isSeri, satScan) = True) then
             begin
               //ShowMessage(isSeri);
               TotSeri := TotSeri + (jmlSeri / satScan);
             end;
         end;
      {if (LeftStr(isSeri, 2) = 'UK') then
         begin
              strSeri := Trim(RightStr(isSeri, 2));
              if (TryStrToFloat(strSeri, nQty) = False) then
                  begin
                       TotSeri := TotSeri + 0;
                  end
              else if (TryStrToFloat(strSeri, nQty) = True) then
                  begin
                       TotSeri := TotSeri + (jmlSeri / nQty);
                  end
         end;}
       gtvItem.DataController.GotoNext;
       isSeri := '';
       satScan := 0;
       //ShowMessage(FormatFloat('#,#.0', TotSeri));
     end;

  qryVar1 := TMyQuery.Create(Self);
  qryVar1.Connection := DMDB.dbInternal;
  qryVar1.SQL.Add('select * from temptable');
  qryVar1.Active := true;

  qryVar2 := TMyQuery.Create(Self);
  qryVar2.Connection := DMDB.dbInternal;
  qryVar2.SQL.Add('select * from temptable');
  qryVar2.Active := true;

  bayar1 := edDP.EditValue;
  bayar2 := edBayar2.EditValue;
  totbayar := bayar1 + bayar2;
  GrandTotal := edGrand.EditValue;
  sisaBayar := GrandTotal - totbayar;
  strBayar1 := edPayment.Text;
  strBayar2 := edPayment2.Text;
  if (N_LOLOS = False) then Exit;
  Application.CreateForm(TfrmJualCustomerCetak2Kolom, frmJualCustomerCetak2Kolom);
  with frmJualCustomerCetak2Kolom do
    begin
        qryCetakMaster.Active := True;
        qryCetakDetail.Active := True;
        qryCetakMaster.Close;
        qryCetakMaster.SQL.Clear;
        qryCetakMaster.SQL.Add('select * from trans1 where id_faktur = ''' +
                        edFaktur.Text + '''');
        qryCetakMaster.Open;

        qryCetakDetail.Close;
        qryCetakDetail.SQL.Clear;
        qryCetakDetail.SQL.Add('select *, ' +
          '(select ben_barang_detail.satuanharga from ben_barang_detail where ' +
          'ben_barang_detail.idbarang = trans_detail1.id_barang) as satjual ' +
          ' from trans_detail1 where faktur_id = ''' +
                          edFaktur.Text + ''' order by no_urut ASC');
        qryCetakDetail.Open;

        idfaktur := vartostr(edFaktur.EditValue);
        idtrans := qryCetakMaster.Fields[3].AsString;


        totItems := qryCetakDetail.RecordCount;
        lblTotItems.Caption := IntToStr(totItems);
        lblNamaToko.Caption := frmMain.APP_OUTLETNAME;
        lblTelepon.Caption := 'TELP : ' + frmMain.APP_OUTLETPHONE;
        lblAlamatToko.Caption := frmMain.APP_OUTLETCITY;
        grandTotal := Round(edGrand.EditValue);
        lblJudulCetak.Caption := 'NOTA ' + frmMaster1.lcbTransID.Text;

        if (qryCetakMaster.Fields[6].AsFloat = 0) then
          begin
            lblJudulDisc.Caption := '';
          end;
        if (qryCetakMaster.Fields[7].AsFloat = 0) then
          begin
            lblJudulRetur.Caption := '';
          end;
        {totQty := Round(qryCetakMaster.Fields[4].AsFloat);
        qtyLsn := totQty div 12;
        qtypcs := totQty mod 12;}
        qryVar2.Close;
        qryVar2.SQL.Clear;
        qryVar2.SQL.Add('select sum(doz_brg) from trans_detail1 where faktur_id = ''' +
                          edFaktur.Text + '''');
        qryVar2.Open;
        qtyLsn := qryVar2.Fields[0].AsFloat;
        lblTotDoz.Caption := FormatFloat('#,0.0', qtyLsn) + ' Lsn';
        //FloatToStr(qtyLsn);
        //FormatFloat('#,#.0', qtyLsn) + ' Lsn';

        qryVar2.Close;
        qryVar2.SQL.Clear;
        qryVar2.SQL.Add('select sum(pcs_brg) from trans_detail1 where faktur_id = ''' +
                          edFaktur.Text + '''');
        qryVar2.Open;
        qtypcs := qryVar2.Fields[0].AsFloat;
        lblTotPcs.Caption := FormatFloat('#,#', qtypcs) + ' Ptg';

        lblTotSeri.Caption := FloatToStr(TotSeri) + ' Seri';
        lbluser.Caption := 'Printed By ' + UpperCase(frmMain.USERAPPS) + ' @ ' +
              FormatDateTime('dd/MM/yyyy hh:mm', Now);
        //Value := 'PAYMENT VIA [ ' + UpperCase(Value) + ' ]';
        if (sisaBayar <= 0) then
          begin
            lblPayment.Caption := 'PAYMENT VIA [ ' + strBayar2 + ' ]';
          end
        else if (sisaBayar > 0) then
          begin
            lblPayment.Caption := 'PAYMENT VIA [ ' + strBayar1 + ' ]' + ' TOTAL BAYAR ' +
                FormatFloat('#,#', totBayar) + ' SISA ' +  FormatFloat('#,#', sisaBayar);
          end;
        RepCetak.Prepare;
        frmJualCustomerCetak2Kolom.QrpTotPageNumb := frmJualCustomerCetak2Kolom.RepCetak.QRPrinter.PageCount;
        //Printer.BeginDoc;
        WindowState := wsMaximized;
        RepCetak.PreviewInitialState := wsMaximized;
        //RepCetak.PrinterSettings.PrinterIndex := PRINTERS.Printer.PrinterIndex;
        RepCetak.Print;
        RepCetak.QRPrinter.Free;
        RepCetak.QRPrinter := nil;
    end;
    qryVar1.Free;
    qryVar2.Free;
end;

procedure TfrmMaster1.CetakPotraitBaru;
var
  filePath, appDir, namaToko, alamatToko, TeleponToko, Kota, namaCustomer,
  alamatCustomer, totalQty, handphoneToko, strSql : String;
   rQty, rDoz, rPcs, grandTotal,y, intTerbilang, totItems, QrpTotPageNumb : Integer;
   hargaJual : Double;
   i, totQty, qtyLsn, qtypcs, qtySeri : Integer;
   qryMstr1, qryMstr2 : TMyQuery;
begin
  cekhargabarang;
  if (N_LOLOS = False) then Exit;
  Application.CreateForm(TfrmCetakPotrait, frmCetakPotrait);
  with frmCetakPotrait do
    begin
        qryCetakMaster.Active := True;
        qryCetakDetail.Active := True;
        qryCetakMaster.Close;
        qryCetakMaster.SQL.Clear;
        qryCetakMaster.SQL.Add('select * from trans1 where id_faktur = ''' +
                        edFaktur.Text + '''');
        qryCetakMaster.Open;

        qryCetakDetail.Close;
        qryCetakDetail.SQL.Clear;
        qryCetakDetail.SQL.Add('select *, ' +
          '(select ben_barang_detail.satuanharga from ben_barang_detail where ' +
          'ben_barang_detail.idbarang = trans_detail1.id_barang) as satjual ' +
          ' from trans_detail1 where faktur_id = ''' +
                          edFaktur.Text + ''' order by no_urut ASC');
        qryCetakDetail.Open;

        totItems := frmCetakPotrait.qryCetakDetail.RecordCount;
        lblTotItems.Caption := IntToStr(totItems);
        lblNamaToko.Caption := frmMain.APP_OUTLETNAME;
        lblTelepon.Caption := 'TELP : ' + frmMain.APP_OUTLETPHONE;
        lblAlamatToko.Caption := frmMain.APP_OUTLETADDRESS;
        grandTotal := Round(edGrand.EditValue);

        qryMstr1.Close;
        qryMstr1.SQL.Clear;
        strSql := 'SELECT id_barang FROM trans_detail1  ' +
                  'WHERE faktur_id = ' + QuotedStr('105.A.180418.00004') +
                  ' AND (satuan_id <> ' + QuotedStr('-') + ' )' +
                  ' AND (satuan_id <> '  + QuotedStr('UK') + ' )' +
                  ' AND (satuan_id <> '  + QuotedStr('LS') + ' )' +
                  ' AND (satuan_id <> '  + QuotedStr('ST') + ' ) GROUP BY id_barang';
        //ShowMessage(strSql);
        qryMstr1.SQL.Add(strSql);
        qryMstr1.Open;
        qtySeri := qryMstr1.RecordCount;
        if (qryCetakMaster.Fields[6].AsFloat = 0) then
          begin
            lblJudulDisc.Caption := '';
          end;
        if (qryCetakMaster.Fields[7].AsFloat = 0) then
          begin
            lblJudulRetur.Caption := '';
          end;
        totQty := Round(qryCetakMaster.Fields[4].AsFloat);
        qtyLsn := totQty div 12;
        qtypcs := totQty mod 12;

        lblTotDoz.Caption := IntToStr(qtyLsn) + ' Lsn';
        lblTotPcs.Caption := IntToStr(qtypcs) + ' Ptg';
        lblTotSeri.Caption := IntToStr(qtySeri) + ' Seri';
        lbluser.Caption := 'Printed By ' + UpperCase(frmMain.USERAPPS) + ' @ ' +
              FormatDateTime('dd/MM/yyyy hh:mm', Now);
        RepCetak.Prepare;
        frmCetakPotrait.QrpTotPageNumb := frmCetakPotrait.RepCetak.QRPrinter.PageCount;
        //Printer.BeginDoc;
        Printer.Orientation := poLandscape;
        WindowState := wsMaximized;
        RepCetak.PreviewInitialState := wsMaximized;
        RepCetak.PrinterSettings.PrinterIndex := PRINTERS.Printer.PrinterIndex;
        //RepCetak.Width := 139;
        //RepCetak.Height := 250;
        //RepCetak.Page.Orientation := poLandscape;
        RepCetak.Preview;
        RepCetak.QRPrinter.Free;
        RepCetak.QRPrinter := nil;
        //RepCetak.PrinterSettings.Orientation := poLandscape;

        //RepCetak.PrinterSetup;
        //PrintDialog1.Execute;
        //RepCetak.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
        //RepCetak.PrinterSettings.Orientation := Printer.Orientation;
        //RepCetak.PrinterSettings.ApplySettings(RepCetak.Printers);

        //Printer.EndDoc;
    end;

end;

procedure TfrmMaster1.CetakPotrait;
var
  filePath, appDir, namaToko, alamatToko, TeleponToko, Kota, namaCustomer,
  alamatCustomer, totalQty, handphoneToko : String;
   rQty, rDoz, rPcs, grandTotal,y, intTerbilang, totItems : Integer;
   hargaJual : Double;
   i: Integer;
begin
  cekhargabarang;
  if (N_LOLOS = False) then Exit;
  Application.CreateForm(TfrmCetakBesar1KolomPotrait, frmCetakBesar1KolomPotrait);
  frmCetakBesar1KolomPotrait.qryCetakMaster.Active := True;
  frmCetakBesar1KolomPotrait.qryCetakDetail.Active := True;

  frmCetakBesar1KolomPotrait.qryCetakMaster.Close;
  frmCetakBesar1KolomPotrait.qryCetakMaster.SQL.Clear;
  frmCetakBesar1KolomPotrait.qryCetakMaster.SQL.Add('select * from trans1 where id_faktur = ''' +
                  edFaktur.Text + '''');
  frmCetakBesar1KolomPotrait.qryCetakMaster.Open;

  frmCetakBesar1KolomPotrait.qryCetakDetail.Close;
  frmCetakBesar1KolomPotrait.qryCetakDetail.SQL.Clear;
  frmCetakBesar1KolomPotrait.qryCetakDetail.SQL.Add('select *, ' +
  '(select ben_barang_detail.satuanharga from ben_barang_detail where ' +
  'ben_barang_detail.idbarang = trans_detail1.id_barang) as satjual ' +
  ' from trans_detail1 where faktur_id = ''' +
                  edFaktur.Text + ''' order by no_urut ASC');
  frmCetakBesar1KolomPotrait.qryCetakDetail.Open;
  totItems := frmCetakBesar1KolomPotrait.qryCetakDetail.RecordCount;
  rQty := Round(EQty.EditValue);
  rDoz := rQty div 12;
  rPcs := rQty mod 12;
  totalQty := IntToStr(rDoz) + ' Doz' + IntToStr(rPcs) + ' Pcs';


  frmCetakBesar1KolomPotrait.lblNamaToko.Caption := frmMain.APP_OUTLETNAME;
  frmCetakBesar1KolomPotrait.lblTelepon.Caption := 'TELP : ' + frmMain.APP_OUTLETPHONE;
  frmCetakBesar1KolomPotrait.lblAlamatToko.Caption := frmMain.APP_OUTLETADDRESS;
  grandTotal := Round(edGrand.EditValue);

   with frmCetakBesar1KolomPotrait do
     begin
       qrDoz.Caption := ': ' + IntToStr(rDoz);
       qrPcs.Caption := IntToStr(rPcs);
       lblNamaToko.Caption := frmMain.APP_OUTLETNAME;
       qLblTotItems.Caption := ': ' + IntToStr(totItems);
       //lblNamaCust.Caption := namaCustomer;
       //lblKotaCust.Caption := Kota;
       //lblAlamatCust.Caption := alamatCustomer;
       lblAlamatToko.Caption := frmMain.APP_OUTLETNAME;
       lblHandphone.Caption := handphoneToko;
       lblTelepon.Caption := 'TELP : ' + frmMain.APP_OUTLETPHONE;
       //qrTelepon.Caption := 'Telp. ' + TeleponToko + ' , Jakarta Utara' ;
       intTerbilang := grandTotal;
       //lblIsiTerbilang.Caption := '# ' + Terbilang(intTerbilang) + ' Rupiah' + ' #';
       lblUser.Caption := frmMain.USERAPPS;

     end;
   frmCetakBesar1KolomPotrait.RepCetak.Prepare;
   frmCetakBesar1KolomPotrait.QrpTotPageNumb := frmCetakBesar1KolomPotrait.RepCetak.QRPrinter.PageCount;
   frmCetakBesar1KolomPotrait.RepCetak.QRPrinter.Free;
   frmCetakBesar1KolomPotrait.RepCetak.QRPrinter := nil;

   frmCetakBesar1KolomPotrait.WindowState := wsMaximized;
   frmCetakBesar1KolomPotrait.RepCetak.PreviewInitialState := wsMaximized;
   //frmCetakBesar1KolomPotrait.RepCetak.PrinterSettings.PrinterIndex := cbPrintDefault.ItemIndex;
   frmCetakBesar1KolomPotrait.RepCetak.Print;
end;

procedure TfrmMaster1.CetakBesar2Kolom;
var
   idfaktur, idtrans, isSeri, strSeri, passHapus : string;
   panjang, i, recSelect, rTot, jmlPcs, jmlLsn : Integer;
   nQty, TotSeri, jmlSeri : Double;
begin
  if (N_LOLOS = False) then Exit;
     with dmDB do
        begin
             qryCari.Close;
             qryCari.Close;
             qryCari.SQL.Clear;
             qryCari.SQL.Add('Select tanggal from trans1 ' +
                               'Where id_faktur = ''' + vartostr(edFaktur.EditValue) + '''');
             qryCari.Open;
             if (qryCari.Fields[0].AsDateTime <> Date) then
                 begin
                      PostMessage(Handle, InputBoxMessage, 0, 0);
                      passHapus := InputBox('Cetak Ulang Transaksi', 'Masukan Password','');
                      if (passHapus <> '800800') then
                          begin
                               ShowMessage('Maaf Password yang Anda Masukan Salah !!');
                               Exit;
                          end;
                 end;
             qryPrintMstr.Close;
             qryPrintMstr.SQL.Clear;
             qryPrintMstr.SQL.Add('Select * from trans1 ' +
                               'Where id_faktur = ''' + vartostr(edFaktur.EditValue) + '''');
             qryPrintMstr.Open;

             QryPrintDetail.Close;
             QryPrintDetail.SQL.Clear;
             QryPrintDetail.SQL.Add('Select * from trans_detail1 ' +
                             'Where faktur_id = ''' + VarToStr(edFaktur.EditValue) + ''' ORDER BY no_urut ASC ');
             QryPrintDetail.Open;

             qrySearchKiri.Close;
             qrySearchKiri.SQL.Clear;
             qrySearchKiri.SQL.Add('Select * from trans_id ' +
                                   'Where id_trans = ''' + qryPrintMstr.Fields[3].AsString + '''');
             qrySearchKiri.Open;

             TotSeri := 0;
             nQty := 0;
             gtvItem.DataController.GotoFirst;
             for i:= 0 to gtvItem.DataController.RecordCount - 1 do
                 begin
                      recSelect := gtvItem.DataController.GetFocusedRecordIndex;
                      isSeri := vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemKet.Index));
                      jmlSeri := gtvItem.DataController.GetValue(recSelect, gtvItemQty.Index);


                      if (LeftStr(isSeri, 2) = 'UK') then
                         begin
                              strSeri := Trim(RightStr(isSeri, 2));
                              if (TryStrToFloat(strSeri, nQty) = False) then
                                  begin
                                       TotSeri := TotSeri + 0;
                                  end
                              else if (TryStrToFloat(strSeri, nQty) = True) then
                                  begin
                                       TotSeri := TotSeri + (jmlSeri / nQty);
                                  end
                              //nQty := StrToFloat(strSeri);

                         end;
                     //ShowMessage(isSeri + '#' + FloatToStr(jmlSeri) + '#' + FloatToStr(nQty));
                     gtvItem.DataController.GotoNext;
                 end;
             Application.CreateForm(TfrmNewPrintStrukBesar2Kolom, frmNewPrintStrukBesar2Kolom);
             idfaktur := vartostr(edFaktur.EditValue);
             idtrans := qryPrintMstr.Fields[3].AsString;

             frmNewPrintStrukBesar2Kolom.qrLblNamaToko.Caption := frmMain.APP_OUTLETNAME;
             frmNewPrintStrukBesar2Kolom.qrLblTelp.Caption := 'TELEPHONE : ' + frmMain.APP_OUTLETPHONE;
             frmNewPrintStrukBesar2Kolom.qrLblAlamat.Caption := frmMain.APP_OUTLETADDRESS;
             //frmNewPrintStruk.qrTransId.Caption := qrySearchKiri.Fields[2].AsString;

             frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Add('Payment Via');
                    frmNewPrintStrukBesar2Kolom.qLblNilai.Lines.Add(' : ' + qryPrintMstr.Fields[10].AsString);

             if( (idtrans = 'MMT') or (idtrans = 'KKT') or (idtrans = 'MRT') or (idtrans = 'KRT')) then
               begin
                    frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Add(idtrans);
                    frmNewPrintStrukBesar2Kolom.qLblNilai.Lines.Add(' ');
               end;
             //frmNewPrintStruk.qlblTotalSeri.Caption := FloatToStr(TotSeri);

             rTot := Round(qryPrintMstr.Fields[4].AsFloat);
             jmlLsn := rTot div 12;
             jmlPcs := rTot mod 12;
             frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Add('Total Qty');
             frmNewPrintStrukBesar2Kolom.qLblNilai.Lines.Add(' : ' + IntToStr(jmlLsn) + ' Lsn ' + IntToStr(jmlPcs) + ' pcs ');

             if( TotSeri <> 0 ) then
               begin
                    frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Add('Total Seri ');
                    frmNewPrintStrukBesar2Kolom.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', TotSeri));
               end;

             frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Add('Subtotal ');
             frmNewPrintStrukBesar2Kolom.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[5].AsFloat));

             if( qryPrintMstr.Fields[6].AsFloat <> 0 ) then
               begin
                    frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Add('Discount ');
                    frmNewPrintStrukBesar2Kolom.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[6].AsFloat));
               end;

             if( qryPrintMstr.Fields[7].AsFloat <> 0 ) then
               begin
                    frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Add('Retur ');
                    frmNewPrintStrukBesar2Kolom.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[7].AsFloat));
               end;
             frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Add('GrandTotal ');
             frmNewPrintStrukBesar2Kolom.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[8].AsFloat));

             frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Add(qrySearchKiri.Fields[2].AsString);
             frmNewPrintStrukBesar2Kolom.qLblNilai.Lines.Add(' ');

             //panjang := QryPrintDetail.RecordCount + frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Count;
             //panjang := panjang * 50;
             //frmNewPrintStrukBesar2Kolom.qrStruk.Height := frmNewPrintStrukBesar2Kolom.qrStruk.Height + panjang;
             frmNewPrintStrukBesar2Kolom.qrStruk.Preview;
             Screen.Cursor := crDefault;
             //frmStruk.qrStruk.Print;
        end;
end;

procedure TfrmMaster1.CetakKecil;
var
   idfaktur, idtrans, isSeri, strSeri, passHapus : string;
   panjang, i, recSelect, rTot, jmlPcs, jmlLsn : Integer;
   nQty, TotSeri, jmlSeri : Double;
begin
   if (N_LOLOS = False) then Exit;
     with dmDB do
        begin
             qryCari.Close;
             qryCari.Close;
             qryCari.SQL.Clear;
             qryCari.SQL.Add('Select tanggal from trans1 ' +
                               'Where id_faktur = ''' + vartostr(edFaktur.EditValue) + '''');
             qryCari.Open;
             if (qryCari.Fields[0].AsDateTime <> Date) then
                 begin
                      PostMessage(Handle, InputBoxMessage, 0, 0);
                      passHapus := InputBox('Cetak Ulang Transaksi', 'Masukan Password','');
                      if (passHapus <> '800800') then
                          begin
                               ShowMessage('Maaf Password yang Anda Masukan Salah !!');
                               Exit;
                          end;
                 end;
             qryPrintMstr.Close;
             qryPrintMstr.SQL.Clear;
             qryPrintMstr.SQL.Add('Select * from trans1 ' +
                               'Where id_faktur = ''' + vartostr(edFaktur.EditValue) + '''');
             qryPrintMstr.Open;

             QryPrintDetail.Close;
             QryPrintDetail.SQL.Clear;
             QryPrintDetail.SQL.Add('Select * from trans_detail1 ' +
                             'Where faktur_id = ''' + VarToStr(edFaktur.EditValue) + ''' ORDER BY no_urut ASC ');
             QryPrintDetail.Open;

             qrySearchKiri.Close;
             qrySearchKiri.SQL.Clear;
             qrySearchKiri.SQL.Add('Select * from trans_id ' +
                                   'Where id_trans = ''' + qryPrintMstr.Fields[3].AsString + '''');
             qrySearchKiri.Open;

             TotSeri := 0;
             nQty := 0;
             gtvItem.DataController.GotoFirst;
             for i:= 0 to gtvItem.DataController.RecordCount - 1 do
                 begin
                      recSelect := gtvItem.DataController.GetFocusedRecordIndex;
                      isSeri := vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemKet.Index));
                      jmlSeri := gtvItem.DataController.GetValue(recSelect, gtvItemQty.Index);


                      if (LeftStr(isSeri, 2) = 'UK') then
                         begin
                              strSeri := Trim(RightStr(isSeri, 2));
                              if (TryStrToFloat(strSeri, nQty) = False) then
                                  begin
                                       TotSeri := TotSeri + 0;
                                  end
                              else if (TryStrToFloat(strSeri, nQty) = True) then
                                  begin
                                       TotSeri := TotSeri + (jmlSeri / nQty);
                                  end
                              //nQty := StrToFloat(strSeri);

                         end;
                     //ShowMessage(isSeri + '#' + FloatToStr(jmlSeri) + '#' + FloatToStr(nQty));
                     gtvItem.DataController.GotoNext;
                 end;
             Application.CreateForm(TfrmNewPrintStruk, frmNewPrintStruk);
             idfaktur := vartostr(edFaktur.EditValue);
             idtrans := qryPrintMstr.Fields[3].AsString;

             frmNewPrintStruk.qrLblNamaToko.Caption := frmMain.APP_OUTLETNAME;
             frmNewPrintStruk.qrLblTelp.Caption := 'TELEPHONE : ' + frmMain.APP_OUTLETPHONE;
             frmNewPrintStruk.qrLblAlamat.Caption := frmMain.APP_OUTLETADDRESS;
             //frmNewPrintStruk.qrTransId.Caption := qrySearchKiri.Fields[2].AsString;

             frmNewPrintStruk.qLblKet.Lines.Add('Payment Via');
                    frmNewPrintStruk.qLblNilai.Lines.Add(' : ' + qryPrintMstr.Fields[10].AsString);

             if( (idtrans = 'MMT') or (idtrans = 'KKT') or (idtrans = 'MRT') or (idtrans = 'KRT')) then
               begin
                    frmNewPrintStruk.qLblKet.Lines.Add(idtrans);
                    frmNewPrintStruk.qLblNilai.Lines.Add(' ');
               end;
             //frmNewPrintStruk.qlblTotalSeri.Caption := FloatToStr(TotSeri);

             rTot := Round(qryPrintMstr.Fields[4].AsFloat);
             jmlLsn := rTot div 12;
             jmlPcs := rTot mod 12;
             frmNewPrintStruk.qLblKet.Lines.Add('Total Qty');
             frmNewPrintStruk.qLblNilai.Lines.Add(' : ' + IntToStr(jmlLsn) + ' Lsn ' + IntToStr(jmlPcs) + ' pcs ');

             if( TotSeri <> 0 ) then
               begin
                    frmNewPrintStruk.qLblKet.Lines.Add('Total Seri ');
                    frmNewPrintStruk.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', TotSeri));
               end;

             frmNewPrintStruk.qLblKet.Lines.Add('Subtotal ');
             frmNewPrintStruk.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[5].AsFloat));

             if( qryPrintMstr.Fields[6].AsFloat <> 0 ) then
               begin
                    frmNewPrintStruk.qLblKet.Lines.Add('Discount ');
                    frmNewPrintStruk.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[6].AsFloat));
               end;

             if( qryPrintMstr.Fields[7].AsFloat <> 0 ) then
               begin
                    frmNewPrintStruk.qLblKet.Lines.Add('Retur ');
                    frmNewPrintStruk.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[7].AsFloat));
               end;
             frmNewPrintStruk.qLblKet.Lines.Add('GrandTotal ');
             frmNewPrintStruk.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[8].AsFloat));

             frmNewPrintStruk.qLblKet.Lines.Add(qrySearchKiri.Fields[2].AsString);
             frmNewPrintStruk.qLblNilai.Lines.Add(' ');

             panjang := QryPrintDetail.RecordCount + frmNewPrintStruk.qLblKet.Lines.Count;
             panjang := panjang * 50;
             frmNewPrintStruk.qrStruk.Height := frmNewPrintStruk.qrStruk.Height + panjang;
             frmNewPrintStruk.qrStruk.Preview;
             Screen.Cursor := crDefault;
             //frmStruk.qrStruk.Print;
        end;
end;

procedure TfrmMaster1.CetakBesar;
var
   idfaktur, idtrans, isSeri, strSeri, passHapus : string;
   panjang, i, recSelect, rTot, jmlPcs, jmlLsn : Integer;
   nQty, TotSeri, jmlSeri : Double;
begin
   if (N_LOLOS = False) then Exit;
     with dmDB do
        begin
             qryCari.Close;
             qryCari.Close;
             qryCari.SQL.Clear;
             qryCari.SQL.Add('Select tanggal from trans1 ' +
                               'Where id_faktur = ''' + vartostr(edFaktur.EditValue) + '''');
             qryCari.Open;
             if (qryCari.Fields[0].AsDateTime <> Date) then
                 begin
                      PostMessage(Handle, InputBoxMessage, 0, 0);
                      passHapus := InputBox('Cetak Ulang Transaksi', 'Masukan Password','');
                      if (passHapus <> '800800') then
                          begin
                               ShowMessage('Maaf Password yang Anda Masukan Salah !!');
                               Exit;
                          end;
                 end;
             qryPrintMstr.Close;
             qryPrintMstr.SQL.Clear;
             qryPrintMstr.SQL.Add('Select * from trans1 ' +
                               'Where id_faktur = ''' + vartostr(edFaktur.EditValue) + '''');
             qryPrintMstr.Open;

             QryPrintDetail.Close;
             QryPrintDetail.SQL.Clear;
             QryPrintDetail.SQL.Add('Select * from trans_detail1 ' +
                             'Where faktur_id = ''' + VarToStr(edFaktur.EditValue) + ''' ORDER BY no_urut ASC ');
             QryPrintDetail.Open;

             qrySearchKiri.Close;
             qrySearchKiri.SQL.Clear;
             qrySearchKiri.SQL.Add('Select * from trans_id ' +
                                   'Where id_trans = ''' + qryPrintMstr.Fields[3].AsString + '''');
             qrySearchKiri.Open;

             TotSeri := 0;
             nQty := 0;
             gtvItem.DataController.GotoFirst;
             for i:= 0 to gtvItem.DataController.RecordCount - 1 do
                 begin
                      recSelect := gtvItem.DataController.GetFocusedRecordIndex;
                      isSeri := vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemKet.Index));
                      jmlSeri := gtvItem.DataController.GetValue(recSelect, gtvItemQty.Index);


                      if (LeftStr(isSeri, 2) = 'UK') then
                         begin
                              strSeri := Trim(RightStr(isSeri, 2));
                              if (TryStrToFloat(strSeri, nQty) = False) then
                                  begin
                                       TotSeri := TotSeri + 0;
                                  end
                              else if (TryStrToFloat(strSeri, nQty) = True) then
                                  begin
                                       TotSeri := TotSeri + (jmlSeri / nQty);
                                  end
                              //nQty := StrToFloat(strSeri);

                         end;
                     //ShowMessage(isSeri + '#' + FloatToStr(jmlSeri) + '#' + FloatToStr(nQty));
                     gtvItem.DataController.GotoNext;
                 end;
             Application.CreateForm(TfrmNewPrintStrukBesar, frmNewPrintStrukBesar);
             idfaktur := vartostr(edFaktur.EditValue);
             idtrans := qryPrintMstr.Fields[3].AsString;

             frmNewPrintStrukBesar.qrLblNamaToko.Caption := frmMain.APP_OUTLETNAME;
             frmNewPrintStrukBesar.qrLblTelp.Caption := 'TELEPHONE : ' + frmMain.APP_OUTLETPHONE;
             frmNewPrintStrukBesar.qrLblAlamat.Caption := frmMain.APP_OUTLETADDRESS;
             //frmNewPrintStruk.qrTransId.Caption := qrySearchKiri.Fields[2].AsString;

             frmNewPrintStrukBesar.qLblKet.Lines.Add('Payment Via');
             frmNewPrintStrukBesar.qLblNilai.Lines.Add(' : ' + qryPrintMstr.Fields[10].AsString);

             if( (idtrans = 'MMT') or (idtrans = 'KKT') or (idtrans = 'MRT') or (idtrans = 'KRT')) then
               begin
                    frmNewPrintStrukBesar.qLblKet.Lines.Add(idtrans);
                    frmNewPrintStrukBesar.qLblNilai.Lines.Add(' ');
               end;
             //frmNewPrintStruk.qlblTotalSeri.Caption := FloatToStr(TotSeri);

             rTot := Round(qryPrintMstr.Fields[4].AsFloat);
             jmlLsn := rTot div 12;
             jmlPcs := rTot mod 12;
             frmNewPrintStrukBesar.qLblKet.Lines.Add('Total Qty');
             frmNewPrintStrukBesar.qLblNilai.Lines.Add(' : ' + IntToStr(jmlLsn) + ' Lsn ' + IntToStr(jmlPcs) + ' pcs ');

             if( TotSeri <> 0 ) then
               begin
                    frmNewPrintStrukBesar.qLblKet.Lines.Add('Total Seri ');
                    frmNewPrintStrukBesar.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', TotSeri));
               end;

             frmNewPrintStrukBesar.qLblKet.Lines.Add('Subtotal ');
             frmNewPrintStrukBesar.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[5].AsFloat));

             if( qryPrintMstr.Fields[6].AsFloat <> 0 ) then
               begin
                    frmNewPrintStrukBesar.qLblKet.Lines.Add('Discount ');
                    frmNewPrintStrukBesar.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[6].AsFloat));
               end;

             if( qryPrintMstr.Fields[7].AsFloat <> 0 ) then
               begin
                    frmNewPrintStrukBesar.qLblKet.Lines.Add('Retur ');
                    frmNewPrintStrukBesar.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[7].AsFloat));
               end;
             frmNewPrintStrukBesar.qLblKet.Lines.Add('GrandTotal ');
             frmNewPrintStrukBesar.qLblNilai.Lines.Add(' : ' + FormatFloat('#,#', qryPrintMstr.Fields[8].AsFloat));

             frmNewPrintStrukBesar.qLblKet.Lines.Add(qrySearchKiri.Fields[2].AsString);
             frmNewPrintStrukBesar.qLblNilai.Lines.Add(' ');

             //panjang := QryPrintDetail.RecordCount + frmNewPrintStrukBesar2Kolom.qLblKet.Lines.Count;
             //panjang := panjang * 50;
             //frmNewPrintStrukBesar2Kolom.qrStruk.Height := frmNewPrintStrukBesar2Kolom.qrStruk.Height + panjang;
             frmNewPrintStrukBesar.qrStruk.Preview;
             Screen.Cursor := crDefault;
             //frmStruk.qrStruk.Print;
        end;
end;

procedure TfrmMaster1.cekhargabarang;
var
   idBarang : String;
   hargaModal, hargaDisplay, hargaMin : Double;
   recSelect, i : Integer;
begin
     hargaMin := StrToFloat(frmMain.MINPRICE);
     N_LOLOS := False;
     gtvItem.DataController.PostEditingData;
     gtvItem.DataController.Post;
     gtvItem.DataController.GotoFirst;
     for i:=0 to gtvItem.DataController.RecordCount-1 do
         begin
              recSelect := gtvItem.DataController.GetFocusedRecordIndex;
              idBarang := vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemId.Index));
              qryCari.Close;
              qryCari.SQL.Clear;
              qryCari.SQL.Add('select harga_jual from barang where id_barang = ''' +
                                          idBarang + '''');
              qryCari.Open;
              hargaModal := qryCari.Fields[0].AsFloat;
              hargaDisplay := gtvItem.DataController.GetValue(recSelect, gtvItemHarga.Index);
              if (hargaDisplay < hargaModal) then
                  begin
                       N_LOLOS := False;
                       ShowMessage('Harga Di bawah modal, Transaksi Dibatalkan !!!');
                       Exit;
                  end;
              N_LOLOS := True;
              gtvItem.DataController.GotoNext;
         end;
     N_LOLOS := False;
     gtvItem.DataController.PostEditingData;
     gtvItem.DataController.Post;
     gtvItem.DataController.GotoFirst;
     for i:=0 to gtvItem.DataController.RecordCount-1 do
         begin
              recSelect := gtvItem.DataController.GetFocusedRecordIndex;
              idBarang := vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemId.Index));

              hargaDisplay := gtvItem.DataController.GetValue(recSelect, gtvItemHarga.Index);
              if (hargaDisplay <= hargaMin) then
                  begin
                       N_LOLOS := False;
                       ShowMessage('Harga Barang Di Bawah harga minimum ' + #13 +
                       'Transaksi Dibatalkan !!!');
                       Exit;
                  end;
              N_LOLOS := True;
              gtvItem.DataController.GotoNext;
         end;
end;

procedure TfrmMaster1.InputBoxSetPasswordChar(var Msg: TMessage);
var
  hInputForm, hEdit: HWND;
begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'), 0);
  end;
end;

function TfrmMaster1.CreateNewAutoNum: string;
var
   lastID, strTmpNum, strNum, NewID, lastIDDelete : string;
   intTmpNum, intNum : integer;
begin
     with dmDB do
          begin
               NewID := TR_STORE + '.' + TR_PERIODE + '.' + TR_SESSION + '.';
                //ShowMessage(NewID);
               qryFindKiri.Close;
               qryFindKiri.SQL.Clear;
               qryFindKiri.SQL.Add('SELECT id_faktur FROM trans1 ' +
                               'WHERE id_faktur LIKE ''' + NewID + '%'' ORDER BY id_faktur ASC');
               qryFindKiri.Open;
               //-find delete
               qryTrans2.Close;
               qryTrans2.SQL.Clear;
               qryTrans2.SQL.Add('SELECT id_trans FROM delete_mstr ' +
                               'WHERE id_trans LIKE ''' + NewID + '%'' ORDER BY id_trans ASC');
               qryTrans2.Open;
               qryTrans2.Last;
               if (NOT qryTrans2.IsEmpty) then
                  begin
                      lastIDDelete := qryTrans2.Fields[0].AsString;
                  end;

               //-end delete
               if (qryFindKiri.IsEmpty) then
                  begin
                       Result := TR_STORE + '.' + TR_PERIODE + '.' + TR_SESSION + '.' + '00001';
                       exit;
                  end;

               qryFindKiri.Last;

               lastID    := qryFindKiri.Fields[0].AsString;
               strTmpNum := Copy(lastID, length(lastID)-4, 5);
               intTmpNum := strtoint(strTmpNum);
               intNum    := intTmpNum + 1;

               case length(inttostr(intNum)) of
                    1 : strNum := '0000' + inttostr(intNum);
                    2 : strNum := '000' + inttostr(intNum);
                    3 : strNum := '00' + inttostr(intNum);
                    4 : strNum := '0' + inttostr(intNum);
                    5 : strNum := inttostr(intNum);
               end;

               TR_NUMBER := strNum;
               TR_FAKTUR := TR_STORE + '.' + TR_PERIODE + '.' + TR_SESSION + '.' + TR_NUMBER;
               while (TR_FAKTUR = lastIDDelete) do
                    begin
                         lastID    := TR_FAKTUR;
                         strTmpNum := Copy(lastID, length(lastID)-4, 5);
                         intTmpNum := strtoint(strTmpNum);
                         intNum    := intTmpNum + 1;

                         case length(inttostr(intNum)) of
                              1 : strNum := '0000' + inttostr(intNum);
                              2 : strNum := '000' + inttostr(intNum);
                              3 : strNum := '00' + inttostr(intNum);
                              4 : strNum := '0' + inttostr(intNum);
                              5 : strNum := inttostr(intNum);
                         end;
                         TR_NUMBER := strNum;
                         TR_FAKTUR := TR_STORE + '.' + TR_PERIODE + '.' + TR_SESSION + '.' + TR_NUMBER;
                    end;

               Result := TR_FAKTUR;
          end;

end;

function TfrmMaster1.CreateAutoNumDelete: string;
var
   lastDel, strTmpNo, strNo, NewDel : string;
   intTmpNo, intNo : integer;
begin
     with dmDB do
          begin
               NewDel := TR_DELETE + '.' + TR_PERIODE + '.' ;
               //ShowMessage(NewDel);
               qryFindKiri.Close;
               qryFindKiri.SQL.Clear;
               qryFindKiri.SQL.Add('SELECT id_faktur_delete FROM delete_mstr ' +
                                   'WHERE id_faktur_delete LIKE ''' + NewDel + '%'' ORDER BY id_faktur_delete ASC');
               qryFindKiri.Open;

               if (qryFindKiri.IsEmpty) then
                  begin
                       Result := TR_DELETE + '.' + TR_PERIODE +  '.' + '00001';
                       exit;
                  end;

               qryFindKiri.Last;
               {ShowMessage('SELECT id_faktur_delete FROM delete_mstr ' +
                               'WHERE id_faktur_delete LIKE ''' + NewDel + '%'' ORDER BY id_faktur_delete ASC');
               ShowMessage(inttostr(qryFind.RecordCount)); }
               lastDel    := qryFindKiri.Fields[0].AsString;
               strTmpNo := Copy(lastDel, length(lastDel)-4, 5);
               intTmpNo := strtoint(strTmpNo);
               intNo    := intTmpNo + 1;
               //ShowMessage(lastDel);
               case length(inttostr(intNo)) of
                    1 : strNo := '0000' + inttostr(intNo);
                    2 : strNo := '000' + inttostr(intNo);
                    3 : strNo := '00' + inttostr(intNo);
                    4 : strNo := '0' + inttostr(intNo);
                    5 : strNo := inttostr(intNo);
               end;
               
               TR_NO := strNo;
               TRFAKTURDEL := TR_DELETE + '.' + TR_PERIODE + '.' + TR_NO;
               Result := TRFAKTURDEL;
          end;

end;

function TfrmMaster1.kurang_stock : String;
var
    qty : Double;
    idbarcodes: String;
begin
    //ShowMessage(inttostr(c));
    idbarcodes := no_seri;
    //ShowMessage(no_seri);
    //valsat := Copy(no_seri, length(no_seri)-1,2);
    
     with dmDB do
         begin
              qryCariKiri2.Close;
              qryCariKiri2.SQL.Clear;
              qryCariKiri2.SQL.Add('select * from stok_ where id_barang = ''' + idbarcodes + '''');
              qryCariKiri2.Open;
              //ShowMessage('select * from stok_ where id_barang = ''' + idbarcodes + '''');
              if (qryCariKiri2.IsEmpty) then
                 begin
                      qty_brg := 0-qty_brg;
                      qryExecKiri.SQL.Clear;
                      qryExecKiri.SQL.Add('INSERT INTO stok_ VALUES(' +
                                      '''' + idbarcodes + ''', ' +
                                      '''' + jenis_brg + ''', ' +
                                      '''' + namaBarang + ''', ' +
                                      '''' + FloatToStr(qty_brg) + ''')');
                      qryExecKiri.ExecSql;
                 end
              else
              if(NOT qryCariKiri2.IsEmpty) then
                  begin
                      //ShowMessage('Test');
                       qty := qryCariKiri2.Fields[3].AsFloat - qty_brg;
                       //ShowMessage(floattostr(qty));
                       qryExecKiri.SQL.Clear;
                       qryExecKiri.SQL.Add('UPDATE stok_ SET ' +
                                       'qty = ''' + FloatToStr(qty) + ''' ' +
                                       'WHERE id_barang = ''' + idbarcodes + '''');

                       qryExecKiri.ExecSql;

                       sleep(10); 
                  end;
         end;

end;


function TfrmMaster1.tambah_stock : String;
var
    qty : Double;
    idbarcodes: String;
begin
    idbarcodes := no_seri;
    //valsat := Copy(no_seri, length(no_seri)-1,2);
    
    with dmDB do
       begin
            qryCariKiri2.Close;
            qryCariKiri2.SQL.Clear;
            qryCariKiri2.SQL.Add('select * from stok_ where id_barang = ''' + idbarcodes + '''');
            qryCariKiri2.Open;
            
            if (qryCariKiri2.IsEmpty) then
                begin
                     qty_brg := 0+qty_brg;
                     qryExecKiri.SQL.Clear;
                     qryExecKiri.SQL.Add('INSERT INTO stok_ VALUES(' +
                                     '''' + idbarcodes + ''', ' +
                                     '''' + jenis_brg + ''', ' +
                                     '''' + namaBarang + ''', ' +
                                     '''' + FloatToStr(qty_brg) + ''')');
                     qryExecKiri.ExecSql;
                end
                     else if(NOT qryCariKiri2.IsEmpty) then
                          begin
                                
                                 qty := qryCariKiri2.Fields[3].AsFloat + qty_brg;
                                 qryExecKiri.SQL.Clear;
                                 qryExecKiri.SQL.Add('UPDATE stok_ SET ' +
                                                 'qty = ''' + FloatToStr(qty) + ''' ' +
                                                 'WHERE id_barang = ''' + idbarcodes + '''');

                                 qryExecKiri.ExecSql;

                            end;
       end;
end;

function tanggal(t:integer):string;
begin
      if t=1 then
         Result:='Januari'
      else
      if t=2 then
         Result:='Fetruari'
      else
      if t=3 then
         Result:='Maret'
      else
      if t=4 then
         Result:='April'
      else
      if t=5 then
         Result:='Mei'
      else
      if t=6 then
         Result:='Juni'
      else
      if t=7 then
         Result:='Juli'
      else
      if t=8 then
         Result:='Agustus'
      else
      if t=9 then
         Result:='September'
      else
      if t=10 then
         Result:='Oktober'
      else
      if t=11 then
         Result:='November'
      else
      if t=12 then
         Result:='Desember';
end;



procedure TfrmMaster1.FormCreate(Sender: TObject);
var
  strCreate1 : String;
begin
     edTanggal.EditValue := Date;
     edTglShow.Text := FormatDateTime('dd-mm-yyyy',Now);
     //edTanggal.Date := edTanggal.EditValue;

     TR_STORE := frmMain.APP_OUTLETID + '1';
     TR_SESSION := '01';
     TR_NUMBER := '00001';
     TR_NO := '00001';
     //frmMain.bc1.Active := False;
     //bcBarcode1.Connected :=false;
     //bcBarcode1.Port := frmMain.cfgPort;
     //bcBarcode1.DataBits := frmMain.bc1.DataBits;
     //bcBarcode1.BitRate := frmMain.bc1.BitRate;
     //bcBarcode1.Parity := frmMain.bc1.Parity;
     //bcBarcode1.StopBits := frmMain.bc1.StopBits;
     TR_DELETE := 'D';
     edUser.Text := frmMain.USERAPPS;
     edJatuhTempo.EditValue := Date;
     qryTrans1.Active := True;
     qryTrans2.Active := True;
     qryPrintMstr.Active := True;
     QryPrintDetail.Active := True;
     qryJenisTrans.Active := True;
     qryDelete.Active := True;
     tblTrans1.Active := True;
     qryToko.Active := True;
end;

procedure TfrmMaster1.k(Sender: TObject);
begin
    {qryMstr1 := TmySQLQuery.Create(Self);
    qryMstr1.Database := dmDB.dbToko;
    qryMstr1.SQL.Add('select * from empty_x');
    qryMstr1.Active := true;

    qryMstr2 := TmySQLQuery.Create(Self);
    qryMstr2.Database := dmDB.dbToko;
    qryMstr2.SQL.Add('select * from empty_x');
    qryMstr2.Active := true;}

    TR_PERIODE := FormatDateTime('ddMMYY', VarFromDateTime( edTanggal.EditValue));
    gtvItemUpdate.Visible := False;
     with dmDB do
          begin
               if(edFaktur.Text = '') then
                 begin
                    
                     TR_FAKTUR := CreateNewAutoNum;
                     edFaktur.EditValue := TR_FAKTUR;
                     cbJenisTrans.Text := 'Keluar';
                     qryJenisTrans.Close;
                     qryJenisTrans.SQL.clear;
                     qryJenisTrans.SQL.Add('Select * from trans_id ' +
                                            'Where status = ''' + 'out' +'''');;
                     qryJenisTrans.Open;
                     lcbTransID.Text := 'Keluar Customer';
                 end
               else
                 begin
                      
                      gtvItem.DataController.SelectAll;
                      gtvItem.DataController.DeleteSelection;
                      
                      TR_FAKTUR := CreateNewAutoNum;
                      edFaktur.EditValue := TR_FAKTUR;
                      cbJenisTrans.Text := 'Keluar';
                      qryJenisTrans.Close;
                      qryJenisTrans.SQL.clear;
                      qryJenisTrans.SQL.Add('Select * from trans_id ' +
                                            'Where status = ''' + 'out' +'''');;
                      qryJenisTrans.Open;
                      lcbTransID.Text := 'Keluar Customer';
                      edNoNota.Clear;
                      edNotes.Visible := true;
                      edToko.Visible := false;
                      edNotes.Clear;
                      
                      EdSubTotal.EditValue := 0;
                      EdSubTotal.PostEditValue;
                      EQty.EditValue := 0;
                      edRetur.EditValue := 0;
                      edDP.EditValue := 0;
                      edDiscount.EditValue := 0;
                      edGrand.EditValue := 0;
                      edSisaBayar.EditValue := 0;
                      edCustomer.Clear;
                      if((lcbTransID.Text) = 'Keluar Customer') then
                        begin
                            edPayment.Text := 'TUNAI';
                            edPayment2.Text := 'TUNAI';
                        end
                      else
                        begin
                             edPayment.Text := 'KREDIT';
                             edPayment2.Text := 'KREDIT';
                        end;
                      
                      edBayar2.EditValue := 0;
                      edTotBayar.EditValue := 0;
                      edKembalian.EditValue := 0;
                      edNamaBank.Clear;
                      edNoGiro.Clear;
                      edJatuhTempo.EditValue:= Date;
                      edUser.Text := frmMain.USERAPPS;
                 end;
               qryExecKiri.Sql.Clear;
               qryExecKiri.Sql.Add('Insert into trans1 values('+
                             '''' + TR_FAKTUR + ''' , ' +
                             '''' + FormatDateTime('yyyy-MM-dd',edTanggal.EditValue) + ''' , ' +
                             '''' + 'NONE' + ''' , ' +
                             '''' + vartostr(lcbTransID.EditValue) + ''' , ' +
                             '''' + '0' + ''' , ' +
                             '''' + '0' + ''' , ' +
                             '''' + '0' + ''' , ' +
                             '''' + '0' + ''' , ' +
                             '''' + '0' + ''' , ' +
                             '''' + 'NONE' + ''' , ' +
                             '''' + 'TUNAI' + ''' , ' +
                             '''' + 'Y' + ''' , ' +
                             '''' + 'NONE' + ''' , ' +
                             '''' + frmMain.APP_OUTLETID +''' , ' +
                             '''' + '0' + ''' , ' +
                             '''' + '0' + ''' , ' +
                             '''' + frmMain.USERAPPS + ''' , ' +
                             '''' + 'NONE' + ''' , ' +
                             '''' + 'NONE' + ''' , ' +
                             '''' + '0' + ''' , ' +
                             '''' + 'NONE' + ''' , ' +
                             '''' + 'NONE' + ''' , ' +
                             '''' + FormatDateTime('yyyy-MM-dd',edJatuhTempo.EditValue)  + ''' , ' +
                             '''' + '0'  + ''' , ' +
                             '''' + '0'  + ''')');
                qryExecKiri.ExecSql;
                
                sleep(15);
               frmMain.trnStatus[0] := tmNew;
               frmMain.sesStatus[0] := smCheckOut;
          end;
          //btnNew.Enabled := false;

end;

procedure TfrmMaster1.gtvItemIdPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
   noUrut : integer;
   idbarcode,jns, status : string;
   harga,qtyDoz, qtyPcs, qtyTot : double;
begin

     idbarcode := vartostr(Trim(DisplayValue));
     
     
     qryFindKiri.Close;
     qryFindKiri.SQL.Clear;
     qryFindKiri.SQL.Add('SELECT * FROM barang WHERE id_barang = ''' + idbarcode + '''');
     qryFindKiri.Open;
     if(qryFindKiri.IsEmpty) then
       begin
            qryExecKiri.Sql.Clear;
            qryExecKiri.Sql.Add('Insert into barang values(' +
                                      '''' + idbarcode + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + '0' + ''' , ' +
                                      '''' + '0' + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + '-' + ''')');
            qryExecKiri.ExecSql;
            jns := 'NONE';
            harga := 0;
            status := '-';
       end
     else
       begin
            jns := qryFindKiri.Fields[1].AsString;
            harga := qryFindKiri.Fields[4].AsFloat;
            status := qryFindKiri.Fields[7].AsString;
           
       end;
      
     gtvItemJenis.EditValue := jns;
     gtvItemHarga.EditValue := harga;
     
     noUrut := gtvItem.DataController.RecordCount + 1;
     
     gtvItemId.EditValue := idbarcode;
     gtvItemNo.EditValue := noUrut;
     //showMessage(valSatuan);
     
     if((status = 'NONE') OR (status = '-') OR (status = '0') OR (status = '')) then
        begin
            qtyDoz := 0.5;
            qtyPcs := 0;
            qtyTot := 6;
            gtvItemKet.EditValue := '-';
        end
     else
        begin
            qtyDoz := 0;
            qtyPcs := StrToFloat(qryFindKiri.Fields[7].AsString);
            qtyTot := StrToFloat(qryFindKiri.Fields[7].AsString);
            gtvItemKet.EditValue := 'UK ' + status;
            
        end;

     gtvItemDoz.EditValue := qtyDoz;
     gtvItemPcs.EditValue := qtyPcs;
     gtvItemQty.EditValue := qtyTot;
     gtvItemSubTotal.EditValue := (gtvItemHarga.EditValue / 12) * gtvItemQty.EditValue;
     gtvItemSubTotal.DataBinding.DataController.PostEditingData;

     edGrand.EditValue := EdSubTotal.EditValue;
     edGrand.PostEditValue;
end;

procedure TfrmMaster1.gtvItemDozPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     if (DisplayValue = NULL) then
        DisplayValue := 0;

     gtvItemDoz.EditValue := DisplayValue;
     gtvItemDoz.DataBinding.DataController.PostEditingData;
     if ((gtvItemDoz.EditValue <> NULL) or (gtvItemDoz.EditValue <> 0)) then
        begin
             if ((gtvItemPcs.EditValue <> NULL) or (gtvItemPcs.EditValue <> 0)) then
               begin
                    gtvItemQty.EditValue := (gtvItemDoz.EditValue*12) + gtvItemPcs.EditValue;
                    gtvItemQty.DataBinding.DataController.PostEditingData;
               end;
        end
     else
         gtvItemQty.EditValue := DisplayValue;

     gtvItemSubTotal.EditValue := (gtvItemHarga.EditValue / 12) * gtvItemQty.EditValue;
     gtvItemSubTotal.DataBinding.DataController.PostEditingData;
     edGrand.EditValue := EdSubTotal.EditValue;
     edGrand.PostEditValue;
end;

procedure TfrmMaster1.gtvItemPcsPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     if (DisplayValue = NULL) then
        DisplayValue := 0;

     gtvItemPcs.EditValue := DisplayValue;
     gtvItemPcs.DataBinding.DataController.PostEditingData;
     if ((gtvItemPcs.EditValue <> NULL) or (gtvItemPcs.EditValue <> 0)) then
        begin
             gtvItemQty.EditValue := (gtvItemDoz.EditValue*12) + gtvItemPcs.EditValue;
             gtvItemQty.DataBinding.DataController.PostEditingData;
        end
     else
         gtvItemQty.EditValue := DisplayValue;

    gtvItemSubTotal.EditValue := (gtvItemHarga.EditValue / 12) * gtvItemQty.EditValue;
    gtvItemSubTotal.DataBinding.DataController.PostEditingData;
    edGrand.EditValue := EdSubTotal.EditValue;
    edGrand.PostEditValue;
end;

procedure TfrmMaster1.btnDeleteClick(Sender: TObject);
var
   status,pesan, idtrans,idbarcode, str, nHapus : string;
   i : integer;
   qty_detail : double;
begin

   PostMessage(Handle, InputBoxMessage, 0, 0);
   nHapus := InputBox('Hapus Transaksi', 'Masukan Password','');
   if (nHapus <> frmMain.PASSDELETE) then
       begin
            ShowMessage('Maaf Password yang Anda Masukan Salah !!');
            Exit;
       end;
   TR_PERIODE := FormatDateTime('ddMMYY', NOW);
   btnDelete.Enabled := false;
   btnSave.Enabled := false;
   btnNew.Enabled := false;
   btnPrint.Enabled := false;
   Screen.Cursor := crHourGlass;
   with dmDB do
     begin
       idtrans := vartostr(edFaktur.EditValue);
       pesan:='Anda yakin Id trans ' + idtrans +#13+#13+
              'akan dihapus?';
       
       if (Messagedlg(Pesan,mtConfirmation,[mbYes,mbNo],0)=mrYes) then
        begin
             {Application.CreateForm(TfrmOtorisasi, frmOtorisasi);
             frmOtorisasi.ShowModal;
             if(frmMain.otorisasi = true) then
                      str := 'ID User : ' + edUser.Text + ',  ' + frmMain.ket_edit
             else
                   begin
                       Exit;
                       Screen.Cursor := crDefault;
                   end; }
             str := '-';
             TRFAKTURDEL :=CreateAutoNumDelete;
             
             qryFindKiri.Close;
             qryFindKiri.SQL.Clear;
             qryFindKiri.SQL.Add('Select * from trans_id ' +
                                 'Where id_trans = ''' + vartostr(lcbTransID.EditValue) + '''');
             qryFindKiri.Open;
        
             status :=  qryFindKiri.Fields[3].AsString;
             qrySearchKiri.Close;
             qrySearchKiri.SQL.Clear;
             qrySearchKiri.SQL.Add('Select * from trans1 ' +
                                   'Where id_faktur = ''' + VarToStr(edFaktur.EditValue) +'''');
             qrySearchKiri.Open;
             if(qrySearchKiri.IsEmpty) then
                begin
                     exit;
                end
             else
                begin
                     qryCariKiri.Close;
                     qryCariKiri.SQL.Clear;
                     qryCariKiri.SQL.Add('Select * from delete_mstr ' +
                                         'Where id_faktur_delete = ''' + TRFAKTURDEL + ''' and ' +
                                         'id_trans = ''' + VarToStr(edFaktur.EditValue) +'''');
                     qryCariKiri.Open;
                     if(qryCariKiri.IsEmpty) then
                        begin
                             qryExecKiri.Sql.Clear;
                             qryExecKiri.Sql.Add('Insert into delete_mstr values ( ' +
                                                 '''' + TRFAKTURDEL +''' , ' +
                                                 '''' + FormatDateTime('yyyy-mm-dd',Now) +''' , ' +
                                                 '''' + VarToStr(edFaktur.EditValue) +''' , ' +
                                                 '''' + FormatDateTime('yyyy-MM-dd', edTanggal.EditValue) +  ''' , ' +
                                                 '''' + IntToStr(gtvItem.DataController.RecordCount) +''' , ' +
                                                 '''' + qrySearchKiri.Fields[4].AsString +''' , ' +
                                                 '''' + qrySearchKiri.Fields[8].AsString +''' , ' +
                                                 '''' + frmLogin.edUser.Text  + ''' , ' +
                                                 '''' + str  + ''')');
                              qryExecKiri.ExecSql;
                              sleep(10);
                        end
                     else
                        begin
                            exit;
                        end;
                  end;
                  //delete detail
                     //ShowMessage('Test Detail');
                     qryFindKiri.Close;
                     qryFindKiri.SQL.Clear;
                     qryFindKiri.SQL.Add('SELECT * FROM delete_detail ' +
                                         'WHERE id_faktur_delete = ''' + TRFAKTURDEL + '''');
                     qryFindKiri.Open;

                     qryFindKiri.First;
                     qryCariKiri.Close;
                     qryCariKiri.SQL.Clear;
                     qryCariKiri.SQL.Add('Select * from trans_detail1 ' +
                                          'Where faktur_id = ''' + VarToStr(edFaktur.EditValue) + '''');
                     qryCariKiri.Open;
                     qryCariKiri.First;
                     //ShowMessage(inttostr(qryCariKiri.RecordCount-1));
                     if(qryFindKiri.IsEmpty) then
                        begin
                             if (qryCariKiri.IsEmpty) then
                               begin
                                    qryExecKiri.Sql.Clear;
                                    qryExecKiri.Sql.Add('Delete from trans1 ' +
                                                        'Where id_faktur = ''' + vartostr(edFaktur.EditValue) +'''');
                                    qryExecKiri.ExecSql;
                                    sleep(10);
                               end
                              else
                                begin
                                   for i:=0 to qryCariKiri.RecordCount-1 do
                                     begin
                                          qryExeKiri.Sql.Clear;
                                          qryExeKiri.Sql.Add('Insert into delete_detail values ( ' +
                                                             '''' + '' + ''' , ' +
                                                             '''' + TRFAKTURDEL + ''' , ' +
                                                             '''' + FormatDateTime('yyyy-mm-dd',Now) + ''' , ' +
                                                             '''' + inttostr(i+1) + ''' , ' +
                                                             '''' + qryCariKiri.Fields[3].AsString + ''' , ' +
                                                             '''' + qryCariKiri.Fields[4].AsString + ''' , ' +
                                                             '''' + qryCariKiri.Fields[5].AsString + ''' , ' +
                                                             '''' + qryCariKiri.Fields[6].AsString + ''' , ' +
                                                             '''' + qryCariKiri.Fields[7].AsString + ''' , ' +
                                                             '''' + qryCariKiri.Fields[8].AsString + ''' , ' +
                                                             '''' + qryCariKiri.Fields[15].AsString + ''' , ' +
                                                             '''' + qryCariKiri.Fields[10].AsString + ''' , ' +
                                                             '''' + qryCariKiri.Fields[11].AsString + ''' , ' +
                                                             '''' + 'NONE' + ''')');
                                          qryExeKiri.ExecSql;

                                          sleep(10);
                                          idbarcode := qryCariKiri.Fields[3].AsString;
                                          //idbarcode := Copy(barcodes, 1,length(barcodes)-2);
                                          no_seri := idbarcode;
                                          //valSatuan := Copy(barcodes, length(barcodes)-1,2);
                                          jenis_brg  := qryCariKiri.Fields[4].AsString;
                                          hargab := qryCariKiri.Fields[10].AsString;
                                          qty_brg := qryCariKiri.Fields[8].AsFloat;
                                               
                                          qrySearchKiri.Close;
                                          qrySearchKiri.SQL.Clear;
                                          qrySearchKiri.SQL.Add('Select * from barang ' +
                                                                'where id_barang = ''' + idbarcode + '''');
                                          qrySearchKiri.Open;
                                          qryCariKiri2.Close;
                                          qryCariKiri2.SQL.Clear;
                                          qryCariKiri2.SQL.Add('Select * from stok_ ' +
                                                              'where id_barang = ''' + idbarcode + '''');
                                          qryCariKiri2.Open;
                                          qty_detail := qryCariKiri.Fields[8].AsFloat;

                                          if(qrySearchKiri.IsEmpty) then
                                            begin
                                               namaBarang := 'NONE';
                                            end
                                          else
                                            begin
                                                namaBarang := qrySearchKiri.Fields[2].AsString;
                                             end;
                                            if(qryCariKiri2.IsEmpty) then
                                                begin
                                                   if(status = 'in') then
                                                      begin
                                                       // ShowMessage('Masuk');
                                                        qty_detail := 0-qty_detail;
                                                        qryExecKiri.Sql.Clear;
                                                        qryExecKiri.Sql.Add('INSERT INTO stok_ VALUES ( ' +
                                                                            '''' + qryCariKiri.Fields[3].AsString + ''', ' +
                                                                            '''' + qryCariKiri.Fields[4].AsString + ''' , ' +
                                                                            '''' + qryCariKiri.Fields[5].AsString + ''', ' +
                                                                            '''' + FloatToStr(qty_detail) + ''')');
                                                        qryExecKiri.ExecSql;
                                                        sleep(10);
                                                    end
                                                else
                                                    begin
                                                        //ShowMessage('Keluar');
                                                        qty_detail := 0+qty_detail;
                                                        qryExecKiri.Sql.Clear;
                                                        qryExecKiri.Sql.Add('INSERT INTO stok_ VALUES ( ' +
                                                                            '''' + qryCariKiri.Fields[3].AsString + ''', ' +
                                                                            '''' + qryCariKiri.Fields[4].AsString + ''' , ' +
                                                                            '''' + qryCariKiri.Fields[5].AsString + ''', ' +
                                                                            '''' + FloatToStr(qty_detail) + ''')');
                                                        qryExecKiri.ExecSql;
                                                        sleep(10);
                                                    end;
                                              end
                                            else
                                               begin
                               //tidak kosong stoknya
                                                  if (status = 'in') then
                                                     begin
                                                        //ShowMessage('Masuk');
                                                        kurang_stock;
                                                     end
                                                   else
                                                      begin
                                                        //ShowMessage('Keluar');
                                                        tambah_stock;
                                                      end; 
                                                end; //end cek stok
                                          qryCariKiri.Next;
                                     end;
                               
                                end;//akhir cek kosong atua tidak
                     

                     qryExeKiri.Sql.Clear;
                     qryExeKiri.Sql.Add('Delete from trans_detail1 ' +
                                        'Where faktur_id = ''' + vartostr(edFaktur.EditValue) +'''');
                     qryExeKiri.ExecSql;
                     sleep(10);
                     qryExecKiri.Sql.Clear;
                     qryExecKiri.Sql.Add('Delete from trans1 ' +
                                        'Where id_faktur = ''' + vartostr(edFaktur.EditValue) +'''');
                     qryExecKiri.ExecSql; 
                     sleep(10);
                     gtvItem.DataController.SelectAll;
                     gtvItem.DataController.DeleteSelection;
                     edFaktur.Clear;
                     edTanggal.Date := Date;
                     edNoNota.Clear;
                     edNotes.Visible := true;
                     edToko.Visible := false;
                     edNotes.Clear;
                     EdSubTotal.EditValue := 0;
                     edDiscount.EditValue := 0;
                     EQty.EditValue := 0;
                     cbJenisTrans.Text := 'Keluar';
                     lcbTransID.Text := 'Keluar Customer';
                     edGrand.EditValue := 0;
                     edPayment.Text := 'TUNAI';
                     edPayment2.Text := 'TUNAI';
                     edBayar2.EditValue := 0;
                     edTotBayar.EditValue := 0;
                     edKembalian.EditValue := 0;
                     edNamaBank.Clear;
                     edNoGiro.Clear;
                     edJatuhTempo.EditValue:= Date;
                     edUser.Text := frmMain.USERAPPS;
                     tblTrans1.Refresh;
                     qryDelete.Refresh;
                     ShowMessage('Data Berhasil Dihapus');
                end;

          end;
          btnDelete.Enabled := true;
          btnSave.Enabled := true;
          btnNew.Enabled := true;
          btnPrint.Enabled := true;
          Screen.Cursor := crDefault;
     end;
end;

procedure TfrmMaster1.gtvItemTcxGridDataControllerTcxDataSummaryFooterSummaryItems9GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
    if (AValue = Null) then
         begin
              EQty.EditValue := 0;
         end
     else
         begin
              EQty.EditValue := AValue;
     end;
end;

procedure TfrmMaster1.gtvItemTcxGridDataControllerTcxDataSummaryFooterSummaryItems10GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
    if (AValue = Null) then
         begin
              EdSubTotal.EditValue := 0;
              EdSubTotal.PostEditValue;
              edGrand.EditValue := EdSubTotal.EditValue - edDiscount.EditValue - edRetur.EditValue;
              edGrand.PostEditValue;
         end
     else
         begin
              EdSubTotal.EditValue := AValue;
              EdSubTotal.PostEditValue;
              edGrand.EditValue := EdSubTotal.EditValue - edDiscount.EditValue - edRetur.EditValue;
              edGrand.PostEditValue;
     end;
end;

procedure TfrmMaster1.gtvItemHargaPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
   idBarang : String;
   hargaModal, hargaDisplay : Double;
begin
     if(gtvItemHarga.EditValue=NULL) then
        begin
             if(DisplayValue=NULL) then
                begin
                     gtvItemHarga.EditValue:=DisplayValue;
                     gtvItemHarga.DataBinding.DataController.PostEditingData;

                end;
        end
        else
        gtvItemHarga.DataBinding.DataController.PostEditingData;
        hargadisplay := gtvItemHarga.EditValue;
        idBarang := gtvItemId.EditValue;
        qryCari.Close;
        qryCari.SQL.Clear;
        qryCari.SQL.Add('select harga_jual from barang where id_barang = ''' +
                                          idBarang + '''');
        qryCari.Open;
        hargaModal := qryCari.Fields[0].AsFloat;
        if (hargaDisplay < hargaModal) then
            begin
                 ShowMessage('Harga Lebih Kecil dari modal !!');
                 gtvItemHarga.EditValue := hargaModal;
                 gtvItemHarga.DataBinding.DataController.PostEditingData;
            end;

        gtvItemSubTotal.EditValue := (gtvItemHarga.EditValue / 12) * gtvItemQty.EditValue;
        gtvItemSubTotal.DataBinding.DataController.PostEditingData;
        edGrand.EditValue := EdSubTotal.EditValue;
        edGrand.PostEditValue;
        if((edPayment.EditValue = 'DP (DOWN PAYMENT)') or (edPayment.EditValue = 'KREDIT')) then
           Begin
             edDP.EditValue := '0';
           End
        else
           Begin
             edDP.EditValue := edGrand.EditValue;
           End;

end;

procedure TfrmMaster1.cxTextEdit1PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
      if ((edNoNota.EditValue = NULL) or (edNoNota.EditValue = '')) then
        begin
             if ((DisplayValue = NULL) or (DisplayValue = '')) then
                DisplayValue := '(NONE)';
             edNoNota.EditValue := DisplayValue;
             edNoNota.PostEditValue;
        end;
end;

procedure TfrmMaster1.edNotesPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
      if ((edNotes.EditValue = NULL) or (edNotes.EditValue = '')) then
        begin
             if ((DisplayValue = NULL) or (DisplayValue = '')) then
                DisplayValue := '(NONE)';
             edNotes.EditValue := DisplayValue;
             edNotes.PostEditValue;
        end;
end;

procedure TfrmMaster1.btnSaveClick(Sender: TObject);
var
   i, a, jmlBulan :integer;
   qty_detail,hrgbli, hargajual : double;
   status,idbarcode, nmabrg, stat_awal, edit,idtrans: string;
begin
 cekhargabarang;

 if (N_LOLOS = False) then Exit;
 jmlBulan := MonthsBetween(edTanggal.Date, Now);
 if (jmlBulan >= 12 ) then
     begin
          ShowMessage('Maaf Anda melakukan transaksi lebih dari 1 tahun');
          Exit;
     end;
 btnNew.Enabled := false;
 btnDelete.Enabled := false;
 btnSave.Enabled := false;
 btnPrint.Enabled := false;

 Screen.Cursor := crHourGlass;
 idtrans := VarToStr(lcbTransID.EditValue);
 if (edFaktur.Text = '') then
   begin
       ShowMessage('No.Transaksi masih kosong');

       btnNew.Enabled := true;
       btnDelete.Enabled := true;
       btnSave.Enabled := true;
       btnPrint.Enabled := true;
       Screen.Cursor := crDefault;
       exit;
   end
 else if (lcbTransID.Text = '') then
   begin
        ShowMessage('Silahkan Pilih Transaksi');
        btnNew.Enabled := true;
        btnDelete.Enabled := true;
        btnSave.Enabled := true;
        btnPrint.Enabled := true;
        Screen.Cursor := crDefault;
        exit;
   end
 else
   begin
     with dmDB do
      begin
       if( (idtrans = 'MMT') or (idtrans = 'KKT') or (idtrans = 'MRT') or (idtrans = 'KRT')) then
        begin
            if(edToko.Text = '') then
                begin
                    ShowMessage('Silahkan Pilih Toko.');
                    btnNew.Enabled := true;
                    btnDelete.Enabled := true;
                    btnSave.Enabled := true;
                    btnPrint.Enabled := true;
                    Screen.Cursor := crDefault;
                    exit;
                 end;
         end;
        //insert tabel trans1

        qryFindKiri.Close;
        qryFindKiri.SQL.Clear;
        qryFindKiri.SQL.Add('Select * from trans_id ' +
                        'Where id_trans = ''' + vartostr(lcbTransID.EditValue) + '''');
        qryFindKiri.Open;
        
        status :=  qryFindKiri.Fields[3].AsString;
        qryCariKiri2.Close;
        qryCariKiri2.SQL.Clear;
        qryCariKiri2.SQL.Add('SELECT id_faktur FROM trans1 ' +
                        'WHERE id_faktur= ''' + vartostr(edFaktur.EditValue) + '''');
        qryCariKiri2.Open;
        //edGrand.EditValue := EdSubTotal.EditValue - edDiscount.EditValue - edRetur.EditValue;
        //edGrand.PostEditValue;
        if (qryCariKiri2.IsEmpty) then
           begin
               qryExecKiri.Sql.Clear;
               qryExecKiri.Sql.Add('Insert into trans1 values('+
                             '''' + vartostr(edFaktur.EditValue) + ''' , ' +
                             '''' + FormatDateTime('yyyy-mm-dd',edTanggal.EditValue) + ''' , ' +
                             '''' + vartostr(edNoNota.EditValue) + ''' , ' +
                             '''' + vartostr(lcbTransID.EditValue) + ''' , ' +
                             '''' + vartostr(EQty.EditValue) + ''' , ' +
                             '''' + vartostr(EdSubTotal.EditValue) + ''' , ' +
                             '''' + vartostr(edDiscount.EditValue) + ''' , ' +
                             '''' + vartostr(edRetur.EditValue) + ''' , ' +
                             '''' + vartostr(edGrand.EditValue) + ''' , ' +
                             '''' + VarToStr(edCustomer.EditValue) + ''' , ' +
                             '''' + edPayment.Text + ''' , ' +
                             '''' + 'Y' + ''' , ' +
                             '''' + vartostr(edNotes.EditValue) + ''' , ' +
                             '''' + frmMain.APP_OUTLETID +''' , ' +
                             '''' + vartostr(edDP.EditValue) + ''' , ' +
                             '''' + vartostr(edSisaBayar.EditValue) + ''' , ' +
                             '''' + frmMain.USERAPPS + ''' , ' +
                             '''' + 'NONE' + ''' , ' +
                             '''' + VarToStr(edPayment2.EditValue) + ''' , ' +
                             '''' + vartostr(edBayar2.EditValue) + ''' , ' +
                             '''' + edNamaBank.Text + ''' , ' +
                             '''' + edNoGiro.Text + ''' , ' +
                             '''' + FormatDateTime('yyyy-MM-dd',edJatuhTempo.EditValue)  + ''' , ' +
                             '''' + VarToStr(edTotBayar.EditValue)  + ''' , ' +
                             '''' + VarToStr(edKembalian.EditValue)  + ''')');
                qryExecKiri.ExecSql;
             
              
              sleep(15);
           end
         else
           begin
             qryExecKiri.Sql.Clear;
             qryExecKiri.SQL.Add('UPDATE trans1 SET ' +
                            //'tanggal = ''' + FormatDateTime('YYYY-mm-dd', edTanggal.EditValue) + ''', ' +
                            'no_nota = ''' + vartostr(edNoNota.EditValue) + ''', ' +
                            'trans_id = ''' + vartostr(lcbTransID.EditValue) + ''', ' +
                            'tot_qty = ''' + vartostr(EQty.EditValue) + ''', ' +
                            'subtotal = ''' + vartostr(EdSubTotal.EditValue) + ''', ' +
                            'discount = ''' + vartostr(edDiscount.EditValue) + ''', ' +
                            'retur =''' + vartostr(edRetur.EditValue) + ''', ' +
                            'grandtotal = ''' + VarToStr(edGrand.EditValue) + ''', ' +
                            'nama_cust = ''' + VarToStr(edCustomer.EditValue) + ''', ' +
                            'payment_id = ''' + edPayment.Text + ''', ' +
                            'stock = ''' + 'Y' + ''', ' +
                            'notes = ''' + vartostr(edNotes.EditValue) + ''',' +
                            'id_toko = ''' + frmMain.APP_OUTLETID + ''' , ' +
                            'bayar_1 = ''' + VarToStr(edDP.EditValue) + ''' , ' +
                            'sisa_bayar = ''' + VarToStr(edSisaBayar.EditValue) + ''' , ' +
                            'notes_edit = ''' +  edit + ''' ,  ' +
                            'payment_2 = ''' + edPayment2.Text + ''' , ' +
                            'bayar_2 = ''' + VarToStr(edBayar2.EditValue) + ''' , ' +
                            'nama_bank = ''' + edNamaBank.Text + ''' , ' +
                            'no_giro = ''' + edNoGiro.Text + ''' , ' +
                            'tgl_jatuh_tempo = ''' + FormatDateTime('yyyy-MM-dd', edJatuhTempo.EditValue) + ''' , ' +
                            'total_bayar = ''' + VarToStr(edTotBayar.EditValue) + ''' , ' +
                            'kembalian = ''' + VarToStr(edKembalian.EditValue) + ''' ' +
                            'WHERE id_faktur = ''' + vartostr(edFaktur.EditValue) + '''');
           qryExecKiri.ExecSql;
           sleep(15);
           end;
             

         //awal tabel trans_detail1;
         qryFindKiri.Close;
         qryFindKiri.SQL.Clear;
         qryFindKiri.SQL.Add('SELECT * FROM trans_detail1 ' +
                             'WHERE faktur_id = ''' + vartostr(edFaktur.EditValue) + '''');
         qryFindKiri.Open;
         qryFindKiri.First;
         
         
         if (NOT qryFindKiri.IsEmpty) then
            begin
                 {Application.CreateForm(TfrmOtorisasi, frmOtorisasi);
                 frmOtorisasi.ShowModal;
                 if(frmMain.otorisasi = true) then
                      edit := 'ID User : ' + edUser.Text + ',  ' + frmMain.ket_edit
                 else
                   begin
                       Exit;
                       Screen.Cursor := crDefault;
                   end;}
                 for a:=0 to qryFindKiri.RecordCount-1 do
                   begin
                        idbarcode := qryFindKiri.Fields[3].AsString;
                        
                        no_seri :=  idbarcode;
                        
                        jenis_brg  := qryFindKiri.Fields[4].AsString;
                        hargab := qryFindKiri.Fields[10].AsString;
                        qrySearch.Close;
                        qrySearch.SQL.Clear;
                        qrySearch.SQL.Add('Select * from trans_id ' +
                                          'Where id_trans = ''' + qryFindKiri.Fields[17].AsString +'''');
                        qrySearch.Open;
                        
                        stat_awal := qrySearch.Fields[3].AsString;
                        
                        qty_detail := qryFindKiri.Fields[8].AsFloat;
                        qty_brg :=  qty_detail;
                        qrySearchKiri.Close;
                        qrySearchKiri.SQL.Clear;
                        qrySearchKiri.SQL.Add('Select * from barang ' +
                                              'where id_barang = ''' + idbarcode + '''');
                        qrySearchKiri.Open;
                        qryCariKiri.Close;
                        qryCariKiri.SQL.Clear;
                        qryCariKiri.SQL.Add('Select * from stok_ ' +
                                            'where id_barang = ''' + idbarcode + '''');
                        qryCariKiri.Open;
                        if(qrySearchKiri.IsEmpty) then
                           begin
                                sleep(10);
                                hrgbli := 0;
                                nmabrg := 'NONE';
                                namaBarang := nmabrg;
                           end
                         else
                           begin
                                hrgbli := qrySearchKiri.Fields[3].AsFloat;
                                nmabrg := qrySearchKiri.Fields[2].AsString;
                                namaBarang := nmabrg;
                           end;
                        if(qryCariKiri.IsEmpty) then
                         begin
                            if(stat_awal = 'in') then
                               begin
                                 qty_detail := 0-qty_detail;
                                 qryExecKiri.Sql.Clear;
                                 qryExecKiri.Sql.Add('INSERT INTO stok_ VALUES ( ' +
                                     '''' + idbarcode + ''', ' +
                                     '''' + jenis_brg + ''' , ' +
                                     '''' + namaBarang + ''', ' +
                                     '''' + FloatToStr(qty_detail) + ''')');
                                 qryExecKiri.ExecSql;
                                 sleep(10);
                               end
                             else
                               begin
                                 qty_detail := 0+qty_detail;
                                 qryExecKiri.Sql.Clear;
                                 qryExecKiri.Sql.Add('INSERT INTO stok_ VALUES ( ' +
                                     '''' + idbarcode + ''', ' +
                                     '''' + jenis_brg + ''' , ' +
                                     '''' + namaBarang + ''', ' +
                                     '''' + FloatToStr(qty_detail) + ''')');
                                 qryExecKiri.ExecSql;
                                 sleep(10);
                               end;
                            end
                          else
                              begin
                               //tidak kosong stoknya
                                  if (stat_awal = 'in') then
                                     begin
                                        kurang_stock;
                                     end
                                  else
                                     begin
                                        tambah_stock;
                                     end;
                               end; //end cek stok

                            qryFindKiri.Next;
                       end;
                       qryExeKiri.Sql.Clear;
                       qryExeKiri.sql.add('Delete from trans_detail1 ' +
                                           'where faktur_id = ''' + vartostr(edFaktur.EditValue) + '''');

                       qryExeKiri.ExecSql;
                       sleep(10);
            end;
           

           gtvItem.DataController.GotoFirst;
           for i:=0 to gtvItem.DataController.RecordCount-1 do
                 begin
                      idbarcode := Trim(gtvItem.DataController.GetValue(i,gtvItemId.Index));
                            
                      no_seri := idbarcode;
                            
                      jenis_brg  := vartostr(gtvItem.DataController.GetValue(i,gtvItemJenis.Index));
                      hargab := vartostr(gtvItem.DataController.GetValue(i,gtvItemHarga.Index));
                      hargajual := gtvItem.DataController.GetValue(i,gtvItemHarga.Index);
                      if (hargajual <= 0) then
                         begin
                              ShowMessage('Maaf Harga Jual Barang masih kosong !!' + #13 +
                                         'Mohon cek kembali Item[s] ');
                              Screen.Cursor := crDefault;
                              Exit;
                         end;

                      qty_brg := gtvItem.DataController.GetValue(i,gtvItemQty.Index);
                            
                      qryExecKiri.Sql.Clear;
                      qryExecKiri.Sql.Add('Insert into trans_detail1 values('+
                                                '''' + '' + ''' , ' +
                                                '''' + vartostr(edFaktur.EditValue) + ''' , ' +
                                                '''' + FormatDateTime('yyyy-mm-dd',edTanggal.EditValue)+ ''' , ' +
                                                '''' + vartostr(Trim(gtvItem.DataController.GetValue(i, gtvItemId.Index))) + ''' , ' +
                                                '''' + jenis_brg + ''' , ' +
                                                '''' + nmabrg + ''' , ' +
                                                '''' + vartostr(gtvItem.DataController.GetValue(i, gtvItemDoz.Index)) + ''' , ' +
                                                '''' + vartostr(gtvItem.DataController.GetValue(i, gtvItemPcs.Index)) + ''' , ' +
                                                '''' + vartostr(gtvItem.DataController.GetValue(i, gtvItemQty.Index)) + ''' , ' +
                                                '''' + VarToStr(gtvItem.DataController.GetValue(i, gtvItemKet.Index)) + ''' , ' +
                                                '''' + vartostr(gtvItem.DataController.GetValue(i, gtvItemHarga.Index)) + ''' , ' +
                                                '''' + vartostr(gtvItem.DataController.GetValue(i, gtvItemSubTotal.Index)) + ''' , ' +
                                                '''' + 'Y' + ''' , ' +
                                                '''' + '-' + ''' , ' +
                                                '''' + '-' + ''' , ' +
                                                '''' + FloatToStr(hrgbli) + ''', ' +
                                                '''' + inttostr(i+1) + ''', ' +
                                                '''' + vartostr(lcbTransID.EditValue) + ''' , ' +
                                                '''' + frmMain.APP_OUTLETID +''')');
                      qryExecKiri.ExecSql;
                      sleep(15);
                      if (status= 'in') then
                         begin
                             tambah_stock;
                         end
                      else
                         begin
                             kurang_stock;
                         end;
                      gtvItem.DataController.GotoNext;
                 end;
           //ShowMessage('Data Berhasil Disimpan');

       end;
       //ShowMessage('Data Berhasil Disimpan');
        btnNew.Enabled := true;
        btnDelete.Enabled := true;
        btnSave.Enabled := true;
        btnPrint.Enabled := true;

     end;
   Screen.Cursor := crDefault;
end;

procedure TfrmMaster1.lcbTransIDPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
       if ((lcbTransID.EditValue = NULL) or (lcbTransID.EditValue = '')) then
          begin
             if ((DisplayValue = NULL) or (DisplayValue = '')) then
                DisplayValue := '(NONE)';
             lcbTransID.EditValue := DisplayValue;
             lcbTransID.PostEditValue;
          end;
end;

procedure TfrmMaster1.btnStartScanner1Click(Sender: TObject);
begin
     try
        {Screen.Cursor := crHourGlass;
        bcSessID1.Active := true;
        sleep(100);
        btnStartScanner1.Enabled := false;
        btnStopScanner1.Enabled := true;

        Screen.Cursor := crDefault;}

        Screen.Cursor := crHourGlass;
        //*ShowMessage(frmMain.cfgPort);
        //bcBarcode1.Connected := True;
        //bcBarcode1.Port := frmMain.cfgPort;
        sleep(100);
        btnStartScanner1.Enabled := false;
        btnStopScanner1.Enabled := true
     except
           on Exception do
              begin
                   raise Exception.Create('Connection to Device-01 Error. Please contact your developer.');
                   exit;
              end;
     end;
end;

procedure TfrmMaster1.btnStopScanner1Click(Sender: TObject);
begin
     try
        Screen.Cursor := crHourGlass;
        //bcSessID1.Active := false;
        //bcBarcode1.Connected := False;
        sleep(100);
        btnStartScanner1.Enabled := true;
        btnStopScanner1.Enabled := false;
        //btnRestartScanner1.Enabled := false;
        Screen.Cursor := crDefault;
     except
           on Exception do
              begin
                   raise Exception.Create('Connection to Device-01 Error. Please contact your developer.');
                   exit;
              end;
     end;
end;

procedure TfrmMaster1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //bcSessID1.Active := False;
     
     Action := caFree;
end;

procedure TfrmMaster1.gtvItemNavigatorButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
var
   rec, i: integer;
   pesan,idbarang : string;
begin
     rec:= gtvItem.DataController.GetFocusedRecordIndex;
     idbarang := vartostr(gtvItem.DataController.GetValue(rec,gtvItemId.Index));
     pesan := 'Hapus Record?';
     Adone := false;
     if (AButtonIndex = 8) then
        begin
            Adone := true;
            if (Messagedlg(pesan,mtConfirmation,[mbYes,mbNo],0)=mrYes) then
              begin
                 gtvItem.DataController.DeleteFocused;
                 gtvItem.DataController.Refresh;
                 gtvItem.DataController.GotoFirst;
                 for i:=0 to gtvItem.DataController.RecordCount-1  do
                 begin
                    gtvItemNo.EditValue := i+1;
                    gtvItemNo.DataBinding.DataController.PostEditingData;
                    gtvItem.DataController.GotoNext;
                 end;
                 gtvItem.DataController.Refresh;
               end;
        end;
end;

procedure TfrmMaster1.btnPrintClick(Sender: TObject);
var
   idfaktur, idtrans, isSeri, strSeri, nPass, pesan : string;
   panjang, i, recSelect, rTot, jmlPcs, jmlLsn : Integer;
   nQty, TotSeri, jmlSeri : Double;
   qryMstr1, qryMstr2 : TMyQuery;
begin
    qryMstr1 := TMyQuery.Create(Self);
    qryMstr1.Connection := dmDB.dbInternal;
    qryMstr1.SQL.Add('select * from empty_x');
    qryMstr1.Active := true;

    qryMstr2 := TMyQuery.Create(Self);
    qryMstr2.Connection := dmDB.dbInternal;
    qryMstr2.SQL.Add('select * from empty_x');
    qryMstr2.Active := true;

    Screen.Cursor := crHourGlass;
    qryMstr2.Close;
    qryMstr2.SQL.Clear;
    qryMstr2.SQL.Add('select count(*) from information_schema.tables ' +
           'where table_schema = ''' + frmMain.LOCAL_DBNAME + ''' ' +
           'and table_name = ''' + 'ben_print' + '''');
    //ShowMessage('USE ''' + frmMain.DBNAME + ''';');
    qryMstr2.Open;
    qryMstr2.First;
    if (qryMstr2.Fields[0].AsInteger <= 0) then
      begin
        //ShowMessage('Tidak Ada Table');
        qryExec.SQL.Clear;
        qryExec.SQL.Add(memBenPrint.Text);
        qryExec.ExecSQL;
      end;
    Screen.Cursor := crDefault;


     N_LOLOS := False;
     qryMstr1.Close;
     qryMstr1.Close;
     qryMstr1.SQL.Clear;
     qryMstr1.SQL.Add('Select tanggal from trans1 ' +
                       'Where id_faktur = ''' + vartostr(edFaktur.EditValue) + '''');
     qryMstr1.Open;
     if (qryMstr1.Fields[0].AsDateTime <> Date) then
         begin
              PostMessage(Handle, InputBoxMessage, 0, 0);
              nPass := InputBox('Cetak Ulang Transaksi', 'Masukan Password','');
              if (nPass <> frmMain.PASSCETAK) then
                  begin
                       N_LOLOS := False;
                       ShowMessage('Maaf Password yang Anda Masukan Salah !!');
                       Exit;
                  end
              else if (nPass = frmMain.PASSCETAK) then
                  begin
                     N_LOLOS := True;
                  end;
         end
     else if (qryMstr1.Fields[0].AsDateTime = Date) then
         begin
           N_LOLOS := True;
         end;
     if (N_LOLOS = False) then Exit;

     pesan := 'Apakah Anda ingin mencetak Faktur Besar?' + #13 +
              'Click NO untuk cetak Faktur Kecil';
     btnSave.Click;
     if (Messagedlg(Pesan,mtConfirmation,[mbYes,mbNo],0)=mrYes) then
        begin
          qryMstr1.Close;
          qryMstr1.SQL.Clear;
          qryMstr1.SQL.Add('Select faktur_id from trans_detail1 ' +
                             'Where faktur_id = ''' + VarToStr(edFaktur.EditValue) + ''' ORDER BY no_urut ASC ');
          qryMstr1.Open;
          if (qryMstr1.RecordCount > 10) then
            begin
             Cetak2KolomLandscape;
             qryExec.SQL.Clear;
             qryExec.SQL.Add('insert into ben_print values(' +
               '''' + '' + ''',' +
               '''' + frmMaster1.edFaktur.Text + ''',' +
               '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
               '''' + FormatDateTime('hh:mm:ss', Time) + ''',' +
               QuotedStr(frmMain.USERAPPS) + ');');
             qryExec.ExecSQL;
            end
          else if (qryMstr1.RecordCount <= 10) then
            begin
              Cetak2KolomLandscape;
             qryExec.SQL.Clear;
             qryExec.SQL.Add('insert into ben_print values(' +
                 '''' + '' + ''',' +
                 '''' + frmMaster1.edFaktur.Text + ''',' +
                 '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                 '''' + FormatDateTime('hh:mm:ss', Time) + ''',' +
                 QuotedStr(frmMain.USERAPPS) + ');');
             qryExec.ExecSQL;
            end;
          Exit;
        end;
     CetakKecil;
     qryExec.SQL.Clear;
     qryExec.SQL.Add('insert into ben_print values(' +
         '''' + '' + ''',' +
         '''' + frmMaster1.edFaktur.Text + ''',' +
         '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
         '''' + FormatDateTime('hh:mm:ss', Time) + ''',' +
         QuotedStr(frmMain.USERAPPS) + ');');
     qryExec.ExecSQL;
  qryMstr1.Free;
  qryMstr2.Free;
end;

procedure TfrmMaster1.cxDBNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
var
  i, newRecord : integer;
begin
     case AButtonIndex of
        0, 2, 3, 5, 12 :
                begin
                  with dmDB do
                    begin
                       gtvItem.DataController.SelectAll;
                       gtvItem.DataController.DeleteSelection;
                       edFaktur.EditValue := qryTrans1.Fields[0].AsString;
                       edDiscount.EditValue := qryTrans1.Fields[6].AsFloat;
                       edNoNota.EditValue := qryTrans1.Fields[2].AsString;
                       edNotes.EditValue := qryTrans1.Fields[12].AsString;
                       EdSubTotal.EditValue := qryTrans1.Fields[5].AsFloat;
                       EQty.EditValue := qryTrans1.Fields[4].AsFloat;
                       lcbTransID.EditValue := qryTrans1.Fields[3].AsString;
                       //edRetur.EditValue := qryTrans1.Fields[7].AsFloat;
                       edGrand.EditValue := qryTrans1.Fields[8].AsFloat;
                       edPayment.EditValue := qryTrans1.Fields[10].AsString;
                       //edPayment.PostEditValue;
                       qryCariKiri.Close;
                       qryCariKiri.SQL.Clear;
                       qryCariKiri.SQL.Add('Select * from trans_detail1 ' +
                                           'where faktur_id =''' + qryTrans1.Fields[0].AsString + '''');
                       qryCariKiri.Open;
                       for i:=0 to qryCariKiri.RecordCount-1 do
                         begin
                            newRecord := gtvItem.DataController.InsertRecord(gtvItem.DataController.RecordCount);
                            gtvItem.DataController.SetValue(newRecord,gtvItemNo.Index, newRecord+1);
                            gtvItem.DataController.SetValue(newRecord,gtvItemId.Index, qryCariKiri.Fields[3].AsString);
                            gtvItem.DataController.SetValue(newRecord,gtvItemJenis.Index, qryCariKiri.Fields[4].AsString);
                            gtvItem.DataController.SetValue(newRecord,gtvItemDoz.Index, qryCariKiri.Fields[6].AsFloat);
                            gtvItem.DataController.SetValue(newRecord,gtvItemPcs.Index, qryCariKiri.Fields[7].AsFloat);
                            gtvItem.DataController.SetValue(newRecord,gtvItemQty.Index, qryCariKiri.Fields[8].AsFloat);
                            gtvItem.DataController.SetValue(newRecord,gtvItemHarga.Index, qryCariKiri.Fields[10].AsFloat);
                            gtvItem.DataController.SetValue(newRecord,gtvItemSubTotal.Index, qryCariKiri.Fields[11].AsFloat);
                            gtvItem.DataController.PostEditingData;
                            gtvItem.DataController.Post;
                            qryCariKiri.Next;
                         end;
                         tblTrans1.Refresh;
                    end;
                end;
      end;
end;

procedure TfrmMaster1.bcSessID1BarcodeReady(Sender: TObject;
  Barcode: String);
var
   newRecord, noUrut, RecSelect : integer;
   jns_brg, ket, status: string;
   ada : boolean;
   qty,harga,subtotal,doz, pcs, qtybrg, hrg_jual, doz_brg,pcs_brg,qtytot: double;
begin
     if (Barcode = 'NEWLS') then
         begin
              btnNew.Click;
              Exit;
         end
     else if (Barcode = 'PRINT') then
         begin
              btnPrint.Click;
              Exit;
         end
     else if (Barcode = 'SAVE') then
         begin
              btnSave.Click;
              Exit;
         end
     else if (Barcode = 'NEW') then
         begin
              btnNew.Click;
              Exit;
         end
     else if (Barcode = 'PRINTST') then
         begin
              btnPrint.Click;
              Exit;
         end
     else if (Barcode = 'SAVEST') then
         begin
              btnSave.Click;
              Exit;
         end;

     {with dmDB do
         begin
               
               qryFindKiri.Close;
               qryFindKiri.SQL.Clear;
               qryFindKiri.SQL.Add('Select * from barang ' +
                               'WHERE id_barang = ''' + Barcode + '''');
               qryFindKiri.Open;
               if(qryFindKiri.IsEmpty) then
                  begin
                       qryExecKiri.Sql.Clear;
                       qryExecKiri.Sql.Add('Insert into barang values(' +
                                      '''' + Barcode + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + '0' + ''' , ' +
                                      '''' + '0' + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + '-' + ''')');
                       qryExecKiri.ExecSql;
                       jns_brg := 'NONE';
                       hrg_jual := 0 ;
                       status := '-';
                   end
               else
                   begin
                        jns_brg := qryFindKiri.Fields[1].AsString;
                        hrg_jual := qryFindKiri.Fields[4].AsFloat;
                        status := qryFindKiri.Fields[7].AsString;
                   end;
               
               if((status = 'NONE') OR (status = '-') OR (status = '0') OR (status = '')) then
                begin
                        doz_brg := 0.5;
                        pcs_brg := 0;
                        qtytot := 6;
                        ket := '-';
                end
               else
                begin
                        doz_brg := 0;
                        pcs_brg := StrToFloat(dmDB.qryFindKiri.Fields[7].AsString);
                        qtytot := StrToFloat(dmDB.qryFindKiri.Fields[7].AsString);
                        ket := 'UK ' + status;
                end;
               ada := gtvItem.DataController.Search.Locate(gtvItemId.Index, Barcode);
               if (ada = True) then
                   begin
                        recSelect := gtvItem.DataController.GetFocusedRecordIndex;
                        doz:= strtofloat(vartostr(gtvItem.DataController.GetValue(recSelect,gtvItemDoz.Index))) + doz_brg;
                        pcs:= strtofloat(vartostr(gtvItem.DataController.GetValue(recSelect,gtvItemPcs.Index))) + pcs_brg;
                        qtybrg:= strtofloat(vartostr(gtvItem.DataController.GetValue(recSelect,gtvItemQty.Index))) + qtytot;
                        
                        gtvItem.DataController.SetValue(recSelect,gtvItemDoz.Index, doz);
                        gtvItem.DataController.SetValue(recSelect,gtvItemPcs.Index, pcs);
                        gtvItem.DataController.SetValue(recSelect,gtvItemQty.Index, qtybrg);
                        qty := strtofloat(vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemQty.Index)));
                        harga := StrToFloat(vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemHarga.Index)));
                        subtotal := (harga/12)*qty;
                        gtvItem.DataController.SetValue(recSelect,gtvItemSubTotal.Index, harga);
                        gtvItem.DataController.SetValue(recSelect,gtvItemSubTotal.Index, subtotal);
                        gtvItem.DataController.SetValue(recSelect,gtvItemKet.Index, ket);
                        gtvItem.DataController.PostEditingData;
                        gtvItem.DataController.Post;
                        edGrand.EditValue := EdSubTotal.EditValue;
                    end
               else
               if (ada = False) then
                   begin
                        
                        newRecord := gtvItem.DataController.InsertRecord(gtvItem.DataController.RecordCount);
                        noUrut := newRecord + 1;
                        gtvItem.DataController.SetValue(newRecord,gtvItemNo.Index,noUrut);
                        gtvItem.DataController.SetValue(newRecord,gtvItemId.Index,Barcode);
                                     
                        gtvItem.DataController.SetValue(newRecord,gtvItemJenis.Index,jns_brg );

                        gtvItem.DataController.SetValue(newRecord,gtvItemDoz.Index, doz_brg);
                        gtvItem.DataController.SetValue(newRecord,gtvItemPcs.Index, pcs_brg);
                        gtvItem.DataController.SetValue(newRecord,gtvItemQty.Index, qtytot);

                        gtvItem.DataController.SetValue(newRecord,gtvItemHarga.Index, hrg_jual );
                        qty := gtvItem.DataController.GetValue(newRecord, gtvItemQty.Index);
                        harga := gtvItem.DataController.GetValue(newRecord, gtvItemHarga.Index);
                        subtotal := (harga/12)*qty;
                        gtvItem.DataController.SetValue(newRecord,gtvItemSubTotal.Index, subtotal);
                        gtvItem.DataController.SetValue(newRecord,gtvItemKet.Index, ket);
                        gtvItem.DataController.PostEditingData;
                        gtvItem.DataController.Post;
                        edGrand.EditValue := EdSubTotal.EditValue;
                        gtvItem.DataController.FocusedRecordIndex := gtvItem.DataController.RecordCount-1;
                   end;
             end; }
end;

procedure TfrmMaster1.lcbTransIDClick(Sender: TObject);
var
  idtrans : string;
begin
     with dmDB do
       begin
       qrySearchKiri.Close;
       qrySearchKiri.SQL.Clear;
       qrySearchKiri.SQL.Add('Select * from trans_id ' +
                         'where id_trans = ''' + vartostr(lcbTransID.EditValue) +'''');
       qrySearchKiri.Open;
       idtrans := qrySearchKiri.Fields[1].AsString;
       if( (idtrans = 'MMT') or (idtrans = 'KKT') or (idtrans = 'MRT') or (idtrans = 'KRT')) then
         begin
              edNotes.Visible := false;
              edToko.Visible := true;
              qryToko.Close;
              qryToko.SQL.Clear;
              qryToko.SQL.Add('SELECT nama_toko FROM toko Where id_toko <> ''' + frmMain.APP_OUTLETID + '''');
              qryToko.Open;
              //edToko.Text := 'BARBERA BLOK A';
         end
       else
         begin
              edNotes.Visible := true;
              edToko.Visible := false;
              edNotes.Clear;
         end;

       end;
end;

procedure TfrmMaster1.edTanggalPropertiesChange(Sender: TObject);
begin
     edTglShow.Text := FormatDateTime('dd-mm-yyyy',edTanggal.EditValue);
end;

procedure TfrmMaster1.btnBrowseClick(Sender: TObject);
begin
     //dmDB.qryTrans1.Refresh;
    {qryMstr1 := TmySQLQuery.Create(Self);
    qryMstr1.Database := dmDB.dbToko;
    qryMstr1.SQL.Add('select * from empty_x');
    qryMstr1.Active := true;

    qryMstr2 := TmySQLQuery.Create(Self);
    qryMstr2.Database := dmDB.dbToko;
    qryMstr2.SQL.Add('select * from empty_x');
    qryMstr2.Active := true;}
     gtvItemUpdate.Visible := False;
      Application.CreateForm(TfrmBrowse1, frmBrowse1);
       with dmDB do
         begin
             qryTrans1.Close;
             qryTrans1.SQL.Clear;
             qryTrans1.SQL.Add('Select * from trans1 ' +
                               'Where tanggal >= ''' + FormatDateTime('yyyy-mm-dd',IncDay(Date,-10)) + ''' And ' +
                               'tanggal <= ''' + FormatDateTime('yyyy-mm-dd',Date) + ''' order by tanggal DESC');
             qryTrans1.Open;
         end;
      frmBrowse1.TvTrans.DataController.GotoFirst;
      frmBrowse1.ShowModal;

end;

procedure TfrmMaster1.cbJenisTransClick(Sender: TObject);
var
  status, jenistrans : string;
begin
     with dmDB do
       begin
            if( cbJenisTrans.Text = 'Masuk') then
              begin
                 status := 'in';
                 jenistrans := 'Masuk Dari Gudang';
                 //lcbTransID.Text := 'Masuk Dari Gudang';
              end
            else if( cbJenisTrans.Text = 'Keluar') then
               begin
                 status := 'out';
                 jenistrans := 'Keluar Customer';
                 //lcbTransID.Text := 'Keluar Customer';
               end;
            lcbTransID.Text := jenistrans;
            //ShowMessage(jenistrans);
            qryJenisTrans.Close;
            qryJenisTrans.SQL.Clear;
            qryJenisTrans.SQL.Add('Select * from trans_id ' +
                                  'Where status = ''' + status +'''');
            qryJenisTrans.Open;
            
            //ShowMessage( lcbTransID.Text);
       end;

end;

procedure TfrmMaster1.edDiscountPropertiesChange(Sender: TObject);
begin
     edDiscount.PostEditValue;
     edGrand.EditValue := EdSubTotal.EditValue - edDiscount.EditValue - edRetur.EditValue;
     edGrand.PostEditValue;
     if((edPayment.EditValue = 'DP (DOWN PAYMENT)') or (edPayment.EditValue = 'KREDIT')) then
           Begin
             edDP.EditValue := '0';
           End
     else
           Begin
             edDP.EditValue := edGrand.EditValue;
           End;
end;

procedure TfrmMaster1.edReturPropertiesChange(Sender: TObject);
begin
     edRetur.PostEditValue;
     edGrand.EditValue := EdSubTotal.EditValue - edDiscount.EditValue - edRetur.EditValue;
     edGrand.PostEditValue;
     if((edPayment.EditValue = 'DP (DOWN PAYMENT)') or (edPayment.EditValue = 'KREDIT')) then
           Begin
             edDP.EditValue := '0';
           End
     else
           Begin
             edDP.EditValue := edGrand.EditValue;
           End;
end;

procedure TfrmMaster1.edDPPropertiesChange(Sender: TObject);
begin
     edDP.PostEditValue;
     edGrand.EditValue := EdSubTotal.EditValue - edDiscount.EditValue - edRetur.EditValue;
     edGrand.PostEditValue;
     edTotBayar.EditValue := edBayar2.EditValue + edDP.EditValue;
     edTotBayar.PostEditValue;
     if((edGrand.EditValue - edTotBayar.EditValue) < 0) then
        begin
             edSisaBayar.EditValue :=0;
             edSisaBayar.PostEditValue;
        end
     else
        begin
            edSisaBayar.EditValue :=  edGrand.EditValue - edTotBayar.EditValue;
            edSisaBayar.PostEditValue;
        end;
     
     if(edTotBayar.EditValue >= edGrand.EditValue) then
        edKembalian.EditValue := edTotBayar.EditValue - edGrand.EditValue
     else
        edKembalian.EditValue := 0;
end;

procedure TfrmMaster1.edPaymentPropertiesChange(Sender: TObject);
begin
    edPayment.PostEditValue;
    if(edPayment.EditValue = 'HUTANG') then
      begin
          edNamaBank.Enabled := True;
          edNoGiro.Enabled := True;
          edJatuhTempo.Enabled := True;
          edEditTgl.Enabled := True;
          
      end
    else
       begin
          edNamaBank.Enabled := False;
          edNoGiro.Enabled := False;
          edJatuhTempo.Enabled := False;
          edEditTgl.Enabled := False;
          //edSisaBayar.EditValue :=0;
       end;
    if((edPayment.EditValue = 'DP (DOWN PAYMENT)') or (edPayment.EditValue = 'KREDIT')) then
        Begin
           edDP.EditValue := '0';
        End
    else
        Begin
            edDP.EditValue := edGrand.EditValue;
        End;
    edSisaBayar.EditValue := edGrand.EditValue -  edDP.EditValue;
    edSisaBayar.PostEditValue;

end;

procedure TfrmMaster1.edJatuhTempoPropertiesChange(Sender: TObject);
begin
     edEditTgl.Text := FormatDateTime('dd-mm-yyyy',edJatuhTempo.EditValue);
end;

procedure TfrmMaster1.edPayment2PropertiesChange(Sender: TObject);
begin
    edPayment2.PostEditValue;
    if(edPayment2.EditValue = 'HUTANG') then
      begin
          edNamaBank.Enabled := True;
          edNoGiro.Enabled := True;
          edJatuhTempo.Enabled := True;
          edEditTgl.Enabled := True;
          edSisaBayar.EditValue := edGrand.EditValue -  edDP.EditValue;
      end
    else
       begin
          edNamaBank.Enabled := False;
          edNoGiro.Enabled := False;
          edJatuhTempo.Enabled := False;
          edEditTgl.Enabled := False;
          edSisaBayar.EditValue :=0;
       end;
    edSisaBayar.PostEditValue;
end;

procedure TfrmMaster1.edBayar2PropertiesChange(Sender: TObject);
begin
     edBayar2.PostEditValue;
     edGrand.EditValue := EdSubTotal.EditValue - edDiscount.EditValue - edRetur.EditValue;
     edGrand.PostEditValue;
     edTotBayar.EditValue := edBayar2.EditValue + edDP.EditValue;
     edTotBayar.PostEditValue;
     if((edGrand.EditValue - edTotBayar.EditValue) < 0) then
        begin
             edSisaBayar.EditValue :=0;
             edSisaBayar.PostEditValue;
        end
     else
        begin
            edSisaBayar.EditValue :=  edGrand.EditValue - edTotBayar.EditValue;
            edSisaBayar.PostEditValue;
        end;
     if(edTotBayar.EditValue >= edGrand.EditValue) then
        edKembalian.EditValue := edTotBayar.EditValue - edGrand.EditValue
     else
        edKembalian.EditValue := 0;
end;

procedure TfrmMaster1.edTokoPropertiesChange(Sender: TObject);
begin
      edNotes.EditValue := edToko.EditValue;
      edNotes.PostEditValue;
end;

procedure TfrmMaster1.btnUpdateHargaClick(Sender: TObject);
var
   strHarga, idBarang : String;
   nilaiHarga, subtotal, Totqty,
   hargaBefore, hargaNow, hargaModal : Double;
   recSelect, i : Integer;
begin

     if (gtvItem.DataController.RecordCount <= 0) then Exit;
     strHarga := InputBox('Update Harga / Doz', 'Gunakan tanda (-) untuk pengurangan', '');
     gtvItemUpdate.Visible := True;
     //strHarga := Trim(strHarga);
     if (strHarga = '') then
       begin
            ShowMessage('Maaf Nilai yang Anda Masukan Salah !!');
            Exit;
       end;
     if (TryStrToFloat(strHarga, nilaiHarga) = False) then
       begin
            ShowMessage('Maaf Nilai yang Anda Masukan Salah !!');
            Exit;
       end
      else if (strHarga = '0') then
       begin
            ShowMessage('Maaf Nilai yang Anda Masukan Salah !!');
            Exit;
       end
      else if (TryStrToFloat(strHarga, nilaiHarga) = True) then
       begin
            gtvItem.DataController.GotoFirst;
            Screen.Cursor := crHourGlass;
            for i:=0 to gtvItem.DataController.RecordCount -1 do
                begin
                     recSelect := gtvItem.DataController.GetFocusedRecordIndex;
                     idBarang := vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemId.Index));
                     qryCari.Close;
                     qryCari.SQL.clear;
                     qryCari.SQL.Add('select harga_jual from barang where id_barang = ''' +
                                          idBarang + '''');
                     qryCari.Open;
                     hargaModal := qryCari.Fields[0].AsFloat;
                     Totqty := gtvItem.DataController.GetValue(recSelect, gtvItemQty.Index);
                     hargaBefore := gtvItem.DataController.GetValue(recSelect, gtvItemHarga.Index);
                     hargaNow := hargaBefore + nilaiHarga;
                     subtotal := Totqty * (hargaNow / 12);
                     if (hargaModal <= hargaNow) then
                         begin
                               gtvItem.DataController.SetValue(recSelect, gtvItemHarga.Index, hargaNow);
                               gtvItem.DataController.SetValue(recSelect, gtvItemSubTotal.Index, subtotal);
                               gtvItem.DataController.SetValue(recSelect, gtvItemUpdate.Index, 'Y');
                               gtvItem.DataController.PostEditingData;
                         end
                     else if (hargaModal >= hargaNow) then
                         begin
                               gtvItem.DataController.SetValue(recSelect, gtvItemUpdate.Index, 'N');
                                gtvItem.DataController.PostEditingData;
                         end;

                     //gtvItem.DataController.
                     gtvItem.DataController.Post;
                     gtvItem.DataController.GotoNext;
                     
                     Application.ProcessMessages;
                end;
            ShowMessage('Update Data Finish');
            btnUpdateHarga.Enabled := True;
            Screen.Cursor := crDefault;
       end
      //nilaiHarga := TryStrToFloat(strHarga);

end;

procedure TfrmMaster1.edScanClick(Sender: TObject);
begin
     edScan.SelectAll;
end;

procedure TfrmMaster1.edScanKeyPress(Sender: TObject; var Key: Char);
var
   newRecord, noUrut, RecSelect : integer;
   jns_brg, ket, status, Barcode : string;
   ada : boolean;
   qty,harga,subtotal,doz, pcs, qtybrg, hrg_jual, doz_brg,pcs_brg,qtytot: double;
begin
     if (key = #13) then
        begin
             Barcode := edScan.Text;
             with dmDB do
                 begin
                      qryFindKiri.Close;
                      qryFindKiri.SQL.Clear;
                      qryFindKiri.SQL.Add('Select * from barang ' +
                               'WHERE id_barang = ''' + Barcode + '''');
                      qryFindKiri.Open;

                      if(qryFindKiri.IsEmpty) then
                         begin
                           qryExecKiri.Sql.Clear;
                           qryExecKiri.Sql.Add('Insert into barang values(' +
                                      '''' + Barcode + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + '0' + ''' , ' +
                                      '''' + '0' + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + 'NONE' + ''' , ' +
                                      '''' + '-' + ''')');
                           qryExecKiri.ExecSql;
                           jns_brg := 'NONE';
                           hrg_jual := 0 ;
                           status := '-';
                         end
                     else
                         begin
                              jns_brg := qryFindKiri.Fields[1].AsString;
                              hrg_jual := qryFindKiri.Fields[4].AsFloat;
                              status := qryFindKiri.Fields[7].AsString;
                         end;
                     if((status = 'NONE') OR (status = '-') OR (status = '0') OR (status = '')) then
                         begin
                              doz_brg := 0.5;
                              pcs_brg := 0;
                              qtytot := 6;
                              ket := '-';
                         end
                     else
                        begin
                            doz_brg := 0;
                            pcs_brg := StrToFloat(qryFindKiri.Fields[7].AsString);
                            qtytot := StrToFloat(qryFindKiri.Fields[7].AsString);
                            ket := status;
                        end;
               ada := gtvItem.DataController.Search.Locate(gtvItemId.Index, Barcode);
               if (ada = True) then
                   begin
                        recSelect := gtvItem.DataController.GetFocusedRecordIndex;
                        doz:= strtofloat(vartostr(gtvItem.DataController.GetValue(recSelect,gtvItemDoz.Index))) + doz_brg;
                        pcs:= strtofloat(vartostr(gtvItem.DataController.GetValue(recSelect,gtvItemPcs.Index))) + pcs_brg;
                        qtybrg:= strtofloat(vartostr(gtvItem.DataController.GetValue(recSelect,gtvItemQty.Index))) + qtytot;
                        
                        gtvItem.DataController.SetValue(recSelect,gtvItemDoz.Index, doz);
                        gtvItem.DataController.SetValue(recSelect,gtvItemPcs.Index, pcs);
                        gtvItem.DataController.SetValue(recSelect,gtvItemQty.Index, qtybrg);
                        qty := strtofloat(vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemQty.Index)));
                        harga := StrToFloat(vartostr(gtvItem.DataController.GetValue(recSelect, gtvItemHarga.Index)));
                        subtotal := (harga/12)*qty;
                        gtvItem.DataController.SetValue(recSelect,gtvItemSubTotal.Index, harga);
                        gtvItem.DataController.SetValue(recSelect,gtvItemSubTotal.Index, subtotal);
                        gtvItem.DataController.SetValue(recSelect,gtvItemKet.Index, ket);
                        gtvItem.DataController.PostEditingData;
                        gtvItem.DataController.Post;
                        edGrand.EditValue := EdSubTotal.EditValue;
                    end
               else
               if (ada = False) then
                   begin
                        
                        newRecord := gtvItem.DataController.InsertRecord(gtvItem.DataController.RecordCount);
                        noUrut := newRecord + 1;
                        gtvItem.DataController.SetValue(newRecord,gtvItemNo.Index,noUrut);
                        gtvItem.DataController.SetValue(newRecord,gtvItemId.Index,Barcode);
                                     
                        gtvItem.DataController.SetValue(newRecord,gtvItemJenis.Index,jns_brg );

                        gtvItem.DataController.SetValue(newRecord,gtvItemDoz.Index, doz_brg);
                        gtvItem.DataController.SetValue(newRecord,gtvItemPcs.Index, pcs_brg);
                        gtvItem.DataController.SetValue(newRecord,gtvItemQty.Index, qtytot);

                        gtvItem.DataController.SetValue(newRecord,gtvItemHarga.Index, hrg_jual );
                        qty := gtvItem.DataController.GetValue(newRecord, gtvItemQty.Index);
                        harga := gtvItem.DataController.GetValue(newRecord, gtvItemHarga.Index);
                        subtotal := (harga/12)*qty;
                        gtvItem.DataController.SetValue(newRecord,gtvItemSubTotal.Index, subtotal);
                        gtvItem.DataController.SetValue(newRecord,gtvItemKet.Index, ket);
                        gtvItem.DataController.PostEditingData;
                        gtvItem.DataController.Post;
                        edGrand.EditValue := EdSubTotal.EditValue;
                        gtvItem.DataController.FocusedRecordIndex := gtvItem.DataController.RecordCount-1;
                   end;
             end;
            edScan.Clear;
            edScan.SetFocus;
        end;
end;

procedure TfrmMaster1.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
        begin
             edScan.SetFocus;
             edScan.SelectAll;
        end;
end;

procedure TfrmMaster1.edScanFocusChanged(Sender: TObject);
begin
     edScan.Text := 'Click Here To Start Scan..';
end;

end.
