unit FMasterBahan;

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
  TfrmMasterBahan = class(TForm)
    tblList: TMyQuery;
    dsTblList: TMyDataSource;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListautonum: TcxGridDBColumn;
    gtbListkodecharge: TcxGridDBColumn;
    gtbListdeskripsi: TcxGridDBColumn;
    gtbListprice: TcxGridDBColumn;
    gtbListnotes: TcxGridDBColumn;
    gtbListaktif: TcxGridDBColumn;
    gtbListisdelete: TcxGridDBColumn;
    gtbListlastedituser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    tblSatuan: TMyTable;
    dsTblSatuan: TMyDataSource;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edKodeBahan: TcxTextEdit;
    edNamaBahan: TcxTextEdit;
    edCharge: TcxLookupComboBox;
    tblCharge: TMyTable;
    dsTblCharge: TMyDataSource;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edHarga: TcxCalcEdit;
    cxLabel5: TcxLabel;
    ckAktif: TcxCheckBox;
    btnReset: TcxButton;
    ckEdit: TcxCheckBox;
    gtbListisedit: TcxGridDBColumn;
    btnSave: TcxButton;
    btnEdit: TcxButton;
    btnDelete: TcxButton;
    edSatuan: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    gtbListkodebahan: TcxGridDBColumn;
    gtbListsatuan: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure edTypeKendaraanKeyPress(Sender: TObject; var Key: Char);
    procedure edChargeKeyPress(Sender: TObject; var Key: Char);
    procedure edHargaKeyPress(Sender: TObject; var Key: Char);
    procedure ckAktifKeyPress(Sender: TObject; var Key: Char);
    procedure ckEditKeyPress(Sender: TObject; var Key: Char);
    procedure edKodeBahanKeyPress(Sender: TObject; var Key: Char);
    procedure edNamaBahanKeyPress(Sender: TObject; var Key: Char);
    procedure edSatuanKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);

  private
    { Private declarations }
    qryBahan1, qryBahan2 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmMasterBahan: TfrmMasterBahan;

implementation

{$R *.dfm}

uses FMain, FdmDB;

procedure TfrmMasterBahan.btnSaveClick(Sender: TObject);
var
  kodeBahan : String;
