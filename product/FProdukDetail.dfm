object frmProdukDetail: TfrmProdukDetail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  ClientHeight = 526
  ClientWidth = 754
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 4
    Width = 235
    Height = 19
    Caption = ' MASTER PRODUK BARANG  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 16
    Top = 189
    Width = 547
    Height = 14
    Shape = bsBottomLine
    Visible = False
  end
  object Label2: TLabel
    Left = 582
    Top = 7
    Width = 88
    Height = 16
    Caption = 'TYPE BARANG'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object edBarcode: TcxTextEdit
    Left = 141
    Top = 26
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 420
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 27
    Caption = 'ID Produk'
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 52
    Caption = 'Barcode'
  end
  object edAlternatif: TcxTextEdit
    Left = 141
    Top = 50
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    OnKeyPress = edAlternatifKeyPress
    Width = 420
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 75
    Caption = 'Nama Produk'
  end
  object edNama: TcxTextEdit
    Left = 141
    Top = 74
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = edNamaKeyPress
    Width = 420
  end
  object edJenis: TcxLookupComboBox
    Left = 141
    Top = 98
    Properties.CharCase = ecUpperCase
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.KeyFieldNames = 'id_jenis'
    Properties.ListColumns = <
      item
        FieldName = 'nama_jenis'
      end>
    TabOrder = 3
    OnKeyPress = edJenisKeyPress
    Width = 420
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 99
    Caption = 'Jenis Produk'
  end
  object cxLabel5: TcxLabel
    Left = 16
    Top = 122
    Caption = 'Supplier Utama'
  end
  object edSupp: TcxLookupComboBox
    Left = 141
    Top = 121
    Properties.KeyFieldNames = 'id_supp'
    Properties.ListColumns = <
      item
        FieldName = 'nama_supp'
      end>
    TabOrder = 4
    OnKeyPress = edSuppKeyPress
    Width = 420
  end
  object cxLabel7: TcxLabel
    Left = 16
    Top = 143
    Caption = 'Satuan Kecil'
  end
  object edSatuan: TcxLookupComboBox
    Left = 141
    Top = 142
    Properties.KeyFieldNames = 'id_satuan'
    Properties.ListColumns = <
      item
        FieldName = 'nama_satuan'
      end>
    TabOrder = 5
    OnKeyPress = edSatuanKeyPress
    Width = 420
  end
  object edPriceList: TcxCalcEdit
    Left = 111
    Top = 228
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#.##'
    Properties.UseThousandSeparator = True
    TabOrder = 6
    OnKeyPress = edPriceListKeyPress
    Width = 168
  end
  object cxLabel10: TcxLabel
    Left = 16
    Top = 229
    Caption = 'Price List Jual'
  end
  object ckTax: TcxCheckBox
    Left = 574
    Top = 179
    Caption = 'TAX'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 7
  end
  object ckPoint: TcxCheckBox
    Left = 574
    Top = 132
    Caption = 'TAMBAH POINT'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 8
    Visible = False
  end
  object ckEditHarga: TcxCheckBox
    Left = 574
    Top = 152
    Caption = 'EDIT HARGA'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 9
  end
  object ckKonsinyasi: TcxCheckBox
    Left = 574
    Top = 29
    Caption = 'KONSINYASI'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 10
  end
  object ckFormula: TcxCheckBox
    Left = 574
    Top = 56
    Caption = 'FORMULA'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    Properties.OnChange = ckFormulaPropertiesChange
    TabOrder = 11
    Visible = False
  end
  object ckJasa: TcxCheckBox
    Left = 574
    Top = 83
    Caption = 'JASA'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 12
  end
  object ckBlok: TcxCheckBox
    Left = 574
    Top = 202
    Caption = 'BLOK'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 13
  end
  object gbJual: TcxGroupBox
    Left = 8
    Top = 255
    Caption = 'Harga Jual'
    TabOrder = 14
    Height = 82
    Width = 547
    object cxLabel11: TcxLabel
      Left = 8
      Top = 21
      Caption = 'Konsumen'
    end
    object edhj_disc1: TcxCalcEdit
      Left = 83
      Top = 20
      OnFocusChanged = edhj_disc1FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      Properties.OnEditValueChanged = edhj_disc1PropertiesEditValueChanged
      TabOrder = 1
      OnKeyPress = edhj_disc1KeyPress
      Width = 63
    end
    object edhj_disc2: TcxCalcEdit
      Left = 194
      Top = 20
      OnFocusChanged = edhj_disc2FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      Properties.OnEditValueChanged = edhj_disc2PropertiesEditValueChanged
      TabOrder = 2
      OnKeyPress = edhj_disc2KeyPress
      Width = 63
    end
    object edhj_disc3: TcxCalcEdit
      Left = 298
      Top = 20
      OnFocusChanged = edhj_disc3FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      Properties.OnEditValueChanged = edhj_disc3PropertiesEditValueChanged
      TabOrder = 3
      OnKeyPress = edhj_disc3KeyPress
      Width = 63
    end
    object cxLabel12: TcxLabel
      Left = 145
      Top = 21
      AutoSize = False
      Caption = ' % + '
      Height = 17
      Width = 43
    end
    object cxLabel13: TcxLabel
      Left = 257
      Top = 21
      AutoSize = False
      Caption = ' % + '
      Height = 17
      Width = 43
    end
    object cxLabel14: TcxLabel
      Left = 367
      Top = 21
      AutoSize = False
      Caption = ' = '
      Height = 17
      Width = 43
    end
    object edhj_nett: TcxCalcEdit
      Left = 400
      Top = 20
      OnFocusChanged = edhj_nettFocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      Properties.UseThousandSeparator = True
      Properties.OnValidate = edhj_nettPropertiesValidate
      TabOrder = 7
      OnKeyPress = edhj_nettKeyPress
      Width = 97
    end
    object cxLabel15: TcxLabel
      Left = 8
      Top = 48
      Caption = 'Distribusi'
    end
    object edhd_disc1: TcxCalcEdit
      Left = 83
      Top = 47
      OnFocusChanged = edhd_disc1FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      TabOrder = 9
      OnKeyPress = edhd_disc1KeyPress
      Width = 63
    end
    object edhd_disc2: TcxCalcEdit
      Left = 194
      Top = 47
      OnFocusChanged = edhd_disc2FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      TabOrder = 10
      OnKeyPress = edhd_disc2KeyPress
      Width = 63
    end
    object edhd_disc3: TcxCalcEdit
      Left = 298
      Top = 47
      OnFocusChanged = edhd_disc3FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      TabOrder = 11
      OnKeyPress = edhd_disc3KeyPress
      Width = 63
    end
    object cxLabel16: TcxLabel
      Left = 145
      Top = 48
      AutoSize = False
      Caption = ' % + '
      Height = 17
      Width = 43
    end
    object cxLabel17: TcxLabel
      Left = 257
      Top = 48
      AutoSize = False
      Caption = ' % + '
      Height = 17
      Width = 43
    end
    object cxLabel18: TcxLabel
      Left = 367
      Top = 48
      AutoSize = False
      Caption = ' = '
      Height = 17
      Width = 43
    end
    object edhd_nett: TcxCalcEdit
      Left = 400
      Top = 47
      OnFocusChanged = edhd_nettFocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      Properties.UseThousandSeparator = True
      Properties.OnValidate = edhd_nettPropertiesValidate
      TabOrder = 15
      OnKeyPress = edhd_nettKeyPress
      Width = 97
    end
  end
  object gbBeli: TcxGroupBox
    Left = 8
    Top = 343
    Caption = 'Harga Beli'
    TabOrder = 15
    Height = 73
    Width = 713
    object cxLabel19: TcxLabel
      Left = 8
      Top = 29
      Caption = 'Normal'
    end
    object edhb_disc1: TcxCalcEdit
      Left = 83
      Top = 28
      OnFocusChanged = edhb_disc1FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      TabOrder = 1
      OnKeyPress = edhb_disc1KeyPress
      Width = 63
    end
    object edhb_disc2: TcxCalcEdit
      Left = 194
      Top = 28
      OnFocusChanged = edhb_disc2FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      TabOrder = 2
      OnKeyPress = edhb_disc2KeyPress
      Width = 63
    end
    object edhb_disc3: TcxCalcEdit
      Left = 298
      Top = 28
      OnFocusChanged = edhb_disc3FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      TabOrder = 3
      OnKeyPress = edhb_disc3KeyPress
      Width = 63
    end
    object cxLabel20: TcxLabel
      Left = 145
      Top = 29
      AutoSize = False
      Caption = ' % + '
      Height = 17
      Width = 43
    end
    object cxLabel21: TcxLabel
      Left = 257
      Top = 29
      AutoSize = False
      Caption = ' % + '
      Height = 17
      Width = 43
    end
    object cxLabel22: TcxLabel
      Left = 572
      Top = 29
      AutoSize = False
      Caption = ' = '
      Height = 17
      Width = 43
    end
    object edhb_nett: TcxCalcEdit
      Left = 605
      Top = 28
      OnFocusChanged = edhb_nettFocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      Properties.UseThousandSeparator = True
      TabOrder = 7
      OnKeyPress = edhb_nettKeyPress
      Width = 97
    end
    object cxLabel23: TcxLabel
      Left = 359
      Top = 29
      AutoSize = False
      Caption = ' % + '
      Height = 17
      Width = 43
    end
    object edhb_disc4: TcxCalcEdit
      Left = 400
      Top = 28
      OnFocusChanged = edhb_disc4FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      TabOrder = 9
      OnKeyPress = edhb_disc4KeyPress
      Width = 63
    end
    object cxLabel24: TcxLabel
      Left = 465
      Top = 29
      AutoSize = False
      Caption = ' % + '
      Height = 17
      Width = 43
    end
    object edhb_disc5: TcxCalcEdit
      Left = 506
      Top = 28
      OnFocusChanged = edhb_disc5FocusChanged
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#.##'
      TabOrder = 11
      OnKeyPress = edhb_disc5KeyPress
      Width = 63
    end
  end
  object cxLabel25: TcxLabel
    Left = 16
    Top = 166
    Caption = 'Stok Min'
  end
  object edMin: TcxCalcEdit
    Left = 141
    Top = 165
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#.##'
    TabOrder = 16
    OnKeyPress = edMinKeyPress
    Width = 150
  end
  object cxLabel26: TcxLabel
    Left = 314
    Top = 166
    Caption = 'Stok Max'
  end
  object edMax: TcxCalcEdit
    Left = 383
    Top = 165
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#.##'
    TabOrder = 17
    OnKeyPress = edMaxKeyPress
    Width = 178
  end
  object btnSave: TButton
    Left = 8
    Top = 422
    Width = 121
    Height = 71
    Caption = 'Save'
    TabOrder = 18
    OnClick = btnSaveClick
  end
  object btnSetFormula: TButton
    Left = 598
    Top = 441
    Width = 106
    Height = 33
    Caption = 'SET FORMULA'
    TabOrder = 19
    Visible = False
  end
  object btnSetKonveri: TButton
    Left = 594
    Top = 441
    Width = 106
    Height = 33
    Caption = 'SET KONVERSI'
    TabOrder = 20
    Visible = False
    OnClick = btnSetKonveriClick
  end
  object btnClear: TButton
    Left = 160
    Top = 432
    Width = 105
    Height = 61
    Caption = 'Clear'
    TabOrder = 21
    OnClick = btnClearClick
  end
  object ckKonversi: TcxCheckBox
    Left = 574
    Top = 110
    Caption = 'KONVERSI'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    Properties.OnChange = ckKonversiPropertiesChange
    TabOrder = 22
    Visible = False
  end
end
