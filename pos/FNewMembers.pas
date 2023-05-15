unit FNewMembers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, AdvGlowButton, cxContainer,
  cxTextEdit, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCalendar, cxMemo, cxDropDownEdit, cxCalc, cxDBLookupComboBox,
  cxNavigator, cxDBNavigator, cxLookAndFeels, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmNewMembers = class(TForm)
    gtbMembers: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    advStopDev: TAdvGlowButton;
    advStartDev: TAdvGlowButton;
    btnDaftar: TcxButton;
    cxDBNavigator1: TcxDBNavigator;
    gtbMembersid_members: TcxGridDBColumn;
    gtbMemberstanggal: TcxGridDBColumn;
    gtbMembersexpired_date: TcxGridDBColumn;
    gtbMembersnama_lengkap: TcxGridDBColumn;
    gtbMembersalamat: TcxGridDBColumn;
    gtbMembersid_type: TcxGridDBColumn;
    gtbMembersid_identity: TcxGridDBColumn;
    gtbMemberstempat_lahir: TcxGridDBColumn;
    gtbMemberstanggal_lahir: TcxGridDBColumn;
    gtbMembersjenis_kelamin: TcxGridDBColumn;
    gtbMembersstaff_id: TcxGridDBColumn;
    gtbMembersnotes: TcxGridDBColumn;
    gtbMemberspoint: TcxGridDBColumn;
    gtbMembersmembers_type: TcxGridDBColumn;
    gtbMembersno_kartu: TcxGridDBColumn;
    gtbMembersno_telepon: TcxGridDBColumn;
    gtbMembersno_handphone: TcxGridDBColumn;
    pmEdit: TPopupMenu;
    EditData1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnDaftarClick(Sender: TObject);
    procedure gtbMembersid_membersGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure EditData1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewMembers: TfrmNewMembers;

implementation

uses FDMDB, FMain, FDaftarMembers;

{$R *.dfm}

procedure TfrmNewMembers.FormCreate(Sender: TObject);
begin
     //dmDB.tblMembers.Refresh;
end;

procedure TfrmNewMembers.btnDaftarClick(Sender: TObject);
begin
     Application.CreateForm(TfrmDaftarMembers, frmDaftarMembers);
     with frmDaftarMembers do
          begin
               edIDMembers.Clear;
               edTglDaftar.Date := Date;
               edTglExpired.Date := IncMonth(Date, 12);
               edNama.Clear;
               edAlamat.Clear;
               edIDType.Text := 'KTP';
               edNoID.Clear;
               edTempatLahir.Clear;
               edTglLahir.Date := Date;
               edJenisKelamin.Text := 'L';
               edStaff.Clear;
               edNotes.Text := 'NONE';
               edMembersType.Text := 'PERSONAL';
               edTelepon.Clear;
               edHandphone.Clear;
          end;
     frmDaftarMembers.ShowModal;
end;

procedure TfrmNewMembers.gtbMembersid_membersGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     AText := Copy(AText,1,length(AText)-2);
end;

procedure TfrmNewMembers.EditData1Click(Sender: TObject);
var
   recSelect : Integer;
   id_members : String;
begin
     recSelect := gtbMembers.DataController.GetFocusedRecordIndex;
     id_members := vartostr(gtbMembers.DataController.GetValue(recSelect, gtbMembersid_members.Index));
     //ShowMessage(id_members);

     Application.CreateForm(TfrmDaftarMembers, frmDaftarMembers);

     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from members where id_members = ''' +
                                id_members + '''');
               qrySearch.Open;
               with frmDaftarMembers do
                    begin
                         edIDMembers.Text := qrySearch.Fields[0].AsString;
                         edTglDaftar.Date := qrySearch.Fields[1].AsDateTime;
                         edTglExpired.Date := qrySearch.Fields[2].AsDateTime;
                         edNama.Text := qrySearch.Fields[3].AsString;
                         edAlamat.Text := qrySearch.Fields[4].AsString;
                         edIDType.Text := qrySearch.Fields[5].AsString;
                         edNoID.Text := qrySearch.Fields[6].AsString;
                         edTempatLahir.Text := qrySearch.Fields[7].AsString;
                         edTglLahir.Date := qrySearch.Fields[8].AsDateTime;
                         edJenisKelamin.Text := qrySearch.Fields[9].AsString;
                         edStaff.Text := qrySearch.Fields[10].AsString;
                         edNotes.Text := qrySearch.Fields[11].AsString;
                         edMembersType.Text := qrySearch.Fields[13].AsString;
                         edTelepon.Text := qrySearch.Fields[15].AsString;
                         edHandphone.Text := qrySearch.Fields[16].AsString;
                         edPoint.EditValue := qrySearch.Fields[12].AsFloat;
                    end;


          end;

     frmDaftarMembers.ShowModal;

end;

end.
