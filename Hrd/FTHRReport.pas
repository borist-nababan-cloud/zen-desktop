unit FTHRReport;

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
  dxSkinXmas2008Blue, Menus, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls,
  DB, DBAccess, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxCalc, cxGridLevel, cxGridBandedTableView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, ShellApi, cxGridExportLink, Printers,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, MyAccess, MemDS;

type
  TfrmTHRReport = class(TForm)
    lblJudulForm: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    edKode: TcxLookupComboBox;
    btnLoad: TcxButton;
    qryKode: TMyQuery;
    dsQryKode: TDataSource;
    cxGrid1: TcxGrid;
    gtbList: TcxGridDBTableView;
    tvList: TcxGridBandedTableView;
    tvListKodeKaryawan: TcxGridBandedColumn;
    tvListIDFinger: TcxGridBandedColumn;
    tvListNama: TcxGridBandedColumn;
    tvListDivisi: TcxGridBandedColumn;
    tvListBank: TcxGridBandedColumn;
    tvListNoRek: TcxGridBandedColumn;
    tvListNamaRek: TcxGridBandedColumn;
    tvListTHR: TcxGridBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    tvListTambahan: TcxGridBandedColumn;
    tvListPayment: TcxGridBandedColumn;
    tvListGapok: TcxGridBandedColumn;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    gtbListkodethr: TcxGridDBColumn;
    gtbListkodekaryawan: TcxGridDBColumn;
    gtbListidkaryawan: TcxGridDBColumn;
    gtbListnamakaryawan: TcxGridDBColumn;
    gtbListdepartemen: TcxGridDBColumn;
    gtbListkodekontrak: TcxGridDBColumn;
    gtbListtglmasukkerja: TcxGridDBColumn;
    gtbListgapok: TcxGridDBColumn;
    gtbListlamakerja: TcxGridDBColumn;
    gtbListvalue: TcxGridDBColumn;
    gtbListtambahan: TcxGridDBColumn;
    gtbListpayment: TcxGridDBColumn;
    gtbListnorek: TcxGridDBColumn;
    gtbListnamarek: TcxGridDBColumn;
    gtbListnamabank: TcxGridDBColumn;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    tblKontrak: TMyTable;
    dsTblKontrak: TDataSource;
    dlgSave: TSaveDialog;
    cxButton3: TcxButton;
    procedure btnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    qryReport1, qryReport2 : TMyQuery;
  public
    { Public declarations }
    ISADMIN : String;
  end;

var
  frmTHRReport: TfrmTHRReport;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmTHRReport.btnLoadClick(Sender: TObject);
begin

  if (ISADMIN = 'N') then
     begin
        qryList.Close;
        qryList.SQL.Clear;
        qryList.SQL.Add('select kodethr, kodekaryawan, idkaryawan, namakaryawan, ' +
            'departemen, kodekontrak, tglmasukkerja, gapok, lamakerja, value, tambahan, payment, ' +
            '(select ben_hrd_karyawan_info.norek from  ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan = ben_thr_value.kodekaryawan) as norek, ' +
            '(select ben_hrd_karyawan_info.namarek from  ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan = ben_thr_value.kodekaryawan) as namarek, ' +
            '(select ben_hrd_karyawan_info.namabank from  ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan = ben_thr_value.kodekaryawan) as namabank ' +
            'FROM ben_thr_value where kodethr = ''' + edKode.Text + '''');
        qryList.Open;
     end
  else if (ISADMIN = 'Y') then
     begin
        qryList.Close;
        qryList.SQL.Clear;
        qryList.SQL.Add('select kodethr, kodekaryawan, idkaryawan, namakaryawan,' +
            'departemen, kodekontrak, tglmasukkerja, gapok, lamakerja, value, tambahan, payment, ' +
            '(select ben_hrd_karyawan_info.norek from  ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan = ben_thr_value.kodekaryawan) as norek, ' +
            '(select ben_hrd_karyawan_info.namarek from  ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan = ben_thr_value.kodekaryawan) as namarek, ' +
            '(select ben_hrd_karyawan_info.namabank from  ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan = ben_thr_value.kodekaryawan) as namabank ' +
            'FROM ben_thr_value where kodethr = ''' + edKode.Text + ''' AND isadmin = ''' + ISADMIN + '''');
        qryList.Open;
     end;

  gtbList.DataController.Refresh;
end;

procedure TfrmTHRReport.cxButton3Click(Sender: TObject);
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

procedure TfrmTHRReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmTHRReport.FormCreate(Sender: TObject);
begin
     tblKontrak.Active := True;
     tblDepartemen.Active := True;
     qryList.Active := True;
     qryKode.Active := True;
end;

end.
