unit FMasterBank;

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
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxDBLookupComboBox,
  cxTextEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, MyAccess, cxCheckBox;

type
  TfrmMasterBank = class(TForm)
    Label4: TLabel;
    tblMasterBank: TMyTable;
    dsTblMasterBank: TDataSource;
    gtbBank: TcxGridDBTableView;
    cxBankLevel1: TcxGridLevel;
    cxBank: TcxGrid;
    gtbBankidoutlet: TcxGridDBColumn;
    gtbBankkodebank: TcxGridDBColumn;
    gtbBanknamabank: TcxGridDBColumn;
    gtbBanknorek: TcxGridDBColumn;
    gtbBanknamarekening: TcxGridDBColumn;
    btnNew: TButton;
    Button2: TButton;
    StrukturMaster: TMemo;
    StrukturSaldo: TMemo;
    gtbBankasedc: TcxGridDBColumn;
    gtbBankaktif: TcxGridDBColumn;
    gtbBanklastuseredit: TcxGridDBColumn;
    gtbBanklasteditdate: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qryBank1, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmMasterBank: TfrmMasterBank;

implementation

{$R *.dfm}

uses FMain, FdmDB, FMasterBankAdd;

procedure TfrmMasterBank.btnNewClick(Sender: TObject);
begin
   Application.CreateForm(TfrmMasterBankAdd, frmMasterBankAdd);
   frmMasterBankAdd.FormStyle := fsNormal;
   frmMasterBankAdd.Width := 520;
   frmMasterBankAdd.Height := 370;
   frmMasterBankAdd.btnSimpan.Tag := 0;
   frmMasterBankAdd.Show;
   frmMasterBankAdd.Position := poDesktopCenter;
end;

procedure TfrmMasterBank.Button2Click(Sender: TObject);
var
  recSelect : Integer;
  kodebank : String;
begin
  recSelect := gtbBank.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then Exit;
  kodebank := vartostr(gtbBank.DataController.GetValue(recSelect, gtbBankkodebank.Index));
  Application.CreateForm(TfrmMasterBankAdd, frmMasterBankAdd);
  frmMasterBankAdd.btnAuto.Enabled := False;
  qryBank1.Close;
  qryBank1.SQL.Clear;
  qryBank1.SQL.Add('select * from ben_master_bank where kodebank = ''' +
       kodebank + '''');
  qryBank1.Open;
  //frmMasterBankAdd.edOutlet.EditValue := qryBank1.Fields[1].AsString;
  frmMasterBankAdd.edKodeBank.Text := qryBank1.Fields[2].AsString;
  frmMasterBankAdd.edNama.Text := qryBank1.Fields[3].AsString;
  frmMasterBankAdd.edNorek.Text := qryBank1.Fields[4].AsString;
  frmMasterBankAdd.edPemilik.Text := qryBank1.Fields[5].AsString;
  frmMasterBankAdd.ckEDC.EditValue := qryBank1.Fields[6].AsString;
  frmMasterBankAdd.ckAktif.EditValue := qryBank1.Fields[7].AsString;
  frmMasterBankAdd.FormStyle := fsNormal;
   frmMasterBankAdd.Width := 520;
   frmMasterBankAdd.Height := 370;
   frmMasterBankAdd.btnSimpan.Tag := 1;
   frmMasterBankAdd.Show;
   frmMasterBankAdd.Position := poDesktopCenter;
end;

procedure TfrmMasterBank.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryBank1.Free;
  Action := caFree;
end;

procedure TfrmMasterBank.FormCreate(Sender: TObject);
begin
   qryBank1 := TMyQuery.Create(Self);
   qryBank1.Connection := DMDB.dbInternal;
   qryBank1.SQL.Add('select * from temptable');
   qryBank1.Active := true;

   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qryBank1.Close;
   qryBank1.SQL.Clear;
   qryBank1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_master_bank'));
   qryBank1.Open;
   if (qryBank1.IsEmpty) then
    begin
     qryExec.SQL.Clear;
     qryExec.SQL.Add(StrukturMaster.Text);
     qryExec.ExecSQL;
    end;


   qryBank1.Close;
   qryBank1.SQL.Clear;
   qryBank1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_saldo_bank'));
   qryBank1.Open;
   if (qryBank1.IsEmpty) then
    begin
     qryExec.SQL.Clear;
     qryExec.SQL.Add(StrukturSaldo.Text);
     qryExec.ExecSQL;
    end;

   tblMasterBank.Active := True;
   gtbBank.DataController.Refresh;

end;

end.
