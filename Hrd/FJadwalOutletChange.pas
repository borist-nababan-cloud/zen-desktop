unit FJadwalOutletChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DB,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, StdCtrls, cxSpinEdit, cxTimeEdit, ExtCtrls, DateUtils,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, MemDS, MyAccess;

type
  TfrmJadwalOutletChange = class(TForm)
    Label3: TLabel;
    Label1: TLabel;
    edKode: TEdit;
    edID: TEdit;
    edNama: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edTglMasuk: TcxDateEdit;
    Label5: TLabel;
    edKodeShift: TcxLookupComboBox;
    tblShift: TMyTable;
    dsTblShift: TDataSource;
    Label6: TLabel;
    edJMasuk: TcxTimeEdit;
    Label7: TLabel;
    Label8: TLabel;
    edTglKeluar: TcxDateEdit;
    Label9: TLabel;
    edJamKeluar: TcxTimeEdit;
    Button1: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    edKet: TEdit;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edKodeShiftPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    qryChange1, qryChange2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmJadwalOutletChange: TfrmJadwalOutletChange;

implementation

{$R *.dfm}

uses FdmDB, FMain, FJadwalOutlet;

procedure TfrmJadwalOutletChange.Button1Click(Sender: TObject);
var
  strSync : String;
begin
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update ben_hrd_jadwal_local set ' +
       'kodeshift = ''' + vartostr(edKodeShift.EditValue) + ''',' +
       'jmasuk = ''' + FormatDateTime('hh:mm:ss', edJMasuk.Time) + ''',' +
       'tglkeluar = ''' + FormatDateTime('yyyy-MM-dd', edTglKeluar.Date) + ''',' +
       'jkeluar = ''' + FormatDateTime('hh:mm:ss', edJamKeluar.Time) + ''',' +
       'notes = ' + QuotedStr(edKet.Text) + ', ' +
       'tagedit = ''' + 'E' + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
       'lastedituser = ''' + frmMain.USERAPPS + ''' ' +
       'where kodekaryawan = ''' + edKode.Text + ''' AND tglmasuk = ''' +
       FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''';');
   strSync := 'update ben_hrd_jadwal_local set ' +
       'kodeshift = ''' + vartostr(edKodeShift.EditValue) + ''',' +
       'jmasuk = ''' + FormatDateTime('hh:mm:ss', edJMasuk.Time) + ''',' +
       'tglkeluar = ''' + FormatDateTime('yyyy-MM-dd', edTglKeluar.Date) + ''',' +
       'jkeluar = ''' + FormatDateTime('hh:mm:ss', edJamKeluar.Time) + ''',' +
       'tagedit = ''' + 'E' + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
       'lastedituser = ''' + frmMain.USERAPPS + ''' ' +
       'where kodekaryawan = ''' + edKode.Text + ''' AND tglmasuk = ''' +
       FormatDateTime('yyyy-MM-dd', edTglMasuk.Date) + ''';';
   {DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMenuMain.USERAPP) + ',' +
          '''' + frmMenuMain.IDOUTLET + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');}
   qryExec.ExecSQL;
   ShowMessage('Data Berhasil Di Update');
   frmJadwalOutlet.btnSearch.Click;
   frmJadwalOutletChange.Close;
end;

procedure TfrmJadwalOutletChange.Button2Click(Sender: TObject);
begin
  frmJadwalOutletChange.Close;
end;

procedure TfrmJadwalOutletChange.edKodeShiftPropertiesEditValueChanged(
  Sender: TObject);
begin
   qryChange1.Close;
   qryChange1.SQL.Clear;
   qryChange1.SQL.Add('select jmasuk, jkeluar, overnight from ben_shift where autonum = ''' +
      vartostr(edKodeShift.EditValue) + '''');
   qryChange1.Open;
   if (qryChange1.Fields[2].AsString = 'Y') then
     edTglKeluar.Date := incDay(edTglMasuk.Date, 1)
   else edTglKeluar.Date := edTglMasuk.Date;
   edJMasuk.Time := qryChange1.Fields[0].AsDateTime;
   edJamKeluar.Time := qryChange1.Fields[1].AsDateTime;
end;

procedure TfrmJadwalOutletChange.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryChange1.Free;
  qryChange2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmJadwalOutletChange.FormCreate(Sender: TObject);
begin
  qryChange1 := TMyQuery.Create(Self);
  qryChange1.Connection := DMDB.dbInternal;
  qryChange1.SQL.Add('select * from temptable');
  qryChange1.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;


  qryChange2 := TMyQuery.Create(Self);
  qryChange2.Connection := DMDB.dbInternal;
  qryChange2.SQL.Add('select * from temptable');
  qryChange2.Active := true;
  tblShift.Active := True;
end;

end.
