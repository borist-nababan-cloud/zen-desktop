unit FReportAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridBandedTableView, cxGridDBBandedTableView,
  ExtCtrls, StdCtrls, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Menus, cxLookAndFeelPainters, cxButtons,
  cxTimeEdit, cxCalc, cxCheckBox, cxGridExportLink, ShellApi, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  DateUtils, cxLookAndFeels, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter;

type
  TfrmReportAll = class(TForm)
    XiPanel1: TPanel;
    edStart: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    edEnd: TcxDateEdit;
    btnFind: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvAll: TcxGridBandedTableView;
    gtvAllTransID: TcxGridBandedColumn;
    gtvAllTanggal: TcxGridBandedColumn;
    gtvAllStartTime: TcxGridBandedColumn;
    gtvAllEndTime: TcxGridBandedColumn;
    gtvAllCustomerNama: TcxGridBandedColumn;
    gtvAllCustomerGender: TcxGridBandedColumn;
    gtvAllRoomID: TcxGridBandedColumn;
    gtvAllTRID: TcxGridBandedColumn;
    gtvAllNamaTR: TcxGridBandedColumn;
    gtvAllStatusTrans: TcxGridBandedColumn;
    gtvAllNamaTrans: TcxGridBandedColumn;
    gtvAllPaket: TcxGridBandedColumn;
    gtvAllHarga: TcxGridBandedColumn;
    gtvAllJenisTrans: TcxGridBandedColumn;
    gtvAllPaymentID: TcxGridBandedColumn;
    gtvAllPromo: TcxGridBandedColumn;
    cxButton2: TcxButton;
    dlgSave: TSaveDialog;
    pmOption: TPopupMenu;
    ExportExcel20031: TMenuItem;
    PrintPreview1: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    PrintGrid: TdxGridReportLink;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    gtvAllCabang: TcxGridBandedColumn;
    pmView: TPopupMenu;
    Expand1: TMenuItem;
    Collapse1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure ExportExcel20031Click(Sender: TObject);
    procedure PrintPreview1Click(Sender: TObject);
    procedure Expand1Click(Sender: TObject);
    procedure Collapse1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportAll: TfrmReportAll;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmReportAll.FormCreate(Sender: TObject);
begin
     edStart.Date := Date;
     edEnd.Date := Date;
end;

procedure TfrmReportAll.btnFindClick(Sender: TObject);
var
   i, j, newRec : Integer;
   id_trans, tr_id : String;

begin
     gtvAll.DataController.SelectAll;
     gtvAll.DataController.DeleteSelection;
     with dmDB do
          begin

               qrySearch.Close;
               qrySearch.SQL.Clear;
               if(FormatDateTime('hh:mm:ss', Time) > '03:01:00') then
                 begin
                    qrySearch.SQL.Add('select * from trans_master where tanggal = ''' +
                                 FormatDateTime('yyyy-MM-dd', Now) + '''');
                  end
               else
                  begin
                    qrySearch.SQL.Add('select * from trans_master where tanggal = ''' +
                                 FormatDateTime('yyyy-MM-dd', IncDay(Now, -1)) + '''');
                  end;
               qrySearch.Open;
               qrySearch.First;
               for i:=0 to qrySearch.RecordCount-1 do
                   begin
                        id_trans := qrySearch.Fields[0].AsString;
                        qryFind.Close;
                        qryFind.SQL.Clear;
                        qryFind.SQL.Add('select * from trans_detail where id_trans = ''' +
                                        id_trans + '''');
                        qryFind.Open;
                        qryFind.First;
                        for j:=0 to qryFind.RecordCount-1 do
                            begin
                                 newRec := gtvAll.DataController.InsertRecord(gtvAll.DataController.RecordCount);
                                 gtvAll.DataController.SetValue(newRec, gtvAllTransID.Index, qrySearch.Fields[0].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllCabang.Index, qrySearch.Fields[16].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllStatusTrans.Index, qrySearch.Fields[1].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllTanggal.Index, qrySearch.Fields[2].AsDateTime);
                                 gtvAll.DataController.SetValue(newRec, gtvAllStartTime.Index, qrySearch.Fields[3].AsDateTime);
                                 gtvAll.DataController.SetValue(newRec, gtvAllEndTime.Index, qrySearch.Fields[4].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllCustomerNama.Index, qrySearch.Fields[0].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllRoomID.Index, qryFind.Fields[13].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllTRID.Index, qrySearch.Fields[7].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllPromo.Index, qrySearch.Fields[15].AsVariant);
                                 tr_id := qrySearch.Fields[7].AsString;
                                 qryTherapist.Close;
                                 qryTherapist.SQL.Clear;
                                 qryTherapist.SQL.Add('select nama_lengkap from karyawan where karyawan_id = ''' +
                                                      tr_id + '''');
                                 qryTherapist.Open;
                                 gtvAll.DataController.SetValue(newRec, gtvAllNamaTR.Index, qryTherapist.Fields[0].AsString);

                                 gtvAll.DataController.SetValue(newRec, gtvAllPaket.Index, qrySearch.Fields[10].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllPaymentID.Index, qryFind.Fields[20].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllCustomerGender.Index, qrySearch.Fields[14].AsString);

                                 gtvAll.DataController.SetValue(newRec, gtvAllNamaTrans.Index, qryFind.Fields[5].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllJenisTrans.Index, qryFind.Fields[3].AsString);
                                 gtvAll.DataController.SetValue(newRec, gtvAllHarga.Index, qryFind.Fields[8].AsFloat);
                                 gtvAll.DataController.PostEditingData;
                                 gtvAll.DataController.Post;

                                 qryFind.Next;
                                 Application.ProcessMessages;
                            end;


                        qrySearch.Next;
                        Application.ProcessMessages;
                   end;
          end;
end;

procedure TfrmReportAll.ExportExcel20031Click(Sender: TObject);
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

procedure TfrmReportAll.PrintPreview1Click(Sender: TObject);
begin
     PrintGrid.Preview;
end;

procedure TfrmReportAll.Expand1Click(Sender: TObject);
begin
     gtvAll.ViewData.Expand(True);
end;

procedure TfrmReportAll.Collapse1Click(Sender: TObject);
begin
     gtvAll.ViewData.Collapse(True);
end;

end.
