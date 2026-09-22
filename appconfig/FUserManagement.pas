unit FUserManagement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MyAccess, DB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, StdCtrls, cxContainer,
  cxMaskEdit, cxDropDownEdit, Menus, cxButtons, cxDBLookupComboBox,
  cxLookupEdit, cxDBLookupEdit, MainSource, cxCheckBox, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, DBAccess;

type
  TfrmUserManagement = class(TForm)
    gtbUser: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbUseruserid: TcxGridDBColumn;
    gtbUserpassword: TcxGridDBColumn;
    gtbUseridkaryawan: TcxGridDBColumn;
    gtbUserusergroupid: TcxGridDBColumn;
    Label1: TLabel;
    edUser: TcxTextEdit;
    Label2: TLabel;
    edPassword: TcxTextEdit;
    Label3: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    edGroup: TcxLookupComboBox;
    dsTblUsers: TDataSource;
    tblUsers: TMyTable;
    dsTblGroup: TDataSource;
    tblGroup: TMyTable;
    gtbUserNama: TcxGridDBColumn;
    edNama: TcxTextEdit;
    Label4: TLabel;
    ckShow: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ckShowPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    qryUser1, qryUser2, qryExec : TmyQuery;
  public
    { Public declarations }
  end;

var
  frmUserManagement: TfrmUserManagement;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmUserManagement.ckShowPropertiesChange(Sender: TObject);
begin
  if (ckShow.Checked = True) then
    begin
      edPassword.Properties.EchoMode := eemNormal;
    end
  else if (ckShow.Checked = False) then
    begin
      edPassword.Properties.EchoMode := eemPassword;
    end;
end;

procedure TfrmUserManagement.cxButton1Click(Sender: TObject);
var
   recSelect : Integer;
   userid : String;
begin
   recSelect := gtbUser.DataController.GetFocusedRecordIndex;
   if (recSelect < 0) then Exit;
   userid := vartostr(gtbUser.DataController.GetValue(recSelect, gtbUseruserid.Index));
   qryUser2.Close;
   qryUser2.SQL.Clear;
   qryUser2.SQL.Add('select * from users where userid = ''' + userid + '''');
   qryUser2.Open;
   //ShowMessage(IntToStr(recSelect));
   //ShowMessage(userid);
   edUser.Text := qryUser2.Fields[0].AsString;
   edPassword.Text := DecryptPass(qryUser2.Fields[1].AsString);
   edGroup.EditValue := qryUser2.Fields[3].AsString;
   edNama.Text := qryUser2.Fields[4].AsString;
end;

procedure TfrmUserManagement.cxButton2Click(Sender: TObject);
var
  strNewPass, hasil : String;
begin
    if (edUser.Text = '') then
       begin
           ShowMessage('Data User ID Can Not Empty');
           Exit;
       end;
    if (edPassword.Text = '') then
       begin
           ShowMessage('Data Password ID Can Not Empty');
           Exit;
       end;
    if (edNama.Text = '') then
       begin
           ShowMessage('Data Nama Can Not Empty');
           Exit;
       end;
    if (edGroup.Text = '') then
       begin
           ShowMessage('Data Group ID Can Not Empty');
           Exit;
       end;
    strNewPass := EncryptPass(edPassword.Text);
    //ShowMessage(strNewPass);
    hasil := DecryptPass(strNewPass);
    //ShowMessage(hasil);
    qryUser1.Close;
    qryUser1.SQL.Clear;
    qryUser1.SQL.Add('select userid from users where userid = ''' +
             edUser.Text + '''');
    qryUser1.Open;
    if (qryUser1.IsEmpty) then
       begin
           qryExec.SQL.Clear;
           qryExec.sql.Add('insert into users values(' +
                        '''' + edUser.Text + ''',' +
                        '''' + strNewPass + ''',' +
                        '''' + '' + ''',' +
                        '''' + vartostr(edGroup.EditValue) + ''',' +
                        '''' + edNama.Text + ''')');
           qryExec.ExecSQL;
           tblUsers.Refresh;
           gtbUser.DataController.DataSource := dsTblUsers;
           ShowMessage('Insert Data Finish');
           edUser.Clear;
           edPassword.Clear;
           edNama.Clear
       end
    else if (NOT qryUser1.IsEmpty) then
       begin
          if (MessageDlg('Data User Exist, ' + #13 +
              'Would You Like to Update Data ?', mtConfirmation, mbOKCancel,0) = mrOk) then
             begin
                  qryExec.SQL.Clear;
                  qryExec.SQL.Add('update users set ' +
                       'password = ''' + strNewPass + ''',' +
                       'idkaryawan = ''' + '' + ''',' +
                       'usergroupid = ''' + vartostr(edGroup.EditValue) + ''',' +
                       'namalengkap = ''' + edNama.Text + ''' ' +
                       'where userid = ''' + edUser.Text + '''');
                  qryExec.ExecSQL;
                  edUser.Clear;
                  edPassword.Clear;
                  edNama.Clear;
                  tblUsers.Refresh;
                  gtbUser.DataController.DataSource := dsTblUsers;
                  ShowMessage('Update Finish');
                  Exit;
             end;
           ShowMessage('Canceling Update Data User');
           edUser.Clear;
           edPassword.Clear;
           edNama.Clear;

       end
end;

procedure TfrmUserManagement.FormActivate(Sender: TObject);
var
  i: Integer;
begin
    Sleep(1000);
end;

procedure TfrmUserManagement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     qryUser1.Free;
     qryUser2.Free;
     tblUsers.Active := False;
     tblGroup.Active := False;
     Action := caFree;

end;

procedure TfrmUserManagement.FormCreate(Sender: TObject);
begin
     qryUser1 := TMyQuery.Create(Self);
     qryUser1.Connection := DMDB.dbInternal;
     qryUser1.SQL.Add('select * from temptable');
     qryUser1.Active := true;

     qryUser2 := TMyQuery.Create(Self);
     qryUser2.Connection := DMDB.dbInternal;
     qryUser2.SQL.Add('select * from temptable');
     qryUser2.Active := true;

     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from temptable');
     qryExec.Active := true;

     {tblUser := TmySQLTable.Create(Self);
     tblUser.Database := DMDB.StoreDB;
     tblUser.TableName := 'users';
     tblUser.Active := true;}

     {tblGroup := TmySQLTable.Create(Self);
     tblGroup.Database := DMDB.StoreDB;
     tblGroup.TableName := 'usersgroup';
     tblGroup.Active := true;}

     //dsTblUser := TDataSource.Create(Self);
     tblUsers.TableName := 'users';
     tblUsers.Active := True;
     tblGroup.TableName := 'usersgroup';
     tblGroup.Active := True;

     dsTblUsers.DataSet := tblUsers;

     gtbUser.DataController.DataSource := dsTblUsers;

end;

end.
