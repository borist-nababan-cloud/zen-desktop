unit BuyAdditional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridLevel, cxGrid, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, AppEvnts, StrUtils,
  cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmBuyAdditional = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbAdditional: TcxGridDBBandedTableView;
    gtbAdditionalid_add: TcxGridDBBandedColumn;
    gtbAdditionaljenis_jasa: TcxGridDBBandedColumn;
    gtbAdditionalnama_add: TcxGridDBBandedColumn;
    gtbAdditionalwaktu: TcxGridDBBandedColumn;
    gtbAdditionalharga: TcxGridDBBandedColumn;
    btnSelect: TcxButton;
    lblPaket: TLabel;
    ApplicationEvents1: TApplicationEvents;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure ApplicationEvents1ShortCut(var Msg: TWMKey;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_TR, ID_ROOM : String;
  end;

var
  frmBuyAdditional: TfrmBuyAdditional;

implementation

uses FDMDB, FPos;

{$R *.dfm}

procedure TfrmBuyAdditional.FormCreate(Sender: TObject);
begin
     //with dmDB do
end;

procedure TfrmBuyAdditional.btnSelectClick(Sender: TObject);
var
   rec_select, newRec : Integer;
   id_jasa, nama_jasa,add_lulur : String;
   harga, lama, discount, subtotal : Double;
begin
     rec_select := gtbAdditional.DataController.GetFocusedRecordIndex;
     id_jasa := vartostr(gtbAdditional.DataController.GetValue(rec_select, gtbAdditionalid_add.Index));
     nama_jasa := vartostr(gtbAdditional.DataController.GetValue(rec_select, gtbAdditionalnama_add.Index));
     harga := gtbAdditional.DataController.GetValue(rec_select, gtbAdditionalharga.Index);
     lama := gtbAdditional.DataController.GetValue(rec_select, gtbAdditionalwaktu.Index);

     with dmDB do
          begin
               add_lulur := Copy(Trim(nama_jasa),1,5);
               
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from paket where paket_id = ''' +
                                lblPaket.Caption + '''');
               qrySearch.Open;
               discount := qrySearch.Fields[4].AsFloat;
               if (lama = 0) then
                   begin
                        discount := 0;
                   end;
               if((id_jasa = 'ADDFMKR15') or (id_jasa = 'FM30')) then
                   begin
                        discount := 0;
                   end
               else
               if(add_lulur = 'LULUR') then
                  begin
                      discount :=0;
                  end;

               


               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from holiday_date where tanggal_mulai = ''' +
                               FormatDateTime('yyyy-MM-dd', Date) + '''');
               qryCari.Open;
               qryCari.First;
               if (NOT qryCari.IsEmpty) then
                   begin
                        discount := 0;
                   end;

          end;
          subtotal := harga - (discount / 100 * harga);
          with frmPos do
               begin
                    newRec := gtvDetail.DataController.InsertRecord(gtvDetail.DataController.RecordCount);
                    gtvDetail.DataController.SetValue(newRec, gtvDetailTransType.Index, 'BA');
                    gtvDetail.DataController.SetValue(newRec, gtvDetailIDJasa.Index, id_jasa);
                    gtvDetail.DataController.SetValue(newRec, gtvDetailNamaJasa.Index, nama_jasa);
                    gtvDetail.DataController.SetValue(newRec, gtvDetailStart.Index, '00:00:01');
                    gtvDetail.DataController.SetValue(newRec, gtvDetailEnd.Index, '00:00:01' );
                    gtvDetail.DataController.SetValue(newRec, gtvDetailDiscPercent.Index, discount);
                    gtvDetail.DataController.SetValue(newRec, gtvDetailDiscFB.Index, 0);
                    gtvDetail.DataController.SetValue(newRec, gtvDetailSubtotal.Index, subtotal);
                    gtvDetail.DataController.SetValue(newRec, gtvDetailTherapist.Index, id_tr);
                    gtvDetail.DataController.SetValue(newRec, gtvDetailRoom.Index, id_room);
                    gtvDetail.DataController.SetValue(newRec, gtvDetailAroma.Index, 'NONE');
                    gtvDetail.DataController.SetValue(newRec, gtvDetailQty.Index, 1);
                    gtvDetail.DataController.SetValue(newRec, gtvDetailHarga.Index, harga);
                    gtvDetail.DataController.SetValue(newRec, gtvDetailLama.Index, lama);
                    gtvDetail.DataController.PostEditingData;
                    gtvDetail.DataController.Post;
                    //edIDRoomPos.Text := edRoomID.Text;
               end;
     Close;
end;

procedure TfrmBuyAdditional.ApplicationEvents1ShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
     {if (Msg.CharCode = Ord('S')) and (GetKeyState(VK_SHIFT) < 0) then
         begin
              btnSelect.Click;
              Handled := True;
         end; }
end;

end.
