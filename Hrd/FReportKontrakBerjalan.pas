unit FReportKontrakBerjalan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridLevel, cxGrid, cxCalc,
  DB, cxTextEdit, cxDBLookupComboBox, ShellApi, cxGridExportLink, cxCalendar,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, MemDS, MyAccess;

type
  TfrmReportKontrakBerjalan = class(TForm)
    Label1: TLabel;
    btnLoad: TButton;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvKontrak: TcxGridTableView;
    gtvKontrakKode: TcxGridColumn;
    gtvKontrakIdFinger: TcxGridColumn;
    gtvKontrakNama: TcxGridColumn;
    gtvKontrakDivisi: TcxGridColumn;
    gtvKontrakNorek: TcxGridColumn;
    gtvKontrakNamaRek: TcxGridColumn;
    gtvKontrakGapok: TcxGridColumn;
    gtvKontrakUM: TcxGridColumn;
    gtvKontrakTunjangan1: TcxGridColumn;
    gtvKontrakBPJS: TcxGridColumn;
    gtvKontrakPotongan: TcxGridColumn;
    gtvKontrakKomisi: TcxGridColumn;
    gtvKontrakTHP: TcxGridColumn;
    gtvKontrakPotongan2: TcxGridColumn;
    gtvKontrakTunjangan2: TcxGridColumn;
    gtvKontrakType: TcxGridColumn;
    tblKontrak: TMyTable;
    dsTblKontrak: TDataSource;
    tblDepartemen: TMyTable;
    dsTblDepartemen: TDataSource;
    gtvKontrakTglKontrak: TcxGridColumn;
    dlgSave: TSaveDialog;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    qryRepKontrak1 : TMyQuery;
    qryRepKontrak2 : TMyQuery;
  public
    { Public declarations }
    ISADMIN : Boolean;
  end;

var
  frmReportKontrakBerjalan: TfrmReportKontrakBerjalan;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmReportKontrakBerjalan.btnLoadClick(Sender: TObject);
var
  i, newRec : Integer;
begin
   gtvKontrak.DataController.SelectAll;
   gtvKontrak.DataController.DeleteSelection;
   if (ISADMIN = True) then
     begin
       qryRepKontrak1.Close;
       qryRepKontrak1.SQL.Clear;
       qryRepKontrak1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, ' +
          'departemen, kodekontrak, tglhabiskontrak, ' +
          'namabank, norek, namarek FROM ben_hrd_karyawan_info ' +
          'WHERE active = ''' + 'Y' + ''' and isadmin = ''' + 'Y' + '''');
       qryRepKontrak1.Open;
       qryRepKontrak1.First;
     end
   else if (ISADMIN = False) then
     begin
       qryRepKontrak1.Close;
       qryRepKontrak1.SQL.Clear;
       qryRepKontrak1.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, ' +
          'departemen, kodekontrak, tglhabiskontrak, ' +
          'namabank, norek, namarek FROM ben_hrd_karyawan_info ' +
          'WHERE active = ''' + 'Y' + '''');
       qryRepKontrak1.Open;
       qryRepKontrak1.First;
     end;
  for i := 0 to qryRepKontrak1.RecordCount - 1 do
    begin
      newRec := gtvKontrak.DataController.InsertRecord(gtvKontrak.DataController.RecordCount);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakKode.Index, qryRepKontrak1.Fields[0].AsString);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakIdFinger.Index, qryRepKontrak1.Fields[1].AsString);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakNama.Index, qryRepKontrak1.Fields[2].AsString);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakDivisi.Index, qryRepKontrak1.Fields[3].AsString);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakNorek.Index, qryRepKontrak1.Fields[7].AsString);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakNamaRek.Index, qryRepKontrak1.Fields[8].AsString);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakTglKontrak.Index, qryRepKontrak1.Fields[5].AsDateTime);
      //gtvKontrak.DataController.SetValue(newRec, gtvKontrakKode.Index, qryRepKontrak1.Fields[0].AsString);
      //gtvKontrak.DataController.SetValue(newRec, gtvKontrakKode.Index, qryRepKontrak1.Fields[0].AsString);
      qryRepKontrak2.Close;
      qryRepKontrak2.SQL.Clear;
      qryRepKontrak2.SQL.Add('select nthp, gapok, transport, uangmakan, komisi, tunjangan1, tunjangan2, ' +
          'potongan1, potongan2, kodekontrak from ben_hrd_kontrak_details where kodekaryawan = ''' +
          qryRepKontrak1.Fields[0].AsString + ''' ORDER BY tglhabis DESC');
      qryRepKontrak2.Open;
      qryRepKontrak2.First;
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakTHP.Index, qryRepKontrak2.Fields[0].AsFloat);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakGapok.Index, qryRepKontrak2.Fields[1].AsFloat);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakUM.Index, qryRepKontrak2.Fields[3].AsFloat);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakKomisi.Index, qryRepKontrak2.Fields[4].AsFloat);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakTunjangan1.Index, qryRepKontrak2.Fields[5].AsFloat);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakTunjangan2.Index, qryRepKontrak2.Fields[2].AsFloat);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakBPJS.Index, qryRepKontrak2.Fields[6].AsFloat);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakPotongan.Index, qryRepKontrak2.Fields[7].AsFloat);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakPotongan2.Index, qryRepKontrak2.Fields[8].AsFloat);
      gtvKontrak.DataController.SetValue(newRec, gtvKontrakType.Index, qryRepKontrak2.Fields[9].AsString);
      gtvKontrak.DataController.PostEditingData;
      gtvKontrak.DataController.Post(True);
      qryRepKontrak1.Next;
      Application.ProcessMessages;
    end;
   ShowMessage('Load Finish');
end;

procedure TfrmReportKontrakBerjalan.Button1Click(Sender: TObject);
begin
  dlgSave.Title := '[Excel 97-2003] Export to...';
     dlgSave.Filter := 'Microsoft Excel 97-2003 (*.xls)|*.xls';
     dlgSave.FileName := '';
     if (dlgSave.Execute) then
        begin
             if (dlgSave.FileName <> '') then
                begin
                     ExportGridToExcel(dlgSave.FileName, cxGrid1, true, true, true, 'xls');
                     if (MessageDlg('Would you like to open exported file now?',
                         mtConfirmation, mbOKCancel, 0) = mrOK) then
                         begin
                              if (ExtractFileExt(dlgSave.FileName) = '.xls') then
                                 ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                              else
                                  ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName + '.xls'), pChar(''), pChar(ExtractFileDir(dlgSave.FileName + '.xls')), SW_MAXIMIZE)
                         end
                     else exit;
                end
             else exit;
        end
     else exit;
end;

procedure TfrmReportKontrakBerjalan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryRepKontrak1.Free;
  qryRepKontrak2.Free;
  Action := caFree;
end;

procedure TfrmReportKontrakBerjalan.FormCreate(Sender: TObject);
begin
   qryRepKontrak1 := TMyQuery.Create(Self);
   qryRepKontrak1.Connection := DMDB.dbInternal;
   qryRepKontrak1.SQL.Add('select * from temptable');
   qryRepKontrak1.Active := true;

   qryRepKontrak2 := TMyQuery.Create(Self);
   qryRepKontrak2.Connection := DMDB.dbInternal;
   qryRepKontrak2.SQL.Add('select * from temptable');
   qryRepKontrak2.Active := true;

   tblKontrak.Active := True;
end;

end.
