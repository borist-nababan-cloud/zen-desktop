unit FPosMainMenuInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyAccess, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxLabel, cxCalc,
  Vcl.Menus, cxButtons, cxCheckBox, XSuperJSON, XSuperObject;

type
  TfrmPosMainMenuInput = class(TForm)
    Label1: TLabel;
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
    cxButton2: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDiscHHPropertiesEditValueChanged(Sender: TObject);
    procedure edHargaUtamaPropertiesEditValueChanged(Sender: TObject);
    procedure edHargaUtamaFocusChanged(Sender: TObject);
    procedure edDiscHHFocusChanged(Sender: TObject);
    procedure edDiscNormalFocusChanged(Sender: TObject);
    procedure edDiscNormalPropertiesEditValueChanged(Sender: TObject);
    procedure edHargaNormalFocusChanged(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    qryInput1, qryExec : TMyQuery;
    procedure HitungUlang;
  public
    { Public declarations }
  end;

var
  frmPosMainMenuInput: TfrmPosMainMenuInput;

implementation

{$R *.dfm}

uses FdmDB, FMain, FPosMainMenu;

procedure TfrmPosMainMenuInput.HitungUlang;
begin
   edHargaHH.EditValue := edHargaUtama.EditValue - (edHargaUtama.EditValue * edDiscHH.EditValue / 100);
   edHargaNormal.EditValue := edHargaUtama.EditValue - (edHargaUtama.EditValue * edDiscNormal.EditValue / 100);
end;

procedure TfrmPosMainMenuInput.btnSimpanClick(Sender: TObject);
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
      frmPosMainMenuInput.Close;
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
      frmPosMainMenuInput.Close;
    end;

end;

procedure TfrmPosMainMenuInput.cxButton2Click(Sender: TObject);
begin
   frmPosMainMenuInput.Close;
end;

procedure TfrmPosMainMenuInput.edDiscHHFocusChanged(Sender: TObject);
begin
    HitungUlang;
end;

procedure TfrmPosMainMenuInput.edDiscHHPropertiesEditValueChanged(
  Sender: TObject);
begin
   HitungUlang;
end;

procedure TfrmPosMainMenuInput.edDiscNormalFocusChanged(Sender: TObject);
begin
  HitungUlang;
end;

procedure TfrmPosMainMenuInput.edDiscNormalPropertiesEditValueChanged(
  Sender: TObject);
begin
    HitungUlang;
end;

procedure TfrmPosMainMenuInput.edHargaNormalFocusChanged(Sender: TObject);
begin
    HitungUlang;
end;

procedure TfrmPosMainMenuInput.edHargaUtamaFocusChanged(Sender: TObject);
begin
   HitungUlang;
end;

procedure TfrmPosMainMenuInput.edHargaUtamaPropertiesEditValueChanged(
  Sender: TObject);
begin
  HitungUlang;
end;

procedure TfrmPosMainMenuInput.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryExec.Free;
   qryInput1.Free;
   Action := caFree;
end;

procedure TfrmPosMainMenuInput.FormCreate(Sender: TObject);
begin
    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

    qryInput1 := TMyQuery.Create(Self);
    qryInput1.Connection := DMDB.dbInternal;
    qryInput1.SQL.Add('select * from temptable');
    qryInput1.Active := true;
end;

end.
