unit FSMutasiKasKecil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  dxBarSkinnedCustForm, dxSkinsdxRibbonPainter, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxCalendar, cxTextEdit, cxCalc, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  dxPSCore, dxPScxCommon, dxPScxGrid6Lnk, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, DateUtils, cxGridExportLink, ShellApi, cxDBLookupComboBox, DB,
  DBAccess;

type
  TfrmSMutasiKasKecil = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    btnCari: TcxButton;
    btnExport: TcxButton;
    btnPrint: TcxButton;
    dxComponentPrinter1: TdxComponentPrinter;
    printGrid: TdxGridReportLink;
    dlgSave: TSaveDialog;
    pmOption: TPopupMenu;
    Expan1: TMenuItem;
    Collapse1: TMenuItem;
    cxGrid1: TcxGrid;
    gtvMutasiKas: TcxGridTableView;
    gtvMutasiKasTgl: TcxGridColumn;
    gtvMutasiKasCOA: TcxGridColumn;
    gtvMutasiKasKet: TcxGridColumn;
    gtvMutasiKasDebet: TcxGridColumn;
    gtvMutasiKasKredit: TcxGridColumn;
    gtvMutasiKasSaldo: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    gtvMutasiKasBuktiKas: TcxGridColumn;
    gtvMutasiKasNoKas: TcxGridColumn;
    dsQryCoa: TDataSource;
    qryCoa: TMyQuery;
    procedure btnCariClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qrykas1, qrykas2, qrykas3, qrykas4, qrykas5 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmSMutasiKasKecil: TfrmSMutasiKasKecil;

implementation

uses FdmDB;

{$R *.dfm}

procedure TfrmSMutasiKasKecil.btnCariClick(Sender: TObject);
var
  i, newRec : integer;
  status : string;
  debet, kredit, saldo, saldo_awal, tambah, kurang, saldo_kas, total_saldo : double;
