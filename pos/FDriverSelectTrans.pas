unit FDriverSelectTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, ExtCtrls, StdCtrls, ComCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, cxTimeEdit,
  cxCalc, cxCheckBox, cxMaskEdit, cxDropDownEdit, cxButtonEdit, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, FlexCodeSDK, MyAccess, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator;

type
  TfrmDriverSelectTrans = class(TForm)
    btnStart: TButton;
    Memo1: TMemo;
    btnStartScan: TButton;
    Image1: TImage;
    Label4: TLabel;
    edDriverID: TcxTextEdit;
    Label1: TLabel;
    edNama: TcxTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNopol: TcxTextEdit;
    Bevel1: TBevel;
    Label5: TLabel;
    edDetail: TMemo;
    Label6: TLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvTransaksi: TcxGridTableView;
    gtvTransaksiIDTransaksi: TcxGridColumn;
    gtvTransaksiNamaJasa: TcxGridColumn;
    gtvTransaksiWaktu: TcxGridColumn;
    gtvTransaksiSubtotal: TcxGridColumn;
    gtvTransaksiAmbil: TcxGridColumn;
    gtvTransaksiNamaCustomer: TcxGridColumn;
    edSubtotal: TcxCalcEdit;
    Label7: TLabel;
    Label8: TLabel;
    edFee: TcxCalcEdit;
    Label9: TLabel;
    edTotalFee: TcxCalcEdit;
    Label10: TLabel;
    edNilaiTrans: TcxCalcEdit;
    gtvTransaksiButton: TcxGridColumn;
    btnSave: TButton;
    edTransID: TcxTextEdit;
    Label11: TLabel;
    btnCancel: TButton;
    Label12: TLabel;
    Label13: TLabel;
    edItems: TcxCalcEdit;
    fpVerifikasi: TFinFPVer;
    procedure FormCreate(Sender: TObject);
    procedure btnStartScanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gtvTransaksiTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure gtvTransaksiButtonPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure gtvTransaksiAmbilPropertiesChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure fpVerifikasiFPVerificationID(ASender: TObject; const ID: WideString;
      FingerNr: Integer);
    procedure fpVerifikasiFPVerificationImage(Sender: TObject);
    procedure fpVerifikasiFPVerificationStatus(ASender: TObject; Status: Integer);
  private
    { Private declarations }
    qrySearch, qryCari, qryFind, qryExec : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmDriverSelectTrans: TfrmDriverSelectTrans;

implementation

{$R *.dfm}

uses FdmDB,  FPrintDriversTrans;

procedure TfrmDriverSelectTrans.btnStartScanClick(Sender: TObject);
var
   i : Integer;
begin
     with dmDB do
          begin
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('select id_drivers, id_finger, template_fp from ben_master_drivers');
               qrySearch.Open;
               qrySearch.First;
               //ShowMessage(inttostr(qrySearch.RecordCount));
               Screen.Cursor := crHourGlass;
               for i := 0 to qrySearch.RecordCount - 1 do
                   begin

                        fpVerifikasi.FPLoad(qrySearch.Fields[0].AsString, 1,
                                           qrySearch.Fields[2].AsString, 'BORIST');
                        //Sleep(1000);
                        //ShowMessage(qrySearch.Fields[0].AsString);
                        qrySearch.Next;

                   end;
               Screen.Cursor := crDefault;
              ShowMessage('FP Loaded Ready To Scan!!');
              //ShowMessage(inttostr(fpVerifikasi.GetFPCount));
              Sleep(1000);
              fpVerifikasi.FPVerificationStart('');
              edTransID.Text := 'TD' + FormatDateTime('ddMMyyhhmmss', Now);
              btnStartScan.Enabled := False;
          end;
end;

procedure TfrmDriverSelectTrans.btnCancelClick(Sender: TObject);
begin
     frmDriverSelectTrans.Close;
end;

procedure TfrmDriverSelectTrans.btnSaveClick(Sender: TObject);
var
   recSelect, i : Integer;
   getFee : Boolean;
