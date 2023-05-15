unit FDrivers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxMemo,
  cxDBEdit, cxNavigator, cxDBNavigator, cxCheckBox, Menus, cxButtons,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, DBAccess, MyAccess, MemDS;

type
  TfrmDrivers = class(TForm)
    gtbMasterDrivers: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edNama: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    edAlamat: TcxMemo;
    Label3: TLabel;
    edHape: TcxTextEdit;
    Label4: TLabel;
    edNopol: TcxTextEdit;
    gtbMasterDriversautonum: TcxGridDBColumn;
    gtbMasterDriversid_drivers: TcxGridDBColumn;
    gtbMasterDriversnama: TcxGridDBColumn;
    gtbMasterDriversalamat: TcxGridDBColumn;
    gtbMasterDrivershandphone: TcxGridDBColumn;
    gtbMasterDriversnopol_mobil: TcxGridDBColumn;
    gtbMasterDriverstemplate_fp: TcxGridDBColumn;
    gtbMasterDriversaktif: TcxGridDBColumn;
    cxDBNavigator1: TcxDBNavigator;
    cxDBMemo1: TcxDBMemo;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    tblDrivers: TMyTable;
    dsTblDrivers: TMyDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qrySearch, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmDrivers: TfrmDrivers;

implementation

{$R *.dfm}

uses FdmDB;

procedure TfrmDrivers.btnCancelClick(Sender: TObject);
begin
     edNama.Clear;
     edAlamat.Clear;
     edHape.Clear;
     edNopol.Clear;
end;

procedure TfrmDrivers.btnSaveClick(Sender: TObject);
var
   idMember, strSql : String;
begin

               strSql := 'select autonum from ben_master_drivers where nama = ''' +
                         edNama.Text + '''';
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add(strSql);
               qrySearch.Open;
               if (qrySearch.IsEmpty) then
                   begin
                        idMember := 'D' + FormatDateTime('ddmmyyhhmmss', Now);
                        strSql := 'insert into ben_master_drivers values(' +
                                  '''' + '' + ''',' +
                                  '''' + idMember + ''',' +
                                  '''' + edNama.Text + ''',' +
                                  '''' + edAlamat.Text + ''',' +
                                  '''' + edHape.Text + ''',' +
                                  '''' + edNopol.Text + ''',' +
                                  '''' + '' + ''',' +
                                  '''' + '11' + ''',' +
                                  '''' + 'Y' + ''')';
                        qryExec.SQL.Clear;
                        qryExec.SQL.Add(strSql);
                        qryExec.ExecSQL;
                        tblDrivers.Refresh;
                        gtbMasterDrivers.DataController.Refresh;
                        btnCancel.Click;
                   end
               else if (NOT qrySearch.IsEmpty) then
                   begin
                        ShowMessage('Nama Driver sudah Ada !!');
                        Exit;
                   end

end;

procedure TfrmDrivers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    qrySearch.Free;
    qryExec.Free;
    Action := caFree;
end;

procedure TfrmDrivers.FormCreate(Sender: TObject);
begin
  qryExec := TMyQuery.Create(Self);
  qryExec.Connection := DMDB.dbInternal;
  qryExec.SQL.Add('select * from temptable');
  qryExec.Active := true;

  qrySearch := TMyQuery.Create(Self);
  qrySearch.Connection := DMDB.dbInternal;
  qrySearch.SQL.Add('select * from temptable');
  qrySearch.Active := true;

  tblDrivers.Active := True;
  gtbMasterDrivers.DataController.Refresh;
end;

end.
