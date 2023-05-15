object frmDownloadFromFTM: TfrmDownloadFromFTM
  Left = 0
  Top = 0
  Caption = 'frmDownloadFromFTM'
  ClientHeight = 215
  ClientWidth = 338
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    338
    215)
  PixelsPerInch = 96
  TextHeight = 15
  object Label4: TLabel
    Left = 0
    Top = -4
    Width = 336
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Download From FTM'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 833
  end
  object Label1: TLabel
    Left = 16
    Top = 78
    Width = 62
    Height = 15
    Caption = 'Select Date'
  end
  object Label2: TLabel
    Left = 16
    Top = 36
    Width = 36
    Height = 15
    Caption = 'Label2'
  end
  object edTanggal: TcxDateEdit
    Left = 84
    Top = 75
    EditValue = 0d
    TabOrder = 0
    Width = 121
  end
  object btnKonek: TButton
    Left = 204
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = btnKonekClick
  end
  object edDbName: TEdit
    Left = 72
    Top = 33
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'ftm'
  end
  object Button1: TButton
    Left = 32
    Top = 108
    Width = 121
    Height = 41
    Caption = 'Download Data'
    TabOrder = 3
    OnClick = Button1Click
  end
  object pbLoader: TcxProgressBar
    Left = 16
    Top = 155
    TabOrder = 4
    Visible = False
    Width = 263
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 236
    Top = 72
  end
  object dbFtm: TMyConnection
    LoginPrompt = False
    Left = 248
    Top = 124
  end
end
