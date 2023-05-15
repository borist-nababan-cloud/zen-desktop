unit FRekapHarianBali;

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
  cxFilter, cxData, cxDataStorage, cxEdit, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox,
  cxRadioGroup, DBAccess, cxPC, DB, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DateUtils, cxCalc, ShellApi, cxGridExportLink,
  cxProgressBar, cxCheckBox, cxTimeEdit, cxGridBandedTableView, Menus, cxButtons,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxBarBuiltInMenu, MemDS, MyAccess;

type
  TfrmRekapHarianBali = class(TForm)
    Label4: TLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    rbSearch: TcxRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    tabControl: TcxPageControl;
    tbDivisi: TcxTabSheet;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    edDepartemen: TcxLookupComboBox;
    btnDivisi: TButton;
    tbKaryawan: TcxTabSheet;
    tbAll: TcxTabSheet;
    tblTag: TMyTable;
    dsTblTag: TDataSource;
    tblShift: TMyTable;
    dsTblShift: TDataSource;
    btnExport: TButton;
    dlgSave: TSaveDialog;
    lblLoad1: TLabel;
    lblLoad2: TLabel;
    prog1: TcxProgressBar;
    prog2: TcxProgressBar;
    btnPost: TButton;
    lblKodeKaryawan: TLabel;
    btnCariKaryawan: TButton;
    lblIDFinger: TLabel;
    lblNamaKaryawan: TLabel;
    btnLoadKode: TButton;
    btnLoadAll: TButton;
    gtvRekap: TcxGridBandedTableView;
    gtvRekapDivisi: TcxGridBandedColumn;
    gtvRekapIDFinger: TcxGridBandedColumn;
    gtvRekapKode: TcxGridBandedColumn;
    gtvRekapNamaShift: TcxGridBandedColumn;
    gtvRekapTanggal: TcxGridBandedColumn;
    gtvRekapNama: TcxGridBandedColumn;
    gtvRekapJMasuk: TcxGridBandedColumn;
    gtvRekapTMasuk: TcxGridBandedColumn;
    gtvRekapFPMasuk: TcxGridBandedColumn;
    gtvRekapSelMasuk: TcxGridBandedColumn;
    gtvRekapJKeluar: TcxGridBandedColumn;
    gtvRekapFPKeluar: TcxGridBandedColumn;
    gtvRekapSelKeluar: TcxGridBandedColumn;
    gtvRekapTKeluar: TcxGridBandedColumn;
    gtvRekapTagAuto: TcxGridBandedColumn;
    gtvRekapTagResult: TcxGridBandedColumn;
    gtvRekapJKSeharusnya: TcxGridBandedColumn;
    gtvRekapJKReal: TcxGridBandedColumn;
    gtvRekapKomisi: TcxGridBandedColumn;
    gtvRekapNotes: TcxGridBandedColumn;
    gtvRekapLibNas: TcxGridBandedColumn;
    gtvRekapKet: TcxGridBandedColumn;
    gtvRekapTglKeluar: TcxGridBandedColumn;
    pmGrid: TPopupMenu;
    SelectIn1: TMenuItem;
    SelectOut1: TMenuItem;
    gtvRekapNamaHari: TcxGridBandedColumn;
    cxButton1: TcxButton;
    memStruktur: TMemo;
    memoStruktur2: TMemo;
    edQuickSearch: TcxTextEdit;
    gtvRekapTypeJadwal: TcxGridBandedColumn;
    gtvRekapKodeJadwal: TcxGridBandedColumn;
    gtvRekapKodeKontrak: TcxGridBandedColumn;
    gtvRekapUMx3: TcxGridBandedColumn;
    Memo1: TMemo;
    gtvRekapCKLembur: TcxGridBandedColumn;
    gtvRekapJLemburEnd: TcxGridBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    gtvRekapHourLembur: TcxGridBandedColumn;
    gtvRekapJLembStart: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnDivisiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportClick(Sender: TObject);
    procedure btnCariKaryawanClick(Sender: TObject);
    procedure btnLoadKodeClick(Sender: TObject);
    procedure btnLoadAllClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure gtvRekapSelMasukCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gtvRekapSelKeluarCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gtvRekapTagResultCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure SelectIn1Click(Sender: TObject);
    procedure SelectOut1Click(Sender: TObject);
    procedure gtvRekapFPMasukGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure edQuickSearchKeyPress(Sender: TObject; var Key: Char);
    procedure gtvRekapFPKeluarGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure gtvRekapJKeluarGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure gtvRekapFPMasukGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure gtvRekapJMasukGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure gtvRekapTanggalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure gtvRekapJLemburEndGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);

  private
    { Private declarations }
    IDKARYAWAN, IDFINGER, KODEJADWAL, JADWALTETAP, NAMA, DIVISI, NAMASHIFT,
    KODEKONTRAK, TAGAUTO, KETERANGAN : String;
    NEWREC : Integer;
    qryRek1, qryRek2, qryRek3, qryRek4, qryRek5, qryExec : TMyQuery;
    TANGGALCARI, TGLMASUK, TGLKELUAR, TGLFPMASUK, TGLFPKELUAR : TDate;
    TMRMASUK, TMRKELUAR, FINGERIN, FINGEROUT : TTime;
    jMasuk, jKeluar, fMasuk, FKeluar : TDateTime;
    KOMISITOT : Double;
    procedure CariAbsenHarian;
    procedure CariJadwalTetap;
    procedure CariFinger;
    procedure CariKomisi;
    procedure CariCuti;
    procedure CariLain;
    procedure CariLembur;
    procedure CariUMX3;
    procedure CariListKaryawan();
    procedure SearchJadwalTetap(recSel : Integer; tglCari : TDate; CodeJadwal : String);
    procedure CariLemburJadwalTetap(recSel : Integer; tglCari : TDate; NIK : String);
    procedure SearchJadwal();
    procedure SearchMasukBali(recSel : Integer; tglCari : TDate; CodeJadwal : String);
    procedure CreateListCariAbsen(NIK : String; StaffName : String; FingerID : String; Division : String);
    procedure SearchJadwalDanLembur(NIK : String; FingerID : String; DateMasuk : TDate; nRecord : Integer);
    procedure CariFPMasuk(NIK : String; jd1 : TDateTime; jd2 : TDateTime; nRecord : Integer; jdReal : TDateTime);
    procedure CariFPKeluar(NIK : String; nRecord : Integer);
    procedure CariFPKeluarBali(NIK : String; nRecord : Integer);
    procedure CariIjin(NIK : String; nRecord : Integer);
    procedure CariLiburNasional(NIK : String; nRecord : Integer);
    procedure CariResultLama(NIK : String; nRecord : Integer);
    procedure CariKomisiBali(NIK : String; nRecord : Integer);
  public
    { Public declarations }
  end;

var
  frmRekapHarianBali: TfrmRekapHarianBali;

implementation

{$R *.dfm}
uses FMain, FMasterkaryawan, FdmDB, FRekapSelectFp;

procedure TfrmRekapHarianBali.CariKomisiBali(NIK: string; nRecord: Integer);
var
   FingerCode, idTransMaster, kodeMenu, kodePacket : String;
   tglTrans : TDate;
   i, y, z: Integer;
   TotKomisi : Double;
