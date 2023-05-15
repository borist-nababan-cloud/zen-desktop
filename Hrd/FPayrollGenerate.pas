unit FPayrollGenerate;

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
  TfrmPayrollGenerate = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    btnPost: TButton;
    edPeriode: TcxCalcEdit;
    Label3: TLabel;
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
  frmPayrollGenerate: TfrmPayrollGenerate;

implementation

{$R *.dfm}

uses FMain, FDMDB;

procedure TfrmPayrollGenerate.btnPostClick(Sender: TObject);
var
  nTahun, nBulan, nHari1, nHari2 : Integer;
  strBulan, strHari1, strHari2, strPeriode : String;
begin
   nTahun := YearOf(edStart.Date);
   nBulan := MonthOf(edStart.Date);
   nTahun := YearOf(edStart.Date);
   nHari1 := DayOf(edStart.Date);
   nHari2 := DayOf(edEnd.Date);
   case Length(inttostr(nBulan)) of
     1 : strBulan := '0' + inttostr(nBulan);
     2 : strBulan := inttostr(nBulan);
   end;
   case Length(inttostr(nHari1)) of
     1 : strHari1 := '0' + inttostr(nHari1);
     2 : strHari1 := inttostr(nHari1);
   end;
   case Length(inttostr(nHari2)) of
     1 : strHari2 := '0' + inttostr(nHari2);
     2 : strHari2 := inttostr(nHari2);
   end;
   strPeriode := 'PYZ.' + frmMain.APP_OUTLETID + '.' + IntToStr(nTahun) + strBulan +
      strHari1 + strHari2;
   qryTemp1.Close;
   qryTemp1.SQL.Clear;
   qryTemp1.SQL.Add('select autonum from ben_payroll_periode where payrollperiode = ''' +
       strPeriode + '''');
   qryTemp1.Open;
   if (qryTemp1.IsEmpty) then
     begin
       Screen.Cursor := crHourGlass;
       qryExec.SQL.Clear;
       qryExec.SQL.Add('insert into ben_payroll_periode values(' +
          '''' + '' + ''',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          '''' + strPeriode + ''',' +
          '''' + strBulan + ''',' +
          '''' + IntToStr(nTahun) + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd', edStart.Date) + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''',' +
          '''' + vartostr(edPeriode.EditValue) + ''',' +
          '''' + frmMain.USERAPPS + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
       qryExec.SQL.Add('update ben_presensi_rekap set ' +
          'payrollperiode = ''' + strPeriode + ''' ' +
          'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
          ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''';');

       qryExec.SQL.Add('update ben_payroll_um3 set ' +
          'payrollperiode = ''' + strPeriode + ''' ' +
          'where tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
          ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''';');

       qryExec.ExecSQL;
       Screen.Cursor := crDefault;
       ShowMessage('Periode Payroll Sudah Berhasil Dibuat !!');
     end
   else if (NOT qryTemp1.IsEmpty) then
     begin
       ShowMessage('Payroll Periode sudah dibuat !!');
       Exit;
     end;
end;

procedure TfrmPayrollGenerate.edEndPropertiesChange(Sender: TObject);
begin
  edPeriode.EditValue := DaysBetween(edStart.Date, edEnd.Date) + 1;
end;

procedure TfrmPayrollGenerate.edStartPropertiesChange(Sender: TObject);
begin
  edPeriode.EditValue := DaysBetween(edStart.Date, edEnd.Date) + 1;
end;

procedure TfrmPayrollGenerate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryTemp1.Free;
  qryTemp2.Free;
  Action := caFree;
end;

procedure TfrmPayrollGenerate.FormCreate(Sender: TObject);
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
end;

end.
