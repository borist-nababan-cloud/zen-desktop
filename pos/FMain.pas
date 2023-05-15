unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvGlowButton, INIFiles, StdCtrls,
  Menus, cxHint, dxScreenTip, cxClasses, dxCustomHint;

type
  TfrmMain = class(TForm)
    pnlBar: TPanel;
    btnPos: TAdvGlowButton;
    pnlMain: TPanel;
    XiPanel2: TPanel;
    btnSetUp: TAdvGlowButton;
    //BarcodeReader: TBarcodeReader;
    btnStart: TAdvGlowButton;
    btnStopOrder: TAdvGlowButton;
    btnPayment: TAdvGlowButton;
    Timer1: TTimer;
    lblCounter: TLabel;
    btnViewReport: TAdvGlowButton;
    PopupMenu1: TPopupMenu;
    GLOBAL1: TMenuItem;
    DETAIL1: TMenuItem;
    pmSetting: TPopupMenu;
    BARCODE1: TMenuItem;
    HERAPIST1: TMenuItem;
    ROOM1: TMenuItem;
    SPESIFIKASITHERAPIST1: TMenuItem;
    CHANGESTATUS1: TMenuItem;
    STOCKKASIR1: TMenuItem;
    DAFTARMEM1: TMenuItem;
    All1: TMenuItem;
    cxHintStyleController1: TcxHintStyleController;
    btnBooking: TAdvGlowButton;
    trBooking: TTimer;
    CEKHISTORYMEMBER1: TMenuItem;
    ravelDriverRegistration1: TMenuItem;
    N1: TMenuItem;
    DriversFingerRegistration1: TMenuItem;
    FeeDrivers1: TMenuItem;
    LaporanTransDrivers1: TMenuItem;
    LOCAL1: TMenuItem;
    ONLINE1: TMenuItem;
    HISTORYTRANS1: TMenuItem;
    procedure btnPosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnStopOrderClick(Sender: TObject);
    procedure btnPaymentClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GLOBAL1Click(Sender: TObject);
    procedure DETAIL1Click(Sender: TObject);
    procedure BARCODE1Click(Sender: TObject);
    procedure HERAPIST1Click(Sender: TObject);
    procedure SPESIFIKASITHERAPIST1Click(Sender: TObject);
    procedure CHANGESTATUS1Click(Sender: TObject);
    procedure STOCKKASIR1Click(Sender: TObject);
    procedure DAFTARMEM1Click(Sender: TObject);
    procedure All1Click(Sender: TObject);
    procedure btnUpdatePointClick(Sender: TObject);
    procedure btnBookingClick(Sender: TObject);
    procedure trBookingTimer(Sender: TObject);
    procedure CEKHISTORYMEMBER1Click(Sender: TObject);
    procedure ravelDriverRegistration1Click(Sender: TObject);
    procedure DriversFingerRegistration1Click(Sender: TObject);
    procedure FeeDrivers1Click(Sender: TObject);
    procedure LaporanTransDrivers1Click(Sender: TObject);
    procedure ONLINE1Click(Sender: TObject);
    procedure LOCAL1Click(Sender: TObject);
    procedure HISTORYTRANS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TR_COUNTER : Integer;
    COUNTER1 : Integer;
    appDir, filePath, bcType, bcValue, CABANG : String;
    cfgParity, cfgDataBits, cfgStopBits, cfgSpeed, cfgPort : String;
    HOSTDB, USERDB, DBNAME, DBPASS, DBPORT, SERVERHOST, SERVERUSER,
    SERVERDB, SERVERPASS, SERVEROUTLET, SERVERPORT, IDXSOPRINTER,
    IDXPOSPRINTER, JUDULATAS, JUDULBAWAH, ALAMATOUTLET : String;
    INIConfig : TIniFile;
    procedure close_clientForm();


    function ExtComName(ComNr: DWORD): string;
    function CheckCom(AComNumber: Integer): Integer;
  end;

var
  frmMain: TfrmMain;

implementation

uses FPos, FLogin, FDevAppSetUp, FDMDB, FStartTrans, FStopTrans, FPayment,
  FPelunasan, FEmpty, FViewReport, FReportHarian, FViewTherapist, FTRSpecs,
  FStockKasir, FNewMembers, FChangeStatus, FReportAll, FBooking, FPesan,
  FHistoryMember, FDrivers, FRegistrationDrivers, FDriverSelectTrans,
  FlapTransDrivers, FNewMenuTrans, FMemberLocal;

