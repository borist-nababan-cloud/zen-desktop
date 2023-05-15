unit FPKBCetakDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, Data.DB,
  DBAccess, MyAccess, MemDS;

type
  TfrmPKBCetakDetails = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    MyQuery1: TMyQuery;
    MyDataSource1: TMyDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPKBCetakDetails: TfrmPKBCetakDetails;

implementation

{$R *.dfm}

uses FdmDB, FMain, FMasterPKB;

end.
