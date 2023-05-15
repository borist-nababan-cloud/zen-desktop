unit FPelunasan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxSpinEdit, cxTimeEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalc, Menus, cxLookAndFeelPainters, cxButtons,
  cxCheckBox, AdvGlowButton, DateUtils, AppEvnts, cxLookAndFeels, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, WinInet, MyAccess, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, DBAccess, MemDS;

type
  TfrmPelunasan = class(TForm)
    edTransIDPayment: TcxTextEdit;
    Label1: TLabel;
    edTanggalPayment: TcxDateEdit;
    edStartPayment: TcxTimeEdit;
    edNamaCustomerPayment: TcxTextEdit;
    edPayment: TcxLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edPointPayment: TcxCalcEdit;
    Label8: TLabel;
    edGrandTotalPayment: TcxCalcEdit;
    edReferansi: TcxTextEdit;
    Label9: TLabel;
    Label10: TLabel;
    edTambahPoint: TcxCalcEdit;
    edDiscAmount: TcxCalcEdit;
    edDiscPercent: TcxCalcEdit;
    edSubtotalPayment: TcxCalcEdit;
    cxCheckBox1: TcxCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    btnRedeem: TcxButton;
    btnPay: TcxButton;
    Label16: TLabel;
    edTotalPayment: TcxCalcEdit;
    Label17: TLabel;
    edBayarPayment: TcxCalcEdit;
    Label18: TLabel;
    edKembalianPayment: TcxCalcEdit;
    Label20: TLabel;
    edSisaPoint: TcxCalcEdit;
    lblCustomer: TLabel;
    btnCheckP: TcxButton;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvPayment: TcxGridTableView;
    gtvPaymentTransID: TcxGridColumn;
    gtvPaymentTransType: TcxGridColumn;
    gtvPaymentNamaJasa: TcxGridColumn;
    gtvPaymentSubtotal: TcxGridColumn;
    btnMerge: TcxButton;
    gtvPaymentTherapistID: TcxGridColumn;
    gtvPaymentRoomID: TcxGridColumn;
    gtvPaymentQty: TcxGridColumn;
    gtvPaymentNama: TcxGridColumn;
    Label15: TLabel;
    edKurangPoint: TcxCalcEdit;
    gtvPaymentHarga: TcxGridColumn;
    edIDCustomerPayment: TcxTextEdit;
    btnDelete: TcxButton;
    btnCancelP: TcxButton;
    btnCeckGC: TcxButton;
    gtvPaymentPoint: TcxGridColumn;
    appEven: TApplicationEvents;
    Label4: TLabel;
    btnMemberTrans: TcxButton;
    lblCecker: TLabel;
    Label19: TLabel;
    edPembulatan: TcxCalcEdit;
    dbOnline: TMyConnection;
    ServerSearch: TMyQuery;
    ServerExec: TMyQuery;
    ServerCari: TMyQuery;
    PrintMaster: TMyQuery;
    dsPrintMaster: TMyDataSource;
    PrintDetail: TMyQuery;
    dsPrintDetail: TMyDataSource;
    qryGCDetail: TMyQuery;
    dsqryGCDetail: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnCheckPClick(Sender: TObject);
    procedure btnMergeClick(Sender: TObject);
    procedure gtvPaymentTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure edDiscAmountPropertiesChange(Sender: TObject);
    procedure edDiscPercentPropertiesChange(Sender: TObject);
    procedure edPaymentPropertiesChange(Sender: TObject);
    procedure btnRedeemClick(Sender: TObject);
    procedure edIDCustomerPaymentPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure edIDCustomerPaymentPropertiesChange(Sender: TObject);
    procedure edDiscAmountPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure edDiscPercentPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure btnPayClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelPClick(Sender: TObject);
    procedure edReferansiClick(Sender: TObject);
    procedure btnCeckGCClick(Sender: TObject);
    procedure edBayarPaymentPropertiesChange(Sender: TObject);
    procedure edBayarPaymentPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure gtvPaymentTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure appEvenShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure btnMemberTransClick(Sender: TObject);
    procedure edIDCustomerPaymentKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qrySearch, qryFind, qryCari, qryUpdate, qryFoot : TMyQuery;
  public
    { Public declarations }
     V_TRANS, V_DATE, V_NUMBER, V_ID : String;
     NO_MEMBER : String;
     LOCAL_POINT, SERVER_POINT, TAMBAH_POINT, KURANG_POINT,
     SISA_POINT, AWAL_POINT : Double;
     SERVER_NAMA : string;
     function CreateNewAutoNum: string;
     Function cekonline : Boolean;
     procedure Cek_Local;
     procedure Cek_Online;
     procedure Update_Server;
     procedure ReCalcTotal;
  end;

var
  frmPelunasan: TfrmPelunasan;

implementation

uses FDMDB, FPayment, FTransRedeem, FPrintTrans, FMain, FEmpty, FMerger,
  FPayGC, FTransMember, FNewPrintTrans;

{$R *.dfm}

function TfrmPelunasan.CreateNewAutoNum: string;
var
   lastID, strTmpNum, strNum, NewID : string;
   intTmpNum, intNum : integer;
begin

               NewID := V_TRANS + '.' + V_DATE + '.';

               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('SELECT id_payment FROM trans_payment ' +
                               'WHERE id_payment LIKE ''' + NewID + '%'' ORDER BY id_payment ASC');
               qrySearch.Open;

               if (qrySearch.IsEmpty) then
                  begin
                       Result := V_TRANS + '.' + V_DATE + '.' + '001';
                       exit;
                  end;

               qrySearch.Last;

               lastID    := qrySearch.Fields[0].AsString;
               strTmpNum := Copy(lastID, length(lastID)-2, 3);
               intTmpNum := strtoint(strTmpNum);
               intNum    := intTmpNum + 1;

               case length(inttostr(intNum)) of
                    //1 : strNum := '0000' + inttostr(intNum);
                    //2 : strNum := '000' + inttostr(intNum);
                    1 : strNum := '00' + inttostr(intNum);
                    2 : strNum := '0' + inttostr(intNum);
                    3 : strNum := inttostr(intNum);
               end;

               V_NUMBER := strNum;
               V_ID := V_TRANS + '.' + V_DATE + '.' + V_NUMBER;
               Result := V_ID;

