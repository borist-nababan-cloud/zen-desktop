unit FGiftCertificateMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyAccess, Data.DB, DBAccess, MemDS,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxTextEdit, cxCalc, Vcl.Menus,
  cxButtons, Vcl.ExtCtrls, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  XSuperJSON, XSuperObject, DateUtils;

type
  TfrmGiftCertificateMaster = class(TForm)
    lblJudulAtas: TLabel;
    qryMaster: TMyQuery;
    dsQryMaster: TMyDataSource;
    qryDetail: TMyQuery;
    dsQryDetail: TMyDataSource;
    gtbMaster: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbMasterpaket_number: TcxGridDBColumn;
    gtbMastertanggal: TcxGridDBColumn;
    gtbMasterexpired_date: TcxGridDBColumn;
    gtbMasterharga_jual: TcxGridDBColumn;
    gtbMastertotal_items: TcxGridDBColumn;
    gtbMasteraktif: TcxGridDBColumn;
    gtbMasterterjual: TcxGridDBColumn;
    gtbMasternotes: TcxGridDBColumn;
    Panel1: TPanel;
    btnNewPacket: TcxButton;
    cxGrid2: TcxGrid;
    tbDetails: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    cxButton4: TcxButton;
    tbDetailspaket_number: TcxGridDBColumn;
    tbDetailsgc_number: TcxGridDBColumn;
    tbDetailsnama_menu: TcxGridDBColumn;
    tbDetailsharga_jual: TcxGridDBColumn;
    btnActivatedPacket: TcxButton;
    btnEditPacket: TcxButton;
    btnrefresh: TcxButton;
    btnRemovePacket: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewPacketClick(Sender: TObject);
    procedure btnRemovePacketClick(Sender: TObject);
    procedure btnEditPacketClick(Sender: TObject);
    procedure btnrefreshClick(Sender: TObject);
    procedure btnActivatedPacketClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryFind, qryCari : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmGiftCertificateMaster: TfrmGiftCertificateMaster;

implementation

{$R *.dfm}

uses FdmDB, FMain, FPaketGCInput;

