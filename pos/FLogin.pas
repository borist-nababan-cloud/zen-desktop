unit FLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, Menus,
  cxLookAndFeelPainters, cxButtons, MyAccess,
  cxProgressBar, cxGraphics, cxLookAndFeels, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmLogin = class(TForm)
    cxTextEdit1: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    cxTextEdit2: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    pbCurrTask: TcxProgressBar;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses FMain, FDMDB;

{$R *.dfm}

procedure TfrmLogin.cxButton1Click(Sender: TObject);
var
   i : Integer;
begin
     Application.CreateForm(TdmDB, dmDB);
     with dmDB do
          begin
               zenDB.Connected := False;
               zenDB.Database := frmMain.DBNAME;
               zenDB.Password := frmMain.DBPASS;
               zenDB.Server := frmMain.HOSTDB;
               zenDB.UserName := frmMain.USERDB;
               zenDB.Connected := True;
               if (zenDB.Connected = True) then
                   begin
                        //ShowMessage('1');
                        for i := 0 to dmDB.ComponentCount-1 do
                            begin
                                 if (dmDB.Components[i] is TMyTable) then
                                     begin
                                          (dmDB.Components[i] as TMyTable).Active := True;
                                          //ShowMessage('table');
                                          //frmLogin.pbCurrTask.Position := ((i+1) / dmDB.ComponentCount) * 100;
                                     end;
                                 if (dmDB.Components[i] is TMyQuery) then
                                     begin
                                          (dmDB.Components[i] as TMyQuery).Active := True;
                                          //frmLogin.pbCurrTask.Position := ((i+1) / dmDB.ComponentCount) * 100;
                                          //ShowMessage('query');
                                     end;
                                 frmLogin.pbCurrTask.Position := ((i+1) / dmDB.ComponentCount) * 100;
                                 Application.ProcessMessages;
                            end;

                   end;
          end;
     frmMain.trBooking.Enabled:= True;
     frmMain.pnlBar.Enabled := True;
     frmMain.close_clientForm;
     frmMain.Timer1.Enabled := True;
end;

procedure TfrmLogin.cxButton2Click(Sender: TObject);
begin
     Application.Terminate;
end;

end.
