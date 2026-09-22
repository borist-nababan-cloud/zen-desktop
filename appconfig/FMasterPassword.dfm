object frmMasterPassword: TfrmMasterPassword
  Left = 0
  Top = 0
  Caption = '  Master Password'
  ClientHeight = 237
  ClientWidth = 635
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
    635
    237)
  PixelsPerInch = 96
  TextHeight = 19
  object lblJudulAtas: TLabel
    Left = 4
    Top = 8
    Width = 623
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '   Master Password'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label1: TLabel
    Left = 8
    Top = 52
    Width = 149
    Height = 19
    Caption = 'PoS Added Discount '
  end
  object Label2: TLabel
    Left = 8
    Top = 81
    Width = 128
    Height = 19
    Caption = 'Main Mail Account'
  end
  object Label3: TLabel
    Left = 8
    Top = 110
    Width = 138
    Height = 19
    Caption = 'Main Mail Password'
  end
  object edDiscAdd: TcxTextEdit
    Left = 176
    Top = 49
    Properties.CharCase = ecLowerCase
    Properties.EchoMode = eemPassword
    TabOrder = 0
    TextHint = 'Type Password Here...'
    Width = 329
  end
  object btnSimpan: TcxButton
    Left = 176
    Top = 160
    Width = 145
    Height = 57
    Caption = 'Save'
    TabOrder = 1
    OnClick = btnSimpanClick
  end
  object memStruktur: TMemo
    Left = 434
    Top = 148
    Width = 185
    Height = 69
    Lines.Strings = (
      'CREATE TABLE `ben_master_password` ('
      '  `autonum` int(11) NOT NULL AUTO_INCREMENT,'
      '  `moduleinfo` varchar(255) DEFAULT NULL,'
      '  `passkey` varchar(50) DEFAULT NULL,'
      '  `lastedituser` varchar(30) DEFAULT NULL,'
      '  `lasteditdate` datetime DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM DEFAULT CHARSET=latin1;')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 2
    Visible = False
  end
  object ckShowDiscPass: TcxCheckBox
    Left = 511
    Top = 49
    Caption = 'Show Char'
    Properties.OnEditValueChanged = ckShowPropertiesEditValueChanged
    TabOrder = 3
  end
  object edMainMail: TcxTextEdit
    Left = 176
    Top = 78
    Properties.CharCase = ecLowerCase
    TabOrder = 4
    TextHint = 'Type Main Mail Account ...'
    Width = 329
  end
  object ckShowMailPass: TcxCheckBox
    Left = 511
    Top = 106
    Caption = 'Show Char'
    Properties.OnEditValueChanged = cxCheckBox1PropertiesEditValueChanged
    TabOrder = 5
  end
  object edMailPass: TcxTextEdit
    Left = 176
    Top = 107
    Properties.EchoMode = eemPassword
    TabOrder = 6
    TextHint = 'Type Main Mail Password Here...'
    Width = 329
  end
end
