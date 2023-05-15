unit FConfigSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IniFiles, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, StdCtrls, Menus, cxButtons, ExtCtrls,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxLabel, XSuperObject, MainSource;

type
  TfrmConfigSetup = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edNameDB: TcxTextEdit;
    edUserDB: TcxTextEdit;
    btnSave: TcxButton;
    Label3: TLabel;
    edHost: TcxTextEdit;
    Label4: TLabel;
    edPassDB: TcxTextEdit;
    edServerName: TcxTextEdit;
    edServerUser: TcxTextEdit;
    edServerHost: TcxTextEdit;
    edServerPass: TcxTextEdit;
    Label9: TLabel;
    edPortDB: TcxTextEdit;
    edServerPort: TcxTextEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnCancel: TcxButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lblAppName2: TLabel;
    lblVersion: TLabel;
    lblRelease: TLabel;
    lblCopyright: TLabel;
    lblDeveloper: TLabel;
    lblAppName: TcxLabel;
    tmrLoadCOnfig: TTimer;
    lblLoader: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tmrLoadCOnfigTimer(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    configCount : Integer;
  public
    { Public declarations }
    INIConfig : TIniFile;
  end;

var
  frmConfigSetup: TfrmConfigSetup;

implementation

uses FMain;

{$R *.dfm}

procedure TfrmConfigSetup.btnCancelClick(Sender: TObject);
begin
    frmConfigSetup.Close;
end;

procedure TfrmConfigSetup.btnSaveClick(Sender: TObject);
var
   jsonConfig : TStringList;
   ConfigDir : String;
begin
    ConfigDir := ExtractFilePath(Application.ExeName);
    jsonConfig := TStringList.Create;
    jsonConfig.LoadFromFile(ConfigDir + 'config.json');

     frmMain.LOCAL_DBHOST := EncryptPass(edHost.Text);
     frmMain.ConfigJSON.O['LocalDB'].AsObject.S['HostName'] := frmMain.LOCAL_DBHOST;
     frmMain.LOCAL_DBUSER := EncryptPass(edUserDB.Text);
     frmMain.ConfigJSON.O['LocalDB'].AsObject.S['UserName'] := frmMain.LOCAL_DBUSER;
     frmMain.LOCAL_DBNAME := EncryptPass(edNameDB.Text);
     frmMain.ConfigJSON.O['LocalDB'].AsObject.S['DBName'] := frmMain.LOCAL_DBNAME;
     frmMain.LOCAL_DBPORT := EncryptPass(edPortDB.Text);
     frmMain.ConfigJSON.O['LocalDB'].AsObject.S['Port'] := frmMain.LOCAL_DBPORT;
     frmMain.LOCAL_DBPASS := EncryptPass(edPassDB.Text);
     frmMain.ConfigJSON.O['LocalDB'].AsObject.S['Password'] := frmMain.LOCAL_DBPASS;

     frmMain.SERVER_DBHOST := EncryptPass(edServerHost.Text);
     frmMain.ConfigJSON.O['ServerDB'].AsObject.S['HostName'] := frmMain.SERVER_DBHOST;
     frmMain.SERVER_DBUSER := EncryptPass(edServerUser.Text);
     frmMain.ConfigJSON.O['ServerDB'].AsObject.S['UserName'] := frmMain.SERVER_DBUSER;
     frmMain.SERVER_DBNAME := EncryptPass(edServerName.Text);
     frmMain.ConfigJSON.O['ServerDB'].AsObject.S['DBName'] := frmMain.SERVER_DBNAME;
     frmMain.SERVER_DBPORT := EncryptPass(edServerPort.Text);
     frmMain.ConfigJSON.O['ServerDB'].AsObject.S['Port'] := frmMain.SERVER_DBPORT;
     frmMain.SERVER_DBPASS := EncryptPass(edServerPass.Text);
     frmMain.ConfigJSON.O['ServerDB'].AsObject.S['Password'] := frmMain.SERVER_DBPASS;

     frmMain.ConfigJSON.SaveTo(ConfigDir + 'config.json', true, true);
     jsonConfig.Free;
    ShowMessage('First Set Up Complete, ' + #13 +
                'Application Will Close Automaticaly, ' + #13 +
               'Please Re-Open Application');

    Application.Terminate;
end;

procedure TfrmConfigSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmConfigSetup.FormCreate(Sender: TObject);
begin
     configCount := 0;
     lblLoader.Visible := False;
     tmrLoadCOnfig.Enabled := True;
     Application.ProcessMessages;
     lblLoader.Visible := True;
     Application.ProcessMessages;
end;

procedure TfrmConfigSetup.tmrLoadCOnfigTimer(Sender: TObject);
var

   jsonConfig : TStringList;
   ConfigDir : String;
begin
     Screen.Cursor := crHourGlass;
     configCount := configCount + 1;
     if (configCount = 2) then
         begin
              //lblAppName.Caption := frmMain.APP_NAME;
              lblAppName2.Caption := frmMain.APP_NAME;
              lblVersion.Caption := frmMain.APP_VERSION;
              lblRelease.Caption := frmMain.APP_RELEASE;
              lblCopyright.Caption := frmMain.APP_TRADEMARK;
              lblDeveloper.Caption := frmMain.APP_DEVELOPER;

              edNameDB.Text := frmMain.LOCAL_DBNAME;
              edUserDB.Text := frmMain.LOCAL_DBUSER;
              edHost.Text := frmMain.LOCAL_DBHOST;
              edPassDB.Text := frmMain.LOCAL_DBPASS;
              edPortDB.Text := frmMain.LOCAL_DBPORT;

              edServerName.Text := frmMain.SERVER_DBNAME;
              edServerHost.Text := frmMain.SERVER_DBHOST;
              edServerPass.Text := frmMain.SERVER_DBPASS;
              edServerPort.Text := frmMain.SERVER_DBPORT;
              edServerUser.Text := frmMain.SERVER_DBUSER;
              lblLoader.Visible := False;
              Screen.Cursor := crDefault;
              tmrLoadCOnfig.Enabled := False;
         end;
end;

end.
