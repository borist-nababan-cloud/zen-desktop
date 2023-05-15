unit FPosTransMainDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyAccess, XSuperJSON, XSuperObject,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, cxCheckBox, cxTextEdit, cxGroupBox, cxRadioGroup,
  Vcl.Menus, cxButtons;

type
  TfrmPosTransMainDetails = class(TForm)
    Label6: TLabel;
    lblKodeTrans: TLabel;
    rbGender: TcxRadioGroup;
    Label5: TLabel;
    edCustName: TcxTextEdit;
    ckByRequest: TcxCheckBox;
    btnFinish: TcxButton;
    btnCancel: TcxButton;
    procedure btnFinishClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    qryTemp, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmPosTransMainDetails: TfrmPosTransMainDetails;

implementation

{$R *.dfm}

uses FdmDB, FMain, FPosTransMain;

procedure TfrmPosTransMainDetails.btnCancelClick(Sender: TObject);
begin
   frmPosTransMainDetails.Close;
end;

procedure TfrmPosTransMainDetails.btnFinishClick(Sender: TObject);
var
   jSonItem : XSuperObject.ISuperObject;
   isRequest, strJson, vgender : String;
begin
  if (ckByRequest.Checked = True) then isRequest := 'Y'
  else if (ckByRequest.Checked = False) then isRequest := 'N';

  if (rbGender.ItemIndex = 0) then vgender := 'M'
  else if (rbGender.ItemIndex = 1) then vgender := 'F';

  qryTemp.Close;
  qryTemp.SQL.Clear;
  qryTemp.SQL.Add('select notes from trans_master where trans_id = ''' + lblKodeTrans.Caption + '''');
  qryTemp.Open;
  jSonItem := XSuperobject.SO(qryTemp.Fields[0].AsString);
  jSonItem.S['byrequest'] := isRequest;
  jSonItem.S['user'] := frmMain.USERAPPS;
  strJson := jSonItem.AsJSON(False, False);

  qryExec.SQL.Clear;
  qryExec.SQL.Add('update trans_master set ' +
      'nama_customer = ' + QuotedStr(edCustName.Text) + ', ' +
      'notes = ' + QuotedStr(strJson) + ', ' +
      'promo = ''' + 'S' + ''', ' +
      'gender = ' + QuotedStr(vgender) + ' ' +
      'where trans_id = ''' + lblKodeTrans.Caption + ''';');
   qryExec.ExecSQL;
   ShowMessage('Update Finish !');
   frmPosTransMainDetails.Close;
end;

procedure TfrmPosTransMainDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
      'promo = ''' + 'S' + ''' ' +
      'where trans_id = ''' + lblKodeTrans.Caption + ''';');
   qryExec.ExecSQL;

   qryExec.Free;
   qryTemp.Free;
   Action := caFree;
end;

procedure TfrmPosTransMainDetails.FormCreate(Sender: TObject);
begin
    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

    qryTemp := TMyQuery.Create(Self);
    qryTemp.Connection := DMDB.dbInternal;
    qryTemp.SQL.Add('select * from temptable');
    qryTemp.Active := true;
end;

end.
