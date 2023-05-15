unit FReportPosMaster;

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
  cxGrid, Vcl.Menus, cxButtons, DateUtils, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, MemDS,
  DBAccess, MyAccess, cxCalc, ShellApi, cxGridExportLink, cxMemo, cxDBEdit;

type
  TfrmReportPoSMaster = class(TForm)
    Label1: TLabel;
    gtbDayli: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    dsQryList: TMyDataSource;
    qryList: TMyQuery;
    dlgSave: TSaveDialog;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    gtbDaylitrans_id: TcxGridDBColumn;
    gtbDaylistatus_trans: TcxGridDBColumn;
    gtbDaylitanggal: TcxGridDBColumn;
    gtbDaylistart_time: TcxGridDBColumn;
    gtbDayliend_time: TcxGridDBColumn;
    gtbDaylinama_customer: TcxGridDBColumn;
    gtbDayliroom_id: TcxGridDBColumn;
    gtbDaylitherapist_id: TcxGridDBColumn;
    gtbDaylilama: TcxGridDBColumn;
    gtbDaylisubtotal: TcxGridDBColumn;
    gtbDaylinotes: TcxGridDBColumn;
    gtbDaylitaked: TcxGridDBColumn;
    gtbDayligender: TcxGridDBColumn;
    cxDBMemo1: TcxDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxDBMemo1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportPoSMaster: TfrmReportPoSMaster;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmReportPoSMaster.cxButton1Click(Sender: TObject);
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

procedure TfrmReportPoSMaster.cxButton2Click(Sender: TObject);
begin
  qryList.Close;
  qryList.SQL.Clear;
  qryList.SQL.Add('select * from trans_master ' +
      'WHERE tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND tanggal <= ''' +
      FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');

      {qryList.SQL.Add('select id_trans, tanggal, trans_type_id, produk_jasa_id, produk_jasa_nama, ' +
      'harga, disc_percent, subtotal, teraphist_id, room_id, quantity, aroma, lama, ' +
      'nama_customer, cabang, taked, (select main_menu.jenis_jasa_id from main_menu where ' +
      'main_menu.menu_id = trans_detail.produk_jasa_id) as jenis_detail FROM trans_detail ' +
      'WHERE tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND tanggal <= ''' +
      FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''' AND taked = ''' + 'F' + ''''); }

  qryList.Open;
  gtbDayli.DataController.Refresh;
end;

procedure TfrmReportPoSMaster.cxDBMemo1PropertiesChange(Sender: TObject);
begin
   //
end;

procedure TfrmReportPoSMaster.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmReportPoSMaster.FormCreate(Sender: TObject);
begin
   edStart.Date := Date;
   edEnd.Date := Date;
   qryList.Active := True;
   gtbDayli.DataController.Refresh;
end;

end.
