unit FPosMasterPayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxDBLookupComboBox,
  cxTextEdit, cxContainer, Vcl.Menus, Vcl.StdCtrls, DBAccess, MyAccess, MemDS,
  cxButtons, cxCheckBox, cxDropDownEdit, cxCalc, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxGroupBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, strUtils;

type
  TfrmPosMasterPayment = class(TForm)
    Label1: TLabel;
    cxGrid1: TcxGrid;
    gtbPromo: TcxGridDBTableView;
    gtbPromoautonum: TcxGridDBColumn;
    gtbPromokodecoa: TcxGridDBColumn;
    gtbPromoaktif: TcxGridDBColumn;
    gtbPromocabang: TcxGridDBColumn;
    gtbPromolastuser: TcxGridDBColumn;
    gtbPromolasteditdate: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edKodePayment: TcxTextEdit;
    edCoa: TcxLookupComboBox;
    edNamaPayment: TcxTextEdit;
    ckAktif: TcxCheckBox;
    btnSave: TcxButton;
    btnReset: TcxButton;
    btnNew: TcxButton;
    btnEdit: TcxButton;
    qryPayment: TMyQuery;
    dsQryPromo: TMyDataSource;
    qryCoa: TMyQuery;
    dsQryCoa: TMyDataSource;
    StrukturPayment: TMemo;
    gtbPromokodepayment: TcxGridDBColumn;
    gtbPromonamapayment: TcxGridDBColumn;
    ckEDC: TcxCheckBox;
    gtbPromousededc: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryFind, qryExec : TMyQuery;
    function CreateAutoNumb : String;
  public
    { Public declarations }
  end;

var
  frmPosMasterPayment: TfrmPosMasterPayment;

implementation

{$R *.dfm}

uses FdmDB, FMain;

{ TfrmPosMasterPayment }

procedure TfrmPosMasterPayment.btnEditClick(Sender: TObject);
var
   recSel : Integer;
   kodepromo : String;
begin
   recSel := gtbPromo.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  kodepromo := vartostr(gtbPromo.DataController.GetValue(recSel, gtbPromokodepayment.Index));
  qryFind.Close;
  qryFind.SQL.Clear;
  qryFind.SQL.Add('select kodepayment, kodecoa, namapayment, aktif, usededc from pos_master_payment ' +
      'where kodepayment = ''' + kodepromo + '''');
  qryFind.Open;
  edKodePayment.Text := qryFind.Fields[0].AsString;
  edCoa.EditValue := qryFind.Fields[1].AsString;
  edNamaPayment.Text := qryFind.Fields[2].AsString;
  ckAktif.EditValue := qryFind.Fields[3].AsString;
  ckEDC.EditValue := qryFind.Fields[4].AsString;
  edNamaPayment.SetFocus;
end;

procedure TfrmPosMasterPayment.btnNewClick(Sender: TObject);
begin
    edKodePayment.Text := CreateAutoNumb;
    edCoa.SetFocus;
end;

procedure TfrmPosMasterPayment.btnResetClick(Sender: TObject);
begin
   edKodePayment.Clear;
   edCoa.ClearSelection;
   edNamaPayment.Clear;
   ckAktif.Checked := True;
   ckEDC.Checked := False;
end;

procedure TfrmPosMasterPayment.btnSaveClick(Sender: TObject);
begin
  if (edKodePayment.Text = '') then
     begin
       ShowMessage('Please Create New Kode !!');
       Exit
     end;
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select kodepayment from pos_master_payment where kodepayment  = ''' +
      edKodePayment.Text + '''');
   qrySearch.Open;
   if (qrySearch.IsEmpty) then
     begin
       qryExec.SQL.Clear;
       qryExec.SQL.Add('insert into pos_master_payment values(' +
           '''' + '' + ''',' +
           '''' + edKodePayment.Text + ''',' +
           '''' + VarToStr(edCoa.EditValue) + ''',' +
           QuotedStr(edNamaPayment.Text) + ',' +
           '''' + VarToStr(ckAktif.EditValue) + ''',' +
           '''' + VarToStr(ckEDC.EditValue) + ''',' +
           '''' + frmMain.APP_OUTLETID + ''',' +
           QuotedStr(frmMain.USERAPPS) + ',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
       qryExec.ExecSQL;
       qryPayment.Refresh;
       gtbPromo.DataController.Refresh;
     end
   else if (NOT qrySearch.IsEmpty) then
     begin
       qryExec.SQL.Clear;
       qryExec.SQL.Add('update pos_master_payment set ' +
           'kodecoa = ''' + VarToStr(edCoa.EditValue) + ''',' +
           'namapayment = ' + QuotedStr(edNamaPayment.Text) + ',' +
           'aktif = ''' + VarToStr(ckAktif.EditValue) + ''',' +
           'usededc = ''' + VarToStr(ckEDC.EditValue) + ''',' +
           'cabang = ''' + frmMain.APP_OUTLETID + ''',' +
           'lastuser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
           'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
           'where kodepayment = ''' + edKodePayment.Text + '''');
       qryExec.ExecSQL;
       qryPayment.Refresh;
       gtbPromo.DataController.Refresh;
     end;
   ShowMessage('Update Finish');
   btnReset.Click;
end;

function TfrmPosMasterPayment.CreateAutoNumb: String;
var
  tmpID, strNewID : String;
  intLastID, intNewID : Integer;
begin
   tmpID := frmMain.APP_OUTLETID + '.' + 'MP.' + FormatDateTime('yyMM', Date) + '%';
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select kodepayment from pos_master_payment where kodepayment like ' + QuotedStr(tmpID) +
      ' ORDER by kodepayment ASC');
  qrySearch.Open;
  if (qrySearch.IsEmpty) then
    begin
      strNewID := frmMain.APP_OUTLETID + '.' + 'MP.' + FormatDateTime('yyMM', Date) + '001';
    end
  else
    begin
      qrySearch.Last;
      intLastID := StrToInt(RightStr(qrySearch.Fields[0].AsString, 3));
      intNewID := intLastID + 1;
      case Length(IntToStr(intNewID)) of
        1 : strNewID := frmMain.APP_OUTLETID + '.' + 'MP.' + FormatDateTime('yyMM', Date) + '00' + IntToStr(intNewID);
        2 : strNewID := frmMain.APP_OUTLETID + '.' + 'MP.' + FormatDateTime('yyMM', Date) + '0' + IntToStr(intNewID);
        3 : strNewID := frmMain.APP_OUTLETID + '.' + 'MP.' + FormatDateTime('yyMM', Date) + IntToStr(intNewID);
      end;
    end;
    Result := strNewID;
end;

procedure TfrmPosMasterPayment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryExec.Free;
  qrySearch.Free;
  qryFind.Free;
  Action := caFree;
end;

procedure TfrmPosMasterPayment.FormCreate(Sender: TObject);
begin
   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from temptable');
   qrySearch.Active := true;

   {qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;}

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.dbInternal;
   qryFind.SQL.Add('select * from temptable');
   qryFind.Active := true;

   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('pos_master_payment'));
   qryFind.Open;
   if (qryFind.IsEmpty) then
    begin
     qryExec.SQL.Clear;
     qryExec.SQL.Add(StrukturPayment.Text);
     qryExec.ExecSQL;
    end;

   qryCoa.Active := True;
   qryPayment.Active := True;
end;

end.
