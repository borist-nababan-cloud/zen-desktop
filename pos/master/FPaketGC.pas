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
  cxDateUtils, MyAccess, DBAccess, MemDS;

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
    tblPaketGC: TMyQuery;
    dsTblPaketGC: TMyDataSource;
    qryGC: TMyQuery;
    dsQryGC: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure PilihGC1Click(Sender: TObject);
    procedure gtbPaketGCCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    qrySearch, qryExec, qryCari, qryFind : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmPaketGC: TfrmPaketGC;

implementation

uses FDMdb, FSelectGC;

{$R *.dfm}

procedure TfrmPaketGC.FormCreate(Sender: TObject);
begin
     edTerbit.Date :=  Date;
     edKadaluarsa.Date := IncYear(Date, 1);

end;

procedure TfrmPaketGC.btnPostClick(Sender: TObject);
begin
     if (edIDPaket.Text = '') then
         begin
            ShowMessage('ID Paket masih kosong mohon isi terlebih dahulu');
            edIDPaket.SetFocus;
            Exit;

         end;

     qrySearch.Close;
     qrySearch.SQL.Clear;
     qrySearch.SQL.Add('select * from gc_master where paket_number = ''' +
                       edIDPaket.Text + '''');
     qrySearch.Open;

     if (qrySearch.IsEmpty) then
         begin
              qryExec.Sql.Clear;
              qryExec.SQL.Add('INSERT INTO gc_master VALUES(' +
                              '''' + edIDPaket.Text + ''', ' +
                              '''' + FormatDateTime('yyyy-MM-dd', edTerbit.Date) + ''', ' +
                              '''' + FormatDateTime('yyyy-MM-dd', edKadaluarsa.Date) + ''', ' +
                              '''' + vartostr(edHargaJual.EditValue) + ''', ' +
                              '''' + '0' + ''', ' +
                              '''' + vartostr(edAktif.EditingValue) + ''', ' +
                              '''' + 'N' + ''', ' +
                              '''' + '(NONE)' + ''')');
              qryExec.ExecSql;
              tblPaketGC.Refresh;
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

procedure TfrmPaketGC.PilihGC1Click(Sender: TObject);
var
   recSelect, newRec, i : Integer;
   id_paket : String;
begin
     recSelect := gtbPaketGC.DataController.GetFocusedRecordIndex;
     id_paket := vartostr(gtbPaketGC.DataController.GetValue(recSelect, gtbPaketGCpaket_number.Index));
     Application.CreateForm(TfrmSelectGC, frmSelectGC);
     with frmSelectGC do
          begin
               tvAvailable.DataController.SelectAll;
               tvAvailable.DataController.DeleteSelection;
               with dmDB do
                    begin
                         qryCari.Close;
                         qryCari.SQL.Clear;
                         qryCari.SQL.Add('select * from gc_master where paket_number = ''' +
                                        id_paket + '''');
                         qryCari.Open;

                         qrySearch.Close;
                         qrySearch.SQL.Clear;
                         qrySearch.SQL.Add('select * from gc_detail where paket_number = ''' +
                                        id_paket + '''');
                         qrySearch.Open;
                         qrySearch.First;

                         edSelectIDPaket.Text := qryCari.Fields[0].AsString;
                         edSelectTerbit.Date :=  qryCari.Fields[1].AsDateTime;
                         edSelectKadaluarsa.Date := qryCari.Fields[2].AsDateTime;
                         edSelectJual.EditValue := qryCari.Fields[3].AsFloat;
                         edSelectItems.EditValue := qryCari.Fields[4].AsFloat;
                         edSelectAktif.EditValue := qryCari.Fields[5].AsString;
                         for i:=0 to qrySearch.RecordCount-1 do
                             begin
                                  newRec := gtvPaket.DataController.InsertRecord(gtvPaket.DataController.RecordCount);
                                  gtvPaket.DataController.SetValue(newRec, gtvPaketGCID.Index, qrySearch.Fields[2].AsString);
                                  gtvPaket.DataController.SetValue(newRec, gtvPaketNama.Index, qrySearch.Fields[7].AsString);
                                  gtvPaket.DataController.SetValue(newRec, gtvPaketHarga.Index, qrySearch.Fields[8].AsFloat);
                                  gtvPaket.DataController.PostEditingData;
                                  gtvPaket.DataController.Post;

                                  qrySearch.Next;

                             end;
                         qryFind.Close;
                         qryFind.SQL.Clear;
                         qryFind.SQL.Add('select * from gc_detail where paket_number <> ''' +
                                         id_paket + ''' and pakai = ''' +
                                         'N' + ''' and terjual = ''' +
                                         'N' + '''');
                         qryFind.Open;
                         qryFind.First;
                         for i:=0 to qryFind.RecordCount-1 do
                             begin
                                  newRec := tvAvailable.DataController.InsertRecord(tvAvailable.DataController.RecordCount);
                                  tvAvailable.DataController.SetValue(newRec, tvAvailableIDGC.Index, qryFind.Fields[2].AsString);
                                  tvAvailable.DataController.SetValue(newRec, tvAvailableNama.Index, qryFind.Fields[7].AsString);
                                  tvAvailable.DataController.SetValue(newRec, tvAvailableHarga.Index, qryFind.Fields[8].AsFloat);
                                  tvAvailable.DataController.SetValue(newRec, tvAvailablePaketNumber.Index, qryFind.Fields[1].AsString);
                                  tvAvailable.DataController.PostEditingData;
                                  tvAvailable.DataController.Post;
                                  qryFind.Next;


                             end;


                    end;
          end;
     frmSelectGC.ShowModal;
end;

procedure TfrmPaketGC.gtbPaketGCCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
   recSelect : Integer;
   id_paket : String;
begin
     recSelect := gtbPaketGC.DataController.GetFocusedRecordIndex;
     id_paket := vartostr(gtbPaketGC.DataController.GetValue(recSelect, gtbPaketGCpaket_number.Index));

     qryGC.Close;
     qryGC.SQL.Clear;
     qryGC.SQL.Add('select * from gc_detail where paket_number = ''' +
                   id_paket + '''');
     qryGC.Open;
     gtbGCDetail.DataController.Refresh;

     
end;

end.
