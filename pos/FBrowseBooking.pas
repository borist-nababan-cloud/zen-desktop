unit FBrowseBooking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCalendar, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls,cxGridExportLink, ShellApi;

type
  TfrmBrowseBooking = class(TForm)
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    gtvBooking: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    btnExport: TcxButton;
    dlgSave: TSaveDialog;
    gtvBookingid_booking: TcxGridDBColumn;
    gtvBookingtanggal: TcxGridDBColumn;
    gtvBookingtgl_booking: TcxGridDBColumn;
    gtvBookingjam_booking: TcxGridDBColumn;
    gtvBookingnama: TcxGridDBColumn;
    gtvBookingno_telp: TcxGridDBColumn;
    gtvBookingjumlah: TcxGridDBColumn;
    gtvBookingnotes: TcxGridDBColumn;
    Panel4: TPanel;
    btnSelect: TcxButton;
    procedure btnSelectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowseBooking: TfrmBrowseBooking;

implementation

uses FDMDB, FBooking;

{$R *.dfm}

procedure TfrmBrowseBooking.btnSelectClick(Sender: TObject);
var
   recSelect : integer;
   id_booking : String;
begin
  with frmBooking do
   begin
     with dmDB do
        begin
             ClearForm;
             recSelect := gtvBooking.DataController.GetFocusedRecordIndex;
             id_booking:= gtvBooking.DataController.GetValue(recSelect, gtvBookingid_booking.Index);
             qrySearch.Close;
             qrySearch.SQL.Clear;
             qrySearch.SQL.Add('SELECT * FROM booking ' +
                               'WHERE id_booking = ''' + id_booking + '''');
             qrySearch.Open;
             edTrans.Text:= id_booking;
             edTgl.EditValue:= qrySearch.Fields[2].AsDateTime;
             edWaktu.EditValue:= qrySearch.Fields[3].AsDateTime;
             edNama.Text := qrySearch.Fields[4].AsString;
             edTelp.Text := qrySearch.Fields[5].AsString;
             edJumlah.EditValue := qrySearch.Fields[6].AsInteger;
             edNotes.Text:= qrySearch.Fields[7].AsString;
             btnNewB.Tag := 0;
             btnNewB.Caption := 'New';
             frmBrowseBooking.Close;
        end;
   end;
end;

end.
