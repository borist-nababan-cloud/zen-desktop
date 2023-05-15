unit FPosPembayaranDisc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc,
  Vcl.StdCtrls, Vcl.Menus, cxButtons;

type
  TfrmPosPembayaranDisc = class(TForm)
    Label2: TLabel;
    edSubtotal: TcxCalcEdit;
    Label1: TLabel;
    edDiscP: TcxCalcEdit;
    Label3: TLabel;
    edDiscR: TcxCalcEdit;
    Label4: TLabel;
    edTotDisc: TcxCalcEdit;
    btnAdd: TcxButton;
    edPurpose: TcxTextEdit;
    Label5: TLabel;
    procedure edDiscPPropertiesEditValueChanged(Sender: TObject);
    procedure edDiscRPropertiesEditValueChanged(Sender: TObject);
    procedure edDiscRFocusChanged(Sender: TObject);
    procedure edDiscPFocusChanged(Sender: TObject);
    procedure edDiscPKeyPress(Sender: TObject; var Key: Char);
    procedure edDiscRKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure edPurposeKeyPress(Sender: TObject; var Key: Char);
    procedure edPurposeFocusChanged(Sender: TObject);
  private
    { Private declarations }
    procedure HItungUlang();
  public
    { Public declarations }
  end;

var
  frmPosPembayaranDisc: TfrmPosPembayaranDisc;

implementation

{$R *.dfm}

uses FPosPembayaran;

procedure TfrmPosPembayaranDisc.btnAddClick(Sender: TObject);
begin
  HItungUlang;
  if (edPurpose.Text = '') then
    begin
      ShowMessage('Mohon Input Tujuan Diskon terlebih dahulu');
      Exit;
    end;
   frmPosPembayaran.edPurpose.Text := frmPosPembayaranDisc.edPurpose.Text;
   frmPosPembayaran.edDiscPurpose.EditValue := frmPosPembayaranDisc.edTotDisc.EditValue;
   frmPosPembayaran.edGrandTotal.EditValue := frmPosPembayaran.edSubtotal.EditValue -
         frmPosPembayaran.edDiscPromo.EditValue  - frmPosPembayaranDisc.edTotDisc.EditValue;
   frmPosPembayaranDisc.Close;
end;

procedure TfrmPosPembayaranDisc.edDiscPFocusChanged(Sender: TObject);
begin
   HItungUlang;
end;

procedure TfrmPosPembayaranDisc.edDiscPKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then
      begin
        HItungUlang;
        edDiscR.SetFocus;
      end;
end;

procedure TfrmPosPembayaranDisc.edDiscPPropertiesEditValueChanged(
  Sender: TObject);
begin
    HItungUlang;
end;

procedure TfrmPosPembayaranDisc.edDiscRFocusChanged(Sender: TObject);
begin
   HItungUlang;
end;

procedure TfrmPosPembayaranDisc.edDiscRKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
      begin
        HItungUlang;
        edTotDisc.SetFocus;
      end;
end;

procedure TfrmPosPembayaranDisc.edDiscRPropertiesEditValueChanged(
  Sender: TObject);
begin
   HItungUlang;
end;

procedure TfrmPosPembayaranDisc.edPurposeFocusChanged(Sender: TObject);
begin
   HItungUlang;
end;

procedure TfrmPosPembayaranDisc.edPurposeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edTotDisc.SetFocus;
end;

procedure TfrmPosPembayaranDisc.HItungUlang;
var
  discP, totDisc : Double;
begin
  discP := edSubtotal.EditValue * edDiscP.EditValue / 100;
  totDisc := discP + edDiscR.EditValue;
  edTotDisc.EditValue := totDisc;
end;

end.
