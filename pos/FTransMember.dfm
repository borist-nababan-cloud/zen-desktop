object frmTransMember: TfrmTransMember
  Left = 0
  Top = 0
  Caption = 'TRANSAKSI POINT MEMBER'
  ClientHeight = 505
  ClientWidth = 930
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  DesignSize = (
    930
    505)
  PixelsPerInch = 96
  TextHeight = 15
  object lblCecker: TLabel
    Left = 17
    Top = 32
    Width = 18
    Height = 26
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 106
    Width = 83
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Nama Member'
    Transparent = True
  end
  object Label7: TLabel
    Left = 16
    Top = 130
    Width = 69
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Payment Via'
    Transparent = True
  end
  object Label8: TLabel
    Left = 16
    Top = 178
    Width = 71
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Point Saat Ini'
    Transparent = True
  end
  object Label9: TLabel
    Left = 16
    Top = 154
    Width = 104
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Payment Referensi'
    Transparent = True
  end
  object Label10: TLabel
    Left = 16
    Top = 202
    Width = 74
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Tambah Point'
    Transparent = True
  end
  object Label20: TLabel
    Left = 16
    Top = 250
    Width = 52
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Sisa Point'
    Transparent = True
  end
  object Label15: TLabel
    Left = 16
    Top = 226
    Width = 70
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Kurang Point'
    Transparent = True
  end
  object Label11: TLabel
    Left = 16
    Top = 302
    Width = 95
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Discount Amount'
    Transparent = True
  end
  object Label12: TLabel
    Left = 16
    Top = 326
    Width = 59
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Discount %'
    Transparent = True
  end
  object Label13: TLabel
    Left = 16
    Top = 278
    Width = 46
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'SubTotal'
    Transparent = True
  end
  object Label14: TLabel
    Left = 351
    Top = 104
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
    Left = 16
    Top = 350
    Width = 34
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'TOTAL'
    Transparent = True
  end
  object Label17: TLabel
    Left = 351
    Top = 132
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
    Left = 351
    Top = 160
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
  object Label1: TLabel
    Left = 17
    Top = 82
    Width = 90
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Nomor Member'
    Transparent = True
  end
  object btnCek: TButton
    Left = 672
    Top = 108
    Width = 75
    Height = 25
    Caption = 'btnCek'
    TabOrder = 0
  end
  object edNamaCustomerPayment: TcxTextEdit
    Left = 132
    Top = 103
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Width = 200
  end
  object edPayment: TcxLookupComboBox
    Left = 132
    Top = 127
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecUpperCase
    Properties.KeyFieldNames = 'nama_payment'
    Properties.ListColumns = <
      item
        FieldName = 'nama_payment'
      end>
    TabOrder = 2
    Width = 200
  end
  object edPointPayment: TcxCalcEdit
    Left = 132
    Top = 175
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 3
    Width = 201
  end
  object edReferansi: TcxTextEdit
    Left = 132
    Top = 151
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 200
  end
  object edTambahPoint: TcxCalcEdit
    Left = 132
    Top = 199
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 5
    Width = 201
  end
  object edSisaPoint: TcxCalcEdit
    Left = 132
    Top = 247
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 6
    Width = 201
  end
  object edKurangPoint: TcxCalcEdit
    Left = 132
    Top = 223
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 7
    Width = 201
  end
  object edGrandTotalPayment: TcxCalcEdit
    Left = 463
    Top = 100
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
    TabOrder = 8
    Width = 193
  end
  object edDiscAmount: TcxCalcEdit
    Left = 133
    Top = 299
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.UseThousandSeparator = True
    TabOrder = 9
    Width = 200
  end
  object edDiscPercent: TcxCalcEdit
    Left = 133
    Top = 323
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.UseThousandSeparator = True
    TabOrder = 10
    Width = 200
  end
  object edSubtotalPayment: TcxCalcEdit
    Left = 133
    Top = 275
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 11
    Width = 200
  end
  object cxCheckBox1: TcxCheckBox
    Left = 133
    Top = 371
    Anchors = [akLeft, akBottom]
    Caption = 'Tax'
    Properties.ReadOnly = True
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsGrayed
    TabOrder = 12
    Visible = False
  end
  object edTotalPayment: TcxCalcEdit
    Left = 133
    Top = 347
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 13
    Width = 200
  end
  object edBayarPayment: TcxCalcEdit
    Left = 463
    Top = 128
    Anchors = [akLeft, akBottom]
    EditValue = 0
    ParentFont = False
    Properties.ImmediatePost = True
    Properties.UseThousandSeparator = True
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 14
    Width = 193
  end
  object edKembalianPayment: TcxCalcEdit
    Left = 463
    Top = 156
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
    TabOrder = 15
    Width = 193
  end
  object edNomorKartu: TcxTextEdit
    Left = 133
    Top = 79
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecUpperCase
    TabOrder = 16
    Width = 200
  end
  object Timer1: TTimer
    Left = 376
    Top = 40
  end
end
