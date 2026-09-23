unit FPosTransMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, MyAccess,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, DBAccess, MemDS, cxContainer, cxLabel, strUtils, DateUtils,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxDropDownEdit, cxCalendar, cxCalc, Vcl.Menus, cxButtons,
  XSuperJSON, XSuperObject, Printers, cxDBNavigator, dxBevel, System.Threading;

type
  TfrmPosTransMain = class(TForm)
    tmrRefresh: TTimer;
    lblJudulAtas: TLabel;
    qryMaster: TMyQuery;
    dsQryMaster: TMyDataSource;
    gtbMaster: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbMastertrans_id: TcxGridDBColumn;
    gtbMasterstart_time: TcxGridDBColumn;
    gtbMasterend_time: TcxGridDBColumn;
    gtbMasternama_customer: TcxGridDBColumn;
    gtbMasterroom_id: TcxGridDBColumn;
    gtbMastertherapist_id: TcxGridDBColumn;
    tbDetails: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    qryDetails: TMyQuery;
    dsQryDetails: TMyDataSource;
    gtbMasternotes: TcxGridDBColumn;
    gtbMastercabang: TcxGridDBColumn;
    lblNamaPaket: TcxLabel;
    lblActivePacket: TcxLabel;
    edDateTimeServer: TcxDateEdit;
    cxLabel2: TcxLabel;
    tbDetailsautonum: TcxGridDBColumn;
    tbDetailsid_trans: TcxGridDBColumn;
    tbDetailsproduk_jasa_id: TcxGridDBColumn;
    tbDetailsproduk_jasa_nama: TcxGridDBColumn;
    tbDetailsdisc_percent: TcxGridDBColumn;
    tbDetailssubtotal: TcxGridDBColumn;
    tbDetailslama: TcxGridDBColumn;
    tbDetailscabang: TcxGridDBColumn;
    pnlControl: TPanel;
    btnNew: TcxButton;
    btnJasa: TcxButton;
    btnAdditional: TcxButton;
    btnProduk: TcxButton;
    btnGC: TcxButton;
    cxButton1: TcxButton;
    Label14: TLabel;
    cbPrinterHK: TComboBox;
    cxDBNavigator1: TcxDBNavigator;
    tbDetailstrans_type_id: TcxGridDBColumn;
    memStruktur: TMemo;
    dxBevel1: TdxBevel;
    btnCetakSO: TcxButton;
    cxButton2: TcxButton;
    btnChangeRoom: TcxButton;
    gtbMastergender: TcxGridDBColumn;
    cxLabel3: TcxLabel;
    edRefreshCount: TcxCalcEdit;
    lblToCount: TcxLabel;
    cxButton3: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure btnJasaClick(Sender: TObject);
    procedure btnAdditionalClick(Sender: TObject);
    procedure tbDetailstrans_type_idGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure btnProdukClick(Sender: TObject);
    procedure btnGCClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnCetakSOClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnChangeRoomClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    private
      { Private declarations }
      qryTrans1, qryExec, qryCariPacket: TMyQuery;
      cntRefresh, cntQuery : Integer;
      function CreateAutoNumb : String;
      //function InputCombo(const ACaption, APrompt: string; const AList: TStrings): string;
      procedure SyncForm;
    public
      { Public declarations }
      vPackHH : Boolean;
      procedure CariPacket();

    end;

var
  frmPosTransMain: TfrmPosTransMain;

implementation

{$R *.dfm}
uses FdMDB, FMain, FNewMenuTrans, FBuyAdditional, FBuyProduct, FBuyGC,
     FPrintSO, FPosTransMainDetails;

function InputCombo(const ACaption, APrompt: string; const AList: TStrings): string;

  function GetCharSize(Canvas: TCanvas): TPoint;
  var
    I: Integer;
    Buffer: array[0..51] of Char;
  begin
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;

var
  Form: TForm;
  Prompt: TLabel;
  Combo: TComboBox;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := '';
  Form   := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption     := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      Position    := poScreenCenter;
      Prompt      := TLabel.Create(Form);
      with Prompt do
      begin
        Parent   := Form;
        Caption  := APrompt;
        Left     := MulDiv(8, DialogUnits.X, 4);
        Top      := MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
        WordWrap := True;
      end;
      Combo := TComboBox.Create(Form);
      with Combo do
      begin
        Parent := Form;
        Style  := csDropDownList;
        //für Eingabemöglichkeit in Combo verwende
        //For input possibility in combo uses
        //Style := csDropDown;
        Items.Assign(AList);
        ItemIndex := 0;
        Left      := Prompt.Left;
        Top       := Prompt.Top + Prompt.Height + 5;
        Width     := MulDiv(164, DialogUnits.X, 4);
      end;
      ButtonTop    := Combo.Top + Combo.Height + 15;
      ButtonWidth  := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent      := Form;
        Caption     := 'OK';
        ModalResult := mrOk;
        default     := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent      := Form;
        Caption     := 'Cancel';
        ModalResult := mrCancel;
        Cancel      := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), Combo.Top + Combo.Height + 15,
          ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;
      end;
      if ShowModal = mrOk then
      begin
        Result := Combo.Text;
      end;
    finally
      Form.Free;
    end;
