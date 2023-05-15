unit FLaporanDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, MemDS, DBAccess,
  MyAccess, Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridExportLink, ShellApi,
  cxCalc;

type
  TfrmLaporanDetail = class(TForm)
    edStart: TcxDateEdit;
    cxLabel1: TcxLabel;
    edEnd: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxGrid1: TcxGrid;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    btnLoad: TcxButton;
    cxButton1: TcxButton;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    dlgSave: TSaveDialog;
    gtbListautonum: TcxGridDBColumn;
    gtbListpkbnumber: TcxGridDBColumn;
    gtbListtglmasuk: TcxGridDBColumn;
    gtbListwaktumasuk: TcxGridDBColumn;
    gtbListtypedetail: TcxGridDBColumn;
    gtbListkodedetail: TcxGridDBColumn;
    gtbListnamadetail: TcxGridDBColumn;
    gtbListjumlah: TcxGridDBColumn;
    gtbListsatuan: TcxGridDBColumn;
    gtbListharga: TcxGridDBColumn;
    gtbListdiscount: TcxGridDBColumn;
    gtbListsubtotal: TcxGridDBColumn;
    gtbListkodecharge: TcxGridDBColumn;
    gtbListisdelete: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    gtbListColumn1: TcxGridDBColumn;
    procedure btnLoadClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gtbListtypedetailGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaporanDetail: TfrmLaporanDetail;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmLaporanDetail.btnLoadClick(Sender: TObject);
begin
   qryList.Close;
   qryList.SQL.Clear;
   qryList.SQL.Add('select ben_bengkel_pkb_detail.*  FROM ben_bengkel_pkb_detail ' +
        'WHERE ben_bengkel_pkb_detail.tglmasuk >= ''' +
        FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND ben_bengkel_pkb_detail.tglmasuk <= ''' +
        FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''' AND isdelete = ''' + 'N' + ''' ' +
        'ORDER BY ben_bengkel_pkb_detail.pkbnumber ASC');
   qryList.Open;
   gtbList.DataController.Refresh;
end;

procedure TfrmLaporanDetail.cxButton1Click(Sender: TObject);
begin
  dlgSave.Title := '[Excel 97-2003] Export to...';
     dlgSave.Filter := 'Microsoft Excel 97-2003 (*.xls)|*.xls';
     dlgSave.FileName := '';
     if (dlgSave.Execute) then
        begin
             if (dlgSave.FileName <> '') then
                begin
                     ExportGridToExcel(dlgSave.FileName, cxGrid1, true, true, true, 'xls');
                     if (MessageDlg('Would you like to open exported file now?',
                         mtConfirmation, mbOKCancel, 0) = mrOK) then
                         begin
                              if (ExtractFileExt(dlgSave.FileName) = '.xls') then
                                 ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                              else
                                  ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName + '.xls'), pChar(''), pChar(ExtractFileDir(dlgSave.FileName + '.xls')), SW_MAXIMIZE)
                         end
                     else exit;
                end
             else exit;
        end
     else exit;
end;

procedure TfrmLaporanDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmLaporanDetail.FormCreate(Sender: TObject);
begin
  qryList.Active := True;
  gtbList.DataController.Refresh;
  edStart.Date := Date;
  edEnd.Date := Date;
end;

procedure TfrmLaporanDetail.gtbListtypedetailGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
    if (AText = 'J') then AText := 'JASA'
    else if (AText = 'J') then AText := 'JASA'
    else if (AText = 'B') then AText := 'BAHAN'
    else if (AText = 'O') then AText := 'OPL'
    else if (AText = 'S') then AText := 'SPAREPART';
end;

end.
