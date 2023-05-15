unit FJadwalOutlet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBLookupComboBox, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  Vcl.ComCtrls, dxCore, cxDateUtils, MyAccess, MemDS;

type
  TfrmJadwalOutlet = class(TForm)
    qryJadwal: TMyQuery;
    dsQryJadwal: TDataSource;
    gtbJadwal: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbJadwalautonum: TcxGridDBColumn;
    gtbJadwalkodekaryawan: TcxGridDBColumn;
    gtbJadwalidkaryawan: TcxGridDBColumn;
    gtbJadwalidoutlet: TcxGridDBColumn;
    gtbJadwalkodeshift: TcxGridDBColumn;
    gtbJadwaljmasuk: TcxGridDBColumn;
    gtbJadwaljkeluar: TcxGridDBColumn;
    gtbJadwalnotes: TcxGridDBColumn;
    gtbJadwalisupload: TcxGridDBColumn;
    Label1: TLabel;
    edStart: TcxDateEdit;
    Label2: TLabel;
    edEnd: TcxDateEdit;
    btnSearch: TButton;
    Button1: TButton;
    gtbJadwalnamakaryawan: TcxGridDBColumn;
    gtbJadwaltglmasuk: TcxGridDBColumn;
    gtbJadwaltglkeluar: TcxGridDBColumn;
    gtbJadwallasteditdate: TcxGridDBColumn;
    gtbJadwallastedituser: TcxGridDBColumn;
    gtbJadwaltagedit: TcxGridDBColumn;
    btnChangeJadwal: TButton;
    Label3: TLabel;
    tblShift: TMyTable;
    dsTblShift: TDataSource;
    gtbJadwaldepartemen: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnChangeJadwalClick(Sender: TObject);
  private
    { Private declarations }
    qryJadwal1, qryJadwal2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmJadwalOutlet: TfrmJadwalOutlet;

implementation

{$R *.dfm}

uses FdmDB, FJadwalOutletAdd, FJadwalOutletChange;

procedure TfrmJadwalOutlet.btnChangeJadwalClick(Sender: TObject);
var
  recSelect : Integer;
  kodeKaryawan, idKaryawan, namaKaryawan, idShift : String;
  tglMasuk : TDate;
begin
   recSelect := gtbJadwal.DataController.GetFocusedRecordIndex;
   if (recSelect < 0) then Exit;
   kodeKaryawan := vartostr(gtbJadwal.DataController.GetValue(recSelect, gtbJadwalkodekaryawan.Index));
   idKaryawan := vartostr(gtbJadwal.DataController.GetValue(recSelect, gtbJadwalidkaryawan.Index));
   namaKaryawan := vartostr(gtbJadwal.DataController.GetValue(recSelect, gtbJadwalnamakaryawan.Index));
   idShift := vartostr(gtbJadwal.DataController.GetValue(recSelect, gtbJadwalkodeshift.Index));
   tglMasuk := VarToDateTime(gtbJadwal.DataController.GetValue(recSelect, gtbJadwaltglmasuk.Index));
   Application.CreateForm(TfrmJadwalOutletChange, frmJadwalOutletChange);
   qryJadwal1.Close;
   qryJadwal1.SQL.Clear;
   qryJadwal1.SQL.Add('select kodekaryawan, kodeshift, tglmasuk, jmasuk, ' +
         'tglkeluar, jkeluar from ben_hrd_jadwal_local where ' +
         'kodekaryawan = ''' + kodeKaryawan + ''' AND tglmasuk = ''' +
         FormatDateTime('yyyy-MM-dd', tglMasuk) + '''');
   qryJadwal1.Open;
   with frmJadwalOutletChange do
     begin
       edKode.Text := qryJadwal1.Fields[0].AsString;
       edID.Text := idKaryawan;
       edNama.Text := namaKaryawan;
       edtglMasuk.Date := tglMasuk;
       edJMasuk.Time := qryJadwal1.Fields[3].AsDateTime;
       edJamKeluar.Time := qryJadwal1.Fields[5].AsDateTime;
       edTglKeluar.Date := qryJadwal1.Fields[4].AsDateTime;
     end;
   frmJadwalOutletChange.Show;
   frmJadwalOutletChange.Position := poDesktopCenter;
end;

procedure TfrmJadwalOutlet.btnSearchClick(Sender: TObject);
begin
  qryJadwal.Close;
  qryJadwal.SQL.Clear;
  qryJadwal.SQL.Add('select *, ' +
      '(select ben_hrd_karyawan_info.idkaryawan from ben_hrd_karyawan_info ' +
      'where ben_hrd_karyawan_info.kodekaryawan = ben_hrd_jadwal_local.kodekaryawan) as idkaryawan, ' +
      '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan_info ' +
      'where ben_hrd_karyawan_info.kodekaryawan = ben_hrd_jadwal_local.kodekaryawan) as namakaryawan, ' +
      '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info ' +
      'where ben_hrd_karyawan_info.kodekaryawan = ben_hrd_jadwal_local.kodekaryawan) as departemen ' +
      'from ben_hrd_jadwal_local ' +
      'where tglmasuk >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' and tglmasuk <= ''' +
      FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
  qryJadwal.Open;
  gtbJadwal.DataController.Refresh;
end;

procedure TfrmJadwalOutlet.Button1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmJadwalOutletAdd, frmJadwalOutletAdd);
   frmJadwalOutletAdd.Show;
   frmJadwalOutletAdd.Position := poDesktopCenter;
end;

procedure TfrmJadwalOutlet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryJadwal1.Free;
  qryJadwal2.Free;
  qryExec.Free;
  //qryJadwal.Active := False;
  Action := caFree;
end;

procedure TfrmJadwalOutlet.FormCreate(Sender: TObject);
begin
   edStart.Date := Date;
   edEnd.Date := Date;
   qryJadwal.Active := True;
   gtbJadwal.DataController.Refresh;

  qryJadwal1 := TMyQuery.Create(Self);
  qryJadwal1.Connection := DMDB.dbInternal;
  qryJadwal1.SQL.Add('select * from temptable');
  qryJadwal1.Active := true;

  qryJadwal2 := TMyQuery.Create(Self);
  qryJadwal2.Connection := DMDB.dbInternal;
  qryJadwal2.SQL.Add('select * from temptable');
  qryJadwal2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  tblShift.Active := True;

end;

end.
