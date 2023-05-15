unit FPesan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCalendar, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, cxGridExportLink, ShellApi;

type
  TfrmPesan = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesan: TfrmPesan;

implementation

uses FDMDB;

{$R *.dfm}

end.
