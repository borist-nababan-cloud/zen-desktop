unit FPayrollAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxTextEdit, cxDBLookupComboBox,
  cxCalendar, cxCalc, cxCheckBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, DB, DBAccess,
  cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxPC,
  cxProgressBar,ShellApi, cxGridExportLink, cxGridBandedTableView, DateUtils,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxBarBuiltInMenu, MemDS, MyAccess;

type
  TfrmPayrollAdmin = class(TForm)
    lblJudulForm: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    edPeriode: TComboBox;
    Label1: TLabel;
    edStart: TcxDateEdit;
    Label2: TLabel;
    edEnd: TcxDateEdit;
    Label3: TLabel;
    edLama: TcxCalcEdit;
    Button1: TButton;
    tabControl: TcxPageControl;
    tbDivisi: TcxTabSheet;
    edDepartemen: TcxLookupComboBox;
    btnDivisi: TButton;
    tbKaryawan: TcxTabSheet;
    lblKodeKaryawan: TLabel;
    lblIDFinger: TLabel;
    lblNamaKaryawan: TLabel;
    btnCariKaryawan: TButton;
    btnLoadKode: TButton;
    tbAll: TcxTabSheet;
    btnLoadAll: TButton;
    prog1: TcxProgressBar;
    dlgSave: TSaveDialog;
    Button2: TButton;
    btnPotongan: TButton;
    btnTambahan: TButton;
    Label4: TLabel;
    edLibNas: TcxCalcEdit;
    gtvRekap: TcxGridBandedTableView;
    gtvRekapKode: TcxGridBandedColumn;
    gtvRekapIDFinger: TcxGridBandedColumn;
    gtvRekapDivisi: TcxGridBandedColumn;
    gtvRekapNama: TcxGridBandedColumn;
    gtvRekapType: TcxGridBandedColumn;
    gtvRekapVarGapok: TcxGridBandedColumn;
    gtvRekapVarTunjangan: TcxGridBandedColumn;
    gtvRekapVarTransport: TcxGridBandedColumn;
    gtvRekapVarPot1: TcxGridBandedColumn;
    gtvRekapVarPot2: TcxGridBandedColumn;
    gtvRekapVarTamb: TcxGridBandedColumn;
    gtvRekapVarOT: TcxGridBandedColumn;
    gtvRekapIjinSakit: TcxGridBandedColumn;
    gtvRekapKomisi: TcxGridBandedColumn;
    gtvRekapOff: TcxGridBandedColumn;
    gtvRekapLibNas: TcxGridBandedColumn;
    gtvRekapHKerja: TcxGridBandedColumn;
    gtvRekapHarusKerja: TcxGridBandedColumn;
    gtvRekapCuti: TcxGridBandedColumn;
    gtvRekapNormal: TcxGridBandedColumn;
    gtvRekapOvertime: TcxGridBandedColumn;
    gtvRekapFullOvertime: TcxGridBandedColumn;
    gtvRekapUnderTime: TcxGridBandedColumn;
    gtvRekapLate1: TcxGridBandedColumn;
    gtvRekapLate2: TcxGridBandedColumn;
    gtvRekapIjinMasuk: TcxGridBandedColumn;
    gtvRekapIjinKeluar: TcxGridBandedColumn;
    gtvRekapIjinTM: TcxGridBandedColumn;
    gtvRekapIjinPulang: TcxGridBandedColumn;
    gtvRekapAlpa: TcxGridBandedColumn;
    gtvRekapDenda: TcxGridBandedColumn;
    gtvRekapPotLain: TcxGridBandedColumn;
    gtvRekapTambLain: TcxGridBandedColumn;
    gtvRekapNUM: TcxGridBandedColumn;
    gtvRekapNLembur: TcxGridBandedColumn;
    gtvRekapTHP: TcxGridBandedColumn;
    gtvRekapKeterangan: TcxGridBandedColumn;
    gtvRekapVarUM: TcxGridBandedColumn;
    gtvRekapNGapok: TcxGridBandedColumn;
    gtvRekapNGPLibNas: TcxGridBandedColumn;
    gtvRekapIjinTA: TcxGridBandedColumn;
    gtvRekapNUMLibNas: TcxGridBandedColumn;
    gtvRekapNFOT: TcxGridBandedColumn;
    gtvRekapVarTHP: TcxGridBandedColumn;
    gtvRekapHOT: TcxGridBandedColumn;
    gtvRekapHUM: TcxGridBandedColumn;
    gtvRekapUMx3: TcxGridBandedColumn;
    gtvRekapHCashIn: TcxGridBandedColumn;
    gtvRekapNoRek: TcxGridBandedColumn;
    gtvRekapNamaRek: TcxGridBandedColumn;
    gtvRekapBank: TcxGridBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    StylePotongan: TcxStyle;
    styleTotal: TcxStyle;
    StyleRekening: TcxStyle;
    edMerge: TComboBox;
    ckMerge: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPeriodeChange(Sender: TObject);
    procedure btnDivisiClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnPotonganClick(Sender: TObject);
    procedure btnTambahanClick(Sender: TObject);
    procedure btnCariKaryawanClick(Sender: TObject);
    procedure btnLoadKodeClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnLoadAllClick(Sender: TObject);
  private
    { Private declarations }
    qryTemp1, qryTemp2, qryTemp3, qryGaji, qryPay, qryExec : TMyQuery;
    IDKARYAWAN, IDFINGER, NAMA, DIVISI : String;
    NEWREC, RECSELECT : Integer;
    procedure UpdatePeriode();
    procedure CariGaji();
    procedure CariRekap();
    procedure HitungGaji1();
    procedure HitungGaji2();
    procedure HitungGaji3();
    procedure HitungGaji4();
    procedure HitungGaji5();
    procedure HitungGaji6();
    procedure HitungGaji7();
    procedure HitungGaji8();
    procedure HitungGaji9();
    procedure HitungGaji10();
    procedure MergePeriode();
  public
    { Public declarations }
    ISADMIN : String;
  end;

var
  frmPayrollAdmin: TfrmPayrollAdmin;

implementation

{$R *.dfm}

uses FdmDB, FMain, FPayrollPotongan, FPayrollTambahan, FMasterKaryawan;

procedure TfrmPayrollAdmin.MergePeriode;
var
  i, nSelect : Integer;
  potongan : Variant;
  idKaryawan, Keterangan : String;
  sAwal, sCashIn, sLast, nTHP, nPot, toPot : Double;
