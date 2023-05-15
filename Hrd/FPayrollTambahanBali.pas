unit FPayrollTambahanBali;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxCalc, cxTextEdit, cxContainer, cxMaskEdit, cxDropDownEdit,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, MemDS, MyAccess;

type
  TfrmPayrollTambahanBali = class(TForm)
    Label4: TLabel;
    qryPotongan: TMyQuery;
    dsQryPotongan: TDataSource;
    gtbPotongan: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbPotongannilai: TcxGridDBColumn;
    gtbPotonganketerangan: TcxGridDBColumn;
    gtbPotonganlastedituser: TcxGridDBColumn;
    gtbPotonganlasteditdate: TcxGridDBColumn;
    edKode: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edNama: TEdit;
    edNilai: TcxCalcEdit;
    Label5: TLabel;
    edKeterangan: TEdit;
    btnTambah: TButton;
    Label6: TLabel;
    edPeriodePot: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTambahClick(Sender: TObject);
  private
    { Private declarations }
    qryAdd1, qryAdd2, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmPayrollTambahanBali: TfrmPayrollTambahanBali;

implementation

{$R *.dfm}

uses FdmDB, FMain, FPayrollAdminBali;

procedure TfrmPayrollTambahanBali.btnTambahClick(Sender: TObject);
var
  tottamb, vTHP, nTHP, vOldTamb : Double;
  recSelect : Integer;
begin
   qryExec.SQL.Clear;
   qryExec.SQL.Add('insert into ben_payroll_tambahan values(' +
      '''' + '' + ''',' +
      '''' + frmMain.APP_OUTLETID + ''',' +
      '''' + edPeriodePot.Text + ''',' +
      '''' + edKode.Text + ''',' +
      '''' + '' + ''',' +
      '''' + FloatToStr(edNilai.EditValue) + ''',' +
      QuotedStr(edKeterangan.Text) + ',' +
      '''' + frmMain.USERAPPS + ''',' +
      '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
   qryExec.ExecSQL;

   qryPotongan.Close;
   qryPotongan.SQL.Clear;
   qryPotongan.SQL.Add('select nilai, keterangan, lastedituser, lasteditdate ' +
      'from ben_payroll_tambahan where kodekaryawan = ''' + edKode.Text +
      ''' AND payrollperiode = ''' + edPeriodePot.Text + '''');
   qryPotongan.Open;
   gtbPotongan.DataController.Refresh;

   qryAdd1.Close;
   qryAdd1.SQL.Clear;
   qryAdd1.SQL.Add('select sum(nilai) from ben_payroll_tambahan ' +
       'where kodekaryawan = ''' + edKode.Text +
      ''' AND payrollperiode = ''' + edPeriodePot.Text + '''');
   qryAdd1.Open;
   tottamb := qryAdd1.Fields[0].AsFloat;
   with frmPayrollAdminBali do
     begin
       gtvRekap.DataController.GotoFirst;
       gtvRekap.DataController.Search.Locate(gtvRekapKode.Index, edKode.Text);
       recSelect := gtvRekap.DataController.GetFocusedRecordIndex;
       vOldTamb := gtvRekap.DataController.GetValue(recSelect, gtvRekapTambLain.Index);
       vTHP := gtvRekap.DataController.GetValue(recSelect, gtvRekapTHP.Index);
       nTHP := vTHP - vOldTamb + tottamb;
       gtvRekap.DataController.SetValue(recSelect, gtvRekapTambLain.Index, tottamb);
       gtvRekap.DataController.SetValue(recSelect, gtvRekapTHP.Index, nTHP);
       gtvRekap.DataController.PostEditingData;
       gtvRekap.DataController.Post(True);
     end;
end;

procedure TfrmPayrollTambahanBali.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  vOldTamb,vTHP, tottamb, nTHP  : Double;
  recSelect : Integer;
begin
   qryAdd1.Close;
   qryAdd1.SQL.Clear;
   qryAdd1.SQL.Add('select sum(nilai) from ben_payroll_tambahan ' +
       'where kodekaryawan = ''' + edKode.Text +
      ''' AND payrollperiode = ''' + edPeriodePot.Text + '''');
   qryAdd1.Open;
   tottamb := qryAdd1.Fields[0].AsFloat;
   with frmPayrollAdminBali do
     begin
       gtvRekap.DataController.GotoFirst;
       gtvRekap.DataController.Search.Locate(gtvRekapKode.Index, edKode.Text);
       recSelect := gtvRekap.DataController.GetFocusedRecordIndex;
       if (gtvRekap.DataController.GetValue(recSelect, gtvRekapTambLain.Index) = null) then
         begin
           vOldTamb := 0;
         end
      else
        begin
          vOldTamb := gtvRekap.DataController.GetValue(recSelect, gtvRekapTambLain.Index);
        end;

       vTHP := gtvRekap.DataController.GetValue(recSelect, gtvRekapTHP.Index);
       nTHP := vTHP - vOldTamb + tottamb;
       gtvRekap.DataController.SetValue(recSelect, gtvRekapTambLain.Index, tottamb);
       gtvRekap.DataController.SetValue(recSelect, gtvRekapTHP.Index, nTHP);
       gtvRekap.DataController.PostEditingData;
       gtvRekap.DataController.Post(True);
     end;
   qryAdd1.Free;
   qryAdd2.Free;
   Action := caFree;
   qryExec.Free;
end;

procedure TfrmPayrollTambahanBali.FormCreate(Sender: TObject);
begin
   qryAdd1 := TMyQuery.Create(Self);
   qryAdd1.Connection := DMDB.dbInternal;
   qryAdd1.SQL.Add('select * from temptable');
   qryAdd1.Active := true;

   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qryAdd2 := TMyQuery.Create(Self);
   qryAdd2.Connection := DMDB.dbInternal;
   qryAdd2.SQL.Add('select * from temptable');
   qryAdd2.Active := true;
end;

end.
