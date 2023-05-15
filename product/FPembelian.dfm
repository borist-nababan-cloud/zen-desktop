object frmPembelian: TfrmPembelian
  Left = 0
  Top = 0
  ClientHeight = 543
  ClientWidth = 955
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PopupMenu = pmShort
  OnCreate = FormCreate
  DesignSize = (
    955
    543)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 201
    Height = 19
    Caption = '  VALIDASI PEMBELIAN  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 71
    Height = 13
    Caption = 'ID Transaksi'
  end
  object Label3: TLabel
    Left = 8
    Top = 55
    Width = 45
    Height = 13
    Caption = 'Tanggal'
  end
  object Label4: TLabel
    Left = 600
    Top = 11
    Width = 46
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Supplier'
    ExplicitLeft = 614
  end
  object Label5: TLabel
    Left = 600
    Top = 39
    Width = 39
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Tempo'
    ExplicitLeft = 614
  end
  object Label6: TLabel
    Left = 600
    Top = 66
    Width = 45
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Tanggal'
    ExplicitLeft = 614
  end
  object Label7: TLabel
    Left = 8
    Top = 366
    Width = 48
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Subtotal'
  end
  object Label8: TLabel
    Left = 8
    Top = 409
    Width = 41
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Disc Rp'
  end
  object Label9: TLabel
    Left = 8
    Top = 432
    Width = 29
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Total'
  end
  object Label10: TLabel
    Left = 8
    Top = 503
    Width = 61
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Grandtotal'
  end
  object Label11: TLabel
    Left = 578
    Top = 380
    Width = 65
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Dibuat Oleh'
  end
  object Label12: TLabel
    Left = 578
    Top = 407
    Width = 67
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Mengetahui'
    ExplicitLeft = 580
  end
  object Label13: TLabel
    Left = 578
    Top = 434
    Width = 66
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Keterangan'
  end
  object Label14: TLabel
    Left = 8
    Top = 478
    Width = 63
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Biaya Kirim'
  end
  object Label15: TLabel
    Left = 8
    Top = 387
    Width = 39
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Disc %'
  end
  object Label16: TLabel
    Left = 8
    Top = 82
    Width = 37
    Height = 13
    Caption = 'Ref PO'
  end
  object Label17: TLabel
    Left = 8
    Top = 107
    Width = 62
    Height = 13
    Caption = 'No. Invoice'
  end
  object edTransID: TcxTextEdit
    Left = 85
    Top = 29
    Enabled = False
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 250
  end
  object edTanggal: TcxDateEdit
    Left = 85
    Top = 52
    EditValue = 0d
    TabOrder = 1
    Width = 250
  end
  object btnNewTrans: TcxButton
    Left = 341
    Top = 29
    Width = 129
    Height = 46
    Caption = 'New'
    LookAndFeel.Kind = lfOffice11
    PopupMenu = pmShort
    TabOrder = 2
    OnClick = btnNewTransClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 143
    Width = 931
    Height = 214
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object gtvPurchase: TcxGridTableView
      PopupMenu = pmShort
      Navigator.Buttons.CustomButtons = <>
      OnEditing = gtvPurchaseEditing
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#.##'
          Kind = skSum
        end
        item
          Kind = skSum
          Column = gtvPurchaseQty
          DisplayText = '#,#'
        end
        item
          Kind = skCount
          Column = gtvPurchaseIDProduk
          DisplayText = '0 Items'
        end
        item
          Format = '#,#.##'
          Kind = skSum
          OnGetText = gtvPurchaseTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText
          Column = gtvPurchaseSubtotal
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsSelection.InvertSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtvPurchaseIDProduk: TcxGridColumn
        Caption = 'ID Produk'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Styles.Content = cxStyle1
        Width = 125
      end
      object gtvPurchaseNamaProduk: TcxGridColumn
        Caption = 'Nama Produk'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object gtvPurchaseQty: TcxGridColumn
        Caption = 'Qty Masuk'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
      object gtvPurchaseSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
      object gtvPurchaseNett: TcxGridColumn
        Caption = 'Harga Invoice'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.##'
        Width = 125
      end
      object gtvPurchaseSubtotal: TcxGridColumn
        Caption = 'Subtotal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.##'
        Properties.ReadOnly = True
        Width = 125
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvPurchase
    end
  end
  object btnAddItems: TcxButton
    Left = 798
    Top = 90
    Width = 129
    Height = 46
    Anchors = [akTop, akRight]
    Caption = 'ADD PRODUK [F1]'
    LookAndFeel.Kind = lfOffice11
    PopupMenu = pmShort
    TabOrder = 4
    Visible = False
    OnClick = btnAddItemsClick
  end
  object edSupp: TcxLookupComboBox
    Left = 694
    Top = 9
    Anchors = [akTop, akRight]
    PopupMenu = pmShort
    Properties.KeyFieldNames = 'id_supp'
    Properties.ListColumns = <
      item
        FieldName = 'nama_supp'
      end>
    TabOrder = 5
    OnKeyPress = edSuppKeyPress
    Width = 233
  end
  object edTglTempo: TcxDateEdit
    Left = 694
    Top = 63
    Anchors = [akTop, akRight]
    EditValue = 0d
    PopupMenu = pmShort
    TabOrder = 6
    Width = 233
  end
  object ckKonsinyasi: TcxCheckBox
    Left = 600
    Top = 90
    Anchors = [akTop, akRight]
    Caption = 'Konsinyasi'
    Properties.ValueChecked = 'Y'
    Properties.ValueGrayed = 'N'
    Properties.ValueUnchecked = 'N'
    TabOrder = 7
    Visible = False
  end
  object edSubt: TcxCalcEdit
    Left = 104
    Top = 363
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.##'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clBlack
    TabOrder = 8
    Width = 250
  end
  object edDisc: TcxCalcEdit
    Left = 104
    Top = 406
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#.##'
    Properties.UseThousandSeparator = True
    TabOrder = 9
    OnKeyPress = edDiscKeyPress
    Width = 250
  end
  object edTotal: TcxCalcEdit
    Left = 104
    Top = 429
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.##'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clBlack
    TabOrder = 10
    Width = 250
  end
  object ckTax: TcxCheckBox
    Left = 8
    Top = 452
    Anchors = [akLeft, akBottom]
    Caption = 'Tax'
    Properties.ValueChecked = 'Y'
    Properties.ValueGrayed = 'N'
    Properties.ValueUnchecked = 'N'
    Properties.OnChange = ckTaxPropertiesChange
    TabOrder = 11
    OnKeyPress = ckTaxKeyPress
  end
  object edTax: TcxCalcEdit
    Left = 104
    Top = 452
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.##'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clBlack
    TabOrder = 12
    Width = 250
  end
  object edGrand: TcxCalcEdit
    Left = 104
    Top = 500
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.##'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clRed
    TabOrder = 13
    Width = 250
  end
  object edPrepared: TcxTextEdit
    Left = 670
    Top = 377
    Anchors = [akRight, akBottom]
    Enabled = False
    Properties.CharCase = ecUpperCase
    StyleDisabled.TextColor = clBlack
    TabOrder = 14
    Width = 269
  end
  object edMengetahui: TcxTextEdit
    Left = 670
    Top = 404
    Anchors = [akRight, akBottom]
    Properties.CharCase = ecUpperCase
    TabOrder = 15
    OnKeyPress = edMengetahuiKeyPress
    Width = 269
  end
  object edNotes: TcxMemo
    Left = 670
    Top = 431
    Anchors = [akRight, akBottom]
    TabOrder = 16
    Height = 75
    Width = 269
  end
  object btnSave: TcxButton
    Left = 413
    Top = 489
    Width = 129
    Height = 46
    Anchors = [akLeft, akBottom]
    Caption = 'SAVE'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 17
    OnClick = btnSaveClick
  end
  object btnReset: TcxButton
    Left = 556
    Top = 489
    Width = 98
    Height = 46
    Anchors = [akLeft, akBottom]
    Caption = 'Clear'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 18
    OnClick = btnResetClick
  end
  object edBiayaKirim: TcxCalcEdit
    Left = 104
    Top = 475
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#.##'
    Properties.UseThousandSeparator = True
    TabOrder = 19
    OnKeyPress = edBiayaKirimKeyPress
    Width = 250
  end
  object edDiscPersen: TcxCalcEdit
    Left = 104
    Top = 384
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    TabOrder = 20
    OnKeyPress = edDiscPersenKeyPress
    Width = 73
  end
  object edJumlhDisc: TcxCalcEdit
    Left = 180
    Top = 384
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.##'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clBlack
    TabOrder = 21
    Width = 174
  end
  object btnEdit: TcxButton
    Left = 688
    Top = 100
    Width = 104
    Height = 33
    Anchors = [akTop, akRight]
    Caption = 'EDIT ITEMS [F4]'
    LookAndFeel.Kind = lfOffice11
    PopupMenu = pmShort
    TabOrder = 22
    Visible = False
    OnClick = btnEditClick
  end
  object edTempo: TcxCalcEdit
    Left = 694
    Top = 36
    Anchors = [akTop, akRight]
    EditValue = 0.000000000000000000
    PopupMenu = pmShort
    TabOrder = 23
    OnKeyPress = edTempoKeyPress
    Width = 233
  end
  object btnPrint: TcxButton
    Left = 413
    Top = 437
    Width = 129
    Height = 46
    Anchors = [akLeft, akBottom]
    Caption = 'PRINT'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 24
    Visible = False
    OnClick = btnPrintClick
  end
  object edNoPO: TcxTextEdit
    Left = 85
    Top = 79
    Enabled = False
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 25
    Width = 250
  end
  object edInvoice: TcxTextEdit
    Left = 85
    Top = 104
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    TabOrder = 26
    Width = 250
  end
  object pmShort: TPopupMenu
    Left = 396
    Top = 56
    object NewItems1: TMenuItem
      Caption = 'Add Produk'
      ShortCut = 112
      Visible = False
      OnClick = NewItems1Click
    end
    object EditProduk1: TMenuItem
      Caption = 'Edit Produk'
      ShortCut = 115
      Visible = False
      OnClick = EditProduk1Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
  end
end
