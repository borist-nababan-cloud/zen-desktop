unit FTherapistStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MyAccess, cxGraphics,
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
  cxDataStorage, cxEdit, cxNavigator, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridLevel, cxGrid, Vcl.Menus, cxButtons,
  Vcl.ExtCtrls, cxTextEdit;

type
  TfrmTherapistStatus = class(TForm)
    lblJudulAtas: TLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvAbsen: TcxGridTableView;
    Timer1: TTimer;
    lblAutoRefresh: TLabel;
    btnRefresh: TcxButton;
    gtvAbsenIDTR: TcxGridColumn;
    gtvAbsenNamaTR: TcxGridColumn;
    gtvAbsenStatus: TcxGridColumn;
    gtvAbsenSpecs: TcxGridColumn;
    gtvAbsenGroup: TcxGridColumn;
    gtvAbsenNoUrut: TcxGridColumn;
    gtvAbsenTurun: TcxGridColumn;
    gtvAbsenNotes: TcxGridColumn;
    gtvAbsenDept: TcxGridColumn;
    cxButton2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRefreshClick(Sender: TObject);
    procedure gtvAbsenDeptGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure gtvAbsenSpecsGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure cxButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryCari, qryFind, qryExec : TMyQuery;
    TanggalServer : TDateTime;
    CNT_REFRESH : Integer;
  public
    { Public declarations }
  end;

var
  frmTherapistStatus: TfrmTherapistStatus;

implementation

{$R *.dfm}

uses FMain, FdmDB;

procedure TfrmTherapistStatus.btnRefreshClick(Sender: TObject);
var
  i, newRec: Integer;
  idkaryawan : String;
begin
  gtvAbsen.DataController.SelectAll;
  gtvAbsen.DataController.DeleteSelection;
  qrySearch.Close;
  qrySearch.SQL.Clear;
  qrySearch.SQL.Add('select idkaryawan, namakaryawan, departemen from ben_hrd_karyawan_info where departemen = ''' + 'TR' +
      ''' OR departemen = ''' + 'TB' + ''' AND active = ''' + 'Y' + ''' ORDER BY idkaryawan ASC');
  qrySearch.Open;
  qrySearch.First;
  for i := 0 to qrySearch.RecordCount -1 do
    begin
      idkaryawan := qrySearch.Fields[0].AsString;
      newRec := gtvAbsen.DataController.InsertRecord(gtvAbsen.DataController.RecordCount);
      gtvAbsen.DataController.SetValue(newRec, gtvAbsenIDTR.Index, qrySearch.Fields[0].AsString);
      gtvAbsen.DataController.SetValue(newRec, gtvAbsenNamaTR.Index, qrySearch.Fields[1].AsString);
      gtvAbsen.DataController.SetValue(newRec, gtvAbsenDept.Index, qrySearch.Fields[2].AsString);
      qryCari.Close;
      qryCari.SQL.Clear;
      qryCari.SQL.Add('select ngroup, noslot, status from ben_tr_status where idkaryawan = ''' + idkaryawan + '''');
      qryCari.Open;
      if (qryCari.IsEmpty) then
        begin
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenSpecs.Index, 'M');
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenGroup.Index, '999');
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenNoUrut.Index, '999');
        end
      else if (NOT qryCari.IsEmpty) then
        begin
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenSpecs.Index, qryCari.Fields[2].AsString);
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenGroup.Index, qryCari.Fields[0].AsString);
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenNoUrut.Index, qryCari.Fields[1].AsString);
        end;
      qryFind.Close;
      qryFind.SQL.Clear;
      qryFind.SQL.Add('select status from available_tr where id_therapist = ''' + idkaryawan + '''');
      qryFind.Open;
      if (qryFind.IsEmpty) then
        begin
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenGroup.Index, 'NOT AVAILABLE');
        end
      else if (NOT qryFind.IsEmpty) then
        begin
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenStatus.Index, qryFind.Fields[0].AsString);
        end;
      qryCari.Close;
      qryCari.SQL.Clear;
      qryCari.SQL.Add('select waktu from absen_harian where id_karyawan = ''' + idkaryawan +
          ''' AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', TanggalServer) + ''' ORDER BY waktu DESC');
      qryCari.Open;
      if (qryCari.IsEmpty) then
        begin
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenNotes.Index, '00:00:00');
        end
      else if (NOT qryCari.IsEmpty) then
        begin
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenNotes.Index, FormatDateTime('hh:mm:ss', qryCari.Fields[0].AsDateTime));
        end;

      qryFind.Close;
      qryFind.SQL.Clear;
      qryFind.SQL.Add('select count(therapist_id) from trans_master where tanggal = ''' +
        FormatDateTime('yyyy-MM-dd', TanggalServer) + ''' and therapist_id = ''' + idkaryawan + '''');
      qryFind.Open;
      if (qryFind.IsEmpty) then
        begin
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenTurun.Index, '0');
        end
      else if (NOT qryFind.IsEmpty) then
        begin
          gtvAbsen.DataController.SetValue(newRec, gtvAbsenTurun.Index, qryFind.Fields[0].AsInteger);
        end;
      gtvAbsen.DataController.PostEditingData;
      gtvAbsen.DataController.Post(True);
      qrySearch.Next;
      Application.ProcessMessages;
    end;
end;

procedure TfrmTherapistStatus.cxButton2Click(Sender: TObject);
var
  recSel : Integer;
  strStatus, idKaryawan, strAwal : String;
begin
  strStatus := 'NOT AVAILABLE';
  strAwal := 'NOT AVAILABLE';
  recSel := gtvAbsen.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  strAwal := VarToStr(gtvAbsen.DataController.GetValue(recSel, gtvAbsenStatus.Index));
  idKaryawan := VarToStr(gtvAbsen.DataController.GetValue(recSel, gtvAbsenIDTR.Index));
  if (strAwal = 'NOT AVAILABLE') then strStatus := 'AVAILABLE'
  else if (strAwal = 'AVAILABLE') then strStatus := 'NOT AVAILABLE';
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update available_tr set ' +
      'status = ''' + strStatus + ''',' +
      'tanggal = ''' + FormatDateTime('yyyy-MM-dd', TanggalServer) + ''' ' +
      'where id_therapist = ''' + idKaryawan + '''');
  qryExec.ExecSQL;
  btnRefresh.Click;
end;

procedure TfrmTherapistStatus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qrySearch.Free;
  qryCari.Free;
  qryFind.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmTherapistStatus.FormCreate(Sender: TObject);
begin
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

   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
   qrySearch.Open;
   TanggalServer := qrySearch.Fields[0].AsDateTime;
   CNT_REFRESH := 0;
end;

procedure TfrmTherapistStatus.gtvAbsenDeptGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  if (AText = 'TR') then AText := 'RF'
  else if (AText = 'TB') then AText := 'BM' ;
end;

procedure TfrmTherapistStatus.gtvAbsenSpecsGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  if (AText = 'M') then AText := 'MEDIUM'
  else if (AText = 'S') then AText := 'STRONG';
end;

procedure TfrmTherapistStatus.Timer1Timer(Sender: TObject);
begin
  CNT_REFRESH := CNT_REFRESH + 1;
  lblAutoRefresh.Caption := 'Refresh Data in ' + IntToStr(CNT_REFRESH) + ' second[s] of 60';
  if (CNT_REFRESH = 60) then
    begin
      btnRefresh.Click;
      CNT_REFRESH := 0;
    end;
end;

end.
