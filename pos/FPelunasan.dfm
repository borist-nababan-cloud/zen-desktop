object frmPelunasan: TfrmPelunasan
  Left = 258
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 532
  ClientWidth = 1008
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1008
    532)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 12
    Top = 210
    Width = 42
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Trans ID'
    Transparent = True
  end
  object Label2: TLabel
    Left = 12
    Top = 234
    Width = 39
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Tanggal'
    Transparent = True
  end
  object Label3: TLabel
    Left = 12
    Top = 258
    Width = 57
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Start Time'
    Transparent = True
  end
  object Label5: TLabel
    Left = 12
    Top = 282
    Width = 67
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'ID Members'
    Transparent = True
  end
  object Label6: TLabel
    Left = 12
    Top = 306
    Width = 89
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Nama Customer'
    Transparent = True
  end
  object Label7: TLabel
    Left = 12
    Top = 330
    Width = 69
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Payment Via'
    Transparent = True
  end
  object Label8: TLabel
    Left = 12
    Top = 378
    Width = 71
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Point Saat Ini'
    Transparent = True
  end
  object Label9: TLabel
    Left = 12
    Top = 354
    Width = 104
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Payment Referensi'
    Transparent = True
  end
  object Label10: TLabel
    Left = 12
    Top = 402
    Width = 74
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Tambah Point'
    Transparent = True
  end
  object Label11: TLabel
    Left = 463
    Top = 234
    Width = 95
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Discount Amount'
    Transparent = True
  end
  object Label12: TLabel
    Left = 495
    Top = 258
    Width = 59
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Discount %'
    Transparent = True
  end
  object Label13: TLabel
    Left = 511
    Top = 210
    Width = 46
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'SubTotal'
    Transparent = True
  end
  object Label14: TLabel
    Left = 447
    Top = 342
    Width = 80
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = 'Grand Total'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label16: TLabel
    Left = 520
    Top = 306
    Width = 34
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'TOTAL'
    Transparent = True
  end
  object Label17: TLabel
    Left = 447
    Top = 370
    Width = 86
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = 'Pembayaran'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label18: TLabel
    Left = 447
    Top = 398
    Width = 72
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = 'Kembalian'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label20: TLabel
    Left = 12
    Top = 450
    Width = 52
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Sisa Point'
    Transparent = True
  end
  object lblCustomer: TLabel
    Left = 208
    Top = 282
    Width = 9
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = '...'
  end
  object Label15: TLabel
    Left = 12
    Top = 426
    Width = 70
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Kurang Point'
    Transparent = True
  end
  object Label4: TLabel
    Left = 1
    Top = 474
    Width = 429
    Height = 23
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Gunakan Control (CTRL) Untuk Shortcut'
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object lblCecker: TLabel
    Left = 364
    Top = 12
    Width = 30
    Height = 24
    Caption = '      '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label19: TLabel
    Left = 488
    Top = 281
    Width = 66
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Pembulatan'
    Transparent = True
  end
  object edTransIDPayment: TcxTextEdit
    Left = 116
    Top = 206
    Anchors = [akLeft, akBottom]
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 200
  end
  object edTanggalPayment: TcxDateEdit
    Left = 116
    Top = 230
    Anchors = [akLeft, akBottom]
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 200
  end
  object edStartPayment: TcxTimeEdit
    Left = 116
    Top = 254
    Anchors = [akLeft, akBottom]
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 4
    Width = 200
  end
  object edNamaCustomerPayment: TcxTextEdit
    Left = 116
    Top = 302
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecUpperCase
    TabOrder = 7
    Width = 200
  end
  object edPayment: TcxLookupComboBox
    Left = 116
    Top = 326
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecUpperCase
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'nama_payment'
    Properties.ListColumns = <
      item
        FieldName = 'nama_payment'
      end>
    Properties.OnChange = edPaymentPropertiesChange
    TabOrder = 8
    Width = 200
  end
  object edPointPayment: TcxCalcEdit
    Left = 116
    Top = 374
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 12
    Width = 201
  end
  object edGrandTotalPayment: TcxCalcEdit
    Left = 559
    Top = 338
    Anchors = [akLeft, akBottom]
    EditValue = 0
    ParentFont = False
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 20
    Width = 193
  end
  object edReferansi: TcxTextEdit
    Left = 116
    Top = 350
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecUpperCase
    TabOrder = 11
    OnClick = edReferansiClick
    Width = 200
  end
  object edTambahPoint: TcxCalcEdit
    Left = 116
    Top = 398
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 13
    Width = 201
  end
  object edDiscAmount: TcxCalcEdit
    Left = 559
    Top = 230
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.UseThousandSeparator = True
    Properties.OnChange = edDiscAmountPropertiesChange
    Properties.OnValidate = edDiscAmountPropertiesValidate
    TabOrder = 17
    Width = 200
  end
  object edDiscPercent: TcxCalcEdit
    Left = 559
    Top = 254
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.UseThousandSeparator = True
    Properties.OnChange = edDiscPercentPropertiesChange
    Properties.OnValidate = edDiscPercentPropertiesValidate
    TabOrder = 18
    Width = 200
  end
  object edSubtotalPayment: TcxCalcEdit
    Left = 559
    Top = 206
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 16
    Width = 200
  end
  object cxCheckBox1: TcxCheckBox
    Left = 775
    Top = 206
    Anchors = [akLeft, akBottom]
    Caption = 'Tax'
    Properties.ReadOnly = True
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsGrayed
    TabOrder = 25
    Visible = False
  end
  object btnRedeem: TcxButton
    Left = 322
    Top = 333
    Width = 112
    Height = 45
    Hint = 'CTRL + R'
    Anchors = [akLeft, akBottom]
    Caption = 'Redeem Point (R)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Visible = False
    OnClick = btnRedeemClick
  end
  object btnPay: TcxButton
    Left = 468
    Top = 448
    Width = 173
    Height = 61
    Hint = 'CTRL + P'
    Anchors = [akLeft, akBottom]
    Caption = 'PAY (P)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnPayClick
  end
  object edTotalPayment: TcxCalcEdit
    Left = 559
    Top = 302
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 19
    Width = 200
  end
  object edBayarPayment: TcxCalcEdit
    Left = 559
    Top = 366
    Anchors = [akLeft, akBottom]
    EditValue = 0
    ParentFont = False
    Properties.ImmediatePost = True
    Properties.UseThousandSeparator = True
    Properties.OnChange = edBayarPaymentPropertiesChange
    Properties.OnValidate = edBayarPaymentPropertiesValidate
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 21
    Width = 193
  end
  object edKembalianPayment: TcxCalcEdit
    Left = 559
    Top = 394
    Anchors = [akLeft, akBottom]
    EditValue = 0
    ParentFont = False
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 22
    Width = 193
  end
  object edSisaPoint: TcxCalcEdit
    Left = 116
    Top = 446
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 15
    Width = 201
  end
  object btnCheckP: TcxButton
    Left = 322
    Top = 271
    Width = 105
    Height = 25
    Hint = 'CTRL + T'
    Anchors = [akLeft, akBottom]
    Caption = 'Check Point (Z)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnCheckPClick
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 64
    Width = 995
    Height = 121
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 26
    LookAndFeel.Kind = lfOffice11
    object gtvPayment: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          OnGetText = gtvPaymentTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText
          Column = gtvPaymentSubtotal
        end
        item
          Kind = skSum
          OnGetText = gtvPaymentTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText
          Column = gtvPaymentPoint
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtvPaymentNama: TcxGridColumn
        Caption = 'Customer'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 99
      end
      object gtvPaymentRoomID: TcxGridColumn
        Caption = 'Room'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 79
      end
      object gtvPaymentTherapistID: TcxGridColumn
        Caption = 'ID TR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 88
      end
      object gtvPaymentTransType: TcxGridColumn
        Caption = 'Type'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object gtvPaymentNamaJasa: TcxGridColumn
        Caption = 'Jasa / Product'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 159
      end
      object gtvPaymentHarga: TcxGridColumn
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        HeaderAlignmentHorz = taCenter
      end
      object gtvPaymentQty: TcxGridColumn
        Caption = 'Qty'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        HeaderAlignmentHorz = taCenter
        Width = 78
      end
      object gtvPaymentSubtotal: TcxGridColumn
        Caption = 'Subtotal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        HeaderAlignmentHorz = taCenter
        Width = 118
      end
      object gtvPaymentTransID: TcxGridColumn
        Caption = 'Transaksi'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 137
      end
      object gtvPaymentPoint: TcxGridColumn
        Caption = 'Point'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvPayment
    end
  end
  object btnMerge: TcxButton
    Left = 4
    Top = 4
    Width = 197
    Height = 49
    Hint = 'CTRL + F'
    Caption = 'FIND (F)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnMergeClick
  end
  object edKurangPoint: TcxCalcEdit
    Left = 116
    Top = 422
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 14
    Width = 201
  end
  object edIDCustomerPayment: TcxTextEdit
    Left = 116
    Top = 278
    Anchors = [akLeft, akBottom]
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    Properties.ValidateOnEnter = True
    Properties.OnChange = edIDCustomerPaymentPropertiesChange
    Properties.OnValidate = edIDCustomerPaymentPropertiesValidate
    TabOrder = 5
    OnKeyPress = edIDCustomerPaymentKeyPress
    Width = 89
  end
  object btnDelete: TcxButton
    Left = 204
    Top = 3
    Width = 145
    Height = 49
    Hint = 'CTRL + D'
    Caption = 'Delete Selected (D)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnDeleteClick
  end
  object btnCancelP: TcxButton
    Left = 647
    Top = 450
    Width = 105
    Height = 61
    Hint = 'CTRL + C'
    Anchors = [akLeft, akBottom]
    Caption = 'CANCEL (X)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    OnClick = btnCancelPClick
  end
  object btnCeckGC: TcxButton
    Left = 322
    Top = 381
    Width = 112
    Height = 45
    Hint = 'CTRL + G'
    Anchors = [akLeft, akBottom]
    Caption = 'Check GC (G)'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 10
    Visible = False
    OnClick = btnCeckGCClick
  end
  object btnMemberTrans: TcxButton
    Left = 322
    Top = 302
    Width = 105
    Height = 31
    Hint = 'CTRL + T'
    Anchors = [akLeft, akBottom]
    Caption = 'Trans Member'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
    OnClick = btnMemberTransClick
  end
  object edPembulatan: TcxCalcEdit
    Left = 559
    Top = 278
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 28
    Width = 200
  end
  object appEven: TApplicationEvents
    OnShortCut = appEvenShortCut
    Left = 852
    Top = 4
  end
  object dbOnline: TMyConnection
    Left = 892
    Top = 292
  end
  object ServerSearch: TMyQuery
    Connection = dbOnline
    Left = 888
    Top = 240
  end
  object ServerExec: TMyQuery
    Connection = dbOnline
    Left = 960
    Top = 296
  end
  object ServerCari: TMyQuery
    Connection = dbOnline
    Left = 956
    Top = 240
  end
  object PrintMaster: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans_payment where id_payment = '#39'X'#39)
    Left = 856
    Top = 428
  end
  object dsPrintMaster: TMyDataSource
    DataSet = PrintMaster
    Left = 856
    Top = 488
  end
  object PrintDetail: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans_detail where payment_id = '#39'X'#39)
    Left = 952
    Top = 428
  end
  object dsPrintDetail: TMyDataSource
    DataSet = PrintDetail
    Left = 952
    Top = 488
  end
  object qryGCDetail: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans_payment where id_payment = '#39'X'#39)
    Left = 780
    Top = 416
  end
  object dsqryGCDetail: TMyDataSource
    DataSet = qryGCDetail
    Left = 780
    Top = 476
  end
end
