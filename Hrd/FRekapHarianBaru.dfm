object frmRekapHarianBaru: TfrmRekapHarianBaru
  Left = 0
  Top = 0
  Caption = 'Rekap Harian'
  ClientHeight = 556
  ClientWidth = 980
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
    980
    556)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 0
    Top = -4
    Width = 977
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Rekap Absen Harian New'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 833
  end
  object Label1: TLabel
    Left = 16
    Top = 36
    Width = 59
    Height = 13
    Caption = 'Start Date'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 50
    Height = 13
    Caption = 'End Date'
  end
  object lblLoad1: TLabel
    Left = 680
    Top = 52
    Width = 9
    Height = 13
    Caption = '...'
  end
  object lblLoad2: TLabel
    Left = 680
    Top = 97
    Width = 9
    Height = 13
    Caption = '...'
  end
  object memStruktur: TMemo
    Left = 770
    Top = 281
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE '
      '`absen_harian_merge` ('
      '  `autonum` bigint(20) NOT '
      'NULL AUTO_INCREMENT,'
      '  `kodekaryawan` varchar(30) '
      'NOT NULL DEFAULT '#39'NONE'#39','
      '  `idkaryawan` varchar(5) NOT '
      'NULL DEFAULT '#39'NONE'#39','
      '  `tanggal` date NOT NULL '
      'DEFAULT '#39'2000-01-01'#39','
      '  `fpreal` datetime NOT NULL '
      'DEFAULT '#39'2019-01-01 01:01:00'#39','
      '  `notes` varchar(255) '
      'DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`),'
      '  KEY `idxkodekaryawan` '
      '(`kodekaryawan`),'
      '  KEY `idxidkaryawan` '
      '(`idkaryawan`),'
      '  KEY `idxtanggal` (`tanggal`)'
      ') ENGINE=MyISAM DEFAULT '
      'CHARSET=latin1;')
    TabOrder = 10
    Visible = False
  end
  object memoStruktur2: TMemo
    Left = 752
    Top = 231
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE '
      '`ben_presensi_details` ('
      '  `autonum` bigint(20) NOT '
      'NULL AUTO_INCREMENT,'
      '  `idoutlet` varchar(3) DEFAULT '
      'NULL,'
      '  `tanggal` date DEFAULT NULL,'
      '  `kodekaryawan` varchar(30) '
      'NOT NULL DEFAULT '#39#39','
      '  `idkaryawan` varchar(5) '
      'DEFAULT NULL,'
      '  `jadwalmasuk` datetime '
      'DEFAULT NULL,'
      '  `jadwalkeluar` datetime '
      'DEFAULT NULL,'
      '  `fpmasuk` datetime DEFAULT '
      'NULL,'
      '  `fpkeluar` datetime DEFAULT '
      'NULL,'
      '  `tagresult` char(3) DEFAULT '
      'NULL,'
      '  `keterangan` varchar(255) '
      'DEFAULT NULL,'
      '  `lastedituser` varchar(30) '
      'DEFAULT NULL,'
      '  `lasteditdate` datetime '
      'DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM DEFAULT '
      'CHARSET=latin1;')
    TabOrder = 11
    Visible = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 140
    Width = 964
    Height = 357
    Anchors = [akLeft, akTop, akRight, akBottom]
    PopupMenu = pmGrid
    TabOrder = 0
    object gtvRekap: TcxGridBandedTableView
      PopupMenu = pmGrid
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#.#0'
          Kind = skSum
          Column = gtvRekapKomisi
        end
        item
          Kind = skCount
          Column = gtvRekapTagResult
        end
        item
          Kind = skCount
          Column = gtvRekapTagAuto
        end
        item
          Kind = skCount
          Column = gtvRekapTKeluar
        end
        item
          Kind = skCount
          Column = gtvRekapTMasuk
        end
        item
          Kind = skCount
          Column = gtvRekapNama
        end
        item
          Kind = skCount
          Column = gtvRekapDivisi
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.BandsQuickCustomization = True
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'ID Karyawan'
          FixedKind = fkLeft
        end
        item
          Caption = 'Masuk'
        end
        item
          Caption = 'Keluar'
        end
        item
          Caption = 'Summary'
        end>
      object gtvRekapDivisi: TcxGridBandedColumn
        Caption = 'Divisi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        Properties.ReadOnly = True
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvRekapIDFinger: TcxGridBandedColumn
        Caption = 'ID Finger'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvRekapKode: TcxGridBandedColumn
        Caption = 'NIK'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvRekapNamaShift: TcxGridBandedColumn
        Caption = 'Nama Shift'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Properties.ReadOnly = True
        Visible = False
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvRekapTanggal: TcxGridBandedColumn
        Caption = 'Tanggal'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        OnGetDisplayText = gtvRekapTanggalGetDisplayText
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvRekapNama: TcxGridBandedColumn
        Caption = 'Nama Karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvRekapJMasuk: TcxGridBandedColumn
        Caption = 'J. In'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Kind = ckDateTime
        Properties.ReadOnly = True
        OnGetDisplayText = gtvRekapJMasukGetDisplayText
        Width = 140
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvRekapTMasuk: TcxGridBandedColumn
        Caption = 'Tag In'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'tagid'
        Properties.ListColumns = <
          item
            FieldName = 'namatag'
          end>
        Properties.ListSource = dsTblTag
        Properties.ReadOnly = True
        Width = 75
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvRekapFPMasuk: TcxGridBandedColumn
        Caption = 'FP In'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        OnGetDataText = gtvRekapFPMasukGetDataText
        OnGetDisplayText = gtvRekapFPMasukGetDisplayText
        Width = 140
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvRekapSelMasuk: TcxGridBandedColumn
        Caption = 'Sel. In'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        OnCustomDrawCell = gtvRekapSelMasukCustomDrawCell
        Width = 50
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvRekapJKeluar: TcxGridBandedColumn
        Caption = 'J. Out'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Kind = ckDateTime
        Properties.ReadOnly = True
        OnGetDisplayText = gtvRekapJKeluarGetDisplayText
        Width = 140
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvRekapFPKeluar: TcxGridBandedColumn
        Caption = 'FP Out'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Kind = ckDateTime
        Properties.ReadOnly = True
        OnGetDisplayText = gtvRekapFPKeluarGetDisplayText
        Width = 140
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvRekapSelKeluar: TcxGridBandedColumn
        Caption = 'Sel. Out'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        OnCustomDrawCell = gtvRekapSelKeluarCustomDrawCell
        Width = 59
        Position.BandIndex = 2
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvRekapTKeluar: TcxGridBandedColumn
        Caption = 'T. Out'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'tagid'
        Properties.ListColumns = <
          item
            FieldName = 'namatag'
          end>
        Properties.ListSource = dsTblTag
        Properties.ReadOnly = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvRekapTagAuto: TcxGridBandedColumn
        Caption = 'T. Auto'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'tagid'
        Properties.ListColumns = <
          item
            FieldName = 'namatag'
          end>
        Properties.ListSource = dsTblTag
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvRekapTagResult: TcxGridBandedColumn
        Caption = 'T. Result'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'tagid'
        Properties.ListColumns = <
          item
            FieldName = 'namatag'
          end>
        Properties.ListSource = dsTblTag
        Properties.ReadOnly = False
        OnCustomDrawCell = gtvRekapTagResultCustomDrawCell
        Width = 125
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvRekapJKSeharusnya: TcxGridBandedColumn
        Caption = 'JK. Jadwal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvRekapJKReal: TcxGridBandedColumn
        Caption = 'JK Real'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 3
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvRekapKomisi: TcxGridBandedColumn
        Caption = 'Komisi'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvRekapUMx3: TcxGridBandedColumn
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object gtvRekapNotes: TcxGridBandedColumn
        Caption = 'Notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Position.BandIndex = 3
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvRekapLibNas: TcxGridBandedColumn
        Caption = 'Lib. Nas'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Position.BandIndex = 3
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtvRekapKet: TcxGridBandedColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BandIndex = 3
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtvRekapTglKeluar: TcxGridBandedColumn
        Caption = 'Tgl Out'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvRekapNamaHari: TcxGridBandedColumn
        Caption = 'DDDD'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtvRekapTypeJadwal: TcxGridBandedColumn
        Caption = 'T. Jadwal'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtvRekapKodeJadwal: TcxGridBandedColumn
        Caption = 'K. Jadwal'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtvRekapKodeKontrak: TcxGridBandedColumn
        Caption = 'K. Kontrak'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object gtvRekapCKLembur: TcxGridBandedColumn
        Caption = 'OT'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Position.BandIndex = 2
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvRekapJLembur: TcxGridBandedColumn
        Caption = 'J. Lembur'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.InputKind = ikStandard
        Properties.Kind = ckDateTime
        Visible = False
        Styles.Content = cxStyle1
        Width = 140
        Position.BandIndex = 2
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvRekap
    end
  end
  object rbSearch: TcxRadioGroup
    Left = 8
    Top = 93
    Alignment = alTopCenter
    Caption = 'Search By'
    Properties.Columns = 4
    Properties.Items = <
      item
        Caption = 'ALL'
      end
      item
        Caption = 'DIVISI'
      end
      item
        Caption = 'ID FINGER'
      end
      item
        Caption = 'ID KARYAWAN'
      end>
    TabOrder = 1
    Visible = False
    Height = 41
    Width = 422
  end
  object edStart: TcxDateEdit
    Left = 84
    Top = 33
    EditValue = 0d
    TabOrder = 2
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 84
    Top = 61
    EditValue = 0d
    TabOrder = 3
    Width = 121
  end
  object tabControl: TcxPageControl
    Left = 211
    Top = 28
    Width = 442
    Height = 101
    TabOrder = 4
    Properties.ActivePage = tbAll
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 98
    ClientRectLeft = 2
    ClientRectRight = 439
    ClientRectTop = 27
    object tbDivisi: TcxTabSheet
      Caption = 'Search By Divisi'
      ImageIndex = 0
      object edDepartemen: TcxLookupComboBox
        Left = 3
        Top = 16
        ParentFont = False
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        Properties.MaxLength = 0
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 230
      end
      object btnDivisi: TButton
        Left = 244
        Top = 3
        Width = 185
        Height = 58
        Caption = 'Load Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnDivisiClick
      end
    end
    object tbKaryawan: TcxTabSheet
      Caption = 'By ID Karyawan'
      ImageIndex = 1
      object lblKodeKaryawan: TLabel
        Left = 3
        Top = 3
        Width = 15
        Height = 13
        Caption = '.....'
      end
      object lblIDFinger: TLabel
        Left = 3
        Top = 17
        Width = 15
        Height = 13
        Caption = '.....'
      end
      object lblNamaKaryawan: TLabel
        Left = 3
        Top = 31
        Width = 15
        Height = 13
        Caption = '.....'
      end
      object btnCariKaryawan: TButton
        Left = 196
        Top = 4
        Width = 75
        Height = 37
        Caption = 'Cari'
        TabOrder = 0
        OnClick = btnCariKaryawanClick
      end
      object btnLoadKode: TButton
        Left = 277
        Top = 2
        Width = 155
        Height = 42
        Caption = 'Load'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnLoadKodeClick
      end
      object edQuickSearch: TcxTextEdit
        Left = 3
        Top = 50
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 2
        TextHint = 'Type ID Karyawan and Press Enter'
        OnKeyPress = edQuickSearchKeyPress
        Width = 426
      end
    end
    object tbAll: TcxTabSheet
      Caption = 'All'
      ImageIndex = 2
      object btnLoadAll: TButton
        Left = 8
        Top = 3
        Width = 145
        Height = 54
        Caption = 'Load All'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnLoadAllClick
      end
    end
  end
  object btnExport: TButton
    Left = 888
    Top = 28
    Width = 89
    Height = 37
    Anchors = [akTop, akRight]
    Caption = 'Export Excel'
    TabOrder = 5
    OnClick = btnExportClick
  end
  object prog1: TcxProgressBar
    Left = 675
    Top = 28
    TabOrder = 6
    Width = 200
  end
  object prog2: TcxProgressBar
    Left = 675
    Top = 71
    TabOrder = 7
    Width = 200
  end
  object btnPost: TButton
    Left = 8
    Top = 503
    Width = 97
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'POST'
    TabOrder = 8
    OnClick = btnPostClick
  end
  object cxButton1: TcxButton
    Left = 880
    Top = 503
    Width = 75
    Height = 40
    Anchors = [akRight, akBottom]
    Caption = 'SELCT'
    DropDownMenu = pmGrid
    Kind = cxbkDropDown
    TabOrder = 9
  end
  object Memo1: TMemo
    Left = 668
    Top = 28
    Width = 207
    Height = 101
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 12
    Visible = False
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 16
    Top = 180
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 20
    Top = 232
  end
  object tblTag: TMyTable
    TableName = 'ben_presensi_tag'
    Connection = dmDB.dbInternal
    Left = 344
    Top = 212
  end
  object dsTblTag: TDataSource
    DataSet = tblTag
    Left = 348
    Top = 264
  end
  object tblShift: TMyTable
    TableName = 'ben_shift'
    Connection = dmDB.dbInternal
    Left = 284
    Top = 208
  end
  object dsTblShift: TDataSource
    DataSet = tblShift
    Left = 288
    Top = 260
  end
  object dlgSave: TSaveDialog
    Left = 168
    Top = 508
  end
  object pmGrid: TPopupMenu
    Left = 124
    Top = 508
    object SelectIn1: TMenuItem
      Caption = 'Select In'
      ShortCut = 115
      OnClick = SelectIn1Click
    end
    object SelectOut1: TMenuItem
      Caption = 'Select Out'
      ShortCut = 116
      OnClick = SelectOut1Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
    end
  end
end
