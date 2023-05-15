object frmMain: TfrmMain
  Left = 210
  Top = 90
  ClientHeight = 571
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBar: TPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 53
    Align = alTop
    Color = clSkyBlue
    Enabled = False
    TabOrder = 0
    object lblCounter: TLabel
      Left = 788
      Top = 4
      Width = 47
      Height = 13
      Caption = 'lblCounter'
      Visible = False
    end
    object btnPos: TAdvGlowButton
      Left = 1
      Top = 1
      Width = 128
      Height = 51
      Hint = 'Form Transaksi '
      Align = alLeft
      Caption = 'Transaction'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Transparent = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnPosClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnSetUp: TAdvGlowButton
      Left = 717
      Top = 1
      Width = 100
      Height = 51
      Align = alLeft
      Caption = 'SetUp'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Transparent = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      DropDownButton = True
      DropDownSplit = False
      DropDownMenu = pmSetting
    end
    object btnStart: TAdvGlowButton
      Left = 257
      Top = 1
      Width = 128
      Height = 51
      Align = alLeft
      Caption = 'Start Order'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Transparent = True
      TabOrder = 2
      Visible = False
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnStopOrder: TAdvGlowButton
      Left = 385
      Top = 1
      Width = 124
      Height = 51
      Align = alLeft
      Caption = 'Stop Order'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Transparent = True
      TabOrder = 3
      Visible = False
      OnClick = btnStopOrderClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnPayment: TAdvGlowButton
      Left = 509
      Top = 1
      Width = 100
      Height = 51
      Hint = 'Form Pembayaran'
      Align = alLeft
      Caption = 'Payment'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Transparent = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnPaymentClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnViewReport: TAdvGlowButton
      Left = 609
      Top = 1
      Width = 108
      Height = 51
      Hint = 'Laporan Seluruh Transaksi'
      Align = alLeft
      Caption = 'Report Trans'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Transparent = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      DropDownButton = True
      DropDownSplit = False
      DropDownMenu = PopupMenu1
    end
    object btnBooking: TAdvGlowButton
      Left = 129
      Top = 1
      Width = 128
      Height = 51
      Align = alLeft
      Caption = 'Booking'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Transparent = True
      TabOrder = 6
      OnClick = btnBookingClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 53
    Width = 967
    Height = 504
    Align = alClient
    Color = clSkyBlue
    TabOrder = 1
  end
  object XiPanel2: TPanel
    Left = 0
    Top = 557
    Width = 967
    Height = 14
    Align = alBottom
    Alignment = taLeftJustify
    Color = clSkyBlue
    TabOrder = 2
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 112
    Top = 96
  end
  object PopupMenu1: TPopupMenu
    Left = 812
    Top = 56
    object DETAIL1: TMenuItem
      Caption = 'DAYLI '
      OnClick = DETAIL1Click
    end
    object GLOBAL1: TMenuItem
      Caption = 'PAYMENT'
      OnClick = GLOBAL1Click
    end
    object STOCKKASIR1: TMenuItem
      Caption = 'STOCK KASIR'
      OnClick = STOCKKASIR1Click
    end
    object All1: TMenuItem
      Caption = 'ALL'
      OnClick = All1Click
    end
  end
  object pmSetting: TPopupMenu
    Left = 740
    Top = 56
    object HERAPIST1: TMenuItem
      Caption = 'THERAPIST'
      OnClick = HERAPIST1Click
    end
    object SPESIFIKASITHERAPIST1: TMenuItem
      Caption = 'SPESIFIKASI THERAPIST'
      OnClick = SPESIFIKASITHERAPIST1Click
    end
    object CHANGESTATUS1: TMenuItem
      Caption = 'CHANGE STATUS'
      OnClick = CHANGESTATUS1Click
    end
    object ROOM1: TMenuItem
      Caption = 'ROOM'
      Visible = False
    end
    object BARCODE1: TMenuItem
      Caption = 'BARCODE'
      Enabled = False
      OnClick = BARCODE1Click
    end
    object DAFTARMEM1: TMenuItem
      Caption = 'DAFTAR MEMBERS'
      OnClick = DAFTARMEM1Click
      object LOCAL1: TMenuItem
        Caption = 'LOCAL'
        OnClick = LOCAL1Click
      end
      object ONLINE1: TMenuItem
        Caption = 'ON LINE'
        OnClick = ONLINE1Click
      end
      object HISTORYTRANS1: TMenuItem
        Caption = 'HISTORY TRANS'
        OnClick = HISTORYTRANS1Click
      end
    end
    object CEKHISTORYMEMBER1: TMenuItem
      Caption = 'CEK HISTORY MEMBER'
      Visible = False
      OnClick = CEKHISTORYMEMBER1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ravelDriverRegistration1: TMenuItem
      Caption = 'Travel / Driver List'
      OnClick = ravelDriverRegistration1Click
    end
    object DriversFingerRegistration1: TMenuItem
      Caption = 'Drivers Finger Registration'
      OnClick = DriversFingerRegistration1Click
    end
    object FeeDrivers1: TMenuItem
      Caption = 'Fee Drivers'
      OnClick = FeeDrivers1Click
    end
    object LaporanTransDrivers1: TMenuItem
      Caption = 'Laporan Trans Drivers'
      OnClick = LaporanTransDrivers1Click
    end
  end
  object cxHintStyleController1: TcxHintStyleController
    HintStyleClassName = 'TcxHintStyle'
    HintStyle.Animate = cxhaSlideFromLeft
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'MS Sans Serif'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = ANSI_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -13
    HintStyle.Font.Name = 'Calibri'
    HintStyle.Font.Style = []
    HintStyle.Rounded = True
    Left = 624
    Top = 56
  end
  object trBooking: TTimer
    Enabled = False
    Interval = 900000
    OnTimer = trBookingTimer
    Left = 160
    Top = 96
  end
end
