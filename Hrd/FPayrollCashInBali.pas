unit FPayrollCashInBali;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit, DB,
  DBAccess, ExtCtrls, cxCalc, cxMaskEdit, cxDropDownEdit, cxCalendar, DateUtils,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, Vcl.ComCtrls, dxCore, cxDateUtils, MemDS, MyAccess;

type
  TfrmPayrollCashInBali = class(TForm)
    Label1: TLabel;
    edSearchID: TcxTextEdit;
    Label2: TLabel;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    lblKodeKaryawan: TLabel;
    lblIDFinger: TLabel;
    lblNamaKaryawan: TLabel;
    lblDepartemen: TLabel;
    btnCari: TButton;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edPeriode: TComboBox;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    edLama: TcxCalcEdit;
    edLibNas: TcxCalcEdit;
    Label11: TLabel;
    Label12: TLabel;
    lblTypePayroll: TLabel;
    Label13: TLabel;
    edCashStart: TcxDateEdit;
    edCashEnd: TcxDateEdit;
    Label14: TLabel;
    btnLoad: TButton;
    edVGP: TcxCalcEdit;
    Label15: TLabel;
    Label16: TLabel;
    edVTHP: TcxCalcEdit;
    Label17: TLabel;
    edHCashin: TcxCalcEdit;
    Label18: TLabel;
    edHOff: TcxCalcEdit;
    Label19: TLabel;
    edKomisi: TcxCalcEdit;
    Label20: TLabel;
    edHarusKerja: TcxCalcEdit;
    Label21: TLabel;
    edLate1: TcxCalcEdit;
    Label22: TLabel;
    edLate2: TcxCalcEdit;
    Label23: TLabel;
    edCuti: TcxCalcEdit;
    Label24: TLabel;
    edIjinPulang: TcxCalcEdit;
    Label25: TLabel;
    edTidakMasuk: TcxCalcEdit;
    Label26: TLabel;
    edAlpa: TcxCalcEdit;
    Label27: TLabel;
    edSakit: TcxCalcEdit;
    Label28: TLabel;
    edUndertime: TcxCalcEdit;
    Label29: TLabel;
    edOvertime: TcxCalcEdit;
    Label30: TLabel;
    edFOT: TcxCalcEdit;
    Label31: TLabel;
    edHLibNasional: TcxCalcEdit;
    Label32: TLabel;
    edHKerja: TcxCalcEdit;
    Label33: TLabel;
    edGapok: TcxCalcEdit;
    Label34: TLabel;
    edVUMakan: TcxCalcEdit;
    Label35: TLabel;
    edVLembur: TcxCalcEdit;
    Label36: TLabel;
    edUangMakan: TcxCalcEdit;
    Label37: TLabel;
    edLembur: TcxCalcEdit;
    Label38: TLabel;
    edTHP: TcxCalcEdit;
    Label39: TLabel;
    edTotalOff: TcxCalcEdit;
    Label40: TLabel;
    edGpLibNas: TcxCalcEdit;
    Label42: TLabel;
    edUMLibNas: TcxCalcEdit;
    Label43: TLabel;
    edGFOT: TcxCalcEdit;
    Label44: TLabel;
    edTambahan: TcxCalcEdit;
    Label45: TLabel;
    edPengurang: TcxCalcEdit;
    btnReset: TButton;
    edKeterangan: TEdit;
    Label46: TLabel;
    Button2: TButton;
    memoStruktur1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnCariClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edSearchIDKeyPress(Sender: TObject; var Key: Char);
    procedure edPeriodeChange(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    qryCash1, qryCash2, qryCash3, qryCash4, qryExec : TMyQuery;
    procedure CariGaji;
    //procedure UpdatePeriode();
    //procedure CariRekap();
    procedure HitungGaji1();
    procedure HitungGaji2();
    procedure HitungGaji3();
    procedure HitungGaji4();
    procedure HitungGaji5();


    procedure ClearForm();
    procedure HitungGajiHK(nRecord : Integer; StaffCode : String);
    procedure HitungGajiMTC(nRecord : Integer; StaffCode : String);
    procedure HitungGajiTR(nRecord : Integer; StaffCode : String; fingerCode : String);
    procedure HitungGajiRC(nRecord : Integer; StaffCode : String);
    procedure HitungGajiADM(nRecord : Integer; StaffCode : String);
    procedure HitungGajiDriver(nRecord : Integer; StaffCode : String);
    procedure HitungGajiSC(nRecord : Integer; StaffCode : String);
  public
    { Public declarations }
  end;

var
  frmPayrollCashInBali: TfrmPayrollCashInBali;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterKaryawan;

procedure TfrmPayrollCashInBali.HitungGajiSC(nRecord: Integer; StaffCode: string);
var
  keterangan : String;
  vBPJS, vTunj, vDenda, vGP, vUM, vPot2, vUM3, hSakit, hIjinTdkMasuk,
  hHrsKerja, nHK, jamLembur, totJamLembur, sisaJamLembur, nGP, hUM,
  hLate1, hLate2, hUT, nUM, nLembur, nTHP, vPotLain, vTambLain, vLembur,
  vFOT, nFOT, tmpFOT, vTemporary : Double;
  i, nTransaksi : Integer;
begin
   vBPJS := 0;
  vTunj := 0;
  vDenda := edPengurang.EditValue;
  vGP := edVGP.EditValue;
  vUM := edVUMakan.EditValue;
  vPot2 := 0;
  vUM3 := 0;
  hUT := edUndertime.EditValue;
  hSakit := edSakit.EditValue;
  hLate1 := edLate1.EditValue;
  hLate2 := edLate2.EditValue;
  hIjinTdkMasuk := edTidakMasuk.EditValue;
  hHrsKerja := edHarusKerja.EditValue;
  nHK := edHKerja.EditValue;
  vPot2 := 0;
  vTambLain := 0;
  vPotLain := 0;
  vLembur := edVLembur.EditValue;
  totJamLembur := 0;
  sisaJamLembur := 0;
  jamLembur := 0;
  vFOT := 0;
  nFOT := 0;
  tmpFOT := 0;
  qryCash1.Close;
  qryCash1.SQL.Clear;
  qryCash1.SQL.Add('select selkeluar, tagresult from ben_presensi_rekap ' +
        'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
        StaffCode + ''' AND tagkeluar = ''' + 'OT' + ''' AND tagresult <> ''' + 'CI' + '''');
  qryCash1.Open;
  qryCash1.First;

  for i := 0 to qryCash1.RecordCount - 1 do
     begin
       if (qryCash1.Fields[0].AsInteger >= 9) then
         begin
              tmpFOT := qryCash1.Fields[0].AsInteger DIV 9;
              vFOT := vFOT + tmpFOT;
         end
       else if (qryCash1.Fields[0].AsInteger < 9) then
         begin
           totJamLembur := totJamLembur + qryCash1.Fields[0].AsInteger;
         end;
       qryCash1.Next;
     end;
  //gtvRekap.DataController.SetValue(nRecord, gtvRekapHKerja.Index, nHK);
  edHKerja.EditValue := nHK;
  //gtvRekap.DataController.SetValue(nRecord, gtvRekapOvertime.Index, totJamLembur);
  edOvertime.EditValue := totJamLembur;
  nGP := (vGP / hHrsKerja) * nHK;

  hUM := nHK - hLate1 - hUT - hSakit;
  nUM := vUM * hUM;
  vLembur := vGP / hHrsKerja / 9;
  nLembur := vLembur * totJamLembur;
  vTemporary := (vGP / hHrsKerja) + nUM;
  nFOT := (vGP / hHrsKerja + vUM) * vFOT;

  nTHP := nGP + nUM + nLembur + vTunj - vBPJS +  vTambLain +
        vPot2 - vDenda - vPotLain + vUM3 + nFOT;
  edVLembur.EditValue := vLembur;
  edOvertime.EditValue := totJamLembur;
  edLembur.EditValue := nLembur;
  edFOT.EditValue := vFOT;
  edGFOT.EditValue := nFOT;
  edLibNas.EditValue := 0;
  edGpLibNas.EditValue := 0;
  edUMLibNas.EditValue := 0;
  edUangMakan.EditValue := nUM;
  edGapok.EditValue := nGP;
  edLembur.EditValue := nLembur;
  edTHP.EditValue := nTHP;
end;

procedure TfrmPayrollCashInBali.HitungGajiDriver(nRecord: Integer; StaffCode: string);
var
  keterangan : String;
  vBPJS, vTunj, vDenda, vGP, vUM, vPot2, vUM3, hSakit, hIjinTdkMasuk,
  hHrsKerja, nHK, jamLembur, totJamLembur, sisaJamLembur, nGP, hUM,
  hLate1, hLate2, hUT, nUM, nLembur, nTHP, vPotLain, vTambLain, vLembur, nFOT : Double;
  i, vFOT : Integer;
begin
  vBPJS := 0;
  vTunj := 0;
  vDenda := edPengurang.EditValue;
  vGP := edVGP.EditValue;
  vUM := edVUMakan.EditValue;
  vPot2 := 0;
  vUM3 := 0;
  hUT := edUndertime.EditValue;
  hSakit := edSakit.EditValue;
  hLate1 := edLate1.EditValue;
  hLate2 := edLate2.EditValue;
  hIjinTdkMasuk := edTidakMasuk.EditValue;
  hHrsKerja := edHarusKerja.EditValue;
  nHK := edHKerja.EditValue;
  vPot2 := 0;
  vTambLain := edTambahan.EditValue;
  vPotLain := 0;
  vLembur := edVLembur.EditValue;
  totJamLembur := 0;
  sisaJamLembur := 0;
  jamLembur := 0;
  nFOT := 0;
  vFOT := 0;

  qryCash1.Close;
  qryCash1.SQL.Clear;
  qryCash1.SQL.Add('select selkeluar, tagresult from ben_presensi_rekap where ' +
         'tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) + ''' AND ' +
         'tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) + ''' AND ' +
         'kodekaryawan = ''' + StaffCode + ''' AND tagkeluar = ''' + 'OT' + ''' AND tagresult <> ''' + 'CI' + '''');
  qryCash1.Open;
  qryCash1.First;
  jamLembur := 0;
  for i := 0 to qryCash1.RecordCount - 1 do
     begin
          jamLembur := jamLembur + qryCash1.Fields[0].AsInteger;
       {if (qryCash1.Fields[0].AsInteger > 4) then
         begin
           if (qryCash1.Fields[1].AsString = 'OFF') then
             begin
                if (qryCash1.Fields[0].AsInteger > 13) then
                   begin
                     nHK := nHK + 1;
                     vFOT := vFOT + 1;
                   end
                else if (qryCash1.Fields[0].AsInteger <= 13) then
                   begin
                      nHK := nHK + 1;
                   end;

             end
           else if (qryCash1.Fields[1].AsString <> 'OFF') then
             begin
                vFOT := vFOT + 1;
             end;

         end
       else if (qryCash1.Fields[0].AsInteger < 4) then
         begin
           vFOT := vFOT + 0;
         end;}
       qryCash1.Next;
     end;
  edOvertime.EditValue := jamLembur;
  edLembur.EditValue := edVLembur.EditValue * jamLembur;
  edFOT.EditValue := 0;
  edHKerja.EditValue := nHK;
  nGP := (vGP / hHrsKerja) * nHK;
  hUM := nHK - hLate1 - hUT - hSakit;
  nUM := vUM * hUM;
  //nFOT := vFOT * 70000;
  nLembur := edVLembur.EditValue * jamLembur;
  nFOT := 0;
  nTHP := nGP + nUM + nFOT + vTunj - vBPJS +  vTambLain +
        vPot2 - vDenda - vPotLain + vUM3 + nLembur;
  edOvertime.EditValue := 0;
  edGapok.EditValue := nGP;
  edUangMakan.EditValue := nUM;
  edGFOT.EditValue := nFOT;
  edTHP.EditValue := nTHP;
end;

procedure TfrmPayrollCashInBali.HitungGajiADM(nRecord: Integer; StaffCode: string);
var
  keterangan : String;
  vBPJS, vTunj, vDenda, vGP, vUM, vPot2, vUM3, hSakit, hIjinTdkMasuk,
  hHrsKerja, nHK, jamLembur, totJamLembur, sisaJamLembur, nGP, hUM,
  hLate1, hLate2, hUT, nUM, nLembur, nTHP, vPotLain, vTambLain, vLembur,
  nLibNas, vLibNas, UMLibNas : Double;
  i, nTransaksi : Integer;
begin
  vBPJS := 0;
  vTunj := 0;
  vDenda := 0;
  vGP := edVGP.EditValue;
  vUM := edVUMakan.EditValue;
  vPot2 := 0;
  vUM3 := 0;
  hUT := edUndertime.EditValue;
  hSakit := edSakit.EditValue;
  hLate1 := edLate1.EditValue;
  hLate2 := edLate2.EditValue;
  hIjinTdkMasuk := edTidakMasuk.EditValue;
  hHrsKerja := edHarusKerja.EditValue;
  nHK := edHKerja.EditValue;
  vPot2 := 0;
  vTambLain := 0;
  vPotLain := 0;
  vLembur := edVLembur.EditValue;
  totJamLembur := 0;
  sisaJamLembur := 0;
  jamLembur := 0;
  qryCash1.Close;
  qryCash1.SQL.Clear;
  qryCash1.SQL.Add('select selkeluar, tagresult from ben_presensi_rekap where ' +
        'tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) + ''' AND ' +
         'tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) + ''' AND ' +
        'kodekaryawan = ''' + StaffCode + ''' AND tagkeluar = ''' + 'OT' + ''' AND tagresult <> ''' + 'CI' + '''');
  qryCash1.Open;
  qryCash1.First;

  for i := 0 to qryCash1.RecordCount - 1 do
     begin
       if (qryCash1.Fields[0].AsInteger >= 9) then
         begin
              nHK := nHK + 1;
              sisaJamLembur := qryCash1.Fields[0].AsInteger - 9;
              totJamLembur := totJamLembur + sisaJamLembur;
         end
       else if (qryCash1.Fields[0].AsInteger < 9) then
         begin
           totJamLembur := totJamLembur + qryCash1.Fields[0].AsInteger;
         end;
       qryCash1.Next;
     end;
  edHKerja.EditValue := nHK;
  edOvertime.EditValue := totJamLembur;
  nGP := (vGP / hHrsKerja) * nHK;
  hUM := nHK - hLate1 - hUT - hSakit;
  nUM := vUM * hUM;
  //nLembur := vLembur * jLembur;
  nLembur := vLembur * totJamLembur;

  qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select count(autonum) from ben_presensi_rekap where ' +
        'tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) + ''' AND ' +
        'tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) + ''' AND ' +
        'kodekaryawan = ''' + StaffCode + ''' AND ' +
        'libnas = ''' + 'Y' + ''' AND ' +
        'tagresult <> ''' + 'A' + ''' AND ' +
        'tagresult <> ''' + 'S' + ''' AND ' +
        'tagresult <> ''' + 'IT' + ''' AND ' +
        'tagresult <> ''' + 'CI' + ''' AND ' +
        'tagresult <> ''' + 'C' + '''');
  qryCash2.Open;
  vLibNas := qryCash2.Fields[0].AsInteger;
  nLibNas := (vGP / hHrsKerja) * 0.5 * vLibNas;
  UMLibNas := vUM * 0.5 * vLibNas;

  nTHP := nGP + nUM + nLembur + vTunj - vBPJS +  vTambLain +
        vPot2 - vDenda - vPotLain + vUM3 + UMLibNas + nLibNas;
  edHLibNasional.EditValue := vLibNas;
  edGpLibNas.EditValue := nLibNas;
  edUMLibNas.EditValue := UMLibNas;
  edUangMakan.EditValue := nUM;
  edGapok.EditValue := nGP;
  edLembur.EditValue := nLembur;
  edTHP.EditValue := nTHP;
end;

procedure TfrmPayrollCashInBali.HitungGajiTR(nRecord: Integer; StaffCode: string; fingerCode: string);
var
  keterangan : String;
  vBPJS, vTunj, vDenda, vGP, vUM, vPot2, vUM3, hSakit, hIjinTdkMasuk,
  hHrsKerja, nHK, jamLembur, totJamLembur, sisaJamLembur, nGP, hUM,
  hLate1, hLate2, hUT, nUM, nLembur, nTHP, vPotLain, vTambLain, vLembur,
  nKomisi, vSaving, KomisiCI : Double;
  i, nTransaksi : Integer;
begin
  vBPJS := 0;
  vSaving := 0;
  vTunj := 0;
  vDenda := edPengurang.EditValue;
  vGP := edVGP.EditValue;
  vUM := edVUMakan.EditValue;
  vPot2 := 0;
  vUM3 := 0;
  hUT := edUndertime.EditValue;
  hSakit := edSakit.EditValue;
  hLate1 := edLate1.EditValue;
  hLate2 := edLate2.EditValue;
  hIjinTdkMasuk := edTidakMasuk.EditValue;
  hHrsKerja := edHarusKerja.EditValue;
  nHK := edHKerja.EditValue;
  vPot2 := 0;
  vTambLain := 0;
  vPotLain := 0;
  vLembur := edVLembur.EditValue;;
  //Memo1.Lines.Add('-----------------PASS 1 ---------------------');
  totJamLembur := 0;
  sisaJamLembur := 0;
  jamLembur := 0;
  qryCash3.Close;
  qryCash3.SQL.Clear;
  qryCash3.SQL.Add('select selkeluar, tagresult from ben_presensi_rekap where ' +
         'tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) + ''' AND ' +
         'tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) + ''' AND ' +
         'kodekaryawan = ''' + StaffCode + ''' AND tagkeluar = ''' + 'OT' +
         ''' AND tagresult <> ''' + 'CI' + '''');
  qryCash3.Open;
  qryCash3.First;
  //Memo1.Lines.Add('-----------------PASS 2 ---------------------');
  for i := 0 to qryCash3.RecordCount - 1 do
     begin
       if (qryCash3.Fields[0].AsInteger >= 9) then
         begin
              nHK := nHK + 1;
              sisaJamLembur := qryCash3.Fields[0].AsInteger - 9;
              totJamLembur := totJamLembur + sisaJamLembur;
         end
       else if (qryCash3.Fields[0].AsInteger < 9) then
         begin
           totJamLembur := totJamLembur + qryCash3.Fields[0].AsInteger;
         end;
       qryCash3.Next;
     end;
  //Memo1.Lines.Add('-----------------PASS 3 ---------------------');
  edHKerja.EditValue := nHK;
  //gtvRekap.DataController.SetValue(nRecord, gtvRekapOvertime.Index, totJamLembur);
  edOvertime.EditValue := totJamLembur;
  nGP := (vGP / hHrsKerja) * nHK;

  hUM := nHK - hLate1 - hUT - hSakit;
  nUM := vUM * hUM;
  //nLembur := vLembur * jLembur;
  nLembur := vLembur * totJamLembur;

  //HITUNG KOMISI
  //Memo1.Lines.Add('-----------------PASS 4 ---------------------');
  qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select count(trans_id) from ben_trans_master where ' +
      'tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) + ''' AND ' +
      'tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) + ''' AND ' +
      'id_therapist = ''' + fingerCode + '''');
  qryCash2.Open;


  if (qryCash2.IsEmpty) then nTransaksi := 0
  else if (NOT qryCash2.IsEmpty) then nTransaksi := qryCash2.Fields[0].AsInteger;

  qryCash1.Close;
  qryCash1.SQL.Clear;
  qryCash1.SQL.Add('select sum(komisi) from ben_presensi_rekap where ' +
       'tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) + ''' AND ' +
       'tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) + ''' AND ' +
       'kodekaryawan = ''' + StaffCode + '''');
  qryCash1.Open;


  {if (nTransaksi <= 25) then nKomisi := qryCash1.Fields[0].AsFloat / 100 * 7.5
  else if (nTransaksi > 25) then nKomisi := qryCash1.Fields[0].AsFloat / 100 * 10; }
  nKomisi := qryCash1.Fields[0].AsFloat / 100 * 10;
  {qryCash3.Close;
  qryCash3.SQL.Clear;
  qryCash3.SQL.Add('select komisi from ben_payroll_cashin where payrollperiode = ''' +
      edPeriode.Text + ''' AND kodekaryawan = ''' + StaffCode + '''');
  qryCash3.Open;
  if (NOT qryCash3.IsEmpty) then KomisiCI := qryCash3.Fields[0].AsFloat
  else if (qryCash3.IsEmpty) then KomisiCI := 0;
  nKomisi := nKomisi - KomisiCI;}
  edKomisi.EditValue := nKomisi;
  nTHP := nGP + nUM + nLembur + vTunj - vBPJS +  vTambLain +
        vPot2 - vDenda - vPotLain + vUM3 + nKomisi - vSaving;

  edLibNas.EditValue := 0;
  edGpLibNas.EditValue := 0;
  edUMLibNas.EditValue := 0;
  edGapok.EditValue := nGP;
  edLembur.EditValue := nLembur;
  edUangMakan.EditValue := nUM;
  edTHP.EditValue := nTHP;
end;

procedure TfrmPayrollCashInBali.HitungGajiMTC(nRecord: Integer; StaffCode: string);
var
  vBPJS, vTunj, vDenda, vGP, vUM, vPot2, vUM3, hSakit, hIjinTdkMasuk,
  hHrsKerja, nHK, jamLembur, totJamLembur, sisaJamLembur, nGP, hUM,
  hLate1, hLate2, hUT, nUM, nLembur, nTHP, vPotLain, vTambLain, vLembur : Double;
  i : Integer;
begin
  vBPJS := 0;
  vTunj := 0;
  vDenda := edPengurang.EditValue;
  vGP := edVGP.EditValue;
  vUM := edVUMakan.EditValue;
  vPot2 := 0;
  vUM3 := 0;
  hUT := edUndertime.EditValue;
  hSakit := edSakit.EditValue;
  hLate1 := edLate1.EditValue;
  hLate2 := edLate2.EditValue;
  hIjinTdkMasuk := edTidakMasuk.EditValue;
  hHrsKerja := edHarusKerja.EditValue;
  nHK := edHKerja.EditValue;
  vPot2 := 0;
  vTambLain := 0;
  vPotLain := 0;
  vLembur := edVLembur.EditValue;
  totJamLembur := 0;
  sisaJamLembur := 0;
  jamLembur := 0;

  qryCash3.Close;
  qryCash3.SQL.Clear;
  qryCash3.SQL.Add('select selkeluar, tagresult from ben_presensi_rekap ' +
        'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
        StaffCode + ''' AND tagkeluar = ''' + 'OT' + ''' AND tagresult <> ''' + 'CI' + '''');
  qryCash3.Open;
  qryCash3.First;

  for i := 0 to qryCash3.RecordCount - 1 do
     begin
       if (qryCash3.Fields[0].AsInteger > 9) then
         begin
              nHK := nHK + 1;
              sisaJamLembur := qryCash3.Fields[0].AsInteger - 9;
              totJamLembur := totJamLembur + sisaJamLembur;
         end
       else if (qryCash3.Fields[0].AsInteger < 9) then
         begin
           totJamLembur := totJamLembur + qryCash3.Fields[0].AsInteger;
         end;
       qryCash3.Next;
     end;
  edHKerja.EditValue := nHK;
  edOvertime.EditValue := totJamLembur;
  nGP := (vGP / hHrsKerja) * nHK;

  hUM := nHK - hLate1 - hUT - hSakit;
  nUM := vUM * hUM;
  //nLembur := vLembur * jLembur;
  nLembur := vLembur * totJamLembur;

  nTHP := nGP + nUM + nLembur + vTunj - vBPJS +  vTambLain +
        vPot2 - vDenda - vPotLain + vUM3;
  edLibNas.EditValue := 0;
  edGpLibNas.EditValue := 0;
  edUMLibNas.EditValue := 0;
  edUangMakan.EditValue := nUM;
  edGapok.EditValue := nGP;
  edLembur.EditValue := nLembur;
  edTHP.EditValue := nTHP;
end;

procedure TfrmPayrollCashInBali.HitungGajiHK(nRecord: Integer; StaffCode: string);
begin

end;

procedure TfrmPayrollCashInBali.ClearForm;
begin
  lblKodeKaryawan.Caption := '....';
  lblIDFinger.Caption := '....';
  lblNamaKaryawan.Caption := '....';
  lblDepartemen.Caption := '....';
  lblTypePayroll.Caption := '....';
  edPeriode.Text := '';
  edStart.Date := Date;
  edEnd.Date := Date;
  edCashStart.Date := Date;
  edCashEnd.Date := Date;
  edVGP.EditValue := 0;
  edVTHP.EditValue := 0;
  edVUMakan.EditValue := 0;
  edVLembur.EditValue := 0;
  edHCashin.EditValue := 0;
  edKomisi.EditValue := 0;
  edCuti.EditValue := 0;
  edSakit.EditValue := 0;
  edHarusKerja.EditValue := 0;
  edHKerja.EditValue := 0;
  edLibNas.EditValue := 0;
  edLama.EditValue := 0;
  edHOff.EditValue := 0;
  edTotalOff.EditValue := 0;
  edIjinPulang.EditValue := 0;
  edTidakMasuk.EditValue := 0;
  edLate1.EditValue := 0;
  edOvertime.EditValue := 0;
  edLibNas.EditValue := 0;
  edAlpa.EditValue := 0;
  edFOT.EditValue := 0;
  edGapok.EditValue := 0;
  edGpLibNas.EditValue := 0;
  edGFOT.EditValue := 0;
  edUangMakan.EditValue := 0;
  edUMLibNas.EditValue := 0;
  edUndertime.EditValue := 0;
  edOvertime.EditValue := 0;
  edLembur.EditValue := 0;
  edTambahan.EditValue := 0;
  edPengurang.EditValue := 0;
  edTHP.EditValue := 0;
  edKeterangan.Clear;
end;

procedure TfrmPayrollCashInBali.HitungGajiRC(nRecord: Integer; StaffCode: string);
var
  keterangan : String;
  vBPJS, vTunj, vDenda, vGP, vUM, vPot2, vUM3, hSakit, hIjinTdkMasuk,
  hHrsKerja, nHK, jamLembur, totJamLembur, sisaJamLembur, nGP, hUM,
  hLate1, hLate2, hUT, nUM, nLembur, nTHP, vPotLain, vTambLain, vLembur,
  nKomisi, vSaving : Double;
  i, nTransaksi : Integer;
begin
  vBPJS := 0;
  vTunj := 0;
  vDenda := 0;
  vGP := edVGP.EditValue;
  vUM := edVUMakan.EditValue;
  vPot2 := 0;
  vUM3 := 0;
  hUT := edUndertime.EditValue;
  hSakit := edSakit.EditValue;
  hLate1 := edLate1.EditValue;
  hLate2 := edLate2.EditValue;
  hIjinTdkMasuk := edTidakMasuk.EditValue;
  hHrsKerja := edHarusKerja.EditValue;
  nHK := edHKerja.EditValue;
  vPot2 := 0;
  vTambLain := 0;
  vPotLain := 0;
  vLembur := edVLembur.EditValue;
  totJamLembur := 0;
  sisaJamLembur := 0;
  jamLembur := 0;
  qryCash3.Close;
  qryCash3.SQL.Clear;
  qryCash3.SQL.Add('select selkeluar, tagresult from ben_presensi_rekap ' +
        'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
        ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
        ''' AND kodekaryawan = ''' + StaffCode + ''' AND tagkeluar = ''' +
        'OT' + '''');
  qryCash3.Open;
  qryCash3.First;

  for i := 0 to qryCash3.RecordCount - 1 do
     begin
       if (qryCash3.Fields[0].AsInteger >= 9) then
         begin
              nHK := nHK + 1;
              sisaJamLembur := qryCash3.Fields[0].AsInteger - 9;
              totJamLembur := totJamLembur + sisaJamLembur;
         end
       else if (qryCash3.Fields[0].AsInteger < 9) then
         begin
           totJamLembur := totJamLembur + qryCash3.Fields[0].AsInteger;
         end;
       qryCash3.Next;
     end;

  nGP := (vGP / hHrsKerja) * nHK;

  hUM := nHK - hLate1 - hUT - hSakit;
  nUM := vUM * hUM;
  nLembur := vLembur * totJamLembur;
  nTHP := nGP + nUM + nLembur + vTunj - vBPJS +  vTambLain +
        vPot2 - vDenda - vPotLain + vUM3;

  edUangMakan.EditValue := nUM;
  edGapok.EditValue := nGP;
  edOvertime.EditValue := totJamLembur;
  edLembur.EditValue := nLembur;
  edHKerja.EditValue := nHK;
  edTHP.EditValue := nTHP;
end;

procedure TfrmPayrollCashInBali.HitungGaji1;
begin
   //HK
   edGapok.EditValue := edHKerja.EditValue * edVGP.EditValue;
   //hUM := nHK - hLate1 - hLate2 - hTA - hUT - hSakit;
   edUangMakan.EditValue := (edHKerja.EditValue - edLate2.EditValue -
       edLate1.EditValue - edUndertime.EditValue - edSakit.EditValue) * edVUMakan.EditValue;
   edLembur.EditValue := edOvertime.EditValue * edVLembur.EditValue;
   edTHP.EditValue := edGapok.EditValue + edUangMakan.EditValue + edLembur.EditValue;
end;

procedure TfrmPayrollCashInBali.HitungGaji2;
begin

end;

procedure TfrmPayrollCashInBali.HitungGaji3;
var
  nGP, vHarusKerja, gpHarian, gpBulanan : Double;
begin
  {ADMIN / RC}
  gpBulanan := edVTHP.EditValue - (edHarusKerja.EditValue * edVUMakan.EditValue);
  gpHarian := gpBulanan / edHarusKerja.EditValue;
  nGP := gpHarian * edHKerja.EditValue;

  edGapok.EditValue := nGP;
  //hUM := nHK - hLate2 - hLate1 - hTA - hUT - hSakit;
  //nUM := hUM * vUM;
  edUangMakan.EditValue := (edHKerja.EditValue - edLate2.EditValue -
       edLate1.EditValue - edUndertime.EditValue - edSakit.EditValue) * edVUMakan.EditValue;
  //nLembur := jLembur * (vGPBulanan / vHarusKerja * 0.3);
  edLembur.EditValue := edOvertime.EditValue * (edVTHP.EditValue / edHarusKerja.EditValue * 0.3);
  //nGPLibNas := vHLinNas * (vGPBulanan / vHarusKerja * 0.5);
  edGpLibNas.EditValue := edHLibNasional.EditValue * (edVTHP.EditValue / edHarusKerja.EditValue * 0.5);
  //nUMLibNas := vHLinNas * (vUM * 0.5);
  edUMLibNas.EditValue := edHLibNasional.EditValue * edVUMakan.EditValue * 0.5;
  //vFOT := gtvRekap.DataController.GetValue(RECSELECT, gtvRekapFullOvertime.Index);
  edGFOT.EditValue := edFOT.EditValue * (((edVTHP.EditValue / edHarusKerja.EditValue) +
        edVUMakan.EditValue) * 0.7);
  edTHP.EditValue := edGapok.EditValue + edUangMakan.EditValue + edLembur.EditValue +
       edTambahan.EditValue - edPengurang.EditValue + edFOT.EditValue +
       edGpLibNas.EditValue + edUMLibNas.EditValue;
end;

procedure TfrmPayrollCashInBali.HitungGaji5;
begin

end;

procedure TfrmPayrollCashInBali.HitungGaji4;
var
  nGP, vHarusKerja, gpHarian : Double;
begin
   //tr
   gpHarian := edVGP.EditValue / edHarusKerja.EditValue;
   edGapok.EditValue := gpHarian * edHKerja.EditValue;
   edUangMakan.EditValue := (edHKerja.EditValue - edLate1.EditValue - edUndertime.EditValue - edSakit.EditValue) * edVUMakan.EditValue;
   edLembur.EditValue := edOvertime.EditValue * edVLembur.EditValue;
   edTHP.EditValue := edGapok.EditValue + edUangMakan.EditValue + edLembur.EditValue +
       edGpLibNas.EditValue + edFOT.EditValue + edUMLibNas.EditValue + edTambahan.EditValue -
       edPengurang.EditValue + edKomisi.EditValue;
end;

procedure TfrmPayrollCashInBali.CariGaji;
begin
  qryCash1.Close;
  qryCash1.SQL.Clear;
  qryCash1.SQL.Add('select gapok, typepayroll, nthp, tglhabis, uangmakan ' +
        'from ben_hrd_kontrak_details where kodekaryawan = ''' + lblKodeKaryawan.Caption +
        ''' ORDER BY tglhabis DESC');
  qryCash1.Open;
  qryCash1.First;
  edVGP.EditValue := qryCash1.Fields[0].AsFloat;
  edVUMakan.EditValue := qryCash1.Fields[4].AsFloat;
  lblTypePayroll.Caption := qryCash1.Fields[1].AsString;
  edVTHP.EditValue := qryCash1.Fields[2].AsFloat;

  qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select lemburan from ben_payroll_type where autonum = ''' +
        lblTypePayroll.Caption + '''');
  qryCash2.Open;
  if (NOT qryCash2.IsEmpty) then
    begin
       if (qryCash2.Fields[0].AsFloat <= 0) then
         begin
           edVLembur.EditValue := 0;
         end
       else if (qryCash2.Fields[0].AsFloat > 0) then
         begin
           edVLembur.EditValue := qryCash2.Fields[0].AsFloat;
         end;
    end;
end;

procedure TfrmPayrollCashInBali.btnCariClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 16;
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
      frmMasterKaryawan.btnSelect.Tag := 16;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      //frmMasterKaryawan.WindowState := wsNormal;
    end;
end;

procedure TfrmPayrollCashInBali.btnLoadClick(Sender: TObject);
var
  hOff, hIjinPulang, jkIP : Double;
  x, typePayroll : Integer;
begin
   hIjinPulang := 0;
   hOff := 0;jkIP := 0;
   if (edPeriode.Text = '') then
     begin
       ShowMessage('Mohon Pilih Periode Terlebih Dahulu !');
       Exit;
     end;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update ben_presensi_rekap set ' +
          'payrollperiode = ''' + edPeriode.Text + ''' ' +
          'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
          ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''';');

  qryExec.SQL.Add('update ben_payroll_um3 set ' +
          'payrollperiode = ''' + edPeriode.Text + ''' ' +
          'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
          ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''';');
  qryExec.ExecSQL;
  CariGaji;
  //----------------------------------------------------------------------------

  //------------------------------------------------------------------------------
  //cari off
  qryCash3.Close;
  qryCash3.SQL.Clear;
  qryCash3.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption +
      ''' and tagresult = ''' + 'OFF' + '''');
  qryCash3.Open;
  edHOff.EditValue := qryCash3.Fields[0].AsFloat;

  qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
      lblKodeKaryawan.Caption + ''' AND tagresult = ''' + 'OFF' + '''');
  qryCash2.Open;
  //hoff := qryCash2.Fields[0].AsFloat;
  edTotalOff.EditValue := qryCash2.Fields[0].AsFloat;
  if (edLama.EditValue < 28) then
      begin
        edHarusKerja.EditValue := 30 - edTotalOff.EditValue;
      end
  else if (edLama.EditValue >= 28) then
    begin
      edHarusKerja.EditValue := edLama.EditValue - edTotalOff.EditValue;
    end;
  //------------------------------------------------------------------------------

  edHCashin.EditValue := DaysBetween(edCashStart.Date, edCashEnd.Date) + 1;
  //----------------------------------------------------------------------------
  //cari late
  qryCash3.Close;
  qryCash3.SQL.Clear;
  qryCash3.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption +
      ''' and tagresult = ''' + 'T' + '''');
  qryCash3.Open;
  edLate1.EditValue := qryCash3.Fields[0].AsFloat;

  qryCash3.Close;
  qryCash3.SQL.Clear;
  qryCash3.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption +
      ''' and tagresult = ''' + 'T2' + '''');
  qryCash3.Open;
  edLate2.EditValue := qryCash3.Fields[0].AsFloat;
  //----------------------------------------------------------------------------
  //cari cuti
  qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption +
      ''' and tagresult = ''' + 'C' + '''');
  qryCash2.Open;
  edCuti.EditValue := qryCash2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
//cari ijin pulang
  {qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select jkreal from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' +
      lblKodeKaryawan.Caption + ''' AND tagresult = ''' + 'IP' + '''');
  qryCash2.Open;
  qryCash2.First;
  edIjinPulang.EditValue := 0;
  for x := 0 to qryCash2.RecordCount - 1 do
    begin
      if (qryCash2.Fields[0].AsFloat >= 4) then
        begin
          jkIP := qryCash2.Fields[0].AsFloat;
          hIjinPulang := ((9 - jkIP)/9);
        end
      else if (qryCash2.Fields[0].AsFloat < 4) then
        begin
          hIjinPulang := hIjinPulang + 0;
        end;
      qryCash2.Next;
    end;
   edIjinPulang.EditValue := hIjinPulang;}
//------------------------------------------------------------------------------------------------
//cari ijin tidak masuk
  qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption +
      ''' and tagresult = ''' + 'IT' + '''');
  qryCash2.Open;
  edTidakMasuk.EditValue := qryCash2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
//cari ijin sakit
  qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption +
      ''' and tagresult = ''' + 'S' + '''');
  qryCash2.Open;
  edSakit.EditValue := qryCash2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
  //undertime
  qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption +
      ''' and tagresult = ''' + 'U' + '''');
  qryCash2.Open;
  edUndertime.EditValue := qryCash2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
//masuk libur nasional
  {qryCash3.Close;
  qryCash3.SQL.Clear;
  qryCash3.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption + ''' AND tagresult <> ''' + 'ALPA' +
      ''' AND tagresult <> ''' + 'OFF' +
      ''' AND tagresult <> ''' + 'OUT' +
      ''' AND libnas = ''' + 'Y' + '''');
  qryCash3.Open;
  edHLibNasional.EditValue := qryCash3.Fields[0].AsFloat;}
//------------------------------------------------------------------------------------------------
//cari overtime
  {qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select sum(selkeluar) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption +
      ''' AND tagkeluar = ''' + 'OT' + ''' AND tagresult <> ''' + 'OUT' + '''');
  qryCash2.Open;
  edOvertime.EditValue := qryCash2.Fields[0].AsFloat;
  //gtvRekap.DataController.SetValue(NEWREC, gtvRekapOvertime.Index, qryTemp2.Fields[0].AsFloat);

  qryCash3.Close;
  qryCash3.SQL.Clear;
  qryCash3.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption +
      ''' AND tagkeluar = ''' + 'FOT' + '''');
  qryCash3.Open;

  edFOT.EditValue := qryCash3.Fields[0].AsFloat;}
//------------------------------------------------------------------------------------------------
//masuk libur alpa
  qryCash3.Close;
  qryCash3.SQL.Clear;
  qryCash3.SQL.Add('select count(tagresult) as c_off from ben_presensi_rekap ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) +
      ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) +
      ''' AND kodekaryawan = ''' + lblKodeKaryawan.Caption +
      ''' and tagresult = ''' + 'A' + '''');
  qryCash3.Open;
  qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select denda from ben_presensi_tag where tagid = ''' + 'A' +
    '''');
  qryCash2.Open;
  edAlpa.EditValue := qryCash3.Fields[0].AsFloat;
  edPengurang.EditValue := edAlpa.EditValue * qryCash2.Fields[0].AsFloat;
//------------------------------------------------------------------------------------------------
  edHKerja.EditValue := edHCashin.EditValue - edHOff.EditValue -
      edIjinPulang.EditValue - edLate2.EditValue - edAlpa.EditValue - edTidakMasuk.EditValue;
     {hcuti + hFOT + hLate1 + hIjinMsk + hSakit +
            hIjinPulang + hUnder;}
  typePayroll := StrToInt(lblTypePayroll.Caption);

   case typePayroll of
     1 : HitungGajiHK(0, lblKodeKaryawan.Caption);
     2 : HitungGajiMTC(0, lblKodeKaryawan.Caption);
     3 : HitungGajiADM(0, lblKodeKaryawan.Caption);
     4 : HitungGajiTR(0, lblKodeKaryawan.Caption, lblIDFinger.Caption);
     5 : HitungGajiSC(0, lblKodeKaryawan.Caption);
     7 : HitungGajiDriver(0, lblKodeKaryawan.Caption);
     8 : HitungGajiRC(0, lblKodeKaryawan.Caption);
   end;

end;

procedure TfrmPayrollCashInBali.btnResetClick(Sender: TObject);
begin
   ClearForm;
end;

procedure TfrmPayrollCashInBali.Button2Click(Sender: TObject);
begin
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update ben_presensi_rekap set ' +
              'tagmasuk = ''' + 'CI' + ''',' +
              'tagkeluar = ''' + 'CI' + ''',' +
              'tagauto = ''' + 'CI' + ''',' +
              'tagresult = ''' + 'CI' + ''',' +
              'lastedituser = ''' + frmMain.USERAPPS + ''',' +
              'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
              'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) + ''' ' +
              'AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) + ''' ' +
              'AND tagresult <> ''' + 'OFF' + ''' ' +
              'AND kodekaryawan = ''' + lblKodeKaryawan.Caption + ''';');
  qryExec.ExecSQL;

  qryCash4.Close;
  qryCash4.SQL.Clear;
  qryCash4.SQL.Add('select autonum from ben_payroll_cashin where kodekaryawan = ''' +
     lblKodeKaryawan.Caption + ''' and payrollperiode = ''' + edPeriode.Text + '''');
  qryCash4.Open;
  if (NOT qryCash4.IsEmpty) then
    begin
      qryExec.SQL.Add('update ben_payroll_cashin set ' +
            'tglstart = ''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) + ''',' +
            'tglend = ''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) + ''',' +
            'hperiode = ''' + FloatToStr(edHCashin.EditValue) + ''',' +
            'hoff = ''' + FloatToStr(edHOff.EditValue) + ''',' +
            'haruskerja = ''' + FloatToStr(edHarusKerja.EditValue) + ''',' +
            'hkerja = ''' + FloatToStr(edHKerja.EditValue) + ''',' +
            'overtime = ''' + FloatToStr(edOvertime.EditValue) + ''',' +
            'hunder = ''' + FloatToStr(edUndertime.EditValue) + ''',' +
            'hlate1 = ''' + FloatToStr(edLate1.EditValue) + ''',' +
            'hlate2 = ''' + FloatToStr(edLate2.EditValue) + ''',' +
            'hsakit = ''' + FloatToStr(edSakit.EditValue) + ''',' +
            'hitidakmasuk = ''' + FloatToStr(edTidakMasuk.EditValue) + ''',' +
            'hipulang = ''' + FloatToStr(edIjinPulang.EditValue) + ''',' +
            'halpa = ''' + FloatToStr(edAlpa.EditValue) + ''',' +
            'hfot = ''' + FloatToStr(edFOT.EditValue) + ''',' +
            'hlibnas = ''' + FloatToStr(edHLibNasional.EditValue) + ''',' +
            'hcuti = ''' + FloatToStr(edCuti.EditValue) + ''',' +
            'tamblain = ''' + FloatToStr(edTambahan.EditValue) + ''',' +
            'potlain = ''' + FloatToStr(edPengurang.EditValue) + ''',' +
            'gapok = ''' + FloatToStr(edGapok.EditValue) + ''',' +
            'nlibnas = ''' + FloatToStr(edHLibNasional.EditValue) + ''',' +
            'numakan = ''' + FloatToStr(edUangMakan.EditValue) + ''',' +
            'numlibnas = ''' + FloatToStr(edUMLibNas.EditValue) + ''',' +
            'gplibnas = ''' + FloatToStr(edGpLibNas.EditValue) + ''',' +
            'nlembur = ''' + FloatToStr(edLembur.EditValue) + ''',' +
            'nilaifot = ''' + FloatToStr(edGFOT.EditValue) + ''',' +
            'komisi = ''' + FloatToStr(edKomisi.EditValue) + ''',' +
            'nilaithp = ''' + FloatToStr(edTHP.EditValue) + ''',' +
            'keterangan = ' + QuotedStr(edKeterangan.Text) + ',' +
            'lastedituser = ''' + frmMain.USERAPPS + ''',' +
            'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
            'where kodekaryawan = ''' + lblKodeKaryawan.Caption +
            ''' and payrollperiode = ''' + edPeriode.Text + ''';');
    end
  else if (qryCash4.IsEmpty) then
    begin
      qryExec.SQL.Add('insert into ben_payroll_cashin values(' +
            '''' + '' + ''',' +
            '''' + frmMain.APP_OUTLETID + ''',' +
            '''' + edPeriode.Text + ''',' +
            '''' + FormatDateTime('yyyy-MM-dd', edCashStart.Date) + ''',' +
            '''' + FormatDateTime('yyyy-MM-dd', edCashEnd.Date) + ''',' +
            '''' + lblKodeKaryawan.Caption + ''',' +
            '''' + lblIDFinger.Caption + ''',' +
            '''' + FloatToStr(edHCashin.EditValue) + ''',' +
            '''' + FloatToStr(edHOff.EditValue) + ''',' +
            '''' + FloatToStr(edHarusKerja.EditValue) + ''',' +
            '''' + FloatToStr(edHKerja.EditValue) + ''',' +
            '''' + FloatToStr(edOvertime.EditValue) + ''',' +
            '''' + FloatToStr(edUndertime.EditValue) + ''',' +
            '''' + FloatToStr(edLate1.EditValue) + ''',' +
            '''' + FloatToStr(edLate2.EditValue) + ''',' +
            '''' + FloatToStr(edSakit.EditValue) + ''',' +
            '''' + '0' + ''',' +
            '''' + FloatToStr(edTidakMasuk.EditValue) + ''',' +
            '''' + FloatToStr(edIjinPulang.EditValue) + ''',' +
            '''' + '0' + ''',' +
            '''' + '0' + ''',' +
            '''' + FloatToStr(edAlpa.EditValue) + ''',' +
            '''' + FloatToStr(edFOT.EditValue) + ''',' +
            '''' + FloatToStr(edHLibNasional.EditValue) + ''',' +
            '''' + FloatToStr(edCuti.EditValue) + ''',' +
            '''' + FloatToStr(edTambahan.EditValue) + ''',' +
            '''' + FloatToStr(edPengurang.EditValue) + ''',' +
            '''' + FloatToStr(edGapok.EditValue) + ''',' +
            '''' + FloatToStr(edHLibNasional.EditValue) + ''',' +
            '''' + FloatToStr(edUangMakan.EditValue) + ''',' +
            '''' + FloatToStr(edUMLibNas.EditValue) + ''',' +
            '''' + FloatToStr(edGpLibNas.EditValue) + ''',' +
            '''' + FloatToStr(edLembur.EditValue) + ''',' +
            '''' + FloatToStr(edGFOT.EditValue) + ''',' +
            '''' + FloatToStr(edKomisi.EditValue) + ''',' +
            '''' + FloatToStr(edTHP.EditValue) + ''',' +
            QuotedStr(edKeterangan.Text) + ',' +
            '''' + frmMain.USERAPPS + ''',' +
            '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
    end;
  qryExec.ExecSQL;
  btnReset.Click;

end;

procedure TfrmPayrollCashInBali.edPeriodeChange(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  qryCash1.Close;
  qryCash1.SQL.Clear;
  qryCash1.SQL.Add('select payrollperiode, tglstart, tglend, masakerja ' +
      'from ben_payroll_periode where payrollperiode = ''' + edPeriode.Text + '''');
  qryCash1.Open;
  edStart.Date := qryCash1.Fields[1].AsDateTime;
  edEnd.Date := qryCash1.Fields[2].AsDateTime;
  edLama.EditValue := qryCash1.Fields[3].AsInteger;

  Screen.Cursor := crDefault;
end;

procedure TfrmPayrollCashInBali.edSearchIDKeyPress(Sender: TObject; var Key: Char);
var
  strSearch : String;
begin
   if (key = #13) then
     begin
       case Length(edSearchID.Text) of
         1 : strSearch := '0000' + edSearchID.Text;
         2 : strSearch := '000' + edSearchID.Text;
         3 : strSearch := '00' + edSearchID.Text;
         4 : strSearch := '0' + edSearchID.Text;
         5 : strSearch := edSearchID.Text;
       end;
       qryCash1.Close;
       qryCash1.SQL.Clear;
       qryCash1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen ' +
         'from ben_hrd_karyawan_info where idkaryawan = ' + QuotedStr(strSearch) +
         ' and active = ''' + 'Y' + '''');
       qryCash1.Open;
       if (qryCash1.IsEmpty) then
         begin
           ShowMessage('ID Finger Tidak Ditemukan !');
           Exit;
         end;
       frmPayrollCashInBali.lblKodeKaryawan.Caption := qryCash1.Fields[0].AsString;
       frmPayrollCashInBali.lblIDFinger.Caption := qryCash1.Fields[1].AsString;
       frmPayrollCashInBali.lblNamaKaryawan.Caption := qryCash1.Fields[2].AsString;
       frmPayrollCashInBali.lblDepartemen.Caption := qryCash1.Fields[3].AsString;
     end;
end;

procedure TfrmPayrollCashInBali.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryCash1.Free;
   qryCash2.Free;
   qryCash3.Free;
   qryCash4.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmPayrollCashInBali.FormCreate(Sender: TObject);
var
  i : Integer;
begin
   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qryCash1 := TMyQuery.Create(Self);
   qryCash1.Connection := DMDB.dbInternal;
   qryCash1.SQL.Add('select * from temptable');
   qryCash1.Active := true;

   qryCash2 := TMyQuery.Create(Self);
   qryCash2.Connection := DMDB.dbInternal;
   qryCash2.SQL.Add('select * from temptable');
   qryCash2.Active := true;

   qryCash3 := TMyQuery.Create(Self);
   qryCash3.Connection := DMDB.dbInternal;
   qryCash3.SQL.Add('select * from temptable');
   qryCash3.Active := true;

   qryCash4 := TMyQuery.Create(Self);
   qryCash4.Connection := DMDB.dbInternal;
   qryCash4.SQL.Add('select * from temptable');
   qryCash4.Active := true;

   qryCash2.Close;
   qryCash2.SQL.Clear;
   qryCash2.SQL.Add('select payrollperiode from ben_payroll_periode ' +
      'order by tglstart DESC LIMIT 5');
   qryCash2.Open;
   qryCash2.First;
   for i := 0 to qryCash2.RecordCount - 1 do
      begin
        edPeriode.Items.Add(qryCash2.Fields[0].AsString);
        qryCash2.Next;
      end;
   edCashStart.Date := Date;
   edCashEnd.Date := Date;

  {qryCash1.Close;
  qryCash1.SQL.Clear;
  qryCash1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.DBNAME) +
    'AND table_name = ' + QuotedStr('ben_payroll_cashin'));
  qryCash1.Open;
  if (qryCash1.IsEmpty) then
  begin
    qryExec.SQL.Clear;
    qryExec.SQL.Add(memoStruktur1.Text);
    qryExec.ExecSQL;
  end;}

  qryCash2.Close;
  qryCash2.SQL.Clear;
  qryCash2.SQL.Add('select tagid from ben_presensi_tag where tagid = ''' + 'CI' + '''');
  qryCash2.Open;
  if (qryCash2.IsEmpty) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into ben_presensi_tag values(' +
        '''' + 'CI' + ''',' +
        '''' + 'CASH IN' + ''',' +
        '''' + '0' + ''',' +
        '''' + '0' + ''',' +
        '''' + '0' + ''',' +
        '''' + 'N' + ''',' +
        '''' + '0' + ''');');
      qryExec.ExecSQL;
    end;

end;

end.
