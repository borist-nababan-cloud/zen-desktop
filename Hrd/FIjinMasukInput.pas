unit FIjinMasukInput;

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
  dxSkinXmas2008Blue, DBAccess, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, DB, StdCtrls, cxTextEdit, cxMaskEdit,
  cxCalendar, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, MemDS, MyAccess,
  strUtils, DateUtils, cxSpinEdit, cxTimeEdit;

type
  TfrmIjinMasukInput = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edKode: TEdit;
    edID: TEdit;
    edNama: TEdit;
    edStart: TcxDateEdit;
    btnFind: TButton;
    btnSave: TButton;
    edKeterangan: TEdit;
    edTglPengajuan: TcxDateEdit;
    btnCancel: TButton;
    tblTag: TMyQuery;
    dsTblTag: TDataSource;
    Label6: TLabel;
    lblNoIjin: TLabel;
    edTagIjin: TcxTextEdit;
    Label7: TLabel;
    Label13: TLabel;
    edQuickSearch: TcxTextEdit;
    edJamPulang: TcxTimeEdit;
    procedure btnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure edTglPengajuanKeyPress(Sender: TObject; var Key: Char);
    procedure edStartKeyPress(Sender: TObject; var Key: Char);
    procedure edKeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure edTagIjinKeyPress(Sender: TObject; var Key: Char);
    procedure edEndKeyPress(Sender: TObject; var Key: Char);
    procedure edQuickSearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryLain1, qryLain2, qryExec : TMyQuery;
    procedure CetakData;
    procedure ClearForm;
  public
    { Public declarations }
    function CreateNoIjin : String;
  end;

var
  frmIjinMasukInput: TfrmIjinMasukInput;

implementation

{$R *.dfm}

uses FdmDB, FMain, FIjinLainCetak, FMasterKaryawan, FIjinPulangInput;

function TfrmIjinMasukInput.CreateNoIjin;
var
   tmpStrLembur, strNewNumb, strlastNumb : String;
   lastNumb, NewNumb : Integer;
begin
  tmpStrLembur := 'IM.' + frmMain.APP_OUTLETID + '.' + FormatDateTime('yyyyMM', edStart.Date) + '.' + '%';
   qryLain1.Close;
   qryLain1.SQL.Clear;
   qryLain1.SQL.Add('select nomorijin from ben_presensi_ijin where nomorijin like ' + QuotedStr(tmpStrLembur) +
       ' Order By nomorijin ASC');
   qryLain1.Open;
   qryLain1.Last;
   if (qryLain1.IsEmpty) then
       begin
         Result := 'IM.' + frmMain.APP_OUTLETID + '.' + FormatDateTime('yyyyMM', edStart.Date) + '.001';
       end
   else
       begin
           strlastNumb := RightStr(qryLain1.Fields[0].AsString, 3);
           lastNumb := StrToInt(strlastNumb);
           NewNumb := lastNumb + 1;
           case Length(IntToStr(NewNumb)) of
              1 : strNewNumb := '00' + IntToStr(NewNumb);
              2 : strNewNumb := '0' + IntToStr(NewNumb);
              3 : strNewNumb := IntToStr(NewNumb);
           end;
           Result := 'IM.' + frmMain.APP_OUTLETID + '.' + FormatDateTime('yyyyMM', edStart.Date) + '.' + strNewNumb;
       end;
end;

procedure TfrmIjinMasukInput.ClearForm;
begin
  edKode.Clear;
  edID.Clear;
  edNama.Clear;
  edTglPengajuan.Date := Date;
  edStart.Date := Date;
  edJamPulang.Time := Now;
  edKeterangan.Clear;
  lblNoIjin.Caption := '    ';
end;

procedure TfrmIjinMasukInput.CetakData;
begin
  Application.CreateForm(TfrmIjinLainCetak, frmIjinLainCetak);
   with frmIjinLainCetak do
     begin
       lblTanggal.Caption := FormatDateTime('yyyy-MM-dd', edTglPengajuan.Date);
       lblTglIjin.Caption := FormatDateTime('yyyy-MM-dd', edStart.Date);
       lblKode.Caption := edKode.Text + ' / ' + edID.Text;
       lblNama.Caption := edNama.Text;
       lblKet.Caption := edKeterangan.Text;
       //lblJumlahLembur.Caption := FloatToStr(edLama.EditValue) + ' Jam ';
       lblNoIjin.Caption := 'No Ijin : ' + lblNoIjin.Caption;
       lblJudul.Caption := 'SURAT ' + UpperCase(edTagIjin.Text);
     end;
   frmIjinLainCetak.qrpIjin.Preview;
end;

procedure TfrmIjinMasukInput.edEndKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then edKeterangan.SetFocus;
end;

procedure TfrmIjinMasukInput.edKeteranganKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edTagIjin.SetFocus;
end;

