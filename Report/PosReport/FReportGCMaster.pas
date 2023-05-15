unit FReportGCMaster;

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
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxTextEdit, cxCalc,
  Vcl.Menus, cxButtons, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  DBAccess, MyAccess, MemDS;

type
  TfrmReportGCMaster = class(TForm)
    Label1: TLabel;
    qryMaster: TMyQuery;
    dsQryMaster: TMyDataSource;
    cxGrid1: TcxGrid;
    gtbMaster: TcxGridDBTableView;
    gtbMasterpaket_number: TcxGridDBColumn;
    gtbMastertanggal: TcxGridDBColumn;
    gtbMasterexpired_date: TcxGridDBColumn;
    gtbMasterharga_jual: TcxGridDBColumn;
    gtbMastertotal_items: TcxGridDBColumn;
    gtbMasteraktif: TcxGridDBColumn;
    gtbMasterterjual: TcxGridDBColumn;
    gtbMasternotes: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    btnViewDelete: TcxButton;
    btnViewActive: TcxButton;
    btnViewNonActive: TcxButton;
    procedure btnViewDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnViewActiveClick(Sender: TObject);
    procedure btnViewNonActiveClick(Sender: TObject);
  private
    { Private declarations }
    qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmReportGCMaster: TfrmReportGCMaster;

implementation

{$R *.dfm}

uses FMain, FdmDB;

procedure TfrmReportGCMaster.btnViewActiveClick(Sender: TObject);
begin
   qryMaster.Close;
   qryMaster.SQL.Clear;
   qryMaster.SQL.Add('select * from gc_master where aktif = ''' + 'Y' + '''');
   qryMaster.Open;
   gtbMaster.DataController.Refresh;
end;

procedure TfrmReportGCMaster.btnViewDeleteClick(Sender: TObject);
begin
   qryMaster.Close;
   qryMaster.SQL.Clear;
   qryMaster.SQL.Add('select * from gc_master where aktif = ''' + 'D' + '''');
   qryMaster.Open;
   gtbMaster.DataController.Refresh;
end;

procedure TfrmReportGCMaster.btnViewNonActiveClick(Sender: TObject);
begin
   qryMaster.Close;
   qryMaster.SQL.Clear;
   qryMaster.SQL.Add('select * from gc_master where aktif = ''' + 'N' + '''');
   qryMaster.Open;
   gtbMaster.DataController.Refresh;
end;

procedure TfrmReportGCMaster.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmReportGCMaster.FormCreate(Sender: TObject);
begin
   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qryMaster.Active := True;
end;

end.
