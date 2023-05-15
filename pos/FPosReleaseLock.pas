unit FPosReleaseLock;

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
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, MemDS, DBAccess, MyAccess, Vcl.Menus, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxButtons;

type
  TfrmPosReleaseLock = class(TForm)
    Label1: TLabel;
    qryLock: TMyQuery;
    dsQryLock: TDataSource;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListtrans_id: TcxGridDBColumn;
    gtbListnama_customer: TcxGridDBColumn;
    gtbListroom_id: TcxGridDBColumn;
    gtbListtherapist_id: TcxGridDBColumn;
    btnRefreshData: TcxButton;
    edSekarang: TcxDateEdit;
    gtbListcabang: TcxGridDBColumn;
    btnRelase: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRefreshDataClick(Sender: TObject);
    procedure btnRelaseClick(Sender: TObject);
  private
    { Private declarations }
    qryExec, qryCari : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmPosReleaseLock: TfrmPosReleaseLock;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmPosReleaseLock.btnRefreshDataClick(Sender: TObject);
begin
  qryLock.Close;
  qryLock.SQL.Clear;
  qryLock.SQL.Add('select trans_id, nama_customer, room_id, therapist_id, cabang from trans_master ' +
       'where promo = ''' + 'L' + ''' ' +
       'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', edSekarang.Date) + '''');
  qryLock.Open;
  gtbList.DataController.Refresh;
end;

procedure TfrmPosReleaseLock.btnRelaseClick(Sender: TObject);
var
   recSel : Integer;
   KodeTrans : String;
begin
   recSel := gtbList.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   KodeTrans := VarToStr(gtbList.DataController.GetValue(recSel,gtbListtrans_id.Index));

   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'promo = ''' + 'S' + ''' ' +
       'where trans_id = ''' + KodeTrans + ''';');
   qryExec.ExecSQL;
   ShowMessage('Release Lock Finish');
   btnRefreshData.Click;
end;

procedure TfrmPosReleaseLock.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryExec.Free;
   qryCari.Free;
   Action := caFree;
end;

procedure TfrmPosReleaseLock.FormCreate(Sender: TObject);
begin
   qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

    qryCari := TMyQuery.Create(Self);
    qryCari.Connection := DMDB.dbInternal;
    qryCari.SQL.Add('select * from temptable');
    qryCari.Active := true;

    qryCari.Close;
    qryCari.SQL.Clear;
    qryCari.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
    qryCari.Open;
    edSekarang.Date := qryCari.Fields[0].AsDateTime;
end;

end.