begin
  gtvRekap.DataController.GotoFirst;
  for i := 0 to gtvRekap.DataController.RecordCount - 1 do
     begin
       sAwal := 0;
       sCashIn := 0;
       sLast := 0;
       nTHP := 0;
       nPot := 0;
       toPot := 0;
       nSelect := gtvRekap.DataController.GetFocusedRecordIndex;
       idKaryawan := vartostr(gtvRekap.DataController.GetValue(nSelect, gtvRekapKode.Index));
       nTHP := gtvRekap.DataController.GetValue(nSelect, gtvRekapTHP.Index);
       qryTemp3.Close;
       qryTemp3.SQL.Clear;
       qryTemp3.SQL.Add('select sum(nilai) from ben_payroll_potongan where payrollperiode = ''' +
           edPeriode.Text + ''' AND idkaryawan = ''' + idKaryawan + '''');
       qryTemp3.Open;
       if (NOT qryTemp3.IsEmpty) then nPot := qryTemp3.Fields[0].AsFloat;
       
       qryTemp1.Close;
       qryTemp1.SQL.Clear;
       qryTemp1.SQL.Add('select nilaithp from ben_payroll_details where payrollperiode = ''' +
          edMerge.Text + ''' AND kodekaryawan = ''' + idKaryawan + '''');
       qryTemp1.Open;

       if (qryTemp1.IsEmpty) then sAwal := 0
       else if (NOT qryTemp1.IsEmpty) then sAwal := qryTemp1.Fields[0].AsFloat;

       qryTemp2.Close;
       qryTemp2.SQL.Clear;
       qryTemp2.SQL.Add('select nilaithp from ben_payroll_cashin where payrollperiode = ''' +
          edMerge.Text + ''' AND kodekaryawan = ''' + idKaryawan + '''');
       qryTemp2.Open;
       if (qryTemp2.IsEmpty) then sCashIn := 0
       else if (NOT qryTemp2.IsEmpty) then sCashIn := qryTemp1.Fields[0].AsFloat;
       toPot := nPot + sAwal + sCashIn;

       sLast := nTHP - toPot;
       gtvRekap.DataController.SetValue(nSelect, gtvRekapPotLain.Index, toPot);
       gtvRekap.DataController.SetValue(nSelect, gtvRekapTHP.Index, sLast);
       {gtvRekap.DataController.SetValue(nSelect, gtvRekapKeterangan.Index, 'Potongan Include ' +
           'Potongan Salary Periode sebelum nya');}
       gtvRekap.DataController.PostEditingData;
       gtvRekap.DataController.Post(True);
       gtvRekap.DataController.GotoNext;
     end;
end;

procedure TfrmPayrollAdmin.HitungGaji1;
var
  vGP, vUM, nHK, nGP, nUM, vLembur, nLembur, jLembur, vPot2, vBPJS, vTunj,
  vTambLain, vPotLain, vSaving, vKomisi, vTransport, vDenda, nTHP, hUM, hLate1,
  hLate2, hTA, hUT, hSakit, hHrsKerja, vUM3 : Double;
begin
  //HK
  vGP:=0; vUM:=0; nHK:=0; nGP:=0; nUM:=0; vLembur:=0; nLembur:=0; jLembur:=0;
  vPot2:=0; vBPJS:=0; vTunj:=0;
  vTambLain:=0; vPotLain:=0; vSaving:=0; vKomisi:=0; vTransport:=0;
  vDenda:=0; nTHP:=0; hUM:=0; hLate1:=0;
  hLate2:=0; hTA:=0; hUT :=0; hSakit :=0; vUM3 :=0;
  vBPJS := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTamb.Index);
  vTunj := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTunjangan.Index);
  vSaving := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot1.Index);
  vPot2 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot2.Index);
  vKomisi := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapKomisi.Index);
  vTambLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapTambLain.Index);
  vPotLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapPotLain.Index);
  vTransport := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTransport.Index);
  vDenda := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapDenda.Index);
  vGP := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarGapok.Index);
  vUM := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarUM.Index);
  vLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarOT.Index);
  hLate1 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLate1.Index);
  hLate2 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLate2.Index);
  hTA := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinTA.Index);
  hUT := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUnderTime.Index);
  hSakit := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinSakit.Index);
  jLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOvertime.Index);
  hHrsKerja := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHarusKerja.Index);
  nHK := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHKerja.Index);
  vUM3 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUMx3.Index);
  nGP := nHK * vGP;
  hUM := nHK - hLate1 - hTA - hUT - hSakit;
  nUM := vUM * hUM;
  nLembur := vLembur * jLembur;

  nTHP := nGP + nUM + nLembur + + vTunj + vBPJS + vKomisi + vTambLain + vTransport -
        vSaving - vPot2 - vDenda - vPotLain + vUM3;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapHUM.Index, hUM);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNGapok.Index, nGP);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNUM.Index, nUM);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNLembur.Index, nLembur);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapTHP.Index, nTHP);
  gtvRekap.DataController.PostEditingData;
  gtvRekap.DataController.Post(True);
end;

procedure TfrmPayrollAdmin.HitungGaji2;
var
  vGP, vUM, nHK, nGP, nUM, vLembur, nLembur, jLembur, vPot2, vBPJS, vTunj,
  vTambLain, vPotLain, vSaving, vKomisi, vTransport, vDenda, nTHP,
  nGPLibNas, vOff, vHarusKerja, vGPHarian, VIjin, vHariGP, vHLinNas, nUMLibNas,
  vFOT, nFOT, vGPBulanan, hUM, hLate1, hLate2, hTA, hUT, hSakit,vUM3 : Double;
begin
  {MTC}
  vGP := 0; vUM:=0;
  nHK := 0; nGP:=0; nUM:=0; vLembur:=0;nLembur:=0; jLembur:=0;
  vPot2 := 0; vBPJS:=0; vTunj:=0;
  vTambLain :=0; vPotLain:=0; vSaving:=0; vKomisi:=0; vTransport:=0; vDenda:=0;
  nTHP:=0;nGPLibNas:=0; vOff:=0; vHarusKerja:=0; vGPHarian:=0; VIjin:=0;
  vHariGP:=0; vHLinNas:=0; nUMLibNas:=0; vFOT :=0; nFOT:=0; vGPBulanan := 0;
  hUM:=0; hLate1:=0; hLate2:=0; hTA:=0; hUT:=0;
  hSakit :=0; vUM3 := 0;
  vBPJS := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTamb.Index);
  vTunj := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTunjangan.Index);
  vSaving := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot1.Index);
  vPot2 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot2.Index);
  vKomisi := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapKomisi.Index);
  vTambLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapTambLain.Index);
  vPotLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapPotLain.Index);
  vTransport := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTransport.Index);
  vDenda := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapDenda.Index);
  vGP := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTHP.Index);
  vUM := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarUM.Index);
  vLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarOT.Index);
  vOff := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOff.Index);
  vHarusKerja := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHarusKerja.Index);
  vHLinNas := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLibNas.Index);
  jLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOvertime.Index);
  vUM3 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUMx3.Index);
  vGPBulanan := vGP - (vHarusKerja * vUM);
  {vHariGP := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHKerja.Index) +
               gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinSakit.Index) -
               gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinTA.Index) -
               gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUnderTime.Index) -
               gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLate2.Index);}
  vFOT := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapFullOvertime.Index);
  nHK := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHKerja.Index);
  //nGP := (vGPBulanan / vHarusKerja) * vHariGP;
  nGP := (vGPBulanan / vHarusKerja) * (nHK + vFOT);
  //vGPHarian := (vGPBulanan / vHarusKerja) * vHariGP;
  vGPHarian := (vGPBulanan / vHarusKerja) * nHK;
  hLate1 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLate1.Index);
  hLate2 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLate2.Index);
  hTA := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinTA.Index);
  hUT := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUnderTime.Index);
  hSakit := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinSakit.Index);
  //hUM := nHK - hLate2 - hTA - hUT - hSakit - hLate1;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNGapok.Index, nGP);

  hUM := nHK - hLate1 - hTA - hUT - hSakit + vFOT;
  nUM := hUM * vUM;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNUM.Index, nUM);
  nGPLibNas := vHLinNas * (vGPBulanan / vHarusKerja * 0.5);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNGPLibNas.Index, nGPLibNas);
  nUMLibNas := vHLinNas * (vUM * 0.5);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNUMLibNas.Index, nUMLibNas);
  //nLembur := jLembur * (vGPBulanan / vHarusKerja * 0.3);
  nLembur := vLembur * jLembur;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNLembur.Index, nLembur);

  nFOT := vFOT * (((vGPBulanan / vHarusKerja) + vUM) * 0.7);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNFOT.Index, nFOT);

  nTHP := vBPJS + vTambLain + vTunj + vTransport - vSaving - vPot2 - vPotLain +
          nGP + nUM + nLembur + nGPLibNas + nUMLibNas + nFOT - vDenda + vUM3;

  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapTHP.Index, nTHP);
end;

procedure TfrmPayrollAdmin.HitungGaji3;
var
  vGP, vUM, nHK, nGP, nUM, vLembur, nLembur, jLembur, vPot2, vBPJS, vTunj,
  vTambLain, vPotLain, vSaving, vKomisi, vTransport, vDenda, nTHP,
  nGPLibNas, vOff, vHarusKerja, vGPHarian, VIjin, vHariGP, vHLinNas, nUMLibNas,
  vFOT, nFOT, vGPBulanan, hUM, hLate1, hLate2, hTA, hUT, hSakit, hCashIn, vUM3 : Double;
begin
    //ADM
  vGP := 0; vUM:=0;
  nHK := 0; nGP:=0; nUM:=0; vLembur:=0;nLembur:=0; jLembur:=0;
  vPot2 := 0; vBPJS:=0; vTunj:=0;
  vTambLain :=0; vPotLain:=0; vSaving:=0; vKomisi:=0; vTransport:=0; vDenda:=0;
  nTHP:=0;nGPLibNas:=0; vOff:=0; vHarusKerja:=0; vGPHarian:=0; VIjin:=0;
  vHariGP:=0; vHLinNas:=0; nUMLibNas:=0; vFOT :=0; nFOT:=0; vGPBulanan := 0;
  hUM:=0; hLate1:=0; hLate2:=0; hTA:=0; hUT:=0; vUM3 :=0;
  hSakit :=0;
  hCashIn := 0;
  vBPJS := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTamb.Index);
  vTunj := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTunjangan.Index);
  vSaving := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot1.Index);
  vPot2 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot2.Index);
  vKomisi := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapKomisi.Index);
  vTambLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapTambLain.Index);
  vPotLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapPotLain.Index);
  vTransport := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTransport.Index);
  vDenda := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapDenda.Index);
  vGP := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTHP.Index);
  vUM := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarUM.Index);
  vLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarOT.Index);
  vOff := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOff.Index);
  vHarusKerja := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHarusKerja.Index);
  vHLinNas := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLibNas.Index);
  jLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOvertime.Index);
  vFOT := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapFullOvertime.Index);
  vUM3 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUMx3.Index);
  vGPBulanan := vGP - (vHarusKerja * vUM);
  {vHariGP := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHKerja.Index) +
               gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinSakit.Index) -
               gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinTA.Index) -
               gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUnderTime.Index) -
               gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLate2.Index);}

  nHK := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHKerja.Index);
  //nGP := (vGPBulanan / vHarusKerja) * vHariGP;
  nGP := (vGPBulanan / vHarusKerja) * nHK;
  //vGPHarian := (vGPBulanan / vHarusKerja) * vHariGP;
  hCashIn := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHCashIn.Index);
  vGPHarian := (vGPBulanan / vHarusKerja) * nHK;
  hLate1 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLate1.Index);
  hLate2 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLate2.Index);
  hTA := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinTA.Index);
  hUT := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUnderTime.Index);
  hSakit := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinSakit.Index);
  //hUM := nHK - hLate2 - hTA - hUT - hSakit;
  //hUM := vHarusKerja - hLate1 - hTA - hUT - hSakit - hLate2;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNGapok.Index, nGP);
  hUM := nHK - hLate1 - hTA - hUT - hSakit;
  nUM := hUM * vUM;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNUM.Index, nUM);
  nGPLibNas := vHLinNas * (vGPBulanan / vHarusKerja * 0.5);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNGPLibNas.Index, nGPLibNas);
  nUMLibNas := vHLinNas * (vUM * 0.5);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNUMLibNas.Index, nUMLibNas);
  nLembur := jLembur * (vGPBulanan / vHarusKerja * 0.3);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNLembur.Index, nLembur);

  nFOT := vFOT * (((vGPBulanan / vHarusKerja) + vUM) * 0.7);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNFOT.Index, nFOT);

  nTHP := vBPJS + vTambLain + vTunj + vTransport - vSaving - vPot2 - vPotLain +
          nGP + nUM + nLembur + nGPLibNas + nUMLibNas + nFOT - vDenda + vUM3;

  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapTHP.Index, nTHP);
end;

procedure TfrmPayrollAdmin.HitungGaji4;
var
  vGP, vUM, nHK, nGP, nUM, vLembur, nLembur, jLembur, vPot2, vBPJS, vTunj,
  vTambLain, vPotLain, vSaving, vKomisi, vTransport, vDenda, nTHP,
  nGPLibNas, vOff, vHarusKerja, vGPHarian, VIjin, vHariGP, vHLinNas, nUMLibNas,
  vFOT, nFOT, vGPBulanan, hUM, hLate1, hLate2, hTA, hUT, hSakit, vUM3 : Double;
begin
  {TR}
  vGP := 0; vUM:=0;
  nHK := 0; nGP:=0; nUM:=0; vLembur:=0;nLembur:=0; jLembur:=0;
  vPot2 := 0; vBPJS:=0; vTunj:=0;
  vTambLain :=0; vPotLain:=0; vSaving:=0; vKomisi:=0; vTransport:=0; vDenda:=0;
  nTHP:=0;nGPLibNas:=0; vOff:=0; vHarusKerja:=0; vGPHarian:=0; VIjin:=0;
  vHariGP:=0; vHLinNas:=0; nUMLibNas:=0; vFOT :=0; nFOT:=0; vGPBulanan := 0;
  hUM:=0; hLate1:=0; hLate2:=0; hTA:=0; hUT:=0; vUM3 := 0;

  vBPJS := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTamb.Index);
  vTunj := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTunjangan.Index);
  vSaving := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot1.Index);
  vPot2 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot2.Index);
  vKomisi := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapKomisi.Index);
  vTambLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapTambLain.Index);
  vPotLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapPotLain.Index);
  vTransport := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTransport.Index);
  vDenda := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapDenda.Index);
  vGP := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarGapok.Index);
  vUM := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarUM.Index);
  vLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarOT.Index);
  vOff := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOff.Index);
  vHarusKerja := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHarusKerja.Index);
  vHLinNas := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLibNas.Index);
  jLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOvertime.Index);
  vUM3 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUMx3.Index);
  vGPBulanan := vGP - (vHarusKerja * vUM);

  nHK := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHKerja.Index);
  nGP := (vGP / vHarusKerja) * nHK;
  //vGPHarian := (vGPBulanan / vHarusKerja) * nHK;
  hLate1 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLate1.Index);
  hLate2 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapLate2.Index);
  hTA := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinTA.Index);
  hUT := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUnderTime.Index);
  hSakit := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapIjinSakit.Index);

  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNGapok.Index, nGP);

  hUM := nHK - hLate1 - hTA - hUT - hSakit;
  nUM := hUM * vUM;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapHUM.Index, hUM);
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNUM.Index, nUM);
  nGPLibNas := 0;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNGPLibNas.Index, nGPLibNas);
  nUMLibNas := 0;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNUMLibNas.Index, nUMLibNas);
  nLembur := vLembur * jLembur;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNLembur.Index, nLembur);
  vFOT := 0;
  nFOT := 0;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNFOT.Index, nFOT);

  nTHP := vBPJS + vTambLain + vTunj + vTransport - vSaving - vPot2 - vPotLain +
          nGP + nUM + nLembur + nGPLibNas + nUMLibNas + nFOT - vDenda + vKomisi + vUM3;

  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapTHP.Index, nTHP);
end;

procedure TfrmPayrollAdmin.HitungGaji5;
var
  vGP, vUM, nHK, nGP, nUM, vLembur, nLembur, jLembur, vPot2, vBPJS, vTunj,
  vTambLain, vPotLain, vSaving, vKomisi, vTransport, vDenda, nTHP,
  nGPLibNas, vOff, vHarusKerja, vGPHarian, VIjin, vHariGP, vHLinNas, nUMLibNas,
  vFOT, nFOT, vGPBulanan, hUM, hLate1, hLate2, hTA, hUT, hSakit, vUM3 : Double;
  intLama, intPeriode : Integer;
begin
   {SC-1}

  intPeriode := edLama.EditValue;
  {if (intLama < 28) then intPeriode := 30
  else if (intLama >= 30) then intPeriode := edLama.EditValue;}

  vGP := 0; vUM:=0;
  nHK := 0; nGP:=0; nUM:=0; vLembur:=0;nLembur:=0; jLembur:=0;
  vPot2 := 0; vBPJS:=0; vTunj:=0;
  vTambLain :=0; vPotLain:=0; vSaving:=0; vKomisi:=0; vTransport:=0; vDenda:=0;
  nTHP:=0;nGPLibNas:=0; vOff:=0; vHarusKerja:=0; vGPHarian:=0; VIjin:=0;
  vHariGP:=0; vHLinNas:=0; nUMLibNas:=0; vFOT :=0; nFOT:=0; vGPBulanan := 0;
  hUM:=0; hLate1:=0; hLate2:=0; hTA:=0; hUT:=0;
  hSakit :=0; vUM3 := 0;

  vBPJS := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTamb.Index);
  vTunj := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTunjangan.Index);
  vSaving := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot1.Index);
  vPot2 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot2.Index);
  vTambLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapTambLain.Index);
  vPotLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapPotLain.Index);
  vTransport := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTransport.Index);
  vDenda := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapDenda.Index);
  vGP := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarGapok.Index);
  vUM := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarUM.Index);
  nHK := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHKerja.Index);
  vLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarOT.Index);
  vOff := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOff.Index);
  vUM3 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUMx3.Index);
  vHarusKerja := intPeriode - vOff;
  nGP := vGP / vHarusKerja * nHK;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNGapok.Index, nGP);

  jLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOvertime.Index);
  nLembur := vGP / vHarusKerja / 12 * jLembur;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNLembur.Index, nLembur);

  nTHP := vBPJS + vTambLain + vTunj + vTransport - vSaving - vPot2 - vPotLain +
          nGP + nLembur - vDenda + vUM3;

  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapTHP.Index, nTHP);
end;

procedure TfrmPayrollAdmin.HitungGaji6;
var
  vGP, nTHP : Double;
  intLama, intPeriode : Integer;
begin
  {flat}
  intLama := edLama.EditValue;
  vGP := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTHP.Index);

  if (intLama < 30) then
    begin
      intPeriode := 30;
      nTHP := (vGP / intPeriode) * intLama;
    end
  else if (intLama >= 30) then
    begin
      intPeriode := edLama.EditValue;
       nTHP := vGP;
    end;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapTHP.Index, nTHP);
  gtvRekap.DataController.PostEditingData;
  gtvRekap.DataController.Post(True);
end;

procedure TfrmPayrollAdmin.HitungGaji7;
begin
     //
end;

procedure TfrmPayrollAdmin.HitungGaji8;
var
  vGP, vUM, nHK, nGP, nUM, vLembur, nLembur, jLembur, vPot2, vBPJS, vTunj,
  vTambLain, vPotLain, vSaving, vKomisi, vTransport, vDenda, nTHP,
  nGPLibNas, vOff, vHarusKerja, vGPHarian, VIjin, vHariGP, vHLinNas, nUMLibNas,
  vFOT, nFOT, vGPBulanan, hUM, hLate1, hLate2, hTA, hUT, hSakit, vUM3 : Double;
  intLama, intPeriode : Integer;
begin
  {SC-2}
  intPeriode := edLama.EditValue;
  {if (intLama < 30) then intPeriode := 30
  else if (intLama >= 30) then intPeriode := edLama.EditValue;}

  vGP := 0; vUM:=0;
  nHK := 0; nGP:=0; nUM:=0; vLembur:=0;nLembur:=0; jLembur:=0;
  vPot2 := 0; vBPJS:=0; vTunj:=0;
  vTambLain :=0; vPotLain:=0; vSaving:=0; vKomisi:=0; vTransport:=0; vDenda:=0;
  nTHP:=0;nGPLibNas:=0; vOff:=0; vHarusKerja:=0; vGPHarian:=0; VIjin:=0;
  vHariGP:=0; vHLinNas:=0; nUMLibNas:=0; vFOT :=0; nFOT:=0; vGPBulanan := 0;
  hUM:=0; hLate1:=0; hLate2:=0; hTA:=0; hUT:=0;
  hSakit :=0; vUM3 := 0;

  vBPJS := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTamb.Index);
  vTunj := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTunjangan.Index);
  vSaving := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot1.Index);
  vPot2 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarPot2.Index);
  vTambLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapTambLain.Index);
  vPotLain := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapPotLain.Index);
  vTransport := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarTransport.Index);
  vDenda := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapDenda.Index);
  vGP := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarGapok.Index);
  vUM := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarUM.Index);
  nHK := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapHKerja.Index);
  vLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapVarOT.Index);
  vOff := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOff.Index);
  vUM3 := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapUMx3.Index);
  vHarusKerja := intPeriode - vOff;
  nGP := vGP / vHarusKerja * nHK;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNGapok.Index, nGP);

  {jLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOvertime.Index);
  nLembur := vGP / vHarusKerja / 10 * jLembur;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNLembur.Index, nLembur);

  nTHP := vBPJS + vTambLain + vTunj + vTransport - vSaving - vPot2 - vPotLain +
          nGP + nLembur - vDenda;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapTHP.Index, nTHP);}
  jLembur := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapOvertime.Index);
  nLembur := vGP / vHarusKerja / 10 * jLembur;
  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapNLembur.Index, nLembur);

  nTHP := vBPJS + vTambLain + vTunj + vTransport - vSaving - vPot2 - vPotLain +
          nGP + nLembur - vDenda + vUM3;

  gtvRekap.DataController.SetValue(RECSELECT, gtvRekapTHP.Index, nTHP);
end;

procedure TfrmPayrollAdmin.HitungGaji9;
begin

end;

procedure TfrmPayrollAdmin.HitungGaji10;
begin

end;

procedure TfrmPayrollAdmin.CariRekap;
var
  x : Integer;
  denda, hKerja, hcuti, hoff, normal, hHrsKerja, hIjinMsk, hIjinPulang, hLate1,
  hLate2, halpa, hFOT, hOverTime, hSakit, hIjinTdkMsk, hUnder, jkIP,
  hCasIn, hIKeluar, hUM3, vUM : Double;
begin
  {DMDB.qryExec.SQL.Clear;
  DMDB.qryExec.SQL.Add('update ben_presensi_rekap set ' +
          'payrollperiode = ''' + edPeriode.Text + ''' ' +
          'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
          ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''';');

  DMDB.qryExec.SQL.Add('update ben_payroll_um3 set ' +
          'payrollperiode = ''' + edPeriode.Text + ''' ' +
          'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
          ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''';');
  DMDB.qryExec.ExecSQL;}

  denda:=0; hKerja:=0; hcuti:=0; hoff:=0; normal:=0;
  hHrsKerja:=0; hIjinMsk:=0; hIjinPulang:=0; hLate1 :=0; hLate2 :=0;
  halpa:=0; hFOT:=0; hOverTime:=0; hSakit := 0; hUnder :=0;
  jkIP :=0; hIKeluar :=0; hUM3 :=0; vUM :=0;
  //cari off
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'OFF' +
      ''' AND tagresult <> ''' + 'CI' +'''');
  qryTemp2.Open;
  hoff := qryTemp2.Fields[0].AsFloat;
  hHrsKerja := edLama.EditValue - qryTemp2.Fields[0].AsFloat;
  {if (edLama.EditValue < 30) then
    begin
      hHrsKerja := 30 - qryTemp2.Fields[0].AsFloat;
    end
  else if (edLama.EditValue >= 30) then
    begin
      hHrsKerja := edLama.EditValue - qryTemp2.Fields[0].AsFloat;
    end;}
  if (edLama.EditValue < 28) then
      begin
        hHrsKerja := 30 - qryTemp2.Fields[0].AsFloat;
      end;



  gtvRekap.DataController.SetValue(NEWREC, gtvRekapHarusKerja.Index, hHrsKerja);
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapOff.Index, hoff);

//------------------------------------------------------------------------------------------------
  //cari komisi
  qryTemp3.Close;
  qryTemp3.SQL.Clear;
  qryTemp3.SQL.Add('select sum(komisi) as komisi from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' and tagresult <> ''' + 'CI' + '''');
  qryTemp3.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapKomisi.Index, qryTemp3.Fields[0].AsFloat);
//------------------------------------------------------------------------------------------------
  //cari cuti
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'C' + '''');
  qryTemp2.Open;
  hcuti := qryTemp2.Fields[0].AsFloat;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapCuti.Index, hcuti);

