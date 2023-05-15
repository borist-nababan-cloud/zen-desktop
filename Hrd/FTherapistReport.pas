unit FTherapistReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyAccess, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
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
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridLevel, cxGrid, cxGroupBox, cxTextEdit,
  dxRatingControl, cxMaskEdit, cxDropDownEdit, Vcl.Menus, cxButtons, cxMemo,
  cxRadioGroup;

type
  TfrmTherapistReport = class(TForm)
    lblJudulAtas: TLabel;
    cxGroupBox1: TcxGroupBox;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvDetails: TcxGridTableView;
    gtvDetailsCode: TcxGridColumn;
    gtvDetailsGroup: TcxGridColumn;
    gtvDetailsName: TcxGridColumn;
    gtvDetailsrRating: TcxGridColumn;
    gtvDetailsHeader: TcxGridColumn;
    Label13: TLabel;
    edQuickSearch: TcxTextEdit;
    Label1: TLabel;
    edKode: TEdit;
    Label2: TLabel;
    edID: TEdit;
    Label3: TLabel;
    edNama: TEdit;
    edPeriode: TcxComboBox;
    Label4: TLabel;
    btnSearch: TcxButton;
    gbSpecs: TcxRadioGroup;
    edCatatan: TcxMemo;
    btnSave: TcxButton;
    cxButton2: TcxButton;
    Button1: TButton;
    edRate: TdxRatingControl;
    Label5: TLabel;
    edGroup: TEdit;
    Label6: TLabel;
    edSlot: TEdit;
    lblNilai: TLabel;
    btnUnlock: TcxButton;
    procedure edQuickSearchKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure gtvDetailsTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    qrySearch, qryCari, qryExec : TMyQuery;
    procedure SimpanStatus;
    procedure SimpanDetails;
  public
    { Public declarations }
    procedure LoadVariable;
    procedure LoadValues;
  end;

var
  frmTherapistReport: TfrmTherapistReport;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterKaryawan;

