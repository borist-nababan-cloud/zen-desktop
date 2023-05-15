unit FCariMasterPKB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, DBAccess, MyAccess, MemDS,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmCariMasterPKB = class(TForm)
    qryList: TMyQuery;
    dsQryList: TMyDataSource;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    btnSelect: TcxButton;
    gtbListautonum: TcxGridDBColumn;
    gtbListpkbnumber: TcxGridDBColumn;
    gtbListtglmasuk: TcxGridDBColumn;
    gtbListwaktumasuk: TcxGridDBColumn;
    gtbListcustcode: TcxGridDBColumn;
    gtbListkeluhan: TcxGridDBColumn;
    gtbListtglselesai: TcxGridDBColumn;
    gtbListwaktuselesai: TcxGridDBColumn;
    gtbListnotes: TcxGridDBColumn;
    gtbListstatus: TcxGridDBColumn;
    gtbListisdelete: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    gtbListnamacust: TcxGridDBColumn;
    gtbListnopol: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qryCari1, qryCari2, qryCari3 : TMyQuery;
  public
    { Public declarations }
    procedure InputPKB();
    procedure InputPayment();
    procedure ReOpenPKB();
  end;

var
  frmCariMasterPKB: TfrmCariMasterPKB;

implementation

{$R *.dfm}

uses FMain, FMasterPKB, FdmDB, FPKBPayment;

procedure TfrmCariMasterPKB.ReOpenPKB;
var
  recSel : Integer;
  noPKB : String;
