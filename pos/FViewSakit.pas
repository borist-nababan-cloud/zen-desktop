unit FViewSakit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxCalendar, cxDBLookupComboBox, cxTextEdit,
  cxNavigator, cxDBNavigator;

type
  TfrmViewSakit = class(TForm)
    cxGrid1: TcxGrid;
    gtbSakit: TcxGridDBTableView;
    gtbSakitautonum: TcxGridDBColumn;
    gtbSakitkaryawan_id: TcxGridDBColumn;
    gtbSakitnama: TcxGridDBColumn;
    gtbSakittanggal: TcxGridDBColumn;
    gtbSakitid_penalti: TcxGridDBColumn;
    gtbSakitnotes: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxDBNavigator1: TcxDBNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewSakit: TfrmViewSakit;

implementation

uses FDMdb;

{$R *.dfm}

procedure TfrmViewSakit.FormCreate(Sender: TObject);
begin
     dmDB.tblSakit.Refresh;

end;

end.
