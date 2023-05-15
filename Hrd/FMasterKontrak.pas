unit FMasterKontrak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DB, DBAccess, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxCheckBox, cxCalc, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, MyAccess;

type
  TfrmMasterKontrak = class(TForm)
    lblJudulForm: TLabel;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    gtbKontrak: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    tblKontrak: TMyTable;
    dsTblKontrak: TDataSource;
    gtbKontrakautonum: TcxGridDBColumn;
    gtbKontrakdepartemen: TcxGridDBColumn;
    gtbKontraknamakontrak: TcxGridDBColumn;
    gtbKontraklamakontrak: TcxGridDBColumn;
    gtbKontrakgapok: TcxGridDBColumn;
    gtbKontraktransport: TcxGridDBColumn;
    gtbKontrakuangmakan: TcxGridDBColumn;
    gtbKontrakkomisi: TcxGridDBColumn;
    gtbKontraktunjangan1: TcxGridDBColumn;
    gtbKontraktunjangan2: TcxGridDBColumn;
    gtbKontrakpotongan1: TcxGridDBColumn;
    gtbKontrakpotongan2: TcxGridDBColumn;
    gtbKontrakisadmin: TcxGridDBColumn;
    gtbKontrakaktif: TcxGridDBColumn;
    btnEdit: TButton;
    btnNew: TButton;
    gtbKontrakkodekontrak: TcxGridDBColumn;
    gtbKontraklastedituser: TcxGridDBColumn;
    gtbKontraklasteditdate: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
    qryCtn1, qryCtn2 : TMyQuery;
  public
    { Public declarations }
    ISADMIN : Boolean;
  end;

var
  frmMasterKontrak: TfrmMasterKontrak;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterKontrakAdd;

procedure TfrmMasterKontrak.btnEditClick(Sender: TObject);
var
  recSelect, autonum : Integer;
  asAdmin : String;
begin
  recSelect := gtbKontrak.DataController.GetFocusedRecordIndex;
  if (recSelect < 0) then
     begin
       ShowMessage('Please Select Data');
       Exit;
     end;
  autonum := gtbKontrak.DataController.GetValue(recSelect, gtbKontrakautonum.Index);
  asAdmin := VarToStr(gtbKontrak.DataController.GetValue(recSelect, gtbKontrakisadmin.Index));
  if ((asAdmin = 'N') and (ISADMIN = True)) then
    begin
      ShowMessage('Anda tidak memiliki otorisasi pada data ini');
      Exit;
    end;
  Application.CreateForm(TfrmMasterKontrakAdd, frmMasterKontrakAdd);
  frmMasterKontrakAdd.btnSimpan.Tag := 2;
  qryCtn1.Close;
  qryCtn1.SQL.Clear;
  qryCtn1.SQL.Add('select * from ben_hrd_kontrak_master where autonum = ''' +
      IntToStr(autonum) + '''');
  qryCtn1.Open;
  frmMasterKontrakAdd.edDepartemen.EditValue := qryCtn1.Fields[2].AsString;
  frmMasterKontrakAdd.edNama.Text := qryCtn1.Fields[4].AsString;
  frmMasterKontrakAdd.edDepartemen.Properties.ReadOnly := True;
  frmMasterKontrakAdd.edNama.ReadOnly := True;
  frmMasterKontrakAdd.edLama.EditValue := qryCtn1.Fields[5].AsFloat;
  frmMasterKontrakAdd.edGapok.EditValue := qryCtn1.Fields[6].AsFloat;
  frmMasterKontrakAdd.edTransport.EditValue := qryCtn1.Fields[7].AsFloat;
  frmMasterKontrakAdd.edUM.EditValue := qryCtn1.Fields[8].AsFloat;
  frmMasterKontrakAdd.edKomisi.EditValue := qryCtn1.Fields[9].AsFloat;
  frmMasterKontrakAdd.edTunjangan.EditValue := qryCtn1.Fields[10].AsFloat;
  frmMasterKontrakAdd.edPotongan.EditValue := qryCtn1.Fields[12].AsFloat;
  frmMasterKontrakAdd.edPot2.EditValue := qryCtn1.Fields[13].AsFloat;
  frmMasterKontrakAdd.ckAdmin.EditValue := qryCtn1.Fields[14].AsString;
  frmMasterKontrakAdd.ckAktif.EditValue := qryCtn1.Fields[15].AsString;
  frmMasterKontrakAdd.lblKodeKontrak.Caption := qryCtn1.Fields[3].AsString;
  frmMasterKontrakAdd.Show;
  frmMasterKontrakAdd.Position := poDesktopCenter;
end;

procedure TfrmMasterKontrak.btnNewClick(Sender: TObject);
begin
  Application.CreateForm(TfrmMasterKontrakAdd, frmMasterKontrakAdd);

  frmMasterKontrakAdd.FormStyle := fsNormal;
  frmMasterKontrakAdd.btnSimpan.Tag := 1;
  frmMasterKontrakAdd.ckAdmin.Checked := False;
  frmMasterKontrakAdd.ckAktif.Checked := True;
  frmMasterKontrakAdd.lblKodeKontrak.Caption := frmMain.APP_OUTLETID + FormatDateTime('yyMMddhhmmss', Now);
  frmMasterKontrakAdd.Show;
  frmMasterKontrakAdd.Height := 540;
  frmMasterKontrakAdd.Width := 420;
  frmMasterKontrakAdd.Position := poDesktopCenter;
end;

procedure TfrmMasterKontrak.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryCtn1.Free;
   qryCtn2.Free;
   Action := caFree;
end;

procedure TfrmMasterKontrak.FormCreate(Sender: TObject);
begin
  qryCtn1 := TMyQuery.Create(Self);
  qryCtn1.Connection := DMDB.dbInternal;
  qryCtn1.SQL.Add('select * from temptable');
  qryCtn1.Active := true;

  qryCtn2 := TMyQuery.Create(Self);
  qryCtn2.Connection := DMDB.dbInternal;
  qryCtn2.SQL.Add('select * from temptable');
  qryCtn2.Active := true;
  tblDepartemen.Active := True;
  tblKontrak.Active := True;
end;

end.
