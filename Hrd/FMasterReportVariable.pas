unit FMasterReportVariable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyAccess, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  cxGroupBox, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxButtons, cxCheckBox,
  StrUtils, DBAccess, MemDS, cxTextEdit;

type
  TfrmMasterReportVariable = class(TForm)
    lblJudulAtas: TLabel;
    strukturPromo: TMemo;
    gtbVariable: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    edKode: TEdit;
    Label2: TLabel;
    edGroup: TEdit;
    Label3: TLabel;
    edNama: TEdit;
    ckAktiif: TcxCheckBox;
    btnSave: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    tblVariable: TMyTable;
    dsTblVariable: TMyDataSource;
    gtbVariableautonum: TcxGridDBColumn;
    gtbVariablekodevariable: TcxGridDBColumn;
    gtbVariablegroupvariable: TcxGridDBColumn;
    gtbVariablenamavariable: TcxGridDBColumn;
    gtbVariableaktif: TcxGridDBColumn;
    gtbVariablelastedituser: TcxGridDBColumn;
    gtbVariablelasteditdate: TcxGridDBColumn;
    btnClear: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    qryExec, qrySearch, qryCari : TMyQuery;
    function CreateNewID : String;
  public
    { Public declarations }
  end;

var
  frmMasterReportVariable: TfrmMasterReportVariable;

implementation

{$R *.dfm}

uses FdmDB, FMain;

function TfrmMasterReportVariable.CreateNewID: String;
var
  tmpID, strNewID : String;
  intLastID, intNewID : Integer;
begin
  tmpID := 'VR.' + FormatDateTime('yyMM', Date) + '%';
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select kodevariable from ben_report_variable where kodevariable like ' + QuotedStr(tmpID) +
      ' ORDER by kodevariable ASC');
  qrySearch.Open;
  if (qrySearch.IsEmpty) then
    begin
      strNewID := 'VR.' + FormatDateTime('yyMM', Date) + '001';
    end
  else
    begin
      qrySearch.Last;
      intLastID := StrToInt(RightStr(qrySearch.Fields[0].AsString, 3));
      intNewID := intLastID + 1;
      case Length(IntToStr(intNewID)) of
        1 : strNewID := 'VR.' + FormatDateTime('yyMM', Date) + '00' + IntToStr(intNewID);
        2 : strNewID := 'VR.' + FormatDateTime('yyMM', Date) + '0' + IntToStr(intNewID);
        3 : strNewID := 'VR.' + FormatDateTime('yyMM', Date) + IntToStr(intNewID);
      end;
    end;
    Result := strNewID;
end;

procedure TfrmMasterReportVariable.btnClearClick(Sender: TObject);
begin
  edKode.Clear;
  edGroup.Clear;
  edNama.Clear;
  ckAktiif.Checked := True;
end;

procedure TfrmMasterReportVariable.btnSaveClick(Sender: TObject);
var
   btnSelected : Integer;
   kodeVar : String;
begin
   kodeVar := edKode.Text;
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select kodevariable from ben_report_variable where kodevariable = ''' +
       edKode.Text + '''');
   qrySearch.Open;
   if (qrySearch.IsEmpty) then
     begin
        qryExec.SQL.Clear;
        qryExec.SQL.Add('insert into ben_report_variable values(' +
            '''' + '' + ''',' +
            QuotedStr(edKode.Text) + ',' +
            QuotedStr(edGroup.Text) + ',' +
            QuotedStr(edNama.Text) + ',' +
            QuotedStr(VarToStr(ckAktiif.EditValue)) + ',' +
            QuotedStr(frmMain.USERAPPS) + ',' +
            QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ');');
        qryExec.ExecSQL;
     end
   else if (NOT qrySearch.IsEmpty) then
     begin
       btnSelected := MessageDlg('Apakah Anda akan mengupdate Data ' + kodeVar + '?',mtConfirmation,mbOKCancel, 0);
       if (btnSelected = mrCancel) then Exit;
       qryExec.SQL.Clear;
        qryExec.SQL.Add('update ben_report_variable set ' +
            'groupvariable = ' + QuotedStr(edGroup.Text) + ',' +
            'namavariable = ' + QuotedStr(edNama.Text) + ',' +
            'aktif = ' + QuotedStr(VarToStr(ckAktiif.EditValue)) + ',' +
            'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
            'lasteditdate = ' + QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ' ' +
            'where kodevariable = ''' + edKode.Text + '''');
        qryExec.ExecSQL;
     end;
   tblVariable.Refresh;
   gtbVariable.DataController.Refresh;
   ShowMessage('Update Data Finish');
   btnClear.Click;
end;

procedure TfrmMasterReportVariable.cxButton2Click(Sender: TObject);
begin
   edKode.Text := CreateNewID;
   edGroup.SetFocus;
end;

procedure TfrmMasterReportVariable.cxButton3Click(Sender: TObject);
var
  recSel : Integer;
  KodeVar : String;
begin
  recSel := gtbVariable.DataController.GetFocusedRecordIndex;
  KodeVar := vartostr(gtbVariable.DataController.GetValue(recSel, gtbVariablekodevariable.Index));
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select kodevariable, groupvariable, namavariable, aktif from ben_report_variable ' +
      'where kodevariable = ''' + KodeVar + '''');
  qrySearch.Open;
  edKode.Text := KodeVar;
  edGroup.Text := qrySearch.Fields[1].AsString;
  edNama.Text := qrySearch.Fields[2].AsString;
  ckAktiif.EditValue := qrySearch.Fields[3].AsString;
  edGroup.SetFocus;
end;

procedure TfrmMasterReportVariable.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryExec.Free;
   qrySearch.Free;
   qryCari.Free;
   Action := caFree;
end;

procedure TfrmMasterReportVariable.FormCreate(Sender: TObject);
begin
   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from temptable');
   qrySearch.Active := true;

   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_report_variable'));
   qryCari.Open;
   if (qryCari.IsEmpty) then
    begin
     qryExec.SQL.Clear;
     qryExec.SQL.Add(strukturPromo.Text);
     qryExec.ExecSQL;
    end;
   tblVariable.Active := True;
   tblVariable.Refresh;
   gtbVariable.DataController.Refresh;
end;

end.
