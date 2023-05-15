unit FKaryawanScanFinger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MyAccess, DBAccess, OleServer, FlexCodeSDK, ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, StdCtrls, cxButtons, strUtils,
  dxSkinscxPCPainter, cxPC, DateUtils, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxBarBuiltInMenu;

type
  TfrmKaryawanScanFinger = class(TForm)
    edSearch: TcxTextEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    btnStartScan: TButton;
    Button11: TButton;
    Button12: TButton;
    Memo1: TMemo;
    pgControl: TcxPageControl;
    pgScan: TcxTabSheet;
    lblInfo: TLabel;
    edKaryawanID: TLabel;
    edNama: TLabel;
    edDivisi: TLabel;
    Image1: TImage;
    pgInfo: TcxTabSheet;
    tmrRunning: TTimer;
    tmrStop: TTimer;
    edTanggal: TLabel;
    edStatus: TLabel;
    tmrDatabase: TTimer;
    memoNews: TMemo;
    pnlRunning: TPanel;
    lblRunning: TLabel;
    lblNow: TLabel;
    Label2: TLabel;
    fpVerify: TFinFPVer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnStartScanClick(Sender: TObject);
    procedure fpVerifyFPVerificationStatus(ASender: TObject; Status: Integer);
    procedure fpVerifyFPVerificationImage(Sender: TObject);
    procedure fpVerifyFPVerificationID(ASender: TObject; const ID: WideString;
      FingerNr: Integer);
    procedure tmrRunningTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tmrStopTimer(Sender: TObject);
    procedure tmrDatabaseTimer(Sender: TObject);
    procedure edSearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
     qryScan1, qryScan2, qryScan3, qryDBCount, qryExec : TMyQuery;
     TMR_COUNT, TMR_DB: Integer;
     procedure StartScan();
     procedure StopScan();
  public
    { Public declarations }
  end;

var
  frmKaryawanScanFinger: TfrmKaryawanScanFinger;

implementation

uses FDMDB, FMain;

{$R *.dfm}

procedure TfrmKaryawanScanFinger.StopScan;
begin

end;

procedure TfrmKaryawanScanFinger.tmrDatabaseTimer(Sender: TObject);
var
  i, tahun : Integer;
  tglLahir : String;
