unit FTHRCutOff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, StdCtrls, DB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Menus, cxButtons, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, MemDS, MyAccess;

type
  TfrmTHRCutOff = class(TForm)
    memStruktur: TMemo;
    lblJudulForm: TLabel;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    Label1: TLabel;
    edTanggal: TcxDateEdit;
    lblKode: TLabel;
    cxButton1: TcxButton;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListautonum: TcxGridDBColumn;
    gtbListkodethr: TcxGridDBColumn;
    gtbListtanggal: TcxGridDBColumn;
    gtbListaktif: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    btnSetInaktif: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure edTanggalPropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSetInaktifClick(Sender: TObject);
  private
    { Private declarations }
    qryCut1, qryCut2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmTHRCutOff: TfrmTHRCutOff;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmTHRCutOff.btnSetInaktifClick(Sender: TObject);
var
   recSel : Integer;
   kodeThr : String;
begin
   recSel := gtbList.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then
     begin
       ShowMessage('Please Select Record');
       Exit;
     end;
   kodeThr := VarToStr(gtbList.DataController.GetValue(recSel, gtbListkodethr.Index));
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update ben_thr_periode set ' +
       'aktif = ''' + 'N' + ''', ' +
       'lastedituser = ''' + frmMain.USERAPPS + ''',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
       'where kodethr = ''' + kodeThr + '''');
   qryExec.ExecSQL;
   qryList.Refresh;
   gtbList.DataController.Refresh;
   ShowMessage('Update Data Finish !');
end;

procedure TfrmTHRCutOff.cxButton1Click(Sender: TObject);
begin
  qryCut1.Close;
  qryCut1.SQL.Clear;
  qryCut1.SQL.Add('select kodethr from ben_thr_periode where kodethr = ''' +
      lblKode.Caption + ''' AND aktif = ''' + 'Y' + '''');
  qryCut1.Open;
  if (NOT qryCut1.IsEmpty) then
    begin
       ShowMessage('Kode THR ' + lblKode.Caption + ' Sudah Ada');
       Exit;
    end
  else if (qryCut1.IsEmpty) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into ben_thr_periode values(' +
          '''' + '' + ''',' +
          '''' + lblKode.Caption + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
          '''' + 'Y' + ''',' +
          '''' + frmMain.USERAPPS + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
      qryExec.ExecSQL;
      qryList.Active := True;
      qryList.Refresh;
      gtbList.DataController.Refresh;
      ShowMessage('Insert Data Finish !');
    end;
end;

procedure TfrmTHRCutOff.edTanggalPropertiesChange(Sender: TObject);
begin
     lblKode.Caption := 'THR.' + frmMain.APP_OUTLETID + '.' + FormatDateTime('yyyy', edTanggal.Date) +
          '.' + FormatDateTime('MM', edTanggal.Date);
end;

procedure TfrmTHRCutOff.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryCut1.Free;
  qryCut2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmTHRCutOff.FormCreate(Sender: TObject);
begin
  qryCut1 := TMyQuery.Create(Self);
  qryCut1.Connection := DMDB.dbInternal;
  qryCut1.SQL.Add('select * from temptable');
  qryCut1.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryCut2 := TMyQuery.Create(Self);
  qryCut2.Connection := DMDB.dbInternal;
  qryCut2.SQL.Add('select * from temptable');
  qryCut2.Active := true;

  qryCut2.Close;
  qryCut2.SQL.Clear;
  qryCut2.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_thr_periode'));
  qryCut2.Open;
  if (qryCut2.IsEmpty) then
  begin
    qryExec.SQL.Clear;
    qryExec.SQL.Add(memStruktur.Text);
    qryExec.ExecSQL;
  end;

  qryList.Active := True;
  edTanggal.Date := Date;
end;

end.
