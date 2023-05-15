unit FPayGC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxCalendar, cxCalc, cxCheckBox,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxGroupBox, cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, cxNavigator;

type
  TfrmPayGC = class(TForm)
    gtbPayGC: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbPayGCautonum: TcxGridDBColumn;
    gtbPayGCpaket_number: TcxGridDBColumn;
    gtbPayGCgc_number: TcxGridDBColumn;
    gtbPayGCtanggal: TcxGridDBColumn;
    gtbPayGCexpired_date: TcxGridDBColumn;
    gtbPayGCjasa_master_id: TcxGridDBColumn;
    gtbPayGCjenis_jasa_id: TcxGridDBColumn;
    gtbPayGCnama_menu: TcxGridDBColumn;
    gtbPayGCharga_jual: TcxGridDBColumn;
    gtbPayGCharga_jasa: TcxGridDBColumn;
    gtbPayGCaktif: TcxGridDBColumn;
    gtbPayGCterjual: TcxGridDBColumn;
    gtbPayGCpakai: TcxGridDBColumn;
    gtbPayGCnotes: TcxGridDBColumn;
    btnSelect: TcxButton;
    Label1: TLabel;
    cxGroupBox1: TcxGroupBox;
    edGCFind: TcxTextEdit;
    btnFind: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPayGC: TfrmPayGC;

implementation

uses FDMDB, FPelunasan;

{$R *.dfm}

procedure TfrmPayGC.FormCreate(Sender: TObject);
begin
     {with dmDB do
          begin
               qryGCDetail.Refresh;
               gtbPayGC.DataController.Refresh;
          end; }
end;

procedure TfrmPayGC.btnSelectClick(Sender: TObject);
var
   i, rec_select : Integer;
   id_gc, jenisJasa : String;

begin
     {rec_select := gtbPayGC.DataController.GetFocusedRecordIndex;
     id_gc := gtbPayGC.DataController.GetValue(rec_select, gtbPayGCgc_number.Index);
     frmPelunasan.edReferansi.Text := id_gc;
     with frmPelunasan do
          begin
               gtvPayment.DataController.GotoFirst;
               for i:=0 to gtvPayment.DataController.RecordCount-1 do
                   begin
                        rec_select := gtvPayment.DataController.GetFocusedRecordIndex;
                        jenisJasa := vartostr(gtvPayment.DataController.GetValue(rec_select, gtvPaymentTransType.Index));
                        if (jenisJasa = 'BJ') then
                            begin
                                 gtvPayment.DataController.SetValue(rec_select, gtvPaymentPoint.Index, 0);
                                 gtvPayment.DataController.SetValue(rec_select, gtvPaymentSubtotal.Index, 0);
                                 gtvPayment.DataController.PostEditingData;
                                 gtvPayment.DataController.Post;
                            end;

                        gtvPayment.DataController.GotoNext;
                   end;

          end;
     Close; }
end;

procedure TfrmPayGC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmPayGC.btnFindClick(Sender: TObject);
var
   ada : Boolean;
begin
     {ada := gtbPayGC.DataController.Search.Locate(gtbPayGCgc_number.Index, edGCFind.Text);
     if (ada = True) then
         begin
              ShowMessage('Gift Certificate masih dapat digunakan');
         end
     else if (ada = False) then
         begin
              with dmDB do
                   begin
                        qryCari.Close;
                        qryCari.SQL.Clear;
                        qryCari.SQL.Add('select * from gc_detail where gc_number = ''' +
                                        edGCFind.Text + '''');
                        qryCari.Open;

                        if (qryCari.IsEmpty) then
                            begin
                                 ShowMessage('GC Tidak Terdaftar !!! Mohon Ceck Kembali No. GC');
                            end
                        else if (NOT qryCari.IsEmpty) then
                            begin
                                 ShowMessage('GC dengan No. #' + edGCFind.Text + #13 +
                                             'Kadaluarsa pada tanggal ' +  FormatDateTime('dd MMMM yyyy', qryCari.Fields[3].AsDateTime));
                                 
                            end;
                   end;
         end;
     frmPayGC.Close;}
end;

end.