end;

Function TfrmPelunasan.cekonline;
begin
     result := (InternetGetConnectedState(nil, 0))
end;

procedure TfrmPelunasan.ReCalcTotal;
var
   sisaBulat, tambahBulat, resBulat, subtotal : Integer;
begin
   if (edSubtotalPayment.EditValue = Null) then
     begin
          Exit;
     end;
   subtotal := edSubtotalPayment.EditValue - (edSubtotalPayment.EditValue * edDiscPercent.EditingValue / 100) - edDiscAmount.EditValue;
   //edTotalPayment.EditValue := subtotal - edDiscAmount.EditValue;
   sisaBulat := Trunc(subtotal) mod 500;
   if (sisaBulat = 0) then tambahBulat := 0
   else tambahBulat := 500 - sisaBulat;
   resBulat := subtotal + tambahBulat;
   if (edPayment.Text = 'CASH') then
     begin
       edTotalPayment.EditValue := resBulat;
       edGrandTotalPayment.EditValue := resBulat;
       edPembulatan.EditValue := tambahBulat;
     end
   else if (edPayment.Text <> 'CASH') then
     begin
       edTotalPayment.EditValue := subtotal;
       edPembulatan.EditValue := 0;
       edGrandTotalPayment.EditValue := subtotal;
     end;
   edTambahPoint.EditValue := subtotal / 10000;
   //edKurangPoint.EditValue := 0;
   //edSisaPoint.EditValue := edPointPayment.EditValue + edTambahPoint.EditValue;
end;

procedure TfrmPelunasan.FormActivate(Sender: TObject);
begin
     SERVER_NAMA := '';
     SERVER_POINT := 0;
end;

procedure TfrmPelunasan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dbOnline.Connected := False;
     Action := caFree;
end;

procedure TfrmPelunasan.FormCreate(Sender: TObject);
begin
     V_ID := CreateNewAutoNum;
     V_TRANS := 'PS';
     V_DATE := FormatDateTime('ddMMYY', date);
     V_NUMBER := '001';
     edTanggalPayment.Date := Date;
     edStartPayment.Time := Time;
     edPayment.Text := 'CASH';
end;

procedure TfrmPelunasan.Cek_Local;
begin

end;

procedure TfrmPelunasan.Update_Server;
begin
     if (dbOnline.Connected = True) then
         begin
              ServerSearch.Close;
              ServerSearch.SQL.Clear;
              ServerSearch.SQL.Add('select id_members, nama_lengkap, tot_point from members where id_members = ''' +
                                   NO_MEMBER + '''');
              ServerSearch.Open;
              if (NOT ServerSearch.IsEmpty) then
                  begin
                       ServerExec.Sql.Clear;
                       ServerExec.Sql.Add('update members set ' +
                                 'tot_point = ''' + vartostr(SISA_POINT) + ''' ' +
                                 'where id_members = ''' + edIDCustomerPayment.Text + '''');
                       ServerExec.ExecSql;
                       Sleep(100);
                       ServerExec.Sql.Clear;
                       ServerExec.Sql.Add('insert into history_trans values(' +
                                          '''' + '' + ''',' +
                                          '''' + edTransIDPayment.Text + ''',' +
                                          '''' + FormatDateTime('yyyy-MM-dd', Now) + ''',' +
                                          '''' + FormatDateTime('hh:mm:ss', Now) + ''',' +
                                          '''' + FloatToStr(edGrandTotalPayment.EditValue) + ''',' +
                                          '''' + edIDCustomerPayment.Text + ''',' +
                                          '''' + FloatToStr(AWAL_POINT) + ''',' +
                                          '''' + FloatToStr(TAMBAH_POINT) + ''',' +
                                          '''' + FloatToStr(KURANG_POINT) + ''',' +
                                          '''' + FloatToStr(SISA_POINT) + ''',' +
                                          '''' + frmMain.APP_OUTLETID + ''',' +
                                          '''' + 'AUTOMATIC' + ''')');
                       ServerExec.ExecSql;
                  end;
         end;
end;

procedure TfrmPelunasan.Cek_Online;
begin
     ServerSearch.Close;
     ServerSearch.SQL.Clear;
     ServerSearch.SQL.Add('select id_members, nama_lengkap, tot_point from members where id_members = ''' +
                          NO_MEMBER + '''');
     ServerSearch.Open;

     if (ServerSearch.IsEmpty) then
         begin
              qryFind.Close;
              qryFind.SQL.Clear;
              qryFind.SQL.Add('select * from members where id_members = ''' +
                                  NO_MEMBER + '''');
              qryFind.Open;
              if (qryFind.IsEmpty) then
                  begin
                       ShowMessage('Maaf ID Member belum Terdaftar !!');
                  end
              else if (not qryFind.IsEmpty) then
                  begin
                       ServerExec.SQL.Clear;
                       ServerExec.SQL.Add('insert into members values(' +
                                          '''' + NO_MEMBER + ''',' +
                                          '''' + FormatDateTime('yyyy-MM-dd', qryFind.Fields[1].AsDateTime) + ''',' +
                                          '''' + FormatDateTime('yyyy-MM-dd', qryFind.Fields[2].AsDateTime) + ''',' +
                                          '''' + qryFind.Fields[3].AsString + ''',' +
                                          '''' + qryFind.Fields[4].AsString + ''',' +
                                          '''' + qryFind.Fields[5].AsString + ''',' +
                                          '''' + qryFind.Fields[6].AsString + ''',' +
                                          '''' + qryFind.Fields[7].AsString + ''',' +
                                          '''' + FormatDateTime('yyyy-MM-dd', qryFind.Fields[8].AsDateTime) + ''',' +
                                          '''' + qryFind.Fields[9].AsString + ''',' +
                                          '''' + qryFind.Fields[10].AsString + ''',' +
                                          '''' + qryFind.Fields[11].AsString + ''',' +
                                          '''' + floattostr(qryFind.Fields[12].AsFloat) + ''',' +
                                          '''' + qryFind.Fields[13].AsString + ''',' +
                                          '''' + qryFind.Fields[14].AsString + ''',' +
                                          '''' + qryFind.Fields[15].AsString + ''',' +
                                          '''' + qryFind.Fields[16].AsString + ''',' +
                                          '''' + frmMain.APP_OUTLETID + ''')');
                       ServerExec.ExecSQL;
                       edPointPayment.EditValue := qryFind.Fields[12].AsFloat;
                       edNamaCustomerPayment.EditingText := qryFind.Fields[3].AsString;
                  end;

         end
     else if (not ServerSearch.IsEmpty) then
         begin
              SERVER_POINT := ServerSearch.Fields[2].AsFloat;
              edPointPayment.EditValue := SERVER_POINT;
              SERVER_NAMA := ServerSearch.Fields[1].AsString;
              edNamaCustomerPayment.EditingText := SERVER_NAMA;
         end;

