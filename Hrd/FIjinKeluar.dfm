object frmIjinKeluar: TfrmIjinKeluar
  Left = 0
  Top = 0
  Caption = 'FORM IJIN KELUAR'
  ClientHeight = 314
  ClientWidth = 604
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    604
    314)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 87
    Height = 13
    Caption = 'Kode Karyawan'
  end
  object Label3: TLabel
    Left = 8
    Top = 92
    Width = 75
    Height = 13
    Caption = 'ID  Karyawan'
  end
  object Label4: TLabel
    Left = 8
    Top = 122
    Width = 94
    Height = 13
    Caption = 'Nama  Karyawan'
  end
  object Label1: TLabel
    Left = 3
    Top = -1
    Width = 596
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Input Ijin Keluar'
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
  object Label5: TLabel
    Left = 8
    Top = 34
    Width = 93
    Height = 13
    Caption = 'ID Finger Search'
  end
  object Label6: TLabel
    Left = 8
    Top = 149
    Width = 71
    Height = 13
    Caption = 'Departemen'
  end
  object Label7: TLabel
    Left = 8
    Top = 227
    Width = 70
    Height = 13
    Caption = 'Lama Keluar'
  end
  object Label8: TLabel
    Left = 216
    Top = 227
    Width = 24
    Height = 13
    Caption = 'Jam'
  end
  object Label9: TLabel
    Left = 8
    Top = 176
    Width = 45
    Height = 13
    Caption = 'Tanggal'
  end
  object Label10: TLabel
    Left = 8
    Top = 202
    Width = 66
    Height = 13
    Caption = 'Keterangan'
  end
  object edKode: TEdit
    Left = 132
    Top = 61
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edID: TEdit
    Left = 132
    Top = 91
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object edNama: TEdit
    Left = 132
    Top = 121
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object btnFind: TButton
    Left = 396
    Top = 60
    Width = 161
    Height = 52
    Caption = 'Search by Form'
    TabOrder = 1
    OnClick = btnFindClick
  end
  object edSearchID: TcxTextEdit
    Left = 132
    Top = 31
    TabOrder = 0
    TextHint = 'Type Here to Fast Seach...'
    OnKeyPress = edSearchIDKeyPress
    Width = 339
  end
  object edDepartemen: TEdit
    Left = 132
    Top = 148
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object edJam: TcxCalcEdit
    Left = 132
    Top = 224
    EditValue = 0.000000000000000000
    TabOrder = 8
    Width = 73
  end
  object memoStruktur1: TMemo
    Left = 420
    Top = 131
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE '
      '`ben_presensi_keluar` ('
      '  `autonum` bigint(20) NOT '
      'NULL AUTO_INCREMENT,'
      '  `nomorijin` char(50) DEFAULT '
      'NULL,'
      '  `tglpengajuan` date DEFAULT '
      'NULL,'
      '  `kodekaryawan` varchar(30) '
      'NOT NULL DEFAULT '#39#39','
      '  `idkaryawan` varchar(5) '
      'DEFAULT NULL,'
      '  `tanggal` date DEFAULT NULL,'
      '  `keterangan` varchar(255) '
      'DEFAULT NULL,'
      '  `jamkerja` int(2) NOT NULL '
      'DEFAULT '#39'0'#39','
      '  `tagpresensi` char(2) '
      'DEFAULT NULL,'
      '  `lastedituser` varchar(30) '
      'DEFAULT NULL,'
      '  `lasteditdate` datetime '
      'DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM '
      'AUTO_INCREMENT=960 '
      'DEFAULT CHARSET=latin1;')
    TabOrder = 11
    Visible = False
  end
  object cxButton1: TcxButton
    Left = 132
    Top = 257
    Width = 105
    Height = 41
    Caption = 'Simpan'
    TabOrder = 9
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 316
    Top = 257
    Width = 105
    Height = 41
    Caption = 'Close'
    TabOrder = 10
    OnClick = cxButton2Click
  end
  object edTanggal: TcxDateEdit
    Left = 132
    Top = 172
    EditValue = 0d
    TabOrder = 6
    Width = 257
  end
  object edKeterangan: TEdit
    Left = 132
    Top = 199
    Width = 257
    Height = 21
    TabOrder = 7
  end
  object tblTag: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select tagid, namatag from ben_presensi_tag where namatag like '#39 +
        'IJIN%'#39)
    Left = 12
    Top = 269
  end
  object dsTblTag: TDataSource
    DataSet = tblTag
    Left = 64
    Top = 269
  end
end
