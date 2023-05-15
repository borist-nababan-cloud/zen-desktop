unit FAbsenHarian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, DBAccess, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGridExportLink, ShellApi, cxDBLookupComboBox, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinsdxBarPainter, dxBarSkinnedCustForm, dxSkinsdxRibbonPainter, dxPSCore,
  dxPScxCommon, dxPScxGrid6Lnk;

type
  TfrmAbsenHarian = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    btnSearch: TButton;
    qryReport: TMyQuery;
    dsQryReport: TDataSource;
    gtbReport: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbReportkodekaryawan: TcxGridDBColumn;
    gtbReportidkaryawan: TcxGridDBColumn;
    gtbReportidoutlet: TcxGridDBColumn;
    gtbReporttanggal: TcxGridDBColumn;
    gtbReportwaktu: TcxGridDBColumn;
    gtbReportnamakaryawan: TcxGridDBColumn;
    gtbReporttagatt: TcxGridDBColumn;
    tblOutlet: TMyTable;
    dsTblOutlet: TDataSource;
    btnExport: TButton;
    dlgSave: TSaveDialog;
    dxComponentPrinter1: TdxComponentPrinter;
    gridPrint: TdxGridReportLink;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbsenHarian: TfrmAbsenHarian;

implementation

{$R *.dfm}

uses FdmDB, FMenuMain;

procedure TfrmAbsenHarian.btnExportClick(Sender: TObject);
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

procedure TfrmAbsenHarian.btnSearchClick(Sender: TObject);
begin
  qryReport.Close;
  qryReport.SQL.Clear;
  qryReport.SQL.Add('select kodekaryawan, idkaryawan, idoutlet, tanggal, waktu, ' +
     'tagatt, (select hrd_karyawan_info.namakaryawan from hrd_karyawan_info ' +
     'where hrd_karyawan_info.kodekaryawan = att_log.kodekaryawan) as namakaryawan ' +
     'FROM att_log WHERE tanggal >= ''' + FormatDateTime('yyyy-MM-dd',edStart.Date) +
     ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd',edEnd.Date) + '''');
  qryReport.Open;
end;

procedure TfrmAbsenHarian.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryReport.Active := False;
  tblOutlet.Active := False;
  Action := caFree;
end;

procedure TfrmAbsenHarian.FormCreate(Sender: TObject);
begin
   qryReport.Active := True;
   tblOutlet.Active := True;
   edStart.Date := Date;
   edEnd.Date := Date;
end;

end.
