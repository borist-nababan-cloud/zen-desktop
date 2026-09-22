unit FPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, StdCtrls,
  cxCheckBox, Menus, cxButtons, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  MyAccess, DB, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmPassword = class(TForm)
    Label1: TLabel;
    edUname: TcxTextEdit;
    Label2: TLabel;
    edNama: TcxTextEdit;
    Label3: TLabel;
    edOldPass: TcxTextEdit;
    Label4: TLabel;
    edNewPass: TcxTextEdit;
    Label5: TLabel;
    edRetype: TcxTextEdit;
    ckPassLama: TcxCheckBox;
    ckPassBaru: TcxCheckBox;
    ckRetype: TcxCheckBox;
    btnUpdate: TcxButton;
    btnCancel: TcxButton;
    Label6: TLabel;
    procedure ckPassLamaPropertiesChange(Sender: TObject);
    procedure ckPassBaruPropertiesChange(Sender: TObject);
    procedure ckRetypePropertiesChange(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    passLama : String;
    qrySearch, qryEksekusi : TMyQuery;
  public
    { Public declarations }
    OLD_PASS : String;
  end;

var
  frmPassword: TfrmPassword;

implementation

{$R *.dfm}
uses FdmDB, FMain, MainSource;

procedure TfrmPassword.btnUpdateClick(Sender: TObject);
var
   newPass : String;
begin
   if (RemoveSpecialChars(edNewPass.Text)= False) then
        begin
             ShowMessage('Invalid Character Inserted');
             Exit
        end;
   if (OLD_PASS <> edOldPass.Text) then
       begin
            ShowMessage('Maaf Password baru berbeda !!');
            Exit;
       end;
   if (edNewPass.Text <> edRetype.Text) then
       begin
            ShowMessage('Maaf Password baru berbeda !!');
            Exit;
       end;
   newPass := EncryptPass(edNewPass.Text);
   qryEksekusi.SQL.Clear;
   qryEksekusi.SQL.Add('update users set ' +
                  'password = ''' + newPass + ''',' +
                  'namalengkap = ' + QuotedStr(edNama.Text) + ' ' +
                  'where userid = ''' + edUname.Text + '''');
   qryEksekusi.ExecSQL;
   passLama := newPass;
   edOldPass.Clear;
   edRetype.Clear;
   edNewPass.Clear;
   ShowMessage('Update Password Berhasil' + #13#13 + 'Silahkan Login Kembali');
   Application.Terminate;
               {frmMain.APP_LOGOUT.Click;
               frmPassword.Close;}
               //frmMain.INV__LOGOUT.Click;


end;

procedure TfrmPassword.ckPassBaruPropertiesChange(Sender: TObject);
begin
     if (ckPassBaru.Checked = True) then edNewPass.Properties.EchoMode := eemNormal
     else if (ckPassBaru.Checked = False) then edNewPass.Properties.EchoMode := eemPassword;
end;

procedure TfrmPassword.ckPassLamaPropertiesChange(Sender: TObject);
begin
     if (ckPassLama.Checked = True) then edOldPass.Properties.EchoMode := eemNormal
     else if (ckPassLama.Checked = False) then edOldPass.Properties.EchoMode := eemPassword;
end;

procedure TfrmPassword.ckRetypePropertiesChange(Sender: TObject);
begin
     if (ckRetype.Checked = True) then edRetype.Properties.EchoMode := eemNormal
     else if (ckRetype.Checked = False) then edRetype.Properties.EchoMode := eemPassword;
end;

procedure TfrmPassword.FormActivate(Sender: TObject);
var
   ExtrPass : String;
begin
   {qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select * from users where userid = ''' +
                    frmMain.USERAPPS + '''');
   qrySearch.Open;
   edUname.Text := qrySearch.Fields[0].AsString;
   edNama.Text := qrySearch.Fields[4].AsString;
   passLama := DecryptPass(qrySearch.Fields[1].AsString); }
   //edOldPass.Text := DecryptPass(qrySearch.Fields[1].AsString);
end;

procedure TfrmPassword.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     qrySearch.Free;
     Action := caFree;
end;

procedure TfrmPassword.FormCreate(Sender: TObject);
begin
     qrySearch := TMyQuery.Create(Self);
     qrySearch.Connection := DMDB.dbInternal;
     qrySearch.SQL.Add('select * from temptable');
     qrySearch.Active := true;

     qryEksekusi := TMyQuery.Create(Self);
     qryEksekusi.Connection := DMDB.dbInternal;
     qryEksekusi.SQL.Add('select * from temptable');
     qryEksekusi.Active := true;
end;

end.
