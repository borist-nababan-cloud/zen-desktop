unit FMasterBankAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  strUtils, MyAccess, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxCheckBox;

type
  TfrmMasterBankAdd = class(TForm)
    Label4: TLabel;
    edNama: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNorek: TEdit;
    Label5: TLabel;
    edPemilik: TEdit;
    Label6: TLabel;
    edKodeBank: TEdit;
    btnAuto: TButton;
    btnSimpan: TButton;
    btnCancel: TButton;
    ckEDC: TcxCheckBox;
    ckAktif: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNamaKeyPress(Sender: TObject; var Key: Char);
    procedure edNorekKeyPress(Sender: TObject; var Key: Char);
    procedure edPemilikKeyPress(Sender: TObject; var Key: Char);
    procedure edOutletKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAutoClick(Sender: TObject);
    procedure edNamaChange(Sender: TObject);
    procedure edNorekChange(Sender: TObject);
  private
    { Private declarations }
    qryAdd1, qryAdd2, qryExec : TMyQuery;
    procedure GenerateBankNumb;
    procedure SimpanBank;
    procedure UpdateBank;
  public
    { Public declarations }
  end;

var
  frmMasterBankAdd: TfrmMasterBankAdd;

implementation

{$R *.dfm}

uses FMain, FdmDB, FMasterBank;

procedure TfrmMasterBankAdd.SimpanBank;
var
  strSync : String;
begin
  qryAdd1.Close;
  qryAdd1.SQL.Clear;
  qryAdd1.SQL.Add('select kodebank from ben_master_bank where kodebank = ''' +
        edKodeBank.Text + '''');
  qryAdd1.Open;
  if (qryAdd1.IsEmpty) then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into ben_master_bank values(' +
          '''' + '' + ''',' +
          '''' + frmMain.APP_OUTLETID + ''',' +
          '''' + edKodeBank.Text  + ''',' +
          QuotedStr(edNama.Text) + ',' +
          '''' + edNorek.Text + ''',' +
          QuotedStr(edPemilik.Text) + ',' +
          '''' + VarToStr(ckEDC.EditValue) + ''',' +
          '''' + VarToStr(ckAktif.EditValue) + ''',' +
          '''' + frmMain.USERAPPS + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          '''' + '' + ''');');

      qryExec.SQL.Add('insert into ben_saldo_bank values(' +
          '''' + '' + ''',' +
          '''' + edKodeBank.Text + ''',' +
          '''' + '2017-01-01' + ''',' +
          '''' + '0' + ''',' +
          '''' + frmMain.USERAPPS + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');

      qryExec.ExecSQL;
      frmMasterBank.tblMasterBank.Refresh;
      frmMasterBank.gtbBank.DataController.Refresh;
      ShowMessage('Master Bank Sudah Disimpan');
      frmMasterBankAdd.Close;
    end
  else if (NOT qryAdd1.IsEmpty) then
    begin
      ShowMessage('Kode Bank Sudah Ada !');
      Exit;
    end;
end;

procedure TfrmMasterBankAdd.UpdateBank;
var
  strsync : String;
begin
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update ben_master_bank set ' +
          'idoutlet = ''' + frmMain.APP_OUTLETID + ''',' +
          'namabank = ' +QuotedStr(edNama.Text) + ',' +
          'norek = ''' + edNorek.Text + ''',' +
          'asedc = ''' + VarToStr(ckEDC.EditValue) + ''',' +
          'aktif = ''' + VarToStr(ckAktif.EditValue) + ''',' +
          'namarekening = ' + QuotedStr(edPemilik.Text) + ',' +
          'lastuseredit = ''' + frmMain.USERAPPS + ''',' +
          'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
          'where kodebank = ''' + edKodeBank.Text + ''';');

  qryExec.ExecSQL;
  frmMasterBank.tblMasterBank.Refresh;
  frmMasterBank.gtbBank.DataController.Refresh;
  ShowMessage('Master Bank Sudah Disimpan');
  frmMasterBankAdd.Close;
end;

procedure TfrmMasterBankAdd.btnAutoClick(Sender: TObject);
begin
   edKodeBank.Text := LeftStr(edNama.Text, 3) + '#' + RightStr(edNorek.Text, 4);
end;

procedure TfrmMasterBankAdd.btnCancelClick(Sender: TObject);
begin
  frmMasterBankAdd.Close;
end;

procedure TfrmMasterBankAdd.btnSimpanClick(Sender: TObject);
begin
  if (edKodeBank.Text = '') then
    begin
      ShowMessage('Kode Bank Masih Kosong !!' + #13 +
          'Klik Tombol Auto !');
      Exit;
    end;
  
  if (btnSimpan.Tag = 0) then
    begin
       SimpanBank;
    end
  else if (btnSimpan.Tag = 1) then
    begin
      UpdateBank;
    end;
end;

procedure TfrmMasterBankAdd.edNamaChange(Sender: TObject);
begin
    GenerateBankNumb;
end;

procedure TfrmMasterBankAdd.edNamaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
      begin
        GenerateBankNumb;
        edNorek.SetFocus;
      end;
end;

procedure TfrmMasterBankAdd.edNorekChange(Sender: TObject);
begin
    GenerateBankNumb;
end;

procedure TfrmMasterBankAdd.edNorekKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
     begin
        GenerateBankNumb;
        edPemilik.SetFocus;
     end;
end;

procedure TfrmMasterBankAdd.edOutletKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edNama.SetFocus;
end;

procedure TfrmMasterBankAdd.edPemilikKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then btnSimpan.SetFocus;
end;

procedure TfrmMasterBankAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryAdd1.Free;
  qryAdd2.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmMasterBankAdd.FormCreate(Sender: TObject);
begin
   qryAdd1 := TMyQuery.Create(Self);
   qryAdd1.Connection := DMDB.dbInternal;
   qryAdd1.SQL.Add('select * from temptable');
   qryAdd1.Active := true;

   qryAdd2 := TMyQuery.Create(Self);
   qryAdd2.Connection := DMDB.dbInternal;
   qryAdd2.SQL.Add('select * from temptable');
   qryAdd2.Active := true;

   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;
end;

procedure TfrmMasterBankAdd.GenerateBankNumb;
begin
  edKodeBank.Text := LeftStr(edNama.Text, 4) + '#' + LeftStr(edNorek.Text, 3) + RightStr(edNorek.Text, 3);
end;

end.
