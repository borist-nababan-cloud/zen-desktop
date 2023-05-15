unit FRekapSelectFp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxTimeEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, DateUtils, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, MyAccess;

type
  TfrmRekapSelectFP = class(TForm)
    lblJudul: TLabel;
    lblKode: TLabel;
    lblIDFinger: TLabel;
    lblNama: TLabel;
    edTanggal: TcxDateEdit;
    Label1: TLabel;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListid_karyawan: TcxGridDBColumn;
    gtbListnama: TcxGridDBColumn;
    gtbListtanggal: TcxGridDBColumn;
    gtbListwaktu: TcxGridDBColumn;
    btnSelectBali: TButton;
    btnLoadList: TButton;
    btnSelectBaru: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSelectBaliClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edTanggalKeyPress(Sender: TObject; var Key: Char);
    procedure edTanggalPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure btnLoadListClick(Sender: TObject);
  private
    { Private declarations }
    qrySel1, qrySel2 : TMyQuery;
  public
    { Public declarations }
    IDKARYAWAN, IDFINGER, NAMAKARYAWAN : String;
    RECUTAMA : Integer;
    TANGGAL : TDate;
    JDWLMSK, JDWLKLR, FPMASUK, FPKELUAR, TGLIN, TGLOUT : TDateTime;
  end;

var
  frmRekapSelectFP: TfrmRekapSelectFP;

implementation

{$R *.dfm}

uses FdmDB, FMain, FRekapHarian;

procedure TfrmRekapSelectFP.btnLoadListClick(Sender: TObject);
begin
   qryList.Close;
   qryList.SQL.Clear;
   qryList.SQL.Add('select id_karyawan, nama, tanggal, waktu from absen_harian ' +
      'WHERE tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''' ' +
      'AND id_karyawan = ''' + lblIDFinger.Caption + '''');
   qryList.Open;
   gtbList.DataController.Refresh;
end;

procedure TfrmRekapSelectFP.btnSelectBaliClick(Sender: TObject);
var
  nTgl : TDate;
  nWaktu : TTime;
  recSelect, nSelisih, vLembur, vOver, xLembur, totLembur : Integer;
  nTag, tLembur : String;
begin
   recSelect := gtbList.DataController.GetFocusedRecordIndex;
   if (recSelect < 0) then Exit;
   nTgl := VarToDateTime(gtbList.DataController.GetValue(recSelect, gtbListtanggal.Index));
   nWaktu := VarToDateTime(gtbList.DataController.GetValue(recSelect, gtbListwaktu.Index));
   if (btnSelectBaru.Tag = 1) then
     Begin
       //in
       FPMASUK := nTgl + nWaktu;
       if (FPMASUK > JDWLMSK) then
         begin
           nSelisih := MinutesBetween(JDWLMSK, FPMASUK);
           if (nSelisih < 1) then
                begin
                  nSelisih := 0;
                  nTag := 'N';
                  {gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'N');
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');}
                end
              else if ((nSelisih >= 1) AND (nSelisih < 29)) then
                begin
                  nSelisih := nSelisih;
                  nTag := 'T';
                  {gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, selMsk);
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'T');
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'T');}
                end
              else if (nSelisih >= 30) then
                begin
                  nSelisih := nSelisih;
                  nTag := 'T2';
                  {gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelMasuk.Index, selMsk);
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTMasuk.Index, 'T2');
                  gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'T2');}
                end;
         end
       else if (FPMASUK < JDWLMSK) then
         begin
            nSelisih := 0;
            nTag := 'N';
         end;
       //ShowMessage(TimeToStr(FPMASUK));
       frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapFPMasuk.Index, FPMASUK);
       frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapSelMasuk.Index, nSelisih);
       frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapTMasuk.Index, nTag);
       frmRekapHarian.gtvRekap.DataController.PostEditingData;
       frmRekapHarian.gtvRekap.DataController.Post;
     End
   else if (btnSelectBaru.Tag = 2) then
     Begin
         //out
         FPKELUAR := nTgl + nWaktu;
         //ShowMessage(DateTimeToStr(JDWLKLR));
         //ShowMessage(DateTimeToStr(FPKELUAR));
         if (FPKELUAR > JDWLKLR) then
           begin
             nSelisih := MinutesBetween(JDWLKLR, FPKELUAR);
              if (nSelisih < 50) then
                begin
                 {gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'N');
                 gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);}
                 tLembur := 'N';
                 vOver := 0;
                 totLembur := 0;
                end
              else if (nSelisih >= 50) then
                begin
                  qrySel1.Close;
                  qrySel1.SQL.Clear;
                  qrySel1.SQL.Add('select tanggal, jumlah, tagpresensi, lembend from ' +
                     'ben_presensi_lembur where kodekaryawan = ''' + IDKARYAWAN + ''' ' +
                     'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TANGGAL) +
                     '''');
                  qrySel1.Open;

                  if (qrySel1.IsEmpty) then
                     begin
                       //ShowMessage('1');
                       {gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, 'N');
                       gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                       gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, 0);}
                       tLembur := 'N';
                       totLembur := 0;
                       vOver := 0;
                     end
                  else if (NOT qrySel1.IsEmpty) then
                     begin
                       //ShowMessage('2');
                       //JDWLKLR := qrySel1.Fields[3].AsDateTime;
                       //nSelisih := MinutesBetween(JDWLKLR, FPKELUAR);
                       vLembur := qrySel1.Fields[1].AsInteger * 60;
                       xLembur := nSelisih mod 60;
                       if (xLembur >= 50) then
                         begin
                           nSelisih := nSelisih + (60 - xLembur);
                         end;
                       if (nSelisih >= vLembur) then
                         begin
                           totLembur := vLembur div 60;
                           {gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, qryRek3.Fields[1].AsInteger);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, qryRek3.Fields[2].AsString);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapNotes.Index, qryRek3.Fields[1].AsInteger);}
                           tLembur := qrySel1.Fields[2].AsString;
                           vOver := qrySel1.Fields[1].AsInteger;
                           nSelisih := qrySel1.Fields[1].AsInteger;
                         end
                       else if (nSelisih < vLembur) then
                         begin
                           totLembur := nSelisih div 60;
                           {gtvRekap.DataController.SetValue(NEWREC, gtvRekapSelKeluar.Index, totLembur);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapTKeluar.Index, qryRek3.Fields[2].AsString);
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapTagAuto.Index, 'N');
                           gtvRekap.DataController.SetValue(NEWREC, gtvRekapNotes.Index, qryRek3.Fields[1].AsInteger);}
                           vOver := qrySel1.Fields[1].AsInteger;
                           nSelisih := totLembur;
                           tLembur := 'OT'
                         end;
                     end;
                   frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapFPKeluar.Index, FPKELUAR);
                   frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapSelKeluar.Index, nSelisih);
                   frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapTKeluar.Index, tLembur);
                   frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapTagAuto.Index, 'N');
                   frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapNotes.Index, vOver);
                   frmRekapHarian.gtvRekap.DataController.PostEditingData;
                   frmRekapHarian.gtvRekap.DataController.Post;
                end
              //
           end
         else if (FPKELUAR < JDWLKLR) then
           begin
             nSelisih := MinutesBetween(FPKELUAR, JDWLKLR);
             if (nSelisih > 1) then
              begin
                tLembur := 'U';
              end
             else if (nSelisih < 1) then
              begin
                 tLembur := 'N';
                 nSelisih := 0;
              end;
             frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapFPKeluar.Index, FPKELUAR);
             frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapSelKeluar.Index, nSelisih);
             frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapTKeluar.Index, tLembur);
             frmRekapHarian.gtvRekap.DataController.SetValue(RECUTAMA, frmRekapHarian.gtvRekapTagAuto.Index, tLembur);
             frmRekapHarian.gtvRekap.DataController.PostEditingData;
             frmRekapHarian.gtvRekap.DataController.Post;
           end;
     End;
   ShowMessage('Update Finish !');
   frmRekapSelectFP.Close;