begin
     recSel := gtbList.DataController.GetFocusedRecordIndex;
     if (recSel < 0) then Exit;
     noPKB := vartostr(gtbList.DataController.GetValue(recSel, gtbListpkbnumber.Index));
     if MessageDlg('Proses ini akan membuka kembali PKB '+ #13#13 +
     'Apakah anda yakin akan membuka PKB ini?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrNo then
       begin
           ShowMessage('Cancel Open PKB');
           Exit;
       end;
   qryCari3.SQL.Clear;
   qryCari3.SQL.Add('update ben_bengkel_pkb set ' +
       'status = ''' + 'S' + ''', ' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where pkbnumber = ''' + noPKB + '''');
   qryCari3.ExecSQL;
   ShowMessage('Open PKB Selesai');
   frmCariMasterPKB.Close;
end;

procedure TfrmCariMasterPKB.InputPayment;
var
  recSel : Integer;
  noPKB : String;
begin
  recSel := gtbList.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   noPKB := vartostr(gtbList.DataController.GetValue(recSel, gtbListpkbnumber.Index));
   qryCari1.Close;
   qryCari1.SQL.Clear;
   qryCari1.SQL.Add('select * from ben_bengkel_pkb where pkbnumber = '''  + noPKB + '''');
   qryCari1.Open;

   qryCari2.Close;
   qryCari2.SQL.Clear;
   qryCari2.SQL.Add('select * from ben_bengkel_customer where codecust = ''' +
       qryCari1.Fields[4].AsString + '''');
   qryCari2.Open;
   with frmPKBPayment do
       begin
           edPKBNumb.Text := qryCari1.Fields[1].AsString;
           edTglPKB.Date :=  qryCari1.Fields[2].AsDateTime;
           edjamPKB.Time :=  qryCari1.Fields[3].AsDateTime;
           edKodeKonsumen.Text := qryCari1.Fields[4].AsString;
           //edkeluhan.Text := qryCari1.Fields[5].AsString;
           //edTglSelesai.Date :=  qryCari1.Fields[7].AsDateTime;
           //edJamSelesai.Time :=  qryCari1.Fields[8].AsDateTime;
           //edKilometer.Text := qryCari1.Fields[6].AsString;

           edPlatNomor.Text := qryCari2.Fields[2].AsString;
           edNamaKonsumen.Text := qryCari2.Fields[3].AsString;
           //edKirimMobil.Date := qryCari2.Fields[9].AsDateTime;
           //edTypeMobil.EditValue := qryCari2.Fields[10].AsString;
           //edWarnaMobil.Text := qryCari2.Fields[11].AsString;
           //edTahunMobil.Text := qryCari2.Fields[12].AsString;
           //edPlatNomor.Text := qryCari2.Fields[2].AsString;

           qryDetails.Close;
           qryDetails.SQL.Clear;
           qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where ' +
                      'pkbnumber = ''' + edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');

           qryDetails.Open;
           frmPKBPayment.gtbPKB.DataController.Refresh;

           qryCari3.Close;
           qryCari3.SQL.Clear;
           qryCari3.SQL.Add('select sum(subtotal) from ben_bengkel_pkb_detail where ' +
                      'pkbnumber = ''' + edPKBNumb.Text + ''' AND isdelete = ''' + 'N' +
                      ''' AND kodecharge = ''' + '01' + '''');
           qryCari3.Open;
           edSubtotal.EditValue := qryCari3.Fields[0].AsFloat;
           edDisc.EditValue := 0;
           edTotal.EditValue := qryCari3.Fields[0].AsFloat;
           if (edTotal.EditValue <= 250000) then edmaterai.EditValue := 0
           else if ((edTotal.EditValue > 250000) AND (edTotal.EditValue <= 1000000)) then edmaterai.EditValue := 3000
           else if (edTotal.EditValue > 1000000) then edmaterai.EditValue := 6000;
           edGrantotal.EditValue := edTotal.EditValue + edmaterai.EditValue;
           edTotalPayment.EditValue := 0;
           edCash.EditValue := 0;
           edDebit.EditValue := 0;
           edTransfer.EditValue := 0;
           edkembalian.EditValue := 0;
           frmPKBPayment.btnPay.Enabled := True;
           //frmPKBPayment.btnCariCustomer.Visible := False;
       end;
   frmCariMasterPKB.Close;
end;

procedure TfrmCariMasterPKB.InputPKB;
var
  recSel : Integer;
  noPKB : String;
begin
   recSel := gtbList.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   noPKB := vartostr(gtbList.DataController.GetValue(recSel, gtbListpkbnumber.Index));
   qryCari1.Close;
   qryCari1.SQL.Clear;
   qryCari1.SQL.Add('select * from ben_bengkel_pkb where pkbnumber = '''  + noPKB + '''');
   qryCari1.Open;

   qryCari2.Close;
   qryCari2.SQL.Clear;
   qryCari2.SQL.Add('select * from ben_bengkel_customer where codecust = ''' +
       qryCari1.Fields[4].AsString + '''');
   qryCari2.Open;
   with frmMasterPKB do
       begin
           edPKBNumb.Text := qryCari1.Fields[1].AsString;
           edTglPKB.Date :=  qryCari1.Fields[2].AsDateTime;
           edjamPKB.Time :=  qryCari1.Fields[3].AsDateTime;
           edKodeKonsumen.Text := qryCari1.Fields[4].AsString;
           edkeluhan.Text := qryCari1.Fields[5].AsString;
           edTglSelesai.Date :=  qryCari1.Fields[7].AsDateTime;
           edJamSelesai.Time :=  qryCari1.Fields[8].AsDateTime;
           edKilometer.Text := qryCari1.Fields[6].AsString;

           edPlatNomor.Text := qryCari2.Fields[2].AsString;
           edNamaKonsumen.Text := qryCari2.Fields[3].AsString;
           edKirimMobil.Date := qryCari2.Fields[9].AsDateTime;
           edTypeMobil.EditValue := qryCari2.Fields[10].AsString;
           edWarnaMobil.Text := qryCari2.Fields[11].AsString;
           edTahunMobil.Text := qryCari2.Fields[12].AsString;
           //edPlatNomor.Text := qryCari2.Fields[2].AsString;

           qryDetails.Close;
           qryDetails.SQL.Clear;
           qryDetails.SQL.Add('select * from ben_bengkel_pkb_detail where ' +
                      'pkbnumber = ''' + edPKBNumb.Text + ''' AND isdelete = ''' + 'N' + '''');
           qryDetails.Open;
           frmMasterPKB.gtbPKB.DataController.Refresh;
           frmMasterPKB.btnCariCustomer.Visible := False;
       end;
   frmCariMasterPKB.Close;
end;

procedure TfrmCariMasterPKB.btnSelectClick(Sender: TObject);
begin
     case btnSelect.Tag of
        1 : InputPKB;
        2 : InputPayment;
        3 : ReOpenPKB;
     end;

end;

procedure TfrmCariMasterPKB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    qryCari1.Free;
    qryCari2.Free;
    qryCari3.Free;
    Action := caFree;
end;

procedure TfrmCariMasterPKB.FormCreate(Sender: TObject);
begin
   qryCari1 := TMyQuery.Create(Self);
   qryCari1.Connection := DMDB.dbInternal;
   qryCari1.SQL.Add('select * from temptable');
   qryCari1.Active := true;

   qryCari2 := TMyQuery.Create(Self);
   qryCari2.Connection := DMDB.dbInternal;
   qryCari2.SQL.Add('select * from temptable');
   qryCari2.Active := true;

   qryCari3 := TMyQuery.Create(Self);
   qryCari3.Connection := DMDB.dbInternal;
   qryCari3.SQL.Add('select * from temptable');
   qryCari3.Active := true;
end;

end.
