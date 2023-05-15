object frmBooking: TfrmBooking
  Left = 412
  Top = 199
  Width = 474
  Height = 412
  Caption = 'frmBooking'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label18: TLabel
    Left = 0
    Top = 0
    Width = 458
    Height = 33
    Align = alTop
    AutoSize = False
    Caption = '.... FORM BOOKING'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 458
    Height = 259
    Align = alClient
    Color = clSkyBlue
    TabOrder = 0
    object Label15: TLabel
      Left = 10
      Top = 12
      Width = 66
      Height = 14
      Caption = 'No. Booking'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 10
      Top = 36
      Width = 43
      Height = 14
      Caption = 'Tanggal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 10
      Top = 84
      Width = 30
      Height = 14
      Caption = 'Nama'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 10
      Top = 61
      Width = 21
      Height = 14
      Caption = 'Jam'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 10
      Top = 108
      Width = 43
      Height = 14
      Caption = 'No.Telp'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 10
      Top = 131
      Width = 37
      Height = 14
      Caption = 'Jumlah'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 206
      Top = 131
      Width = 33
      Height = 14
      Caption = 'Orang'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 10
      Top = 161
      Width = 63
      Height = 14
      Caption = 'Keterangan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edTrans: TcxTextEdit
      Left = 125
      Top = 8
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 142
    end
    object edTgl: TcxDateEdit
      Left = 125
      Top = 32
      EditValue = 0d
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 100
    end
    object edNama: TcxTextEdit
      Left = 125
      Top = 80
      Properties.CharCase = ecUpperCase
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 250
    end
    object edWaktu: TcxTimeEdit
      Left = 125
      Top = 56
      EditValue = 0
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Width = 100
    end
    object edTelp: TcxTextEdit
      Left = 125
      Top = 104
      Properties.CharCase = ecUpperCase
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 4
      Width = 148
    end
    object edJumlah: TcxCalcEdit
      Left = 125
      Top = 128
      EditValue = 0
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 5
      Width = 76
    end
    object edNotes: TcxMemo
      Left = 124
      Top = 152
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 6
      Height = 89
      Width = 185
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 292
    Width = 458
    Height = 82
    Align = alBottom
    Color = clSkyBlue
    TabOrder = 1
    DesignSize = (
      458
      82)
    object btnNewB: TcxButton
      Left = 83
      Top = 10
      Width = 89
      Height = 34
      Anchors = [akLeft, akBottom]
      Caption = 'New'
      TabOrder = 0
      OnClick = btnNewBClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnSaveB: TcxButton
      Left = 175
      Top = 10
      Width = 89
      Height = 34
      Anchors = [akLeft, akBottom]
      Caption = 'Save'
      TabOrder = 1
      OnClick = btnSaveBClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnViewB: TcxButton
      Left = 267
      Top = 10
      Width = 89
      Height = 34
      Anchors = [akLeft, akBottom]
      Caption = 'View'
      TabOrder = 2
      OnClick = btnViewBClick
      LookAndFeel.Kind = lfOffice11
    end
  end
end