procedure TfrmTherapistReport.btnSearchClick(Sender: TObject);
begin
  if (not frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.FormStyle := fsNormal;
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 21;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.Height := 590;
      frmMasterKaryawan.Width := 990;
      frmMasterKaryawan.Position := poDesktopCenter;
    end
  else if (frmMain.IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.FormStyle := fsNormal;
      frmMasterKaryawan.btnSelect.Visible := True;
      frmMasterKaryawan.btnSelect.Tag := 21;
      frmMasterKaryawan.btnNew.Visible := False;
      frmMasterKaryawan.btnEdit.Visible := False;
      frmMasterKaryawan.btnKontrak.Visible := False;
      //frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Show;
      frmMasterKaryawan.Height := 590;
      frmMasterKaryawan.Width := 990;
      frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmTherapistReport.Button1Click(Sender: TObject);
var
   recSel : Integer;
   strRating : String;
begin
  recSel := gtvDetails.DataController.GetFocusedRecordIndex;
  strRating := VarToStr(gtvDetails.DataController.GetValue(recSel, gtvDetailsrRating.Index));
  ShowMessage(strRating);
end;

procedure TfrmTherapistReport.btnSaveClick(Sender: TObject);
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select autonum from ben_report_master where kodereport = ''' +
       edPeriode.Text + ''' AND idkaryawan = ''' + edID.Text + '''');
   qrySearch.Open;
   //ShowMessage(IntToStr(qrySearch.RecordCount));
   if (qrySearch.IsEmpty) then
     begin
        qryExec.SQL.Clear;
        qryExec.SQL.Add('insert into ben_report_master value(' +
            '''' + '' + ''',' +
            '''' + edPeriode.Text + ''',' +
            '''' + edKode.Text + ''',' +
            '''' + edID.Text + ''',' +
            '''' + lblNilai.Caption + ''',' +
            '''' + VarToStr(gbSpecs.EditValue) + ''',' +
            QuotedStr(edCatatan.Text) + ',' +
            '''' + 'N' + ''',' +
            QuotedStr(frmMain.USERAPPS) + ',' +
            QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ');');
        qryExec.ExecSQL;
     end
   else if (NOT qrySearch.IsEmpty) then
     begin
       qryExec.SQL.Clear;
        qryExec.SQL.Add('update ben_report_master set ' +
            'kodekaryawan = ''' + edKode.Text + ''',' +
            'nilai = ''' + lblNilai.Caption + ''',' +
            'status = ''' + VarToStr(gbSpecs.EditValue) + ''',' +
            'catatan = ' + QuotedStr(edCatatan.Text) + ',' +
            'isclosed = ''' + 'N' + ''',' +
            'lastedituser = '+ QuotedStr(frmMain.USERAPPS) + ',' +
            'lasteditdate = ' + QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ' ' +
            'where idkaryawan = ''' + edID.Text + ''' ' +
            'and kodereport = ''' + edPeriode.Text + '''');
        qryExec.ExecSQL;
     end;
   SimpanStatus;
   SimpanDetails;
   ShowMessage('Saving Data Finish');
end;

procedure TfrmTherapistReport.edQuickSearchKeyPress(Sender: TObject;
  var Key: Char);
var
   strSearch, idDivisi : String;
begin
   if (key = #13) then
        begin
          if (edPeriode.Text = '') then
            begin
              ShowMessage('Please Select Periode First !!');
              Exit;
            end;
          case Length(edQuickSearch.Text) of
           1 : strSearch := '0000' + edQuickSearch.Text;
           2 : strSearch := '000' + edQuickSearch.Text;
           3 : strSearch := '00' + edQuickSearch.Text;
           4 : strSearch := '0' + edQuickSearch.Text;
           5 : strSearch := edQuickSearch.Text;
          end;
         qrySearch.Close;
         qrySearch.SQL.Clear;
         qrySearch.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen ' +
           'from ben_hrd_karyawan_info where idkaryawan = ' + QuotedStr(strSearch) +
           ' and active = ''' + 'Y' + '''');
         qrySearch.Open;
         if (qrySearch.IsEmpty) then
           begin
             ShowMessage('ID Finger Tidak Ditemukan !');
             Exit;
           end;
         idDivisi := qrySearch.Fields[3].AsString;
         if ((idDivisi <> 'TR') AND (idDivisi <> 'TB')) then
           begin
             ShowMessage('Mohon Pilih Departemen Therapist Saja !');
             Exit;
           end;
         edKode.Text := qrySearch.Fields[0].AsString;
         edID.Text := qrySearch.Fields[1].AsString;
         edNama.Text := qrySearch.Fields[2].AsString;
         //ed := qryChange1.Fields[3].AsString;
         LoadVariable;
         LoadValues;
         edQuickSearch.Clear;
     end;
end;

procedure TfrmTherapistReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qrySearch.Free;
  qryCari.Free;
  qryExec.Free;
  Action := caFree;
end;

procedure TfrmTherapistReport.FormCreate(Sender: TObject);
var
  i: Integer;
begin
   qryExec := TMyQuery.Create(Self);
   qryExec.Connection := DMDB.dbInternal;
   qryExec.SQL.Add('select * from temptable');
   qryExec.Active := true;

   qrySearch := TMyQuery.Create(Self);
   qrySearch.Connection := DMDB.dbInternal;
   qrySearch.SQL.Add('select * from temptable');
   qrySearch.Active := true;

   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;

   qryCari.Close;
   qryCari.SQL.Clear;
   qryCari.SQL.Add('select kodereport from ben_report_periode order by kodereport DESC');
   qryCari.Open;
   qryCari.First;
   for i := 0 to qryCari.RecordCount-1 do
     begin
       edPeriode.Properties.Items.Add(qryCari.Fields[0].AsString);
       qryCari.Next;
     end;
end;

procedure TfrmTherapistReport.gtvDetailsTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
var
  cntList : Integer;
  nilaiAkhir : Double;
begin
  if (AValue = null) then lblNilai.Caption := '1'
  else if (AValue <> null) then
     begin
        cntList := gtvDetails.DataController.RecordCount;
        nilaiAkhir := AValue / cntList;
        edRate.EditValue := nilaiAkhir;
        lblNilai.Caption := FormatFloat('#,#.0', nilaiAkhir);
     end;

end;

procedure TfrmTherapistReport.LoadValues;
var
   recSel, i, nRating : Integer;
   kodevar : String;
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select nilai, status, catatan, isclosed from ben_report_master where kodereport = ''' +
            edPeriode.Text + ''' AND idkaryawan = ''' + edID.Text + '''');
   qrySearch.Open;
   if (NOT qrySearch.IsEmpty) then
     begin
        lblNilai.Caption := FormatFloat('#,#.0', qrySearch.Fields[0].AsFloat);
        edRate.EditValue := qrySearch.Fields[0].AsFloat;
        edCatatan.Text := qrySearch.Fields[2].AsString;
        if (qrySearch.Fields[1].AsString = 'M') then
          begin
             gbSpecs.ItemIndex := 0;
          end
        else if (qrySearch.Fields[1].AsString = 'S') then
          begin
             gbSpecs.ItemIndex := 1;
          end;

     end;

   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select * from ben_tr_status where idkaryawan = ''' + edID.Text + '''');
   qrySearch.Open;
   if (NOT qrySearch.IsEmpty) then
     begin
       edGroup.Text := qrySearch.Fields[2].AsString;
       edSlot.Text := qrySearch.Fields[3].AsString;
     end;

   gtvDetails.DataController.PostEditingData;
   gtvDetails.DataController.Post(True);
   gtvDetails.DataController.GotoFirst;
   for i := 0 to gtvDetails.DataController.RecordCount -1 do
      begin
        recSel := gtvDetails.DataController.GetFocusedRecordIndex;
        kodevar := VarToStr(gtvDetails.DataController.GetValue(recSel, gtvDetailsCode.Index));
        //nRating := gtvDetails.DataController.GetValue(recSel, gtvDetailsrRating.Index);
        qryCari.Close;
        qryCari.SQL.Clear;
        qryCari.SQL.Add('select nilai from ben_report_detail where kodereport = ''' +
            edPeriode.Text + ''' AND idkaryawan = ''' + edID.Text + ''' AND kodevariable = ''' +
            kodevar + '''');
        qryCari.Open;
        if (qryCari.IsEmpty) then
          begin
            nRating := 1;
          end
        else if (NOT qryCari.IsEmpty) then
          begin
            nRating := qryCari.Fields[0].AsInteger;
          end;;
        gtvDetails.DataController.SetValue(recSel, gtvDetailsrRating.Index, nRating);
        gtvDetails.DataController.PostEditingData;
        gtvDetails.DataController.Post(True);
        gtvDetails.DataController.GotoNext;
      end;

end;

procedure TfrmTherapistReport.LoadVariable;
var
  i, newRec : Integer;
begin
   edCatatan.Clear;
   edSlot.Clear;
   edGroup.Clear;
   gbSpecs.ItemIndex := 0;
   gtvDetails.DataController.SelectAll;
   gtvDetails.DataController.DeleteSelection;
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select kodevariable, groupvariable, namavariable, aktif from ' +
       'ben_report_variable where aktif = ''' + 'Y' + ''' ORDER BY kodevariable ASC');
   qrySearch.Open;
   qrySearch.First;
   for i := 0 to qrySearch.RecordCount -1 do
     begin
       newRec := gtvDetails.DataController.InsertRecord(gtvDetails.DataController.RecordCount);
       gtvDetails.DataController.SetValue(newRec, gtvDetailsCode.Index, qrySearch.Fields[0].AsString);
       gtvDetails.DataController.SetValue(newRec, gtvDetailsGroup.Index, qrySearch.Fields[1].AsString);
       gtvDetails.DataController.SetValue(newRec, gtvDetailsHeader.Index, qrySearch.Fields[1].AsString);
       gtvDetails.DataController.SetValue(newRec, gtvDetailsName.Index, qrySearch.Fields[2].AsString);
       //gtvDetails.DataController.SetValue(newRec, gtvDetailsrRating.Index, 1);
       gtvDetails.DataController.PostEditingData;
       gtvDetails.DataController.Post(True);
       qrySearch.Next;
     end;
end;

procedure TfrmTherapistReport.SimpanDetails;
var
  i, recSel, nRating : Integer;
  kodevar : String;
begin
   gtvDetails.DataController.PostEditingData;
   gtvDetails.DataController.Post(True);
   gtvDetails.DataController.GotoFirst;
   for i := 0 to gtvDetails.DataController.RecordCount -1 do
      begin
        recSel := gtvDetails.DataController.GetFocusedRecordIndex;
        kodevar := VarToStr(gtvDetails.DataController.GetValue(recSel, gtvDetailsCode.Index));
        nRating := gtvDetails.DataController.GetValue(recSel, gtvDetailsrRating.Index);
        qryCari.Close;
        qryCari.SQL.Clear;
        qryCari.SQL.Add('select autonum from ben_report_detail where kodereport = ''' +
            edPeriode.Text + ''' AND idkaryawan = ''' + edID.Text + ''' AND kodevariable = ''' +
            kodevar + '''');
        qryCari.Open;
        if (qryCari.IsEmpty) then
          begin
             qryExec.SQL.Clear;
             qryExec.SQL.Add('insert into ben_report_detail values(' +
                 '''' + '' + ''',' +
                 '''' + edPeriode.Text + ''',' +
                 '''' + edKode.Text + ''',' +
                 '''' + edID.Text + ''',' +
                 '''' + kodevar + ''',' +
                 '''' + IntToStr(nRating) + ''',' +
                 QuotedStr(frmMain.USERAPPS) + ',' +
                 QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ');');
             qryExec.ExecSQL;
          end
        else if (NOT qryCari.IsEmpty) then
          begin
             qryExec.SQL.Clear;
             qryExec.SQL.Add('update ben_report_detail set ' +
                 'nilai = ''' + IntToStr(nRating) + ''',' +
                 'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
                 'lasteditdate = ' + QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ' ' +
                 'where kodereport = ''' +
            edPeriode.Text + ''' AND idkaryawan = ''' + edID.Text + ''' AND kodevariable = ''' +
            kodevar + '''');
             qryExec.ExecSQL;
          end;
        gtvDetails.DataController.GotoNext;
      end;

end;

procedure TfrmTherapistReport.SimpanStatus;
begin
   qrySearch.Close;
   qrySearch.SQL.Clear;
   qrySearch.SQL.Add('select autonum from ben_tr_status where idkaryawan = ''' + edID.Text + '''');
   qrySearch.Open;
   if (qrySearch.IsEmpty) then
     begin
        qryExec.SQL.Clear;
        qryExec.SQL.Add('insert into ben_tr_status value(' +
            '''' + '' + ''',' +
            '''' + edID.Text + ''',' +
            '''' + edGroup.Text + ''',' +
            '''' + edSlot.Text + ''',' +
            '''' + VarToStr(gbSpecs.EditValue) + ''',' +
            QuotedStr(frmMain.USERAPPS) + ',' +
            QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ');');
        qryExec.ExecSQL;
     end
   else if (NOT qrySearch.IsEmpty) then
     begin
       qryExec.SQL.Clear;
        qryExec.SQL.Add('update ben_tr_status set ' +
            'ngroup = ''' + edGroup.Text + ''',' +
            'noslot = ''' + edSlot.Text + ''',' +
            'status = ''' + VarToStr(gbSpecs.EditValue) + ''',' +
            'lastedituser = ' + QuotedStr(frmMain.USERAPPS) + ',' +
            'lasteditdate = ' + QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss', Now)) + ' ' +
            'where idkaryawan = ''' + edID.Text + '''');
        qryExec.ExecSQL;
     end;
end;

end.