begin
  TotKomisi := 0;
  FingerCode := vartostr(gtvRekap.DataController.GetValue(nRecord, gtvRekapIDFinger.Index));
  tglTrans := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
  qryRek3.Close;
  qryRek3.SQL.Clear;
  qryRek3.SQL.Add('select trans_id, type_trans from ben_trans_master where tanggal = ''' +
         FormatDateTime('yyyy-MM-dd', tglTrans) + ''' and id_therapist = ''' +
         FingerCode + '''');
  qryRek3.Open;
  qryRek3.First;
  for i := 0 to qryRek3.RecordCount - 1 do
     begin
       //Memo1.Lines.Add(qryRek3.Fields[0].AsString);
       idTransMaster := qryRek3.Fields[0].AsString;
       if (NOT qryRek3.IsEmpty) then
          begin
            if (qryRek3.Fields[1].AsString = '2') then
               begin
                 {Memo1.Lines.Add('------------------------------------------------');
                 Memo1.Lines.Add('TRAVEL AGENT');
                 Memo1.Lines.Add('ID TRANSMASTER = ' + idTransMaster);
                 Memo1.Lines.Add('------------------------------------------------');}
                 qryRek4.Close;
                 qryRek4.SQL.Clear;
                 qryRek4.SQL.Add('select id_menu, nama_menu, type_menu, n_nett ' +
                          'from ben_trans_detail where trans_id = ''' +
                          qryRek3.Fields[0].AsString + ''' order by autonum ASC');
                 qryRek4.Open;
                 qryRek4.First;

                 for y := 0 to qryRek4.RecordCount - 1 do
                    begin
                       //Memo1.Lines.Add(qryRek4.Fields[0].AsString + ' = ' + qryRek4.Fields[1].AsString);
                       kodePacket := qryRek4.Fields[0].AsString;
                       qryRek5.Close;
                       qryRek5.SQL.Clear;
                       qryRek5.SQL.Add('select id_master_paket, id_menu_master, ' +
                           'nama_menu_master, waktu, hpp_net ' +
                           'from ben_paket_detail where id_master_paket = ''' +
                           kodePacket + '''');
                       qryRek5.Open;
                       if (NOT qryRek5.IsEmpty) then
                         begin
                           qryRek2.Close;
                           qryRek2.SQL.Clear;
                           qryRek2.SQL.Add('select sum(hpp_net) from ben_paket_detail ' +
                               'WHERE ben_paket_detail.id_master_paket = ''' + kodePacket +
                               ''' AND (select ben_menu_master.type_menu from ' +
                               'ben_menu_master where ben_menu_master.id_menu =  ' +
                               'ben_paket_detail.id_menu_master) <> ''' + 'P' + '''');
                           qryRek2.Open;
                           TotKomisi := TotKomisi + qryRek2.Fields[0].AsFloat;
                           gtvRekap.DataController.SetValue(nRecord, gtvRekapKomisi.Index, TotKomisi);
                           gtvRekap.DataController.PostEditingData;
                           gtvRekap.DataController.Post(True);
                         end
                       else if (qryRek5.IsEmpty) then
                         begin
                             if (qryRek4.Fields[2].AsString <> 'P') then
                               begin
                                 TotKomisi := TotKomisi + qryRek4.Fields[3].AsFloat;
                                 gtvRekap.DataController.SetValue(nRecord, gtvRekapKomisi.Index, TotKomisi);
                                 gtvRekap.DataController.PostEditingData;
                                 gtvRekap.DataController.Post(True);
                               end;
                         end;
                       qryRek4.Next;
                    end;
               end
            else if (qryRek3.Fields[1].AsString <> '2') then
               begin
                 Memo1.Lines.Add('************************************************');
                 Memo1.Lines.Add('WALK IN');
                 Memo1.Lines.Add('ID TRANSMASTER = ' + idTransMaster);
                 Memo1.Lines.Add('************************************************');
                 qryRek4.Close;
                 qryRek4.SQL.Clear;
                 qryRek4.SQl.Add('select ben_trans_detail.trans_id, ben_trans_detail.type_menu, ben_trans_detail.type_jasa, ' +
                         'ben_trans_detail.id_menu, ben_trans_detail.nama_menu, ben_trans_detail.optional, ben_trans_detail.n_jual, ' +
                         '(select ben_menu_master.ispaket from ben_menu_master where ben_menu_master.id_menu = ' +
                         'ben_trans_detail.id_menu) as ispaket ' +
                         'from ben_trans_detail where trans_id = ''' + idTransMaster + '''');
                 qryRek4.Open;
                 qryRek4.First;
                 for y := 0 to qryRek4.RecordCount - 1 do
                    begin
                       kodeMenu := qryRek4.Fields[3].AsString;
                       Memo1.Lines.Add('Kode Menu = ' + qryRek4.Fields[3].AsString);
                       if (qryRek4.Fields[7].AsString = 'N') then
                           begin
                             {is NOT paket}
                             if (qryRek4.Fields[2].AsString <> 'PR') then
                                begin
                                   TotKomisi := TotKomisi + qryRek4.Fields[6].AsFloat;
                                   Memo1.Lines.Add('Nama Menu ' + qryRek4.Fields[4].AsString);
                                   gtvRekap.DataController.SetValue(nRecord, gtvRekapKomisi.Index, TotKomisi);
                                   gtvRekap.DataController.PostEditingData;
                                   gtvRekap.DataController.Post(True);
                                end;

                           end
                       else if (qryRek4.Fields[7].AsString = 'Y') then
                           begin
                                {IS PAKET}
                                qryRek5.Close;
                                qryRek5.SQL.Clear;
                                qryRek5.SQL.Add('select sum(hpp_net) ' +
                                   'from ben_paket_walkin_detail ' +
                                   'where id_menu_paket = ''' + kodeMenu +
                                   ''' AND (select ben_menu_master.type_menu from ben_menu_master where ' +
                                   'ben_menu_master.id_menu = ben_paket_walkin_detail.id_menu_master) <> ''' + 'P' + '''');
                                qryRek5.Open;
                                TotKomisi := TotKomisi + qryRek5.Fields[0].AsFloat;
                                Memo1.Lines.Add('Nama Menu ' + qryRek4.Fields[4].AsString);
                                gtvRekap.DataController.SetValue(nRecord, gtvRekapKomisi.Index, TotKomisi);

                           end;
                      qryRek4.Next;
                    end;

               end
          end;
       qryRek3.Next;
     end;
end;

procedure TfrmRekapHarianBali.CariResultLama(NIK: string; nRecord: Integer);
var
  tglSC : TDate;
begin
  tglSC := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
  qryRek3.Close;
  qryRek3.SQL.Clear;
  qryRek3.SQL.Add('select tagresult from ben_presensi_rekap where kodekaryawan = ''' +
          NIK + ''' AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglSC) + '''');
  qryRek3.Open;
  if (NOT qryRek3.IsEmpty) then
    begin
      gtvRekap.DataController.SetValue(nRecord, gtvRekapTagResult.Index, qryRek3.Fields[0].AsString);
      gtvRekap.DataController.PostEditingData;
      gtvRekap.DataController.Post(True);
    end;

end;

procedure TfrmRekapHarianBali.CariLiburNasional(NIK: string; nRecord: Integer);
var
  tglJadwal : TDate;
begin
  tglJadwal := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
  qryRek3.Close;
  qryRek3.SQL.Clear;
  qryRek3.SQL.Add('select autonum from ben_libur_nasional where tanggal = ''' +
        FormatDateTime('yyyy-MM-dd', tglJadwal) + '''');
  qryRek3.Open;
  if (not qryRek3.IsEmpty) then
        begin
          gtvRekap.DataController.SetValue(nRecord, gtvRekapLibNas.Index, 'Y');
          gtvRekap.DataController.PostEditingData;
          gtvRekap.DataController.Post(True);
        end
  else if (qryRek3.IsEmpty) then
        begin
          gtvRekap.DataController.SetValue(nRecord, gtvRekapLibNas.Index, 'N');
          gtvRekap.DataController.PostEditingData;
          gtvRekap.DataController.Post(True);
        end

end;

procedure TfrmRekapHarianBali.CariFPKeluarBali(NIK: string; nRecord: Integer);
var
   isLembur : String;
   scLembur, nFPScan, jd1, jd2, jdReal,tmpFPOut : TDateTime;
   tglFPOut : TDate;
   JamFPOut : TTime;
   selMenitSCLembur, selMenitFPLembur, jamKerjaReal : Integer;
begin
   jdReal := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapJKeluar.Index));
   jd1 := IncHour(jdReal, -2);
   jd2 := IncHour(jdReal, 2);
   qryRek4.Close;
   qryRek4.SQL.Clear;
   qryRek4.SQL.Add('select fpreal from absen_harian_merge where ' +
      'kodekaryawan = ''' + NIK + ''' AND fpreal >= ''' +
      FormatDateTime('yyyy-MM-dd hh:mm:ss', jd1) + ''' AND fpreal <= ''' +
      FormatDateTime('yyyy-MM-dd hh:mm:ss', jd2) + ''' ORDER by fpreal ASC');
   qryRek4.Open;
   qryRek4.Last;
   if (qryRek4.IsEmpty) then
     begin
         jamKerjaReal := gtvRekap.DataController.GetValue(nRecord, gtvRekapJKSeharusnya.Index);
         tglFPOut := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
         JamFPOut := EncodeTime(0,0,0,1);
         tmpFPOut := tglFPOut + JamFPOut;
         gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPOut);

         if (jamKerjaReal > 1) then
             begin
               gtvRekap.DataController.SetValue(nRecord, gtvRekapTKeluar.Index, 'A');
               gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, 'A');
             end;
         gtvRekap.DataController.PostEditingData;
         gtvRekap.DataController.Post(True);
     end
   else if (NOT qryRek4.IsEmpty) then
     begin

     end;
end;

procedure TfrmRekapHarianBali.CariIjin(NIK: string; nRecord: Integer);
var
  tglSC : TDate;
begin
  tglSC := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
  qryRek4.Close;
  qryRek4.SQL.Clear;
  qryRek4.SQL.Add('select kodekaryawan, tanggal, keterangan, tagpresensi ' +
      'from ben_presensi_ijin where kodekaryawan = ''' +
      NIK + ''' AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglSC) + '''');
  qryRek4.Open;
  if (NOT qryRek4.IsEmpty) then
    begin
      gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, qryRek4.Fields[3].AsString);
      gtvRekap.DataController.SetValue(nRecord, gtvRekapKet.Index, qryRek4.Fields[2].AsString);
      gtvRekap.DataController.PostEditingData;
      gtvRekap.DataController.Post(True);
    end;
  qryRek5.Close;
  qryRek5.SQL.Clear;
  qryRek5.SQL.Add('select kodekaryawan, tanggal, keterangan, tagpresensi ' +
      'from ben_presensi_cuti where kodekaryawan = ''' +
      NIK + ''' AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglSC) + '''');
  qryRek5.Open;
  if (NOT qryRek5.IsEmpty) then
    begin
      gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, qryRek5.Fields[3].AsString);
      gtvRekap.DataController.SetValue(nRecord, gtvRekapKet.Index, qryRek5.Fields[2].AsString);
      gtvRekap.DataController.PostEditingData;
      gtvRekap.DataController.Post(True);
    end;
end;

procedure TfrmRekapHarianBali.CariFPKeluar(NIK: string; nRecord: Integer);
var
   isLembur, keterangan : String;
   scLembur, nFPScan, jd1, jd2, jdReal,tmpFPOut, tmpFPJadwal : TDateTime;
   tglFPOut, tglJadwal : TDate;
   JamFPOut : TTime;
   selMenJadwalvsFP, selMenLemburvsFP, jamKerjaReal, totJamLembur,
   tmpJamLembur, sisalembur, jamSeharusnyaLembur, jamRealLembur : Integer;
begin
   keterangan := '';
   jamSeharusnyaLembur := 0;
   jamSeharusnyaLembur := 0;
   sisalembur := 0;
   tmpJamLembur := 0;
   totJamLembur := 0;
   jamKerjaReal := 0;
   selMenLemburvsFP := 0;
   selMenJadwalvsFP := 0;
   tglJadwal := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
   jdReal := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapJKeluar.Index));
   jd1 := IncHour(jdReal, -2);
   jd2 := IncHour(jdReal, 2);
   isLembur := vartostr(gtvRekap.DataController.GetValue(nRecord, gtvRekapCKLembur.Index));
   selMenJadwalvsFP := 0;
   selMenLemburvsFP :=0;
   if (isLembur = 'Y') then
     begin
       qryRek3.Close;
       qryRek3.SQL.Clear;
       qryRek3.SQL.Add('select jumlah from ben_presensi_lembur where kodekaryawan = ''' +
           NIK + ''' AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglJadwal) + '''');
       qryRek3.Open;
       jamSeharusnyaLembur := qryRek3.Fields[0].AsInteger;
       //ShowMessage('jamSeharusnyaLembur = ' + IntToStr(jamSeharusnyaLembur));
       scLembur := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapJLemburEnd.Index));
       jd1 := IncHour(scLembur, -2);
       jd2 := IncHour(scLembur, 3);
       qryRek4.Close;
       qryRek4.SQL.Clear;
       qryRek4.SQL.Add('select fpreal from absen_harian_merge where ' +
          'kodekaryawan = ''' + NIK + ''' AND fpreal >= ''' +
          FormatDateTime('yyyy-MM-dd hh:mm:ss', jd1) + ''' AND fpreal <= ''' +
          FormatDateTime('yyyy-MM-dd hh:mm:ss', jd2) + ''' ORDER by fpreal ASC');
       qryRek4.Open;
       qryRek4.Last;
       if (NOT qryRek4.IsEmpty) then
         begin
             tmpFPOut := qryRek4.Fields[0].AsDateTime;
//---fp >= jadwal lembur
             if (tmpFPOut >= scLembur) then
                begin
                  gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPOut);
                  totJamLembur := gtvRekap.DataController.GetValue(nRecord, gtvRekapHourLembur.Index);
                  gtvRekap.DataController.SetValue(nRecord, gtvRekapTKeluar.Index, 'OT');
                  gtvRekap.DataController.SetValue(nRecord, gtvRekapSelKeluar.Index, jamSeharusnyaLembur);
                  gtvRekap.DataController.SetValue(nRecord, gtvRekapKet.Index, keterangan);
                end
//---fp < dengan jadwal lembur
             else if (tmpFPOut < scLembur) then
                begin
                   //ShowMessage('FP < JD Lembur');
                   scLembur := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapJLemburEnd.Index));
                   jdReal := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapJKeluar.Index));
                   jd1 := IncHour(scLembur, -2);
                   jd2 := IncHour(scLembur, 2);

                   qryRek4.Close;
                   qryRek4.SQL.Clear;
                   qryRek4.SQL.Add('select fpreal from absen_harian_merge where ' +
                      'kodekaryawan = ''' + NIK + ''' AND fpreal >= ''' +
                      FormatDateTime('yyyy-MM-dd hh:mm:ss', jd1) + ''' AND fpreal <= ''' +
                      FormatDateTime('yyyy-MM-dd hh:mm:ss', jd2) + ''' ORDER by fpreal ASC');
                   qryRek4.Open;
                   qryRek4.Last;
                   tmpFPJadwal := qryRek4.Fields[0].AsDateTime;
                   gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPJadwal);
                   selMenJadwalvsFP := MinutesBetween(jdReal, tmpFPJadwal);
                   if ((selMenJadwalvsFP >= 45) AND (selMenJadwalvsFP <= 60)) then
                     begin
                          //sisalembur := selMenJadwalvsFP mod 60;
                       gtvRekap.DataController.SetValue(nRecord, gtvRekapSelKeluar.Index, 1);
                       gtvRekap.DataController.SetValue(nRecord, gtvRekapTKeluar.Index, 'OT');
                     end
                   else if (selMenJadwalvsFP > 60) then
                     begin
                          //sisalembur := selMenJadwalvsFP mod 60;
                       tmpJamLembur := selMenJadwalvsFP div 60;
                       //ShowMessage(IntToStr(tmpJamLembur));
                       sisalembur := selMenJadwalvsFP mod 60;
                       if (sisalembur >= 45) then totJamLembur := tmpJamLembur + 1
                       else if (sisalembur < 45) then totJamLembur := tmpJamLembur;
                       {if (totJamLembur > jamSeharusnyaLembur) then jamRealLembur := jamSeharusnyaLembur
                       else if (totJamLembur <= jamSeharusnyaLembur) then jamRealLembur := totJamLembur;}

                       //ShowMessage('Lemb = ' + IntToStr(jamSeharusnyaLembur) + 'MOD = ' + IntToStr(tmpJamLembur) + ' DIV = ' + IntToStr(sisalembur));
                       gtvRekap.DataController.SetValue(nRecord, gtvRekapSelKeluar.Index, totJamLembur);
                       gtvRekap.DataController.SetValue(nRecord, gtvRekapTKeluar.Index, 'OT');
                       gtvRekap.DataController.SetValue(nRecord, gtvRekapKet.Index, keterangan);
                     end
                   else if (selMenJadwalvsFP < 45) then
                     begin
                        gtvRekap.DataController.SetValue(nRecord, gtvRekapSelKeluar.Index, 0);
                        gtvRekap.DataController.SetValue(nRecord, gtvRekapTKeluar.Index, 'N');
                     end;
                end;

             gtvRekap.DataController.PostEditingData;
             gtvRekap.DataController.Post(True);
         end
//-------Lembur NO FP -------------------------------------------------------------------------------
       else if (qryRek4.IsEmpty) then
         begin
           jdReal := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapJKeluar.Index));
           jd1 := IncHour(jdReal, -2);
           jd2 := IncHour(jdReal, 2);
           qryRek5.Close;
           qryRek5.SQL.Clear;
           qryRek5.SQL.Add('select fpreal from absen_harian_merge where ' +
              'kodekaryawan = ''' + NIK + ''' AND fpreal >= ''' +
              FormatDateTime('yyyy-MM-dd hh:mm:ss', jd1) + ''' AND fpreal <= ''' +
              FormatDateTime('yyyy-MM-dd hh:mm:ss', jd2) + ''' ORDER by fpreal ASC');
           qryRek5.Open;
           qryRek5.Last;
           if (qryRek5.IsEmpty) then
               begin
                   jamKerjaReal := gtvRekap.DataController.GetValue(nRecord, gtvRekapJKSeharusnya.Index);
                   tglFPOut := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
                   JamFPOut := EncodeTime(0,0,0,1);
                   tmpFPOut := tglFPOut + JamFPOut;
                   gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPOut);

                   if (jamKerjaReal > 1) then
                       begin
                         gtvRekap.DataController.SetValue(nRecord, gtvRekapTKeluar.Index, 'A');
                         gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, 'A');
                       end;
                   gtvRekap.DataController.PostEditingData;
                   gtvRekap.DataController.Post(True);
               end
           else if (NOT qryRek5.IsEmpty) then
               begin
                 tmpFPOut := qryRek5.Fields[0].AsDateTime;
                 if (tmpFPOut < jdReal) then
                   begin
                     jamKerjaReal := gtvRekap.DataController.GetValue(nRecord, gtvRekapJKSeharusnya.Index);
                     if (jamKerjaReal > 1) then
                       begin
                         gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPOut);
                         gtvRekap.DataController.SetValue(nRecord, gtvRekapTKeluar.Index, 'U');
                         gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, 'U');
                         gtvRekap.DataController.PostEditingData;
                         gtvRekap.DataController.Post(True);
                       end
                     else if (jamKerjaReal < 1) then
                       begin
                         tglFPOut := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
                         JamFPOut := EncodeTime(0,0,0,1);
                         tmpFPOut := tglFPOut + JamFPOut;
                         gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPOut);
                         gtvRekap.DataController.PostEditingData;
                         gtvRekap.DataController.Post(True);
                       end;
                   end
                 else
                     begin
                       gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPOut);
                       gtvRekap.DataController.PostEditingData;
                       gtvRekap.DataController.Post(True);
                     end;
               end;
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
         end;
     end
   else if (isLembur = 'N') then
     begin
       qryRek4.Close;
       qryRek4.SQL.Clear;
       qryRek4.SQL.Add('select fpreal from absen_harian_merge where ' +
          'kodekaryawan = ''' + NIK + ''' AND fpreal >= ''' +
          FormatDateTime('yyyy-MM-dd hh:mm:ss', jd1) + ''' AND fpreal <= ''' +
          FormatDateTime('yyyy-MM-dd hh:mm:ss', jd2) + ''' ORDER by fpreal ASC');
       qryRek4.Open;
       qryRek4.Last;
       if (qryRek4.IsEmpty) then
           begin
               jamKerjaReal := gtvRekap.DataController.GetValue(nRecord, gtvRekapJKSeharusnya.Index);
               tglFPOut := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
               JamFPOut := EncodeTime(0,0,0,1);
               tmpFPOut := tglFPOut + JamFPOut;
               gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPOut);

               if (jamKerjaReal > 1) then
                   begin
                     gtvRekap.DataController.SetValue(nRecord, gtvRekapTKeluar.Index, 'A');
                     gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, 'A');
                   end;
               gtvRekap.DataController.PostEditingData;
               gtvRekap.DataController.Post(True);
           end
       else if (NOT qryRek4.IsEmpty) then
           begin
             tmpFPOut := qryRek4.Fields[0].AsDateTime;
             if (tmpFPOut < jdReal) then
               begin
                 jamKerjaReal := gtvRekap.DataController.GetValue(nRecord, gtvRekapJKSeharusnya.Index);
                 if (jamKerjaReal > 1) then
                   begin
                     gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPOut);
                     gtvRekap.DataController.SetValue(nRecord, gtvRekapTKeluar.Index, 'U');
                     gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, 'U');
                     gtvRekap.DataController.PostEditingData;
                     gtvRekap.DataController.Post(True);
                   end
                 else if (jamKerjaReal < 1) then
                   begin
                     tglFPOut := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
                     JamFPOut := EncodeTime(0,0,0,1);
                     tmpFPOut := tglFPOut + JamFPOut;
                     gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPOut);
                     gtvRekap.DataController.PostEditingData;
                     gtvRekap.DataController.Post(True);
                   end;
               end
             else
                 begin
                   gtvRekap.DataController.SetValue(nRecord, gtvRekapFPKeluar.Index, tmpFPOut);
                   gtvRekap.DataController.PostEditingData;
                   gtvRekap.DataController.Post(True);
                 end;
           end;
     end;


end;

procedure TfrmRekapHarianBali.CariFPMasuk(NIK: string; jd1: TDateTime; jd2: TDateTime; nRecord: Integer; jdReal : TDateTime);
var
  tmpFPIn : TDateTime;
  JamFPIn : TTime;
  tglFPIn : TDate;
  nSelisihIn, JamKerjaReal : Integer;
begin
  jdReal := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapJMasuk.Index));
  jd1 := IncHour(jdReal, -2);
  jd2 := IncHour(jdReal, 2);
  qryRek4.Close;
  qryRek4.SQL.Clear;
  qryRek4.SQL.Add('select fpreal from absen_harian_merge where ' +
      'kodekaryawan = ''' + NIK + ''' AND fpreal >= ''' +
      FormatDateTime('yyyy-MM-dd hh:mm:ss', jd1) + ''' AND fpreal <= ''' +
      FormatDateTime('yyyy-MM-dd hh:mm:ss', jd2) + ''' ORDER by fpreal ASC');
  qryRek4.Open;
  qryRek4.First;
  if (qryRek4.IsEmpty) then
     begin
       JamKerjaReal := gtvRekap.DataController.GetValue(nRecord, gtvRekapJKSeharusnya.Index);


       tglFPIn := VarToDateTime(gtvRekap.DataController.GetValue(nRecord, gtvRekapTanggal.Index));
       JamFPIn := EncodeTime(0,0,0,1);
       tmpFPIn := tglFPIn + JamFPIn;
       gtvRekap.DataController.SetValue(nRecord, gtvRekapFPMasuk.Index, tmpFPIn);
       gtvRekap.DataController.PostEditingData;
       gtvRekap.DataController.Post(True);
     end
  else if (NOT qryRek4.IsEmpty) then
     begin
       tmpFPIn := qryRek4.Fields[0].AsDateTime;
       gtvRekap.DataController.SetValue(nRecord, gtvRekapFPMasuk.Index, qryRek4.Fields[0].AsDateTime);
       if (tmpFPIn > jdReal) then
         begin
           nSelisihIn := MinutesBetween(jdReal, tmpFPIn);
           gtvRekap.DataController.SetValue(nRecord, gtvRekapSelMasuk.Index, nSelisihIn);
           if ((nSelisihIn >= 1) AND (nSelisihIn <= 30)) then
              begin
                gtvRekap.DataController.SetValue(nRecord, gtvRekapTMasuk.Index, 'T');
                gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, 'T');
              end
           else if (nSelisihIn > 30) then
              begin
                gtvRekap.DataController.SetValue(nRecord, gtvRekapTMasuk.Index, 'T2');
                gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, 'T2');
              end;
         end
       else if (tmpFPIn < jdReal) then
         begin
           gtvRekap.DataController.SetValue(nRecord, gtvRekapTMasuk.Index, 'N');
           //gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, 'N');
         end;
       gtvRekap.DataController.PostEditingData;
       gtvRekap.DataController.Post(True);
     end;

end;

procedure TfrmRekapHarianBali.SearchJadwalDanLembur(NIK: string; FingerID: string; DateMasuk: TDate; nRecord: Integer);
var
  scIn, scOut, scLemb, tmpFP1, tmpFP2 : TDateTime;
  jkReal, jkLembur : Integer;
  divCode : String;
  TimeJadwal : TTime;
begin
     jkLembur := 0;
     jkReal := 0;
     qryRek4.Close;
     qryRek4.SQL.Clear;
     qryRek4.SQL.Add('select kodeshift, tglmasuk, jmasuk, tglkeluar, jkeluar ' +
         'from ben_hrd_jadwal_local where kodekaryawan = ''' + NIK + ''' AND ' +
         'tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', DateMasuk) + '''');
     qryRek4.Open;
     if (not qryRek4.IsEmpty) then
        begin
           scIn := DateMasuk + qryRek4.Fields[2].AsDateTime;
           scOut := qryRek4.Fields[3].AsDateTime + qryRek4.Fields[4].AsDateTime;
           jkReal := HoursBetween(scOut, scIn);
           gtvRekap.DataController.SetValue(nRecord, gtvRekapTanggal.Index, DateMasuk);
           gtvRekap.DataController.SetValue(nRecord, gtvRekapNamaShift.Index, qryRek4.Fields[0].AsString);;
           gtvRekap.DataController.SetValue(nRecord, gtvRekapJMasuk.Index, scIn);
           gtvRekap.DataController.SetValue(nRecord, gtvRekapJKeluar.Index, scOut);
           gtvRekap.DataController.SetValue(nRecord, gtvRekapCKLembur.Index, 'N');
           gtvRekap.DataController.SetValue(nRecord, gtvRekapJKSeharusnya.Index, jkReal);
           gtvRekap.DataController.SetValue(nRecord, gtvRekapJLembStart.Index, scIn);
           gtvRekap.DataController.SetValue(nRecord, gtvRekapJLemburEnd.Index, scOut);
           if (jkReal < 1) then gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, 'OFF');

           qryRek4.Close;
           qryRek4.SQL.Clear;
           qryRek4.SQL.Add('select lembstart, lembend from ben_presensi_lembur where ' +
                'kodekaryawan = ''' + NIK + ''' and tanggal = ''' +
                FormatDateTime('yyyy-MM-dd', DateMasuk) + '''');
           qryRek4.Open;
           if (NOT qryRek4.IsEmpty) then
             begin
               gtvRekap.DataController.SetValue(nRecord, gtvRekapCKLembur.Index, 'Y');
               gtvRekap.DataController.SetValue(nRecord, gtvRekapJLembStart.Index, qryRek4.Fields[0].AsDateTime);
               gtvRekap.DataController.SetValue(nRecord, gtvRekapJLemburEnd.Index, qryRek4.Fields[1].AsDateTime);
               scLemb := qryRek4.Fields[1].AsDateTime;
               jkLembur := HoursBetween(qryRek4.Fields[0].AsDateTime, qryRek4.Fields[1].AsDateTime);

               //ShowMessage(inttostr(jkLembur));
               gtvRekap.DataController.SetValue(nRecord, gtvRekapHourLembur.Index, jkLembur);
               gtvRekap.DataController.PostEditingData;
               gtvRekap.DataController.Post(True);
             end;
           gtvRekap.DataController.PostEditingData;
           gtvRekap.DataController.Post(True);
           CariFPMasuk(NIK, scIn, scIn,nRecord, scIn);
           CariFPKeluar(NIK, nRecord);
           CariIjin(NIK, nRecord);
           CariLiburNasional(NIK, nRecord);
           CariKomisiBali(NIK, nRecord);
           CariResultLama(NIK, nRecord);
           Application.ProcessMessages;
        end
     else if (qryRek4.IsEmpty) then
        begin
          DateMasuk := EncodeDate(2019,01,01);
          TimeJadwal := EncodeTime(0,0,0,1);
          scIn := DateMasuk + TimeJadwal;
          scOut := DateMasuk + TimeJadwal;
          jkReal := HoursBetween(scOut, scIn);
          gtvRekap.DataController.SetValue(nRecord, gtvRekapTanggal.Index, DateMasuk);
          gtvRekap.DataController.SetValue(nRecord, gtvRekapNamaShift.Index, '');;
          gtvRekap.DataController.SetValue(nRecord, gtvRekapJMasuk.Index, scIn);
          gtvRekap.DataController.SetValue(nRecord, gtvRekapJKeluar.Index, scOut);
          gtvRekap.DataController.SetValue(nRecord, gtvRekapJLembStart.Index, scIn);
          gtvRekap.DataController.SetValue(nRecord, gtvRekapJLemburEnd.Index, scOut);
          gtvRekap.DataController.SetValue(nRecord, gtvRekapCKLembur.Index, 'N');
          gtvRekap.DataController.SetValue(nRecord, gtvRekapJKSeharusnya.Index, jkReal);
          gtvRekap.DataController.SetValue(nRecord, gtvRekapTagAuto.Index, 'A');
          gtvRekap.DataController.SetValue(nRecord, gtvRekapKet.Index, 'JADWAL KOSONG');
        end;

end;

procedure TfrmRekapHarianBali.CreateListCariAbsen(NIK: string; StaffName: string; FingerID: string; Division: string);
var
  jmlHari, i, recSelect : Integer;
  nHari : TDate;
  scMasuk, scKeluar, tmpJ1, tmpJ2 : TDateTime;
begin
  prog1.Properties.Max := 100;
  prog1.Properties.Text := 'Load List Karyawan';
  prog1.Position := 20;
  cxGrid1.Enabled := False;
  jmlHari := DaysBetween(edStart.Date, edEnd.Date);
  nHari := edStart.Date;
  prog2.Properties.Max := jmlHari + 1;
  for i := 0 to jmlHari do
    BEGIN
      prog2.Position := i + 1;
      prog2.Properties.Text := 'Load ' + IntToStr(i + 1) + ' of ' + IntToStr(jmlHari + 1) + ' Day[s]';
      lblLoad2.Caption := 'Load ' + IntToStr(i + 1) + ' of ' + IntToStr(jmlHari + 1) + ' Day[s]';
      NEWREC := gtvRekap.DataController.InsertRecord(gtvRekap.DataController.RecordCount);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapKode.Index, NIK);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapIdFinger.Index, FingerID);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapDivisi.Index, Division);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapNama.Index, StaffName);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapTanggal.Index, nHari);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapNamaHari.Index, FormatDateTime('dddd', nHari));
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, 0);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKReal.Index, 0);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapJkSeharusnya.Index, 0);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapKomisi.Index, 0);
      gtvRekap.DataController.PostEditingData;
      gtvRekap.DataController.Post(True);
      SearchJadwalDanLembur(NIK, FingerID, nHari, NEWREC);
      nHari := IncDay(nHari, 1);
      Application.ProcessMessages;
    END;
  gtvRekap.DataController.PostEditingData;
  gtvRekap.DataController.Post(True);

  cxGrid1.Enabled := True;
end;

procedure TfrmRekapHarianBali.SearchMasukBali(recSel: Integer; tglCari: TDate; CodeJadwal: string);
begin

end;

procedure TfrmRekapHarianBali.CariLemburJadwalTetap(recSel: Integer; tglCari: TDate; NIK: string);
var
   lamaKerja : Integer;
begin
     qryRek4.Close;
     qryRek4.SQL.Clear;
     qryRek4.SQL.Add('select jmasuk, jkeluar from ben_presensi_lembur ' +
              'where tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' ' +
              'AND kodekaryawan = ''' + IDKARYAWAN + '''');
     qryRek4.Open;
     if (NOT qryRek4.IsEmpty) then
        begin
          jMasuk := qryRek4.Fields[0].AsDateTime;
          jKeluar := qryRek4.Fields[1].AsDateTime;
        end;
     lamaKerja := HoursBetween(jMasuk, jKeluar);
end;


procedure TfrmRekapHarianBali.SearchJadwalTetap(recSel: Integer; tglCari: TDate; CodeJadwal : String);
var
  intHari : Integer;
  kodeKaryawan : String;
begin
  intHari := DayOfWeek(tglCari);
  kodeKaryawan := gtvRekap.DataController.GetDisplayText(recSel, gtvRekapKode.Index);
  //ShowMessage(KODEJADWAL);
  case intHari of
         1 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.ssun, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + CodeJadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  tglCari;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);
                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;
                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
                gtvRekap.DataController.SetValue(recSel, gtvRekapNamaShift.Index, NAMASHIFT);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJMasuk.Index, jMasuk);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJKeluar.Index, jKeluar);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTMasuk.Index, TGLMASUK);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTKeluar.Index, TGLKELUAR);
                gtvRekap.DataController.PostEditingData;
                gtvRekap.DataController.Post(True);

                Application.ProcessMessages;
             end;
         2 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.smonday, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + CodeJadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  tglCari;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);
                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;
                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
                gtvRekap.DataController.SetValue(recSel, gtvRekapNamaShift.Index, NAMASHIFT);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJMasuk.Index, jMasuk);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJKeluar.Index, jKeluar);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTMasuk.Index, TGLMASUK);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTKeluar.Index, TGLKELUAR);
                gtvRekap.DataController.PostEditingData;
                gtvRekap.DataController.Post(True);
                Application.ProcessMessages;
             end;
         3 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.stues, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + CodeJadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  tglCari;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);
                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
                gtvRekap.DataController.SetValue(recSel, gtvRekapNamaShift.Index, NAMASHIFT);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJMasuk.Index, jMasuk);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJKeluar.Index, jKeluar);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTMasuk.Index, TGLMASUK);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTKeluar.Index, TGLKELUAR);
                gtvRekap.DataController.PostEditingData;
                gtvRekap.DataController.Post(True);
                Application.ProcessMessages;
             end;
         4 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.swed, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + CodeJadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  tglCari;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);

                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
                gtvRekap.DataController.SetValue(recSel, gtvRekapNamaShift.Index, NAMASHIFT);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJMasuk.Index, jMasuk);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJKeluar.Index, jKeluar);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTMasuk.Index, TGLMASUK);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTKeluar.Index, TGLKELUAR);
                gtvRekap.DataController.PostEditingData;
                gtvRekap.DataController.Post(True);
                Application.ProcessMessages;
             end;
         5 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.sthur, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + CodeJadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  tglCari;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);

                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
                gtvRekap.DataController.SetValue(recSel, gtvRekapNamaShift.Index, NAMASHIFT);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJMasuk.Index, jMasuk);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJKeluar.Index, jKeluar);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTMasuk.Index, TGLMASUK);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTKeluar.Index, TGLKELUAR);
                gtvRekap.DataController.PostEditingData;
                gtvRekap.DataController.Post(True);
                Application.ProcessMessages;
             end;
         6 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.sfri, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + CodeJadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  tglCari;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);

                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
                gtvRekap.DataController.SetValue(recSel, gtvRekapNamaShift.Index, NAMASHIFT);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJMasuk.Index, jMasuk);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJKeluar.Index, jKeluar);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTMasuk.Index, TGLMASUK);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTKeluar.Index, TGLKELUAR);
                gtvRekap.DataController.PostEditingData;
                gtvRekap.DataController.Post(True);
                Application.ProcessMessages;
             end;
         7 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.ssat, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + CodeJadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  tglCari;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);

                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
                gtvRekap.DataController.SetValue(recSel, gtvRekapNamaShift.Index, NAMASHIFT);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJMasuk.Index, jMasuk);
                gtvRekap.DataController.SetValue(recSel, gtvRekapJKeluar.Index, jKeluar);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTMasuk.Index, TGLMASUK);
                gtvRekap.DataController.SetValue(recSel, gtvRekapTKeluar.Index, TGLKELUAR);
                gtvRekap.DataController.PostEditingData;
                gtvRekap.DataController.Post(True);
                Application.ProcessMessages;
             end;

       end;
  CariLemburJadwalTetap(recSel, tglCari, kodeKaryawan);
end;

procedure TfrmRekapHarianBali.SearchJadwal;
var
   nJadwal, CodeJadwal : String;
   i, recPilih : Integer;
   tglCari : TDate;
begin
  prog1.Position := 40;
  gtvRekap.DataController.GotoFirst;
  Screen.Cursor := crHourGlass;
  for i := 0 to gtvRekap.DataController.RecordCount - 1 do
    begin
      recPilih := gtvRekap.DataController.GetFocusedRecordIndex;
      nJadwal := gtvRekap.DataController.GetDisplayText(recPilih, gtvRekapTypeJadwal.Index);
      CodeJadwal := gtvRekap.DataController.GetDisplayText(recPilih, gtvRekapKodeJadwal.Index);
      tglCari := VarToDateTime(gtvRekap.DataController.GetValue(recPilih, gtvRekapTanggal.Index));
      if (nJadwal = 'Y') then
         begin
           SearchJadwalTetap(recPilih, tglCari, CodeJadwal);
         end
      else if (nJadwal = 'N') then
         begin

         end;
      gtvRekap.DataController.GotoNext;
      prog2.Position := i;
      prog2.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(gtvRekap.DataController.RecordCount);
      Application.ProcessMessages;
    end;
  Screen.Cursor := crDefault;
  cxGrid1.Enabled := False;
  cxGrid1.Enabled := True;
end;

procedure TfrmRekapHarianBali.CariListKaryawan;
var
   i, y, recBaru, jmlHari : Integer;
   tglCari : TDate;
begin
     prog1.Properties.Max := 100;
     prog1.Properties.Text := 'Load List Karyawan';
     prog1.Position := 20;
     cxGrid1.Enabled := False;
     jmlHari := DaysBetween(edStart.Date, edEnd.Date);
     case tabControl.ActivePageIndex of
         0 : begin
                   qryRek1.Close;
                   qryRek1.SQL.Clear;
                   qryRek1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, ' +
                       'jadwaltetap, kodejadwal, kodekontrak from ben_hrd_karyawan_info where departemen = ''' +
                       vartostr(edDepartemen.EditValue) + ''' and active = ''' + 'Y' + '''');
                   qryRek1.Open;
                   prog2.Properties.Max := qryRek1.RecordCount - 1;
                   for i := 0 to qryRek1.RecordCount - 1 do
                     begin
                       prog2.Position := i;
                       prog2.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
                       lblLoad1.Caption := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
                       IDKARYAWAN := qryRek1.Fields[0].AsString;
                       IDFINGER := qryRek1.Fields[1].AsString;
                       NAMA := qryRek1.Fields[2].AsString;
                       DIVISI := qryRek1.Fields[3].AsString;
                       JADWALTETAP := qryRek1.Fields[4].AsString;
                       KODEJADWAL := qryRek1.Fields[5].AsString;
                       KODEKONTRAK := qryRek1.Fields[6].AsString;
                       tglCari := edStart.Date;
                       for y := 0 to jmlHari do
                           begin
                             recBaru := gtvRekap.DataController.InsertRecord(gtvRekap.DataController.RecordCount);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKode.Index, qryRek1.Fields[0].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapIDFinger.Index, qryRek1.Fields[1].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapNama.Index, qryRek1.Fields[2].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapDivisi.Index, qryRek1.Fields[3].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapTypeJadwal.Index, qryRek1.Fields[4].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKodeJadwal.Index, qryRek1.Fields[5].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKodeKontrak.Index, qryRek1.Fields[6].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapTanggal.Index, tglCari);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapNamaHari.Index, FormatDateTime('dddd', tglCari));
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapSelMasuk.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapSelKeluar.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapJKReal.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapJkSeharusnya.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKomisi.Index, 0);
                             gtvRekap.DataController.PostEditingData;
                             gtvRekap.DataController.Post(True);
                             Application.ProcessMessages;
                             tglCari := IncDay(tglCari, 1);
                           end;
                       qryRek1.Next;
                       Application.ProcessMessages;
                     end;
             end;
         1 : begin
                   qryRek1.Close;
                   qryRek1.SQL.Clear;
                   qryRek1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, ' +
                       'jadwaltetap, kodejadwal, kodekontrak from ben_hrd_karyawan_info ' +
                       'where kodekaryawan = ''' + lblKodeKaryawan.Caption + '''');
                   qryRek1.Open;
                   prog2.Properties.Max := qryRek1.RecordCount - 1;
                   for i := 0 to qryRek1.RecordCount - 1 do
                     begin
                       prog2.Position := i;
                       prog2.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
                       lblLoad1.Caption := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
                       IDKARYAWAN := qryRek1.Fields[0].AsString;
                       IDFINGER := qryRek1.Fields[1].AsString;
                       NAMA := qryRek1.Fields[2].AsString;
                       DIVISI := qryRek1.Fields[3].AsString;
                       JADWALTETAP := qryRek1.Fields[4].AsString;
                       KODEJADWAL := qryRek1.Fields[5].AsString;
                       KODEKONTRAK := qryRek1.Fields[6].AsString;
                       tglCari := edStart.Date;
                       for y := 0 to jmlHari do
                           begin
                             recBaru := gtvRekap.DataController.InsertRecord(gtvRekap.DataController.RecordCount);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKode.Index, qryRek1.Fields[0].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapIDFinger.Index, qryRek1.Fields[1].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapNama.Index, qryRek1.Fields[2].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapDivisi.Index, qryRek1.Fields[3].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapTypeJadwal.Index, qryRek1.Fields[4].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKodeJadwal.Index, qryRek1.Fields[5].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKodeKontrak.Index, qryRek1.Fields[6].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapTanggal.Index, tglCari);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapNamaHari.Index, FormatDateTime('dddd', tglCari));
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapSelMasuk.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapSelKeluar.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapJKReal.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapJkSeharusnya.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKomisi.Index, 0);
                             gtvRekap.DataController.PostEditingData;
                             gtvRekap.DataController.Post(True);
                             Application.ProcessMessages;
                             tglCari := IncDay(tglCari, 1);
                           end;

                       qryRek1.Next;
                       Application.ProcessMessages;
                     end;
             end;
         2 : begin

                   qryRek1.Close;
                   qryRek1.SQL.Clear;
                   qryRek1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, ' +
                       'jadwaltetap, kodejadwal, kodekontrak from ben_hrd_karyawan_info ' +
                       'where active = ''' + 'Y' + '''');
                   qryRek1.Open;
                   prog2.Properties.Max := qryRek1.RecordCount - 1;
                   for i := 0 to qryRek1.RecordCount - 1 do
                     begin
                       prog2.Position := i;
                       prog2.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
                       lblLoad1.Caption := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
                       IDKARYAWAN := qryRek1.Fields[0].AsString;
                       IDFINGER := qryRek1.Fields[1].AsString;
                       NAMA := qryRek1.Fields[2].AsString;
                       DIVISI := qryRek1.Fields[3].AsString;
                       JADWALTETAP := qryRek1.Fields[4].AsString;
                       KODEJADWAL := qryRek1.Fields[5].AsString;
                       KODEKONTRAK := qryRek1.Fields[6].AsString;
                       tglCari := edStart.Date;
                       for y := 0 to jmlHari do
                           begin
                             recBaru := gtvRekap.DataController.InsertRecord(gtvRekap.DataController.RecordCount);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKode.Index, qryRek1.Fields[0].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapIDFinger.Index, qryRek1.Fields[1].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapNama.Index, qryRek1.Fields[2].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapDivisi.Index, qryRek1.Fields[3].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapTypeJadwal.Index, qryRek1.Fields[4].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKodeJadwal.Index, qryRek1.Fields[5].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKodeKontrak.Index, qryRek1.Fields[6].AsString);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapTanggal.Index, tglCari);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapNamaHari.Index, FormatDateTime('dddd', tglCari));
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapSelMasuk.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapSelKeluar.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapJKReal.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapJkSeharusnya.Index, 0);
                             gtvRekap.DataController.SetValue(recBaru, gtvRekapKomisi.Index, 0);
                             gtvRekap.DataController.PostEditingData;
                             gtvRekap.DataController.Post(True);
                             Application.ProcessMessages;
                             tglCari := IncDay(tglCari, 1);
                           end;
                       qryRek1.Next;
                       Application.ProcessMessages;
                     end;
             end;
     end;
    Screen.Cursor := crDefault;
    cxGrid1.Enabled := True;
end;

procedure TfrmRekapHarianBali.CariUMX3;
var
  vPengali, nUM, totUM : Double;
  periodePayroll : String;
begin
  qryRek2.Close;
  qryRek2.SQL.Clear;
  qryRek2.SQL.Add('select vuangmakan, payrollperiode from ben_payroll_tgl_um3 where ' +
      'tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + '''');
  qryRek2.Open;
  if (NOT qryRek2.IsEmpty) then
    begin
      vPengali := qryRek2.Fields[0].AsFloat;
      periodePayroll := qryRek2.Fields[1].AsString;
      qryRek3.Close;
      qryRek3.SQL.Clear;
      qryRek3.SQL.Add('select uangmakan ' +
          'from ben_hrd_kontrak_details where kodekaryawan = ''' +
      IDKARYAWAN + ''' ORDER BY tglkontrak DESC');
      qryRek3.Open;
      qryRek3.First;
      nUM := qryRek3.Fields[0].AsFloat;
      totUM := vPengali * nUM;
      qryRek4.Close;
      qryRek4.SQL.Clear;
      qryRek4.SQL.Add('select autonum from ben_payroll_um3 where ' +
        'kodekaryawan = ''' + IDKARYAWAN + ''' ' +
        'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + '''');
      qryRek4.Open;
      if (qryRek4.IsEmpty) then
        begin
          qryExec.SQL.Add('insert into ben_payroll_um3 values(' +
            '''' + '' + ''',' +
            '''' + periodePayroll + ''',' +
            '''' + IDKARYAWAN + ''',' +
            '''' + IDFINGER + ''',' +
            '''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''',' +
            '''' + FloatToStr(totUM) + ''',' +
            '''' + '' + ''',' +
            QuotedStr(frmMain.USERAPPS) + ',' +
            '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
        end
      else if (NOT qryRek4.IsEmpty) then
        begin
         qryExec.SQL.Add('delete from ben_payroll_um3 where ' +
          'kodekaryawan = ''' + IDKARYAWAN + ''' ' +
          'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''';');
         qryExec.SQL.Add('insert into ben_payroll_um3 values(' +
            '''' + '' + ''',' +
            '''' + periodePayroll + ''',' +
            '''' + IDKARYAWAN + ''',' +
            '''' + IDFINGER + ''',' +
            '''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''',' +
            '''' + FloatToStr(totUM) + ''',' +
            '''' + '' + ''',' +
            QuotedStr(frmMain.USERAPPS) + ',' +
            '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
        end;
    end;

end;

procedure TfrmRekapHarianBali.edQuickSearchKeyPress(Sender: TObject; var Key: Char);
var
   strSearch : String;
begin
     if (key = #13) then
        begin
          case Length(edQuickSearch.Text) of
           1 : strSearch := '0000' + edQuickSearch.Text;
           2 : strSearch := '000' + edQuickSearch.Text;
           3 : strSearch := '00' + edQuickSearch.Text;
           4 : strSearch := '0' + edQuickSearch.Text;
           5 : strSearch := edQuickSearch.Text;
          end;
         qryRek1.Close;
         qryRek1.SQL.Clear;
         qryRek1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen ' +
           'from ben_hrd_karyawan_info where idkaryawan = ' + QuotedStr(strSearch) +
           ' and active = ''' + 'Y' + '''');
         qryRek1.Open;
         if (qryRek1.IsEmpty) then
           begin
             ShowMessage('ID Finger Tidak Ditemukan !');
             Exit;
           end;
         lblKodeKaryawan.Caption := qryRek1.Fields[0].AsString;
         lblIDFinger.Caption := qryRek1.Fields[1].AsString;
         lblNamaKaryawan.Caption := qryRek1.Fields[2].AsString;
         //ed := qryChange1.Fields[3].AsString;
         //CariJadwal;
         btnLoadKode.Click;
         edQuickSearch.Clear;
         //edTglLembur.SetFocus;
     end;
end;

procedure TfrmRekapHarianBali.CariCuti;
var
  recSelect : Integer;
begin
  recSelect := gtvRekap.DataController.GetFocusedRecordIndex;
  
end;

procedure TfrmRekapHarianBali.CariLembur;
var
  tKeluar : String;
  tglLemStart, tglLembEnd, tglJLemStart, tglJLemEnd, tglCek : TDate;
  dtLembEnd, dtLemStart, dtJlembStart, dtJLemburEnd,
  nFpLembStart, nFpLembEnd : TDateTime;
  intLamaFP, intLamaShift, intLembur, jumlah, selisih : Integer;
begin
  {tglLembEnd, tglLemStart, tglJLemStart, tglJLemEnd : TDate;

  dtLembEnd, dtLemStart, dtJlembStart, dtJLemburEnd : TDateTime;}
  qryRek4.Close;
  qryRek4.SQL.Clear;
  qryRek4.SQL.Add('select tanggal, jstart, jend, jumlah, tagpresensi, jmasuk, ' +
         'jkeluar, lembstart, lembend from ' +
         'ben_presensi_lembur where kodekaryawan = ''' + IDKARYAWAN + ''' ' +
         'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) +
         '''');
  qryRek4.Open;
  if (NOT qryRek3.IsEmpty) then
    begin
      //ShowMessage('OK1');
      tglLemStart := DateOf(qryRek4.Fields[7].AsDateTime);
      tglLembEnd := DateOf(qryRek4.Fields[8].AsDateTime);
      tglJLemStart := DateOf(qryRek4.Fields[5].AsDateTime);
      tglJLemEnd := DateOf(qryRek4.Fields[6].AsDateTime);
      dtJlembStart := qryRek4.Fields[5].AsDateTime;
      dtJLemburEnd := qryRek4.Fields[6].AsDateTime;
      dtLemStart := qryRek4.Fields[7].AsDateTime;
      dtLembEnd := qryRek4.Fields[8].AsDateTime;
      jumlah := qryRek4.Fields[3].AsInteger;
      tKeluar := qryRek4.Fields[4].AsString;
      tglCek := EncodeDate(2017,01,01);
      if (tglLembEnd > tglCek) then
        Begin
          if (tglJLemStart <> tglLembEnd) then
          begin
            qryRek5.Close;
            qryRek5.SQL.Clear;
            qryRek5.SQL.Add('select tanggal, waktu from absen_harian where id_karyawan = ''' +
                IDFINGER + ''' AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglJLemStart) + ''' ORDER BY waktu ASC');
            qryRek5.Open;
            qryRek5.First;
            nFpLembStart := qryRek5.Fields[0].AsDateTime + qryRek5.Fields[1].AsDateTime;

            qryRek5.Close;
            qryRek5.SQL.Clear;
            qryRek5.SQL.Add('select tanggal, waktu from absen_harian where id_karyawan = ''' +
                IDFINGER + ''' AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglLembEnd) + ''' ORDER BY waktu ASC');
            qryRek5.Open;
            qryRek5.Last;

            nFpLembEnd := qryRek5.Fields[0].AsDateTime + qryRek5.Fields[1].AsDateTime;
            intLamaShift := HoursBetween(dtJlembStart, dtJLemburEnd);
            intLamaFP := HoursBetween(nFpLembStart, nFpLembEnd);
            intLembur := intLamaShift + jumlah;
            if (intLamaFP >= intLembur) then
              begin
                //ShowMessage('OK1');
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKReal.Index, intLamaFP);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapJkSeharusnya.Index, intLamaShift);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapFPMasuk.Index, nFpLembStart);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapFPKeluar.Index, nFpLembEnd);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapJMasuk.Index, dtJlembStart);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKeluar.Index, dtLembEnd);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, tKeluar);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, jumlah);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapKet.Index, jumlah);
              end
            else if (intLamaFP < intLamaShift) then
              begin
                selisih := intLamaShift - intLamaFP;
                //ShowMessage('OK2');
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKReal.Index, intLamaFP);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapJkSeharusnya.Index, intLamaShift);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapFPMasuk.Index, nFpLembStart);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapFPKeluar.Index, nFpLembEnd);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapJMasuk.Index, dtJlembStart);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKeluar.Index, dtLembEnd);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, tKeluar);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, intLamaFP);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapKet.Index, jumlah);
              end;
          end;
        end;


    end;
  //end cari lembur lewat hari
