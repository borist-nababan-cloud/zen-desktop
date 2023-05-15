object frmStockKasir: TfrmStockKasir
  Left = 271
  Top = 112
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'STOCK KASIR'
  ClientHeight = 552
  ClientWidth = 854
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    854
    552)
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 854
    Height = 389
    TabOrder = 0
    object gtbStockKasir: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmDB.dsTblStockKasir
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 Items'
          Kind = skCount
          Column = gtbStockKasirid_barang
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbStockKasirqty
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'STOCK KASIR'
          Width = 637
        end>
      object gtbStockKasirid_barang: TcxGridDBBandedColumn
        Caption = 'ID Barang'
        DataBinding.FieldName = 'id_barang'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 200
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtbStockKasirnama_barang: TcxGridDBBandedColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'nama_barang'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtbStockKasirproduk_id: TcxGridDBBandedColumn
        DataBinding.FieldName = 'produk_id'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtbStockKasirjenis_barang_id: TcxGridDBBandedColumn
        DataBinding.FieldName = 'jenis_barang_id'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtbStockKasirsatuan_id: TcxGridDBBandedColumn
        DataBinding.FieldName = 'satuan_id'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtbStockKasirharga_beli: TcxGridDBBandedColumn
        DataBinding.FieldName = 'harga_beli'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtbStockKasirharga_jual: TcxGridDBBandedColumn
        DataBinding.FieldName = 'harga_jual'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 102
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtbStockKasirqty: TcxGridDBBandedColumn
        DataBinding.FieldName = 'qty'
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtbStockKasirnotes: TcxGridDBBandedColumn
        DataBinding.FieldName = 'notes'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbStockKasir
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 4
    Top = 388
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'TAMBAH STOCK KASIR'
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Transparent = True
    Height = 161
    Width = 849
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 54
      Height = 15
      Caption = 'ID Barang'
      Transparent = True
    end
    object Label2: TLabel
      Left = 7
      Top = 50
      Width = 74
      Height = 15
      Caption = 'Nama Barang'
      Transparent = True
    end
    object Label3: TLabel
      Left = 8
      Top = 80
      Width = 69
      Height = 15
      Caption = 'Jenis Produk'
      Transparent = True
    end
    object Label4: TLabel
      Left = 312
      Top = 20
      Width = 69
      Height = 15
      Caption = 'Jenis Barang'
      Transparent = True
    end
    object Label6: TLabel
      Left = 312
      Top = 52
      Width = 58
      Height = 15
      Caption = 'Harga Jual'
      Transparent = True
    end
    object Label5: TLabel
      Left = 312
      Top = 79
      Width = 21
      Height = 15
      Caption = 'QTY'
      Transparent = True
    end
    object btnTambah: TcxButton
      Left = 277
      Top = 108
      Width = 75
      Height = 37
      Caption = 'Tambah'
      TabOrder = 0
      OnClick = btnTambahClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
    end
    object btnReset: TcxButton
      Left = 361
      Top = 108
      Width = 75
      Height = 37
      Caption = 'RESET'
      TabOrder = 1
      OnClick = btnResetClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
    end
    object edProduk: TcxLookupComboBox
      Left = 90
      Top = 78
      Properties.KeyFieldNames = 'id_produk'
      Properties.ListColumns = <
        item
          FieldName = 'nama_produk'
        end>
      Properties.ListSource = dmDB.dstblProduk
      TabOrder = 2
      Width = 199
    end
    object edIDBarang: TcxTextEdit
      Left = 92
      Top = 20
      Properties.CharCase = ecUpperCase
      Properties.ValidateOnEnter = True
      Properties.OnValidate = edIDBarangPropertiesValidate
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 201
    end
    object edNamaBrg: TcxTextEdit
      Left = 92
      Top = 48
      Properties.CharCase = ecUpperCase
      TabOrder = 4
      Width = 200
    end
    object edJenisBrg: TcxLookupComboBox
      Left = 395
      Top = 18
      Properties.KeyFieldNames = 'id_jenis_barang'
      Properties.ListColumns = <
        item
          FieldName = 'nama_jenis'
        end>
      Properties.ListSource = dmDB.dstblJenis
      TabOrder = 5
      Width = 199
    end
    object edHarga: TcxCalcEdit
      Left = 395
      Top = 48
      EditValue = 0
      Properties.DisplayFormat = '#,#'
      TabOrder = 6
      Width = 200
    end
    object edQty: TcxCalcEdit
      Left = 395
      Top = 76
      EditValue = 0
      Properties.DisplayFormat = '#,#'
      TabOrder = 7
      Width = 200
    end
  end
end
