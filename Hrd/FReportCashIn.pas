unit FReportCashIn;

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
  cxGrid, cxContainer, cxCalc, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, ShellApi, cxGridExportLink, cxDBLookupComboBox, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  Vcl.ComCtrls, dxCore, cxDateUtils, MyAccess, MemDS;

type
  TfrmReportCashIn = class(TForm)
    lblJudulForm: TLabel;
    qryList: TMyQuery;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    dsQryList: TDataSource;
    gtbCashin: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label2: TLabel;
    Label3: TLabel;
    edPeriode: TComboBox;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    btnLoad: TButton;
    Label6: TLabel;
    dlgSave: TSaveDialog;
    btnExport: TButton;
    gtbCashinpayrollperiode: TcxGridDBColumn;
    gtbCashintglstart: TcxGridDBColumn;
    gtbCashintglend: TcxGridDBColumn;
    gtbCashinkodekaryawan: TcxGridDBColumn;
    gtbCashinidkaryawan: TcxGridDBColumn;
    gtbCashinhperiode: TcxGridDBColumn;
    gtbCashinhoff: TcxGridDBColumn;
    gtbCashinharuskerja: TcxGridDBColumn;
    gtbCashinhkerja: TcxGridDBColumn;
    gtbCashinovertime: TcxGridDBColumn;
    gtbCashinhunder: TcxGridDBColumn;
    gtbCashinhlate1: TcxGridDBColumn;
    gtbCashinhlate2: TcxGridDBColumn;
    gtbCashinhsakit: TcxGridDBColumn;
    gtbCashinhimasuk: TcxGridDBColumn;
    gtbCashinhitidakmasuk: TcxGridDBColumn;
    gtbCashinhipulang: TcxGridDBColumn;
    gtbCashinhikeluar: TcxGridDBColumn;
    gtbCashinhitidakabsen: TcxGridDBColumn;
    gtbCashinhalpa: TcxGridDBColumn;
    gtbCashinhfot: TcxGridDBColumn;
    gtbCashinhlibnas: TcxGridDBColumn;
    gtbCashinhcuti: TcxGridDBColumn;
    gtbCashintamblain: TcxGridDBColumn;
    gtbCashinpotlain: TcxGridDBColumn;
    gtbCashingapok: TcxGridDBColumn;
    gtbCashinnlibnas: TcxGridDBColumn;
    gtbCashinnumakan: TcxGridDBColumn;
    gtbCashinnumlibnas: TcxGridDBColumn;
    gtbCashingplibnas: TcxGridDBColumn;
    gtbCashinnlembur: TcxGridDBColumn;
    gtbCashinnilaifot: TcxGridDBColumn;
    gtbCashinnilaithp: TcxGridDBColumn;
    gtbCashinlastedituser: TcxGridDBColumn;
    gtbCashinlasteditdate: TcxGridDBColumn;
    gtbCashinnama: TcxGridDBColumn;
    gtbCashindivisi: TcxGridDBColumn;
    gtbCashinColumn1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qryTemp1, qryTemp2, qryTemp3, qryTemp4 : TMyQuery;

  public
    { Public declarations }
    ISADMIN : Boolean;
  end;

var
  frmReportCashIn: TfrmReportCashIn;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmReportCashIn.btnLoadClick(Sender: TObject);
begin
  //
 qryTemp1.Close;
 qryTemp1.SQL.Clear;
 qryTemp1.SQL.Add('select idoutlet, tglstart, tglend from ben_payroll_periode ' +
    'where payrollperiode = ''' + edPeriode.Text + '''');
 qryTemp1.Open;
 edStart.Date := qryTemp1.Fields[1].AsDateTime;
 edEnd.Date := qryTemp1.Fields[2].AsDateTime;
 //edOutlet.EditValue := qryCari.Fields[0].AsString;

  qryList.Close;
  qryList.SQL.Clear;
  qryList.SQL.Add('SELECT *, (select ben_hrd_karyawan_info.namakaryawan ' +
     'from ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan =  ' +
     'ben_payroll_cashin.kodekaryawan) as nama, (select ben_hrd_karyawan_info.departemen ' +
     'from ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan =  ' +
     'ben_payroll_cashin.kodekaryawan) as divisi FROM ben_payroll_cashin ' +
     'WHERE payrollperiode = ''' + edPeriode.Text + '''');
  qryList.Open;
  gtbCashin.DataController.Refresh;
end;

procedure TfrmReportCashIn.btnExportClick(Sender: TObject);
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

procedure TfrmReportCashIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmReportCashIn.FormCreate(Sender: TObject);
var
  i : Integer;
begin
   qryTemp1 := TMyQuery.Create(Self);
   qryTemp1.Connection := DMDB.dbInternal;
   qryTemp1.SQL.Add('select * from temptable');
   qryTemp1.Active := true;

   qryTemp2 := TMyQuery.Create(Self);
   qryTemp2.Connection := DMDB.dbInternal;
   qryTemp2.SQL.Add('select * from temptable');
   qryTemp2.Active := true;

   qryTemp3 := TMyQuery.Create(Self);
   qryTemp3.Connection := DMDB.dbInternal;
   qryTemp3.SQL.Add('select * from temptable');
   qryTemp3.Active := true;

   qryTemp3 := TMyQuery.Create(Self);
   qryTemp3.Connection := DMDB.dbInternal;
   qryTemp3.SQL.Add('select * from temptable');
   qryTemp3.Active := true;

   tblDepartemen.Active := True;
   qryList.Active := True;

   qryTemp1.Close;
   qryTemp1.SQL.Clear;
   qryTemp1.SQL.Add('select payrollperiode from ben_payroll_periode ' +
      'order by tglstart DESC LIMIT 12');
   qryTemp1.Open;
   qryTemp1.First;
   for i := 0 to qryTemp1.RecordCount - 1 do
      begin
        edPeriode.Items.Add(qryTemp1.Fields[0].AsString);
        qryTemp1.Next;
      end;
   if (frmReportCashIn.Tag = 1) then
     begin
       ISADMIN := True;
       lblJudulForm.Caption := '  Report Cashin As Admin';
     end
   else if (frmReportCashIn.Tag = 2) then
     begin
       ISADMIN := False;
       lblJudulForm.Caption := '  Report Cashin As SPV';
     end;
end;

end.
