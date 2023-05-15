unit FBrowse1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls, Menus,
  cxLookAndFeelPainters, ShellApi, cxButtons, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGrid, cxGridExportLink, cxCalc, DB, cxDBData, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridDBTableView, cxDBLookupComboBox,
  cxCheckBox, cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, MemDS, DBAccess, MyAccess ;

type
  TfrmBrowse1 = class(TForm)
    pmBrowse: TPopupMenu;
    expand1: TMenuItem;
    Collapse1: TMenuItem;
    cxGrid1: TcxGrid;
    TvTrans: TcxGridDBTableView;
    TvTransid_faktur: TcxGridDBColumn;
    TvTransno_nota: TcxGridDBColumn;
    TvTranstanggal: TcxGridDBColumn;
    TvTranstrans_id: TcxGridDBColumn;
    TvTransDoz: TcxGridDBColumn;
    TvTransPcs: TcxGridDBColumn;
    TvTranstot_qty: TcxGridDBColumn;
    TvTranssubTotal: TcxGridDBColumn;
    TvTransdiscount: TcxGridDBColumn;
    TvTransretur: TcxGridDBColumn;
    TvTransgrandtotal: TcxGridDBColumn;
    TvTransnama_cust: TcxGridDBColumn;
    TvTranspayment_id: TcxGridDBColumn;
    TvTransstock: TcxGridDBColumn;
    TvTransnotes: TcxGridDBColumn;
    TvTransid_toko: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    btnSelect: TcxButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edCari: TcxTextEdit;
    cxButton3: TcxButton;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    btnOK: TcxButton;
    edTgl2: TEdit;
    edTglShow: TEdit;
    edAll: TcxCheckBox;
    qryTrans1: TMyQuery;
    dsQryTrans1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure TvTransDozGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure TvTransPcsGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cxButton3Click(Sender: TObject);
    procedure expand1Click(Sender: TObject);
    procedure Collapse1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edStartPropertiesChange(Sender: TObject);
    procedure edEndPropertiesChange(Sender: TObject);
    procedure edAllPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    qrySearchKiri, qryCariKiri2, qryCariKiri : TMyQuery;
  public
    //doz : double;
    { Public declarations }
  end;

var
  frmBrowse1: TfrmBrowse1;

implementation

uses FdmDB, FMaster1;

{$R *.dfm}

procedure TfrmBrowse1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmBrowse1.FormCreate(Sender: TObject);
begin
     qrySearchKiri := TMyQuery.Create(Self);
     qrySearchKiri.Connection := DMDB.dbInternal;
     qrySearchKiri.SQL.Add('select * from temptable');
     qrySearchKiri.Active := true;

     qryCariKiri2 := TMyQuery.Create(Self);
     qryCariKiri2.Connection := DMDB.dbInternal;
     qryCariKiri2.SQL.Add('select * from temptable');
     qryCariKiri2.Active := true;

     qryCariKiri := TMyQuery.Create(Self);
     qryCariKiri.Connection := DMDB.dbInternal;
     qryCariKiri.SQL.Add('select * from temptable');
     qryCariKiri.Active := true;

     TvTrans.DataController.Refresh;
     edStart.Date := Date;
     edEnd.Date := Date;

     edTglShow.Text := FormatDateTime('dd-mm-yyyy',Now);
     edTgl2.Text := FormatDateTime('dd-mm-yyyy',Now);
end;

procedure TfrmBrowse1.btnSelectClick(Sender: TObject);
var
   recSelect, i, newRecord : integer;
   status, idtrans, idFaktur, note : String;
