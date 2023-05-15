unit FLapLembur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, DB, DBAccess, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGridExportLink, ShellApi, cxMemo,
  cxDBLookupComboBox, cxLookupEdit, cxDBLookupEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MyAccess, MemDS;

type
  TfrmLaplembur = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    cxButton1: TcxButton;
    Label3: TLabel;
    qryAbsen: TMyQuery;
    dsQryAbsen: TDataSource;
    gtbAbsen: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    btnExpand: TButton;
    Button2: TButton;
    dlgSave: TSaveDialog;
    tblDivisi: TMyTable;
    dsTblDivisi: TDataSource;
    gtbAbsenkodekaryawan: TcxGridDBColumn;
    gtbAbsenidkaryawan: TcxGridDBColumn;
    gtbAbsenketerangan: TcxGridDBColumn;
    gtbAbsenlasteditdate: TcxGridDBColumn;
    gtbAbsenlastedituser: TcxGridDBColumn;
    gtbAbsennama: TcxGridDBColumn;
    gtbAbsendivisi: TcxGridDBColumn;
    gtbAbsenjumlah: TcxGridDBColumn;
    gtbAbsennomorlembur: TcxGridDBColumn;
    gtbAbsentanggal: TcxGridDBColumn;
    gtbAbsentagpresensi: TcxGridDBColumn;
    gtbAbsenlembstart: TcxGridDBColumn;
    gtbAbsenlembend: TcxGridDBColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure btnExpandClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaplembur: TfrmLaplembur;

implementation

{$R *.dfm}

uses FdmDB;

procedure TfrmLaplembur.btnExpandClick(Sender: TObject);
begin
  if (btnExpand.Tag = 1) then
    begin
      gtbAbsen.ViewData.Expand(True);
      btnExpand.Tag := 2;
    end
  else if (btnExpand.Tag = 2) then
    begin
      gtbAbsen.ViewData.Collapse(True);
      btnExpand.Tag := 1;
    end;
end;

procedure TfrmLaplembur.Button2Click(Sender: TObject);
begin
   dlgSave.Title := '[Excel 97-2003] Export to...';
     dlgSave.Filter := 'Microsoft Excel 97-2003 (*.xls)|*.xls';
     dlgSave.FileName := '';
     if (dlgSave.Execute) then
        begin
             if (dlgSave.FileName <> '') then
                begin
                     ExportGridToExcel(dlgSave.FileName, cxGrid1, true, true, true, 'xls');
                     if (MessageDlg('Would you like to open exported file now?',
                         mtConfirmation, mbOKCancel, 0) = mrOK) then
                         begin
                              if (ExtractFileExt(dlgSave.FileName) = '.xls') then
                                 ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                              else
                                  ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName + '.xls'), pChar(''), pChar(ExtractFileDir(dlgSave.FileName + '.xls')), SW_MAXIMIZE)
                         end
                     else exit;
                end
             else exit;
        end
     else exit;
end;

procedure TfrmLaplembur.cxButton1Click(Sender: TObject);
begin
   qryAbsen.Close;
   qryAbsen.SQL.Clear;
   qryAbsen.SQL.Add('SELECT kodekaryawan, idkaryawan, nomorlembur, tglpengajuan, tanggal, ' +
      'tagpresensi, keterangan, jstart, jend, jumlah, jmasuk, jkeluar, lembstart, lembend, ' +
      'lasteditdate, lastedituser, ' +
      '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan_info ' +
      'where ben_presensi_lembur.kodekaryawan = ben_hrd_karyawan_info.kodekaryawan) as nama, ' +
      '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_info where ' +
      'ben_presensi_lembur.kodekaryawan = ben_hrd_karyawan_info.kodekaryawan) as divisi ' +
      'from ben_presensi_lembur where ben_presensi_lembur.tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' ' +
      'and ben_presensi_lembur.tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
   qryAbsen.Open;
   gtbAbsen.DataController.Refresh;
end;

procedure TfrmLaplembur.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmLaplembur.FormCreate(Sender: TObject);
begin
   edStart.Date := Date;
   edEnd.Date := Date;
   qryAbsen.Active := True;
   tblDivisi.Active := True;
   //tblTag.Active := True;
   gtbAbsen.DataController.Refresh;
   btnExpand.Tag := 1;
end;

end.
