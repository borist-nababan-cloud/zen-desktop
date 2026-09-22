unit FReportSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridBandedTableView, cxGridDBBandedTableView,
  cxTextEdit, cxCalendar, ExtCtrls, DBCtrls, cxButtonEdit, StdCtrls,
  ActnList, cxDBLookupComboBox, cxTimeEdit, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  MemDS, DBAccess, MyAccess, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, cxButtons, cxMaskEdit, cxDropDownEdit;

type
  TfrmReportSchedule = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    dbnScheduler: TDBNavigator;
    lblInfo: TLabel;
    qryList: TMyQuery;
    dsQryList: TDataSource;
    tblShift: TMyTable;
    dstblShift: TDataSource;
    Label2: TLabel;
    edTanggal: TcxDateEdit;
    btnFilter: TcxButton;
    Label1: TLabel;
    cxGrid1: TcxGrid;
    gtbScheduler: TcxGridDBBandedTableView;
    gtbSchedulerkodekaryawan: TcxGridDBBandedColumn;
    gtbSchedulerkodeshift: TcxGridDBBandedColumn;
    gtbSchedulertglmasuk: TcxGridDBBandedColumn;
    gtbSchedulerjmasuk: TcxGridDBBandedColumn;
    gtbSchedulertglkeluar: TcxGridDBBandedColumn;
    gtbSchedulerjkeluar: TcxGridDBBandedColumn;
    gtbSchedulerlasteditdate: TcxGridDBBandedColumn;
    gtbSchedulerlastedituser: TcxGridDBBandedColumn;
    gtbSchedulertagedit: TcxGridDBBandedColumn;
    gtbScheduleridkaryawan: TcxGridDBBandedColumn;
    gtbSchedulernamakaryawan: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    edIndex: TEdit;
    edID2: TEdit;
    edID: TEdit;
    procedure gtbSchedulerBtnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure gtbSchedulerKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFilterClick(Sender: TObject);
  private
    { Private declarations }
  public
    REC_INDEX : Integer;
    { Public declarations }
  end;

var
  frmReportSchedule: TfrmReportSchedule;

implementation

uses FDMdb;

{$R *.dfm}

procedure TfrmReportSchedule.gtbSchedulerBtnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);

begin
//     if (edID.Text = '') then
//         begin
//              Screen.Cursor := crHourGlass;
//              //Screen.Cursor := lblInfo.c
//              //edIndex.Text := IntToStr(gtbScheduler.DataController.GetFocusedRecordIndex);
//              edID.Text := gtbScheduler.DataController.GetValue(gtbScheduler.DataController.GetFocusedRecordIndex, gtbSchedulerresource_id.Index);
//              REC_INDEX := gtbScheduler.DataController.GetFocusedRecordIndex;
//              edIndex.Text := IntToStr(REC_INDEX);
//              lblInfo.Visible := True;
//              //lblInfo.Caption := 'Press Escape to Cancel';
//              //ShowMessage(IntToStr(REC_INDEX));
//
//         end
//     else
//         begin
//
//              edID2.Text := gtbScheduler.DataController.GetValue(gtbScheduler.DataController.GetFocusedRecordIndex, gtbSchedulerresource_id.Index);
//              gtbScheduler.DataController.SetValue(gtbScheduler.DataController.GetFocusedRecordIndex,gtbSchedulerresource_id.Index, edID.Text);
//              gtbScheduler.DataController.SetValue(REC_INDEX, gtbSchedulerresource_id.Index, edID2.Text);
//              gtbScheduler.DataController.PostEditingData;
//              gtbScheduler.DataController.Post;
//              edID.Clear;
//              edID2.Clear;
//              Screen.Cursor := crDefault;
//              lblInfo.Visible := False;
//              //lblInfo.Caption := 'Press Escape to Cancel';
//         end;


end;

procedure TfrmReportSchedule.btnFilterClick(Sender: TObject);
begin
     qryList.Close;
     qryList.SQL.Clear;
     qryList.SQL.Add('select kodekaryawan, kodeshift, tglmasuk, jmasuk, tglkeluar, jkeluar, lasteditdate, lastedituser, tagedit, ' +
          '(select ben_hrd_karyawan_info.idkaryawan from ben_hrd_karyawan_info ' +
          'where ben_hrd_karyawan_info.kodekaryawan = ben_hrd_jadwal_local.kodekaryawan) as idkaryawan, ' +
          '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan_info where ' +
          'ben_hrd_karyawan_info.kodekaryawan = ben_hrd_jadwal_local.kodekaryawan) as namakaryawan ' +
          'from ben_hrd_jadwal_local ' +
          'where ben_hrd_jadwal_local.tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) + ''' ' +
          'ORDER BY tglmasuk DESC');
     qryList.Open;
     gtbScheduler.DataController.Refresh;
end;

procedure TfrmReportSchedule.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmReportSchedule.FormCreate(Sender: TObject);
begin
     REC_INDEX := 0;
     tblShift.Active := True;
     qryList.Active := True;
     gtbScheduler.DataController.Refresh;
     edTanggal.Date := Date;
end;

procedure TfrmReportSchedule.gtbSchedulerKeyPress(Sender: TObject;
  var Key: Char);
begin
     case Key of
          #27:
             begin
                  edID.Clear;
                  edID2.Clear;
                  Screen.Cursor := crDefault;
                  lblInfo.Visible := False;
             end;
     end;
end;

end.
