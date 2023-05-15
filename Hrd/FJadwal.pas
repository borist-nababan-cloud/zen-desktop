unit FJadwal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGraphics, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxClasses,
  cxGridLevel, cxGrid, cxButtons, DateUtils, cxButtonEdit, cxTimeEdit,
  cxLookAndFeels, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator;

type
  TfrmJadwal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edStartDate: TcxDateEdit;
    edEndDate: TcxDateEdit;
    edDepartemen: TcxLookupComboBox;
    Label3: TLabel;
    btnGetData: TcxButton;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvScheduler: TcxGridTableView;
    gtvSchedulerIDKaryawan: TcxGridColumn;
    gtvSchedulerNamaKaryawan: TcxGridColumn;
    gtvSchedulerDepartemen: TcxGridColumn;
    gtvSchedulerWeekly: TcxGridColumn;
    gtvSchedulerMon: TcxGridColumn;
    gtvSchedulerTues: TcxGridColumn;
    gtvSchedulerWed: TcxGridColumn;
    gtvSchedulerThurs: TcxGridColumn;
    gtvSchedulerFri: TcxGridColumn;
    gtvSchedulerSat: TcxGridColumn;
    gtvSchedulerSun: TcxGridColumn;
    gtvSchedulerBtn: TcxGridColumn;
    btnGenerate: TcxButton;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    gtvJadwal: TcxGridTableView;
    gtvJadwalIDKaryawan: TcxGridColumn;
    gtvJadwalNamaKaryawan: TcxGridColumn;
    gtvJadwalDepartemen: TcxGridColumn;
    gtvJadwalShift: TcxGridColumn;
    gtvJadwalTglMasuk: TcxGridColumn;
    gtvJadwalJamMsk: TcxGridColumn;
    gtvJadwalTglKlr: TcxGridColumn;
    gtvJadwalJamKlr: TcxGridColumn;
    btnPost: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGetDataClick(Sender: TObject);
    procedure gtvSchedulerBtnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnGenerateClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJadwal: TfrmJadwal;

implementation

uses FDMdb;

{$R *.dfm}

procedure TfrmJadwal.FormCreate(Sender: TObject);
begin
     edEndDate.Date := Date;
     edStartDate.Date := Date;
     
end;

procedure TfrmJadwal.btnGetDataClick(Sender: TObject);
var
   i, newRec : Integer;
   awal_hari, akhir_hari : String;
begin
     edStartDate.PostEditValue;
     awal_hari := FormatDateTime('dddd', edStartDate.Date);
     if (awal_hari <> 'Monday') then
         begin
              ShowMessage('Start Date is ' + awal_hari + ' Please Change Day to Monday');
              edStartDate.SetFocus;
              Exit;
         end;

     edEndDate.PostEditValue;
     akhir_hari := FormatDateTime('dddd', edEndDate.Date);
     if (akhir_hari <> 'Sunday') then
         begin
              ShowMessage('End Date is ' + akhir_hari + ' Please Change Day to Sunday');
              edEndDate.SetFocus;
              Exit;
         end;
     if (edDepartemen.Text = 'SC') then
         begin
              ShowMessage('Maaf, Pembuatan jadwal Security tidak dapat dilakukan pada Form ini');
              Exit;
         end;

     gtvScheduler.DataController.SelectAll;
     gtvScheduler.DataController.DeleteSelection;
     gtvJadwal.DataController.SelectAll;
     gtvJadwal.DataController.DeleteSelection;
     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from karyawan where departemen_id = ''' +
                                 edDepartemen.Text + '''');
               qrySearch.Open;

               qrySearch.First;

               for i:=0 to qrySearch.RecordCount-1 do
                   begin
                        newRec := gtvScheduler.DataController.InsertRecord(gtvScheduler.DataController.RecordCount);
                        gtvScheduler.DataController.SetValue(newRec, gtvSchedulerIDKaryawan.Index, qrySearch.Fields[0].AsString);
                        gtvScheduler.DataController.SetValue(newRec, gtvSchedulerNamaKaryawan.Index, qrySearch.Fields[5].AsString);
                        gtvScheduler.DataController.SetValue(newRec, gtvSchedulerDepartemen.Index, qrySearch.Fields[1].AsString);
                        gtvScheduler.DataController.PostEditingData;
                        gtvScheduler.DataController.Post;
                        qrySearch.Next;
                        Application.ProcessMessages;

                   end;

          end;
     btnGenerate.Enabled := True;
     btnPost.Enabled := False;
end;

procedure TfrmJadwal.gtvSchedulerBtnPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
   rec_select : Integer;
   weekly : String;
