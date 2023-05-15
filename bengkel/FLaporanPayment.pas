unit FLaporanPayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
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
  dxSkinXmas2008Blue, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Data.DB, MemDS, DBAccess, MyAccess, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxDBLookupComboBox, cxTimeEdit, cxCalc, cxGridExportLink, ShellApi;

type
  TfrmLaporanPayment = class(TForm)
    qryList: TMyQuery;
    dsQryList: TDataSource;
    edStart: TcxDateEdit;
    cxLabel1: TcxLabel;
    edEnd: TcxDateEdit;
    cxLabel2: TcxLabel;
    dlgSave: TSaveDialog;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListpkbnumber: TcxGridDBColumn;
    gtbListcustcode: TcxGridDBColumn;
    gtbListtglpelunasan: TcxGridDBColumn;
    gtbListwaktu: TcxGridDBColumn;
    gtbListsubtotal: TcxGridDBColumn;
    gtbListdisc: TcxGridDBColumn;
    gtbListtotal: TcxGridDBColumn;
    gtbListmaterai: TcxGridDBColumn;
    gtbListgrandtotal: TcxGridDBColumn;
    gtbListnopol: TcxGridDBColumn;
    gtbListnamacust: TcxGridDBColumn;
    gtbListkodetype: TcxGridDBColumn;
    tblJenis: TMyTable;
    dsTbljenis: TMyDataSource;
    btnLoad: TcxButton;
    cxButton1: TcxButton;
    btnCancelPayment: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLoadClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnCancelPaymentClick(Sender: TObject);
  private
    { Private declarations }
    qryRep1, qryRep2, qryRep3 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmLaporanPayment: TfrmLaporanPayment;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmLaporanPayment.btnCancelPaymentClick(Sender: TObject);
var
   recSel : Integer;
   pkbNumb : String;
begin
   recSel := gtbList.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   pkbNumb := vartostr(gtbList.DataController.GetValue(recSel, gtbListpkbnumber.Index));
   //qryRep1.Close;
   qryRep1.SQL.Clear;
   qryRep1.SQL.Add('update ben_bengkel_pkb_pelunasan set ' +
       'isdelete = ''' + 'Y' + ''',' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where pkbnumber = ''' + pkbNumb + ''';');
   qryRep1.SQL.Add('update ben_bengkel_pkb set ' +
       'status = ''' + 'F' + ''',' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where pkbnumber = ''' + pkbNumb + ''';');
   qryRep1.ExecSQL;
   ShowMessage('Cancel Payment FInish' + #13 + 'Check your PKB Master');
   btnLoad.Click;
end;

procedure TfrmLaporanPayment.btnLoadClick(Sender: TObject);
begin
    qryList.Close;
    qryList.SQL.Clear;
    qryList.SQL.Add('select pkbnumber, custcode, tglpelunasan, waktu, subtotal, ' +
             'disc, total, materai, grandtotal, ' +
            '(select ben_bengkel_customer.nopol from ben_bengkel_customer where ' +
            'ben_bengkel_customer.codecust = ben_bengkel_pkb_pelunasan.custcode) as nopol, ' +
            '(select ben_bengkel_customer.namacust from ben_bengkel_customer ' +
            'where ben_bengkel_customer.codecust = ben_bengkel_pkb_pelunasan.custcode) as namacust, ' +
            '(select ben_bengkel_customer.kodetype from ben_bengkel_customer where ' +
            'ben_bengkel_customer.codecust = ben_bengkel_pkb_pelunasan.custcode) as kodetype ' +
            'from ben_bengkel_pkb_pelunasan WHERE ben_bengkel_pkb_pelunasan.tglpelunasan >= ''' +
            FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND ben_bengkel_pkb_pelunasan.tglpelunasan <= ''' +
            FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''' AND ben_bengkel_pkb_pelunasan.isdelete = ''' + 'N' + '''');
    qryList.Open;
    gtbList.DataController.Refresh;
end;

procedure TfrmLaporanPayment.cxButton1Click(Sender: TObject);
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

procedure TfrmLaporanPayment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     qryRep1.Free;
     qryRep2.Free;
     qryRep3.Free;
     Action := caFree;
end;

procedure TfrmLaporanPayment.FormCreate(Sender: TObject);
begin
   qryRep1 := TMyQuery.Create(Self);
   qryRep1.Connection := DMDB.dbInternal;
   qryRep1.SQL.Add('select * from temptable');
   qryRep1.Active := true;

   qryRep2 := TMyQuery.Create(Self);
   qryRep2.Connection := DMDB.dbInternal;
   qryRep2.SQL.Add('select * from temptable');
   qryRep2.Active := true;

   qryRep3 := TMyQuery.Create(Self);
   qryRep3.Connection := DMDB.dbInternal;
   qryRep3.SQL.Add('select * from temptable');
   qryRep3.Active := true;

   tblJenis.Active := True;

   edStart.Date := Date;
   edEnd.Date := Date;
   qryList.Active := True;
   gtbList.DataController.Refresh;
   //tbl
end;

end.