begin

     qryExec.SQL.Clear;
     qryExec.SQL.Add('insert into ben_drivers_trans_master values(' +
                       '''' + '' + ''',' +
                       '''' + edTransID.Text + ''',' +
                       '''' + FormatDateTime('yyyy-MM-dd', Now) + ''',' +
                       '''' + FormatDateTime('hh:mm:ss', Now) + ''',' +
                       '''' + edDriverID.Text + ''',' +
                       '''' + edNama.Text + ''',' +
                       '''' + vartostr(edItems.EditValue) + ''',' +
                       '''' + vartostr(edSubtotal.EditValue) + ''',' +
                       '''' + vartostr(edFee.EditValue) + ''',' +
                       '''' + vartostr(edTotalFee.EditValue) + ''',' +
                       '''' + '' + ''')');
     qryExec.ExecSQL;

     gtvTransaksi.DataController.GotoFirst;
     for i := 0 to gtvTransaksi.DataController.RecordCount - 1 do
         begin
              recSelect := gtvTransaksi.DataController.GetFocusedRecordIndex;
              getFee := gtvTransaksi.DataController.GetValue(recSelect, gtvTransaksiAmbil.Index);
              if (getFee = True) then
                  begin
                      qryExec.SQL.Clear;
                      qryExec.SQL.Add('insert into ben_drivers_trans_detail values(' +
                                        '''' + '' + ''',' +
                                        '''' + edTransID.Text + ''',' +
                                        '''' + edDriverID.Text + ''',' +
                                        '''' + vartostr(gtvTransaksi.DataController.GetValue(recSelect, gtvTransaksiIDTransaksi.Index)) + ''',' +
                                        '''' + FormatDateTime('yyyy-MM-dd', Now) + ''',' +
                                        '''' + vartostr(gtvTransaksi.DataController.GetValue(recSelect, gtvTransaksiWaktu.Index)) + ''',' +
                                        '''' + vartostr(gtvTransaksi.DataController.GetValue(recSelect, gtvTransaksiSubtotal.Index)) + ''',' +
                                        '''' + vartostr(gtvTransaksi.DataController.GetValue(recSelect, gtvTransaksiNamaJasa.Index)) + ''',' +
                                        '''' + vartostr(gtvTransaksi.DataController.GetValue(recSelect, gtvTransaksiNamaCustomer.Index)) + ''',' +
                                        '''' + '' + ''')');
                      qryExec.ExecSQL;
                      gtvTransaksi.DataController.GotoNext;
                  end
              else if (getFee = False) then
                  begin
                       gtvTransaksi.DataController.GotoNext;
                  end;

         end;
     Application.CreateForm(TfrmPintDriversTrans, frmPintDriversTrans);
     frmPintDriversTrans.QlblTransID.Caption := edTransID.Text;
     frmPintDriversTrans.QlblDriverID.Caption := edDriverID.Text;
     frmPintDriversTrans.QlblNama.Caption := edNama.Text;
     frmPintDriversTrans.QlblNopol.Caption := edNopol.Text;
     frmPintDriversTrans.QlblSubtotal.Caption := FormatFloat('#,#.#', edTotalFee.EditValue);
     frmPintDriversTrans.QlblItems.Caption := FormatFloat('#,#.#', edItems.EditValue);
     frmPintDriversTrans.QlblTanggal.Caption := FormatDateTime('dd MMMM yyyy hh:mm:ss', Now);
     frmPintDriversTrans.qrpCetak.Preview;

     frmDriverSelectTrans.Close;
end;

procedure TfrmDriverSelectTrans.fpVerifikasiFPVerificationID(ASender: TObject;
  const ID: WideString; FingerNr: Integer);
var
   i, NewRec : Integer;
