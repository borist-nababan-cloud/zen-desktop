object frmChangeJadwal: TfrmChangeJadwal
  Left = 485
  Top = 185
  ClientHeight = 495
  ClientWidth = 547
  Color = clMoneyGreen
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    547
    495)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 12
    Top = 112
    Width = 111
    Height = 15
    Caption = 'Pilih Tanggal Masuk'
    Transparent = True
  end
  object Label4: TLabel
    Left = 13
    Top = 268
    Width = 61
    Height = 15
    Caption = 'Jam Masuk'
    Transparent = True
  end
  object Label5: TLabel
    Left = 13
    Top = 316
    Width = 60
    Height = 15
    Caption = 'Jam Keluar'
    Transparent = True
  end
  object Label6: TLabel
    Left = 13
    Top = 244
    Width = 82
    Height = 15
    Caption = 'Tanggal Masuk'
    Transparent = True
  end
  object Label7: TLabel
    Left = 13
    Top = 292
    Width = 81
    Height = 15
    Caption = 'Tanggal Keluar'
    Transparent = True
  end
  object Label13: TLabel
    Left = 8
    Top = 37
    Width = 215
    Height = 19
    Caption = 'Quick Search ID Karyawan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 497
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Input Ganti Jadwal Harian'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 581
  end
  object Label8: TLabel
    Left = 9
    Top = 156
    Width = 85
    Height = 15
    Caption = 'Kode Karyawan'
  end
  object Label9: TLabel
    Left = 9
    Top = 184
    Width = 73
    Height = 15
    Caption = 'ID  Karyawan'
  end
  object Label10: TLabel
    Left = 9
    Top = 214
    Width = 93
    Height = 15
    Caption = 'Nama  Karyawan'
  end
  object edSelectDate: TcxDateEdit
    Left = 128
    Top = 108
    EditValue = 0d
    TabOrder = 0
    Width = 145
  end
  object edJamMasuk: TcxTimeEdit
    Left = 105
    Top = 264
    EditValue = 0
    TabOrder = 3
    Width = 145
  end
  object edJamKeluar: TcxTimeEdit
    Left = 105
    Top = 312
    EditValue = 0
    TabOrder = 5
    Width = 121
  end
  object cxButton1: TcxButton
    Left = 288
    Top = 103
    Width = 85
    Height = 33
    Caption = 'Check Jadwal'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object edTanggalMasuk: TcxDateEdit
    Left = 105
    Top = 240
    EditValue = 0d
    TabOrder = 2
    Width = 145
  end
  object edTanggalKeluar: TcxDateEdit
    Left = 105
    Top = 288
    EditValue = 0d
    TabOrder = 4
    Width = 145
  end
  object btnChange: TcxButton
    Left = 13
    Top = 344
    Width = 237
    Height = 49
    Caption = 'Change'
    Enabled = False
    LookAndFeel.Kind = lfOffice11
    TabOrder = 6
    OnClick = btnChangeClick
  end
  object edQuickSearch: TcxTextEdit
    Left = 8
    Top = 58
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 7
    TextHint = 'Type ID Karyawan and Press Enter'
    OnKeyPress = edQuickSearchKeyPress
    Width = 382
  end
  object edKode: TEdit
    Left = 133
    Top = 153
    Width = 257
    Height = 23
    ReadOnly = True
    TabOrder = 8
  end
  object edID: TEdit
    Left = 133
    Top = 183
    Width = 257
    Height = 23
    ReadOnly = True
    TabOrder = 9
  end
  object edNama: TEdit
    Left = 133
    Top = 213
    Width = 257
    Height = 23
    ReadOnly = True
    TabOrder = 10
  end
end
