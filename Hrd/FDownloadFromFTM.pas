unit FDownloadFromFTM;

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
  cxMaskEdit, cxDropDownEdit, cxCalendar, DBAccess, DB, ExtCtrls, DateUtils,
  cxProgressBar, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, MyAccess;

type
  TfrmDownloadFromFTM = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    edTanggal: TcxDateEdit;
    btnKonek: TButton;
    Label2: TLabel;
    edDbName: TEdit;
    Timer1: TTimer;
    Button1: TButton;
    pbLoader: TcxProgressBar;
    dbFtm: TMyConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnKonekClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    ctnKonek : Integer;
    qryDown1, qryDown2, qryTemp : TMyQuery;

  public
    { Public declarations }
  end;

var
  frmDownloadFromFTM: TfrmDownloadFromFTM;

implementation

{$R *.dfm}

uses FMenuMain, FdmDB;

procedure TfrmDownloadFromFTM.btnKonekClick(Sender: TObject);
begin
    dbFtm.Connected := False;
    dbFtm.Database := edDbName.Text;
    dbFtm.Server := frmMenuMain.DBHOST;
    dbFtm.UserName := frmMenuMain.DBUSER;
    dbFtm.Password := frmMenuMain.DBPASS;
    dbFtm.Port := StrToInt(frmMenuMain.DBPORT);
    try
        dbFtm.Connected := True;
     Except
       on E : Exception do
       ShowMessage('Sorry Database Not Ready !!');

     end;

  qryDown1 := TMyQuery.Create(Self);
  qryDown1.Connection := dbFtm;
  qryDown1.SQL.Add('select * from att_log where pin = ''' + 'X' + '''');
  qryDown1.Active := true;

  qryDown2 := TMyQuery.Create(Self);
  qryDown2.Connection := dbFtm;
  qryDown2.SQL.Add('select * from att_log where pin = ''' + 'X' + '''');
  qryDown2.Active := true;
  ShowMessage('Ready To Download !!');
end;

procedure TfrmDownloadFromFTM.Button1Click(Sender: TObject);
var
  strPin, rID, strsync : String;
  tglCari : TDateTime;
  iHari, iBulan, iTahun : Integer;
  i: Integer;
  nWaktu : TTime;
  dTanggal : TDate;
begin
  if (dbFtm.Connected = False) then
   begin
     ShowMessage('Please Connect to DB First !');
     Exit;
   end;
  iBulan := MonthOf(edTanggal.Date);
  iHari := DayOf(edTanggal.Date);
  iTahun := YearOf(edTanggal.Date);
  //ShowMessage(inttostr(iBulan) + '#' + inttostr(iHari) + '#' + inttostr(iTahun) + '#');
  tglCari := EncodeDateTime(iTahun, iBulan, iHari, 0,0,0,0);
  pbLoader.Visible := True;
  Application.ProcessMessages;
  qryDown1.Close;
  qryDown1.SQL.Clear;
  qryDown1.SQL.Add('select scan_date, pin from att_log where scan_date >= ''' +
      FormatDateTime('yyyy-MM-dd hh:mm:ss', tglCari) + '''');
  qryDown1.Open;
  Application.ProcessMessages;
  qryDown1.First;
  pbLoader.Properties.Max := qryDown1.RecordCount;
  pbLoader.Position := 1;
  Application.ProcessMessages;
  dmDB.qryExec.SQL.Clear;
  for i := 0 to qryDown1.RecordCount - 1 do
    begin
       strPin := qryDown1.Fields[1].AsString;
       case Length(strPin) of
         1 : rID := '0000' + strPin;
         2 : rID := '000' + strPin;
         3 : rID := '00' + strPin;
         4 : rID := '0' + strPin;
         5 : rID := strPin;
       end;
       pbLoader.Position := pbLoader.Position + 1;
       //mID.Lines.Add(rID);
       //mTanggal.Lines.Add(qryDown1.Fields[0].AsString);
       nWaktu := qryDown1.Fields[0].AsDateTime;
       dTanggal := qryDown1.Fields[0].AsDateTime;

       qryTemp.Close;
       qryTemp.SQL.Clear;
       qryTemp.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan ' +
           'from ben_hrd_karyawan_info where idkaryawan = ''' + rID + ''' AND ' +
           'active = ''' + 'Y' + '''');
       qryTemp.Open;

       DMDB.qryExec.SQL.Add('insert into absen_harian values(' +
       '''' + '' + ''',' +
       '''' + rID + ''',' +
       QuotedStr(qryTemp.Fields[2].AsString) + ',' +
       '''' + FormatDateTime('yyyy-MM-dd', qryDown1.Fields[0].AsDateTime) + ''',' +
       '''' + FormatDateTime('hh:mm:ss', qryDown1.Fields[0].AsDateTime) + ''',' +
       '''' + 'IN' + ''',' +
       '''' + qryTemp.Fields[0].AsString + ''');');

       {strsync := 'insert into absen_harian values(' +
       '''' + '' + ''',' +
       '''' + rID + ''',' +
       QuotedStr(qryTemp.Fields[2].AsString) + ',' +
       '''' + FormatDateTime('yyyy-MM-dd', qryDown1.Fields[0].AsDateTime) + ''',' +
       '''' + FormatDateTime('hh:mm:ss', qryDown1.Fields[0].AsDateTime) + ''',' +
       '''' + 'IN' + ''',' +
       '''' + qryTemp.Fields[0].AsString + ''');';

       DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMenuMain.USERAPP) + ',' +
          '''' + frmMenuMain.IDOUTLET + ''',' +
          QuotedStr(strsync) + ',' +
          '''' + 'Y' + ''');');}
       qryDown1.Next;
       Application.ProcessMessages;
    end;
  DMDB.qryExec.ExecSQL;
  ShowMessage('Finish !');
end;

procedure TfrmDownloadFromFTM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryDown1.Free;
  qryDown2.Free;
  dbFtm.Connected := False;
  Action := caFree;
end;

procedure TfrmDownloadFromFTM.FormCreate(Sender: TObject);
begin
  edTanggal.Date := Date;
  ctnKonek := 0;
  edDbName.Text := frmMenuMain.DBDOWNLOAD;
  //Timer1.Enabled := True;
  qryTemp := TMyQuery.Create(Self);
  qryTemp.Connection := DMDB.StoreDB;
  qryTemp.SQL.Add('select * from temptable');
  qryTemp.Active := true;
end;

procedure TfrmDownloadFromFTM.Timer1Timer(Sender: TObject);
begin
   {ctnKonek := ctnKonek + 1;
   if (ctnKonek = 2) then
     begin
       btnKonek.Click;
       Timer1.Enabled := False;
     end;}
end;

end.
