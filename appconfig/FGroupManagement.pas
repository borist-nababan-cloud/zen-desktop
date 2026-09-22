unit FGroupManagement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  MyAccess, DB,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit,  cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, StdCtrls, cxPC, Menus, cxButtons, MainSource, cxCalc,
  ExtCtrls, ComCtrls, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator;

type
  TfrmGroupManagement = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    cxGrid1: TcxGrid;
    gtbUser: TcxGridDBTableView;
    gtbUseridusersgroup: TcxGridDBColumn;
    gtbUsernamausersgroup: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    edNamaGroup: TEdit;
    btnAddUsersGroup: TcxButton;
    cxButton2: TcxButton;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    gtvAccess: TcxGridTableView;
    gtvAccessAutonum: TcxGridColumn;
    gtvAccessUnitName: TcxGridColumn;
    gtvAccessGroup: TcxGridColumn;
    gtvAccessNotes: TcxGridColumn;
    btnLoadAccess: TcxButton;
    btnDeleteAkses: TcxButton;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddUsersGroupClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
    procedure gtbUserDblClick(Sender: TObject);
    procedure gtbUserFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnLoadAccessClick(Sender: TObject);
    procedure btnDeleteAksesClick(Sender: TObject);
  private
    { Private declarations }
    IDGROUPUSERS : Integer;
    qryGroup1, qryGroup2, qryExec : TMyQuery;
    tblGroup : TMyTable;
    dsTbGroup : TDataSource;

  public
    { Public declarations }
    procedure InsertAccess(var autonum : Integer);
    procedure LoadAccess();
  end;

var
  frmGroupManagement: TfrmGroupManagement;

implementation

uses FDMDB, FGroupAccessAdd;

{$R *.dfm}

procedure TfrmGroupManagement.InsertAccess(var autonum: Integer);
begin
    qryGroup2.Close;
    qryGroup2.SQL.Clear;
    qryGroup2.SQL.Add('select autonum, regname, regparent, ' +
                      'notes from regbutton where autonum = ''' +
                 IntToStr(autonum) + '''');
    qryGroup2.Open;


    qryExec.SQL.Clear;
    qryExec.SQL.Add('insert into usersakses values(' +
                '''' + '' + ''',' +
                '''' + IntToStr(IDGROUPUSERS) + ''',' +
                '''' + qryGroup2.Fields[1].AsString + ''',' +
                '''' + qryGroup2.Fields[2].AsString + ''',' +
                '''' + qryGroup2.Fields[3].AsString + ''')');
    qryExec.ExecSQL;
    LoadAccess;
end;

procedure TfrmGroupManagement.LoadAccess;
var
  i, newRec: Integer;
begin

    cxGrid2.Visible := True;
    gtvAccess.DataController.SelectAll;
    gtvAccess.DataController.DeleteSelection;
    qryGroup2.Close;
    qryGroup2.SQL.Clear;
    qryGroup2.SQL.Add('select * from usersakses where idusergroup = ''' +
                 IntToStr(IDGROUPUSERS) + '''');
    qryGroup2.Open;
    qryGroup2.First;
    for i := 0 to qryGroup2.RecordCount - 1 do
        begin
          newRec := gtvAccess.DataController.InsertRecord(gtvAccess.DataController.RecordCount);
          gtvAccess.DataController.SetValue(newRec, gtvAccessAutonum.Index, qryGroup2.Fields[0].AsInteger);
          gtvAccess.DataController.SetValue(newRec, gtvAccessUnitName.Index, qryGroup2.Fields[2].AsString);
          gtvAccess.DataController.SetValue(newRec, gtvAccessGroup.Index, qryGroup2.Fields[3].AsString);
          gtvAccess.DataController.SetValue(newRec, gtvAccessNotes.Index, qryGroup2.Fields[4].AsString);
          gtvAccess.DataController.PostEditingData;
          gtvAccess.DataController.Post(True);
          qryGroup2.Next;
        end;
end;

procedure TfrmGroupManagement.btnAddUsersGroupClick(Sender: TObject);
begin
     if (edNamaGroup.Text = '') then Exit;
     qryGroup1.Close;
     qryGroup1.SQL.Clear;
     qryGroup1.SQL.Add('select namausersgroup from usersgroup where namausersgroup = ''' +
                       edNamaGroup.Text + '''');
     qryGroup1.Open;
     if (NOT qryGroup1.IsEmpty) then
        begin
           ShowMessage('Data User Group ' + edNamaGroup.Text + ' Sudah Ada');
           Exit;
        end
     else if (qryGroup1.IsEmpty) then
        begin
          qryExec.SQL.Clear;
          qryExec.SQL.Add('insert into usersgroup values(' +
                '''' + '' + ''',' +
                '''' + edNamaGroup.Text + ''')');
          qryExec.ExecSQL;
          tblGroup.Refresh;
          gtbUser.DataController.Refresh;
        end;
end;

procedure TfrmGroupManagement.btnDeleteAksesClick(Sender: TObject);
var
  recSelect, autonum : Integer;
