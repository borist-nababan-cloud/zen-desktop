unit FLapRekapAbsen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBLookupComboBox, ShellApi, cxGridExportLink, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  Vcl.ComCtrls, dxCore, cxDateUtils, MyAccess, MemDS;

type
  TfrmLapRekapAbsen = class(TForm)
    Label4: TLabel;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    tblTag: TMyTable;
    dsTblTag: TDataSource;
    gtbRepRekap: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    Label2: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    qryRepRekap: TMyQuery;
    dsQryRepRekap: TDataSource;
    gtbRepRekaptanggal: TcxGridDBColumn;
    gtbRepRekapkodekaryawan: TcxGridDBColumn;
    gtbRepRekapidkaryawan: TcxGridDBColumn;
    gtbRepRekapjadwalmasuk: TcxGridDBColumn;
    gtbRepRekapjadwalkeluar: TcxGridDBColumn;
    gtbRepRekapfpmasuk: TcxGridDBColumn;
    gtbRepRekapfpkeluar: TcxGridDBColumn;
    gtbRepRekaptagresult: TcxGridDBColumn;
    gtbRepRekapketerangan: TcxGridDBColumn;
    gtbRepRekaplastedituser: TcxGridDBColumn;
    gtbRepRekaplasteditdate: TcxGridDBColumn;
    gtbRepRekapnama: TcxGridDBColumn;
    gtbRepRekapdepartemen: TcxGridDBColumn;
    btnLoad: TButton;
    dlgSave: TSaveDialog;
    btnExport: TButton;
    procedure btnLoadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapRekapAbsen: TfrmLapRekapAbsen;

implementation

{$R *.dfm}

uses FdmDB, FMenuMain;

procedure TfrmLapRekapAbsen.btnExportClick(Sender: TObject);
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

procedure TfrmLapRekapAbsen.btnLoadClick(Sender: TObject);
begin
  qryRepRekap.Close;
  qryRepRekap.SQL.Clear;
  qryRepRekap.SQL.Add('select tanggal, kodekaryawan, idkaryawan, jadwalmasuk, ' +
     'jadwalkeluar, fpmasuk, fpkeluar, tagresult, keterangan, lastedituser, ' +
     'lasteditdate, (select ben_hrd_karyawan_info.namakaryawan from ' +
     'ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan = ' +
     'ben_presensi_details.kodekaryawan) as nama, ' +
     '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info where ' +
     'ben_hrd_karyawan_info.kodekaryawan = ben_presensi_details.kodekaryawan) ' +
     'as departemen from ben_presensi_details where tanggal >= ''' +
     FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' and tanggal <= ''' +
     FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
  qryRepRekap.Open;
  gtbRepRekap.DataController.Refresh;
end;

procedure TfrmLapRekapAbsen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLapRekapAbsen.FormCreate(Sender: TObject);
begin
   qryRepRekap.Active := True;
   tblDepartemen.Active := True;
   tblTag.Active := True;
   edStart.Date := Date;
   edEnd.Date := Date;
end;

end.
