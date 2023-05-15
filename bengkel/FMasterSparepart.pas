unit FMasterSparepart;

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
  TfrmMasterSparepart = class(TForm)
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
    edKodeSparepart: TcxTextEdit;
    edNamaSparepart: TcxTextEdit;
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
    gtbListsatuan: TcxGridDBColumn;
    gtbListkodesparepart: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure edTypeKendaraanKeyPress(Sender: TObject; var Key: Char);
    procedure edChargeKeyPress(Sender: TObject; var Key: Char);
    procedure edHargaKeyPress(Sender: TObject; var Key: Char);
    procedure ckAktifKeyPress(Sender: TObject; var Key: Char);
    procedure ckEditKeyPress(Sender: TObject; var Key: Char);
    procedure edKodeSparepartKeyPress(Sender: TObject; var Key: Char);
    procedure edNamaSparepartKeyPress(Sender: TObject; var Key: Char);
    procedure edSatuanKeyPress(Sender: TObject; var Key: Char);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);

  private
    { Private declarations }
    qryPart1, qryPart2 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmMasterSparepart: TfrmMasterSparepart;

implementation

{$R *.dfm}

uses FMain, FdmDB;

procedure TfrmMasterSparepart.btnSaveClick(Sender: TObject);
var
  kodeBahan : String;
