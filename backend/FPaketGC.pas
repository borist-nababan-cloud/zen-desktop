unit FPaketGC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridLevel, cxGrid,
  StdCtrls, cxContainer, cxTextEdit, DB, cxDBData, cxGridDBTableView,
  cxCalendar, cxCheckBox, cxCalc, cxMaskEdit, cxDropDownEdit, cxSplitter,
  Menus, cxLookAndFeelPainters, cxButtons, DateUtils, cxListBox, cxLookAndFeels,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator, Vcl.ComCtrls, dxCore,
  cxDateUtils, MyAccess, MemDS, DBAccess;

type
  TfrmPaketGC = class(TForm)
    edIDPaket: TcxTextEdit;
    Label1: TLabel;
    gtbPaketGC: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbPaketGCpaket_number: TcxGridDBColumn;
    gtbPaketGCtanggal: TcxGridDBColumn;
    gtbPaketGCexpired_date: TcxGridDBColumn;
    gtbPaketGCharga_jual: TcxGridDBColumn;
    gtbPaketGCtotal_items: TcxGridDBColumn;
    gtbPaketGCaktif: TcxGridDBColumn;
    gtbPaketGCterjual: TcxGridDBColumn;
    gtbPaketGCnotes: TcxGridDBColumn;
    edTerbit: TcxDateEdit;
    edKadaluarsa: TcxDateEdit;
    edHargaJual: TcxCalcEdit;
    edAktif: TcxCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    gtbGCDetail: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    gtbGCDetailautonum: TcxGridDBColumn;
    gtbGCDetailpaket_number: TcxGridDBColumn;
    gtbGCDetailgc_number: TcxGridDBColumn;
    gtbGCDetailtanggal: TcxGridDBColumn;
    gtbGCDetailexpired_date: TcxGridDBColumn;
    gtbGCDetailjasa_master_id: TcxGridDBColumn;
    gtbGCDetailjenis_jasa_id: TcxGridDBColumn;
    gtbGCDetailnama_menu: TcxGridDBColumn;
    gtbGCDetailharga_jual: TcxGridDBColumn;
    gtbGCDetailharga_jasa: TcxGridDBColumn;
    gtbGCDetailaktif: TcxGridDBColumn;
    gtbGCDetailterjual: TcxGridDBColumn;
    gtbGCDetailpakai: TcxGridDBColumn;
    gtbGCDetailnotes: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    btnPost: TcxButton;
    btnCancel: TcxButton;
    pmPilih: TPopupMenu;
    PilihGC1: TMenuItem;
    ckAktifMaster: TcxCheckBox;
    ckJualMaster: TcxCheckBox;
    ckAktifDetail: TcxCheckBox;
    ckJualDetail: TcxCheckBox;
    ckPakaiDetail: TcxCheckBox;
    qryDetail: TMyQuery;
    dsQryDetail: TDataSource;
    qryMaster: TMyQuery;
    dsQryMaster: TDataSource;
    edPrefix: TcxTextEdit;
    btnEditPaket: TcxButton;
    btnSetAktif: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure gtbPaketGCCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure gtbPaketGCFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckAktifMasterPropertiesChange(Sender: TObject);
    procedure ckJualMasterPropertiesChange(Sender: TObject);
    procedure btnEditPaketClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryExec, qryCari, qryFind : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmPaketGC: TfrmPaketGC;

implementation

uses FDMdb, FSelectGC, FMain;

{$R *.dfm}

