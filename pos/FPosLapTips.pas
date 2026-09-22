unit FPosLapTips;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, Vcl.StdCtrls,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Data.DB, DBAccess,
  MyAccess, MemDS, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, ShellApi, cxGridExportLink,
  cxCalc;

type
  TfrmPosLapTips = class(TForm)
    tabControl: TcxPageControl;
    tabMain: TcxTabSheet;
    lblJudulAtas: TLabel;
    Label1: TLabel;
    edStart: TcxDateEdit;
    btnLoad: TcxButton;
    tabEdit: TcxTabSheet;
    qryList: TMyQuery;
    dsQryList: TMyDataSource;
    Label2: TLabel;
    edEnd: TcxDateEdit;
    cxGrid1: TcxGrid;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    gtbListid_payment: TcxGridDBColumn;
    gtbListvalue: TcxGridDBColumn;
    gtbListtanggal: TcxGridDBColumn;
    gtbListtrlist: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    gtbListlastuser: TcxGridDBColumn;
    gtbListkodepayment1: TcxGridDBColumn;
    gtbListkodebank1: TcxGridDBColumn;
    gtbListvpayment1: TcxGridDBColumn;
    gtbListkodepayment2: TcxGridDBColumn;
    gtbListkodebank2: TcxGridDBColumn;
    gtbListnama_member: TcxGridDBColumn;
    gtbListvcash: TcxGridDBColumn;
    dlgSave: TSaveDialog;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qryCari, qryFind, qryTemp, qrySearch, qryExec : TMyQuery;
  public
    { Public declarations }
    ISADMIN : Boolean;
  end;

var
  frmPosLapTips: TfrmPosLapTips;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmPosLapTips.btnLoadClick(Sender: TObject);
begin
     qryList.Close;
     qryList.SQL.Clear;
     qryList.SQL.Add('SELECT trans_payment_tips.id_payment, trans_payment_tips.value, ' +
          'trans_payment_tips.tanggal, trans_payment_tips.trlist, ' +
          'trans_payment_tips.lasteditdate, trans_payment_tips.lastuser, ' +
          'trans_payment_detail.kodepayment1, trans_payment_detail.kodebank1, ' +
          'trans_payment_detail.vpayment1, trans_payment_detail.kodepayment2, ' +
          'trans_payment_detail.kodebank2, trans_payment.nama_member, ' +
          'trans_payment_detail.vcash ' +
          'FROM trans_payment_tips INNER JOIN ' +
          'trans_payment_detail ON trans_payment_tips.id_payment = ' +
          'trans_payment_detail.id_payment INNER JOIN ' +
          'trans_payment ON trans_payment_tips.id_payment = ' +
          'trans_payment.id_payment ' +
          'WHERE trans_payment_tips.tanggal >= ''' +
          FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND trans_payment_tips.tanggal <= ''' +
          FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
     qryList.Open;
     gtbList.DataController.Refresh;
end;

procedure TfrmPosLapTips.cxButton1Click(Sender: TObject);
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

procedure TfrmPosLapTips.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmPosLapTips.FormCreate(Sender: TObject);
begin
    tabControl.HideTabs := True;
    tabControl.ActivePage := tabMain;
    edStart.Date := Date;
    edEnd.Date := Date;
    qryList.Active := True;
    gtbList.DataController.Refresh;
end;

end.
