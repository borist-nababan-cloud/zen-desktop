unit FMemberMasterAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, XSuperObject, XSuperJSON, Data.DB,
  DBAccess, MyAccess, MemDS, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxButtons, cxCalendar, strUtils, DateUtils, System.Threading, RegularExpressions,
  Vcl.ExtCtrls, DelphiZXingQRCode, MainSource, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdSMTPBase, IdSMTP, IdMessage, IdAttachment,IdAttachmentFile, IdMessageClient,
  IdEmailAddress;

type
  TfrmMemberMasterAdd = class(TForm)
    qryProvinsi: TMyQuery;
    dsQryProvinsi: TMyDataSource;
    memStruktur: TMemo;
    lblJudulAtas: TLabel;
    edScanMember: TcxTextEdit;
    Label1: TLabel;
    edNoKartu: TcxTextEdit;
    Label2: TLabel;
    edNama: TcxTextEdit;
    edProvinsi: TcxLookupComboBox;
    Label3: TLabel;
    qryKabupaten: TMyQuery;
    dsQryKabupaten: TMyDataSource;
    qryKecamatan: TMyQuery;
    dsQryKecamatan: TMyDataSource;
    qryKelurahan: TMyQuery;
    dsQryKelurahan: TMyDataSource;
    qryKodePos: TMyQuery;
    dsQryKodePos: TMyDataSource;
    Label4: TLabel;
    edKabupaten: TcxLookupComboBox;
    Label5: TLabel;
    edKecamatan: TcxLookupComboBox;
    Label6: TLabel;
    edKelurahan: TcxLookupComboBox;
    Label7: TLabel;
    edKodePos: TcxLookupComboBox;
    Label8: TLabel;
    edAlamat1: TcxTextEdit;
    edAlamat2: TcxTextEdit;
    Label9: TLabel;
    edHanphone: TcxTextEdit;
    Label10: TLabel;
    edFixLine: TcxTextEdit;
    Label11: TLabel;
    edEmail: TcxTextEdit;
    edTanggal: TcxDateEdit;
    Label12: TLabel;
    edTempatLahir: TcxTextEdit;
    btnSimpan: TcxButton;
    cxButton2: TcxButton;
    Label13: TLabel;
    edNoKTP: TcxTextEdit;
    edGender: TcxComboBox;
    Label14: TLabel;
    PaintBox1: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edScanMemberKeyPress(Sender: TObject; var Key: Char);
    procedure edProvinsiPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edProvinsiKeyPress(Sender: TObject; var Key: Char);
    procedure edKabupatenKeyPress(Sender: TObject; var Key: Char);
    procedure edKabupatenPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edKecamatanKeyPress(Sender: TObject; var Key: Char);
    procedure edKecamatanPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edKelurahanPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure btnSimpanClick(Sender: TObject);
    procedure edKelurahanKeyPress(Sender: TObject; var Key: Char);
    procedure edKodePosKeyPress(Sender: TObject; var Key: Char);
    procedure edAlamat1KeyPress(Sender: TObject; var Key: Char);
    procedure edAlamat2KeyPress(Sender: TObject; var Key: Char);
    procedure edHanphoneKeyPress(Sender: TObject; var Key: Char);
    procedure edFixLineKeyPress(Sender: TObject; var Key: Char);
    procedure edEmailKeyPress(Sender: TObject; var Key: Char);
    procedure edTempatLahirKeyPress(Sender: TObject; var Key: Char);
    procedure edTanggalKeyPress(Sender: TObject; var Key: Char);
    procedure edNoKTPKeyPress(Sender: TObject; var Key: Char);
    procedure edGenderKeyPress(Sender: TObject; var Key: Char);
    procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
    qryExec, qryCari, qrySearch : TMyQuery;
    QRCodeBitmap: TBitmap;
    procedure ResizeGambar;
  public
    { Public declarations }
    MemberCode : String;
    procedure CreateQRCode;
  end;

var
  frmMemberMasterAdd: TfrmMemberMasterAdd;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMemberMaster;