procedure TfrmIjinMasukInput.edQuickSearchKeyPress(Sender: TObject;
  var Key: Char);
var
  strSearch : String;
begin
   if (key = #13) then
        begin
          case Length(edQuickSearch.Text) of
           1 : strSearch := '0000' + edQuickSearch.Text;
           2 : strSearch := '000' + edQuickSearch.Text;
           3 : strSearch := '00' + edQuickSearch.Text;
           4 : strSearch := '0' + edQuickSearch.Text;
           5 : strSearch := edQuickSearch.Text;
          end;
         qryLain1.Close;
         qryLain1.SQL.Clear;
         qryLain1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen ' +
           'from ben_hrd_karyawan_info where idkaryawan = ' + QuotedStr(strSearch) +
           ' and active = ''' + 'Y' + '''');
         qryLain1.Open;
         if (qryLain1.IsEmpty) then
           begin
             ShowMessage('ID Finger Tidak Ditemukan !');
             Exit;
           end;
         edKode.Text := qryLain1.Fields[0].AsString;
         edID.Text := qryLain1.Fields[1].AsString;
         edNama.Text := qryLain1.Fields[2].AsString;
         //edDivisi.EditValue := qryLain1.Fields[3].AsString;
         edQuickSearch.Clear;

         edTglPengajuan.SetFocus;
     end;
end;

procedure TfrmIjinMasukInput.edTagIjinKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then btnSave.SetFocus;
end;

procedure TfrmIjinMasukInput.edStartKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edJamPulang.SetFocus;
end;

procedure TfrmIjinMasukInput.edTglPengajuanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then edStart.SetFocus;
end;

procedure TfrmIjinMasukInput.btnCancelClick(Sender: TObject);
begin
  frmIjinMasukInput.Close;
end;

procedure TfrmIjinMasukInput.btnFindClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.FormStyle := fsNormal;
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 21;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.Height := 590;
      frmMasterKaryawan.Width := 990;
      frmMasterKaryawan.Position := poDesktopCenter;
    end
  else if (frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.FormStyle := fsNormal;
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 21;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.Height := 590;
      frmMasterKaryawan.Width := 990;
      frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmIjinMasukInput.btnSaveClick(Sender: TObject);
var
  noIjin, strSync, keterangan, idkaryawan, kodekaryawan, ketFP : String;
  nHari : TDate;
  fpreal : TDateTime;
  jmlhHari, i : Integer;
begin
  noIjin := CreateNoIjin;
  lblNoIjin.Caption := noIjin;
  //Exit;
  keterangan := edKeterangan.Text + ' Pulang Pk. ' + FormatDateTime('hh:mm', edJamPulang.Time);
  fpreal := edStart.Date + edJamPulang.Time;
  ketFP := 'IM.' + noIjin;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('insert into ben_presensi_ijin values(' +
                  '''' + '' + ''',' +
                  '''' + lblNoIjin.Caption + ''',' +
                  '''' + FormatDateTime('yyyy-MM-dd', edTglPengajuan.Date) + ''',' +
                  '''' + edKode.Text + ''',' +
                  '''' + edID.Text + ''',' +
                  '''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''',' +
                  QuotedStr(keterangan) + ',' +
                  '''' + 'IM' + ''',' +
                  '''' + frmMain.USERAPPS + ''',' +
                  '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
  qryExec.SQL.Add('insert into absen_harian values(' +
                  '''' + '' + ''',' +
                  '''' + edID.Text + ''',' +
                  QuotedStr(edKeterangan.Text) + ',' +
                  '''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''',' +
                  '''' + FormatDateTime('hh:mm:ss', edJamPulang.Time) + ''',' +
                  '''' + ketFP + ''',' +
                  '''' + ketFP + ''');');
  qryExec.SQL.Add('insert into absen_harian_merge values(' +
                    '''' + '' + ''',' +
                    '''' + edKode.Text + ''',' +
                    '''' + edID.Text + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', fpreal) + ''',' +
                    '''' + ketFP + ''');');
  qryExec.ExecSQL;

   ShowMessage('Update data finish, Please manually Refresh Your List Form');

    CetakData;
    ClearForm;

end;

procedure TfrmIjinMasukInput.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryLain1.Free;
   qryLain2.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmIjinMasukInput.FormCreate(Sender: TObject);
begin
  qryLain1 := TMyQuery.Create(Self);
  qryLain1.Connection := DMDB.dbInternal;
  qryLain1.SQL.Add('select * from temptable');
  qryLain1.Active := true;

  qryLain2 := TMyQuery.Create(Self);
  qryLain2.Connection := DMDB.dbInternal;
  qryLain2.SQL.Add('select * from temptable');
  qryLain2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;


  edStart.Date := Date;
  edJamPulang.Time := Now;
  edTglPengajuan.Date := Date;

  tblTag.Active := True;
end;

end.
