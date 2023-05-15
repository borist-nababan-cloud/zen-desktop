unit FJadwalAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainSource, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DB,
  DBAccess, StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ExtCtrls,
  cxDBLookupComboBox, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MyAccess, MemDS;

type
  TfrmJadwalAll = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    btnSearch: TButton;
    qryJadwal: TMyQuery;
    dsQryJadwal: TDataSource;
    cxGrid1: TcxGrid;
    gtbJadwal: TcxGridDBTableView;
    gtbJadwalautonum: TcxGridDBColumn;
    gtbJadwalkodekaryawan: TcxGridDBColumn;
    gtbJadwalidkaryawan: TcxGridDBColumn;
    gtbJadwalnamakaryawan: TcxGridDBColumn;
    gtbJadwalidoutlet: TcxGridDBColumn;
    gtbJadwalkodeshift: TcxGridDBColumn;
    gtbJadwaltanggal: TcxGridDBColumn;
    gtbJadwaljmasuk: TcxGridDBColumn;
    gtbJadwaljkeluar: TcxGridDBColumn;
    gtbJadwalnotes: TcxGridDBColumn;
    gtbJadwalisupload: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    lblStatus: TLabel;
    tblOutlet: TMyTable;
    dsTblOutlet: TDataSource;
    tmrLogin: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmrLoginTimer(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    INTLOGINSERVER : Integer;
  public
    { Public declarations }
  end;

var
  frmJadwalAll: TfrmJadwalAll;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmJadwalAll.btnSearchClick(Sender: TObject);
begin
  qryJadwal.Close;
  qryJadwal.SQL.Clear;
  qryJadwal.SQL.Add('select *, ' +
      '(select hrd_karyawan_info.idkaryawan from hrd_karyawan_info ' +
      'where hrd_karyawan_info.kodekaryawan = hrd_jadwal_local.kodekaryawan) as idkaryawan, ' +
      '(select hrd_karyawan_info.namakaryawan from hrd_karyawan_info ' +
      'where hrd_karyawan_info.kodekaryawan = hrd_jadwal_local.kodekaryawan) as namakaryawan ' +
      'from hrd_jadwal_local ' +
      'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' and tanggal <= ''' +
      FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
  qryJadwal.Open;
  gtbJadwal.DataController.Refresh;
end;

procedure TfrmJadwalAll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblOutlet.Active := False;
  qryJadwal.Active := False;
  Action := caFree;
end;

procedure TfrmJadwalAll.FormCreate(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   edStart.Date := Date;
   edEnd.Date := Date;
   {qryJadwal.Active := True;
   gtbJadwal.DataController.Refresh;}
   INTLOGINSERVER := 0;
   tmrLogin.Enabled := True;
   lblStatus.Caption := 'Please wait, dtry to connecting to Server';
   Application.ProcessMessages;
   //frmJadwalAll.Enabled := False;
end;

procedure TfrmJadwalAll.tmrLoginTimer(Sender: TObject);
begin
   {INTLOGINSERVER := INTLOGINSERVER + 1;
   if (INTLOGINSERVER = 2) then
     begin
       frmMain.LoginServer;
       if (frmMain.SERVERLIVE = True) then
         begin
           if (CekPayed = True) then
             begin
               lblStatus.Caption := 'Server Ready...';
               Screen.Cursor := crDefault;
               btnSearch.Enabled := True;
               tblOutlet.Active := True;
               qryJadwal.Active := True;
               tmrLogin.Enabled := False;
             end
           else if (CekPayed = False) then
             begin
               lblStatus.Caption := 'Server Not Ready, Please Try Again Later';
               Screen.Cursor := crDefault;
               btnSearch.Enabled := False;
             end;
         end
       else if (frmMenuMain.SERVERLIVE = False) then
         begin
           lblStatus.Caption := 'Server Not Ready, Please Try Again Later';
           Screen.Cursor := crDefault;
           btnSearch.Enabled := False;
           tmrLogin.Enabled := False;
         end;
     end;}

end;

end.
