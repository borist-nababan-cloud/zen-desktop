object frmDevAppSetUp: TfrmDevAppSetUp
  Left = 339
  Top = 207
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Device Application SetUp'
  ClientHeight = 313
  ClientWidth = 405
  Color = 16311513
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 381
    Height = 21
    AutoSize = False
    Caption = ' Serial Port Configuration'
    Color = 16766421
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 40
    Top = 232
    Width = 193
    Height = 21
    AutoSize = False
    Caption = 'Select connected Device to Serial Port '
    Transparent = True
    Layout = tlCenter
  end
  object Bevel1: TBevel
    Left = 48
    Top = 260
    Width = 345
    Height = 9
    Shape = bsBottomLine
  end
  object Label3: TLabel
    Left = 12
    Top = 262
    Width = 35
    Height = 10
    Caption = 'SimSCAN '
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object rgParity: TRadioGroup
    Left = 40
    Top = 36
    Width = 89
    Height = 189
    Caption = ' Parity '
    ItemIndex = 0
    Items.Strings = (
      'None'
      'Odd'
      'Space'
      'Even'
      'Mark')
    TabOrder = 0
  end
  object rgDataBits: TRadioGroup
    Left = 136
    Top = 36
    Width = 89
    Height = 93
    Caption = ' Data Bits '
    ItemIndex = 1
    Items.Strings = (
      '7'
      '8')
    TabOrder = 1
  end
  object rgStopBits: TRadioGroup
    Left = 136
    Top = 132
    Width = 89
    Height = 93
    Caption = ' Stop Bits '
    ItemIndex = 0
    Items.Strings = (
      '1.0'
      '1.5'
      '2.0')
    TabOrder = 2
  end
  object rgSpeed: TRadioGroup
    Left = 232
    Top = 36
    Width = 161
    Height = 189
    Caption = ' Speed '
    Columns = 2
    ItemIndex = 2
    Items.Strings = (
      '300'
      '600'
      '1200'
      '2400'
      '4800'
      '9600'
      '14400'
      '19200'
      '38400'
      '57600'
      '115200')
    TabOrder = 3
  end
  object cbPortCOM: TComboBox
    Left = 232
    Top = 232
    Width = 161
    Height = 21
    TabOrder = 4
  end
  object btnOK: TButton
    Left = 240
    Top = 276
    Width = 73
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 5
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 320
    Top = 276
    Width = 73
    Height = 25
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = btnCancelClick
  end
end
