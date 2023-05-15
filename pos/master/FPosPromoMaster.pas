unit FPosPromoMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, DBAccess, MyAccess, MemDS, cxContainer, Vcl.Menus, cxButtons,
  cxGroupBox, cxCheckBox, cxDropDownEdit, cxCalc, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, strUtils;

type
  TfrmPosPromoMaster = class(TForm)
    Label1: TLabel;
    qryPromo: TMyQuery;
    dsQryPromo: TMyDataSource;
    gtbPromo: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    StrukturCoa: TMemo;
    strukturPromo: TMemo;
    gtbPromoautonum: TcxGridDBColumn;
    gtbPromokodepromo: TcxGridDBColumn;
    gtbPromokodecoa: TcxGridDBColumn;
    gtbPromonamapromo: TcxGridDBColumn;
    gtbPromodiscbj: TcxGridDBColumn;
    gtbPromodiscba: TcxGridDBColumn;
    gtbPromodiscbp: TcxGridDBColumn;
    gtbPromoaktif: TcxGridDBColumn;
    gtbPromocabang: TcxGridDBColumn;
    gtbPromolastuser: TcxGridDBColumn;
    gtbPromolasteditdate: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    btnNew: TcxButton;
    btnEdit: TcxButton;
    Label2: TLabel;
    edKodePromo: TcxTextEdit;
    Label3: TLabel;
    qryCoa: TMyQuery;
    dsQryCoa: TMyDataSource;
    edCoa: TcxLookupComboBox;
    Label4: TLabel;
    edNamaPromo: TcxTextEdit;
    edBJ: TcxCalcEdit;
    Label5: TLabel;
    Label6: TLabel;
    edBA: TcxCalcEdit;
    Label7: TLabel;
    edBP: TcxCalcEdit;
    ckAktif: TcxCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnSave: TcxButton;
    btnReset: TcxButton;
    ckDiskPaket: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
    qryExec, qryCari, qryFind, qrySearch : TMyQuery;
    function CreateAutoNumb : String;
  public
    { Public declarations }
  end;

var
  frmPosPromoMaster: TfrmPosPromoMaster;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmPosPromoMaster.btnEditClick(Sender: TObject);
var
   recSel : Integer;
   kodepromo : String;
