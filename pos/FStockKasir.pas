unit FStockKasir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxControls, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, cxTextEdit,
  cxCalc, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxGroupBox, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TfrmStockKasir = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    gtbStockKasir: TcxGridDBBandedTableView;
    gtbStockKasirid_barang: TcxGridDBBandedColumn;
    gtbStockKasirnama_barang: TcxGridDBBandedColumn;
    gtbStockKasirproduk_id: TcxGridDBBandedColumn;
    gtbStockKasirjenis_barang_id: TcxGridDBBandedColumn;
    gtbStockKasirsatuan_id: TcxGridDBBandedColumn;
    gtbStockKasirharga_beli: TcxGridDBBandedColumn;
    gtbStockKasirharga_jual: TcxGridDBBandedColumn;
    gtbStockKasirqty: TcxGridDBBandedColumn;
    gtbStockKasirnotes: TcxGridDBBandedColumn;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    btnTambah: TcxButton;
    btnReset: TcxButton;
    Label2: TLabel;
    Label3: TLabel;
    edProduk: TcxLookupComboBox;
    edIDBarang: TcxTextEdit;
    edNamaBrg: TcxTextEdit;
    edJenisBrg: TcxLookupComboBox;
    Label4: TLabel;
    Label6: TLabel;
    edHarga: TcxCalcEdit;
    edQty: TcxCalcEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure edIDBarangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStockKasir: TfrmStockKasir;

implementation

uses FDMDB;

{$R *.dfm}

procedure TfrmStockKasir.FormCreate(Sender: TObject);
begin
     //with dmDB do
end;

procedure TfrmStockKasir.btnResetClick(Sender: TObject);
begin
     edIDBarang.Clear;
     edJenisBrg.Clear;
     edProduk.Clear;
     edHarga.Clear;
     edQty.Clear;
     edNamaBrg.Clear;
end;

procedure TfrmStockKasir.btnTambahClick(Sender: TObject);
var
  ada: boolean;
  satuan : string;
  tot_qty,harga_beli,qty : double;
begin
     if (edIDBarang.Text = '') then
         begin
              ShowMessage('Maaf ID Barang masih kosong');
              Exit;
         end;
     if (edProduk.Text = '') then
         begin
              ShowMessage('Maaf Produk masih kosong');
              Exit;
         end;
     if (edNamaBrg.Text = '') then
         begin
              ShowMessage('Maaf Nama Barang masih kosong');
              Exit;
         end;
     if (edHarga.EditValue = 0) then
         begin
              ShowMessage('Maaf Harga Barang masih kosong');
              Exit;
         end;


     with dmDB do
       begin
           ada := gtbStockKasir.DataController.Search.Locate(gtbStockKasirid_barang.Index, edIDBarang.Text);
           if (ada = true) then
             begin
                 qrySearch.Close;
                 qrySearch.SQL.Clear;
                 qrySearch.SQL.Add('Select * from stock_gdg ' +
                                   'where id_barang = ''' + edIDBarang.Text + '''');
                 qrySearch.Open;
                 if(qrySearch.IsEmpty) then
                   begin
                       qryFind.Close;
                       qryFind.SQL.Clear;
                       qryFind.SQL.Add('Select * from stock_kasir ' +
                                       'where id_barang = ''' + edIDBarang.Text + '''');
                       qryFind.Open;
                       satuan := qryFind.Fields[4].AsString ;
                       harga_beli := qryFind.Fields[5].AsFloat;
                       qty := qryFind.Fields[7].AsFloat;
                   end
                 else
                   begin
                       satuan := qrySearch.Fields[4].AsString ;
                       harga_beli := qrySearch.Fields[5].AsFloat;
                       qty := qrySearch.Fields[7].AsFloat;
                   end;
                 tot_qty := qty  + edQty.EditValue ;
                 qryUpdate.Sql.Clear;
                 qryUpdate.Sql.Add('Update stock_kasir set ' +
                                   'nama_barang = ''' + edNamaBrg.Text + ''' , ' +
                                   'produk_id = ''' + VarToStr(edProduk.EditValue)+ ''' , ' +
                                   'jenis_barang_id = ''' + VarToStr(edJenisBrg.Text) + ''' , ' +
                                   'satuan_id = ''' + satuan + ''' , ' +
                                   'harga_beli = ''' + FloatToStr(harga_beli) + ''' , ' +
                                   'harga_jual = ''' + VarToStr(edHarga.Text) +''' , ' +
                                   'qty = ''' + FloatToStr(tot_qty) + ''' ' +
                                   'where id_barang = ''' + edIDBarang.Text + '''');
                 qryUpdate.ExecSql;
                 gtbStockKasir.DataController.Refresh;
                 gtbStockKasir.DataController.Search.Locate(gtbStockKasirid_barang.Index, edIDBarang.Text);
                 edIDBarang.Clear;
                 edProduk.Clear;
                 edNamaBrg.Clear;
                 edHarga.Clear;
                 edJenisBrg.Clear;
                 edQty.Clear;
             end
           else
             begin
                qryUpdate.Sql.Clear;
                qryUpdate.Sql.Add('Insert into stock_kasir values ( ' +
                                  '''' + edIDBarang.Text + ''' , ' +
                                  '''' + edNamaBrg.Text + ''' , ' +
                                  '''' + VarToStr(edProduk.EditValue) + ''' , ' +
                                  '''' + VarToStr(edJenisBrg.EditValue) + ''' , ' +
                                  '''' + 'NONE' + ''' , ' +
                                  '''' + '0' + ''' , ' +
                                  '''' + VarToStr(edHarga.EditValue) + ''' , ' +
                                  '''' + VarToStr(edQty.EditValue) + ''' , ' +
                                  '''' + 'NONE' + ''')');
                qryUpdate.ExecSql;
                dmDB.tblStockKasir.Refresh;
                gtbStockKasir.DataController.Refresh;
                gtbStockKasir.DataController.Search.Locate(gtbStockKasirid_barang.Index, edIDBarang.Text);
                edIDBarang.Clear;
                edProduk.Clear;
                edNamaBrg.Clear;
                edHarga.Clear;
                edJenisBrg.Clear;
                edQty.Clear;
             end;
           dmDB.tblStockKasir.Refresh;
       end;

