unit FLapBankTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, dxBarSkinnedCustForm,
  dxSkinsdxRibbonPainter, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxPSCore, dxPScxCommon, cxButtons,
  cxTextEdit, cxMaskEdit, cxCalendar, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  DBAccess, cxCalc, cxGridExportLink, ShellApi, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, MyAccess, MemDS;

type
  TfrmLapBankTrans = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    btnCari: TcxButton;
    btnExport: TcxButton;
    btnPrint: TcxButton;
    dxComponentPrinter1: TdxComponentPrinter;
    printGrid: TdxGridReportLink;
    dlgSave: TSaveDialog;
    pmOption: TPopupMenu;
    Expan1: TMenuItem;
    Collapse1: TMenuItem;
    edTypeKas: TcxLookupComboBox;
    Label3: TLabel;
    tblBank: TMyQuery;
    dsTblBank: TDataSource;
    tblCoa: TMyTable;
    dsblCoa: TDataSource;
    gtbTrans: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    qryTrans: TMyQuery;
    dsQryTrans: TDataSource;
    gtbTransautonum: TcxGridDBColumn;
    gtbTransid_transaksi: TcxGridDBColumn;
    gtbTranskodekas: TcxGridDBColumn;
    gtbTransidoutlet: TcxGridDBColumn;
    gtbTranstanggal: TcxGridDBColumn;
    gtbTransno_kas: TcxGridDBColumn;
    gtbTransid_coa: TcxGridDBColumn;
    gtbTransketerangan: TcxGridDBColumn;
    gtbTranssubtotal: TcxGridDBColumn;
    gtbTransstatus: TcxGridDBColumn;
    gtbTransno_reff: TcxGridDBColumn;
    gtbTranslastuseredit: TcxGridDBColumn;
    gtbTranslasteditdate: TcxGridDBColumn;
    tblOutlet: TMyTable;
    dsTblOutlet: TDataSource;
    gtbTransNamaCoa: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnCariClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapBankTrans: TfrmLapBankTrans;

implementation

{$R *.dfm}

uses FdmDB,FMenuMain;

procedure TfrmLapBankTrans.btnCariClick(Sender: TObject);
begin
  qryTrans.Close;
  qryTrans.SQL.Clear;
  qryTrans.SQL.Add('select * from ben_trans_bank_detail where ' +
        'kodebank = ''' + vartostr(edTypeKas.EditValue) + ''' AND tanggal >= ''' +
        FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND tanggal <= ''' +
        FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
  qryTrans.Open;
  gtbTrans.DataController.Refresh;
end;

procedure TfrmLapBankTrans.btnExportClick(Sender: TObject);
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

procedure TfrmLapBankTrans.btnPrintClick(Sender: TObject);
begin
  printGrid.Preview(False);
end;

procedure TfrmLapBankTrans.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edTypeKas.Clear;
  qryTrans.Active := False;
  tblBank.Active := False;
  tblOutlet.Active := False;
  tblCoa.Active := False;
  Action := caFree;
end;

procedure TfrmLapBankTrans.FormCreate(Sender: TObject);
begin
   edStart.Date := Date;
   edEnd.Date := Date;
   qryTrans.Active := True;
   tblBank.Active := True;
   tblBank.Close;
   tblBank.SQL.Clear;
   tblBank.SQL.Add('select kodebank from ben_master_bank where ' +
         'idoutlet = ''' + frmMenuMain.IDOUTLET + '''');
   tblBank.Open;
   tblCoa.Active := True;
   tblOutlet.Active := True;

end;

end.