//------------------------------------------------------------------------------------------------
  //cari normal
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'N' + '''');
  qryTemp2.Open;
  //gtvRekap.DataController.SetValue(NEWREC, gtvRekapCuti.Index, qryTemp2.Fields[0].AsFloat);
  normal := qryTemp2.Fields[0].AsFloat;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapNormal.Index, normal);
  //gtvRekap.DataController.SetValue(NEWREC, gtvRekapHarusKerja.Index, hKerja);
//------------------------------------------------------------------------------------------------
//cari alpa
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'A' + '''');
  qryTemp2.Open;
  qryTemp3.Close;
  qryTemp3.SQL.Clear;
  qryTemp3.SQL.Add('select denda from ben_presensi_tag where tagid = ''' + 'A' +
    '''');
  qryTemp3.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapAlpa.Index, qryTemp2.Fields[0].AsFloat);
  denda := qryTemp2.Fields[0].AsFloat * qryTemp3.Fields[0].AsFloat;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapDenda.Index, denda);
  halpa := qryTemp2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
//cari ijim masuk
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'IM' + '''');
  qryTemp2.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinMasuk.Index, qryTemp2.Fields[0].AsFloat);
  hIjinMsk := qryTemp2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
//cari cash in
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select tglstart, tglend from ben_payroll_cashin ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + '''');
  qryTemp2.Open;
  if (qryTemp2.IsEmpty) then
    begin
      hCasIn := 0;
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapHCashIn.Index, hCasIn);
    end
  else if (NOT qryTemp2.IsEmpty) then
    begin
      hCasIn := DaysBetween(qryTemp2.Fields[0].AsDateTime, qryTemp2.Fields[1].AsDateTime) + 1;
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapHCashIn.Index, hCasIn);
    end;

  //hCasIn := qryTemp2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
//cari ijin pulang
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select jkreal from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'IP' + '''');
  qryTemp2.Open;
  qryTemp2.First;
  hIjinPulang := 0;
  for x := 0 to qryTemp2.RecordCount - 1 do
    begin
      if (qryTemp2.Fields[0].AsFloat >= 4) then
        begin
          jkIP := qryTemp2.Fields[0].AsFloat;
          hIjinPulang := hIjinPulang + (1- ((9 - jkIP)/9));
        end
      else if (qryTemp2.Fields[0].AsFloat < 4) then
        begin
          hIjinPulang := hIjinPulang + 0;
        end;
      qryTemp2.Next;
    end;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinPulang.Index, hIjinPulang);

