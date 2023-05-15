unit FMutasiBank;

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
  dxPSCore, dxPScxCommon, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, DateUtils, cxGridExportLink, ShellApi, cxDBLookupComboBox, DB,
  DBAccess, cxLookupEdit, cxDBLookupEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  MyAccess, MemDS;

type
  TfrmMutasiBank = class(TForm)
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
    tblKas: TMyQuery;
    dsTblKas: TDataSource;
    tblCoa: TMyTable;
    dsblCoa: TDataSource;
    edTypeKas: TcxLookupComboBox;
    Label3: TLabel;
    gtvMutasiKasCoaKode: TcxGridColumn;
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
  frmMutasiBank: TfrmMutasiBank;

implementation

uses FdmDB, FMenuMain;

{$R *.dfm}

procedure TfrmMutasiBank.btnCariClick(Sender: TObject);
var
  i, newRec : integer;
  status : string;
  tglSaldoAwal : TDate;
  sAwal, sTambah, sKurang, sMutasi : double;
begin
   Screen.Cursor := crHourGlass;
   gtvMutasiKas.DataController.SelectAll;
   gtvMutasiKas.DataController.DeleteSelection;

   qryKas1.Close;
   qryKas1.SQL.Clear;
   qryKas1.SQL.Add('SELECT saldo, tanggal FROM ben_saldo_bank ' +
       'WHERE kodebank = ''' + vartostr(edTypeKas.EditValue) + ''' AND ' +
       'tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edStart.EditValue) +
       ''' ORDER BY tanggal DESC');
   qryKas1.Open;
   qrykas1.First;

   sAwal := qryKas1.Fields[0].AsFloat;
   //ShowMessage(FormatFloat('#,#', qryKas1.Fields[0].AsFloat));
   tglSaldoAwal := qrykas1.Fields[1].AsDateTime;
   sTambah := 0;
   sKurang := 0;
   //qrykas2.Refresh;
   qryKas2.Close;
   qryKas2.SQL.Clear;
   qryKas2.SQL.Add('SELECT subtotal, status FROM ben_trans_bank_detail ' +
      'WHERE kodebank = ''' + vartostr(edTypeKas.EditValue) + ''' ' +
      'AND tanggal >  ''' + FormatDateTime('yyyy-MM-dd', tglSaldoAwal) + ''' AND ' +
      'tanggal < ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + '''');
   qryKas2.Open;
   qryKas2.First;
   //ShowMessage(inttostr(qrykas2.RecordCount));
   for i:=0 to qryKas2.RecordCount - 1 do
        begin
            status := qryKas2.Fields[1].AsString;
            if(status = 'M') then
                begin
                     sTambah := qryKas2.Fields[0].AsFloat;
                     sAwal := sAwal + sTambah;
                     //ShowMessage('M' + FormatFloat('#,#', sTambah));
                     //ShowMessage('M' + FormatFloat('#,#', sAwal));
                end
            else if(status = 'K') then
                begin
                     sKurang := qryKas2.Fields[0].AsFloat;
                     sAwal := sAwal - sKurang;
                     //ShowMessage('M' + FormatFloat('#,#', sKurang));
                     //ShowMessage('M' + FormatFloat('#,#', sAwal));
                end;
            qryKas2.Next;
        end;


   //masukan ke grid
   newRec := gtvMutasiKas.DataController.InsertRecord(gtvMutasiKas.DataController.RecordCount);
   gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasTgl.Index, edStart.EditValue);
   gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasCoaKode.Index, 'Saldo Awal ' + edTypeKas.Text);
   gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasCOA.Index, 'Saldo Awal ' + edTypeKas.Text);
   gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasKet.Index, 'Saldo Awal ' + edTypeKas.Text);
   gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasDebet.Index, 0);
   gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasKredit.Index, 0);
   gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasSaldo.Index, sAwal);
   gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasBuktiKas.Index, '');
   gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasNoKas.Index, '');

   gtvMutasiKas.DataController.PostEditingData;
   gtvMutasiKas.DataController.Post;
   Application.ProcessMessages;
   sMutasi := sAwal;
   sTambah := 0;
   sKurang := 0;


   qryKas3.Close;
   qryKas3.SQL.Clear;
   qryKas3.SQL.Add('SELECT tanggal, no_bank, id_coa, keterangan, ' +
      'subtotal, status, id_transaksi FROM ben_trans_bank_detail ' +
      'WHERE kodebank = ''' + vartostr(edTypeKas.EditValue) + ''' ' +
      'AND tanggal >=  ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND ' +
      'tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''' ORDER BY tanggal ASC');
   qryKas3.Open;
   qryKas3.First;

   for i:=0 to qryKas3.RecordCount - 1 do
        begin
         newRec := gtvMutasiKas.DataController.InsertRecord(gtvMutasiKas.DataController.RecordCount);
         gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasTgl.Index, qrykas3.Fields[0].AsDateTime);
         gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasCoaKode.Index, qrykas3.Fields[2].AsString);
         gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasCOA.Index, qrykas3.Fields[2].AsString);
         gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasKet.Index, qrykas3.Fields[3].AsString);
         status := qryKas3.Fields[5].AsString;
         //ShowMessage(status);
          if(status = 'M') then
            begin
             sTambah := qryKas3.Fields[4].AsFloat;
             sKurang := 0;
             sAwal := sAwal + sTambah;
             gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasDebet.Index, sTambah);
             gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasKredit.Index, sKurang);
            end
          else if(status = 'K') then
            begin
             sKurang := qryKas3.Fields[4].AsFloat;
             sTambah := 0;
             sAwal := sAwal - sKurang;
             gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasKredit.Index, sKurang);
             gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasDebet.Index, sTambah);
            end;
         gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasSaldo.Index, sAwal);
         gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasBuktiKas.Index, qrykas3.Fields[6].AsString);
         gtvMutasiKas.DataController.SetValue(newRec, gtvMutasiKasNoKas.Index, qrykas3.Fields[1].AsString);
         gtvMutasiKas.DataController.PostEditingData;
         gtvMutasiKas.DataController.Post;
         sTambah := 0;
         sKurang := 0;
         qryKas3.Next;
         Application.ProcessMessages;
        end;
   Screen.Cursor := crDefault;

