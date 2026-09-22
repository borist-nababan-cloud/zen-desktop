unit FMasterPassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MainSource, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinXmas2008Blue, cxTextEdit, Vcl.StdCtrls, Vcl.Menus, cxButtons, MyAccess,
  cxCheckBox, RegularExpressions;

type
  TfrmMasterPassword = class(TForm)
    lblJudulAtas: TLabel;
    Label1: TLabel;
    edDiscAdd: TcxTextEdit;
    btnSimpan: TcxButton;
    memStruktur: TMemo;
    ckShowDiscPass: TcxCheckBox;
    Label2: TLabel;
    edMainMail: TcxTextEdit;
    ckShowMailPass: TcxCheckBox;
    Label3: TLabel;
    edMailPass: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure ckShowPropertiesEditValueChanged(Sender: TObject);
    procedure cxCheckBox1PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    qryExec, qrySearch : TMyQuery;
    procedure LoadPassword;
    function ValidateEmail(const emailAddress: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmMasterPassword: TfrmMasterPassword;

implementation

{$R *.dfm}

uses FMain, FdmDB;

procedure TfrmMasterPassword.btnSimpanClick(Sender: TObject);
var
  i: Integer;
  isOKMail : Boolean;
begin
    isOKMail := ValidateEmail(edMainMail.Text);
    if (isOKMail = False) then
      begin
        ShowMessage('Invalid Email Address !!' + #13 +
                  'Please Check Your Mail Address !');
        edMainMail.SelectAll;
        edMainMail.SetFocus;
        Exit;
      end;
    if (edDiscAdd.Text = '') then
      begin
        ShowMessage('Discount is Empty !!');
        Exit;
      end;
    qryExec.SQL.Clear;
    qryExec.SQL.Add('TRUNCATE ben_master_password');
    qryExec.ExecSQL;
    Sleep(100);
    qryExec.SQL.Clear;
    qryExec.SQL.Add('insert into ben_master_password values(' +
        '''' + '' + ''',' +
        '''' + 'POS_DISC' + ''',' +
        QuotedStr(EncryptPass(edDiscAdd.Text)) + ',' +
        QuotedStr(frmMain.USERAPPS) + ',' +
        QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ');');

    qryExec.SQL.Add('insert into ben_master_password values(' +
        '''' + '' + ''',' +
        '''' + 'MAIN_MAIL' + ''',' +
        QuotedStr(edMainMail.Text) + ',' +
        QuotedStr(frmMain.USERAPPS) + ',' +
        QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ');');

    qryExec.SQL.Add('insert into ben_master_password values(' +
        '''' + '' + ''',' +
        '''' + 'MAIN_MAIL_PASSWORD' + ''',' +
        QuotedStr(EncryptPass(edMailPass.Text)) + ',' +
        QuotedStr(frmMain.USERAPPS) + ',' +
        QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ');');
    qryExec.ExecSQL;
    ShowMessage('Save Data Finish, Please Close This Form Immediately !');
end;

procedure TfrmMasterPassword.ckShowPropertiesEditValueChanged(Sender: TObject);
begin
   if (ckShowDiscPass.Checked = True) then edDiscAdd.Properties.EchoMode := eemNormal
   else if (ckShowDiscPass.Checked = False) then edDiscAdd.Properties.EchoMode := eemPassword;
end;

procedure TfrmMasterPassword.cxCheckBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
   if (ckShowMailPass.Checked = True) then edMailPass.Properties.EchoMode := eemNormal
   else if (ckShowMailPass.Checked = False) then edMailPass.Properties.EchoMode := eemPassword;
end;

procedure TfrmMasterPassword.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryExec.Free;
   qrySearch.Free;
   Action := caFree;
end;

procedure TfrmMasterPassword.FormCreate(Sender: TObject);
begin
    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

    qrySearch := TMyQuery.Create(Self);
    qrySearch.Connection := DMDB.dbInternal;
    qrySearch.SQL.Add('select * from temptable');
    qrySearch.Active := true;

    qrySearch.Close;
    qrySearch.SQL.Clear;
    qrySearch.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_master_password'));
    qrySearch.Open;
    if (qrySearch.IsEmpty) then
      begin
       qryExec.SQL.Clear;
       qryExec.SQL.Add(memStruktur.Text);
       qryExec.ExecSQL;
      end;
   LoadPassword;
end;

procedure TfrmMasterPassword.LoadPassword;
var
  i: Integer;
begin
   qrySearch.Close;
    qrySearch.SQL.Clear;
    qrySearch.SQL.Add('select passkey, moduleinfo from ben_master_password');
    qrySearch.Open;
    qrySearch.First;
    for i := 0 to qrySearch.RecordCount -1 do
       begin
           if (qrySearch.Fields[1].AsString = 'POS_DISC') then edDiscAdd.Text := DecryptPass(qrySearch.Fields[0].AsString)
           else if (qrySearch.Fields[1].AsString = 'MAIN_MAIL') then edMainMail.Text := qrySearch.Fields[0].AsString
           else if (qrySearch.Fields[1].AsString = 'MAIN_MAIL_PASSWORD') then edMailPass.Text := DecryptPass(qrySearch.Fields[0].AsString);
           qrySearch.Next;
       end;

end;

function TfrmMasterPassword.ValidateEmail(const emailAddress: string): Boolean;
var
  RegEx: TRegEx;
begin
   RegEx := TRegex.Create('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]*[a-zA-Z0-9]+$');
  Result := RegEx.Match(emailAddress).Success;
end;

end.