begin
    tglLahir := '%' + FormatDateTime('-MM-dd', Date);
    lblNow.Caption := FormatDateTime('dd / MMMM / yyyy ', Date) + ' | ' + FormatDateTime('hh:mm:ss', Time);

    TMR_DB := TMR_DB + 1;
    if (TMR_DB = 10) then
       begin
          {memoNews.SelectAll;
          memoNews.ClearSelection;}
          memoNews.Text := '';
          qryDBCount.Close;
          qryDBCount.SQL.Clear;
          qryDBCount.SQL.Add('select nama_lengkap, tgl_lahir from karyawan where tgl_lahir like ''' +
                             tglLahir + '''');
          qryDBCount.Open;
          qryDBCount.First;
          if (NOT qryDBCount.IsEmpty) then
            begin
               for i := 0 to qryDBCount.RecordCount - 1 do
                 begin
                    tahun := YearsBetween(qryDBCount.Fields[1].AsDateTime, Date);
                    memoNews.Lines.Add('Selamat Ulang Tahun ' + qryDBCount.Fields[0].AsString + ' yang Ke ' + IntToStr(tahun));
                    qryDBCount.Next;
                 end;
            end;
          qryDBCount.Close;
          qryDBCount.SQL.Clear;
          qryDBCount.SQL.Add('select waktu, berita, penulis from news where tanggal = ''' +
                             FormatDateTime('yyyy-MM-dd', Date) + ''' ORDER BY WAKTU DESC');
          qryDBCount.Open;
          memoNews.Lines.Add(#13#13);
          memoNews.Lines.Add('___***___');
          memoNews.Lines.Add(#13#13);
          memoNews.Lines.Add('TODAY NEWS');
          memoNews.Lines.Add(#13);
          memoNews.Lines.Add(qryDBCount.Fields[1].AsString);
          memoNews.Lines.Add(#13);
          memoNews.Lines.Add(#13);
          //memoNews.Lines.Add('HORMAT KAMI ');
          memoNews.Lines.Add(qryDBCount.Fields[2].AsString);
          memoNews.Lines.Add('--*eof*--');
          TMR_DB := 0;
          //edSearch.SetFocus;
       end;
end;

procedure TfrmKaryawanScanFinger.tmrRunningTimer(Sender: TObject);
var
   bKiri, BKanan : Integer;
begin
    //DD / MMMM / yyyy  hh:mm:ss

    bKiri := pnlRunning.Left - lblRunning.Width;
     BKanan := pnlRunning.Left + pnlRunning.Width;
     if (lblRunning.Left = bKiri) then
         begin
              lblRunning.Left := BKanan;
         end
     else
         begin
              lblRunning.Left := lblRunning.Left - 1;
         end;
     //tmrRunning.Interval := 10;
end;

procedure TfrmKaryawanScanFinger.tmrStopTimer(Sender: TObject);
begin
     TMR_COUNT := TMR_COUNT + 1;
     if (TMR_COUNT = 3) then
        begin
           edKaryawanID.Caption := '';
           edNama.Caption := '';
           edDivisi.Caption := '';
           edTanggal.Caption := '';
           edStatus.Caption := '';
           lblInfo.Caption := '';
           pgControl.ActivePage := pgInfo;
           edSearch.Clear;
           fpVerify.FPVerificationStop;
           tmrStop.Enabled := false;
           TMR_COUNT := 0;
           Memo1.SelectAll;
           Memo1.ClearSelection;
           edSearch.SetFocus;
        end;
end;

procedure TfrmKaryawanScanFinger.StartScan;
var
   i : Integer;
begin
   Screen.Cursor := crHourGlass;

   fpVerify.FPVerificationStop;
   fpVerify.FPListClear;
   qryScan2.Close;
   qryScan2.SQL.Clear;
   qryScan2.SQL.Add('select serialnumber, verificationcode, ' +
             'activationcode, devdefault from deviceregistration ' +
             'where devdefault = ''' + 'Y' + '''');
   qryScan2.Open;
   if (qryScan2.IsEmpty) then
      begin
          lblInfo.Caption := 'Sorry Device Un-Registered !! ' +
                   'Please Contact Your Administrator';
          Exit;
      end
   else if (NOT qryScan2.IsEmpty) then
      begin
           fpVerify.AddDeviceInfo(qryScan2.Fields[0].AsString, qryScan2.Fields[1].AsString,qryScan2.Fields[2].AsString);
           qryScan3.Close;
           qryScan3.SQL.Clear;
           qryScan3.SQL.Add('select karyawanid, fingerindex, fingerimage from ' +
                   'karyawanfpreg where karyawanid = ''' + edKaryawanID.Caption + '''');
           qryScan3.Open;
           //ShowMessage(inttostr(qryScan3.RecordCount));
           if (qryScan3.IsEmpty) then
              begin
                  lblInfo.Caption := 'ID Never Registered';
                  Exit;
              end
           else if (NOT qryScan3.IsEmpty) then
                begin
                   qryScan3.First;
                   for i := 0 to qryScan3.RecordCount - 1 do
                      begin
                         fpVerify.FPLoad(qryScan3.Fields[0].AsString, qryScan3.Fields[1].AsInteger, qryScan3.Fields[2].AsString, 'BORIST');
                         qryScan3.Next;
                      end;
                   //ShowMessage(inttostr(fpVerify.GetFPCount));
                    fpVerify.FPVerificationStart('');
                    pgControl.ActivePage := pgScan;
                    //ed
                    lblInfo.Caption := 'Ready to Scan, Place your finger';
                end;
           //fpVerify.DeviceInfo(qryScan2.Fields[0].AsString, qryScan2.Fields[1].AsString,qryScan2.Fields[2].AsString);

      end;
      Screen.Cursor := crDefault;
end;

procedure TfrmKaryawanScanFinger.btnStartScanClick(Sender: TObject);
var
   idKaryawan : String;
   i : Integer;
begin
    idKaryawan := '%' + edSearch.Text;
    qryScan1.Close;
    qryScan1.SQL.Clear;
    qryScan1.SQL.Add('select idkaryawan, departemen, namakaryawan ' +
               'from ben_hrd_karyawan_info where idkaryawan like ''' + idKaryawan + ''' AND active = ''' + 'Y' + '''');
    qryScan1.Open;

    if (qryScan1.IsEmpty) then
       begin
            qryScan2.Close;
            qryScan2.SQL.Clear;
            qryScan2.SQL.Add('select karyawan_id, departemen_id, nama_lengkap ' +
                     'from karyawan where karyawan_id like ''' + idKaryawan + '''');
            qryScan2.Open;
            if (NOT qryScan2.IsEmpty) then
              begin
                pgControl.ActivePage := pgScan;
                edKaryawanID.Caption := qryScan2.Fields[0].AsString;
                edNama.Caption := qryScan2.Fields[2].AsString;
                edDivisi.Caption := qryScan2.Fields[1].AsString;
                StartScan;
              end
            else if (qryScan2.IsEmpty) then
              begin
                lblInfo.Caption := 'ID Karyawan Not Recognize';
                Exit;
              end;

       end
    else if (NOT qryScan1.IsEmpty) then
       begin
            pgControl.ActivePage := pgScan;
            edKaryawanID.Caption := qryScan1.Fields[0].AsString;
            edNama.Caption := qryScan1.Fields[2].AsString;
            edDivisi.Caption := qryScan1.Fields[1].AsString;
            StartScan;
       end;
end;

procedure TfrmKaryawanScanFinger.Button11Click(Sender: TObject);
begin
     if (Length(edSearch.Text) = 5) then Exit;
     edSearch.Text := edSearch.Text + '0';
end;

procedure TfrmKaryawanScanFinger.Button12Click(Sender: TObject);
begin
   edSearch.Text := LeftStr(edSearch.Text,(Length(edSearch.Text) - 1));
end;

procedure TfrmKaryawanScanFinger.Button1Click(Sender: TObject);
begin
     if (Length(edSearch.Text) = 5) then Exit;
     edSearch.Text := edSearch.Text + '1';
end;

procedure TfrmKaryawanScanFinger.Button2Click(Sender: TObject);
begin
    if (Length(edSearch.Text) = 5) then Exit;
    edSearch.Text := edSearch.Text + '2';
end;

procedure TfrmKaryawanScanFinger.Button3Click(Sender: TObject);
begin
   if (Length(edSearch.Text) = 5) then Exit;
   edSearch.Text := edSearch.Text + '3';
end;

procedure TfrmKaryawanScanFinger.Button4Click(Sender: TObject);
begin
    if (Length(edSearch.Text) = 5) then Exit;
    edSearch.Text := edSearch.Text + '4';
end;

procedure TfrmKaryawanScanFinger.Button5Click(Sender: TObject);
begin
   if (Length(edSearch.Text) = 5) then Exit;
   edSearch.Text := edSearch.Text + '5';
end;

procedure TfrmKaryawanScanFinger.Button6Click(Sender: TObject);
begin
    if (Length(edSearch.Text) = 5) then Exit;
    edSearch.Text := edSearch.Text + '6';
end;

procedure TfrmKaryawanScanFinger.Button7Click(Sender: TObject);
begin
    if (Length(edSearch.Text) = 5) then Exit;
    edSearch.Text := edSearch.Text + '7';
end;

procedure TfrmKaryawanScanFinger.Button8Click(Sender: TObject);
begin
   if (Length(edSearch.Text) = 5) then Exit;
   edSearch.Text := edSearch.Text + '8';
end;

procedure TfrmKaryawanScanFinger.Button9Click(Sender: TObject);
begin
   if (Length(edSearch.Text) = 5) then Exit;
   edSearch.Text := edSearch.Text + '9';
end;

procedure TfrmKaryawanScanFinger.edSearchKeyPress(Sender: TObject;
  var Key: Char);
var
   idKaryawan : String;
   i : Integer;
begin
     if (key = #13) then
         begin
             btnStartScan.Click;
             //ShowMessage('OK');
             //btnStartScan.Click;
             {idKaryawan := '%' + edSearch.Text;
              qryScan1.Close;
              qryScan1.SQL.Clear;
              qryScan1.SQL.Add('select karyawan_id, departemen_id, nama_lengkap ' +
                         'from karyawan where karyawan_id like ''' + idKaryawan + '''');
              qryScan1.Open;

              if (qryScan1.IsEmpty) then
                 begin
                      lblInfo.Caption := 'ID Karyawan Not Recognize';
                 end
              else if (NOT qryScan1.IsEmpty) then
                 begin
                      pgControl.ActivePage := pgScan;
                      edKaryawanID.Caption := qryScan1.Fields[0].AsString;
                      edNama.Caption := qryScan1.Fields[2].AsString;
                      edDivisi.Caption := qryScan1.Fields[1].AsString;
                      StartScan;
                 end;}
         end;
end;

procedure TfrmKaryawanScanFinger.FormActivate(Sender: TObject);
begin
     pgControl.HideTabs := True;
     pgControl.ActivePage := pgInfo;
     edKaryawanID.Caption := '';
     edNama.Caption := '';
     edDivisi.Caption := '';
     edTanggal.Caption := '';
     edStatus.Caption := '';
     lblInfo.Caption := '';
     //pgControl.ActivePage := pgInfo;
end;

procedure TfrmKaryawanScanFinger.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    fpVerify.FPVerificationStop;
    qryScan1.Free;
    qryScan2.Free;
    qryScan3.Free;
    qryExec.Free;
    qryDBCount.Free;
    Action := caFree;
end;

procedure TfrmKaryawanScanFinger.FormCreate(Sender: TObject);
begin
     qryScan1 := TMyQuery.Create(Self);
     qryScan1.Connection := DMDB.dbInternal;
     qryScan1.SQL.Add('select * from temptable');
     qryScan1.Active := true;

     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from temptable');
     qryExec.Active := true;

     qryScan2 := TMyQuery.Create(Self);
     qryScan2.Connection := DMDB.dbInternal;
     qryScan2.SQL.Add('select * from temptable');
     qryScan2.Active := true;

     qryScan3 := TMyQuery.Create(Self);
     qryScan3.Connection := DMDB.dbInternal;
     qryScan3.SQL.Add('select * from temptable');
     qryScan3.Active := true;

     qryDBCount := TMyQuery.Create(Self);
     qryDBCount.Connection := DMDB.dbInternal;
     qryDBCount.SQL.Add('select * from temptable');
     qryDBCount.Active := true;

     Image1.Canvas.Create;
     fpVerify.PictureSamplePath := ExtractFilePath(Application.ExeName) + '\FPTemp.BMP';
     fpVerify.PictureSampleHeight := 1635;
     fpVerify.PictureSampleWidth := 1335;
     lblRunning.Caption := frmMain.APP_NAME;
     TMR_COUNT := 0;
     TMR_DB := 0;
     tmrRunning.Enabled := True;

end;

procedure TfrmKaryawanScanFinger.fpVerifyFPVerificationID(ASender: TObject;
  const ID: WideString; FingerNr: Integer);
var
  noUrut : Integer;
begin
     lblInfo.Caption := 'Scan FInger Success !!';
     qryExec.SQL.Clear;
     edTanggal.Caption := FormatDateTime('dd-mm-yyyy hh:mm:ss', Now);
     Memo1.Lines.Add('ID = ' + ID + ', FingerNr = ' + inttostr(FingerNr));
     qryScan1.Close;
     qryScan1.SQL.Clear;
     qryScan1.SQL.Add('select id_karyawan, tanggal, waktu, status from absen_harian ' +
                 'where id_karyawan = ''' + edKaryawanID.Caption + ''' AND tanggal = ''' +
                 FormatDateTime('yyyy-MM-dd', Now) + ''' ORDER BY waktu DESC');
     qryScan1.Open;
     qryScan1.First;
     if (NOT qryScan1.IsEmpty) then
        begin
             if (qryScan1.Fields[3].AsString = 'IN') then
                begin
                    edStatus.Caption := 'OUT';
                end
             else if (qryScan1.Fields[3].AsString = 'OUT') then
                begin
                     edStatus.Caption := 'IN';
                end
             else
                begin
                     edStatus.Caption := 'IN';
                end;
             qryExec.SQL.Add('insert into absen_harian values(' +
                '''' + '' + ''',' +
                '''' + edKaryawanID.Caption + ''',' +
                '''' + edNama.Caption + ''',' +
                '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                '''' + FormatDateTime('hh:mm:ss', Time) + ''',' +
                '''' + edStatus.Caption + ''',' +
                '''' + '' + ''');');

        end
     else if (qryScan1.IsEmpty) then
        begin
             edStatus.Caption := 'IN';
             qryExec.SQL.Add('insert into absen_harian values(' +
                '''' + '' + ''',' +
                '''' + edKaryawanID.Caption + ''',' +
                '''' + edNama.Caption + ''',' +
                '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                '''' + FormatDateTime('hh:mm:ss', Time) + ''',' +
                '''' + edStatus.Caption + ''',' +
                '''' + '' + ''');');
        end;

     if ((edDivisi.Caption = 'TR') OR (edDivisi.Caption = 'TB')) then
        begin
            qryScan2.Close;
            qryScan2.SQL.Clear;
            qryScan2.SQL.Add('select id_therapist, status from available_tr where id_therapist = ''' +
                    edKaryawanID.Caption + '''');
            qryScan2.Open;
            if (NOT qryScan2.IsEmpty) then
               begin

                  if (qryScan2.Fields[1].AsString = 'AVAILABLE') then
                     begin
                         qryExec.SQL.Add('update available_tr set ' +
                                     'status = ''' + 'NOT AVAILABLE' + ''', ' +
                                     'tanggal = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                                     'waktu_masuk = ''' + FormatDateTime('hh:mm:ss', Time) + ''' ' +
                                     'where id_therapist = ''' + edKaryawanID.Caption + ''';');
                         edStatus.Caption := edStatus.Caption + ' # ' + 'NOT AVAILABLE';
                     end
                  else if (qryScan2.Fields[1].AsString = 'NOT AVAILABLE') then
                     begin
                         qryExec.SQL.Add('update available_tr set ' +
                                     'status = ''' + 'AVAILABLE' + ''', ' +
                                     'tanggal = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                                     'waktu_masuk = ''' + FormatDateTime('hh:mm:ss', Time) + ''' ' +
                                     'where id_therapist = ''' + edKaryawanID.Caption + ''';');
                         edStatus.Caption := edStatus.Caption + ' # ' + 'AVAILABLE';
                     end
                  else
                     begin
                         qryExec.SQL.Add('update available_tr set ' +
                                     'status = ''' + 'NOT AVAILABLE' + ''', ' +
                                     'tanggal = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                                     'waktu_masuk = ''' + FormatDateTime('hh:mm:ss', Time) + ''' ' +
                                     'where id_therapist = ''' + edKaryawanID.Caption + ''';');
                         edStatus.Caption := edStatus.Caption + ' # ' + 'NOT AVAILABLE';
                     end

               end
            else if (qryScan2.IsEmpty) then
               begin
                   qryExec.SQL.Add('insert into available_tr values(' +
                              '''' + edKaryawanID.Caption + ''',' +
                              '''' + edDivisi.Caption + ''',' +
                              '''' + edNama.Caption + ''',' +
                              '''' + '1' + ''',' +
                              '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                              '''' + FormatDateTime('hh:mm:ss', Time) + ''',' +
                              '''' + 'AVAILABLE' + ''',' +
                              '''' + '00:00:00' + ''',' +
                              '''' + '00:00:00' + ''',' +
                              '''' + '' + ''');');
                   edStatus.Caption := edStatus.Caption + ' # ' + 'AVAILABLE';
               end;

        end;
      qryExec.ExecSQL;
     //pgControl.ActivePage := pgScan;
     tmrStop.Enabled := True;
