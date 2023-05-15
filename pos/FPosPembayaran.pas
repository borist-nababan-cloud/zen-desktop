unit FPosPembayaran;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxTextEdit, cxCalc, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid,
  cxContainer, cxGroupBox, Vcl.Menus, cxButtons, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, Data.DB, DBAccess, MyAccess,
  MemDS, MainSource, dxBevel, cxLabel, WinInet, strUtils, Printers;

const
   InputBoxMessage = WM_USER + 200;

type
  TfrmPosPembayaran = class(TForm)
    Label1: TLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    tvPembayaran: TcxGridTableView;
    tvPembayaranTransID: TcxGridColumn;
    tvPembayaranNamaCust: TcxGridColumn;
    tvPembayaranRuangan: TcxGridColumn;
    tvPembayaranTherapist: TcxGridColumn;
    tvPembayaranSubtotal: TcxGridColumn;
    tvPembayaranDetails: TcxGridColumn;
    tvPembayaranHarga: TcxGridColumn;
    cxGroupBox1: TcxGroupBox;
    btnFind: TcxButton;
    Label2: TLabel;
    qryPromo: TMyQuery;
    dsQryPromo: TMyDataSource;
    Label3: TLabel;
    edSubtotal: TcxCalcEdit;
    edPromo: TcxLookupComboBox;
    edPromoRef: TcxTextEdit;
    Label4: TLabel;
    edDiscPromo: TcxCalcEdit;
    Label5: TLabel;
    edDiscPurpose: TcxCalcEdit;
    cxButton1: TcxButton;
    btnClearDisc: TcxButton;
    edPurpose: TcxTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    edGrandTotal: TcxCalcEdit;
    Label8: TLabel;
    cxButton3: TcxButton;
    tvPembayaranIDTrans: TcxGridColumn;
    btnClearPromo: TcxButton;
    btnSetPayment: TcxButton;
    dxBevel1: TdxBevel;
    edJasa: TcxCalcEdit;
    edProduk: TcxCalcEdit;
    edAdditional: TcxCalcEdit;
    edGift: TcxCalcEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    Label9: TLabel;
    edScan: TcxTextEdit;
    btnLoadMember: TcxButton;
    Label10: TLabel;
    edMemberNama: TcxTextEdit;
    edMemberPoint: TcxCalcEdit;
    Label11: TLabel;
    lblNoKartu: TLabel;
    lblKodeMember: TLabel;
    Label12: TLabel;
    cbPrinterPos: TComboBox;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFindClick(Sender: TObject);
    procedure edPromoPropertiesEditValueChanged(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btnClearPromoClick(Sender: TObject);
    procedure btnClearDiscClick(Sender: TObject);
    procedure btnSetPaymentClick(Sender: TObject);
    procedure btnLoadMemberClick(Sender: TObject);
    procedure tvPembayaranTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure edScanKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryFind, qryCari, qryExec : TMyQuery;
    function CekInternet : Boolean;
    procedure InputBoxSetPasswordChar(var Msg: TMessage); message InputBoxMessage;
  public
    { Public declarations }
    procedure HitungTypeMenu;
  end;

var
  frmPosPembayaran: TfrmPosPembayaran;

implementation

{$R *.dfm}

uses FMain, FdmDB, FPosPembayaranSelect, FPosPembayaranDisc, FPosPembayaranPay;

procedure TfrmPosPembayaran.btnClearDiscClick(Sender: TObject);
begin
  edDiscPurpose.EditValue := 0;
  edDiscPurpose.Clear;
  edGrandTotal.EditValue := edSubtotal.EditValue - edDiscPromo.EditValue - edDiscPurpose.EditValue;
end;

procedure TfrmPosPembayaran.btnClearPromoClick(Sender: TObject);
begin
  edPromo.Clear;
  edPromo.ClearSelection;
  edDiscPromo.EditValue := 0;
  edPromoRef.Clear;
  edGrandTotal.EditValue := edSubtotal.EditValue - edDiscPromo.EditValue - edDiscPurpose.EditValue;
end;

procedure TfrmPosPembayaran.btnFindClick(Sender: TObject);
begin
   if (edDiscPromo.EditValue > 0) then
     begin
       ShowMessage('Please Clear Promo !!');
       Exit;
     end;
   if (edDiscPurpose.EditValue > 0) then
     begin
       ShowMessage('Please Clear Discount !!');
       Exit;
     end;
   Application.CreateForm(TfrmPosPembayaranSelect, frmPosPembayaranSelect);
   if (frmPosPembayaran.Tag = 0) then
     begin
       frmPosPembayaranSelect.Tag := 0;
       frmPosPembayaranSelect.edTanggal.Properties.ReadOnly := True;
     end
   else if (frmPosPembayaran.Tag = 1) then
     begin
       frmPosPembayaranSelect.Tag := 1;
       frmPosPembayaranSelect.edTanggal.Properties.ReadOnly := False;
     end;
   frmPosPembayaranSelect.FormStyle := fsStayOnTop;
   frmPosPembayaranSelect.Height := 520;
   frmPosPembayaranSelect.Width := 927;

   frmPosPembayaranSelect.Show;
   frmPosPembayaranSelect.Position := poDesktopCenter;
end;

procedure TfrmPosPembayaran.btnLoadMemberClick(Sender: TObject);
var
  qryServerCari : TMyQuery;
  dbMember : TMyConnection;
begin
   if (edScan.Text = '') then Exit;
   if (edDiscPromo.EditValue > 0) then
     begin
       ShowMessage('Customer Promo Tidak Dapat scan member !');
       edScan.Clear;
       lblKodeMember.Caption := '';
       lblNoKartu.Caption := '';
       Exit;
     end;
   if (edDiscPurpose.EditValue > 0) then
     begin
       ShowMessage('Customer dengan Additional Discount Tidak Dapat scan member !');
       edScan.Clear;
       lblKodeMember.Caption := '';
       lblNoKartu.Caption := '';
       Exit;
     end;

   //dbMember.Connected := False;
   if (CekInternet = False) then
     begin
       ShowMessage('No Internet Connection !');
       edScan.Clear;
       lblKodeMember.Caption := '';
       lblNoKartu.Caption := '';
       Exit;
     end;
   lblKodeMember.Caption := edScan.Text;
   lblNoKartu.Caption := UpperCase(LeftStr(edScan.Text, 7));
   dbMember := TMyConnection.Create(nil);
   dbMember.Server := frmMain.SERVER_DBHOST;
   dbMember.Database := frmMain.MEMBERDBNAME;
   dbMember.Username := frmMain.SERVER_DBUSER;
   dbMember.Password := frmMain.SERVER_DBPASS;
   dbMember.Port := StrToInt(frmMain.SERVER_DBPORT);
   try
        dbMember.Connected := True;
     Except
       on E : Exception do
       ShowMessage('Sorry Database Not Ready !!');
     end;
   if (dbMember.Connected = True) then
     begin
       qryServerCari := TMyQuery.Create(Self);
       qryServerCari.Connection := dbMember;
       qryServerCari.SQL.Add('select id_members, nama_lengkap, tot_point, no_kartu from members ' +
           'where id_members = ''' + edScan.Text + '''');
       qryServerCari.Active := true;
       qryServerCari.Open;
       if (qryServerCari.IsEmpty) then
         begin
           ShowMessage('Data Member Tidak Ditemukan !!');
           lblNoKartu.Caption := '';
           lblKodeMember.Caption := '';
           Exit;
         end
       else if (NOT qryServerCari.IsEmpty) then
         begin
           edMemberNama.Text := qryServerCari.Fields[1].AsString;
           edMemberPoint.EditValue := qryServerCari.Fields[2].AsFloat;
           lblNoKartu.Caption := qryServerCari.Fields[3].AsString;
           lblKodeMember.Caption := qryServerCari.Fields[0].AsString;
         end;
       qryServerCari.Free;
       dbMember.Disconnect;
       dbMember.Free;
     end;

end;

procedure TfrmPosPembayaran.btnSetPaymentClick(Sender: TObject);
var
  SisaPembulatan, nilaiPembulatan, i, recSel : Integer;
  nilaiRedeem, tambahpoint, sisapoint : Double;
  vTransID, idTrans : String;
begin

   if (edGrandTotal.EditValue = 0) then Exit;
   SisaPembulatan := Trunc(edGrandTotal.EditValue) mod frmMain.N_PEMBULATAN;
   if (SisaPembulatan >= 500) then nilaiPembulatan := SisaPembulatan - 500
   else if (SisaPembulatan < 500) then nilaiPembulatan := SisaPembulatan;
   //nilaiPembulatan := SisaPembulatan - 500;
   nilaiRedeem := (edJasa.EditValue + edAdditional.EditValue) / 1000;
   Application.CreateForm(TfrmPosPembayaranPay, frmPosPembayaranPay);
   frmPosPembayaranPay.FormStyle := fsNormal;
   frmPosPembayaranPay.Height := 650;
   frmPosPembayaranPay.Width := 838;
   frmPosPembayaranPay.edSubtPayment.EditValue := frmPosPembayaran.edGrandTotal.EditValue;
   frmPosPembayaranPay.edMemberAvailable.EditValue := frmPosPembayaran.edMemberPoint.EditValue;
   frmPosPembayaranPay.edMemberPointToPay.EditValue := (frmPosPembayaran.edJasa.EditValue + frmPosPembayaran.edAdditional.EditValue) / 1000;
   frmPosPembayaranPay.edTambahPoint.EditValue := (frmPosPembayaran.edJasa.EditValue + frmPosPembayaran.edAdditional.EditValue)/10000;
   tambahpoint := (frmPosPembayaran.edJasa.EditValue + frmPosPembayaran.edAdditional.EditValue)/10000;
   sisapoint := frmPosPembayaran.edMemberPoint.EditValue + tambahpoint;
   frmPosPembayaranPay.edSisaPoint.EditValue :=  sisapoint;
   if (frmPosPembayaran.edMemberPoint.EditValue < nilaiRedeem) then frmPosPembayaranPay.ckRedeem.Properties.ReadOnly := True;
   frmPosPembayaranPay.LS_TRANS_ID := TStringList.Create;
   vTransID := '';
   tvPembayaran.DataController.GotoFirst;
  //if (recSel < 0) then Exit;

  for i := 0 to tvPembayaran.DataController.RecordCount-1 do
    begin
        recSel := tvPembayaran.DataController.GetFocusedRecordIndex;
        idTrans := vartostr(tvPembayaran.DataController.GetValue(recSel, tvPembayaranIDTrans.Index));
        if (vTransID <> idTrans) then
          begin
            frmPosPembayaranPay.LS_TRANS_ID.Add(idTrans);
            vTransID := idTrans;
          end;
        tvPembayaran.DataController.GotoNext;
    end;
   frmPosPembayaranPay.edRounding.EditValue := nilaiPembulatan;
   frmPosPembayaranPay.totBA := edAdditional.EditValue;
   frmPosPembayaranPay.totBJ := edJasa.EditValue;
   frmPosPembayaranPay.totBP := edProduk.EditValue;
   frmPosPembayaranPay.totBG := edGift.EditValue;
   frmPosPembayaranPay.Show;
   frmPosPembayaranPay.Position := poDesktopCenter;
end;

function TfrmPosPembayaran.CekInternet: Boolean;
begin
   result := (InternetGetConnectedState(nil, 0));
end;

procedure TfrmPosPembayaran.cxButton1Click(Sender: TObject);
var
   vPass, strSama : String;
begin
   PostMessage(Handle, InputBoxMessage, 0, 0);
   vPass := InputBox('Password Request', 'Please Insert Password', '');
   qryFind.Close;
   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select passkey from ben_master_password where moduleinfo = ''' + 'POS_DISC' + '''');
   qryFind.Open;
   if (NOT qryFind.IsEmpty) then
      begin
         strSama := DecryptPass(qryFind.Fields[0].AsString);
      end;
   if (vPass = strSama) then
     begin
       Application.CreateForm(TfrmPosPembayaranDisc, frmPosPembayaranDisc);
       frmPosPembayaranDisc.FormStyle := fsStayOnTop;
       frmPosPembayaranDisc.Height := 338;
       frmPosPembayaranDisc.Width := 651;
       frmPosPembayaranDisc.edSubtotal.EditValue := frmPosPembayaran.edSubtotal.EditValue;
       frmPosPembayaranDisc.Show;
       frmPosPembayaranDisc.Position := poDesktopCenter;

     end
   else
     begin
       ShowMessage('Passord did not match');
     end;
end;

procedure TfrmPosPembayaran.cxButton3Click(Sender: TObject);
var
  recSel : Integer;
  idTrans, transId : String;
  ketemu : Boolean;
begin
   if (edDiscPromo.EditValue > 0) then
     begin
       ShowMessage('Please Clear Promo !!');
       Exit;
     end;
   if (edDiscPurpose.EditValue > 0) then
     begin
       ShowMessage('Please Clear Discount !!');
       Exit;
     end;
   recSel := tvPembayaran.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   idTrans := VarToStr(tvPembayaran.DataController.GetValue(recSel, tvPembayaranTransID.Index));
   if (idTrans = '') then
     begin
       ShowMessage('Please Select on ID Transaction');
       Exit;
     end;
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'promo = ''' + 'S' + ''' ' +
       'where trans_id = ''' + idTrans + ''';');
   qryExec.ExecSQL;

   ketemu := tvPembayaran.DataController.Search.Locate(tvPembayaranIDTrans.Index, idTrans);
   while ketemu = True do
     begin
       tvPembayaran.DataController.DeleteRecord(recSel);
       ketemu := tvPembayaran.DataController.Search.Locate(tvPembayaranIDTrans.Index, idTrans);
       recSel := tvPembayaran.DataController.GetFocusedRecordIndex;
       //ShowMessage(IntToStr(recSel));
       //tvPembayaran.DataController.DeleteRecord(recSel);
     end;
   HitungTypeMenu;
end;

procedure TfrmPosPembayaran.edPromoPropertiesEditValueChanged(Sender: TObject);
var
  i, RecSel : Integer;
  idTrans, vTransID, isPaket : String;
  vDiscBJ, vDiscBP, vDiscBA, totDiscBJ, totDiscBP, totDiscBA,
  nDiscBJ, nDiscBP, nDiscBA, hargaNormal, nHargaDisc : Double;
  y: Integer;
begin
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select discbj, discba, discbp, ispaket from pos_master_promo where ' +
       'kodepromo = ''' + VarToStr(edPromo.EditValue) + '''');
   qryCari.Open;
   if (qryCari.IsEmpty) then
     begin
       vDiscBJ := 0;
       vDiscBA := 0;
       vDiscBP := 0;
       isPaket := 'N';
     end
   else if (NOT qryCari.IsEmpty) then
     begin
       vDiscBJ := qryCari.Fields[0].AsFloat;
       vDiscBA := qryCari.Fields[1].AsFloat;
       vDiscBP := qryCari.Fields[2].AsFloat;
       isPaket := qryCari.Fields[3].AsString
     end;

   totDiscBJ := 0;
   totDiscBP := 0;
   totDiscBA := 0;
   nHargaDisc := 0;
   hargaNormal := 0;
   tvPembayaran.DataController.GotoFirst;
   RecSel := tvPembayaran.DataController.GetFocusedRecordIndex;
   idTrans := vartostr(tvPembayaran.DataController.GetValue(RecSel, tvPembayaranTransID.Index));
   if (idTrans = '') then
     begin
       ShowMessage('Please Select on ID Transaction');
       Exit;
     end;
   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select trans_type_id, sum(subtotal), sum(disc_percent) from trans_detail ' +
       'where id_trans = ''' + idTrans + ''' group by trans_type_id ASC');
   qryFind.Open;
   qryFind.First;
   for y := 0 to qryFind.RecordCount-1 do
      begin
        if (qryFind.Fields[0].AsString = 'BA') then
          begin
            if (qryFind.Fields[2].AsFloat > 0) then
              begin
                if (vDiscBJ > 0) then
                    begin
                      if (vDiscBA > qryFind.Fields[2].AsFloat) then
                        begin
                           hargaNormal := (100 / (100- qryFind.Fields[2].AsFloat) * qryFind.Fields[1].AsFloat);
                           nHargaDisc := hargaNormal * vDiscBA / 100;
                           totDiscBA := qryFind.Fields[1].AsFloat - nHargaDisc;
                        end
                      else if (vDiscBA <= qryFind.Fields[2].AsFloat) then
                        begin
                           vDiscBA := 0;
                           totDiscBA := totDiscBA + 0;
                        end;
                    end
                else if (vDiscBA <= 0) then
                    begin
                      totDiscBA := totDiscBA + 0;
                    end;
              end
            else if (qryFind.Fields[2].AsFloat <= 0) then
              begin
                 totDiscBA := totDiscBA + (qryFind.Fields[1].AsFloat * vDiscBA / 100);
              end;

          end
//----------------------------------------------------------------------------------------------
        else if (qryFind.Fields[0].AsString = 'BJ') then
          begin
            if (qryFind.Fields[2].AsFloat > 0) then
              begin
                 if (vDiscBJ > 0) then
                      begin
                        if (vDiscBJ > qryFind.Fields[2].AsFloat) then
                          begin
                             hargaNormal := (100 / (100- qryFind.Fields[2].AsFloat) * qryFind.Fields[1].AsFloat);
                             nHargaDisc := hargaNormal * vDiscBJ / 100;
                             totDiscBJ := totDiscBJ + qryFind.Fields[1].AsFloat - nHargaDisc;
                          end
                        else if (vDiscBJ <= qryFind.Fields[2].AsFloat) then
                          begin
                             vDiscBJ := 0;
                             totDiscBJ := totDiscBJ + 0;
                          end;
                      end
                    else if (vDiscBJ <= 0) then
                      begin
                        totDiscBJ := totDiscBJ + 0;
                      end;
              end
            else if (qryFind.Fields[2].AsFloat <= 0) then
              begin
                totDiscBJ := totDiscBJ + (qryFind.Fields[1].AsFloat * vDiscBJ / 100);
              end;

          end
//-------------------------------------------------------------------------
        else if (qryFind.Fields[0].AsString = 'BP') then
          begin
            if (qryFind.Fields[2].AsFloat > 0) then
              begin
                if (vDiscBP > 0) then
                      begin
                        if (vDiscBP > qryFind.Fields[2].AsFloat) then
                          begin
                             hargaNormal := (100 / (100- qryFind.Fields[2].AsFloat) * qryFind.Fields[1].AsFloat);
                             nHargaDisc := hargaNormal * vDiscBP / 100;
                             totDiscBP := totDiscBP + qryFind.Fields[1].AsFloat - nHargaDisc;
                          end
                        else if (vDiscBP <= qryFind.Fields[2].AsFloat) then
                          begin
                             totDiscBP := totDiscBP + 0;
                          end;
                      end
                    else if (vDiscBP <= 0) then
                      begin
                        totDiscBP := totDiscBP + 0;
                      end;
              end
            else if (qryFind.Fields[2].AsFloat <= 0) then
              begin
                totDiscBP := totDiscBP + (qryFind.Fields[1].AsFloat * vDiscBP / 100);
              end;
          end;
        qryFind.Next;
      end;

   edDiscPromo.EditValue := totDiscBJ + totDiscBP + totDiscBA;
   edGrandTotal.EditValue := edSubtotal.EditValue - edDiscPromo.EditValue - edDiscPurpose.EditValue;
end;

procedure TfrmPosPembayaran.edScanKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then btnLoadMember.Click;
   
end;

procedure TfrmPosPembayaran.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryFind.Free;
   qryCari.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmPosPembayaran.FormCreate(Sender: TObject);
begin
   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.dbInternal;
   qryFind.SQL.Add('select * from temptable');
   qryFind.Active := true;

   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;

   qryPromo.Active := True;

   lblKodeMember.Caption := '';
   lblNoKartu.Caption := '';
   cbPrinterPos.Items := Printer.Printers;
   cbPrinterPos.ItemIndex := frmMain.IDXPOSPRINTER;
end;

procedure TfrmPosPembayaran.HitungTypeMenu;
var
  recSel, i, y : Integer;
  lsTransID : TStringList;
  idTrans, vTransID : String;
  totBA, totBJ, totBG, totBP : Double;
begin
  lsTransID := TStringList.Create;
  tvPembayaran.DataController.GotoFirst;
  if (tvPembayaran.DataController.RecordCount < 0) then Exit;
  vTransID := '';

  //if (recSel < 0) then Exit;

  for i := 0 to tvPembayaran.DataController.RecordCount-1 do
    begin
        recSel := tvPembayaran.DataController.GetFocusedRecordIndex;
        idTrans := vartostr(tvPembayaran.DataController.GetValue(recSel, tvPembayaranIDTrans.Index));
        if (vTransID <> idTrans) then
          begin
            lsTransID.Add(idTrans);
            vTransID := idTrans;
          end;
        tvPembayaran.DataController.GotoNext;
    end;
  totBA := 0;
  totBJ := 0;
  totBP := 0;
  totBG := 0;
  edProduk.EditValue := 0;
  edAdditional.EditValue := 0;
  edJasa.EditValue := 0;
  edGift.EditValue := 0;
  for i := 0 to lsTransID.Count-1 do
    begin
      vTransID := lsTransID[i];
      //ShowMessage(vTransID);
      qryFind.Close;
      qryFind.SQL.Clear;
      qryFind.SQL.Add('select trans_type_id, sum(subtotal) from trans_detail ' +
          'where id_trans = ''' + vTransID + ''' GROUP BY trans_type_id ASC');
      qryFind.Open;
      qryFind.First;
      for y := 0 to qryFind.RecordCount-1 do
         begin
           //ShowMessage(qryFind.Fields[0].AsString);
           if (qryFind.Fields[0].AsString = 'BA') then
              edAdditional.EditValue := qryFind.Fields[1].AsFloat +  edAdditional.EditValue
           else if (qryFind.Fields[0].AsString = 'BJ') then
              edJasa.EditValue := qryFind.Fields[1].AsFloat +  edJasa.EditValue
           else if (qryFind.Fields[0].AsString = 'BP') then
              edProduk.EditValue := qryFind.Fields[1].AsFloat +  edProduk.EditValue
           else if (qryFind.Fields[0].AsString = 'BG') then
              edGift.EditValue := qryFind.Fields[1].AsFloat +  edGift.EditValue;
           qryFind.Next;
         end;
    end;
  lsTransID.Free;
end;

procedure TfrmPosPembayaran.InputBoxSetPasswordChar(var Msg: TMessage);
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

procedure TfrmPosPembayaran.tvPembayaranTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  if (AValue = Null) then edSubtotal.EditValue := 0
   else if (AValue <> Null) then
      begin
        edSubtotal.EditValue := AValue;
        edGrandTotal.EditValue := edSubtotal.EditValue - edDiscPromo.EditValue - edDiscPurpose.EditValue;
      end;
end;

end.
