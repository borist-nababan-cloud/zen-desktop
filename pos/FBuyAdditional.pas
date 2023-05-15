unit FBuyAdditional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridLevel, cxGrid, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, AppEvnts, StrUtils,
  cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MyAccess, cxContainer, cxDropDownEdit, cxCalc, cxTextEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, MemDS, DBAccess, cxGroupBox,
  cxRadioGroup, XSuperJSON, XSuperObject, DateUtils;

type
  TfrmBuyAdditional = class(TForm)
    rbTypeJasa: TcxRadioGroup;
    dsQryMenu: TDataSource;
    QryMenu: TMyQuery;
    Label10: TLabel;
    edNamaMenu: TcxLookupComboBox;
    Label3: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    edHarga: TcxCalcEdit;
    btnFinish: TcxButton;
    edDiscount: TcxCalcEdit;
    btnCancel: TcxButton;
    edNett: TcxCalcEdit;
    Label6: TLabel;
    lblKodeTrans: TLabel;
    Waktu: TLabel;
    edLama: TcxCalcEdit;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFinishClick(Sender: TObject);
    procedure edNamaMenuKeyPress(Sender: TObject; var Key: Char);
    procedure edNamaMenuPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryCari, qryFind, qryExec : TMyQuery;
  public
    { Public declarations }
    ID_TR, ID_ROOM, strPacket, CUSTNAME : String;
    PACKETHH : Boolean;
    varJam : TTime;
    varTanggal : TDate;
  end;

var
  frmBuyAdditional: TfrmBuyAdditional;

implementation

uses FDMDB, FPos, FPosTransMain, FMain;

{$R *.dfm}