begin
    Memo1.lines.add('ID = ' + ID + ', FingerNr = ' + inttostr(FingerNr));
     //ShowMessage('Ketemu');
     with dmDB do
          begin
               qryCari.Close;
               qryCari.SQL.Clear;
               qryCari.SQL.Add('select id_drivers, nama, alamat, handphone, nopol_mobil, aktif ' +
                               'from ben_master_drivers where id_drivers = ''' + ID + '''');
               qryCari.Open;
               edDriverID.Text := qryCari.Fields[0].AsString;
               edNama.Text := qryCari.Fields[1].AsString;
               edNopol.Text := qryCari.Fields[4].AsString;
               edDetail.Lines.Add('Alamat :');
               edDetail.Lines.Add(qryCari.Fields[2].AsString);
               edDetail.Lines.Add(' ' + #13);
               edDetail.Lines.Add('Handphone :');
               edDetail.Lines.Add(qryCari.Fields[3].AsString);
               Sleep(100);
               gtvTransaksi.DataController.SelectAll;
               gtvTransaksi.DataController.DeleteSelection;
               qryFind.Close;
               qryFind.SQL.Clear;
               qryFind.SQL.Add('select id_trans, tanggal,trans_type_id, start_time, subtotal, ' +
                               'nama_customer, produk_jasa_nama from ' +
                               'trans_detail where tanggal = CURRENT_DATE and trans_type_id <> ''' + 'BP' + ''' ORDER BY nama_customer ASC');
               qryFind.Open;
               qryFind.First;
               for i := 0 to qryFind.RecordCount - 1 do
                   begin
                        qrySearch.Close;
                        qrySearch.SQL.Clear;
                        qrySearch.SQL.Add('select id_trans from ben_drivers_trans_detail where id_trans = ''' +
                                          qryFind.Fields[0].AsString + '''');
                        qrySearch.Open;
                        if (NOT qrySearch.IsEmpty) then
                            begin
                                 qryFind.Next;
                            end
                        else if (qrySearch.IsEmpty) then
                            begin
                                 NewRec := gtvTransaksi.DataController.InsertRecord(gtvTransaksi.DataController.RecordCount);
                                 gtvTransaksi.DataController.SetValue(NewRec, gtvTransaksiIDTransaksi.Index, qryFind.Fields[0].AsString);
                                 gtvTransaksi.DataController.SetValue(NewRec, gtvTransaksiWaktu.Index, qryFind.Fields[3].AsDateTime);
                                 gtvTransaksi.DataController.SetValue(NewRec, gtvTransaksiSubtotal.Index, qryFind.Fields[4].AsFloat);
                                 gtvTransaksi.DataController.SetValue(NewRec, gtvTransaksiNamaCustomer.Index, qryFind.Fields[5].AsString);
                                 gtvTransaksi.DataController.SetValue(NewRec, gtvTransaksiNamaJasa.Index, qryFind.Fields[6].AsString);
                                 gtvTransaksi.DataController.SetValue(NewRec, gtvTransaksiAmbil.Index, FALSE);
                                 gtvTransaksi.DataController.PostEditingData;
                                 gtvTransaksi.DataController.Post(True);
                                 qryFind.Next;
                            end;


                   end;
          end;
end;

procedure TfrmDriverSelectTrans.fpVerifikasiFPVerificationImage(Sender: TObject);
begin
   Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\FPTemp.BMP');
end;

procedure TfrmDriverSelectTrans.fpVerifikasiFPVerificationStatus(ASender: TObject;
  Status: Integer);
begin
  case Status of
    0  :  begin
            Memo1.lines.add('Not match!');
          end;
    1  :  begin
            Memo1.lines.add('Match!');
          end;
    2   : begin
            Memo1.lines.add('Multiple match!');
          end;
    3  :  begin
            Memo1.lines.add('Verification fail!');
          end;
    7   : begin
            Memo1.lines.add('Please connect the device to USB port!');
            btnStart.Caption := '&Start Verify';
          end;
    8  :  begin
            Memo1.lines.add('Poor image quality!');
          end;
    9   : begin
            Memo1.lines.add('Activation/verification code is incorrect!');
            btnStart.Caption := '&Start Verify';
          end;
    11  : begin
            Memo1.lines.add('&Stop Verify!');
            btnStart.Caption := '&Start Verify';
          end;
    15  : begin
            Memo1.lines.add('Finger touch!');
          end;
    16  : begin
            Memo1.lines.add('Max 2000 templates!');
          end;
    17  : begin
            Memo1.lines.add('Max 10 Devices!');
          end;
    18  : begin
            Memo1.lines.add('Please add some template!');
            btnStart.Caption := '&Start Verify';
          end;
  end;
end;

procedure TfrmDriverSelectTrans.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      fpVerifikasi.FPVerificationStop;
      qrySearch.Free;
      qryFind.Free;
      qryCari.Free;
      qryExec.Free;
      Action := caFree;
end;

procedure TfrmDriverSelectTrans.FormCreate(Sender: TObject);
var
   strSql : String;
begin
     //
     Image1.Canvas.Create;
     fpVerifikasi.PictureSamplePath := ExtractFilePath(Application.ExeName) + '\FPTemp.BMP';
     fpVerifikasi.PictureSampleHeight := 1635;
     fpVerifikasi.PictureSampleWidth := 1335;

   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;

   qryFind := TMyQuery.Create(Self);
   qryFind.Connection := DMDB.dbInternal;
   qryFind.SQL.Add('select * from temptable');
   qryFind.Active := true;

   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from temptable');
   qrySearch.Active := true;

   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;
end;

procedure TfrmDriverSelectTrans.FormShow(Sender: TObject);
var
    strSql : String;
begin
     with dmDB do
          begin
               strSql := 'select serial_number, verification_code, ' +
                         'activation_code from ben_regfp';
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add(strSql);
               qrySearch.Open;
               if (fpVerifikasi.AddDeviceInfo(qrySearch.Fields[0].AsString,qrySearch.Fields[1].AsString,
                   qrySearch.Fields[2].AsString)) then
                   begin
                        ShowMessage('Device Ready, Please Set Drivers !!');
                   end;
          end;
end;

procedure TfrmDriverSelectTrans.gtvTransaksiAmbilPropertiesChange(
  Sender: TObject);
begin
     {if (gtvTransaksiAmbil.EditValue = True) then
         begin
              edSubtotal.EditValue := edSubtotal.EditValue + gtvTransaksiSubtotal.EditValue;
              edTotalFee.EditValue := edSubtotal.EditValue * edFee.EditValue / 100;
         end
     else if (gtvTransaksiAmbil.EditValue = False) then
         begin
              edSubtotal.EditValue := edSubtotal.EditValue - gtvTransaksiSubtotal.EditValue;
              edTotalFee.EditValue := edSubtotal.EditValue * edFee.EditValue / 100;
         end;}
end;

procedure TfrmDriverSelectTrans.gtvTransaksiButtonPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
     if (gtvTransaksiAmbil.EditValue = False) then
         begin
              gtvTransaksiAmbil.EditValue := True;
              edSubtotal.EditValue := edSubtotal.EditValue + gtvTransaksiSubtotal.EditValue;
              edTotalFee.EditValue := edSubtotal.EditValue * edFee.EditValue / 100;
              edItems.EditValue := edItems.EditValue + 1;
         end
     else if (gtvTransaksiAmbil.EditValue = True) then
         begin
              gtvTransaksiAmbil.EditValue := False;
              edSubtotal.EditValue := edSubtotal.EditValue - gtvTransaksiSubtotal.EditValue;
              edTotalFee.EditValue := edSubtotal.EditValue * edFee.EditValue / 100;
              edItems.EditValue := edItems.EditValue - 1;
         end;
end;

procedure TfrmDriverSelectTrans.gtvTransaksiTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
     if (AValue = Null) then
         begin
              edNilaiTrans.EditValue := 0;
         end
     else
         begin
              edNilaiTrans.EditValue := AValue;
         end;
end;

end.