end;

procedure TfrmRekapHarianBali.CariLain;
var
  recSelect : Integer;
begin
  recSelect := gtvRekap.DataController.GetFocusedRecordIndex;
  qryRek4.Close;
  qryRek4.SQL.Clear;
  qryRek4.SQL.Add('select tagpresensi, keterangan from ben_presensi_ijin where tanggal = ''' +
     FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' AND kodekaryawan = ''' +
     IDKARYAWAN + '''');
  qryRek4.Open;
  if (NOT qryRek4.IsEmpty) then
    begin
      gtvRekap.DataController.SetValue(recSelect, gtvRekapTagAuto.Index, qryRek4.Fields[0].AsString);
    end;
end;

procedure TfrmRekapHarianBali.CariFinger;
begin
  qryRek5.Close;
  qryRek5.SQL.Clear;
  qryRek5.SQL.Add('select tanggal, waktu from absen_harian where id_karyawan = ''' +
      IDFINGER + ''' AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TGLMASUK) + ''' ORDER BY waktu ASC');
  qryRek5.Open;
  qryRek5.First;
  if (qryRek5.IsEmpty) then
    begin
      FINGERIN := EncodeTime(0,0,0,0);
    end
  else if (NOT qryRek5.IsEmpty) then
    begin
      FINGERIN := qryRek5.Fields[1].AsDateTime;
    end;


  qryRek5.Close;
  qryRek5.SQL.Clear;
  qryRek5.SQL.Add('select tanggal, waktu from absen_harian where id_karyawan = ''' +
      IDFINGER + ''' AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TGLKELUAR) + ''' ORDER BY waktu DESC');
  qryRek5.Open;
  qryRek5.First;

  if (qryRek5.IsEmpty) then
    begin
      FINGEROUT := EncodeTime(0,0,0,0);
    end
  else if (NOT qryRek5.IsEmpty) then
    begin
      FINGEROUT := qryRek5.Fields[1].AsDateTime;
    end;

end;

procedure TfrmRekapHarianBali.CariJadwalTetap;
var
  intHari : Integer;
begin
  intHari := DayOfWeek(TANGGALCARI);
  //ShowMessage(KODEJADWAL);
  case intHari of
         1 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.ssun, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssun) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + KODEJADWAL + '''');
               qryRek5.Open;
               TGLMASUK :=  TANGGALCARI;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);
                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;
                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;

             end;
         2 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.smonday, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.smonday) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  TANGGALCARI;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);

                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
             end;
         3 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.stues, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.stues) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  TANGGALCARI;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);
                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
             end;
         4 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.swed, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.swed) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  TANGGALCARI;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);

                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
             end;
         5 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.sthur, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sthur) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  TANGGALCARI;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);

                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
             end;
         6 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.sfri, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.sfri) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  TANGGALCARI;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);

                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
             end;
         7 : begin
               qryRek5.Close;
               qryRek5.SQL.Clear;
               qryRek5.SQL.Add('select ben_hrd_jadwal_tetap.ssat, ' +
                  '(select ben_shift.namashift from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as namashift, ' +
                  '(select ben_shift.jmasuk from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as jmasuk, ' +
                  '(select ben_shift.jkeluar from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as jkeluar, ' +
                  '(select ben_shift.overnight from ben_shift where ' +
                  'ben_shift.autonum = ben_hrd_jadwal_tetap.ssat) as overnight ' +
                  'from ben_hrd_jadwal_tetap WHERE autonum = ''' + kodejadwal + '''');
               qryRek5.Open;
               TGLMASUK :=  TANGGALCARI;
               if (qryRek5.Fields[4].AsString = 'Y') then
                 begin
                   TGLKELUAR := IncDay(TGLMASUK, 1);

                 end
               else if (qryRek5.Fields[4].AsString = 'N') then
                 begin
                   TGLKELUAR := TGLMASUK;

                 end;
                jMasuk := TGLMASUK + qryRek5.Fields[2].AsDateTime;
                jKeluar := TGLKELUAR +  qryRek5.Fields[3].AsDateTime;
                NAMASHIFT := qryRek5.Fields[0].AsString;
             end;

       end;
end;

procedure TfrmRekapHarianBali.btnExportClick(Sender: TObject);
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

procedure TfrmRekapHarianBali.btnLoadAllClick(Sender: TObject);
var
  i, recCount, y : Integer;
  tglstart, tglend : TDate;
  fpreal : TDateTime;
begin
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
   qryRek1.Close;
   qryRek1.SQL.Clear;
   qryRek1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, ' +
       'jadwaltetap, kodejadwal, kodekontrak from ben_hrd_karyawan_info ' +
       'where active = ''' + 'Y' + '''');
   qryRek1.Open;
   prog1.Properties.Max := qryRek1.RecordCount - 1;
   for i := 0 to qryRek1.RecordCount - 1 do
     begin
       prog1.Position := i;
       prog1.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
       lblLoad1.Caption := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
       IDKARYAWAN := qryRek1.Fields[0].AsString;
       IDFINGER := qryRek1.Fields[1].AsString;
       NAMA := qryRek1.Fields[2].AsString;
       DIVISI := qryRek1.Fields[3].AsString;
       JADWALTETAP := qryRek1.Fields[4].AsString;
       KODEJADWAL := qryRek1.Fields[5].AsString;
       KODEKONTRAK := qryRek1.Fields[6].AsString;
       tglstart := IncDay(edStart.Date, -1);
       tglend := IncDay(edEnd.Date, 1);
       qryRek2.Close;
       qryRek2.SQL.Clear;
       qryRek2.SQL.Add('select tanggal, waktu from absen_harian where ' +
               'absen_harian.id_karyawan = ''' + IDFINGER + ''' AND absen_harian.tanggal >= ''' +
               FormatDateTime('yyyy-MM-dd', tglstart) + ''' AND absen_harian.tanggal <= ''' +
               FormatDateTime('yyyy-MM-dd', tglend) + '''');
       qryRek2.Open;
       qryRek2.First;
       qryExec.SQL.Clear;
       for y := 0 to qryRek2.RecordCount - 1 do
          begin
            fpreal := qryRek2.Fields[0].AsDateTime + qryRek2.Fields[1].AsDateTime;
            qryRek3.Close;
            qryRek3.SQL.Clear;
            qryRek3.SQL.Add('select autonum from absen_harian_merge where ' +
                'kodekaryawan = ''' + IDKARYAWAN + ''' and fpreal = ''' +
                FormatDateTime('yyyy-MM-dd hh:mm:ss', qryRek2.Fields[0].AsDateTime) + '''');
            qryRek3.Open;
            if (qryRek3.IsEmpty) then
              begin

                qryExec.SQL.Add('insert into absen_harian_merge values(' +
                    '''' + '' + ''',' +
                    '''' + IDKARYAWAN + ''',' +
                    '''' + IDFINGER + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd', qryRek2.Fields[0].AsDateTime) + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', fpreal) + ''',' +
                    '''' + '' + ''');');
              end;
            qryRek2.Next;
          end;
       qryExec.ExecSQL;
       CreateListCariAbsen(IDKARYAWAN, NAMA, IDFINGER, DIVISI);

       qryRek1.Next;
       Application.ProcessMessages;
     end;
   Screen.Cursor := crDefault;
   lblLoad1.Caption := 'Load Karyawan Finish';
   lblLoad2.Caption := 'Load Day[s] Finish';
   ShowMessage('Load Data Finish');