begin
   if (edKodeSparepart.Text = '') then
      begin
          ShowMessage('Nama Bahan Masih Kosong');
          Exit;
      end;

    qryPart2.Close;
    qryPart2.SQL.Clear;
    qryPart2.SQL.Add('select kodepart from ben_bengkel_sparepart where kodepart = ''' +
        edKodeSparepart.Text + '''');
    qryPart2.Open;

    if (qryPart2.IsEmpty) then
      begin
         kodeBahan := edKodeSparepart.Text;
         //qryBahan1.Close;
         qryPart1.SQL.Clear;
         qryPart1.SQL.Add('insert into ben_bengkel_sparepart values(' +
             '''' + '' + ''',' +
             '''' + edKodeSparepart.Text + ''',' +
             '''' + vartostr(edCharge.EditValue) + ''',' +
             QuotedStr(edNamaSparepart.Text) + ',' +
             '''' + VarToStr(edHarga.EditValue) + ''',' +
             '''' + edSatuan.Text + ''',' +
             '''' + '' + ''',' +
             '''' + VarToStr(ckEdit.EditValue) + ''',' +
             '''' + VarToStr(ckAktif.EditValue) + ''',' +
             '''' + 'N' + ''',' +
             '''' + frmMain.USERAPPS + ''',' +
             '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
         qryPart1.ExecSQL;
         tblList.Refresh;
         gtbList.DataController.Refresh;
         btnReset.Click;
      end
    else if (NOT qryPart2.IsEmpty) then
      begin
        if MessageDlg('Kode Sparepart Sudah ada.  Update data pada list?',
           mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
           begin
             //ShowMessage('Klik Yess');
             qryPart1.SQL.Clear;
             qryPart1.SQL.Add('update ben_bengkel_sparepart set ' +
                 'kodecharge = ''' + vartostr(edCharge.EditValue) + ''',' +
                 'deskripsi = ' + QuotedStr(edNamaSparepart.Text) + ',' +
                 'price = ''' + VarToStr(edHarga.EditValue) + ''',' +
                 'satuan = ''' + edSatuan.Text + ''',' +
                 'isedit = ''' + VarToStr(ckEdit.EditValue) + ''',' +
                 'aktif = ''' + VarToStr(ckAktif.EditValue) + ''',' +
                 'lastedituser = ''' + frmMain.USERAPPS + ''',' +
                 'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
                 'where kodepart = ''' + edKodeSparepart.Text + '''');
             qryPart1.ExecSQL;
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

procedure TfrmMasterSparepart.ckAktifKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then ckEdit.SetFocus;
   if (key = #27) then edSatuan.SetFocus;
end;

procedure TfrmMasterSparepart.ckEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then btnSave.SetFocus;
   if (key = #27) then ckAktif.SetFocus;
end;

procedure TfrmMasterSparepart.btnDeleteClick(Sender: TObject);
var
  recSel : Integer;
  kodePart : String;
begin
   recSel := gtbList.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  kodePart := vartostr(gtbList.DataController.GetValue(recSel, gtbListkodesparepart.Index));
  if MessageDlg('Anda akan menghapus kode jasa ' + kodePart + #13#13 +
     'Yakin menghapus data ini?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
       begin
         qryPart1.SQL.Clear;
         qryPart1.SQL.Add('update ben_bengkel_sparepart set ' +
             'isdelete = ''' + 'Y' + ''', ' +
             'lastedituser = ''' + frmMain.USERAPPS + ''',' +
             'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
             'where kodepart = ''' + kodePart + '''');
         qryPart1.ExecSQL;
         tblList.Refresh;
         gtbList.DataController.Refresh;
       end
     else
       begin
           ShowMessage('Delete Canceled !');
           Exit;
       end;
end;

procedure TfrmMasterSparepart.btnEditClick(Sender: TObject);
var
  recSel : Integer;
  kodePart : String;
begin
  recSel := gtbList.DataController.GetFocusedRecordIndex;
  if (recSel < 0) then Exit;
  kodePart := vartostr(gtbList.DataController.GetValue(recSel, gtbListkodesparepart.Index));
  qryPart1.Close;
  qryPart1.SQL.Clear;
  qryPart1.SQL.Add('select kodepart, kodecharge, deskripsi, price, satuan, isedit, aktif ' +
      'from ben_bengkel_sparepart where kodepart = ''' + kodePart + '''');
  qryPart1.Open;
  edKodeSparepart.Text := kodePart;
  edCharge.EditValue := qryPart1.Fields[1].AsString;
  edNamaSparepart.text := qryPart1.Fields[2].AsString;
  edHarga.EditValue := qryPart1.Fields[3].AsFloat;
  edSatuan.EditValue := qryPart1.Fields[4].AsString;
  ckEdit.EditValue := qryPart1.Fields[5].AsString;
  ckAktif.EditValue := qryPart1.Fields[6].AsString;
  edKodeSparepart.Properties.ReadOnly := True;
  edCharge.SetFocus;
end;

procedure TfrmMasterSparepart.btnResetClick(Sender: TObject);
begin
   edKodeSparepart.Clear;
   edNamaSparepart.Clear;
   edHarga.EditValue := 0;
   edCharge.ClearSelection;
   ckAktif.Checked := True;
   ckEdit.Checked := True;
   edSatuan.Clear;
   edKodeSparepart.Properties.ReadOnly := False;
   edKodeSparepart.SetFocus;
end;

procedure TfrmMasterSparepart.edChargeKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edNamaSparepart.SetFocus;
   if (key = #27) then edKodeSparepart.SetFocus;
end;

procedure TfrmMasterSparepart.edHargaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edSatuan.SetFocus;
   if (key = #27) then edNamaSparepart.SetFocus;
end;

procedure TfrmMasterSparepart.edKodeSparepartKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edCharge.SetFocus;

end;

procedure TfrmMasterSparepart.edNamaSparepartKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then edHarga.SetFocus;
   if (key = #27) then edCharge.SetFocus;
end;

procedure TfrmMasterSparepart.edSatuanKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then ckAktif.SetFocus;
   if (key = #27) then edHarga.SetFocus;
end;

procedure TfrmMasterSparepart.edTypeKendaraanKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then edCharge.SetFocus;
   if (key = #27) then btnReset.SetFocus;
end;

procedure TfrmMasterSparepart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryPart1.Free;
  qryPart2.Free;
  Action := caFree;
end;

procedure TfrmMasterSparepart.FormCreate(Sender: TObject);
begin
   qryPart1 := TMyQuery.Create(Self);
   qryPart1.Connection := DMDB.dbInternal;
   qryPart1.SQL.Add('select * from temptable');
   qryPart1.Active := true;

   qryPart2 := TMyQuery.Create(Self);
   qryPart2.Connection := DMDB.dbInternal;
   qryPart2.SQL.Add('select * from temptable');
   qryPart2.Active := true;

   tblList.Active := True;
   gtbList.DataController.Refresh;
   tblSatuan.Active := True;
   tblCharge.Active := True;
end;

end.