end;

procedure TfrmPosTransMain.btnAdditionalClick(Sender: TObject);
var
  recSel : Integer;
  KodeTrans, strPaket, typeJasa : String;
  vWaktu : TTime;
  vTanggal : TDate;
  jSonItem : XSuperObject.ISuperObject;
begin

   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   KodeTrans := VarToStr(gtbMaster.DataController.GetValue(recSel,gtbMastertrans_id.Index));
   qryTrans1.Close;
   qryTrans1.SQL.Clear;
   qryTrans1.SQL.Add('select promo from trans_master where trans_id = ''' + KodeTrans + '''');
   qryTrans1.Open;
   if (qryTrans1.Fields[0].AsString <> 'S') then
     begin
       ShowMessage('Transaksi sedang digunakan user lain !!');
       Exit;
     end;

   qryTrans1.Close;
   qryTrans1.SQL.Clear;
   qryTrans1.SQL.Add('select autonum from trans_detail where id_trans = ''' +
       KodeTrans + ''' AND trans_type_id = ''' + 'BJ' + '''');
   qryTrans1.Open;
   if (qryTrans1.IsEmpty) then
     begin
       ShowMessage('Anda belum memilih jasa utama !');
       Exit;
     end;

   qryCariPacket.Close;
   qryCariPacket.SQL.Clear;
   qryCariPacket.SQL.Add('select notes, room_id, therapist_id, nama_customer from trans_master where trans_id = ''' +
       KodeTrans + '''');
   qryCariPacket.Open;
   jSonItem := XSuperobject.SO(qryCariPacket.Fields[0].AsString);
   typeJasa := jSonItem.S['typejasa'];

   vWaktu := edDateTimeServer.Date;
   vTanggal := edDateTimeServer.Date;

   Application.CreateForm(TfrmBuyAdditional, frmBuyAdditional);
   frmBuyAdditional.FormStyle := fsStayOnTop;
   frmBuyAdditional.Height := 472;
   frmBuyAdditional.Width := 391;
   frmBuyAdditional.Position := poDesktopCenter;
   frmBuyAdditional.lblKodeTrans.Caption := KodeTrans;
   frmBuyAdditional.PACKETHH := vPackHH;
   frmBuyAdditional.varJam := vWaktu;
   frmBuyAdditional.varTanggal := vTanggal;
   frmBuyAdditional.ID_ROOM := qryCariPacket.Fields[1].AsString;
   frmBuyAdditional.ID_TR := qryCariPacket.Fields[2].AsString;
   frmBuyAdditional.CUSTNAME := qryCariPacket.Fields[3].AsString;
   frmBuyAdditional.QryMenu.Active := True;
   //ShowMessage(typeJasa);
   frmBuyAdditional.rbTypeJasa.ItemIndex := 0;

   {frmBuyAdditional.QryMenu.Close;
   frmBuyAdditional.QryMenu.SQL.Clear;
   frmBuyAdditional.QryMenu.SQL.Add('select menu_id, nama_menu from main_menu where jenis_jasa_id = ''' + typeJasa +
         ''' AND type_menu = ''' + 'BA' +
         ''' AND aktif = ''' + 'Y' + ''' ORDER BY nama_menu ASC');
   frmBuyAdditional.QryMenu.Open;}


   if (typeJasa = 'RF') then
     begin
       frmBuyAdditional.rbTypeJasa.ItemIndex := 0;
       frmBuyAdditional.QryMenu.Close;
       frmBuyAdditional.QryMenu.SQL.Clear;
       frmBuyAdditional.QryMenu.SQL.Add('select menu_id, nama_menu from main_menu where jenis_jasa_id = ''' + 'RF' +
             ''' AND type_menu = ''' + 'BA' +
             ''' AND aktif = ''' + 'Y' + ''' ORDER BY nama_menu ASC');
       frmBuyAdditional.QryMenu.Open;
     end
   else if (typeJasa = 'BM') then
     begin
       frmBuyAdditional.rbTypeJasa.ItemIndex := 1;
       frmBuyAdditional.QryMenu.Close;
       frmBuyAdditional.QryMenu.SQL.Clear;
       frmBuyAdditional.QryMenu.SQL.Add('select menu_id, nama_menu from main_menu where jenis_jasa_id = ''' + 'BM' +
             ''' AND type_menu = ''' + 'BA' +
             ''' AND aktif = ''' + 'Y' + ''' ORDER BY nama_menu ASC');
       frmBuyAdditional.QryMenu.Open;
     end;

   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'promo = ''' + 'L' + ''' ' +
       'where trans_id = ''' + KodeTrans + ''';');
   qryExec.ExecSQL;

   frmBuyAdditional.Show;
end;

procedure TfrmPosTransMain.btnCetakSOClick(Sender: TObject);
var
  recSel, Panjang, jumlah : Integer;
  KodeTrans, isRequest : String;
  jSonItem : XSuperObject.ISuperObject;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   KodeTrans := VarToStr(gtbMaster.DataController.GetValue(recSel,gtbMastertrans_id.Index));
   isRequest := 'N';
   Application.CreateForm(TfrmPintSO, frmPintSO);
   frmPintSO.qryPrintSO.Close;
   frmPintSO.qryPrintSO.SQL.Clear;
   frmPintSO.qryPrintSO.SQL.Add('select * from trans_master where trans_id = ''' +
                       KodeTrans + '''');
   frmPintSO.qryPrintSO.Open;

   jSonItem := XSuperobject.SO(frmPintSO.qryPrintSO.Fields[11].AsString);
      if (jSonItem.Contains('byrequest')) then
        begin
           isRequest := jSonItem.S['byrequest'];
        end
      else if (NOT jSonItem.Contains('byrequest')) then
        begin
           isRequest := 'N';
        end;
   if (isRequest = 'Y') then  frmPintSO.lblByRequest.Caption := 'REQUEST';


   frmPintSO.PrintDetail.Close;
   frmPintSO.PrintDetail.SQL.Clear;
   frmPintSO.PrintDetail.SQL.Add('select * from trans_detail where id_trans = ''' +
                       KodeTrans + ''' and trans_type_id <> ''' +
                       'BP' + ''' and trans_type_id <> ''' +
                       'BG' + '''');
   frmPintSO.PrintDetail.Open;
   jumlah := frmPintSO.PrintDetail.RecordCount;

   panjang := 40 * jumlah;
   frmPintSO.qrpSO.Height := frmPintSO.qrpSO.Height + panjang;
   Printer.PrinterIndex := cbPrinterHK.ItemIndex;
   frmPintSO.qrpSO.Prepare;
   frmPintSO.qrpSO.Preview;
   //frmPintSO.qrpSO.PrinterSettings.PrinterIndex := cbPrinterHK.ItemIndex;

end;

procedure TfrmPosTransMain.btnChangeRoomClick(Sender: TObject);
var
  lstRoom : TStringList;
  KodeTrans, kodeRoom, typeJasa, keterangan : String;
  vWaktu : TTime;
  vTanggal : TDate;
  jSonItem : XSuperObject.ISuperObject;
  i, recSel: Integer;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   KodeTrans := VarToStr(gtbMaster.DataController.GetValue(recSel,gtbMastertrans_id.Index));

   qryCariPacket.Close;
   qryCariPacket.SQL.Clear;
   qryCariPacket.SQL.Add('select notes, room_id, therapist_id, nama_customer from trans_master where trans_id = ''' +
       KodeTrans + '''');
   qryCariPacket.Open;
   jSonItem := XSuperobject.SO(qryCariPacket.Fields[0].AsString);
   typeJasa := jSonItem.S['typejasa'];

   lstRoom := TStringList.Create;
        try
          qryTrans1.Close;
          qryTrans1.SQL.Clear;
          qryTrans1.SQL.Add('select ruangan_id from ruangan where jenis_jasa = ''' + typeJasa +
               ''' ORDER BY ruangan_id ASC');
          qryTrans1.Open;
          qryTrans1.First;
          for i := 0 to qryTrans1.RecordCount-1 do
             begin
               lstRoom.Add(qryTrans1.Fields[0].AsString);
               qryTrans1.Next;
             end;
          kodeRoom := InputCombo('Room Change', 'Select Room ', lstRoom);
        finally
          lstRoom.Free;
        end;
   vWaktu := edDateTimeServer.Date;
   vTanggal := edDateTimeServer.Date;
   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd', vTanggal) + '@' + FormatDateTime('hh:mm:ss', vWaktu);
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
      'room_id = ''' + kodeRoom + ''',' +
      'cabang = ' + QuotedStr(keterangan) + ' ' +
      'where trans_id = ''' + KodeTrans + ''';');
   qryExec.ExecSQL;
   frmPosTransMain.qryMaster.Refresh;
   frmPosTransMain.gtbMaster.DataController.Refresh;
   frmPosTransMain.qryDetails.Refresh;
   frmPosTransMain.tbDetails.DataController.Refresh;


end;

procedure TfrmPosTransMain.btnGCClick(Sender: TObject);
var
  recSel : Integer;
  KodeTrans : String;
  vWaktu : TTime;
  vTanggal : TDate;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   KodeTrans := VarToStr(gtbMaster.DataController.GetValue(recSel,gtbMastertrans_id.Index));
   qryTrans1.Close;
   qryTrans1.SQL.Clear;
   qryTrans1.SQL.Add('select promo from trans_master where trans_id = ''' + KodeTrans + '''');
   qryTrans1.Open;
   if (qryTrans1.Fields[0].AsString <> 'S') then
     begin
       ShowMessage('Transaksi sedang digunakan user lain !!');
       Exit;
     end;
   vWaktu := edDateTimeServer.Date;
   vTanggal := edDateTimeServer.Date;
   qryCariPacket.Close;
   qryCariPacket.SQL.Clear;
   qryCariPacket.SQL.Add('select notes, room_id, therapist_id, nama_customer from trans_master where trans_id = ''' +
       KodeTrans + '''');
   qryCariPacket.Open;

   Application.CreateForm(TfrmBuyGC, frmBuyGC);
   frmBuyGC.FormStyle := fsStayOnTop;
   frmBuyGC.Height := 361;
   frmBuyGC.Width := 462;
   frmBuyGC.lblKodeTrans.Caption := KodeTrans;
   frmBuyGC.varJam := vWaktu;
   frmBuyGC.varTanggal := vTanggal;
   frmBuyGC.CUSTNAME := qryCariPacket.Fields[3].AsString;
   frmBuyGC.ID_ROOM := qryCariPacket.Fields[1].AsString;
   frmBuyGC.ID_TR := qryCariPacket.Fields[2].AsString;
   frmBuyGC.QryMenu.Active := True;

   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'promo = ''' + 'L' + ''' ' +
       'where trans_id = ''' + KodeTrans + ''';');
   qryExec.ExecSQL;

   frmBuyGC.Show;
   frmBuyGC.Position := poDesktopCenter;
end;

procedure TfrmPosTransMain.btnJasaClick(Sender: TObject);
var
  recSel : Integer;
  KodeTrans, strPaket : String;
  vWaktu : TTime;
  vTanggal : TDate;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   KodeTrans := VarToStr(gtbMaster.DataController.GetValue(recSel,gtbMastertrans_id.Index));
   if (vPackHH = True) then strPaket := 'Y'
   else if (vPackHH = False) then strPaket := 'N';
   vWaktu := edDateTimeServer.Date;
   vTanggal := edDateTimeServer.Date;
   qryTrans1.Close;
   qryTrans1.SQL.Clear;
   qryTrans1.SQL.Add('select promo from trans_master where trans_id = ''' + KodeTrans + '''');
   qryTrans1.Open;
   if (qryTrans1.Fields[0].AsString = 'L') then
     begin
       ShowMessage('Transaksi sedang digunakan user lain !!');
       Exit;
     end;


   qryTrans1.Close;
   qryTrans1.SQL.Clear;
   qryTrans1.SQL.Add('select autonum from trans_detail where id_trans = ''' +
       KodeTrans + ''' AND trans_type_id = ''' + 'BJ' + '''');
   qryTrans1.Open;
   if (qryTrans1.IsEmpty) then
     begin
         qryCariPacket.Close;
         qryCariPacket.SQL.Clear;
         qryCariPacket.SQL.Add('select nama_customer, gender from trans_master where trans_id = ''' +
             KodeTrans + '''');
         qryCariPacket.Open;
         Application.CreateForm(TfrmNewMenuTrans, frmNewMenuTrans);
         frmNewMenuTrans.FormStyle := fsStayOnTop;
         frmNewMenuTrans.Height := 700;
         frmNewMenuTrans.Width := 870;
         frmNewMenuTrans.Position := poDesktopCenter;
         frmNewMenuTrans.lblKodeTrans.Caption := KodeTrans;
         frmNewMenuTrans.PACKETHH := vPackHH;
         frmNewMenuTrans.varJam := vWaktu;
         frmNewMenuTrans.varTanggal := vTanggal;
         frmNewMenuTrans.edCustName.Text := qryCariPacket.Fields[0].AsString;
         if (qryCariPacket.Fields[1].AsString = 'M') then frmNewMenuTrans.rbGender.ItemIndex := 0
         else if (qryCariPacket.Fields[1].AsString = 'F') then frmNewMenuTrans.rbGender.ItemIndex := 1;

         qryExec.SQL.Clear;
         qryExec.SQL.Add('update trans_master set ' +
             'promo = ''' + 'L' + ''' ' +
             'where trans_id = ''' + KodeTrans + ''';');
         qryExec.ExecSQL;

         frmNewMenuTrans.Show;
     end
   else if(NOT qryTrans1.IsEmpty) then
    begin
      ShowMessage('Anda Tidak Bisa membeli jasa lagi');
      Exit;
    end;

end;

procedure TfrmPosTransMain.btnNewClick(Sender: TObject);
var
  NewKodeTrans, strPaket, keterangan : String;
  vWaktu : TTime;
  vTanggal : TDate;
begin
   if (vPackHH = True) then strPaket := 'Y'
   else if (vPackHH = False) then strPaket := 'N';
   NewKodeTrans := CreateAutoNumb;
   vWaktu := edDateTimeServer.Date;
   vTanggal := edDateTimeServer.Date;
   //ShowMessage(FormatDateTime('yyyy MMMM dd', vTanggal) + '#' + FormatDateTime('hh:mm:ss', vWaktu));
   qryExec.SQL.Clear;
   qryExec.SQL.Add('insert into trans_master values(' +
      '''' + NewKodeTrans + ''',' +
      '''' + 'STARTED' + ''',' +
      '''' + FormatDateTime('yyyy-MM-dd', vTanggal) + ''',' +
      '''' + FormatDateTime('hh:mm:ss', vWaktu) + ''',' +
      '''' + FormatDateTime('hh:mm:ss', vWaktu) + ''',' +
      '''' + 'GUEST 1' + ''',' +
      '''' + '' + ''',' +
      '''' + ''  + ''',' +
      '''' + '0' + ''',' +
      '''' + '0' + ''',' +
      '''' + strPaket + ''',' +
      '''' +  '' + ''',' +
      '''' + '' + ''',' +
      '''' + 'N' + ''',' +
      '''' + 'M' + ''',' +
      '''' + 'L' + ''',' +
      QuotedStr(keterangan) + ');');
   qryExec.ExecSQL;
   Application.CreateForm(TfrmNewMenuTrans, frmNewMenuTrans);
   frmNewMenuTrans.FormStyle := fsNormal;
   frmNewMenuTrans.Height := 700;
   frmNewMenuTrans.Width := 870;
   frmNewMenuTrans.Position := poDesktopCenter;
   frmNewMenuTrans.lblKodeTrans.Caption := NewKodeTrans;
   frmNewMenuTrans.PACKETHH := vPackHH;
   frmNewMenuTrans.varJam := vWaktu;
   frmNewMenuTrans.varTanggal := vTanggal;
   frmNewMenuTrans.Show;