{$R *.dfm}

function TfrmMain.ExtComName(ComNr: DWORD): string;
begin
     if (ComNr > 9) then
        Result := Format('\\\\.\\COM%d', [ComNr])
     else
         Result := Format('COM%d', [ComNr]);
end;

function TfrmMain.CheckCom(AComNumber: Integer): Integer;
var
   FHandle: THandle;
begin
     Result := 0;
     FHandle := CreateFile(PChar(ExtComName(AComNumber)),
                           GENERIC_READ or GENERIC_WRITE,
                           0, {exclusive access}
                           nil, {no security attrs}
                           OPEN_EXISTING,
                           FILE_ATTRIBUTE_NORMAL,
                           0);

     if (FHandle <> INVALID_HANDLE_VALUE) then
        CloseHandle(FHandle)
     else
         Result := GetLastError;
end;

procedure TfrmMain.close_clientForm();
begin
     if (pnlMain.ControlCount > 0) then
         begin
              if (pnlMain.Controls[0] is TForm) then
                  begin
                       (pnlMain.Controls[0] as TForm).Close;
                  end
              else ShowMessage(pnlMain.Controls[0].Name + #13 +
                              'Cannot be close, duplicate form action.');
         end;
end;

procedure TfrmMain.btnPosClick(Sender: TObject);
begin
     close_clientForm;
     Application.CreateForm(TfrmPos, frmPos);
     frmPos.BorderStyle := bsNone;
     frmPos.Parent := frmMain.pnlMain;
     frmPos.Show;
     frmPos.WindowState := wsMaximized;
     
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
     close_clientForm;
     Application.CreateForm(TfrmLogin, frmLogin);
     frmLogin.BorderStyle := bsNone;
     frmLogin.Parent := frmMain.pnlMain;
     frmLogin.Show;
     frmLogin.WindowState := wsNormal;
end;

procedure TfrmMain.FeeDrivers1Click(Sender: TObject);
begin
     //TfrmDriverSelectTrans
     Application.CreateForm(TfrmDriverSelectTrans, frmDriverSelectTrans);
     frmDriverSelectTrans.ShowModal;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
   comNum, Err : integer;
