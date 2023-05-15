unit FCariTransaksiKas;

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
  cxDataStorage, cxEdit, DB, cxDBData, Menus, cxTextEdit, cxCalendar, cxCalc,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, StdCtrls,
  cxButtons, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmCariTransaksiKas = class(TForm)
    cxGrid1: TcxGrid;
    gtbCariTransaksiKas: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    btnPilih: TcxButton;
    gtbCariTransaksiKasNoBukti: TcxGridDBColumn;
    gtbCariTransaksiKasTgl: TcxGridDBColumn;
    gtbCariTransaksiKasTotal: TcxGridDBColumn;
    gtbCariTransaksiKasStatus: TcxGridDBColumn;
    gtbCariTransaksiKasUser: TcxGridDBColumn;
    pmCari: TPopupMenu;
    Expand1: TMenuItem;
    Collapse1: TMenuItem;
    gtbCariTransaksiKasNotes: TcxGridDBColumn;
    procedure btnPilihClick(Sender: TObject);
    procedure Expand1Click(Sender: TObject);
    procedure Collapse1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCariTransaksiKas: TfrmCariTransaksiKas;

implementation

uses FdmDB, FTransaksiKas;

{$R *.dfm}

procedure TfrmCariTransaksiKas.btnPilihClick(Sender: TObject);
var
    i, newRec, recSelect: integer;
    id_bukti: string;
begin
      recSelect := gtbCariTransaksiKas.DataController.GetFocusedRecordIndex;
      id_bukti  := gtbCariTransaksiKas.DataController.GetValue(recSelect, gtbCariTransaksiKasNoBukti.Index);

      with dmDB do
          begin
                qrySearch.Close;
                qrySearch.SQL.Clear;
                qrySearch.SQL.Add('SELECT * FROM kas_kecil_mstr ' +
                                  'WHERE id_transaksi = ''' + id_bukti + '''');
                qrySearch.Open;

                if ((qrySearch.Fields[5].AsString <> '') AND (qrySearch.Fields[6].AsString <> '')) then
                    begin
                        frmTransaksiKas.edCOA.Enabled := False;
                        frmTransaksiKas.edKeterangan.Enabled  := False;
                        frmTransaksiKas.edJumlah.Enabled  := False;

                        frmTransaksiKas.btnTambah.Enabled := False;
                        frmTransaksiKas.btnClear.Enabled  := False;
                    end
                else
                    begin
                        frmTransaksiKas.edCOA.Enabled := True;
                        frmTransaksiKas.edKeterangan.Enabled  := True;
                        frmTransaksiKas.edJumlah.Enabled  := True;

                        frmTransaksiKas.btnTambah.Enabled := True;
                        frmTransaksiKas.btnClear.Enabled  := True;
                    end;

                with frmTransaksiKas do
                    begin
                          edNoBuktiKas.EditValue      := qrySearch.Fields[0].AsString;
                          edTglKas.Date               := qrySearch.Fields[1].AsDateTime;
                          edStatus.EditValue          := qrySearch.Fields[3].AsString;

                          // detail
                          qryFind.Close;
                          qryFind.SQL.Clear;
                          qryFind.SQL.Add('SELECT * FROM kas_kecil_detail ' +
                                          'WHERE id_transaksi = ''' + qrySearch.Fields[0].AsString + '''');
                          qryFind.Open;

                          qryFind.First;

                          for i := 0 to qryFind.RecordCount - 1 do
                              begin
                                    newRec := gtvKas.DataController.InsertRecord(gtvKas.DataController.RecordCount);
                                    gtvKas.DataController.SetValue(newRec, gtvKasNoKas.Index, qryFind.Fields[3].AsString);
                                    gtvKas.DataController.SetValue(newRec, gtvKasCOA.Index, qryFind.Fields[4].AsString);
                                    gtvKas.DataController.SetValue(newRec, gtvKasKeterangan.Index, qryFind.Fields[5].AsString);
                                    gtvKas.DataController.SetValue(newRec, gtvKasJumlah.Index, qryFind.Fields[6].AsFloat);

                                    gtvKas.DataController.PostEditingData;
                                    gtvKas.DataController.Post;

                                    qryFind.Next;
                              end;
                    end;
          end;
      frmCariTransaksiKas.Close;
end;

procedure TfrmCariTransaksiKas.Collapse1Click(Sender: TObject);
begin
    gtbCariTransaksiKas.ViewData.Collapse(True);
end;

procedure TfrmCariTransaksiKas.Expand1Click(Sender: TObject);
begin
    gtbCariTransaksiKas.ViewData.Expand(True);
end;

end.
