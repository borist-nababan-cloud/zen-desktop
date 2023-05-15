unit FlapTransDrivers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, StdCtrls,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTimeEdit, cxCalc, Menus, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinsdxBarPainter, dxBarSkinnedCustForm, dxSkinsdxRibbonPainter, dxPSCore,
  dxPScxCommon, cxGridExportLink, ShellApi, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxNavigator, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TfrmLapTransDrivers = class(TForm)
    gtbTransDrivers: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label5: TLabel;
    Label1: TLabel;
    edStart: TcxDateEdit;
    Label2: TLabel;
    edEnd: TcxDateEdit;
    gtbTransDriversid_trans_driver: TcxGridDBColumn;
    gtbTransDriverstanggal: TcxGridDBColumn;
    gtbTransDriverswaktu: TcxGridDBColumn;
    gtbTransDriversid_drivers: TcxGridDBColumn;
    gtbTransDriversnama_drivers: TcxGridDBColumn;
    gtbTransDriverstotal_items: TcxGridDBColumn;
    gtbTransDriverssubtotal: TcxGridDBColumn;
    gtbTransDriversfee_value: TcxGridDBColumn;
    gtbTransDriverstotal_fee: TcxGridDBColumn;
    btnLoad: TButton;
    btnPrint: TButton;
    btnExport: TButton;
    PopupMenu1: TPopupMenu;
    RePrintReceipt1: TMenuItem;
    gtbTransDriversnopol_driver: TcxGridDBColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    PrintGrid: TdxGridReportLink;
    dlgSave: TSaveDialog;
    procedure RePrintReceipt1Click(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapTransDrivers: TfrmLapTransDrivers;

implementation

{$R *.dfm}

uses FdmDB, FPrintDriversTrans;

procedure TfrmLapTransDrivers.btnExportClick(Sender: TObject);
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

procedure TfrmLapTransDrivers.btnLoadClick(Sender: TObject);
begin
     with dmDB do
          begin
               qryTransDrivers.Close;
               qryTransDrivers.SQL.Clear;
               qryTransDrivers.SQL.Add('select * , (select ben_master_drivers.nopol_mobil ' +
                                       'from ben_master_drivers where ben_drivers_trans_master.id_drivers = ben_master_drivers.id_drivers) ' +
                                       'as nopol_driver from ben_drivers_trans_master ' +
                                       'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' and tanggal <= ''' +
                                       FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
               qryTransDrivers.Open;
               gtbTransDrivers.DataController.Refresh;
          end;
end;

procedure TfrmLapTransDrivers.btnPrintClick(Sender: TObject);
begin
     PrintGrid.Preview(True);
end;

procedure TfrmLapTransDrivers.FormCreate(Sender: TObject);
begin
     edStart.Date := Date;
     edEnd.Date := Date;
end;

procedure TfrmLapTransDrivers.RePrintReceipt1Click(Sender: TObject);
var
   recSelect : Integer;
   tanggal, waktu : TDate;
   idTrans, idDrivers, noPol, namaDriver : String;
   subTotal, Items : Double;
begin
     recSelect := gtbTransDrivers.DataController.GetFocusedRecordIndex;
     idTrans := vartostr(gtbTransDrivers.DataController.GetValue(recSelect, gtbTransDriversid_trans_driver.Index));
     idDrivers := vartostr(gtbTransDrivers.DataController.GetValue(recSelect, gtbTransDriversid_drivers.Index));
     namaDriver := vartostr(gtbTransDrivers.DataController.GetValue(recSelect, gtbTransDriversnama_drivers.Index));
     noPol := vartostr(gtbTransDrivers.DataController.GetValue(recSelect, gtbTransDriversnopol_driver.Index));
     subTotal := gtbTransDrivers.DataController.GetValue(recSelect, gtbTransDriverstotal_fee.Index);
     Items := gtbTransDrivers.DataController.GetValue(recSelect, gtbTransDriverstotal_items.Index);
     tanggal := VarToDateTime(gtbTransDrivers.DataController.GetValue(recSelect, gtbTransDriverstanggal.Index));
     waktu := VarToDateTime(gtbTransDrivers.DataController.GetValue(recSelect, gtbTransDriverswaktu.Index));
     Application.CreateForm(TfrmPintDriversTrans, frmPintDriversTrans);
     //frmPintDriversTrans.QlblBarcode.Barcode := idTrans;
     frmPintDriversTrans.QlblTransID.Caption := idTrans;
     frmPintDriversTrans.QlblDriverID.Caption := idDrivers;
     frmPintDriversTrans.QlblNama.Caption := namaDriver;
     frmPintDriversTrans.QlblNopol.Caption := noPol;
     frmPintDriversTrans.QlblSubtotal.Caption := FormatFloat('#,#.#', subTotal);
     frmPintDriversTrans.QlblItems.Caption := FormatFloat('#,#.#', items);
     frmPintDriversTrans.QlblTanggal.Caption := FormatDateTime('dd MMMM yyyy', tanggal) + ' ' +
                                                          FormatDateTime('hh:mm:ss', waktu);

     frmPintDriversTrans.qrpCetak.Preview;
end;

end.
