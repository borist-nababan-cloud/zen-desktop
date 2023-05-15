unit FKalenderKerja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxGridBandedTableView,
  cxGridDBBandedTableView, cxTextEdit, cxCalendar, cxCalc, cxNavigator,
  cxDBNavigator, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxDBEdit, cxLabel, cxContainer,
  cxGroupBox, DateUtils;

type
  TfrmKalenderKerja = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbKalKerja: TcxGridDBBandedTableView;
    gtbKalKerjaautonum: TcxGridDBBandedColumn;
    gtbKalKerjatemp_id: TcxGridDBBandedColumn;
    gtbKalKerjatahun_buku: TcxGridDBBandedColumn;
    gtbKalKerjalibur_resmi_nasional: TcxGridDBBandedColumn;
    gtbKalKerjatgl_twal_libur_resmi: TcxGridDBBandedColumn;
    gtbKalKerjatgl_akhir_libur_resmi: TcxGridDBBandedColumn;
    gtbKalKerjalama_libur_resmi: TcxGridDBBandedColumn;
    cxDBNavigator1: TcxDBNavigator;
    gbKalenderKerja: TcxGroupBox;
    edkal_id: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    edNama: TcxDBTextEdit;
    edStart: TcxDBDateEdit;
    edEnd: TcxDBDateEdit;
    edLama: TcxDBCalcEdit;
    cxLabel3: TcxLabel;
    procedure Panel3Click(Sender: TObject);
    procedure gtbKalKerjaEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cxDBNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKalenderKerja: TfrmKalenderKerja;

implementation

uses FDMdb;

{$R *.dfm}

procedure TfrmKalenderKerja.Panel3Click(Sender: TObject);
begin
     with dmDB do
          begin

          end;
end;

procedure TfrmKalenderKerja.gtbKalKerjaEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
     //gtbKalKerjatahun_buku.EditValue := FormatDateTime('YYYY',Date);
     //gtbKalKerjatgl_twal_libur_resmi.EditValue := Date;
     //gtbKalKerjatgl_akhir_libur_resmi.EditValue := Date;

end;

procedure TfrmKalenderKerja.cxDBNavigator1ButtonsButtonClick(
  Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
     if (AButtonIndex = 6) then
         begin
              ADone := True;
              gbKalenderKerja.Enabled := True;
              dmDB.tblKalKerja.Edit;
              dmDB.tblKalKerja.Insert;

         end
     else if AButtonIndex = 9 then //ShowMessage('EDIT');
        begin
             dmDB.tblKalKerja.Edit;
             gbKalenderKerja.Enabled := True;
             //ADone := True;
        end
    else if AButtonIndex = 10 then //ShowMessage('POST');
        begin
             edLama.EditValue := DaysBetween(edStart.Date,edEnd.Date);
             ShowMessage(VarToStr(edLama.EditValue));
             gbKalenderKerja.Enabled := False;
             dmDB.tblKalKerja.Post;
             ADone := True;

        end
end;

procedure TfrmKalenderKerja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

end.
