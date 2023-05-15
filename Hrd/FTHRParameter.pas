unit FTHRParameter;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DB, DBAccess, ExtCtrls, cxGroupBox, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxCalc, Menus, cxButtons,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, MyAccess, MemDS;

type
  TfrmTHRParameter = class(TForm)
    lblJudulForm: TLabel;
    qryKode: TMyQuery;
    dsQryKode: TDataSource;
    edKode: TcxLookupComboBox;
    Label1: TLabel;
    Bevel1: TBevel;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    edDepartemen: TcxLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    gtbListautonum: TcxGridDBColumn;
    gtbListkodethr: TcxGridDBColumn;
    gtbListidoutlet: TcxGridDBColumn;
    gtbListdepartemen: TcxGridDBColumn;
    gtbListlamakerja: TcxGridDBColumn;
    gtbListnilai: TcxGridDBColumn;
    gtbListaktif: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    edLama: TcxCalcEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edNilai: TcxCalcEdit;
    btnTambah: TcxButton;
    btnSetInaktif: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edKodePropertiesChange(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnSetInaktifClick(Sender: TObject);
  private
    { Private declarations }
    qryParam1, qryParam2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmTHRParameter: TfrmTHRParameter;

implementation

{$R *.dfm}

uses FdmDb, FMain;

procedure TfrmTHRParameter.btnSetInaktifClick(Sender: TObject);
var
   recSel, autonum : Integer;
begin
   recSel := gtbList.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then
     begin
       ShowMessage('Please Select Record');
       Exit;
     end;
   autonum := gtbList.DataController.GetValue(recSel, gtbListautonum.Index);
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update ben_thr_parameter set ' +
       'aktif = ''' + 'N' + ''', ' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where autonum = ''' + IntToStr(autonum) + '''');
   qryExec.ExecSQL;
  qryList.Close;
  qryList.SQL.Clear;
  qryList.SQL.Add('select * from ben_thr_parameter where kodethr = ''' +
      edKode.Text + ''' AND aktif = ''' + 'Y' + '''');
  qryList.Open;
  gtbList.DataController.Refresh;
  ShowMessage('Input data Selesai');

end;

procedure TfrmTHRParameter.btnTambahClick(Sender: TObject);
begin
  if (edKode.Text = '') then
     begin
       ShowMessage('Please Select Periode !');
       Exit;
     end;
  if (edNilai.EditValue <= 0) then Exit;
  if (edLama.EditValue <= 0) then Exit;
  qryParam1.Close;
  qryParam1.SQL.Clear;
  qryParam1.SQL.Add('select autonum from ben_thr_parameter where kodethr = ''' +
      edKode.Text + ''' AND departemen = ''' +
      vartostr(edDepartemen.EditValue) +
      ''' AND lamakerja = ''' + FloatToStr(edLama.EditValue) +
      ''' AND aktif = ''' + 'Y' + '''');
  qryParam1.Open;
  if (NOT qryParam1.IsEmpty) then
    begin
      ShowMessage('Parameter yang akan diinput sudah ada');
      Exit;
    end
  else if (qryParam1.IsEmpty) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into ben_thr_parameter values(' +
          '''' + '' + ''',' +
          '''' + edKode.Text + ''',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          '''' + vartostr(edDepartemen.EditValue) + ''',' +
          '''' + FloatToStr(edLama.EditValue) + ''',' +
          '''' + FloatToStr(edNilai.EditValue) + ''',' +
          '''' + 'Y' + ''',' +
          '''' + frmMain.USERAPPS + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
      qryExec.ExecSQL;
      qryList.Close;
      qryList.SQL.Clear;
      qryList.SQL.Add('select * from ben_thr_parameter where kodethr = ''' +
          edKode.Text + ''' AND aktif = ''' + 'Y' + '''');
      qryList.Open;
      gtbList.DataController.Refresh;
      ShowMessage('Input data Selesai');
      edDepartemen.Clear;
      edLama.EditValue := 0;
      edNilai.EditValue := 0;
    end;
end;

procedure TfrmTHRParameter.edKodePropertiesChange(Sender: TObject);
begin
  qryList.Close;
  qryList.SQL.Clear;
  qryList.SQL.Add('select * from ben_thr_parameter where kodethr = ''' +
      edKode.Text + ''' AND aktif = ''' + 'Y' + '''');
  qryList.Open;
  gtbList.DataController.Refresh;

end;

procedure TfrmTHRParameter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryParam1.Free;
  qryParam2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmTHRParameter.FormCreate(Sender: TObject);
begin
  qryParam1 := TMyQuery.Create(Self);
  qryParam1.Connection := DMDB.dbInternal;
  qryParam1.SQL.Add('select * from temptable');
  qryParam1.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryParam2 := TMyQuery.Create(Self);
  qryParam2.Connection := DMDB.dbInternal;
  qryParam2.SQL.Add('select * from temptable');
  qryParam2.Active := true;

  {qryParam2.Close;
  qryParam2.SQL.Clear;
  qryParam2.SQL.Add('SELECT * FROM information_schema.tables ' +
    'WHERE table_schema = ' + QuotedStr(frmMain.DBPOSNAME) +
    'AND table_name = ' + QuotedStr('ben_thr_parameter'));
  qryParam2.Open;
  if (qryParam2.IsEmpty) then
  begin
    qryExec.SQL.Clear;
    qryExec.SQL.Add(memStruktur.Text);
    qryExec.ExecSQL;
  end; }

  qryKode.Active := True;
  qryList.Active := True;
  tblDepartemen.Active := True;
end;

end.
