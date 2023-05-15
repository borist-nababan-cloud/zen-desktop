unit FReportHarian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Menus, cxLookAndFeelPainters, cxButtons, cxPC,
  cxGridExportLink, ShellApi, cxCalc, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, DateUtils, cxLookAndFeels,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, cxNavigator,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter;

type
  TfrmReportHarian = class(TForm)
    edStart: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    edEnd: TcxDateEdit;
    cxButton1: TcxButton;
    cxPageControl1: TcxPageControl;
    pgJasa: TcxTabSheet;
    cxGrid1: TcxGrid;
    gtvDetailJasa: TcxGridTableView;
    cxGrid1Level1: TcxGridLevel;
    gtvDetailJasaID: TcxGridColumn;
    gtvDetailJasaNama: TcxGridColumn;
    gtvDetailJasaQty: TcxGridColumn;
    gtvDetailJasaHarga: TcxGridColumn;
    gtvDetailJasaDiscount: TcxGridColumn;
    gtvDetailJasaPaket: TcxGridColumn;
    gtvDetailJasaSubtotal: TcxGridColumn;
    gtvDetailJasaTRID: TcxGridColumn;
    gtvDetailJasaRoomID: TcxGridColumn;
    btnExport: TcxButton;
    dlgSave: TSaveDialog;
    gtvDetailJasaTransType: TcxGridColumn;
    gtvDetailJasaIDCust: TcxGridColumn;
    gtvDetailJasaNamaCust: TcxGridColumn;
    gtvDetailJasaCabang: TcxGridColumn;
    gtvDetailJasaPromo: TcxGridColumn;
    pmView: TPopupMenu;
    Expand1: TMenuItem;
    Collapse1: TMenuItem;
    btnPrint: TcxButton;
    dxComponentPrinter1: TdxComponentPrinter;
    PrintGrid: TdxGridReportLink;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure Expand1Click(Sender: TObject);
    procedure Collapse1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportHarian: TfrmReportHarian;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmReportHarian.FormCreate(Sender: TObject);
begin
     //with dmDB do
     edStart.Date := Date;
     edEnd.Date := Date;
end;

procedure TfrmReportHarian.cxButton1Click(Sender: TObject);
var
   i, j, newRec : Integer;
   trans_id, paket : String;
   //waktu : TTime;