procedure TfrmGiftCertificateMaster.btnActivatedPacketClick(Sender: TObject);
var
   recSel, btnSelected : Integer;
   kodePaket, keterangan : String;
   expireDate : TDate;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   expireDate := IncYear(Date, 1);
   kodePaket := vartostr(gtbMaster.DataController.GetValue(recSel, gtbMasterpaket_number.Index));
   btnSelected := MessageDlg('Apakah Anda akan mengaktifkan GC Packet ' + kodePaket + '?',mtConfirmation,mbOKCancel, 0);
   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
   if (btnSelected = mrCancel) then Exit;

   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('update gc_master set ' +
           'tanggal = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
           'expired_date = ''' + FormatDateTime('yyyy-MM-dd', expireDate) + ''',' +
           'aktif = ''' + 'Y' + ''',' +
           'notes = ' + QuotedStr(keterangan) +
           ' where paket_number = ''' + kodePaket + ''';');

   qrySearch.SQL.Add('update main_menu set ' +
                    'aktif = ''' + 'Y' + ''',' +
                    'lastuser = ''' + frmMain.USERAPPS + ''',' +
                    'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
                    'where menu_id = ''' + kodePaket + '''');
   qrySearch.ExecSQL;
   qryMaster.Refresh;
   gtbMaster.DataController.Refresh;
end;

procedure TfrmGiftCertificateMaster.btnEditPacketClick(Sender: TObject);
var
  recSel : Integer;
  kodePaket : String;
  harga : Double;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   kodePaket := vartostr(gtbMaster.DataController.GetValue(recSel, gtbMasterpaket_number.Index));
   harga := gtbMaster.DataController.GetValue(recSel, gtbMasterharga_jual.Index);
   Application.CreateForm(TfrmPaketGCInput, frmPaketGCInput);
   frmPaketGCInput.edOutletID.Text := frmMain.APP_OUTLETID + '.';
   frmPaketGCInput.FormStyle := fsNormal;
   frmPaketGCInput.Height := 728;
   frmPaketGCInput.Width := 1100;
   frmPaketGCInput.Position := poDesktopCenter;
   //frmPaketGCInput.edOutletID.Text := frmMain.APP_OUTLETID + '.';
   frmPaketGCInput.edKode.Text := Copy(kodePaket,5,50);
   frmPaketGCInput.edHargaJual.EditValue := harga;
   frmPaketGCInput.edExpired.Date := IncYear(Date, 1);
   //frmNewMenuTrans.lblKodeTrans.Caption := NewKodeTrans;
   //frmNewMenuTrans.PACKETHH := vPackHH;
   //frmNewMenuTrans.varJam := vWaktu;
   //frmNewMenuTrans.varTanggal := vTanggal;
   frmPaketGCInput.Show;
end;

procedure TfrmGiftCertificateMaster.btnNewPacketClick(Sender: TObject);
begin
   Application.CreateForm(TfrmPaketGCInput, frmPaketGCInput);
   frmPaketGCInput.edOutletID.Text := frmMain.APP_OUTLETID + '.';
   frmPaketGCInput.edExpired.Date := IncYear(Date, 1);
   frmPaketGCInput.FormStyle := fsNormal;
   frmPaketGCInput.Height := 728;
   frmPaketGCInput.Width := 1100;
   frmPaketGCInput.Position := poDesktopCenter;
   //frmNewMenuTrans.lblKodeTrans.Caption := NewKodeTrans;
   //frmNewMenuTrans.PACKETHH := vPackHH;
   //frmNewMenuTrans.varJam := vWaktu;
   //frmNewMenuTrans.varTanggal := vTanggal;
   frmPaketGCInput.Show;
end;

procedure TfrmGiftCertificateMaster.btnrefreshClick(Sender: TObject);
begin
   qryMaster.Refresh;
   gtbMaster.DataController.Refresh;
end;

procedure TfrmGiftCertificateMaster.btnRemovePacketClick(Sender: TObject);
var
   recSel, btnSelected : Integer;
   kodePaket, keterangan : String;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   kodePaket := vartostr(gtbMaster.DataController.GetValue(recSel, gtbMasterpaket_number.Index));
   btnSelected := MessageDlg('Apakah Anda akan menghapus Data ' + kodePaket + '?',mtConfirmation,mbOKCancel, 0);
   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
   if (btnSelected = mrCancel) then Exit;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('update gc_master set ' +
      'aktif = ''' + 'D' + ''',' +
      'notes = ' + QuotedStr(keterangan) +
      ' where paket_number = ''' + kodePaket + ''';');
   qrySearch.SQL.Add('update gc_detail set ' +
      'aktif = ''' + 'Y' + ''',' +
      'paket_number = ''' + '' + ''',' +
      'notes = ' + QuotedStr(keterangan) +
      ' where paket_number = ''' + kodePaket + ''';');
   qrySearch.SQL.Add('update main_menu set ' +
       'aktif = ''' + 'N' + ''',' +
       'lastuser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) +
       ''' where menu_id = ''' + kodePaket + ''';');
   qrySearch.ExecSQL;

   qryMaster.Refresh;
   qryDetail.Refresh;
   gtbMaster.DataController.Refresh;
   tbDetails.DataController.Refresh;

end;

procedure TfrmGiftCertificateMaster.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qrySearch.Free;
   qryFind.Free;
   qryCari.Free;
   Action := caFree;
end;

procedure TfrmGiftCertificateMaster.FormCreate(Sender: TObject);
begin
   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from empty_x');
   qrySearch.Active := true;

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.dbInternal;
   qryFind.SQL.Add('select * from empty_x');
   qryFind.Active := true;

   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from empty_x');
   qryCari.Active := true;

   qryMaster.Active := True;
   qryDetail.Active := True;
   gtbMaster.DataController.Refresh;
   tbDetails.DataController.Refresh;
end;

end.