//------------------------------------------------------------------------------------------------
//cari ijin keluar
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select jkreal from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'IK' + '''');
  qryTemp2.Open;
  qryTemp2.First;
  hIKeluar := 0;
  for x := 0 to qryTemp2.RecordCount - 1 do
    begin
      if (qryTemp2.Fields[0].AsFloat >= 4) then
        begin
          jkIP := qryTemp2.Fields[0].AsFloat;
          hIKeluar := 1 - ((9 - jkIP)/9);
        end
      else if (qryTemp2.Fields[0].AsFloat < 4) then
        begin
          hIKeluar := hIKeluar + 0;
        end;
      qryTemp2.Next;
    end;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinKeluar.Index, hIKeluar);

//------------------------------------------------------------------------------------------------

//cari ijin tidak masuk
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'IT' + '''');
  qryTemp2.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinTM.Index, qryTemp2.Fields[0].AsFloat);
  hIjinTdkMsk := qryTemp2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------

//cari ijin sakit
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'S' + '''');
  qryTemp2.Open;
  hSakit := qryTemp2.Fields[0].AsFloat;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinSakit.Index, hSakit);

//------------------------------------------------------------------------------------------------
//cari iji tidak absen
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'IB' + '''');
  qryTemp2.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinTA.Index, qryTemp2.Fields[0].AsFloat);
  hIjinTdkMsk := qryTemp2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------