begin
     rec_select := gtvScheduler.DataController.GetFocusedRecordIndex;
     weekly := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerWeekly.Index));
     //ShowMessage(weekly);
     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from weekly_shift where id_weekly = ''' +
                                 weekly + '''');
               qrySearch.Open;

               gtvScheduler.DataController.SetValue(rec_select, gtvSchedulerMon.Index, qrySearch.Fields[3].AsString);
               gtvScheduler.DataController.SetValue(rec_select, gtvSchedulerTues.Index, qrySearch.Fields[4].AsString);
               gtvScheduler.DataController.SetValue(rec_select, gtvSchedulerWed.Index, qrySearch.Fields[5].AsString);
               gtvScheduler.DataController.SetValue(rec_select, gtvSchedulerThurs.Index, qrySearch.Fields[6].AsString);
               gtvScheduler.DataController.SetValue(rec_select, gtvSchedulerFri.Index, qrySearch.Fields[7].AsString);
               gtvScheduler.DataController.SetValue(rec_select, gtvSchedulerSat.Index, qrySearch.Fields[8].AsString);
               gtvScheduler.DataController.SetValue(rec_select, gtvSchedulerSun.Index, qrySearch.Fields[9].AsString);
               gtvScheduler.DataController.PostEditingData;
               gtvScheduler.DataController.Post;
          end;
end;

procedure TfrmJadwal.btnGenerateClick(Sender: TObject);
var
   jumlah_hari, rec_select, i, y, newRec : Integer;
   id_karyawan, weekly, shift_id, nama_hari : String;
   nama_karyawan, departemen_id : String;
   sekarang : TDate;
