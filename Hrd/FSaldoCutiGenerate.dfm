object frmSaldoCutiGenerate: TfrmSaldoCutiGenerate
  Left = 0
  Top = 0
  Caption = '  Generate Saldo Cuti'
  ClientHeight = 525
  ClientWidth = 551
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    551
    525)
  PixelsPerInch = 96
  TextHeight = 18
  object Label4: TLabel
    Left = 4
    Top = 4
    Width = 539
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Generate Saldo Cuti'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 906
  end
  object Label5: TLabel
    Left = 24
    Top = 58
    Width = 37
    Height = 18
    Caption = 'Tahun'
  end
  object Label1: TLabel
    Left = 24
    Top = 90
    Width = 66
    Height = 18
    Caption = 'Nilai Saldo'
  end
  object Label2: TLabel
    Left = 240
    Top = 90
    Width = 25
    Height = 18
    Caption = 'Hari'
  end
  object edTahun: TComboBox
    Left = 104
    Top = 55
    Width = 257
    Height = 26
    TabOrder = 0
    Items.Strings = (
      '2017'
      '2018'
      '2019'
      '2020'
      '2021')
  end
  object edJumlah: TcxCalcEdit
    Left = 104
    Top = 87
    EditValue = 0.000000000000000000
    TabOrder = 1
    Width = 121
  end
  object btnGenerate: TcxButton
    Left = 24
    Top = 132
    Width = 145
    Height = 53
    Caption = 'Generate'
    TabOrder = 2
    OnClick = btnGenerateClick
  end
  object btnClose: TcxButton
    Left = 216
    Top = 132
    Width = 145
    Height = 53
    Caption = 'Close'
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object progressBar1: TcxProgressBar
    Left = 24
    Top = 191
    TabOrder = 4
    Width = 519
  end
  object memProgress: TcxMemo
    Left = 24
    Top = 228
    Anchors = [akLeft, akTop, akBottom]
    Properties.ReadOnly = True
    Properties.ScrollBars = ssBoth
    Style.BorderColor = clBlack
    StyleDisabled.BorderColor = clBlack
    StyleDisabled.Color = clWhite
    StyleDisabled.TextColor = clBlue
    TabOrder = 5
    Height = 289
    Width = 519
  end
end
