unit FViewTherapist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxTimeEdit, cxTextEdit, cxColorComboBox, cxCalc,
  cxGridBandedTableView, cxGridDBBandedTableView;

type
  TfrmTherapist = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGrid3: TcxGrid;
    gtbTherapist: TcxGridDBBandedTableView;
    gtbTherapistid_therapist: TcxGridDBBandedColumn;
    gtbTherapistdepartemen: TcxGridDBBandedColumn;
    gtbTherapistnama: TcxGridDBBandedColumn;
    gtbTherapistno_urut: TcxGridDBBandedColumn;
    gtbTherapisttanggal: TcxGridDBBandedColumn;
    gtbTherapistwaktu_masuk: TcxGridDBBandedColumn;
    gtbTherapiststatus: TcxGridDBBandedColumn;
    gtbTherapiststart_time: TcxGridDBBandedColumn;
    gtbTherapistend_time: TcxGridDBBandedColumn;
    gtbTherapistroom_id: TcxGridDBBandedColumn;
    gtbTherapistCounter: TcxGridDBBandedColumn;
    gtbTherapistSchedule: TcxGridDBBandedColumn;
    gtbTherapistFlag: TcxGridDBBandedColumn;
    gtvTherapist: TcxGridTableView;
    gtvTherapistFlag: TcxGridColumn;
    gtvTherapistUrutan: TcxGridColumn;
    gtvTherapistID: TcxGridColumn;
    gtvTherapistSchedule: TcxGridColumn;
    gtvTherapistDepartemen: TcxGridColumn;
    gtvTherapistNama: TcxGridColumn;
    gtvTherapistStatus: TcxGridColumn;
    gtvTherapistCounter: TcxGridColumn;
    gtvTherapistType: TcxGridColumn;
    gtvTherapistSex: TcxGridColumn;
    gtvTherapistEndTime: TcxGridColumn;
    gtvTherapistTest: TcxGridColumn;
    cxGrid3Level1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTherapist: TfrmTherapist;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmTherapist.FormCreate(Sender: TObject);
begin
     //with dmDB do
end;

procedure TfrmTherapist.cxButton1Click(Sender: TObject);
 var
    rec_select, newRec, i : Integer;
    id_therapist, id_schedule : String;
    warna : Variant;
