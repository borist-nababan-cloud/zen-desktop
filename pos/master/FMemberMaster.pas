unit FMemberMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, XSuperObject, XSuperJSON, Data.DB,
  DBAccess, MyAccess, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxTextEdit, cxCalendar,
  Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, cxButtons, strUtils,
  FBarcode, cxDBLookupComboBox;

type
  TfrmMemberMaster = class(TForm)
    qryListMember: TMyQuery;
    dsQryMember: TMyDataSource;
    cxGrid1: TcxGrid;
    gtbMember: TcxGridDBTableView;
    gtbMemberno_kartu: TcxGridDBColumn;
    gtbMembernama_lengkap: TcxGridDBColumn;
    gtbMemberalamat: TcxGridDBColumn;
    gtbMembertempat_lahir: TcxGridDBColumn;
    gtbMembertanggal_lahir: TcxGridDBColumn;
    gtbMemberno_telepon: TcxGridDBColumn;
    gtbMemberno_handphone: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    lblJudulAtas: TLabel;
    btnBaru: TcxButton;
    btnEdit: TcxButton;
    gtbMemberid_members: TcxGridDBColumn;
    tblOutlet: TMyTable;
    dsTblOutlet: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qryExec, qryFind : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmMemberMaster: TfrmMemberMaster;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMemberMasterAdd;

procedure TfrmMemberMaster.btnBaruClick(Sender: TObject);
begin
   Application.CreateForm(TfrmMemberMasterAdd, frmMemberMasterAdd);
   frmMemberMasterAdd.FormStyle := fsNormal;
   frmMemberMasterAdd.Height := 675;
   frmMemberMasterAdd.Width := 759;
   frmMemberMasterAdd.btnSimpan.Tag := 1;
   frmMemberMasterAdd.edTanggal.Date := Date;
   frmMemberMasterAdd.Show;
   frmMemberMasterAdd.Position := poDesktopCenter;
end;

procedure TfrmMemberMaster.btnEditClick(Sender: TObject);
var
   recSel : Integer;
   kodeMember : String;
   jSonItem : XSuperObject.ISuperObject;
begin
   recSel := gtbMember.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;

   kodeMember := VarToStr(gtbMember.DataController.GetValue(recSel, gtbMemberid_members.Index));
   Application.CreateForm(TfrmMemberMasterAdd, frmMemberMasterAdd);
   frmMemberMasterAdd.FormStyle := fsNormal;
   frmMemberMasterAdd.Height := 675;
   frmMemberMasterAdd.Width := 759;
   frmMemberMasterAdd.edScanMember.Visible := False;
   frmMemberMasterAdd.btnSimpan.Tag := 2;
   frmMemberMasterAdd.btnSimpan.Caption := 'Update';
   qryFind.Close;
   qryFind.SQL.Clear;
   qryFind.SQL.Add('select * from members where id_members = ''' + kodeMember + '''');
   qryFind.Open;
   with frmMemberMasterAdd do
     begin
       MemberCode := qryFind.Fields[0].AsString;
       edNama.Text := qryFind.Fields[3].AsString;
       edTempatLahir.Text := qryFind.Fields[7].AsString;
       if (qryFind.Fields[9].AsString = 'M') then edGender.Text := 'MALE'
       else if (qryFind.Fields[9].AsString = 'F') then edGender.Text := 'FEMALE'
       else if (qryFind.Fields[9].AsString = 'P') then edGender.Text := 'FEMALE'
       else if (qryFind.Fields[9].AsString = 'L') then edGender.Text := 'MALE';
       if (LeftStr(qryFind.Fields[11].AsString, 1) = '{') then
         begin
              jSonItem := XSuperobject.SO(qryFind.Fields[11].AsString);
              edProvinsi.Text := jSonItem.S['provinsi'];
              edKabupaten.Text := jSonItem.S['kabupaten'];
              edKecamatan.Text := jSonItem.S['kecamatan'];
              edKelurahan.Text := jSonItem.S['kelurahan'];
              edKodePos.Text := jSonItem.S['kodepos'];
              edAlamat1.Text := jSonItem.S['alamat1'];
              edAlamat2.Text := jSonItem.S['alamat2'];
              edEmail.Text := jSonItem.S['email'];
         end
      else if (LeftStr(qryFind.Fields[11].AsString, 1) <> '{') then
         begin
            edAlamat1.Text := qryFind.Fields[4].AsString;
         end;
      edNoKTP.Text := qryFind.Fields[6].AsString;
      edHanphone.Text := qryFind.Fields[16].AsString;
      edFixLine.Text := qryFind.Fields[15].AsString;
      edNoKartu.Text := qryFind.Fields[14].AsString;
      edTanggal.Date := qryFind.Fields[8].AsDateTime;
      edScanMember.Visible := False;
      frmMemberMasterAdd.CreateQRCode;
     end;
   frmMemberMasterAdd.Show;
   frmMemberMasterAdd.Position := poDesktopCenter;
end;

procedure TfrmMemberMaster.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryExec.Free;
  qryFind.Free;
  Action := caFree;
end;

procedure TfrmMemberMaster.FormCreate(Sender: TObject);
begin
    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

    qryFind := TMyQuery.Create(Self);
    qryFind.Connection := DMDB.dbInternal;
    qryFind.SQL.Add('select * from temptable');
    qryFind.Active := true;

    tblOutlet.Active := True;

    qryListMember.Active := True;
    gtbMember.DataController.Refresh;
end;

end.
