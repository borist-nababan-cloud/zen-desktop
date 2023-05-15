unit FTransMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinInet, DB, MyAccess, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxDropDownEdit, cxCalc, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxCheckBox,
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
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TfrmTransMember = class(TForm)
    btnCek: TButton;
    Timer1: TTimer;
    lblCecker: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label20: TLabel;
    Label15: TLabel;
    edNamaCustomerPayment: TcxTextEdit;
    edPayment: TcxLookupComboBox;
    edPointPayment: TcxCalcEdit;
    edReferansi: TcxTextEdit;
    edTambahPoint: TcxCalcEdit;
    edSisaPoint: TcxCalcEdit;
    edKurangPoint: TcxCalcEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edGrandTotalPayment: TcxCalcEdit;
    edDiscAmount: TcxCalcEdit;
    edDiscPercent: TcxCalcEdit;
    edSubtotalPayment: TcxCalcEdit;
    cxCheckBox1: TcxCheckBox;
    edTotalPayment: TcxCalcEdit;
    edBayarPayment: TcxCalcEdit;
    edKembalianPayment: TcxCalcEdit;
    Label1: TLabel;
    edNomorKartu: TcxTextEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     NO_MEMBER : String;
     LOCAL_POINT, SERVER_POINT : Double;
     SERVER_NAMA : string;
     Function cekonline : Boolean;
     procedure Cek_Local;
     procedure Cek_Online;
  end;

var
  frmTransMember: TfrmTransMember;

implementation

uses FPelunasan, FMain, FDMDB;

{$R *.dfm}


Function TfrmTransMember.cekonline;
begin
     result := (InternetGetConnectedState(nil, 0))
end;

procedure TfrmTransMember.Cek_Local;
begin
     {with dmDB do
          begin
               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select id_members, nama_lengkap, point, no_kartu from members where id_members = ''' +
                               NO_MEMBER + '''');
               qryCari.Open;
               if (qryCari.IsEmpty) then
                   begin
                        Cek_Online;
                        if (SERVER_NAMA = '') then
                            begin

                            end;
                        {ShowMessage('Maaf Nomor Kartu Tidak Terdaftar !!');
                        Screen.Cursor := crDefault;
                        Exit;
                   end
               else if (not qryCari.IsEmpty) then
                        begin
                             edNomorKartu.Text := qryCari.Fields[3].AsString;
                             edNamaCustomerPayment.Text := qryCari.Fields[1].AsString;
                             LOCAL_POINT := qryCari.Fields[2].AsFloat;
                             Cek_Online;
                        end;
          end;}
end;


procedure TfrmTransMember.Cek_Online;
begin

end;

procedure TfrmTransMember.FormActivate(Sender: TObject);
begin
     {Screen.Cursor := crHourGlass;
     lblCecker.Caption := 'Checking Internet Connection !! Please Wait';
     SERVER_NAMA := '';
     SERVER_POINT := 0;
     btnCek.Click;
     Screen.Cursor := crDefault;}
end;

end.
