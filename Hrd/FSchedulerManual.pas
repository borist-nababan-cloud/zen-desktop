unit FSchedulerManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, DateUtils, cxCalc, cxLabel, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridBandedTableView, cxDBLookupComboBox,
  cxTimeEdit, cxSplitter, cxGroupBox, cxGridExportLink, ShellApi, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  cxLookupEdit, cxDBLookupEdit, ComCtrls, Buttons,
  cxButtonEdit, cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinsdxBarPainter, dxBarSkinnedCustForm, dxSkinsdxRibbonPainter, DBAccess,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxCore, cxDateUtils, cxNavigator, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, MemDS, MyAccess;

type
  TfrmSchedulerManual = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pmDataDetail: TPopupMenu;
    cxSplitter1: TcxSplitter;
    cxGroupBox1: TcxGroupBox;
    edLastSchedule: TcxDateEdit;
    cxGroupBox2: TcxGroupBox;
    dlgSave: TSaveDialog;
    pmDataGroup: TPopupMenu;
    EXPORTDETAIL1: TMenuItem;
    EXPORTGROUP1: TMenuItem;
    PRINTDATA1: TMenuItem;
    PRINTDATA2: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    printGroup: TdxGridReportLink;
    printDetail: TdxGridReportLink;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvDays: TcxGridBandedTableView;
    lcbStaff: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    gtvDaysMon: TcxGridBandedColumn;
    gtvDaysTue: TcxGridBandedColumn;
    gtvDaysWed: TcxGridBandedColumn;
    gtvDaysThu: TcxGridBandedColumn;
    gtvDaysFri: TcxGridBandedColumn;
    gtvDaysSat: TcxGridBandedColumn;
    gtvDaysSun: TcxGridBandedColumn;
    gtvDaysKaryawanId: TcxGridBandedColumn;
    gtvDaysNama: TcxGridBandedColumn;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    gtvScheduler: TcxGridBandedTableView;
    gtvSchedulerKaryawanID: TcxGridBandedColumn;
    gtvSchedulerNama: TcxGridBandedColumn;
    gtvSchedulerTanggal: TcxGridBandedColumn;
    gtvSchedulerHari: TcxGridBandedColumn;
    gtvSchedulerMasuk: TcxGridBandedColumn;
    gtvSchedulerKeluar: TcxGridBandedColumn;
    btnTambah: TSpeedButton;
    gtvDaysDepartemen: TcxGridBandedColumn;
    gtvDaysWeekly: TcxGridBandedColumn;
    gtvDaysBtn: TcxGridBandedColumn;
    gtvDaysColor: TcxGridBandedColumn;
    gtvSchedulerColor: TcxGridBandedColumn;
    cxLabel3: TcxLabel;
    edStartingDate: TcxDateEdit;
    cxLabel2: TcxLabel;
    edEndSchedule: TcxDateEdit;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    tblScheduleStaff: TMyTable;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EXPORTDETAIL1Click(Sender: TObject);
    procedure EXPORTGROUP1Click(Sender: TObject);
    procedure PRINTDATA1Click(Sender: TObject);
    procedure PRINTDATA2Click(Sender: TObject);
    procedure edStartingDatePropertiesChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure gtvDaysBtnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edEndSchedulePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    { Private declarations }
    qryMan1, qryMan2, qryMan3, qryMan4 : TMyQuery;
  public
    { Public declarations }
    function TambahHari(begin_date: TDateTime; hari: integer): TDateTime;
    procedure start_date();
    procedure end_date();
  end;

var
  frmSchedulerManual: TfrmSchedulerManual;

implementation

uses FDMdb;



{$R *.dfm}

function TfrmSchedulerManual.TambahHari(begin_date: TDateTime; hari: integer): TDateTime;
var
   nYear, nMonth, nDay, nHour, nMinutes, nSecond, nMSecond : word;
