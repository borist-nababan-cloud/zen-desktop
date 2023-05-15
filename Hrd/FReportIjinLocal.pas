unit FReportIjinLocal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBLookupComboBox;

type
  TfrmReportIjinLocal = class(TForm)
    Label1: TLabel;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    btnSearch: TButton;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListkodekaryawan: TcxGridDBColumn;
    gtbListidkaryawan: TcxGridDBColumn;
    gtbListidoutlet: TcxGridDBColumn;
    gtbListkodeijin: TcxGridDBColumn;
    gtbListtanggal: TcxGridDBColumn;
    gtbListketerangan: TcxGridDBColumn;
    gtbListnamakaryawan: TcxGridDBColumn;
    tblOutlet: TMyTable;
    dsTblOutlet: TDataSource;
    btnEdit: TButton;
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportIjinLocal: TfrmReportIjinLocal;

implementation

{$R *.dfm}

uses FdmDB, FMenuMain, FIjinAdd;

procedure TfrmReportIjinLocal.btnEditClick(Sender: TObject);
var
  recSelect : Integer;
  tglData : TDate;
  kodeKaryawan, keterangan, parameter : String;
begin
  recSelect := gtbList.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  tglData := gtbList.DataController.GetValue(recSelect, gtbListtanggal.Index);
  kodeKaryawan := vartostr(gtbList.DataController.GetValue(recSelect, gtbListkodekaryawan.Index));
  keterangan := vartostr(gtbList.DataController.GetValue(recSelect, gtbListketerangan.Index));
  parameter := vartostr(gtbList.DataController.GetValue(recSelect, gtbListkodeijin.Index));
  Application.CreateForm(TfrmIjinAdd, frmIjinAdd);
  frmIjinAdd.edNamaKaryawan.EditValue := kodeKaryawan;
  frmIjinAdd.edTanggal.Date := tglData;
  frmIjinAdd.edParameter.EditValue := parameter;
  frmIjinAdd.edKeterangan.Text := keterangan;
  frmIjinAdd.edNamaKaryawan.Properties.ReadOnly := True;
  frmIjinAdd.edTanggal.Properties.ReadOnly := True;
  frmIjinAdd.btnSimpan.Visible := False;
  frmIjinAdd.btnUpdate.Visible := True;
  frmIjinAdd.Show;
end;

procedure TfrmReportIjinLocal.btnSearchClick(Sender: TObject);
begin
  qryList.Close;
  qryList.SQL.Clear;
  qryList.SQL.Add('select kodekaryawan, idoutlet, kodeijin, ' +
         'tanggal, keterangan, (select hrd_karyawan_info.idkaryawan ' +
         'from hrd_karyawan_info where hrd_karyawan_info.kodekaryawan = ' +
         'hrd_ijin.kodekaryawan) as idkaryawan, (select hrd_karyawan_info.namakaryawan ' +
         'from hrd_karyawan_info where hrd_karyawan_info.kodekaryawan = hrd_ijin.kodekaryawan) ' +
         'as namakaryawan from hrd_ijin where hrd_ijin.tanggal >= ''' +
         FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND hrd_ijin.tanggal <= ''' +
         FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
  qryList.Open;
  gtbList.DataController.Refresh;
end;

procedure TfrmReportIjinLocal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryList.Active := False;
  tblOutlet.Active := False;
  Action := caFree;
end;

procedure TfrmReportIjinLocal.FormCreate(Sender: TObject);
begin
  edStart.Date := Date;
  edEnd.Date := Date;
  qryList.Active := True;
  tblOutlet.Active := True;
  gtbList.DataController.Refresh;
end;

end.
