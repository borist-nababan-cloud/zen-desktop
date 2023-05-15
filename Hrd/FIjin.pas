unit FIjin;

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
  cxCalendar;

type
  TfrmIjin = class(TForm)
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
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIjin: TfrmIjin;

implementation

{$R *.dfm}

uses FdmDB, FMenuMain, FIjinAdd;

procedure TfrmIjin.btnSearchClick(Sender: TObject);
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

procedure TfrmIjin.FormCreate(Sender: TObject);
begin
  edStart.Date := Date;
  edEnd.Date := Date;
  qryList.Active := True;
end;

end.
