unit FRepTopRequest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
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
  dxSkinXmas2008Blue, Vcl.Menus, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBAccess, MyAccess, MemDS, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, XSuperJSON, XSuperObject,
  cxCalc, strUtils, dxBarBuiltInMenu, cxPC, cxGridExportLink, ShellApi;

type
  TfrmRepTopRequest = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    Label3: TLabel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    dlgSave: TSaveDialog;
    pgLaporanRequest: TcxPageControl;
    pgDetails: TcxTabSheet;
    pgSummary: TcxTabSheet;
    cxGrid1: TcxGrid;
    gtvList: TcxGridTableView;
    gtvListIDTR: TcxGridColumn;
    gtvListNama: TcxGridColumn;
    gtvListTotal: TcxGridColumn;
    gtvListTanggal: TcxGridColumn;
    gtvListIDTrans: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    gtvSummary: TcxGridTableView;
    gtvSummaryID: TcxGridColumn;
    gtvSummaryNama: TcxGridColumn;
    gtvSummaryTotal: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    qryReq1, qryCari : TMyQuery;
    procedure CariDetail;
    procedure CariSummary;
  public
    { Public declarations }
  end;

var
  frmRepTopRequest: TfrmRepTopRequest;

implementation

{$R *.dfm}

uses FdmDB, FMain;

procedure TfrmRepTopRequest.CariDetail;
var
  newRec, i : Integer;
  jSonItem : XSuperObject.ISuperObject;
  isRequest, idTR : String;
  ketemu : Boolean;
