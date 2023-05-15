unit FMasterShift;

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
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxTimeEdit,
  cxCalc, cxCheckBox, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, MyAccess;

type
  TfrmMasterShift = class(TForm)
    Label1: TLabel;
    tblShift: TMyTable;
    dsTblShift: TDataSource;
    gtbShift: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbShiftautonum: TcxGridDBColumn;
    gtbShiftnamashift: TcxGridDBColumn;
    gtbShiftjmasuk: TcxGridDBColumn;
    gtbShiftjkeluar: TcxGridDBColumn;
    gtbShiftjamkerja: TcxGridDBColumn;
    gtbShiftnotes: TcxGridDBColumn;
    gtbShiftaktif: TcxGridDBColumn;
    Button1: TButton;
    btnEdit: TButton;
    gtbShiftovernight: TcxGridDBColumn;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
    qryShift1, qryShift2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmMasterShift: TfrmMasterShift;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterShiftAdd;

procedure TfrmMasterShift.btnEditClick(Sender: TObject);
var
  recSelect, Autonum : Integer;
begin
  recSelect := gtbShift.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  Autonum := gtbShift.DataController.GetValue(recSelect, gtbShiftautonum.Index);
  Application.CreateForm(TfrmMasterShiftAdd, frmMasterShiftAdd);
  qryShift1.Close;
  qryShift1.SQL.Clear;
  qryShift1.SQL.Add('select * from ben_shift where autonum = ''' +
        inttostr(Autonum) + '''');
  qryShift1.Open;
  frmMasterShiftAdd.edNamaShift.Text := qryShift1.Fields[1].AsString;
  frmMasterShiftAdd.edNamaShift.ReadOnly := True;
  frmMasterShiftAdd.edJMasuk.Time := qryShift1.Fields[2].AsDateTime;
  frmMasterShiftAdd.edJKeluar.Time := qryShift1.Fields[3].AsDateTime;
  frmMasterShiftAdd.ckOver.EditValue := qryShift1.Fields[5].AsString;
  frmMasterShiftAdd.ckAktif.EditValue := qryShift1.Fields[6].AsString;
   frmMasterShiftAdd.btnUpdate.Visible := True;
   frmMasterShiftAdd.btnSave.Visible := False;
   frmMasterShiftAdd.Show;
end;

procedure TfrmMasterShift.Button1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmMasterShiftAdd, frmMasterShiftAdd);
   frmMasterShiftAdd.btnUpdate.Visible := False;
   frmMasterShiftAdd.btnSave.Visible := True;
   frmMasterShiftAdd.Show;
end;

procedure TfrmMasterShift.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryShift1.Free;
  qryShift2.Free;
  qryExec.ExecSQL;
  tblShift.Active := False;
  Action := caFree;
end;

procedure TfrmMasterShift.FormCreate(Sender: TObject);
begin
  qryShift1 := TMyQuery.Create(Self);
  qryShift1.Connection := DMDB.dbInternal;
  qryShift1.SQL.Add('select * from temptable');
  qryShift1.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryShift2 := TMyQuery.Create(Self);
  qryShift2.Connection := DMDB.dbInternal;
  qryShift2.SQL.Add('select * from temptable');
  qryShift2.Active := true;
  tblShift.Active := True;
  gtbShift.DataController.Refresh;
end;

end.