//cari undertime
qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'U' + '''');
  qryTemp2.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapUnderTime.Index, qryTemp2.Fields[0].AsFloat);
  hUnder :=  qryTemp2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
//cari terlambat
qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'T' + '''');
  qryTemp2.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapLate1.Index, qryTemp2.Fields[0].AsFloat);
  hLate1 := qryTemp2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
//cari terlambat > 30
qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult = ''' + 'T2' + '''');
  qryTemp2.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapLate2.Index, qryTemp2.Fields[0].AsFloat);
  hLate2 := qryTemp2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
//masuk libur nasional
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagresult <> ''' + 'A' +
      ''' AND tagresult <> ''' + 'IT' +
      ''' AND tagresult <> ''' + 'C' +
      ''' AND tagresult <> ''' + 'S' +
      ''' AND tagresult <> ''' + 'OFF' +
      ''' AND tagresult <> ''' + 'OUT' +
      ''' AND tagresult <> ''' + 'CI' +
      ''' AND libnas = ''' + 'Y' + '''');
  qryTemp2.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapLibNas.Index, qryTemp2.Fields[0].AsFloat);

//------------------------------------------------------------------------------------------------
//cari overtime
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select sum(selkeluar) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagkeluar = ''' + 'OT' + ''' AND tagresult <> ''' + 'CI' +
      ''' AND tagresult <> ''' + 'OUT' + '''');
  qryTemp2.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapOvertime.Index, qryTemp2.Fields[0].AsFloat);

  qryTemp3.Close;
  qryTemp3.SQL.Clear;
  qryTemp3.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagkeluar = ''' + 'OT' +
      ''' AND tagresult <> ''' + 'CI' +
      ''' AND tagresult <> ''' + 'OUT' + '''');
  qryTemp3.Open;

  hOverTime := qryTemp3.Fields[0].AsFloat;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapHOT.Index, hOverTime);

//------------------------------------------------------------------------------------------------

