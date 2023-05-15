unit FReportPeriode;

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
  cxMaskEdit, cxDropDownEdit, cxCalendar, DBAccess, DateUtils, cxCalc,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, MyAccess;

type
  TfrmReportPeriode = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    btnPost: TButton;
    edPeriode: TcxCalcEdit;
    Label3: TLabel;
    strukturPromo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPostClick(Sender: TObject);
    procedure edStartPropertiesChange(Sender: TObject);
    procedure edEndPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    qryTemp1, qryTemp2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmReportPeriode: TfrmReportPeriode;

implementation

{$R *.dfm}

uses FMain, FDMDB;

procedure TfrmReportPeriode.btnPostClick(Sender: TObject);
var
  nTahun, nBulan1, nbulan2 : Integer;
  strBulan1, strBulan2, strPeriode : String;
begin
   nTahun := YearOf(edStart.Date);
   nBulan1 := MonthOf(edStart.Date);
   nBulan2 := MonthOf(edEnd.Date);
   nTahun := YearOf(edStart.Date);

   case Length(inttostr(nBulan1)) of
     1 : strBulan1 := '0' + inttostr(nBulan1);
     2 : strBulan1 := inttostr(nBulan1);
   end;

   case Length(inttostr(nBulan2)) of
     1 : strBulan2 := '0' + inttostr(nBulan2);
     2 : strBulan2 := inttostr(nBulan2);
   end;


   strPeriode := 'R.' + frmMain.APP_OUTLETID + '.' + IntToStr(nTahun) + strBulan1 +
      strBulan2;
   qryTemp1.Close;
   qryTemp1.SQL.Clear;
   qryTemp1.SQL.Add('select autonum from ben_report_periode where kodereport = ''' +
       strPeriode + '''');
   qryTemp1.Open;
   if (qryTemp1.IsEmpty) then
     begin
       Screen.Cursor := crHourGlass;
       qryExec.SQL.Clear;
       qryExec.SQL.Add('insert into ben_report_periode values(' +
          '''' + '' + ''',' +
          '''' + strPeriode + ''',' +
          '''' + 'Y' + ''',' +
          '''' + frmMain.USERAPPS + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');

       qryExec.ExecSQL;
       Screen.Cursor := crDefault;
       ShowMessage('Periode Report Sudah Berhasil Dibuat !!');
     end
   else if (NOT qryTemp1.IsEmpty) then
     begin
       ShowMessage('Periode Report sudah dibuat !!');
       Exit;
     end;
end;

procedure TfrmReportPeriode.edEndPropertiesChange(Sender: TObject);
begin
  edPeriode.EditValue := DaysBetween(edStart.Date, edEnd.Date) + 1;
end;

procedure TfrmReportPeriode.edStartPropertiesChange(Sender: TObject);
begin
  edPeriode.EditValue := DaysBetween(edStart.Date, edEnd.Date) + 1;
end;

procedure TfrmReportPeriode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryTemp1.Free;
  qryTemp2.Free;
  Action := caFree;
end;

procedure TfrmReportPeriode.FormCreate(Sender: TObject);
begin
  edStart.Date := Date;
  edEnd.Date := Date;

   qryTemp1 := TMyQuery.Create(Self);
   qryTemp1.Connection := DMDB.dbInternal;
   qryTemp1.SQL.Add('select * from temptable');
   qryTemp1.Active := true;

   qryTemp2 := TMyQuery.Create(Self);
   qryTemp2.Connection := DMDB.dbInternal;
   qryTemp2.SQL.Add('select * from temptable');
   qryTemp2.Active := true;

   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qryTemp1.Close;
   qryTemp1.SQL.Clear;
   qryTemp1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('ben_report_periode'));
   qryTemp1.Open;
   if (qryTemp1.IsEmpty) then
    begin
     qryExec.SQL.Clear;
     qryExec.SQL.Add(strukturPromo.Text);
     qryExec.ExecSQL;
    end;

end;

end.