begin
    with dmdb do
      begin
           gtvMutasiKas.DataController.SelectAll;
           gtvMutasiKas.DataController.DeleteSelection;

           qryKas1.Close;
           qryKas1.SQL.Clear;
           qryKas1.SQL.Add('SELECT saldo, tanggal FROM saldo_awal ' +
                             'WHERE jenis = ''' + 'KAS KECIL' + ''' AND ' +
                             'tanggal <= ''' + FormatDateTime('yyyy-mm-dd', edStart.EditValue) + '''');
           qryKas1.Open;

           saldo_kas := qryKas1.Fields[0].AsFloat;
           saldo := 0;

           qryKas4.Refresh;
           qryKas4.Close;
           qryKas4.SQL.Clear;
           qryKas4.SQL.Add('SELECT * FROM kas_kecil_detail ' +
                                    'WHERE tanggal <  ''' + FormatDateTime('yyyy-mm-dd', edStart.EditValue) + ''' AND ' +
                                    'tanggal >= ''' + FormatDateTime('yyyy-mm-dd', qryKas1.Fields[1].AsDateTime) + '''');
           qryKas4.Open;

           qryKas4.First;

           for i:=0 to qryKas4.RecordCount - 1 do
                begin
                    status := qryKas4.Fields[7].AsString;
                    if(status = 'MASUK') then
                        begin
                             tambah := qryKas4.Fields[6].AsFloat;
                             saldo := saldo + tambah;
                        end
                    else if(status = 'KELUAR') then
                        begin
                             kurang := qryKas4.Fields[6].AsFloat;
                             saldo := saldo - kurang;
                        end;
                    qryKas4.Next;
                end;

           saldo_awal := saldo + saldo_kas;
           //masukan ke grid
           newRec := gtvMutasiKas.DataController.InsertRecord(gtvMutasiKas.DataController.RecordCount);
           gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasTgl.Index, edStart.EditValue);
           gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasCOA.Index, 'Saldo Awal');
           gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasKet.Index, 'Saldo Awal');
           gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasDebet.Index, 0);
           gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasKredit.Index, 0);
           gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasSaldo.Index, saldo_awal);
           gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasBuktiKas.Index, '');
           gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasNoKas.Index, '');

           gtvMutasiKas.DataController.PostEditingData;
           gtvMutasiKas.DataController.Post;

           total_saldo := saldo_awal;

           qryKas2.Close;
           qryKas2.SQL.Clear;
           qryKas2.SQL.Add('SELECT * FROM kas_kecil_detail ' +
                           'WHERE tanggal >= ''' + FormatDateTime('yyyy-mm-dd', edStart.EditValue) + ''' AND ' +
                           'tanggal <= ''' + FormatDateTime('yyyy-mm-dd', edEnd.EditValue) + '''  ORDER BY tanggal, id_transaksi, no_kas');
           qryKas2.Open;

           qryKas2.First;

           if(qryKas2.IsEmpty) then
               begin
                   //
               end
           else
               begin
                   for i := 0 to qryKas2.RecordCount - 1 do
                      begin
                          status := qryKas2.Fields[7].AsString;
                          if(status = 'MASUK') then
                              begin
                                  kredit := qryKas2.Fields[6].AsFloat;
                                  debet := 0;
                                  total_saldo :=  total_saldo + kredit - debet;
                              end
                          else
                              begin
                                  debet := qryKas2.Fields[6].AsFloat;
                                  kredit := 0;
                                  total_saldo :=  total_saldo + kredit - debet;
                              end;

                          newRec := gtvMutasiKas.DataController.InsertRecord(gtvMutasiKas.DataController.RecordCount);
                          gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasTgl.Index, qryKas2.Fields[2].AsDateTime);
                          gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasCOA.Index, qryKas2.Fields[4].AsString);
                          gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasKet.Index, qryKas2.Fields[5].AsString);
                          gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasDebet.Index, debet);
                          gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasKredit.Index, kredit);
                          gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasSaldo.Index, total_saldo);
                          gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasBuktiKas.Index, qryKas2.Fields[1].AsString);
                          gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasNoKas.Index, qryKas2.Fields[3].AsString);

                          gtvMutasiKas.DataController.PostEditingData;
                          gtvMutasiKas.DataController.Post;
                          qryKas2.Next;
                      end;
               end;
      end;
end;

procedure TfrmSMutasiKasKecil.btnExportClick(Sender: TObject);
begin
     dlgSave.Title := '[Excel 97-2003] Export to...';
     dlgSave.Filter := 'Microsoft Excel 97-2003 (*.xls)|*.xls';
     dlgSave.FileName := '';
     if (dlgSave.Execute) then
        begin
             if (dlgSave.FileName <> '') then
                begin
                     ExportGridToExcel(dlgSave.FileName, cxGrid1, true, true, true, 'xls');
                     if (MessageDlg('Would you like to open exported file now?',
                         mtConfirmation, mbOKCancel, 0) = mrOK) then
                         begin
                              if (ExtractFileExt(dlgSave.FileName) = '.xls') then
                                 ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                              else
                                  ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName + '.xls'), pChar(''), pChar(ExtractFileDir(dlgSave.FileName + '.xls')), SW_MAXIMIZE)
                         end
                     else exit;
                end
             else exit;
        end
     else exit;
end;

procedure TfrmSMutasiKasKecil.btnPrintClick(Sender: TObject);
begin
     printGrid.Preview;
end;

procedure TfrmSMutasiKasKecil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qrykas1.Free;
   qrykas2.Free;
   qrykas3.Free;
   qrykas4.Free;
   qrykas5.Free;
   qryCoa.Active := False;
   Action := caFree;
end;

procedure TfrmSMutasiKasKecil.FormCreate(Sender: TObject);
begin
     edStart.Date := Date;
     edEnd.Date := Date;
   qrykas1 := TMyQuery.Create(Self);
   qrykas1.Connection := DMDB.kmsmDB;
   qrykas1.SQL.Add('select * from temptable');
   qrykas1.Active := true;

   qrykas2 := TMyQuery.Create(Self);
   qrykas2.Connection := DMDB.kmsmDB;
   qrykas2.SQL.Add('select * from temptable');
   qrykas2.Active := true;

   qrykas3 := TMyQuery.Create(Self);
   qrykas3.Connection := DMDB.kmsmDB;
   qrykas3.SQL.Add('select * from temptable');
   qrykas3.Active := true;

   qrykas4 := TMyQuery.Create(Self);
   qrykas4.Connection := DMDB.kmsmDB;
   qrykas4.SQL.Add('select * from temptable');
   qrykas4.Active := true;

   qrykas5 := TMyQuery.Create(Self);
   qrykas5.Connection := DMDB.kmsmDB;
   qrykas5.SQL.Add('select * from temptable');
   qrykas5.Active := true;
   qryCoa.Active := True;
end;

end.