begin
     //rec_select := gtbRoom.DataController.GetFocusedRecordIndex;
     //edRoomID.Text := VarToStr(gtbRoom.DataController.GetValue(rec_select, gtbRoomruangan_id.Index));
     with dmDB do
          begin
               qryTherapist.Close;
               qryTherapist.SQL.Clear;
               qryTherapist.SQL.Add('select available_tr.*, ifnull((select jadwal.jam_masuk from jadwal ' +
                                    'where jadwal.id_karyawan = available_tr.id_therapist and ' +
				    'jadwal.tgl_masuk = CURRENT_DATE),"00:00:00") as wkt_masuk, ' +
                                    'ifnull((select count(trans_id) from trans_master '+
                                    'where tanggal = CURRENT_DATE and therapist_id = available_tr.id_therapist and '+
                                    'status_trans <> "CANCELED"), 0) as jml_krj, '+
                                    'ifnull((select karyawan.sex from karyawan ' +
                                    'where karyawan_id = available_tr.id_therapist ), "P") as sex, ' +
                                    'ifnull((select karyawan.type as tipe from karyawan ' +
                                    'where karyawan_id = available_tr.id_therapist ), "SEDANG") as tipe ' +
                                    'from available_tr where departemen <>  ''' +
                                     'SC' + ''' and status = + ''' +
                                     'AVAILABLE' + ''' order by no_urut ASC');
               qryTherapist.Open;
               gtvTherapist.DataController.SelectAll;
               gtvTherapist.DataController.DeleteSelection;

               for i:=0 to qryTherapist.RecordCount-1 do
                   begin
                        id_schedule := FormatDateTime('HH', qryTherapist.Fields[10].AsDateTime);
                        if (id_schedule = '09') then
                            begin
                                 warna := clYellow;
                            end
                        else if (id_schedule = '11') then
                            begin
                                 warna := clGreen;
                            end
                        else if (id_schedule = '12') then
                            begin
                                 warna := clBlue;
                            end
                        else if (id_schedule = '14') then
                            begin
                                 warna := clRed;
                            end;
                        newRec := gtvTherapist.DataController.InsertRecord(gtvTherapist.DataController.RecordCount);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistID.Index, qryTherapist.Fields[0].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistDepartemen.Index, qryTherapist.Fields[1].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistNama.Index, qryTherapist.Fields[2].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistStatus.Index, qryTherapist.Fields[6].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistCounter.Index, qryTherapist.Fields[11].AsInteger);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistSchedule.Index, qryTherapist.Fields[10].AsDateTime);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistUrutan.Index, qryTherapist.Fields[3].AsInteger);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistType.Index, qryTherapist.Fields[13].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistSex.Index, qryTherapist.Fields[12].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistEndTime.Index, qryTherapist.Fields[8].AsDateTime);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistFlag.Index, warna);
                        gtvTherapist.DataController.PostEditingData;
                        gtvTherapist.DataController.Post;
                        qryTherapist.Next;
                   end;

          end;
end;

procedure TfrmTherapist.cxButton2Click(Sender: TObject);
var
   i, newRec : Integer;
   id_therapist, id_schedule : String;
   warna : Variant;
begin
     gtvTherapist.DataController.SelectAll;
     gtvTherapist.DataController.DeleteSelection;
     with dmDB do
          begin
               qryTherapist.Close;
               qryTherapist.SQL.Clear;
               qryTherapist.SQL.Add('select available_tr.*, ifnull((select jadwal.jam_masuk from jadwal ' +
                                    'where jadwal.id_karyawan = available_tr.id_therapist and ' +
				    'jadwal.tgl_masuk = CURRENT_DATE),"00:00:00") as wkt_masuk, ' +
                                    'ifnull((select count(trans_id) from trans_master '+
                                    'where tanggal = CURRENT_DATE and therapist_id = available_tr.id_therapist and '+
                                    'status_trans <> "CANCELED"), 0) as jml_krj, '+
                                    'ifnull((select karyawan.sex from karyawan ' +
                                    'where karyawan_id = available_tr.id_therapist ), "P") as sex, ' +
                                    'ifnull((select karyawan.type as tipe from karyawan ' +
                                    'where karyawan_id = available_tr.id_therapist ), "SEDANG") as tipe ' +
                                    'from available_tr where departemen <>  ''' +
                                     'SC' + ''' and status <> + ''' +
                                     'ISTIRAHAT' + ''' order by no_urut ASC');
               qryTherapist.Open;

               for i:=0 to qryTherapist.RecordCount-1 do
                   begin
                        id_schedule := FormatDateTime('HH', qryTherapist.Fields[10].AsDateTime);
                        if (id_schedule = '00') then
                            begin
                                 warna := clBlack;
                            end
                        else if (id_schedule = '09') then
                            begin
                                 warna := clRed;
                            end
                        else if (id_schedule = '11') then
                            begin
                                 warna := clYellow;
                            end
                        else if (id_schedule = '12') then
                            begin
                                 warna := clGreen;
                            end
                        else if (id_schedule = '14') then
                            begin
                                 warna := clBlue;
                            end;

                        newRec := gtvTherapist.DataController.InsertRecord(gtvTherapist.DataController.RecordCount);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistID.Index, qryTherapist.Fields[0].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistDepartemen.Index, qryTherapist.Fields[1].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistNama.Index, qryTherapist.Fields[2].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistStatus.Index, qryTherapist.Fields[6].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistCounter.Index, qryTherapist.Fields[11].AsInteger);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistSchedule.Index, qryTherapist.Fields[10].AsDateTime);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistUrutan.Index, qryTherapist.Fields[3].AsInteger);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistType.Index, qryTherapist.Fields[13].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistSex.Index, qryTherapist.Fields[12].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistEndTime.Index, qryTherapist.Fields[8].AsDateTime);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistFlag.Index, warna);
                        gtvTherapist.DataController.PostEditingData;
                        gtvTherapist.DataController.Post;
                        qryTherapist.Next;
                        Application.ProcessMessages;
                   end;

          end;
end;

end.
