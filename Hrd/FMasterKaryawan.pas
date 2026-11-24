unit FMasterKaryawan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
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
  cxGrid, cxTextEdit, cxDBLookupComboBox, cxCalendar, cxCheckBox, strUtils,
  cxContainer, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MyAccess, MemDS, Vcl.Menus, cxButtons;

type
  TfrmMasterKaryawan = class(TForm)
    tblKaryawan: TMyTable;
    dsTblKaryawan: TDataSource;
    gtbKaryawan: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbKaryawankodekaryawan: TcxGridDBColumn;
    gtbKaryawanidkaryawan: TcxGridDBColumn;
    gtbKaryawannamakaryawan: TcxGridDBColumn;
    gtbKaryawanidoutlet: TcxGridDBColumn;
    gtbKaryawanlasteditdate: TcxGridDBColumn;
    gtbKaryawanlastedituser: TcxGridDBColumn;
    gtbKaryawantagedit: TcxGridDBColumn;
    gtbKaryawanactive: TcxGridDBColumn;
    tblOutlet: TMyTable;
    dsTblOutlet: TDataSource;
    btnNew: TButton;
    btnEdit: TButton;
    btnSelect: TButton;
    gtbKaryawanjadwaltetap: TcxGridDBColumn;
    tblJadwalTetap: TMyTable;
    dsTblJadwalTetap: TDataSource;
    Label4: TLabel;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    tblKontrak: TMyTable;
    dsTblKontrak: TDataSource;
    qryKaryawan: TMyQuery;
    dsQryKaryawan: TDataSource;
    ckFilter: TcxCheckBox;
    gtbKaryawandepartemen: TcxGridDBColumn;
    gtbKaryawankodejadwal: TcxGridDBColumn;
    gtbKaryawankodekontrak: TcxGridDBColumn;
    gtbKaryawantglmasukkerja: TcxGridDBColumn;
    gtbKaryawantglhabiskontrak: TcxGridDBColumn;
    gtbKaryawannamabank: TcxGridDBColumn;
    gtbKaryawannorek: TcxGridDBColumn;
    gtbKaryawanisadmin: TcxGridDBColumn;
    btnKontrak: TButton;
    btnRefresh: TButton;
    btnSyncCloud: TcxButton;
    lblSyncProgress: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure ckFilterPropertiesChange(Sender: TObject);
    procedure btnKontrakClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnSyncCloudClick(Sender: TObject);
  private
    { Private declarations }
    qryStaff1, qryStaff2, qryStaff3, qryExec : TMyQuery;
    procedure InputCuti;
    procedure InputLembur;
    procedure InputSaldoCuti;
    procedure InputKontrakDetails;
    procedure InputPresensiManual;
    procedure CreateNewNik;
    procedure InputIjinLain;
    procedure InputRekap;
    procedure InputPayroll;
    procedure InputHistory;
    procedure InputCashIn;
    procedure InputIjinKeluar;
    procedure InputIjinTidakMasuk;
    procedure InputIjinSakit;
    procedure InputRekapBali;
    procedure InputPayrollBali;
    procedure InputPayrollCashInBali;
    procedure InputRekapNew;
    procedure InputRekapOld;
    procedure InputSakit;
    procedure InputIjinPulang;
    procedure InputIjinTM;
    procedure InputTherapistReport;
  public
    { Public declarations }
    ISADMIN : Boolean;
    NEW_NIK : String;
  end;

var
  frmMasterKaryawan: TfrmMasterKaryawan;

implementation

{$R *.dfm}

uses FdmDB, FMasterKaryawanAdd, FMain, FKontrakKerjaUpdate,
     FKontrakKerjaDetails, FPresensiManual, FSaldoCuti, FIjinCuti, FlemburInput,
     FIjinLainInput, FRekapHarian, FPayrollAdmin, FHistoryKontrak,
     FPayrollCashIn, FIjinKeluar, FIjinTidakMasuk, FSakitInput,
     FRekapHarianBali, FPayrollAdminBali, FPayrollCashInBali, FRekapHarianNew,
     FRekapHarianBaru, FIjinSakitInput, FIjinPulangInput, FIjinTidakMasukInput,
     FTherapistReport, FRekapHarianOld,
     System.Net.HttpClient, System.Net.URLClient, XSuperObject;

procedure TfrmMasterKaryawan.InputIjinTM;
var
  recSelect : Integer;
  kodekaryawan, namaKaryawan, idFinger, idDivisi : String;
begin
   recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmIjinTidakMasukInput.edKode.Text := kodekaryawan;
  frmIjinTidakMasukInput.edID.Text := idFinger;
  frmIjinTidakMasukInput.edNama.Text := namaKaryawan;
  //frmIjinLainInput.edDivisi.EditValue := idDivisi;
  //frmIjinLainInput.CariCuti;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputIjinPulang;
var
  recSelect : Integer;
  kodekaryawan, namaKaryawan, idFinger, idDivisi : String;
begin
   recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmIjinPulangInput.edKode.Text := kodekaryawan;
  frmIjinPulangInput.edID.Text := idFinger;
  frmIjinPulangInput.edNama.Text := namaKaryawan;
  //frmIjinLainInput.edDivisi.EditValue := idDivisi;
  //frmIjinLainInput.CariCuti;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputSakit;
var
  recSelect : Integer;
  kodekaryawan, namaKaryawan, idFinger, idDivisi : String;
