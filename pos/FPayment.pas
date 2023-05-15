unit FPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxTextEdit,
  cxNavigator, cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, MyAccess;

type
  TfrmPayment = class(TForm)
    edPaymentID: TcxTextEdit;
    Label1: TLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtvPayment: TcxGridTableView;
    gtvPaymentColumn1: TcxGridColumn;
    gtvPaymentColumn2: TcxGridColumn;
    gtvPaymentColumn3: TcxGridColumn;
    gtvPaymentColumn4: TcxGridColumn;
    gtvPaymentColumn5: TcxGridColumn;
    gtvPaymentColumn6: TcxGridColumn;
    cxNavigator1: TcxNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    qrySearch : TMyQuery;
  public
    { Public declarations }
    TRANS_ID_LAMA : String;
    V_TRANS, V_DATE, V_NUMBER, V_ID : String;
    function CreateNewAutoNum : String;
  end;

var
  frmPayment: TfrmPayment;

implementation

uses FDMDB, FPelunasan, FPos;

{$R *.dfm}
function TfrmPayment.CreateNewAutoNum: string;
var
   lastID, strTmpNum, strNum, NewID : string;
   intTmpNum, intNum : integer;
begin

     NewID := V_TRANS + '.' + V_DATE + '.';

     qrySearch.Close;
     qrySearch.SQL.Clear;
     qrySearch.SQL.Add('SELECT trans_id FROM trans_master ' +
                     'WHERE trans_id LIKE ''' + NewID + '%'' ORDER BY trans_id ASC');
     qrySearch.Open;

     if (qrySearch.IsEmpty) then
        begin
             Result := V_TRANS + '.' + V_DATE + '.' + '00001';
             exit;
        end;

     qrySearch.Last;

     lastID    := qrySearch.Fields[0].AsString;
     strTmpNum := Copy(lastID, length(lastID)-4, 5);
     intTmpNum := strtoint(strTmpNum);
     intNum    := intTmpNum + 1;

     case length(inttostr(intNum)) of
          1 : strNum := '0000' + inttostr(intNum);
          2 : strNum := '000' + inttostr(intNum);
          3 : strNum := '00' + inttostr(intNum);
          4 : strNum := '0' + inttostr(intNum);
          5 : strNum := inttostr(intNum);
     end;

     V_NUMBER := strNum;
     V_ID := V_TRANS + '.' + V_DATE + '.' + V_NUMBER;
     Result := V_ID;

end;

procedure TfrmPayment.FormCreate(Sender: TObject);
begin
     //
end;

end.