begin
     appDir := ExtractFilePath(Application.ExeName);
     filePath := '';

     if (not FileExists(appDir + 'config.ini')) then
        begin
             INIConfig := TIniFile.Create(appDir + 'config.ini');
             cfgParity := '0';
             cfgDataBits := '1';
             cfgStopBits := '0';
             cfgSpeed := '2';
             cfgPort := 'COM1';
             HOSTDB := 'localhost';
             USERDB := 'root';
             DBNAME := 'bc_zen';
             DBPASS := '';
             CABANG := 'SUKAJADI';
             JUDULATAS := 'Family Spa & Reflexology';
             JUDULBAWAH := 'Family Spa & Reflexology';
             ALAMATOUTLET := 'Family Spa & Reflexology';
             SERVERHOST := 'sql5.freesqldatabase.com';
             SERVERUSER := 'sql552148';
             SERVERDB := 'sql55148';
             SERVERPASS := 'gN3*hJ2*';
             SERVEROUTLET := 'sukajadi';
             IDXSOPRINTER := '1';
             IDXPOSPRINTER := '1';
             INIConfig.WriteString('SetUp','Parity',cfgParity);
             INIConfig.WriteString('SetUp','DataBits',cfgDataBits);
             INIConfig.WriteString('SetUp','StopBits',cfgStopBits);
             INIConfig.WriteString('SetUp','Speed',cfgSpeed);
             INIConfig.WriteString('SetUp','Port',cfgPort);
             INIConfig.WriteString('SetUp','Port',cfgPort);
             INIConfig.WriteString('Database', 'host',HOSTDB);
             INIConfig.WriteString('Database', 'user',USERDB);
             INIConfig.WriteString('Database', 'name',DBNAME);
             INIConfig.WriteString('Database', 'pass',DBPASS);
             INIConfig.WriteString('Database', 'port',DBPORT);
             INIConfig.WriteString('Database', 'cabang',CABANG);
             INIConfig.ReadString('Database', 'judul',JUDULATAS);
             INIConfig.ReadString('Database', 'judulbawah',JUDULBAWAH);
             INIConfig.ReadString('Database', 'alamat',ALAMATOUTLET);
             INIConfig.WriteString('Server', 'host',SERVERHOST);
             INIConfig.WriteString('Server', 'user',SERVERUSER);
             INIConfig.WriteString('Server', 'name',SERVERDB);
             INIConfig.WriteString('Server', 'pass',SERVERPASS);
             INIConfig.WriteString('Server', 'port',SERVERPORT);
             INIConfig.WriteString('Printer', 'payment',IDXPOSPRINTER);
             INIConfig.WriteString('Printer', 'salesorder',IDXSOPRINTER);

        end
     else
         begin
              INIConfig := TIniFile.Create(appDir + 'config.ini');
              cfgParity := INIConfig.ReadString('SetUp', 'Parity', '0');
              cfgDataBits := INIConfig.ReadString('SetUp', 'DataBits', '1');
              cfgStopBits := INIConfig.ReadString('SetUp', 'StopBits', '0');
              cfgSpeed := INIConfig.ReadString('SetUp', 'Speed', '2');
              cfgPort := INIConfig.ReadString('SetUp', 'Port', 'COM1');
              HOSTDB := INIConfig.ReadString('Database', 'host','localhost');
              USERDB := INIConfig.ReadString('Database', 'user', 'root');
              DBNAME := INIConfig.ReadString('Database', 'name', 'bc_zen');
              DBPASS := INIConfig.ReadString('Database', 'pass', '');
              DBPORT := INIConfig.ReadString('Database', 'port', '3306');
              CABANG := INIConfig.ReadString('Database', 'cabang','sukajadi');
              JUDULATAS := INIConfig.ReadString('Database', 'judul','Family Spa & Reflexology');
              JUDULBAWAH := INIConfig.ReadString('Database', 'judulbawah','Family Spa & Reflexology');
              ALAMATOUTLET := INIConfig.ReadString('Database', 'alamat','Family Spa & Reflexology');
              SERVERHOST := INIConfig.ReadString('Server', 'host','sql5.freesqldatabase.com');
              SERVERUSER := INIConfig.ReadString('Server', 'user', 'sql552148');
              SERVERDB := INIConfig.ReadString('Server', 'name', 'sql55148');
              SERVERPASS := INIConfig.ReadString('Server', 'pass', 'gN3*hJ2*');
              SERVERPORT := INIConfig.ReadString('Server', 'port', '3306*');
              SERVEROUTLET := INIConfig.ReadString('Server', 'idoutlet','1');
              SERVERPORT := INIConfig.ReadString('Server', 'port', '3306*');
              SERVEROUTLET := INIConfig.ReadString('Server', 'idoutlet','1');
              IDXSOPRINTER := INIConfig.ReadString('Printer', 'salesorder','1');
              IDXPOSPRINTER := INIConfig.ReadString('Printer', 'payment','1');
         end;

     comNum := 0;
     if (Length(cfgPort) = 4) or (Length(cfgPort) = 5) then
        begin
             try
                comNum := strtoint(Copy(cfgPort, length(cfgPort),1));
             except
                   on EConvertError do
                      begin
                           raise Exception.Create('System was not recognize your serial COM number, failed !.');
                           exit;
                      end;
             end;
        end
     else if (Length(cfgPort) < 4) or (Length(cfgPort) > 5) then
             begin
                  comNum := 0;
                  MessageDlg('System was not recognize your serial COM port.',
                  mtWarning, [mbOK], 0);
             end;

     Err := CheckCom(comNum);


end;

