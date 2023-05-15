unit FPrintSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, Data.DB, DBAccess,
  XSuperJSON, XSuperObject, MyAccess, MemDS;

type
  TfrmPintSO = class(TForm)
    qrpSO: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    lblNumberID: TQRLabel;
    Date: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    lblDbNamaMenu: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qryPrintSO: TMyQuery;
    dsQryPrintSO: TMyDataSource;
    PrintDetail: TMyQuery;
    dsPrintDetail: TMyDataSource;
    lblByRequest: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure qrpSOAfterPrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPintSO: TfrmPintSO;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmPintSO.FormCreate(Sender: TObject);
begin
     with dmDB do
end;

procedure TfrmPintSO.QRDBText2Print(sender: TObject; var Value: String);
begin
     Value := FormatDateTime('dd MMMM yyyy', StrToDate(Value));
end;

procedure TfrmPintSO.qrpSOAfterPrint(Sender: TObject);
begin
     //frmPintSO.Close;
end;

procedure TfrmPintSO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //Action := caFree;
end;

end.
