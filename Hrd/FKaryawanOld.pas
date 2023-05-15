unit FKaryawanOld;

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
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, strUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, MyAccess;

type
  TfrmKaryawanOld = class(TForm)
    tblKaryawanOld: TMyTable;
    dsTblKaryawanOld: TDataSource;
    Label1: TLabel;
    gtbOld: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbOldkaryawan_id: TcxGridDBColumn;
    gtbOlddepartemen_id: TcxGridDBColumn;
    gtbOldshift_id: TcxGridDBColumn;
    gtbOldstatus_kerja_id: TcxGridDBColumn;
    gtbOldtgl_masuk_kerja: TcxGridDBColumn;
    gtbOldnama_lengkap: TcxGridDBColumn;
    gtbOldsex: TcxGridDBColumn;
    gtbOldalamat_ktp: TcxGridDBColumn;
    gtbOldalamat_tinggal: TcxGridDBColumn;
    gtbOldtelp_fixline: TcxGridDBColumn;
    gtbOldtelp_ponsel: TcxGridDBColumn;
    gtbOldtempat_lahir: TcxGridDBColumn;
    gtbOldtgl_lahir: TcxGridDBColumn;
    gtbOldagama_id: TcxGridDBColumn;
    gtbOldgol_darah: TcxGridDBColumn;
    gtbOldtype: TcxGridDBColumn;
    btnSelect: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelectClick(Sender: TObject);
  private
    { Private declarations }
    qryOld1, qryOld2 : TMyQuery;
    function autoNik(const tglMasuk : TDate) : String;
  public
    { Public declarations }
  end;

var
  frmKaryawanOld: TfrmKaryawanOld;

implementation

{$R *.dfm}
uses FdmDB, FMasterKaryawanAdd, FMain;

function TfrmKaryawanOld.autoNik(const tglMasuk: TDate): String;
var
  nBulan, nTahun, strNik, lastNik, oldStrNik, NEW_NIK : String;
  intLastNik, newLastNik : Integer;
begin
  nBulan := FormatDateTime('MM', tglMasuk);
  nTahun := FormatDateTime('yy', tglMasuk);
  strNik := frmMain.APP_OUTLETID + nTahun + nBulan + '%';
  qryOld1.Close;
  qryOld1.SQL.Clear;
  qryOld1.SQL.Add('select kodekaryawan from ben_hrd_karyawan_info where kodekaryawan like ''' +
      strNik + ''' AND active = ''' + 'Y' + ''' Order By kodekaryawan ASC');
  qryOld1.Open;
  if (qryOld1.IsEmpty) then NEW_NIK := frmMain.APP_OUTLETID + nTahun + nBulan + '001'
  else if (NOT qryOld1.IsEmpty) then
    begin
      qryOld1.Last;
      oldStrNik := qryOld1.Fields[0].AsString;
      intLastNik := StrToInt(RightStr(oldStrNik, 3));
      newLastNik := intLastNik + 1;
      case Length(inttostr(newLastNik)) of
         1 : strNik := frmMain.APP_OUTLETID + nTahun + nBulan + '00' + inttostr(newLastNik);
         2 : strNik := frmMain.APP_OUTLETID + nTahun + nBulan + '0' + inttostr(newLastNik);
         3 : strNik := frmMain.APP_OUTLETID + nTahun + nBulan + inttostr(newLastNik);
      end;
      NEW_NIK := strNik;
    end;
    Result := NEW_NIK;
end;



procedure TfrmKaryawanOld.btnSelectClick(Sender: TObject);
var
  recSelect : Integer;
  dMasukKerja : TDate;
  idKaryawan, kodeKaryawan, namaKaryawan : String;
begin
  recSelect := gtbOld.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then
     begin
       ShowMessage('Pilih Karyawan Dulu !!');
       Exit;
     end;
  namaKaryawan := vartostr(gtbOld.DataController.GetValue(recSelect, gtbOldnama_lengkap.Index));
  qryOld2.Close;
  qryOld2.SQL.Clear;
  qryOld2.SQL.Add('select kodekaryawan from ben_hrd_karyawan_info where ' +
      'namakaryawan = ' + QuotedStr(namaKaryawan) + ' and active = ''' + 'Y' + '''');
  qryOld2.Open;
  if (NOT qryOld2.IsEmpty) then
    begin
      ShowMessage('Nama Karyawan ' + namaKaryawan + ' Sudah Ada !' +
         #13#13 + 'Mohon Cek data kembali !');
      Exit;
    end;
  idKaryawan := vartostr(gtbOld.DataController.GetValue(recSelect, gtbOldkaryawan_id.Index));
  dMasukKerja := VarToDateTime(gtbOld.DataController.GetValue(recSelect, gtbOldtgl_masuk_kerja.Index));
  kodeKaryawan := autoNik(dMasukKerja);
  //ShowMessage(kodeKaryawan);
  with frmMasterKaryawanAdd do
    begin
      edKodekaryawan.Text := kodeKaryawan;
      edIdkaryawan.Text := idKaryawan;
      edNamaKaryawan.Text := namaKaryawan;
      edNamarekening.Text := namaKaryawan;
      //edOutlet.EditValue := frmMenuMain.IDOUTLET;
      ckAktif.Checked := True;
      edDepartemen.EditValue := gtbOld.DataController.GetValue(recSelect, gtbOlddepartemen_id.Index);
      edTglMasuk.Date := dMasukKerja;
      edAlamatKtp.Text := vartostr(gtbOld.DataController.GetValue(recSelect, gtbOldalamat_ktp.Index));
      edAlamatTinggal.Text := vartostr(gtbOld.DataController.GetValue(recSelect, gtbOldalamat_tinggal.Index));
      edTelpHome.Text := vartostr(gtbOld.DataController.GetValue(recSelect, gtbOldtelp_fixline.Index));
      edHape.Text := vartostr(gtbOld.DataController.GetValue(recSelect, gtbOldtelp_ponsel.Index));
      edTmptLahir.Text := vartostr(gtbOld.DataController.GetValue(recSelect, gtbOldtempat_lahir.Index));
      edGoldar.Text := vartostr(gtbOld.DataController.GetValue(recSelect, gtbOldalamat_ktp.Index));
      edTglLahir.Date := VarToDateTime(gtbOld.DataController.GetValue(recSelect, gtbOldtgl_lahir.Index));
      edAgama.Text := vartostr(gtbOld.DataController.GetDisplayText(recSelect, gtbOldagama_id.Index));
    end;
  frmKaryawanOld.Close;
end;

procedure TfrmKaryawanOld.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblKaryawanOld.Active := True;
  Action := caFree;
end;

procedure TfrmKaryawanOld.FormCreate(Sender: TObject);
begin
  qryOld1 := TMyQuery.Create(Self);
  qryOld1.Connection := DMDB.dbInternal;
  qryOld1.SQL.Add('select * from temptable');
  qryOld1.Active := true;

  qryOld2 := TMyQuery.Create(Self);
  qryOld2.Connection := DMDB.dbInternal;
  qryOld2.SQL.Add('select * from temptable');
  qryOld2.Active := true;

   tblKaryawanOld.Active := True;
   gtbOld.DataController.Refresh;
end;

end.