procedure TfrmPaketGC.ckAktifMasterPropertiesChange(Sender: TObject);
begin
     qryMaster.Close;
     qryMaster.SQL.Clear;
     qryMaster.SQL.Add('select * from gc_master where aktif = ''' +
         VarToStr(ckAktifMaster.EditValue) + ''' AND terjual = ''' +
         VarToStr(ckJualMaster.EditValue) + '''');
     qryMaster.Open;
     gtbPaketGC.DataController.Refresh;
end;

procedure TfrmPaketGC.ckJualMasterPropertiesChange(Sender: TObject);
begin
     qryMaster.Close;
     qryMaster.SQL.Clear;
     qryMaster.SQL.Add('select * from gc_master where aktif = ''' +
         VarToStr(ckAktifMaster.EditValue) + ''' AND terjual = ''' +
         VarToStr(ckJualMaster.EditValue) + '''');
     qryMaster.Open;
     gtbPaketGC.DataController.Refresh;
end;

procedure TfrmPaketGC.btnEditPaketClick(Sender: TObject);
var
   recSelect, newRec, i : Integer;
   id_paket : String;
begin
     recSelect := gtbPaketGC.DataController.GetFocusedRecordIndex;
     if (recSelect < 0) then Exit;
     id_paket := vartostr(gtbPaketGC.DataController.GetValue(recSelect, gtbPaketGCpaket_number.Index));
     Application.CreateForm(TfrmSelectGC, frmSelectGC);
     frmSelectGC.FormStyle := fsNormal;
     with frmSelectGC do
          begin
               {qryOnPaket.Active := True;
               qryOnPaket.Close;
               qryOnPaket.SQL.Clear;
               qryOnPaket.SQL.Add()}
          end;
     frmSelectGC.Show;
     frmSelectGC.Position := poDesktopCenter;
end;

procedure TfrmPaketGC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     qrySearch.Free;
     qryExec.Free;
     qryCari.Free;
     qryFind.Free;
     Action := caFree;
end;

procedure TfrmPaketGC.FormCreate(Sender: TObject);
begin
     edTerbit.Date :=  Date;
     edKadaluarsa.Date := IncYear(Date, 1);
     qryMaster.Active := True;
     qryDetail.Active := True;
     edPrefix.Text := frmMain.APP_OUTLETID + '.PGC.';

     qrySearch := TMyQuery.Create(Self);
     qrySearch.Connection := DMDB.dbInternal;
     qrySearch.SQL.Add('select * from temptable');
     qrySearch.Active := true;

     qryCari := TMyQuery.Create(Self);
     qryCari.Connection := DMDB.dbInternal;
     qryCari.SQL.Add('select * from temptable');
     qryCari.Active := true;

     qryFind := TMyQuery.Create(Self);
     qryFind.Connection := DMDB.dbInternal;
     qryFind.SQL.Add('select * from temptable');
     qryFind.Active := true;

     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from temptable');
     qryExec.Active := true;
end;

procedure TfrmPaketGC.btnPostClick(Sender: TObject);
var
   idPaket, keterangan : String;
begin
     if (edIDPaket.Text = '') then
         begin
              ShowMessage('ID Paket masih kosong mohon isi terlebih dahulu');
              edIDPaket.SetFocus;
              Exit;
         end;

       idPaket := edPrefix.Text + edIDPaket.Text;
       qrySearch.Close;
       qrySearch.SQL.Clear;
       qrySearch.SQL.Add('select paket_number from gc_master where paket_number = ''' +
                         idPaket + '''');
       qrySearch.Open;

       if (qrySearch.IsEmpty) then
           begin
                keterangan := 'By ' + frmMain.USERAPPS + ' at ' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now);
                qryExec.Close;
                qryExec.Sql.Clear;
                qryExec.SQL.Add('INSERT INTO gc_master VALUES(' +
                                QuotedStr(idPaket) + ',' +
                                '''' + FormatDateTime('yyyy-MM-dd', edTerbit.Date) + ''', ' +
                                '''' + FormatDateTime('yyyy-MM-dd', edKadaluarsa.Date) + ''', ' +
                                '''' + vartostr(edHargaJual.EditValue) + ''', ' +
                                '''' + '0' + ''', ' +
                                '''' + vartostr(edAktif.EditingValue) + ''', ' +
                                '''' + 'N' + ''', ' +
                                '''' + keterangan + ''');');
                qryExec.ExecSql;
                ShowMessage('Inser New GC Master Finish !');
                //tblPaketGC.Refresh;
                qryMaster.Refresh;
                gtbPaketGC.DataController.Refresh;
                edIDPaket.Clear;
                edHargaJual.EditValue := 0;
                edAktif.Checked := False;
           end
       else if (NOT qrySearch.IsEmpty) then
           begin
                ShowMessage('ID Paket ' + edIDPaket.Text + ' sudah ada, Mohon ganti');
                edIDPaket.Clear;
                edIDPaket.SetFocus;
           end;

end;

procedure TfrmPaketGC.gtbPaketGCCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
   recSelect : Integer;
   id_paket : String;
begin
   {recSelect := gtbPaketGC.DataController.GetFocusedRecordIndex;
   id_paket := vartostr(gtbPaketGC.DataController.GetValue(recSelect, gtbPaketGCpaket_number.Index));

   qryDetail.Close;
   qryDetail.SQL.Clear;
   qryDetail.SQL.Add('select * from gc_detail where paket_number = ''' +
                 id_paket + '''');
   qryDetail.Open;
   gtbGCDetail.DataController.Refresh;}

     
end;

procedure TfrmPaketGC.gtbPaketGCFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
   recSelect : Integer;
   id_paket : String;
begin
   recSelect := gtbPaketGC.DataController.GetFocusedRecordIndex;
   id_paket := vartostr(gtbPaketGC.DataController.GetValue(recSelect, gtbPaketGCpaket_number.Index));

   qryDetail.Close;
   qryDetail.SQL.Clear;
   qryDetail.SQL.Add('select * from gc_detail where paket_number = ''' +
                 id_paket + '''');
   qryDetail.Open;
   gtbGCDetail.DataController.Refresh;
end;

end.
