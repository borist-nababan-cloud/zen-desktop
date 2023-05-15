unit FViewReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxPC, cxGridExportLink, ShellApi,
  cxCalc, cxTimeEdit, cxDBLookupComboBox, DateUtils, cxLookAndFeels,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmViewTrans = class(TForm)
    edStart: TcxDateEdit;
    pgControl: TcxPageControl;
    edEnd: TcxDateEdit;
    cxButton1: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    pgPayment: TcxTabSheet;
    cxGrid3: TcxGrid;
    gtbTransPayment: TcxGridDBBandedTableView;
    cxGridLevel1: TcxGridLevel;
    cxButton2: TcxButton;
    dlgSave: TSaveDialog;
    gtbTransPaymentid_payment: TcxGridDBBandedColumn;
    gtbTransPaymenttanggal: TcxGridDBBandedColumn;
    gtbTransPaymentwaktu: TcxGridDBBandedColumn;
    gtbTransPaymentid_member: TcxGridDBBandedColumn;
    gtbTransPaymentnama_member: TcxGridDBBandedColumn;
    gtbTransPaymentsubtotal: TcxGridDBBandedColumn;
    gtbTransPaymentdisc_percent: TcxGridDBBandedColumn;
    gtbTransPaymentdisc_amount: TcxGridDBBandedColumn;
    gtbTransPaymenttotal: TcxGridDBBandedColumn;
    gtbTransPaymentpembayaran: TcxGridDBBandedColumn;
    gtbTransPaymentkembalian: TcxGridDBBandedColumn;
    gtbTransPaymentpoint_awal: TcxGridDBBandedColumn;
    gtbTransPaymenttambah_point: TcxGridDBBandedColumn;
    gtbTransPaymentkurang_point: TcxGridDBBandedColumn;
    gtbTransPaymentsisa: TcxGridDBBandedColumn;
    gtbTransPaymentpayment_via: TcxGridDBBandedColumn;
    gtbTransPaymentpayment_ref: TcxGridDBBandedColumn;
    gtbTransPaymentstaff_id: TcxGridDBBandedColumn;
    gtbTransPaymentnotes: TcxGridDBBandedColumn;
    gtbTransPaymentcabang: TcxGridDBBandedColumn;
    cxButton3: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure gtbTransPaymentid_memberGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewTrans: TfrmViewTrans;

implementation

uses FDMDB, FMain, FPrintTrans;

{$R *.dfm}

procedure TfrmViewTrans.FormCreate(Sender: TObject);
begin
     //with dmDB do
     edStart.Date := Date;
     edEnd.Date := Date;
end;

