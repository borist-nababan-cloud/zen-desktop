unit FHistoryMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, WinInet, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc,
  cxDBLookupComboBox, cxCalendar, cxTimeEdit, dxSkinBlack, dxSkinBlue,
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
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxNavigator, DBAccess, MemDS;

type
  TfrmHistoryMember = class(TForm)
    btnCek: TButton;
    lblCecker: TLabel;
    Label1: TLabel;
    edMemberID: TEdit;
    gtbHistory: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsServerCari: TDataSource;
    Label2: TLabel;
    edNama: TEdit;
    edTotPoint: TcxCalcEdit;
    Label3: TLabel;
    gtbHistorytrans_id: TcxGridDBColumn;
    gtbHistorytanggal: TcxGridDBColumn;
    gtbHistorywaktu: TcxGridDBColumn;
    gtbHistoryjumlah_trans: TcxGridDBColumn;
    gtbHistorypoint_a: TcxGridDBColumn;
    gtbHistorypoint_t: TcxGridDBColumn;
    gtbHistorypoint_k: TcxGridDBColumn;
    gtbHistorypoint_end: TcxGridDBColumn;
    gtbHistoryid_outlet: TcxGridDBColumn;
    dsTblOutlet: TDataSource;
    Label4: TLabel;
    dbOnline: TMyConnection;
    ServerCari: TMyQuery;
    ServerSearch: TMyQuery;
    TblOutlet: TMyTable;
    procedure btnCekClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edMemberIDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    NO_MEMBER : String;
     LOCAL_POINT, SERVER_POINT, TAMBAH_POINT, KURANG_POINT,
     SISA_POINT, AWAL_POINT : Double;
     SERVER_NAMA : string;
     Function cekonline : Boolean;
     //procedure Cek_Local;
     procedure Cek_Online;
     //procedure Update_Server;
  public
    { Public declarations }
  end;

var
  frmHistoryMember: TfrmHistoryMember;

implementation

uses FMain;

{$R *.dfm}

procedure TfrmHistoryMember.btnCekClick(Sender: TObject);
begin
     if (cekonline = True) then
         begin
              lblCecker.Caption :='Status online, Connecting to Database';
              Application.ProcessMessages;
              try
                 dbOnline.Server := frmMain.SERVERHOST;
                 dbOnline.UserName := frmMain.SERVERUSER;
                 dbOnline.Password := frmMain.SERVERPASS;
                 dbOnline.Database := frmMain.SERVERDB;
                 dbOnline.Connected := True;
                 lblCecker.Caption :='Status online, Database Aktif';
                 ServerSearch.Active := True;
                 ServerCari.Active := True;
                 tblOutlet.Active := True;
                 Cek_Online;
                           //Cek_Local;
                           //ShowMessage('Database Connected !');
                 except
                       on E : Exception do
                       ShowMessage(e.ClassName + ' Error ');
                       end;
         end
     else if (cekonline = False) then
         begin
              lblCecker.Caption :='Status Offline';
              ShowMessage('Maaf Koneksi Database gagal' +#13#13 + 'Mohon cek koneksi Anda !');
                        {frmTransMember.Close;
                        frmPelunasan.edIDCustomerPayment.Clear;
                        frmPelunasan.edIDCustomerPayment.SetFocus;}
         end;

end;

Function TfrmHistoryMember.cekonline;
begin
     result := (InternetGetConnectedState(nil, 0))
end;

procedure TfrmHistoryMember.Cek_Online;
begin
     ServerSearch.Close;
     ServerSearch.SQL.Clear;
     ServerSearch.SQL.Add('select id_members, nama_lengkap, tot_point from members where id_members = ''' +
                          edMemberID.Text + '''');
     ServerSearch.Open;
     if (ServerSearch.IsEmpty) then
         begin
              ShowMessage('Maaf Data member ' + edMemberID.Text + ' Belum Ada Di Server Online');
              Exit;
         end;
     edNama.Text := ServerSearch.Fields[1].AsString;
     edTotPoint.EditValue := serverSearch.Fields[2].AsFloat;
     ServerSearch.Close;
     ServerCari.SQL.Clear;
     ServerCari.SQL.Add('select trans_id, tanggal, waktu, ' +
                           'jumlah_trans, point_a, point_t, point_k, point_end, ' +
                           'id_outlet from history_trans where id_member = ''' +
                           edMemberID.Text + '''');
     ServerCari.Open;
     gtbHistory.DataController.Refresh;

end;

procedure TfrmHistoryMember.edMemberIDKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #13) then
         begin
              if (edMemberID.Text = '') then
                  begin
                       Exit;
                  end
              else
                  begin
                       btnCek.Click;
                  end;

         end;
end;

procedure TfrmHistoryMember.FormActivate(Sender: TObject);
begin
     //
     if (cekonline = True) then
         begin
              lblCecker.Caption :='Status online, Scan Kartu Member';
              //edMemberID.SetFocus;
         end
     else if (cekonline = False) then
         begin
              lblCecker.Caption :='Status Offline, Mohon Cek Koneksi Internet Anda !! ';
         end;
end;

procedure TfrmHistoryMember.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dbOnline.Connected := False;
     Action := caFree;
end;

end.