procedure TfrmMain.btnStopOrderClick(Sender: TObject);
begin
     close_clientForm;
     Application.CreateForm(TfrmEmpty, frmEmpty);
     frmEmpty.BorderStyle := bsNone;
     frmEmpty.Parent := frmMain.pnlMain;
     frmEmpty.Show;
     frmEmpty.WindowState := wsMaximized;
     with dmDB do
          begin
               transMaster.Close;
               transMaster.SQL.Clear;
               transMaster.SQL.Add('select * from trans_master where tanggal = ''' +
                                   FormatDateTime('yyyy-MM-dd', Date) + ''' and status_trans = ''' +
                                   'STARTED' + '''');
               transMaster.Open;
          end;
     Application.CreateForm(TfrmStopOrder, frmStopOrder);
     frmStopOrder.gtbTransMaster.DataController.Refresh;
     frmStopOrder.ShowModal;
end;

procedure TfrmMain.btnPaymentClick(Sender: TObject);
begin
     frmMain.pnlBar.Enabled := false;
     frmMain.close_clientForm;
     Application.CreateForm(TfrmPelunasan, frmPelunasan);

     //dmDB.transDetail.Refresh;
     with frmPelunasan do
          begin
               V_ID := CreateNewAutoNum;
               edTransIDPayment.Text := V_ID;

               with dmDB do
                    begin
                         qryUpdate.Sql.Clear;
                         qryUpdate.SQL.Add('INSERT INTO trans_payment VALUES(' +
                                           '''' + V_ID + ''', ' +
                                           '''' + FormatDateTime('yyyy-MM-dd', Date) + ''', ' +
                                           '''' + FormatDateTime('HH:MM:ss', Time) + ''', ' +
                                           '''' + 'NONE' + ''', ' +
                                           '''' + 'NONE' + ''', ' +
                                           '''' + '0' + ''', ' +
                                           '''' + '0' + ''', ' +
                                           '''' + '0' + ''', ' +
                                           '''' + '0' + ''', ' +
                                           '''' + '0' + ''', ' +
                                           '''' + '0' + ''', ' +
                                           '''' + '0' + ''', ' +
                                           '''' + '0' + ''', ' +
                                           '''' + '0' + ''', ' +
                                           '''' + '0' + ''', ' +
                                           '''' + 'CASH' + ''', ' +
                                           '''' + '(NONE)' + ''', ' +
                                           '''' + '(NONE)' + ''', ' +
                                           '''' + '(NONE)' + ''', ' +
                                           '''' + frmMain.CABANG + ''')');
                         qryUpdate.ExecSql;

                    end;


          end;
     frmPelunasan.BorderStyle := bsNone;
     frmPelunasan.Parent := frmMain.pnlMain;
     frmPelunasan.Show;
     frmPelunasan.WindowState := wsMaximized;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
   i, no_urut : Integer;