procedure TfrmViewTrans.cxButton1Click(Sender: TObject);
begin
     with dmDB do
          begin
               TransPayment.Close;
               TransPayment.SQL.Clear;
               if(FormatDateTime('hh:mm:ss', Time) > '03:01:00') then
                 begin
                    TransPayment.SQL.Add('select * from trans_payment where tanggal = ''' +
                                         FormatDateTime('yyyy-MM-dd', Now) + ''' order by waktu ASC');

                  end
               else
                  begin
                     TransPayment.SQL.Add('select * from trans_payment where tanggal = ''' +
                                         FormatDateTime('yyyy-MM-dd', IncDay(Now, -1)) + ''' order by waktu ASC');
                  end;

               TransPayment.Open;
               //gtbTransMaster.DataController.Refresh;
               gtbTransPayment.DataController.Refresh;

          end;
end;

procedure TfrmViewTrans.cxButton2Click(Sender: TObject);
begin
     dlgSave.Title := '[Excel 97-2003] Export to...';
     dlgSave.Filter := 'Microsoft Excel 97-2003 (*.xls)|*.xls';
     dlgSave.FileName := '';
     if (dlgSave.Execute) then
        begin
             if (dlgSave.FileName <> '') then
                begin
                     ExportGridToExcel(dlgSave.FileName, cxGrid3, true, true, true, 'xls');
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

procedure TfrmViewTrans.cxButton3Click(Sender: TObject);
var
   rCount, panjang, tinggiLblSum, recSel : Integer;
   idTrans : String;
begin
      recSel := gtbTransPayment.DataController.GetFocusedRecordIndex;
      idTrans := VarToStr(gtbTransPayment.DataController.GetValue(recSel, gtbTransPaymentid_payment.Index));
      dmdb.PrintMaster.Close;
      dmdb.PrintMaster.SQL.Clear;
      dmdb.PrintMaster.SQL.Add('select * from trans_payment where id_payment = ''' +
                          idTrans + '''');
      dmdb.PrintMaster.Open;

      dmdb.PrintDetail.Close;
      dmdb.PrintDetail.SQL.Clear;
      dmdb.PrintDetail.SQL.Add('select * from trans_detail where payment_id = ''' +
                          idTrans + ''' order by autonum ASC');
      dmdb.PrintDetail.Open;
      dmdb.qryFoot.Close;
      dmdb.qryFoot.SQL.Clear;
      dmdb.qryFoot.SQL.Add('SELECT notes from footnote WHERE aktif = ''' + 'Y' + ''' ORDER BY autonum DESC LIMIT 1');
      dmdb.qryFoot.Open;
     Application.CreateForm(TfrmPrintTrans, frmPrintTrans);

     panjang := 44 * rCount;
     frmPrintTrans.qrpPrintBill.Height := frmPrintTrans.qrpPrintBill.Height + panjang;
     with  frmPrintTrans do
        begin
          lblJudulAtas.Caption := frmMain.JUDULATAS;
          lblJudul.Caption := frmMain.JUDULBAWAH;
          lblAlamat.Caption := frmMain.ALAMATOUTLET;
          lblSumJudul.Lines.Add('Subtotal');
          lblSumValue.Lines.Add(FormatFloat('#,#', dmdb.PrintMaster.Fields[5].AsFloat));
          if (dmdb.PrintMaster.Fields[6].AsFloat > 0) then
            begin
              lblSumJudul.Lines.Add('Disc [%]');
              lblSumValue.Lines.Add(FormatFloat('#,#', dmdb.PrintMaster.Fields[6].AsFloat));
            end;
          if (dmdb.PrintMaster.Fields[7].AsFloat > 0) then
            begin
              lblSumJudul.Lines.Add('Disc Amount');
              lblSumValue.Lines.Add(FormatFloat('#,#', dmdb.PrintMaster.Fields[7].AsFloat));
            end;
          if ((dmdb.PrintMaster.Fields[6].AsFloat > 0) OR (dmdb.PrintMaster.Fields[7].AsFloat > 0)) then
            begin
              lblSumJudul.Lines.Add('Total');
              lblSumValue.Lines.Add(FormatFloat('#,#', dmdb.PrintMaster.Fields[8].AsFloat));
            end;

          lblSumJudul.Lines.Add('Payment Via');
          lblSumValue.Lines.Add(dmdb.PrintMaster.Fields[15].AsString);
          if (dmdb.PrintMaster.Fields[15].AsString = 'CASH') then
            begin
              lblSumJudul.Lines.Add('Pembulatan');
              lblSumValue.Lines.Add(dmdb.PrintMaster.Fields[18].AsString);
              lblSumJudul.Lines.Add('Jumlah Uang');
              lblSumValue.Lines.Add(FormatFloat('#,#', dmdb.PrintMaster.Fields[9].AsFloat));
              lblSumJudul.Lines.Add('Kembali');
              lblSumValue.Lines.Add(FormatFloat('#,#', dmdb.PrintMaster.Fields[10].AsFloat));
            end;
          if (dmdb.PrintMaster.Fields[16].AsString <> '') then
            begin
              lblSumJudul.Lines.Add('Payment Ref : ' + dmdb.PrintMaster.Fields[16].AsString);
              lblSumValue.Lines.Add('-');
            end;
          if (dmdb.PrintMaster.Fields[3].AsString <> '') then
            begin
              lblSumJudul.Lines.Add('Jumlah Point Anda');
              lblSumValue.Lines.Add(FormatFloat('#,#', dmdb.PrintMaster.Fields[14].AsFloat));
            end;
          lblNotes.Lines.Add(dmdb.qryFoot.Fields[0].AsString);
          rCount := lblSumJudul.Lines.Count;
          tinggiLblSum := 23 * rCount;
          lblSumJudul.Height := tinggiLblSum;
          lblSumValue.Height := tinggiLblSum;
          panjang := 32 * rCount;
          SummaryBand1.Height := panjang;


        end;
     frmPrintTrans.qrpPrintBill.Height := frmPrintTrans.qrpPrintBill.Height + panjang;
     frmPrintTrans.qrpPrintBill.Prepare;
     frmPrintTrans.qrpPrintBill.Preview;
end;

procedure TfrmViewTrans.gtbTransPaymentid_memberGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     //
     //lblCustomer.Caption := Copy(edIDCustomerPayment.Text,1,7);
     //AText := Copy(AText, 1, 7);
     //AText := Copy(AText,1,7);
end;

end.