procedure TfrmBuyAdditional.btnFinishClick(Sender: TObject);
var
  keterangan, gender, strTypeJasa, strPacket, strJson : String;
  subtotal : Double;
  newRec, totLama : Integer;
  wStart, wEnd : TTime;
  jSonItem : XSuperObject.ISuperObject;
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select menu_id, harga, lama, disc_hh, disc_normal, harga_hh, harga_normal from ' +
      'main_menu where menu_id = ''' + VarToStr(edNamaMenu.EditValue) + '''');
   qrySearch.Open;
   //ShowMessage('1');
   edLama.EditValue := qrySearch.Fields[2].AsInteger;
   edHarga.EditValue := qrySearch.Fields[1].AsFloat;
   if (PACKETHH = True) then
     begin
       edDiscount.EditValue := qrySearch.Fields[3].AsFloat;
       edNett.EditValue := qrySearch.Fields[5].AsFloat;
       strPacket := 'Y';
     end
   else if (PACKETHH = False) then
     begin
       edDiscount.EditValue := qrySearch.Fields[4].AsFloat;
       edNett.EditValue := qrySearch.Fields[6].AsFloat;
       strPacket := 'N';
     end;
   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd', varTanggal) + '@' + FormatDateTime('hh:mm:ss', varJam);
   if (rbTypeJasa.ItemIndex = 0) then strTypeJasa := 'RF'
   else if (rbTypeJasa.ItemIndex = 1) then strTypeJasa := 'BM';

   //jSonItem :=  XSuperObject.SO('{}');
   //jSonItem.S['typejasa'] := strTypeJasa;
   //jSonItem.S['user'] := frmMain.USERAPPS;
   //jSonItem.D['date'] := varTanggal;
   //jSonItem.Time['time'] := varJam;
   //strJson := jSonItem.AsJSON(False, False);
   //ShowMessage(FormatDateTime('dd MMMM yyyy', varTanggal) + '#' + FormatDateTime('hh:mm:ss', varJam));

   qryExec.SQL.Clear;
   qryExec.SQL.Add('INSERT INTO trans_detail VALUES(' +
                    '''' + '' + ''', ' +
                    '''' + lblKodeTrans.Caption + ''', ' +
                    '''' + FormatDateTime('yyyy-MM-dd', varTanggal) + ''', ' +
                    '''' + 'BA' + ''', ' +
                    QuotedStr(vartostr(edNamaMenu.EditValue)) + ',' +
                    QuotedStr(edNamaMenu.Text) + ',' +
                    '''' + FormatDateTime('hh:mm:ss', varJam) + ''', ' +
                    '''' + FormatDateTime('hh:mm:ss', varJam) + ''', ' +
                    '''' + vartostr(edHarga.EditValue) + ''', ' +
                    '''' + '0' + ''', ' +
                    '''' + vartostr(edDiscount.EditValue) + ''', ' +
                    '''' + vartostr(edNett.EditValue) + ''', ' +
                    '''' + ID_TR + ''', ' +
                    '''' + ID_ROOM + ''', ' +
                    '''' + '1' + ''', ' +
                    '''' + '' + ''', ' +
                    '''' + vartostr(edLama.EditValue) + ''', ' +
                    '''' + '(NONE)' + ''', ' +
                    QuotedStr(CUSTNAME) + ',' +
                    '''' + strPacket + ''', ' +
                    '''' + '(NONE)' + ''', ' +
                    '''' + 'N' + ''', ' +
                    QuotedStr(keterangan) + ');');
   qryExec.ExecSQL;
   //ShowMessage('4');
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select sum(lama) from trans_detail where id_trans = ''' +
       lblKodeTrans.Caption + '''');
   qrySearch.Open;
   totLama := qrySearch.Fields[0].AsInteger;

   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select sum(subtotal) from trans_detail where id_trans = ''' +
       lblKodeTrans.Caption + '''');
   qryFind.Open;
   subtotal := qryFind.Fields[0].AsFloat;

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select start_time from trans_master where trans_id = ''' +
      lblKodeTrans.Caption + '''');
   qryCari.Open;
   wStart := qryCari.Fields[0].AsDateTime;
   wEnd := IncMinute(wStart, totLama);
   //ShowMessage('5');
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
      'end_time = ''' + FormatDateTime('hh:mm:ss', wEnd) + ''',' +
      'subtotal = ''' + FloatToStr(subtotal) + ''',' +
      'promo = ''' + 'S' + ''',' +
      'cabang = ' + QuotedStr(keterangan) + ' ' +
      'where trans_id = ''' + lblKodeTrans.Caption + ''';');
   qryExec.ExecSQL;
   //ShowMessage('6');
   //frmPosTransMain.gtbMaster.DataController.GotoLast;
   frmPosTransMain.qryMaster.Refresh;
   frmPosTransMain.gtbMaster.DataController.Refresh;
   frmPosTransMain.qryDetails.Refresh;
   frmPosTransMain.tbDetails.DataController.Refresh;
   frmBuyAdditional.Close;
   //ShowMessage('7');
end;

procedure TfrmBuyAdditional.edNamaMenuKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
     begin
       qrySearch.Close;
       qrySearch.SQL.Clear;
       qrySearch.SQL.Add('select menu_id, harga, lama, disc_hh, disc_normal, harga_hh, harga_normal from ' +
            'main_menu where menu_id = ''' + VarToStr(edNamaMenu.EditValue) + '''');
       qrySearch.Open;


       edLama.EditValue := qrySearch.Fields[2].AsInteger;
       edHarga.EditValue := qrySearch.Fields[1].AsFloat;
       if (PACKETHH = True) then
         begin
           edDiscount.EditValue := qrySearch.Fields[3].AsFloat;
           edNett.EditValue := qrySearch.Fields[5].AsFloat;
         end
       else if (PACKETHH = False) then
         begin
           edDiscount.EditValue := qrySearch.Fields[4].AsFloat;
           edNett.EditValue := qrySearch.Fields[6].AsFloat;
         end;

       edNett.SetFocus;
     end;
end;

procedure TfrmBuyAdditional.edNamaMenuPropertiesEditValueChanged(
  Sender: TObject);
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select menu_id, harga, lama, disc_hh, disc_normal, harga_hh, harga_normal from ' +
        'main_menu where menu_id = ''' + VarToStr(edNamaMenu.EditValue) + '''');
   qrySearch.Open;


   edLama.EditValue := qrySearch.Fields[2].AsInteger;
   edHarga.EditValue := qrySearch.Fields[1].AsFloat;
   if (PACKETHH = True) then
     begin
       edDiscount.EditValue := qrySearch.Fields[3].AsFloat;
       edNett.EditValue := qrySearch.Fields[5].AsFloat;
     end
   else if (PACKETHH = False) then
     begin
       edDiscount.EditValue := qrySearch.Fields[4].AsFloat;
       edNett.EditValue := qrySearch.Fields[6].AsFloat;
     end;
end;

procedure TfrmBuyAdditional.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'promo = ''' + 'S' + ''' ' +
       'where trans_id = ''' + lblKodeTrans.Caption + ''';');
   qryExec.ExecSQL;

   frmPosTransMain.qryMaster.Refresh;
   frmPosTransMain.gtbMaster.DataController.Refresh;
   frmPosTransMain.qryDetails.Refresh;
   frmPosTransMain.tbDetails.DataController.Refresh;

   qrySearch.Free;
   qryFind.Free;
   qryCari.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmBuyAdditional.FormCreate(Sender: TObject);
begin
   //qrySearch, qryCari, qryFind : TMyQuery;
    qrySearch := TMyQuery.Create(Self);
    qrySearch.Connection := dmDB.dbInternal;
    qrySearch.SQL.Add('select * from temptable');
    qrySearch.Active := true;

    qryCari := TMyQuery.Create(Self);
    qryCari.Connection := dmDB.dbInternal;
    qryCari.SQL.Add('select * from temptable');
    qryCari.Active := true;

    qryFind := TMyQuery.Create(Self);
    qryFind.Connection := dmDB.dbInternal;
    qryFind.SQL.Add('select * from temptable');
    qryFind.Active := true;

    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := dmDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

end;

end.