end;

procedure TfrmStockKasir.edIDBarangPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
     edJenisBrg.Clear;
     edProduk.Clear;
     edHarga.Clear;
     edQty.Clear;
     edNamaBrg.Clear;
      with dmDB do
        begin
             qryCari.Close;
             qryCari.SQL.Clear;
             qryCari.SQL.Add('Select * from stock_gdg ' +
                             'Where id_barang = ''' + edIDBarang.Text + '''' );
             qryCari.Open;
             if (Not qryCari.IsEmpty) then
                begin
                    gtbStockKasir.DataController.Refresh;
                    gtbStockKasir.DataController.Search.Locate(gtbStockKasirid_barang.Index, edIDBarang.Text);
                    edNamaBrg.Text := qryCari.Fields[1].AsString;
                    edProduk.EditValue := qryCari.Fields[2].AsString;
                    edJenisBrg.EditValue := qryCari.Fields[3].AsString;
                    edHarga.EditValue := qryCari.Fields[6].AsFloat;
                end
             else
                begin
                     qrySearch.Close;
                     qrySearch.SQL.Clear;
                     qrySearch.SQL.Add('Select * from stock_kasir ' +
                                       'Where id_barang = ''' + edIDBarang.Text + '''' );
                     qrySearch.Open;
                     if(Not qrySearch.IsEmpty) then
                        begin
                             gtbStockKasir.DataController.Refresh;
                             gtbStockKasir.DataController.Search.Locate(gtbStockKasirid_barang.Index, edIDBarang.Text);
                             edNamaBrg.Text := qrySearch.Fields[1].AsString;
                             edProduk.EditValue := qrySearch.Fields[2].AsString;
                             edJenisBrg.EditValue := qrySearch.Fields[3].AsString;
                             edHarga.EditValue := qrySearch.Fields[6].AsFloat;
                        end
                     else
                       begin
                           //
                       end;
                end;

        end;
end;

procedure TfrmStockKasir.FormShow(Sender: TObject);
begin
    edIDBarang.SetFocus;
end;

end.
