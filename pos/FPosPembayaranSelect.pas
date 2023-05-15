unit FPosPembayaranSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, MyAccess,
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
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmPosPembayaranSelect = class(TForm)
    qrySelect: TMyQuery;
    dsQrySelect: TMyDataSource;
    gtbSelect: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    lblJudulAtas: TLabel;
    edTanggal: TcxDateEdit;
    gtbSelecttrans_id: TcxGridDBColumn;
    gtbSelectstatus_trans: TcxGridDBColumn;
    gtbSelectnama_customer: TcxGridDBColumn;
    gtbSelectroom_id: TcxGridDBColumn;
    gtbSelecttherapist_id: TcxGridDBColumn;
    gtbSelectpromo: TcxGridDBColumn;
    btnSelect: TcxButton;
    btnRefresh: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryCari, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmPosPembayaranSelect: TfrmPosPembayaranSelect;

implementation

{$R *.dfm}

uses FMain, FdmDB, FPosPembayaran;

procedure TfrmPosPembayaranSelect.btnRefreshClick(Sender: TObject);
begin
  qrySelect.Close;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Add('select trans_id, status_trans, nama_customer, room_id, therapist_id, ' +
       'promo from trans_master where promo = ''' + 'S' + ''' ' +
       'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''' ' +
       'ORDER BY trans_id ASC');
  qrySelect.Open;
  gtbSelect.DataController.Refresh;
end;

procedure TfrmPosPembayaranSelect.btnSelectClick(Sender: TObject);
var
  recSel, i, newRecc : Integer;
  idTrans, keterangan : String;
begin
   recSel := gtbSelect.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   idTrans := vartostr(gtbSelect.DataController.GetValue(recSel, gtbSelecttrans_id.Index));
   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select trans_id, nama_customer, room_id, therapist_id, subtotal ' +
       'from trans_master where trans_id = ''' + idTrans + '''');
   qryCari.Open;
   with frmPosPembayaran do
     begin
       lblNoKartu.Caption := '';
       lblKodeMember.Caption := '';
       edMemberNama.Text := qryCari.Fields[1].AsString;
       edMemberPoint.EditValue :=0;
       newRecc := tvPembayaran.DataController.InsertRecord(tvPembayaran.DataController.RecordCount);
       tvPembayaran.DataController.SetValue(newRecc, tvPembayaranTransID.Index, idTrans);
       tvPembayaran.DataController.SetValue(newRecc, tvPembayaranIDTrans.Index, idTrans);
       tvPembayaran.DataController.SetValue(newRecc, tvPembayaranNamaCust.Index, qryCari.Fields[1].AsString);
       tvPembayaran.DataController.SetValue(newRecc, tvPembayaranRuangan.Index, qryCari.Fields[2].AsString);
       tvPembayaran.DataController.SetValue(newRecc, tvPembayaranTherapist.Index, qryCari.Fields[3].AsString);
       tvPembayaran.DataController.SetValue(newRecc, tvPembayaranSubtotal.Index, qryCari.Fields[4].AsFloat);
       tvPembayaran.DataController.PostEditingData;
       tvPembayaran.DataController.Post(True);

       qrySearch.Close;
       qrySearch.SQL.Clear;
       qrySearch.SQL.Add('select id_trans, produk_jasa_nama, subtotal, trans_type_id from trans_detail ' +
           'where id_trans = ''' + idTrans + '''');
       qrySearch.Open;
       qrySearch.First;
       for i := 0 to qrySearch.RecordCount-1 do
         begin
            newRecc := tvPembayaran.DataController.InsertRecord(tvPembayaran.DataController.RecordCount);
            tvPembayaran.DataController.SetValue(newRecc, tvPembayaranIDTrans.Index, idTrans);
            tvPembayaran.DataController.SetValue(newRecc, tvPembayaranDetails.Index, qrySearch.Fields[1].AsString);
            tvPembayaran.DataController.SetValue(newRecc, tvPembayaranHarga.Index, qrySearch.Fields[2].AsFloat);
            //tvPembayaran.DataController.SetValue(newRecc, tvPembayaranSubtotal.Index, 0);
            tvPembayaran.DataController.PostEditingData;
            tvPembayaran.DataController.Post(True);
            {if (qrySearch.Fields[3].AsString = 'BJ') then
                edSubtotal.EditValue := edJasa.EditValue + qrySearch.Fields[2].AsFloat;
            if (qrySearch.Fields[3].AsString = 'BA') then
                edSubtotal.EditValue := edAdditional.EditValue + qrySearch.Fields[2].AsFloat;
            if (qrySearch.Fields[3].AsString = 'BP') then
                edSubtotal.EditValue := edProduk.EditValue + qrySearch.Fields[2].AsFloat;
            if (qrySearch.Fields[3].AsString = 'BG') then
                edSubtotal.EditValue := edGift.EditValue + qrySearch.Fields[2].AsFloat;}
            qrySearch.Next;
         end;

     end;
   keterangan := frmMain.USERAPPS + ' @ ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'promo = ''' + 'L' + ''', ' +
       'cabang = ' + QuotedStr(keterangan) + ' ' +
       'where trans_id = ''' + idTrans + ''';');
   qryExec.ExecSQL;
   frmPosPembayaran.HitungTypeMenu;
   frmPosPembayaranSelect.Close;
end;

procedure TfrmPosPembayaranSelect.FormCreate(Sender: TObject);
begin
   edTanggal.Date := Date;
   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from temptable');
   qrySearch.Active := true;

   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;

   if (frmPosPembayaranSelect.Tag = 0) then
     begin
       qrySearch.Close;
       qrySearch.SQL.Clear;
       qrySearch.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
       qrySearch.Open;
       edTanggal.Date := qrySearch.Fields[0].AsDateTime;
     end;


  qrySelect.Active := True;
  qrySelect.Close;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Add('select trans_id, status_trans, nama_customer, room_id, therapist_id, ' +
       'promo from trans_master where promo = ''' + 'S' + ''' ' +
       'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''' ' +
       'ORDER BY trans_id ASC');
  qrySelect.Open;
  gtbSelect.DataController.Refresh;

end;

end.
