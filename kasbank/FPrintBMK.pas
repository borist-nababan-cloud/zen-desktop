unit FPrintBMK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmPrintBMK = class(TForm)
    qrpPrintBMK: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRSysData1: TQRSysData;
    qlblTag: TQRLabel;
    procedure QRDBText2Print(sender: TObject; var Value: string);
    procedure QRDBText3Print(sender: TObject; var Value: string);
    procedure QRDBText5Print(sender: TObject; var Value: string);
    procedure qrpPrintBMKEndPage(Sender: TCustomQuickRep);
    procedure qrpPrintBMKStartPage(Sender: TCustomQuickRep);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintBMK: TfrmPrintBMK;

implementation

uses FdmDB;

{$R *.dfm}

procedure TfrmPrintBMK.QRDBText2Print(sender: TObject; var Value: string);
begin
      Value := FormatDateTime('dd/mm/yyyy', StrToDate(Value));
end;

procedure TfrmPrintBMK.QRDBText3Print(sender: TObject; var Value: string);
begin
      Value := FormatFloat('#,0.#0', StrToFloat(Value));
end;

procedure TfrmPrintBMK.QRDBText5Print(sender: TObject; var Value: string);
begin
      Value := FormatFloat('#,0.#0', StrToFloat(Value));
end;

procedure TfrmPrintBMK.qrpPrintBMKEndPage(Sender: TCustomQuickRep);
begin
    QRDBText3.Font.Color  := clWindowText;
end;

procedure TfrmPrintBMK.qrpPrintBMKStartPage(Sender: TCustomQuickRep);
begin
      if (qrpPrintBMK.RecordCount <= 3) then
          begin
              QRDBText3.Font.Color  := clWindowText;
          end;
end;

end.
