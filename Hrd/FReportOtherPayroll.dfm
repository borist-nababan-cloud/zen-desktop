object frmReportOtherPayroll: TfrmReportOtherPayroll
  Left = 0
  Top = 0
  Caption = 'Report Payroll Other'
  ClientHeight = 562
  ClientWidth = 952
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    952
    562)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 92
    Width = 43
    Height = 13
    Caption = 'Periode'
  end
  object Label2: TLabel
    Left = 188
    Top = 92
    Width = 42
    Height = 13
    Caption = 'Sampai'
  end
  object Label3: TLabel
    Left = 8
    Top = 70
    Width = 35
    Height = 13
    Caption = 'Outlet'
  end
  object lblJudulForm: TLabel
    Left = 3
    Top = 0
    Width = 941
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = ' LAPORAN OTHER PAYROLL'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 891
  end
  object edPeriode: TComboBox
    Left = 8
    Top = 32
    Width = 257
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 279
    Top = 31
    Width = 90
    Height = 39
    Caption = 'LOAD '
    TabOrder = 1
    OnClick = Button1Click
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 116
    Width = 936
    Height = 391
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbListnamarek
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbListnamabank
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbListnamakaryawan
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbListidkaryawan
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbListkodekaryawan
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbListkodekaryawan: TcxGridDBColumn
        Caption = 'Kode Karyawan'
        DataBinding.FieldName = 'kodekaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 100
      end
      object gtbListidkaryawan: TcxGridDBColumn
        Caption = 'ID Finger'
        DataBinding.FieldName = 'idkaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 100
      end
      object gtbListnamakaryawan: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'namakaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 250
      end
      object gtbListnamabank: TcxGridDBColumn
        Caption = 'Bank'
        DataBinding.FieldName = 'namabank'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 100
      end
      object gtbListnamarek: TcxGridDBColumn
        Caption = 'Nama Rekening'
        DataBinding.FieldName = 'namarek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 100
      end
      object gtbListNorek: TcxGridDBColumn
        Caption = 'No. Rekening'
        DataBinding.FieldName = 'norek'
      end
      object gtbListTHP: TcxGridDBColumn
        Caption = 'Nilai THP'
        DataBinding.FieldName = 'nilaithp'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.#0'
        Properties.UseThousandSeparator = True
      end
    end
    object tvList: TcxGridBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skCount
          Column = tvListKodeKaryawan
        end
        item
          Format = '0'
          Kind = skCount
          Column = tvListIDFinger
        end
        item
          Format = '0'
          Kind = skCount
          Column = tvListNama
        end
        item
          Format = '0'
          Kind = skCount
          Column = tvListBank
        end
        item
          Format = '0'
          Kind = skCount
          Column = tvListNoRek
        end
        item
          Format = '0'
          Kind = skCount
          Column = tvListNamaRek
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.BandsQuickCustomization = True
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'KARYAWAN INFO'
        end
        item
          Caption = 'BANK INFO'
        end
        item
          Caption = 'THP'
        end>
      object tvListKodeKaryawan: TcxGridBandedColumn
        Caption = 'Kode Karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object tvListIDFinger: TcxGridBandedColumn
        Caption = 'ID Finger'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object tvListNama: TcxGridBandedColumn
        Caption = 'Nama Karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object tvListDivisi: TcxGridBandedColumn
        Caption = 'Divisi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object tvListBank: TcxGridBandedColumn
        Caption = 'Bank'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object tvListNoRek: TcxGridBandedColumn
        Caption = 'No. Rek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object tvListNamaRek: TcxGridBandedColumn
        Caption = 'Nama Rek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object tvListVGapok: TcxGridBandedColumn
        Caption = 'Gapok'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 125
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object tvListVTunjangan: TcxGridBandedColumn
        Caption = 'Tunjangan'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 125
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object tvListNilai: TcxGridBandedColumn
        Caption = 'Nilai'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 125
        Position.BandIndex = 2
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object tvListTambahan: TcxGridBandedColumn
        Caption = 'Tambahan'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 125
        Position.BandIndex = 2
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object tvListTHR: TcxGridBandedColumn
        Caption = 'THR'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 125
        Position.BandIndex = 2
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object tvListLamaKerja: TcxGridBandedColumn
        Caption = 'Lama Kerja'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 125
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object tvListTglMsk: TcxGridBandedColumn
        Caption = 'Tgl Masuk'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = tvList
    end
  end
  object Button2: TButton
    Left = 8
    Top = 513
    Width = 101
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'SLIP SATUAN'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 115
    Top = 513
    Width = 101
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'SLIP ALL'
    TabOrder = 4
    OnClick = Button3Click
  end
  object edStart: TcxDateEdit
    Left = 56
    Top = 89
    EditValue = 0d
    TabOrder = 5
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 256
    Top = 89
    EditValue = 0d
    TabOrder = 6
    Width = 121
  end
  object edOutlet: TcxLookupComboBox
    Left = 56
    Top = 65
    Properties.KeyFieldNames = 'kodeoutlet'
    Properties.ListColumns = <
      item
        FieldName = 'namaoutlet'
      end>
    Properties.ListSource = dsTblOutlet
    TabOrder = 7
    Width = 209
  end
  object cbPrinter: TComboBox
    Left = 222
    Top = 523
    Width = 189
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 8
    Text = 'select printer'
  end
  object btnExport: TButton
    Left = 852
    Top = 20
    Width = 79
    Height = 36
    Anchors = [akTop, akRight]
    Caption = 'Export Excel'
    TabOrder = 9
    OnClick = btnExportClick
  end
  object Button4: TButton
    Left = 767
    Top = 20
    Width = 79
    Height = 36
    Anchors = [akTop, akRight]
    Caption = 'Export TXT'
    TabOrder = 10
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 843
    Top = 513
    Width = 101
    Height = 41
    Anchors = [akRight, akBottom]
    Caption = 'KOMISI ALL'
    TabOrder = 11
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 736
    Top = 513
    Width = 101
    Height = 41
    Anchors = [akRight, akBottom]
    Caption = 'KOMISI SATUAN'
    TabOrder = 12
    OnClick = Button6Click
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 472
    Top = 28
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 476
    Top = 80
  end
  object tblOutlet: TMyTable
    TableName = 'ben_outlet'
    Connection = dmDB.dbInternal
    Left = 672
    Top = 28
  end
  object dsTblOutlet: TDataSource
    DataSet = tblOutlet
    Left = 676
    Top = 80
  end
  object mySQLQuery1: TMyQuery
    Connection = dmDB.dbInternal
    Left = 860
    Top = 76
  end
  object qrySlip: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select ben_payroll_other.*, '
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_oth' +
        'er.kodekaryawan) as namakaryawan, '
      
        '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_i' +
        'nfo where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_other' +
        '.kodekaryawan) as kodedivisi, '
      
        '(select departemen.nama_departemen from departemen where departe' +
        'men.id_departemen = kodedivisi) as namadivisi '
      'FROM  ben_payroll_other'
      'WHERE kodepayroll = '#39'X'#39)
    Left = 740
    Top = 40
  end
  object dsQrySlip: TDataSource
    DataSet = qrySlip
    Left = 740
    Top = 92
  end
  object dlgSave: TSaveDialog
    Left = 920
    Top = 72
  end
end
