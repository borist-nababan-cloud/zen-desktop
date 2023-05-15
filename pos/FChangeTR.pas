unit FChangeTR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxCalc, cxCalendar, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxLookAndFeels, dxSkinsCore,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator, MyAccess, DBAccess, MemDS;

type
  TfrmChangeTR = class(TForm)
    gtbTR: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbTRid_therapist: TcxGridDBColumn;
    gtbTRdepartemen: TcxGridDBColumn;
    gtbTRnama: TcxGridDBColumn;
    gtbTRno_urut: TcxGridDBColumn;
    gtbTRtanggal: TcxGridDBColumn;
    gtbTRwaktu_masuk: TcxGridDBColumn;
    gtbTRstatus: TcxGridDBColumn;
    gtbTRstart_time: TcxGridDBColumn;
    gtbTRend_time: TcxGridDBColumn;
    gtbTRroom_id: TcxGridDBColumn;
    cxButton5: TcxButton;
    qryTherapist: TMyQuery;
    dsQryTherapist: TMyDataSource;
    procedure cxButton5Click(Sender: TObject);
  private
    { Private declarations }
    qryUpdate : TMyQuery;
  public
    { Public declarations }
    TR_LAMA, ROOM_ID : String;
  end;

var
  frmChangeTR: TfrmChangeTR;

implementation

uses FDMDB, FPos;

{$R *.dfm}

procedure TfrmChangeTR.cxButton5Click(Sender: TObject);
var
   recSelect : Integer;
   id_therapist : String;
begin
     recSelect := gtbTR.DataController.GetFocusedRecordIndex;
     id_therapist := VarToStr(gtbTR.DataController.GetValue(recSelect, gtbTRid_therapist.Index));

     qryUpdate.Sql.Clear;
     qryUpdate.Sql.Add('update available_tr set ' +
                       'start_time = ''' + '00:00:00' + ''', ' +
                       'end_time = ''' + '00:00:00' + ''', ' +
                       'status = ''' + 'AVAILABLE' + ''', ' +
                       'room_id = ''' + 'NONE' + ''' ' +
                       'where id_therapist = ''' + TR_LAMA + '''');
     qryUpdate.ExecSql;
     Sleep(10);

     frmPos.edTherapistPos.Text := id_therapist;

     Close;
end;

end.
