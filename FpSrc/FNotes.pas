unit FNotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MyAccess, DBAccess, DB, StdCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons, dxSkinsCore,
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
  dxSkinXmas2008Blue;

type
  TfrmNotes = class(TForm)
    Memo1: TMemo;
    edPenulis: TEdit;
    Label1: TLabel;
    btnAddUsersGroup: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddUsersGroupClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qryNotes, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmNotes: TfrmNotes;

implementation

uses FdmDB;

{$R *.dfm}

procedure TfrmNotes.btnAddUsersGroupClick(Sender: TObject);
begin
     qryExec.SQL.Clear;
     qryExec.SQL.Add('insert into news values(' +
                          '''' + '' + ''',' +
                          '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                          '''' + FormatDateTime('hh:mm:ss', Time) + ''',' +
                          QuotedStr(Memo1.Text) + ',' +
                          QuotedStr(edPenulis.Text) + ')');
     qryExec.ExecSQL;
     ShowMessage('Notes Has been Send !!');
     Memo1.SelectAll;
     Memo1.ClearSelection;
     edPenulis.Clear;
end;

procedure TfrmNotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     qryNotes.Free;
     Action := caFree;
end;

procedure TfrmNotes.FormCreate(Sender: TObject);
begin
    qryNotes := TMyQuery.Create(Self);
    qryNotes.Connection := DMDB.dbInternal;
    qryNotes.SQL.Add('select * from temptable');
    qryNotes.Active := true;

    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;
end;

end.
