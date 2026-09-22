unit FPosMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, XSuperJSON, XSuperObject, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, DBAccess, MyAccess, MemDS, Vcl.StdCtrls, cxTextEdit, Vcl.Menus,
  cxButtons, cxCalc, AdvMenus, strUtils, cxCheckBox, cxCalendar,
  dxBarBuiltInMenu, cxPC, cxContainer, cxDropDownEdit, cxMaskEdit, cxLabel,
  Vcl.ExtCtrls;

type
  TfrmPosMainMenu = class(TForm)
    pgControl: TcxPageControl;
    PgMain: TcxTabSheet;
    Label1: TLabel;
    memStruktur: TMemo;
    cxGrid1: TcxGrid;
    gtbList: TcxGridDBTableView;
    gtbListnama_menu: TcxGridDBColumn;
    gtbListtype_menu: TcxGridDBColumn;
    gtbListjenis_jasa_id: TcxGridDBColumn;
    gtbListharga: TcxGridDBColumn;
    gtbListlama: TcxGridDBColumn;
    gtbListdisc_hh: TcxGridDBColumn;
    gtbListdisc_normal: TcxGridDBColumn;
    gtbListharga_hh: TcxGridDBColumn;
    gtbListharga_normal: TcxGridDBColumn;
    gtbListnotes: TcxGridDBColumn;
    gtbListaktif: TcxGridDBColumn;
    gtbListmenu_id: TcxGridDBColumn;
    gtbListlastuser: TcxGridDBColumn;
    gtbListlasteditdate: TcxGridDBColumn;
    gtbListColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    btnNew: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    btnRefresh: TcxButton;
    qryList: TMyQuery;
    dsQryList: TMyDataSource;
    pmImport: TAdvPopupMenu;
    Jasa1: TMenuItem;
    Produk1: TMenuItem;
    Additional1: TMenuItem;
    pgInput: TcxTabSheet;
    Label2: TLabel;
    rbType: TRadioGroup;
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    edJenis: TcxComboBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    edNamaMenu: TcxTextEdit;
    edHargaUtama: TcxCalcEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    edLama: TcxCalcEdit;
    cxLabel8: TcxLabel;
    edDiscHH: TcxCalcEdit;
    cxLabel9: TcxLabel;
    edHargaHH: TcxCalcEdit;
    cxLabel10: TcxLabel;
    edDiscNormal: TcxCalcEdit;
    cxLabel11: TcxLabel;
    edHargaNormal: TcxCalcEdit;
    ckKeterangan: TcxCheckBox;
    edKeterangan: TcxTextEdit;
    cxLabel12: TcxLabel;
    ckAktif: TcxCheckBox;
    btnSimpan: TcxButton;
    cxButton3: TcxButton;
    ckBaverage: TcxCheckBox;
    cdRedeem: TcxCheckBox;
    ckDiscount: TcxCheckBox;
    ckHappyHour: TcxCheckBox;
    GroupBox1: TGroupBox;
    rbKomisi: TRadioGroup;
    edKomisi: TcxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Jasa1Click(Sender: TObject);
    procedure Additional1Click(Sender: TObject);
    procedure gtbListColumn1GetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure Produk1Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure edJenisFocusChanged(Sender: TObject);
    procedure edNamaMenuFocusChanged(Sender: TObject);
    procedure edHargaUtamaFocusChanged(Sender: TObject);
    procedure edLamaFocusChanged(Sender: TObject);
    procedure edDiscHHFocusChanged(Sender: TObject);
    procedure edDiscNormalFocusChanged(Sender: TObject);
    procedure edKeteranganFocusChanged(Sender: TObject);
    procedure edDiscHHPropertiesEditValueChanged(Sender: TObject);
    procedure edDiscNormalPropertiesEditValueChanged(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    qryExec, qryMenu1, qryMenu2, qryMenu3 : TMyQuery;
  public
    { Public declarations }
    function CreateNewID : String;
    function GenerateJson(strJson : String) : TArray<String>;
    procedure HitungUlang;
  end;

var
  frmPosMainMenu: TfrmPosMainMenu;

implementation

{$R *.dfm}

uses FdmDB, FMain, FPosMainMenuInput;

function TfrmPosMainMenu.GenerateJson(strJson: string) : TArray<String>;
begin
   SetLength(Result, 2);
   Result[0] := 'Alpha';
   Result[1] := 'Beta';
end;

procedure TfrmPosMainMenu.Additional1Click(Sender: TObject);
var
  kodeMenu, strSql, strJson : String;
  i, cntInsert : Integer;
  hPromo, hJasa : Double;
  jSonItem : XSuperObject.ISuperObject;
begin
  qryMenu1.Close;
   qryMenu1.SQL.Clear;
   qryMenu1.SQL.Add('select jenis_jasa, nama_add, waktu, harga from add_time order by nama_add ASC');
   qryMenu1.Open;
   qryMenu1.First;
   for i := 0 to qryMenu1.RecordCount - 1 do
      begin
         qryMenu2.Close;
        qryMenu2.SQL.Clear;
        qryMenu2.SQL.Add('select nama_menu from main_menu where nama_menu = ' + QuotedStr(qryMenu1.Fields[1].AsString));
        qryMenu2.Open;
        if (qryMenu2.IsEmpty) then
          begin
            hJasa := qryMenu1.Fields[3].AsFloat;
            hPromo := hJasa - (hJasa * 20 / 100);
            jSonItem :=  XSuperObject.SO('{}');
            jSonItem.S['keterangan'] := '';
            jSonItem.S['cetak'] := 'N';
            strJson := jSonItem.AsJSON(False, False);
            kodeMenu := CreateNewID;
            qryExec.SQL.Clear;
            qryExec.SQL.Add('insert into main_menu values(' +
                    '''' + kodeMenu + ''',' +
                    '''' + 'BA' + ''',' +
                    '''' + qryMenu1.Fields[0].AsString + ''',' +
                    QuotedStr(qryMenu1.Fields[1].AsString) + ',' +
                    '''' + FloatToStr(hJasa) + ''',' +
                    '''' + IntToStr(qryMenu1.Fields[2].AsInteger) + ''','  +
                    '''' + FloatToStr(20) + ''',' +
                    '''' + FloatToStr(0) + ''',' +
                    '''' + FloatToStr(hPromo) + ''',' +
                    '''' + FloatToStr(hJasa) + ''',' +
                    QuotedStr(strJson) + ',' +
                    '''' + 'Y' + ''',' +
                    '''' + frmMain.USERAPPS + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
            qryExec.ExecSQL;
          end;
          qryMenu1.Next;
          qryList.Refresh;
          gtbList.DataController.Refresh;
          gtbList.DataController.GotoFirst;
          Application.ProcessMessages;
      end;
   ShowMessage('Import Data From Jasa Master Finish');
end;

procedure TfrmPosMainMenu.btnNewClick(Sender: TObject);
begin
    {Application.CreateForm(TfrmPosMainMenuInput, frmPosMainMenuInput);
    frmPosMainMenuInput.FormStyle := fsNormal;
    frmPosMainMenuInput.Height := 480;
    frmPosMainMenuInput.Width := 660;
    frmPosMainMenuInput.Position := poDesktopCenter;
    frmPosMainMenuInput.rbType.ItemIndex := 0;
    frmPosMainMenuInput.edJenis.ItemIndex := 1;
    frmPosMainMenuInput.ckKeterangan.Checked := False;
    frmPosMainMenuInput.ckAktif.Checked := True;
    frmPosMainMenuInput.Show; }
    edKode.Text := '';
    edJenis.Text := '';
    edNamaMenu.Text := '';
    edHargaUtama.EditValue := 0;
    edLama.EditValue := 0;
    edDiscHH.EditValue := 0;
    edDiscNormal.EditValue := 0;
    edHargaHH.EditValue := 0;
    edHargaNormal.EditValue := 0;
    edKeterangan.Text := '';
    ckKeterangan.Checked := False;
    ckBaverage.Checked := False;
    ckAktif.Checked := False;
    ckHappyHour.Checked := False;
    rbKomisi.ItemIndex := 0;
    edKomisi.EditValue := 0;
    pgControl.ActivePage := pgInput;
end;

procedure TfrmPosMainMenu.btnRefreshClick(Sender: TObject);
begin
   qryList.Refresh;
   gtbList.DataController.Refresh;
end;

procedure TfrmPosMainMenu.btnSimpanClick(Sender: TObject);
var
  strJson, typeMenu, typeJasa : String;
  jSonItem : XSuperObject.ISuperObject;
begin
     HitungUlang;
   case rbType.ItemIndex of
      0 : begin
             typeMenu := 'BJ';
             typeJasa := edJenis.Text;
          end;
      1 : begin
            typeMenu := 'BA';
            typeJasa := edJenis.Text;
          end;
      2 : begin
            typeMenu := 'BP';
            typeJasa := 'PR';
          end;
      3 : begin
            typeMenu := 'BG';
            typeJasa := 'GC'
          end;
   end;
   jSonItem :=  XSuperObject.SO('{}');
   jSonItem.S['keterangan'] := edKeterangan.Text;
   jSonItem.S['cetak'] := vartostr(ckKeterangan.EditValue);
   jSonItem.S['isbaverage'] := vartostr(ckBaverage.EditValue);
   jSonItem.I['typeKomisi'] := rbKomisi.ItemIndex;
   jSonItem.F['valueKomisi'] := edKomisi.EditValue;
   jSonItem.S['ckHappy'] := vartostr(ckHappyHour.EditValue);
   strJson := jSonItem.AsJSON(False, False);
   if (edKode.Text = '') then
    begin
      edKode.Text := frmPosMainMenu.CreateNewID;
      qryExec.SQL.Clear;
      qryExec.SQL.Add('insert into main_menu values(' +
                    '''' + edKode.Text + ''',' +
                    '''' + typeMenu + ''',' +
                    '''' + typeJasa + ''',' +
                    QuotedStr(edNamaMenu.Text) + ',' +
                    '''' + FloatToStr(edHargaUtama.EditValue) + ''',' +
                    '''' + IntToStr(edLama.EditValue) + ''','  +
                    '''' + FloatToStr(edDiscHH.EditValue) + ''',' +
                    '''' + FloatToStr(edDiscNormal.EditValue) + ''',' +
                    '''' + FloatToStr(edHargaHH.EditValue) + ''',' +
                    '''' + FloatToStr(edHargaNormal.EditValue) + ''',' +
                    QuotedStr(strJson) + ',' +
                    '''' + VarToStr(ckAktif.EditValue) + ''',' +
                    '''' + frmMain.USERAPPS + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
            qryExec.ExecSQL;
      frmPosMainMenu.btnRefresh.Click;
      frmPosMainMenu.gtbList.DataController.Search.Locate(frmPosMainMenu.gtbListmenu_id.Index, edKode.Text);
      ShowMessage('Update Data Finish');
    end
   else if (edKode.Text <> '') then
    begin
      qryExec.SQL.Clear;
      qryExec.SQL.Add('update main_menu set ' +
                    'type_menu = ''' + typeMenu + ''',' +
                    'jenis_jasa_id = ''' + typeJasa + ''',' +
                    'nama_menu = ' + QuotedStr(edNamaMenu.Text) + ',' +
                    'harga = ''' + FloatToStr(edHargaUtama.EditValue) + ''',' +
                    'lama = ''' + IntToStr(edLama.EditValue) + ''','  +
                    'disc_hh = ''' + FloatToStr(edDiscHH.EditValue) + ''',' +
                    'disc_normal = ''' + FloatToStr(edDiscNormal.EditValue) + ''',' +
                    'harga_hh = ''' + FloatToStr(edHargaHH.EditValue) + ''',' +
                    'harga_normal = ''' + FloatToStr(edHargaNormal.EditValue) + ''',' +
                    'notes = ' + QuotedStr(strJson) + ',' +
                    'aktif = ''' + VarToStr(ckAktif.EditValue) + ''',' +
                    'lastuser = ''' + frmMain.USERAPPS + ''',' +
                    'lasteditdate = ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''' ' +
                    'where menu_id = ''' + edKode.Text + '''');
            qryExec.ExecSQL;
      frmPosMainMenu.btnRefresh.Click;
      frmPosMainMenu.gtbList.DataController.Search.Locate(frmPosMainMenu.gtbListmenu_id.Index, edKode.Text);
      ShowMessage('Update Data Finish');
    end;
    pgControl.ActivePage := PgMain;
end;

function TfrmPosMainMenu.CreateNewID;
var
  tmpID, strNewID : String;
  intLastID, intNewID : Integer;
begin
  tmpID := frmMain.APP_OUTLETID + '.' + 'M' + FormatDateTime('yyMM', Date) + '%';
  qryMenu3.Close;
  qryMenu3.SQL.Clear;
  qryMenu3.SQL.Add('select menu_id from main_menu where menu_id like ' + QuotedStr(tmpID) +
      ' ORDER by menu_id ASC');
  qryMenu3.Open;
  if (qryMenu3.IsEmpty) then
    begin
      strNewID := frmMain.APP_OUTLETID + '.' + 'M' + FormatDateTime('yyMM', Date) + '001';
    end
  else
    begin
      qryMenu3.Last;
      intLastID := StrToInt(RightStr(qryMenu3.Fields[0].AsString, 3));
      intNewID := intLastID + 1;
      case Length(IntToStr(intNewID)) of
        1 : strNewID := frmMain.APP_OUTLETID + '.' + 'M' + FormatDateTime('yyMM', Date) + '00' + IntToStr(intNewID);
        2 : strNewID := frmMain.APP_OUTLETID + '.' + 'M' + FormatDateTime('yyMM', Date) + '0' + IntToStr(intNewID);
        3 : strNewID := frmMain.APP_OUTLETID + '.' + 'M' + FormatDateTime('yyMM', Date) + IntToStr(intNewID);
      end;
    end;
    Result := strNewID;
end;

procedure TfrmPosMainMenu.cxButton2Click(Sender: TObject);
var
  kodeItem, Cetak, keterangan, isbaverage, strCkHappy : String;
  recSel, typeKomisi : Integer;

  valueKomisi : Double;
  //lsJson : TStringList;
  jSonItem : XSuperObject.ISuperObject;

begin
    recSel := gtbList.DataController.GetFocusedRecordIndex;
    if (recSel < 0) then Exit;
    kodeItem := VarToStr(gtbList.DataController.GetValue(recSel, gtbListmenu_id.Index));
    qryMenu1.Close;
    qryMenu1.SQL.Clear;
    qryMenu1.SQL.Add('select * from main_menu where menu_id = ''' + kodeItem + '''');
    qryMenu1.Open;
    if (qryMenu1.Fields[1].AsString = 'BG') then
          begin
            ShowMessage('Anda Tidak dapat mengedit GC pada Menu Ini !!');
            Exit;
          end;
    //lsJson := TStringList.Create;
    //lsJson := qryMenu1.Fields[10].AsString;
    jSonItem := XSuperobject.SO(qryMenu1.Fields[10].AsString);
    {if (jsonObj.Contains('email')) then
    begin
        //-- bla bla bla
    end;}
    if (jSonItem.Contains('isbaverage')) then
      begin
        isbaverage := jSonItem.S['isbaverage'];
      end
    else if (NOT jSonItem.Contains('isbaverage')) then
      begin
        isbaverage := 'N';
      end;
    Cetak := jSonItem.S['cetak'];
    keterangan := jSonItem.S['keterangan'];
    typeKomisi := jSonItem.I['typeKomisi'];
    valueKomisi := jSonItem.F['valueKomisi'];
    strCkHappy := jSonItem.S['ckHappy'];
    //lsJson.Free;
    if (qryMenu1.Fields[1].AsString = 'BJ') then rbType.ItemIndex := 0
    else if (qryMenu1.Fields[1].AsString = 'BA') then rbType.ItemIndex := 1
    else if (qryMenu1.Fields[1].AsString = 'BP') then rbType.ItemIndex := 2
    else if (qryMenu1.Fields[1].AsString = 'BG') then rbType.ItemIndex := 3
    else rbType.ItemIndex := 2;

    edKode.Text := kodeItem;
    edJenis.Text := qryMenu1.Fields[2].AsString;
    edNamaMenu.Text := qryMenu1.Fields[3].AsString;
    edHargaUtama.EditValue := qryMenu1.Fields[4].AsFloat;
    edLama.EditValue := qryMenu1.Fields[5].AsInteger;
    edDiscHH.EditValue := qryMenu1.Fields[6].AsFloat;
    edDiscNormal.EditValue := qryMenu1.Fields[7].AsFloat;
    edHargaHH.EditValue := qryMenu1.Fields[8].AsFloat;
    edHargaNormal.EditValue := qryMenu1.Fields[9].AsFloat;
    edKeterangan.Text := keterangan;
    ckKeterangan.EditValue := Cetak;
    ckBaverage.EditValue := isbaverage;
    rbType.ItemIndex := typeKomisi;
    edKomisi.EditValue := valueKomisi;
    ckHappyHour.EditValue := strCkHappy;
    ckAktif.EditValue := qryMenu1.Fields[11].AsString;
    pgControl.ActivePage := pgInput;
end;

procedure TfrmPosMainMenu.cxButton3Click(Sender: TObject);
begin
     pgControl.ActivePage := PgMain;
end;

procedure TfrmPosMainMenu.edDiscHHFocusChanged(Sender: TObject);
begin
     HitungUlang;
end;

procedure TfrmPosMainMenu.edDiscHHPropertiesEditValueChanged(Sender: TObject);
begin
     HitungUlang;
end;

procedure TfrmPosMainMenu.edDiscNormalFocusChanged(Sender: TObject);
begin
     HitungUlang;
end;

procedure TfrmPosMainMenu.edDiscNormalPropertiesEditValueChanged(
  Sender: TObject);
begin
     HitungUlang;
end;

procedure TfrmPosMainMenu.edHargaUtamaFocusChanged(Sender: TObject);
begin
     HitungUlang;
end;

procedure TfrmPosMainMenu.edJenisFocusChanged(Sender: TObject);
begin
     HitungUlang;
end;

procedure TfrmPosMainMenu.edKeteranganFocusChanged(Sender: TObject);
begin
     HitungUlang;
end;

procedure TfrmPosMainMenu.edLamaFocusChanged(Sender: TObject);
begin
     HitungUlang;
end;

procedure TfrmPosMainMenu.edNamaMenuFocusChanged(Sender: TObject);
begin
     HitungUlang;
end;

procedure TfrmPosMainMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    qryExec.Free;
    qryMenu1.Free;
    qryMenu2.Free;
    qryMenu3.Free;
    Action := caFree;
end;

procedure TfrmPosMainMenu.FormCreate(Sender: TObject);
begin
    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

    qryMenu1 := TMyQuery.Create(Self);
    qryMenu1.Connection := DMDB.dbInternal;
    qryMenu1.SQL.Add('select * from temptable');
    qryMenu1.Active := true;

    qryMenu2 := TMyQuery.Create(Self);
    qryMenu2.Connection := DMDB.dbInternal;
    qryMenu2.SQL.Add('select * from temptable');
    qryMenu2.Active := true;

    qryMenu3 := TMyQuery.Create(Self);
    qryMenu3.Connection := DMDB.dbInternal;
    qryMenu3.SQL.Add('select * from temptable');
    qryMenu3.Active := true;

  qryMenu1.Close;
  qryMenu1.SQL.Clear;
  qryMenu1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('main_menu'));
  qryMenu1.Open;
  if (qryMenu1.IsEmpty) then
  begin
    qryExec.SQL.Clear;
    qryExec.SQL.Add(memStruktur.Text);
    qryExec.ExecSQL;
  end;

    //qryList.Active := True;
    qryList.Active := True;
    gtbList.DataController.Refresh;
    pgControl.ActivePage := PgMain;
    pgControl.HideTabs := True;
end;

procedure TfrmPosMainMenu.gtbListColumn1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  if (AText = 'BP') then AText := 'Produk'
   else if (AText = 'BJ') then AText := 'Jasa'
   else if (AText = 'BA') then AText := 'Additional'
   else if (AText = 'BG') then AText := 'Gift Certificate';
end;

procedure TfrmPosMainMenu.HitungUlang;
begin
     edHargaHH.EditValue := edHargaUtama.EditValue - (edHargaUtama.EditValue * edDiscHH.EditValue / 100);
   edHargaNormal.EditValue := edHargaUtama.EditValue - (edHargaUtama.EditValue * edDiscNormal.EditValue / 100);
end;

procedure TfrmPosMainMenu.Jasa1Click(Sender: TObject);
var
  kodeMenu, strSql, strJson : String;
  i, cntInsert : Integer;
  hPromo, hJasa : Double;
  jSonItem : XSuperObject.ISuperObject;
begin
   jSonItem :=  XSuperObject.SO('{}');
   qryMenu1.Close;
   qryMenu1.SQL.Clear;
   qryMenu1.SQL.Add('select nama_jasa_master, jenis_jasa_id, waktu, tarif_harga ' +
           'from jasa_master order by nama_jasa_master ASC');
   qryMenu1.Open;
   qryMenu1.First;
   cntInsert := 0;

   for i := 0 to qryMenu1.RecordCount -1 do
      begin
        qryMenu2.Close;
        qryMenu2.SQL.Clear;
        qryMenu2.SQL.Add('select nama_menu from main_menu where nama_menu = ' + QuotedStr(qryMenu1.Fields[0].AsString));
        qryMenu2.Open;
        if (qryMenu2.IsEmpty) then
          begin
            jSonItem :=  XSuperObject.SO('{}');
            jSonItem.S['keterangan'] := '';
            jSonItem.S['cetak'] := 'N';
            strJson := jSonItem.AsJSON(False, False);
            //ShowMessage(strJson);
            hJasa := qryMenu1.Fields[3].AsFloat;
            hPromo := hJasa - (hJasa * 20 / 100);
            kodeMenu := CreateNewID;
            qryExec.SQL.Clear;
            qryExec.SQL.Add('insert into main_menu values(' +
                    '''' + kodeMenu + ''',' +
                    '''' + 'BJ' + ''',' +
                    '''' + qryMenu1.Fields[1].AsString + ''',' +
                    QuotedStr(qryMenu1.Fields[0].AsString) + ',' +
                    '''' + FloatToStr(hJasa) + ''',' +
                    '''' + IntToStr(qryMenu1.Fields[2].AsInteger) + ''','  +
                    '''' + FloatToStr(20) + ''',' +
                    '''' + FloatToStr(0) + ''',' +
                    '''' + FloatToStr(hPromo) + ''',' +
                    '''' + FloatToStr(hJasa) + ''',' +
                    QuotedStr(strJson) + ',' +
                    '''' + 'Y' + ''',' +
                    '''' + frmMain.USERAPPS + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
            qryExec.ExecSQL;
            //cntInsert := cntInsert + 1;
          end;
        qryMenu1.Next;
        qryList.Refresh;
        gtbList.DataController.Refresh;
        gtbList.DataController.GotoFirst;
        Application.ProcessMessages;
      end;
  ShowMessage('Import Data From Jasa Master Finish');
end;

procedure TfrmPosMainMenu.Produk1Click(Sender: TObject);
var
  kodeMenu, strSql, strJson : String;
  i, cntInsert : Integer;
  hPromo, hJasa : Double;
  jSonItem : XSuperObject.ISuperObject;
begin
  qryMenu1.Close;
   qryMenu1.SQL.Clear;
   qryMenu1.SQL.Add('select id_produk, nama_produk, harga ' +
           'from produk order by nama_produk ASC');
   qryMenu1.Open;
   qryMenu1.First;
   cntInsert := 0;

   for i := 0 to qryMenu1.RecordCount -1 do
      begin
        qryMenu2.Close;
        qryMenu2.SQL.Clear;
        qryMenu2.SQL.Add('select nama_menu from main_menu where nama_menu = ' + QuotedStr(qryMenu1.Fields[1].AsString));
        qryMenu2.Open;
        if (qryMenu2.IsEmpty) then
          begin
            hJasa := qryMenu1.Fields[2].AsFloat;
            hPromo := hJasa;
            jSonItem :=  XSuperObject.SO('{}');
            jSonItem.S['keterangan'] := '';
            jSonItem.S['cetak'] := 'N';
            strJson := jSonItem.AsJSON(False, False);
            if (Length(qryMenu1.Fields[0].AsString) < 13) then kodeMenu := CreateNewID
            else if ((Length(qryMenu1.Fields[0].AsString) >= 13)) then kodeMenu := qryMenu1.Fields[0].AsString;
            qryExec.SQL.Clear;
            qryExec.SQL.Add('insert into main_menu values(' +
                    '''' + kodeMenu + ''',' +
                    '''' + 'BP' + ''',' +
                    '''' + 'PR' + ''',' +
                    QuotedStr(qryMenu1.Fields[1].AsString) + ',' +
                    '''' + FloatToStr(hJasa) + ''',' +
                    '''' + FloatToStr(0) + ''','  +
                    '''' + FloatToStr(0) + ''',' +
                    '''' + FloatToStr(0) + ''',' +
                    '''' + FloatToStr(hPromo) + ''',' +
                    '''' + FloatToStr(hJasa) + ''',' +
                    QuotedStr(strJson) + ',' +
                    '''' + 'Y' + ''',' +
                    '''' + frmMain.USERAPPS + ''',' +
                    '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''');');
            qryExec.ExecSQL;
            //cntInsert := cntInsert + 1;
          end;
        qryMenu1.Next;
        qryList.Refresh;
        gtbList.DataController.Refresh;
        gtbList.DataController.GotoFirst;
        Application.ProcessMessages;
      end;
  ShowMessage('Import Data From Produk Master Finish');
end;

end.