end;

procedure TfrmPosTransMain.btnProdukClick(Sender: TObject);
var
  recSel : Integer;
  KodeTrans : String;
  vWaktu : TTime;
  vTanggal : TDate;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   KodeTrans := VarToStr(gtbMaster.DataController.GetValue(recSel,gtbMastertrans_id.Index));
   qryTrans1.Close;
   qryTrans1.SQL.Clear;
   qryTrans1.SQL.Add('select promo from trans_master where trans_id = ''' + KodeTrans + '''');
   qryTrans1.Open;
   if (qryTrans1.Fields[0].AsString <> 'S') then
     begin
       ShowMessage('Transaksi sedang digunakan user lain !!');
       Exit;
     end;
   vWaktu := edDateTimeServer.Date;
   vTanggal := edDateTimeServer.Date;
   qryCariPacket.Close;
   qryCariPacket.SQL.Clear;
   qryCariPacket.SQL.Add('select notes, room_id, therapist_id, nama_customer from trans_master where trans_id = ''' +
       KodeTrans + '''');
   qryCariPacket.Open;

   Application.CreateForm(TfrmBuyProduct, frmBuyProduct);
   frmBuyProduct.FormStyle := fsStayOnTop;
   frmBuyProduct.Height := 361;
   frmBuyProduct.Width := 462;
   frmBuyProduct.lblKodeTrans.Caption := KodeTrans;
   frmBuyProduct.varJam := vWaktu;
   frmBuyProduct.varTanggal := vTanggal;
   frmBuyProduct.CUSTNAME := qryCariPacket.Fields[3].AsString;
   frmBuyProduct.ID_ROOM := qryCariPacket.Fields[1].AsString;
   frmBuyProduct.ID_TR := qryCariPacket.Fields[2].AsString;
   frmBuyProduct.QryMenu.Active := True;

   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'promo = ''' + 'L' + ''' ' +
       'where trans_id = ''' + KodeTrans + ''';');
   qryExec.ExecSQL;

   frmBuyProduct.Show;
   frmBuyProduct.Position := poDesktopCenter;
end;

procedure TfrmPosTransMain.CariPacket;
begin

end;

function TfrmPosTransMain.CreateAutoNumb: String;
var
  tmpID, strNewID : String;
  intLastID, intNewID : Integer;
begin
  tmpID := frmMain.APP_OUTLETID + '.' + 'POS.' + FormatDateTime('yyMMdd', Date) + '%';
  qryTrans1.Close;
  qryTrans1.SQL.Clear;
  qryTrans1.SQL.Add('select trans_id from trans_master where trans_id like ' + QuotedStr(tmpID) +
      ' ORDER by trans_id ASC');
  qryTrans1.Open;
  if (qryTrans1.IsEmpty) then
    begin
      strNewID := frmMain.APP_OUTLETID + '.' + 'POS.' + FormatDateTime('yyMMdd', Date) + '001';
    end
  else
    begin
      qryTrans1.Last;
      intLastID := StrToInt(RightStr(qryTrans1.Fields[0].AsString, 3));
      intNewID := intLastID + 1;
      case Length(IntToStr(intNewID)) of
        1 : strNewID := frmMain.APP_OUTLETID + '.' + 'POS.' + FormatDateTime('yyMMdd', Date) + '00' + IntToStr(intNewID);
        2 : strNewID := frmMain.APP_OUTLETID + '.' + 'POS.' + FormatDateTime('yyMMdd', Date) + '0' + IntToStr(intNewID);
        3 : strNewID := frmMain.APP_OUTLETID + '.' + 'POS.' + FormatDateTime('yyMMdd', Date) + IntToStr(intNewID);
      end;
    end;
    Result := strNewID;
end;

procedure TfrmPosTransMain.cxButton1Click(Sender: TObject);
var
  recSel, totLama, recMain : Integer;
  transID, kodemenu, keterangan, namaVoid, namaMenu, namaTamu : String;
  vWaktu : TTime;
  vTanggal : TDate;
  btnSelected : integer;
  subtotal : Double;
begin
  qryTrans1.Close;
  qryTrans1.SQL.Clear;
  qryTrans1.SQL.Add('SELECT * FROM information_schema.tables ' +
      'WHERE table_schema = ' + QuotedStr(frmMain.LOCAL_DBNAME) +
    'AND table_name = ' + QuotedStr('trans_detail_void'));
  qryTrans1.Open;
  if (qryTrans1.IsEmpty) then
  begin
    qryExec.SQL.Clear;
    qryExec.SQL.Add(memStruktur.Text);
    qryExec.ExecSQL;
  end;

  recSel := tbDetails.DataController.GetFocusedRecordIndex;


  if (recSel < 0) then Exit;

  vWaktu := edDateTimeServer.Date;
  vTanggal := edDateTimeServer.Date;

  transID := VarToStr(tbDetails.DataController.GetValue(recSel, tbDetailsid_trans.Index));
  qryTrans1.Close;
  qryTrans1.SQL.Clear;
  qryTrans1.SQL.Add('select promo from trans_master where trans_id = ''' + transID + '''');
  qryTrans1.Open;
   if (qryTrans1.Fields[0].AsString <> 'S') then
     begin
       ShowMessage('Transaksi sedang digunakan user lain !!');
       Exit;
     end;

  kodemenu := VarToStr(tbDetails.DataController.GetValue(recSel, tbDetailsproduk_jasa_id.Index));
  keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd', vTanggal) + '@' + FormatDateTime('hh:mm:ss', vWaktu);
  namaMenu := VarToStr(tbDetails.DataController.GetValue(recSel, tbDetailsproduk_jasa_nama.Index));
  namaVoid := 'VOID# ' + namaMenu;
  btnSelected := MessageDlg('Apakah Anda akan menghapus Data ' + kodemenu + '?',mtConfirmation,mbOKCancel, 0);
   if (btnSelected = mrCancel) then Exit;




  qryExec.SQL.Clear;
  qryExec.SQL.Add('insert into trans_detail_void(id_trans, tanggal, trans_type_id, produk_jasa_id, ' +
      'produk_jasa_nama, start_time, end_time, harga, disc_amount, disc_percent, subtotal, teraphist_id, room_id, quantity, ' +
      'aroma, lama, id_customer, paket, payment_id, taked, cabang) select id_trans, tanggal, trans_type_id, produk_jasa_id, ' +
      'produk_jasa_nama, start_time, end_time, harga, disc_amount, disc_percent, subtotal, teraphist_id, room_id, quantity, ' +
      'aroma, lama, id_customer, paket, payment_id, taked, cabang from trans_detail where id_trans = ''' + transID +
      ''' AND produk_jasa_id = ''' + kodemenu + '''');
  qryExec.ExecSQL;
  {recMain := gtbMaster.DataController.GetFocusedRecordIndex;
  namaTamu := VarToStr(tbDetails.DataController.GetDisplayText(recMain, gtbMasternama_customer.Index));
  transID := VarToStr(tbDetails.DataController.GetValue(recMain, gtbMastertrans_id.Index));
  ShowMessage(namaTamu + ' # ' + transID);
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update trans_detail_void set ' +
        'nama_customer = ' + QuotedStr(namaTamu) +
        ' where id_trans = '''+ transID + '''');
  qryExec.ExecSQL; }

  qryExec.SQL.Clear;
  qryExec.SQL.Add('delete from trans_detail where id_trans = ''' + transID +
      ''' AND produk_jasa_id = ''' + kodemenu + ''';');
  qryExec.SQL.Add('update trans_detail_void set ' +
      'cabang = ' + QuotedStr(keterangan) + ',' +
      'produk_jasa_nama = ' + QuotedStr(namaVoid) + ' ' +
      'where id_trans = ''' + transID +
      ''' AND produk_jasa_id = ''' + kodemenu + ''';');
  qryExec.SQL.Add('update main_menu set ' +
       'aktif = ''' + 'Y' +
       ''' where menu_id = ''' + kodemenu + ''';');
   qryExec.ExecSQL;

  qryTrans1.Close;
   qryTrans1.SQL.Clear;
   qryTrans1.SQL.Add('select sum(lama) from trans_detail where id_trans = ''' +
       transID + '''');
   qryTrans1.Open;
   totLama := qryTrans1.Fields[0].AsInteger;

   qryTrans1.Close;
   qryTrans1.SQL.Clear;
   qryTrans1.SQL.Add('select sum(subtotal) from trans_detail where id_trans = ''' +
       transID + '''');
   qryTrans1.Open;
   subtotal := qryTrans1.Fields[0].AsFloat;

  qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'subtotal = ''' + FloatToStr(subtotal) + ''', ' +
       'lama = ''' + IntToStr(totLama) + ''' ' +
       'where trans_id = ''' + transID + ''';');
   qryExec.ExecSQL;

  qryDetails.Refresh;
  tbDetails.DataController.Refresh;

end;

procedure TfrmPosTransMain.cxButton2Click(Sender: TObject);
var
  recSel : Integer;
  KodeTrans, keterangan, namaCust, sGender : String;
  vWaktu : TTime;
  vTanggal : TDate;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   KodeTrans := VarToStr(gtbMaster.DataController.GetValue(recSel,gtbMastertrans_id.Index));

   repeat
    namaCust := UpperCase(inputbox('Customer Edit', 'Type Customer Name', 'Guest 1'));
    until namaCust <> '';

   repeat
    sGender := UpperCase(inputbox('Gender', 'Type M[male] F[female]', 'M'));
    until sGender <> '';

   vWaktu := edDateTimeServer.Date;
   vTanggal := edDateTimeServer.Date;
   keterangan := frmMain.USERAPPS + ' ' + FormatDateTime('yyyy-MM-dd', vTanggal) + '@' + FormatDateTime('hh:mm:ss', vWaktu);
   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
      'nama_customer = ' + QuotedStr(namaCust) + ', ' +
      'gender = ' + QuotedStr(sGender) + ', ' +
      'cabang = ' + QuotedStr(keterangan) + ' ' +
      'where trans_id = ''' + KodeTrans + ''';');
   qryExec.ExecSQL;
   qryMaster.Refresh;
   gtbMaster.DataController.Refresh;
   qryDetails.Refresh;
   tbDetails.DataController.Refresh;
end;

procedure TfrmPosTransMain.cxButton3Click(Sender: TObject);
var
   recSel : Integer;
   KodeTrans, isRequest, vGender : String;
   jSonItem : XSuperObject.ISuperObject;
begin
   recSel := gtbMaster.DataController.GetFocusedRecordIndex;
   if (recSel < 0) then Exit;
   KodeTrans := VarToStr(gtbMaster.DataController.GetValue(recSel,gtbMastertrans_id.Index));
   qryTrans1.Close;
   qryTrans1.SQL.Clear;
   qryTrans1.SQL.Add('select promo, notes, gender, nama_customer from trans_master where trans_id = ''' + KodeTrans + '''');
   qryTrans1.Open;
   if (qryTrans1.Fields[0].AsString <> 'S') then
     begin
       ShowMessage('Transaksi sedang digunakan user lain !!');
       Exit;
     end;
   jSonItem := XSuperobject.SO(qryCariPacket.Fields[0].AsString);
   isRequest := jSonItem.S['byrequest'];
   vGender := qryTrans1.Fields[0].AsString;



   Application.CreateForm(TfrmPosTransMainDetails, frmPosTransMainDetails);
   frmPosTransMainDetails.FormStyle := fsStayOnTop;
   frmPosTransMainDetails.Height := 261;
   frmPosTransMainDetails.Width := 583;
   frmPosTransMainDetails.Position := poDesktopCenter;
   frmPosTransMainDetails.lblKodeTrans.Caption := KodeTrans;
   frmPosTransMainDetails.edCustName.Text := qryTrans1.Fields[3].AsString;

   if (vGender = 'M') then frmPosTransMainDetails.rbGender.ItemIndex := 0
   else if (vGender = 'F') then frmPosTransMainDetails.rbGender.ItemIndex := 1;

   if (isRequest = 'Y') then frmPosTransMainDetails.ckByRequest.Checked := True
   else if (isRequest = 'N') then frmPosTransMainDetails.ckByRequest.Checked := False;

   qryExec.SQL.Clear;
   qryExec.SQL.Add('update trans_master set ' +
       'promo = ''' + 'L' + ''' ' +
       'where trans_id = ''' + KodeTrans + ''';');
   qryExec.ExecSQL;

   frmPosTransMainDetails.Show;
end;

procedure TfrmPosTransMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryExec.Free;
   qryCariPacket.Free;
   qryTrans1.Free;

   Action := caFree;
end;

procedure TfrmPosTransMain.FormCreate(Sender: TObject);
begin
    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;

    qryTrans1 := TMyQuery.Create(Self);
    qryTrans1.Connection := DMDB.dbInternal;
    qryTrans1.SQL.Add('select * from temptable');
    qryTrans1.Active := true;

    qryCariPacket := TMyQuery.Create(Self);
    qryCariPacket.Connection := DMDB.dbInternal;
    qryCariPacket.SQL.Add('select * from temptable');
    qryCariPacket.Active := true;

    qryMaster.Active := True;
    qryDetails.Active := True;
    gtbMaster.DataController.Refresh;
    tbDetails.DataController.Refresh;
    vPackHH := False;
    cntRefresh := 0;
    cntQuery := 0;
    tmrRefresh.Enabled := True;

    pnlControl.Visible := False;
    edDateTimeServer.Date := Now;
    cbPrinterHK.Items := Printer.Printers;


    cbPrinterHK.ItemIndex := frmMain.IDXSOPRINTER;

    lblToCount.Caption := '0';
end;

procedure TfrmPosTransMain.SyncForm;
var
   intHari : Integer;
   namaPaket : String;
   vTgl, vBulan, vTahun, vMenit, vDetik, vJam, vmDetik,
   pMenit, pDetik, pJam, pmDetik  : Word;
   nDate : TDate;
   nWaktu, tPacket, nStart, nEnd : TTime;
   dtPacket, dtSekarang, tmpDateTime : TDateTime;
   qryThread1, qryThread2 : TMyQuery;
begin
   qryThread1 := TMyQuery.Create(Self);
   qryThread1.Connection := DMDB.dbInternal;
   qryThread1.SQL.Add('select * from temptable');
   qryThread1.Active := true;

   qryThread2 := TMyQuery.Create(Self);
   qryThread2.Connection := DMDB.dbInternal;
   qryThread2.SQL.Add('select * from temptable');
   qryThread2.Active := true;

   qryThread1.Close;
   qryThread1.SQL.Clear;
   qryThread1.SQL.Add('select CURRENT_TIMESTAMP as datetimeserver');
   qryThread1.Open;
   edDateTimeServer.Date := qryThread1.Fields[0].AsDateTime;
   nDate := qryThread1.Fields[0].AsDateTime;
   dtSekarang := qryThread1.Fields[0].AsDateTime;
   DecodeDateTime(dtSekarang,vTahun, vBulan, vTgl, vJam, vMenit, vDetik, vmDetik);
   nWaktu := qryThread1.Fields[0].AsDateTime;

   qryThread2.Close;
   qryThread2.SQL.Clear;
   qryThread2.SQL.Add('select end_time, start_time, nama_paket from paket where paket_id = ''' + 'HH' + '''');
   qryThread2.Open;
   //edTimePacket.Time := qryThread2.Fields[0].AsDateTime;
   tPacket := qryThread2.Fields[0].AsDateTime;
   DecodeTime(qryThread2.Fields[0].AsDateTime,pJam, pMenit, pDetik, pmDetik);
   dtPacket := EncodeDateTime(vTahun, vBulan, vTgl, pJam, pMenit, pDetik, pmDetik);
   lblActivePacket.Caption := 'In-Active';
   vPackHH := False;
   intHari := DayOfTheWeek(Date);
   if (intHari >= 6) then
      begin
        lblActivePacket.Caption := 'In-Active';
        vPackHH := False;
      end
   else if (intHari < 6) then
      begin
        qryThread1.Close;
        qryThread1.SQL.Clear;
        qryThread1.SQL.Add('select tanggal from ben_libur_nasional where tanggal = ''' + FormatDateTime('yyyy-MM-dd', nDate) + '''');
        qryThread1.Open;
        if (qryThread1.IsEmpty) then
          begin
             if (dtSekarang < dtPacket) then
               begin
                 lblActivePacket.Caption := 'Active';
                 vPackHH := True;
               end
             else if (dtSekarang > dtPacket) then
               begin
                  lblActivePacket.Caption := 'In-Active';
                  vPackHH := False;
               end;

          end
        else if (NOT qryThread1.IsEmpty) then
          begin
            lblActivePacket.Caption := 'In-Active';
            vPackHH := False;
          end;
      end;
   qryThread1.Free;
   qryThread2.Free;
end;

procedure TfrmPosTransMain.tbDetailstrans_type_idGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  if (AText = 'BJ') then AText := 'Jasa'
  else if (AText = 'BA') then AText := 'Additional'
  else if (AText = 'BP') then AText := 'Produk'
  else if (AText = 'BG') then AText := 'Gift';
end;

procedure TfrmPosTransMain.tmrRefreshTimer(Sender: TObject);
var
   vTanggal : TDate;
   recSel : Integer;
   idTrans : String;
begin
   cntRefresh := cntRefresh + 1;
   cntQuery := cntQuery + 1;
   lblToCount.Caption := 'Ready to Refresh On ' + IntToStr(edRefreshCount.EditValue - cntQuery);
   if (cntRefresh = 5) then
     begin
       pnlControl.Visible := True;
       if (frmPosTransMain.Tag = 0) then
         begin
             TTask.Run(
              procedure
                begin
                   TThread.Synchronize(nil,
                      procedure
                      begin
                         SyncForm;
                      end);
                end
             );
         end;
       cntRefresh := 0;
     end;
   if (cntQuery = edRefreshCount.EditValue) then
     begin
      vTanggal := edDateTimeServer.Date;
      TTask.Run(
            procedure
              begin
                 TThread.Synchronize(nil,
                    procedure
                    begin
                        recSel := gtbMaster.DataController.GetFocusedRecordIndex;
                        if (recSel <> null) then
                           begin
                             idTrans := vartostr(gtbMaster.DataController.GetValue(recSel, gtbMastertrans_id.Index));
                           end;

                        qryMaster.Close;
                        qryMaster.SQL.Clear;
                        qryMaster.SQL.Add('select trans_id, start_time, end_time, nama_customer, room_id, ' +
                            'therapist_id, notes, cabang, gender from trans_master ' +
                            'where tanggal = ''' + FormatDateTime('yyyy-MM-dd', vTanggal) + ''' AND promo <> ''' + 'F' +
                            ''' order by trans_id DESC');
                        qryMaster.Open;
                        gtbMaster.DataController.Refresh;
                        qryDetails.Refresh;
                        gtbMaster.DataController.Search.Locate(gtbMastertrans_id.Index,idTrans);



                    end);
              end
           );
      //cntRefresh := 0;
      cntQuery := 0;
     end;

end;
end.
