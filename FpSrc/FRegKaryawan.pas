unit FRegKaryawan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxLabel, ComCtrls,
  XPMan, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, FlexCodeSDK, MyAccess, DBAccess,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TfrmRegKaryawan = class(TForm)
    fpReg: TFinFPReg;
    Image1: TImage;
    btnStart: TcxButton;
    Memo1: TRichEdit;
    memo2: TRichEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edSearch: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edNama: TEdit;
    Label3: TLabel;
    edDepartemen: TEdit;
    edFinger: TcxComboBox;
    btnSave: TcxButton;
    lblCounter: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edIDKaryawan: TEdit;
    Label7: TLabel;
    btnSearch: TcxButton;
    edDevice: TcxComboBox;
    Label8: TLabel;
    procedure btnStartClick(Sender: TObject);
    procedure fpRegFPRegistrationImage(Sender: TObject);
    procedure fpRegFPRegistrationTemplate(ASender: TObject;
      const FPTemplate: WideString);
    //procedure fpRegFPRegistrationStatus(ASender: TObject; Status: Integer);
    procedure fpRegFPSamplesNeeded(ASender: TObject; Samples: SmallInt);
    procedure FormCreate(Sender: TObject);
    procedure edSearchKeyPress(Sender: TObject; var Key: Char);
    procedure fpRegFPRegistrationStatus(ASender: TObject; Status: Integer);
    procedure Memo1Change(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qryReg1, qryReg2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmRegKaryawan: TfrmRegKaryawan;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmRegKaryawan.btnSaveClick(Sender: TObject);
begin

   qryExec.SQL.Clear;
   qryExec.SQL.Add('insert into karyawanfpreg values(' +
                     '''' + '' + ''',' +
                     '''' + edIDKaryawan.Text + ''',' +
                     '''' + edNama.Text + ''',' +
                     '''' + inttostr(edFinger.ItemIndex) + ''',' +
                     '''' + Memo1.Text + ''',' +
                     '''' + '' + ''')');
   qryExec.ExecSQL;

   edSearch.Clear;
   edNama.Clear;
   edDepartemen.Clear;
   edIDKaryawan.Clear;
   edFinger.ItemIndex := 0;
   Memo1.Clear;
   memo2.Clear;
   ShowMessage('Finger Registered Success !!');

end;

procedure TfrmRegKaryawan.btnStartClick(Sender: TObject);
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

               STRSQL := 'select karyawanid, fingerindex from karyawanfpreg where karyawanid = ''' +
                         edIDKaryawan.Text + ''' and fingerindex = ''' +
                         inttostr(edFinger.ItemIndex) + '''';
               //PREPARE_FIND;
               qryReg1.Close;
               qryReg1.SQL.Clear;
               qryReg1.SQL.Add(STRSQL);
               qryReg1.Open;
               if (NOT qryReg1.IsEmpty) then
                   begin
                        ShowMessage('Finger Has Been Registered' + #13#13 +
                                    'Please Change Others !!');
                   end;

               STRSQL := 'select serialnumber, verificationcode, ' +
                         'activationcode from deviceregistration ' +
                         'where devicename = ''' + edDevice.Text + '''';
               qryReg1.Close;
               qryReg1.SQL.Clear;
               qryReg1.SQL.Add(STRSQL);
               qryReg1.Open;
               if (qryReg1.IsEmpty) then
                  begin
                    ShowMessage('Sorry Device Un-Registered !!' + #13 +
                               'Please Contact Your Administrator');
                    Exit;
                  end;
               //PREPARE_SEARCH;
               if (btnStart.Caption = 'START') then
                   begin
                        fpReg.DeviceInfo(qryReg1.Fields[0].AsString, qryReg1.Fields[1].AsString,qryReg1.Fields[2].AsString);
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

procedure TfrmRegKaryawan.btnSearchClick(Sender: TObject);
var
   idKaryawan : String;
begin
    idKaryawan := '%' + edSearch.Text;
    qryReg1.Close;
    qryReg1.SQL.Clear;
    qryReg1.SQL.Add('select idkaryawan, departemen, namakaryawan ' +
               'from ben_hrd_karyawan_info where idkaryawan like ''' + idKaryawan + ''' AND active = ''' + 'Y' + '''');
    qryReg1.Open;
    if (qryReg1.IsEmpty) then
       begin
          qryReg2.Close;
          qryReg2.SQL.Clear;
          qryReg2.SQL.Add('select karyawan_id, departemen_id, nama_lengkap ' +
                     'from karyawan where karyawan_id like ''' + idKaryawan + '''');
          qryReg2.Open;
          if (not qryReg2.IsEmpty) then
            begin
              edIDKaryawan.Text := qryReg1.Fields[0].AsString;
              edDepartemen.Text := qryReg1.Fields[1].AsString;
              edNama.Text := qryReg1.Fields[2].AsString;
              btnStart.Enabled := True;
            end
          else if (qryReg2.IsEmpty) then
            begin
              ShowMessage('ID Karyawan ' + edSearch.Text + ' NOT Exist !');
              Exit;
            end;
         //ShowMessage('ID Karyawan ' + edSearch.Text + 'NOT Exist !');
       end
    else if (NOT qryReg1.IsEmpty) then
       begin
           edIDKaryawan.Text := qryReg1.Fields[0].AsString;
           edDepartemen.Text := qryReg1.Fields[1].AsString;
           edNama.Text := qryReg1.Fields[2].AsString;
           btnStart.Enabled := True;
       end;
end;

procedure TfrmRegKaryawan.edSearchKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         begin
           btnSearch.Click;
         end;
     {if (key = #13) then
         begin
              with dmDB do
                   begin
                        qryReg1.Close;
                        qryReg1.SQL.Clear;
                        qryReg1.SQL.Add('select id_members, nama_lengkap, no_kartu ' +
                                          'from members where id_members = ''' + edScan.Text + '''');
                        qryReg1.Open;
                        if (NOT qryReg1.IsEmpty) then
                            begin
                                 edNama.Text := qryReg1.Fields[1].AsString;
                                 edIDMember.Text := qryReg1.Fields[0].AsString;
                                 edNoKartu.Text := qryReg1.Fields[2].AsString;
                            end
                        else if (qryReg1.IsEmpty) then
                            begin
                                 qryReg2.Close;
                                 qryReg2.SQL.Clear;
                                 qryReg2.SQL.Add('select id_members, nama_lengkap, no_kartu ' +
                                                 'from members where no_kartu = ''' + edScan.Text + '''');
                                 qryReg2.Open;
                                 if (qryReg2.IsEmpty) then
                                     begin
                                          ShowMessage('Maaf data Member tidak ditemukan !!');
                                          edScan.SetFocus;
                                          edScan.SelectAll;
                                          Exit;
                                     end
                                 else if (NOT qryReg2.IsEmpty) then
                                     begin
                                          edNama.Text := qryReg1.Fields[1].AsString;
                                          edNoKartu.Text := qryReg1.Fields[2].AsString;
                                          edIDMember.Text := qryReg1.Fields[0].AsString;
                                     end;


                            end;

                   end;
              edFinger.SetFocus;
         end;}
end;

procedure TfrmRegKaryawan.FormActivate(Sender: TObject);
var
  i: Integer;
begin
    edDevice.Properties.Items.Clear;
    qryReg1.Close;
    qryReg1.SQL.Clear;
    qryReg1.SQL.Add('select devicename from deviceregistration ORDER BY devicename ASC');
    qryReg1.Open;
    qryReg1.First;
    for i := 0 to qryReg1.RecordCount - 1 do
       begin
           edDevice.Properties.Items.Add(qryReg1.Fields[0].AsString);
           qryReg1.Next;
       end;
end;

procedure TfrmRegKaryawan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     qryReg1.Free;
     qryReg2.Free;
     qryExec.Free;
     Action := caFree;
end;

procedure TfrmRegKaryawan.FormCreate(Sender: TObject);
begin
     qryReg1 := TMyQuery.Create(Self);
     qryReg1.Connection := DMDB.dbInternal;
     qryReg1.SQL.Add('select * from temptable');
     qryReg1.Active := true;

     qryReg2 := TMyQuery.Create(Self);
     qryReg2.Connection := DMDB.dbInternal;
     qryReg2.SQL.Add('select * from temptable');
     qryReg2.Active := true;

     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from temptable');
     qryExec.Active := true;

     image1.Canvas.Create();
     fpReg.PictureSamplePath := ExtractFilePath(Application.ExeName) + '\FPTemp.BMP';
     fpReg.PictureSampleHeight := 1635;
     fpReg.PictureSampleWidth := 1335;
     btnStart.Enabled := False;
     //edValid.Date := Date;
end;

procedure TfrmRegKaryawan.fpRegFPRegistrationImage(Sender: TObject);
begin
     Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\FPTemp.BMP');
end;



procedure TfrmRegKaryawan.fpRegFPRegistrationStatus(ASender: TObject;
  Status: Integer);
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

procedure TfrmRegKaryawan.fpRegFPRegistrationTemplate(ASender: TObject;
  const FPTemplate: WideString);
begin
     memo1.Clear;
     memo1.lines.add(FPTemplate);
end;

procedure TfrmRegKaryawan.fpRegFPSamplesNeeded(ASender: TObject;
  Samples: SmallInt);
begin
     memo2.lines.add('Samples Needed ' + inttostr(Samples));
end;

procedure TfrmRegKaryawan.Memo1Change(Sender: TObject);
begin
     lblCounter.Caption := inttostr(Length(Memo1.Text));
end;

end.