begin
  recSel := gtbPromo.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  kodepromo := vartostr(gtbPromo.DataController.GetValue(recSel, gtbPromokodepromo.Index));
  qryFind.Close;
  qryFind.SQL.Clear;
  qryFind.SQL.Add('select kodepromo, kodecoa, namapromo, discbj, discba, discbp, aktif, ispaket from pos_master_promo ' +
      'where kodepromo = ''' + kodepromo + '''');
  qryFind.Open;
  edKodePromo.Text := qryFind.Fields[0].AsString;
  edCoa.EditValue := qryFind.Fields[1].AsString;
  edNamaPromo.Text := qryFind.Fields[2].AsString;
  edBJ.EditValue := qryFind.Fields[3].AsFloat;
  edBA.EditValue := qryFind.Fields[4].AsFloat;
  edBP.EditValue := qryFind.Fields[5].AsFloat;
  ckAktif.EditValue := qryFind.Fields[6].AsString;
  ckDiskPaket.EditValue := qryFind.Fields[7].AsString;
  edNamaPromo.SetFocus;
end;

procedure TfrmPosPromoMaster.btnNewClick(Sender: TObject);
begin
   edKodePromo.Text := CreateAutoNumb;
end;

procedure TfrmPosPromoMaster.btnResetClick(Sender: TObject);
begin
   edKodePromo.Clear;
   edCoa.ClearSelection;
   edNamaPromo.Clear;
   edBJ.EditValue := 0;
   edBA.EditValue := 0;
   edBP.EditValue := 0;
   ckAktif.Checked := True;
end;

procedure TfrmPosPromoMaster.btnSaveClick(Sender: TObject);
begin
   if (edKodePromo.Text = '') then
     begin
       ShowMessage('Please Create New Kode !!');
       Exit
     end;
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select kodepromo from pos_master_promo where kodepromo  = ''' +
      edKodePromo.Text + '''');
   qrySearch.Open;
   if (qrySearch.IsEmpty) then
     begin
       qryExec.SQL.Clear;
       qryExec.SQL.Add('insert into pos_master_promo values(' +
           '''' + '' + ''',' +
           '''' + edKodePromo.Text + ''',' +
           '''' + VarToStr(edCoa.EditValue) + ''',' +
           QuotedStr(edNamaPromo.Text) + ',' +
           '''' + FloatToStr(edBJ.EditValue) + ''',' +
           '''' + FloatToStr(edBA.EditValue) + ''',' +
           '''' + FloatToStr(edBP.EditValue) + ''',' +
           '''' + VarToStr(ckDiskPaket.EditValue) + ''',' +
           '''' + VarToStr(ckAktif.EditValue) + ''',' +
           '''' + frmMain.APP_OUTLETID + ''',' +
           '''' + '' + ''',' +
           QuotedStr(frmMain.USERAPPS) + ',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
       qryExec.ExecSQL;
       qryPromo.Refresh;
       gtbPromo.DataController.Refresh;
     end
   else if (NOT qrySearch.IsEmpty) then
     begin
       qryExec.SQL.Clear;
       qryExec.SQL.Add('update pos_master_promo set ' +
           'kodecoa = ''' + VarToStr(edCoa.EditValue) + ''',' +
           'namapromo = ' + QuotedStr(edNamaPromo.Text) + ',' +
           'discbj = ''' + FloatToStr(edBJ.EditValue) + ''',' +
           'discba = ''' + FloatToStr(edBA.EditValue) + ''',' +
           'discbp = ''' + FloatToStr(edBP.EditValue) + ''',' +
           'ispaket = ''' + VarToStr(ckDiskPaket.EditValue) + ''',' +
           'aktif = ''' + VarToStr(ckAktif.EditValue) + ''',' +
           'cabang = ''' + frmMain.APP_OUTLETID + ''',' +
           'lastuser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
           'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
           'where kodepromo = ''' + edKodePromo.Text + '''');
       qryExec.ExecSQL;
       qryPromo.Refresh;
       gtbPromo.DataController.Refresh;
     end;
   ShowMessage('Update Finish');
   btnReset.Click;
end;

function TfrmPosPromoMaster.CreateAutoNumb: String;
var
  tmpID, strNewID : String;
  intLastID, intNewID : Integer;
begin
  tmpID := frmMain.APP_OUTLETID + '.' + 'MP.' + FormatDateTime('yyMM', Date) + '%';
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select kodepromo from pos_master_promo where kodepromo like ' + QuotedStr(tmpID) +
      ' ORDER by kodepromo ASC');
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

procedure TfrmPosPromoMaster.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryCari.Free;
   qryFind.Free;
   qrySearch.Free;
   Action := caFree;
end;

procedure TfrmPosPromoMaster.FormCreate(Sender: TObject);
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

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.dbInternal;
   qryFind.SQL.Add('select * from temptable');
   qryFind.Active := true;

   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('coa_detail'));
   qryFind.Open;
   if (qryFind.IsEmpty) then
    begin
     qryExec.SQL.Clear;
     qryExec.SQL.Add(StrukturCoa.Text);
     qryExec.ExecSQL;
    end;

   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('pos_master_promo'));
   qryFind.Open;
   if (qryFind.IsEmpty) then
    begin
     qryExec.SQL.Clear;
     qryExec.SQL.Add(strukturPromo.Text);
     qryExec.ExecSQL;
    end;

   qryPromo.Active := True;
   gtbPromo.DataController.Refresh;
   qryCoa.Active := True;

end;

end.
