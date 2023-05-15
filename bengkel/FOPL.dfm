object frmOPL: TfrmOPL
  Left = 0
  Top = 0
  Caption = 'Ongkos Pekerjaan Luar'
  ClientHeight = 277
  ClientWidth = 484
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object cxLabel2: TcxLabel
    Left = 9
    Top = 10
    Caption = 'Supplier'
    Transparent = True
  end
  object edKodeSupp: TcxLookupComboBox
    Left = 128
    Top = 9
    Properties.KeyFieldNames = 'kode'
    Properties.ListColumns = <
      item
        FieldName = 'namasupp'
      end>
    Properties.ListSource = dsQrySupplier
    TabOrder = 1
    OnKeyPress = edKodeSuppKeyPress
    Width = 229
  end
  object edNamaJasa: TcxTextEdit
    Left = 128
    Top = 72
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = edNamaJasaKeyPress
    Width = 321
  end
  object edCharge: TcxLookupComboBox
    Left = 128
    Top = 48
    Properties.KeyFieldNames = 'kode'
    Properties.ListColumns = <
      item
        FieldName = 'kode'
      end>
    Properties.ListSource = dsTblCharge
    TabOrder = 3
    OnKeyPress = edChargeKeyPress
    Width = 101
  end
  object cxLabel4: TcxLabel
    Left = 24
    Top = 49
    Caption = 'Charge To'
    Transparent = True
  end
  object cxLabel5: TcxLabel
    Left = 25
    Top = 73
    Caption = 'Nama Jasa'
    Transparent = True
  end
  object edHarga: TcxCalcEdit
    Left = 128
    Top = 96
    OnFocusChanged = edHargaFocusChanged
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 6
    OnKeyPress = edHargaKeyPress
    Width = 193
  end
  object cxLabel6: TcxLabel
    Left = 25
    Top = 97
    Caption = 'HPP'
    Transparent = True
  end
  object cxLabel7: TcxLabel
    Left = 25
    Top = 146
    Caption = 'Discount'
    Transparent = True
  end
  object edDisc: TcxCalcEdit
    Left = 128
    Top = 145
    OnFocusChanged = edDiscFocusChanged
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 9
    OnKeyPress = edDiscKeyPress
    Width = 89
  end
  object cxLabel8: TcxLabel
    Left = 25
    Top = 171
    Caption = 'Subtotal'
    Transparent = True
  end
  object edSubtotal: TcxCalcEdit
    Left = 128
    Top = 170
    OnFocusChanged = edSubtotalFocusChanged
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 11
    OnKeyPress = edSubtotalKeyPress
    Width = 193
  end
  object cxLabel9: TcxLabel
    Left = 223
    Top = 146
    Caption = ' % '
    Transparent = True
  end
  object btnAdd: TcxButton
    Tag = 1
    Left = 128
    Top = 200
    Width = 107
    Height = 46
    Caption = 'Add'
    TabOrder = 13
    OnClick = btnAddClick
    OnKeyPress = btnAddKeyPress
  end
  object btnReset: TcxButton
    Left = 248
    Top = 198
    Width = 107
    Height = 46
    Caption = 'Cancel'
    TabOrder = 14
    OnClick = btnResetClick
  end
  object cxLabel1: TcxLabel
    Left = 25
    Top = 121
    Caption = 'Harga Jual '
    Transparent = True
  end
  object edHargaJual: TcxCalcEdit
    Left = 128
    Top = 120
    OnFocusChanged = edHargaJualFocusChanged
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 16
    OnKeyPress = edHargaJualKeyPress
    Width = 193
  end
  object qrySupplier: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select kode, namasupp from ben_bengkel_supplier'
      'where isdelete = '#39'N'#39' order by namasupp ASC')
    Active = True
    Left = 400
    Top = 8
  end
  object dsQrySupplier: TMyDataSource
    DataSet = qrySupplier
    Left = 400
    Top = 64
  end
  object tblCharge: TMyTable
    TableName = 'ben_bengkel_chargeto'
    Connection = dmDB.dbInternal
    Left = 428
    Top = 156
  end
  object dsTblCharge: TMyDataSource
    DataSet = tblCharge
    Left = 432
    Top = 204
  end
end
