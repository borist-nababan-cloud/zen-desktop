unit FPKBPayment;

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
  dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils, cxSpinEdit, cxTimeEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxLabel, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, XSuperObject, cxCalc, dxBevel, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  DBAccess, MyAccess, MemDS;

type
  TfrmPKBPayment = class(TForm)
    cxLabel1: TcxLabel;
    edPKBNumb: TcxTextEdit;
    cxLabel13: TcxLabel;
    edTglPKB: TcxDateEdit;
    edjamPKB: TcxTimeEdit;
    cxLabel2: TcxLabel;
    edKodeKonsumen: TcxTextEdit;
    btnCariPKB: TcxButton;
    edSubtotal: TcxCalcEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edDisc: TcxCalcEdit;
    cxLabel5: TcxLabel;
    edNamaKonsumen: TcxTextEdit;
    cxLabel6: TcxLabel;
    edPlatNomor: TcxTextEdit;
    cxLabel7: TcxLabel;
    edTotal: TcxCalcEdit;
    cxLabel8: TcxLabel;
    edmaterai: TcxCalcEdit;
    cxLabel9: TcxLabel;
    edGrantotal: TcxCalcEdit;
    cxLabel10: TcxLabel;
    edCash: TcxCalcEdit;
    dxBevel1: TdxBevel;
    cxLabel11: TcxLabel;
    edTransfer: TcxCalcEdit;
    cxLabel12: TcxLabel;
    edDebit: TcxCalcEdit;
    edRefTransfer: TcxTextEdit;
    edRefDebet: TcxTextEdit;
    edkembalian: TcxCalcEdit;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel18: TcxLabel;
    edTotalPayment: TcxCalcEdit;
    cxGrid1: TcxGrid;
    gtbPKB: TcxGridDBTableView;
    gtbPKBtypedetail: TcxGridDBColumn;
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
    gtbPKBisdelete: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    btnPay: TcxButton;
    cxButton2: TcxButton;
    qryDetails: TMyQuery;
    dsQryDetails: TMyDataSource;
    cxLabel17: TcxLabel;
    edNoKuitansi: TcxTextEdit;
    cxLabel19: TcxLabel;
    edRounding: TcxCalcEdit;
    cxButton4: TcxButton;
    btnCetakKuitansi: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnPayClick(Sender: TObject);
    procedure btnCariPKBClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDiscFocusChanged(Sender: TObject);
    procedure edTotalFocusChanged(Sender: TObject);
    procedure edCashFocusChanged(Sender: TObject);
    procedure edTransferFocusChanged(Sender: TObject);
    procedure edDebitFocusChanged(Sender: TObject);
    procedure edkembalianFocusChanged(Sender: TObject);
    procedure edTotalPaymentFocusChanged(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnCetakKuitansiClick(Sender: TObject);
  private
    { Private declarations }
    qryExec, qryPay1 : TMyQuery;
    PayJSON  : XSuperObject.ISuperObject;
  public
    { Public declarations }
  end;

var
  frmPKBPayment: TfrmPKBPayment;

implementation

{$R *.dfm}

uses FMain, FdmDB, FCariMasterPKB, FPKBCetakKuitansi;

function Terbilang(x :integer):string;
const abil : array[0..11] of string[10]=('','Satu','Dua','Tiga', 'Empat','Lima','Enam','Tujuh','Delapan','Sembilan', 'Sepuluh','Sebelas');
begin

     if (x < 12) then
         Result := ' ' + abil[x]
     else if (x < 20) then
         Result := Terbilang(x-10) + ' Belas'
     else if (x < 100) then
         Result := Terbilang(x div 10) + ' Puluh' + Terbilang(x mod 10)
     else if (x < 200) then
         Result := ' Seratus' + Terbilang(x-100)
     else if (x < 1000) then
         Result := Terbilang(x div 100) + ' Ratus' + Terbilang(x mod 100)
     else if (x < 2000) then
         Result := ' Seribu' + Terbilang(x-1000)
     else if (x < 1000000) then
         Result := Terbilang(x div 1000) + ' Ribu' + Terbilang(x mod 1000)
     else if (x < 1000000000) then
         Result := Terbilang(x div 1000000) + ' Juta' + Terbilang(x mod 1000000);
end;

procedure TfrmPKBPayment.btnCariPKBClick(Sender: TObject);
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
            'from ben_bengkel_pkb where status = ''' + 'F'  + ''' AND isdelete = ''' + 'N' + '''');
         qryList.Open;
         gtbList.DataController.Refresh;
     end;

   //frmCariMasterPKB.qryList.Active := True;
   frmCariMasterPKB.btnSelect.Tag := 2;
   //frmCariMasterPKB.gtbList.DataController.Refresh;
   frmCariMasterPKB.FormStyle := fsNormal;
   frmCariMasterPKB.WindowState := wsNormal;
   frmCariMasterPKB.Show;
   frmCariMasterPKB.Width := 800;
   frmCariMasterPKB.Height := 440;
   frmCariMasterPKB.Position := poDesktopCenter;
end;

procedure TfrmPKBPayment.btnCetakKuitansiClick(Sender: TObject);
var
   intGrand : Integer;
   strTerbilang : String;
begin
     qryPay1.Close;
     qryPay1.SQL.Clear;
     qryPay1.SQL.Add('select codecust, nopol, namacust, alamatcust, kotacust, telpcust, tglkirim, ' +
           'kodetype, warna, tahun, norangka, nomesin from ben_bengkel_customer where ' +
           'codecust = ''' + edKodeKonsumen.Text + '''');
     qryPay1.Open;

     Application.CreateForm(TfrmPKBCetakKuitansi, frmPKBCetakKuitansi);
     with frmPKBCetakKuitansi do
       begin
           intGrand := Round(edGrantotal.EditValue);
           strTerbilang := Terbilang(intGrand);
           lblOutletName.Caption := frmMain.APP_OUTLETNAME;
           lblOutletAlamat.Caption := frmMain.APP_OUTLETADDRESS;
           lblOutletKota.Caption := frmMain.APP_OUTLETCITY + ' ' + frmMain.APP_OUTLETPROVINCE;
           lblOutletTelepon.Caption := 'Telp. ' + frmMain.APP_OUTLETPHONE;
           lblTerbilang.Caption := strTerbilang;
           lblNoKutansi.Caption := 'KB.' + edPKBNumb.Text;
           lblTglKuitansi.Caption := FormatDateTime('dd MMMM yyyy', Date);
           lblNamaCust.Caption := qryPay1.Fields[2].AsString;
           lblAlamat.Caption := qryPay1.Fields[3].AsString;
           lblKota.Caption := qryPay1.Fields[4].AsString;
           lblNoFaktur.Caption := 'F.' + edPKBNumb.Text;
           lblKeterangan.Caption := 'PKB No.   ' + edPKBNumb.Text + '     ' + 'NO. POL :   ' + qryPay1.Fields[1].AsString;
           lblTotal.Caption := 'Total (Rp)    ' + FormatFloat('#,#', edGrantotal.EditValue);
           lblBeaMaterai.Caption := 'Rp. ' + FormatFloat('#,#', edmaterai.EditValue);
       end;
     frmPKBCetakKuitansi.qrpKuitansi.Preview;
end;

procedure TfrmPKBPayment.btnPayClick(Sender: TObject);
var
  tmpPKB, frstCode, kuitansiNumb, strJson : String;
  lastInt, newLastInt : Integer;
  sisaBayar : Double;
begin
    if (edPKBNumb.Text = '') then Exit;
    edTotal.EditValue := edSubtotal.EditValue - (edSubtotal.EditValue * edDisc.EditValue / 100);
    if (edTotal.EditValue <= 250000) then edmaterai.EditValue := 0
    else if ((edTotal.EditValue > 250000) AND (edTotal.EditValue <= 1000000)) then edmaterai.EditValue := 3000
    else if (edTotal.EditValue > 1000000) then edmaterai.EditValue := 6000;
    edGrantotal.EditValue := edTotal.EditValue + edmaterai.EditValue;

    //ConfigJSON := XSuperObject.SO('{}');
    sisaBayar := edGrantotal.EditValue - edTotalPayment.EditValue;
    if (sisaBayar > 500) then
      begin
          ShowMessage('Payment Masih Kurang !');
          exit;
      end;
    if (edNoKuitansi.Text = '') then
      begin
           edNoKuitansi.Text := 'PAY.' + edPKBNumb.Text;
      end;
    PayJSON := XSuperObject.SO('{}');
    PayJSON.F['CASH'] := edCash.EditValue;
    PayJSON.F['EXCHANGE'] := edkembalian.EditValue;
    PayJSON.F['ROUNDING'] := edRounding.EditValue;
    PayJSON.F['TRANSFER'] := edTransfer.EditValue;
    PayJSON.S['TRANSFER-REF'] := edRefTransfer.Text;
    PayJSON.F['DEBET/CREDIT'] := edDebit.EditValue;
    PayJSON.S['CARD-REF'] := edRefDebet.Text;
    strJson := PayJSON.AsJSON(True, True);
    //ShowMessage(strJson);
    //ConfigJSON.O['AppInfo'].AsObject.S['AppName'] := APP_NAME;
    qryExec.SQL.Clear;
    qryExec.SQL.Add('insert into ben_bengkel_pkb_pelunasan values(' +
        '''' + '' + ''',' +
        '''' + edNoKuitansi.Text + ''',' +
        '''' + edPKBNumb.Text + ''',' +
        '''' + edKodeKonsumen.Text + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd',edTglPKB.Date) + ''',' +
        '''' + FormatDateTime('hh:mm:ss', edjamPKB.Time) + ''',' +
        '''' + FloatToStr(edSubtotal.EditValue) + ''',' +
        '''' + FloatToStr(edDisc.EditValue) + ''',' +
        '''' + FloatToStr(edTotal.EditValue) + ''',' +
        '''' + FloatToStr(edmaterai.EditValue) + ''',' +
        '''' + FloatToStr(edGrantotal.EditValue) + ''',' +
        '''' + FloatToStr(edTotalPayment.EditValue) + ''',' +
        QuotedStr(strJson) + ',' +
        '''' + 'N' + ''',' +
        '''' + frmMain.USERAPPS + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
     qryExec.SQL.Add('update ben_bengkel_pkb set ' +
       'status = ''' + 'P' + ''', ' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where pkbnumber = ''' + edPKBNumb.Text + ''';');
    qryExec.ExecSQL;
    ShowMessage('PKB Payed');
    btnPay.Enabled := False;
    btnCetakKuitansi.Click;
end;


procedure TfrmPKBPayment.cxButton2Click(Sender: TObject);
begin
    qryDetails.Close;
    qryDetails.SQL.Clear;
    qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where pkbnumber = ''' + 'X' + '''');
    qryDetails.Open;
    gtbPKB.DataController.Refresh;
    edPKBNumb.Clear;
    edTglPKB.Date := Date;
    edjamPKB.Time := Time;
    edKodeKonsumen.Clear;
    edSubtotal.EditValue := 0;
    edNamaKonsumen.EditValue := 0;
    edTotal.EditValue := 0;
    edmaterai.EditValue := 0;
    edGrantotal.EditValue := 0;
    edTransfer.EditValue := 0;
    edDebit.EditValue := 0;
    edPlatNomor.Clear;
    edRefTransfer.Clear;
    edkembalian.EditValue := 0;
    edNoKuitansi.Clear;
    edRefDebet.Clear;
end;

procedure TfrmPKBPayment.edCashFocusChanged(Sender: TObject);
begin
    edTotal.EditValue := edSubtotal.EditValue - (edSubtotal.EditValue * edDisc.EditValue / 100);
    if (edTotal.EditValue <= 250000) then edmaterai.EditValue := 0
    else if ((edTotal.EditValue > 250000) AND (edTotal.EditValue <= 1000000)) then edmaterai.EditValue := 3000
    else if (edTotal.EditValue > 1000000) then edmaterai.EditValue := 6000;
    edGrantotal.EditValue := edTotal.EditValue + edmaterai.EditValue;
    edTotalPayment.EditValue := edCash.EditValue + edDebit.EditValue + edTransfer.EditValue;
    if (edCash.EditValue > edGrantotal.EditValue) then edkembalian.EditValue := edCash.EditValue - edGrantotal.EditValue;
    
end;

procedure TfrmPKBPayment.edDebitFocusChanged(Sender: TObject);
begin
     edTotal.EditValue := edSubtotal.EditValue - (edSubtotal.EditValue * edDisc.EditValue / 100);
    if (edTotal.EditValue <= 250000) then edmaterai.EditValue := 0
    else if ((edTotal.EditValue > 250000) AND (edTotal.EditValue <= 1000000)) then edmaterai.EditValue := 3000
    else if (edTotal.EditValue > 1000000) then edmaterai.EditValue := 6000;
    edGrantotal.EditValue := edTotal.EditValue + edmaterai.EditValue;
    edTotalPayment.EditValue := edCash.EditValue + edDebit.EditValue + edTransfer.EditValue;
end;

procedure TfrmPKBPayment.edDiscFocusChanged(Sender: TObject);
begin
    edTotal.EditValue := edSubtotal.EditValue - (edSubtotal.EditValue * edDisc.EditValue / 100);
    if (edTotal.EditValue <= 250000) then edmaterai.EditValue := 0
    else if ((edTotal.EditValue > 250000) AND (edTotal.EditValue <= 1000000)) then edmaterai.EditValue := 3000
    else if (edTotal.EditValue > 1000000) then edmaterai.EditValue := 6000;
    edGrantotal.EditValue := edTotal.EditValue + edmaterai.EditValue;
    edTotalPayment.EditValue := edCash.EditValue + edDebit.EditValue + edTransfer.EditValue;
end;

procedure TfrmPKBPayment.edkembalianFocusChanged(Sender: TObject);
begin
     edTotal.EditValue := edSubtotal.EditValue - (edSubtotal.EditValue * edDisc.EditValue / 100);
    if (edTotal.EditValue <= 250000) then edmaterai.EditValue := 0
    else if ((edTotal.EditValue > 250000) AND (edTotal.EditValue <= 1000000)) then edmaterai.EditValue := 3000
    else if (edTotal.EditValue > 1000000) then edmaterai.EditValue := 6000;
    edGrantotal.EditValue := edTotal.EditValue + edmaterai.EditValue;
    edTotalPayment.EditValue := edCash.EditValue + edDebit.EditValue + edTransfer.EditValue;
    if (edCash.EditValue > edGrantotal.EditValue) then edkembalian.EditValue := edCash.EditValue - edGrantotal.EditValue;
end;

procedure TfrmPKBPayment.edTotalFocusChanged(Sender: TObject);
begin
    edTotal.EditValue := edSubtotal.EditValue - (edSubtotal.EditValue * edDisc.EditValue / 100);
    if (edTotal.EditValue <= 250000) then edmaterai.EditValue := 0
    else if ((edTotal.EditValue > 250000) AND (edTotal.EditValue <= 1000000)) then edmaterai.EditValue := 3000
    else if (edTotal.EditValue > 1000000) then edmaterai.EditValue := 6000;
    edGrantotal.EditValue := edTotal.EditValue + edmaterai.EditValue;
    edTotalPayment.EditValue := edCash.EditValue + edDebit.EditValue + edTransfer.EditValue;
end;

procedure TfrmPKBPayment.edTotalPaymentFocusChanged(Sender: TObject);
begin
     edTotal.EditValue := edSubtotal.EditValue - (edSubtotal.EditValue * edDisc.EditValue / 100);
    if (edTotal.EditValue <= 250000) then edmaterai.EditValue := 0
    else if ((edTotal.EditValue > 250000) AND (edTotal.EditValue <= 1000000)) then edmaterai.EditValue := 3000
    else if (edTotal.EditValue > 1000000) then edmaterai.EditValue := 6000;
    edGrantotal.EditValue := edTotal.EditValue + edmaterai.EditValue;
    edTotalPayment.EditValue := edCash.EditValue + edDebit.EditValue + edTransfer.EditValue;
end;

procedure TfrmPKBPayment.edTransferFocusChanged(Sender: TObject);
begin
    edTotal.EditValue := edSubtotal.EditValue - (edSubtotal.EditValue * edDisc.EditValue / 100);
    if (edTotal.EditValue <= 250000) then edmaterai.EditValue := 0
    else if ((edTotal.EditValue > 250000) AND (edTotal.EditValue <= 1000000)) then edmaterai.EditValue := 3000
    else if (edTotal.EditValue > 1000000) then edmaterai.EditValue := 6000;
    edGrantotal.EditValue := edTotal.EditValue + edmaterai.EditValue;
    edTotalPayment.EditValue := edCash.EditValue + edDebit.EditValue + edTransfer.EditValue;
end;

procedure TfrmPKBPayment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    qryExec.Free;
    qryPay1.Free;
    Action := caFree;
end;

procedure TfrmPKBPayment.FormCreate(Sender: TObject);
begin
     qryDetails.Active := True;
     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from temptable');
     qryExec.Active := true;

     qryPay1 := TMyQuery.Create(Self);
     qryPay1.Connection := DMDB.dbInternal;
     qryPay1.SQL.Add('select * from temptable');
     qryPay1.Active := true;

     edTglPKB.Date := Date;
     edjamPKB.Time := Time;

end;

end.
