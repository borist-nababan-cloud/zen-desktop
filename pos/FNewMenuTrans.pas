unit FNewMenuTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, StdCtrls, cxButtons, cxMaskEdit, cxCalc, cxTextEdit,
  MyAccess, DB, strUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, MemDS, DBAccess,
  cxGroupBox, cxRadioGroup, dxBevel, DateUtils, XSuperJSON, XSuperObject,
  cxCheckBox;

type
  TfrmNewMenuTrans = class(TForm)
    Waktu: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edLama: TcxCalcEdit;
    edHarga: TcxCalcEdit;
    edTherapist: TcxTextEdit;
    btnFinish: TcxButton;
    edAroma: TcxLookupComboBox;
    edDiscount: TcxCalcEdit;
    btnCancel: TcxButton;
    dsQryMenu: TDataSource;
    edNamaMenu: TcxLookupComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edNamaTR: TcxTextEdit;
    Label13: TLabel;
    dsQryRoom: TDataSource;
    edSelectRoom: TcxLookupComboBox;
    Label14: TLabel;
    edNett: TcxCalcEdit;
    Label15: TLabel;
    Label16: TLabel;
    QryMenu: TMyQuery;
    QryRoom: TMyQuery;
    rbTypeJasa: TcxRadioGroup;
    Label6: TLabel;
    lblKodeTrans: TLabel;
    rbGender: TcxRadioGroup;
    Label5: TLabel;
    edCustName: TcxTextEdit;
    dxBevel1: TdxBevel;
    btnGuestOnly: TcxButton;
    edSelectTR: TcxLookupComboBox;
    dsQryTherapist: TDataSource;
    qryTherapist: TMyQuery;
    dsQryAroma: TDataSource;
    qryAroma: TMyQuery;
    ckByRequest: TcxCheckBox;
    lblStatus: TLabel;
    lblScan: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNamaMenuKeyPress(Sender: TObject; var Key: Char);
    procedure edTherapistKeyPress(Sender: TObject; var Key: Char);
    procedure edDiscountKeyPress(Sender: TObject; var Key: Char);
    procedure btnFinishClick(Sender: TObject);
    procedure edSelectRoomKeyPress(Sender: TObject; var Key: Char);
    procedure edAromaKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnGuestOnlyClick(Sender: TObject);
    procedure edNamaMenuPropertiesEditValueChanged(Sender: TObject);
    procedure edSelectTRPropertiesEditValueChanged(Sender: TObject);
    procedure rbTypeJasaPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    qryMenu1, qryMenu2, qrySearch, qryExec : TMyQuery;
  public
    { Public declarations }
    IDPAKET, TYPETRANS, TYPETR : String;
    PACKETHH : Boolean;
    varJam : TTime;
    varTanggal : TDate;
  end;

var
  frmNewMenuTrans: TfrmNewMenuTrans;

implementation

{$R *.dfm}

uses FdmDB, FSelectTherapist, FPos, FMain, FPosTransMain;

procedure TfrmNewMenuTrans.btnCancelClick(Sender: TObject);
begin
    frmNewMenuTrans.Close;
end;

procedure TfrmNewMenuTrans.btnFinishClick(Sender: TObject);
var
  keterangan, gender, strTypeJasa, strPacket, strJson : String;
  subtotal : Double;
  newRec, totLama : Integer;
  wStart, wEnd : TTime;
  jSonItem : XSuperObject.ISuperObject;