begin
     DecodeDateTime(begin_date, nYear, nMonth, nDay, nHour, nMinutes, nSecond, nMSecond);
     result := EncodeDateTime(nYear, nMonth, nDay + hari, nHour, nMinutes, nSecond, nMSecond);
end;

procedure TfrmSchedulerManual.start_date();
var
   akhir_bulan: TDateTime;
   tahun, bulan, hari: Word;
   nama_hari, sAkhir_bulan : String;
begin
     DecodeDate(edStartingDate.Date, tahun, bulan, hari);
     akhir_bulan := EndOfTheMonth(edStartingDate.Date);
     //ShowMessage(DateToStr(akhir_bulan));
     nama_hari := FormatDateTime('DDDD', akhir_bulan);
     //ShowMessage(nama_hari);
     if (nama_hari = 'Monday') then
          begin
               hari := 6;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
               edEndSchedule.Date := EncodeDate(tahun, bulan , hari);
          end
      else if(nama_hari = 'Tuesday') then
          begin
               hari := 5;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
               edEndSchedule.Date := EncodeDate(tahun, bulan, hari);
          end
      else if(nama_hari = 'Wednesday') then
          begin
               hari := 4;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
               edEndSchedule.Date := EncodeDate(tahun, bulan , hari);
          end
      else if(nama_hari = 'Thursday') then
          begin
               hari := 3;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
               edEndSchedule.Date := EncodeDate(tahun, bulan , hari);
          end
      else if(nama_hari = 'Friday') then
          begin
               hari := 2;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
               edEndSchedule.Date := EncodeDate(tahun, bulan , hari);
          end
      else if(nama_hari = 'Saturday') then
          begin
               hari := 1;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
               edEndSchedule.Date := EncodeDate(tahun, bulan , hari);
          end
      else if(nama_hari = 'Sunday') then
          begin
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
              sAkhir_bulan := FormatDateTime('MM/dd/YYYY', akhir_bulan);
              edEndSchedule.Date := StrToDate(sAkhir_bulan);
          end;
end;

procedure TfrmSchedulerManual.end_date();
var
   akhir_bulan : TDateTime;
   tahun, bulan, hari: Word;
   nama_hari : String;
begin
     DecodeDate(edLastSchedule.Date,tahun, bulan, hari);
     akhir_bulan := EndOfTheMonth(edLastSchedule.Date);
     nama_hari := FormatDateTime('DDDD', akhir_bulan);
     if (nama_hari = 'Monday') then
          begin
               hari := 7;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
               edEndSchedule.Date := EncodeDate(tahun, bulan, hari);
          end
      else if(nama_hari = 'Tuesday') then
          begin
               hari := 6;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                        tahun := tahun + 1;
                   end;
               edEndSchedule.Date := EncodeDate(tahun, bulan, hari);
          end
      else if(nama_hari = 'Wednesday') then
          begin
               hari := 5;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
              edEndSchedule.Date := EncodeDate(tahun, bulan, hari);
          end
      else if(nama_hari = 'Thursday') then
          begin
               hari := 4;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
             edEndSchedule.Date := EncodeDate(tahun, bulan, hari);
          end
      else if(nama_hari = 'Friday') then
          begin
               hari := 3;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
             edEndSchedule.Date := EncodeDate(tahun, bulan, hari);
          end
      else if(nama_hari = 'Saturday') then
          begin
               hari := 2;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                       tahun := tahun + 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
             edEndSchedule.Date := EncodeDate(tahun, bulan, hari);
          end
      else if(nama_hari = 'Sunday') then
          begin
               hari := 1;
               if (bulan = 12) then
                  begin
                       bulan := 1;
                  end
               else
                   begin
                        bulan := bulan + 1;
                   end;
              edEndSchedule.Date := EncodeDate(tahun, bulan, hari);     
          end;
end;

procedure TfrmSchedulerManual.FormShow(Sender: TObject);