begin
   recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmIjinSakitInput.edKode.Text := kodekaryawan;
  frmIjinSakitInput.edID.Text := idFinger;
  frmIjinSakitInput.edNama.Text := namaKaryawan;
  //frmIjinLainInput.edDivisi.EditValue := idDivisi;
  //frmIjinLainInput.CariCuti;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputRekapNew;
var
  recSelect : Integer;
  kodekaryawan, namaKaryawan, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmRekapHarianBaru.lblKodeKaryawan.Caption := kodekaryawan;
  frmRekapHarianBaru.lblIDFinger.Caption := idFinger;
  frmRekapHarianBaru.lblNamaKaryawan.Caption := namaKaryawan;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputRekapOld;
var
  recSelect : Integer;
  kodekaryawan, namaKaryawan, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmRekapHarianOld.lblKodeKaryawan.Caption := kodekaryawan;
  frmRekapHarianOld.lblIDFinger.Caption := idFinger;
  frmRekapHarianOld.lblNamaKaryawan.Caption := namaKaryawan;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputPayrollCashInBali;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmPayrollCashInBali.lblKodeKaryawan.Caption := kodekaryawan;
  frmPayrollCashInBali.lblIDFinger.Caption := idFinger;
  frmPayrollCashInBali.lblNamaKaryawan.Caption := namaKaryawan;
  frmPayrollCashInBali.lblDepartemen.Caption := idDivisi;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputPayrollBali;
var
  recSelect : Integer;
  kodekaryawan, namaKaryawan, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmPayrollAdminBali.lblKodeKaryawan.Caption := kodekaryawan;
  frmPayrollAdminBali.lblIDFinger.Caption := idFinger;
  frmPayrollAdminBali.lblNamaKaryawan.Caption := namaKaryawan;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputRekapBali;
var
  recSelect : Integer;
  kodekaryawan, namaKaryawan, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmRekapHarianBali.lblKodeKaryawan.Caption := kodekaryawan;
  frmRekapHarianBali.lblIDFinger.Caption := idFinger;
  frmRekapHarianBali.lblNamaKaryawan.Caption := namaKaryawan;
  frmMasterKaryawan.Close;
end;
procedure TfrmMasterKaryawan.InputIjinTidakMasuk;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmIjinTidakMasuk.edKode.Text := kodekaryawan;
  frmIjinTidakMasuk.edID.Text := idFinger;
  frmIjinTidakMasuk.edNama.Text := namaKaryawan;
  //frmIjinTidakMasuk.edDepartemen.Text := idDivisi;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputIjinSakit;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmSakitInput.edKode.Text := kodekaryawan;
  frmSakitInput.edID.Text := idFinger;
  frmSakitInput.edNama.Text := namaKaryawan;
  //frmSakitInput.edDepartemen.Text := idDivisi;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputIjinKeluar;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmIjinKeluar.edKode.Text := kodekaryawan;
  frmIjinKeluar.edID.Text := idFinger;
  frmIjinKeluar.edNama.Text := namaKaryawan;
  frmIjinKeluar.edDepartemen.Text := idDivisi;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputCashIn;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmPayrollCashIn.lblKodeKaryawan.Caption := kodekaryawan;
  frmPayrollCashIn.lblIDFinger.Caption := idFinger;
  frmPayrollCashIn.lblNamaKaryawan.Caption := namaKaryawan;
  frmPayrollCashIn.lblDepartemen.Caption := idDivisi;
  frmMasterKaryawan.Close;

end;

