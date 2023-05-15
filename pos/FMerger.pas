unit FMerger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxDBLookupComboBox, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxTimeEdit, AppEvnts, cxLookAndFeels, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator;

type
  TfrmMerger = class(TForm)
    cxGrid1: TcxGrid;
    gtbTransMaster: TcxGridDBBandedTableView;
    gtbTransMastertrans_id: TcxGridDBBandedColumn;
    gtbTransMastertanggal: TcxGridDBBandedColumn;
    gtbTransMasterwaktu: TcxGridDBBandedColumn;
    gtbTransMasterid_customer: TcxGridDBBandedColumn;
    gtbTransMasternama: TcxGridDBBandedColumn;
    gtbTransMasterpayment_via: TcxGridDBBandedColumn;
    gtbTransMasterpayment_ref: TcxGridDBBandedColumn;
    gtbTransMastersubtotal: TcxGridDBBandedColumn;
    gtbTransMasterdisc_percent: TcxGridDBBandedColumn;
    gtbTransMasterdisc_amount: TcxGridDBBandedColumn;
    gtbTransMastertotal: TcxGridDBBandedColumn;
    gtbTransMastertax_: TcxGridDBBandedColumn;
    gtbTransMastertax_amount: TcxGridDBBandedColumn;
    gtbTransMastergrandtotal: TcxGridDBBandedColumn;
    gtbTransMasternotes: TcxGridDBBandedColumn;
    gtbTransMasterstatus_trans: TcxGridDBBandedColumn;
    gtbTransMasterroom_id: TcxGridDBBandedColumn;
    gtbTransMastertherapist_id: TcxGridDBBandedColumn;
    gtbTransMasterColumn1: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    gtbTransDetail: TcxGridDBBandedTableView;
    gtbTransDetailautonum: TcxGridDBBandedColumn;
    gtbTransDetailid_trans: TcxGridDBBandedColumn;
    gtbTransDetailtanggal: TcxGridDBBandedColumn;
    gtbTransDetailtrans_type_id: TcxGridDBBandedColumn;
    gtbTransDetailproduk_jasa_id: TcxGridDBBandedColumn;
    gtbTransDetailproduk_jasa_nama: TcxGridDBBandedColumn;
    gtbTransDetailstart_time: TcxGridDBBandedColumn;
    gtbTransDetailend_time: TcxGridDBBandedColumn;
    gtbTransDetailharga: TcxGridDBBandedColumn;
    gtbTransDetaildisc_amount: TcxGridDBBandedColumn;
    gtbTransDetaildisc_percent: TcxGridDBBandedColumn;
    gtbTransDetailsubtotal: TcxGridDBBandedColumn;
    gtbTransDetailteraphist_id: TcxGridDBBandedColumn;
    gtbTransDetailroom_id: TcxGridDBBandedColumn;
    gtbTransDetailquantity: TcxGridDBBandedColumn;
    gtbTransDetailaroma: TcxGridDBBandedColumn;
    gtbTransDetaillama: TcxGridDBBandedColumn;
    cxGrid2Level1: TcxGridLevel;
    btnSelect: TcxButton;
    ApplicationEvents1: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure gtbTransMasterCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnSelectClick(Sender: TObject);
    procedure ApplicationEvents1ShortCut(var Msg: TWMKey;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMerger: TfrmMerger;

implementation

uses FDMDB, FPelunasan;

{$R *.dfm}

procedure TfrmMerger.FormCreate(Sender: TObject);
begin
     //with dmDB do
end;

procedure TfrmMerger.gtbTransMasterCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
   rec_select : Integer;
   trans_id   : String;
begin
     {rec_select := gtbTransMaster.DataController.GetFocusedRecordIndex;
     trans_id := vartostr(gtbTransMaster.DataController.GetValue(rec_select, gtbTransMastertrans_id.Index));
     with dmDB do
          begin
               transDetail.Close;
               transDetail.SQL.Clear;
               transDetail.SQL.Add('select * from trans_detail where id_trans = ''' +
                                   trans_id + '''');
               transDetail.Open;
               gtbTransDetail.DataController.Refresh;
          end; }
end;

procedure TfrmMerger.btnSelectClick(Sender: TObject);
var
   recSelect, i, newRec : Integer;
   nama_customer, id_trans, referensi, jenisTrans : String;
   harga, point : Double;
begin
     {referensi := '';
     recSelect := gtbTransMaster.DataController.GetFocusedRecordIndex;
     id_trans := vartostr(gtbTransMaster.DataController.GetValue(recSelect, gtbTransMastertrans_id.Index));
     nama_customer := vartostr(gtbTransMaster.DataController.GetValue(recSelect, gtbTransMasternama.Index));
     with dmDB do
          begin
               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from trans_master where trans_id = ''' +
                               id_trans + '''');
               qryCari.Open;
               if (qryCari.Fields[15].AsString = 'Y') then
                   begin
                        referensi := 'ISI NO KTM DI SINI'; 
                   end;

               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from trans_detail where id_trans = ''' +
                                 id_trans + '''');
               qrySearch.Open;
               qrySearch.First;
               for i:=0 to qrySearch.RecordCount-1 do
                   begin
                        with frmPelunasan do
                             begin
                                  harga := qrySearch.Fields[11].AsFloat;
                                  point := harga / 10000;
                                  edReferansi.Text := referensi;
                                  jenisTrans := qrySearch.Fields[3].AsString;
                                  if (jenisTrans = 'BG') then
                                      begin
                                           point := 0;
                                      end;
                                      
                                  edNamaCustomerPayment.Text := nama_customer;
                                  newRec := gtvPayment.DataController.InsertRecord(gtvPayment.DataController.RecordCount);
                                  gtvPayment.DataController.SetValue(newRec, gtvPaymentTransID.Index, id_trans);
                                  gtvPayment.DataController.SetValue(newRec, gtvPaymentTransType.Index, qrySearch.Fields[3].AsString);
                                  gtvPayment.DataController.SetValue(newRec, gtvPaymentNamaJasa.Index, qrySearch.Fields[5].AsString);
                                  gtvPayment.DataController.SetValue(newRec, gtvPaymentSubtotal.Index, qrySearch.Fields[11].AsFloat);
                                  gtvPayment.DataController.SetValue(newRec, gtvPaymentTherapistID.Index, qrySearch.Fields[12].AsString);
                                  gtvPayment.DataController.SetValue(newRec, gtvPaymentRoomID.Index, qrySearch.Fields[13].AsString);
                                  gtvPayment.DataController.SetValue(newRec, gtvPaymentQty.Index, qrySearch.Fields[14].AsFloat);
                                  gtvPayment.DataController.SetValue(newRec, gtvPaymentNama.Index, qryCari.Fields[5].AsString);
                                  gtvPayment.DataController.SetValue(newRec, gtvPaymentHarga.Index, qrySearch.Fields[8].AsFloat);
                                  gtvPayment.DataController.SetValue(newRec, gtvPaymentPoint.Index, point);
                                  gtvPayment.DataController.PostEditingData;
                                  gtvPayment.DataController.Post;

                             end;
                        qrySearch.Next;
                   end;
          end;
     //frmPelunasan.edIDCustomerPayment.SetFocus;
     Close;}
end;

procedure TfrmMerger.ApplicationEvents1ShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
     {if (Msg.CharCode = Ord('M')) and (GetKeyState(VK_SHIFT) < 0) then
         begin
              cxGrid1.SetFocus;
              gtbTransMaster.DataController.GotoFirst;
              Handled := True;
         end;}
end;

end.
