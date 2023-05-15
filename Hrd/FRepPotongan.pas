unit FRepPotongan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, ShellApi, cxGridExportLink, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxCalc, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, MyAccess, MemDS;

type
  TfrmRepPotongan = class(TForm)
    lblJudulForm: TLabel;
    tblOutlet: TMyTable;
    dsTblOutlet: TDataSource;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    edPeriode: TComboBox;
    Label3: TLabel;
    edOutlet: TcxLookupComboBox;
    Label1: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    Label2: TLabel;
    Button1: TButton;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListautonum: TcxGridDBColumn;
    gtbListidoutlet: TcxGridDBColumn;
    gtbListpayrollperiode: TcxGridDBColumn;
    gtbListkodekaryawan: TcxGridDBColumn;
    gtbListidkaryawan: TcxGridDBColumn;
    gtbListnilai: TcxGridDBColumn;
    gtbListketerangan: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    gtbListdepartemen: TcxGridDBColumn;
    gtbListnama: TcxGridDBColumn;
    gtbListidfinger: TcxGridDBColumn;
    btnExport: TButton;
    dlgSave: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qryFind1 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmRepPotongan: TfrmRepPotongan;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmRepPotongan.btnExportClick(Sender: TObject);
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

procedure TfrmRepPotongan.Button1Click(Sender: TObject);
begin
  qryList.Close;
  qryList.SQL.Clear;
  qryList.SQL.Add('SELECT *, (SELECT ben_hrd_karyawan_info.departemen from ' +
      'ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan = ' +
      'ben_payroll_potongan.kodekaryawan) as departemen, ' +
      '(SELECT ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan_info ' +
      'where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_potongan.kodekaryawan) ' +
      'as nama, (SELECT ben_hrd_karyawan_info.idkaryawan from ' +
      'ben_hrd_karyawan_info where ben_hrd_karyawan_info.kodekaryawan = ' +
      'ben_payroll_potongan.kodekaryawan) as idfinger ' +
      'FROM ben_payroll_potongan WHERE payrollperiode = ''' + edPeriode.Text + '''');
  qryList.Open;
  gtbList.DataController.Refresh;
end;

procedure TfrmRepPotongan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryFind1.Free;
   Action := caFree;
end;

procedure TfrmRepPotongan.FormCreate(Sender: TObject);
var
  i : Integer;
begin
   qryFind1 := TMyQuery.Create(Self);
   qryFind1.Connection := DMDB.dbInternal;
   qryFind1.SQL.Add('select * from temptable');
   qryFind1.Active := true;
   tblDepartemen.Active := True;
   tblOutlet.Active := True;
   qryList.Active := True;
   gtbList.DataController.Refresh;
   qryFind1.Close;
   qryFind1.SQL.Clear;
   qryFind1.SQL.Add('select payrollperiode from ben_payroll_periode ' +
      'order by tglstart DESC LIMIT 5');
   qryFind1.Open;
   qryFind1.First;
   for i := 0 to qryFind1.RecordCount - 1 do
      begin
        edPeriode.Items.Add(qryFind1.Fields[0].AsString);
        qryFind1.Next;
      end;
end;

end.
