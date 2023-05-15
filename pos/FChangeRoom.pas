unit FChangeRoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator, MyAccess, DBAccess, MemDS;

type
  TfrmChangeRoom = class(TForm)
    gtbChangeRoom: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbChangeRoomruangan_id: TcxGridDBColumn;
    gtbChangeRoomlantai: TcxGridDBColumn;
    gtbChangeRoomnomor: TcxGridDBColumn;
    gtbChangeRoomjenis_jasa: TcxGridDBColumn;
    gtbChangeRoomnotes: TcxGridDBColumn;
    gtbChangeRoomkondisi: TcxGridDBColumn;
    gtbChangeRoomnama_cust: TcxGridDBColumn;
    gtbChangeRoomstart_time: TcxGridDBColumn;
    gtbChangeRoomend_time: TcxGridDBColumn;
    gtbChangeRoomtherapist_id: TcxGridDBColumn;
    gtbChangeRoomtrans_id: TcxGridDBColumn;
    gtbChangeRoomstatus: TcxGridDBColumn;
    cxButton5: TcxButton;
    qryChangeRoom: TMyQuery;
    dsQryChangeRoom: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
  private
    { Private declarations }
    qryUpdate : TMyQuery;
  public
    ROOM_LAMA, ID_THERAPIST, TRANS_ID : String;
    { Public declarations }
  end;

var
  frmChangeRoom: TfrmChangeRoom;

implementation

uses FDMDB, FPos;

{$R *.dfm}

procedure TfrmChangeRoom.FormCreate(Sender: TObject);
begin
     //with dmDB do
end;

procedure TfrmChangeRoom.cxButton5Click(Sender: TObject);
var
   recSelect : Integer;
   id_ruangan : String;
begin
     recSelect := gtbChangeRoom.DataController.GetFocusedRecordIndex;
     id_ruangan := VarToStr(gtbChangeRoom.DataController.GetValue(recSelect, gtbChangeRoomruangan_id.Index));
     with dmDB do
          begin
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update ruangan set ' +
                                 'status = ''' + 'AVAILABLE' + ''', ' +
                                 'therapist_id = ''' + 'NONE' + ''', ' +
                                 'trans_id = ''' + 'NONE' + ''' ' +
                                 'where ruangan_id = ''' + ROOM_LAMA + '''');
               qryUpdate.ExecSql;
               {
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update ruangan set ' +
                                 'status = ''' + 'AVAILABLE' + ''', ' +
                                 'therapist_id = ''' + 'NONE' + ''', ' +
                                 'trans_id = ''' + 'NONE' + ''' ' +
                                 'where ruangan_id = ''' + ROOM_LAMA + '''');
               qryUpdate.ExecSql;

               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update ruangan set ' +
                                 'status = ''' + 'IN ORDER' + ''', ' +
                                 'therapist_id = ''' + ID_THERAPIST + ''', ' +
                                 'trans_id = ''' + TRANS_ID + ''' ' +
                                 'where ruangan_id = ''' + id_ruangan + '''');
               qryUpdate.ExecSql;

               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update available_tr set ' +
                                 'room_id = ''' + id_ruangan + ''' ' +
                                 'where id_therapist = ''' + ID_THERAPIST + '''');
               qryUpdate.ExecSql;

               Sleep(10);
               }
               frmPos.edIDRoomPos.Text := id_ruangan;


          end;

     Close;
end;

end.
