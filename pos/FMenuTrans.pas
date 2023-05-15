unit FMenuTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxControls, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, cxPC,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc, ExtCtrls,
  cxGridDBTableView, cxTimeEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxColorComboBox, cxCheckBox, AppEvnts, cxLookAndFeels,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxBarBuiltInMenu,
  cxNavigator, MyAccess;

type
  TfrmMenuTrans = class(TForm)
    pgControl: TcxPageControl;
    pgJasa: TcxTabSheet;
    pgROOM: TcxTabSheet;
    cxGrid1: TcxGrid;
    gtbMenu: TcxGridDBBandedTableView;
    gtbMenumenu_id: TcxGridDBBandedColumn;
    gtbMenujasa_master_id: TcxGridDBBandedColumn;
    gtbMenujenis_jasa_id: TcxGridDBBandedColumn;
    gtbMenunama_menu: TcxGridDBBandedColumn;
    gtbMenustart_date: TcxGridDBBandedColumn;
    gtbMenuend_date: TcxGridDBBandedColumn;
    gtbMenustart_time: TcxGridDBBandedColumn;
    gtbMenuend_time: TcxGridDBBandedColumn;
    gtbMenuharga: TcxGridDBBandedColumn;
    gtbMenuwaktu: TcxGridDBBandedColumn;
    gtbMenudisc_value: TcxGridDBBandedColumn;
    gtbMenudisc_percent: TcxGridDBBandedColumn;
    gtbMenusubtotal: TcxGridDBBandedColumn;
    gtbMenunotes: TcxGridDBBandedColumn;
    gtbMenuaktif: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    btnSelectMenu: TcxButton;
    pgTherapist: TcxTabSheet;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    gtbRoom: TcxGridDBBandedTableView;
    gtbRoomruangan_id: TcxGridDBBandedColumn;
    gtbRoomlantai: TcxGridDBBandedColumn;
    gtbRoomnomor: TcxGridDBBandedColumn;
    gtbRoomjenis_jasa: TcxGridDBBandedColumn;
    gtbRoomnotes: TcxGridDBBandedColumn;
    gtbRoomkondisi: TcxGridDBBandedColumn;
    gtbRoomnama_cust: TcxGridDBBandedColumn;
    gtbRoomstart_time: TcxGridDBBandedColumn;
    gtbRoomend_time: TcxGridDBBandedColumn;
    gtbRoomtherapist_id: TcxGridDBBandedColumn;
    gtbRoomtrans_id: TcxGridDBBandedColumn;
    gtbRoomstatus: TcxGridDBBandedColumn;
    btnAll: TcxButton;
    btnAvailable: TcxButton;
    btnSelectRoom: TcxButton;
    XiPanel1: TPanel;
    Label5: TLabel;
    cxGrid3Level1: TcxGridLevel;
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
    btnSelectTR: TcxButton;
    pmMale: TPopupMenu;
    mnuMaleKuat: TMenuItem;
    mnuMaleSedang: TMenuItem;
    pmFemale: TPopupMenu;
    mnuFemaleKuat: TMenuItem;
    mnuFemaleSedang: TMenuItem;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton10: TcxButton;
    btnAllTR: TcxButton;
    gtvTherapist: TcxGridTableView;
    gtvTherapistID: TcxGridColumn;
    gtvTherapistDepartemen: TcxGridColumn;
    gtvTherapistNama: TcxGridColumn;
    gtvTherapistStatus: TcxGridColumn;
    gtvTherapistCounter: TcxGridColumn;
    gtvTherapistSchedule: TcxGridColumn;
    gtbTherapistCounter: TcxGridDBBandedColumn;
    gtbTherapistSchedule: TcxGridDBBandedColumn;
    btnCount: TcxButton;
    gtbTherapistFlag: TcxGridDBBandedColumn;
    gtvTherapistUrutan: TcxGridColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    lblPaketID: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Waktu: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edJasaID: TcxTextEdit;
    edJasaNama: TcxTextEdit;
    edLama: TcxCalcEdit;
    edHarga: TcxCalcEdit;
    edRoomID: TcxTextEdit;
    edTherapist: TcxTextEdit;
    btnFinish: TcxButton;
    edAroma: TcxLookupComboBox;
    edDiscount: TcxCalcEdit;
    btnCancel: TcxButton;
    gtvTherapistType: TcxGridColumn;
    gtvTherapistSex: TcxGridColumn;
    gtvTherapistEndTime: TcxGridColumn;
    gtvTherapistFlag: TcxGridColumn;
    gtvTherapistTest: TcxGridColumn;
    btnViewTR: TcxButton;
    ApplicationEvents1: TApplicationEvents;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure btnSelectMenuClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure btnAvailableClick(Sender: TObject);
    procedure btnSelectRoomClick(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure btnAllTRClick(Sender: TObject);
    procedure btnSelectTRClick(Sender: TObject);
    procedure mnuMaleKuatClick(Sender: TObject);
    procedure mnuMaleSedangClick(Sender: TObject);
    procedure mnuFemaleKuatClick(Sender: TObject);
    procedure mnuFemaleSedangClick(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure gtbMenuCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure gtbRoomDblClick(Sender: TObject);
    procedure gtbTherapistDblClick(Sender: TObject);
    procedure gtvTherapistDblClick(Sender: TObject);
    procedure btnViewTRClick(Sender: TObject);
    procedure ApplicationEvents1ShortCut(var Msg: TWMKey;
      var Handled: Boolean);
  private
    { Private declarations }
    qrySearch, qryTemp, qryFind, qryCari, qryRoom, qryTherapist :  TMyQuery;
  public
    { Public declarations }
    JASA_ID, DEPT_ID, PAKET_ID : String;

  end;

var
  frmMenuTrans: TfrmMenuTrans;

implementation

uses FDMDB, FPos;

{$R *.dfm}

procedure TfrmMenuTrans.btnSelectMenuClick(Sender: TObject);
var
   rec_select : Integer;
begin
     //edAroma.SetFocus;
     rec_select := gtbMenu.DataController.GetFocusedRecordIndex;
     JASA_ID := vartostr(gtbMenu.DataController.GetValue(rec_select, gtbMenujenis_jasa_id.Index));
     if (JASA_ID = 'BM') then
         begin
              DEPT_ID := 'TB';
         end
     else if (JASA_ID = 'RF') then
         begin
              DEPT_ID := 'TR';
         end;
     //lblJenisJasa.Caption := JASA_ID + ' ' + DEPT_ID;
     
     edJasaID.Text := vartostr(gtbMenu.DataController.GetValue(rec_select, gtbMenumenu_id.Index));

     edJasaID.Text := jasa_id;
     edJasaNama.Text := vartostr(gtbMenu.DataController.GetValue(rec_select, gtbMenunama_menu.Index));
     edHarga.EditValue := gtbMenu.DataController.GetValue(rec_select, gtbMenuharga.Index);
     edLama.EditValue := gtbMenu.DataController.GetValue(rec_select, gtbMenuwaktu.Index);

               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from paket where paket_id = ''' +
                                lblPaketID.Caption + '''');
               qrySearch.Open;
               //ShowMessage(inttostr(qrySearch.RecordCount));
               //ShowMessage(qrySearch.Fields[0].AsString);
               if (JASA_ID = 'RF') then
                   begin
                        edDiscount.EditValue := qrySearch.Fields[4].AsFloat;
                   end
               else if (JASA_ID = 'BM') then
                   begin
                        edDiscount.EditValue := qrySearch.Fields[5].AsFloat;
                   end;


               qryRoom.Close;
               qryRoom.SQL.Clear;
               qryRoom.SQL.Add('select * from ruangan where jenis_jasa = ''' +
                               JASA_ID + ''' and status = ''' +
                               'AVAILABLE' + ''' order by nomor ASC ');
               qryRoom.Open;
               //qryRoom.First;
               gtbRoom.DataController.Refresh;
               gtbRoom.DataController.GotoFirst;

     pgControl.ActivePage := pgROOM;
     
end;

procedure TfrmMenuTrans.btnAllClick(Sender: TObject);
begin
     with dmDB do
          begin
               qryRoom.Close;
               qryRoom.SQL.Clear;
               qryRoom.SQL.Add('select * from ruangan where jenis_jasa = ''' +
                               JASA_ID + ''' order by ruangan_id ASC ');
               qryRoom.Open;
               //qryRoom.First;
               gtbRoom.DataController.Refresh;
               gtbRoom.DataController.GotoFirst;
          end;
end;

procedure TfrmMenuTrans.btnAvailableClick(Sender: TObject);
begin
      with dmDB do
          begin
               qryRoom.Close;
               qryRoom.SQL.Clear;
               qryRoom.SQL.Add('select * from ruangan where jenis_jasa = ''' +
                               JASA_ID + ''' and status = ''' +
                               'AVAILABLE' + ''' order by ruangan_id ASC ');
               qryRoom.Open;
               //qryRoom.First;
               gtbRoom.DataController.Refresh;
               gtbRoom.DataController.GotoFirst;
          end;
end;

procedure TfrmMenuTrans.btnSelectRoomClick(Sender: TObject);
 var
    rec_select, newRec, i : Integer;
    id_schedule : String;
    warna : Variant;
begin
     //edAroma.SetFocus;
     rec_select := gtbRoom.DataController.GetFocusedRecordIndex;
     edRoomID.Text := VarToStr(gtbRoom.DataController.GetValue(rec_select, gtbRoomruangan_id.Index));
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
                                    'from available_tr where departemen =  ''' +
                                     DEPT_ID + ''' and status = + ''' +
                                     'AVAILABLE' + ''' order by no_urut ASC');
               qryTherapist.Open;
               gtvTherapist.DataController.SelectAll;
               gtvTherapist.DataController.DeleteSelection;

               for i:=0 to qryTherapist.RecordCount-1 do
                   begin
                        id_schedule := FormatDateTime('HH', qryTherapist.Fields[10].AsDateTime);
                        if (id_schedule = '09') then
                            begin
                                 warna := clGreen;
                            end
                        else if (id_schedule = '11') then
                            begin
                                 warna := clYellow;
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
     pgControl.ActivePage := pgTherapist;
     
end;

procedure TfrmMenuTrans.cxButton6Click(Sender: TObject);
begin
     with dmDB do
          begin
               qryTherapist.Close;
               qryTherapist.SQL.Clear;
               qryTherapist.SQL.Add('select * from available_tr where status = ''' +
                                     'AVAILABLE' + ''' and departemen = ''' +
                                     DEPT_ID + ''' order by no_urut ASC');
               qryTherapist.Open;
               qryTherapist.First;
               edTherapist.Text := qryTherapist.Fields[0].AsString;
          end;


end;

procedure TfrmMenuTrans.btnAllTRClick(Sender: TObject);
var
   i, newRec : Integer;
   id_schedule : String;
   warna : Variant;
begin
     //rec_select := gtbRoom.DataController.GetFocusedRecordIndex;
     //edRoomID.Text := VarToStr(gtbRoom.DataController.GetValue(rec_select, gtbRoomruangan_id.Index));
     gtvTherapist.DataController.SelectAll;
     gtvTherapist.DataController.DeleteSelection;
     with dmDB do
          begin
               qryTherapist.Close;
               qryTherapist.SQL.Clear;
               {qryTherapist.SQL.Add('select available_tr.*, ifnull((select jadwal.jam_masuk from jadwal ' +
                                    'where jadwal.id_karyawan = available_tr.id_therapist and ' +
				    'jadwal.tgl_masuk = CURRENT_DATE),"00:00:00") as wkt_masuk, ' +
                                    'ifnull((select count(trans_id) from trans_master '+
                                    'where tanggal = CURRENT_DATE and therapist_id = available_tr.id_therapist and '+
                                    'status_trans <> "CANCELED"), 0) as jml_krj, '+
                                    'ifnull((select karyawan.sex from karyawan ' +
                                    'where karyawan_id = available_tr.id_therapist ), "P") as sex, ' +
                                    'ifnull((select karyawan.type as tipe from karyawan ' +
                                    'where karyawan_id = available_tr.id_therapist ), "SEDANG") as tipe ' +
                                    'from available_tr where departemen =  ''' +
                                     DEPT_ID + ''' and status <> + ''' +
                                     'ISTIRAHAT' + ''' order by no_urut ASC');}
               qryTherapist.SQL.Add('select idkaryawan, namakaryawan, departemen from ben_hrd_karyawan_info where departemen =  ''' +
                                     DEPT_ID + '''');
               qryTherapist.Open;

               for i:=0 to qryTherapist.RecordCount-1 do
                   begin
                        {id_schedule := FormatDateTime('HH', qryTherapist.Fields[10].AsDateTime);
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
                            end;}

                        newRec := gtvTherapist.DataController.InsertRecord(gtvTherapist.DataController.RecordCount);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistID.Index, qryTherapist.Fields[0].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistDepartemen.Index, qryTherapist.Fields[2].AsString);
                        gtvTherapist.DataController.SetValue(newRec, gtvTherapistNama.Index, qryTherapist.Fields[1].AsString);
                        //gtvTherapist.DataController.SetValue(newRec, gtvTherapistStatus.Index, qryTherapist.Fields[6].AsString);
                        //gtvTherapist.DataController.SetValue(newRec, gtvTherapistCounter.Index, qryTherapist.Fields[11].AsInteger);
                        //gtvTherapist.DataController.SetValue(newRec, gtvTherapistSchedule.Index, qryTherapist.Fields[10].AsDateTime);
                        //gtvTherapist.DataController.SetValue(newRec, gtvTherapistUrutan.Index, qryTherapist.Fields[3].AsInteger);
                        //gtvTherapist.DataController.SetValue(newRec, gtvTherapistType.Index, qryTherapist.Fields[13].AsString);
                        //gtvTherapist.DataController.SetValue(newRec, gtvTherapistSex.Index, qryTherapist.Fields[2].AsString);
                        //gtvTherapist.DataController.SetValue(newRec, gtvTherapistEndTime.Index, qryTherapist.Fields[8].AsDateTime);
                        //gtvTherapist.DataController.SetValue(newRec, gtvTherapistFlag.Index, warna);
                        gtvTherapist.DataController.PostEditingData;
                        gtvTherapist.DataController.Post;
                        qryTherapist.Next;
                        Application.ProcessMessages;
                   end;

          end;
end;

procedure TfrmMenuTrans.btnSelectTRClick(Sender: TObject);
var
   rec_select : Integer;
begin
     //gtbTherapist.DataController.GotoFirst;
     rec_select := gtvTherapist.DataController.GetFocusedRecordIndex;
     edTherapist.Text := vartostr(gtvTherapist.DataController.GetValue(rec_select, gtvTherapistID.Index));
     edAroma.SetFocus;
end;

procedure TfrmMenuTrans.mnuMaleKuatClick(Sender: TObject);
var
   i : Integer;
begin
     with dmDB do
          begin
               qryTherapist.Refresh;
               qryTherapist.First;
               for i:=0 to qryTherapist.RecordCount-1 do
                   begin
                        qrySearch.Close;
                        qrySearch.SQL.Clear;
                        qrySearch.SQL.Add('select * from karyawan where karyawan_id = ''' +
                                         qryTherapist.Fields[0].AsString + '''');
                        qrySearch.Open;
                        if ((qrySearch.Fields[6].AsString = 'L') AND (qrySearch.Fields[15].AsString = 'KUAT')) then
                             begin
                                  edTherapist.Text := qrySearch.Fields[0].AsString;
                                  exit;
                             end
                        else
                            begin
                                 qryTherapist.Next;
                            end;
                   end;
          end;
end;

procedure TfrmMenuTrans.mnuMaleSedangClick(Sender: TObject);
var
   i : Integer;
begin
     with dmDB do
          begin
               qryTherapist.Refresh;
               qryTherapist.First;
               for i:=0 to qryTherapist.RecordCount-1 do
                   begin
                        qrySearch.Close;
                        qrySearch.SQL.Clear;
                        qrySearch.SQL.Add('select * from karyawan where karyawan_id = ''' +
                                         qryTherapist.Fields[0].AsString + '''');
                        qrySearch.Open;
                        if ((qrySearch.Fields[6].AsString = 'L') AND (qrySearch.Fields[15].AsString = 'SEDANG')) then
                             begin
                                  edTherapist.Text := qrySearch.Fields[0].AsString;
                                  exit;
                             end
                        else
                            begin
                                 qryTherapist.Next;
                            end;
                   end;
          end;
end;

procedure TfrmMenuTrans.mnuFemaleKuatClick(Sender: TObject);
var
   i : Integer;
begin
     with dmDB do
          begin
               qryTherapist.Refresh;
               qryTherapist.First;
               for i:=0 to qryTherapist.RecordCount-1 do
                   begin
                        qrySearch.Close;
                        qrySearch.SQL.Clear;
                        qrySearch.SQL.Add('select * from karyawan where karyawan_id = ''' +
                                         qryTherapist.Fields[0].AsString + '''');
                        qrySearch.Open;
                        if ((qrySearch.Fields[6].AsString = 'P') AND (qrySearch.Fields[15].AsString = 'KUAT')) then
                             begin
                                  edTherapist.Text := qrySearch.Fields[0].AsString;
                                  exit;
                             end
                        else
                            begin
                                 qryTherapist.Next;
                            end;
                   end;
          end;
end;

procedure TfrmMenuTrans.mnuFemaleSedangClick(Sender: TObject);
var
   i : Integer;
begin
     with dmDB do
          begin
               qryTherapist.Refresh;
               qryTherapist.First;
               for i:=0 to qryTherapist.RecordCount-1 do
                   begin
                        qrySearch.Close;
                        qrySearch.SQL.Clear;
                        qrySearch.SQL.Add('select * from karyawan where karyawan_id = ''' +
                                         qryTherapist.Fields[0].AsString + '''');
                        qrySearch.Open;
                        if ((qrySearch.Fields[6].AsString = 'P') AND (qrySearch.Fields[15].AsString = 'SEDANG')) then
                             begin
                                  edTherapist.Text := qrySearch.Fields[0].AsString;
                                  exit;
                             end
                        else
                            begin
                                 qryTherapist.Next;
                            end;
                   end;
          end;
end;

procedure TfrmMenuTrans.btnFinishClick(Sender: TObject);
var
   newRec : Integer;
   subtotal : Double;
begin
     subtotal := edHarga.EditValue - (edDiscount.EditValue / 100 * edHarga.EditValue);
     with frmPos do
          begin
               edTherapistPos.Text := edTherapist.Text;
               newRec := gtvDetail.DataController.InsertRecord(gtvDetail.DataController.RecordCount);
               gtvDetail.DataController.SetValue(newRec, gtvDetailTransType.Index, 'BJ');
               gtvDetail.DataController.SetValue(newRec, gtvDetailIDJasa.Index, edJasaID.Text);
               gtvDetail.DataController.SetValue(newRec, gtvDetailNamaJasa.Index, edJasaNama.Text);
               gtvDetail.DataController.SetValue(newRec, gtvDetailStart.Index, '00:00:00');
               gtvDetail.DataController.SetValue(newRec, gtvDetailEnd.Index, '00:00:00');
               gtvDetail.DataController.SetValue(newRec, gtvDetailDiscPercent.Index, edDiscount.EditValue);
               gtvDetail.DataController.SetValue(newRec, gtvDetailDiscAmount.Index, 0);
               gtvDetail.DataController.SetValue(newRec, gtvDetailSubtotal.Index, subtotal);
               gtvDetail.DataController.SetValue(newRec, gtvDetailTherapist.Index, edTherapist.Text);
               gtvDetail.DataController.SetValue(newRec, gtvDetailRoom.Index, edRoomID.Text);
               gtvDetail.DataController.SetValue(newRec, gtvDetailAroma.Index, edAroma.Text);
               gtvDetail.DataController.SetValue(newRec, gtvDetailQty.Index, 1);
               gtvDetail.DataController.SetValue(newRec, gtvDetailHarga.Index, edHarga.EditValue);
               gtvDetail.DataController.SetValue(newRec, gtvDetailLama.Index, edLama.EditValue);
               gtvDetail.DataController.PostEditingData;
               gtvDetail.DataController.Post;
               edIDRoomPos.Text := edRoomID.Text;
               edTherapistPos.Text := edTherapist.Text;
          end;
     Close;

end;

procedure TfrmMenuTrans.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmMenuTrans.gtbMenuCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
     btnSelectMenu.Click;
end;

procedure TfrmMenuTrans.gtbRoomDblClick(Sender: TObject);
begin
     btnSelectRoom.Click;
end;

procedure TfrmMenuTrans.gtbTherapistDblClick(Sender: TObject);
var
   rec_select : Integer;
begin
     rec_select := gtbTherapist.DataController.GetFocusedRecordIndex;
     edTherapist.Text := vartostr(gtbTherapist.DataController.GetValue(rec_select, gtbTherapistid_therapist.Index));
end;

procedure TfrmMenuTrans.gtvTherapistDblClick(Sender: TObject);
begin
     btnSelectTR.Click;
end;

procedure TfrmMenuTrans.btnViewTRClick(Sender: TObject);
var
   i, newRec : Integer;
   id_schedule : String;
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
                                    'from available_tr where departemen =  ''' +
                                     DEPT_ID + ''' and status = + ''' +
                                     'AVAILABLE' + ''' order by no_urut ASC');
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

procedure TfrmMenuTrans.ApplicationEvents1ShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
     if (Msg.CharCode = Ord('J')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnSelectMenu.Click;
              Handled := True;
         end;
     {if (Msg.CharCode = Ord('I')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnFinish.Click;
              Handled := true;
         end;
     if (Msg.CharCode = Ord('N')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnCancel.Click;
              Handled := True;
         end;}
     if (Msg.CharCode = Ord('O')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnSelectRoom.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('W')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnAvailable.Click;
              Handled := True;
         end;
         
     if (Msg.CharCode = Ord('L')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnAll.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('K')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnAllTR.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('Q')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnViewTR.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('D')) and (GetKeyState(VK_CONTROL) < 0) then
         begin
              btnSelectTR.Click;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('A')) and (GetKeyState(VK_SHIFT) < 0) then
         begin
              frmMenuTrans.cxGrid1.SetFocus;
              gtbMenu.DataController.GotoFirst;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('R')) and (GetKeyState(VK_SHIFT) < 0) then
         begin
              frmMenuTrans.cxGrid2.SetFocus;
              gtbMenu.DataController.GotoFirst;
              Handled := True;
         end;
     if (Msg.CharCode = Ord('T')) and (GetKeyState(VK_SHIFT) < 0) then
         begin
              frmMenuTrans.cxGrid3.SetFocus;
              gtbMenu.DataController.GotoFirst;
              Handled := True;
         end;
end;

end.