begin
  if (edNamaMenu.Text = '') then
    begin
      ShowMessage('Maaf Menu Belum Dipilih');
      edNamaMenu.SetFocus;
      Exit;
    end;
  if (edTherapist.Text = '') then
    begin
      ShowMessage('Maaf Therapist Belum Dipilih');
      edTherapist.SetFocus;
      Exit;
    end;
  if (edSelectRoom.Text = '') then
    begin
      ShowMessage('Maaf Ruangan Belum Dipilih');
      edSelectRoom.SetFocus;
      Exit;
    end;

  qryMenu2.Close;
  qryMenu2.SQL.Clear;
  qryMenu2.SQL.Add('select menu_id, harga, lama, disc_hh, disc_normal, harga_hh, harga_normal from ' +
      'main_menu where menu_id = ''' + VarToStr(edNamaMenu.EditValue) + '''');
  qryMenu2.Open;

   edLama.EditValue := qryMenu2.Fields[2].AsInteger;
   edHarga.EditValue := qryMenu2.Fields[1].AsFloat;
   if (PACKETHH = True) then
     begin
       edDiscount.EditValue := qryMenu2.Fields[3].AsFloat;
       edNett.EditValue := qryMenu2.Fields[5].AsFloat;
       strPacket := 'Y';
     end
   else if (PACKETHH = False) then
     begin
       edDiscount.EditValue := qryMenu2.Fields[4].AsFloat;
       edNett.EditValue := qryMenu2.Fields[6].AsFloat;
       strPacket := 'N';
     end;

   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd', varTanggal) + '@' + FormatDateTime('hh:mm:ss', varJam);



   if (rbGender.ItemIndex = 0) then gender := 'M'
   else if (rbGender.ItemIndex = 1) then gender := 'F';

   if (rbTypeJasa.ItemIndex = 0) then strTypeJasa := 'RF'
   else if (rbTypeJasa.ItemIndex = 1) then strTypeJasa := 'BM';

   jSonItem :=  XSuperObject.SO('{}');
   jSonItem.S['byrequest'] := VarToStr(ckByRequest.EditValue);
   jSonItem.S['typejasa'] := strTypeJasa;
   jSonItem.S['user'] := frmMain.USERAPPS;
   jSonItem.D['date'] := varTanggal;
   jSonItem.Time['time'] := varJam;
   jSonItem.Time['pickup'] := varJam;
   strJson := jSonItem.AsJSON(False, False);
   qryExec.SQL.Clear;
   qryExec.SQL.Add('INSERT INTO trans_detail VALUES(' +
                    '''' + '' + ''', ' +
                    '''' + lblKodeTrans.Caption + ''', ' +
                    '''' + FormatDateTime('yyyy-MM-dd', varTanggal) + ''', ' +
                    '''' + 'BJ' + ''', ' +
                    QuotedStr(vartostr(edNamaMenu.EditValue)) + ',' +
                    QuotedStr(edNamaMenu.Text) + ',' +
                    '''' + FormatDateTime('HH:MM:ss', varJam) + ''', ' +
                    '''' + FormatDateTime('HH:MM:ss', varJam) + ''', ' +
                    '''' + vartostr(edHarga.EditValue) + ''', ' +
                    '''' + '0' + ''', ' +
                    '''' + vartostr(edDiscount.EditValue) + ''', ' +
                    '''' + vartostr(edNett.EditValue) + ''', ' +
                    '''' + edTherapist.Text + ''', ' +
                    '''' + edSelectRoom.Text + ''', ' +
                    '''' + '1' + ''', ' +
                    '''' + edAroma.Text + ''', ' +
                    '''' + vartostr(edLama.EditValue) + ''', ' +
                    '''' + '(NONE)' + ''', ' +
                    QuotedStr(edCustName.Text) + ',' +
                    '''' + strPacket + ''', ' +
                    '''' + '(NONE)' + ''', ' +
                    '''' + 'N' + ''', ' +
                    QuotedStr(keterangan) + ');');
   qryExec.ExecSQL;

   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select sum(lama) from trans_detail where id_trans = ''' +
       lblKodeTrans.Caption + '''');
   qrySearch.Open;
   totLama := qrySearch.Fields[0].AsInteger;

   qryMenu2.Close;
   qryMenu2.SQL.Clear;
   qryMenu2.SQL.Add('select sum(subtotal) from trans_detail where id_trans = ''' +
       lblKodeTrans.Caption + '''');
   qryMenu2.Open;
   subtotal := qryMenu2.Fields[0].AsFloat;

   wStart := varJam;
   wEnd := IncMinute(wStart, totLama);

   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
      'gender = ''' + gender + ''',' +
      'nama_customer = ' + QuotedStr(edCustName.Text) + ',' +
      'start_time = ''' + FormatDateTime('hh:mm:ss', wStart) + ''',' +
      'end_time = ''' + FormatDateTime('hh:mm:ss', wEnd) + ''',' +
      'room_id = ''' + edSelectRoom.Text + ''',' +
      'subtotal = ''' + FloatToStr(subtotal) + ''',' +
      'therapist_id = ''' + edTherapist.Text + ''',' +
      'promo = ''' + 'S' + ''',' +
      'notes = ' + QuotedStr(strJson) + ',' +
      'cabang = ' + QuotedStr(keterangan) + ' ' +
      'where trans_id = ''' + lblKodeTrans.Caption + ''';');
   qryExec.ExecSQL;
   frmPosTransMain.qryMaster.Refresh;
   frmPosTransMain.gtbMaster.DataController.Refresh;
   frmPosTransMain.qryDetails.Refresh;
   frmPosTransMain.tbDetails.DataController.Refresh;
   frmPosTransMain.gtbMaster.DataController.GotoFirst;
   frmPosTransMain.gtbMaster.DataController.Search.Locate(frmPosTransMain.gtbMastertrans_id.Index, lblKodeTrans.Caption);
   frmNewMenuTrans.Close;
end;

procedure TfrmNewMenuTrans.btnGuestOnlyClick(Sender: TObject);
var
  gender, keterangan, strJson : String;
  jSonItem : XSuperObject.ISuperObject;

begin
   jSonItem :=  XSuperObject.SO('{}');
   jSonItem.S['byrequest'] := 'N';
   jSonItem.S['typejasa'] := 'PR';
   jSonItem.S['user'] := frmMain.USERAPPS;
   jSonItem.D['date'] := varTanggal;
   jSonItem.Time['time'] := varJam;
   jSonItem.Time['pickup'] := varJam;
   strJson := jSonItem.AsJSON(False, False);

   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd', varTanggal) + '@' + FormatDateTime('hh:mm:ss', varJam);
   if (rbGender.ItemIndex = 0) then gender := 'M'
   else if (rbGender.ItemIndex = 1) then gender := 'F';
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
      'gender = ''' + gender + ''',' +
      'nama_customer = ' + QuotedStr(edCustName.Text) + ',' +
      'promo = ''' + 'S' + ''',' +
      'notes = ' + QuotedStr(strJson) + ',' +
      'cabang = ' + QuotedStr(keterangan) + ' ' +
      'where trans_id = ''' + lblKodeTrans.Caption + '''');
   qryExec.ExecSQL;
   frmPosTransMain.qryMaster.Refresh;
   frmPosTransMain.gtbMaster.DataController.Refresh;
   frmPosTransMain.qryDetails.Refresh;
   frmPosTransMain.tbDetails.DataController.Refresh;
   frmNewMenuTrans.Close;
end;

procedure TfrmNewMenuTrans.edAromaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
     begin
       //edNett.EditValue := edHarga.EditValue - (edHarga.EditValue * edDiscount.EditValue / 100);
       btnFinish.SetFocus;
     end;
end;

procedure TfrmNewMenuTrans.edDiscountKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
     begin
       edNett.EditValue := edHarga.EditValue - (edHarga.EditValue * edDiscount.EditValue / 100);
       btnFinish.SetFocus;
     end;
end;

procedure TfrmNewMenuTrans.edNamaMenuKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
     begin
       qryMenu2.Close;
       qryMenu2.SQL.Clear;
       qryMenu2.SQL.Add('select menu_id, harga, lama, disc_hh, disc_normal, harga_hh, harga_normal from ' +
            'main_menu where menu_id = ''' + VarToStr(edNamaMenu.EditValue) + '''');
       qryMenu2.Open;


       edLama.EditValue := qryMenu2.Fields[2].AsInteger;
       edHarga.EditValue := qryMenu2.Fields[1].AsFloat;
       if (PACKETHH = True) then
         begin
           edDiscount.EditValue := qryMenu2.Fields[3].AsFloat;
           edNett.EditValue := qryMenu2.Fields[5].AsFloat;
         end
       else if (PACKETHH = False) then
         begin
           edDiscount.EditValue := qryMenu2.Fields[4].AsFloat;
           edNett.EditValue := qryMenu2.Fields[6].AsFloat;
         end;

       edTherapist.SetFocus;
     end;

end;

procedure TfrmNewMenuTrans.edNamaMenuPropertiesEditValueChanged(
  Sender: TObject);
begin
       qryMenu2.Close;
       qryMenu2.SQL.Clear;
       qryMenu2.SQL.Add('select menu_id, harga, lama, disc_hh, disc_normal, harga_hh, harga_normal from ' +
            'main_menu where menu_id = ''' + VarToStr(edNamaMenu.EditValue) + '''');
       qryMenu2.Open;


       edLama.EditValue := qryMenu2.Fields[2].AsInteger;
       edHarga.EditValue := qryMenu2.Fields[1].AsFloat;
       if (PACKETHH = True) then
         begin
           edDiscount.EditValue := qryMenu2.Fields[3].AsFloat;
           edNett.EditValue := qryMenu2.Fields[5].AsFloat;
         end
       else if (PACKETHH = False) then
         begin
           edDiscount.EditValue := qryMenu2.Fields[4].AsFloat;
           edNett.EditValue := qryMenu2.Fields[6].AsFloat;
         end;
end;

procedure TfrmNewMenuTrans.edSelectRoomKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
     begin
       edAroma.SetFocus;
     end;
end;

procedure TfrmNewMenuTrans.edSelectTRPropertiesEditValueChanged(
  Sender: TObject);
begin
   edNamaTR.Text := edSelectTR.Text;
   edTherapist.Text := vartostr(edSelectTR.EditValue);
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select available_tr.status from available_tr where available_tr.id_therapist = ''' +
           edTherapist.Text + '''');
   qrySearch.Open;
   lblStatus.Caption := qrySearch.Fields[0].AsString;
end;

procedure TfrmNewMenuTrans.edTherapistKeyPress(Sender: TObject; var Key: Char);
var
  strTr : String;
  panjang : Integer;
begin
   if (key = #13) then
     begin
       //ShowMessage(TYPETR);
       if (rbTypeJasa.ItemIndex = 0) then TYPETR := 'TR'
       else if (rbTypeJasa.ItemIndex = 1) then TYPETR := 'TB';
       {if (edTypeJasa.Text = 'RF') then TYPETR := 'TR' else
       if (edTypeJasa.Text = 'BM') then TYPETR := 'TB';}

       if (edTherapist.Text = '') then
        begin
            ShowMessage('Insert at least 1 Char ID Therapist');
        end
       else if (edTherapist.Text <> '') then
        begin
          strTr := edTherapist.Text;
          panjang := Length(edTherapist.Text);
          case panjang of
            1 : begin
                   edTherapist.Text := '0000' + strTr;
                end;
            2 : begin
                   edTherapist.Text := '000' + strTr;
                end;
            3 : begin
                   edTherapist.Text := '00' + strTr;
                end;
            4 : begin
                   edTherapist.Text := '0' + strTr;
                end;
            5 : begin
                   edTherapist.Text := strTr;
                end;
          end;
          qryMenu2.Close;
          qryMenu2.SQL.Clear;
          qryMenu2.SQL.Add('select karyawan_id, nama_lengkap, departemen_id ' +
                  'from karyawan where karyawan_id = ''' + edTherapist.Text + '''');
          qryMenu2.Open;
          if (qryMenu2.Fields[2].AsString <> TYPETR) then
             begin
               ShowMessage('Maaf Departemen Tidak Sama');
               edTherapist.SetFocus;
               edTherapist.SelectAll;
               Exit;
             end;
           edNamaTR.Text := qryMenu2.Fields[1].AsString;
           {qryRoom.Close;
           qryRoom.SQL.Clear;
           qryRoom.SQL.Add('select ruangan_id from ruangan where jenis_jasa = ''' +
                   edTypeJasa.Text + '''');
           qryRoom.Open;}
           qrySearch.Close;
           qrySearch.SQL.Clear;
           qrySearch.SQL.Add('select available_tr.status from available_tr where available_tr.id_therapist = ''' +
                   edTherapist.Text + '''');
           qrySearch.Open;
           lblStatus.Caption := qrySearch.Fields[0].AsString;
           edSelectRoom.SetFocus;
        end;

     end;
end;


procedure TfrmNewMenuTrans.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'promo = ''' + 'S' + ''' ' +
       'where trans_id = ''' + lblKodeTrans.Caption + ''';');
   qryExec.ExecSQL;
   frmPosTransMain.qryMaster.Refresh;
   frmPosTransMain.gtbMaster.DataController.Refresh;
   frmPosTransMain.qryDetails.Refresh;
   frmPosTransMain.tbDetails.DataController.Refresh;
   qryMenu.Active := False;
   qryMenu1.Free;
   qryMenu2.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmNewMenuTrans.FormCreate(Sender: TObject);
begin
   qryMenu1 := TMyQuery.Create(Self);
   qryMenu1.Connection := DMDB.dbInternal;
   qryMenu1.SQL.Add('select * from empty_x');
   qryMenu1.Active := true;

   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from empty_x');
   qrySearch.Active := true;

   qryMenu2 := TMyQuery.Create(Self);
   qryMenu2.Connection := DMDB.dbInternal;
   qryMenu2.SQL.Add('select * from empty_x');
   qryMenu2.Active := true;

   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from empty_x');
   qryExec.Active := true;

   qryMenu.Active := True;
   qryRoom.Active := True;
   qryTherapist.Active := True;
   qryAroma.Active := True;
end;

procedure TfrmNewMenuTrans.rbTypeJasaPropertiesEditValueChanged(
  Sender: TObject);
begin
   edNamaMenu.ClearSelection;
   edNamaMenu.Clear;
   if (rbTypeJasa.ItemIndex = 0) then
     begin
        QryMenu.Close;
        QryMenu.SQL.Clear;
        QryMenu.SQL.Add('select menu_id, nama_menu from main_menu where jenis_jasa_id = ''' + 'RF' +
             ''' AND type_menu = ''' + 'BJ' +
             ''' AND aktif = ''' + 'Y' + ''' ORDER BY nama_menu ASC');
        QryMenu.Open;

        QryRoom.Close;
        QryRoom.SQL.Clear;
        QryRoom.SQL.Add('select ruangan_id from ruangan where jenis_jasa = ''' + 'RF' + ''' ORDER BY ruangan_id ASC');
        QryRoom.Open;

        qryTherapist.Close;
        qryTherapist.SQL.Clear;
        qryTherapist.SQL.Add('select idkaryawan, namakaryawan from ' +
                              'ben_hrd_karyawan_info where departemen = ''' + 'TR' + ''' and active = ''' + 'Y' +
                              ''' ORDER BY namakaryawan ASC');
        qryTherapist.Open;
     end
   else if (rbTypeJasa.ItemIndex = 1) then
     begin
       QryMenu.Close;
       QryMenu.SQL.Clear;
       QryMenu.SQL.Add('select menu_id, nama_menu from main_menu where jenis_jasa_id = ''' + 'BM' +
             ''' AND type_menu = ''' + 'BJ' +
             ''' AND aktif = ''' + 'Y' + ''' ORDER BY nama_menu ASC');
       QryMenu.Open;

       QryRoom.Close;
       QryRoom.SQL.Clear;
       QryRoom.SQL.Add('select ruangan_id from ruangan where jenis_jasa = ''' + 'BM' + ''' ORDER BY ruangan_id ASC');
       QryRoom.Open;

        qryTherapist.Close;
        qryTherapist.SQL.Clear;
        qryTherapist.SQL.Add('select idkaryawan, namakaryawan from ' +
                              'ben_hrd_karyawan_info where departemen = ''' + 'TB' + ''' and active = ''' + 'Y' +
                              ''' ORDER BY namakaryawan ASC');
        qryTherapist.Open;

        //select ruangan_id from ruangan where jenis_jasa = 'RF'
     end;
end;

end.