begin
     lblCounter.Caption := inttostr(COUNTER1);
     COUNTER1 := COUNTER1 + 1;
     if (COUNTER1 = 3) then
         begin
              with dmDB do
                   begin
                        QRYCOUNTEREXEC.Sql.Clear;
                        QRYCOUNTEREXEC.Sql.Add('update available_tr set ' +
                                               'status = ''' + 'NOT AVAILABLE'  + ''' ' +
                                               'where tanggal <> ''' + FormatDateTime('YYYY-MM-dd', Date) + '''');
                        QRYCOUNTEREXEC.ExecSql;
                        Sleep(10);

                        QRYCOUNTER1.Close;
                        QRYCOUNTER1.SQL.Clear;
                        QRYCOUNTER1.SQL.Add('select * from available_tr where status = ''' +
                                            'STARTED' + ''' and end_time < ''' +
                                            FormatDateTime('HH:MM:ss', Time) + '''');
                        QRYCOUNTER1.Open;
                        QRYCOUNTER1.First;
                        for i:=0 to QRYCOUNTER1.RecordCount-1 do
                            begin
                                 QRYCOUNTEREXEC.Sql.Clear;
                                 QRYCOUNTEREXEC.Sql.Add('update available_tr set ' +
                                                        'waktu_masuk = ''' + FormatDateTime('HH:MM:ss', Time) + ''', ' +
                                                        'tanggal = ''' +FormatDateTime('yyyy-MM-dd', Date) + ''', ' +
                                                        'room_id = ''' + 'NONE' + ''', ' +
                                                        'status = ''' + 'AVAILABLE' + ''', ' +
                                                        'start_time = ''' + '00:00:00' + ''', ' +
                                                        'end_time = ''' + '00:00:00' + ''' ' +
                                                        'where id_therapist = ''' + QRYCOUNTER1.Fields[0].AsString + '''');
                                 QRYCOUNTEREXEC.ExecSql;
                                 QRYCOUNTER1.Next;

                            end;
                        QRYCOUNTER2.Close;
                        QRYCOUNTER2.SQL.Clear;
                        QRYCOUNTER2.SQL.Add('select * from available_tr where status = ''' +
                                            'AVAILABLE' + ''' order by waktu_masuk ASC');
                        QRYCOUNTER2.Open;
                        QRYCOUNTER2.First;
                        no_urut := 0;

                        for i:=0 to QRYCOUNTER2.RecordCount-1 do
                            begin
                                 no_urut := no_urut + 1;
                                 QRYCOUNTEREXEC.Sql.Clear;
                                 QRYCOUNTEREXEC.Sql.Add('update available_tr set ' +
                                                        'no_urut = ''' + IntToStr(no_urut) + ''' ' +
                                                        'where id_therapist = ''' + QRYCOUNTER2.Fields[0].AsString + '''');
                                 QRYCOUNTEREXEC.ExecSql;
                                 QRYCOUNTER2.Next;
                            end;
                        QRYCOUNTER1.Close;
                        QRYCOUNTER1.SQL.Clear;
                        QRYCOUNTER1.SQL.Add('select * from ruangan where end_time < ''' +
                                            FormatDateTime('HH:MM:ss', Time) + ''' and status = ''' +
                                            'STARTED' + '''');
                        QRYCOUNTER1.Open;

                        for i := 0 to QRYCOUNTER1.RecordCount-1 do
                            begin
                                 QRYCOUNTEREXEC.Sql.Clear;
                                 QRYCOUNTEREXEC.Sql.Add('update ruangan set ' +
                                                   'status = ''' + 'AVAILABLE' + ''', ' +
                                                   'start_time = ''' + '00:00:00' + ''', ' +
                                                   'trans_id = ''' + 'NONE' + ''', ' +
                                                   'therapist_id = ''' + 'NONE' + ''', ' +
                                                   'end_time = ''' + '00:00:00' + ''' ' +
                                                   'where ruangan_id = ''' + QRYCOUNTER1.Fields[0].AsString + '''');
                                 QRYCOUNTEREXEC.ExecSql;
                                 QRYCOUNTER1.Next;
                            end;
                   end;
              COUNTER1 := 0;
         end;
end;

procedure TfrmMain.GLOBAL1Click(Sender: TObject);
begin
     frmMain.close_clientForm;
     Application.CreateForm(TfrmViewTrans, frmViewTrans);
     frmViewTrans.BorderStyle := bsNone;
     frmViewTrans.Parent := frmMain.pnlMain;
     frmViewTrans.Show;
     frmViewTrans.WindowState := wsMaximized;
     dmDB.transDetail.Refresh;
end;

procedure TfrmMain.DETAIL1Click(Sender: TObject);
begin
     frmMain.close_clientForm;
     Application.CreateForm(TfrmReportHarian, frmReportHarian);
     frmReportHarian.BorderStyle := bsNone;
     frmReportHarian.Parent := frmMain.pnlMain;
     frmReportHarian.Show;
     frmReportHarian.WindowState := wsMaximized;
     dmDB.transDetail.Refresh;

end;

procedure TfrmMain.DriversFingerRegistration1Click(Sender: TObject);
begin
     //
     Application.CreateForm(TfrmRegistrationDrivers, frmRegistrationDrivers);
     frmRegistrationDrivers.ShowModal;
end;

procedure TfrmMain.BARCODE1Click(Sender: TObject);
begin
     Application.CreateForm(TfrmDevAppSetUp, frmDevAppSetUp);
     frmDevAppSetUp.ShowModal;
end;

procedure TfrmMain.HERAPIST1Click(Sender: TObject);
begin
     Application.CreateForm(TfrmTherapist, frmTherapist);
     with dmDB do
          begin
               qryTherapist.Close;
               qryTherapist.SQL.Clear;
               qryTherapist.SQL.Add('select * from available_tr where status = ''' +
                                    'AVAILABLE' + ''' order by no_urut ASC');
               qryTherapist.Open;

          end;
     frmTherapist.gtbTherapist.DataController.Refresh;
     frmTherapist.ShowModal;
     //TfrmTherapist
     //
end;

procedure TfrmMain.HISTORYTRANS1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmHistoryMember, frmHistoryMember);
     frmHistoryMember.ShowModal;
end;

procedure TfrmMain.LaporanTransDrivers1Click(Sender: TObject);
begin
    //TfrmLapTransDrivers
    Application.CreateForm(TfrmLapTransDrivers, frmLapTransDrivers);
    frmLapTransDrivers.ShowModal;
end;

procedure TfrmMain.LOCAL1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmMemberLocal, frmMemberLocal);
   frmMemberLocal.ShowModal;
end;

procedure TfrmMain.ONLINE1Click(Sender: TObject);
begin
     frmMain.close_clientForm;
     Application.CreateForm(TfrmNewMembers, frmNewMembers);
     frmNewMembers.BorderStyle := bsNone;
     frmNewMembers.Parent := frmMain.pnlMain;
     frmNewMembers.Show;
     frmNewMembers.WindowState := wsMaximized;
     dmDB.tblMembers.Refresh;
end;

procedure TfrmMain.ravelDriverRegistration1Click(Sender: TObject);
begin
     frmMain.close_clientForm;
     Application.CreateForm(TfrmDrivers, frmDrivers);
     frmDrivers.BorderStyle := bsNone;
     frmDrivers.Parent := frmMain.pnlMain;
     frmDrivers.Show;
     frmDrivers.WindowState := wsMaximized;
     dmDB.tblDriver.Refresh;
     frmDrivers.gtbMasterDrivers.DataController.Refresh;

end;

procedure TfrmMain.SPESIFIKASITHERAPIST1Click(Sender: TObject);
begin
     Application.CreateForm(TfrmTRSpecs, frmTRSpecs);
     frmTRSpecs.ShowModal;
end;

procedure TfrmMain.CEKHISTORYMEMBER1Click(Sender: TObject);
begin
     //TfrmHistoryMember
     
end;

procedure TfrmMain.CHANGESTATUS1Click(Sender: TObject);
begin
     Application.CreateForm(TfrmChangeStatus, frmChangeStatus);
     frmChangeStatus.ShowModal;
end;

procedure TfrmMain.STOCKKASIR1Click(Sender: TObject);
begin
     Application.CreateForm(TfrmStockKasir, frmStockKasir);
     frmStockKasir.ShowModal;
     dmDB.tblStockKasir.Refresh;
end;

procedure TfrmMain.DAFTARMEM1Click(Sender: TObject);
begin

     //dmDB.transDetail.Refresh;

end;

procedure TfrmMain.All1Click(Sender: TObject);
begin
     frmMain.close_clientForm;
     Application.CreateForm(TfrmReportAll, frmReportAll);
     frmReportAll.BorderStyle := bsNone;
     frmReportAll.Parent := frmMain.pnlMain;
     frmReportAll.Show;
     frmReportAll.WindowState := wsMaximized;
     //dmDB.transDetail.Refresh;
end;

procedure TfrmMain.btnUpdatePointClick(Sender: TObject);
begin
     //
     
end;

procedure TfrmMain.btnBookingClick(Sender: TObject);
begin
    frmMain.close_clientForm;
    Application.CreateForm(TfrmBooking, frmBooking);
    frmBooking.V_ID := frmBooking.CreateNewAutoNum;
    frmBooking.edTrans.Text := frmBooking.V_ID;
    dmDB.qryUpdate.Sql.Clear;
    dmDB.qryUpdate.Sql.Add('INSERT INTO booking VALUES( ' +
                      '''' + frmBooking.edTrans.Text+ ''' , ' +
                      '''' + FormatDateTime('YYYY-mm-dd', Date) + ''' , ' +
                      '''' + FormatDateTime('YYYY-mm-dd', Date) + ''' , ' +
                      '''' + FormatDateTime('HH:MM:ss', Time) + ''' , ' +
                      '''' + 'NONE' + ''' , ' +
                      '''' + '0' + ''' , ' +
                      '''' + '0' + ''' , ' +
                      '''' + 'NONE' + ''')');
    dmDB.qryUpdate.ExecSql;
    frmBooking.btnNewB.Caption := 'Cancel';
    frmBooking.btnNewB.Tag:=1;
    frmBooking.ShowModal;
