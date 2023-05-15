unit FMemberHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MyAccess, Data.DB,
  DBAccess, MemDS, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
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
  dxSkinXmas2008Blue, cxButtons, cxControls, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxContainer, cxGroupBox, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxCalendar, cxTimeEdit, cxCalc, cxDBLookupComboBox, WinInet, Vcl.ExtCtrls;

type
  TfrmMemberHistory = class(TForm)
    Label1: TLabel;
    qryOutlet: TMyQuery;
    dsQryOutlet: TMyDataSource;
    btnKonek: TcxButton;
    qryTrans: TMyQuery;
    dsQryTrans: TMyDataSource;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gbSearch: TcxGroupBox;
    edScan: TcxTextEdit;
    gtbListtanggal: TcxGridDBColumn;
    gtbListwaktu: TcxGridDBColumn;
    gtbListid_member: TcxGridDBColumn;
    gtbListpoint_a: TcxGridDBColumn;
    gtbListpoint_t: TcxGridDBColumn;
    gtbListpoint_k: TcxGridDBColumn;
    gtbListpoint_end: TcxGridDBColumn;
    gtbListid_outlet: TcxGridDBColumn;
    Label2: TLabel;
    Label3: TLabel;
    lblName: TLabel;
    lblCardNumber: TLabel;
    lblPoint: TLabel;
    tmrConServer: TTimer;
    lblCheck: TLabel;
    dbMember: TMyConnection;
    procedure btnKonekClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edScanKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure tmrConServerTimer(Sender: TObject);
  private
    { Private declarations }
    qryServerCari : TMyQuery;
    intCountLogin : Integer;
    function CekInternet: Boolean;
    procedure CariMember;

  public
    { Public declarations }
  end;

var
  frmMemberHistory: TfrmMemberHistory;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmMemberHistory.CariMember;
begin
   if (btnKonek.Enabled = True) then
     begin
       ShowMessage('Please Connect to Server First');
       Exit;
     end;
   qryServerCari := TMyQuery.Create(Self);
   qryServerCari.Connection := dbMember;
   qryServerCari.SQL.Add('select id_members, nama_lengkap, tot_point, no_kartu from members ' +
       'where id_members = ''' + edScan.Text + '''');
   qryServerCari.Active := true;
   qryServerCari.Open;
   if (qryServerCari.IsEmpty) then
     begin
       ShowMessage('Data Member Tidak Ditemukan !!');
       lblName.Caption := '';
       lblCardNumber.Caption := '';
       Exit;
     end
   else if (NOT qryServerCari.IsEmpty) then
     begin
       lblName.Caption := qryServerCari.Fields[1].AsString;
       lblCardNumber.Caption := qryServerCari.Fields[3].AsString;
       lblPoint.Caption := FormatFloat('#,#.0', qryServerCari.Fields[2].AsFloat);

       qryTrans.Close;
       qryTrans.SQL.Clear;
       qryTrans.SQL.Add('select tanggal, waktu, id_member, point_a, ' +
            'point_t, point_k, point_end, id_outlet from history_trans ' +
            'where id_member = ''' + edScan.Text + ''' ORDER BY tanggal ASC');
       qryTrans.Open;
     end;
   edScan.Clear;
   edScan.SetFocus;
end;

function TfrmMemberHistory.CekInternet: Boolean;
begin
   result := (InternetGetConnectedState(nil, 0));
end;

procedure TfrmMemberHistory.edScanKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) then CariMember;
end;

procedure TfrmMemberHistory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //qryTrans.Active := False;
   if (dbMember.Connected = True) then
      begin
        qryServerCari.Free;
        //dbMember.Free;
      end;
   dbMember.Disconnect;
   Action := caFree;
end;

procedure TfrmMemberHistory.FormCreate(Sender: TObject);
begin
   intCountLogin := 0;
   qryOutlet.Active := True;
   tmrConServer.Enabled := True;
end;

procedure TfrmMemberHistory.tmrConServerTimer(Sender: TObject);
begin
   { intCountLogin := intCountLogin + 1;
    if (intCountLogin = 2) then btnKonek.Click; }

end;

procedure TfrmMemberHistory.btnKonekClick(Sender: TObject);
begin
   lblCheck.Caption := 'Prepared Connect Server';
   Application.ProcessMessages;
   if (CekInternet = False) then
     begin
       gbSearch.Enabled := False;
       Exit;
     end;

   //dbMember := TMyConnection.Create(nil);
   dbMember.Server := frmMain.SERVER_DBHOST;
   dbMember.Database := frmMain.MEMBERDBNAME;
   dbMember.Username := frmMain.SERVER_DBUSER;
   dbMember.Password := frmMain.SERVER_DBPASS;
   dbMember.Port := StrToInt(frmMain.SERVER_DBPORT);
   try
        dbMember.Connected := True;
     Except
       on E : Exception do
       begin
          ShowMessage('Sorry Database Not Ready !!');
          lblCheck.Caption := 'Cloud Server Member Not Ready';
          Application.ProcessMessages;
       end;
     end;

   if (dbMember.Connected = True) then
     begin
       btnKonek.Enabled := False;
       gbSearch.Enabled := True;
       qryServerCari := TMyQuery.Create(Self);
       qryServerCari.Connection := dbMember;
       qryServerCari.SQL.Add('select * from empty_x');
       qryServerCari.Active := true;
       qryServerCari.Open;

       qryTrans.Connection := dbMember;
       qryTrans.Active := True;
       gtbList.DataController.DataSource := dsQryTrans;
       gtbList.DataController.Refresh;
       gbSearch.Enabled := True;
       if (qryServerCari.IsEmpty) then
         begin
           {ShowMessage('Data Member Tidak Ditemukan !!');
           lblNoKartu.Caption := '';
           lblKodeMember.Caption := '';
           Exit;}
         end
       else if (NOT qryServerCari.IsEmpty) then
         begin
           {edMemberNama.Text := qryServerCari.Fields[1].AsString;
           edMemberPoint.EditValue := qryServerCari.Fields[2].AsFloat;
           lblNoKartu.Caption := qryServerCari.Fields[3].AsString;
           lblKodeMember.Caption := qryServerCari.Fields[0].AsString; }
         end;

          lblCheck.Caption := 'Database Ready Please Scan Member...';
          Application.ProcessMessages;
          ShowMessage('Now Server Ready to Scan');
     end;
end;

end.
