object frmLogin: TfrmLogin
  Left = 376
  Top = 250
  ClientHeight = 236
  ClientWidth = 582
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 29
  object Label1: TLabel
    Left = 24
    Top = 20
    Width = 65
    Height = 29
    Caption = 'NAMA'
    Transparent = True
  end
  object Label2: TLabel
    Left = 24
    Top = 60
    Width = 111
    Height = 29
    Caption = 'PASSWORD'
    Transparent = True
  end
  object cxTextEdit1: TcxTextEdit
    Left = 232
    Top = 16
    Enabled = False
    TabOrder = 0
    Width = 250
  end
  object cxTextEdit2: TcxTextEdit
    Left = 232
    Top = 56
    Enabled = False
    TabOrder = 1
    Width = 250
  end
  object cxButton1: TcxButton
    Left = 176
    Top = 104
    Width = 113
    Height = 49
    Caption = 'OK'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 304
    Top = 104
    Width = 113
    Height = 49
    Caption = 'CANCEL'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object pbCurrTask: TcxProgressBar
    Left = 112
    Top = 164
    Properties.BarStyle = cxbsLEDs
    Properties.OverloadValue = 100.000000000000000000
    Properties.PeakValue = 100.000000000000000000
    Properties.ShowText = False
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 4
    Width = 397
  end
end