begin
    if (edKodeBahan.Text = '') then
      begin
          ShowMessage('Nama Bahan Masih Kosong');
          Exit;
      end;

    qryBahan2.Close;
    qryBahan2.SQL.Clear;
    qryBahan2.SQL.Add('select kodebahan from ben_bengkel_bahan where kodebahan = ''' +
        edKodeBahan.Text + '''');
    qryBahan2.Open;

    if (qryBahan2.IsEmpty) then
      begin
         kodeBahan := edKodeBahan.Text;
         //qryBahan1.Close;
         qryBahan1.SQL.Clear;
         qryBahan1.SQL.Add('insert into ben_bengkel_bahan values(' +
             '''' + '' + ''',' +
             '''' + edKodeBahan.Text + ''',' +
             '''' + vartostr(edCharge.EditValue) + ''',' +
             QuotedStr(edNamaBahan.Text) + ',' +
             '''' + VarToStr(edHarga.EditValue) + ''',' +
             '''' + edSatuan.Text + ''',' +
             '''' + '' + ''',' +
             '''' + VarToStr(ckEdit.EditValue) + ''',' +
             '''' + VarToStr(ckAktif.EditValue) + ''',' +
             '''' + 'N' + ''',' +
             '''' + frmMain.USERAPPS + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
         qryBahan1.ExecSQL;
         tblList.Refresh;
         gtbList.DataController.Refresh;
         btnReset.Click;
      end
    else if (NOT qryBahan2.IsEmpty) then
      begin
        if MessageDlg('Kode Bahan Sudah ada.  Update data pada list?',
           mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
           begin
             //ShowMessage('Klik Yess');
             qryBahan1.SQL.Clear;
             qryBahan1.SQL.Add('update ben_bengkel_bahan set ' +
                 'kodecharge = ''' + vartostr(edCharge.EditValue) + ''',' +
                 'deskripsi = ' + QuotedStr(edNamaBahan.Text) + ',' +
                 'price = ''' + VarToStr(edHarga.EditValue) + ''',' +
                 'satuan = ''' + edSatuan.Text + ''',' +
                 'isedit = ''' + VarToStr(ckEdit.EditValue) + ''',' +
                 'aktif = ''' + VarToStr(ckAktif.EditValue) + ''',' +
                 'lastedituser = ''' + frmMain.USERAPPS + ''',' +
                 'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
                 'where kodebahan = ''' + edKodeBahan.Text + '''');
             qryBahan1.ExecSQL;
             tblList.Refresh;
             gtbList.DataController.Refresh;
             btnReset.Click;
             ShowMessage('Update Selesai !');
           end
        else
          begin
            ShowMessage('Update Canceled !');
            btnReset.Click;
          end;

      end;
end;

procedure TfrmMasterBahan.ckAktifKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then ckEdit.SetFocus;
   if (key = #27) then edSatuan.SetFocus;
end;

procedure TfrmMasterBahan.ckEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then btnSave.SetFocus;
   if (key = #27) then ckAktif.SetFocus;
end;

procedure TfrmMasterBahan.btnDeleteClick(Sender: TObject);
var
  recSel : Integer;
  kodeBahan : String;
begin
  recSel := gtbList.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  kodeBahan := vartostr(gtbList.DataController.GetValue(recSel, gtbListkodebahan.Index));
  if MessageDlg('Anda akan menghapus kode jasa ' + kodeBahan + #13#13 +
     'Yakin menghapus data ini?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
       begin
         qryBahan1.SQL.Clear;
         qryBahan1.SQL.Add('update ben_bengkel_bahan set ' +
             'isdelete = ''' + 'Y' + ''' ' +
             'where kodebahan = ''' + kodeBahan + '''');
         qryBahan1.ExecSQL;
         tblList.Refresh;
         gtbList.DataController.Refresh;
       end
     else
       begin
           ShowMessage('Delete Canceled !');
           Exit;
       end;
end;

procedure TfrmMasterBahan.btnEditClick(Sender: TObject);
var
  recSel : Integer;
  kodeBahan : String;
begin
  recSel := gtbList.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  kodeBahan := vartostr(gtbList.DataController.GetValue(recSel, gtbListkodebahan.Index));
  qryBahan1.Close;
  qryBahan1.SQL.Clear;
  qryBahan1.SQL.Add('select kodebahan, kodecharge, deskripsi, price, satuan, isedit, aktif ' +
      'from ben_bengkel_bahan where kodebahan = ''' + kodeBahan + '''');
  qryBahan1.Open;
  edKodeBahan.Text := kodeBahan;
  edCharge.EditValue := qryBahan1.Fields[1].AsString;
  edNamaBahan.text := qryBahan1.Fields[2].AsString;
  edHarga.EditValue := qryBahan1.Fields[3].AsFloat;
  edSatuan.EditValue := qryBahan1.Fields[4].AsString;
  ckEdit.EditValue := qryBahan1.Fields[5].AsString;
  ckAktif.EditValue := qryBahan1.Fields[6].AsString;
  edKodeBahan.Properties.ReadOnly := True;
  edCharge.SetFocus;
end;

procedure TfrmMasterBahan.btnResetClick(Sender: TObject);
begin
   edKodeBahan.Clear;
   edNamaBahan.Clear;
   edHarga.EditValue := 0;
   edCharge.ClearSelection;
   ckAktif.Checked := True;
   ckEdit.Checked := True;
   edSatuan.Clear;
   edKodeBahan.Properties.ReadOnly := False;
   edKodeBahan.SetFocus;
end;

procedure TfrmMasterBahan.edChargeKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edNamaBahan.SetFocus;
   if (key = #27) then edKodeBahan.SetFocus;
end;

procedure TfrmMasterBahan.edHargaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edSatuan.SetFocus;
   if (key = #27) then edNamaBahan.SetFocus;
end;

procedure TfrmMasterBahan.edKodeBahanKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edCharge.SetFocus;

end;

procedure TfrmMasterBahan.edNamaBahanKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edHarga.SetFocus;
   if (key = #27) then edCharge.SetFocus;
end;

procedure TfrmMasterBahan.edSatuanKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then ckAktif.SetFocus;
   if (key = #27) then edHarga.SetFocus;
end;

procedure TfrmMasterBahan.edTypeKendaraanKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then edCharge.SetFocus;
   if (key = #27) then btnReset.SetFocus;
end;

procedure TfrmMasterBahan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryBahan1.Free;
  qryBahan2.Free;
  Action := caFree;
end;

procedure TfrmMasterBahan.FormCreate(Sender: TObject);
begin
   qryBahan1 := TMyQuery.Create(Self);
   qryBahan1.Connection := DMDB.dbInternal;
   qryBahan1.SQL.Add('select * from temptable');
   qryBahan1.Active := true;

   qryBahan2 := TMyQuery.Create(Self);
   qryBahan2.Connection := DMDB.dbInternal;
   qryBahan2.SQL.Add('select * from temptable');
   qryBahan2.Active := true;

   tblList.Active := True;
   gtbList.DataController.Refresh;
   tblSatuan.Active := True;
   tblCharge.Active := True;
end;

end.