end;

procedure TfrmRekapHarianBali.btnLoadKodeClick(Sender: TObject);
var
  i, recCount, y : Integer;
  tglstart, tglend : TDate;
  fpreal : TDateTime;
begin
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
   qryRek1.Close;
   qryRek1.SQL.Clear;
   qryRek1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, ' +
       'jadwaltetap, kodejadwal, kodekontrak from ben_hrd_karyawan_info ' +
       'where kodekaryawan = ''' + lblKodeKaryawan.Caption + '''');
   qryRek1.Open;
   prog1.Properties.Max := qryRek1.RecordCount - 1;
   for i := 0 to qryRek1.RecordCount - 1 do
     begin
       prog1.Position := i;
       prog1.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
       lblLoad1.Caption := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
       IDKARYAWAN := qryRek1.Fields[0].AsString;
       IDFINGER := qryRek1.Fields[1].AsString;
       NAMA := qryRek1.Fields[2].AsString;
       DIVISI := qryRek1.Fields[3].AsString;
       JADWALTETAP := qryRek1.Fields[4].AsString;
       KODEJADWAL := qryRek1.Fields[5].AsString;
       KODEKONTRAK := qryRek1.Fields[6].AsString;
       //ShowMessage('1');
       tglstart := IncDay(edStart.Date, -1);
       tglend := IncDay(edEnd.Date, 1);
       qryRek2.Close;
       qryRek2.SQL.Clear;
       qryRek2.SQL.Add('select tanggal, waktu from absen_harian where ' +
               'absen_harian.id_karyawan = ''' + IDFINGER + ''' AND absen_harian.tanggal >= ''' +
               FormatDateTime('yyyy-MM-dd', tglstart) + ''' AND absen_harian.tanggal <= ''' +
               FormatDateTime('yyyy-MM-dd', tglend) + '''');
       qryRek2.Open;
       qryRek2.First;
       qryExec.SQL.Clear;
       for y := 0 to qryRek2.RecordCount - 1 do
          begin
            fpreal := qryRek2.Fields[0].AsDateTime + qryRek2.Fields[1].AsDateTime;
            qryRek3.Close;
            qryRek3.SQL.Clear;
            qryRek3.SQL.Add('select autonum from absen_harian_merge where ' +
                'kodekaryawan = ''' + IDKARYAWAN + ''' and fpreal = ''' +
                FormatDateTime('yyyy-MM-dd hh:mm:ss', qryRek2.Fields[0].AsDateTime) + '''');
            qryRek3.Open;
            if (qryRek3.IsEmpty) then
              begin

                qryExec.SQL.Add('insert into absen_harian_merge values(' +
                    '''' + '' + ''',' +
                    '''' + IDKARYAWAN + ''',' +
                    '''' + IDFINGER + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd', qryRek2.Fields[0].AsDateTime) + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', fpreal) + ''',' +
                    '''' + '' + ''');');
              end;
            qryRek2.Next;
          end;
       qryExec.ExecSQL;
       CreateListCariAbsen(IDKARYAWAN, NAMA, IDFINGER, DIVISI);
       //CariAbsenHarian;
       //ShowMessage('2');
       qryRek1.Next;
       Application.ProcessMessages;
     end;
   Screen.Cursor := crDefault;
   lblLoad1.Caption := 'Load Karyawan Finish';
   lblLoad2.Caption := 'Load Day[s] Finish';
   ShowMessage('Load Data Finish');
