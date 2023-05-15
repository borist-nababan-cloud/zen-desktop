unit FBrowseTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridBandedTableView, cxGridDBBandedTableView,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxDBLookupComboBox, cxTimeEdit, cxCalc, AppEvnts, cxLookAndFeels, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator, DBAccess, MyAccess, MemDS;

type
  TfrmBrowseTrans = class(TForm)
    cxGrid1Level1: TcxGridLevel;
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
    cxGrid2Level1: TcxGridLevel;
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
    btnEdit: TcxButton;
    gtbTransMastertherapist_id: TcxGridDBBandedColumn;
    gtbTransMasterColumn1: TcxGridDBBandedColumn;
    ApplicationEvents1: TApplicationEvents;
    TransMaster: TMyQuery;
    dsTransMaster: TMyDataSource;
    transDetail: TMyQuery;
    dsTransDetail: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure gtbTransMasterCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure gtbTransMasterDblClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryFind : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmBrowseTrans: TfrmBrowseTrans;

implementation

uses FDMDB, FPos;

{$R *.dfm}

procedure TfrmBrowseTrans.FormCreate(Sender: TObject);
begin
     //with dmDB do
end;

procedure TfrmBrowseTrans.gtbTransMasterCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
   rec_select : Integer;
   trans_id   : String;
begin
     rec_select := gtbTransMaster.DataController.GetFocusedRecordIndex;
     trans_id := vartostr(gtbTransMaster.DataController.GetValue(rec_select, gtbTransMastertrans_id.Index));
     with dmDB do
          begin
               transDetail.Close;
               transDetail.SQL.Clear;
               transDetail.SQL.Add('select * from trans_detail where id_trans = ''' +
                                   trans_id + '''');
               transDetail.Open;
               gtbTransDetail.DataController.Refresh;
          end;


end;

procedure TfrmBrowseTrans.btnEditClick(Sender: TObject);
var
   rec_select, i, newRec : integer;
   trans_id : String;
begin
     rec_select := gtbTransMaster.DataController.GetFocusedRecordIndex;
     trans_id := vartostr(gtbTransMaster.DataController.GetValue(rec_select, gtbTransMastertrans_id.Index));

     qrySearch.Close;
     qrySearch.SQL.Clear;
     qrySearch.SQL.Add('select * from trans_master where trans_id = ''' +
                       trans_id + '''');
     qrySearch.Open;
     with frmPos do
          begin
               edTransID.Text := qrySearch.Fields[0].AsString;
               edTanggal.Date := qrySearch.Fields[2].AsDateTime;
               edWaktu.Time   := qrySearch.Fields[3].AsDateTime;
               edSelesai.Time := qrySearch.Fields[4].AsDateTime;
               edNamaCustomer.Text   := qrySearch.Fields[5].AsString;
               edIDRoomPos.Text   := qrySearch.Fields[6].AsString;
               edTherapistPos.Text   := qrySearch.Fields[7].AsString;
               edSubtotal.EditValue   := qrySearch.Fields[9].AsFloat;
               edLamaPos.EditValue := qrySearch.Fields[8].AsInteger;
               edGender.Text := qrySearch.Fields[14].AsString;
               edPaketPos.Text := qrySearch.Fields[10].AsString;
               edPromo.EditValue := qrySearch.Fields[15].AsVariant;
               gtvDetail.DataController.SelectAll;
               gtvDetail.DataController.DeleteSelection;
               qryFind.Close;
               qryFind.SQL.Clear;
               qryFind.SQL.Add('select * from trans_detail where id_trans = ''' +
                                  trans_id + '''');
               qryFind.Open;
               for i:=0 to qryFind.RecordCount-1 do
                   begin
                        newRec := gtvDetail.DataController.InsertRecord(gtvDetail.DataController.RecordCount);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailTransType.Index, qryFind.Fields[3].AsString);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailIDJasa.Index, qryFind.Fields[4].AsString);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailNamaJasa.Index, qryFind.Fields[5].AsString);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailStart.Index, qryFind.Fields[6].AsDateTime);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailEnd.Index, qryFind.Fields[7].AsDateTime);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailDiscPercent.Index, qryFind.Fields[10].AsFloat);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailDiscFB.Index, qryFind.Fields[9].AsFloat);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailSubtotal.Index, qryFind.Fields[11].AsFloat);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailTherapist.Index, qryFind.Fields[12].AsString);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailRoom.Index, qryFind.Fields[13].AsString);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailAroma.Index, qryFind.Fields[15].AsString);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailQty.Index, qryFind.Fields[14].AsFloat);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailHarga.Index, qryFind.Fields[8].AsFloat);
                        gtvDetail.DataController.SetValue(newRec, gtvDetailLama.Index, qryFind.Fields[16].AsFloat);
                        gtvDetail.DataController.PostEditingData;
                        gtvDetail.DataController.Post;
                        qryFind.Next;
                   end;

          end;

     Close;
end;

procedure TfrmBrowseTrans.gtbTransMasterDblClick(Sender: TObject);
begin
     btnEdit.Click;
end;

end.
