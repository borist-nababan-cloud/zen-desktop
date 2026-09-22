unit FGroupAccessAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCalc, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, cxTextEdit, Menus,
  StdCtrls, cxButtons, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  cxCheckBox;

type
  TfrmGroupAccessAdd = class(TForm)
    cxGrid2: TcxGrid;
    gtvAvailable: TcxGridTableView;
    gtvAvailableAutonum: TcxGridColumn;
    gtvAvailableUnitName: TcxGridColumn;
    gtvAvailableGroup: TcxGridColumn;
    gtvAvailableNotes: TcxGridColumn;
    cxGrid2Level1: TcxGridLevel;
    cxButton2: TcxButton;
    gtvAvailableAdd: TcxGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroupAccessAdd: TfrmGroupAccessAdd;

implementation

uses FGroupManagement;
{$R *.dfm}


procedure TfrmGroupAccessAdd.cxButton2Click(Sender: TObject);
var
  recSelect, autonum, i : Integer;
  tambah : Boolean;
begin
     gtvAvailable.DataController.GotoFirst;
     for i := 0 to gtvAvailable.DataController.RecordCount -1 do
       begin
         tambah := False;
         recSelect := gtvAvailable.DataController.GetFocusedRecordIndex;
         tambah := gtvAvailable.DataController.GetValue(recSelect, gtvAvailableAdd.Index);
         //Memo1.Lines.Add(VarToStr(gtvAvailable.DataController.GetValue(recSelect, gtvAvailableUnitName.Index)) + '#' + tambah.ToString);
         if (tambah = True) then
           begin
             autonum := gtvAvailable.DataController.GetValue(recSelect, gtvAvailableAutonum.Index);
             frmGroupManagement.InsertAccess(autonum);
           end;
         gtvAvailable.DataController.GotoNext;
         Application.ProcessMessages;
       end;
     frmGroupAccessAdd.Close;
end;

procedure TfrmGroupAccessAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

end.