end;

procedure TfrmPelunasan.btnCheckPClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with dmDB do
          begin
               NO_MEMBER := edIDCustomerPayment.Text;
               {qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from members where id_members = ''' +
                                 edIDCustomerPayment.Text + '''');
               qrySearch.Open;
               edNamaCustomerPayment.Text := qrySearch.Fields[3].AsString;
               edPointPayment.EditValue := qrySearch.Fields[12].AsFloat;}

               if (cekonline = True) then
                   begin
                        lblCecker.Caption :='Status online, Connecting to Database';
                        Application.ProcessMessages;
                        try
                           {*new
                           dbOnline.Host := frmMain.SERVERHOST;
                           dbOnline.UserName := frmMain.SERVERUSER;
                           dbOnline.UserPassword := frmMain.SERVERPASS;
                           dbOnline.DatabaseName := frmMain.SERVERDB;
                           dbOnline.Port := StrToInt(frmMain.SERVERPORT);}
                           dbOnline.Connected := True;
                           lblCecker.Caption :='Status online, Database Aktif';
                           ServerSearch.Active := True;
                           ServerCari.Active := True;
                           Cek_Online;
                           //Cek_Local;
                           //ShowMessage('Database Connected !');
                        except
                             on E : Exception do
                             ShowMessage(e.ClassName + ' Error ' + #13 +
                                  'CAN NOT CONNECT TO SERVER ON LINE');

                        end;
                   end
               else if (cekonline = False) then
                   begin
                        lblCecker.Caption :='Status Offline';
                        ShowMessage('Maaf Koneksi Database gagal' +#13#13 + 'Mohon cek koneksi Anda !');
                        //frmTransMember.Close;
                        frmPelunasan.edIDCustomerPayment.Clear;
                        frmPelunasan.edIDCustomerPayment.SetFocus;
                   end;
          end;
     edSisaPoint.EditValue := edPointPayment.EditValue + edTambahPoint.EditValue;
     Screen.Cursor := crDefault;
end;

procedure TfrmPelunasan.btnMemberTransClick(Sender: TObject);
begin
     Application.CreateForm(TfrmTransMember, frmTransMember);
     frmTransMember.ShowModal;
end;

procedure TfrmPelunasan.btnMergeClick(Sender: TObject);
begin
     {with dmDB do
          begin
               transMaster.Close;
               transMaster.SQL.Clear;
               transMaster.SQL.Add('select * from trans_master where tanggal = ''' +
                                   FormatDateTime('yyyy-MM-dd', Date) + ''' and status_trans <> ''' +
                                   'PAID' + ''' and status_trans <> ''' +
                                   'CANCELED' + ''' and status_trans <> ''' +
                                   'MERGE' + ''' order by trans_id ASC');
               transMaster.Open;
          end;
     Application.CreateForm(TfrmMerger, frmMerger);
     frmMerger.ShowModal;}
end;

procedure TfrmPelunasan.gtvPaymentTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
  sisaBulat, tambahBulat, resBulat : Double;
begin
     if (AValue = Null) then
         begin
              edSubtotalPayment.EditValue := 0;
              edTambahPoint.EditValue := 0;
              edGrandTotalPayment.EditValue := 0;
              edTotalPayment.EditValue := 0;
         end
     else
         begin
              {edSubtotalPayment.EditValue := AValue;
              edTotalPayment.EditValue := AValue;
              edGrandTotalPayment.EditValue := AValue;
              edTambahPoint.EditValue := AValue / 10000;
              edKurangPoint.EditValue := 0;
              edSisaPoint.EditValue := edPointPayment.EditValue + edTambahPoint.EditValue;}
              edTambahPoint.EditValue := AValue / 10000;
              edKurangPoint.EditValue := 0;
              edSisaPoint.EditValue := edPointPayment.EditValue + edTambahPoint.EditValue;
              edSubtotalPayment.EditValue := AValue;
              ReCalcTotal;
         end;
end;

procedure TfrmPelunasan.edDiscAmountPropertiesChange(Sender: TObject);
var
   subtotal : Double;
begin
     
     if (edSubtotalPayment.EditValue = Null) then
         begin
              Exit;
         end;
     subtotal := edSubtotalPayment.EditValue - (edSubtotalPayment.EditValue * edDiscPercent.EditingValue / 100);
     edTotalPayment.EditValue := subtotal - edDiscAmount.EditValue ;
     edGrandTotalPayment.EditValue := subtotal - edDiscAmount.EditValue ;


end;

procedure TfrmPelunasan.edDiscPercentPropertiesChange(Sender: TObject);
var
   subtotal : Double;
begin

     if (edSubtotalPayment.EditValue = Null) then
         begin
              Exit;
         end;
     subtotal := edSubtotalPayment.EditValue - (edSubtotalPayment.EditValue * edDiscPercent.EditingValue / 100);
     edTotalPayment.EditValue := subtotal - edDiscAmount.EditValue ;
     edGrandTotalPayment.EditValue := subtotal - edDiscAmount.EditValue ;
end;

procedure TfrmPelunasan.edPaymentPropertiesChange(Sender: TObject);
begin
  if (edPayment.Text = 'CASH') then
        begin
          ReCalcTotal;
        end;
     if (edPayment.Text <> 'CASH') then
        begin
          edPembulatan.EditValue := 0;
        end;
     if (edPayment.Text = 'REDEEM') then
        begin
             btnRedeem.Visible := True;
             btnCeckGC.Visible := False;
        end
     else if (edPayment.Text = 'GIFT CERTIFICATE') then
         begin
              btnCeckGC.Visible := True;
              btnRedeem.Visible := False;
              btnPay.Enabled := True;
         end
     else
         begin
              btnCeckGC.Visible := False;
              btnRedeem.Visible := False;
              btnPay.Enabled := True;
         end;
         
end;

procedure TfrmPelunasan.btnRedeemClick(Sender: TObject);
var
   transType : String;
   i, recSelect : integer;
   subtotal, redeem, sisa : Double;
begin
     subtotal := edSubtotalPayment.EditValue;
     redeem := subtotal / 1000;
     if (edPointPayment.EditValue < redeem) then
       begin
         ShowMessage('Point Tidak Mencukupi');
         btnPay.Enabled := False;
         Exit;
       end;

     Application.CreateForm(TfrmTransRedeem, frmTransRedeem);
     subtotal := 0;
     gtvPayment.DataController.GotoFirst;
     for i:=0 to gtvPayment.DataController.RecordCount-1 do
         begin
              recSelect := gtvPayment.DataController.GetFocusedRecordIndex;
              transType := VarToStr(gtvPayment.DataController.GetDisplayText(recSelect, gtvPaymentTransType.Index));
              if (transType <> 'BP') then
                  begin
                       subtotal := subtotal + gtvPayment.DataController.GetValue(recSelect, gtvPaymentSubtotal.Index);
                  end;
              gtvPayment.DataController.GotoNext;
         end;
     redeem := subtotal / 1000;
     sisa := edPointPayment.EditValue - redeem;
     frmTransRedeem.V_ID := frmTransRedeem.CreateNewAutoNum;
     frmTransRedeem.edRedeemTrans.Text := frmTransRedeem.V_ID;
     frmTransRedeem.edTransIDRedeem.Text := edTransIDPayment.Text;
     frmTransRedeem.edAvailablePointRedeem.EditValue := edPointPayment.EditValue;
     frmTransRedeem.edRedeemPoint.EditValue := redeem;
     frmTransRedeem.edSisaRedeem.EditValue := sisa;
     frmTransRedeem.lblIDMembersRedeem.Caption := lblCustomer.Caption;
     frmTransRedeem.edNamaCustomerRedeem.Text := edNamaCustomerPayment.Text;
     frmTransRedeem.ShowModal;
end;

procedure TfrmPelunasan.edIDCustomerPaymentPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
     {btnCheckP.Click;
     edPayment.SetFocus;}
end;

procedure TfrmPelunasan.edIDCustomerPaymentKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key = #13) then
         begin
              if (edIDCustomerPayment.Text = '') then
                  begin
                       edPayment.SetFocus;
                       Exit;
                  end;
              Screen.Cursor := crHourGlass;
              btnCheckP.Click;
              Screen.Cursor := crDefault;
              {edIDCustomerPayment.SelectAll;
              Application.CreateForm(TfrmTransMember, frmTransMember);
              frmTransMember.NO_MEMBER := frmPelunasan.edIDCustomerPayment.Text;
              frmTransMember.edSubtotalPayment.EditValue := frmPelunasan.edSubtotalPayment.EditValue;
              frmTransMember.edTotalPayment.EditValue := frmPelunasan.edTotalPayment.EditValue;
              frmTransMember.edDiscAmount.EditValue := frmPelunasan.edDiscAmount.EditValue;
              frmTransMember.edDiscPercent.EditValue := frmPelunasan.edDiscPercent.EditValue;
              frmTransMember.ShowModal;}
         end;
end;

procedure TfrmPelunasan.edIDCustomerPaymentPropertiesChange(
  Sender: TObject);
begin
     //lblCustomer.Caption := Copy(edIDCustomerPayment.Text,1, length(edIDCustomerPayment.Text)-2);
end;

procedure TfrmPelunasan.edDiscAmountPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     edDiscPercent.SetFocus
end;

procedure TfrmPelunasan.edDiscPercentPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     edTotalPayment.SetFocus;
end;

procedure TfrmPelunasan.btnPayClick(Sender: TObject);
var
   i, recSelect, rCount, panjang, tinggiLblSum : Integer;
   trans_id, id_barang, id_gc, trans_redeem : String;
   qty_brg, stok, sisa_stok, subtotal, subtPoint : Double;
   tglJual, tglValid : TDate;
begin
     //ShowMessage(frmTransRedeem.V_ID);
     ReCalcTotal;
     if (edPayment.Text = 'CASH') then
       begin
          if (edBayarPayment.EditValue < edGrandTotalPayment.EditValue) then
             begin
               ShowMessage('Pembayaran Lebih Kecil dari GrandTotal Transaksi');
               Exit;
             end;
       end;
     if (edPayment.Text = 'REDEEM') then
       begin
         subtPoint := edTotalPayment.EditValue / 1000;
         if (edKurangPoint.EditValue < subtPoint) then
           begin
             ShowMessage('Transaksi Redeem Belum Dilakukan');
             Exit;
           end;
         //if (edKurangPoint.EditValue) then

       end;

     AWAL_POINT := edPointPayment.EditValue;
     TAMBAH_POINT := edTambahPoint.EditValue;
     KURANG_POINT := edKurangPoint.EditValue;
     SISA_POINT := edSisaPoint.EditValue;

     if (edReferansi.Text = 'ISI NO KTM DI SINI') then
         begin
              ShowMessage('Isi terlebih dahulu no KTM');
              Exit;
         end;


       gtvPayment.DataController.GotoFirst;
       for i:=0 to gtvPayment.DataController.RecordCount-1 do
           begin
                recSelect := gtvPayment.DataController.GetFocusedRecordIndex;
                trans_id := vartostr(gtvPayment.DataController.GetValue(recSelect, gtvPaymentTransID.Index));
                qryUpdate.Sql.Clear;
                qryUpdate.Sql.Add('update trans_master set ' +
                                  'id_payment = ''' + edTransIDPayment.Text + ''', ' +
                                  'status_trans = ''' + 'PAID' + ''' ' +
                                  'where trans_id = ''' + trans_id + '''');
                qryUpdate.ExecSql;

                qryUpdate.Sql.Clear;
                qryUpdate.Sql.Add('update trans_detail set ' +
                                  'payment_id = ''' + edTransIDPayment.Text + ''' ' +
                                  'where id_trans = ''' + trans_id + '''');
                qryUpdate.ExecSql;
                gtvPayment.DataController.GotoNext;

           end;
      PrintMaster.Close;
      PrintMaster.SQL.Clear;
      PrintMaster.SQL.Add('select * from trans_payment where id_payment = ''' +
                          edTransIDPayment.Text + '''');
      PrintMaster.Open;

      PrintDetail.Close;
      PrintDetail.SQL.Clear;
      PrintDetail.SQL.Add('select * from trans_detail where payment_id = ''' +
                          edTransIDPayment.Text + ''' order by autonum ASC');
      PrintDetail.Open;
      PrintDetail.First;
      rCount := PrintDetail.RecordCount;
      for i:=0 to PrintDetail.RecordCount-1 do
          begin
               if (PrintDetail.Fields[3].AsString = 'BP') then
                  begin
                       id_barang := PrintDetail.Fields[4].AsString;
                       qrySearch.Close;
                       qrySearch.SQL.Clear;
                       qrySearch.SQL.Add('select * from stock_kasir where id_barang = ''' +
                                         id_barang + '''');
                       qrySearch.Open;
                       qty_brg :=  PrintDetail.Fields[14].AsFloat;
                       stok := qrySearch.Fields[7].AsFloat;
                       sisa_stok := stok - qty_brg;

                       qryUpdate.Sql.Clear;
                       qryUpdate.Sql.Add('update stock_kasir set ' +
                                         'qty = ''' + FloatToStr(sisa_stok) + ''' ' +
                                         'where id_barang = ''' + id_barang + '''');
                       qryUpdate.ExecSql;
                       //PrintDetail.Next;

                  end
               else if (PrintDetail.Fields[3].AsString = 'BG') then
                  begin
                       id_gc := PrintDetail.Fields[4].AsString;
                       tglJual := Date;
                       tglValid := IncDay(tglJual, 120);
                       ShowMessage('Gift Certificate akan kadaluarsa pada Tanggal '  + #13 +
                                   FormatDateTime('dd MMMM yyyy', tglValid));

                       qryUpdate.Sql.Clear;
                       qryUpdate.Sql.Add('update gc_master set ' +
                                         'terjual = ''' + 'Y' + ''', ' +
                                         'expired_date = ''' + FormatDateTime('yyyy-MM-dd', tglValid) + ''' ' +
                                         'where paket_number = ''' + id_gc + '''');
                       qryUpdate.ExecSql;

                       qryUpdate.Sql.Clear;
                       qryUpdate.Sql.Add('update gc_detail set ' +
                                         'terjual = ''' + 'Y' + ''', ' +
                                         'expired_date = ''' + FormatDateTime('yyyy-MM-dd', tglValid) + ''' ' +
                                         'where paket_number = ''' + id_gc + '''');
                       qryUpdate.ExecSql;

                  end;
               PrintDetail.Next;

          end;
       //update online
       if (dbOnline.Connected = True) then
           begin
                ServerSearch.Close;
                ServerSearch.SQL.Clear;
                ServerSearch.SQL.Add('select id_members, nama_lengkap, tot_point from members where id_members = ''' +
                                      NO_MEMBER + '''');
                ServerSearch.Open;
                if (NOT ServerSearch.IsEmpty) then
                    begin
                         ServerExec.Sql.Clear;
                         ServerExec.Sql.Add('update members set ' +
                         'tot_point = ''' + vartostr(SISA_POINT) + ''' ' +
                         'where id_members = ''' + edIDCustomerPayment.Text + '''');
                         ServerExec.ExecSql;
                         Sleep(100);
                         ServerExec.Sql.Clear;
                         ServerExec.Sql.Add('insert into history_trans values(' +
                                  '''' + '' + ''',' +
                                  '''' + edTransIDPayment.Text + ''',' +
                                  '''' + FormatDateTime('yyyy-MM-dd', Now) + ''',' +
                                  '''' + FormatDateTime('hh:mm:ss', Now) + ''',' +
                                  '''' + FloatToStr(edGrandTotalPayment.EditValue) + ''',' +
                                  '''' + edIDCustomerPayment.Text + ''',' +
                                  '''' + FloatToStr(AWAL_POINT) + ''',' +
                                  '''' + FloatToStr(TAMBAH_POINT) + ''',' +
                                  '''' + FloatToStr(KURANG_POINT) + ''',' +
                                  '''' + FloatToStr(SISA_POINT) + ''',' +
                                  '''' + frmMain.APP_OUTLETID + ''',' +
                                  '''' + 'AUTOMATIC' + ''')');
                         ServerExec.ExecSql;
                    end;
           end;
       //end update online

       //update local
       qrySearch.Close;
       qrySearch.SQL.Clear;
       qrySearch.SQL.Add('select * from members where id_members = ''' +
                         edIDCustomerPayment.Text + '''');
       qrySearch.Open;

       if (NOT qrySearch.IsEmpty) then
           begin
                qryUpdate.Sql.Clear;
                qryUpdate.Sql.Add('update members set ' +
                         'point = ''' + vartostr(edSisaPoint.EditValue) + ''' ' +
                         'where id_members = ''' + edIDCustomerPayment.Text + '''');
                qryUpdate.ExecSql;
           end;
       //end update local
       qryUpdate.Sql.Clear;
       qryUpdate.Sql.Add('update gc_detail set ' +
                         'pakai = ''' + 'Y' + ''' ' +
                         'where gc_number = ''' + edReferansi.Text + '''');
       qryUpdate.ExecSql;
               
      qryUpdate.Sql.Clear;
      qryUpdate.Sql.Add('update trans_payment set ' +
                        'id_member = ''' + edIDCustomerPayment.Text + ''', ' +
                        'nama_member = ''' + edNamaCustomerPayment.Text + ''', ' +
                        'subtotal = ''' + VarToStr(edSubtotalPayment.EditValue) + ''', ' +
                        'disc_percent = ''' + VarToStr(edDiscPercent.EditValue) + ''', ' +
                        'disc_amount = ''' + VarToStr(edDiscAmount.EditValue) + ''', ' +
                        'total = ''' + VarToStr(edTotalPayment.EditValue) + ''', ' +
                        'pembayaran = ''' + VarToStr(edBayarPayment.EditValue) + ''', ' +
                        'kembalian = ''' + VarToStr(edKembalianPayment.EditValue) + ''', ' +
                        'point_awal = ''' + VarToStr(edPointPayment.EditValue) + ''', ' +
                        'tambah_point = ''' + VarToStr(edTambahPoint.EditValue) + ''', ' +
                        'kurang_point = ''' + VarToStr(edKurangPoint.EditValue) + ''', ' +
                        'sisa = ''' + VarToStr(edSisaPoint.EditValue) + ''', ' +
                        'payment_via = ''' + edPayment.Text + ''', ' +
                        'payment_ref = ''' + edReferansi.Text + ''', ' +
                        'staff_id = ''' + 'NONE' + ''', ' +
                        'notes = ''' + FormatFloat('#,#', edPembulatan.EditValue) + ''' ' +
                        'where id_payment = ''' + edTransIDPayment.Text + '''');
       qryUpdate.ExecSql;
       sleep(10);

       if (edPayment.Text = 'REDEEM') then
          trans_redeem := frmTransRedeem.V_ID
       else
          trans_redeem := 'NONE';

       if(edIDCustomerPayment.Text <> '') then
         begin
                    
            qryUpdate.Sql.Clear;
            qryUpdate.Sql.Add('Insert into temp_point values ( ' +
                         '''' + '' + ''' , ' +
                         '''' + FormatDateTime('yyyy-mm-dd', Date) + ''' , ' +
                         '''' + trans_redeem + ''' , ' +
                         '''' + edTransIDPayment.Text + ''' , ' +
                         '''' + edIDCustomerPayment.Text+ ''' , ' +
                         '''' + VarToStr(edKurangPoint.EditValue) + ''' , ' +
                         '''' + VarToStr(edTambahPoint.EditValue) + ''' , ' +
                         '''' + frmMain.APP_OUTLETID + ''' , ' +
                         '''' + 'N' + ''')');
                                
             qryUpdate.ExecSql;
         end;
         PrintMaster.Refresh;
         PrintMaster.Close;
         PrintMaster.SQL.Clear;
         PrintMaster.SQL.Add('Select * from trans_payment ' +
                             'Where id_payment = ''' + edTransIDPayment.Text + '''');
         PrintMaster.Open;
         PrintDetail.Refresh;

         qryFoot.Close;
         qryFoot.SQL.Clear;
         qryFoot.SQL.Add('SELECT notes from footnote WHERE aktif = ''' + 'Y' + ''' ORDER BY autonum DESC LIMIT 1');
         qryFoot.Open;

          

     Application.CreateForm(TfrmPrintTrans, frmPrintTrans);

     panjang := 44 * rCount;
     frmPrintTrans.qrpPrintBill.Height := frmPrintTrans.qrpPrintBill.Height + panjang;
     with  frmPrintTrans do
        begin
          lblJudulAtas.Caption := frmMain.APP_OUTLETNAME;
          lblJudul.Caption := frmMain.APP_OUTLETADDRESS;
          lblAlamat1.Caption := frmMain.APP_OUTLETPHONE;
          lblSumJudul.Lines.Add('SUBTOTAL');
          lblSumValue.Lines.Add(FormatFloat('#,#', PrintMaster.Fields[5].AsFloat));
          if (PrintMaster.Fields[6].AsFloat > 0) then
            begin
              lblSumJudul.Lines.Add('Disc [%]');
              lblSumValue.Lines.Add(FormatFloat('#,#', PrintMaster.Fields[6].AsFloat));
            end;
          if (PrintMaster.Fields[7].AsFloat > 0) then
            begin
              lblSumJudul.Lines.Add('Disc Amount');
              lblSumValue.Lines.Add(FormatFloat('#,#', PrintMaster.Fields[7].AsFloat));
            end;
          if ((PrintMaster.Fields[6].AsFloat > 0) OR (PrintMaster.Fields[7].AsFloat > 0)) then
            begin
              lblSumJudul.Lines.Add('Total');
              lblSumValue.Lines.Add(FormatFloat('#,#', PrintMaster.Fields[8].AsFloat));
            end;

          lblSumJudul.Lines.Add('PAYMENT VIA');
          lblSumValue.Lines.Add(PrintMaster.Fields[15].AsString);
          if (PrintMaster.Fields[15].AsString = 'CASH') then
            begin
              if (edPembulatan.EditValue > 0) then
                begin
                  lblSumJudul.Lines.Add('Pembulatan');
                  lblSumValue.Lines.Add(FormatFloat('#,#', edPembulatan.EditValue));
                end;
              lblSumJudul.Lines.Add('Jumlah Uang');
              lblSumValue.Lines.Add(FormatFloat('#,#', PrintMaster.Fields[9].AsFloat));
              lblSumJudul.Lines.Add('Kembali');
              lblSumValue.Lines.Add(FormatFloat('#,#', PrintMaster.Fields[10].AsFloat));
            end;
          if (PrintMaster.Fields[16].AsString <> '') then
            begin
              lblSumJudul.Lines.Add('Payment Ref : ' + PrintMaster.Fields[16].AsString);
              lblSumValue.Lines.Add('-');
            end;
          if (PrintMaster.Fields[3].AsString <> '') then
            begin
              lblSumJudul.Lines.Add('Jumlah Point Anda');
              lblSumValue.Lines.Add(FormatFloat('#,#', PrintMaster.Fields[14].AsFloat));
            end;

          rCount := lblSumJudul.Lines.Count;
          tinggiLblSum := 23 * rCount;
          lblSumJudul.Height := tinggiLblSum;
          lblSumValue.Height := tinggiLblSum;
          panjang := 32 * rCount;
          SummaryBand1.Height := panjang;


        end;
     frmPrintTrans.qrpPrintBill.Height := frmPrintTrans.qrpPrintBill.Height + panjang;
     frmPrintTrans.qrpPrintBill.Prepare;
     frmPrintTrans.qrpPrintBill.PreviewModal;
     {if((PrintMaster.Fields[7].AsFloat = 0) and (PrintMaster.Fields[6].AsFloat = 0)) then
       begin
           frmPrintTrans.lblDiscAmount.Font.Color := clWhite;
           frmPrintTrans.lblDiskon.Font.Color := clWhite;
           frmPrintTrans.lblGrandTotal.Font.Color := clWhite;
           frmPrintTrans.qrdbDiscAmount.Font.Color := clWhite;
           frmPrintTrans.qrdbDiscPersen.Font.Color := clWhite;
           frmPrintTrans.qrdbTotal.Font.Color := clWhite;
       end
     else
     if((PrintMaster.Fields[7].AsFloat <> 0) and (PrintMaster.Fields[6].AsFloat <> 0)) then
       begin
           frmPrintTrans.lblDiscAmount.Font.Color := clDefault;
           frmPrintTrans.lblDiskon.Font.Color := clDefault;
           frmPrintTrans.lblGrandTotal.Font.Color := clDefault;
           frmPrintTrans.qrdbDiscAmount.Font.Color := clDefault;
           frmPrintTrans.qrdbDiscPersen.Font.Color := clDefault;
           frmPrintTrans.qrdbTotal.Font.Color := clDefault;
       end
     else
     if((PrintMaster.Fields[7].AsFloat = 0) and (PrintMaster.Fields[6].AsFloat <> 0))  then
       begin
           frmPrintTrans.lblDiscAmount.Font.Color := clWhite;
           frmPrintTrans.lblDiskon.Font.Color := clDefault;
           frmPrintTrans.lblGrandTotal.Font.Color := clDefault;
           frmPrintTrans.qrdbDiscAmount.Font.Color := clWhite;
           frmPrintTrans.qrdbDiscPersen.Font.Color := clDefault;
           frmPrintTrans.qrdbTotal.Font.Color := clDefault;
       end
     else
     if((PrintMaster.Fields[7].AsFloat <> 0) and (PrintMaster.Fields[6].AsFloat = 0))  then
       begin
           frmPrintTrans.lblDiscAmount.Font.Color := clDefault;
           frmPrintTrans.lblDiskon.Font.Color := clWhite;
           frmPrintTrans.lblGrandTotal.Font.Color := clDefault;
           frmPrintTrans.qrdbDiscAmount.Font.Color := clDefault;
           frmPrintTrans.qrdbDiscPersen.Font.Color := clWhite;
           frmPrintTrans.qrdbTotal.Font.Color := clDefault;
       end;
     if(edIDCustomerPayment.EditingValue = NULL) then
       begin
           frmPrintTrans.lblPoint.Font.Color := clWhite;
           frmPrintTrans.qrSisa.Font.Color := clWhite;
       end
     else
       begin
           frmPrintTrans.lblPoint.Font.Color := clDefault;
           frmPrintTrans.qrSisa.Font.Color := clDefault;
       end;
     if(qryFoot.IsEmpty) then
        begin
            frmPrintTrans.lblNotes.Font.Color := clWhite;
        end
     else
        begin
            frmPrintTrans.lblNotes.Caption :=qryFoot.Fields[0].AsString;
            frmPrintTrans.lblNotes.Font.Color := clDefault;
        end;
     frmPrintTrans.lblCopy.Font.Color := clWhite;
     frmPrintTrans.qrpPrintBill.PreviewModal;}

     Sleep(10);
     {----cetak copy
     Application.CreateForm(TfrmPrintTrans, frmPrintTrans);
     panjang := 33 * rCount;
     frmPrintTrans.qrpPrintBill.Height := frmPrintTrans.qrpPrintBill.Height + panjang;
     frmPrintTrans.lblJudul.Caption := frmMain.JUDULATAS;
     if((PrintMaster.Fields[7].AsFloat = 0) and (PrintMaster.Fields[6].AsFloat = 0)) then
       begin
           frmPrintTrans.lblDiscAmount.Font.Color := clWhite;
           frmPrintTrans.lblDiskon.Font.Color := clWhite;
           frmPrintTrans.lblGrandTotal.Font.Color := clWhite;
           frmPrintTrans.qrdbDiscAmount.Font.Color := clWhite;
           frmPrintTrans.qrdbDiscPersen.Font.Color := clWhite;
           frmPrintTrans.qrdbTotal.Font.Color := clWhite;
       end
     else
     if((PrintMaster.Fields[7].AsFloat <> 0) and (PrintMaster.Fields[6].AsFloat <> 0)) then
       begin
           frmPrintTrans.lblDiscAmount.Font.Color := clDefault;
           frmPrintTrans.lblDiskon.Font.Color := clDefault;
           frmPrintTrans.lblGrandTotal.Font.Color := clDefault;
           frmPrintTrans.qrdbDiscAmount.Font.Color := clDefault;
           frmPrintTrans.qrdbDiscPersen.Font.Color := clDefault;
           frmPrintTrans.qrdbTotal.Font.Color := clDefault;
       end
     else
     if((PrintMaster.Fields[7].AsFloat = 0) and (PrintMaster.Fields[6].AsFloat <> 0))  then
       begin
           frmPrintTrans.lblDiscAmount.Font.Color := clWhite;
           frmPrintTrans.lblDiskon.Font.Color := clDefault;
           frmPrintTrans.lblGrandTotal.Font.Color := clDefault;
           frmPrintTrans.qrdbDiscAmount.Font.Color := clWhite;
           frmPrintTrans.qrdbDiscPersen.Font.Color := clDefault;
           frmPrintTrans.qrdbTotal.Font.Color := clDefault;
       end
     else
     if((PrintMaster.Fields[7].AsFloat <> 0) and (PrintMaster.Fields[6].AsFloat = 0))  then
       begin
           frmPrintTrans.lblDiscAmount.Font.Color := clDefault;
           frmPrintTrans.lblDiskon.Font.Color := clWhite;
           frmPrintTrans.lblGrandTotal.Font.Color := clDefault;
           frmPrintTrans.qrdbDiscAmount.Font.Color := clDefault;
           frmPrintTrans.qrdbDiscPersen.Font.Color := clWhite;
           frmPrintTrans.qrdbTotal.Font.Color := clDefault;
       end;
     if(edIDCustomerPayment.EditingValue = NULL) then
       begin
           frmPrintTrans.lblPoint.Font.Color := clWhite;
           frmPrintTrans.qrSisa.Font.Color := clWhite;
       end
     else
       begin
           frmPrintTrans.lblPoint.Font.Color := clDefault;
           frmPrintTrans.qrSisa.Font.Color := clDefault;
       end;
     if(qryFoot.IsEmpty) then
        begin
            frmPrintTrans.lblNotes.Font.Color := clWhite;
        end
     else
        begin
            frmPrintTrans.lblNotes.Caption :=qryFoot.Fields[0].AsString;
            frmPrintTrans.lblNotes.Font.Color := clDefault;
        end;
     frmPrintTrans.lblCopy.Font.Color := clDefault;
     frmPrintTrans.qrpPrintBill.PreviewModal;
     ---cetak copy
     }

     //frmPrintTrans.qrpPrintBill.Preview;
     dbOnline.Connected := False;
     lblCecker.Caption := '';
     {frmMain.pnlBar.Enabled := True;
     frmMain.close_clientForm;
     Application.CreateForm(TfrmEmpty, frmEmpty);
     frmEmpty.BorderStyle := bsNone;
     frmEmpty.Parent := frmMain.pnlMain;
     frmEmpty.Show;
     frmEmpty.WindowState := wsMaximized;}

end;

procedure TfrmPelunasan.btnDeleteClick(Sender: TObject);

begin
     //recSelect := gtvPayment.DataController.GetFocusedRecordIndex;
     gtvPayment.DataController.DeleteSelection;
end;

procedure TfrmPelunasan.btnCancelPClick(Sender: TObject);
begin
     with dmDB do
          begin
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('delete from trans_payment where id_payment = ''' +
                                 edTransIDPayment.Text + '''');
               qryUpdate.ExecSql;
          end;
     {frmMain.close_clientForm;
     Application.CreateForm(TfrmEmpty, frmEmpty);
     frmEmpty.BorderStyle := bsNone;
     frmEmpty.Parent := frmMain.pnlMain;
     frmEmpty.Show;
     frmEmpty.WindowState := wsMaximized;
     frmMain.pnlBar.Enabled := True;}
     
end;

procedure TfrmPelunasan.edReferansiClick(Sender: TObject);
begin
     edReferansi.SelectAll;
end;

procedure TfrmPelunasan.btnCeckGCClick(Sender: TObject);
begin
     Application.CreateForm(TfrmPayGC, frmPayGC);
     qryGCDetail.Refresh;
     frmPayGC.gtbPayGC.DataController.Refresh;
     frmPayGC.ShowModal;
end;

procedure TfrmPelunasan.edBayarPaymentPropertiesChange(Sender: TObject);
begin
     edKembalianPayment.EditValue := edBayarPayment.EditValue - edGrandTotalPayment.EditValue;
end;

procedure TfrmPelunasan.edBayarPaymentPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     edKembalianPayment.SetFocus;
end;

procedure TfrmPelunasan.gtvPaymentTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
     if (AValue = Null) then
         begin
              //edSubtotalPayment.EditValue := 0;
              edTambahPoint.EditValue := 0;
              //edGrandTotalPayment.EditValue := 0;
              //edTotalPayment.EditValue := 0;
         end
     else
         begin
              //edSubtotalPayment.EditValue := AValue;
              //edTotalPayment.EditValue := AValue;
              //edGrandTotalPayment.EditValue := AValue;
              edTambahPoint.EditValue := AValue;
              edKurangPoint.EditValue := 0;
              edSisaPoint.EditValue := edPointPayment.EditValue + AValue;
         end;
end;

procedure TfrmPelunasan.appEvenShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
     {if (Msg.CharCode = Ord('F')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnMerge.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('D')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnDelete.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('Z')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnCheckP.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('R')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnRedeem.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('G')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnCeckGC.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('P')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnPay.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('X')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnCancelP.Click;
              Handled := True;
         end;}
end;

end.
