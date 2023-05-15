unit FSelectGC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, DB,
  cxDBData, cxGridDBTableView, cxCheckBox, cxCalc, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxContainer, cxTextEdit, StdCtrls, Menus,
  cxLookAndFeelPainters, cxButtons, cxButtonEdit, cxLookAndFeels, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinscxPCPainter,
  cxNavigator, DBAccess, MyAccess, MemDS;

type
  TfrmSelectGC = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edSelectIDPaket: TcxTextEdit;
    edSelectTerbit: TcxDateEdit;
    edSelectKadaluarsa: TcxDateEdit;
    edSelectJual: TcxCalcEdit;
    edSelectAktif: TcxCheckBox;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvPaket: TcxGridTableView;
    gtvPaketGCID: TcxGridColumn;
    gtvPaketNama: TcxGridColumn;
    gtvPaketHarga: TcxGridColumn;
    cxGrid2: TcxGrid;
    tvAvailable: TcxGridTableView;
    tvAvailableIDGC: TcxGridColumn;
    tvAvailableNama: TcxGridColumn;
    tvAvailableHarga: TcxGridColumn;
    tvAvailableBtn: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    Label2: TLabel;
    edSelectItems: TcxCalcEdit;
    btnPost: TcxButton;
    btnCancel: TcxButton;
    tvAvailablePaketNumber: TcxGridColumn;
    qryGC: TMyQuery;
    dsQryGC: TMyDataSource;
    tblPaketGC: TMyQuery;
    dsTblPaketGC: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvAvailableBtnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnPostClick(Sender: TObject);
    procedure gtvPaketTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmSelectGC: TfrmSelectGC;

implementation

uses FDMdb;

{$R *.dfm}

procedure TfrmSelectGC.FormCreate(Sender: TObject);
begin
     qryGC.Close;
     qryGC.SQL.Clear;
     qryGC.SQL.Add('select * from gc_detail where paket_number = ''' +
                   'NONE' + '''');
     qryGC.Open;

end;

procedure TfrmSelectGC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmSelectGC.tvAvailableBtnPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
   recSelect, newRec : Integer;
   id_gc, nama_jasa : String;
   harga : Double;
begin
     recSelect := tvAvailable.DataController.GetFocusedRecordIndex;
     id_gc := vartostr(tvAvailable.DataController.GetValue(recSelect, tvAvailableIDGC.Index));
     nama_jasa := vartostr(tvAvailable.DataController.GetValue(recSelect, tvAvailableNama.Index));
     harga := tvAvailable.DataController.GetValue(recSelect, tvAvailableHarga.Index);
     newRec := gtvPaket.DataController.InsertRecord(gtvPaket.DataController.RecordCount);
     gtvPaket.DataController.SetValue(newRec, gtvPaketGCID.Index, id_gc);
     gtvPaket.DataController.SetValue(newRec, gtvPaketNama.Index, nama_jasa);
     gtvPaket.DataController.SetValue(newRec, gtvPaketHarga.Index, harga);
     gtvPaket.DataController.PostEditingData;
     gtvPaket.DataController.Post;

     tvAvailable.DataController.DeleteRecord(recSelect);
end;

procedure TfrmSelectGC.btnPostClick(Sender: TObject);
var
   i, recSelect : Integer;
   aktif, id_gc  : String;
begin
     aktif := 'N';
     if (edSelectAktif.Checked = True) then
         begin
              aktif := 'Y';
         end;

               qryExec.Sql.Clear;
               qryExec.Sql.Add('update gc_detail set ' +
                               'paket_number = ''' + 'NONE' + ''', ' +
                               'aktif = ''' + 'N' + ''' ' +
                               'where paket_number = ''' + edSelectIDPaket.Text + '''');
               qryExec.ExecSql;

               qryExec.Sql.Clear;
               qryExec.Sql.Add('update gc_master set ' +
                               'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edSelectTerbit.Date) + ''', ' +
                               'expired_date = ''' + FormatDateTime('yyyy-MM-dd', edSelectKadaluarsa.Date) + ''', ' +
                               'total_items = ''' + VarToStr(edSelectItems.EditValue) + ''', ' +
                               'terjual = ''' + 'N' + ''', ' +
                               'harga_jual = ''' + VarToStr(edSelectJual.EditValue) + ''', ' +
                               'aktif = ''' + aktif + ''' ' +
                               'where paket_number = ''' + edSelectIDPaket.Text + '''');
               qryExec.ExecSql;

               gtvPaket.DataController.GotoFirst;
               for i:=0 to gtvPaket.DataController.RecordCount-1 do
                   begin

                        recSelect := gtvPaket.DataController.GetFocusedRecordIndex;
                        id_gc := vartostr(gtvPaket.DataController.GetValue(recSelect, gtvPaketGCID.Index));
                        qryExec.Sql.Clear;
                        qryExec.Sql.Add('update gc_detail set ' +
                               'paket_number = ''' + edSelectIDPaket.Text + ''', ' +
                               'aktif = ''' + aktif + ''' ' +
                               'where gc_number = ''' + id_gc + '''');
                        qryExec.ExecSql;

                        gtvPaket.DataController.GotoNext;
                   end;

     tblPaketGC.Refresh;
     Close;


end;

procedure TfrmSelectGC.gtvPaketTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
     if AValue = Null then
        begin
             edSelectItems.EditValue := 0;
        end
     else
         begin
              edSelectItems.EditValue := AValue;
         end;
end;

procedure TfrmSelectGC.btnCancelClick(Sender: TObject);
begin
     Close;
end;

end.