//cari full overtime
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select count(tagkeluar) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagkeluar = ''' + 'FOT' + ''' AND tagresult <> ''' + 'CI' +
      ''' AND tagresult <> ''' + 'OUT' + '''');
  qryTemp2.Open;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapFullOvertime.Index, qryTemp2.Fields[0].AsFloat);

  qryTemp3.Close;
  qryTemp3.SQL.Clear;
  qryTemp3.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      IDKARYAWAN + ''' AND tagkeluar = ''' + 'FOT' + ''' AND tagresult <> ''' + 'CI' +
      ''' AND tagresult <> ''' + 'OUT' + '''');
  qryTemp3.Open;
  hFOT := qryTemp3.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
//cari potongan
   qryTemp3.Close;
   qryTemp3.SQL.Clear;
   qryTemp3.SQL.Add('select sum(nilai) from ben_payroll_potongan ' +
       'where kodekaryawan = ''' + IDKARYAWAN +
      ''' AND payrollperiode = ''' + edPeriode.Text + '''');
   qryTemp3.Open;
   gtvRekap.DataController.SetValue(NEWREC, gtvRekapPotLain.Index, qryTemp3.Fields[0].AsFloat);
//------------------------------------------------------------------------------------------------
//cari tambahan
   qryTemp3.Close;
   qryTemp3.SQL.Clear;
   qryTemp3.SQL.Add('select sum(nilai) from ben_payroll_tambahan ' +
       'where kodekaryawan = ''' + IDKARYAWAN +
      ''' AND payrollperiode = ''' + edPeriode.Text + '''');
   qryTemp3.Open;
   gtvRekap.DataController.SetValue(NEWREC, gtvRekapTambLain.Index, qryTemp3.Fields[0].AsFloat);
//------------------------------------------------------------------------------------------------

  {hKerja := normal + hcuti + hFOT + hLate1 + hIjinMsk + hSakit +
            hIjinPulang + hUnder + hIKeluar;}
  hKerja := normal + hcuti + hLate1 + hIjinMsk + hSakit +
            hIjinPulang + hUnder + hIKeluar;
  //hUM := ;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapHKerja.Index, hKerja);

  qryTemp3.Close;
  qryTemp3.SQL.Clear;
  qryTemp3.SQL.Add('select sum(nilai) from ben_payroll_um3 ' +
      'where kodekaryawan = ''' + IDKARYAWAN +
      ''' AND payrollperiode = ''' + edPeriode.Text + '''');
  qryTemp3.Open;
  vUM :=  gtvRekap.DataController.GetValue(NEWREC, gtvRekapVarUM.Index);
  hUM3 := vUM * qryTemp3.Fields[0].AsFloat;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapUMx3.Index, hUM3);
end;

procedure TfrmPayrollAdmin.btnPotonganClick(Sender: TObject);
var
  recSelect : Integer;
begin
  recSelect := gtvRekap.DataController.GetFocusedRecordIndex;
  IDKARYAWAN := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapKode.Index));
  NAMA := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNama.Index));
  Application.CreateForm(TfrmPayrollPotongan, frmPayrollPotongan);
  frmPayrollPotongan.edKode.Text := IDKARYAWAN;
  frmPayrollPotongan.edNama.Text := NAMA;
  frmPayrollPotongan.edPeriodePot.Text := edPeriode.Text;
  frmPayrollPotongan.qryPotongan.Active := True;
  frmPayrollPotongan.qryPotongan.Close;
  frmPayrollPotongan.qryPotongan.SQL.Clear;
  frmPayrollPotongan.qryPotongan.SQL.Add('select nilai, keterangan, lastedituser, lasteditdate ' +
      'from ben_payroll_potongan where kodekaryawan = ''' + IDKARYAWAN +
      ''' AND payrollperiode = ''' + edPeriode.Text + '''');
  frmPayrollPotongan.qryPotongan.Open;
  frmPayrollPotongan.gtbPotongan.DataController.Refresh;
  frmPayrollPotongan.Show;

end;

procedure TfrmPayrollAdmin.btnTambahanClick(Sender: TObject);
var
  recSelect : Integer;
begin
  recSelect := gtvRekap.DataController.GetFocusedRecordIndex;
  IDKARYAWAN := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapKode.Index));
  NAMA := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNama.Index));
  Application.CreateForm(TfrmPayrollTambahan, frmPayrollTambahan);
  frmPayrollTambahan.edKode.Text := IDKARYAWAN;
  frmPayrollTambahan.edNama.Text := NAMA;
  frmPayrollTambahan.edPeriodePot.Text := edPeriode.Text;
  frmPayrollTambahan.qryPotongan.Active := True;
  frmPayrollTambahan.qryPotongan.Close;
  frmPayrollTambahan.qryPotongan.SQL.Clear;
  frmPayrollTambahan.qryPotongan.SQL.Add('select nilai, keterangan, lastedituser, lasteditdate ' +
      'from ben_payroll_tambahan where kodekaryawan = ''' + IDKARYAWAN +
      ''' AND payrollperiode = ''' + edPeriode.Text + '''');
  frmPayrollTambahan.qryPotongan.Open;
  frmPayrollTambahan.gtbPotongan.DataController.Refresh;
  frmPayrollTambahan.Show;
end;

procedure TfrmPayrollAdmin.Button1Click(Sender: TObject);
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

procedure TfrmPayrollAdmin.Button2Click(Sender: TObject);
var
  i, recSelect, lama : Integer;
  kodekaryawan, idfinger : String;
begin
  if (edLama.EditValue < 30) then
    begin
      lama := 30;
    end
  else if (edLama.EditValue >= 30) then
    begin
      lama := edLama.EditValue;
    end;
  gtvRekap.DataController.PostEditingData;
  gtvRekap.DataController.Post(True);
  gtvRekap.DataController.GotoFirst;
  qryExec.SQL.Clear;
  for i := 0 to gtvRekap.DataController.RecordCount - 1 do
    BEGIN
      recSelect := gtvRekap.DataController.GetFocusedRecordIndex;
      kodekaryawan := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapKode.Index));
      idfinger := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIDFinger.Index));
      qryTemp1.Close;
      qryTemp1.SQL.Clear;
      qryTemp1.SQL.Add('select autonum from ben_payroll_details where kodekaryawan = ''' +
         kodekaryawan + ''' AND payrollperiode = ''' + edPeriode.Text + '''');
      qryTemp1.Open;
      if (NOT qryTemp1.IsEmpty) then
        begin
          qryExec.SQL.Add('delete from ben_payroll_details where kodekaryawan = ''' +
             kodekaryawan + ''' AND payrollperiode = ''' + edPeriode.Text + ''';');
        end;
      qryExec.SQL.Add('insert into ben_payroll_details values(' +
            '''' + '' + ''',' +
            '''' + frmMain.APP_OUTLETID + ''',' +
            '''' + edPeriode.Text + ''',' +
            '''' + kodekaryawan + ''',' +
            '''' + idfinger + ''',' +
            '''' + IntToStr(lama) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNormal.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapOff.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapHarusKerja.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapHKerja.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapOvertime.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapUnderTime.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapLate1.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapLate2.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIjinSakit.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIjinMasuk.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIjinTM.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIjinPulang.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIjinKeluar.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIjinTA.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapAlpa.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapFullOvertime.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapLibNas.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapCuti.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapHUM.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapVarGapok.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapVarPot1.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapVarTunjangan.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapVarPot2.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapVarTamb.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapVarOT.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapVarUM.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapVarTHP.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapKomisi.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapDenda.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapTambLain.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapPotLain.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNGapok.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapLibNas.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNUM.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNUMLibNas.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNGPLibNas.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNLembur.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNFOT.Index)) + ''',' +
            '''' + VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapTHP.Index)) + ''',' +
            '''' + frmMain.USERAPPS + ''',' +
            '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');

      gtvRekap.DataController.GotoNext;
    END;
   qryExec.ExecSQL;
   ShowMessage('Data Payroll Berhasil Di Update !');
   gtvRekap.DataController.SelectAll;
   gtvRekap.DataController.DeleteSelection;
end;

procedure TfrmPayrollAdmin.CariGaji;
var
  nLembur : Double;
