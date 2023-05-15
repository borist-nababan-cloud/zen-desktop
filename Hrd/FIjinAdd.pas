unit FIjinAdd;

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
  cxCalendar;

type
  TfrmIjinAdd = class(TForm)
    Label1: TLabel;
    qryKaryawan: TMyQuery;
    dsKaryawan: TDataSource;
    edNamaKaryawan: TcxLookupComboBox;
    Label2: TLabel;
    tblIjin: TMyTable;
    dsTblIjin: TDataSource;
    Label3: TLabel;
    edParameter: TcxLookupComboBox;
    edTanggal: TcxDateEdit;
    Label4: TLabel;
    Label5: TLabel;
    edKeterangan: TEdit;
    btnSimpan: TButton;
    btnCancel: TButton;
    btnUpdate: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
    qryAdd1, qryAdd2 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmIjinAdd: TfrmIjinAdd;

implementation

{$R *.dfm}
uses FdmDB, FMenuMain;

procedure TfrmIjinAdd.btnSimpanClick(Sender: TObject);
var
  strSync : String;
begin
   qryAdd1.Close;
   qryAdd1.SQL.Clear;
   qryAdd1.SQL.Add('select kodekaryawan from hrd_ijin where ' +
        'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''' ' +
        'AND kodekaryawan = ''' + vartostr(edNamaKaryawan.EditValue) + '''');
   qryAdd1.Open;
   if (NOT qryAdd1.IsEmpty) then
     begin
       ShowMessage('Data Ijin Karyawan sudah ada');
       Exit;
     end;
   DMDB.qryExec.SQL.Clear;
   DMDB.qryExec.SQL.Add('insert into hrd_ijin values(' +
        '''' + '' + ''',' +
        '''' + vartostr(edNamaKaryawan.EditValue) + ''',' +
        '''' + '' + ''',' +
        '''' + frmMenuMain.IDOUTLET + ''',' +
        '''' + edParameter.Text + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
        QuotedStr(edKeterangan.Text) + ',' +
        '''' + '' + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
        QuotedStr(frmMenuMain.USERAPP) + ',' +
        '''' + 'I' + ''',' +
        '''' + 'N' + ''');');
  strSync := 'insert into hrd_ijin values(' +
        '''' + '' + ''',' +
        '''' + vartostr(edNamaKaryawan.EditValue) + ''',' +
        '''' + '' + ''',' +
        '''' + frmMenuMain.IDOUTLET + ''',' +
        '''' + edParameter.Text + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''',' +
        '''' + edKeterangan.Text + ''',' +
        '''' + '' + ''',' +
        '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
        QuotedStr(frmMenuMain.USERAPP) + ',' +
        '''' + 'I' + ''',' +
        '''' + 'N' + ''');';
  DMDB.qryExec.SQL.Add('insert into hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMenuMain.USERAPP) + ',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
  DMDB.qryExec.ExecSQL;
  ShowMessage('Data Ijin sudah disimpan');
  frmIjinAdd.Close;
end;

procedure TfrmIjinAdd.btnUpdateClick(Sender: TObject);
var
  strSync : String;
begin
  qryAdd1.Close;
   qryAdd1.SQL.Clear;
   qryAdd1.SQL.Add('select kodekaryawan from hrd_ijin where ' +
        'tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''' ' +
        'AND kodekaryawan = ''' + vartostr(edNamaKaryawan.EditValue) + '''');
   qryAdd1.Open;
   if (qryAdd1.IsEmpty) then
     begin
       ShowMessage('Maaf Update Data Dibatalkan !!');
       Exit;
     end;
   DMDB.qryExec.SQL.Clear;
   DMDB.qryExec.SQL.Add('update hrd_ijin set ' +
       'kodeijin = ''' + edParameter.Text + ''',' +
       'keterangan = ' + QuotedStr(edKeterangan.Text) + ',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
       'lastedituser = ' +   QuotedStr(frmMenuMain.USERAPP) + ',' +
       'tagedit = ''' + 'E' + ''' ' +
       'where kodekaryawan = ''' + vartostr(edNamaKaryawan.EditValue) + ''' ' +
       'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''';');
   strSync := 'update hrd_ijin set ' +
       'kodeijin = ''' + edParameter.Text + ''',' +
       'keterangan = ' + QuotedStr(edKeterangan.Text) + ',' +
       'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
       'lastedituser = ' +   QuotedStr(frmMenuMain.USERAPP) + ',' +
       'tagedit = ''' + 'E' + ''' ' +
       'where kodekaryawan = ''' + vartostr(edNamaKaryawan.EditValue) + ''' ' +
       'AND tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''';';
  DMDB.qryExec.SQL.Add('insert into hist_sync values(' +
          '''' + '' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
          QuotedStr(frmMenuMain.USERAPP) + ',' +
          QuotedStr(strsync) + ',' +
          '''' + 'N' + ''',' +
          '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
  DMDB.qryExec.ExecSQL;
  ShowMessage('Data Ijin sudah disimpan');
  frmIjinAdd.Close;
end;

procedure TfrmIjinAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryAdd1.Free;
  qryAdd2.Free;
  qryKaryawan.Active := False;
  tblIjin.Active :=False;
  Action := caFree;
end;

procedure TfrmIjinAdd.FormCreate(Sender: TObject);
begin
  qryAdd1 := TMyQuery.Create(Self);
  qryAdd1.Connection := DMDB.StoreDB;
  qryAdd1.SQL.Add('select * from temptable');
  qryAdd1.Active := true;

  qryAdd2 := TMyQuery.Create(Self);
  qryAdd2.Connection := DMDB.StoreDB;
  qryAdd2.SQL.Add('select * from temptable');
  qryAdd2.Active := true;

   qryKaryawan.Close;
   qryKaryawan.SQL.Clear;
   qryKaryawan.SQL.Add('SELECT kodekaryawan, idkaryawan, namakaryawan ' +
        'FROM hrd_karyawan_info WHERE idoutlet = ''' + frmMenuMain.IDOUTLET + '''');
   qryKaryawan.Open;
   edTanggal.Date := Date;
   tblIjin.Active := True;
end;

end.
