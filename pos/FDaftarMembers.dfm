object frmDaftarMembers: TfrmDaftarMembers
  Left = 616
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 617
  ClientWidth = 386
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 44
    Width = 78
    Height = 19
    Caption = 'Scan di Sini'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 20
    Top = 92
    Width = 80
    Height = 15
    Caption = 'Tanggal Daftar'
    Transparent = True
  end
  object Label3: TLabel
    Left = 16
    Top = 116
    Width = 86
    Height = 15
    Caption = 'Tanggal Expired'
    Transparent = True
  end
  object Label4: TLabel
    Left = 24
    Top = 140
    Width = 79
    Height = 15
    Caption = 'Nama Lengkap'
    Transparent = True
  end
  object Label5: TLabel
    Left = 60
    Top = 164
    Width = 39
    Height = 15
    Caption = 'Alamat'
    Transparent = True
  end
  object Label6: TLabel
    Left = 60
    Top = 256
    Width = 39
    Height = 15
    Caption = 'ID Type'
    Transparent = True
  end
  object Label7: TLabel
    Left = 44
    Top = 284
    Width = 56
    Height = 15
    Caption = 'ID Identity'
    Transparent = True
  end
  object Label8: TLabel
    Left = 32
    Top = 308
    Width = 70
    Height = 15
    Caption = 'Tempat Lahir'
    Transparent = True
  end
  object Label9: TLabel
    Left = 28
    Top = 332
    Width = 73
    Height = 15
    Caption = 'Tanggal Lahir'
    Transparent = True
  end
  object Label10: TLabel
    Left = 28
    Top = 356
    Width = 75
    Height = 15
    Caption = 'Jenis Kelamin'
    Transparent = True
  end
  object Label11: TLabel
    Left = 60
    Top = 380
    Width = 40
    Height = 15
    Caption = 'Staff ID'
    Transparent = True
  end
  object Label12: TLabel
    Left = 68
    Top = 404
    Width = 31
    Height = 15
    Caption = 'Notes'
    Transparent = True
  end
  object Label13: TLabel
    Left = 72
    Top = 428
    Width = 29
    Height = 15
    Caption = 'Point'
    Transparent = True
  end
  object Label14: TLabel
    Left = 24
    Top = 452
    Width = 78
    Height = 15
    Caption = 'Members Type'
    Transparent = True
  end
  object Label15: TLabel
    Left = 52
    Top = 68
    Width = 48
    Height = 15
    Caption = 'No Kartu'
    Transparent = True
  end
  object Label16: TLabel
    Left = 36
    Top = 476
    Width = 66
    Height = 15
    Caption = 'No Telepone'
    Transparent = True
  end
  object Label17: TLabel
    Left = 16
    Top = 500
    Width = 84
    Height = 15
    Caption = 'No. Handphone'
    Transparent = True
  end
  object Label18: TLabel
    Left = 4
    Top = 4
    Width = 349
    Height = 23
    AutoSize = False
    Caption = 'Detail Members'
    Color = clBtnText
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object edIDMembers: TcxTextEdit
    Left = 104
    Top = 40
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    Properties.ReadOnly = True
    Properties.OnChange = edIDMembersPropertiesChange
    Properties.OnValidate = edIDMembersPropertiesValidate
    TabOrder = 0
    Width = 250
  end
  object edTglDaftar: TcxDateEdit
    Left = 104
    Top = 88
    EditValue = 0d
    TabOrder = 1
    Width = 250
  end
  object edTglExpired: TcxDateEdit
    Left = 104
    Top = 112
    EditValue = 0d
    TabOrder = 2
    Width = 250
  end
  object edNama: TcxTextEdit
    Left = 104
    Top = 136
    Properties.CharCase = ecUpperCase
    TabOrder = 3
    Width = 250
  end
  object edAlamat: TcxMemo
    Left = 104
    Top = 160
    Lines.Strings = (
      '(NONE)')
    Properties.CharCase = ecUpperCase
    Properties.ScrollBars = ssBoth
    TabOrder = 4
    Height = 93
    Width = 250
  end
  object edIDType: TcxComboBox
    Left = 104
    Top = 256
    Properties.CharCase = ecUpperCase
    Properties.Items.Strings = (
      'KTP'
      'SIM'
      'PASPOR')
    TabOrder = 5
    Text = 'KTP'
    Width = 250
  end
  object edNoID: TcxTextEdit
    Left = 104
    Top = 280
    Properties.CharCase = ecUpperCase
    TabOrder = 6
    Width = 250
  end
  object edTempatLahir: TcxTextEdit
    Left = 104
    Top = 304
    Properties.CharCase = ecUpperCase
    TabOrder = 7
    Width = 250
  end
  object edTglLahir: TcxDateEdit
    Left = 104
    Top = 328
    EditValue = 0d
    TabOrder = 8
    Width = 250
  end
  object edJenisKelamin: TcxComboBox
    Left = 104
    Top = 352
    Properties.CharCase = ecUpperCase
    Properties.Items.Strings = (
      'L'
      'P')
    TabOrder = 9
    Text = 'L'
    Width = 250
  end
  object edStaff: TcxTextEdit
    Left = 104
    Top = 376
    Properties.CharCase = ecUpperCase
    TabOrder = 10
    Width = 250
  end
  object edPoint: TcxCalcEdit
    Left = 104
    Top = 424
    EditValue = 0
    Properties.ReadOnly = True
    TabOrder = 11
    Width = 250
  end
  object edNotes: TcxTextEdit
    Left = 104
    Top = 400
    Properties.CharCase = ecUpperCase
    TabOrder = 12
    Width = 250
  end
  object edMembersType: TcxComboBox
    Left = 104
    Top = 448
    Properties.CharCase = ecUpperCase
    Properties.Items.Strings = (
      'PERSONAL'
      'PARTNER')
    TabOrder = 13
    Text = 'PERSONAL'
    Width = 250
  end
  object edNoKartu: TcxTextEdit
    Left = 104
    Top = 64
    Properties.ReadOnly = True
    TabOrder = 14
    Width = 250
  end
  object edTelepon: TcxTextEdit
    Left = 104
    Top = 472
    Properties.CharCase = ecUpperCase
    TabOrder = 15
    Width = 250
  end
  object edHandphone: TcxTextEdit
    Left = 104
    Top = 496
    Properties.CharCase = ecUpperCase
    TabOrder = 16
    Width = 250
  end
  object btnSave: TcxButton
    Left = 112
    Top = 552
    Width = 93
    Height = 45
    Caption = 'SAVE'
    TabOrder = 17
    OnClick = btnSaveClick
    LookAndFeel.Kind = lfOffice11
  end
  object btnCancel: TcxButton
    Left = 208
    Top = 552
    Width = 93
    Height = 45
    Caption = 'Cancel'
    TabOrder = 18
    OnClick = btnCancelClick
    LookAndFeel.Kind = lfOffice11
  end
end
