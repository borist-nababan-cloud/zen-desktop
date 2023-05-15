unit FPayrollMerge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi, cxGridExportLink, DB, DBAccess, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxProgressBar, cxButtons, MyAccess, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmPayrollMerge = class(TForm)
    lblJudulForm: TLabel;
    edPeriode: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edMerge: TComboBox;
    cxButton1: TcxButton;
    progBar: TcxProgressBar;
    lblProg1: TLabel;
    lblProg2: TLabel;
    memLog: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    qryMerge1, qryMerge2, qryMerge3, qryMerge4 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmPayrollMerge: TfrmPayrollMerge;

implementation

{$R *.dfm}

uses FdmDB, FMenuMain;

procedure TfrmPayrollMerge.cxButton1Click(Sender: TObject);
var
  i : Integer;
  keterangan, idkaryawan : String;
  thpAwal, thpAkhir, vPOt, thpMerge, totPOt, vCashInd : Double;
begin
  memLog.Clear;
  keterangan := 'MERGE PAYROLL.' + edPeriode.Text + '%';
  qryMerge1.Close;
  qryMerge1.SQL.Clear;
  qryMerge1.SQL.Add('select autonum from ben_payroll_potongan where payrollperiode = ''' +
      edPeriode.Text + ''' AND keterangan LIKE ''' + keterangan + '''');
  qryMerge1.Open;
  if (NOT qryMerge1.IsEmpty) then
    begin
      DMDB.qryExec.SQL.Clear;
      DMDB.qryExec.SQL.Add('delete from ben_payroll_potongan where payrollperiode = ''' +
      edPeriode.Text + ''' AND keterangan LIKE ''' + keterangan + '''');
      DMDB.qryExec.ExecSQL;
      memLog.Lines.Add('****');
      memLog.Lines.Add('DELETING ' + keterangan);
      memLog.Lines.Add('TOT RECORD : ' + IntToStr(qryMerge1.RecordCount) + ' RECORD[s]');
      memLog.Lines.Add('****');
    end;
  qryMerge2.Close;
  qryMerge2.SQL.Clear;
  qryMerge2.SQL.Add('select autonum, payrollperiode, kodekaryawan, potlain, nilaithp from ' +
      'ben_payroll_details where payrollperiode = ''' + edPeriode.Text + '''');
  qryMerge2.Open;
  qryMerge2.First;
  progBar.Properties.Max := qryMerge2.RecordCount;
  progBar.Position := 0;
  DMDB.qryExec.SQL.Clear;
  for i := 0 to qryMerge2.RecordCount - 1 do
    begin
      memLog.Lines.Add('=======================================================');
      idkaryawan := qryMerge2.Fields[2].AsString;
      thpAwal := qryMerge2.Fields[4].AsFloat;
      memLog.Lines.Add('Checking ID ' + idkaryawan);
      memLog.Lines.Add('THP AWAL : ' + FormatFloat('#,#', thpAwal));
      //----cari thp sebelumnya
      qryMerge3.Close;
      qryMerge3.SQL.Clear;
      qryMerge3.SQL.Add('select nilaithp from ' +
        'ben_payroll_details where payrollperiode = ''' + edMerge.Text + ''' AND kodekaryawan = ''' +
        idkaryawan + '''');
      qryMerge3.Open;
      if (qryMerge3.IsEmpty) then thpMerge := 0
      else if (NOT qryMerge3.IsEmpty) then thpMerge := qryMerge3.Fields[0].AsFloat;
      memLog.Lines.Add('THP MERGE : ' + FormatFloat('#,#', thpMerge));
      //-----
      //----cari potongan periode full --
      qryMerge4.Close;
      qryMerge4.SQL.Clear;
      qryMerge4.SQL.Add('select sum(nilai) from ben_payroll_potongan where ' +
          'payrollperiode = ''' + edPeriode.Text + ''' AND kodekaryawan = ''' +
          idkaryawan + '''');
      qryMerge4.Open;
      if (qryMerge4.IsEmpty) then vPOt := 0
      else if (NOT qryMerge4.IsEmpty) then vPOt := qryMerge4.Fields[0].AsFloat;
      //-----end---
      qryMerge1.Close;
      qryMerge1.SQL.Clear;
      qryMerge1.SQL.Add('select nilaithp from ben_payroll_cashin where ' +
          'payrollperiode = ''' + edMerge.Text + ''' AND kodekaryawan = ''' +
        idkaryawan + '''');
      qryMerge1.Open;
      if (qryMerge1.IsEmpty) then vCashInd := 0
      else if (qryMerge1.IsEmpty) then vCashInd := qryMerge1.Fields[0].AsFloat;
      memLog.Lines.Add('CASH IN : ' + FormatFloat('#,#', vCashInd));
      memLog.Lines.Add('POT LAIN : ' + FormatFloat('#,#', vPOt));
      totPOt := thpMerge + vCashInd;
      memLog.Lines.Add('TOT POT : ' + FormatFloat('#,#', totPOt));
      thpAkhir := thpAwal - totPOt - vPOt;
      memLog.Lines.Add('THP AKHIR : ' + FormatFloat('#,#', thpAkhir));
      keterangan := 'MERGE PAYROLL.' + edPeriode.Text +
            ' FROM ' + edMerge.Text + FormatFloat(' Rp. #,#', thpMerge);

      DMDB.qryExec.SQL.Add('insert into ben_payroll_potongan values(' +
          '''' + '' + ''',' +
          '''' + frmMenuMain.IDOUTLET + ''',' +
          '''' + edPeriode.Text + ''',' +
          '''' + idkaryawan + ''',' +
          '''' + idkaryawan + ''',' +
          '''' + FloatToStr(totPOt) + ''',' +
          QuotedStr(keterangan) + ',' +
          '''' + frmMenuMain.USERAPP_NAME + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
      DMDB.qryExec.SQL.Add('update ben_payroll_details set ' +
            'potlain = ''' + FloatToStr(totPOt) + ''',' +
            'nilaithp = ''' + FloatToStr(thpAkhir) + ''', ' +
            'lastedituser = ''' + frmMenuMain.USERAPP_NAME + ''',' +
            'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
            'where payrollperiode = ''' + edPeriode.Text + ''' ' +
            'AND kodekaryawan = ''' + idkaryawan + ''';');
      lblProg1.Caption := 'Loading Data NIK ' + idkaryawan;
      lblProg2.Caption := 'Progress ' + IntToStr(i) + ' of ' + inttostr(qryMerge2.RecordCount);
      progBar.Position := i + 1;
      qryMerge2.Next;
      memLog.Lines.Add('=======================================================' + #13#13);
      Application.ProcessMessages;
    end;
  DMDB.qryExec.ExecSQL;
  ShowMessage('Merge Payroll Finish !!');
end;

procedure TfrmPayrollMerge.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryMerge1.Free;
  qryMerge2.Free;
  qryMerge3.Free;
  qryMerge4.Free;
  Action := caFree;
end;

procedure TfrmPayrollMerge.FormCreate(Sender: TObject);
var
  i : Integer;
begin
   qryMerge1 := TMyQuery.Create(Self);
   qryMerge1.Connection := DMDB.StoreDB;
   qryMerge1.SQL.Add('select * from temptable');
   qryMerge1.Active := true;

   qryMerge2 := TMyQuery.Create(Self);
   qryMerge2.Connection := DMDB.StoreDB;
   qryMerge2.SQL.Add('select * from temptable');
   qryMerge2.Active := true;

   qryMerge3 := TMyQuery.Create(Self);
   qryMerge3.Connection := DMDB.StoreDB;
   qryMerge3.SQL.Add('select * from temptable');
   qryMerge3.Active := true;

   qryMerge4 := TMyQuery.Create(Self);
   qryMerge4.Connection := DMDB.StoreDB;
   qryMerge4.SQL.Add('select * from temptable');
   qryMerge4.Active := true;

   qryMerge1.Close;
   qryMerge1.SQL.Clear;
   qryMerge1.SQL.Add('select payrollperiode from ben_payroll_periode ' +
      'order by tglstart DESC LIMIT 5');
   qryMerge1.Open;
   qryMerge1.First;
   for i := 0 to qryMerge1.RecordCount - 1 do
      begin
        edPeriode.Items.Add(qryMerge1.Fields[0].AsString);
        edMerge.Items.Add(qryMerge1.Fields[0].AsString);
        qryMerge1.Next;
      end;

end;

end.
