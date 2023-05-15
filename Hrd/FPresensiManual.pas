unit FPresensiManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxSpinEdit,
  cxTimeEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, MyAccess;

type
  TfrmPresensiManual = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    edKode: TEdit;
    edID: TEdit;
    Label3: TLabel;
    edNama: TEdit;
    edTanggal: TcxDateEdit;
    edJam: TcxTimeEdit;
    Label5: TLabel;
    Label6: TLabel;
    btnFind: TButton;
    btnSimpan: TButton;
    btnCancel: TButton;
    Label7: TLabel;
    edKeterangan: TEdit;
    Button1: TButton;
    Label8: TLabel;
    edQuickSearch: TEdit;
    procedure btnFindClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edJamKeyPress(Sender: TObject; var Key: Char);
    procedure edKeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure edQuickSearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryExec, qryCari : TMyQuery;
  public
    { Public declarations }
    ISADMIN : Boolean;
  end;

var
  frmPresensiManual: TfrmPresensiManual;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterKaryawan;

procedure TfrmPresensiManual.btnCancelClick(Sender: TObject);
begin
  frmPresensiManual.Close;
end;

procedure TfrmPresensiManual.btnFindClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 2;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
      frmMasterKaryawan.Position := poDesktopCenter;
    end
  else if (frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 2;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
      frmMasterKaryawan.Position := poDesktopCenter;
    end;

end;

procedure TfrmPresensiManual.btnSimpanClick(Sender: TObject);
var
  strSync, keterangan : String;
begin
  keterangan := edKeterangan.Text + ' [Input By ' + UpperCase(frmMain.USERAPPS) +
              ' @ ' + FormatDateTime('dd/MMM/yyyy hh:mm', Now) + ']';
  qryExec.SQL.Clear;
  qryExec.SQL.Add('insert absen_harian values(' +
       '''' + '' + ''',' +
       '''' + edID.Text + ''',' +
       QuotedStr(edNama.Text) + ',' +
       '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
       '''' + FormatDateTime('hh:mm:ss', edJam.Time) + ''',' +
       '''' + 'MANUAL' + ''',' +
       QuotedStr(keterangan) + ');');
  {strSync :='insert absen_harian values(' +
       '''' + '' + ''',' +
       '''' + edID.Text + ''',' +
       QuotedStr(edNama.Text) + ',' +
       '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
       '''' + FormatDateTime('hh:mm:ss', edJam.Time) + ''',' +
       '''' + 'MANUAL' + ''',' +
       '''' + frmMain.USERAPPS + ''');';
  qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');}
  qryExec.ExecSQL;
  ShowMessage('Data Selesai Input');
  //frmPresensiManual.Close;
  edTanggal.Date := Date;
  edJam.Time := Time;
  edKode.Clear;
  edID.Clear;
  edNama.Clear;
  edKeterangan.Clear;
  edQuickSearch.SetFocus;
end;

procedure TfrmPresensiManual.edJamKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edKeterangan.SetFocus;
   
end;

procedure TfrmPresensiManual.edKeteranganKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then btnSimpan.SetFocus;
end;

procedure TfrmPresensiManual.edQuickSearchKeyPress(Sender: TObject;
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
         qryCari.Close;
         qryCari.SQL.Clear;
         qryCari.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen ' +
           'from ben_hrd_karyawan_info where idkaryawan = ' + QuotedStr(strSearch) +
           ' and active = ''' + 'Y' + '''');
         qryCari.Open;
         if (qryCari.IsEmpty) then
           begin
             ShowMessage('ID Finger Tidak Ditemukan !');
             Exit;
           end;
         edKode.Text := qryCari.Fields[0].AsString;
         edID.Text := qryCari.Fields[1].AsString;
         edNama.Text := qryCari.Fields[2].AsString;
         //ed := qryChange1.Fields[3].AsString;

         edQuickSearch.Clear;
         edTanggal.SetFocus;
     end;
end;

procedure TfrmPresensiManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryCari.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmPresensiManual.FormCreate(Sender: TObject);
begin
  edTanggal.Date := Date;
  edJam.Time := Time;

  qryCari := TMyQuery.Create(Self);
  qryCari.Connection := DMDB.dbInternal;
  qryCari.SQL.Add('select * from temptable');
  qryCari.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;
end;

end.
