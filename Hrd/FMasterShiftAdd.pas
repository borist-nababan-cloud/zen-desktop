unit FMasterShiftAdd;

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
  dxSkinXmas2008Blue, cxCheckBox, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxTimeEdit, StdCtrls, DBAccess, DateUtils, MyAccess, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmMasterShiftAdd = class(TForm)
    edNamaShift: TEdit;
    Label1: TLabel;
    edJMasuk: TcxTimeEdit;
    Label2: TLabel;
    Label3: TLabel;
    edJKeluar: TcxTimeEdit;
    ckAktif: TcxCheckBox;
    Label4: TLabel;
    btnSave: TButton;
    btnCancel: TButton;
    btnUpdate: TButton;
    ckOver: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    qryAdd1, qryAdd2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmMasterShiftAdd: TfrmMasterShiftAdd;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterShift;

procedure TfrmMasterShiftAdd.btnCancelClick(Sender: TObject);
begin
   frmMasterShiftAdd.Close;
end;

procedure TfrmMasterShiftAdd.btnSaveClick(Sender: TObject);
var
  jKerja : Integer;
  strSync : String;
begin
  qryAdd1.Close;
  qryAdd1.SQL.Clear;
  qryAdd1.SQL.Add('select autonum from ben_shift where namashift = ' +
      QuotedStr(edNamaShift.Text));
  qryAdd1.Open;
  if (qryAdd1.IsEmpty) then
    begin
      if (ckOver.Checked = True) then
        begin
          jKerja := HoursBetween(edJKeluar.Time, edJMasuk.Time);
        end
      else if (ckOver.Checked = False) then
        begin
          jKerja := HoursBetween(edJMasuk.Time, edJKeluar.Time);
        end;
      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into ben_shift values(' +
          '''' + '' + ''',' +
          QuotedStr(edNamaShift.Text) + ',' +
          '''' + FormatDateTime('hh:mm:ss', edJMasuk.Time) + ''',' +
          '''' + FormatDateTime('hh:mm:ss', edJKeluar.Time) + ''',' +
          '''' + inttostr(jKerja) + ''',' +
          '''' + vartostr(ckOver.EditValue) + ''',' +
          '''' + vartostr(ckAktif.EditValue) + ''',' +
          '''' + '' + ''');');
     strSync := 'insert into ben_shift values(' +
          '''' + '' + ''',' +
          QuotedStr(edNamaShift.Text) + ',' +
          '''' + FormatDateTime('hh:mm:ss', edJMasuk.Time) + ''',' +
          '''' + FormatDateTime('hh:mm:ss', edJKeluar.Time) + ''',' +
          '''' + inttostr(jKerja) + ''',' +
          '''' + vartostr(ckOver.EditValue) + ''',' +
          '''' + vartostr(ckAktif.EditValue) + ''',' +
          '''' + '' + ''');';
      qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''');');
  qryExec.ExecSQL;
  ShowMessage('Shift Master Tersimpan !');
  frmMasterShift.tblShift.Refresh;
  frmMasterShift.gtbShift.DataController.Refresh;
  frmMasterShiftAdd.Close;
    end
  else if (NOT qryAdd1.IsEmpty) then
    begin
      ShowMessage('Nama Shift sudah ada !');
      Exit;
    end;
end;

procedure TfrmMasterShiftAdd.btnUpdateClick(Sender: TObject);
var
  jKerja : integer;
  strSync : String;
begin
  if (ckOver.Checked = True) then
    begin
      jKerja := HoursBetween(edJKeluar.Time, edJMasuk.Time);
    end
  else if (ckOver.Checked = False) then
    begin
      jKerja := HoursBetween(edJMasuk.Time, edJKeluar.Time);
    end;

  qryExec.SQL.Clear;
  qryExec.SQL.Add('update ben_shift set ' +
      'jmasuk = ''' + FormatDateTime('hh:mm:ss', edJMasuk.Time) + ''',' +
      'jkeluar = ''' + FormatDateTime('hh:mm:ss', edJKeluar.Time) + ''',' +
      'jamkerja = ''' + inttostr(jKerja) + ''',' +
      'overnight = ''' + vartostr(ckOver.EditValue) + ''', ' +
      'aktif = ''' + vartostr(ckAktif.EditValue) + ''' ' +
      'where namashift = ' + QuotedStr(edNamaShift.Text) + ';');

  strSync := 'update ben_shift set ' +
      'jmasuk = ''' + FormatDateTime('hh:mm:ss', edJMasuk.Time) + ''',' +
      'jkeluar = ''' + FormatDateTime('hh:mm:ss', edJKeluar.Time) + ''',' +
      'jamkerja = ''' + inttostr(jKerja) + ''',' +
      'overnight = ''' + vartostr(ckOver.EditValue) + ''', ' +
      'aktif = ''' + vartostr(ckAktif.EditValue) + ''' ' +
      'where namashift = ' + QuotedStr(edNamaShift.Text) + ';';

  qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMain.USERAPPS) + ',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''');');
  qryExec.ExecSQL;

  ShowMessage('Shift Master Tersimpan !');
  frmMasterShift.tblShift.Refresh;
  frmMasterShift.gtbShift.DataController.Refresh;
  frmMasterShiftAdd.Close;
end;

procedure TfrmMasterShiftAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryAdd1.Free;
  qryAdd2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmMasterShiftAdd.FormCreate(Sender: TObject);
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
