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
  cxNavigator, MyAccess, MemDS, DBAccess;

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
    cxGridLevel1: TcxGridLevel;
    Label2: TLabel;
    edSelectItems: TcxCalcEdit;
    btnPost: TcxButton;
    btnCancel: TcxButton;
    tvAvailablePaketNumber: TcxGridColumn;
    btnRemove: TcxButton;
    btnAdd: TcxButton;
    cxButton1: TcxButton;
    qryOnPaket: TMyQuery;
    qryAvailable: TMyQuery;
    dsQryAvailable: TDataSource;
    dsQryOnPaket: TDataSource;
    Label6: TLabel;
    edTotalHarga: TcxCalcEdit;
    gtbOnPaket: TcxGridDBTableView;
    gtbAvailable: TcxGridDBTableView;
    gtbOnPaketpaket_number: TcxGridDBColumn;
    gtbOnPaketgc_number: TcxGridDBColumn;
    gtbOnPaketnama_menu: TcxGridDBColumn;
    gtbOnPaketharga_jual: TcxGridDBColumn;
    gtbAvailablepaket_number: TcxGridDBColumn;
    gtbAvailablegc_number: TcxGridDBColumn;
    gtbAvailablenama_menu: TcxGridDBColumn;
    gtbAvailableharga_jual: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gtbOnPaketTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
  private
    { Private declarations }
    qryExec, qryPacks1, qryPacks2 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmSelectGC: TfrmSelectGC;

implementation

uses FDMdb;

{$R *.dfm}

procedure TfrmSelectGC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmSelectGC.FormCreate(Sender: TObject);
begin
     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from temptable');
     qryExec.Active := true;

     qryPacks1 := TMyQuery.Create(Self);
     qryPacks1.Connection := DMDB.dbInternal;
     qryPacks1.SQL.Add('select * from temptable');
     qryPacks1.Active := true;

     qryPacks2 := TMyQuery.Create(Self);
     qryPacks2.Connection := DMDB.dbInternal;
     qryPacks2.SQL.Add('select * from temptable');
     qryPacks2.Active := true;
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
       qryExec.Close;
       qryExec.SQL.Clear;
       qryExec.Sql.Clear;
       qryExec.Sql.Add('update gc_detail set ' +
                       'paket_number = ''' + 'NONE' + ''', ' +
                       'aktif = ''' + 'N' + ''' ' +
                       'where paket_number = ''' + edSelectIDPaket.Text + ''';');
       qryExec.ExecSql;


       qryExec.Sql.Add('update gc_master set ' +
                       'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edSelectTerbit.Date) + ''', ' +
                       'expired_date = ''' + FormatDateTime('yyyy-MM-dd', edSelectKadaluarsa.Date) + ''', ' +
                       'total_items = ''' + VarToStr(edSelectItems.EditValue) + ''', ' +
                       'terjual = ''' + 'N' + ''', ' +
                       'harga_jual = ''' + VarToStr(edSelectJual.EditValue) + ''', ' +
                       'aktif = ''' + aktif + ''' ' +
                       'where paket_number = ''' + edSelectIDPaket.Text + ''';');
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

     //dmDB.tblPaketGC.Refresh;
     Close;


end;

procedure TfrmSelectGC.gtbOnPaketTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
     if (AValue = null) then edTotalHarga.EditValue := 0
     else if (AValue <> null) then edTotalHarga.EditValue := AValue;
end;

procedure TfrmSelectGC.btnCancelClick(Sender: TObject);
begin
     frmSelectGC.Close;
end;

end.