end;

procedure TfrmRekapHarianBali.btnPostClick(Sender: TObject);
var
  i, recSelect : Integer;
  tagmasuk, tagkeluar, tagResult, notes, Ket, libNas : String;
  selMasuk, selKeluar, jkReal, jkJadwal : Double;
begin
   prog1.Properties.Max := qryRek1.RecordCount - 1;
   Screen.Cursor := crHourGlass;
   gtvRekap.DataController.GotoFirst;
   qryExec.SQL.Clear;
   cxGrid1.Enabled := False;
   for i := 0 to gtvRekap.DataController.RecordCount - 1 do
     begin
       prog1.Position := i;
       prog1.Properties.Text := 'Posting Data ' + IntToStr(i+1) + ' of ' + IntToStr(gtvRekap.DataController.RecordCount);
       recSelect := gtvRekap.DataController.GetFocusedRecordIndex;
       IDKARYAWAN := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapKode.Index));
       IDFINGER := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIdFinger.Index));
       TANGGALCARI := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapTanggal.Index));
       tagmasuk := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapTMasuk.Index));
       tagkeluar := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapTKeluar.Index));
       TAGAUTO := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapTagAuto.Index));
       tagResult := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapTagResult.Index));
       libNas := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapLibNas.Index));
       KOMISITOT := gtvRekap.DataController.GetValue(recSelect, gtvRekapKomisi.Index);
       if ((tagResult = '') AND (TAGAUTO = '')) then
         begin
           tagResult := 'N';
           TAGAUTO := 'N';
         end
       else if ((tagResult = '') AND (TAGAUTO <> '')) then
         begin
           tagResult := TAGAUTO;
         end
       else if (tagResult = 'OT') then
         begin
           tagResult := 'N';
         end;
       selMasuk := gtvRekap.DataController.GetValue(recSelect, gtvRekapSelMasuk.Index);
       selKeluar := gtvRekap.DataController.GetValue(recSelect, gtvRekapSelKeluar.Index);
       jkReal := gtvRekap.DataController.GetValue(recSelect, gtvRekapJKReal.Index);
       jkJadwal := gtvRekap.DataController.GetValue(recSelect, gtvRekapJkSeharusnya.Index);
       notes := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNotes.Index));
       KETERANGAN := vartostr(gtvRekap.DataController.GetValue(recSelect, gtvRekapKet.Index));
       lblLoad1.Caption := 'Checking Data ' + IDKARYAWAN;
       qryRek1.Close;
       qryRek1.SQL.Clear;
       qryRek1.SQL.Add('select autonum from ben_presensi_rekap where tanggal = ''' +
          FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' AND kodekaryawan = ''' +
          IDKARYAWAN + '''');
       qryRek1.Open;
       if (qryRek1.IsEmpty) then
         begin
           qryExec.SQL.Add('insert into ben_presensi_rekap values(' +
              '''' + '' + ''',' +
              '''' + frmMain.APP_OUTLETID + ''',' +
              '''' + ''  +''',' +
              '''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''',' +
              '''' + IDKARYAWAN + ''',' +
              '''' + IDFINGER + ''',' +
              '''' + tagmasuk + ''',' +
              '''' + tagkeluar + ''',' +
              '''' + TAGAUTO + ''',' +
              '''' + tagResult + ''',' +
              '''' + FloatToStr(selMasuk) + ''',' +
              '''' + FloatToStr(selKeluar) + ''',' +
              '''' + FloatToStr(jkJadwal) + ''',' +
              '''' + FloatToStr(jkReal) + ''',' +
              '''' + FloatToStr(KOMISITOT) + ''',' +
              QuotedStr(notes) + ',' +
              QuotedStr(KETERANGAN) + ',' +
              '''' + libNas + ''',' +
              '''' + frmMain.USERAPPS + ''',' +
              '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');

         end
       else if (NOT qryRek1.IsEmpty) then
         begin
           qryExec.SQL.Add('delete from ben_presensi_rekap where tanggal = ''' +
                FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' AND kodekaryawan = ''' +
                IDKARYAWAN + ''';');
           qryExec.SQL.Add('insert into ben_presensi_rekap values(' +
              '''' + '' + ''',' +
              '''' + frmMain.APP_OUTLETID + ''',' +
              '''' + ''  +''',' +
              '''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''',' +
              '''' + IDKARYAWAN + ''',' +
              '''' + IDFINGER + ''',' +
              '''' + tagmasuk + ''',' +
              '''' + tagkeluar + ''',' +
              '''' + TAGAUTO + ''',' +
              '''' + tagResult + ''',' +
              '''' + FloatToStr(selMasuk) + ''',' +
              '''' + FloatToStr(selKeluar) + ''',' +
              '''' + FloatToStr(jkJadwal) + ''',' +
              '''' + FloatToStr(jkReal) + ''',' +
              '''' + FloatToStr(KOMISITOT) + ''',' +
              QuotedStr(notes) + ',' +
              QuotedStr(KETERANGAN) + ',' +
              '''' + libNas + ''',' +
              '''' + frmMain.USERAPPS + ''',' +
              '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
           {qryExec.SQL.Add('update ben_presensi_rekap set ' +
              'tagmasuk = ''' + tagmasuk + ''',' +
              'payrollperiode = ''' + '' + ''',' +
              'tagkeluar = ''' + tagkeluar + ''',' +
              'tagauto = ''' + TAGAUTO + ''',' +
              'tagresult = ''' + tagResult + ''',' +
              'selmasuk = ''' + FloatToStr(selMasuk) + ''',' +
              'selkeluar = ''' + FloatToStr(selKeluar) + ''',' +
              'jkwajib = ''' + FloatToStr(jkJadwal) + ''',' +
              'jkreal = ''' + FloatToStr(jkReal) + ''',' +
              'komisi = ''' + FloatToStr(KOMISITOT) + ''',' +
              'notes = ' + QuotedStr(notes) + ',' +
              'keterangan = ' + QuotedStr(KETERANGAN) + ',' +
              'libnas = ''' + libNas + ''',' +
              'lastedituser = ''' + frmMain.USERAPPS + ''',' +
              'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
              'where autonum = ''' + inttostr(qryRek1.Fields[0].AsInteger) + ''';');}
         end;
       qryRek2.Close;
       qryRek2.SQL.Clear;
       qryRek2.SQL.Add('select autonum from ben_presensi_details where tanggal = ''' +
          FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' AND kodekaryawan = ''' +
          IDKARYAWAN + '''');
       qryRek2.Open;
       jMasuk := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapJMasuk.Index));
       jKeluar := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapJKeluar.Index));
       fMasuk  := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapFPMasuk.Index));
       FKeluar  := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapFPKeluar.Index));
       if (qryRek2.IsEmpty) then
         begin
           qryExec.SQL.Add('insert into ben_presensi_details values(' +
             '''' + '' + ''',' +
             '''' + frmMain.APP_OUTLETID + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''',' +
             '''' + IDKARYAWAN + ''',' +
             '''' + IDFINGER + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jMasuk) + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jKeluar) + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', FMasuk) + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', FKeluar) + ''',' +
             '''' + tagResult + ''',' +
             QuotedStr(KETERANGAN) + ',' +
             '''' + frmMain.USERAPPS + ''',' +
              '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
         end
       else if (NOT qryRek2.IsEmpty) then
         begin
           qryExec.SQL.Add('update ben_presensi_details set ' +
             'idoutlet = ''' + frmMain.APP_OUTLETID + ''',' +
             'idkaryawan = ''' + IDFINGER + ''',' +
             'jadwalmasuk = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jMasuk) + ''',' +
             'jadwalkeluar = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', jKeluar) + ''',' +
             'fpmasuk = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', fMasuk) + ''',' +
             'fpkeluar = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', FKeluar) + ''',' +
             'tagresult = ''' + tagResult + ''',' +
             'keterangan = ' + QuotedStr(KETERANGAN) + ',' +
             'lastedituser = ''' + frmMain.USERAPPS + ''',' +
             'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
             'where tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) +
             ''' AND kodekaryawan = ''' + IDKARYAWAN + ''';');
         end;

        qryRek3.Close;
        qryRek3.SQL.Clear;
        qryRek3.SQL.Add('select vuangmakan from ben_payroll_tgl_um3 where tanggal = ''' +
            FormatDateTime('yyyy-MM-dd', TANGGALCARI) + '''');
        qryRek3.Open;
        if (NOT qryRek3.IsEmpty) then
           begin

             if ((tagResult = 'N') OR (tagResult = 'T') OR
                 (tagResult = 'U') OR (tagResult = 'IM') OR (tagResult = 'IK')
                 OR (tagResult = 'FOT') OR (tagResult = 'OT') OR (tagResult = 'IB')
                 OR (tagResult = 'CI')) then
               begin
                 qryRek4.Close;
                 qryRek4.SQL.Clear;
                 qryRek4.SQL.Add('select autonum from ben_payroll_um3 where kodekaryawan = ''' + IDKARYAWAN + ''' ' +
                  'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''';');
                 qryRek4.Open;
                  if (qryRek4.IsEmpty) then
                     begin
                       qryExec.SQL.Add('insert into ben_payroll_um3 values(' +
                        '''' + '' + ''',' +
                        '''' + '' + ''',' +
                        '''' + IDKARYAWAN + ''',' +
                        '''' + IDFINGER + ''',' +
                        '''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''',' +
                        '''' + FloatToStr(qryRek3.Fields[0].AsFloat) + ''',' +
                        '''' + '' + ''',' +
                        QuotedStr(frmMain.USERAPPS) + ',' +
                        '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
                     end
                  else if (NOT qryRek4.IsEmpty) then
                     begin
                       qryExec.SQL.Add('update ben_payroll_um3 set ' +
                        'nilai = ''' + FloatToStr(qryRek3.Fields[0].AsFloat) + ''',' +
                        'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
                        'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
                        'where kodekaryawan = ''' + IDKARYAWAN + ''' ' +
                        'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''';');
                     end;
                 {CariUMX3;}
               end
             else
               begin
                 qryExec.SQL.Add('delete from ben_payroll_um3 where ' +
                  'kodekaryawan = ''' + IDKARYAWAN + ''' ' +
                  'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''';');

               end;
           end;


       gtvRekap.DataController.GotoNext;
       Application.ProcessMessages;
     end;
   cxGrid1.Enabled := True;
   qryExec.ExecSQL;
   Screen.Cursor := crDefault;
   ShowMessage('Posting Data Finish !');
   lblLoad1.Caption := 'Posting Data Finish !';
end;

procedure TfrmRekapHarianBali.CariKomisi;
var
  z : Integer;
  nKomisi, nSubtotal : Double;
begin
  {KOMISITOT := 0;
  nKomisi := 0;}
  //ShowMessage(KODEKONTRAK);
  nSubtotal := 0;
  qryRek3.Close;
  qryRek3.SQL.Clear;
  qryRek3.SQL.Add('select komisi, tglkontrak from ben_hrd_kontrak_details where kodekaryawan = ''' +
      IDKARYAWAN + ''' ORDER BY tglhabis DESC');
  qryRek3.Open;
  qryRek3.First;
  nKomisi := qryRek3.Fields[0].AsFloat;
  qryRek4.Close;
  qryRek4.SQL.Clear;
  qryRek4.SQL.Add('select trans_master.trans_id, ' +
     '(select sum(trans_detail.subtotal) from trans_detail ' +
     'where trans_detail.id_trans = trans_master.trans_id AND ' +
     'trans_detail.trans_type_id = ''' + 'BJ' + ''')' +
     ' as sumbj, (select sum(trans_detail.subtotal) from trans_detail ' +
     'where trans_detail.id_trans = trans_master.trans_id AND  ' +
     'trans_detail.trans_type_id = ''' + 'BA' + ''' ) as sum_ba ' +
     'FROM trans_master WHERE trans_master.tanggal = ''' +
     FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' AND trans_master.status_trans = ''' +
     'PAID' + ''' AND trans_master.therapist_id = ''' + IDFINGER + '''');
  qryRek4.Open;
  qryRek4.First;
  for z := 0 to qryRek4.RecordCount - 1 do
    begin
      nSubtotal := nSubtotal + qryRek4.Fields[1].AsFloat + qryRek4.Fields[2].AsFloat;
      qryRek4.Next;
    end;
  KOMISITOT := nSubtotal * nKomisi / 100;
  {ShowMessage(FormatFloat('#,#', nSubtotal) + '#' + FloatToStr(nKomisi) +
     '#' + FormatFloat('#,#', KOMISITOT));}
end;

procedure TfrmRekapHarianBali.CariAbsenHarian;
var
  i, jmlHari, lamaKerja, lamaReal, selMsk, selKlr, nLembur,sLemb,
  totLembur, xLembur, selUnder : Integer;
  hari, tahun, bulan, jam, menit, detik, mdetik : Word;
  nHari, tglLembEnd, tglLemStart, tglJLemStart, tglJLemEnd : TDate;
  dtLembEnd, dtLemStart, dtJlembStart, dtJLemburEnd, nFpLembStart,
  nFpLembEnd : TDateTime;
  strTMasuk, strTKeluar, tmpAuto : String;
begin
  jmlHari := DaysBetween(edStart.Date, edEnd.Date);
  nHari := edStart.Date;
  prog2.Properties.Max := jmlHari + 1;
  for i := 0 to jmlHari do
    BEGIN
      prog2.Position := i + 1;
      prog2.Properties.Text := 'Load ' + IntToStr(i + 1) + ' of ' + IntToStr(jmlHari + 1) + ' Day[s]';
      lblLoad2.Caption := 'Load ' + IntToStr(i + 1) + ' of ' + IntToStr(jmlHari + 1) + ' Day[s]';
      NEWREC := gtvRekap.DataController.InsertRecord(gtvRekap.DataController.RecordCount);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapKode.Index, IDKARYAWAN);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapIdFinger.Index, IDFINGER);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapDivisi.Index, DIVISI);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapNama.Index, NAMA);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapTanggal.Index, nHari);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapNamaHari.Index, FormatDateTime('dddd', nHari));
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, 0);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKReal.Index, 0);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapJkSeharusnya.Index, 0);
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapKomisi.Index, 0);
      //ShowMessage('1A');
      TANGGALCARI := nHari;
      CariKomisi;
      CariUMX3;
      //ShowMessage('1B');
//----------------------------------------------------------------------------------------------------------
      gtvRekap.DataController.SetValue(NEWREC, gtvRekapKomisi.Index, KOMISITOT);
      if (JADWALTETAP = 'Y') then
        begin
          TANGGALCARI := nHari;
          //ShowMessage('1');
          CariJadwalTetap;
          //ShowMessage('2');
          qryRek4.Close;
          qryRek4.SQL.Clear;
          qryRek4.SQL.Add('select jmasuk, jkeluar from ben_presensi_lembur ' +
              'where tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' ' +
              'AND kodekaryawan = ''' + IDKARYAWAN + '''');
          qryRek4.Open;
          if (NOT qryRek4.IsEmpty) then
            begin
              jMasuk := qryRek4.Fields[0].AsDateTime;
              jKeluar := qryRek4.Fields[1].AsDateTime;
            end;
          lamaKerja := HoursBetween(jMasuk, jKeluar);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapNamaShift.Index, NAMASHIFT);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJkSeharusnya.Index, lamaKerja);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapTglKeluar.Index, TGLKELUAR);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJMasuk.Index, jMasuk);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKeluar.Index, jKeluar);


          CariFinger;
          fMasuk := TGLMASUK + FINGERIN;
          FKeluar := TGLKELUAR + FINGEROUT;
          lamaReal := HoursBetween(fMasuk, FKeluar);

          gtvRekap.DataController.SetValue(NEWREC, gtvRekapFPMasuk.Index, fMasuk);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapFPKeluar.Index, FKeluar);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKReal.Index, lamaReal);


          //end-terlambat
          if (fMasuk > jMasuk) then
            begin
              selMsk := MinutesBetween(jMasuk, fMasuk);
              if (selMsk < 1) then
                begin
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, 0);
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'N');
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                  strTMasuk := 'N';
                  //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'N');
                end
              else if ((selMsk >= 1) AND (selMsk < 29)) then
                begin
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, selMsk);
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'T');
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'T');
                  strTMasuk := 'T2';
                  //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'T');
                end
              else if (selMsk >= 30) then
                begin
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, selMsk);
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'T2');
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'T2');
                  strTMasuk := 'T2';
                  //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'T2');
                end;
            end;
          //end-terlambat
          //undertime
          if (FKeluar < jKeluar) then
           begin
             selUnder := MinutesBetween(FKeluar, jKeluar);
             if (selUnder >= 241) then
              begin
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'A');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'A');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'A');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);
              end
             else if (selUnder < 241) then
              begin
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'U');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'U');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, selUnder);
              end;

           end;
          //end-undertime

          //lembur
          if (jKeluar < FKeluar) then
            begin
              selKlr := MinutesBetween(jKeluar, FKeluar);
              if (selKlr < 50) then
                begin
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'N');
                 //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                 //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'N');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);
                end
              else if (selKlr >= 50) then
                begin
                  {qryRek3.Close;
                  qryRek3.SQL.Clear;
                  qryRek3.SQL.Add('select tanggal, jumlah, tagpresensi from ' +
                     'ben_presensi_lembur where kodekaryawan = ''' + IDKARYAWAN + ''' ' +
                     'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TGLKELUAR) +
                     '''');}
                  qryRek3.Close;
                  qryRek3.SQL.Clear;
                  qryRek3.SQL.Add('select tanggal, jumlah, tagpresensi, lembstart, lembend from ' +
                     'ben_presensi_lembur where kodekaryawan = ''' + IDKARYAWAN + ''' ' +
                     'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) +
                     '''');
                  qryRek3.Open;
                  if (qryRek3.IsEmpty) then
                     begin
                       gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'N');
                       //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                       //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'N');
                       gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);
                     end
                  else if (NOT qryRek3.IsEmpty) then
                     begin
                       nLembur := qryRek3.Fields[1].AsInteger * 60;
                       xLembur := selKlr mod 60;
                       if (xLembur >= 50) then
                         begin
                           selKlr := selKlr + (60 - xLembur);
                         end;
                       if (selKlr >= nLembur) then
                         begin
                           totLembur := nLembur div 60;
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, qryRek3.Fields[1].AsInteger);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, qryRek3.Fields[2].AsString);
                           //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                           //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, qryRek3.Fields[2].AsString);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapNotes.Index, qryRek3.Fields[1].AsInteger);
                         end
                       else if (selKlr < nLembur) then
                         begin
                           totLembur := selKlr div 60;
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, totLembur);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'OT');
                           //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                           //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, qryRek3.Fields[2].AsString);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapNotes.Index, qryRek3.Fields[1].AsInteger);
                         end;
                     end;
                end
            end;
          //end-lembur

          if (lamaKerja < 1) then
            begin
              gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'OFF');
              //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'OFF');
            end;
          //CariCuti;
            qryRek4.Close;
            qryRek4.SQL.Clear;
            qryRek4.SQL.Add('select tagpresensi, keterangan from ben_presensi_cuti where tanggal = ''' +
               FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' AND kodekaryawan = ''' +
               IDKARYAWAN + '''');
            qryRek4.Open;
            if (NOT qryRek4.IsEmpty) then
              begin
                TAGAUTO := qryRek4.Fields[0].AsString;
                KETERANGAN := qryRek4.Fields[1].AsString;
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, TAGAUTO);
                //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, TAGAUTO);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapKet.Index, KETERANGAN);
              end;
            //Cari_Lain;
            qryRek4.Close;
            qryRek4.SQL.Clear;
            qryRek4.SQL.Add('select tagpresensi, keterangan from ben_presensi_ijin where tanggal = ''' +
               FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' AND kodekaryawan = ''' +
               IDKARYAWAN + '''');
            qryRek4.Open;
            if (NOT qryRek4.IsEmpty) then
              begin
                TAGAUTO := qryRek4.Fields[0].AsString;
                KETERANGAN := qryRek4.Fields[1].AsString;
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, TAGAUTO);
                //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, TAGAUTO);
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapKet.Index, KETERANGAN);
              end;
            //end cari_lain
            qryRek5.Close;
            qryRek5.SQL.Clear;
            qryRek5.SQL.Add('select autonum from holiday_date where tanggal_mulai = ''' +
              FormatDateTime('yyyy-MM-dd', TANGGALCARI) + '''');
            qryRek5.Open;
            if (not qryRek5.IsEmpty) then
              begin
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapLibNas.Index, 'Y');
              end
            else if (qryRek5.IsEmpty) then
              begin
                gtvRekap.DataController.SetValue(NEWREC, gtvRekapLibNas.Index, 'N');
              end;
            if (lamaKerja = 1) then
            begin
              gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'OFF');
              //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'OFF');
              //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'OFF');
              //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'OFF');
            end;
        end
//------------------------------------------------------------------------------------------------------
      else if (JADWALTETAP = 'N') then
        begin
          DecodeDate(nHari, tahun, bulan, hari);
          jMasuk := EncodeDateTime(tahun, bulan, hari, 0,0,0,0);
          jKeluar := EncodeDateTime(tahun, bulan, hari, 0,0,0,0);
          fMasuk := EncodeDateTime(tahun, bulan, hari, 0,0,0,0);
          FKeluar := EncodeDateTime(tahun, bulan, hari, 0,0,0,0);
          TGLMASUK := nHari;
          TGLKELUAR := nHari;
          TGLFPMASUK := nHari;
          TGLFPKELUAR := nHari;
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapTglKeluar.Index, TGLKELUAR);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJMasuk.Index, jMasuk);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKeluar.Index, jKeluar);

          gtvRekap.DataController.SetValue(NEWREC, gtvRekapFPMasuk.Index, fMasuk);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapFPKeluar.Index, FKeluar);

          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKReal.Index, 0);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJkSeharusnya.Index, 0);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, 0);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);
          //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'N');
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'N');
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'N');
        end
//----------------------------------------------------------------------------------------------------
      else if (JADWALTETAP = 'H') then
        begin
          //TANGGALCARI := nHari;
          qryRek4.Close;
          qryRek4.SQL.Clear;
          qryRek4.SQL.Add('select kodekaryawan, tglmasuk, jmasuk, tglkeluar, ' +
              'jkeluar, kodeshift from ben_hrd_jadwal_local where kodekaryawan = ''' +
              IDKARYAWAN + ''' AND tglmasuk = ''' +
              FormatDateTime('yyyy-MM-dd', nHari) + '''');
          qryRek4.Open;
          TMRMASUK := qryRek4.Fields[2].AsDateTime;
          TMRKELUAR := qryRek4.Fields[4].AsDateTime;
          TGLKELUAR := qryRek4.Fields[3].AsDateTime;

          TGLMASUK := nHari;
          jMasuk := TGLMASUK + TMRMASUK;
          jKeluar := TGLKELUAR + TMRKELUAR;
          lamaKerja := HoursBetween(jMasuk, jKeluar);

          gtvRekap.DataController.SetValue(NEWREC, gtvRekapNamaShift.Index, qryRek4.Fields[5].AsInteger);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJkSeharusnya.Index, lamaKerja);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapTglKeluar.Index, TGLKELUAR);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJMasuk.Index, jMasuk);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKeluar.Index, jKeluar);
          CariFinger;
          fMasuk := TGLMASUK + FINGERIN;
          FKeluar := TGLKELUAR + FINGEROUT;
          lamaReal := HoursBetween(fMasuk, FKeluar);

          gtvRekap.DataController.SetValue(NEWREC, gtvRekapFPMasuk.Index, fMasuk);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapFPKeluar.Index, FKeluar);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKReal.Index, lamaReal);


          //terlambat
          if (fMasuk > jMasuk) then
            begin
              selMsk := MinutesBetween(jMasuk, fMasuk);
              if (selMsk < 1) then
                begin
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, selMsk);
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'N');
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                  //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'N');
                end
              else if ((selMsk >= 1) AND (selMsk < 29)) then
                begin
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, selMsk);
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'T');
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'T');
                  //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'T');
                end
              else if (selMsk >= 30) then
                begin
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, selMsk);
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'T2');
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'T2');
                  //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'T2');
                end;

            end;
          //end-terlambat

          //undertime
          if (FKeluar < jKeluar) then
           begin
             selUnder := MinutesBetween(FKeluar, jKeluar);
             if (selUnder >= 241) then
              begin
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'A');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'A');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'A');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);
              end
             else if (selUnder < 241) then
              begin
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'U');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'U');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, selUnder);
              end;

           end;
          //end-undertime
         //lembur
          if (jKeluar < FKeluar) then
            begin

              selKlr := MinutesBetween(jKeluar, FKeluar);
              cxGrid1.Font.Color := clRed;
              if (selKlr < 50) then
                begin
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'N');
                 //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                 //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'N');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);
                end
              else if (selKlr >= 50) then
                begin
                  qryRek3.Close;
                  qryRek3.SQL.Clear;
                  qryRek3.SQL.Add('select tanggal, jumlah, tagpresensi, lembstart, lembend from ' +
                     'ben_presensi_lembur where kodekaryawan = ''' + IDKARYAWAN + ''' ' +
                     'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGALCARI) +
                     '''');
                  qryRek3.Open;
                  if (qryRek3.IsEmpty) then
                     begin
                       gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'N');
                       //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                       //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'N');
                       gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);
                     end
                  else if (NOT qryRek3.IsEmpty) then
                     begin
                       nLembur := qryRek3.Fields[1].AsInteger * 60;
                       xLembur := selKlr mod 60;
                       if (xLembur >= 50) then
                         begin
                           selKlr := selKlr + (60 - xLembur);
                         end;
                       if (selKlr >= nLembur) then
                         begin
                           totLembur := nLembur div 60;
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, totLembur);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, qryRek3.Fields[2].AsString);
                           //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                           //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, qryRek3.Fields[2].AsString);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapNotes.Index, qryRek3.Fields[1].AsInteger);
                         end
                       else if (selKlr < nLembur) then
                         begin
                           totLembur := selKlr div 60;
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, totLembur);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'OT');
                           //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                           //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, qryRek3.Fields[2].AsString);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapNotes.Index, qryRek3.Fields[1].AsInteger);
                         end;
                     end;
                end
            end;

          //end-lembur

         //off
          if (lamaKerja < 1) then
            begin
              gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'OFF');
              if (DIVISI = 'ADM') then
                  begin
                    if (gtvRekap.DataController.GetValue(NEWREC, gtvRekapSelKeluar.Index)>= 4) then
                       begin
                         gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'OT');
                       end;
                  end;
              //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'OFF');
              //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'OFF');
              //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, 'OFF');
            end;
          //end-off
