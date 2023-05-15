unit FChangeStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxControls,
  cxContainer, cxEdit, cxGroupBox, Menus, cxLookAndFeelPainters, cxButtons,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfrmChangeStatus = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    edTherapistID: TcxLookupComboBox;
    Label2: TLabel;
    edStatusTherapist: TcxComboBox;
    cxButton1: TcxButton;
    gtbRuangan: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbRuanganruangan_id: TcxGridDBColumn;
    gtbRuanganlantai: TcxGridDBColumn;
    gtbRuangannomor: TcxGridDBColumn;
    gtbRuanganjenis_jasa: TcxGridDBColumn;
    gtbRuangannotes: TcxGridDBColumn;
    gtbRuangankondisi: TcxGridDBColumn;
    gtbRuangannama_cust: TcxGridDBColumn;
    gtbRuanganstart_time: TcxGridDBColumn;
    gtbRuanganend_time: TcxGridDBColumn;
    gtbRuangantherapist_id: TcxGridDBColumn;
    gtbRuangantrans_id: TcxGridDBColumn;
    gtbRuanganstatus: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangeStatus: TfrmChangeStatus;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmChangeStatus.FormCreate(Sender: TObject);
begin
     //with dmDB do
end;

procedure TfrmChangeStatus.cxButton1Click(Sender: TObject);
begin
      with dmDB do
           begin

                qryUpdate.Sql.Clear;
                qryUpdate.Sql.Add('update available_tr set ' +
                                  'status = ''' + edStatusTherapist.Text + ''', ' +
                                  'tanggal = ''' + FormatDateTime('yyyy-MM-dd', Date) + ''' ' +
                                  'where id_therapist = ''' + edTherapistID.Text + '''');
                qryUpdate.ExecSql;
           end;
      edTherapistID.Clear;
      edStatusTherapist.Text := 'AVAILABLE';
      //Close;
end;

end.