procedure TfrmMasterKaryawan.InputHistory;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  if ((ckAdmin = 'N') AND (ISADMIN = TRUE) ) then
    begin
      ShowMessage('Maaf anda Tidak Memiliki Otorisasi Data ini');
      Exit;
    end;
  Application.CreateForm(TfrmHistoryKontrak, frmHistoryKontrak);
  with frmHistoryKontrak do
    begin
      lblNama.Caption := namaKaryawan;
      lblKode.Caption := kodekaryawan;
      lblFingerID.Caption := idFinger;
      qryKontrak.Close;
      qryKontrak.SQL.Clear;
      qryKontrak.SQL.Add('select * from ben_hrd_kontrak_details where ' +
         'kodekaryawan = ''' + kodekaryawan + '''');
      qryKontrak.Open;
      gtbKontrak.DataController.Refresh;
    end;
  frmHistoryKontrak.Show;
  frmHistoryKontrak.Position := poMainFormCenter;
end;


procedure TfrmMasterKaryawan.InputPayroll;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmPayrollAdmin.lblKodeKaryawan.Caption := kodekaryawan;
  frmPayrollAdmin.lblIDFinger.Caption := idFinger;
  frmPayrollAdmin.lblNamaKaryawan.Caption := namaKaryawan;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputRekap;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmRekapHarian.lblKodeKaryawan.Caption := kodekaryawan;
  frmRekapHarian.lblIDFinger.Caption := idFinger;
  frmRekapHarian.lblNamaKaryawan.Caption := namaKaryawan;
  frmMasterKaryawan.Close;
end;
procedure TfrmMasterKaryawan.InputIjinLain;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmIjinLainInput.edKode.Text := kodekaryawan;
  frmIjinLainInput.edID.Text := idFinger;
  frmIjinLainInput.edNama.Text := namaKaryawan;
  //frmIjinLainInput.edDivisi.EditValue := idDivisi;
  //frmIjinLainInput.CariCuti;
  frmMasterKaryawan.Close;
end;
procedure TfrmMasterKaryawan.InputCuti;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmIjinCuti.edKode.Text := kodekaryawan;
  frmIjinCuti.edID.Text := idFinger;
  frmIjinCuti.edNama.Text := namaKaryawan;
  frmIjinCuti.edDivisi.EditValue := idDivisi;
  frmIjinCuti.CariCuti(kodekaryawan);
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputLembur;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  frmLemburInput.edKode.Text := kodekaryawan;
  frmLemburInput.edID.Text := idFinger;
  frmLemburInput.edNama.Text := namaKaryawan;
  //frmLemburInput.edDivisi.EditValue := idDivisi;
  frmLemburInput.CariJadwal;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputSaldoCuti;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  frmSaldoCuti.edKode.Text := kodekaryawan;
  frmSaldoCuti.edID.Text := idFinger;
  frmSaldoCuti.edNama.Text := namaKaryawan;
  frmSaldoCuti.CariCuti(kodekaryawan);
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputTherapistReport;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  idDivisi := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawandepartemen.Index));
  if ((idDivisi <> 'TR') AND (idDivisi <> 'TB')) then
     begin
       ShowMessage('Mohon Pilih Departemen Therapist Saja !');
       Exit;
     end;
  frmTherapistReport.edKode.Text := kodekaryawan;
  frmTherapistReport.edID.Text := idFinger;
  frmTherapistReport.edNama.Text := namaKaryawan;
  frmTherapistReport.LoadVariable;
  frmTherapistReport.LoadValues;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.InputKontrakDetails;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
          if (recSelect < 0) then Exit;
          kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
          ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
          namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
          if ((ckAdmin = 'N') AND (ISADMIN = TRUE) ) then
            begin
              ShowMessage('Maaf anda Tidak Memiliki Otorisasi Data ini');
              Exit;
            end;
          qryStaff1.Close;
          qryStaff1.SQL.Clear;
          qryStaff1.SQL.Add('select nokontrak, kodekontrak, tglhabis, lama, nthp, ' +
                  'gapok, transport, uangmakan, komisi, tunjangan1, potongan1, ' +
                  'potongan2, typepayroll, tunjangan2 from ben_hrd_kontrak_details where kodekaryawan = ''' +
                  kodekaryawan + ''' ORDER BY tglhabis DESC');
          qryStaff1.Open;
          qryStaff1.First;
          if (qryStaff1.IsEmpty) then
            begin
              ShowMessage('Maaf Karyawan ' + kodekaryawan + #13
                  +'Belum Memiliki Kontrak Kerja !');
              Exit;
            end;
          Application.CreateForm(TfrmKontrakKerjaDetails, frmKontrakKerjaDetails);
          with frmKontrakKerjaDetails do
            begin
              frmKontrakKerjaDetails.qryKontrak.Active := True;
              frmKontrakKerjaDetails.tblKontrak.Active := True;
              frmKontrakKerjaDetails.tblDivisi.Active := True;
              frmKontrakKerjaDetails.lblKodeKaryawan.Caption := kodekaryawan;
              frmKontrakKerjaDetails.lblNamaKaryawan.Caption := namaKaryawan;
              edNoKontrak.Text := qryStaff1.Fields[0].AsString;
              edKodeKontrak.EditValue := qryStaff1.Fields[1].AsString;
              edTglEnd.Date := qryStaff1.Fields[2].AsDateTime;
              edLama.EditValue := qryStaff1.Fields[3].AsFloat;
              edTHP.EditValue := qryStaff1.Fields[4].AsFloat;
              edGapok.EditValue := qryStaff1.Fields[5].AsFloat;
              edTransport.EditValue := qryStaff1.Fields[6].AsFloat;
              edUM.EditValue := qryStaff1.Fields[7].AsFloat;
              edKomisi.EditValue := qryStaff1.Fields[8].AsFloat;
              edTunjangan.EditValue := qryStaff1.Fields[9].AsFloat;
              edPot1.EditValue := qryStaff1.Fields[10].AsFloat;
              edPot2.EditValue := qryStaff1.Fields[11].AsFloat;
              edTypePayroll.EditValue := qryStaff1.Fields[12].AsInteger;
              edTambLain.EditValue := qryStaff1.Fields[13].AsFloat;
            end;
          frmKontrakKerjaDetails.Show;
          frmKontrakKerjaDetails.Position := poMainFormCenter;
end;

procedure TfrmMasterKaryawan.InputPresensiManual;
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  //ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  idFinger := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanidkaryawan.Index));
  frmPresensiManual.edKode.Text := kodekaryawan;
  frmPresensiManual.edID.Text := idFinger;
  frmPresensiManual.edNama.Text := namaKaryawan;
  frmMasterKaryawan.Close;
end;

procedure TfrmMasterKaryawan.CreateNewNik;
var
  nBulan, nTahun, strNik, lastNik, oldStrNik : String;
  intLastNik, newLastNik : Integer;
begin
  nBulan := FormatDateTime('MM', Date);
  nTahun := FormatDateTime('yy', Date);
  strNik := frmMain.APP_OUTLETID + nTahun + nBulan + '001';
  qryStaff1.Close;  qryStaff1.SQL.Clear;
  qryStaff1.SQL.Add('select kodekaryawan from ben_hrd_karyawan_info where kodekaryawan = ''' +
      strNik + ''' AND active = ''' + 'Y' + ''' order by kodekaryawan ASC');
  qryStaff1.Open;
  if (qryStaff1.IsEmpty) then NEW_NIK := strNik
  else if (NOT qryStaff1.IsEmpty) then
    begin
      qryStaff1.Last;
      oldStrNik := qryStaff1.Fields[0].AsString;
      intLastNik := StrToInt(RightStr(oldStrNik, 3));
      newLastNik := intLastNik + 1;
      case Length(inttostr(newLastNik)) of
         1 : strNik := frmMain.APP_OUTLETID + nTahun + nBulan + '00' + inttostr(newLastNik);
         2 : strNik := frmMain.APP_OUTLETID + nTahun + nBulan + '0' + inttostr(newLastNik);
         3 : strNik := frmMain.APP_OUTLETID + nTahun + nBulan + inttostr(newLastNik);
      end;
      NEW_NIK := strNik;
    end;

end;

procedure TfrmMasterKaryawan.btnEditClick(Sender: TObject);
var
   recSelect : Integer;
   kodekaryawan, ckAdmin, strJadwal : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  if ((ckAdmin = 'N') AND (ISADMIN = TRUE) ) then
    begin
      ShowMessage('Maaf anda tidak dapat edit data ini');
      Exit;
    end;
  qryStaff1.Close;
  qryStaff1.SQL.Clear;
  qryStaff1.SQL.Add('select * from ben_hrd_karyawan_info where kodekaryawan = ''' +
            kodekaryawan + '''');
  qryStaff1.Open;

  qryStaff2.Close;
  qryStaff2.SQL.Clear;
  qryStaff2.SQL.Add('select * from ben_hrd_karyawan_details where kodekaryawan = ''' +
            kodekaryawan + '''');
  qryStaff2.Open;

  Application.CreateForm(TfrmMasterKaryawanAdd, frmMasterKaryawanAdd);
  with frmMasterKaryawanAdd do
      begin
        edKodekaryawan.Text := kodekaryawan;
        edIdkaryawan.Text := qryStaff1.Fields[1].AsString;
        edNamaKaryawan.Text := qryStaff1.Fields[2].AsString;
        edOutlet.EditValue := qryStaff1.Fields[3].AsString;
        edDepartemen.EditValue := qryStaff1.Fields[4].AsString;
        ckAktif.EditValue := qryStaff1.Fields[17].AsString;
        ckAdmin.EditValue := qryStaff1.Fields[16].AsString;
        strJadwal := qryStaff1.Fields[5].AsString;
        if (strJadwal = 'Y') then
          begin
            ckNonJadwal.Checked := False;
            ckJadwalTetap.Checked := True;
            ckJadwalharian.Checked := False;
          end
        else if (strJadwal = 'N') then
          begin
            ckNonJadwal.Checked := True;
            ckJadwalTetap.Checked := False;
            ckJadwalharian.Checked := False;
          end
        else if (strJadwal = 'H') then
          begin
            ckNonJadwal.Checked := False;
            ckJadwalTetap.Checked := False;
            ckJadwalharian.Checked := True;
          end;
        //ckJadwalTetap.EditValue := qryStaff1.Fields[5].AsString;
        edKodeJadwal.EditValue := qryStaff1.Fields[6].AsString;
        edKodeKontrak.EditValue := qryStaff1.Fields[7].AsString;
        edTglMasuk.Date := qryStaff1.Fields[8].AsDateTime;
        edEndKontrak.Date := qryStaff1.Fields[9].AsDateTime;
        edBank.Text := qryStaff1.Fields[10].AsString;
        edNoRek.Text := qryStaff1.Fields[11].AsString;
        edNamaRekening.Text := qryStaff1.Fields[12].AsString;
        btnAutoNik.Enabled := False;
        btnCopyOld.Enabled := False;
        btnSave.Tag := 2;
        edKodekaryawan.ReadOnly := True;

        edNoKtp.Text := qryStaff2.Fields[3].AsString;
        edSex.Text := qryStaff2.Fields[4].AsString;
        edAlamatKtp.Text := qryStaff2.Fields[5].AsString;
        edAlamatTinggal.Text := qryStaff2.Fields[6].AsString;
        edTelpHome.Text := qryStaff2.Fields[7].AsString;
        edHape.Text := qryStaff2.Fields[8].AsString;
        edTmptLahir.Text := qryStaff2.Fields[9].AsString;
        edTglLahir.Date := qryStaff2.Fields[10].AsDateTime;
        edAgama.Text := qryStaff2.Fields[11].AsString;
        edGoldar.Text := qryStaff2.Fields[12].AsString;
        edEmail.Text := qryStaff2.Fields[13].AsString;
      end;

  frmMasterKaryawanAdd.Show;
  frmMasterKaryawanAdd.Position := poMainFormCenter;
end;

procedure TfrmMasterKaryawan.btnKontrakClick(Sender: TObject);
var
   recSelect : Integer;
   kodekaryawan, ckAdmin : String;
begin
  recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  ckAdmin := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawanisadmin.Index));
  if ((ckAdmin = 'N') AND (ISADMIN = TRUE) ) then
    begin
      ShowMessage('Maaf anda Tidak Memiliki Otorisasi Data ini');
      Exit;
    end;
    Application.CreateForm(TfrmKontrakKerjaUpdate, frmKontrakKerjaUpdate);
  qryStaff1.Close;
  qryStaff1.SQL.Clear;
  qryStaff1.SQL.Add('select * from ben_hrd_kontrak_details where kodekaryawan = ''' +
      kodekaryawan + ''' ORDER BY tglhabis DESC');
  qryStaff1.Open;
  qryStaff1.Last;
  qryStaff2.Close;
  qryStaff2.SQL.Clear;
  qryStaff2.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, idoutlet, ' +
      'departemen, tglmasukkerja, tglhabiskontrak from ben_hrd_karyawan_info where kodekaryawan = ''' + kodekaryawan + '''');
  qryStaff2.Open;
  with frmKontrakKerjaUpdate do
    begin
       frmKontrakKerjaUpdate.qryKontrak.Active := True;
       frmKontrakKerjaUpdate.tblDivisi.Active := True;
       frmKontrakKerjaUpdate.tblKontrak.Active := True;
       edOldKodeKontrak.EditValue := qryStaff1.Fields[4].AsString;

       edOldTglEnd.EditValue := qryStaff1.Fields[6].AsDateTime;
       edOldLama.EditValue := qryStaff1.Fields[7].AsFloat;
       edOldTHP.EditValue := qryStaff1.Fields[8].AsFloat;
       edOldGapok.EditValue := qryStaff1.Fields[9].AsFloat;
       edOldTransport.EditValue := qryStaff1.Fields[10].AsFloat;
       edOldUM.EditValue := qryStaff1.Fields[11].AsFloat;
       edOldKomisi.EditValue := qryStaff1.Fields[12].AsFloat;
       edOldTunjangan.EditValue := qryStaff1.Fields[13].AsFloat;
       edOldTambLain.EditValue := qryStaff1.Fields[14].AsFloat;
       edOldPotongan.EditValue := qryStaff1.Fields[15].AsFloat;
       edOldPot2.EditValue := qryStaff1.Fields[16].AsFloat;
       edOldType.EditValue := qryStaff1.Fields[17].AsInteger;
       edNamaKaryawan.Text := qryStaff2.Fields[2].AsString;
       edKodekaryawan.Text := qryStaff2.Fields[0].AsString;
       edIdkaryawan.Text := qryStaff2.Fields[1].AsString;
       edDepartemen.EditValue := qryStaff2.Fields[4].AsString;
       edTglMasuk.Date := qryStaff2.Fields[5].AsDateTime;
       edOldTglEnd.Date := qryStaff2.Fields[6].AsDateTime;
       qryKontrak.Close;
       qryKontrak.SQL.Clear;
       qryKontrak.SQL.Add('select kodekontrak, departemen, namakontrak ' +
             'from ben_hrd_kontrak_master where departemen = ''' +
             qryStaff2.Fields[4].AsString + '''');
       qryKontrak.Open;

    end;
  frmKontrakKerjaUpdate.Show;
  frmKontrakKerjaUpdate.Position := poMainFormCenter;

end;

procedure TfrmMasterKaryawan.btnNewClick(Sender: TObject);
begin
  Application.CreateForm(TfrmMasterKaryawanAdd, frmMasterKaryawanAdd);
  frmMasterKaryawanAdd.btnSave.Tag := 1;
  frmMasterKaryawanAdd.ckAktif.Checked := True;
  CreateNewNik;
  frmMasterKaryawanAdd.edKodekaryawan.Text := NEW_NIK;
  frmMasterKaryawanAdd.edTglMasuk.Date := Date;
  frmMasterKaryawanAdd.edTglLahir.Date := Date;
  frmMasterKaryawanAdd.edOutlet.EditValue := frmMain.APP_OUTLETID;
  frmMasterKaryawanAdd.Show;
  frmMasterKaryawanAdd.Position := poMainFormCenter;
end;

procedure TfrmMasterKaryawan.btnRefreshClick(Sender: TObject);
begin
   qryKaryawan.Active := False;
   Sleep(100);
   qryKaryawan.Active := True;
   gtbKaryawan.DataController.Refresh;
end;

procedure TfrmMasterKaryawan.btnSelectClick(Sender: TObject);
var
   recSelect : Integer;
   kodekaryawan, namaKaryawan, ckAdmin, idFinger, idDivisi : String;
begin
  {tag list
    1. Master Kontrak Details
    2. Input Presensi Manual
    3. Input Saldo Cuti
    4. Input Ijin Cuti
    5. Input Lembur
    6. Input Ijin Lain}
  {recSelect := gtbKaryawan.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodekaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawankodekaryawan.Index));
  namaKaryawan := vartostr(gtbKaryawan.DataController.GetValue(recSelect, gtbKaryawannamakaryawan.Index));
  frmMasterOutletAdd.edkaryawan.Text := kodekaryawan;
  frmMasterOutletAdd.edNamaKaryawan.Text := namaKaryawan;
  frmMasterKaryawan.Close;}
  case btnSelect.Tag of
    1 : begin
          //Master Kontrak Details
          InputKontrakDetails;
        end;
    2 : begin
          InputPresensiManual;
        end;
    3 : begin
          InputSaldoCuti;
        end;
    4 : begin
          InputCuti;
        end;
    5 : begin
          InputLembur;
        end;
    6 : begin
          InputIjinLain;
        end;
    7 : begin
          InputRekap;
        end;
    8 : begin
          InputPayroll;
        end;
    9 : begin
          InputHistory;
        end;
    10 : begin
           InputCashIn;
         end;
    11 : begin
           InputIjinKeluar;
         end;
    12 : begin
           InputIjinTidakMasuk;//ijin tidak masuk
         end;
    13 : begin
           InputIjinSakit;//ijin sakit
         end;
    14 : begin
           InputRekapBali;
         end;
    15 : begin
           InputPayrollBali;
         end;
    16 : begin
           InputPayrollCashInBali;
         end;
    17 : begin
           InputRekapNew;
         end;
    18 : begin
           InputSakit;
         end;
    19 : begin
           InputIjinPulang;
         end;
    20 : begin
           InputIjinTM;
         end;
    21 : begin
           InputTherapistReport;
         end;
    22 : begin
            InputRekapOld;
         end;
  end;
end;

procedure TfrmMasterKaryawan.btnSyncCloudClick(Sender: TObject);
var
  HTTP: THTTPClient;
  Resp: IHTTPResponse;
  Headers: TNetHeaders;
  RequestBody: TStringStream;
  JSONObj: ISuperObject;
  JSONArray: ISuperArray;
  qryInfo, qryDetails: TMyQuery;
  BaseURL, sKodeKaryawan, sNamaKaryawan, sKodeOutlet, Endpoint: string;
  TotalCount, CurrentIdx, SuccessCount, FailCount: Integer;
begin
  // 1. Guard check konfigurasi Supabase & Outlet
  BaseURL := Trim(frmMain.SUPABASE_URL);
  if (BaseURL = '') or (Trim(frmMain.SUPABASE_KEY) = '') then
  begin
    ShowMessage('Konfigurasi Cloud Supabase belum lengkap di config.json!' + #13#10 +
                'Pastikan SUPABASE_URL dan SUPABASE_KEY telah terkonfigurasi.');
    lblSyncProgress.Caption := 'Error: Supabase URL / Key belum terisi.';
    Exit;
  end;

  if Trim(frmMain.APP_OUTLETID) = '' then
  begin
    ShowMessage('ID Outlet belum ditentukan (APP_OUTLETID kosong)!');
    lblSyncProgress.Caption := 'Error: APP_OUTLETID kosong.';
    Exit;
  end;

  // Pastikan trailing slash pada BaseURL
  if not (BaseURL[Length(BaseURL)] in ['/', '\']) then
    BaseURL := BaseURL + '/';

  btnSyncCloud.Enabled := False;
  lblSyncProgress.Caption := 'Menyiapkan data karyawan aktif...';
  Application.ProcessMessages;

  qryInfo := TMyQuery.Create(Self);
  qryDetails := TMyQuery.Create(Self);
  HTTP := THTTPClient.Create;
  try
    try
      qryInfo.Connection := dmDB.dbInternal;
      qryDetails.Connection := dmDB.dbInternal;

      // Ambil seluruh data karyawan yang berstatus aktif beserta kodeoutlet dari tabel departemen
      qryInfo.SQL.Text :=
        'SELECT k.*, d.kodeoutlet AS dept_kodeoutlet ' +
        'FROM ben_hrd_karyawan_info k ' +
        'LEFT JOIN departemen d ON k.departemen = d.id_departemen ' +
        'WHERE k.active = ''Y'' ' +
        'ORDER BY k.idkaryawan ASC';
      qryInfo.Open;

      TotalCount := qryInfo.RecordCount;
      if TotalCount = 0 then
      begin
        lblSyncProgress.Caption := 'Tidak ada data karyawan aktif untuk disinkronkan.';
        ShowMessage('Tidak ditemukan data karyawan berstatus aktif (active = "Y").');
        Exit;
      end;

      // 2. Tahap Inisialisasi: Reset seluruh karyawan outlet ini di Cloud Supabase ke active = 'N'
      lblSyncProgress.Caption := 'Mereset status aktif karyawan di Cloud Supabase (outlet ' + frmMain.APP_OUTLETID + ')...';
      Application.ProcessMessages;

      JSONObj := SO();
      JSONObj.S['active'] := 'N';
      RequestBody := TStringStream.Create(JSONObj.AsJSON, TEncoding.UTF8);
      try
        Endpoint := BaseURL + 'ot_hrd_karyawan_info?kode_outlet=eq.' + frmMain.APP_OUTLETID;
        Resp := HTTP.Patch(Endpoint, RequestBody, nil, [
          TNameValuePair.Create('apikey', frmMain.SUPABASE_KEY),
          TNameValuePair.Create('Authorization', 'Bearer ' + frmMain.SUPABASE_KEY),
          TNameValuePair.Create('Content-Type', 'application/json')
        ]);

        if (Resp.StatusCode <> 200) and (Resp.StatusCode <> 204) then
        begin
          lblSyncProgress.Caption := Format('Gagal reset Cloud: HTTP %d', [Resp.StatusCode]);
          ShowMessage(Format('Gagal mereset status aktif karyawan di Cloud Supabase!' + #13#10 +
                             'Kode Outlet : %s' + #13#10 +
                             'Status HTTP : %d (%s)' + #13#10 +
                             'Pesan Server: %s', [frmMain.APP_OUTLETID, Resp.StatusCode, Resp.StatusText, Resp.ContentAsString]));
          Exit;
        end;
      finally
        RequestBody.Free;
      end;

      SetLength(Headers, 4);
      Headers[0] := TNameValuePair.Create('apikey', frmMain.SUPABASE_KEY);
      Headers[1] := TNameValuePair.Create('Authorization', 'Bearer ' + frmMain.SUPABASE_KEY);
      Headers[2] := TNameValuePair.Create('Content-Type', 'application/json');
      Headers[3] := TNameValuePair.Create('Prefer', 'resolution=merge-duplicates'); // Upsert mode

      HTTP.ConnectionTimeout := 7000;
      HTTP.ResponseTimeout := 12000;

      CurrentIdx := 0;
      SuccessCount := 0;
      FailCount := 0;

      while not qryInfo.Eof do
      begin
        Inc(CurrentIdx);
        sKodeKaryawan := qryInfo.FieldByName('kodekaryawan').AsString;
        sNamaKaryawan := qryInfo.FieldByName('namakaryawan').AsString;
        sKodeOutlet := Trim(qryInfo.FieldByName('dept_kodeoutlet').AsString);
        if sKodeOutlet = '' then
          sKodeOutlet := Trim(frmMain.APP_OUTLETID);

        lblSyncProgress.Caption := Format('Sinkronisasi [%d/%d]: %s - %s...', [CurrentIdx, TotalCount, sKodeKaryawan, sNamaKaryawan]);
        Application.ProcessMessages;

        try
          // A. Upsert ke ot_hrd_karyawan_info (Key: kodekaryawan)
          JSONObj := SO();
          JSONObj.S['kode_outlet'] := sKodeOutlet;
          JSONObj.S['kodekaryawan'] := sKodeKaryawan;
          JSONObj.S['idkaryawan'] := qryInfo.FieldByName('idkaryawan').AsString;
          JSONObj.S['namakaryawan'] := sNamaKaryawan;
          JSONObj.S['departemen'] := qryInfo.FieldByName('departemen').AsString;
          JSONObj.S['jadwaltetap'] := qryInfo.FieldByName('jadwaltetap').AsString;
          JSONObj.I['kodejadwal'] := qryInfo.FieldByName('kodejadwal').AsInteger;
          JSONObj.S['kodekontrak'] := qryInfo.FieldByName('kodekontrak').AsString;
          JSONObj.S['active'] := 'Y';

          if not qryInfo.FieldByName('isadmin').IsNull then
            JSONObj.S['isadmin'] := Trim(qryInfo.FieldByName('isadmin').AsString)
          else
            JSONObj.Null['isadmin'] := jNull;

          if not qryInfo.FieldByName('tglmasukkerja').IsNull then
            JSONObj.S['tglmasukkerja'] := FormatDateTime('yyyy-mm-dd', qryInfo.FieldByName('tglmasukkerja').AsDateTime)
          else
            JSONObj.Null['tglmasukkerja'] := jNull;

          if not qryInfo.FieldByName('tglhabiskontrak').IsNull then
            JSONObj.S['tglhabiskontrak'] := FormatDateTime('yyyy-mm-dd', qryInfo.FieldByName('tglhabiskontrak').AsDateTime)
          else
            JSONObj.Null['tglhabiskontrak'] := jNull;

          JSONObj.S['namabank'] := qryInfo.FieldByName('namabank').AsString;
          JSONObj.S['norek'] := qryInfo.FieldByName('norek').AsString;
          JSONObj.S['namarek'] := qryInfo.FieldByName('namarek').AsString;

          RequestBody := TStringStream.Create(JSONObj.AsJSON, TEncoding.UTF8);
          try
            Resp := HTTP.Post(BaseURL + 'ot_hrd_karyawan_info?on_conflict=kodekaryawan', RequestBody, nil, Headers);
            if (Resp.StatusCode = 200) or (Resp.StatusCode = 201) then
              Inc(SuccessCount)
            else
              Inc(FailCount);
          finally
            RequestBody.Free;
          end;

          // B. Sinkronisasi Data Detail dari ben_hrd_karyawan_details
          qryDetails.Close;
          qryDetails.SQL.Text := 'SELECT * FROM ben_hrd_karyawan_details WHERE kodekaryawan = :kdk';
          qryDetails.ParamByName('kdk').AsString := sKodeKaryawan;
          qryDetails.Open;

          // Fallback pencarian dengan idkaryawan jika kodekaryawan kosong di detail
          if qryDetails.IsEmpty then
          begin
            qryDetails.Close;
            qryDetails.SQL.Text := 'SELECT * FROM ben_hrd_karyawan_details WHERE idkaryawan = :idk';
            qryDetails.ParamByName('idk').AsString := qryInfo.FieldByName('idkaryawan').AsString;
            qryDetails.Open;
          end;

          if not qryDetails.IsEmpty then
          begin
            Endpoint := BaseURL + 'ot_hrd_karyawan_details?kodekaryawan=eq.' + sKodeKaryawan;
            Resp := HTTP.Get(Endpoint, nil, [
              TNameValuePair.Create('apikey', frmMain.SUPABASE_KEY),
              TNameValuePair.Create('Authorization', 'Bearer ' + frmMain.SUPABASE_KEY),
              TNameValuePair.Create('Content-Type', 'application/json')
            ]);

            JSONObj := SO();
            JSONObj.S['kode_outlet'] := sKodeOutlet;
            JSONObj.S['kodekaryawan'] := sKodeKaryawan;
            JSONObj.S['idkaryawan'] := qryDetails.FieldByName('idkaryawan').AsString;
            JSONObj.S['namakaryawan'] := qryDetails.FieldByName('namakaryawan').AsString;
            JSONObj.S['sex'] := qryDetails.FieldByName('sex').AsString;
            JSONObj.S['active'] := 'Y';
            JSONObj.S['noidentitas'] := qryDetails.FieldByName('noidentitas').AsString;
            JSONObj.S['alamatktp'] := qryDetails.FieldByName('alamatktp').AsString;
            JSONObj.S['alamattinggal'] := qryDetails.FieldByName('alamattinggal').AsString;
            JSONObj.S['telpfixline'] := qryDetails.FieldByName('telpfixline').AsString;
            JSONObj.S['telpponsel'] := qryDetails.FieldByName('telpponsel').AsString;
            JSONObj.S['tempatlahir'] := qryDetails.FieldByName('tempatlahir').AsString;

            if not qryDetails.FieldByName('tgllahir').IsNull then
              JSONObj.S['tgllahir'] := FormatDateTime('yyyy-mm-dd', qryDetails.FieldByName('tgllahir').AsDateTime)
            else
              JSONObj.Null['tgllahir'] := jNull;

            JSONObj.S['agamaid'] := qryDetails.FieldByName('agamaid').AsString;
            JSONObj.S['goldarah'] := qryDetails.FieldByName('goldarah').AsString;
            JSONObj.S['alamatemail'] := qryDetails.FieldByName('alamatemail').AsString;

            RequestBody := TStringStream.Create(JSONObj.AsJSON, TEncoding.UTF8);
            try
              if Resp.StatusCode = 200 then
              begin
                JSONArray := SA(Resp.ContentAsString);
                if (not Assigned(JSONArray)) or (JSONArray.Length = 0) then
                begin
                  HTTP.Post(BaseURL + 'ot_hrd_karyawan_details', RequestBody, nil, [
                    TNameValuePair.Create('apikey', frmMain.SUPABASE_KEY),
                    TNameValuePair.Create('Authorization', 'Bearer ' + frmMain.SUPABASE_KEY),
                    TNameValuePair.Create('Content-Type', 'application/json')
                  ]);
                end
                else
                begin
                  HTTP.Patch(Endpoint, RequestBody, nil, [
                    TNameValuePair.Create('apikey', frmMain.SUPABASE_KEY),
                    TNameValuePair.Create('Authorization', 'Bearer ' + frmMain.SUPABASE_KEY),
                    TNameValuePair.Create('Content-Type', 'application/json')
                  ]);
                end;
              end;
            finally
              RequestBody.Free;
            end;
          end;

        except
          on E: Exception do
          begin
            Inc(FailCount);
          end;
        end;

        qryInfo.Next;
      end;

      if FailCount = 0 then
        lblSyncProgress.Caption := Format('Selesai! Seluruh %d karyawan aktif berhasil disinkronkan ke Cloud.', [SuccessCount])
      else
        lblSyncProgress.Caption := Format('Selesai dengan catatan: %d sukses, %d gagal dari %d karyawan.', [SuccessCount, FailCount, TotalCount]);

      ShowMessage(Format('Sinkronisasi selesai!' + #13#10 +
                         '- Total Karyawan Aktif : %d' + #13#10 +
                         '- Berhasil Disinkronkan : %d' + #13#10 +
                         '- Gagal / Terlewat      : %d', [TotalCount, SuccessCount, FailCount]));
    except
      on E: Exception do
      begin
        lblSyncProgress.Caption := 'Gagal sinkronisasi: ' + E.Message;
        ShowMessage('Terjadi kesalahan saat sinkronisasi ke Cloud:' + #13#10 + E.Message);
      end;
    end;
  finally
    qryDetails.Free;
    qryInfo.Free;
    HTTP.Free;
    btnSyncCloud.Enabled := True;
  end;
end;

procedure TfrmMasterKaryawan.ckFilterPropertiesChange(Sender: TObject);
begin
  if (ckFilter.Checked = True) then
    begin
      qryKaryawan.Close;
      qryKaryawan.SQL.Clear;
      qryKaryawan.SQL.Add('select * from ben_hrd_karyawan_info ' +
          'where active = ''' + 'Y' + '''');
      qryKaryawan.Open;
      gtbKaryawan.DataController.Refresh;
    end
  else if (ckFilter.Checked = False) then
    begin
      qryKaryawan.Close;
      qryKaryawan.SQL.Clear;
      qryKaryawan.SQL.Add('select * from ben_hrd_karyawan_info');
      qryKaryawan.Open;
      gtbKaryawan.DataController.Refresh;
    end;
end;

procedure TfrmMasterKaryawan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryStaff1.Free;
  qryStaff2.Free;
  qryStaff3.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmMasterKaryawan.FormCreate(Sender: TObject);
begin
  lblSyncProgress.Caption := '';

  qryStaff1 := TMyQuery.Create(Self);
  qryStaff1.Connection := DMDB.dbInternal;
  qryStaff1.SQL.Add('select * from temptable');
  qryStaff1.Active := true;

  qryStaff2 := TMyQuery.Create(Self);
  qryStaff2.Connection := DMDB.dbInternal;
  qryStaff2.SQL.Add('select * from temptable');
  qryStaff2.Active := true;

  qryStaff3 := TMyQuery.Create(Self);
  qryStaff3.Connection := DMDB.dbInternal;
  qryStaff3.SQL.Add('select * from temptable');
  qryStaff3.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  tblOutlet.Active := true;
  tblJadwalTetap.Active := True;
  tblKontrak.Active := True;
  tblDepartemen.Active := True;
  qryKaryawan.Active := True;
  gtbKaryawan.DataController.Refresh;
end;

end.
