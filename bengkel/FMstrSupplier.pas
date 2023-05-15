unit FMstrSupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, cxTextEdit, cxLabel, Vcl.StdCtrls, cxButtons,
  cxGroupBox, Data.DB, MemDS, DBAccess, MyAccess, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmSupplier = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btnSave: TcxButton;
    btnReset: TcxButton;
    cxLabel2: TcxLabel;
    edKodeSupp: TcxTextEdit;
    cxLabel4: TcxLabel;
    edAlamat: TcxTextEdit;
    cxLabel5: TcxLabel;
    edkota: TcxTextEdit;
    cxLabel6: TcxLabel;
    edTelp: TcxTextEdit;
    cxLabel7: TcxLabel;
    edEmail: TcxTextEdit;
    cxLabel8: TcxLabel;
    edNPWP: TcxTextEdit;
    cxLabel13: TcxLabel;
    edNamaSupp: TcxTextEdit;
    cxLabel1: TcxLabel;
    edPIC: TcxTextEdit;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    cxLabel3: TcxLabel;
    edBank: TcxTextEdit;
    cxLabel9: TcxLabel;
    edNoRek: TcxTextEdit;
    cxLabel10: TcxLabel;
    edNamaRek: TcxTextEdit;
    cxLabel11: TcxLabel;
    edTempo: TcxTextEdit;
    cxLabel12: TcxLabel;
    gtbSupplier: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbSupplierautonum: TcxGridDBColumn;
    gtbSupplierkode: TcxGridDBColumn;
    gtbSuppliernamasupp: TcxGridDBColumn;
    gtbSupplieralamat: TcxGridDBColumn;
    gtbSupplierkota: TcxGridDBColumn;
    gtbSuppliertelp: TcxGridDBColumn;
    gtbSupplieremail: TcxGridDBColumn;
    gtbSuppliernpwp: TcxGridDBColumn;
    gtbSuppliernamapic: TcxGridDBColumn;
    gtbSupplierbank: TcxGridDBColumn;
    gtbSuppliernorek: TcxGridDBColumn;
    gtbSuppliernamarek: TcxGridDBColumn;
    gtbSuppliertempo: TcxGridDBColumn;
    gtbSuppliernotes: TcxGridDBColumn;
    gtbSupplierisdelete: TcxGridDBColumn;
    gtbSupplierlastedituser: TcxGridDBColumn;
    gtbSupplierlasteditdate: TcxGridDBColumn;
    procedure btnResetClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    qrySupp1, qrySupp2 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmSupplier: TfrmSupplier;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterPKB;

procedure TfrmSupplier.btnResetClick(Sender: TObject);
begin
   edKodeSupp.Clear;
   edAlamat.Clear;
   edkota.Clear;
   edkota.Clear;
   edTelp.Clear;
   edEmail.Clear;
   edNPWP.Clear;
   edNamaSupp.Clear;
   edPIC.Clear;
   edBank.Clear;
   edNoRek.Clear;
   edNoRek.Clear;
   edNamaRek.Clear;
   edTempo.Clear;
   edNamaSupp.SetFocus;
   //edKodeSupp.Clear;
end;

procedure TfrmSupplier.btnSaveClick(Sender: TObject);
var
   suppCode : String;
begin
   if (edKodeSupp.Text = '') then
      begin
         suppCode := frmMain.APP_OUTLETID + '-S-' + FormatDateTime('yyMMddmmhhss', Now);
         edKodeSupp.Text := suppCode;
      end;
  qrySupp1.Close;
  qrySupp1.SQL.Clear;
  qrySupp1.SQL.Add('select kode from ben_bengkel_supplier where ' +
     'kode = ''' + edKodeSupp.Text + '''');
  qrySupp1.Open;
  if (qrySupp1.IsEmpty) then
    begin
      qrySupp2.SQL.Clear;
      qrySupp2.SQL.Add('insert into ben_bengkel_supplier values(' +
          '''' + '' + ''',' +
          '''' + edKodeSupp.Text + ''',' +
          QuotedStr(edNamaSupp.Text) + ',' +
          QuotedStr(edAlamat.Text) + ',' +
          QuotedStr(edkota.Text) + ',' +
          QuotedStr(edTelp.Text) + ',' +
          QuotedStr(edEmail.Text) + ',' +
          QuotedStr(edNPWP.Text) + ',' +
          QuotedStr(edPIC.Text) + ',' +
          QuotedStr(edBank.Text) + ',' +
          QuotedStr(edNoRek.Text) + ',' +
          QuotedStr(edNamaRek.Text) + ',' +
          QuotedStr(edTempo.Text) + ',' +
          '''' + '' + ''',' +
          '''' + 'N' + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ');');
       qrySupp2.ExecSQL;
       qryList.Refresh;
       gtbSupplier.DataController.Refresh;
    end
  else if (qrySupp1.IsEmpty) then
    begin
      qrySupp2.SQL.Clear;
      qrySupp2.SQL.Add('update ben_bengkel_supplier set ' +
          'namasupp = ' + QuotedStr(edNamaSupp.Text) + ',' +
          'alamatsupp = ' + QuotedStr(edAlamat.Text) + ',' +
          'kota = ' + QuotedStr(edkota.Text) + ',' +
          'telp = ' + QuotedStr(edTelp.Text) + ',' +
          'eemail = ' + QuotedStr(edEmail.Text) + ',' +
          'npwp = ' + QuotedStr(edNPWP.Text) + ',' +
          'namapic = ' + QuotedStr(edPIC.Text) + ',' +
          'bank = ' + QuotedStr(edBank.Text) + ',' +
          'norek = ' + QuotedStr(edNoRek.Text) + ',' +
          'namarek = ' + QuotedStr(edNamaRek.Text) + ',' +
          'tempo = ' + QuotedStr(edTempo.Text) + ',' +
          'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
          'lasteditdate = ' + QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ' ' +
          'where kode = ''' + edKodeSupp.Text + ''';');
       qrySupp2.ExecSQL;
       qryList.Refresh;
       gtbSupplier.DataController.Refresh;
    end;
    ShowMessage('Update Data Finish');
    btnReset.Click;
end;

procedure TfrmSupplier.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qrySupp1.Free;
   qrySupp2.Free;
   Action := caFree;
end;

procedure TfrmSupplier.FormCreate(Sender: TObject);
begin
   qrySupp1 := TMyQuery.Create(Self);
   qrySupp1.Connection := DMDB.dbInternal;
   qrySupp1.SQL.Add('select * from temptable');
   qrySupp1.Active := true;

   qrySupp2 := TMyQuery.Create(Self);
   qrySupp2.Connection := DMDB.dbInternal;
   qrySupp2.SQL.Add('select * from temptable');
   qrySupp2.Active := true;
   qryList.Active := True;
   gtbSupplier.DataController.Refresh;
end;

end.
