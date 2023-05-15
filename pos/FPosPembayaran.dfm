object frmPosPembayaran: TfrmPosPembayaran
  Left = 0
  Top = 0
  Caption = '   PoS Payment'
  ClientHeight = 690
  ClientWidth = 1172
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1172
    690)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 1160
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '   PoS Payment'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1046
  end
  object Label12: TLabel
    Left = 856
    Top = 363
    Width = 62
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Pos Printer'
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 36
    Width = 1160
    Height = 321
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tvPembayaran: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          OnGetText = tvPembayaranTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText
          Column = tvPembayaranSubtotal
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = tvPembayaranHarga
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvPembayaranTransID: TcxGridColumn
        Caption = 'Kode Trans'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
      object tvPembayaranNamaCust: TcxGridColumn
        Caption = 'Nama Cusutomer'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 300
      end
      object tvPembayaranRuangan: TcxGridColumn
        Caption = 'Ruangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object tvPembayaranTherapist: TcxGridColumn
        Caption = 'TR ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object tvPembayaranSubtotal: TcxGridColumn
        Caption = 'Subtotal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object tvPembayaranDetails: TcxGridColumn
        Caption = 'Details'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object tvPembayaranHarga: TcxGridColumn
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object tvPembayaranIDTrans: TcxGridColumn
        Caption = 'KodeTrans'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = tvPembayaran
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 424
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Details '
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Height = 258
    Width = 1156
    object Label2: TLabel
      Left = 12
      Top = 24
      Width = 115
      Height = 18
      Caption = 'Subtotal Payment'
    end
    object Label3: TLabel
      Left = 12
      Top = 53
      Width = 72
      Height = 18
      Caption = 'Add Promo'
    end
    object Label4: TLabel
      Left = 12
      Top = 120
      Width = 108
      Height = 18
      Caption = 'Potongan Promo'
    end
    object Label5: TLabel
      Left = 12
      Top = 152
      Width = 55
      Height = 18
      Caption = 'Discount'
    end
    object Label6: TLabel
      Left = 12
      Top = 88
      Width = 91
      Height = 18
      Caption = 'Voucher Code'
    end
    object Label7: TLabel
      Left = 560
      Top = 138
      Width = 87
      Height = 21
      Caption = 'Grand Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 12
      Top = 184
      Width = 82
      Height = 18
      Caption = 'Add Purpose'
    end
    object dxBevel1: TdxBevel
      Left = 532
      Top = 24
      Width = 14
      Height = 209
      Shape = dxbsLineRight
    end
    object Label9: TLabel
      Left = 555
      Top = 25
      Width = 75
      Height = 18
      Caption = 'Member ID'
    end
    object Label10: TLabel
      Left = 555
      Top = 57
      Width = 98
      Height = 18
      Caption = 'Nama Member'
    end
    object Label11: TLabel
      Left = 555
      Top = 89
      Width = 90
      Height = 18
      Caption = 'Point Member'
    end
    object lblNoKartu: TLabel
      Left = 948
      Top = 90
      Width = 20
      Height = 18
      Caption = '    '
    end
    object lblKodeMember: TLabel
      Left = 948
      Top = 141
      Width = 20
      Height = 18
      Caption = '    '
      Visible = False
    end
    object edSubtotal: TcxCalcEdit
      Left = 186
      Top = 21
      EditValue = 0.000000000000000000
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      TabOrder = 0
      Width = 259
    end
    object edPromo: TcxLookupComboBox
      Left = 186
      Top = 53
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'kodepromo'
      Properties.ListColumns = <
        item
          FieldName = 'namapromo'
        end>
      Properties.ListSource = dsQryPromo
      Properties.OnEditValueChanged = edPromoPropertiesEditValueChanged
      TabOrder = 1
      Width = 259
    end
    object edPromoRef: TcxTextEdit
      Left = 186
      Top = 85
      TabOrder = 2
      TextHint = 'Input Voucher Code Here...'
      Width = 259
    end
    object edDiscPromo: TcxCalcEdit
      Left = 186
      Top = 117
      EditValue = 0.000000000000000000
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      TabOrder = 3
      Width = 259
    end
    object edDiscPurpose: TcxCalcEdit
      Left = 186
      Top = 149
      EditValue = 0.000000000000000000
      Properties.ReadOnly = True
      TabOrder = 4
      Width = 259
    end
    object cxButton1: TcxButton
      Left = 216
      Top = 213
      Width = 75
      Height = 25
      Caption = 'Add Disc'
      TabOrder = 5
      OnClick = cxButton1Click
    end
    object btnClearDisc: TcxButton
      Left = 308
      Top = 213
      Width = 75
      Height = 25
      Caption = 'Clear Disc'
      TabOrder = 6
      OnClick = btnClearDiscClick
    end
    object edPurpose: TcxTextEdit
      Left = 186
      Top = 181
      Properties.ReadOnly = True
      TabOrder = 7
      TextHint = 'Addition Purpose'
      Width = 259
    end
    object edGrandTotal: TcxCalcEdit
      Left = 676
      Top = 135
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 8
      Width = 259
    end
    object btnClearPromo: TcxButton
      Left = 451
      Top = 54
      Width = 83
      Height = 25
      Caption = 'Clear Promo'
      TabOrder = 9
      OnClick = btnClearPromoClick
    end
    object btnSetPayment: TcxButton
      Left = 676
      Top = 170
      Width = 189
      Height = 63
      Caption = 'Set Payment'
      TabOrder = 10
      OnClick = btnSetPaymentClick
    end
    object edScan: TcxTextEdit
      Left = 676
      Top = 22
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '#'
      TabOrder = 11
      TextHint = 'Scan Member Code Here...'
      OnKeyPress = edScanKeyPress
      Width = 259
    end
    object btnLoadMember: TcxButton
      Left = 948
      Top = 24
      Width = 77
      Height = 45
      Caption = 'Load'
      TabOrder = 12
      OnClick = btnLoadMemberClick
    end
    object edMemberNama: TcxTextEdit
      Left = 676
      Top = 54
      Properties.ReadOnly = True
      TabOrder = 13
      TextHint = 'Scan Member Code Here...'
      Width = 259
    end
    object edMemberPoint: TcxCalcEdit
      Left = 676
      Top = 86
      EditValue = 0.000000000000000000
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      TabOrder = 14
      Width = 259
    end
  end
  object btnFind: TcxButton
    Left = 8
    Top = 363
    Width = 105
    Height = 55
    Anchors = [akLeft, akBottom]
    Caption = 'Find Trans'
    TabOrder = 2
    OnClick = btnFindClick
  end
  object cxButton3: TcxButton
    Left = 128
    Top = 363
    Width = 105
    Height = 55
    Anchors = [akLeft, akBottom]
    Caption = 'Move Trans'
    TabOrder = 3
    OnClick = cxButton3Click
  end
  object edJasa: TcxCalcEdit
    Left = 291
    Top = 388
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 4
    Width = 121
  end
  object edProduk: TcxCalcEdit
    Left = 428
    Top = 388
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 5
    Width = 121
  end
  object edAdditional: TcxCalcEdit
    Left = 564
    Top = 388
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 6
    Width = 121
  end
  object edGift: TcxCalcEdit
    Left = 700
    Top = 388
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 7
    Width = 121
  end
  object cxLabel1: TcxLabel
    Left = 291
    Top = 363
    Anchors = [akLeft, akBottom]
    Caption = 'Tot. Jasa'
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 428
    Top = 363
    Anchors = [akLeft, akBottom]
    Caption = 'Tot. Produk'
    Transparent = True
  end
  object cxLabel3: TcxLabel
    Left = 564
    Top = 363
    Anchors = [akLeft, akBottom]
    Caption = 'Tot. Additional'
    Transparent = True
  end
  object cxLabel4: TcxLabel
    Left = 700
    Top = 363
    Anchors = [akLeft, akBottom]
    Caption = 'Tot. GC'
    Transparent = True
  end
  object cbPrinterPos: TComboBox
    Left = 856
    Top = 388
    Width = 265
    Height = 24
    Anchors = [akLeft, akBottom]
    TabOrder = 12
    Text = 'select printer'
  end
  object qryPromo: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select kodepromo, namapromo from pos_master_promo where aktif = ' +
        #39'Y'#39)
    Left = 16
    Top = 76
  end
  object dsQryPromo: TMyDataSource
    DataSet = qryPromo
    Left = 16
    Top = 132
  end
end
