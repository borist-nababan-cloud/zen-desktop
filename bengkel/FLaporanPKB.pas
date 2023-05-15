unit FLaporanPKB;

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
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxTextEdit,
  cxDBLookupComboBox, cxCalendar, cxTimeEdit, cxCalc, Vcl.Menus, DBAccess,
  MyAccess, MemDS, Vcl.StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxLabel, cxMaskEdit, cxDropDownEdit, cxGridExportLink, ShellApi, cxMemo;

type
  TfrmLaporanPKB = class(TForm)
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
    tblJenis: TMyTable;
    dsTbljenis: TMyDataSource;
    gtbListautonum: TcxGridDBColumn;
    gtbListpkbnumber: TcxGridDBColumn;
    gtbListtglmasuk: TcxGridDBColumn;
    gtbListwaktumasuk: TcxGridDBColumn;
    gtbListcustcode: TcxGridDBColumn;
    gtbListkeluhan: TcxGridDBColumn;
    gtbListkilometer: TcxGridDBColumn;
    gtbListtglselesai: TcxGridDBColumn;
    gtbListwaktuselesai: TcxGridDBColumn;
    gtbListnotes: TcxGridDBColumn;
    gtbListstatus: TcxGridDBColumn;
    gtbListisdelete: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    gtbListnopol: TcxGridDBColumn;
    gtbListnamacust: TcxGridDBColumn;
    gtbListkodetype: TcxGridDBColumn;
    gtbListtahun: TcxGridDBColumn;
    gtbListwarna: TcxGridDBColumn;
    gtbListnomesin: TcxGridDBColumn;
    gtbListnorangka: TcxGridDBColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaporanPKB: TfrmLaporanPKB;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmLaporanPKB.btnLoadClick(Sender: TObject);
begin
  qryList.Close;
  qryList.SQL.Clear;
  qryList.SQL.Add('select ben_bengkel_pkb.*, ' +
        '(select ben_bengkel_customer.nopol from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as nopol, ' +
        '(select ben_bengkel_customer.namacust from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as namacust, ' +
        '(select ben_bengkel_customer.kodetype from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as kodetype, ' +
        '(select ben_bengkel_customer.tahun from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as tahun, ' +
        '(select ben_bengkel_customer.warna from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as warna, ' +
        '(select ben_bengkel_customer.nomesin from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as nomesin, ' +
        '(select ben_bengkel_customer.norangka from ben_bengkel_customer where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as norangka ' +
        'from ben_bengkel_pkb WHERE ben_bengkel_pkb.tglmasuk >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND ben_bengkel_pkb.tglmasuk <= ''' +
        FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''' AND ben_bengkel_pkb.isdelete = ''' + 'N' + '''');
  qryList.Open;
  gtbList.DataController.Refresh;
end;

procedure TfrmLaporanPKB.cxButton1Click(Sender: TObject);
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

procedure TfrmLaporanPKB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmLaporanPKB.FormCreate(Sender: TObject);
begin
   qryList.Active := True;
   tblJenis.Active := True;
   gtbList.DataController.Refresh;
   edStart.Date := Date;
   edEnd.Date := Date;
end;

end.
