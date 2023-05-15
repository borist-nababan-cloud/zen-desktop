object frmSaldoCuti: TfrmSaldoCuti
  Left = 0
  Top = 0
  Caption = '  Edit Saldo Cuti'
  ClientHeight = 543
  ClientWidth = 566
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    566
    543)
  PixelsPerInch = 96
  TextHeight = 16
  object Label4: TLabel
    Left = 0
    Top = -2
    Width = 567
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Edit Saldo Cuti'
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
    Top = 120
    Width = 101
    Height = 16
    Caption = 'Kode Karyawan'
  end
  object Label2: TLabel
    Left = 8
    Top = 148
    Width = 87
    Height = 16
    Caption = 'ID  Karyawan'
  end
  object Label3: TLabel
    Left = 8
    Top = 178
    Width = 108
    Height = 16
    Caption = 'Nama  Karyawan'
  end
  object Label5: TLabel
    Left = 8
    Top = 314
    Width = 39
    Height = 16
    Caption = 'Tahun'
  end
  object Label6: TLabel
    Left = 8
    Top = 344
    Width = 89
    Height = 16
    Caption = 'Saldo Saat Ini'
  end
  object Label13: TLabel
    Left = 8
    Top = 28
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
  object Label7: TLabel
    Left = 8
    Top = 374
    Width = 67
    Height = 16
    Caption = 'Nilai Revisi'
  end
  object edKode: TEdit
    Left = 132
    Top = 117
    Width = 257
    Height = 24
    ReadOnly = True
    TabOrder = 1
  end
  object edID: TEdit
    Left = 132
    Top = 147
    Width = 257
    Height = 24
    ReadOnly = True
    TabOrder = 2
  end
  object edNama: TEdit
    Left = 132
    Top = 177
    Width = 257
    Height = 24
    ReadOnly = True
    TabOrder = 3
  end
  object btnFind: TButton
    Left = 395
    Top = 120
    Width = 75
    Height = 55
    Caption = 'Search'
    TabOrder = 4
    OnClick = btnFindClick
  end
  object edTahun: TComboBox
    Left = 132
    Top = 311
    Width = 257
    Height = 24
    TabOrder = 5
    OnChange = edTahunChange
    Items.Strings = (
      '2017'
      '2018'
      '2019'
      '2020'
      '2021')
  end
  object edJumlah: TcxCalcEdit
    Left = 132
    Top = 341
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    TabOrder = 6
    Width = 121
  end
  object btnSimpan: TButton
    Left = 8
    Top = 456
    Width = 133
    Height = 69
    Caption = 'Simpan'
    TabOrder = 7
    OnClick = btnSimpanClick
  end
  object edQuickSearch: TcxTextEdit
    Left = 8
    Top = 49
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    TextHint = 'Type ID Karyawan and Press Enter'
    OnKeyPress = edQuickSearchKeyPress
    Width = 382
  end
  object gbHistory: TcxGroupBox
    Left = 8
    Top = 213
    Caption = 'History Cuti'
    TabOrder = 8
    Height = 79
    Width = 382
    object lblSaldo: TcxLabel
      Left = 7
      Top = 17
      Caption = 'Saldo Cuti '
      Transparent = True
    end
    object lblTerpakai: TcxLabel
      Left = 7
      Top = 46
      Caption = 'Jumlah Saldo Terpakai'
      Transparent = True
    end
  end
  object btnClose: TButton
    Left = 164
    Top = 456
    Width = 133
    Height = 69
    Caption = 'Close'
    TabOrder = 9
    OnClick = btnCloseClick
  end
  object edRevisi: TcxCalcEdit
    Left = 132
    Top = 371
    EditValue = 0.000000000000000000
    TabOrder = 10
    Width = 121
  end
  object memStruktur: TMemo
    Left = 324
    Top = 364
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `ben_saldo_cuti_history` ('
      '  `autonum` bigint(20) NOT NULL AUTO_INCREMENT,'
      '  `kodekaryawan` varchar(30) NOT NULL DEFAULT '#39#39','
      '  `idkaryawan` varchar(5) DEFAULT NULL,'
      '  `tahun` int(4) DEFAULT NULL,'
      '  `saldoawal` double DEFAULT NULL,'
      '  `saldoakhir` double DEFAULT NULL,'
      '  `selisih` double NOT NULL DEFAULT 0,'
      '  `notes` tinytext DEFAULT NULL,'
      '  `lastedituser` varchar(30) DEFAULT NULL,'
      '  `lasteditdate` datetime DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`),'
      '  KEY `idxkodekaryawan` (`kodekaryawan`),'
      '  KEY `idxidkaryawan` (`idkaryawan`)'
      ') ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;')
    ScrollBars = ssBoth
    TabOrder = 11
    Visible = False
  end
end