begin
  qryGaji.Close;
  qryGaji.SQL.Clear;
  qryGaji.SQL.Add('select gapok, transport, uangmakan, tunjangan1, potongan1, ' +
        'tunjangan2, potongan2, typepayroll, nthp, tglhabis ' +
        'from ben_hrd_kontrak_details where kodekaryawan = ''' + IDKARYAWAN +
        ''' ORDER BY tglhabis DESC');
  qryGaji.Open;
  qryGaji.First;
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarGapok.Index, qryGaji.Fields[0].AsFloat);
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTransport.Index, qryGaji.Fields[1].AsFloat);
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarUM.Index, qryGaji.Fields[2].AsFloat);
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTunjangan.Index, qryGaji.Fields[3].AsFloat);
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTamb.Index, qryGaji.Fields[5].AsFloat);
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarPot1.Index, qryGaji.Fields[4].AsFloat);
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarPot2.Index, qryGaji.Fields[6].AsFloat);
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapType.Index, qryGaji.Fields[7].AsInteger);
  gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTHP.Index, qryGaji.Fields[8].AsFloat);
  qryPay.Close;
  qryPay.SQL.Clear;
  qryPay.SQL.Add('select lemburan from ben_payroll_type where autonum = ''' +
        inttostr(qryGaji.Fields[7].AsInteger) + '''');
  qryPay.Open;
  if (qryPay.IsEmpty) then
    begin

    end
  else if (NOT qryPay.IsEmpty) then
    begin
       if (qryPay.Fields[0].AsFloat = 0) then
         begin
           gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarOT.Index, 0);
         end
       else if (qryPay.Fields[0].AsFloat > 0) then
         begin
           gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarOT.Index, qryPay.Fields[0].AsFloat);
         end;
    end;
end;

procedure TfrmPayrollAdmin.UpdatePeriode;
begin
  qryExec.SQL.Clear;
  {DMDB.qryExec.SQL.Add('update ben_presensi_rekap set ' +
          'payrollperiode = ''' + edPeriode.Text + ''' ' +
          'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
          ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');}

  qryExec.SQL.Add('update ben_presensi_rekap set ' +
          'payrollperiode = ''' + edPeriode.Text + ''' ' +
          'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
          ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''';');

  qryExec.SQL.Add('update ben_payroll_um3 set ' +
          'payrollperiode = ''' + edPeriode.Text + ''' ' +
          'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
          ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''';');
  qryExec.ExecSQL;

  qryTemp1.Close;
  qryTemp1.SQL.Clear;
  qryTemp1.SQL.Add('select count(autonum) from ben_libur_nasional ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
  qryTemp1.Open;
  edLibNas.EditValue := qryTemp1.Fields[0].AsInteger;
end;

procedure TfrmPayrollAdmin.btnCariKaryawanClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 8;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      //frmMasterKaryawan.WindowState := wsNormal;
    end
  else if (frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 8;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      //frmMasterKaryawan.WindowState := wsNormal;
    end;
end;

procedure TfrmPayrollAdmin.btnDivisiClick(Sender: TObject);
var
  recCount, i, typePayroll : Integer;
begin
  if (edPeriode.Text = '') then Exit;
  recCount := gtvRekap.DataController.RecordCount;
   if (recCount > 0) then
     begin
       if (MessageDlg('Data User Exist, ' + #13 +
              'Would You Like to Update Data ?', mtConfirmation, mbOKCancel,0) = mrCancel) then
           begin
              Exit;
           end;
     end;
   Screen.Cursor := crHourGlass;
   gtvRekap.DataController.SelectAll;
   gtvRekap.DataController.DeleteSelection;
   UpdatePeriode;
   {if (frmPayrollAdmin.Tag = 1) then
     begin
       ISADMIN := 'Y'
     end
   else if (frmPayrollAdmin.Tag = 2) then
     begin
       ISADMIN := 'N'
     end;}


   qryTemp1.Close;
   qryTemp1.SQL.Clear;
   qryTemp1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, ' +
       'jadwaltetap, kodejadwal, kodekontrak, isadmin, namabank, norek, ' +
       'namarek from ben_hrd_karyawan_info where departemen = ''' +
       VarToStr(edDepartemen.EditValue) + ''' and active = ''' + 'Y' +
       ''' AND isadmin = ''' + ISADMIN + '''');
   qryTemp1.Open;
   qryTemp1.First;
   prog1.Position := 0;
   prog1.Properties.Max := qryTemp1.RecordCount - 1;
   //ShowMessage(qryTemp1.Fields[7].AsString + '#' + ISADMIN);

   for i := 0 to qryTemp1.RecordCount - 1 do
     begin
       prog1.Position := i;
       prog1.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryTemp1.RecordCount);
       IDKARYAWAN := qryTemp1.Fields[0].AsString;
       IDFINGER := qryTemp1.Fields[1].AsString;
       NAMA := qryTemp1.Fields[2].AsString;
       DIVISI := qryTemp1.Fields[3].AsString;

       NEWREC := gtvRekap.DataController.InsertRecord(gtvRekap.DataController.RecordCount);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapKode.Index, IDKARYAWAN);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIdFinger.Index, IDFINGER);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapDivisi.Index, DIVISI);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNama.Index, NAMA);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapBank.Index, qryTemp1.Fields[8].AsString);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNoRek.Index, qryTemp1.Fields[9].AsString);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNamaRek.Index, qryTemp1.Fields[10].AsString);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapKomisi.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarGapok.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarUM.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTransport.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTunjangan.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarPot1.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarPot2.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarOT.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTamb.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapOff.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapCuti.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNormal.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapOvertime.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinMasuk.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinKeluar.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinTM.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinSakit.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapAlpa.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapDenda.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinPulang.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapPotLain.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapTambLain.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapFullOvertime.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapHKerja.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapUnderTime.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapLibNas.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapHarusKerja.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapLate1.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapLate2.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNGPLibNas.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinTA.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNUMLibNas.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNFOT.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTHP.Index, 0);
       CariGaji;
       CariRekap;

       gtvRekap.DataController.PostEditingData;
       gtvRekap.DataController.Post(True);
       qryTemp1.Next;
       Application.ProcessMessages;
     end;
   cxGrid1.Enabled := False;
   prog1.Position := 0;
   prog1.Properties.Max := gtvRekap.DataController.RecordCount -1;
   gtvRekap.DataController.GotoFirst;
   for i := 0 to gtvRekap.DataController.RecordCount - 1 do
     begin
       RECSELECT := gtvRekap.DataController.GetFocusedRecordIndex;
       typePayroll := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapType.Index);
       case typePayroll of
         1 : HitungGaji1;{HK}
         2 : HitungGaji2 {MTC};
         3 : HitungGaji3;{ADM / RC}
         4 : HitungGaji4;{TR}
         5 : HitungGaji5{SC1};
         6 : HitungGaji6{FLAT};
         7 : HitungGaji7 {Driver};
         8 : HitungGaji8;{SC2}
         9 : HitungGaji9;
         10 : HitungGaji10;
       end;
       prog1.Position := i;
       prog1.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(gtvRekap.DataController.RecordCount);
       gtvRekap.DataController.GotoNext;
       Application.ProcessMessages;
     end;
   if (ckMerge.Checked = True) then MergePeriode;
   ShowMessage('Load Data Finish !');
   prog1.Position := 0;
   prog1.Properties.Text := 'Load Data Finish';
   cxGrid1.Enabled := True;
   Screen.Cursor := crDefault;
end;

procedure TfrmPayrollAdmin.btnLoadAllClick(Sender: TObject);
var
  recCount, i, typePayroll : Integer;
begin
   if (edPeriode.Text = '') then Exit;
  recCount := gtvRekap.DataController.RecordCount;
   if (recCount > 0) then
     begin
       if (MessageDlg('Data User Exist, ' + #13 +
              'Would You Like to Update Data ?', mtConfirmation, mbOKCancel,0) = mrCancel) then
           begin
              Exit;
           end;
     end;
   Screen.Cursor := crHourGlass;
   gtvRekap.DataController.SelectAll;
   gtvRekap.DataController.DeleteSelection;
   UpdatePeriode;
   {if (frmPayrollAdmin.Tag = 1) then
     begin
       ISADMIN := 'Y'
     end
   else if (frmPayrollAdmin.Tag = 2) then
     begin
       ISADMIN := 'N'
     end;}
   qryTemp1.Close;
   qryTemp1.SQL.Clear;
   qryTemp1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, ' +
       'jadwaltetap, kodejadwal, kodekontrak, isadmin, namabank, norek, ' +
       'namarek from ben_hrd_karyawan_info where active = ''' + 'Y' +
       ''' AND isadmin = ''' + ISADMIN + '''');
   qryTemp1.Open;
   qryTemp1.First;
   if (qryTemp1.Fields[7].AsString <> ISADMIN) then
     begin
       ShowMessage('Anda tidak memiliki otorisasi untuk karyawan ini !!');
       Exit;
     end;


   prog1.Position := 0;
   prog1.Properties.Max := qryTemp1.RecordCount - 1;
   for i := 0 to qryTemp1.RecordCount - 1 do
     begin
       prog1.Position := i;
       prog1.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryTemp1.RecordCount);
       IDKARYAWAN := qryTemp1.Fields[0].AsString;
       IDFINGER := qryTemp1.Fields[1].AsString;
       NAMA := qryTemp1.Fields[2].AsString;
       DIVISI := qryTemp1.Fields[3].AsString;

       NEWREC := gtvRekap.DataController.InsertRecord(gtvRekap.DataController.RecordCount);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapKode.Index, IDKARYAWAN);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIdFinger.Index, IDFINGER);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapDivisi.Index, DIVISI);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNama.Index, NAMA);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapBank.Index, qryTemp1.Fields[8].AsString);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNoRek.Index, qryTemp1.Fields[9].AsString);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNamaRek.Index, qryTemp1.Fields[10].AsString);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapKomisi.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarGapok.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarUM.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTransport.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTunjangan.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarPot1.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarPot2.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarOT.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTamb.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapOff.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapCuti.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNormal.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapOvertime.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinMasuk.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinKeluar.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinTM.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinSakit.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapAlpa.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapDenda.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinPulang.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapPotLain.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapTambLain.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapFullOvertime.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapHKerja.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapUnderTime.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapLibNas.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapHarusKerja.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapLate1.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapLate2.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNGPLibNas.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinTA.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNUMLibNas.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNFOT.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTHP.Index, 0);
       CariGaji;
       CariRekap;

       gtvRekap.DataController.PostEditingData;
       gtvRekap.DataController.Post(True);
       qryTemp1.Next;
       Application.ProcessMessages;
     end;
   cxGrid1.Enabled := False;
   prog1.Position := 0;
   prog1.Properties.Max := gtvRekap.DataController.RecordCount -1;
   gtvRekap.DataController.GotoFirst;
   for i := 0 to gtvRekap.DataController.RecordCount - 1 do
     begin
       RECSELECT := gtvRekap.DataController.GetFocusedRecordIndex;
       typePayroll := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapType.Index);
       case typePayroll of
         1 : HitungGaji1;{HK}
         2 : HitungGaji2 {MTC};
         3 : HitungGaji3;{ADM / RC}
         4 : HitungGaji4;
         5 : HitungGaji5{Security};
         6 : HitungGaji6{FLAT};
         7 : HitungGaji7 {Driver};
         8 : HitungGaji8;
         9 : HitungGaji9;
         10 : HitungGaji10;
       end;
       prog1.Position := i;
       prog1.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(gtvRekap.DataController.RecordCount);
       gtvRekap.DataController.GotoNext;
       Application.ProcessMessages;
     end;
   if (ckMerge.Checked = True) then MergePeriode;
   ShowMessage('Load Data Finish !');
   prog1.Position := 0;
   prog1.Properties.Text := 'Load Data Finish';
   cxGrid1.Enabled := True;
   Screen.Cursor := crDefault;
end;

procedure TfrmPayrollAdmin.btnLoadKodeClick(Sender: TObject);
var
  recCount, i, typePayroll : Integer;
  NAMAREK, NOREK, BANK : String;
begin
   if (edPeriode.Text = '') then Exit;
  recCount := gtvRekap.DataController.RecordCount;
   if (recCount > 0) then
     begin
       if (MessageDlg('Data User Exist, ' + #13 +
              'Would You Like to Update Data ?', mtConfirmation, mbOKCancel,0) = mrCancel) then
           begin
              Exit;
           end;
     end;
   Screen.Cursor := crHourGlass;
   gtvRekap.DataController.SelectAll;
   gtvRekap.DataController.DeleteSelection;
   UpdatePeriode;
   {if (frmPayrollAdmin.Tag = 1) then
     begin
       ISADMIN := 'Y'
     end
   else if (frmPayrollAdmin.Tag = 2) then
     begin
       ISADMIN := 'N'
     end;}
   qryTemp1.Close;
   qryTemp1.SQL.Clear;
   qryTemp1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, ' +
       'jadwaltetap, kodejadwal, kodekontrak, isadmin, namabank, norek, ' +
       'namarek from ben_hrd_karyawan_info where kodekaryawan = ''' +
       lblKodeKaryawan.Caption + ''' and active = ''' + 'Y' + '''');
   qryTemp1.Open;
   if (qryTemp1.Fields[7].AsString <> ISADMIN) then
     begin
       ShowMessage('Anda tidak memiliki otorisasi untuk karyawan ini !!');
       Exit;
     end;
   qryTemp1.First;
   prog1.Position := 0;
   for i := 0 to qryTemp1.RecordCount - 1 do
     begin
       prog1.Position := i;
       prog1.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryTemp1.RecordCount);
       IDKARYAWAN := qryTemp1.Fields[0].AsString;
       IDFINGER := qryTemp1.Fields[1].AsString;
       NAMA := qryTemp1.Fields[2].AsString;
       DIVISI := qryTemp1.Fields[3].AsString;
       
       BANK := qryTemp1.Fields[8].AsString;
       NAMAREK := qryTemp1.Fields[9].AsString;
       NOREK := qryTemp1.Fields[10].AsString;

       NEWREC := gtvRekap.DataController.InsertRecord(gtvRekap.DataController.RecordCount);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapKode.Index, IDKARYAWAN);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIdFinger.Index, IDFINGER);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapDivisi.Index, DIVISI);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNama.Index, NAMA);

       gtvRekap.DataController.SetValue(NEWREC, gtvRekapBank.Index, BANK);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNoRek.Index, NOREK);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNamaRek.Index, NAMAREK);

       gtvRekap.DataController.SetValue(NEWREC, gtvRekapKomisi.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarGapok.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarUM.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTransport.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTunjangan.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarPot1.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarPot2.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarOT.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTamb.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapOff.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapCuti.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNormal.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapOvertime.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinMasuk.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinKeluar.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinTM.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinSakit.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapAlpa.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapDenda.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinPulang.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapPotLain.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapTambLain.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapFullOvertime.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapHKerja.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapUnderTime.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapLibNas.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapHarusKerja.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapLate1.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapLate2.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNGPLibNas.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapIjinTA.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNUMLibNas.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapNFOT.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapVarTHP.Index, 0);
       gtvRekap.DataController.SetValue(NEWREC, gtvRekapHUM.Index, 0);
       CariGaji;
       CariRekap;

//----------------------------------------------------------------------------------------------------

       gtvRekap.DataController.PostEditingData;
       gtvRekap.DataController.Post(True);
       qryTemp1.Next;
       Application.ProcessMessages;
     end;
   cxGrid1.Enabled := False;
   prog1.Position := 0;
   prog1.Properties.Max := gtvRekap.DataController.RecordCount -1;
   gtvRekap.DataController.GotoFirst;
   for i := 0 to gtvRekap.DataController.RecordCount - 1 do
     begin
       RECSELECT := gtvRekap.DataController.GetFocusedRecordIndex;
       typePayroll := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapType.Index);
       case typePayroll of
         1 : HitungGaji1;{HK}
         2 : HitungGaji2 {MTC};
         3 : HitungGaji3;{ADM / RC}
         4 : HitungGaji4;{Therapist}
         5 : HitungGaji5{Security};
         6 : HitungGaji6{FLAT};
         7 : HitungGaji7 {Driver};
         8 : HitungGaji8;
         9 : HitungGaji9;
         10 : HitungGaji10;
       end;
       prog1.Position := i;
       prog1.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(gtvRekap.DataController.RecordCount);
       gtvRekap.DataController.GotoNext;
       Application.ProcessMessages;
     end;
   if (ckMerge.Checked = True) then MergePeriode;
   ShowMessage('Load Data Finish !');
   prog1.Position := 0;
   prog1.Properties.Text := 'Load Data Finish';
   cxGrid1.Enabled := True;

   Screen.Cursor := crDefault;
end;

procedure TfrmPayrollAdmin.edPeriodeChange(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  qryTemp2.Close;
  qryTemp2.SQL.Clear;
  qryTemp2.SQL.Add('select payrollperiode, tglstart, tglend, masakerja ' +
      'from ben_payroll_periode where payrollperiode = ''' + edPeriode.Text + '''');
  qryTemp2.Open;
  edStart.Date := qryTemp2.Fields[1].AsDateTime;
  edEnd.Date := qryTemp2.Fields[2].AsDateTime;
  edLama.EditValue := qryTemp2.Fields[3].AsInteger;
  ShowMessage('Mohon Setup Cash In terlebih dahulu ' + #13 +
     'Apabila pada periode ini terdapat Karyawan Cash In !');
  Screen.Cursor := crDefault;
end;

procedure TfrmPayrollAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryTemp1.Free;
  qryTemp2.Free;
  qryTemp3.Free;
  qryGaji.Free;
  qryPay.Free;
  Action := caFree;
end;

procedure TfrmPayrollAdmin.FormCreate(Sender: TObject);
var
  i: Integer;
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

   qryGaji := TMyQuery.Create(Self);
   qryGaji.Connection := DMDB.dbInternal;
   qryGaji.SQL.Add('select * from temptable');
   qryGaji.Active := true;

   qryPay := TMyQuery.Create(Self);
   qryPay.Connection := DMDB.dbInternal;
   qryPay.SQL.Add('select * from temptable');
   qryPay.Active := true;

   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   tblDepartemen.Active := True;

   qryTemp1.Close;
   qryTemp1.SQL.Clear;
   qryTemp1.SQL.Add('select payrollperiode from ben_payroll_periode ' +
      'order by tglstart DESC LIMIT 5');
   qryTemp1.Open;
   qryTemp1.First;
   for i := 0 to qryTemp1.RecordCount - 1 do
      begin
        edPeriode.Items.Add(qryTemp1.Fields[0].AsString);
        edMerge.Items.Add(qryTemp1.Fields[0].AsString);
        qryTemp1.Next;
      end;
   if (frmPayrollAdmin.Tag = 1) then
     begin
       ISADMIN := 'Y';
       lblJudulForm.Caption := '  PAYROLL AS ADMIN';
     end
   else if (frmPayrollAdmin.Tag = 2) then
     begin
       ISADMIN := 'N';
       lblJudulForm.Caption := '  PAYROLL AS SPV';
     end;
  tabControl.ActivePage := tbDivisi;
end;

end.
