object frmPosPembayaranPay: TfrmPosPembayaranPay
  Left = 0
  Top = 0
  Caption = '  PoS Select Payment'
  ClientHeight = 604
  ClientWidth = 822
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    822
    604)
  PixelsPerInch = 96
  TextHeight = 19
  object dxBevel3: TdxBevel
    Left = 366
    Top = 161
    Width = 448
    Height = 118
  end
  object dxBevel1: TdxBevel
    Left = 8
    Top = 84
    Width = 369
    Height = 61
  end
  object lblJudulAtas: TLabel
    Left = 8
    Top = 4
    Width = 806
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  PoS Select Payment'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 922
  end
  object Label7: TLabel
    Left = 8
    Top = 45
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
  object Label1: TLabel
    Left = 667
    Top = 288
    Width = 99
    Height = 21
    Caption = 'Sisa Payment'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 8
    Top = 219
    Width = 105
    Height = 21
    Caption = 'Cash payment'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 164
    Width = 130
    Height = 21
    Caption = 'Redeem Payment'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 288
    Width = 78
    Height = 21
    Caption = 'Payment 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dxBevel2: TdxBevel
    Left = 388
    Top = 84
    Width = 369
    Height = 61
  end
  object Label5: TLabel
    Left = 8
    Top = 320
    Width = 55
    Height = 21
    Caption = 'Value 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 452
    Width = 107
    Height = 21
    Caption = 'Total Payment'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 496
    Width = 77
    Height = 21
    Caption = 'Kembalian'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 8
    Top = 355
    Width = 78
    Height = 21
    Caption = 'Payment 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 387
    Width = 55
    Height = 21
    Caption = 'Value 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 377
    Top = 180
    Width = 90
    Height = 21
    Caption = 'GC Payment'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 377
    Top = 214
    Width = 67
    Height = 21
    Caption = 'GC Value'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblBeliGC: TLabel
    Left = 374
    Top = 252
    Width = 10
    Height = 19
    Caption = '  '
  end
  object edSubtPayment: TcxCalcEdit
    Left = 136
    Top = 42
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
    TabOrder = 9
    Width = 259
  end
  object edSisaPayment: TcxCalcEdit
    Left = 652
    Top = 320
    OnFocusChanged = edSisaPaymentFocusChanged
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
    TabOrder = 10
    Visible = False
    Width = 162
  end
  object ckRedeem: TcxCheckBox
    Left = 8
    Top = 91
    Caption = 'Redeem Point'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    Properties.OnEditValueChanged = ckRedeemPropertiesEditValueChanged
    TabOrder = 11
  end
  object edMemberAvailable: TcxCalcEdit
    Left = 252
    Top = 91
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 12
    Width = 108
  end
  object cxLabel1: TcxLabel
    Left = 148
    Top = 92
    Caption = 'Available Point'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 148
    Top = 118
    Caption = 'Point To Pay'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object edMemberPointToPay: TcxCalcEdit
    Left = 252
    Top = 117
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 15
    Width = 108
  end
  object edRedeemValue: TcxCalcEdit
    Left = 160
    Top = 161
    OnFocusChanged = edRedeemValueFocusChanged
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = edRedeemValuePropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 16
    Width = 200
  end
  object edCash: TcxCalcEdit
    Left = 160
    Top = 217
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.ReadOnly = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = edCashPropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Width = 200
  end
  object edReff1: TcxTextEdit
    Left = 374
    Top = 318
    OnFocusChanged = edReff1FocusChanged
    TabOrder = 4
    TextHint = 'Add Reference 1 Here...'
    Width = 259
  end
  object edValue1: TcxCalcEdit
    Left = 160
    Top = 318
    OnFocusChanged = edValue1FocusChanged
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.ReadOnly = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = edValue1PropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 200
  end
  object edPayment1: TcxLookupComboBox
    Left = 160
    Top = 285
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodepayment'
    Properties.ListColumns = <
      item
        FieldName = 'namapayment'
      end>
    Properties.ListSource = dsQryPayment
    Properties.OnEditValueChanged = edPayment1PropertiesEditValueChanged
    TabOrder = 1
    Width = 200
  end
  object edBank1: TcxLookupComboBox
    Left = 374
    Top = 285
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodebank'
    Properties.ListColumns = <
      item
        FieldName = 'namabank'
      end>
    Properties.ListSource = dsQryBank
    TabOrder = 2
    Visible = False
    Width = 259
  end
  object cxLabel3: TcxLabel
    Left = 396
    Top = 92
    Caption = 'Tambah Point'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object edTambahPoint: TcxCalcEdit
    Left = 500
    Top = 91
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 18
    Width = 108
  end
  object cxLabel4: TcxLabel
    Left = 396
    Top = 118
    Caption = 'Sisa Point'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object edSisaPoint: TcxCalcEdit
    Left = 500
    Top = 117
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 20
    Width = 108
  end
  object cxLabel5: TcxLabel
    Left = 404
    Top = 47
    Caption = 'Rounding'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object edRounding: TcxCalcEdit
    Left = 508
    Top = 46
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 22
    Width = 108
  end
  object edTotalPayment: TcxCalcEdit
    Left = 156
    Top = 449
    OnFocusChanged = edTotalPaymentFocusChanged
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
    TabOrder = 23
    Width = 200
  end
  object edkembalian: TcxCalcEdit
    Left = 156
    Top = 493
    OnFocusChanged = edkembalianFocusChanged
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
    TabOrder = 24
    Width = 200
  end
  object cxButton1: TcxButton
    Left = 374
    Top = 444
    Width = 259
    Height = 78
    Caption = 'Pay'
    TabOrder = 25
    OnClick = cxButton1Click
  end
  object edReff2: TcxTextEdit
    Left = 374
    Top = 385
    OnFocusChanged = edReff2FocusChanged
    Properties.ReadOnly = False
    TabOrder = 8
    TextHint = 'Add Reference 2 Here...'
    Width = 259
  end
  object edValue2: TcxCalcEdit
    Left = 160
    Top = 385
    OnFocusChanged = edValue1FocusChanged
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.ReadOnly = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = edValue2PropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 7
    Width = 200
  end
  object edPayment2: TcxLookupComboBox
    Left = 160
    Top = 352
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodepayment'
    Properties.ListColumns = <
      item
        FieldName = 'namapayment'
      end>
    Properties.ListSource = dsQryPayment
    Properties.ReadOnly = False
    Properties.OnEditValueChanged = edPayment2PropertiesEditValueChanged
    TabOrder = 5
    Width = 200
  end
  object edBank2: TcxLookupComboBox
    Left = 374
    Top = 352
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodebank'
    Properties.ListColumns = <
      item
        FieldName = 'namabank'
      end>
    Properties.ListSource = dsQryBank
    Properties.ReadOnly = False
    TabOrder = 6
    Visible = False
    Width = 259
  end
  object edValGC: TcxCalcEdit
    Left = 492
    Top = 211
    OnFocusChanged = edRedeemValueFocusChanged
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = edValGCPropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 26
    Width = 223
  end
  object edNOGC: TcxTextEdit
    Left = 492
    Top = 178
    Properties.ReadOnly = False
    TabOrder = 27
    OnKeyPress = edNOGCKeyPress
    Width = 223
  end
  object btnFindGC: TcxButton
    Left = 721
    Top = 165
    Width = 83
    Height = 53
    Caption = 'Find GC'
    TabOrder = 28
    OnClick = btnFindGCClick
  end
  object cxButton2: TcxButton
    Left = 8
    Top = 250
    Width = 50
    Height = 25
    Caption = '100K'
    TabOrder = 29
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 64
    Top = 250
    Width = 50
    Height = 25
    Caption = '50K'
    TabOrder = 30
    OnClick = cxButton3Click
  end
  object cxButton4: TcxButton
    Left = 120
    Top = 250
    Width = 50
    Height = 25
    Caption = '20K'
    TabOrder = 31
    OnClick = cxButton4Click
  end
  object cxButton5: TcxButton
    Left = 315
    Top = 250
    Width = 42
    Height = 25
    Caption = 'C'
    TabOrder = 32
    OnClick = cxButton5Click
  end
  object cxButton6: TcxButton
    Left = 176
    Top = 250
    Width = 50
    Height = 25
    Caption = '10K'
    TabOrder = 33
    OnClick = cxButton6Click
  end
  object cxButton7: TcxButton
    Left = 232
    Top = 250
    Width = 50
    Height = 25
    Caption = '5K'
    TabOrder = 34
    OnClick = cxButton7Click
  end
  object cxButton8: TcxButton
    Left = 721
    Top = 224
    Width = 83
    Height = 29
    Caption = 'Clear GC'
    TabOrder = 35
    OnClick = cxButton8Click
  end
  object qryPayment: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select kodepayment, namapayment from pos_master_payment'
      'where aktif = '#39'Y'#39)
    Left = 716
    Top = 40
  end
  object dsQryPayment: TMyDataSource
    DataSet = qryPayment
    Left = 780
    Top = 40
  end
  object qryBank: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select kodebank, namabank from ben_master_bank'
      'where aktif = '#39'Y'#39' and asedc = '#39'Y'#39)
    Left = 716
    Top = 92
  end
  object dsQryBank: TMyDataSource
    DataSet = qryBank
    Left = 784
    Top = 92
  end
end
