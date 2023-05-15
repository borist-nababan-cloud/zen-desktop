unit FHistoryKontrak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBAccess, DB, cxGraphics, cxControls, cxLookAndFeels,
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
  cxGrid, cxCalendar, cxDBLookupComboBox, DateUtils, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MyAccess, MemDS;

type
  TfrmHistoryKontrak = class(TForm)
    Label4: TLabel;
    qryKontrak: TMyQuery;
    dsQryKontrak: TDataSource;
    gtbKontrak: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbKontrakautonum: TcxGridDBColumn;
    gtbKontraknokontrak: TcxGridDBColumn;
    gtbKontraktglkontrak: TcxGridDBColumn;
    gtbKontrakkodekontrak: TcxGridDBColumn;
    gtbKontraktglmasuk: TcxGridDBColumn;
    gtbKontraktglhabis: TcxGridDBColumn;
    gtbKontrakgapok: TcxGridDBColumn;
    gtbKontraklastedituser: TcxGridDBColumn;
    gtbKontraklasteditdate: TcxGridDBColumn;
    lblNama: TLabel;
    lblKode: TLabel;
    lblFingerID: TLabel;
    Button1: TButton;
    tblKontrak: TMyTable;
    dsTblKontrak: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    qryHist1, qryHist2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmHistoryKontrak: TfrmHistoryKontrak;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterKaryawan;

procedure TfrmHistoryKontrak.Button1Click(Sender: TObject);
var
  recSelect, tahun, bulan, tanggal, autonum : Integer;
  noKontrak, NewKontrak : String;
  tglKontrak : TDate;
begin
  tahun := 1990;
  bulan := 01;
  tanggal := 01;
  tglKontrak := EncodeDate(tahun, bulan, tanggal);
  recSelect := gtbKontrak.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  noKontrak := vartostr(gtbKontrak.DataController.GetValue(recSelect, gtbKontraknokontrak.Index));
  autonum := gtbKontrak.DataController.GetValue(recSelect, gtbKontrakautonum.Index);
  NewKontrak := 'CANCEL/' + noKontrak;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update ben_hrd_kontrak_details set ' +
     'nokontrak = ''' + NewKontrak + ''',' +
     'tglkontrak = ''' + FormatDateTime('yyyy-MM-dd', tglKontrak) + ''',' +
     'tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', tglKontrak) + ''',' +
     'tglhabis = ''' + FormatDateTime('yyyy-MM-dd', tglKontrak) + ''',' +
     'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
     'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
     'where autonum = ''' + IntToStr(autonum) + '''');
  qryExec.ExecSQL;
  qryKontrak.Active := False;
  Sleep(100);
  qryKontrak.Active := True;
  gtbKontrak.DataController.Refresh;
end;

procedure TfrmHistoryKontrak.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryHist1.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmHistoryKontrak.FormCreate(Sender: TObject);
begin
  qryHist1 := TMyQuery.Create(Self);
  qryHist1.Connection := DMDB.dbInternal;
  qryHist1.SQL.Add('select * from temptable');
  qryHist1.Active := true;

  qryHist2 := TMyQuery.Create(Self);
  qryHist2.Connection := DMDB.dbInternal;
  qryHist2.SQL.Add('select * from temptable');
  qryHist2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;
end;

end.
