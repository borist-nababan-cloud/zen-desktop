unit FDaftarMembers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxDropDownEdit, cxMemo, cxMaskEdit, cxCalendar,
  StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxCalc, Menus,
  cxLookAndFeelPainters, cxButtons;

type
  TfrmDaftarMembers = class(TForm)
    edIDMembers: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edTglDaftar: TcxDateEdit;
    edTglExpired: TcxDateEdit;
    edNama: TcxTextEdit;
    edAlamat: TcxMemo;
    edIDType: TcxComboBox;
    edNoID: TcxTextEdit;
    edTempatLahir: TcxTextEdit;
    edTglLahir: TcxDateEdit;
    edJenisKelamin: TcxComboBox;
    edStaff: TcxTextEdit;
    edPoint: TcxCalcEdit;
    edNotes: TcxTextEdit;
    edMembersType: TcxComboBox;
    edNoKartu: TcxTextEdit;
    edTelepon: TcxTextEdit;
    edHandphone: TcxTextEdit;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    Label18: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edIDMembersPropertiesChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edIDMembersPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDaftarMembers: TfrmDaftarMembers;

implementation

uses FDMDB, FNewMembers;

{$R *.dfm}

procedure TfrmDaftarMembers.FormCreate(Sender: TObject);
begin
     //with dmDB do
end;

procedure TfrmDaftarMembers.btnSaveClick(Sender: TObject);
begin
     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from members where id_members = ''' +
                                 edIDMembers.Text + '''');
               qrySearch.Open;
               if (qrySearch.IsEmpty) then
                  begin
                       qryUpdate.Sql.Clear;
                       qryUpdate.Sql.Add('INSERT INTO members VALUES(' +
                                       '''' + edIDMembers.Text + ''', ' +
                                       '''' + FormatDateTime('YYYY-MM-dd', edTglDaftar.Date) + ''', ' +
                                       '''' + FormatDateTime('YYYY-MM-dd', edTglExpired.Date) + ''', ' +
                                       '''' + edNama.Text  + ''', ' +
                                       '''' + edAlamat.Text + ''', ' +
                                       '''' + edIDType.Text + ''', ' +
                                       '''' + edNoID.Text + ''', ' +
                                       '''' + edTempatLahir.Text + ''', ' +
                                       '''' + FormatDateTime('YYYY-MM-dd', edTglLahir.Date) + ''', ' +
                                       '''' + edJenisKelamin.Text + ''', ' +
                                       '''' + edStaff.Text + ''', ' +
                                       '''' + edNotes.Text + ''', ' +
                                       '''' + VarToStr(edPoint.EditValue) + ''', ' +
                                       '''' + edMembersType.Text + ''', ' +
                                       '''' + edNoKartu.Text + ''', ' +
                                       '''' + edTelepon.Text + ''', ' +
                                       '''' + edHandphone.Text + ''')');
                       qryUpdate.ExecSql;
                       tblMembers.Refresh;

                  end
               else if (NOT qrySearch.IsEmpty) then
                  begin
                       qryUpdate.Sql.Clear;
                       qryUpdate.Sql.Add('update members set ' +
                                         'tanggal = '''        + FormatDateTime('YYYY-MM-dd', edTglDaftar.Date) + ''', ' +
                                         'expired_date = '''   + FormatDateTime('YYYY-MM-dd', edTglExpired.Date) + ''', ' +
                                         'nama_lengkap = '''   + edNama.Text + ''', ' +
                                         'alamat = '''         + edAlamat.Text + ''', ' +
                                         'id_type = '''        + edIDType.Text + ''', ' +
                                         'tempat_lahir = '''   + edTempatLahir.Text + ''', ' +
                                         'id_identity = '''    + edNoID.Text + ''', ' +
                                         'tanggal_lahir = '''  + FormatDateTime('YYYY-MM-dd', edTglLahir.Date) + ''', ' +
                                         'jenis_kelamin = '''  + edJenisKelamin.Text + ''', ' +
                                         'staff_id = '''       + edStaff.Text + ''', ' +
                                         'notes = '''          + edNotes.Text + ''', ' +
                                         'point = '''          + vartostr(edPoint.EditValue) + ''', ' +
                                         'members_type = '''   + edMembersType.Text + ''', ' +
                                         'no_kartu = '''       +  edNoKartu.Text + ''', ' +
                                         'no_telepon = '''     +  edTelepon.Text + ''', ' +
                                         'no_handphone = '''   + edHandphone.Text + ''' ' +
                                         'where id_members = ''' + edIDMembers.Text + '''');
                       qryUpdate.ExecSql;
                       tblMembers.Refresh;
                  end;
          end;
     frmNewMembers.gtbMembers.DataController.Refresh;
     frmNewMembers.gtbMembers.DataController.Search.Locate(frmNewMembers.gtbMembersid_members.Index, edIDMembers.Text);
     Close;
end;

procedure TfrmDaftarMembers.edIDMembersPropertiesChange(Sender: TObject);
begin
     edNoKartu.Text := Copy(edIDMembers.Text,1,length(edIDMembers.Text)-2);
end;

procedure TfrmDaftarMembers.btnCancelClick(Sender: TObject);
begin
     frmNewMembers.gtbMembers.DataController.Refresh;
     frmNewMembers.gtbMembers.DataController.Search.Locate(frmNewMembers.gtbMembersid_members.Index, edIDMembers.Text);
     Close;
end;

procedure TfrmDaftarMembers.edIDMembersPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     //
end;

end.
