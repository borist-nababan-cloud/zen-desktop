unit FStopTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DateUtils;

type
  TfrmStopOrder = class(TForm)
    cxGrid1: TcxGrid;
    gtbTransMaster: TcxGridDBBandedTableView;
    gtbTransMastertrans_id: TcxGridDBBandedColumn;
    gtbTransMastertanggal: TcxGridDBBandedColumn;
    gtbTransMasterwaktu: TcxGridDBBandedColumn;
    gtbTransMasterid_customer: TcxGridDBBandedColumn;
    gtbTransMasternama: TcxGridDBBandedColumn;
    gtbTransMasterpayment_via: TcxGridDBBandedColumn;
    gtbTransMasterpayment_ref: TcxGridDBBandedColumn;
    gtbTransMastersubtotal: TcxGridDBBandedColumn;
    gtbTransMasterdisc_percent: TcxGridDBBandedColumn;
    gtbTransMasterdisc_amount: TcxGridDBBandedColumn;
    gtbTransMastertotal: TcxGridDBBandedColumn;
    gtbTransMastertax_: TcxGridDBBandedColumn;
    gtbTransMastertax_amount: TcxGridDBBandedColumn;
    gtbTransMastergrandtotal: TcxGridDBBandedColumn;
    gtbTransMasternotes: TcxGridDBBandedColumn;
    gtbTransMasterstatus_trans: TcxGridDBBandedColumn;
    gtbTransMasterroom_id: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    gtbTransDetail: TcxGridDBBandedTableView;
    gtbTransDetailautonum: TcxGridDBBandedColumn;
    gtbTransDetailid_trans: TcxGridDBBandedColumn;
    gtbTransDetailtanggal: TcxGridDBBandedColumn;
    gtbTransDetailtrans_type_id: TcxGridDBBandedColumn;
    gtbTransDetailproduk_jasa_id: TcxGridDBBandedColumn;
    gtbTransDetailproduk_jasa_nama: TcxGridDBBandedColumn;
    gtbTransDetailstart_time: TcxGridDBBandedColumn;
    gtbTransDetailend_time: TcxGridDBBandedColumn;
    gtbTransDetailharga: TcxGridDBBandedColumn;
    gtbTransDetaildisc_amount: TcxGridDBBandedColumn;
    gtbTransDetaildisc_percent: TcxGridDBBandedColumn;
    gtbTransDetailsubtotal: TcxGridDBBandedColumn;
    gtbTransDetailteraphist_id: TcxGridDBBandedColumn;
    gtbTransDetailroom_id: TcxGridDBBandedColumn;
    gtbTransDetailquantity: TcxGridDBBandedColumn;
    gtbTransDetailaroma: TcxGridDBBandedColumn;
    gtbTransDetaillama: TcxGridDBBandedColumn;
    cxGrid2Level1: TcxGridLevel;
    cxButton1: TcxButton;
    procedure gtbTransMasterCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStopOrder: TfrmStopOrder;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmStopOrder.gtbTransMasterCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
   rec_select : Integer;
   trans_id   : String;
begin
     rec_select := gtbTransMaster.DataController.GetFocusedRecordIndex;
     trans_id := vartostr(gtbTransMaster.DataController.GetValue(rec_select, gtbTransMastertrans_id.Index));
     with dmDB do
          begin
               transDetail.Close;
               transDetail.SQL.Clear;
               transDetail.SQL.Add('select * from trans_detail where id_trans = ''' +
                                   trans_id + '''');
               transDetail.Open;
               gtbTransDetail.DataController.Refresh;
          end;
end;

procedure TfrmStopOrder.cxButton1Click(Sender: TObject);
var
   rec_select : Integer;
   trans_id   : String;
   lama       : Integer;
   selesai    : TTime;
   id_room, id_therapist, departemen_id : String;
begin
     rec_select := gtbTransMaster.DataController.GetFocusedRecordIndex;
     trans_id := vartostr(gtbTransMaster.DataController.GetValue(rec_select, gtbTransMastertrans_id.Index));
     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from trans_master where trans_id = '''  +
                                 trans_id + '''');
               qrySearch.Open;
               id_room := qrySearch.Fields[19].AsString;
               id_therapist := qrySearch.Fields[23].AsString;

               //lama := qrySearch.Fields[20].AsInteger;
               //selesai := Time;
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update trans_master set ' +
                                 'status_trans = ''' + 'FINISH' + ''', ' +
                                 'selesai = ''' + FormatDateTime('HH:MM:ss', Time) + ''' ' +
                                 'where trans_id = ''' + trans_id + '''');
               qryUpdate.ExecSql;
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update ruangan set ' +
                                 'status = ''' + 'AVAILABLE' + ''', ' +
                                 'start_time = ''' + '00:00:00' + ''', ' +
                                 'trans_id = ''' + 'NONE' + ''', ' +
                                 'therapist_id = ''' + 'NONE' + ''', ' +
                                 'end_time = ''' + '00:00:00' + ''' ' +
                                 'where ruangan_id = ''' + id_room + '''');
               qryUpdate.ExecSql;

               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select * from available_tr where id_therapist = ''' +
                               id_therapist + '''');
               qryCari.Open;

               departemen_id := qryCari.Fields[1].AsString;

               qryTemp.Close;
               qryTemp.SQL.Clear;
               qryTemp.SQL.Add('select * from istirahat where departemen_id = ''' +
                               departemen_id + '''');
               qryTemp.Open;

               lama := qryTemp.Fields[1].AsInteger;
               selesai := IncMinute(Time, lama);

               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update available_tr set ' +
                                 'status = ''' + 'ISTIRAHAT' + ''', ' +
                                 'start_time = ''' + FormatDateTime('HH:MM:ss', Time) + ''', ' +
                                 'end_time = ''' + FormatDateTime('HH:MM:ss', selesai) + ''', ' +
                                 'room_id = ''' + 'NONE' + ''' ' + 
                                 'where id_therapist = ''' + id_therapist + '''');
               qryUpdate.ExecSql;
               //ShowMessage('Update Therapist');


          end;
     Close;
end;

end.
