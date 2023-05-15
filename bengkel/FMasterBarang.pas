unit FMasterBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, DBAccess, MyAccess, MemDS,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxLabel, cxGroupBox, cxCheckBox, cxCalc,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCalendar;

type
  TfrmMasterJasa = class(TForm)
    tblList: TMyQuery;
    dsTblList: TMyDataSource;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListautonum: TcxGridDBColumn;
    gtbListkodejasa: TcxGridDBColumn;
    gtbListkodetype: TcxGridDBColumn;
    gtbListkodecharge: TcxGridDBColumn;
    gtbListdeskripsi: TcxGridDBColumn;
    gtbListflatrate: TcxGridDBColumn;
    gtbListprice: TcxGridDBColumn;
    gtbListnotes: TcxGridDBColumn;
    gtbListaktif: TcxGridDBColumn;
    gtbListisdelete: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    tblType: TMyTable;
    dsTblType: TMyDataSource;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edKodeJasa: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNamaJasa: TcxTextEdit;
    edTypeKendaraan: TcxLookupComboBox;
    edCharge: TcxLookupComboBox;
    tblCharge: TMyTable;
    dsTblCharge: TMyDataSource;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edHarga: TcxCalcEdit;
    cxLabel5: TcxLabel;
    ckAktif: TcxCheckBox;
    btnReset: TcxButton;
    gtbListType2: TcxGridDBColumn;
    cxLabel6: TcxLabel;
    cxLookupComboBox3: TcxLookupComboBox;
    ckEdit: TcxCheckBox;
    gtbListisedit: TcxGridDBColumn;
    btnSave: TcxButton;
    btnEdit: TcxButton;
    btnDelete: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure edTypeKendaraanKeyPress(Sender: TObject; var Key: Char);
    procedure edChargeKeyPress(Sender: TObject; var Key: Char);
    procedure edNamaJasaKeyPress(Sender: TObject; var Key: Char);
    procedure edHargaKeyPress(Sender: TObject; var Key: Char);
    procedure ckAktifKeyPress(Sender: TObject; var Key: Char);
    procedure ckEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryJasa1, qryJasa2 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmMasterJasa: TfrmMasterJasa;

implementation

{$R *.dfm}

uses FMain, FdmDB;

procedure TfrmMasterJasa.btnSaveClick(Sender: TObject);
var
  kodejasa : String;
begin
   if (edKodeJasa.Text <> '') then
     begin

     end
   else if (edKodeJasa.Text = '') then
     begin
        if (edNamaJasa.Text = '') then
          begin
              ShowMessage('Nama Jasa Masih Kosong');
              Exit;
          end;
        qryJasa2.Close;
        qryJasa2.SQL.Clear;
        qryJasa2.SQL.Add('select kodejasa from ben_bengkel_jasa where kodetype = ''' +
            VarToStr(edTypeKendaraan.EditValue) + ''' AND deskripsi = '  +
            QuotedStr(edNamaJasa.Text));
        qryJasa2.Open;
        if (qryJasa2.IsEmpty) then
          begin
             kodejasa := VarToStr(edTypeKendaraan.EditValue) + '.' + FormatDateTime('yyMMddhhmmss', Now);
             //qryJasa1.Close;
             qryJasa1.SQL.Clear;
             qryJasa1.SQL.Add('insert into ben_bengkel_jasa values(' +
                 '''' + '' + ''',' +
                 '''' + kodejasa + ''',' +
                 '''' + vartostr(edTypeKendaraan.EditValue) + ''',' +
                 '''' + vartostr(edCharge.EditValue) + ''',' +
                 QuotedStr(edNamaJasa.Text) + ',' +
                 '''' + '1' + ''',' +
                 '''' + VarToStr(edHarga.EditValue) + ''',' +
                 '''' + '' + ''',' +
                 '''' + VarToStr(ckEdit.EditValue) + ''',' +
                 '''' + VarToStr(ckAktif.EditValue) + ''',' +
                 '''' + 'N' + ''',' +
                 '''' + frmMain.USERAPPS + ''',' +
                 '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
             qryJasa1.ExecSQL;
             tblList.Refresh;
             gtbList.DataController.Refresh;
             btnReset.Click;
          end
        else if (NOT qryJasa2.IsEmpty) then
          begin
            ShowMessage('Nama Jasa ' + edNamaJasa.Text + ' untuk Type Kendaraan ' + edTypeKendaraan.Text +
                       #13 + 'Sudah ada di dalam List !');
            gtbList.DataController.Search.Locate(gtbListkodejasa.Index, qryJasa2.Fields[0].AsString);
          end;

     end
end;

procedure TfrmMasterJasa.ckAktifKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then ckEdit.SetFocus;
   if (key = #27) then edHarga.SetFocus;
end;

procedure TfrmMasterJasa.ckEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then btnSave.SetFocus;
   if (key = #27) then ckAktif.SetFocus;
end;

procedure TfrmMasterJasa.btnResetClick(Sender: TObject);
begin
   edKodeJasa.Clear;
   edNamaJasa.Clear;
   edTypeKendaraan.Clear;
   edHarga.EditValue := 0;
   edCharge.ClearSelection;
   ckAktif.Checked := True;
   ckEdit.Checked := True;
   edTypeKendaraan.SetFocus;
end;

procedure TfrmMasterJasa.edChargeKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edNamaJasa.SetFocus;
   if (key = #27) then edKodeJasa.SetFocus;
end;

procedure TfrmMasterJasa.edHargaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then ckAktif.SetFocus;
   if (key = #27) then edNamaJasa.SetFocus;
end;

procedure TfrmMasterJasa.edNamaJasaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edHarga.SetFocus;
   if (key = #27) then edCharge.SetFocus;
end;

procedure TfrmMasterJasa.edTypeKendaraanKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then edCharge.SetFocus;
   if (key = #27) then btnReset.SetFocus;
end;

procedure TfrmMasterJasa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryJasa1.Free;
  qryJasa2.Free;
  Action := caFree;
end;

procedure TfrmMasterJasa.FormCreate(Sender: TObject);
begin
   qryJasa1 := TMyQuery.Create(Self);
   qryJasa1.Connection := DMDB.dbInternal;
   qryJasa1.SQL.Add('select * from temptable');
   qryJasa1.Active := true;

   qryJasa2 := TMyQuery.Create(Self);
   qryJasa2.Connection := DMDB.dbInternal;
   qryJasa2.SQL.Add('select * from temptable');
   qryJasa2.Active := true;

   tblList.Active := True;
   gtbList.DataController.Refresh;
   tblType.Active := True;
   tblCharge.Active := True;
end;

end.
