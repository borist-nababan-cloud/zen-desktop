object frmPayrollCashInBali: TfrmPayrollCashInBali
  Left = 0
  Top = 0
  ClientHeight = 480
  ClientWidth = 859
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    859
    480)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 61
    Width = 381
    Height = 90
  end
  object Label1: TLabel
    Left = 0
    Top = -3
    Width = 857
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = ' Payroll Cash In Bali'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 525
  end
  object Label2: TLabel
    Left = 4
    Top = 31
    Width = 106
    Height = 16
    Caption = 'ID Finger Search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblKodeKaryawan: TLabel
    Left = 112
    Top = 66
    Width = 15
    Height = 13
    Caption = '.....'
  end
  object lblIDFinger: TLabel
    Left = 112
    Top = 80
    Width = 15
    Height = 13
    Caption = '.....'
  end
  object lblNamaKaryawan: TLabel
    Left = 112
    Top = 94
    Width = 15
    Height = 13
    Caption = '.....'
  end
  object lblDepartemen: TLabel
    Left = 112
    Top = 111
    Width = 15
    Height = 13
    Caption = '.....'
  end
  object Label3: TLabel
    Left = 8
    Top = 66
    Width = 25
    Height = 13
    Caption = 'N.I.K'
  end
  object Label4: TLabel
    Left = 8
    Top = 80
    Width = 51
    Height = 13
    Caption = 'ID Finger'
  end
  object Label5: TLabel
    Left = 8
    Top = 94
    Width = 91
    Height = 13
    Caption = 'Nama Karyawan'
  end
  object Label6: TLabel
    Left = 8
    Top = 111
    Width = 46
    Height = 13
    Caption = 'Divisi ID'
  end
  object Label7: TLabel
    Left = 407
    Top = 93
    Width = 45
    Height = 13
    Caption = 'Tanggal'
  end
  object Label8: TLabel
    Left = 624
    Top = 93
    Width = 11
    Height = 13
    Caption = ' - '
  end
  object Label9: TLabel
    Left = 407
    Top = 120
    Width = 67
    Height = 13
    Caption = 'Jumlah Hari'
  end
  object Label10: TLabel
    Left = 567
    Top = 120
    Width = 78
    Height = 13
    Caption = 'Libur Nasional'
  end
  object Label11: TLabel
    Left = 407
    Top = 66
    Width = 81
    Height = 13
    Caption = 'Select Periode'
  end
  object Label12: TLabel
    Left = 8
    Top = 128
    Width = 86
    Height = 13
    Caption = 'Type Payroll ID'
  end
  object lblTypePayroll: TLabel
    Left = 112
    Top = 128
    Width = 15
    Height = 13
    Caption = '.....'
  end
  object Label13: TLabel
    Left = 8
    Top = 172
    Width = 84
    Height = 13
    Caption = 'Set Tgl Cash In'
  end
  object Label14: TLabel
    Left = 239
    Top = 172
    Width = 11
    Height = 13
    Caption = ' - '
  end
  object Label15: TLabel
    Left = 8
    Top = 211
    Width = 49
    Height = 13
    Caption = 'V. Gapok'
  end
  object Label16: TLabel
    Left = 214
    Top = 213
    Width = 35
    Height = 13
    Caption = 'V. THP'
  end
  object Label17: TLabel
    Left = 8
    Top = 238
    Width = 56
    Height = 13
    Caption = 'H. Cash In'
  end
  object Label18: TLabel
    Left = 214
    Top = 265
    Width = 30
    Height = 13
    Caption = 'H. Off'
  end
  object Label19: TLabel
    Left = 214
    Top = 237
    Width = 37
    Height = 13
    Caption = 'Komisi'
  end
  object Label20: TLabel
    Left = 8
    Top = 265
    Width = 66
    Height = 13
    Caption = 'H. Hrs Kerja'
  end
  object Label21: TLabel
    Left = 8
    Top = 292
    Width = 73
    Height = 13
    Caption = 'H. Terlambat'
  end
  object Label22: TLabel
    Left = 212
    Top = 292
    Width = 102
    Height = 13
    Caption = 'H. Terlambat > 30'
  end
  object Label23: TLabel
    Left = 434
    Top = 238
    Width = 36
    Height = 13
    Caption = 'H. Cuti'
  end
  object Label24: TLabel
    Left = 434
    Top = 264
    Width = 74
    Height = 13
    Caption = 'H. Ijin Pulang'
  end
  object Label25: TLabel
    Left = 434
    Top = 292
    Width = 75
    Height = 13
    Caption = 'H. Tdk Masuk'
  end
  object Label26: TLabel
    Left = 434
    Top = 319
    Width = 39
    Height = 13
    Caption = 'H. Alpa'
  end
  object Label27: TLabel
    Left = 626
    Top = 238
    Width = 43
    Height = 13
    Caption = 'H. Sakit'
  end
  object Label28: TLabel
    Left = 626
    Top = 264
    Width = 79
    Height = 13
    Caption = 'H. Under Time'
  end
  object Label29: TLabel
    Left = 627
    Top = 292
    Width = 70
    Height = 13
    Caption = 'J. Over Time'
  end
  object Label30: TLabel
    Left = 630
    Top = 319
    Width = 35
    Height = 13
    Caption = 'H. FOT'
  end
  object Label31: TLabel
    Left = 8
    Top = 319
    Width = 56
    Height = 13
    Caption = 'H. Lib. Nas'
  end
  object Label32: TLabel
    Left = 214
    Top = 316
    Width = 44
    Height = 13
    Caption = 'H. Kerja'
  end
  object Label33: TLabel
    Left = 8
    Top = 352
    Width = 49
    Height = 13
    Caption = 'G. Pokok'
  end
  object Label34: TLabel
    Left = 432
    Top = 213
    Width = 62
    Height = 13
    Caption = 'V. U Makan'
  end
  object Label35: TLabel
    Left = 626
    Top = 211
    Width = 56
    Height = 13
    Caption = 'V. Lembur'
  end
  object Label36: TLabel
    Left = 239
    Top = 352
    Width = 88
    Height = 13
    Caption = '+   Uang Makan'
  end
  object Label37: TLabel
    Left = 485
    Top = 352
    Width = 61
    Height = 13
    Caption = '+   Lembur'
  end
  object Label38: TLabel
    Left = 488
    Top = 404
    Width = 43
    Height = 13
    Caption = ' =   THP'
  end
  object Label39: TLabel
    Left = 407
    Top = 143
    Width = 62
    Height = 13
    Caption = 'H. Total Off'
  end
  object Label40: TLabel
    Left = 8
    Top = 377
    Width = 65
    Height = 13
    Caption = '+ G. Lib Nas'
  end
  object Label42: TLabel
    Left = 239
    Top = 377
    Width = 78
    Height = 13
    Caption = '+  UM. Lib Nas'
  end
  object Label43: TLabel
    Left = 485
    Top = 377
    Width = 50
    Height = 13
    Caption = '+  U. FOT'
  end
  object Label44: TLabel
    Left = 8
    Top = 404
    Width = 72
    Height = 13
    Caption = '+ Tambahan'
  end
  object Label45: TLabel
    Left = 239
    Top = 401
    Width = 65
    Height = 13
    Caption = '-  Potongan'
  end
  object Label46: TLabel
    Left = 8
    Top = 431
    Width = 66
    Height = 13
    Caption = 'Keterangan'
  end
  object edSearchID: TcxTextEdit
    Left = 112
    Top = 28
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    TextHint = 'Type Here to Fast Seach...'
    OnKeyPress = edSearchIDKeyPress
    Width = 261
  end
  object btnCari: TButton
    Left = 303
    Top = 66
    Width = 75
    Height = 75
    Caption = 'Cari'
    TabOrder = 1
    OnClick = btnCariClick
  end
  object edPeriode: TComboBox
    Left = 497
    Top = 63
    Width = 177
    Height = 21
    TabOrder = 2
    OnChange = edPeriodeChange
  end
  object edStart: TcxDateEdit
    Left = 497
    Top = 90
    EditValue = 0d
    Enabled = False
    TabOrder = 3
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 644
    Top = 90
    EditValue = 0d
    Enabled = False
    TabOrder = 4
    Width = 121
  end
  object edLama: TcxCalcEdit
    Left = 497
    Top = 117
    EditValue = 0.000000000000000000
    Enabled = False
    TabOrder = 5
    Width = 64
  end
  object edLibNas: TcxCalcEdit
    Left = 651
    Top = 117
    EditValue = 0.000000000000000000
    Enabled = False
    TabOrder = 6
    Width = 70
  end
  object edCashStart: TcxDateEdit
    Left = 112
    Top = 169
    EditValue = 0d
    TabOrder = 7
    Width = 121
  end
  object edCashEnd: TcxDateEdit
    Left = 257
    Top = 169
    EditValue = 0d
    TabOrder = 8
    Width = 121
  end
  object btnLoad: TButton
    Left = 384
    Top = 160
    Width = 87
    Height = 42
    Caption = 'Load'
    TabOrder = 9
    OnClick = btnLoadClick
  end
  object edVGP: TcxCalcEdit
    Left = 87
    Top = 208
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 10
    Width = 114
  end
  object edVTHP: TcxCalcEdit
    Left = 319
    Top = 208
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 11
    Width = 108
  end
  object edHCashin: TcxCalcEdit
    Left = 87
    Top = 235
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 12
    Width = 114
  end
  object edHOff: TcxCalcEdit
    Left = 319
    Top = 262
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 13
    Width = 108
  end
  object edKomisi: TcxCalcEdit
    Left = 319
    Top = 235
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 14
    Width = 108
  end
  object edHarusKerja: TcxCalcEdit
    Left = 87
    Top = 262
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 15
    Width = 114
  end
  object edLate1: TcxCalcEdit
    Left = 87
    Top = 289
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 16
    Width = 114
  end
  object edLate2: TcxCalcEdit
    Left = 319
    Top = 289
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 17
    Width = 108
  end
  object edCuti: TcxCalcEdit
    Left = 510
    Top = 233
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 18
    Width = 108
  end
  object edIjinPulang: TcxCalcEdit
    Left = 510
    Top = 259
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 19
    Width = 108
  end
  object edTidakMasuk: TcxCalcEdit
    Left = 510
    Top = 287
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 20
    Width = 108
  end
  object edAlpa: TcxCalcEdit
    Left = 510
    Top = 314
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 21
    Width = 108
  end
  object edSakit: TcxCalcEdit
    Left = 714
    Top = 233
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 22
    Width = 108
  end
  object edUndertime: TcxCalcEdit
    Left = 714
    Top = 259
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 23
    Width = 108
  end
  object edOvertime: TcxCalcEdit
    Left = 714
    Top = 287
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 24
    Width = 108
  end
  object edFOT: TcxCalcEdit
    Left = 714
    Top = 314
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 25
    Width = 108
  end
  object edHLibNasional: TcxCalcEdit
    Left = 87
    Top = 316
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 26
    Width = 114
  end
  object edHKerja: TcxCalcEdit
    Left = 319
    Top = 313
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 27
    Width = 108
  end
  object edGapok: TcxCalcEdit
    Left = 87
    Top = 349
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 28
    Width = 151
  end
  object edVUMakan: TcxCalcEdit
    Left = 510
    Top = 208
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 29
    Width = 108
  end
  object edVLembur: TcxCalcEdit
    Left = 714
    Top = 208
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 30
    Width = 108
  end
  object edUangMakan: TcxCalcEdit
    Left = 331
    Top = 349
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 31
    Width = 151
  end
  object edLembur: TcxCalcEdit
    Left = 565
    Top = 349
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 32
    Width = 151
  end
  object edTHP: TcxCalcEdit
    Left = 567
    Top = 401
    EditValue = 0.000000000000000000
    Enabled = False
    ParentFont = False
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    StyleDisabled.TextColor = clBlue
    TabOrder = 33
    Width = 151
  end
  object edTotalOff: TcxCalcEdit
    Left = 497
    Top = 141
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.UseThousandSeparator = True
    TabOrder = 34
    Width = 108
  end
  object edGpLibNas: TcxCalcEdit
    Left = 87
    Top = 374
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 35
    Width = 151
  end
  object edUMLibNas: TcxCalcEdit
    Left = 331
    Top = 374
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 36
    Width = 151
  end
  object edGFOT: TcxCalcEdit
    Left = 567
    Top = 374
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 37
    Width = 151
  end
  object edTambahan: TcxCalcEdit
    Left = 87
    Top = 401
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 38
    Width = 151
  end
  object edPengurang: TcxCalcEdit
    Left = 331
    Top = 401
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 39
    Width = 151
  end
  object btnReset: TButton
    Left = 473
    Top = 178
    Width = 58
    Height = 25
    Caption = 'Reset'
    TabOrder = 40
    OnClick = btnResetClick
  end
  object edKeterangan: TEdit
    Left = 87
    Top = 428
    Width = 395
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 41
  end
  object Button2: TButton
    Left = 732
    Top = 347
    Width = 90
    Height = 75
    Caption = 'POS'
    TabOrder = 42
    OnClick = Button2Click
  end
  object memoStruktur1: TMemo
    Left = 666
    Top = 461
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE '
      '`ben_payroll_cashin` ('
      '  `autonum` bigint(20) NOT '
      'NULL AUTO_INCREMENT,'
      '  `idoutlet` char(3) NOT NULL '
      'DEFAULT '#39#39','
      '  `payrollperiode` varchar(255) '
      'DEFAULT NULL,'
      '  `tglstart` date DEFAULT NULL,'
      '  `tglend` date DEFAULT NULL,'
      '  `kodekaryawan` varchar(30) '
      'NOT NULL DEFAULT '#39#39','
      '  `idkaryawan` varchar(5) NOT '
      'NULL DEFAULT '#39#39','
      '  `hperiode` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hoff` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `haruskerja` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hkerja` double(3,2) NOT NULL '
      'DEFAULT '#39'0.00'#39','
      '  `overtime` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hunder` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hlate1` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hlate2` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hsakit` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `himasuk` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hitidakmasuk` int(3) NOT '
      'NULL DEFAULT '#39'0'#39','
      '  `hipulang` double(3,2) NOT '
      'NULL DEFAULT '#39'0.00'#39','
      '  `hikeluar` int(2) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hitidakabsen` int(2) NOT '
      'NULL DEFAULT '#39'0'#39','
      '  `halpa` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hfot` int(2) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hlibnas` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `hcuti` int(3) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `tamblain` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `potlain` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `gapok` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `nlibnas` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `numakan` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `numlibnas` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `gplibnas` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `nlembur` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `nilaifot` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '`komisi` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `nilaithp` double NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `keterangan` varchar(255) '
      'DEFAULT NULL,'
      '  `lastedituser` varchar(30) '
      'DEFAULT NULL,'
      '  `lasteditdate` datetime '
      'DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM DEFAULT '
      'CHARSET=latin1;')
    TabOrder = 43
    Visible = False
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 724
    Top = 27
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 772
    Top = 18
  end
end