begin
  with frmMaster1 do
   begin
     btnSelect.Enabled := false;
     recSelect := TvTrans.DataController.GetFocusedRecordIndex;
     idFaktur := vartostr(TvTrans.DataController.GetValue(recSelect, TvTransid_faktur.Index));
     gtvItem.DataController.SelectAll;
     gtvItem.DataController.DeleteSelection;


     with dmDB do
        begin
            qrySearchKiri.Close;
            qrySearchKiri.SQL.Clear;
            qrySearchKiri.SQL.Add('Select * from trans1 ' +
                                  'where id_faktur =''' + idFaktur + '''');
            qrySearchKiri.Open;
            
            edFaktur.EditValue := idFaktur ;
            edTanggal.EditValue := qrySearchKiri.Fields[1].AsDateTime;
            lcbTransID.EditValue := qrySearchKiri.Fields[3].AsString;
            idtrans := qrySearchKiri.Fields[3].AsString;
            EQty.EditValue := qrySearchKiri.Fields[4].AsFloat;
            EdSubTotal.EditValue := qrySearchKiri.Fields[5].AsFloat;
            edDiscount.EditValue := qrySearchKiri.Fields[6].AsFloat;
            edRetur.EditValue := qrySearchKiri.Fields[7].AsFloat;
            edGrand.EditValue := qrySearchKiri.Fields[8].AsFloat;
            edCustomer.Text := qrySearchKiri.Fields[9].AsString;
            edPayment.EditValue := qrySearchKiri.Fields[10].AsString;
            note := qrySearchKiri.Fields[12].AsString;
            edDP.EditValue := qrySearchKiri.Fields[14].AsFloat;
            edSisaBayar.EditValue := qrySearchKiri.Fields[15].AsFloat;
            edUser.EditValue := qrySearchKiri.Fields[16].AsString;
            edPayment2.Text := qrySearchKiri.Fields[18].AsString;
            edBayar2.EditValue := qrySearchKiri.Fields[19].AsFloat;
            edNamaBank.Text := qrySearchKiri.Fields[20].AsString;
            edNoGiro.Text := qrySearchKiri.Fields[21].AsString;
            edJatuhTempo.EditValue := qrySearchKiri.Fields[22].AsDateTime;
            edTotBayar.EditValue := qrySearchKiri.Fields[23].AsFloat;
            edKembalian.EditValue := qrySearchKiri.Fields[24].AsFloat;
            
            qryCariKiri2.Close;
            qryCariKiri2.SQL.Clear;
            qryCariKiri2.SQL.Add('Select * from trans_id ' +
                                 'Where id_trans = ''' + qrySearchKiri.Fields[3].AsString + '''');
            qryCariKiri2.Open;
            
            status := qryCariKiri2.Fields[3].AsString;
            if( status = 'in') then
               begin
                   cbJenisTrans.EditValue := 'Masuk' ;
                   cbJenisTrans.PostEditValue;
               end
            else
               begin
                   cbJenisTrans.EditValue := 'Keluar' ;
                   cbJenisTrans.PostEditValue;
               end;
            
            
            if( (idtrans = 'MMT') or (idtrans = 'KKT') or (idtrans = 'MRT') or (idtrans = 'KRT')) then
              begin
                edNotes.Visible := false;
                edToko.Visible := true;
                edToko.EditValue := note;
                edToko.PostEditValue;
              end
             else
               begin
                 edNotes.Visible := true;
                 edToko.Visible := false;
                 edNotes.Clear;
                 edNotes.EditValue := note;
                 edNotes.PostEditValue;
               end;

            qryCariKiri.Close;
            qryCariKiri.SQL.Clear;
            qryCariKiri.SQL.Add('Select * from trans_detail1 ' +
                            'where faktur_id =''' + idFaktur + ''' ORDER BY no_urut ASC');
            qryCariKiri.Open;
            qryCariKiri.First;

            for i:=0 to qryCariKiri.RecordCount-1 do
              begin
                newRecord := gtvItem.DataController.InsertRecord(gtvItem.DataController.RecordCount);
                gtvItem.DataController.SetValue(newRecord,gtvItemNo.Index, newRecord+1);
                gtvItem.DataController.SetValue(newRecord,gtvItemId.Index, qryCariKiri.Fields[3].AsString);
                gtvItem.DataController.SetValue(newRecord,gtvItemJenis.Index, qryCariKiri.Fields[4].AsString);
                gtvItem.DataController.SetValue(newRecord,gtvItemDoz.Index, qryCariKiri.Fields[6].AsFloat);
                gtvItem.DataController.SetValue(newRecord,gtvItemPcs.Index, qryCariKiri.Fields[7].AsFloat);
                gtvItem.DataController.SetValue(newRecord,gtvItemQty.Index, qryCariKiri.Fields[8].AsFloat);
                gtvItem.DataController.SetValue(newRecord,gtvItemHarga.Index, qryCariKiri.Fields[10].AsFloat);
                gtvItem.DataController.SetValue(newRecord,gtvItemSubTotal.Index, qryCariKiri.Fields[11].AsFloat);
                gtvItem.DataController.SetValue(newRecord,gtvItemKet.Index, qryCariKiri.Fields[9].AsString);
                gtvItem.DataController.PostEditingData;
                gtvItem.DataController.Post;
                qryCariKiri.Next;
              end;
              //gtvItem.DataController.FocusedRecordIndex := gtvItem.DataController.RecordCount-1;
       end;
       btnSelect.Enabled := true;
       //frmBrowse1.Close;
   end;
end;

procedure TfrmBrowse1.TvTransDozGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  rqty : double;
  iqty, idoz: integer;
begin
     rqty := StrToFloat(AText);
     iqty := Round(rqty);
     idoz := iqty div 12;
     //rdoz := StrToFloat(IntToStr(idoz)) + doz;
     AText := IntToStr(idoz);
end;

procedure TfrmBrowse1.TvTransPcsGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  rqty : double;
  iqty, ipcs: integer;
begin
     rqty := StrToFloat(AText);
     iqty := Round(rqty);
     ipcs := iqty mod 12;
     AText := IntToStr(ipcs)
     //rpcs  := StrToFloat(IntToStr(ipcs));
    {if((rpcs > 0) and (rpcs >= 6) and (rpcs < 12)) then
        begin
          rpcs := rpcs - 6;
          AText := FloatToStr(rpcs);
          doz := 0.5;
        end
     else
     if((rpcs < 0) and (rpcs >= -6) and (rpcs > -12)) then
        begin
          //ShowMessage('Negatif');
          rpcs := rpcs + 6;
          AText := FloatToStr(rpcs);
          doz := -0.5;
        end
     else
       begin
           AText :=  FloatToStr(rpcs);
           doz := 0;
       end;  }
     //AText := IntToStr(ipcs);
end;

procedure TfrmBrowse1.cxButton3Click(Sender: TObject);
var
  ada: boolean;
  idfaktur : string;
begin
     idfaktur := edCari.Text;
     ada := TvTrans.DataController.Search.Locate(TvTransid_faktur.Index, idfaktur);
     if (ada = True) then
        TvTrans.DataController.GetFocusedRecordIndex
     else
        ShowMessage('No. Faktur Tidak Ditemukan');

end;

procedure TfrmBrowse1.expand1Click(Sender: TObject);
begin
    TvTrans.ViewData.Expand(True);
end;

procedure TfrmBrowse1.Collapse1Click(Sender: TObject);
begin
    TvTrans.ViewData.Collapse(True);
end;

procedure TfrmBrowse1.btnOKClick(Sender: TObject);
begin
     with dmDB do
        begin
            qryTrans1.Close;
            qryTrans1.SQL.Clear;
            qryTrans1.SQL.Add('SELECT * FROM trans1 ' +
                              'WHERE tanggal >= ''' + FormatDateTime('YYYY-mm-dd',edStart.EditValue)+ ''' AND ' +
                              'tanggal <= ''' + FormatDateTime('YYYY-mm-dd',edEnd.EditValue) + '''ORDER BY tanggal DESC');
            qryTrans1.Open;
            TvTrans.ViewData.Expand(True);
            TvTrans.DataController.GotoFirst;
        end;
end;

procedure TfrmBrowse1.edStartPropertiesChange(Sender: TObject);
begin
        edTglShow.Text := FormatDateTime('dd-mm-yyyy',edStart.EditValue);
end;

procedure TfrmBrowse1.edEndPropertiesChange(Sender: TObject);
begin
        edTgl2.Text := FormatDateTime('dd-mm-yyyy',edStart.EditValue);
end;

procedure TfrmBrowse1.edAllPropertiesChange(Sender: TObject);
begin
   {with dmDB  do
      begin
        if(edAll.Checked = true) then
           begin
                qryTrans1.Close;
                qryTrans1.SQL.Clear;
                qryTrans1.SQL.Add('SELECT * FROM trans1 ORDER BY tanggal DESC');
                qryTrans1.Open;
                TvTrans.ViewData.Expand(true);
                TvTrans.DataController.GotoFirst;
           end;
      end;}

end;

end.
