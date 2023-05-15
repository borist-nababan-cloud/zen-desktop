unit FReejectGuest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, DBAccess,
  MyAccess, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxContainer, Vcl.Menus, cxButtons, cxGroupBox, cxTimeEdit, cxTextEdit,
  cxCalendar, cxMaskEdit, cxSpinEdit, cxDropDownEdit, cxCalc;

type
  TfrmRejectGuest = class(TForm)
    Label1: TLabel;
    qryReject: TMyQuery;
    dsQryReject: TMyDataSource;
    StrukturPayment: TMemo;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListautonum: TcxGridDBColumn;
    gtbListtanggal: TcxGridDBColumn;
    gtbListwaktu: TcxGridDBColumn;
    gtbListjenis_jasa: TcxGridDBColumn;
    gtbListketerangan: TcxGridDBColumn;
    gtbListiscancel: TcxGridDBColumn;
    gtbListlastuser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    btnRefresh: TcxButton;
    edWaktu: TcxTimeEdit;
    Label2: TLabel;
    edJasa: TcxComboBox;
    Label3: TLabel;
    edKeterangan: TcxTextEdit;
    Label4: TLabel;
    btnSekarang: TcxButton;
    cxButton2: TcxButton;
    btnReset: TcxButton;
    edJumlahTamu: TcxCalcEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnSekarangClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryFind, qryExec : TMyQuery;
    tglCari : TDate;
  public
    { Public declarations }
  end;

var
  frmRejectGuest: TfrmRejectGuest;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmRejectGuest.btnRefreshClick(Sender: TObject);
begin
   qryReject.Close;
   qryReject.SQL.Clear;
   qryReject.SQL.Add('select * from trans_reject where tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglCari) +
       ''' AND iscancel = ''' + 'N' + '''');
   qryReject.Open;
   gtbList.DataController.Refresh;
end;

procedure TfrmRejectGuest.btnSekarangClick(Sender: TObject);
begin
  edWaktu.Time := Time;
end;

procedure TfrmRejectGuest.cxButton1Click(Sender: TObject);
var
   recSel, autonum : Integer;
begin
  recSel := gtbList.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  autonum := gtbList.DataController.GetValue(recSel, gtbListautonum.Index);
  qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_reject set ' +
      'iscancel = ''' + 'Y' + ''',' +
      'lastuser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
      'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
      'where autonum = ''' + IntToStr(autonum) + '''');
   qryExec.ExecSQL;
   ShowMessage('Cancel Data Finish !');
   btnReset.Click;
   btnRefresh.Click;
end;

procedure TfrmRejectGuest.cxButton2Click(Sender: TObject);
var
  i: Integer;
begin
   for i := 0 to edJumlahTamu.EditValue -1 do
     begin
       qryExec.SQL.Clear;
       qryExec.SQL.Add('insert into trans_reject values(' +
          '''' + '' + ''',' +
          QuotedStr(FormatDateTime('yyyy-MM-dd', tglCari)) + ',' +
          QuotedStr(FormatDateTime('hh:mm:ss', edWaktu.Time)) + ',' +
          QuotedStr(edJasa.Text) + ',' +
          QuotedStr(edKeterangan.Text) + ',' +
          '''' + 'N' + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
       qryExec.ExecSQL;
     end;
   ShowMessage('Insert Data Finish !');
   btnReset.Click;
   btnRefresh.Click;
end;

procedure TfrmRejectGuest.btnResetClick(Sender: TObject);
begin
   edWaktu.Time := Time;
   edKeterangan.Clear;
   edJasa.Text := 'BM';
   edJumlahTamu.EditValue := 1;
end;

procedure TfrmRejectGuest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryFind.Free;
  qrySearch.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmRejectGuest.FormCreate(Sender: TObject);
begin
   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;


   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from temptable');
   qrySearch.Active := true;

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.dbInternal;
   qryFind.SQL.Add('select * from temptable');
   qryFind.Active := true;

   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
   qrySearch.Open;
   tglCari := qrySearch.Fields[0].AsDateTime;

   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('trans_reject'));
   qryFind.Open;
   if (qryFind.IsEmpty) then
    begin
     qryExec.SQL.Clear;
     qryExec.SQL.Add(StrukturPayment.Text);
     qryExec.ExecSQL;
    end;
   qryReject.Active := True;
   qryReject.Refresh;
   gtbList.DataController.Refresh;
   btnRefresh.Click;

end;

end.
