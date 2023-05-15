unit FWeekly_shift;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, Menus,
  cxLookAndFeelPainters, cxLabel, cxContainer, cxGroupBox, StdCtrls,
  cxButtons, cxNavigator, cxDBNavigator, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, cxTimeEdit, dxGDIPlusClasses,
  cxGridBandedTableView, cxGridDBBandedTableView, XiPanel;

type
  TfrmWeekly_shift = class(TForm)
    Panel1: TPanel;
    grdShift: TcxGrid;
    gtbShift: TcxGridDBBandedTableView;
    gtbShiftid_weekly: TcxGridDBBandedColumn;
    gtbShiftnama_weekly: TcxGridDBBandedColumn;
    gtbShiftColumn1: TcxGridDBBandedColumn;
    gtbShiftColumn2: TcxGridDBBandedColumn;
    gtbShiftColumn3: TcxGridDBBandedColumn;
    gtbShiftColumn4: TcxGridDBBandedColumn;
    gtbShiftColumn5: TcxGridDBBandedColumn;
    gtbShiftColumn6: TcxGridDBBandedColumn;
    gtbShiftColumn7: TcxGridDBBandedColumn;
    glvShift: TcxGridLevel;
    Panel2: TPanel;
    XiPanel1: TPanel;
    Image2: TImage;
    Label1: TLabel;
    edTestTime: TcxTimeEdit;
    Panel3: TPanel;
    XiPanel2: TPanel;
    Image1: TImage;
    dbnDailyShift: TcxDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWeekly_shift: TfrmWeekly_shift;

implementation

uses FDMdb;

{$R *.dfm}

procedure TfrmWeekly_shift.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

end.
