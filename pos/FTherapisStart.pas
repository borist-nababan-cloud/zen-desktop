unit FTherapisStart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyAccess, cxGraphics, cxControls,
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
  cxDataStorage, cxEdit, cxNavigator, cxTextEdit, Vcl.ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.Menus, cxButtons, XSuperJSON, XSuperObject;

type
  TfrmTherapisStart = class(TForm)
    lblJudulAtas: TLabel;
    Label1: TLabel;
    lblServerDate: TLabel;
    lblLastCheck: TLabel;
    cxGrid1: TcxGrid;
    gtvCall: TcxGridBandedTableView;
    gtvCallTRID: TcxGridBandedColumn;
    gtvCallRoomID: TcxGridBandedColumn;
    gtvCallCustomer: TcxGridBandedColumn;
    gtvCallTransID: TcxGridBandedColumn;
    gtvCallDetails: TcxGridBandedColumn;
    gtvCallAdd: TcxGridBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    Timer1: TTimer;
    cxButton1: TcxButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    SERVER_TIME : TDateTime;
    JAM_CEK_LAST : TTime;
    CNT_CALL : Integer;
    qryTC1, qryTC2, qryCari, qryExec : TMyQuery;
    voice: OLEVariant;
    procedure CekNewTR;
    procedure CallTR(Const idTR : String; idRoom : String);
    procedure CariDetails(Const NewRecord : Integer; idTrans : String);
    procedure InsertGrid;
  public
    { Public declarations }
  end;

var
  frmTherapisStart: TfrmTherapisStart;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmTherapisStart.CallTR(const idTR: String; idRoom: String);
begin

end;

procedure TfrmTherapisStart.CariDetails(const NewRecord: Integer;
  idTrans: String);
begin

end;

procedure TfrmTherapisStart.CekNewTR;
var
  i, newRec, recSel, j, k: Integer;
  noTrans, ketTamu, gender, oldTR, oldRoom, keterangan, namaCust, add2 : String;
  ketemu : Boolean;