begin
     gtvDetailJasa.DataController.SelectAll;
     gtvDetailJasa.DataController.DeleteSelection;
     with dmDB do
          begin
               //waktu := FormatDateTime('hh:mm:ss', Now);
               qrySearch.Close;
               qrySearch.SQL.Clear;
               
               if(FormatDateTime('hh:mm:ss', Time) > '03:01:00') then
                 begin
                     //ShowMessage('hari ini');
                     qrySearch.SQL.Add('select * from trans_master where tanggal = ''' +
                                       FormatDateTime('yyyy-MM-dd', Now) + ''' and status_trans = ''' +
                                       'PAID' + '''');
                 end
               else
                 begin
                     //ShowMessage('lebih satu hari');
                     qrySearch.SQL.Add('select * from trans_master where tanggal = ''' +
                                       FormatDateTime('yyyy-MM-dd', IncDay(Now, -1)) + ''' and status_trans = ''' +
                                       'PAID' + '''');
                 end;

               //ShowMessage(FormatDateTime('hh:mm:ss', Time));
               
               
               qrySearch.Open;
               qrySearch.First;
               
               for i:=0 to qrySearch.RecordCount-1 do
                   begin
                        trans_id := qrySearch.Fields[0].AsString;
                        qryFind.Close;
                        qryFind.SQL.Clear;
                        qryFind.SQL.Add('select * from trans_detail where id_trans = ''' +
                                       trans_id + '''');
                        qryFind.Open;
                        qryFind.First;
                        paket := qrySearch.Fields[10].AsString;
                        for j:=0 to qryFind.RecordCount-1 do
                            begin

                                 if (qryFind.Fields[3].AsString = 'BG') then
                                     begin
                                          newRec := gtvDetailJasa.DataController.InsertRecord(gtvDetailJasa.DataController.RecordCount);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaTransType.Index, 'GC');
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaID.Index, qryFind.Fields[4].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaNama.Index, qryFind.Fields[5].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaQty.Index, qryFind.Fields[14].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaHarga.Index, qryFind.Fields[8].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaDiscount.Index, qryFind.Fields[10].AsFloat);
                                          //gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaPaket.Index, paket);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaSubtotal.Index, qryFind.Fields[11].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaTRID.Index, qryFind.Fields[12].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaRoomID.Index, qryFind.Fields[13].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaPaket.Index, qryFind.Fields[19].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaIDCust.Index, qryFind.Fields[17].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaNamaCust.Index, qryFind.Fields[18].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaCabang.Index, qryFind.Fields[22].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaPromo.Index, qrySearch.Fields[15].AsString);
                                          gtvDetailJasa.DataController.PostEditingData;
                                          gtvDetailJasa.DataController.Post;

                                     end
                                 else if (qryFind.Fields[3].AsString = 'BP') then
                                     begin
                                          newRec := gtvDetailJasa.DataController.InsertRecord(gtvDetailJasa.DataController.RecordCount);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaTransType.Index, 'PRODUCT');
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaID.Index, qryFind.Fields[4].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaNama.Index, qryFind.Fields[5].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaQty.Index, qryFind.Fields[14].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaHarga.Index, qryFind.Fields[8].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaDiscount.Index, qryFind.Fields[10].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaSubtotal.Index, qryFind.Fields[11].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaTRID.Index, qryFind.Fields[12].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaRoomID.Index, qryFind.Fields[13].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaPaket.Index, qryFind.Fields[19].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaIDCust.Index, qryFind.Fields[17].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaNamaCust.Index, qryFind.Fields[18].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaCabang.Index, qryFind.Fields[22].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaPromo.Index, qrySearch.Fields[15].AsString);
                                          gtvDetailJasa.DataController.PostEditingData;
                                          gtvDetailJasa.DataController.Post;
                                     end
                                 else if (qryFind.Fields[3].AsString = 'BA') then
                                     begin
                                          newRec := gtvDetailJasa.DataController.InsertRecord(gtvDetailJasa.DataController.RecordCount);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaTransType.Index, 'ADDITIONAL');
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaID.Index, qryFind.Fields[4].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaNama.Index, qryFind.Fields[5].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaQty.Index, qryFind.Fields[14].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaHarga.Index, qryFind.Fields[8].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaDiscount.Index, qryFind.Fields[10].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaSubtotal.Index, qryFind.Fields[11].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaTRID.Index, qryFind.Fields[12].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaRoomID.Index, qryFind.Fields[13].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaPaket.Index, qryFind.Fields[19].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaIDCust.Index, qryFind.Fields[17].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaNamaCust.Index, qryFind.Fields[18].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaCabang.Index, qryFind.Fields[22].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaPromo.Index, qrySearch.Fields[15].AsString);
                                          gtvDetailJasa.DataController.PostEditingData;
                                          gtvDetailJasa.DataController.Post;
                                     end
                                 else if (qryFind.Fields[3].AsString = 'BJ') then
                                     begin
                                          newRec := gtvDetailJasa.DataController.InsertRecord(gtvDetailJasa.DataController.RecordCount);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaTransType.Index, 'JASA');
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaID.Index, qryFind.Fields[4].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaNama.Index, qryFind.Fields[5].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaQty.Index, qryFind.Fields[14].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaHarga.Index, qryFind.Fields[8].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaDiscount.Index, qryFind.Fields[10].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaSubtotal.Index, qryFind.Fields[11].AsFloat);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaTRID.Index, qryFind.Fields[12].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaRoomID.Index, qryFind.Fields[13].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaPaket.Index, qryFind.Fields[19].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaIDCust.Index, qryFind.Fields[17].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaNamaCust.Index, qryFind.Fields[18].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaCabang.Index, qryFind.Fields[22].AsString);
                                          gtvDetailJasa.DataController.SetValue(newRec, gtvDetailJasaPromo.Index, qrySearch.Fields[15].AsString);
                                          gtvDetailJasa.DataController.PostEditingData;
                                          gtvDetailJasa.DataController.Post;
                                     end;
                                qryFind.Next;
                                Application.ProcessMessages;
                            end;
                       qrySearch.Next;
                   end;
          end;

end;

procedure TfrmReportHarian.btnExportClick(Sender: TObject);
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

procedure TfrmReportHarian.Expand1Click(Sender: TObject);
begin
     gtvDetailJasa.ViewData.Expand(True);
end;

procedure TfrmReportHarian.Collapse1Click(Sender: TObject);
begin
     gtvDetailJasa.ViewData.Collapse(True);
end;

procedure TfrmReportHarian.btnPrintClick(Sender: TObject);
begin
     PrintGrid.Preview;
end;

end.