begin
     jumlah_hari := DaysBetween(edStartDate.Date, edEndDate.Date);
     sekarang := edStartDate.Date;
     gtvJadwal.DataController.SelectAll;
     gtvJadwal.DataController.DeleteSelection;
     Application.ProcessMessages;

     gtvScheduler.DataController.GotoFirst;
     with dmDB do
          begin
               for i:=0 to gtvScheduler.DataController.RecordCount-1 do
                   begin
                        rec_select := gtvScheduler.DataController.FocusedRecordIndex;
                        weekly := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerWeekly.Index));
                        id_karyawan := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerIDKaryawan.Index));
                        nama_karyawan := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerNamaKaryawan.Index));
                        departemen_id := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerDepartemen.Index));
                        qrySearch.Close;
                        qrySearch.SQL.Clear;
                        qrySearch.SQL.Add('select * from weekly_shift where id_weekly = ''' +
                                          weekly + '''');
                        qrySearch.Open;

                        for y:=0 to jumlah_hari do
                            begin
                                 nama_hari := FormatDateTime('dddd', sekarang);
                                 if (nama_hari = 'Monday') then
                                     begin
                                          shift_id := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerMon.Index));
                                     end
                                 else if (nama_hari = 'Tuesday') then
                                     begin
                                          shift_id := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerTues.Index));
                                     end
                                 else if (nama_hari = 'Wednesday') then
                                     begin
                                          shift_id := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerWed.Index));
                                     end
                                 else if (nama_hari = 'Thursday') then
                                     begin
                                          shift_id := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerThurs.Index));
                                     end
                                 else if (nama_hari = 'Friday') then
                                     begin
                                          shift_id := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerFri.Index));
                                     end
                                 else if (nama_hari = 'Saturday') then
                                     begin
                                          shift_id := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerSat.Index));
                                     end
                                 else if (nama_hari = 'Sunday') then
                                     begin
                                          shift_id := vartostr(gtvScheduler.DataController.GetValue(rec_select, gtvSchedulerSun.Index));
                                     end;
                                 qryCari.Close;
                                 qryCari.SQL.Clear;
                                 qryCari.SQL.Add('select * from shift where id_shift = ''' +
                                                 shift_id + '''');
                                 qryCari.Open;

                                 newRec := gtvJadwal.DataController.InsertRecord(gtvJadwal.DataController.RecordCount);
                                 gtvJadwal.DataController.SetValue(newRec, gtvJadwalIDKaryawan.Index, id_karyawan);
                                 gtvJadwal.DataController.SetValue(newRec, gtvJadwalNamaKaryawan.Index, nama_karyawan);
                                 gtvJadwal.DataController.SetValue(newRec, gtvJadwalDepartemen.Index, departemen_id);
                                 gtvJadwal.DataController.SetValue(newRec, gtvJadwalShift.Index, shift_id);
                                 gtvJadwal.DataController.SetValue(newRec, gtvJadwalTglMasuk.Index, sekarang);
                                 gtvJadwal.DataController.SetValue(newRec, gtvJadwalJamMsk.Index, qryCari.Fields[2].AsString);
                                 gtvJadwal.DataController.SetValue(newRec, gtvJadwalTglKlr.Index, sekarang);
                                 gtvJadwal.DataController.SetValue(newRec, gtvJadwalJamKlr.Index, qryCari.Fields[3].AsString);
                                 gtvJadwal.DataController.PostEditingData;
                                 gtvJadwal.DataController.Post;
                                 sekarang := IncDay(sekarang, 1);
                                 Application.ProcessMessages;

                            end;
                        gtvScheduler.DataController.GotoNext;
                        sekarang := edStartDate.Date;
                        Application.ProcessMessages;
                   end;
          end;
     btnPost.Enabled := True;
end;

procedure TfrmJadwal.btnPostClick(Sender: TObject);
var
   i, recSelect : Integer;
   tglMasuk, tglKeluar : String;
   jamMasuk, jamKeluar : String;
   idKaryawan, namaKaryawan, departemen, shiftID : String;
begin
     gtvJadwal.DataController.GotoFirst;
     for i:=0 to gtvJadwal.DataController.RecordCount-1 do
         begin
              recSelect := gtvJadwal.DataController.GetFocusedRecordIndex;
              idKaryawan := vartostr(gtvJadwal.DataController.GetValue(recSelect, gtvJadwalIDKaryawan.Index));
              namaKaryawan := vartostr(gtvJadwal.DataController.GetValue(recSelect, gtvJadwalNamaKaryawan.Index));
              departemen := vartostr(gtvJadwal.DataController.GetValue(recSelect, gtvJadwalDepartemen.Index));
              shiftID := vartostr(gtvJadwal.DataController.GetValue(recSelect, gtvJadwalShift.Index));
              tglMasuk :=  FormatDateTime('yyyy-MM-dd', VarToDateTime(gtvJadwal.DataController.GetValue(recSelect, gtvJadwalTglMasuk.Index)));
              jamMasuk :=  FormatDateTime('HH:MM:ss', VarToDateTime(gtvJadwal.DataController.GetValue(recSelect, gtvJadwalJamMsk.Index)));
              tglKeluar := FormatDateTime('yyyy-MM-dd', VarToDateTime(gtvJadwal.DataController.GetValue(recSelect, gtvJadwalTglKlr.Index)));
              jamKeluar := FormatDateTime('HH:MM:ss', VarToDateTime(gtvJadwal.DataController.GetValue(recSelect, gtvJadwalJamKlr.Index)));
              with dmDB do
                   begin
                        qryCari.Close;
                        qryCari.SQL.Clear;
                        qryCari.SQL.Add('select * from jadwal where id_karyawan = ''' +
                                        idKaryawan + ''' and tgl_masuk = ''' +
                                        tglMasuk + '''');
                        qryCari.Open;

                        if (qryCari.IsEmpty) then
                            begin
                                 qryExec.SQL.Clear;
                                 qryExec.SQL.Add('INSERT INTO jadwal VALUES(' +
                                                 '''' + '' + ''', ' +
                                                 '''' + idKaryawan + ''', ' +
                                                 '''' + namaKaryawan + ''', ' +
                                                 '''' + departemen + ''', ' +
                                                 '''' + shiftID  + ''', ' +
                                                 '''' + tglMasuk + ''', ' +
                                                 '''' + jamMasuk + ''', ' +
                                                 '''' + tglKeluar + ''', ' +
                                                 '''' + jamKeluar + ''', ' +
                                                 '''' + '(NONE)' + ''')');
                                 qryExec.ExecSql;
                            end
                        else if (NOT qryCari.IsEmpty) then
                            begin
                                 qryExec.Sql.Clear;
                                 qryExec.Sql.Add('update jadwal set ' +
                                                 'tgl_masuk = ''' + tglMasuk + ''', ' +
                                                 'jam_masuk = ''' + jamMasuk + ''', ' +
                                                 'tgl_keluar = ''' + tglKeluar + ''', ' +
                                                 'jam_keluar = ''' + jamKeluar + ''' ' +
                                                 'where autonum = ''' + qryCari.Fields[0].AsString + '''');
                                 qryExec.ExecSql
                            end;


                   end;
              Application.ProcessMessages;
              gtvJadwal.DataController.GotoNext;
         end;
     ShowMessage('Posting data selesai');
     gtvScheduler.DataController.SelectAll;
     gtvScheduler.DataController.DeleteSelection;
     gtvJadwal.DataController.SelectAll;
     gtvJadwal.DataController.DeleteSelection;
     btnGenerate.Enabled := False;
     btnPost.Enabled := False;

end;

end.
