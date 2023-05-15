unit FLaporanTherapistReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.StdCtrls,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridCustomView, cxGridCustomTableView,
  cxGridCustomLayoutView, cxGridCardView, cxGridDBCardView, cxClasses,
  cxGridLevel, cxGrid, MemDS, DBAccess, MyAccess, dxRatingControl, cxCalc,
  Vcl.Menus, cxButtons, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  dxPSCore, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxCommon;

type
  TfrmLaporanTherapistReport = class(TForm)
    Label4: TLabel;
    edPeriode: TcxComboBox;
    lblJudulAtas: TLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbRapor: TcxGridDBCardView;
    qryList: TMyQuery;
    dsQryList: TMyDataSource;
    gtbRaporkodereport: TcxGridDBCardViewRow;
    gtbRaporkodekaryawan: TcxGridDBCardViewRow;
    gtbRaporidkaryawan: TcxGridDBCardViewRow;
    gtbRapornilai: TcxGridDBCardViewRow;
    gtbRaporstatus: TcxGridDBCardViewRow;
    gtbRaporcatatan: TcxGridDBCardViewRow;
    gtbRapornama: TcxGridDBCardViewRow;
    gtbRaporNilai2: TcxGridDBCardViewRow;
    cxButton1: TcxButton;
    dxComponentPrinter1: TdxComponentPrinter;
    cetakReport: TdxGridReportLink;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gtbRaporstatusGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    qryCari : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmLaporanTherapistReport: TfrmLaporanTherapistReport;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmLaporanTherapistReport.cxButton1Click(Sender: TObject);
begin
   qryList.Close;
   qryList.SQL.Clear;
   qryList.SQL.Add('SELECT kodereport, kodekaryawan, idkaryawan, nilai, status, ' +
       'catatan, (select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan_info ' +
       'where ben_hrd_karyawan_info.kodekaryawan = ben_report_master.kodekaryawan) as nama ' +
       'FROM ben_report_master WHERE ben_report_master.kodereport = ''' + edPeriode.Text + '''');
   qryList.Open;
   gtbRapor.DataController.Refresh;
end;

procedure TfrmLaporanTherapistReport.cxButton2Click(Sender: TObject);
begin
   cetakReport.Preview(True);
end;

procedure TfrmLaporanTherapistReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCari.Free;
  Action := caFree;
end;

procedure TfrmLaporanTherapistReport.FormCreate(Sender: TObject);
var
  i : Integer;
begin
   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select kodereport from ben_report_periode order by kodereport DESC');
   qryCari.Open;
   qryCari.First;
   for i := 0 to qryCari.RecordCount-1 do
     begin
       edPeriode.Properties.Items.Add(qryCari.Fields[0].AsString);
       qryCari.Next;
     end;
   qryList.Active := True;
   gtbRapor.DataController.Refresh;
end;

procedure TfrmLaporanTherapistReport.gtbRaporstatusGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
   if (AText = 'M') then AText := 'Medium'
   else if (AText = 'S') then AText := 'Strong';
end;

end.
