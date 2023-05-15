unit FMemberList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, WinInet, cxMemo, Menus,
  MySQLBatch, mySQLDbTables, cxCalendar, cxCalc, dxSkinBlack, dxSkinBlue,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxNavigator;

type
  TfrmMemberList = class(TForm)
    Label1: TLabel;
    gtbServer: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbServerid_members: TcxGridDBColumn;
    gtbServernama_lengkap: TcxGridDBColumn;
    gtbServeralamat: TcxGridDBColumn;
    gtbServertanggal_lahir: TcxGridDBColumn;
    gtbServertot_point: TcxGridDBColumn;
    gtbServerno_kartu: TcxGridDBColumn;
    gtbServerno_telepon: TcxGridDBColumn;
    gtbServerno_handphone: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    gtbLocal: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    gtbLocalid_members: TcxGridDBColumn;
    gtbLocaltanggal: TcxGridDBColumn;
    gtbLocalexpired_date: TcxGridDBColumn;
    gtbLocalnama_lengkap: TcxGridDBColumn;
    gtbLocalalamat: TcxGridDBColumn;
    gtbLocalid_type: TcxGridDBColumn;
    gtbLocalid_identity: TcxGridDBColumn;
    gtbLocaltempat_lahir: TcxGridDBColumn;
    gtbLocaltanggal_lahir: TcxGridDBColumn;
    gtbLocaljenis_kelamin: TcxGridDBColumn;
    gtbLocaltot_point: TcxGridDBColumn;
    gtbLocalmembers_type: TcxGridDBColumn;
    gtbLocalno_kartu: TcxGridDBColumn;
    gtbLocalno_telepon: TcxGridDBColumn;
    gtbLocalno_handphone: TcxGridDBColumn;
    Label2: TLabel;
    Label3: TLabel;
    btnLoad: TButton;
    btnCopy: TButton;
    lblCecker: TLabel;
    pmServer: TPopupMenu;
    EDITDATA1: TMenuItem;
    dsServerListMember: TDataSource;
    dsServerSearch: TDataSource;
    procedure btnLoadClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EDITDATA1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function cekonline : Boolean;
  end;

var
  frmMemberList: TfrmMemberList;

implementation

{$R *.dfm}

uses FdmDB, FMain, FEditDetails;

Function TfrmMemberList.cekonline;
begin
     result := (InternetGetConnectedState(nil, 0))
end;

procedure TfrmMemberList.EDITDATA1Click(Sender: TObject);
var
   RecSelect : Integer;
   IDMember : String;