//-----------------------------------------------------------------------------------------------------------------------
        end;
      //cari lembur lewat hari
      CariLembur;

      //CariCuti;
      qryRek4.Close;
      qryRek4.SQL.Clear;
      qryRek4.SQL.Add('select tagpresensi, keterangan from ben_presensi_cuti where tanggal = ''' +
         FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' AND kodekaryawan = ''' +
         IDKARYAWAN + '''');
      qryRek4.Open;
      if (NOT qryRek4.IsEmpty) then
        begin
          TAGAUTO := qryRek4.Fields[0].AsString;
          KETERANGAN := qryRek4.Fields[1].AsString;
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, TAGAUTO);
          //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, TAGAUTO);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapKet.Index, KETERANGAN);
        end;
      //Cari_Lain;
      qryRek4.Close;
      qryRek4.SQL.Clear;
      qryRek4.SQL.Add('select tagpresensi, keterangan from ben_presensi_ijin where tanggal = ''' +
         FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' AND kodekaryawan = ''' +
         IDKARYAWAN + '''');
      qryRek4.Open;
      if (NOT qryRek4.IsEmpty) then
        begin
          gtvRekap.DataController.PostEditingData;
          //if (gtvRekap.DataController.)
          TAGAUTO := qryRek4.Fields[0].AsString;
          KETERANGAN := qryRek4.Fields[1].AsString;
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, TAGAUTO);
          //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, TAGAUTO);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapKet.Index, KETERANGAN);
        end;
      //end cari_lain

      //Cari_kELUAR;
      qryRek4.Close;
      qryRek4.SQL.Clear;
      qryRek4.SQL.Add('select jamkerja, keterangan, tagpresensi from ben_presensi_keluar where tanggal = ''' +
         FormatDateTime('yyyy-MM-dd', TANGGALCARI) + ''' AND kodekaryawan = ''' +
         IDKARYAWAN + '''');
      qryRek4.Open;
      if (NOT qryRek4.IsEmpty) then
        begin
          TAGAUTO := qryRek4.Fields[2].AsString;
          KETERANGAN := qryRek4.Fields[1].AsString;
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, TAGAUTO);
          //gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, TAGAUTO);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapKet.Index, KETERANGAN);
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapJKReal.Index, qryRek4.Fields[0].AsInteger);
        end;
      //end cari_keluar
      qryRek5.Close;
      qryRek5.SQL.Clear;
      qryRek5.SQL.Add('select autonum from ben_libur_nasional where tanggal = ''' +
        FormatDateTime('yyyy-MM-dd', TANGGALCARI) + '''');
      qryRek5.Open;
      if (not qryRek5.IsEmpty) then
        begin
          if ((DIVISI = 'RC') OR (DIVISI = 'MTC') OR (DIVISI = 'ADM') OR (DIVISI = 'DRV')) then
            begin
              gtvRekap.DataController.SetValue(NEWREC, gtvRekapLibNas.Index, 'Y');
              if (DIVISI = 'ADM') then
                  begin
                    if (gtvRekap.DataController.GetValue(NEWREC, gtvRekapSelKeluar.Index)>= 4) then
                       begin
                         gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'OT');
                       end;
                  end;

            end
          else
            begin
              gtvRekap.DataController.SetValue(NEWREC, gtvRekapLibNas.Index, 'N');
            end;
        end
      else if (qryRek5.IsEmpty) then
        begin
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapLibNas.Index, 'N');
        end;

      qryRek2.Close;
      qryRek2.SQL.Clear;
      qryRek2.SQL.Add('select tagresult from ben_presensi_rekap where kodekaryawan = ''' +
          IDKARYAWAN + ''' AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', nHari) + '''');
      qryRek2.Open;

      if (NOT qryRek2.IsEmpty) then
        begin
          gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagResult.Index, qryRek2.Fields[0].AsString);
        end;
      gtvRekap.DataController.PostEditingData;
      gtvRekap.DataController.Post(True);
      nHari := IncDay(nHari,1);
      Application.ProcessMessages;
    END;
