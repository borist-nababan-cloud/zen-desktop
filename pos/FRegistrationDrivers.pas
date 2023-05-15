unit FRegistrationDrivers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxLabel, ComCtrls,
  XPMan, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, FlexCodeSDK, MyAccess, Data.DB, DBAccess, MemDS;

type
  TfrmRegistrationDrivers = class(TForm)
    Image1: TImage;
    btnStart: TcxButton;
    Memo1: TRichEdit;
    memo2: TRichEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Label1: TLabel;
    Label2: TLabel;
    edNama: TEdit;
    Label3: TLabel;
    edNopol: TEdit;
    edFinger: TcxComboBox;
    btnSave: TcxButton;
    lblCounter: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edIDDriver: TEdit;
    Label7: TLabel;
    edSearchDrivers: TcxLookupComboBox;
    Label4: TLabel;
    fpReg: TFinFPReg;
    qryDrivers: TMyQuery;
    dsQryDrivers: TMyDataSource;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edSearchDriversKeyPress(Sender: TObject; var Key: Char);
    procedure fpRegFPRegistrationImage(Sender: TObject);
    procedure fpRegFPRegistrationStatus(ASender: TObject; Status: Integer);
    procedure fpRegFPRegistrationTemplate(ASender: TObject;
      const FPTemplate: WideString);
    procedure fpRegFPSamplesNeeded(ASender: TObject; Samples: SmallInt);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qryCari, qryFind, qrySearch, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmRegistrationDrivers: TfrmRegistrationDrivers;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmRegistrationDrivers.btnSaveClick(Sender: TObject);
begin

     qryExec.SQL.Clear;
     qryExec.SQL.Add('update ben_master_drivers set ' +
                       'template_fp = ''' + Memo1.Text + ''', ' +
                       'id_finger = ''' + IntToStr(1) + ''' ' +
                       'where id_drivers = ''' + edIDDriver.Text + '''');
     qryExec.ExecSQL;
     edSearchDrivers.Clear;
     edNama.Clear;
     edNopol.Clear;
     edIDDriver.Clear;
     Memo1.Clear;
     memo2.Clear;
     ShowMessage('Finger Registered Success !!');

end;

procedure TfrmRegistrationDrivers.btnStartClick(Sender: TObject);
var
   STRSQL : String;
begin
     if (edFinger.Text = 'PILIH JARI') then
         begin
              ShowMessage('PLEASE SELECT FINGER FIRST !');
              Exit;
         end;
     with dmDB do
          begin

               STRSQL := 'select id_drivers, nama, nopol_mobil from ben_master_drivers where id_drivers = ''' +
                         edIDDriver.Text + ''' and id_finger = ''' +
                         inttostr(edFinger.ItemIndex) + '''';
               qryFind.Close;
               qryFind.SQL.Clear;
               qryFind.SQL.Add(strSql);
               qryFind.Open;
               if (NOT qryFind.IsEmpty) then
                   begin
                        ShowMessage('Finger Has Been Registered' + #13#13 +
                                    'Please Change Others !!');
                        Exit;
                   end;


               STRSQL := 'select serial_number, verification_code, ' +
                         'activation_code from ben_regfp';
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add(strSql);
               qrySearch.Open;
               if (btnStart.Caption = 'START') then
                   begin
                        fpReg.DeviceInfo(qrySearch.Fields[0].AsString, qrySearch.Fields[1].AsString,qrySearch.Fields[2].AsString);
                        fpReg.FPRegistrationStart('BORIST');
                        //FinFPReg1.DeviceInfo(Edit1.Text,Edit2.Text,Edit3.text);
                        btnStart.Caption := 'STOP';

                   end
               else if (btnStart.Caption = 'STOP') then
                   begin
                        fpReg.FPRegistrationStop;
                        btnStart.Caption := 'START'
                   end

          end;
end;

procedure TfrmRegistrationDrivers.edSearchDriversKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key = #13) then
         begin
              with dmDB do
                   begin
                        qrySearch.Close;
                        qrySearch.SQL.Clear;
                        qrySearch.SQL.Add('select id_drivers, nama, nopol_mobil ' +
                                          'from ben_master_drivers where id_drivers = ''' + vartostr(edSearchDrivers.EditValue) + '''');
                        qrySearch.Open;
                        if (NOT qrySearch.IsEmpty) then
                            begin
                                 edNama.Text := qrySearch.Fields[1].AsString;
                                 edIDDriver.Text := qrySearch.Fields[0].AsString;
                                 edNopol.Text := qrySearch.Fields[2].AsString;
                            end;
                   end;
              edFinger.SetFocus;
         end;
end;

procedure TfrmRegistrationDrivers.fpRegFPRegistrationImage(Sender: TObject);
begin
    Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\FPTemp.BMP');
end;

procedure TfrmRegistrationDrivers.fpRegFPRegistrationStatus(
  ASender: TObject; Status: Integer);
begin
   case Status of
    0 : begin
          //button1.Caption := '&Registration';
          memo2.lines.add('Registration Success');
          btnStart.Click;
        end;
    3 : begin
          //button1.Caption := '&Registration';
          memo2.lines.add('Registration Fail');
          btnStart.Click;
        end;
    7 : begin
          //button1.Caption := '&Registration';
          memo2.lines.add('Please connect the device to USB port!');
        end;
    8 :  memo2.lines.add('Poor image quality!');
    9 :  memo2.lines.add('Activation/verification code is incorrent or not set!');
    10 : memo2.lines.add('Registration Start!');
    11 : memo2.lines.add('Registration Stop!');
  end;
end;

procedure TfrmRegistrationDrivers.fpRegFPRegistrationTemplate(
  ASender: TObject; const FPTemplate: WideString);
begin
     memo1.Clear;
     memo1.lines.add(FPTemplate);
end;

procedure TfrmRegistrationDrivers.fpRegFPSamplesNeeded(ASender: TObject;
  Samples: SmallInt);
begin
   memo2.lines.add('Samples Needed ' + inttostr(Samples));
end;

procedure TfrmRegistrationDrivers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    qryCari.Free;
    qryFind.Free;
    qrySearch.Free;
    qryExec.Free;
    Action := caFree;
end;

procedure TfrmRegistrationDrivers.FormCreate(Sender: TObject);
begin
   image1.Canvas.Create();
   fpReg.PictureSamplePath := ExtractFilePath(Application.ExeName) + '\FPTemp.BMP';
   fpReg.PictureSampleHeight := 1635;
   fpReg.PictureSampleWidth := 1335;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryCari := TMyQuery.Create(Self);
  qryCari.Connection := DMDB.dbInternal;
  qryCari.SQL.Add('select * from temptable');
  qryCari.Active := true;

  qryFind := TMyQuery.Create(Self);
  qryFind.Connection := DMDB.dbInternal;
  qryFind.SQL.Add('select * from temptable');
  qryFind.Active := true;

  qrySearch := TMyQuery.Create(Self);
  qrySearch.Connection := DMDB.dbInternal;
  qrySearch.SQL.Add('select * from temptable');
  qrySearch.Active := true;

  qryDrivers.Active := True;


end;

procedure TfrmRegistrationDrivers.Memo1Change(Sender: TObject);
begin
     lblCounter.Caption := inttostr(Length(Memo1.Text));
end;

end.
