unit FJadwalTetapAdd;

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
  dxSkinXmas2008Blue, StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DBAccess, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, MyAccess;

type
  TfrmJadwalTetapAdd = class(TForm)
    edNama: TEdit;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edSenin: TcxLookupComboBox;
    edSelasa: TcxLookupComboBox;
    Label5: TLabel;
    edRabu: TcxLookupComboBox;
    Label6: TLabel;
    edKamis: TcxLookupComboBox;
    Label7: TLabel;
    edJumat: TcxLookupComboBox;
    Label8: TLabel;
    edSabtu: TcxLookupComboBox;
    Label9: TLabel;
    edMinggu: TcxLookupComboBox;
    btnSimpan: TButton;
    btnUpdate: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUpdateClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    qryAdd1, qryAdd2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmJadwalTetapAdd: TfrmJadwalTetapAdd;

implementation

{$R *.dfm}

uses FdmDB, FMain, FJadwalTetap;

procedure TfrmJadwalTetapAdd.btnSimpanClick(Sender: TObject);
var
  strSync : String;
begin
   qryAdd1.Close;
   qryAdd1.SQL.Clear;
   qryAdd1.SQL.Add('select namajadwal from ben_hrd_jadwal_tetap where namajadwal = ' +
        QuotedStr(edNama.Text));
   qryAdd1.Open;
   if (qryAdd1.IsEmpty) then
     begin
       qryExec.SQL.Clear;
       qryExec.SQL.Add('insert into ben_hrd_jadwal_tetap values(' +
           '''' + '' + ''',' +
           QuotedStr(edNama.Text) + ',' +
           '''' + IntToStr(edSenin.EditValue) + ''',' +
           '''' + IntToStr(edSelasa.EditValue) + ''',' +
           '''' + IntToStr(edRabu.EditValue) + ''',' +
           '''' + IntToStr(edKamis.EditValue) + ''',' +
           '''' + IntToStr(edJumat.EditValue) + ''',' +
           '''' + IntToStr(edSabtu.EditValue) + ''',' +
           '''' + IntToStr(edMinggu.EditValue) + ''',' +
           '''' + 'Y' + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
             QuotedStr(frmMain.USERAPPS) + ',' +
           '''' + 'I' + ''');');
        strSync := 'insert into ben_hrd_jadwal_tetap values(' +
           '''' + '' + ''',' +
           QuotedStr(edNama.Text) + ',' +
           '''' + IntToStr(edSenin.EditValue) + ''',' +
           '''' + IntToStr(edSelasa.EditValue) + ''',' +
           '''' + IntToStr(edRabu.EditValue) + ''',' +
           '''' + IntToStr(edKamis.EditValue) + ''',' +
           '''' + IntToStr(edJumat.EditValue) + ''',' +
           '''' + IntToStr(edSabtu.EditValue) + ''',' +
           '''' + IntToStr(edMinggu.EditValue) + ''',' +
           '''' + 'Y' + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
             QuotedStr(frmMain.USERAPPS) + ',' +
           '''' + 'I' + ''');';
        qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''');');
        qryExec.ExecSQL;
       ShowMessage('Jadwal Telah Di Posting');
       frmJadwalTetap.tblJadwalTetap.Refresh;
       frmJadwalTetap.gtbJadwal.DataController.Refresh;
       frmJadwalTetapAdd.Close;
     end
   else if (NOT qryAdd1.IsEmpty) then
     begin
       ShowMessage('Data Jadwal Tetap sudah ada !');
     end;
end;

procedure TfrmJadwalTetapAdd.btnUpdateClick(Sender: TObject);
var
  strSync : String;
begin
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update ben_hrd_jadwal_tetap set ' +
        'smonday = ''' + IntToStr(edSenin.EditValue) + ''',' +
        'stues = ''' + IntToStr(edSelasa.EditValue) + ''',' +
        'swed = ''' + IntToStr(edRabu.EditValue) + ''',' +
        'sthur = ''' + IntToStr(edKamis.EditValue) + ''',' +
        'sfri = ''' + IntToStr(edJumat.EditValue) + ''',' +
        'ssat = ''' + IntToStr(edSabtu.EditValue) + ''',' +
        'ssun = ''' + IntToStr(edMinggu.EditValue) + ''',' +
        'isupload = ''' + 'Y' + ''',' +
        'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
        'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
        'tagedit = ''' + 'E' + ''' ' +
        'where namajadwal = ''' + edNama.Text + ''';');
   strSync := 'update ben_hrd_jadwal_tetap set ' +
        'smonday = ''' + IntToStr(edSenin.EditValue) + ''',' +
        'stues = ''' + IntToStr(edSelasa.EditValue) + ''',' +
        'swed = ''' + IntToStr(edRabu.EditValue) + ''',' +
        'sthur = ''' + IntToStr(edKamis.EditValue) + ''',' +
        'sfri = ''' + IntToStr(edJumat.EditValue) + ''',' +
        'ssat = ''' + IntToStr(edSabtu.EditValue) + ''',' +
        'ssun = ''' + IntToStr(edMinggu.EditValue) + ''',' +
        'isupload = ''' + 'Y' + ''',' +
        'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
        'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
        'tagedit = ''' + 'E' + ''' ' +
        'where namajadwal = ''' + edNama.Text + '''';
   qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''');');
   qryExec.ExecSQL;
       ShowMessage('Jadwal Telah Di Posting');
       frmJadwalTetap.tblJadwalTetap.Refresh;
       frmJadwalTetap.gtbJadwal.DataController.Refresh;
       frmJadwalTetapAdd.Close;
end;

procedure TfrmJadwalTetapAdd.Button1Click(Sender: TObject);
begin
   frmJadwalTetapAdd.Close;
end;

procedure TfrmJadwalTetapAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryAdd1.Free;
  qryAdd2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmJadwalTetapAdd.FormCreate(Sender: TObject);
begin
  qryAdd1 := TMyQuery.Create(Self);
  qryAdd1.Connection := DMDB.dbInternal;
  qryAdd1.SQL.Add('select * from temptable');
  qryAdd1.Active := true;

  qryAdd2 := TMyQuery.Create(Self);
  qryAdd2.Connection := DMDB.dbInternal;
  qryAdd2.SQL.Add('select * from temptable');
  qryAdd2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;
end;

end.
