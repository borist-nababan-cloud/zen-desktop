unit FMasterKas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxDBLookupComboBox,
  cxTextEdit, cxCalendar, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  DBAccess, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, MemDS, MyAccess;

type
  TfrmMasterKas = class(TForm)
    Label4: TLabel;
    tblMasterKas: TMyTable;
    dsTblMasterKas: TDataSource;
    tblOtlet: TMyTable;
    dsTblOutlet: TDataSource;
    gtbKas: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbKasautonum: TcxGridDBColumn;
    gtbKasidoutlet: TcxGridDBColumn;
    gtbKaskodekas: TcxGridDBColumn;
    gtbKasnamakas: TcxGridDBColumn;
    gtbKaslastuseredit: TcxGridDBColumn;
    gtbKaslasteditdate: TcxGridDBColumn;
    gtbKasnotes: TcxGridDBColumn;
    btnNew: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
    qryKas1 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmMasterKas: TfrmMasterKas;

implementation

{$R *.dfm}

uses FdmDB, FMenuMain, FMasterKasAdd;

procedure TfrmMasterKas.btnNewClick(Sender: TObject);
begin
  Application.CreateForm(TfrmMasterKasAdd, frmMasterKasAdd);
  frmMasterKasAdd.btnSimpan.Tag := 0;
  frmMasterKasAdd.Show;
end;

procedure TfrmMasterKas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryKas1.Free;
   tblMasterKas.Active := False;
   tblOtlet.Active := False;
   Action := caFree;
end;

procedure TfrmMasterKas.FormCreate(Sender: TObject);
begin
   qryKas1 := TMyQuery.Create(Self);
   qryKas1.Connection := DMDB.StoreDB;
   qryKas1.SQL.Add('select * from temptable');
   qryKas1.Active := true;
   tblOtlet.Active := True;
   tblMasterKas.Active := True;
   gtbKas.DataController.Refresh;
end;

end.