begin
     RecSelect := gtbServer.DataController.GetFocusedRecordIndex;
     IDMember := vartostr(gtbServer.DataController.GetValue(RecSelect, gtbServerid_members.Index));
     Application.CreateForm(TfrmEditDetails, frmEditDetails);
     with dmDB do
          begin
               ServerSearch.Close;
               ServerSearch.SQL.Clear;
               ServerSearch.SQL.Add('select id_members, tanggal, expired_date, ' +
                                    'nama_lengkap, alamat, id_type, id_identity, ' +
                                    'tempat_lahir, tanggal_lahir, jenis_kelamin, ' +
                                    'no_kartu, no_telepon, no_handphone, id_outlet from members where id_members = ''' +
                                   IDMember + '''');
               ServerSearch.Open;
               frmEditDetails.edIDMembers.Text := ServerSearch.Fields[0].AsString;
               frmEditDetails.edTglDaftar.Date := ServerSearch.Fields[1].AsDateTime;
               frmEditDetails.edExpired.Date := ServerSearch.Fields[2].AsDateTime;
               frmEditDetails.edNamaLengkap.Text := ServerSearch.Fields[3].AsString;
               frmEditDetails.edAlamat.Text := ServerSearch.Fields[4].AsString;
               frmEditDetails.edType.Text := ServerSearch.Fields[5].AsString;
               frmEditDetails.edNoID.Text := ServerSearch.Fields[6].AsString;
               frmEditDetails.edTempatLahir.Text := ServerSearch.Fields[7].AsString;
               frmEditDetails.edTglLahir.Date := ServerSearch.Fields[8].AsDateTime;
               frmEditDetails.edKelamin.Text := ServerSearch.Fields[9].AsString;
               frmEditDetails.edNoKartu.Text := ServerSearch.Fields[10].AsString;
               frmEditDetails.edFixLine.Text := ServerSearch.Fields[11].AsString;
               frmEditDetails.edHape.Text := ServerSearch.Fields[12].AsString;
               frmEditDetails.edOutlet.EditValue := ServerSearch.Fields[13].AsString;
          end;
     frmEditDetails.ShowModal;
end;

procedure TfrmMemberList.FormActivate(Sender: TObject);
begin
     dmDB.tblMember.Refresh;
     gtbLocal.DataController.Refresh;
end;

procedure TfrmMemberList.btnCopyClick(Sender: TObject);
var
   i, recSelect : Integer;
   idMember, noMember, namaMember : String;
begin
     cxGrid1.Enabled := False;

               gtbServer.DataController.GotoFirst;
               for i := 0 to gtbServer.DataController.RecordCount - 1 do
                   begin
                        recSelect := gtbServer.DataController.GetFocusedRecordIndex;
                        idMember := vartostr(gtbServer.DataController.GetValue(recSelect, gtbServerid_members.Index));
                        dmDB.qryCari.Close;
                        dmDB.qryCari.SQL.Clear;
                        dmDB.qryCari.SQL.Add('select id_members from members where id_members = ''' +
                                        idMember + '''');
                        dmDB.qryCari.Open;
                        if (dmDB.qryCari.IsEmpty) then
                            begin

                                 ServerSearch.Close;
                                 ServerSearch.SQL.Clear;
                                 ServerSearch.SQL.Add('select * from members where id_members = ''' +
                                                     idMember + '''');
                                 ServerSearch.Open;
                                 NoMember := StringReplace(ServerSearch.Fields[16].AsString,'+62','0',[]);
                                 NoMember := StringReplace(NoMember,'-','',[]);
                                 namaMember := StringReplace(ServerSearch.Fields[3].AsString, '''', '', [rfReplaceAll]);
                                 namaMember := StringReplace(namaMember, '"', '', [rfReplaceAll]);
                                 dmDB.qryExec.SQL.Clear;
                                 dmDB.qryExec.SQL.Add('insert into members values(' +
                                                 '''' + ServerSearch.Fields[0].AsString + ''',' +
                                                 '''' + FormatDateTime('yyyy-MM-dd', ServerSearch.Fields[1].AsDateTime) + ''',' +
                                                 '''' + FormatDateTime('yyyy-MM-dd', ServerSearch.Fields[2].AsDateTime) + ''',' +
                                                 '''' + namaMember + ''',' +
                                                 '''' + ServerSearch.Fields[4].AsString + ''',' +
                                                 '''' + ServerSearch.Fields[5].AsString + ''',' +
                                                 '''' + ServerSearch.Fields[6].AsString + ''',' +
                                                 '''' + ServerSearch.Fields[7].AsString + ''',' +
                                                 '''' + FormatDateTime('yyyy-MM-dd', ServerSearch.Fields[8].AsDateTime) + ''',' +
                                                 '''' + ServerSearch.Fields[9].AsString + ''',' +
                                                 '''' + ServerSearch.Fields[10].AsString + ''',' +
                                                 '''' + ServerSearch.Fields[11].AsString + ''',' +
                                                 '''' + floattostr(ServerSearch.Fields[12].AsFloat) + ''',' +
                                                 '''' + ServerSearch.Fields[13].AsString + ''',' +
                                                 '''' + ServerSearch.Fields[14].AsString + ''',' +
                                                 '''' + ServerSearch.Fields[15].AsString + ''',' +
                                                 '''' + noMember + ''',' +
                                                 '''' + inttostr(ServerSearch.Fields[17].AsInteger) + ''')');
                                 dmDB.qryExec.ExecSQL;
                                 dmDB.tblMember.Refresh;
                                 gtbLocal.DataController.Refresh;
                                 gtbServer.DataController.GotoNext;
                                 Application.ProcessMessages;
                            end
                        else if (NOT dmDB.qryCari.IsEmpty) then
                            begin
                                 gtbServer.DataController.GotoNext;
                                 Application.ProcessMessages;
                            end;
                       btnCopy.Enabled := False;
                   end;

     cxGrid1.Enabled := True;
end;

procedure TfrmMemberList.btnLoadClick(Sender: TObject);
var
   CountLocal, CountServer : Integer;
begin

               if (cekonline = True) then
                   begin
                        lblCecker.Caption := 'INTERNET ACTIVE';
                        Application.ProcessMessages;
                        if (dbOnline.Connected = True) then dbOnline.Connected := False;

                        try
                           dbOnline.Host := frmMain.SERVERHOST;
                           dbOnline.UserName := frmMain.SERVERUSER;
                           dbOnline.UserPassword := frmMain.SERVERPASS;
                           dbOnline.DatabaseName := frmMain.SERVERDB;
                           dbOnline.Connected := True;
                           ServerSearch.Active := True;
                           ServerListMember.Active := True;
                           //Cek_Online;
                           ServerListMember.Close;
                           ServerListMember.SQL.Clear;
                           ServerListMember.SQL.Add('select id_members, nama_lengkap, alamat, ' +
                                                    'tanggal_lahir, tot_point, no_kartu, no_telepon, ' +
                                                    'no_handphone from members');
                           ServerListMember.Open;
                           gtbServer.DataController.Refresh;
                           CountServer := ServerListMember.RecordCount;
                           CountLocal := dmDB.tblMember.RecordCount;
                           if (CountLocal < CountServer) then
                               begin
                                    btnCopy.Enabled := True;
                               end
                           else if (CountLocal >= CountServer) then
                               begin
                                    btnCopy.Enabled := False;
                               end;



                        except
                             on E : Exception do
                             ShowMessage(e.ClassName + ' Error ');
                        end;
                   end
               else if (cekonline = False) then
                   begin
                        lblCecker.Caption := 'INTERNET NOT ACTIVE !';
                        ShowMessage('Maaf Koneksi Database gagal' +#13#13 + 'Mohon cek koneksi Anda !');
                   end;
              //ServerListMember.Close;


end;

end.