end;

procedure TfrmRekapSelectFP.edTanggalKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
     begin
       qryList.Active := True;
       qryList.Close;
       qryList.SQL.Clear;
       qryList.SQL.Add('select id_karyawan, nama, tanggal, waktu from absen_harian ' +
          'WHERE tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''' ' +
          'AND id_karyawan = ''' + lblIDFinger.Caption + '''');
       qryList.Open;
       gtbList.DataController.Refresh;
     end;
end;

procedure TfrmRekapSelectFP.edTanggalPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
 qryList.Active := True;
 qryList.Close;
 qryList.SQL.Clear;
 qryList.SQL.Add('select id_karyawan, nama, tanggal, waktu from absen_harian ' +
    'WHERE tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''' ' +
    'AND id_karyawan = ''' + lblIDFinger.Caption + '''');
 qryList.Open;
 gtbList.DataController.Refresh;
end;

procedure TfrmRekapSelectFP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qrySel1.Free;
   qrySel2.Free;
   Action := caFree;
end;

procedure TfrmRekapSelectFP.FormCreate(Sender: TObject);
begin
  qrySel1 := TMyQuery.Create(Self);
  qrySel1.Connection := DMDB.dbInternal;
  qrySel1.SQL.Add('select * from temptable');
  qrySel1.Active := true;

  qrySel2 := TMyQuery.Create(Self);
  qrySel2.Connection := DMDB.dbInternal;
  qrySel2.SQL.Add('select * from temptable');
  qrySel2.Active := true;
end;

end.
