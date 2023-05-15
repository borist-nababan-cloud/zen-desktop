unit FJadwalTetap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxTextEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxDBLookupComboBox, cxCalendar,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, MemDS, MyAccess;

type
  TfrmJadwalTetap = class(TForm)
    tblJadwalTetap: TMyTable;
    dsTblJadwalTetap: TDataSource;
    tblShift: TMyTable;
    dsTblShift: TDataSource;
    gtbJadwal: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbJadwalautonum: TcxGridDBColumn;
    gtbJadwalnamajadwal: TcxGridDBColumn;
    gtbJadwalsmonday: TcxGridDBColumn;
    gtbJadwalstues: TcxGridDBColumn;
    gtbJadwalswed: TcxGridDBColumn;
    gtbJadwalsthur: TcxGridDBColumn;
    gtbJadwalsfri: TcxGridDBColumn;
    gtbJadwalssat: TcxGridDBColumn;
    gtbJadwalsssun: TcxGridDBColumn;
    gtbJadwalisupload: TcxGridDBColumn;
    gtbJadwallasteditdate: TcxGridDBColumn;
    gtbJadwallastedituser: TcxGridDBColumn;
    gtbJadwaltagedit: TcxGridDBColumn;
    Button1: TButton;
    btnEdit: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
    qryJadwal1, qryJadwal2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmJadwalTetap: TfrmJadwalTetap;

implementation

{$R *.dfm}

uses FdmDB, FMain, FJadwalTetapAdd;

procedure TfrmJadwalTetap.btnEditClick(Sender: TObject);
var
  recSelect : Integer;
  namaJadwal : String;
begin
  recSelect := gtbJadwal.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  namaJadwal := vartostr(gtbJadwal.DataController.GetValue(recSelect, gtbJadwalnamajadwal.Index));
  qryJadwal1.Close;
  qryJadwal1.SQL.Clear;
  qryJadwal1.SQL.Add('select * from ben_hrd_jadwal_tetap where namajadwal = ' +
      QuotedStr(namaJadwal));
  qryJadwal1.Open;
  if (NOT qryJadwal1.IsEmpty) then
    begin
      Application.CreateForm(TfrmJadwalTetapAdd, frmJadwalTetapAdd);
      frmJadwalTetapAdd.edNama.Text := namaJadwal;
      frmJadwalTetapAdd.edNama.ReadOnly := True;
      frmJadwalTetapAdd.edSenin.EditValue := qryJadwal1.Fields[2].AsInteger;
      frmJadwalTetapAdd.edSelasa.EditValue := qryJadwal1.Fields[3].AsInteger;
      frmJadwalTetapAdd.edRabu.EditValue := qryJadwal1.Fields[4].AsInteger;
      frmJadwalTetapAdd.edKamis.EditValue := qryJadwal1.Fields[5].AsInteger;
      frmJadwalTetapAdd.edJumat.EditValue := qryJadwal1.Fields[6].AsInteger;
      frmJadwalTetapAdd.edSabtu.EditValue := qryJadwal1.Fields[7].AsInteger;
      frmJadwalTetapAdd.edMinggu.EditValue := qryJadwal1.Fields[8].AsInteger;
      frmJadwalTetapAdd.btnUpdate.Visible := True;
      frmJadwalTetapAdd.btnSimpan.Visible := False;
      frmJadwalTetapAdd.Show;
      frmJadwalTetapAdd.Position := poDesktopCenter;
    end;
end;

procedure TfrmJadwalTetap.Button1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmJadwalTetapAdd, frmJadwalTetapAdd);
   frmJadwalTetapAdd.btnUpdate.Visible := False;
   frmJadwalTetapAdd.btnSimpan.Visible := True;
   frmJadwalTetapAdd.Show;
   frmJadwalTetapAdd.Position := poDesktopCenter;
end;

procedure TfrmJadwalTetap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryJadwal1.Free;
  tblShift.Active := False;
  tblJadwalTetap.Active := False;
  Action := caFree;
end;

procedure TfrmJadwalTetap.FormCreate(Sender: TObject);
begin
  qryJadwal1 := TMyQuery.Create(Self);
  qryJadwal1.Connection := DMDB.dbInternal;
  qryJadwal1.SQL.Add('select * from temptable');
  qryJadwal1.Active := true;

  tblJadwalTetap.Active := True;
  gtbJadwal.DataController.Refresh;
  tblShift.Active := True;

end;

end.