end;

procedure TfrmKaryawanScanFinger.fpVerifyFPVerificationImage(Sender: TObject);
begin
    Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\FPTemp.BMP');
end;

procedure TfrmKaryawanScanFinger.fpVerifyFPVerificationStatus(ASender: TObject;
  Status: Integer);
begin
    case Status of
    0  :  begin
            Memo1.Lines.Add('Not match!');
            lblInfo.Caption := 'Finger Not Match'
          end;
    1  :  begin
            Memo1.Lines.Add('Match!');
          end;
    2   : begin
            Memo1.Lines.Add('Multiple match!');
          end;
    3  :  begin
            Memo1.Lines.Add('Verification fail!');
          end;
    7   : begin
            Memo1.Lines.Add('Please connect the device to USB port!');
            //btnStart.Caption := '&Start Verify';
          end;
    8  :  begin
            Memo1.Lines.Add('Poor image quality!');
            lblInfo.Caption := 'Bad Image Quality !!';
          end;
    9   : begin
            Memo1.Lines.Add('Activation/verification code is incorrect!');
            //btnStart.Caption := '&Start Verify';
          end;
    11  : begin
            Memo1.Lines.Add('&Stop Verify!');
            //btnStart.Caption := '&Start Verify';
          end;
    15  : begin
            Memo1.Lines.Add('Finger touch!');
          end;
    16  : begin
            Memo1.Lines.Add('Max 2000 templates!');
          end;
    17  : begin
            Memo1.Lines.Add('Max 10 Devices!');
          end;
    18  : begin
            Memo1.Lines.Add('Please add some template!');
            //btnStart.Caption := '&Start Verify';
          end;
  end;
end;

end.