begin
     recSelect := gtvAccess.DataController.GetFocusedRecordIndex;
     if (recSelect <= 0) then Exit
     else if (recSelect > 0) then
       begin
         autonum := gtvAccess.DataController.GetValue(recSelect, gtvAccessAutonum.Index);
         qryExec.SQL.Clear;
         qryExec.SQL.Add('delete from usersakses where autonum = ''' +
                      IntToStr(autonum) + '''');
         qryExec.ExecSQL;
         LoadAccess;
       end;
end;

procedure TfrmGroupManagement.btnLoadAccessClick(Sender: TObject);
var
   recSelect : Integer;
begin
    recSelect := gtbUser.DataController.GetFocusedRecordIndex;
    if (recSelect >= 0) then IDGROUPUSERS := gtbUser.DataController.GetValue(recSelect, gtbUseridusersgroup.Index)
    else if (recSelect < 0) then IDGROUPUSERS := 100;
    //ShowMessage(IntToStr(IDGROUPUSERS));
    LoadAccess;
    btnLoadAccess.Enabled := False;
end;

procedure TfrmGroupManagement.cxButton2Click(Sender: TObject);
var
   i, newRec, recSel : Integer;
   ketemu : Boolean;
   namaUnit, groupID : String;
begin
     recSel := gtbUser.DataController.GetFocusedRecordIndex;
     if (recSel < 0) then Exit;
     groupID := vartostr(gtbUser.DataController.GetValue(recSel, gtbUseridusersgroup.Index));
     Application.CreateForm(TfrmGroupAccessAdd, frmGroupAccessAdd);
     frmGroupAccessAdd.FormStyle := fsNormal;
     qryGroup1.Close;
     qryGroup1.SQL.Clear;
     qryGroup1.SQL.Add('select * from regbutton order by regname ASC');
     qryGroup1.Open;
     qryGroup1.First;
     for i := 0 to qryGroup1.RecordCount - 1 do
        begin
           namaUnit := qryGroup1.Fields[1].AsString;
           qryGroup2.Close;
           qryGroup2.SQL.Clear;
           qryGroup2.SQL.Add('select autonum from usersakses where idusergroup = ''' + groupID + ''' AND regname = ''' +
               namaUnit + '''');
           qryGroup2.Open;
           if (qryGroup2.IsEmpty) then
             begin
               with frmGroupAccessAdd do
                  begin
                    newRec := gtvAvailable.DataController.InsertRecord(gtvAvailable.DataController.RecordCount);
                    gtvAvailable.DataController.SetValue(newRec, gtvAvailableAutonum.Index, qryGroup1.Fields[0].AsInteger);
                    gtvAvailable.DataController.SetValue(newRec, gtvAvailableUnitName.Index, qryGroup1.Fields[1].AsString);
                    gtvAvailable.DataController.SetValue(newRec, gtvAvailableGroup.Index, qryGroup1.Fields[3].AsString);
                    gtvAvailable.DataController.SetValue(newRec, gtvAvailableNotes.Index, qryGroup1.Fields[4].AsString);
                    gtvAvailable.DataController.SetValue(newRec, gtvAvailableAdd.Index, False);
                    gtvAvailable.DataController.PostEditingData;
                    gtvAvailable.DataController.Post(True);
                  end;
             end;

           qryGroup1.Next;
        end;
     frmGroupAccessAdd.Show;
     frmGroupAccessAdd.Width := 905;
     frmGroupAccessAdd.Height := 580;
     frmGroupAccessAdd.Position := poDesktopCenter;

end;

procedure TfrmGroupManagement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    qryGroup1.Free;
    qryGroup2.Free;
    tblGroup.Free;
    dsTbGroup.Free;
    Action := caFree;
end;

procedure TfrmGroupManagement.FormCreate(Sender: TObject);
begin
     qryGroup1 := TMyQuery.Create(Self);
     qryGroup1.Connection := DMDB.dbInternal;
     qryGroup1.SQL.Add('select * from temptable');
     qryGroup1.Active := true;

     qryGroup2 := TMyQuery.Create(Self);
     qryGroup2.Connection := DMDB.dbInternal;
     qryGroup2.SQL.Add('select * from temptable');
     qryGroup2.Active := true;

     qryExec := TMyQuery.Create(Self);
     qryExec.Connection := DMDB.dbInternal;
     qryExec.SQL.Add('select * from temptable');
     qryExec.Active := true;

     tblGroup := TMyTable.Create(Self);
     tblGroup.Connection := DMDB.dbInternal;
     tblGroup.TableName := 'usersgroup';
     tblGroup.Active := true;

     dsTbGroup := TDataSource.Create(Self);
     dsTbGroup.DataSet := tblGroup;

     gtbUser.DataController.DataSource := dsTbGroup;

end;

procedure TfrmGroupManagement.gtbUserDblClick(Sender: TObject);
var
   recSelect : Integer;
begin
    recSelect := gtbUser.DataController.GetFocusedRecordIndex;
    if (recSelect >= 0) then IDGROUPUSERS := gtbUser.DataController.GetValue(recSelect, gtbUseridusersgroup.Index)
    else if (recSelect < 0) then IDGROUPUSERS := 100;
    ShowMessage(IntToStr(IDGROUPUSERS));
    LoadAccess;
    btnLoadAccess.Enabled := False;
end;

procedure TfrmGroupManagement.gtbUserFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
    cxGrid2.Visible := False;
    btnLoadAccess.Enabled := True;
end;

end.