begin
     {with dmDB do
          begin
               qryTemp.Close;
               qryTemp.SQL.Clear;
               qryTemp.SQL.Add('SELECT * FROM karyawan WHERE departemen_id <> ''' +
                               'SC' + ''' ');

               qryTemp.Open;
               qryTemp.First;

          end;}

     edStartingDate.Date := Date;
     edLastSchedule.Date := Date;
     start_date;


end;

procedure TfrmSchedulerManual.FormCreate(Sender: TObject);
begin
     //cxSplitter1.CloseSplitter;
     qryMan1 := TMyQuery.Create(Self);
     qryMan1.Connection := DMDB.StoreDB;
     qryMan1.SQL.Add('select * from temptable');
     qryMan1.Active := true;

     qryMan2 := TMyQuery.Create(Self);
     qryMan2.Connection := DMDB.StoreDB;
     qryMan2.SQL.Add('select * from temptable');
     qryMan2.Active := true;

     qryMan3 := TMyQuery.Create(Self);
     qryMan3.Connection := DMDB.StoreDB;
     qryMan3.SQL.Add('select * from temptable');
     qryMan3.Active := true;

     qryMan4 := TMyQuery.Create(Self);
     qryMan4.Connection := DMDB.StoreDB;
     qryMan4.SQL.Add('select * from temptable');
     qryMan4.Active := true;
end;

procedure TfrmSchedulerManual.EXPORTDETAIL1Click(Sender: TObject);
begin
     dlgSave.Title := '[Excel 97-2003] Export to...';
     dlgSave.Filter := 'Microsoft Excel 97-2003 (*.xls)|*.xls';
     dlgSave.FileName := '';
     if (dlgSave.Execute) then
        begin
             if (dlgSave.FileName <> '') then
                begin
                     ExportGridToExcel(dlgSave.FileName, cxGrid2, true, true, true, 'xls');
                     if (MessageDlg('Would you like to open exported file now?',
                         mtConfirmation, mbOKCancel, 0) = mrOK) then
                        ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                     else exit;
                end
             else exit;
        end
     else exit;
end;

procedure TfrmSchedulerManual.EXPORTGROUP1Click(Sender: TObject);
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
                        ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                     else exit;
                end
             else exit;
        end
     else exit;
end;

procedure TfrmSchedulerManual.PRINTDATA1Click(Sender: TObject);
begin
     printDetail.Preview;
end;

procedure TfrmSchedulerManual.PRINTDATA2Click(Sender: TObject);
begin
     printGroup.Preview;
end;

procedure TfrmSchedulerManual.edStartingDatePropertiesChange(Sender: TObject);
begin
     start_date;
end;

procedure TfrmSchedulerManual.cxButton2Click(Sender: TObject);
var
   next_date : TDate;
   time_m, time_k : TTime;
   waktu_m, waktu_k: TDateTime;
   jam_m, jam_k, menit,detik, mdetik, hari, tahun, bulan : Word;
   jumlah_hari, i, k, newRec : Integer;
   nama_hari : String;
begin
     //start_date;
     gtvDays.DataController.PostEditingData;
     gtvDays.DataController.Post;
     gtvDays.DataController.GotoFirst;
     jam_m := 0;
     jam_k := 0;
     menit := 0;
     detik := 0;
     mdetik := 0;

     with dmDB do
          jumlah_hari := DaysBetween(edStartingDate.Date, edEndSchedule.Date);
          begin
               for i := 0 to gtvDays.DataController.RecordCount-1 do
                   begin
                        next_date := edStartingDate.Date;
                        for k := 1 to jumlah_hari do
                            begin
                                 next_date := IncDay(next_date, 1);
                                 newRec := gtvScheduler.DataController.InsertRecord(gtvScheduler.DataController.RecordCount);
                                 gtvScheduler.DataController.SetValue(newRec, gtvSchedulerKaryawanID.Index, gtvDays.DataController.GetValue(i, gtvDaysKaryawanId.Index));
                                 gtvScheduler.DataController.SetValue(newRec, gtvSchedulerNama.Index, gtvDays.DataController.GetValue(i, gtvDaysNama.Index));
                                 gtvScheduler.DataController.SetValue(newRec, gtvSchedulerTanggal.Index, next_date);
                                 gtvScheduler.DataController.SetValue(newRec, gtvSchedulerColor.Index, gtvDays.DataController.GetValue(i, gtvDaysColor.Index));
                                 nama_hari := FormatDateTime('dddd', next_date);
                                 gtvScheduler.DataController.SetValue(newRec, gtvSchedulerHari.Index, nama_hari);
                                 DecodeDate(next_date, tahun, bulan, hari);
                                 if (nama_hari = 'Monday') then
                                     begin
                                          qryMan2.Close;
                                          qryMan2.SQL.Clear;
                                          qryMan2.SQL.Add('SELECT * FROM shift WHERE id_shift = ''' +
                                                                VarToStr(gtvDaysMon.EditValue) + '''');
                                          qryMan2.Open;
                                          time_m := qryMan2.Fields[2].AsDateTime;
                                          time_k := qryMan2.Fields[3].AsDateTime;
                                          DecodeTime(time_m, jam_m, menit, detik, mdetik);
                                          waktu_m := EncodeDateTime(tahun, bulan, hari, jam_m, menit, detik, mdetik);

                                          DecodeTime(time_k, jam_k, menit, detik, mdetik);
                                          waktu_k := EncodeDateTime(tahun, bulan, hari, jam_k, menit, detik, mdetik);

                                          gtvScheduler.DataController.SetValue(newRec, gtvSchedulerMasuk.Index, waktu_m);
                                          gtvScheduler.DataController.SetValue(newRec, gtvSchedulerKeluar.Index, waktu_k);

                                     end
                                 else if (nama_hari = 'Tuesday') then
                                      begin
                                           qryMan2.Close;
                                           qryMan2.SQL.Clear;
                                           qryMan2.SQL.Add('SELECT * FROM shift WHERE id_shift = ''' +
                                                                VarToStr(gtvDaysTue.EditValue) + '''');
                                           qryMan2.Open;
                                           time_m := qryMan2.Fields[2].AsDateTime;
                                           time_k := qryMan2.Fields[3].AsDateTime;
                                           DecodeTime(time_m, jam_m, menit, detik, mdetik);
                                           waktu_m := EncodeDateTime(tahun, bulan, hari, jam_m, menit, detik, mdetik);

                                           DecodeTime(time_k, jam_k, menit, detik, mdetik);
                                           waktu_k := EncodeDateTime(tahun, bulan, hari, jam_k, menit, detik, mdetik);

                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerMasuk.Index, waktu_m);
                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerKeluar.Index, waktu_k);
                                      end
                                 else if (nama_hari = 'Wednesday') then
                                      begin
                                           qryMan2.Close;
                                           qryMan2.SQL.Clear;
                                           qryMan2.SQL.Add('SELECT * FROM shift WHERE id_shift = ''' +
                                                                VarToStr(gtvDaysWed.EditValue) + '''');
                                           qryMan2.Open;
                                           time_m := qryMan2.Fields[2].AsDateTime;
                                           time_k := qryMan2.Fields[3].AsDateTime;
                                           DecodeTime(time_m, jam_m, menit, detik, mdetik);
                                           waktu_m := EncodeDateTime(tahun, bulan, hari, jam_m, menit, detik, mdetik);

                                           DecodeTime(time_k, jam_k, menit, detik, mdetik);
                                           waktu_k := EncodeDateTime(tahun, bulan, hari, jam_k, menit, detik, mdetik);

                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerMasuk.Index, waktu_m);
                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerKeluar.Index, waktu_k);
                                      end
                                 else if (nama_hari = 'Thursday') then
                                      begin
                                           qryMan2.Close;
                                           qryMan2.SQL.Clear;
                                           qryMan2.SQL.Add('SELECT * FROM shift WHERE id_shift = ''' +
                                                                VarToStr(gtvDaysThu.EditValue) + '''');
                                           qryMan2.Open;
                                           time_m := qryMan2.Fields[2].AsDateTime;
                                           time_k := qryMan2.Fields[3].AsDateTime;
                                           DecodeTime(time_m, jam_m, menit, detik, mdetik);
                                           waktu_m := EncodeDateTime(tahun, bulan, hari, jam_m, menit, detik, mdetik);

                                           DecodeTime(time_k, jam_k, menit, detik, mdetik);
                                           waktu_k := EncodeDateTime(tahun, bulan, hari, jam_k, menit, detik, mdetik);

                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerMasuk.Index, waktu_m);
                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerKeluar.Index, waktu_k);
                                      end
                                 else if (nama_hari = 'Friday') then
                                      begin
                                           qryMan2.Close;
                                           qryMan2.SQL.Clear;
                                           qryMan2.SQL.Add('SELECT * FROM shift WHERE id_shift = ''' +
                                                                VarToStr(gtvDaysFri.EditValue) + '''');
                                           qryMan2.Open;
                                           time_m := qryMan2.Fields[2].AsDateTime;
                                           time_k := qryMan2.Fields[3].AsDateTime;
                                           DecodeTime(time_m, jam_m, menit, detik, mdetik);
                                           waktu_m := EncodeDateTime(tahun, bulan, hari, jam_m, menit, detik, mdetik);

                                           DecodeTime(time_k, jam_k, menit, detik, mdetik);
                                           waktu_k := EncodeDateTime(tahun, bulan, hari, jam_k, menit, detik, mdetik);

                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerMasuk.Index, waktu_m);
                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerKeluar.Index, waktu_k);
                                      end
                                 else if (nama_hari = 'Saturday') then
                                      begin
                                           qryMan2.Close;
                                           qryMan2.SQL.Clear;
                                           qryMan2.SQL.Add('SELECT * FROM shift WHERE id_shift = ''' +
                                                                VarToStr(gtvDaysSat.EditValue) + '''');
                                           qryMan2.Open;
                                           time_m := qryMan2.Fields[2].AsDateTime;
                                           time_k := qryMan2.Fields[3].AsDateTime;
                                           DecodeTime(time_m, jam_m, menit, detik, mdetik);
                                           waktu_m := EncodeDateTime(tahun, bulan, hari, jam_m, menit, detik, mdetik);

                                           DecodeTime(time_k, jam_k, menit, detik, mdetik);
                                           waktu_k := EncodeDateTime(tahun, bulan, hari, jam_k, menit, detik, mdetik);

                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerMasuk.Index, waktu_m);
                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerKeluar.Index, waktu_k);
                                      end
                                 else if (nama_hari = 'Sunday') then
                                      begin
                                           qryMan2.Close;
                                           qryMan2.SQL.Clear;
                                           qryMan2.SQL.Add('SELECT * FROM shift WHERE id_shift = ''' +
                                                                VarToStr(gtvDaysSun.EditValue) + '''');
                                           qryMan2.Open;
                                           time_m := qryMan2.Fields[2].AsDateTime;
                                           time_k := qryMan2.Fields[3].AsDateTime;
                                           DecodeTime(time_m, jam_m, menit, detik, mdetik);
                                           waktu_m := EncodeDateTime(tahun, bulan, hari, jam_m, menit, detik, mdetik);

                                           DecodeTime(time_k, jam_k, menit, detik, mdetik);
                                           waktu_k := EncodeDateTime(tahun, bulan, hari, jam_k, menit, detik, mdetik);

                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerMasuk.Index, waktu_m);
                                           gtvScheduler.DataController.SetValue(newRec, gtvSchedulerKeluar.Index, waktu_k);
                                      end;


                                 gtvScheduler.DataController.PostEditingData;
                                 Next;


                            end;

                        gtvDays.DataController.GotoNext;
                        Application.ProcessMessages;
                   end;
          end;
end;

procedure TfrmSchedulerManual.cxButton1Click(Sender: TObject);
var
   i : Integer;
   date_in, date_out : TDateTime;
begin
     gtvScheduler.DataController.PostEditingData;
     gtvScheduler.DataController.Post;
     gtvScheduler.DataController.GotoFirst;
     for i := 0 to gtvScheduler.DataController.RecordCount-1 do
          begin
               with dmDB do
                    begin
                         date_in := VarToDateTime(gtvSchedulerMasuk.EditValue);
                         date_out := VarToDateTime(gtvSchedulerKeluar.EditValue);

                         qryMan1.Close;
                         qryMan1.SQL.Clear;
                         qryMan1.SQL.Add('SELECT * FROM scheduler_staff WHERE resource_id = ''' +
                                            VarToStr(gtvSchedulerKaryawanID.EditValue) + ''' AND start_date = ''' +
                                            FormatDateTime('YYYY-MM-dd HH:mm:ss', date_in) + ' ''' );
                         qryMan1.Open;

                         if (NOT qryMan1.IsEmpty) then
                             begin
                                  ShowMessage('SCHEDULE ADA !!!');
                                  gtvScheduler.DataController.GotoNext;
                             end
                         else if (qryMan1.IsEmpty) then
                             begin
                                  //ShowMessage('SCHEDULE GAK ADA !!!');
                                  tblScheduleStaff.Edit;
                                  tblScheduleStaff.Insert;
                                  tblScheduleStaff.Fields[1].AsString := VarToStr(gtvSchedulerKaryawanID.EditValue) ;//resource_id
                                  tblScheduleStaff.Fields[2].AsInteger := 0;//type
                                  tblScheduleStaff.Fields[3].AsDateTime := date_in;//start_date
                                  tblScheduleStaff.Fields[4].AsDateTime := date_out;//end_date
                                  tblScheduleStaff.Fields[5].AsInteger := 0;//option
                                  tblScheduleStaff.Fields[6].AsString := '[NONE]';//caption
                                  tblScheduleStaff.Fields[7].AsInteger := 0;//recurence index
                                  tblScheduleStaff.Fields[8].AsString :=  'N';//recurence info
                                  tblScheduleStaff.Fields[9].AsInteger := 0;//parent id
                                  tblScheduleStaff.Fields[10].AsString :=  '[NONE]';//location_id
                                  tblScheduleStaff.Fields[11].AsString := '[NONE]' ;//message
                                  tblScheduleStaff.Fields[12].AsDateTime :=  date_in;//reminder date
                                  tblScheduleStaff.Fields[13].AsInteger := 5 ;//reminder_minute
                                  tblScheduleStaff.Fields[14].AsInteger := 0;//state_
                                  tblScheduleStaff.Fields[15].AsInteger := gtvSchedulerColor.EditValue;//label color
                                  tblScheduleStaff.Fields[16].AsInteger := 0;//actual_start
                                  tblScheduleStaff.Fields[17].AsInteger := 0;//actual_finish
                                  tblScheduleStaff.Fields[18].AsString := '[NONE]';//syn_id_field
                                  tblScheduleStaff.Fields[19].AsInteger := 0;//shift_id
                                  tblScheduleStaff.Post;
                                  Sleep(10);
                             end;
                         {qryUpdate.Close;
                         qryUpdate.SQL.Clear;
                         qryUpdate.SQL.Add('UPDATE karyawan SET ' +
                                           'shift_id = ''' + VarToStr(gtvUploadShift.EditValue) + ''' ' +
                                           'WHERE karyawan_id = ''' + VarToStr(gtvUploadKaryawanID.EditValue) + '''');
                         qryUpdate.Open;}                         //gtvUpload.DataController.GotoNext;
                    end;
               gtvScheduler.DataController.GotoNext;
               Application.ProcessMessages;
          end;
    gtvScheduler.DataController.SelectAll;
    gtvScheduler.DataController.DeleteSelection;

    gtvDays.DataController.SelectAll;
    gtvDays.DataController.DeleteSelection;
    
    ShowMessage('UPDATE DATA FINISHED');
end;

procedure TfrmSchedulerManual.btnTambahClick(Sender: TObject);
begin
     if (lcbStaff.EditValue <> 0) then
         begin
              qryMan3.Close;
              qryMan3.SQL.Clear;
              qryMan3.SQL.Add('SELECT * FROM karyawan WHERE karyawan_id = ''' +
                                lcbStaff.EditValue + '''');
              qryMan3.Open;

              if (qryMan3.IsEmpty) then
                  begin
                       gtvDays.DataController.Edit;
                       gtvDays.DataController.Insert;
                       gtvDaysKaryawanId.EditValue := lcbStaff.EditValue;
                       gtvDaysNama.EditValue := '(NONE)';
                       gtvDaysDepartemen.EditValue := '(NONE)';
                       gtvDaysColor.EditValue := 0;
                       gtvDays.DataController.PostEditingData;
                       gtvDays.DataController.Post;
                  end
              else
                  begin
                       gtvDays.DataController.Edit;
                       gtvDays.DataController.Insert;
                       gtvDaysKaryawanId.EditValue := qryMan3.Fields[0].AsString;
                       gtvDaysNama.EditValue := qryMan3.Fields[5].AsString;
                       gtvDaysDepartemen.EditValue := qryMan3.Fields[1].AsString;
                       if (qryMan3.Fields[1].AsString = 'HK') then
                           begin
                                gtvDaysColor.EditValue := 250;
                           end
                       else if (qryMan3.Fields[1].AsString = 'SC') then
                           begin
                                gtvDaysColor.EditValue := 7547390;
                           end
                       else if (qryMan3.Fields[1].AsString = 'TR') then
                           begin
                                gtvDaysColor.EditValue := 16037736;
                           end
                       else if (qryMan3.Fields[1].AsString = 'TB') then
                           begin
                                gtvDaysColor.EditValue := 16037736;
                           end
                       else
                           begin
                                gtvDaysColor.EditValue := 78301886;
                           end;
                       gtvDays.DataController.PostEditingData;
                       gtvDays.DataController.Post;
                  end;

         end
     else
         begin
              exit;
         end;
     lcbStaff.EditValue := 0;
end;

procedure TfrmSchedulerManual.gtvDaysBtnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   i, nCol, currRec : Integer;

begin
     currRec := gtvDays.Controller.FocusedRecordIndex;

     with dmDB do
          begin
               qryMan2.Close;
               qryMan2.SQL.Clear;
               qryMan2.SQL.Add('SELECT * FROM weekly_shift WHERE id_weekly = ''' +
                                VarToStr(gtvDaysWeekly.EditValue) + ''' ');
               qryMan2.Open;
               //ShowMessage(qryMan2.Fields[0].AsString);

               nCol := 4;
               if (qryMan2.IsEmpty) then
                   begin
                        //---
                   end
               else
                   begin
                        for i := 3 to 9 do
                            begin
                                 //ShowMessage(qryMan2.Fields[i].AsString);
                                 nCol := nCol + 1;

                                 //gtvDays.DataController.Edit;
                                 //gtvDays.Columns[n].EditValue := qryMan2.Fields[i].AsString;
                                 gtvDays.DataController.SetValue(currRec, i+1, qryMan2.Fields[i].AsString);
                                 gtvDays.DataController.PostEditingData;
                                 //Next;
                                 //i := i +1;
                            end;
                   end;
          end;
end;

procedure TfrmSchedulerManual.edEndSchedulePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
     start_date;
end;

end.
