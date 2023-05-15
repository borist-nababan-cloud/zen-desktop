unit FPeriodeUM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxTextEdit, cxCalendar, cxCalc, cxContainer, cxMaskEdit,
  cxDropDownEdit, DateUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  Vcl.ComCtrls, dxCore, cxDateUtils, MemDS, MyAccess;

type
  TfrmPeriodeUM = class(TForm)
    lblJudulForm: TLabel;
    memStruktur: TMemo;
    Label1: TLabel;
    edPeriode: TComboBox;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListautonum: TcxGridDBColumn;
    gtbListpayrollperiode: TcxGridDBColumn;
    gtbListtanggal: TcxGridDBColumn;
    gtbListvuangmakan: TcxGridDBColumn;
    gtbListnotes: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    Label2: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    Label3: TLabel;
    edVariable: TcxCalcEdit;
    Label4: TLabel;
    btnAdd: TButton;
    btnDelete: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure edPeriodeChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    qryPeriode1, qryPeriode2 : TMyQuery;
    procedure RefreshGrid;
  public
    { Public declarations }
  end;

var
  frmPeriodeUM: TfrmPeriodeUM;

implementation

{$R *.dfm}

uses FdmDB, FMenuMain;

procedure TfrmPeriodeUM.RefreshGrid;
begin
  qryList.Close;
  qryList.SQL.Clear;
  qryList.SQL.Add('select * from ben_payroll_tgl_um3 where payrollperiode = ''' +
     edPeriode.Text + '''');
  qryList.Open;
  gtbList.DataController.Refresh;
end;

procedure TfrmPeriodeUM.btnAddClick(Sender: TObject);
var
  i, nHari : Integer;
  tglPeriode : TDate;
begin
  nHari := DaysBetween(edStart.Date, edEnd.Date);
  tglPeriode := edStart.Date;
  DMDB.qryExec.SQL.Clear;
  for i := 0 to nHari do
    begin
      qryPeriode1.Close;
      qryPeriode1.SQL.Clear;
      qryPeriode1.SQL.Add('select autonum from ben_payroll_tgl_um3 ' +
         'where payrollperiode = ''' + edPeriode.Text + ''' AND ' +
         'tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglPeriode) + '''');
      qryPeriode1.Open;
      if (qryPeriode1.IsEmpty) then
        begin
          DMDB.qryExec.SQL.Add('insert into ben_payroll_tgl_um3 values(' +
             '''' + '' + ''',' +
             '''' + edPeriode.Text + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd', tglPeriode) + ''',' +
             '''' + IntToStr(edVariable.EditValue) + ''',' +
             '''' + '' + ''',' +
             QuotedStr(frmMenuMain.USERAPP) + ',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
        end
      else if (NOT qryPeriode1.IsEmpty) then
        begin
          DMDB.qryExec.SQL.Add('update ben_payroll_tgl_um3 set ' +
             'vuangmakan = ''' + IntToStr(edVariable.EditValue) + ''',' +
             'lastedituser = ' + QuotedStr(frmMenuMain.USERAPP) + ',' +
             'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
             'where autonum = ''' + IntToStr(qryPeriode1.Fields[0].AsInteger) + ''';');
        end;
      tglPeriode := IncDay(tglPeriode, 1);
    end;
    DMDB.qryExec.ExecSQL;
    RefreshGrid;
    ShowMessage('Insert Data Finish !');
end;

procedure TfrmPeriodeUM.btnDeleteClick(Sender: TObject);
var
  recSelect : Integer;
  tglDelete : TDate;
begin
  recSelect := gtbList.DataController.GetFocusedRecordIndex;
  tglDelete := VarToDateTime(gtbList.DataController.GetValue(recSelect, gtbListtanggal.Index));
  DMDB.qryExec.SQL.Clear;
  DMDB.qryExec.SQL.Add('delete from ben_payroll_tgl_um3 where ' +
     'payrollperiode = ''' + edPeriode.Text + ''' ' +
     'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', tglDelete) + '''');
  DMDB.qryExec.ExecSQL;
  RefreshGrid;
  ShowMessage('Deleting Selected Finish');
end;

procedure TfrmPeriodeUM.edPeriodeChange(Sender: TObject);
begin
   RefreshGrid;
end;

procedure TfrmPeriodeUM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryPeriode1.Free;
   qryPeriode2.Free;
   Action := caFree;
end;

procedure TfrmPeriodeUM.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  edStart.Date := Date;
  edEnd.Date := Date;
  qryPeriode1 := TMyQuery.Create(Self);
  qryPeriode1.Connection := DMDB.StoreDB;
  qryPeriode1.SQL.Add('select * from temptable');
  qryPeriode1.Active := True;

  qryPeriode2 := TMyQuery.Create(Self);
  qryPeriode2.Connection := DMDB.StoreDB;
  qryPeriode2.SQL.Add('select * from temptable');
  qryPeriode2.Active := True;

  qryPeriode1.Close;
  qryPeriode1.SQL.Clear;
  qryPeriode1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMenuMain.DBNAME) +
    'AND table_name = ' + QuotedStr('ben_payroll_tgl_um3'));
  qryPeriode1.Open;
  if (qryPeriode1.IsEmpty) then
  begin
    DMDB.qryExec.SQL.Clear;
    DMDB.qryExec.SQL.Add(memStruktur.Text);
    DMDB.qryExec.ExecSQL;
  end;

  qryPeriode2.Close;
  qryPeriode2.SQL.Clear;
  qryPeriode2.SQL.Add('select payrollperiode from ben_payroll_periode ' +
      'order by tglstart DESC LIMIT 12');
  qryPeriode2.Open;
  qryPeriode2.First;
  for i := 0 to qryPeriode2.RecordCount - 1 do
    begin
      edPeriode.Items.Add(qryPeriode2.Fields[0].AsString);
      qryPeriode2.Next;
    end;
  qryList.Active := True;
end;

end.
