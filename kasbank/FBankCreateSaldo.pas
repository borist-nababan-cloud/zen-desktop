unit FBankCreateSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DateUtils, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DB,
  DBAccess, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCalendar, ExtCtrls, cxCalc,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, Vcl.ComCtrls, dxCore, cxDateUtils, MemDS, MyAccess;

type
  TfrmBankCreateSaldo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    edTypeKas: TcxLookupComboBox;
    tblBank: TMyQuery;
    dsTblBank: TDataSource;
    edLastDate: TcxDateEdit;
    edlastUser: TEdit;
    Shape1: TShape;
    Label3: TLabel;
    edLastValue: TcxCalcEdit;
    Label4: TLabel;
    Label5: TLabel;
    edTanggal: TcxDateEdit;
    Label6: TLabel;
    edNilai: TcxCalcEdit;
    btnUpdate: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure edTypeKasPropertiesChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
    qrySaldo1, qrySaldo2, qrySaldo3 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmBankCreateSaldo: TfrmBankCreateSaldo;

implementation

{$R *.dfm}

uses FdmDB, FMenuMain;

procedure TfrmBankCreateSaldo.btnUpdateClick(Sender: TObject);
var
  strSync : String;
begin
   qrySaldo2.Close;
   qrySaldo2.SQL.Clear;
   qrySaldo2.SQL.Add('select autonum from ben_saldo_kas where tanggal = ''' +
       FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''' AND kodekas = ''' +
       vartostr(edTypeKas.EditValue) + '''');
   qrySaldo2.Open;
   if (NOT qrySaldo2.IsEmpty) then
     begin
       ShowMessage('Maaf Saldo sudah ada !!');
       Exit;
     end
   else if (qrySaldo2.IsEmpty) then
     begin
       DMDB.qryExec.SQL.Clear;
       DMDB.qryExec.SQL.Add('insert into ben_saldo_bank values(' +
           '''' + '' + ''',' +
           '''' + vartostr(edTypeKas.EditValue) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
           '''' + FloatToStr(edNilai.EditValue) + ''',' +
           '''' + frmMenuMain.USERAPP + ''',' +
           '''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ''');');
       strSync := 'insert into ben_saldo_bank values(' +
           '''' + '' + ''',' +
           '''' + vartostr(edTypeKas.EditValue) + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
           '''' + FloatToStr(edNilai.EditValue) + ''',' +
           '''' + frmMenuMain.USERAPP + ''',' +
           '''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ''');';
       DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
           '''' + '' + ''',' +
           '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
           QuotedStr(frmMenuMain.USERAPP) + ',' +
           '''' + frmMenuMain.IDOUTLET + ''',' +
           QuotedStr(strsync) + ',' +
           '''' + 'N' + ''');');
       DMDB.qryExec.ExecSQL;
       ShowMessage('Data Saldo Sudah Di Update !!');
       frmBankCreateSaldo.Close;
     end;
end;

procedure TfrmBankCreateSaldo.btnCancelClick(Sender: TObject);
begin
   frmBankCreateSaldo.Close;
end;

procedure TfrmBankCreateSaldo.edTypeKasPropertiesChange(Sender: TObject);
begin
    qrySaldo1.Close;
    qrySaldo1.SQL.Clear;
    qrySaldo1.SQL.Add('select * from ben_saldo_bank where kodebank = ''' +
        vartostr(edTypeKas.EditValue) + ''' ORDER BY tanggal DESC');
    qrySaldo1.Open;
    qrySaldo1.First;
    edLastDate.Date := qrySaldo1.Fields[2].AsDateTime;
    edLastValue.EditValue := qrySaldo1.Fields[3].AsFloat;
    edlastUser.Text := qrySaldo1.Fields[4].AsString;
end;

procedure TfrmBankCreateSaldo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qrySaldo1.Free;
  qrySaldo2.Free;
  //tblKas.Active := False;
  Action := caFree;
end;

procedure TfrmBankCreateSaldo.FormCreate(Sender: TObject);
begin
   qrySaldo1 := TMyQuery.Create(Self);
   qrySaldo1.Connection := DMDB.StoreDB;
   qrySaldo1.SQL.Add('select * from temptable');
   qrySaldo1.Active := true;

   qrySaldo2 := TMyQuery.Create(Self);
   qrySaldo2.Connection := DMDB.StoreDB;
   qrySaldo2.SQL.Add('select * from temptable');
   qrySaldo2.Active := true;

   tblBank.Active := True;
   tblBank.Close;
   tblBank.SQL.Clear;
   tblBank.SQL.Add('select kodebank, namabank from ben_master_bank where ' +
         'idoutlet = ''' + frmMenuMain.IDOUTLET + '''');
   tblBank.Open;
   edTanggal.Date := Date;
end;

end.
