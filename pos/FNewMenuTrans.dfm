object frmNewMenuTrans: TfrmNewMenuTrans
  Left = 0
  Top = 0
  ClientHeight = 585
  ClientWidth = 849
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    849
    585)
  PixelsPerInch = 96
  TextHeight = 23
  object Waktu: TLabel
    Left = 12
    Top = 160
    Width = 41
    Height = 23
    Caption = 'Lama'
    Transparent = True
  end
  object Label3: TLabel
    Left = 11
    Top = 345
    Width = 46
    Height = 23
    Caption = 'Harga'
    Transparent = True
  end
  object Label7: TLabel
    Left = 12
    Top = 197
    Width = 96
    Height = 23
    Caption = 'Therapist ID'
    Transparent = True
  end
  object Label8: TLabel
    Left = 12
    Top = 308
    Width = 121
    Height = 23
    Caption = 'Aroma Therapy'
    Transparent = True
  end
  object Label9: TLabel
    Left = 11
    Top = 382
    Width = 70
    Height = 23
    Caption = 'Discount'
    Transparent = True
  end
  object Label10: TLabel
    Left = 12
    Top = 124
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
  object Label11: TLabel
    Left = 265
    Top = 160
    Width = 49
    Height = 23
    Caption = 'Menit'
    Transparent = True
  end
  object Label12: TLabel
    Left = 12
    Top = 234
    Width = 125
    Height = 23
    Caption = 'Nama Therapist'
    Transparent = True
  end
  object Label13: TLabel
    Left = 12
    Top = 271
    Width = 67
    Height = 23
    Caption = 'Room ID'
    Transparent = True
  end
  object Label14: TLabel
    Left = 11
    Top = 419
    Width = 35
    Height = 23
    Caption = 'Nett'
    Transparent = True
  end
  object Label15: TLabel
    Left = 383
    Top = 379
    Width = 187
    Height = 29
    Caption = ' GUNAKAN ENTER '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 383
    Top = 414
    Width = 175
    Height = 29
    Caption = ' PADA KEYBOARD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 199
    Top = 8
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
    Left = 323
    Top = 8
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
  object Label5: TLabel
    Left = 199
    Top = 46
    Width = 86
    Height = 23
    Caption = 'Cust Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dxBevel1: TdxBevel
    Left = 8
    Top = 104
    Width = 824
    Height = 10
    Anchors = [akLeft, akTop, akRight]
    Shape = dxbsLineBottom
  end
  object lblStatus: TLabel
    Left = 499
    Top = 193
    Width = 5
    Height = 29
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object lblScan: TLabel
    Left = 499
    Top = 228
    Width = 5
    Height = 29
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    Visible = False
  end
  object edLama: TcxCalcEdit
    Left = 156
    Top = 157
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 5
    Width = 93
  end
  object edHarga: TcxCalcEdit
    Left = 156
    Top = 342
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 11
    Width = 200
  end
  object edTherapist: TcxTextEdit
    Left = 156
    Top = 194
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    TabOrder = 6
    OnKeyPress = edTherapistKeyPress
    Width = 305
  end
  object btnFinish: TcxButton
    Left = 72
    Top = 478
    Width = 121
    Height = 59
    Hint = 'SELESAI (CTRL + I)'
    Caption = 'FINISH'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 14
    OnClick = btnFinishClick
  end
  object edAroma: TcxLookupComboBox
    Left = 156
    Top = 305
    Properties.CharCase = ecUpperCase
    Properties.KeyFieldNames = 'nama_aroma'
    Properties.ListColumns = <
      item
        FieldName = 'nama_aroma'
      end>
    Properties.ListSource = dsQryAroma
    TabOrder = 10
    OnKeyPress = edAromaKeyPress
    Width = 305
  end
  object edDiscount: TcxCalcEdit
    Left = 156
    Top = 379
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 12
    OnKeyPress = edDiscountKeyPress
    Width = 200
  end
  object btnCancel: TcxButton
    Left = 199
    Top = 478
    Width = 121
    Height = 59
    Hint = 'BATAL (CTRL+N)'
    Caption = 'CANCEL'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 15
    OnClick = btnCancelClick
  end
  object edNamaMenu: TcxLookupComboBox
    Left = 156
    Top = 120
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
    TabOrder = 4
    OnKeyPress = edNamaMenuKeyPress
    Width = 329
  end
  object edNamaTR: TcxTextEdit
    Left = 156
    Top = 231
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 8
    Width = 305
  end
  object edSelectRoom: TcxLookupComboBox
    Left = 156
    Top = 268
    Properties.KeyFieldNames = 'ruangan_id'
    Properties.ListColumns = <
      item
        FieldName = 'ruangan_id'
      end>
    Properties.ListSource = dsQryRoom
    TabOrder = 9
    OnKeyPress = edSelectRoomKeyPress
    Width = 305
  end
  object edNett: TcxCalcEdit
    Left = 156
    Top = 416
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 13
    Width = 200
  end
  object rbTypeJasa: TcxRadioGroup
    Left = 8
    Top = 8
    Caption = 'Select Type Jasa'
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'RF'
      end
      item
        Caption = 'BM'
      end>
    Properties.OnEditValueChanged = rbTypeJasaPropertiesEditValueChanged
    ItemIndex = 0
    TabOrder = 0
    Height = 61
    Width = 173
  end
  object rbGender: TcxRadioGroup
    Left = 560
    Top = 8
    Caption = 'Select Gender'
    ParentFont = False
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'MALE'
      end
      item
        Caption = 'FEMALE'
      end>
    ItemIndex = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 2
    Height = 61
    Width = 169
  end
  object edCustName: TcxTextEdit
    Left = 323
    Top = 43
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    TextHint = 'GUEST 1'
    Width = 222
  end
  object btnGuestOnly: TcxButton
    Left = 735
    Top = 8
    Width = 106
    Height = 61
    Caption = 'Guest Only'
    TabOrder = 16
    OnClick = btnGuestOnlyClick
  end
  object edSelectTR: TcxLookupComboBox
    Left = 460
    Top = 194
    Properties.DropDownAutoSize = True
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.KeyFieldNames = 'idkaryawan'
    Properties.ListColumns = <
      item
        Caption = 'Nama Karyawan'
        MinWidth = 250
        Sorting = False
        Width = 250
        FieldName = 'namakaryawan'
      end>
    Properties.ListSource = dsQryTherapist
    Properties.OnEditValueChanged = edSelectTRPropertiesEditValueChanged
    TabOrder = 7
    Width = 21
  end
  object ckByRequest: TcxCheckBox
    Left = 199
    Top = 75
    Caption = 'By Request'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 3
  end
  object dsQryMenu: TDataSource
    DataSet = QryMenu
    Left = 736
    Top = 160
  end
  object dsQryRoom: TDataSource
    DataSet = QryRoom
    Left = 752
    Top = 216
  end
  object QryMenu: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select menu_id, nama_menu from main_menu '
      
        'where jenis_jasa_id = '#39'RF'#39' AND type_menu  = '#39'BJ'#39' ORDER BY nama_m' +
        'enu ASC')
    Left = 732
    Top = 108
  end
  object QryRoom: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select ruangan_id from ruangan where jenis_jasa = '#39'RF'#39)
    Left = 708
    Top = 216
  end
  object dsQryTherapist: TDataSource
    DataSet = qryTherapist
    Left = 604
    Top = 180
  end
  object qryTherapist: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select idkaryawan, namakaryawan from '
      'ben_hrd_karyawan_info where departemen = '#39'TR'#39' and active = '#39'Y'#39
      'ORDER BY namakaryawan ASC')
    Left = 600
    Top = 128
  end
  object dsQryAroma: TDataSource
    DataSet = qryAroma
    Left = 752
    Top = 272
  end
  object qryAroma: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select nama_aroma from aroma order by nama_aroma ASC')
    Left = 708
    Top = 272
  end
end
