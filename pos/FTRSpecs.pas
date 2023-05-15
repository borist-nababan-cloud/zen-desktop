unit FTRSpecs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, StdCtrls, Menus, cxLookAndFeelPainters, cxButtons;

type
  TfrmTRSpecs = class(TForm)
    lcbKaryawanID: TcxLookupComboBox;
    Label1: TLabel;
    edSpecs: TcxComboBox;
    Label2: TLabel;
    edNama: TcxTextEdit;
    edDepartemen: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    cxButton1: TcxButton;
    procedure cxLookupComboBox1PropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTRSpecs: TfrmTRSpecs;

implementation

uses FdmDB, DB;

{$R *.dfm}

procedure TfrmTRSpecs.cxLookupComboBox1PropertiesChange(Sender: TObject);
begin
     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select * from karyawan where karyawan_id = ''' +
                                 lcbKaryawanID.Text + '''');
               qrySearch.Open;

               edNama.Text := qrySearch.Fields[5].AsString;
               edDepartemen.Text := qrySearch.Fields[1].AsString;
               edSpecs.Text := qrySearch.Fields[15].AsString;

               
          end;
end;

procedure TfrmTRSpecs.cxButton1Click(Sender: TObject);
begin
     with dmDB do
          begin
               qryUpdate.Sql.Clear;
               qryUpdate.Sql.Add('update karyawan set ' +
                               'type = ''' + edSpecs.Text + '''' +
                               'where karyawan_id = ''' + lcbKaryawanID.Text + '''');
               qryUpdate.ExecSql;
          end;

     lcbKaryawanID.ClearSelection;
     edNama.Clear;
     edDepartemen.Clear;
     edSpecs.Clear;

end;

end.