procedure TfrmMemberMasterAdd.btnSimpanClick(Sender: TObject);
var
  strJson, ConfigDir, namaFile, mainMail, mainMailPass, namaMember, alamatEmail,
  strMail : String;
  tglValid : TDate;
  jSonItem, jSonMail : XSuperObject.ISuperObject;
  isOkMail : Boolean;

  attachmentFiles, mBody: TStringList;
begin
  //ResizeGambar;
  ConfigDir := ExtractFilePath(Application.ExeName);
  namaFile := ConfigDir + 'qrcode\' + edNoKartu.Text + '.BMP';

  //attachmentFiles:= TStringList.Create;
  isOkMail := ValidateEmail(edEmail.Text);
  if (isOkMail = False) then
    begin
      ShowMessage('Invalid Email Address !!' + #13 +
                  'Please Check Your Mail Address !');
      edEmail.SelectAll;
      edEmail.SetFocus;
      Exit;
    end;

  qryExec.SQL.Clear;
  jSonItem :=  XSuperObject.SO('{}');
  jSonItem.S['provinsi'] := edProvinsi.Text;
  jSonItem.S['kabupaten'] := edKabupaten.Text;
  jSonItem.S['kecamatan'] := edKecamatan.Text;
  jSonItem.S['kelurahan'] := edKelurahan.Text;
  jSonItem.S['kodepos'] := edKodePos.Text;
  jSonItem.S['alamat1'] := edAlamat1.Text;
  jSonItem.S['alamat2'] := edAlamat2.Text;
  jSonItem.S['email'] := edEmail.Text;
  jSonItem.S['aktif'] := 'Y';
  strJson := jSonItem.AsJSON(False, False);
  if (btnSimpan.Tag = 1) then
    begin
         {Insert}
      tglValid := IncYear(Date, 2);
      qryExec.SQL.Add('insert into members values(' +
          QuotedStr(MemberCode) + ',' +
          '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd', tglValid) + ''',' +
          QuotedStr(edNama.Text) + ',' +
          QuotedStr(frmMain.APP_OUTLETID) + ',' +
          QuotedStr('KTP-SIM') + ',' +
          QuotedStr(edNoKTP.Text) + ',' +
          QuotedStr(edTempatLahir.Text) + ',' +
          '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
          QuotedStr(edGender.Text) + ',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          QuotedStr(strJson) + ',' +
          '''' + FloatToStr(0) + ''',' +
          '''' + 'PERSONAL' + ''',' +
          QuotedStr(edNoKartu.Text) + ',' +
          QuotedStr(edFixLine.Text) + ',' +
          QuotedStr(edHanphone.Text) + ');');
    end
  else if (btnSimpan.Tag = 2) then
    begin
         {Update}
       qryExec.SQL.Add('update members set ' +
          'nama_lengkap = ' + QuotedStr(edNama.Text) + ',' +
          'alamat = ' + QuotedStr(frmMain.APP_OUTLETID) + ',' +
          'id_identity = ' + QuotedStr(edNoKTP.Text) + ',' +
          'tempat_lahir = ' + QuotedStr(edTempatLahir.Text) + ',' +
          'tanggal_lahir = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
          'jenis_kelamin = ' + QuotedStr(edGender.Text) + ',' +
          'staff_id = ' + QuotedStr(frmMain.USERAPPS) + ',' +
          'notes = ' + QuotedStr(strJson) + ',' +
          'no_telepon = ' + QuotedStr(edFixLine.Text) + ',' +
          'no_handphone = ' + QuotedStr(edHanphone.Text) + ' ' +
          'where id_members = ''' + MemberCode + ''';');

    end;
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select kodepos from master_alamat where provinsi = ''' + edProvinsi.Text +
         ''' AND kabupaten = ''' + edKabupaten.Text + ''' AND kecamatan = ''' + edKecamatan.Text +
         ''' AND kelurahan = ''' + edKelurahan.Text + '''');
  qrySearch.Open;
  if (qrySearch.IsEmpty) then
      begin
        qryExec.SQL.Add('insert into master_alamat values(' +
            '''' + '' + ''',' +
            QuotedStr(edProvinsi.Text) + ',' +
            QuotedStr(edKabupaten.Text) + ',' +
            QuotedStr(edKecamatan.Text) + ',' +
            QuotedStr(edKelurahan.Text) + ',' +
            QuotedStr(edKodePos.Text) + ',' +
            '''' + '' + ''');');
      end;


  {SendMemberMail(const namaCnt: String; emailAddress,
  subject,body,strattachFiles: string);}

  qryExec.ExecSQL;
  TTask.Run(
              procedure
                begin
                   TThread.Synchronize(nil,
                      procedure
                      begin
                        frmMain.InsertMember(MemberCode);
                      end);
                end
             );

  {mBody := TStringList.Create;
  mBody.Add('Hello Healthiest Member,');
  mBody.Add('Your member account now is active with the following details :');
  mBody.Add('Name : ' + TitleCase(edNama.Text));
  mBody.Add('CARD NUMBER : ' + edNoKartu.Text);
  mBody.Add('Province : ' + edProvinsi.Text);
  mBody.Add('City : ' + edKabupaten.Text);
  mBody.Add('Address : ' + edAlamat1.Text + ' ' + edAlamat2.Text);
  mBody.Add('Postal Code : ' + edKodePos.Text);
  mBody.Add('Mobile Phone : ' + edHanphone.Text);
  mBody.Add('Date of Birth : ' + FormatDateTime('dd/MMM/yyyy', edTanggal.Date));
  mBody.Add('Your Password account is Your Birth Day Date with format YYYYMMDD');
  mBody.Add(#13);
  mBody.Add('Start from ZEN !');
  mBody.Add('Start from ZEN !');
  mPesan.Clear;
  mPesan.Text := mBody.Text;
  mBody.Free;
  //ShowMessage(mBody.Text);
  namaMember := edNama.Text;
  alamatEmail := edEmail.Text; }
  jSonMail :=  XSuperObject.SO('{}');
  jSonMail.S['NamaMember'] := edNama.Text;
  jSonMail.S['EmailMember'] := edEmail.Text;
  jSonMail.S['NoMember'] := edNoKartu.Text;
  jSonMail.S['KodeMember'] := MemberCode;
  strMail := jSonMail.AsJSON(False, False);

  qryExec.SQL.Clear;
  qryExec.SQL.Add('insert into logmain values(' +
                '''' + '' + ''',' +
                '''' + 'MM' + ''',' +
                QuotedStr(strMail) + ');');
  qryExec.ExecSQL;

  {TTask.Run(
            procedure
              begin
                 TThread.Synchronize(nil,
                    procedure
                    begin
                      frmMain.SendMemberMail(namaMember,alamatEmail,'Member Activated',frmMemberMasterAdd.mPesan.Text,namaFile);
                    end);
              end
           );}

   //mBody.Free;
   frmMemberMaster.qryListMember.Refresh;
   frmMemberMaster.gtbMember.DataController.Refresh;
   frmMemberMasterAdd.Close;
end;

procedure TfrmMemberMasterAdd.CreateQRCode;
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := LeftStr(MemberCode, 8);
    QRCode.Encoding := TQRCodeEncoding(0);
    QRCode.QuietZone := StrToIntDef('4', 4);
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
  finally
    QRCode.Free;
  end;
  PaintBox1.Repaint;
end;

procedure TfrmMemberMasterAdd.edAlamat1KeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edAlamat2.SetFocus;
end;

procedure TfrmMemberMasterAdd.edAlamat2KeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edHanphone.SetFocus;
end;

procedure TfrmMemberMasterAdd.edEmailKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edTempatLahir.SetFocus;
end;

procedure TfrmMemberMasterAdd.edFixLineKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edEmail.SetFocus;
end;

procedure TfrmMemberMasterAdd.edGenderKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then btnSimpan.SetFocus;
end;

procedure TfrmMemberMasterAdd.edHanphoneKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then edFixLine.SetFocus;
end;

procedure TfrmMemberMasterAdd.edKabupatenKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
      begin
        qryKecamatan.Close;
        qryKecamatan.SQL.Clear;
        qryKecamatan.SQL.Add('select kecamatan from master_alamat where provinsi = ''' +
                             edProvinsi.Text + ''' AND kabupaten = ''' + edKabupaten.Text +
                             ''' ORDER BY kecamatan ASC');
        qryKecamatan.Open;
        edKecamatan.SetFocus;
      end;
end;

procedure TfrmMemberMasterAdd.edKabupatenPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
    qryKecamatan.Close;
    qryKecamatan.SQL.Clear;
    qryKecamatan.SQL.Add('select kecamatan from master_alamat where provinsi = ''' +
                         edProvinsi.Text + ''' AND kabupaten = ''' + edKabupaten.Text +
                         ''' ORDER BY kecamatan ASC');
    qryKecamatan.Open;
end;

procedure TfrmMemberMasterAdd.edKecamatanKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
      begin
        qryKelurahan.Close;
        qryKelurahan.SQL.Clear;
        qryKelurahan.SQL.Add('select kelurahan from master_alamat where provinsi = ''' +
                             edProvinsi.Text + ''' AND kabupaten = ''' +
                             edKabupaten.Text + ''' AND kecamatan = ''' + edKecamatan.Text +
                             ''' ORDER BY kelurahan ASC');
        qryKelurahan.Open;
        edKelurahan.SetFocus;
      end;
end;

procedure TfrmMemberMasterAdd.edKecamatanPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
    qryKelurahan.Close;
    qryKelurahan.SQL.Clear;
    qryKelurahan.SQL.Add('select kelurahan from master_alamat where provinsi = ''' +
                         edProvinsi.Text + ''' AND kabupaten = ''' +
                         edKabupaten.Text + ''' AND kecamatan = ''' + edKecamatan.Text +
                         ''' ORDER BY kelurahan ASC');
    qryKelurahan.Open;
end;

procedure TfrmMemberMasterAdd.edKelurahanKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
     begin
        qryKodePos.Close;
        qryKodePos.SQL.Clear;
        qryKodePos.SQL.Add('select kodepos from master_alamat where provinsi = ''' +
                             edProvinsi.Text + ''' AND kabupaten = ''' +
                             edKabupaten.Text + ''' AND kecamatan = ''' +
                             edKecamatan.Text + ''' AND kelurahan = ''' + edKelurahan.Text +
                             ''' ORDER BY kodepos ASC');
        qryKodePos.Open;
        edKodePos.SetFocus;
     end;
end;

procedure TfrmMemberMasterAdd.edKelurahanPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
    qryKodePos.Close;
    qryKodePos.SQL.Clear;
    qryKodePos.SQL.Add('select kodepos from master_alamat where provinsi = ''' +
                         edProvinsi.Text + ''' AND kabupaten = ''' +
                         edKabupaten.Text + ''' AND kecamatan = ''' +
                         edKecamatan.Text + ''' AND kelurahan = ''' + edKelurahan.Text +
                         ''' ORDER BY kodepos ASC');
    qryKodePos.Open;
end;

procedure TfrmMemberMasterAdd.edKodePosKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then edAlamat1.SetFocus;
end;

procedure TfrmMemberMasterAdd.edNoKTPKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then edGender.SetFocus;
end;

procedure TfrmMemberMasterAdd.edProvinsiKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (key = #13) then
      begin
        qryKabupaten.Close;
        qryKabupaten.SQL.Clear;
        qryKabupaten.SQL.Add('select kabupaten from master_alamat where provinsi = ''' +
                             edProvinsi.Text + ''' ORDER BY kabupaten ASC');
        qryKabupaten.Open;
        edKabupaten.SetFocus;
      end;
end;

procedure TfrmMemberMasterAdd.edProvinsiPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  qryKabupaten.Close;
  qryKabupaten.SQL.Clear;
  qryKabupaten.SQL.Add('select kabupaten from master_alamat where provinsi = ''' +
                       edProvinsi.Text + ''' ORDER BY kabupaten ASC');
  qryKabupaten.Open;
end;

procedure TfrmMemberMasterAdd.edScanMemberKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
     begin
       qryCari.Close;
       qryCari.SQL.Clear;
       qryCari.SQL.Add('select id_members from members where id_members = ''' + edScanMember.Text + '''');
       qryCari.Open;
       if (NOT qryCari.IsEmpty) then
         begin
           edScanMember.Clear;
           ShowMessage('Data Member Sudah Ada');
           Exit;
         end;
       MemberCode := edScanMember.Text;
       edNoKartu.Text := LeftStr(MemberCode, 8);
       edScanMember.Clear;
       edNama.SetFocus;
       CreateQRCode;
     end;
end;

procedure TfrmMemberMasterAdd.edTanggalKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edNoKTP.SetFocus;
end;

procedure TfrmMemberMasterAdd.edTempatLahirKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then edTanggal.SetFocus;
end;

procedure TfrmMemberMasterAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryExec.Free;
   qryCari.Free;
   qrySearch.Free;
   Action := caFree;
end;

procedure TfrmMemberMasterAdd.FormCreate(Sender: TObject);
begin
    QRCodeBitmap := TBitmap.Create;
    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

    qryCari := TMyQuery.Create(Self);
    qryCari.Connection := DMDB.dbInternal;
    qryCari.SQL.Add('select * from temptable');
    qryCari.Active := true;

    qrySearch := TMyQuery.Create(Self);
    qrySearch.Connection := DMDB.dbInternal;
    qrySearch.SQL.Add('select * from temptable');
    qrySearch.Active := true;

    qryCari.Close;
    qryCari.SQL.Clear;
    qryCari.SQL.Add('SELECT * FROM information_schema.tables ' +
        'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
      'AND table_name = ' + QuotedStr('master_alamat'));
    qryCari.Open;
    if (qryCari.IsEmpty) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add(memStruktur.Text);
      qryExec.ExecSQL;
    end;

    qryProvinsi.Active := True;
    qryKabupaten.Active := True;
    qryKecamatan.Active := True;
    qryKelurahan.Active := True;
    qryKodePos.Active := True;
end;

procedure TfrmMemberMasterAdd.PaintBox1Paint(Sender: TObject);
var
  Scale: Double;
begin
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(Rect(0, 0, PaintBox1.Width, PaintBox1.Height));
  if ((QRCodeBitmap.Width > 0) and (QRCodeBitmap.Height > 0)) then
  begin
    if (PaintBox1.Width < PaintBox1.Height) then
    begin
      Scale := PaintBox1.Width / QRCodeBitmap.Width;
    end else
    begin
      Scale := PaintBox1.Height / QRCodeBitmap.Height;
    end;
    PaintBox1.Canvas.StretchDraw(Rect(0, 0, Trunc(Scale * QRCodeBitmap.Width), Trunc(Scale * QRCodeBitmap.Height)), QRCodeBitmap);
  end;
end;

procedure TfrmMemberMasterAdd.ResizeGambar;
var
   ConfigDir, namaFile : String;
   buffer: TBitmap;
begin
  buffer := TBitmap.Create;
  try
    buffer.SetSize(120, 120);
    buffer.Canvas.StretchDraw(Rect(0, 0, 120, 120), QRCodeBitmap);
    QRCodeBitmap.SetSize(120, 120);
    QRCodeBitmap.Canvas.Draw(0, 0, buffer);
  finally
    buffer.Free;
  end;
   ConfigDir := ExtractFilePath(Application.ExeName);
   namaFile := ConfigDir + 'qrcode\' + edNoKartu.Text + '.BMP';
   //ShowMessage(namaFile);
   QRCodeBitmap.SaveToFile(namaFile);
end;

end.
