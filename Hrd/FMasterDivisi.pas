unit FMasterDivisi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, StdCtrls, DB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxTextEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, MyAccess;

type
  TfrmMasterDivisi = class(TForm)
    Label1: TLabel;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    gtbDivisi: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbDivisiid_departemen: TcxGridDBColumn;
    gtbDivisinama_departemen: TcxGridDBColumn;
    Label2: TLabel;
    edKode: TEdit;
    Label3: TLabel;
    edNama: TEdit;
    Button1: TButton;
    Button2: TButton;
    btnSimpan: TButton;
    btnClear: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    qryDiv1, qryDiv2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmMasterDivisi: TfrmMasterDivisi;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmMasterDivisi.btnSimpanClick(Sender: TObject);
var
  strSql : String;
begin
  if (btnSimpan.Tag = 1) then
    begin
      qryDiv1.Close;
      qryDiv1.SQL.Clear;
      qryDiv1.SQL.Add('select id_departemen from departemen where id_departemen = ' +
         QuotedStr(edKode.Text));
      qryDiv1.Open;
      if (qryDiv1.IsEmpty) then
        begin
          qryExec.SQL.Clear;
          qryExec.SQL.Add('insert into departemen values(' +
              QuotedStr(edKode.Text) + ',' +
              QuotedStr(edNama.Text) + ');');
          strSql := 'insert into departemen values(' +
              QuotedStr(edKode.Text) + ',' +
              QuotedStr(edNama.Text) + ');';

          qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strSql) + ',' +
          '''' + 'N' + ''');');
          qryExec.ExecSQL;
          ShowMessage('Data Divisi Tersimpan !');
          tblDepartemen.Refresh;
          edKode.Clear;
          edNama.Clear;
          edKode.Enabled := False;
          edNama.Enabled := False;
        end
      else if (NOT qryDiv1.IsEmpty) then
        begin
          ShowMessage('Maaf Kode Divisi sudah ada !');
          edKode.Clear;
          edNama.Clear;
          edKode.Enabled := False;
          edNama.Enabled := False;
          Exit;
        end;
    end
  else if (btnSimpan.Tag = 2) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('update departemen set ' +
           'nama_departemen = ' + QuotedStr(edNama.Text) + ' ' +
           'where id_departemen = ' + QuotedStr(edKode.Text) + ';');
      strSql := 'update departemen set ' +
           'nama_departemen = ' + QuotedStr(edNama.Text) + ' ' +
           'where id_departemen = ' + QuotedStr(edKode.Text) + ';';
      qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strSql) + ',' +
          '''' + 'N' + ''');');
      qryExec.ExecSQL;
      ShowMessage('Data Divisi Tersimpan !');
      tblDepartemen.Refresh;
      edKode.Clear;
      edNama.Clear;
      edKode.Enabled := False;
      edNama.Enabled := False;
    end;
end;

procedure TfrmMasterDivisi.Button1Click(Sender: TObject);
var
  recSelect : Integer;
begin
   recSelect := gtbDivisi.DataController.GetFocusedRecordIndex;
   if(recSelect < 0) then
     begin
       ShowMessage('Mohon Pilih data yang akan di edit !');
       Exit;
     end;
   edKode.Text := gtbDivisi.DataController.GetValue(recSelect, gtbDivisiid_departemen.Index);
   edNama.Text := gtbDivisi.DataController.GetValue(recSelect, gtbDivisinama_departemen.Index);
   edKode.Enabled := False;
   edNama.Enabled := True;
   btnSimpan.Tag := 2;
end;

procedure TfrmMasterDivisi.Button2Click(Sender: TObject);
begin
   edKode.Clear;
   edNama.Clear;
   edNama.Enabled := True;
   edKode.Enabled := True;
   btnSimpan.Tag := 1;
end;

procedure TfrmMasterDivisi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryDiv1.Free;
  qryDiv2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmMasterDivisi.FormCreate(Sender: TObject);
begin
  qryDiv1 := TMyQuery.Create(Self);
  qryDiv1.Connection := DMDB.dbInternal;
  qryDiv1.SQL.Add('select * from temptable');
  qryDiv1.Active := true;

  qryDiv2 := TMyQuery.Create(Self);
  qryDiv2.Connection := DMDB.dbInternal;
  qryDiv2.SQL.Add('select * from temptable');
  qryDiv2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  tblDepartemen.Active := True;
  gtbDivisi.DataController.Refresh;
end;

end.