end;

procedure TfrmMain.trBookingTimer(Sender: TObject);
begin
    with dmDB do
       begin
            
            qryBooking.Close;
            qryBooking.SQL.Clear;
            qryBooking.SQL.Add('SELECT * FROM booking ' +
                               'WHERE tgl_booking = ''' + FormatDateTime('YYYY-mm-dd', Date) + ''' and ' +
                               'jam_booking > ''' + FormatDateTime('HH:MM:ss', Time) + ''' and ' +
                               'TIMEDIFF(jam_booking , CURRENT_TIME) <= ''' + '00:30:00' + ''' and ' +
                               'TIMEDIFF(jam_booking , CURRENT_TIME) > ''' + '00:00:00' + '''');
            qryBooking.Open;
            if(NOT qryBooking.IsEmpty) then
                begin
                        Application.CreateForm(TfrmPesan, frmPesan);
                        frmPesan.ShowModal;
                end;
            qryUpdate.Sql.Clear;
            qryUpdate.Sql.Add('DELETE FROM booking ' +
                              'WHERE tgl_booking = ''' + FormatDateTime('YYYY-mm-dd', Date) + ''' and ' +
                              'jam_booking < ''' + FormatDateTime('HH:MM:ss', Time) + ''' and ' +
                              'TIMEDIFF(CURRENT_TIME,jam_booking ) >= ''' + '02:00:00' + '''');
            qryUpdate.ExecSql;
       end;
end;

end.
