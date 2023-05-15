object frmPayrollOther: TfrmPayrollOther
  Left = 0
  Top = 0
  ClientHeight = 452
  ClientWidth = 754
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    754
    452)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 752
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Transaksi Tambahan Payroll'
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
    Left = 8
    Top = 35
    Width = 78
    Height = 16
    Caption = 'Pilih Periode'
  end
  object Label3: TLabel
    Left = 8
    Top = 71
    Width = 41
    Height = 16
    Caption = 'BULAN'
  end
  object Label4: TLabel
    Left = 292
    Top = 71
    Width = 42
    Height = 16
    Caption = 'TAHUN'
  end
  object Label5: TLabel
    Left = 9
    Top = 128
    Width = 82
    Height = 16
    Caption = 'KETERANGAN'
  end
  object Label6: TLabel
    Left = 8
    Top = 99
    Width = 50
    Height = 16
    Caption = 'Tanggal'
  end
  object edPeriode: TComboBox
    Left = 100
    Top = 32
    Width = 177
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 0
    OnChange = edPeriodeChange
  end
  object Button1: TButton
    Left = 379
    Top = 32
    Width = 131
    Height = 31
    Caption = 'New'
    TabOrder = 1
    OnClick = Button1Click
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 160
    Width = 738
    Height = 250
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object gtvOther: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      OnEditing = gtvOtherEditing
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtvOtherNIK: TcxGridColumn
        Caption = 'NIK'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvOtherIDFinger: TcxGridColumn
        Caption = 'ID Finger'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvOtherNama: TcxGridColumn
        Caption = 'Nama Karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvOtherDivisi: TcxGridColumn
        Caption = 'Divisi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDivisi
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvOtherLama: TcxGridColumn
        Caption = 'Bulan Kerja'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvOtherVGapok: TcxGridColumn
        Caption = 'V. Gapok'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 125
      end
      object gtvOtherVTunjangan: TcxGridColumn
        Caption = 'V. Tunjangan'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 125
      end
      object gtvOtherNilai: TcxGridColumn
        Caption = 'Nilai Payroll'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 125
      end
      object gtvOtherTambahan: TcxGridColumn
        Caption = 'Tambahan'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Width = 125
      end
      object gtvOtherTotal: TcxGridColumn
        Caption = 'Total'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Properties.OnValidate = gtvOtherTotalPropertiesValidate
        Width = 125
      end
      object gtvOtherNotes: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvOther
    end
  end
  object edKeterangan: TEdit
    Left = 101
    Top = 125
    Width = 421
    Height = 24
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edBulan: TEdit
    Left = 100
    Top = 68
    Width = 177
    Height = 24
    ReadOnly = True
    TabOrder = 4
  end
  object edTahun: TEdit
    Left = 340
    Top = 68
    Width = 181
    Height = 24
    ReadOnly = True
    TabOrder = 5
  end
  object btnLoad: TButton
    Left = 283
    Top = 32
    Width = 90
    Height = 30
    Caption = 'LOAD'
    TabOrder = 6
    OnClick = btnLoadClick
  end
  object memoStruktur: TMemo
    Left = 532
    Top = 32
    Width = 214
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'CREATE TABLE `ben_payroll_other` '
      '('
      '  `autonum` bigint(20) NOT NULL '
      'AUTO_INCREMENT,'
      '  `kodepayroll` varchar(30) NOT '
      'NULL DEFAULT '#39#39','
      '  `idoutlet` char(3) DEFAULT NULL,'
      '  `bulan` varchar(50) DEFAULT '
      'NULL,'
      '  `tahun` int(4) DEFAULT NULL,'
      '  `tglperiode` date DEFAULT NULL,'
      '  `tglend` date DEFAULT NULL,'
      '  `keterangan` varchar(255) '
      'DEFAULT NULL,'
      '  `kodekaryawan` varchar(30) NOT '
      'NULL DEFAULT '#39#39','
      '  `idkaryawan` varchar(5) DEFAULT '
      'NULL,'
      '  `departemen` char(10) DEFAULT '
      'NULL,'
      '  `masakerja` int(3) DEFAULT NULL,'
      '  `vgapok` double DEFAULT NULL,'
      '  `vtunjangan` double DEFAULT '
      'NULL,'
      '  `nilai` double DEFAULT NULL,'
      '  `tambahan` double DEFAULT '
      'NULL,'
      '  `total` double DEFAULT NULL,'
      '  `ketpayroll` varchar(255) '
      'DEFAULT NULL,'
      '  `lastedituser` varchar(30) '
      'DEFAULT NULL,'
      '  `lasteditdate` datetime DEFAULT '
      'NULL,'
      '  PRIMARY KEY (`autonum`),'
      '  KEY `idxkodepayroll` '
      '(`kodepayroll`)'
      ') ENGINE=MyISAM DEFAULT '
      'CHARSET=latin1;')
    ParentFont = False
    TabOrder = 7
    Visible = False
  end
  object Button2: TButton
    Left = 8
    Top = 413
    Width = 141
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = 'Re-Load Karyawan'
    TabOrder = 8
  end
  object edTglperiode: TcxDateEdit
    Left = 100
    Top = 96
    EditValue = 0d
    TabOrder = 9
    Width = 177
  end
  object btnSimpan: TButton
    Left = 532
    Top = 68
    Width = 121
    Height = 76
    Caption = 'SAVE'
    TabOrder = 10
    OnClick = btnSimpanClick
  end
  object btnExport: TButton
    Left = 636
    Top = 413
    Width = 110
    Height = 31
    Anchors = [akRight, akBottom]
    Caption = 'Export Excel'
    TabOrder = 11
    OnClick = btnExportClick
  end
  object tblDivisi: TMyTable
    TableName = 'departemen'
    Connection = DMDB.StoreDB
    Left = 372
    Top = 224
  end
  object dsTblDivisi: TDataSource
    DataSet = tblDivisi
    Left = 376
    Top = 280
  end
  object dlgSave: TSaveDialog
    Left = 800
    Top = 32
  end
end