end;

procedure TfrmMutasiBank.btnExportClick(Sender: TObject);
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

procedure TfrmMutasiBank.btnPrintClick(Sender: TObject);
begin
     printGrid.Preview;
end;

procedure TfrmMutasiBank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   edTypeKas.Clear;
   gtvMutasiKas.DataController.SelectAll;
   gtvMutasiKas.DataController.DeleteSelection;
   qrykas1.Free;
   qrykas2.Free;
   qrykas3.Free;
   qrykas4.Free;
   qrykas5.Free;
   tblCoa.Active := False;
   Action := caFree;
end;

procedure TfrmMutasiBank.FormCreate(Sender: TObject);
begin
     edStart.Date := Date;
     edEnd.Date := Date;
   qrykas1 := TMyQuery.Create(Self);
   qrykas1.Connection := DMDB.StoreDB;
   qrykas1.SQL.Add('select * from temptable');
   qrykas1.Active := true;

   qrykas2 := TMyQuery.Create(Self);
   qrykas2.Connection := DMDB.StoreDB;
   qrykas2.SQL.Add('select * from temptable');
   qrykas2.Active := true;

   qrykas3 := TMyQuery.Create(Self);
   qrykas3.Connection := DMDB.StoreDB;
   qrykas3.SQL.Add('select * from temptable');
   qrykas3.Active := true;

   qrykas4 := TMyQuery.Create(Self);
   qrykas4.Connection := DMDB.StoreDB;
   qrykas4.SQL.Add('select * from temptable');
   qrykas4.Active := true;

   qrykas5 := TMyQuery.Create(Self);
   qrykas5.Connection := DMDB.StoreDB;
   qrykas5.SQL.Add('select * from temptable');
   qrykas5.Active := true;

   tblKas.Active := True;
   tblKas.Close;
   tblKas.SQL.Clear;
   tblKas.SQL.Add('select kodebank from ben_master_bank where ' +
         'idoutlet = ''' + frmMenuMain.IDOUTLET + '''');
   tblKas.Open;
   tblCoa.Active := True;
end;

end.
