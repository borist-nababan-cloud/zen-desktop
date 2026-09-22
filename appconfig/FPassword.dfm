object frmPassword: TfrmPassword
  Left = 0
  Top = 0
  ClientHeight = 277
  ClientWidth = 606
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 60
    Width = 50
    Height = 13
    Caption = 'User Name'
  end
  object Label2: TLabel
    Left = 40
    Top = 81
    Width = 66
    Height = 13
    Caption = 'Nama Lengkap'
  end
  object Label3: TLabel
    Left = 40
    Top = 102
    Width = 69
    Height = 13
    Caption = 'Password Lama'
  end
  object Label4: TLabel
    Left = 40
    Top = 125
    Width = 66
    Height = 13
    Caption = 'Password Baru'
  end
  object Label5: TLabel
    Left = 40
    Top = 147
    Width = 71
    Height = 13
    Caption = 'Ulang Password'
  end
  object Label6: TLabel
    Left = 40
    Top = 8
    Width = 553
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = '  PLEASE LOGIN FIRST  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Calibri'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object edUname: TcxTextEdit
    Left = 167
    Top = 57
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 250
  end
  object edNama: TcxTextEdit
    Left = 167
    Top = 78
    TabOrder = 1
    Width = 250
  end
  object edOldPass: TcxTextEdit
    Left = 167
    Top = 99
    Properties.EchoMode = eemPassword
    Properties.ReadOnly = False
    TabOrder = 2
    Width = 250
  end
  object edNewPass: TcxTextEdit
    Left = 167
    Top = 122
    Properties.EchoMode = eemPassword
    TabOrder = 3
    Width = 250
  end
  object edRetype: TcxTextEdit
    Left = 167
    Top = 144
    Properties.EchoMode = eemPassword
    TabOrder = 4
    Width = 250
  end
  object ckPassLama: TcxCheckBox
    Left = 423
    Top = 99
    Caption = 'Tampilkan Karakter'
    Properties.OnChange = ckPassLamaPropertiesChange
    TabOrder = 5
  end
  object ckPassBaru: TcxCheckBox
    Left = 423
    Top = 122
    Caption = 'Tampilkan Karakter'
    Properties.OnChange = ckPassBaruPropertiesChange
    TabOrder = 6
  end
  object ckRetype: TcxCheckBox
    Left = 423
    Top = 144
    Caption = 'Tampilkan Karakter'
    Properties.OnChange = ckRetypePropertiesChange
    TabOrder = 7
  end
  object btnUpdate: TcxButton
    Left = 128
    Top = 192
    Width = 125
    Height = 57
    Caption = 'UPDATE'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 8
    OnClick = btnUpdateClick
  end
  object btnCancel: TcxButton
    Left = 292
    Top = 192
    Width = 125
    Height = 57
    Caption = 'CANCEL'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 9
  end
end
