object frmMemberMasterAdd: TfrmMemberMasterAdd
  Left = 0
  Top = 0
  Caption = '   Add Members'
  ClientHeight = 635
  ClientWidth = 743
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    743
    635)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulAtas: TLabel
    Left = 4
    Top = 3
    Width = 735
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '   Add Members'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 793
  end
  object Label1: TLabel
    Left = 16
    Top = 104
    Width = 72
    Height = 16
    Caption = 'Nomor Kartu'
  end
  object Label2: TLabel
    Left = 16
    Top = 134
    Width = 90
    Height = 16
    Caption = 'Nama Members'
  end
  object Label3: TLabel
    Left = 16
    Top = 164
    Width = 44
    Height = 16
    Caption = 'Provinsi'
  end
  object Label4: TLabel
    Left = 16
    Top = 194
    Width = 98
    Height = 16
    Caption = 'Kota / Kabupaten'
  end
  object Label5: TLabel
    Left = 16
    Top = 224
    Width = 63
    Height = 16
    Caption = 'Kecamatan'
  end
  object Label6: TLabel
    Left = 16
    Top = 254
    Width = 57
    Height = 16
    Caption = 'Kelurahan'
  end
  object Label7: TLabel
    Left = 16
    Top = 284
    Width = 52
    Height = 16
    Caption = 'Kode Pos'
  end
  object Label8: TLabel
    Left = 16
    Top = 314
    Width = 40
    Height = 16
    Caption = 'Alamat'
  end
  object Label9: TLabel
    Left = 16
    Top = 374
    Width = 87
    Height = 16
    Caption = 'No. Handphone'
  end
  object Label10: TLabel
    Left = 16
    Top = 404
    Width = 43
    Height = 16
    Caption = 'Fix Line'
  end
  object Label11: TLabel
    Left = 16
    Top = 434
    Width = 31
    Height = 16
    Caption = 'Email'
  end
  object Label12: TLabel
    Left = 16
    Top = 464
    Width = 102
    Height = 16
    Caption = 'Tempat, Tgl Lahir'
  end
  object Label13: TLabel
    Left = 16
    Top = 494
    Width = 76
    Height = 16
    Caption = 'No KTP / SIM'
  end
  object Label14: TLabel
    Left = 16
    Top = 524
    Width = 41
    Height = 16
    Caption = 'Gender'
  end
  object PaintBox1: TPaintBox
    Left = 411
    Top = 49
    Width = 307
    Height = 242
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnPaint = PaintBox1Paint
    ExplicitWidth = 230
  end
  object memStruktur: TMemo
    Left = 8
    Top = 35
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `master_alamat` ('
      '  `autonum` bigint(20) NOT NULL AUTO_INCREMENT,'
      '  `provinsi` varchar(255) DEFAULT NULL,'
      '  `kabupaten` varchar(255) DEFAULT NULL,'
      '  `kecamatan` varchar(255) DEFAULT NULL,'
      '  `kelurahan` varchar(255) DEFAULT NULL,'
      '  `kodepos` char(5) DEFAULT NULL,'
      '  `notes` varchar(255) DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM DEFAULT CHARSET=latin1;')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 15
    Visible = False
  end
  object edScanMember: TcxTextEdit
    Left = 16
    Top = 41
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 16
    TextHint = 'Scan New Member Here...'
    OnKeyPress = edScanMemberKeyPress
    Width = 389
  end
  object edNoKartu: TcxTextEdit
    Left = 144
    Top = 101
    Properties.ReadOnly = True
    TabOrder = 17
    Width = 261
  end
  object edNama: TcxTextEdit
    Left = 144
    Top = 131
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 261
  end
  object edProvinsi: TcxLookupComboBox
    Left = 144
    Top = 161
    Properties.CharCase = ecUpperCase
    Properties.DropDownListStyle = lsEditList
    Properties.KeyFieldNames = 'provinsi'
    Properties.ListColumns = <
      item
        FieldName = 'provinsi'
      end>
    Properties.ListSource = dsQryProvinsi
    Properties.OnValidate = edProvinsiPropertiesValidate
    TabOrder = 1
    OnKeyPress = edProvinsiKeyPress
    Width = 261
  end
  object edKabupaten: TcxLookupComboBox
    Left = 144
    Top = 191
    Properties.CharCase = ecUpperCase
    Properties.DropDownListStyle = lsEditList
    Properties.KeyFieldNames = 'kabupaten'
    Properties.ListColumns = <
      item
        FieldName = 'kabupaten'
      end>
    Properties.ListSource = dsQryKabupaten
    Properties.OnValidate = edKabupatenPropertiesValidate
    TabOrder = 2
    OnKeyPress = edKabupatenKeyPress
    Width = 261
  end
  object edKecamatan: TcxLookupComboBox
    Left = 144
    Top = 221
    Properties.CharCase = ecUpperCase
    Properties.DropDownListStyle = lsEditList
    Properties.KeyFieldNames = 'kecamatan'
    Properties.ListColumns = <
      item
        FieldName = 'kecamatan'
      end>
    Properties.ListSource = dsQryKecamatan
    Properties.OnValidate = edKecamatanPropertiesValidate
    TabOrder = 3
    OnKeyPress = edKecamatanKeyPress
    Width = 261
  end
  object edKelurahan: TcxLookupComboBox
    Left = 144
    Top = 251
    Properties.CharCase = ecUpperCase
    Properties.DropDownListStyle = lsEditList
    Properties.KeyFieldNames = 'kelurahan'
    Properties.ListColumns = <
      item
        FieldName = 'kelurahan'
      end>
    Properties.ListSource = dsQryKelurahan
    Properties.OnValidate = edKelurahanPropertiesValidate
    TabOrder = 4
    OnKeyPress = edKelurahanKeyPress
    Width = 261
  end
  object edKodePos: TcxLookupComboBox
    Left = 144
    Top = 281
    Properties.CharCase = ecUpperCase
    Properties.DropDownListStyle = lsEditList
    Properties.KeyFieldNames = 'kodepos'
    Properties.ListColumns = <
      item
        FieldName = 'kodepos'
      end>
    Properties.ListSource = dsQryKodePos
    TabOrder = 5
    OnKeyPress = edKodePosKeyPress
    Width = 261
  end
  object edAlamat1: TcxTextEdit
    Left = 144
    Top = 311
    Properties.CharCase = ecUpperCase
    TabOrder = 6
    OnKeyPress = edAlamat1KeyPress
    Width = 465
  end
  object edAlamat2: TcxTextEdit
    Left = 144
    Top = 341
    Properties.CharCase = ecUpperCase
    TabOrder = 7
    OnKeyPress = edAlamat2KeyPress
    Width = 465
  end
  object edHanphone: TcxTextEdit
    Left = 144
    Top = 371
    Properties.CharCase = ecUpperCase
    Properties.PasswordChar = '0'
    TabOrder = 8
    OnKeyPress = edHanphoneKeyPress
    Width = 465
  end
  object edFixLine: TcxTextEdit
    Left = 144
    Top = 401
    Properties.CharCase = ecUpperCase
    Properties.PasswordChar = '0'
    TabOrder = 9
    OnKeyPress = edFixLineKeyPress
    Width = 465
  end
  object edEmail: TcxTextEdit
    Left = 144
    Top = 431
    Properties.CharCase = ecLowerCase
    TabOrder = 10
    OnKeyPress = edEmailKeyPress
    Width = 465
  end
  object edTanggal: TcxDateEdit
    Left = 432
    Top = 461
    EditValue = 0d
    TabOrder = 12
    OnKeyPress = edTanggalKeyPress
    Width = 177
  end
  object edTempatLahir: TcxTextEdit
    Left = 144
    Top = 461
    Properties.CharCase = ecUpperCase
    TabOrder = 11
    OnKeyPress = edTempatLahirKeyPress
    Width = 261
  end
  object btnSimpan: TcxButton
    Left = 144
    Top = 562
    Width = 145
    Height = 53
    Caption = 'SAVE'
    TabOrder = 18
    OnClick = btnSimpanClick
  end
  object cxButton2: TcxButton
    Left = 304
    Top = 562
    Width = 88
    Height = 53
    Caption = 'Clear'
    TabOrder = 19
  end
  object edNoKTP: TcxTextEdit
    Left = 144
    Top = 491
    Properties.CharCase = ecUpperCase
    TabOrder = 13
    OnKeyPress = edNoKTPKeyPress
    Width = 465
  end
  object edGender: TcxComboBox
    Left = 144
    Top = 521
    Properties.Items.Strings = (
      'MALE'
      'FEMALE')
    TabOrder = 14
    Text = 'MALE'
    OnKeyPress = edGenderKeyPress
    Width = 165
  end
  object qryProvinsi: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select provinsi from master_alamat')
    Left = 572
    Top = 40
  end
  object dsQryProvinsi: TMyDataSource
    DataSet = qryProvinsi
    Left = 572
    Top = 96
  end
  object qryKabupaten: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select kabupaten from master_alamat')
    Left = 536
    Top = 216
  end
  object dsQryKabupaten: TMyDataSource
    DataSet = qryKabupaten
    Left = 536
    Top = 272
  end
  object qryKecamatan: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select kecamatan from master_alamat')
    Left = 452
    Top = 208
  end
  object dsQryKecamatan: TMyDataSource
    DataSet = qryKecamatan
    Left = 452
    Top = 264
  end
  object qryKelurahan: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select kelurahan from master_alamat')
    Left = 528
    Top = 104
  end
  object dsQryKelurahan: TMyDataSource
    DataSet = qryKelurahan
    Left = 528
    Top = 160
  end
  object qryKodePos: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select kodepos from master_alamat')
    Left = 448
    Top = 100
  end
  object dsQryKodePos: TMyDataSource
    DataSet = qryKodePos
    Left = 448
    Top = 156
  end
end
