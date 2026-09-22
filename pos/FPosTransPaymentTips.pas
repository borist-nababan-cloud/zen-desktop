unit FPosTransPaymentTips;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  Data.DB, MemDS, DBAccess, MyAccess, Vcl.Menus, cxButtons, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxCalc, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, dxBevel, cxListView;

type
  TfrmPosTransPaymentTips = class(TForm)
    qryList: TMyQuery;
    dsQryList: TMyDataSource;
    tabControl: TcxPageControl;
    tabMain: TcxTabSheet;
    Label1: TLabel;
    edTanggal: TcxDateEdit;
    btnLoad: TcxButton;
    gtbList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbListid_payment: TcxGridDBColumn;
    gtbListnama_member: TcxGridDBColumn;
    gtbListtotal: TcxGridDBColumn;
    btnAdd: TcxButton;
    tabInput: TcxTabSheet;
    gtbListtanggal: TcxGridDBColumn;
    btnSimpan: TButton;
    edList1: TListBox;
    edPaymentID: TcxTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    edPaymentDate: TcxDateEdit;
    edPaymentTotal: TcxCalcEdit;
    Label4: TLabel;
    dxBevel1: TdxBevel;
    Label5: TLabel;
    edNilai: TcxCalcEdit;
    btnBatal: TButton;
    edList2: TListBox;
    Label6: TLabel;
    Label7: TLabel;
    lblJudulAtas: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBatalClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
    qryCari, qryFind, qryTemp, qrySearch, qryExec : TMyQuery;
  public
    { Public declarations }
    ISADMIN : Boolean;
  end;

var
  frmPosTransPaymentTips: TfrmPosTransPaymentTips;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmPosTransPaymentTips.btnAddClick(Sender: TObject);
var
   recSel : Integer;
   idPayment : String;
  i: Integer;
begin
     recSel := gtbList.DataController.GetFocusedRecordIndex;
     if recSel = Null then Exit;
     tabControl.ActivePage := tabInput;
     idPayment := gtbList.DataController.GetValue(recSel, gtbListid_payment.Index);
     edPaymentID.Text := idPayment;

     qrySearch.Close;
     qrySearch.SQL.Clear;
     qrySearch.SQL.Add('select id_payment, tanggal, nama_member, total from trans_payment where ' +
                     'id_payment = ''' + idPayment + '''');
     qrySearch.Open;
     edPaymentDate.Date := qrySearch.Fields[1].AsDateTime;
     edPaymentTotal.EditValue := qrySearch.Fields[3].AsFloat;

     qryCari.Close;
     qryCari.SQL.Clear;
     qryCari.SQL.Add('select id_payment, room_id, therapist_id from trans_master where ' +
                     'id_payment = ''' + idPayment + '''');
     qryCari.Open;
     qryCari.First;
     for i := 0 to qryCari.RecordCount -1 do
         begin
              edList1.Items.Add(qryCari.Fields[1].AsString);
              edList2.Items.Add(qryCari.Fields[2].AsString);
//              edList1.AddItem(qryCari.Fields[1].AsString);
//              edList2.Items.Add(qryCari.Fields[2].AsString);
              qryCari.Next;
         end;
end;

procedure TfrmPosTransPaymentTips.btnLoadClick(Sender: TObject);
begin
     qryList.Close;
     qryList.SQL.Clear;
     qryList.SQL.Add('SELECT trans_payment.id_payment, trans_payment.tanggal, trans_payment.nama_member, trans_payment.total ' +
                      'FROM trans_payment ' +
                      'WHERE NOT EXISTS (SELECT 1 FROM trans_payment_tips WHERE trans_payment.id_payment = trans_payment_tips.id_payment) ' +
                      'AND trans_payment.tanggal = ''' + FormatDateTime('yyyy-MM-dd', edTanggal.Date) +
                      '''ORDER BY trans_payment.id_payment DESC;');
     qryList.Open;
     gtbList.DataController.Refresh;
end;

procedure TfrmPosTransPaymentTips.btnSimpanClick(Sender: TObject);
var
   listTR : String;
  i: Integer;
begin
    if (edList2.Items.Count > 1) then
       begin
//           ShowMessage('Lebih dari 1');
           listTR := '{ ';
           for i := 0 to edList2.Items.Count -1 do
               begin
                    listTR := listTR + edList2.Items[i] + ' | ';
               end;
           listTR := listTr + ' }';
       end
    else if (edList2.Items.Count = 1) then
       begin
//           ShowMessage('Sama 1');
           listTR :='{ ' + edList2.Items[0] + ' }';
       end;
//    ShowMessage(listTR);
    qryExec.SQL.Clear;
    qryExec.SQL.Add('insert into trans_payment_tips values(' +
                     QuotedStr(edPaymentID.Text) + ',' +
                     QuotedStr(FloatToStr(edNilai.EditValue)) + ',' +
                     QuotedStr(FormatDateTime('yyyy-MM-dd', edPaymentDate.Date)) + ',' +
                     QuotedStr(listTR) + ',' +
                     QuotedStr(frmMain.USERAPPS) + ',' +
                     QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ',' +
                     QuotedStr('{}') + ');');
    qryExec.ExecSQL;
    btnBatal.Click;
    btnLoad.Click;
    ShowMessage('Input Tips Selesai');
end;

procedure TfrmPosTransPaymentTips.btnBatalClick(Sender: TObject);
begin
     tabControl.ActivePage := tabMain;
     edList1.Clear;
     edList2.Clear;
     edPaymentDate.Date := Date;
     edNilai.EditValue := 0;
     edPaymentTotal.EditValue := 0;
     edPaymentID.Clear;
end;

procedure TfrmPosTransPaymentTips.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     qryCari.Free;
     qryExec.Free;
     qryFind.Free;
     qrySearch.Free;
     qryTemp.Free;
     Action := caFree;
end;

procedure TfrmPosTransPaymentTips.FormCreate(Sender: TObject);
begin
//     qryThread1.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

    qryCari := TMyQuery.Create(Self);
    qryCari.Connection := DMDB.dbInternal;
    qryCari.SQL.Add('select * from temptable');
    qryCari.Active := true;

    qrySearch := TMyQuery.Create(Self);
    qrySearch.Connection := DMDB.dbInternal;
    qrySearch.SQL.Add('select * from temptable');
    qrySearch.Active := true;

    qryTemp := TMyQuery.Create(Self);
    qryTemp.Connection := DMDB.dbInternal;
    qryTemp.SQL.Add('select * from temptable');
    qryTemp.Active := true;

    qryFind := TMyQuery.Create(Self);
    qryFind.Connection := DMDB.dbInternal;
    qryFind.SQL.Add('select * from temptable');
    qryFind.Active := true;
    qryList.Active := True;
    gtbList.DataController.Refresh;
    edTanggal.Date := Date;
    tabControl.HideTabs := True;
    tabControl.ActivePage := tabMain;
end;

end.