begin

  isRequest := 'N';
  qryCari.Close;
  qryCari.SQL.Clear;
  qryCari.SQL.Add('select trans_id, tanggal, therapist_id, notes from trans_master where tanggal >= ''' +
      FormatDateTime('yyyy-MM-dd', edStart.Date) + ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + ''' ORDER BY tanggal ASC');
  qryCari.Open;
  qryCari.First;

  for i := 0 to qryCari.RecordCount -1 do
    begin
      //ShowMessage(qryCari.Fields[0].AsString);
      //if ((RightStr(qryCari.Fields[3].AsString,1) = '{') OR (LeftStr(qryCari.Fields[3].AsString,1) = '}')) then
        //begin

        //end
      //else if ((RightStr(qryCari.Fields[3].AsString,1) <> '{') OR (LeftStr(qryCari.Fields[3].AsString,1) <> '}')) then
        //begin
          //isRequest := 'N';
        //end;}
      isRequest := 'N';
      jSonItem := XSuperobject.SO(qryCari.Fields[3].AsString);
          if (jSonItem.Contains('byrequest')) then
            begin
               isRequest := jSonItem.S['byrequest'];
            end
          else if (NOT jSonItem.Contains('byrequest')) then
            begin
               isRequest := 'N';
            end;

      if (isRequest = 'Y') then
        begin
          qryReq1.Close;
          qryReq1.SQL.Clear;
          qryReq1.SQL.Add('select namakaryawan from ben_hrd_karyawan_info where idkaryawan = ''' + qryCari.Fields[2].AsString +
              ''' AND active = ''' + 'Y' + '''');
          qryReq1.Open;
          newRec := gtvList.DataController.InsertRecord(gtvList.DataController.RecordCount);
          gtvList.DataController.SetValue(newRec, gtvListIDTR.Index, qryCari.Fields[2].AsString);
          gtvList.DataController.SetValue(newRec, gtvListNama.Index, qryReq1.Fields[0].AsString);
          gtvList.DataController.SetValue(newRec, gtvListTotal.Index, 1);
          gtvList.DataController.SetValue(newRec, gtvListTanggal.Index, qryCari.Fields[1].AsDateTime);
          gtvList.DataController.SetValue(newRec, gtvListIDTrans.Index, qryCari.Fields[0].AsString);
          gtvList.DataController.PostEditingData;
          gtvList.DataController.Post(True);
          Application.ProcessMessages;
        end;
      qryCari.Next;
    end;
end;

procedure TfrmRepTopRequest.CariSummary;
var
  newRec, recSel , i, jumlah, selRec : Integer;
  idTR, namaTR : String;
  ketemu : Boolean;
begin
  gtvSummary.DataController.SelectAll;
  gtvSummary.DataController.DeleteSelection;
  gtvList.DataController.GotoFirst;
  ketemu := false;
  for i := 0 to gtvList.DataController.RecordCount - 1 do
    begin
        recSel := gtvList.DataController.GetFocusedRecordIndex;
        jumlah := 0;
        idTR := gtvList.DataController.GetValue(recSel, gtvListIDTR.Index);
        namaTR := gtvList.DataController.GetValue(recSel, gtvListNama.Index);
        gtvSummary.DataController.GotoFirst;
        ketemu := gtvSummary.DataController.Search.Locate(gtvSummaryID.Index, idTR);
        if (ketemu = False) then
          begin
              newRec := gtvSummary.DataController.InsertRecord(gtvSummary.DataController.RecordCount);
              gtvSummary.DataController.SetValue(newRec, gtvSummaryID.Index, idTR);
              gtvSummary.DataController.SetValue(newRec, gtvSummaryNama.Index, namaTR);
              gtvSummary.DataController.SetValue(newRec, gtvSummaryTotal.Index, 1);
              gtvSummary.DataController.PostEditingData;
              gtvSummary.DataController.Post;
          end
        else if (ketemu = True) then
          begin
             selRec := gtvSummary.DataController.GetFocusedRecordIndex;
             jumlah := gtvSummary.DataController.GetValue(selRec, gtvSummaryTotal.Index) + 1;
             gtvSummary.DataController.SetValue(selRec, gtvSummaryTotal.Index, jumlah);
             gtvSummary.DataController.PostEditingData;
              gtvSummary.DataController.Post;
          end;
        gtvList.DataController.GotoNext;
        Application.ProcessMessages;
    end;

end;

procedure TfrmRepTopRequest.cxButton1Click(Sender: TObject);
begin
    //
    if (pgLaporanRequest.ActivePage = pgDetails) then
      begin
           dlgSave.Title := '[Excel 97-2003] Export to...';
           dlgSave.Filter := 'Microsoft Excel 97-2003 (*.xls)|*.xls';
           dlgSave.FileName := '';
           if (dlgSave.Execute) then
              begin
                   if (dlgSave.FileName <> '') then
                      begin
                           ExportGridToExcel(dlgSave.FileName, cxGrid1, true, true, true, 'xls');
                           if (MessageDlg('Would you like to open exported file now?',
                               mtConfirmation, mbOKCancel, 0) = mrOK) then
                               begin
                                    if (ExtractFileExt(dlgSave.FileName) = '.xls') then
                                       ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                                    else
                                        ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName + '.xls'), pChar(''), pChar(ExtractFileDir(dlgSave.FileName + '.xls')), SW_MAXIMIZE)
                               end
                           else exit;
                      end
                   else exit;
              end
           else exit;
      end
    else if (pgLaporanRequest.ActivePage = pgSummary) then
      begin
          dlgSave.Title := '[Excel 97-2003] Export to...';
           dlgSave.Filter := 'Microsoft Excel 97-2003 (*.xls)|*.xls';
           dlgSave.FileName := '';
           if (dlgSave.Execute) then
              begin
                   if (dlgSave.FileName <> '') then
                      begin
                           ExportGridToExcel(dlgSave.FileName, cxGrid2, true, true, true, 'xls');
                           if (MessageDlg('Would you like to open exported file now?',
                               mtConfirmation, mbOKCancel, 0) = mrOK) then
                               begin
                                    if (ExtractFileExt(dlgSave.FileName) = '.xls') then
                                       ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName), pChar(''), pChar(ExtractFileDir(dlgSave.FileName)), SW_MAXIMIZE)
                                    else
                                        ShellExecute(Self.Handle, 'open', pChar(dlgSave.FileName + '.xls'), pChar(''), pChar(ExtractFileDir(dlgSave.FileName + '.xls')), SW_MAXIMIZE)
                               end
                           else exit;
                      end
                   else exit;
              end
           else exit;
      end;
end;

procedure TfrmRepTopRequest.cxButton2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  pgLaporanRequest.ActivePage := pgDetails;
  CariDetail;
  pgLaporanRequest.ActivePage := pgSummary;
  CariSummary;
  Screen.Cursor := crDefault;
end;

procedure TfrmRepTopRequest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryReq1.Free;
   qryCari.Free;
   Action := caFree;
end;

procedure TfrmRepTopRequest.FormCreate(Sender: TObject);
begin
   qryReq1 := TMyQuery.Create(Self);
   qryReq1.Connection := DMDB.dbInternal;
   qryReq1.SQL.Add('select * from temptable');
   qryReq1.Active := true;

   qryCari := TMyQuery.Create(Self);
   qryCari.Connection := DMDB.dbInternal;
   qryCari.SQL.Add('select * from temptable');
   qryCari.Active := true;
   edStart.Date := Date;
   edEnd.Date := Date;
end;

end.
