unit FTransKasKecilCari;

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
  cxButtons, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, DBAccess,
  cxContainer, cxMaskEdit, cxDropDownEdit, cxDBLookupComboBox, DateUtils,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, Vcl.ComCtrls, dxCore, cxDateUtils, MemDS,
  MyAccess;

type
  TfrmTransKasKecilCari = class(TForm)
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
    qryTransMaster: TMyQuery;
    dsQryTransMaster: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edStart: TcxDateEdit;
    edEnd: TcxDateEdit;
    btnFind: TButton;
    gtbCariTransaksiKaskodekas: TcxGridDBColumn;
    gtbCariTransaksiKasidoutlet: TcxGridDBColumn;
    gtbCariTransaksiKasno_reff_trans: TcxGridDBColumn;
    gtbCariTransaksiKaslastuseredit: TcxGridDBColumn;
    gtbCariTransaksiKaslasteditdate: TcxGridDBColumn;
    procedure btnPilihClick(Sender: TObject);
    procedure Expand1Click(Sender: TObject);
    procedure Collapse1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
    qryCari1, qryCari2, qryCari3 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmTransKasKecilCari: TfrmTransKasKecilCari;

implementation

uses FdmDB, FTransKasKecil, FMenuMain;

{$R *.dfm}

procedure TfrmTransKasKecilCari.btnFindClick(Sender: TObject);
begin
 Screen.Cursor := crHourGlass;
 qryTransMaster.Close;
 qryTransMaster.SQL.Clear;
 qryTransMaster.SQL.Add('select * from ben_trans_kas_master where idoutlet = ''' +
        frmMenuMain.IDOUTLET + ''' AND tanggal >= ''' + FormatDateTime('yyyy-MM-dd', edStart.Date) +
        ''' AND tanggal <= ''' + FormatDateTime('yyyy-MM-dd', edEnd.Date) + '''');
 qryTransMaster.Open;
 gtbCariTransaksiKas.DataController.Refresh;
 Screen.Cursor := crDefault;
end;

procedure TfrmTransKasKecilCari.btnPilihClick(Sender: TObject);
var
    i, newRec, recSelect: integer;
    id_bukti: string;
begin
      Screen.Cursor := crHourGlass;
      recSelect := gtbCariTransaksiKas.DataController.GetFocusedRecordIndex;
      id_bukti  := gtbCariTransaksiKas.DataController.GetValue(recSelect, gtbCariTransaksiKasNoBukti.Index);
      qryCari1.Close;
      qryCari1.SQL.Clear;
      qryCari1.SQL.Add('SELECT id_transaksi, kodekas, tanggal, status ' +
                       'FROM ben_trans_kas_master ' +
                        'WHERE id_transaksi = ''' + id_bukti + '''');
      qryCari1.Open;
      frmTransKasKecil.clearFrom;
      frmTransKasKecil.edNoBuktiKas.Text := qryCari1.Fields[0].AsString;
      frmTransKasKecil.edTglKas.Date := qryCari1.Fields[2].AsDateTime;
      frmTransKasKecil.edTypeKas.EditValue := qryCari1.Fields[1].AsString;
      frmTransKasKecil.edTypeKas.Properties.ReadOnly := True;
      if (qryCari1.Fields[3].AsString = 'M') then frmTransKasKecil.edStatus.Text := 'MASUK'
      else if (qryCari1.Fields[3].AsString = 'K') then frmTransKasKecil.edStatus.Text := 'KELUAR'
      else frmTransKasKecil.edStatus.Text := 'KELUAR';

      qryCari2.Close;
      qryCari2.SQL.Clear;
      qryCari2.SQL.Add('select id_transaksi, no_kas, id_coa, keterangan, subtotal ' +
             'from ben_trans_kas_detail where id_transaksi = ''' + qryCari1.Fields[0].AsString +
             ''' ORDER BY autonum ASC');
      qryCari2.Open;
      qryCari2.First;
      for i := 0 to qryCari2.RecordCount - 1 do
        begin
          with frmTransKasKecil do
            begin
              newRec := gtvKas.DataController.InsertRecord(gtvKas.DataController.RecordCount);
              gtvKas.DataController.SetValue(newRec, gtvKasNoKas.Index, qryCari2.Fields[1].AsString);
              gtvKas.DataController.SetValue(newRec, gtvKasCOA.Index, qryCari2.Fields[2].AsString);
              gtvKas.DataController.SetValue(newRec, gtvKasKeterangan.Index, qryCari2.Fields[3].AsString);
              gtvKas.DataController.SetValue(newRec, gtvKasJumlah.Index, qryCari2.Fields[4].AsFloat);
              gtvKas.DataController.PostEditingData;
              gtvKas.DataController.Post;
              qryCari2.Next;
              Application.ProcessMessages;
            end;
        end;
      Screen.Cursor := crDefault;
      frmTransKasKecilCari.Close;
      {with dmDB do
          begin
                qryCari1.Close;
                qryCari1.SQL.Clear;
                qryCari1.SQL.Add('SELECT * FROM ben_trans_kas_master ' +
                                  'WHERE id_transaksi = ''' + id_bukti + '''');
                qryCari1.Open;

                if ((qryCari1.Fields[5].AsString <> '') AND (qryCari1.Fields[6].AsString <> '')) then
                    begin
                        frmTransKasKecil.edCOA.Enabled := False;
                        frmTransKasKecil.edKeterangan.Enabled  := False;
                        frmTransKasKecil.edJumlah.Enabled  := False;

                        frmTransKasKecil.btnTambah.Enabled := False;
                        frmTransKasKecil.btnClear.Enabled  := False;
                    end
                else
                    begin
                        frmTransKasKecil.edCOA.Enabled := True;
                        frmTransKasKecil.edKeterangan.Enabled  := True;
                        frmTransKasKecil.edJumlah.Enabled  := True;

                        frmTransKasKecil.btnTambah.Enabled := True;
                        frmTransKasKecil.btnClear.Enabled  := True;
                    end;

                with frmTransKasKecil do
                    begin
                          edNoBuktiKas.EditValue      := qryCari1.Fields[0].AsString;
                          edTglKas.Date               := qryCari1.Fields[1].AsDateTime;
                          edStatus.EditValue          := qryCari1.Fields[3].AsString;

                          // detail
                          qryCari2.Close;
                          qryCari2.SQL.Clear;
                          qryCari2.SQL.Add('SELECT * FROM kas_kecil_detail ' +
                                          'WHERE id_transaksi = ''' + qryCari1.Fields[0].AsString + '''');
                          qryCari2.Open;

                          qryCari2.First;

                          for i := 0 to qryCari2.RecordCount - 1 do
                              begin
                                    newRec := gtvKas.DataController.InsertRecord(gtvKas.DataController.RecordCount);
                                    gtvKas.DataController.SetValue(newRec, gtvKasNoKas.Index, qryCari2.Fields[3].AsString);
                                    gtvKas.DataController.SetValue(newRec, gtvKasCOA.Index, qryCari2.Fields[4].AsString);
                                    gtvKas.DataController.SetValue(newRec, gtvKasKeterangan.Index, qryCari2.Fields[5].AsString);
                                    gtvKas.DataController.SetValue(newRec, gtvKasJumlah.Index, qryCari2.Fields[6].AsFloat);

                                    gtvKas.DataController.PostEditingData;
                                    gtvKas.DataController.Post;

                                    qryCari2.Next;
                              end;
                    end;
          end; }

end;

procedure TfrmTransKasKecilCari.Collapse1Click(Sender: TObject);
begin
    gtbCariTransaksiKas.ViewData.Collapse(True);
end;

procedure TfrmTransKasKecilCari.Expand1Click(Sender: TObject);
begin
    gtbCariTransaksiKas.ViewData.Expand(True);
end;

procedure TfrmTransKasKecilCari.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryCari1.Free;
   qryCari2.Free;
   qryCari3.Free;
   qryTransMaster.Active := False;
   Action := caFree;
end;

procedure TfrmTransKasKecilCari.FormCreate(Sender: TObject);
begin
   qryTransMaster.Active := True;
   qryCari1 := TMyQuery.Create(Self);
   qryCari1.Connection := DMDB.StoreDB;
   qryCari1.SQL.Add('select * from temptable');
   qryCari1.Active := true;

   qryCari2 := TMyQuery.Create(Self);
   qryCari2.Connection := DMDB.StoreDB;
   qryCari2.SQL.Add('select * from temptable');
   qryCari2.Active := true;

   qryCari3 := TMyQuery.Create(Self);
   qryCari3.Connection := DMDB.StoreDB;
   qryCari3.SQL.Add('select * from temptable');
   qryCari3.Active := true;

   qryTransMaster.Close;
   qryTransMaster.SQL.Clear;
   qryTransMaster.SQL.Add('select * from ben_trans_kas_master where idoutlet = ''' +
        frmMenuMain.IDOUTLET + ''' AND tanggal = CURRENT_DATE');
   qryTransMaster.Open;
   gtbCariTransaksiKas.DataController.Refresh;
   edStart.Date := Date;
   edEnd.Date := Date;


end;

end.
