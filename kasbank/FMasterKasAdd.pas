unit FMasterKasAdd;

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
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DBAccess, strUtils, MyAccess, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmMasterKasAdd = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    edOutlet: TcxLookupComboBox;
    edNama: TEdit;
    Label2: TLabel;
    Label6: TLabel;
    edKodeKas: TEdit;
    btnAuto: TButton;
    btnSimpan: TButton;
    btnCancel: TButton;
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNamaKeyPress(Sender: TObject; var Key: Char);
    procedure btnAutoClick(Sender: TObject);
    procedure edOutletKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryAdd1, qryAdd2 : TMyQuery;
    procedure InsertKas;
    procedure UpdateKas;
  public
    { Public declarations }
  end;

var
  frmMasterKasAdd: TfrmMasterKasAdd;

implementation

{$R *.dfm}

uses FdmDB, FMasterKas, FMenuMain;

procedure TfrmMasterKasAdd.edNamaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      btnAuto.Click;
      btnSimpan.SetFocus;
    end;

end;

procedure TfrmMasterKasAdd.edOutletKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edNama.SetFocus;
  
end;

procedure TfrmMasterKasAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryAdd1.Free;
  qryAdd2.Free;
  Action := caFree;
end;

procedure TfrmMasterKasAdd.FormCreate(Sender: TObject);
begin
   qryAdd1 := TMyQuery.Create(Self);
   qryAdd1.Connection := DMDB.StoreDB;
   qryAdd1.SQL.Add('select * from temptable');
   qryAdd1.Active := true;

   qryAdd2 := TMyQuery.Create(Self);
   qryAdd2.Connection := DMDB.StoreDB;
   qryAdd2.SQL.Add('select * from temptable');
   qryAdd2.Active := true;
end;

procedure TfrmMasterKasAdd.InsertKas;
var
  strSync : String;
begin
  qryAdd1.Close;
  qryAdd1.SQL.Clear;
  qryAdd1.SQL.Add('select kodekas from ben_master_kas where kodekas = ''' +
        edKodeKas.Text + '''');
  qryAdd1.Open;
  if (qryAdd1.IsEmpty) then
    begin
      DMDB.qryExec.SQL.Clear;
      DMDB.qryExec.SQL.Add('insert into ben_master_kas values(' +
          '''' + '' + ''',' +
          '''' + vartostr(edOutlet.EditValue) + ''',' +
          '''' + edKodeKas.Text  + ''',' +
          QuotedStr(edNama.Text) + ',' +
          '''' + frmMenuMain.USERAPP + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          '''' + '' + ''');');
      strSync := 'insert into ben_master_kas values(' +
          '''' + '' + ''',' +
          '''' + vartostr(edOutlet.EditValue) + ''',' +
          '''' + edKodeKas.Text  + ''',' +
          QuotedStr(edNama.Text) + ',' +
          '''' + frmMenuMain.USERAPP + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          '''' + '' + ''');';
      DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                  '''' + '' + ''',' +
                  '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                  QuotedStr(frmMenuMain.USERAPP) + ',' +
                  '''' + frmMenuMain.IDOUTLET + ''',' +
                  QuotedStr(strsync) + ',' +
                  '''' + 'Y' + ''');');
      DMDB.qryExec.SQL.Add('insert into ben_saldo_kas values(' +
          '''' + '' + ''',' +
          '''' + edKodeKas.Text + ''',' +
          '''' + '2017-01-01' + ''',' +
          '''' + '0' + ''',' +
          '''' + frmMenuMain.USERAPP + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
      strSync := 'insert into ben_saldo_kas values(' +
          '''' + '' + ''',' +
          '''' + edKodeKas.Text + ''',' +
          '''' + '2017-01-01' + ''',' +
          '''' + '0' + ''',' +
          '''' + frmMenuMain.USERAPP + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');';
      DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                  '''' + '' + ''',' +
                  '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                  QuotedStr(frmMenuMain.USERAPP) + ',' +
                  '''' + frmMenuMain.IDOUTLET + ''',' +
                  QuotedStr(strsync) + ',' +
                  '''' + 'N' + ''');');
      DMDB.qryExec.ExecSQL;
      frmMasterKas.tblMasterKas.Refresh;
      frmMasterKas.gtbKas.DataController.Refresh;
      ShowMessage('Master Kas Sudah Disimpan');
      frmMasterKasAdd.Close;
    end
  else if (NOT qryAdd1.IsEmpty) then
    begin
      ShowMessage('Kode Kas Sudah Ada !');
      Exit;
    end;
end;

procedure TfrmMasterKasAdd.UpdateKas;
var
  strSync : String;
begin
  DMDB.qryExec.SQL.Clear;
  DMDB.qryExec.SQL.Add('update ben_master_kas set ' +
          'idoutlet = ''' + vartostr(edOutlet.EditValue) + ''',' +
          'namakas = ' +QuotedStr(edNama.Text) + ',' +
          'lastuseredit = ''' + frmMenuMain.USERAPP + ''',' +
          'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
          'where kodekas = ''' + edKodeKas.Text + ''';');
  strsync := 'update ben_master_kas set ' +
          'idoutlet = ''' + vartostr(edOutlet.EditValue) + ''',' +
          'namakas = ' +QuotedStr(edNama.Text) + ',' +
          'lastuseredit = ''' + frmMenuMain.USERAPP + ''',' +
          'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
          'where kodekas = ''' + edKodeKas.Text + ''';';
  DMDB.qryExec.SQL.Add('insert into ben_hist_sync values(' +
                  '''' + '' + ''',' +
                  '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                  QuotedStr(frmMenuMain.USERAPP) + ',' +
                  '''' + frmMenuMain.IDOUTLET + ''',' +
                  QuotedStr(strsync) + ',' +
                  '''' + 'Y' + ''');');
  DMDB.qryExec.ExecSQL;
  frmMasterKas.tblMasterKas.Refresh;
  frmMasterKas.gtbKas.DataController.Refresh;
  ShowMessage('Master Kas Sudah Disimpan');
  frmMasterKasAdd.Close;
end;

procedure TfrmMasterKasAdd.btnAutoClick(Sender: TObject);
var
  kodeOutlet, kodekaslast, strLast, newKode :  String;
  lastID, panjang, newID : Integer;
begin
  kodeOutlet := vartostr(edOutlet.EditValue);
  qryAdd1.Close;
  qryAdd1.SQL.Clear;
  qryAdd1.SQL.Add('select kodekas from ben_master_kas where idoutlet = ''' +
      kodeOutlet + ''' ORDER BY kodekas ASC');
  qryAdd1.Open;
  qryAdd1.Last;
  if (qryAdd1.IsEmpty) then
    begin
      newKode := 'KK.' + kodeOutlet + '.01';
    end
  else if (NOT qryAdd1.IsEmpty) then
    begin
      kodekaslast := qryAdd1.Fields[0].AsString;
      strLast := RightStr(kodekaslast, 2);
      lastID := StrToInt(strLast);
      newID := lastID + 1;
      case Length(inttostr(newID)) of
        1 : newKode := 'KK.' + kodeOutlet + '.0' + inttostr(newID);
        2 : newKode := 'KK.' + kodeOutlet + '.' + inttostr(newID);
      end;

    end;
    edKodeKas.Text := newKode;
end;

procedure TfrmMasterKasAdd.btnSimpanClick(Sender: TObject);
begin
  if (btnSimpan.Tag = 0) then
    begin
      InsertKas;
    end
  else if (btnSimpan.Tag = 1) then
    begin
      UpdateKas;
    end;
end;

end.
