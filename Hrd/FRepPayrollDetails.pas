unit FRepPayrollDetails;

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
  dxSkinXmas2008Blue, cxDropDownEdit, cxCalendar, StdCtrls, cxTextEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DBAccess,
  DB, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxCalc,
  ShellApi, cxGridExportLink, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, MyAccess, MemDS;

type
  TfrmRepPayrollDetails = class(TForm)
    edPeriode: TComboBox;
    Button1: TButton;
    edOutlet: TcxLookupComboBox;
    Label3: TLabel;
    Label1: TLabel;
    edStart: TcxDateEdit;
    Label2: TLabel;
    edEnd: TcxDateEdit;
    lblJudulForm: TLabel;
    tblOutlet: TMyTable;
    dsTblOutlet: TDataSource;
    qrySlip: TMyQuery;
    dsQrySlip: TDataSource;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dlgSave: TSaveDialog;
    btnExport: TButton;
    Button2: TButton;
    gtbListkodekaryawan: TcxGridDBColumn;
    gtbListidkaryawan: TcxGridDBColumn;
    gtbListnamakaryawan: TcxGridDBColumn;
    gtbListdepartemen: TcxGridDBColumn;
    gtbListidoutlet: TcxGridDBColumn;
    gtbListisadmin: TcxGridDBColumn;
    gtbListhperiode: TcxGridDBColumn;
    gtbListhnormal: TcxGridDBColumn;
    gtbListhoff: TcxGridDBColumn;
    gtbListharuskerja: TcxGridDBColumn;
    gtbListovertime: TcxGridDBColumn;
    gtbListhunder: TcxGridDBColumn;
    gtbListhlate1: TcxGridDBColumn;
    gtbListhlate2: TcxGridDBColumn;
    gtbListhsakit: TcxGridDBColumn;
    gtbListhimasuk: TcxGridDBColumn;
    gtbListhitidakmasuk: TcxGridDBColumn;
    gtbListhipulang: TcxGridDBColumn;
    gtbListhikeluar: TcxGridDBColumn;
    gtbListhitidakabsen: TcxGridDBColumn;
    gtbListhalpa: TcxGridDBColumn;
    gtbListhfot: TcxGridDBColumn;
    gtbListhlibnas: TcxGridDBColumn;
    gtbListhcuti: TcxGridDBColumn;
    gtbListhumakan: TcxGridDBColumn;
    gtbListvgapok: TcxGridDBColumn;
    gtbListvsaving: TcxGridDBColumn;
    gtbListvtunjangan: TcxGridDBColumn;
    gtbListvpotongan: TcxGridDBColumn;
    gtbListvbpjs: TcxGridDBColumn;
    gtbListvlembur: TcxGridDBColumn;
    gtbListvumakan: TcxGridDBColumn;
    gtbListvthp: TcxGridDBColumn;
    gtbListkomisi: TcxGridDBColumn;
    gtbListdenda: TcxGridDBColumn;
    gtbListtamblain: TcxGridDBColumn;
    gtbListnilaithp: TcxGridDBColumn;
    gtbListnilaifot: TcxGridDBColumn;
    gtbListnlembur: TcxGridDBColumn;
    gtbListgplibnas: TcxGridDBColumn;
    gtbListnumlibnas: TcxGridDBColumn;
    gtbListnumakan: TcxGridDBColumn;
    gtbListnlibnas: TcxGridDBColumn;
    gtbListgapok: TcxGridDBColumn;
    gtbListpotlain: TcxGridDBColumn;
    gtbListpayrollperiode: TcxGridDBColumn;
    gtbListnorek: TcxGridDBColumn;
    gtbListnamarek: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
    qryCari, qrySearch, qryFind : TMyQuery;
  public
    { Public declarations }
    ISADMIN : Boolean;
  end;

var
  frmRepPayrollDetails: TfrmRepPayrollDetails;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmRepPayrollDetails.btnExportClick(Sender: TObject);
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

procedure TfrmRepPayrollDetails.Button1Click(Sender: TObject);
begin
  if (edPeriode.Text = '') then Exit;
  if (ISADMIN = True) then
    begin
      qrySlip.Close;
      qrySlip.SQL.Clear;
      qrySlip.SQL.Add('SELECT ben_hrd_karyawan_info.kodekaryawan, ben_hrd_karyawan_info.idkaryawan, ' +
          'ben_hrd_karyawan_info.namakaryawan, ben_hrd_karyawan_info.idoutlet, ' +
          'ben_hrd_karyawan_info.departemen, ben_hrd_karyawan_info.norek, ben_hrd_karyawan_info.isadmin, ' +
          'ben_hrd_karyawan_info.namarek, ben_payroll_details.* ' +
          'FROM ben_hrd_karyawan_info INNER JOIN ' +
          'ben_payroll_details ON ben_hrd_karyawan_info.kodekaryawan = ' +
          'ben_payroll_details.kodekaryawan ' +
          'WHERE ben_hrd_karyawan_info.active <> ''' + 'X' + ''' ' +
          'AND ben_hrd_karyawan_info.isadmin = ''' + 'Y' + ''' ' +
          'AND ben_payroll_details.payrollperiode = ''' + edPeriode.Text + '''');
      qrySlip.Open;
      gtbList.DataController.Refresh;
    end
  else if (ISADMIN = False) then
    begin
      qrySlip.Close;
      qrySlip.SQL.Clear;
      qrySlip.SQL.Add('SELECT ben_hrd_karyawan_info.kodekaryawan, ben_hrd_karyawan_info.idkaryawan, ' +
          'ben_hrd_karyawan_info.namakaryawan, ben_hrd_karyawan_info.idoutlet, ' +
          'ben_hrd_karyawan_info.departemen, ben_hrd_karyawan_info.norek, ben_hrd_karyawan_info.isadmin, ' +
          'ben_hrd_karyawan_info.namarek, ben_payroll_details.* ' +
          'FROM ben_hrd_karyawan_info INNER JOIN ' +
          'ben_payroll_details ON ben_hrd_karyawan_info.kodekaryawan = ' +
          'ben_payroll_details.kodekaryawan ' +
          'WHERE ben_hrd_karyawan_info.active <> ''' + 'X' + ''' ' +
          'AND ben_payroll_details.payrollperiode = ''' + edPeriode.Text + '''');
      qrySlip.Open;
      gtbList.DataController.Refresh;
    end;

end;

procedure TfrmRepPayrollDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCari.Free;
  qrySearch.Free;
  qryFind.Free;
  Action := caFree;
end;

procedure TfrmRepPayrollDetails.FormCreate(Sender: TObject);
var
  i : Integer;
begin
   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;

   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from temptable');
   qrySearch.Active := true;

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.dbInternal;
   qryFind.SQL.Add('select * from temptable');
   qryFind.Active := true;

   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select payrollperiode from ben_payroll_periode ' +
      'order by tglstart DESC LIMIT 12');
   qryFind.Open;
   qryFind.First;
   for i := 0 to qryFind.RecordCount - 1 do
      begin
        edPeriode.Items.Add(qryFind.Fields[0].AsString);
        qryFind.Next;
      end;
   {if (frmRepPayrollDetails.Tag = 1) then
     begin
       ISADMIN := True;
       lblJudulForm.Caption := '  PAYROLL AS ADMIN';
     end
   else if (frmRepPayrollDetails.Tag = 2) then
     begin
       ISADMIN := False;
       lblJudulForm.Caption := '  PAYROLL AS SPV';
     end; }
   tblDepartemen.Active := True;
   tblOutlet.Active := True;
   qrySlip.Active := True;
end;

end.
