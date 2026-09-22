unit FLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, MyAccess, DB, StdCtrls, shellapi, strUtils,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, Menus, cxButtons, cxLabel, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, MemDS, XSuperObject,
  cxMaskEdit, cxDropDownEdit;

type
  TfrmLogin = class(TForm)
    edUser: TcxTextEdit;
    edpass: TcxTextEdit;
    btnExit: TcxButton;
    btnLogin: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edListOutlet: TComboBox;
    memLogin: TMemo;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure edUserKeyPress(Sender: TObject; var Key: Char);
    procedure edpassKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cxLabel1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    qryLogin : TMyQuery;
  public
    { Public declarations }
    myJO : XSuperObject.ISuperObject;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses FDMDB, FMain, MainSource, FConfigSetup;

{$R *.dfm}

procedure TfrmLogin.btnExitClick(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
   loginpass, decPass, passdb, strdbhost, strdbuser, strdbpass, strdbname,
   namaToko, namaDBOutlet : String;
   aksesgroup, idxItem : Integer;
begin
    if (RemoveSpecialChars(edUser.Text)= False) then
        begin
             ShowMessage('Invalid Character Inserted');
             Exit
        end;
     if (RemoveSpecialChars(edpass.Text)= False) then
        begin
             ShowMessage('Invalid Character Inserted');
             exit;
        end;
    if (frmMain.APP_CHANGEDB = 'Y') then
        begin
         dmDB.dbInternal.Connected := False;
         idxItem := edListOutlet.ItemIndex;
         if (edListOutlet.Text = 'SELECT OUTLET') then
           begin
             ShowMessage('Mohon Pilih ID Outlet Terlebih Dahulu');
             Exit;
           end;
         namaToko := myJO.A['outlet'].O[idxItem].S['nama'];
         namaDBOutlet := myJO.A['outlet'].O[idxItem].S['dbname'];
         memLogin.Lines.Add(namaToko + '#' + namaDBOutlet);
         frmMain.APP_NAME := myJO.O[edListOutlet.Text].AsObject.S['nama'];
         frmMain.APP_OUTLETID := myJO.A['outlet'].O[idxItem].S['kode'];
         frmMain.LOCAL_DBNAME := namaDBOutlet;
         DMDB.dbInternal.Database := frmMain.LOCAL_DBNAME;
        end
    else
       begin
            dmDB.dbInternal.Connected := False;
            DMDB.dbInternal.Database := frmMain.LOCAL_DBNAME;
       end;
    //DMDB.dbInternal.Connected := False;
    DMDB.dbInternal.Server := frmMain.LOCAL_DBHOST;
    DMDB.dbInternal.UserName := frmMain.LOCAL_DBUSER;
    DMDB.dbInternal.Password := frmMain.LOCAL_DBPASS;
    DMDB.dbInternal.Port := StrToInt(frmMain.LOCAL_DBPORT);
    try
        DMDB.dbInternal.Connected := True;
     Except
       on E : Exception do
       ShowMessage('Sorry Database Not Ready !!');
     end;
    qryLogin := TMyQuery.Create(Self);
    qryLogin.Connection := DMDB.dbInternal;
    qryLogin.SQL.Add('select * from temptable');
    qryLogin.Active := true;

    qryLogin.Close;
    qryLogin.SQL.Clear;
    qryLogin.SQL.Add('select * from users where userid = ' +
                    QuotedStr(edUser.Text));
    qryLogin.Open;

    if (qryLogin.IsEmpty) then
        begin
           ShowMessage('User not found');
           Exit;
        end
    else if (NOT qryLogin.IsEmpty) then
        begin
            loginpass := DecryptPass(qryLogin.Fields[1].AsString);

            //ShowMessage(loginpass);
            if (edpass.Text = loginpass) then
                begin
                     aksesgroup := qryLogin.Fields[3].AsInteger;
                     frmMain.USERAPPS := qryLogin.Fields[0].AsString;
                     frmMain.NAMEAPPS := qryLogin.Fields[4].AsString;
                     ShowMessage('Login Success');
                     frmMain.SESSION := 'LOGIN';
                     frmMain.RegisterButton;
                     //frmMain.SetUpTheme;
                     //frmMain.RegisterComponent;
                     frmMain.StartAccess(aksesgroup);
                     frmLogin.Close;
                end
            else if (edpass.Text <> loginpass) then
                begin
                     ShowMessage('Invalid User or Password');
                     Exit;
                end;
        end;
end;

procedure TfrmLogin.Button1Click(Sender: TObject);
var
  namaToko, dbname : String;
  idxItem : Integer;
begin
  
  {NewArray := myJO.A['outlet'].Where(function(Arg: IMember): Boolean
      begin
        with Arg.AsObject do
             Result := (S['id'] = edListOutlet.Text)
      end).AsArray;
  LenData := NewArray.Length;
  memLogin.Lines.Add(IntToStr(LenData));}
end;

procedure TfrmLogin.cxLabel1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConfigSetup, frmConfigSetup);
  frmConfigSetup.Show;
end;

procedure TfrmLogin.edpassKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then btnLogin.SetFocus;
end;

procedure TfrmLogin.edUserKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then edpass.SetFocus;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     qryLogin.Free;
     Action := caFree;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
   myST : TStringList;
   ConfigDir, namaToko : String;
   FilterJSON: ISuperObject;
   LenData, i : integer;
begin
  edUser.Text := frmMain.ConfigJSON.O['Login'].AsObject.S['username'];
  edpass.Text := frmMain.ConfigJSON.O['Login'].AsObject.S['password'];
  ConfigDir := ExtractFilePath(Application.ExeName);
  myST := TStringList.Create;
  myST.LoadFromFile(ConfigDir + 'listoutlet.json');
  myJO := XSuperObject.SO(myST.Text);
  memLogin.Text := myST.Text;

  LenData := myJO.A['outlet'].AsArray.Length;
  //memLogin.Lines.Add(IntToStr(LenData));
  for i:=0 to LenData-1 do
    begin
        namaToko := myJO.A['outlet'].O[i].S['id'];
        //memLogin.Lines.Add(namaToko);
        edListOutlet.Items.Add(namaToko);
    end;


  if (frmMain.APP_CHANGEDB = 'Y') then
     begin
         //btnLoadOther.Visible := True;
         edListOutlet.Visible := True;
     end
  else
     begin
          //btnLoadOther.Visible := False;
         edListOutlet.Visible := False;
     end;
   myST.Free;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
     {qryLogin := TmySQLQuery.Create(Self);
     qryLogin.Database := DMDB.StoreDB;
     qryLogin.SQL.Add('select * from temptable');
     qryLogin.Active := true;
     btnLogin.SetFocus; }
     edUser.SetFocus;
end;

end.
