unit FHistoryPKB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinXmas2008Blue, Vcl.Menus, cxButtons, cxTextEdit, cxLabel, cxGroupBox,
  Data.DB, DBAccess, MyAccess, MemDS, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxMemo, cxDBEdit,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmHistoryPKB = class(TForm)
    gbSearch: TcxGroupBox;
    cxLabel1: TcxLabel;
    edNopolTengah: TcxTextEdit;
    edNopolBelakang: TcxTextEdit;
    btnCari: TcxButton;
    edNopolDepan: TcxTextEdit;
    cxLabel5: TcxLabel;
    edTypeMobil: TcxLookupComboBox;
    cxLabel6: TcxLabel;
    edWarnaMobil: TcxTextEdit;
    cxLabel7: TcxLabel;
    edTahunMobil: TcxTextEdit;
    tblJenis: TMyTable;
    dsTbljenis: TMyDataSource;
    cxLabel2: TcxLabel;
    edKodeKonsumen: TcxTextEdit;
    cxLabel3: TcxLabel;
    edNamaKonsumen: TcxTextEdit;
    cxLabel4: TcxLabel;
    edPlatNomor: TcxTextEdit;
    qryMaster: TMyQuery;
    dsQryMaster: TMyDataSource;
    dsQryDetails: TMyDataSource;
    gtbMaster: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2: TcxGrid;
    gtbDetails: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    memoKeluhan: TcxDBMemo;
    gtbMasterpkbnumber: TcxGridDBColumn;
    gtbMastertglmasuk: TcxGridDBColumn;
    gtbMasterwaktumasuk: TcxGridDBColumn;
    gtbMasterkeluhan: TcxGridDBColumn;
    gtbMasterkilometer: TcxGridDBColumn;
    gtbDetailspkbnumber: TcxGridDBColumn;
    gtbDetailstypedetail: TcxGridDBColumn;
    gtbDetailskodedetail: TcxGridDBColumn;
    gtbDetailsnamadetail: TcxGridDBColumn;
    gtbDetailsjumlah: TcxGridDBColumn;
    gtbDetailssatuan: TcxGridDBColumn;
    gtbDetailskodecharge: TcxGridDBColumn;
    qryDetails: TMyTable;
    btnDelete: TcxButton;
    cxLabel8: TcxLabel;
    procedure btnCariClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoryPKB: TfrmHistoryPKB;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmHistoryPKB.btnCariClick(Sender: TObject);
var
   noPol : String;
begin
   noPol := edNopolDepan.Text + ' ' + edNopolTengah.Text + ' ' + UpperCase(edNopolBelakang.Text);
end;

procedure TfrmHistoryPKB.btnDeleteClick(Sender: TObject);
begin
   frmHistoryPKB.Close;
end;

procedure TfrmHistoryPKB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
