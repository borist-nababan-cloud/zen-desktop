object frmProduk: TfrmProduk
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'MASTER PRODUK'
  ClientHeight = 562
  ClientWidth = 900
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    900
    562)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 0
    Width = 245
    Height = 19
    Caption = '  MASTER PRODUK BARANG   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 28
    Width = 146
    Height = 15
    Caption = 'Quick Search Nama Produk'
  end
  object Label3: TLabel
    Left = 16
    Top = 55
    Width = 116
    Height = 15
    Caption = 'Quick Search Barcode'
  end
  object edNamaCari: TcxTextEdit
    Left = 171
    Top = 25
    OnFocusChanged = edNamaCariFocusChanged
    Properties.OnChange = cxTextEdit1PropertiesChange
    TabOrder = 0
    Width = 288
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 108
    Width = 884
    Height = 437
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object gtbProduk: TcxGridDBTableView
      PopupMenu = pmOption
      OnDblClick = gtbProdukDblClick
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryProduct
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Kind = skCount
          Column = gtbProdukid_produk
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsView.Footer = True
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      object gtbProdukautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbProdukid_produk: TcxGridDBColumn
        Caption = 'ID Produk'
        DataBinding.FieldName = 'id_produk'
        Width = 100
      end
      object gtbProdukbarcode: TcxGridDBColumn
        Caption = 'Barcode'
        DataBinding.FieldName = 'barcode'
        Width = 100
      end
      object gtbProduknama_produk: TcxGridDBColumn
        Caption = 'Nama Produk'
        DataBinding.FieldName = 'nama_produk'
        Width = 100
      end
      object gtbProdukid_jenis: TcxGridDBColumn
        Caption = 'Jenis'
        DataBinding.FieldName = 'id_jenis'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_jenis'
        Properties.ListColumns = <
          item
            FieldName = 'nama_jenis'
          end>
        Width = 100
      end
      object gtbProdukid_satuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'id_satuan'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_satuan'
        Properties.ListColumns = <
          item
            FieldName = 'nama_satuan'
          end>
        Width = 100
      end
      object gtbProdukmin_stok: TcxGridDBColumn
        DataBinding.FieldName = 'min_stok'
        Visible = False
        Width = 100
      end
      object gtbProdukmax_stok: TcxGridDBColumn
        DataBinding.FieldName = 'max_stok'
        Visible = False
        Width = 100
      end
      object gtbProdukid_supp: TcxGridDBColumn
        Caption = 'Supplier Utama'
        DataBinding.FieldName = 'id_supp'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_supp'
        Properties.ListColumns = <
          item
            FieldName = 'nama_supp'
          end>
        Width = 100
      end
      object gtbProdukh_list: TcxGridDBColumn
        Caption = 'Price List'
        DataBinding.FieldName = 'h_list'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbProdukhj_nett: TcxGridDBColumn
        Caption = 'Harga Jual'
        DataBinding.FieldName = 'hj_nett'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbProdukhd_nett: TcxGridDBColumn
        Caption = 'Harga Distribusi'
        DataBinding.FieldName = 'hd_nett'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbProdukhb_nett: TcxGridDBColumn
        Caption = 'Harga Beli Nett'
        DataBinding.FieldName = 'hb_nett'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbProdukkonsinyasi: TcxGridDBColumn
        Caption = 'Konsinyasi'
        DataBinding.FieldName = 'konsinyasi'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 100
      end
      object gtbProdukis_jasa: TcxGridDBColumn
        Caption = 'Jasa'
        DataBinding.FieldName = 'is_jasa'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 100
      end
      object gtbProdukis_blok: TcxGridDBColumn
        Caption = 'Blok'
        DataBinding.FieldName = 'is_blok'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbProduk
    end
  end
  object edLimit: TcxCalcEdit
    Left = 171
    Top = 79
    EditValue = 100.000000000000000000
    TabOrder = 2
    OnKeyPress = edLimitKeyPress
    Width = 82
  end
  object ckLimit: TcxCheckBox
    Left = 8
    Top = 79
    Caption = 'Set Limit'
    Properties.OnChange = ckLimitPropertiesChange
    State = cbsChecked
    TabOrder = 3
  end
  object edCariBarcode: TcxTextEdit
    Left = 171
    Top = 52
    OnFocusChanged = edCariBarcodeFocusChanged
    Properties.OnChange = edCariBarcodePropertiesChange
    TabOrder = 4
    Width = 288
  end
  object btnNewProduk: TButton
    Left = 465
    Top = 19
    Width = 104
    Height = 34
    Caption = 'Baru'
    TabOrder = 5
    OnClick = btnNewProdukClick
  end
  object Button1: TButton
    Left = 465
    Top = 54
    Width = 104
    Height = 34
    Caption = 'Details [F1]'
    TabOrder = 6
    OnClick = Button1Click
  end
  object cxButton1: TcxButton
    Left = 575
    Top = 19
    Width = 94
    Height = 69
    Caption = 'OPTION '#61674
    DropDownMenu = pmMenu
    Kind = cxbkDropDown
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    TabOrder = 7
  end
  object pmOption: TPopupMenu
    Left = 800
    Top = 20
    object LIHATDETAIL1: TMenuItem
      Caption = 'LIHAT DETAIL'
      ShortCut = 112
      OnClick = LIHATDETAIL1Click
    end
    object EXPAND1: TMenuItem
      Caption = 'EXPAND'
      OnClick = EXPAND1Click
    end
    object COLLAPSE1: TMenuItem
      Caption = 'COLLAPSE'
      OnClick = COLLAPSE1Click
    end
    object ProdukBaru1: TMenuItem
      Caption = 'Produk Baru'
      ShortCut = 114
      Visible = False
    end
  end
  object pmMenu: TPopupMenu
    Left = 756
    Top = 16
    object Expand2: TMenuItem
      Caption = 'Expand'
      OnClick = Expand2Click
    end
    object Collapse2: TMenuItem
      Caption = 'Collapse'
      OnClick = Collapse2Click
    end
    object ExportExcel1: TMenuItem
      Caption = 'Export Excel'
      OnClick = ExportExcel1Click
    end
    object Cetak1: TMenuItem
      Caption = 'Cetak'
      OnClick = Cetak1Click
    end
  end
  object dlgSave: TSaveDialog
    Left = 692
    Top = 12
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = PrintGrid
    Version = 0
    Left = 744
    Top = 64
    object PrintGrid: TdxGridReportLink
      Active = True
      Component = cxGrid1
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 256
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageHeader.CenterTitle.Strings = (
        'LIST BARANG'
        'CEMERLANG JAYA')
      PrinterPage.PageSize.X = 8300
      PrinterPage.PageSize.Y = 11700
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 43544.736783182870000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsExpanding.ExpandGroupRows = True
      OptionsExpanding.ExpandMasterRows = True
      OptionsSize.AutoWidth = True
      BuiltInReportLink = True
    end
  end
  object qryProduct: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'SELECT autonum, id_produk, barcode, nama_produk, id_jenis, id_su' +
        'pp,'
      'id_merek, id_satuan, id_warna, id_ukuran,hj_nett, hb_nett,'
      'min_stok, max_stok, is_tax, tambah_point, price_edit,'
      'konsinyasi, formula, is_jasa, is_blok from tbl_produk'
      'ORDER BY autonum DESC LIMIT 100')
    Active = True
    Left = 412
    Top = 88
  end
  object dsQryProduct: TDataSource
    DataSet = qryProduct
    Left = 508
    Top = 92
  end
end
