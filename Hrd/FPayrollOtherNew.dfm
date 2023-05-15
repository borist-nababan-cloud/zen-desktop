object frmPayrollOtherNew: TfrmPayrollOtherNew
  Left = 0
  Top = 0
  ClientHeight = 216
  ClientWidth = 450
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    450
    216)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = 0
    Width = 444
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Transaksi Tambahan Payroll'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 521
  end
  object Label3: TLabel
    Left = 8
    Top = 35
    Width = 41
    Height = 16
    Caption = 'BULAN'
  end
  object Label4: TLabel
    Left = 8
    Top = 65
    Width = 42
    Height = 16
    Caption = 'TAHUN'
  end
  object Label2: TLabel
    Left = 8
    Top = 95
    Width = 82
    Height = 16
    Caption = 'KETERANGAN'
  end
  object edBulanNew: TComboBox
    Left = 100
    Top = 32
    Width = 229
    Height = 24
    TabOrder = 0
    Items.Strings = (
      'JANUARI'
      'FEBRUARI'
      'MARET'
      'APRIL'
      'MEI'
      'JUNI'
      'JULI'
      'AGUSTUS'
      'SEPTEMBER'
      'OKTOBER'
      'NOVEMBER'
      'DESEMBER')
  end
  object edTahunNew: TComboBox
    Left = 100
    Top = 62
    Width = 229
    Height = 24
    TabOrder = 1
    Items.Strings = (
      '2017'
      '2018'
      '2019'
      '2020')
  end
  object edKeterangan: TEdit
    Left = 100
    Top = 92
    Width = 342
    Height = 24
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object Button1: TButton
    Left = 108
    Top = 152
    Width = 121
    Height = 39
    Caption = 'New'
    TabOrder = 3
    OnClick = Button1Click
  end
  object edPeriodeNew: TEdit
    Left = 100
    Top = 122
    Width = 229
    Height = 24
    ReadOnly = True
    TabOrder = 4
  end
end