begin
  qryTC1.Close;
    qryTC1.SQL.Clear;
    qryTC1.SQL.Add('select trans_id, start_time, end_time, nama_customer, room_id, ' +
        'therapist_id, notes, cabang, gender from trans_master ' +
        'where tanggal = ''' + FormatDateTime('yyyy-MM-dd', SERVER_TIME) + ''' AND taked = ''' + 'N' +
        ''' order by trans_id ASC');
    qryTC1.Open;
    qryTC1.First;
    for i := 0 to qryTC1.RecordCount -1 do
       begin
          ketemu := True;
          noTrans := qryTC1.Fields[0].AsString;
          gtvCall.DataController.GotoFirst;
          ketemu := gtvCall.DataController.Search.Locate(gtvCallTransID.Index, noTrans);
          if (ketemu = False) then
            begin
              if ((qryTC1.Fields[4].AsString <> '') AND (qryTC1.Fields[5].AsString <> '')) then
                begin
                   if ((qryTC1.Fields[4].AsString <> 'NONE') AND (qryTC1.Fields[5].AsString <> 'NONE')) then
                      begin
                        frmTherapisStart.InsertGrid;
                        CallTR(qryTC1.Fields[5].AsString, qryTC1.Fields[4].AsString);
                      end;

                end;
            end
          else if (ketemu = True) then
            begin
              recSel := gtvCall.DataController.GetFocusedRecordIndex;
              oldTR := VarToStr(gtvCall.DataController.GetValue(recSel, gtvCallTRID.Index));
              oldRoom := VarToStr(gtvCall.DataController.GetValue(recSel, gtvCallRoomID.Index));
              if ((oldTR <> qryTC1.Fields[5].AsString) OR (oldRoom <> qryTC1.Fields[4].AsString)) then
                begin
                  gtvCall.DataController.DeleteRecord(recSel);
                end
              else
                begin
                    qryCari.Close;
                    qryCari.SQL.Clear;
                    qryCari.SQL.Add('select produk_jasa_nama, lama, aroma from trans_detail where ' +
                        'id_trans = ''' + noTrans + ''' AND trans_type_id = ''' + 'BJ' + '''');
                    qryCari.Open;
                    keterangan := qryCari.Fields[0].AsString + ' [' + qryCari.Fields[1].AsString + '] ' + ' | ' +qryCari.Fields[2].AsString + ' | ';
                    gtvCall.DataController.SetValue(recSel, gtvCallDetails.Index, keterangan);
                    namaCust := qryTC1.Fields[3].AsString;
                    //gtvCall.DataController.SetValue(recSel, gtvCallDetails.Index, keterangan);
                    keterangan := '';
                    qryCari.Close;
                    qryCari.SQL.Clear;
                    qryCari.SQL.Add('select produk_jasa_nama, lama, aroma from trans_detail where ' +
                        'id_trans = ''' + noTrans + ''' AND trans_type_id = ''' + 'BA' + '''');
                    qryCari.Open;
                    qryCari.First;
                    add2 := '';
                    for k := 0 to qryCari.RecordCount -1 do
                      begin
                        add2 := add2 + qryCari.Fields[0].AsString + ' [' + qryCari.Fields[1].AsString + '] ' + ' | ' + qryCari.Fields[2].AsString + ' | ';
                        qryCari.Next;
                      end;
                    //keterangan := qryCari.Fields[0].AsString + ' [' + qryCari.Fields[1].AsString + '] ' + ' | ' +qryCari.Fields[2].AsString + ' | ';
                    gtvCall.DataController.SetValue(recSel, gtvCallAdd.Index, keterangan + ' ' + add2);
                    gtvCall.DataController.SetValue(recSel, gtvCallCustomer.Index, namaCust);
                    gtvCall.DataController.PostEditingData;
                    gtvCall.DataController.Post(True);
                end;
            end;
          qryTC1.Next;
       end;
end;

procedure TfrmTherapisStart.cxButton1Click(Sender: TObject);
var
  recSel : Integer;
  idTrans, byReques, typeJasa, strJson : String;
  jSonItem : XSuperObject.ISuperObject;
  tanggal : TDate;
  wStart, wPickup : TTime;
begin
  recSel := gtvCall.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  Timer1.Enabled := False;

  idTrans := VarToStr(gtvCall.DataController.GetValue(recSel, gtvCallTransID.Index));
  qryTC2.Close;
  qryTC2.SQL.Clear;
  qryTC2.SQL.Add('select notes from trans_master where trans_id = ''' +
       idTrans + '''');
  qryTC2.Open;
  jSonItem := XSuperobject.SO(qryTC2.Fields[0].AsString);
  jSonItem.Time['pickup'] := Time;
  strJson := jSonItem.AsJSON(False, False);

  qryExec.SQL.Clear;
  qryExec.SQL.Add('update trans_master set ' +
      'taked = ''' + 'Y' + ''' ' +
      'where trans_id = ''' + idTrans + ''';');
  qryExec.ExecSQL;
  gtvCall.DataController.DeleteRecord(recSel);
  Timer1.Enabled := True;
end;

procedure TfrmTherapisStart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryTC1.Free;
   qryTC2.Free;
   qryCari.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmTherapisStart.FormCreate(Sender: TObject);
begin
  qryTC1 := TMyQuery.Create(Self);
  qryTC1.Connection := DMDB.dbInternal;
  qryTC1.SQL.Add('select * from temptable');
  qryTC1.Active := true;

  qryTC2 := TMyQuery.Create(Self);
  qryTC2.Connection := DMDB.dbInternal;
  qryTC2.SQL.Add('select * from temptable');
  qryTC2.Active := true;

  qryCari := TMyQuery.Create(Self);
  qryCari.Connection := DMDB.dbInternal;
  qryCari.SQL.Add('select * from temptable');
  qryCari.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qryTC1.Close;
  qryTC1.SQL.Clear;
  qryTC1.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
  qryTC1.Open;
  SERVER_TIME := qryTC1.Fields[0].AsDateTime;

  lblServerDate.Caption := FormatDateTime('dd-MMMM-yyyy', SERVER_TIME);

  CNT_CALL := 0;
  JAM_CEK_LAST := EncodeTime(1,0,0,1);
  lblLastCheck.Caption := FormatDateTime('hh:mm:ss', JAM_CEK_LAST);
end;

procedure TfrmTherapisStart.InsertGrid;
var
   newRec : Integer;
   keterangan : String;
begin
  newRec := gtvCall.DataController.InsertRecord(gtvCall.DataController.RecordCount);
    gtvCall.DataController.SetValue(newRec, gtvCallTRID.Index, qryTC1.Fields[5].AsString);
    gtvCall.DataController.SetValue(newRec, gtvCallRoomID.Index, qryTC1.Fields[4].AsString);
    gtvCall.DataController.SetValue(newRec, gtvCallTransID.Index, qryTC1.Fields[0].AsString);
    gtvCall.DataController.SetValue(newRec, gtvCallCustomer.Index, qryTC1.Fields[3].AsString);

    qryCari.Close;
    qryCari.SQL.Clear;
    qryCari.SQL.Add('select produk_jasa_nama, lama, aroma from trans_detail where ' +
        'id_trans = ''' + qryTC1.Fields[0].AsString + ''' AND trans_type_id = ''' + 'BJ' + '''');
    qryCari.Open;
    keterangan := qryCari.Fields[0].AsString + ' [' + qryCari.Fields[1].AsString + '] ' + ' | ' +qryCari.Fields[2].AsString + ' | ';
    gtvCall.DataController.SetValue(newRec, gtvCallDetails.Index, keterangan);
    keterangan := '';
    qryCari.Close;
    qryCari.SQL.Clear;
    qryCari.SQL.Add('select produk_jasa_nama, lama, aroma from trans_detail where ' +
        'id_trans = ''' + qryTC1.Fields[0].AsString + ''' AND trans_type_id = ''' + 'BA' + '''');
    qryCari.Open;
    keterangan := qryCari.Fields[0].AsString + ' [' + qryCari.Fields[1].AsString + '] ' + ' | ' +qryCari.Fields[2].AsString + ' | ';
    gtvCall.DataController.SetValue(newRec, gtvCallAdd.Index, keterangan);

    gtvCall.DataController.PostEditingData;
    gtvCall.DataController.Post(True);
    keterangan := '';
end;

procedure TfrmTherapisStart.Timer1Timer(Sender: TObject);
begin
  CNT_CALL := CNT_CALL + 1;
  lblLastCheck.Caption := 'Refresh Data Count ' + IntToStr(CNT_CALL) + ' of 10';
   if (CNT_CALL = 10) then
     begin
       CekNewTR;
       CNT_CALL := 1;
     end;
end;

end.
