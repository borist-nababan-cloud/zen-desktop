unit FPos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxSpinEdit, cxTimeEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxClasses, cxGridLevel, cxGrid,
  cxCalc, AdvGlowButton, DateUtils, cxNavigator, cxCheckBox,
  ExtCtrls, AppEvnts, StrUtils, cxLookAndFeels, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, Printers, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls,
  dxCore, cxDateUtils, MyAccess, Data.DB, DBAccess, MemDS;

type
  TfrmPos = class(TForm)
    edTransID: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edTanggal: TcxDateEdit;
    edWaktu: TcxTimeEdit;
    edNamaCustomer: TcxTextEdit;
    Label4: TLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvDetail: TcxGridBandedTableView;
    btnNew: TcxButton;
    btnBuyJasa: TcxButton;
    gtvDetailIDJasa: TcxGridBandedColumn;
    gtvDetailTransType: TcxGridBandedColumn;
    gtvDetailNamaJasa: TcxGridBandedColumn;
    gtvDetailStart: TcxGridBandedColumn;
    gtvDetailEnd: TcxGridBandedColumn;
    gtvDetailHarga: TcxGridBandedColumn;
    gtvDetailDiscPercent: TcxGridBandedColumn;
    gtvDetailDiscAmount: TcxGridBandedColumn;
    gtvDetailSubtotal: TcxGridBandedColumn;
    gtvDetailTherapist: TcxGridBandedColumn;
    gtvDetailRoom: TcxGridBandedColumn;
    gtvDetailAroma: TcxGridBandedColumn;
    gtvDetailQty: TcxGridBandedColumn;
    btnSave: TcxButton;
    Label6: TLabel;
    edIDRoomPos: TcxTextEdit;
    edSubtotal: TcxCalcEdit;
    Label7: TLabel;
    btnBuyProduct: TcxButton;
    gtvDetailLama: TcxGridBandedColumn;
    btnView: TcxButton;
    btnAdditional: TcxButton;
    edSelesai: TcxTimeEdit;
    Label8: TLabel;
    edLamaPos: TcxCalcEdit;
    Label9: TLabel;
    btnCancel: TcxButton;
    btnChangeTR: TcxButton;
    btnChangeRoom: TcxButton;
    btnPrintSO: TcxButton;
    Label11: TLabel;
    edTherapistPos: TcxTextEdit;
    btnPay: TcxButton;
    btnMerge: TcxButton;
    cxNavigator1: TcxNavigator;
    pmCancel: TPopupMenu;
    BYTHERAPIST1: TMenuItem;
    BYCUSTOMER1: TMenuItem;
    edPaketPos: TcxTextEdit;
    Label13: TLabel;
    edGender: TcxComboBox;
    edPromo: TcxCheckBox;
    btnChecked: TcxButton;
    Timer1: TTimer;
    ckFB: TcxCheckBox;
    btnFB: TcxButton;
    gtvDetailDiscFB: TcxGridBandedColumn;
    gtvDetailSubtotalDisc: TcxGridBandedColumn;
    btnBM: TcxButton;
    btnRF: TcxButton;
    btnVoid: TcxButton;
    appEven: TApplicationEvents;
    Label5: TLabel;
    Label10: TLabel;
    btnNewTrans: TcxButton;
    cbPrinterHK: TComboBox;
    cbPrinterPos: TComboBox;
    Label12: TLabel;
    Label14: TLabel;
    TransMaster: TMyQuery;
    dsTransMaster: TMyDataSource;
    transDetail: TMyQuery;
    dsTransDetail: TMyDataSource;
    qryRoom: TMyQuery;
    dsQryRoom: TMyDataSource;
    MenuTrans: TMyQuery;
    dsMenuTrans: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnBuyJasaClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure gtvDetailTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure btnBuyProductClick(Sender: TObject);
    procedure gtvDetailQtyPropertiesEditValueChanged(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure btnAdditionalClick(Sender: TObject);
    procedure gtvDetailTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure btnPrintSOClick(Sender: TObject);
    procedure btnChangeTRClick(Sender: TObject);
    procedure btnChangeRoomClick(Sender: TObject);
    procedure btnPayClick(Sender: TObject);
    procedure btnMergeClick(Sender: TObject);
    procedure gtvDetailDiscPercentPropertiesEditValueChanged(
      Sender: TObject);
    procedure BYTHERAPIST1Click(Sender: TObject);
    procedure BYCUSTOMER1Click(Sender: TObject);
    procedure edIDCustomersEnter(Sender: TObject);
    procedure btnCheckedClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnFBClick(Sender: TObject);
    procedure edPaketPosPropertiesEditValueChanged(Sender: TObject);
    procedure btnBMClick(Sender: TObject);
    procedure btnRFClick(Sender: TObject);
    procedure btnVoidClick(Sender: TObject);
    procedure appEvenShortCut(var Msg: TWMKey;
      var Handled: Boolean);
    procedure btnNewTransClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryUpdate, qryCari : TMyQuery;
  public
    { Public declarations }
    CTIMER : Integer;
    V_TRANS, V_DATE, V_NUMBER, V_ID : String;
    function CreateNewAutoNum : String;
  end;

var
  frmPos: TfrmPos;

implementation

uses FDMDB, FMenuTrans, FBuyProduct, FMain, FBrowseTrans, FBuyAdditional,
  FPrintSO, FChangeTR, FChangeRoom, FPelunasan, FPayment,
  FNewMenuTrans;

{$R *.dfm}

function TfrmPos.CreateNewAutoNum: string;
var
   lastID, strTmpNum, strNum, NewID : string;
   intTmpNum, intNum : integer;
begin

     NewID := V_TRANS + '.' + V_DATE + '.';

     qrySearch.Close;
     qrySearch.SQL.Clear;
     qrySearch.SQL.Add('SELECT trans_id FROM trans_master ' +
                     'WHERE trans_id LIKE ''' + NewID + '%'' ORDER BY trans_id ASC');
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

procedure TfrmPos.FormCreate(Sender: TObject);
begin
     CTIMER := 0;
     V_TRANS := 'TS';
     V_DATE := FormatDateTime('ddMMYY', date);
     V_NUMBER := '001';
     V_ID := transMaster.Fields[0].AsString;
     edTanggal.Date := Date;

     cbPrinterHK.Items := Printer.Printers;
     cbPrinterPos.Items := Printer.Printers;

     cbPrinterHK.ItemIndex := frmMain.IDXSOPRINTER;
     cbPrinterPos.ItemIndex := frmMain.IDXPOSPRINTER;
end;

procedure TfrmPos.btnNewClick(Sender: TObject);
begin
     V_ID := CreateNewAutoNum;
     edTransID.Text := V_ID;
     edWaktu.Time := Time;
     gtvDetail.DataController.SelectAll;
     gtvDetail.DataController.DeleteSelection;
     edSubtotal.EditValue := 0;
     edNamaCustomer.Clear;
     edIDRoomPos.Clear;
     edPromo.Checked := False;
     ckFB.Checked := False;
     //edIDCustomers.Clear;
     //edPoint.EditValue := 0;
     edTherapistPos.Text := 'NONE';
     ShowMessage('Anda Melakukan Transaksi Baru.');
     with dmDB do
          begin
               qryUpdate.Sql.Clear;
               qryUpdate.SQL.Add('INSERT INTO trans_master VALUES(' +
                               '''' + V_ID + ''', ' +
                               '''' + 'IN ORDER' + ''', ' +
                               '''' + FormatDateTime('yyyy-MM-dd', Date) + ''', ' +
                               '''' + FormatDateTime('HH:MM:ss', Time) + ''', ' +
                               '''' + FormatDateTime('HH:MM:ss', Time) + ''', ' +
                               '''' + 'NONE' + ''', ' +
                               '''' + 'NONE' + ''', ' +
                               '''' + 'NONE' + ''', ' +
                               '''' + '0' + ''', ' +
                               '''' + '0' + ''', ' +
                               '''' + 'NONE' + ''', ' +
                               '''' + 'NONE' + ''', ' +
                               '''' + 'NONE' + ''', ' +
                               '''' + 'N' + ''', ' +
                               '''' + 'M' + ''', ' +
                               '''' + 'N' + ''', ' +
                               '''' + frmMain.APP_OUTLETID + ''')');
               qryUpdate.ExecSql;
          end;
     edNamaCustomer.SetFocus;
end;

procedure TfrmPos.btnNewTransClick(Sender: TObject);
var
   sekarang : TTime;
   nama_hari, id_paket : String;
begin
  if (edTransID.Text = '') then
         begin
              ShowMessage('ID Transaksi masih kosong ');
              Exit;
         end;
     if (edTherapistPos.Text <> 'NONE') then
         begin
              ShowMessage('Anda tidak dapat membeli jasa lagi !!');
              Exit;
         end;


     id_paket := 'HH';

     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from paket where paket_id = ''' +
                                 id_paket + '''');
               qrySearch.Open;
               sekarang := Time;

               nama_hari := FormatDateTime('dddd', Date);
               if (nama_hari = 'Saturday') then
                    begin
                         id_paket := 'NP';
                    end
               else if (nama_hari = 'Sunday') then
                   begin
                        id_paket := 'NP';
                   end

               else if (sekarang > qrySearch.Fields[3].AsDateTime) then
                   begin
                        id_paket := 'NP';
                   end
               else
                   begin
                        id_paket := 'HH';
                   end;

               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from holiday_date where tanggal_mulai = ''' +
                               FormatDateTime('yyyy-MM-dd', Date) + '''');
               qryCari.Open;
               qryCari.First;
               if (NOT qryCari.IsEmpty) then
                   begin
                        id_paket := 'NP';
                   end;

          end;
     edPaketPos.Text := id_paket;

     Application.CreateForm(TfrmNewMenuTrans, frmNewMenuTrans);
     frmNewMenuTrans.IDPAKET := edPaketPos.Text;
     frmNewMenuTrans.TYPETRANS := 'BM';
     frmNewMenuTrans.ShowModal;
end;

procedure TfrmPos.btnBuyJasaClick(Sender: TObject);
var
   sekarang : TTime;
   nama_hari, id_paket : String;
begin
     if (edTransID.Text = '') then
         begin
              ShowMessage('ID Transaksi masih kosong ');
              Exit;
         end;
     if (edTherapistPos.Text <> 'NONE') then
         begin
              ShowMessage('Anda tidak dapat membeli jasa lagi !!');
              Exit;
         end;


     id_paket := 'HH';

     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from paket where paket_id = ''' +
                                 id_paket + '''');
               qrySearch.Open;
               sekarang := Time;

               nama_hari := FormatDateTime('dddd', Date);
               if (nama_hari = 'Saturday') then
                    begin
                         id_paket := 'NP';
                    end
               else if (nama_hari = 'Sunday') then
                   begin
                        id_paket := 'NP';
                   end

               else if (sekarang > qrySearch.Fields[3].AsDateTime) then
                   begin
                        id_paket := 'NP';
                   end
               else
                   begin
                        id_paket := 'HH';
                   end;

               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from holiday_date where tanggal_mulai = ''' +
                               FormatDateTime('yyyy-MM-dd', Date) + '''');
               qryCari.Open;
               qryCari.First;
               if (NOT qryCari.IsEmpty) then
                   begin
                        id_paket := 'NP';
                   end;

          end;

     edPaketPos.Text := id_paket;
     Application.CreateForm(TfrmMenuTrans, frmMenuTrans);
     frmMenuTrans.pgControl.ActivePage := frmMenuTrans.pgJasa;
     frmMenuTrans.lblPaketID.Caption := id_paket;
     frmMenuTrans.ShowModal;

end;

procedure TfrmPos.btnSaveClick(Sender: TObject);
var
   selesai : TTime;
   i, lama : Integer;
begin
     Screen.Cursor:= crHourGlass;
     if (edTransID.Text = '') then
         begin
              ShowMessage('ID Transaksi masih kosong, ');
              Screen.Cursor:= crDefault;
              Exit;
         end;
     lama := edLamaPos.EditValue;
     selesai := IncMinute(Time, lama);
     gtvDetail.DataController.PostEditingData;
     gtvDetail.DataController.Post;
     gtvDetail.DataController.GotoFirst;
     with dmDB do
          begin
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('delete from trans_detail where id_trans = ''' +
                                          edTransID.Text + '''');
               qryUpdate.ExecSql;
               Sleep(100);
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update trans_master set ' +
                                 'room_id = ''' + edIDRoomPos.Text + ''', ' +
                                 'nama_customer = ''' + edNamaCustomer.Text + ''', ' +
                                 'therapist_id = ''' + edTherapistPos.Text + ''', ' +
                                 'lama = ''' + VarToStr(edLamaPos.EditValue) + ''', ' +
                                 'end_time = ''' + FormatDateTime('HH:MM:ss', selesai) + ''', ' +
                                 'paket = ''' + edPaketPos.Text + ''', ' +
                                 'notes = ''' + '(NONE)' + ''', ' +
                                 'taked = ''' + 'N' + ''', ' +
                                 'gender = ''' + edGender.Text + ''', ' +
                                 'promo = ''' + VarToStr(edPromo.EditValue) + ''', ' + 
                                 'subtotal = ''' + vartostr(edSubtotal.EditValue) + ''' ' +
                                 'where trans_id = ''' + edTransID.Text + '''');

               qryUpdate.ExecSql;

               for i:=0 to gtvDetail.DataController.RecordCount-1 do
                   begin
                        qryUpdate.Sql.Clear;
                        qryUpdate.SQL.Add('INSERT INTO trans_detail VALUES(' +
                                          '''' + '' + ''', ' +
                                          '''' + edTransID.Text + ''', ' +
                                          '''' + FormatDateTime('yyyy-MM-dd', Date) + ''', ' +
                                          '''' + vartostr(gtvDetailTransType.EditValue) + ''', ' +
                                          '''' + vartostr(gtvDetailIDJasa.EditValue) + ''', ' +
                                          '''' + vartostr(gtvDetailNamaJasa.EditValue) + ''', ' +
                                          '''' + FormatDateTime('HH:MM:ss', edWaktu.Time) + ''', ' +
                                          '''' + FormatDateTime('HH:MM:ss', edSelesai.Time) + ''', ' +
                                          '''' + vartostr(gtvDetailHarga.EditValue) + ''', ' +
                                          '''' + vartostr(gtvDetailDiscFB.EditValue) + ''', ' +
                                          '''' + vartostr(gtvDetailDiscPercent.EditValue) + ''', ' +
                                          '''' + vartostr(gtvDetailSubtotal.EditValue) + ''', ' +
                                          '''' + edTherapistPos.Text + ''', ' +
                                          '''' + edIDRoomPos.Text + ''', ' +
                                          '''' + vartostr(gtvDetailQty.EditValue) + ''', ' +
                                          '''' + vartostr(gtvDetailAroma.EditValue) + ''', ' +
                                          '''' + vartostr(gtvDetailLama.EditValue) + ''', ' +
                                          '''' + '(NONE)' + ''', ' +
                                          '''' + edNamaCustomer.Text + ''', ' +
                                          '''' + edPaketPos.Text + ''', ' +
                                          '''' + '(NONE)' + ''', ' +
                                          '''' + 'N' + ''', ' +
                                          '''' + frmMain.APP_OUTLETID + ''')');
                        qryUpdate.ExecSql;
                        gtvDetail.DataController.GotoNext;
                   end;

          end;
     Screen.Cursor:= crDefault;
end;

procedure TfrmPos.gtvDetailTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
     if (AValue = Null) then
         begin
              edSubtotal.EditValue := 0;
         end
     else
         begin
              edSubtotal.EditValue := AValue;
         end;

end;

procedure TfrmPos.btnBuyProductClick(Sender: TObject);
begin

     if (edTransID.Text = '') then
         begin
              ShowMessage('ID Transaksi Masih Kosong, Klik New Dahulu');
              Exit;
         end;

     Application.CreateForm(TfrmBuyProduct, frmBuyProduct);
     frmBuyProduct.ShowModal;
end;

procedure TfrmPos.gtvDetailQtyPropertiesEditValueChanged(Sender: TObject);
begin
     gtvDetail.DataController.PostEditingData;
     gtvDetailSubtotal.EditValue := gtvDetailHarga.EditValue * gtvDetailQty.EditValue;
     gtvDetail.DataController.PostEditingData;
     gtvDetail.DataController.Post;
end;

procedure TfrmPos.btnViewClick(Sender: TObject);
begin
     with dmDB do
          begin
               transMaster.Close;
               transMaster.SQL.Clear;
               transMaster.SQL.Add('select * from trans_master where tanggal = ''' +
                                   FormatDateTime('yyyy-MM-dd', Date) + ''' and status_trans <> ''' +
                                   'PAID' + ''' and status_trans <> ''' +
                                   'CANCELED' + ''' and status_trans <> ''' +
                                   'MERGE' + '''');
               transMaster.Open;
          end;
     Application.CreateForm(TfrmBrowseTrans, frmBrowseTrans);
     frmBrowseTrans.gtbTransMaster.DataController.Refresh;
     frmBrowseTrans.ShowModal;


end;

procedure TfrmPos.btnAdditionalClick(Sender: TObject);
var
   i : Integer;
   tr_id : String;
   sekarang : TTime;
   nama_hari, id_paket : String;
begin
     if (edTransID.Text = '') then
         begin
              ShowMessage('ID Transaksi Masih Kosong, Klik New Dahulu');
              Exit;
         end;
     if (edTherapistPos.Text = 'NONE') then
         begin
              ShowMessage('Belum ada jasa yang dipilih, mohon pilih jasa terlebih dahulu !!');
              Exit;
         end;

     id_paket := 'HH';

     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from paket where paket_id = ''' +
                                 id_paket + '''');
               qrySearch.Open;
               sekarang := Time;

               nama_hari := FormatDateTime('dddd', Date);
               if (nama_hari = 'Saturday') then
                    begin
                         id_paket := 'NP';
                    end
               else if (nama_hari = 'Sunday') then
                   begin
                        id_paket := 'NP';
                   end
               else if (sekarang > qrySearch.Fields[3].AsDateTime) then
                   begin
                        id_paket := 'NP';
                   end
               else
                   begin
                        id_paket := 'HH';
                   end;
          end;

     gtvDetail.DataController.PostEditingData;
     gtvDetail.DataController.Post;
     gtvDetail.DataController.GotoFirst;
     for i:=0 to gtvDetail.DataController.RecordCount-1 do
         begin
              if (gtvDetailTherapist.EditValue = Null) then
                  begin
                       gtvDetail.DataController.GotoNext;
                  end
              else if (gtvDetailTherapist.EditValue <> Null) then
                  begin
                       tr_id := VarToStr(gtvDetailTherapist.EditValue);
                  end
         end;

     Application.CreateForm(TfrmBuyAdditional, frmBuyAdditional);
     frmBuyAdditional.id_tr := tr_id;
     frmBuyAdditional.id_room := edIDRoomPos.Text;

     //frmBuyAdditional.gtbAdditional.DataController.GotoFirst;
     frmBuyAdditional.ShowModal;
end;

procedure TfrmPos.gtvDetailTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
   lama : Integer;
begin
     if (AValue = Null) then
         begin
              edLamaPos.EditValue := 0;
         end
     else
         begin
              edLamaPos.EditValue := AValue;
              lama := AValue;
              edSelesai.Time := IncMinute(edWaktu.Time, lama);
         end;
end;

procedure TfrmPos.btnPrintSOClick(Sender: TObject);
var
   panjang, jumlah, lama : Integer;
   selesai : TTime;
   departemen : String;
begin
     if (edTransID.Text = '') then
         begin
              ShowMessage('ID Transaksi masih kosong, ');
              Exit;
         end;
     btnSave.Click;
     lama := edLamaPos.EditValue;

     Sleep(100);
     Application.CreateForm(TfrmPintSO, frmPintSO);

               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from ruangan where ruangan_id = ''' +
                                 edIDRoomPos.Text + '''');
               qrySearch.Open;

               departemen :=  qrySearch.Fields[3].AsString;
               if (departemen = 'RF') then
                   begin
                        lama := lama + 5;
                   end
               else if (departemen = 'BM') then
                   begin
                        lama := lama + 5;
                   end;

               selesai := IncMinute(Time, lama);

               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update ruangan set ' +
                                 'status = ''' + 'STARTED' + ''', ' +
                                 'start_time = ''' + FormatDateTime('HH:MM:ss', Time) + ''', ' +
                                 'end_time = ''' + FormatDateTime('HH:MM:ss', selesai) + ''' ' +
                                 'where ruangan_id = ''' + edIDRoomPos.Text + '''');
               qryUpdate.ExecSql;

               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update available_tr set ' +
                                 'status = ''' + 'STARTED' + ''', ' +
                                 'start_time = ''' + FormatDateTime('HH:MM:ss', Time) + ''', ' +
                                 'end_time = ''' + FormatDateTime('HH:MM:ss', selesai) + ''', ' +
                                 'tanggal = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''', ' +
                                 'room_id = ''' + edIDRoomPos.Text + ''' ' +
                                 'where id_therapist = ''' + edTherapistPos.Text + '''');
               qryUpdate.ExecSql;

               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update trans_master set ' +
                                 'status_trans = ''' + 'STARTED' + ''' ' +
                                 'where  trans_id = ''' + edTransID.Text + '''');
               qryUpdate.ExecSql;

               frmPintSO.qryPrintSO.Close;
               frmPintSO.qryPrintSO.SQL.Clear;
               frmPintSO.qryPrintSO.SQL.Add('select * from trans_master where trans_id = ''' +
                                   edTransID.Text + '''');
               frmPintSO.qryPrintSO.Open;

               frmPintSO.PrintDetail.Close;
               frmPintSO.PrintDetail.SQL.Clear;
               frmPintSO.PrintDetail.SQL.Add('select * from trans_detail where id_trans = ''' +
                                   edTransID.Text + ''' and trans_type_id <> ''' +
                                   'BP' + ''' and trans_type_id <> ''' +
                                   'BG' + '''');
               frmPintSO.PrintDetail.Open;
               jumlah := frmPintSO.PrintDetail.RecordCount;



     panjang := 40 * jumlah;
     frmPintSO.qrpSO.Height := frmPintSO.qrpSO.Height + panjang;
     frmPintSO.qrpSO.PrinterSettings.PrinterIndex := cbPrinterHK.ItemIndex;
     frmPintSO.qrpSO.Preview;

end;

procedure TfrmPos.btnChangeTRClick(Sender: TObject);
begin
     Application.CreateForm(TfrmChangeTR, frmChangeTR);
     frmChangeTR.qryTherapist.Refresh;
     frmChangeTR.gtbTR.DataController.Refresh;
     frmChangeTR.TR_LAMA := edTherapistPos.Text;
     frmChangeTR.ROOM_ID := edIDRoomPos.Text;
     frmChangeTR.gtbTR.DataController.GotoFirst;
     frmChangeTR.ShowModal;
end;

procedure TfrmPos.btnChangeRoomClick(Sender: TObject);
var
   jenis_jasa : String;
begin
     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from ruangan where ruangan_id = ''' +
                                 edIDRoomPos.Text + '''');
               qrySearch.Open;
               jenis_jasa := qrySearch.Fields[3].AsString;

               qryRoom.Close;
               qryRoom.SQL.Clear;
               qryRoom.SQL.Add('select * from ruangan where status = ''' +
                                 'AVAILABLE' + ''' and jenis_jasa = ''' +
                                 jenis_jasa + '''');
               qryRoom.Open;

          end;
     Application.CreateForm(TfrmChangeRoom, frmChangeRoom);
     frmChangeRoom.gtbChangeRoom.DataController.Refresh;
     frmChangeRoom.ROOM_LAMA := edIDRoomPos.Text;
     frmChangeRoom.TRANS_ID := edTransID.Text;
     frmChangeRoom.ID_THERAPIST := edTherapistPos.Text;
     frmChangeRoom.gtbChangeRoom.DataController.GotoFirst;
     frmChangeRoom.ShowModal;

end;

procedure TfrmPos.btnPayClick(Sender: TObject);
var
   point : Double;
begin

     if (edTransID.Text = '') then
         begin
              ShowMessage('ID Transaksi masih kosong, ');
              Exit;
         end;
     btnSave.Click;
     point := edSubtotal.EditValue / 10000;

     Application.CreateForm(TfrmPelunasan, frmPelunasan);
     with frmPelunasan do
          begin
               edTransIDPayment.Text := edTransID.Text;
               edTanggalPayment.Date := edTanggal.Date;
               edStartPayment.Time := edWaktu.Time;
               edNamaCustomerPayment.Text := edNamaCustomer.Text;
               edSubtotalPayment.EditValue := edSubtotal.EditValue;
               edTambahPoint.EditValue := point;
               edSisaPoint.EditValue := edPointPayment.EditValue + edTambahPoint.EditValue;
               edTotalPayment.EditValue := edSubtotal.EditValue;
               edGrandTotalPayment.EditValue := edSubtotal.EditValue;
               edPayment.Text := 'CASH';

          end;
     frmPelunasan.ShowModal;


end;

procedure TfrmPos.btnMergeClick(Sender: TObject);
begin
     if (edTransID.Text = '') then
         begin
              ShowMessage('ID Transaksi masih kosong, ');
              Exit;
         end;
     btnSave.Enabled := False;
     Application.CreateForm(TfrmPayment, frmPayment);
     transMaster.Close;
     transMaster.SQL.Clear;
     transMaster.SQL.Add('select * from trans_master where trans_id <> ''' +
                              edTransID.Text + ''' and status_trans = ''' +
                              'STARTED' + ''' and tanggal = ''' +
                              FormatDateTime('yyyy-MM-dd', Date) + '''');
     transMaster.Open;
     frmPayment.TRANS_ID_LAMA := edTransID.Text;
     frmPayment.ShowModal;
end;

procedure TfrmPos.gtvDetailDiscPercentPropertiesEditValueChanged(
  Sender: TObject);
begin
     gtvDetail.DataController.PostEditingData;
     gtvDetailSubtotal.EditValue := gtvDetailHarga.EditValue - ( gtvDetailHarga.EditValue / 100 * gtvDetailDiscPercent.EditValue );
end;

procedure TfrmPos.BYTHERAPIST1Click(Sender: TObject);
begin
     with dmDB do
          begin
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update trans_master set ' +
                                 'status_trans = ''' + 'CANCELED' + ''' ' +
                                 'where trans_id = ''' + edTransID.Text + '''');
               qryUpdate.ExecSql;
               Sleep(10);


               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update ruangan set ' +
                                 'start_time = ''' + '00:00:00' + ''', ' +
                                 'end_time = ''' + '00:00:00' + ''', ' +
                                 'status = ''' + 'AVAILABLE' + ''' ' +
                                 'where ruangan_id = ''' + edIDRoomPos.Text + '''');
               qryUpdate.ExecSql;
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update available_tr set ' +
                                 'status = ''' + 'AVAILABLE' + ''', ' +
                                 'waktu_masuk = + ''' + FormatDateTime('HH:MM:ss', Time) + ''', ' +
                                 'room_id = ''' + 'NONE' + ''', ' +
                                 'start_time = ''' + '00:00:00' + ''', ' +
                                 'end_time = ''' + '00:00:00' + ''' ' +
                                 'where id_therapist = ''' + edTherapistPos.Text + '''');
               qryUpdate.ExecSql;

          end;
     edTransID.Clear;
     edTanggal.Date := Date;
     //edIDCustomers.Clear;
     edIDRoomPos.Clear;
     edWaktu.Time := Time;
     gtvDetail.DataController.SelectAll;
     gtvDetail.DataController.DeleteSelection;
     edTherapistPos.Clear;
     //edPoint.EditValue := 0;
     edLamaPos.EditValue := 0;
     ckFB.Checked := False;
     {rmMain.close_clientForm;
     Application.CreateForm(TfrmEmpty, frmEmpty);
     frmEmpty.BorderStyle := bsNone;
     frmEmpty.Parent := frmMain.pnlMain;
     frmEmpty.Show;
     frmEmpty.WindowState := wsMaximized;
     }
end;

procedure TfrmPos.BYCUSTOMER1Click(Sender: TObject);
begin
     with dmDB do
          begin
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update available_tr set ' +
                                 'status = ''' + 'AVAILABLE' + ''', ' +
                                 'start_time = ''' + '00:00:00' + ''', ' +
                                 'end_time = ''' + '00:00:00' + ''', ' +
                                 'room_id = ''' + 'NONE' + ''' ' +
                                 'where id_therapist = ''' + edTherapistPos.Text + '''');
               qryUpdate.ExecSql;

               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update ruangan set ' +
                                 'status = ''' + 'AVAILABLE' + ''', ' +
                                 'therapist_id =  ''' + 'NONE' + ''', ' +
                                 'trans_id = ''' + 'AVAILABLE' + ''', ' +
                                 'start_time = ''' + '00:00:00' + ''', ' +
                                 'end_time = ''' + '00:00:00' + ''', ' +
                                 'nama_cust = ''' + 'NONE' + ''' ' +
                                 'where ruangan_id = ''' + edIDRoomPos.Text + '''');
               qryUpdate.ExecSql;

               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update trans_master set ' +
                                'status_trans = ''' + 'CANCELED' + ''' ' +
                                'where trans_id = ''' + edTransID.Text + '''');
               qryUpdate.ExecSql;

          end;
     //btnNew.Click;
    edTransID.Clear;
     edTanggal.Date := Date;
     //edIDCustomers.Clear;
     edIDRoomPos.Clear;
     edWaktu.Time := Time;
     gtvDetail.DataController.SelectAll;
     gtvDetail.DataController.DeleteSelection;
     edTherapistPos.Clear;
     //edPoint.EditValue := 0;
     edLamaPos.EditValue := 0;
     ckFB.Checked := False;
end;

procedure TfrmPos.edIDCustomersEnter(Sender: TObject);
begin
     //edIDCustomers.Clear;
end;

procedure TfrmPos.btnCheckedClick(Sender: TObject);
var
   i, recSelect : Integer;
   harga, subtotal, lama, total : Double;
   jenis_jasa : String;
begin
     gtvDetail.DataController.GotoFirst;

     if edPromo.Checked = False then
        begin
             edPromo.Checked := True;
             for i:=0 to gtvDetail.DataController.RecordCount-1 do
                 begin
                      recSelect := gtvDetail.DataController.GetFocusedRecordIndex;
                      harga := gtvDetail.DataController.GetValue(recSelect, gtvDetailHarga.Index);
                      jenis_jasa := gtvDetail.DataController.GetValue(recSelect, gtvDetailTransType.Index);
                      //subtotal := gtvDetail.DataController.GetValue(recSelect, gtvDetailSubtotal.Index);
                      lama := gtvDetail.DataController.GetValue(recSelect, gtvDetailLama.Index);
                      if (lama <> 0) then
                          begin
                               subtotal := harga - (harga * 20 / 100);
                               gtvDetail.DataController.SetValue(recSelect, gtvDetailDiscPercent.Index, 20);
                               //gtvDetail.DataController.SetValue(recSelect, gtvDetailSubtotal.Index, subtotal);
                               if(ckFB.Checked = True) then
                                 begin
                                    total := subtotal - (subtotal * 10 /100);
                                    gtvDetail.DataController.SetValue(recSelect, gtvDetailSubtotal.Index, total);
                                    
                                 end
                               else
                                 begin
                                    gtvDetail.DataController.SetValue(recSelect, gtvDetailSubtotal.Index, subtotal);
                                 end;
                          end;
                      //subtotal := harga + (harga * 20 / 100);
                      gtvDetail.DataController.PostEditingData;
                      gtvDetail.DataController.Post;
                      gtvDetail.DataController.GotoNext;
                 end;
        end
     else if edPromo.Checked = True then
        begin
             edPromo.Checked := False;
             for i:=0 to gtvDetail.DataController.RecordCount-1 do
                 begin
                      recSelect := gtvDetail.DataController.GetFocusedRecordIndex;
                      harga := gtvDetail.DataController.GetValue(recSelect, gtvDetailHarga.Index);
                      //subtotal := gtvDetail.DataController.GetValue(recSelect, gtvDetailSubtotal.Index);
                      lama := gtvDetail.DataController.GetValue(recSelect, gtvDetailLama.Index);
                      if (lama <> 0) then
                          begin
                               subtotal := harga;
                               gtvDetail.DataController.SetValue(recSelect, gtvDetailDiscPercent.Index, 0);
                               if(ckFB.Checked = True) then
                                 begin
                                    total := subtotal - (subtotal * 10 /100);
                                    gtvDetail.DataController.SetValue(recSelect, gtvDetailSubtotal.Index, total);
                                    
                                 end
                               else
                                 begin
                                    gtvDetail.DataController.SetValue(recSelect, gtvDetailSubtotal.Index, subtotal);
                                 end;
                               //gtvDetail.DataController.SetValue(recSelect, gtvDetailSubtotal.Index, subtotal);
                          end;
                      //subtotal := harga;
                      //gtvDetail.DataController.SetValue(recSelect, gtvDetailSubtotal.Index, subtotal);
                      gtvDetail.DataController.PostEditingData;
                      gtvDetail.DataController.Post;
                      gtvDetail.DataController.GotoNext;
                 end;
        end;
end;

procedure TfrmPos.Timer1Timer(Sender: TObject);
begin
     CTIMER := CTIMER + 1;
     if (CTIMER = 2) then
         begin
              CTIMER := 0;
         end;
end;

procedure TfrmPos.btnFBClick(Sender: TObject);
var
   i, recSelect : Integer;
   harga, subtotal_disc, lama, subtotal : Double;
   jenis_jasa : String;
begin
     gtvDetail.DataController.GotoFirst;

     if ckFB.Checked = False then
        begin
             ckFB.Checked := True;
             for i:=0 to gtvDetail.DataController.RecordCount-1 do
                 begin
                      recSelect := gtvDetail.DataController.GetFocusedRecordIndex;
                      harga := gtvDetail.DataController.GetValue(recSelect, gtvDetailHarga.Index);
                      jenis_jasa := gtvDetail.DataController.GetValue(recSelect, gtvDetailTransType.Index);
                      //subtotal := gtvDetail.DataController.GetValue(recSelect, gtvDetailSubtotal.Index);
                      lama := gtvDetail.DataController.GetValue(recSelect, gtvDetailLama.Index);
                      if (lama <> 0) then
                          begin
                               subtotal_disc := harga - (harga * 20 / 100);
                               subtotal := subtotal_disc - (subtotal_disc * 10 / 100);
                               gtvDetail.DataController.SetValue(recSelect, gtvDetailDiscFB.Index, 10);
                               gtvDetail.DataController.SetValue(recSelect, gtvDetailSubtotal.Index, subtotal);
                          end;
                      //subtotal := harga + (harga * 20 / 100);
                      gtvDetail.DataController.PostEditingData;
                      gtvDetail.DataController.Post;
                      gtvDetail.DataController.GotoNext;
                 end;
        end
     else if ckFB.Checked = True then
        begin
             ckFB.Checked := False;
             for i:=0 to gtvDetail.DataController.RecordCount-1 do
                 begin
                      recSelect := gtvDetail.DataController.GetFocusedRecordIndex;
                      //harga := gtvDetail.DataController.GetValue(recSelect, gtvDetailHarga.Index);
                      harga := gtvDetail.DataController.GetValue(recSelect, gtvDetailHarga.Index);
                      lama := gtvDetail.DataController.GetValue(recSelect, gtvDetailLama.Index);
                      if (lama <> 0) then
                          begin
                               if(gtvDetail.DataController.GetValue(recSelect, gtvDetailDiscPercent.Index) = 0) then
                                 begin
                                     subtotal := harga;
                                 end
                               else
                                 begin
                                     subtotal := harga - (harga * 20 / 100);
                                 end;
                               gtvDetail.DataController.SetValue(recSelect, gtvDetailDiscFB.Index, 0);
                               gtvDetail.DataController.SetValue(recSelect, gtvDetailSubtotal.Index, subtotal);
                          end;
                      //subtotal := harga;
                      //gtvDetail.DataController.SetValue(recSelect, gtvDetailSubtotal.Index, subtotal);
                      gtvDetail.DataController.PostEditingData;
                      gtvDetail.DataController.Post;
                      gtvDetail.DataController.GotoNext;
                 end;
        end;
end;

procedure TfrmPos.edPaketPosPropertiesEditValueChanged(Sender: TObject);
begin
    if (edPaketPos.EditValue = 'HH') then
      begin
           btnFB.Enabled := True;
           ckFB.Enabled := True;
           ckFB.Checked := False;
      end
    else
      begin
           btnFB.Enabled := False;
           ckFB.Enabled := False;
           ckFB.Checked := False;
      end;
end;

procedure TfrmPos.btnBMClick(Sender: TObject);
var
   sekarang : TTime;
   nama_hari, id_paket : String;
begin
     if (edTransID.Text = '') then
         begin
              ShowMessage('ID Transaksi masih kosong ');
              Exit;
         end;
     if (edTherapistPos.Text <> 'NONE') then
         begin
              ShowMessage('Anda tidak dapat membeli jasa lagi !!');
              Exit;
         end;


     id_paket := 'HH';

     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from paket where paket_id = ''' +
                                 id_paket + '''');
               qrySearch.Open;
               sekarang := Time;

               nama_hari := FormatDateTime('dddd', Date);
               if (nama_hari = 'Saturday') then
                    begin
                         id_paket := 'NP';
                    end
               else if (nama_hari = 'Sunday') then
                   begin
                        id_paket := 'NP';
                   end

               else if (sekarang > qrySearch.Fields[3].AsDateTime) then
                   begin
                        id_paket := 'NP';
                   end
               else
                   begin
                        id_paket := 'HH';
                   end;

               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from holiday_date where tanggal_mulai = ''' +
                               FormatDateTime('yyyy-MM-dd', Date) + '''');
               qryCari.Open;
               qryCari.First;
               if (NOT qryCari.IsEmpty) then
                   begin
                        id_paket := 'NP';
                   end;

          end;

     edPaketPos.Text := id_paket;

     //ben-2017-02-27
     Application.CreateForm(TfrmMenuTrans, frmMenuTrans);
     MenuTrans.Close;
     MenuTrans.SQL.Clear;
     MenuTrans.SQL.Add('select * from menu_master where jenis_jasa_id = ''' +
                            'BM' + ''' AND aktif = ''' +
                            'Y' + ''' order by nama_menu ASC');
     MenuTrans.Open;

     frmMenuTrans.gtbMenu.DataController.Refresh;
     frmMenuTrans.pgControl.ActivePage := frmMenuTrans.pgJasa;
     frmMenuTrans.lblPaketID.Caption := id_paket;
     frmMenuTrans.gtbMenu.DataController.GotoFirst;
     frmMenuTrans.ShowModal;


end;

procedure TfrmPos.btnRFClick(Sender: TObject);
var
   sekarang : TTime;
   nama_hari, id_paket : String;
begin
     if (edTransID.Text = '') then
         begin
              ShowMessage('ID Transaksi masih kosong ');
              Exit;
         end;
     if (edTherapistPos.Text <> 'NONE') then
         begin
              ShowMessage('Anda tidak dapat membeli jasa lagi !!');
              Exit;
         end;


     id_paket := 'HH';

     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from paket where paket_id = ''' +
                                 id_paket + '''');
               qrySearch.Open;
               sekarang := Time;

               nama_hari := FormatDateTime('dddd', Date);
               if (nama_hari = 'Saturday') then
                    begin
                         id_paket := 'NP';
                    end
               else if (nama_hari = 'Sunday') then
                   begin
                        id_paket := 'NP';
                   end

               else if (sekarang > qrySearch.Fields[3].AsDateTime) then
                   begin
                        id_paket := 'NP';
                   end
               else
                   begin
                        id_paket := 'HH';
                   end;

               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from holiday_date where tanggal_mulai = ''' +
                               FormatDateTime('yyyy-MM-dd', Date) + '''');
               qryCari.Open;
               qryCari.First;
               if (NOT qryCari.IsEmpty) then
                   begin
                        id_paket := 'NP';
                   end;

          end;

     edPaketPos.Text := id_paket;

     Application.CreateForm(TfrmMenuTrans, frmMenuTrans);
     MenuTrans.Close;
     MenuTrans.SQL.Clear;
     MenuTrans.SQL.Add('select * from menu_master where jenis_jasa_id = ''' +
                            'RF' + ''' AND aktif = ''' +
                            'Y' + ''' order by nama_menu ASC');
     MenuTrans.Open;
     frmMenuTrans.gtbMenu.DataController.Refresh;
     frmMenuTrans.pgControl.ActivePage := frmMenuTrans.pgJasa;
     frmMenuTrans.lblPaketID.Caption := id_paket;
     frmMenuTrans.gtbMenu.DataController.GotoFirst;
     frmMenuTrans.ShowModal;
end;

procedure TfrmPos.btnVoidClick(Sender: TObject);
var
   recSelect, newRec : Integer;
   jenisTrasaksi, IdProduk, namaProduk, aroma : String;
   qty, harga, discount, discFB, subtotal, lama, qtyAkhir, subtotalAkhir : Double;
begin
     recSelect := gtvDetail.DataController.GetFocusedRecordIndex;
     jenisTrasaksi := vartostr(gtvDetail.DataController.GetValue(recSelect, gtvDetailTransType.Index));
     if (jenisTrasaksi = 'BJ') then
         begin
              ShowMessage('Maaf yang dapat di Void Hanya Produk dan Additional saja');
              Exit;
         end
     else
         begin
              IdProduk := vartostr(gtvDetail.DataController.GetValue(recSelect, gtvDetailIDJasa.Index));
              namaProduk := vartostr(gtvDetail.DataController.GetValue(recSelect, gtvDetailNamaJasa.Index)) + ' #VOID#';
              aroma := vartostr(gtvDetail.DataController.GetValue(recSelect, gtvDetailAroma.Index));
              qty := gtvDetail.DataController.GetValue(recSelect, gtvDetailQty.Index);
              harga := gtvDetail.DataController.GetValue(recSelect, gtvDetailHarga.Index);
              discount := gtvDetail.DataController.GetValue(recSelect, gtvDetailDiscPercent.Index);
              discFB := gtvDetail.DataController.GetValue(recSelect, gtvDetailDiscFB.Index);
              subtotal := gtvDetail.DataController.GetValue(recSelect, gtvDetailSubtotal.Index);
              lama := gtvDetail.DataController.GetValue(recSelect, gtvDetailLama.Index);

              qtyAkhir := 0 - qty;
              subtotalAkhir := 0 - subtotal;

              newRec := gtvDetail.DataController.InsertRecord(gtvDetail.DataController.RecordCount);
              gtvDetail.DataController.SetValue(newRec, gtvDetailTransType.Index, jenisTrasaksi);
              gtvDetail.DataController.SetValue(newRec, gtvDetailNamaJasa.Index, namaProduk);
              gtvDetail.DataController.SetValue(newRec, gtvDetailIDJasa.Index, IdProduk);
              gtvDetail.DataController.SetValue(newRec, gtvDetailHarga.Index, harga);
              gtvDetail.DataController.SetValue(newRec, gtvDetailDiscPercent.Index, discount);
              gtvDetail.DataController.SetValue(newRec, gtvDetailSubtotal.Index, subtotalAkhir);
              gtvDetail.DataController.SetValue(newRec, gtvDetailQty.Index, qtyAkhir);
              gtvDetail.DataController.SetValue(newRec, gtvDetailLama.Index, lama);
              gtvDetail.DataController.SetValue(newRec, gtvDetailDiscFB.Index, discFB);
              gtvDetail.DataController.SetValue(newRec, gtvDetailAroma.Index, aroma);
              gtvDetail.DataController.PostEditingData;
              gtvDetail.DataController.Post;

         end;
end;

procedure TfrmPos.appEvenShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
     if (Msg.CharCode = Ord('F')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnRF.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('N')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnNew.Click;
              Handled := true;
         end;
     if (Msg.CharCode = Ord('B')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnBM.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('G')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnBuyProduct.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('A')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnAdditional.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('S')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnSave.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('T')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnChangeTR.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('R')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnChangeRoom.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('P')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnPrintSO.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('M')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              cxGrid1.SetFocus;
              gtvDetail.DataController.GotoFirst;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('E')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnVoid.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('V')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnView.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('C')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnCancel.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('H')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnFB.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('Y')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnChecked.Click;
              Handled := True;
         end;

end;

end.
