unit FTherapisCall;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleServer, SpeechLib_TLB, MyAccess,
  Vcl.StdCtrls, COMobj, System.Threading, Vcl.ExtCtrls, cxGraphics, cxControls,
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
  cxDataStorage, cxEdit, cxNavigator, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, DateUtils, StrUtils,
  cxTextEdit, cxGridBandedTableView, MMSystem;

type
  TfrmTherapisCall = class(TForm)
    lblJudulAtas: TLabel;
    Label1: TLabel;
    lblServerDate: TLabel;
    Timer1: TTimer;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    lblLastCheck: TLabel;
    gtvCall: TcxGridBandedTableView;
    gtvCallTRID: TcxGridBandedColumn;
    gtvCallRoomID: TcxGridBandedColumn;
    gtvCallCustomer: TcxGridBandedColumn;
    gtvCallTransID: TcxGridBandedColumn;
    gtvCallDetails: TcxGridBandedColumn;
    gtvCallAdd: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    SERVER_TIME : TDateTime;
    JAM_CEK_LAST : TTime;
    CNT_CALL : Integer;
    qryTC1, qryTC2, qryCari : TMyQuery;
    voice: OLEVariant;
    procedure CekNewTR;
    procedure CelStartTR;
    procedure CallTR(Const idTR : String; idRoom : String);
    procedure CariDetails(Const NewRecord : Integer; idTrans : String);
    procedure InsertGrid;
  public
    { Public declarations }
  end;

var
  frmTherapisCall: TfrmTherapisCall;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmTherapisCall.CallTR(const idTR: String; idRoom: String);
var
  toSpeak, strToCall : String;
  intIDTR, i : Integer;
begin
    strToCall := '';
    PlaySound('APPGPFAULT', 0, SND_ASYNC);
    intIDTR := StrToInt(idTR);
    //strToCall := 'ID' + IntToStr(intIDTR);
    for i := 1 to Length(IntToStr(intIDTR)) do
      begin
        strToCall := strToCall + ' ' + Copy(IntToStr(intIDTR),i,1);
      end;
    Sleep(100);
    PlaySound('APPGPFAULT', 0, SND_ASYNC);
   //voice.Speak('Attention Please To All Therapist', 0);
   Sleep(100);
   toSpeak := 'Attention Please...   ID Number...    ' + strToCall;
   voice.Speak(toSpeak, 0);
   {TTask.Run(
      procedure
        begin
           TThread.Synchronize(nil,
              procedure
              begin
                 voice.Speak(toSpeak, 0);
              end);
        end
     );}
end;

procedure TfrmTherapisCall.CariDetails(const NewRecord: Integer;
  idTrans: String);
begin


end;

procedure TfrmTherapisCall.CekNewTR;
var
  i, newRec, recSel, j: Integer;
  noTrans, ketTamu, gender, oldTR, oldRoom, keterangan : String;
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
                       frmTherapisCall.InsertGrid;
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
                    keterangan := '';
                    qryCari.Close;
                    qryCari.SQL.Clear;
                    qryCari.SQL.Add('select produk_jasa_nama, lama, aroma from trans_detail where ' +
                        'id_trans = ''' + noTrans + ''' AND trans_type_id = ''' + 'BA' + '''');
                    qryCari.Open;
                    keterangan := qryCari.Fields[0].AsString + ' [' + qryCari.Fields[1].AsString + '] ' + ' | ' +qryCari.Fields[2].AsString + ' | ';
                    gtvCall.DataController.SetValue(recSel, gtvCallAdd.Index, keterangan);
                    gtvCall.DataController.PostEditingData;
                    gtvCall.DataController.Post(True);
                end;
            end;
          qryTC1.Next;
       end;
end;

procedure TfrmTherapisCall.CelStartTR;
var
  i, newRec, recSel, j: Integer;
  noTrans, ketTamu, gender, oldTR, oldRoom, keterangan : String;
  ketemu : Boolean;
begin
  qryTC1.Close;
    qryTC1.SQL.Clear;
    qryTC1.SQL.Add('select trans_id from trans_master ' +
        'where tanggal = ''' + FormatDateTime('yyyy-MM-dd', SERVER_TIME) + ''' AND taked = ''' + 'Y' +
        ''' order by trans_id ASC');
    qryTC1.Open;
    qryTC1.First;
    for i := 0 to qryTC1.RecordCount -1 do
      begin
        ketemu := False;
        gtvCall.DataController.GotoFirst;
        noTrans := qryTC1.Fields[0].AsString;
        ketemu := gtvCall.DataController.Search.Locate(gtvCallTransID.Index, noTrans);
        if (ketemu = True) then
          begin
            recSel := gtvCall.DataController.GetFocusedRecordIndex;
            gtvCall.DataController.DeleteRecord(recSel);
          end;

        qryTC1.Next;
      end;
end;

procedure TfrmTherapisCall.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryTC1.Free;
   qryTC2.Free;
   qryCari.Free;
   Action := caFree;
end;

procedure TfrmTherapisCall.FormCreate(Sender: TObject);
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

  qryTC1.Close;
  qryTC1.SQL.Clear;
  qryTC1.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
  qryTC1.Open;
  SERVER_TIME := qryTC1.Fields[0].AsDateTime;

  lblServerDate.Caption := FormatDateTime('dd-MMMM-yyyy', SERVER_TIME);
  voice := CreateOLEObject('SAPI.SpVoice');
  CNT_CALL := 0;
  JAM_CEK_LAST := EncodeTime(1,0,0,1);
  lblLastCheck.Caption := FormatDateTime('hh:mm:ss', JAM_CEK_LAST);
end;

procedure TfrmTherapisCall.InsertGrid;
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

procedure TfrmTherapisCall.Timer1Timer(Sender: TObject);
begin
   CNT_CALL := CNT_CALL + 1;
   if (CNT_CALL = 2) then
     begin
       voice.Speak('Welcome To Zen Family Spa', 0);
     end;

   if (CNT_CALL = 7) then
     begin
       Timer1.Enabled := False;
       CekNewTR;
       //CNT_CALL := 3;
       Timer1.Enabled := True;
     end;
   if (CNT_CALL = 14) then
     begin
       Timer1.Enabled := False;
       CelStartTR;
       CNT_CALL := 3;
       Timer1.Enabled := True;
     end;
end;

end.
