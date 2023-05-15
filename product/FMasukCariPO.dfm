object frmMasukCariPO: TfrmMasukCariPO
  Left = 0
  Top = 0
  ClientHeight = 574
  ClientWidth = 948
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    948
    574)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 2
    Width = 266
    Height = 19
    Caption = '  UN-FINISH PURCHASE ORDER  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 64
    Width = 929
    Height = 237
    TabOrder = 0
    object gtbPO: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = gtbPOCellClick
      OnFocusedRecordChanged = gtbPOFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbPOid_transaksi: TcxGridDBColumn
        Caption = 'NO PO'
        DataBinding.FieldName = 'id_transaksi'
        Width = 100
      end
      object gtbPOtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 100
      end
      object gtbPOwaktu: TcxGridDBColumn
        DataBinding.FieldName = 'waktu'
        Visible = False
        Width = 100
      end
      object gtbPOtgl_tempo: TcxGridDBColumn
        Caption = 'Tgl Tempo'
        DataBinding.FieldName = 'tgl_tempo'
        Width = 100
      end
      object gtbPOid_supp: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'id_supp'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_supp'
        Properties.ListColumns = <
          item
            FieldName = 'nama_supp'
          end>
        Width = 100
      end
      object gtbPOgrandtotal: TcxGridDBColumn
        Caption = 'Grandtotal'
        DataBinding.FieldName = 'grandtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbPOprepared_by: TcxGridDBColumn
        Caption = 'Dibuat'
        DataBinding.FieldName = 'prepared_by'
        Width = 100
      end
      object gtbPOmengetahui: TcxGridDBColumn
        Caption = 'Mengetahui'
        DataBinding.FieldName = 'mengetahui'
        Width = 100
      end
      object gtbPOnotes: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'notes'
        Width = 200
      end
      object gtbPOis_finish: TcxGridDBColumn
        DataBinding.FieldName = 'is_finish'
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbPO
    end
  end
  object cxGrid2: TcxGrid
    Left = 8
    Top = 316
    Width = 929
    Height = 229
    TabOrder = 1
    object gtbDetail: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.Indicator = True
      object gtbDetailid_transaksi: TcxGridDBColumn
        Caption = 'No PO'
        DataBinding.FieldName = 'id_transaksi'
        Width = 100
      end
      object gtbDetailid_produk: TcxGridDBColumn
        Caption = 'ID Peoduk'
        DataBinding.FieldName = 'id_produk'
        Width = 100
      end
      object gtbDetailnama_produk: TcxGridDBColumn
        Caption = 'Nama Produk'
        DataBinding.FieldName = 'nama_produk'
        Width = 228
      end
      object gtbDetailharga_beli: TcxGridDBColumn
        Caption = 'Harga Beli'
        DataBinding.FieldName = 'harga_beli'
        Visible = False
        Width = 100
      end
      object gtbDetailqty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.##'
        Width = 100
      end
      object gtbDetailSisa: TcxGridDBColumn
        Caption = 'Sisa Qty'
        DataBinding.FieldName = 'sisa_qty'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.##'
        Width = 100
      end
      object gtbDetailnama_satuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'nama_satuan'
        Width = 100
      end
      object gtbDetailtotal: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        Visible = False
        Width = 100
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = gtbDetail
    end
  end
  object btnSelectPO: TButton
    Left = 824
    Top = 8
    Width = 113
    Height = 45
    Anchors = [akTop, akRight]
    Caption = 'SELECT PO'
    TabOrder = 2
    OnClick = btnSelectPOClick
  end
  object btnSelectBeli: TButton
    Left = 816
    Top = 8
    Width = 113
    Height = 45
    Anchors = [akTop, akRight]
    Caption = 'SELECT PO'
    TabOrder = 3
    OnClick = btnSelectBeliClick
  end
end