end;

procedure TfrmRekapHarianBali.btnCariKaryawanClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 14;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
      frmMasterKaryawan.Position := poDesktopCenter;
    end
  else if (frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 14;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
      frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmRekapHarianBali.btnDivisiClick(Sender: TObject);
var
  i, recCount, y : Integer;
  tglstart, tglend : TDate;
  fpreal : TDateTime;
begin
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
   qryRek1.Close;
   qryRek1.SQL.Clear;
   qryRek1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen, ' +
       'jadwaltetap, kodejadwal, kodekontrak from ben_hrd_karyawan_info where departemen = ''' +
       vartostr(edDepartemen.EditValue) + ''' and active = ''' + 'Y' + '''');
   qryRek1.Open;
   prog1.Properties.Max := qryRek1.RecordCount - 1;
   for i := 0 to qryRek1.RecordCount - 1 do
     begin
       prog1.Position := i;
       prog1.Properties.Text := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
       lblLoad1.Caption := 'Load ' + IntToStr(i+1) + ' of ' + IntToStr(qryRek1.RecordCount);
       IDKARYAWAN := qryRek1.Fields[0].AsString;
       IDFINGER := qryRek1.Fields[1].AsString;
       NAMA := qryRek1.Fields[2].AsString;
       DIVISI := qryRek1.Fields[3].AsString;
       JADWALTETAP := qryRek1.Fields[4].AsString;
       KODEJADWAL := qryRek1.Fields[5].AsString;
       KODEKONTRAK := qryRek1.Fields[6].AsString;

       tglstart := IncDay(edStart.Date, -1);
       tglend := IncDay(edEnd.Date, 1);
       qryRek2.Close;
       qryRek2.SQL.Clear;
       qryRek2.SQL.Add('select tanggal, waktu from absen_harian where ' +
               'absen_harian.id_karyawan = ''' + IDFINGER + ''' AND absen_harian.tanggal >= ''' +
               FormatDateTime('yyyy-MM-dd', tglstart) + ''' AND absen_harian.tanggal <= ''' +
               FormatDateTime('yyyy-MM-dd', tglend) + '''');
       qryRek2.Open;
       qryRek2.First;
       qryExec.SQL.Clear;
       for y := 0 to qryRek2.RecordCount - 1 do
          begin
            fpreal := qryRek2.Fields[0].AsDateTime + qryRek2.Fields[1].AsDateTime;
            qryRek3.Close;
            qryRek3.SQL.Clear;
            qryRek3.SQL.Add('select autonum from absen_harian_merge where ' +
                'kodekaryawan = ''' + IDKARYAWAN + ''' and fpreal = ''' +
                FormatDateTime('yyyy-MM-dd hh:mm:ss', qryRek2.Fields[0].AsDateTime) + '''');
            qryRek3.Open;
            if (qryRek3.IsEmpty) then
              begin

                qryExec.SQL.Add('insert into absen_harian_merge values(' +
                    '''' + '' + ''',' +
                    '''' + IDKARYAWAN + ''',' +
                    '''' + IDFINGER + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd', qryRek2.Fields[0].AsDateTime) + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', fpreal) + ''',' +
                    '''' + '' + ''');');
              end;
            qryRek2.Next;
          end;
       qryExec.ExecSQL;
       CreateListCariAbsen(IDKARYAWAN, NAMA, IDFINGER, DIVISI);
       //CariAbsenHarian;

       qryRek1.Next;
       Application.ProcessMessages;
     end;
   Screen.Cursor := crDefault;
   lblLoad1.Caption := 'Load Karyawan Finish';
   lblLoad2.Caption := 'Load Day[s] Finish';
   ShowMessage('Load Data Finish');
