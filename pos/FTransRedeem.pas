unit FTransRedeem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls, Menus,
  cxLookAndFeelPainters, cxButtons, cxSpinEdit, cxTimeEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxCalc, AdvGlowButton, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls,
  dxCore, cxDateUtils, MyAccess, Data.DB, DBAccess, MemDS;

type
  TfrmTransRedeem = class(TForm)
    edTransIDRedeem: TcxTextEdit;
    Label1: TLabel;
    edRedeemTrans: TcxTextEdit;
    Label2: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    edTanggalRedeem: TcxDateEdit;
    edWaktuRedeem: TcxTimeEdit;
    Label3: TLabel;
    Label4: TLabel;
    edIDCustomerRedeem: TcxTextEdit;
    edNamaCustomerRedeem: TcxTextEdit;
    Label5: TLabel;
    Label6: TLabel;
    edAvailablePointRedeem: TcxCalcEdit;
    edRedeemPoint: TcxCalcEdit;
    edSisaRedeem: TcxCalcEdit;
    Button1: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    lblIDMembersRedeem: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edRedeemPropertiesEditValueChanged(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryUpdate : TMyQuery;
  public
    { Public declarations }
     V_TRANS, V_DATE, V_NUMBER, V_ID : String;
    function CreateNewAutoNum : String;
  end;

var
  frmTransRedeem: TfrmTransRedeem;

implementation

uses FDMDB, FMain, FPelunasan, FPrintRedeem;

{$R *.dfm}

function TfrmTransRedeem.CreateNewAutoNum: string;
var
   lastID, strTmpNum, strNum, NewID : string;
   intTmpNum, intNum : integer;
begin

               NewID := V_TRANS + '.' + V_DATE + '.';

               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('SELECT trans_redeem FROM trans_redeem ' +
                               'WHERE trans_redeem LIKE ''' + NewID + '%'' ORDER BY trans_redeem ASC');
               qrySearch.Open;

               if (qrySearch.IsEmpty) then
                  begin
                       Result := V_TRANS + '.' + V_DATE + '.' + '001';
                       exit;
                  end;

               qrySearch.Last;

               lastID    := qrySearch.Fields[0].AsString;
               strTmpNum := Copy(lastID, length(lastID)-2, 3);
               intTmpNum := strtoint(strTmpNum);
               intNum    := intTmpNum + 1;

               case length(inttostr(intNum)) of
                    //1 : strNum := '0000' + inttostr(intNum);
                    //2 : strNum := '000' + inttostr(intNum);
                    1 : strNum := '00' + inttostr(intNum);
                    2 : strNum := '0' + inttostr(intNum);
                    3 : strNum := inttostr(intNum);
               end;

               V_NUMBER := strNum;
               V_ID := V_TRANS + '.' + V_DATE + '.' + V_NUMBER;
               Result := V_ID;

end;

procedure TfrmTransRedeem.FormCreate(Sender: TObject);
begin
     V_TRANS := 'RS';
     V_DATE := FormatDateTime('ddMMYY', date);
     V_NUMBER := '001';
     //V_ID := dmDB.transMaster.Fields[0].AsString;
     edTanggalRedeem.Date := Date;
end;

procedure TfrmTransRedeem.Button1Click(Sender: TObject);
begin
     V_ID := CreateNewAutoNum;
     edRedeemTrans.Text := V_ID
end;

procedure TfrmTransRedeem.edRedeemPropertiesEditValueChanged(
  Sender: TObject);
begin
     edSisaRedeem.EditValue := edAvailablePointRedeem.EditValue - edRedeemPoint.EditValue;
end;

procedure TfrmTransRedeem.cxButton4Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmTransRedeem.cxButton3Click(Sender: TObject);
begin

               qryUpdate.Sql.Clear;
               qryUpdate.SQL.Add('INSERT INTO trans_redeem VALUES(' +
                               '''' + edRedeemTrans.Text + ''', ' +
                               '''' + edTransIDRedeem.Text + ''', ' +
                               '''' + FormatDateTime('yyyy-MM-dd', Date) + ''', ' +
                               '''' + FormatDateTime('HH:MM:ss', Time) + ''', ' +
                               '''' + lblIDMembersRedeem.Caption + ''', ' +
                               '''' + edNamaCustomerRedeem.Text + ''', ' +
                               '''' + vartostr(edAvailablePointRedeem.EditValue) + ''', ' +
                               '''' + vartostr(edSisaRedeem.EditValue) + ''', ' +
                               '''' + frmMain.APP_OUTLETID + ''')');
               qryUpdate.ExecSql;




     frmPelunasan.edKurangPoint.EditValue := edRedeemPoint.EditValue;
     //edDiscAmount.EditValue := edRedeemPoint.EditValue * 1000;
     frmPelunasan.edPointPayment.EditValue := edAvailablePointRedeem.EditValue;
     frmPelunasan.edTambahPoint.EditValue := 0 ;
     frmPelunasan.edKurangPoint.EditValue := edRedeemPoint.EditValue;
     frmPelunasan.edSisaPoint.EditValue := edSisaRedeem.EditValue;
     frmPelunasan.edReferansi.Text := edRedeemTrans.Text;

     Application.CreateForm(TfrmPrintRedeem, frmPrintRedeem);
     with frmPrintRedeem do
       begin
         PrintRedeem.Close;
         PrintRedeem.SQL.Clear;
         PrintRedeem.SQL.Add('select * from trans_redeem where trans_redeem = ''' +
                             edRedeemTrans.Text + '''');
         PrintRedeem.Open;
       end;

    frmPrintRedeem.qrpRedeem.Preview;
    Close;
end;

end.
