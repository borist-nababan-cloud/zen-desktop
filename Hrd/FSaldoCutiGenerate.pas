unit FSaldoCutiGenerate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinXmas2008Blue, Vcl.Menus, cxButtons, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalc, MyAccess, DateUtils, strUtils, cxProgressBar, cxMemo;

type
  TfrmSaldoCutiGenerate = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    edTahun: TComboBox;
    edJumlah: TcxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnGenerate: TcxButton;
    btnClose: TcxButton;
    progressBar1: TcxProgressBar;
    memProgress: TcxMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGenerateClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    qrySaldo1, qrySaldo2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmSaldoCutiGenerate: TfrmSaldoCutiGenerate;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmSaldoCutiGenerate.btnCloseClick(Sender: TObject);
begin
    frmSaldoCutiGenerate.Close;
end;

procedure TfrmSaldoCutiGenerate.btnGenerateClick(Sender: TObject);
var
   tglSaldo, tglMasuk : TDate;
   i, nprogress : Integer;
begin
   tglSaldo := EncodeDate(StrToInt(edTahun.Text),01,01);
   qrySaldo1.Close;
   qrySaldo1.SQL.Clear;
   qrySaldo1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, tglmasukkerja from ' +
       'ben_hrd_karyawan_info where active = ''' + 'Y' + ''' ORDER BY kodekaryawan ASC');
   qrySaldo1.Open;
   qrySaldo1.First;
   memProgress.Lines.Add('Preparing Data');
   memProgress.Lines.Add('====================================================');
   progressBar1.Properties.Max := qrySaldo1.RecordCount;
   Application.ProcessMessages;
   qryExec.SQL.Clear;
   for i := 0 to qrySaldo1.RecordCount-1 do
      begin
        nprogress := i + 1;
        progressBar1.Position := nprogress;
        memProgress.Lines.Add('Checking NIK # ' + qrySaldo1.Fields[0].AsString + ' # ' + qrySaldo1.Fields[2].AsString);
        Application.ProcessMessages;
        tglMasuk := qrySaldo1.Fields[3].AsDateTime;
        Screen.Cursor := crHourGlass;
        if (MonthsBetween(tglMasuk, tglSaldo) < 12) then
          begin
             memProgress.Lines.Add('Tanggal masuk kerja ' + FormatDateTime('dd-MMMM-yyyy', tglMasuk));
             Application.ProcessMessages;
             memProgress.Lines.Add('Masa Kerja kurang dari 12 Bulan');
          end
        else if (MonthsBetween(tglMasuk, tglSaldo) >= 12) then
          begin
             memProgress.Lines.Add('Tanggal masuk kerja ' + FormatDateTime('dd-MMMM-yyyy', tglMasuk));
             Application.ProcessMessages;
             memProgress.Lines.Add('Insert into Saldo ' + edTahun.Text + ' ' + IntToStr(edJumlah.EditValue) + ' Hari');
             qrySaldo2.Close;
             qrySaldo2.SQL.Clear;
          end;
        memProgress.Lines.Add('----------------------------------------------------------');
        //memProgress.Lines.Add('====================================================');
        qrySaldo2.Close;
        qrySaldo2.SQL.Clear;
        qrySaldo2.SQL.Add('select autonum from ben_saldo_cuti where kodekaryawan = ''' +
            qrySaldo1.Fields[0].AsString + ''' AND tahun = ''' + edTahun.Text + '''');
        qrySaldo2.Open;
        if (qrySaldo2.IsEmpty) then
          begin
            qryExec.SQL.Add('insert into ben_saldo_cuti values(' +
                '''' + '' + ''',' +
                '''' + qrySaldo1.Fields[0].AsString + ''',' +
                '''' + qrySaldo1.Fields[1].AsString + ''',' +
                '''' + edTahun.Text + ''',' +
                '''' + vartostr(edJumlah.EditValue) + ''',' +
                '''' + '0' + ''',' +
                '''' + frmMain.USERAPPS + ''',' +
                '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                '''' + 'I' + ''');');
            qryExec.SQL.Add('insert into ben_saldo_cuti_history values(' +
                '''' + '' + ''',' +
                '''' + qrySaldo1.Fields[0].AsString + ''',' +
                 '''' + qrySaldo1.Fields[1].AsString + ''',' +
                 '''' + edTahun.Text + ''',' +
                 '''' + '0' + ''',' +
                 '''' + vartostr(edJumlah.EditValue) + ''',' +
                 '''' + '0' + ''',' +
                 '''' + '' + ''',' +
                 '''' + frmMain.USERAPPS + ''',' +
                 '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
          end
        else if (NOT qrySaldo2.IsEmpty) then
          begin
              qryExec.SQL.Clear;
              qryExec.SQL.Add('update ben_saldo_cuti set ' +
               'saldoawal = ''' + vartostr(edJumlah.EditValue) + ''',' +
               'sisa = ''' + vartostr(edJumlah.EditValue) + ''',' +
               'lastedituser = ''' + frmMain.USERAPPS + ''',' +
               'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
               'tag = ''' + 'E' + ''' ' +
               'where kodekaryawan = ''' + qrySaldo1.Fields[0].AsString + ''' AND ' +
               'tahun = ''' + edTahun.Text + ''';');

             qryExec.SQL.Add('insert into ben_saldo_cuti_history values(' +
                '''' + '' + ''',' +
                '''' + qrySaldo1.Fields[0].AsString + ''',' +
                 '''' + qrySaldo1.Fields[1].AsString + ''',' +
                 '''' + edTahun.Text + ''',' +
                 '''' + '0' + ''',' +
                 '''' + vartostr(edJumlah.EditValue) + ''',' +
                 '''' + '0' + ''',' +
                 '''' + '' + ''',' +
                 '''' + frmMain.USERAPPS + ''',' +
                 '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
          end;
        qrySaldo1.Next;
      end;
   qryExec.ExecSQL;
   Screen.Cursor := crDefault;
   ShowMessage('Generate Finish, Please Check Log Notes');

end;

procedure TfrmSaldoCutiGenerate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qrySaldo1.Free;
   qrySaldo2.Free;
   qryExec.Free;
   Action := caFree;
end;

procedure TfrmSaldoCutiGenerate.FormCreate(Sender: TObject);
begin
  qrySaldo1 := TMyQuery.Create(Self);
  qrySaldo1.Connection := DMDB.dbInternal;
  qrySaldo1.SQL.Add('select * from temptable');
  qrySaldo1.Active := true;

  qrySaldo2 := TMyQuery.Create(Self);
  qrySaldo2.Connection := DMDB.dbInternal;
  qrySaldo2.SQL.Add('select * from temptable');
  qrySaldo2.Active := true;

  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;
end;

end.