end;

procedure TfrmRekapHarianBali.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryRek1.Free;
  qryRek2.Free;
  qryRek3.Free;
  qryRek4.Free;
  qryRek5.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmRekapHarianBali.FormCreate(Sender: TObject);
begin
  lblLoad1.Caption := '';
  lblLoad2.Caption := '';

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryRek1 := TMyQuery.Create(Self);
  qryRek1.Connection := DMDB.dbInternal;
  qryRek1.SQL.Add('select * from temptable');
  qryRek1.Active := true;

  qryRek2 := TMyQuery.Create(Self);
  qryRek2.Connection := DMDB.dbInternal;
  qryRek2.SQL.Add('select * from temptable');
  qryRek2.Active := true;

  qryRek3 := TMyQuery.Create(Self);
  qryRek3.Connection := DMDB.dbInternal;
  qryRek3.SQL.Add('select * from temptable');
  qryRek3.Active := true;

  qryRek4 := TMyQuery.Create(Self);
  qryRek4.Connection := DMDB.dbInternal;
  qryRek4.SQL.Add('select * from temptable');
  qryRek4.Active := true;

  qryRek5 := TMyQuery.Create(Self);
  qryRek5.Connection := DMDB.dbInternal;
  qryRek5.SQL.Add('select * from temptable');
  qryRek5.Active := true;

  tblDepartemen.Active := True;
  tblTag.Active := True;
  tblshift.Active := True;

  edStart.Date := Date;
  edEnd.Date := Date;

  qryRek1.Close;
  qryRek1.SQL.Clear;
  qryRek1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_payroll_um3'));
  qryRek1.Open;
  if (qryRek1.IsEmpty) then
  begin
    qryExec.SQL.Clear;
    qryExec.SQL.Add(memStruktur.Text);
    qryExec.ExecSQL;
  end;

  qryRek1.Close;
  qryRek1.SQL.Clear;
  qryRek1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_presensi_details'));
  qryRek1.Open;
  if (qryRek1.IsEmpty) then
  begin
    qryExec.SQL.Clear;
    qryExec.SQL.Add(memoStruktur2.Text);
    qryExec.ExecSQL;
  end;


  //tbKaryawan.Visible := False;
  //tbAll.Visible := False;
  tabControl.ActivePage := tbDivisi;
end;

procedure TfrmRekapHarianBali.gtvRekapFPKeluarGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
     if (AText <> '') then AText := FormatDateTime('dd/MM/yyyy hh:mm:ss', StrToDateTime(AText));
end;

procedure TfrmRekapHarianBali.gtvRekapFPMasukGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
var
  strDateTime : String;
begin
  //strDateTime := AText;
end;

procedure TfrmRekapHarianBali.gtvRekapFPMasukGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if (AText <> '') then AText := FormatDateTime('dd/MM/yyyy hh:mm:ss', StrToDateTime(AText));
end;

procedure TfrmRekapHarianBali.gtvRekapJKeluarGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if (AText <> '') then AText := FormatDateTime('dd/MM/yyyy hh:mm:ss', StrToDateTime(AText));
end;

procedure TfrmRekapHarianBali.gtvRekapJLemburEndGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
   if (AText <> '') then AText := FormatDateTime('dd/MM/yyyy hh:mm:ss', StrToDateTime(AText));
end;

procedure TfrmRekapHarianBali.gtvRekapJMasukGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if (AText <> '') then AText := FormatDateTime('dd/MM/yyyy hh:mm:ss', StrToDateTime(AText));
end;

procedure TfrmRekapHarianBali.gtvRekapSelKeluarCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[gtvRekapSelKeluar.Index] > 0) then
    begin
      ACanvas.Brush.Color := clRed;
     ACanvas.Font.Color := clWhite;
    end;
end;

procedure TfrmRekapHarianBali.gtvRekapSelMasukCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[gtvRekapSelMasuk.Index] > 0) then
   begin
     ACanvas.Brush.Color := clYellow;
     ACanvas.Font.Color := clBlack;
   end;
end;

procedure TfrmRekapHarianBali.gtvRekapTagResultCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[gtvRekapTagResult.Index] <> Null) then
   begin
     ACanvas.Brush.Color := clGreen;
     ACanvas.Font.Color := clWhite;
   end;
end;

procedure TfrmRekapHarianBali.gtvRekapTanggalGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if (AText <> '') then AText := FormatDateTime('dd/MMM/yyyy', StrToDateTime(AText));
end;

procedure TfrmRekapHarianBali.SelectIn1Click(Sender: TObject);
var
  recSelect : Integer;
  idFinger : String;
begin
   recSelect := gtvRekap.DataController.GetFocusedRecordIndex;
   if (recSelect < 0) then Exit;

   Application.CreateForm(TfrmRekapSelectFP, frmRekapSelectFP);
   frmRekapSelectFP.lblJudul.Caption := '  CARI FINGER MASUK ';
   with frmRekapSelectFP do
     begin
       lblKode.Caption := gtvRekap.DataController.GetValue(recSelect, gtvRekapKode.Index);
       lblIDFinger.Caption := VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIDFinger.Index));
       frmRekapSelectFP.IDFINGER := VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIDFinger.Index));
       lblNama.Caption := VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNama.Index));
       frmRekapSelectFP.TANGGAL := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapTanggal.Index));
       frmRekapSelectFP.edTanggal.Date := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapTanggal.Index));
       frmRekapSelectFP.JDWLMSK := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapJMasuk.Index));
       frmRekapSelectFP.JDWLKLR := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapJKeluar.Index));
       frmRekapSelectFP.FPMASUK := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapFPMasuk.Index));
       frmRekapSelectFP.FPKELUAR := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapFPKeluar.Index));
       qryList.Active := True;
       qryList.Close;
       qryList.SQL.Clear;
       qryList.SQL.Add('select id_karyawan, nama, tanggal, waktu from absen_harian ' +
          'WHERE tanggal = ''' + FormatDateTime('yyyy-MM-dd', frmRekapSelectFP.TANGGAL) + ''' ' +
          'AND id_karyawan = ''' + frmRekapSelectFP.IDFINGER + '''');
       qryList.Open;
       gtbList.DataController.Refresh;
       frmRekapSelectFP.RECUTAMA := recSelect;
     end;
   frmRekapSelectFP.btnSelectBali.Tag := 1;
   frmRekapSelectFP.Show;
end;

procedure TfrmRekapHarianBali.SelectOut1Click(Sender: TObject);
var
  recSelect : Integer;
  idFinger : String;
begin
   recSelect := gtvRekap.DataController.GetFocusedRecordIndex;
   if (recSelect < 0) then Exit;

   Application.CreateForm(TfrmRekapSelectFP, frmRekapSelectFP);
   frmRekapSelectFP.lblJudul.Caption := '  CARI FINGER OUT ';
   with frmRekapSelectFP do
     begin
       lblKode.Caption := gtvRekap.DataController.GetValue(recSelect, gtvRekapKode.Index);
       lblIDFinger.Caption := VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIDFinger.Index));
       frmRekapSelectFP.IDFINGER := VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapIDFinger.Index));
       frmRekapSelectFP.IDKARYAWAN := VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapKode.Index));
       lblNama.Caption := VarToStr(gtvRekap.DataController.GetValue(recSelect, gtvRekapNama.Index));
       frmRekapSelectFP.TANGGAL := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapTanggal.Index));
       frmRekapSelectFP.edTanggal.Date := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapTanggal.Index));
       frmRekapSelectFP.JDWLMSK := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapJMasuk.Index));
       frmRekapSelectFP.JDWLKLR := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapJKeluar.Index));
       //frmRekapSelectFP.TGLOUT := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapTglKeluar.Index));
       //frmRekapSelectFP.FPMASUK := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapFPMasuk.Index));
       //frmRekapSelectFP.FPKELUAR := VarToDateTime(gtvRekap.DataController.GetValue(recSelect, gtvRekapFPKeluar.Index));
       qryList.Active := True;
       qryList.Close;
       qryList.SQL.Clear;
       qryList.SQL.Add('select id_karyawan, nama, tanggal, waktu from absen_harian ' +
          'WHERE tanggal = ''' + FormatDateTime('yyyy-MM-dd', frmRekapSelectFP.TANGGAL) + ''' ' +
          'AND id_karyawan = ''' + frmRekapSelectFP.IDFINGER + '''');
       qryList.Open;
       gtbList.DataController.Refresh;
       frmRekapSelectFP.RECUTAMA := recSelect;
     end;
   frmRekapSelectFP.btnSelectBali.Tag := 2;
   frmRekapSelectFP.Show;
end;

end.

