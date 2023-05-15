object frmConfigSetup: TfrmConfigSetup
  Left = 0
  Top = 0
  Caption = 'Application Config Setup'
  ClientHeight = 461
  ClientWidth = 812
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
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel2: TBevel
    Left = 388
    Top = 195
    Width = 357
    Height = 161
  end
  object Bevel1: TBevel
    Left = 8
    Top = 195
    Width = 369
    Height = 161
  end
  object Label1: TLabel
    Left = 20
    Top = 236
    Width = 92
    Height = 15
    Caption = 'DATABASE NAME'
  end
  object Label2: TLabel
    Left = 20
    Top = 265
    Width = 85
    Height = 15
    Caption = 'DATABASE USER'
  end
  object Label3: TLabel
    Left = 20
    Top = 207
    Width = 87
    Height = 15
    Caption = 'DATABASE HOST'
  end
  object Label4: TLabel
    Left = 20
    Top = 294
    Width = 120
    Height = 15
    Caption = 'DATABASE PASSWORD'
  end
  object Label9: TLabel
    Left = 20
    Top = 323
    Width = 87
    Height = 15
    Caption = 'DATABASE PORT'
  end
  object Label11: TLabel
    Left = 12
    Top = 178
    Width = 93
    Height = 15
    Caption = 'INTERNAL SETUP '
  end
  object Label12: TLabel
    Left = 388
    Top = 178
    Width = 91
    Height = 15
    Caption = 'EXTERNAL SETUP'
  end
  object Label13: TLabel
    Left = 12
    Top = 32
    Width = 115
    Height = 19
    Caption = 'Application Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 12
    Top = 59
    Width = 48
    Height = 19
    Caption = 'Version'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 12
    Top = 86
    Width = 52
    Height = 19
    Caption = 'Release'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 12
    Top = 109
    Width = 101
    Height = 19
    Caption = 'Legal Copyright'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 12
    Top = 140
    Width = 66
    Height = 19
    Caption = 'Developer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object lblAppName2: TLabel
    Left = 164
    Top = 32
    Width = 122
    Height = 19
    Caption = 'Application Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblVersion: TLabel
    Left = 164
    Top = 59
    Width = 50
    Height = 19
    Caption = 'Version'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblRelease: TLabel
    Left = 164
    Top = 86
    Width = 51
    Height = 19
    Caption = 'Release'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCopyright: TLabel
    Left = 164
    Top = 109
    Width = 106
    Height = 19
    Caption = 'Legal Copyright'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDeveloper: TLabel
    Left = 164
    Top = 140
    Width = 70
    Height = 19
    Caption = 'Developer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblLoader: TLabel
    Left = 314
    Top = 1
    Width = 437
    Height = 25
    AutoSize = False
    Caption = 'Please Wait, Apps is Loading Configuration...'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label5: TLabel
    Left = 398
    Top = 207
    Width = 87
    Height = 15
    Caption = 'DATABASE HOST'
  end
  object Label6: TLabel
    Left = 398
    Top = 236
    Width = 92
    Height = 15
    Caption = 'DATABASE NAME'
  end
  object Label7: TLabel
    Left = 398
    Top = 265
    Width = 85
    Height = 15
    Caption = 'DATABASE USER'
  end
  object Label8: TLabel
    Left = 398
    Top = 294
    Width = 120
    Height = 15
    Caption = 'DATABASE PASSWORD'
  end
  object Label10: TLabel
    Left = 398
    Top = 323
    Width = 87
    Height = 15
    Caption = 'DATABASE PORT'
  end
  object edNameDB: TcxTextEdit
    Left = 176
    Top = 233
    TabOrder = 1
    Width = 177
  end
  object edUserDB: TcxTextEdit
    Left = 176
    Top = 262
    TabOrder = 2
    Width = 177
  end
  object btnSave: TcxButton
    Left = 216
    Top = 370
    Width = 153
    Height = 59
    Caption = 'SAVE'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 10
    OnClick = btnSaveClick
  end
  object edHost: TcxTextEdit
    Left = 176
    Top = 204
    TabOrder = 0
    Width = 177
  end
  object edPassDB: TcxTextEdit
    Left = 176
    Top = 291
    Properties.EchoMode = eemPassword
    TabOrder = 3
    Width = 177
  end
  object edServerName: TcxTextEdit
    Left = 552
    Top = 233
    TabOrder = 6
    Width = 177
  end
  object edServerUser: TcxTextEdit
    Left = 552
    Top = 262
    TabOrder = 7
    Width = 177
  end
  object edServerHost: TcxTextEdit
    Left = 552
    Top = 204
    TabOrder = 5
    Width = 177
  end
  object edServerPass: TcxTextEdit
    Left = 552
    Top = 291
    Properties.EchoMode = eemPassword
    TabOrder = 8
    Width = 177
  end
  object edPortDB: TcxTextEdit
    Left = 176
    Top = 320
    Properties.EchoMode = eemPassword
    TabOrder = 4
    Width = 177
  end
  object edServerPort: TcxTextEdit
    Left = 552
    Top = 320
    Properties.EchoMode = eemPassword
    TabOrder = 9
    Width = 177
  end
  object btnCancel: TcxButton
    Left = 388
    Top = 370
    Width = 153
    Height = 59
    Caption = 'CANCEL'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 11
    OnClick = btnCancelClick
  end
  object lblAppName: TcxLabel
    Left = 8
    Top = 0
    AutoSize = False
    Caption = 'Application Info'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TransparentBorder = False
    Style.IsFontAssigned = True
    Properties.LineOptions.Alignment = cxllaBottom
    Properties.LineOptions.Visible = True
    Transparent = True
    Height = 26
    Width = 300
  end
  object tmrLoadCOnfig: TTimer
    Enabled = False
    OnTimer = tmrLoadCOnfigTimer
    Left = 620
    Top = 24
  end
end
