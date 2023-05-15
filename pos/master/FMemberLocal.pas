unit FMemberLocal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxTextEdit, cxCalendar, StdCtrls, Menus, cxButtons, cxContainer,
  cxMaskEdit, cxDropDownEdit, cxCalc, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, DBAccess;

type
  TfrmMemberLocal = class(TForm)
    gtbMember: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbMembernama_lengkap: TcxGridDBColumn;
    gtbMemberalamat: TcxGridDBColumn;
    gtbMembertempat_lahir: TcxGridDBColumn;
    gtbMembertanggal_lahir: TcxGridDBColumn;
    gtbMemberno_kartu: TcxGridDBColumn;
    gtbMemberno_telepon: TcxGridDBColumn;
    gtbMemberno_handphone: TcxGridDBColumn;
    Label6: TLabel;
    edCariNama: TEdit;
    dsQryMemberLocal: TDataSource;
    btnCancel: TcxButton;
    edLimit: TcxCalcEdit;
    Label1: TLabel;
    QryMemberLocal: TMyQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure edCariNamaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMemberLocal: TfrmMemberLocal;

implementation

uses FdmDB;

{$R *.dfm}

procedure TfrmMemberLocal.btnCancelClick(Sender: TObject);
begin
     //SELECT nama_lengkap, tanggal_lahir, tempat_lahir, no_kartu,
     //no_telepon, no_handphone, alamat
     //FROM members LIMIT 100

end;

procedure TfrmMemberLocal.edCariNamaChange(Sender: TObject);
var
  strCari : String;
begin
   strCari := '%' + edCariNama.Text + '%';
   qryMemberLocal.Close;
   qryMemberLocal.SQL.Clear;
   qryMemberLocal.SQL.Add('SELECT nama_lengkap, tanggal_lahir, tempat_lahir, no_kartu, ' +
               'no_telepon, no_handphone, alamat ' +
               'FROM members WHERE nama_lengkap like ' + QuotedStr(strCari) + ' LIMIT 100');
   qryMemberLocal.Open;
   gtbMember.DataController.Refresh
end;

procedure TfrmMemberLocal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryMemberLocal.Active := False;
   Action := caFree;
end;

procedure TfrmMemberLocal.FormCreate(Sender: TObject);
begin
    qryMemberLocal.Active := True;
    gtbMember.DataController.Refresh;
end;

end.
