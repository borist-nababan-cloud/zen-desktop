object frmBuyGC: TfrmBuyGC
  Left = 195
  Top = 118
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '  PoS Add GC'
  ClientHeight = 332
  ClientWidth = 456
  Color = clMoneyGreen
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Label3: TLabel
    Left = 15
    Top = 128
    Width = 39
    Height = 19
    Caption = 'Harga'
    Transparent = True
  end
  object Label6: TLabel
    Left = 12
    Top = 16
    Width = 94
    Height = 23
    Caption = 'ID Transaksi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblKodeTrans: TLabel
    Left = 136
    Top = 16
    Width = 94
    Height = 23
    Caption = 'ID Transaksi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 52
    Width = 86
    Height = 23
    Caption = 'Pilih Menu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 15
    Top = 95
    Width = 23
    Height = 19
    Caption = 'Qty'
    Transparent = True
  end
  object Label2: TLabel
    Left = 15
    Top = 161
    Width = 53
    Height = 19
    Caption = 'Subtotal'
    Transparent = True
  end
  object edHarga: TcxCalcEdit
    Left = 112
    Top = 125
    OnFocusChanged = edHargaFocusChanged
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 2
    Width = 200
  end
  object btnFinish: TcxButton
    Left = 60
    Top = 221
    Width = 121
    Height = 59
    Hint = 'SELESAI (CTRL + I)'
    Caption = 'FINISH'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnClick = btnFinishClick
  end
  object btnCancel: TcxButton
    Left = 187
    Top = 221
    Width = 121
    Height = 59
    Hint = 'BATAL (CTRL+N)'
    Caption = 'CANCEL'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
  end
  object edNamaMenu: TcxLookupComboBox
    Left = 112
    Top = 51
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'menu_id'
    Properties.ListColumns = <
      item
        MinWidth = 250
        Width = 500
        FieldName = 'nama_menu'
      end>
    Properties.ListSource = dsQryMenu
    Properties.OnEditValueChanged = edNamaMenuPropertiesEditValueChanged
    TabOrder = 0
    OnKeyPress = edNamaMenuKeyPress
    Width = 300
  end
  object edQty: TcxCalcEdit
    Left = 112
    Top = 92
    OnFocusChanged = edQtyFocusChanged
    EditValue = 1.000000000000000000
    Properties.ReadOnly = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = edQtyPropertiesEditValueChanged
    TabOrder = 1
    OnKeyPress = edQtyKeyPress
    Width = 200
  end
  object edSubtotal: TcxCalcEdit
    Left = 112
    Top = 158
    OnFocusChanged = edSubtotalFocusChanged
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 5
    Width = 200
  end
  object dsQryMenu: TDataSource
    DataSet = QryMenu
    Left = 368
    Top = 172
  end
  object QryMenu: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select menu_id, nama_menu from main_menu '
      'where type_menu = '#39'BG'#39' AND aktif = '#39'Y'#39' ORDER BY nama_menu ASC')
    Active = True
    Left = 368
    Top = 120
  end
end
