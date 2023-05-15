object frmBuyAdditional: TfrmBuyAdditional
  Left = 213
  Top = 139
  BorderIcons = [biSystemMenu]
  ClientHeight = 433
  ClientWidth = 375
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Label10: TLabel
    Left = 8
    Top = 120
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
  object Label3: TLabel
    Left = 11
    Top = 228
    Width = 42
    Height = 19
    Caption = 'Harga'
    Transparent = True
  end
  object Label9: TLabel
    Left = 11
    Top = 258
    Width = 61
    Height = 19
    Caption = 'Discount'
    Transparent = True
  end
  object Label14: TLabel
    Left = 11
    Top = 288
    Width = 29
    Height = 19
    Caption = 'Nett'
    Transparent = True
  end
  object Label6: TLabel
    Left = 8
    Top = 80
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
    Left = 132
    Top = 80
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
  object Waktu: TLabel
    Left = 11
    Top = 198
    Width = 38
    Height = 19
    Caption = 'Lama'
    Transparent = True
  end
  object Label11: TLabel
    Left = 217
    Top = 198
    Width = 38
    Height = 19
    Caption = 'Menit'
    Transparent = True
  end
  object rbTypeJasa: TcxRadioGroup
    Left = 8
    Top = 8
    Caption = 'Type Jasa'
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'RF'
      end
      item
        Caption = 'BM'
      end>
    Properties.ReadOnly = True
    ItemIndex = 0
    TabOrder = 1
    Height = 61
    Width = 201
  end
  object edNamaMenu: TcxLookupComboBox
    Left = 8
    Top = 144
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
  object edHarga: TcxCalcEdit
    Left = 108
    Top = 225
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 2
    Width = 200
  end
  object btnFinish: TcxButton
    Left = 28
    Top = 357
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
  object edDiscount: TcxCalcEdit
    Left = 108
    Top = 255
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 4
    Width = 200
  end
  object btnCancel: TcxButton
    Left = 155
    Top = 357
    Width = 121
    Height = 59
    Hint = 'BATAL (CTRL+N)'
    Caption = 'CANCEL'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
  end
  object edNett: TcxCalcEdit
    Left = 108
    Top = 285
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 6
    Width = 200
  end
  object edLama: TcxCalcEdit
    Left = 108
    Top = 195
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 7
    Width = 93
  end
  object dsQryMenu: TDataSource
    DataSet = QryMenu
    Left = 252
    Top = 56
  end
  object QryMenu: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select menu_id, nama_menu from main_menu '
      
        'where jenis_jasa_id = '#39'RF'#39' AND aktif = '#39'Y'#39' ORDER BY nama_menu AS' +
        'C')
    Active = True
    Left = 252
    Top = 4
  end
end
