object frmTHRReport: TfrmTHRReport
  Left = 0
  Top = 0
  Caption = 'Laporan THR'
  ClientHeight = 447
  ClientWidth = 860
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    860
    447)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulForm: TLabel
    Left = 0
    Top = 0
    Width = 857
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Report THR'
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
  object Bevel1: TBevel
    Left = 8
    Top = 32
    Width = 465
    Height = 53
  end
  object Label1: TLabel
    Left = 20
    Top = 48
    Width = 110
    Height = 16
    Caption = 'Select THR Periode'
  end
  object edKode: TcxLookupComboBox
    Left = 148
    Top = 44
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodethr'
    Properties.ListColumns = <
      item
        FieldName = 'kodethr'
      end>
    Properties.ListSource = dsQryKode
    TabOrder = 0
    Width = 193
  end
  object btnLoad: TcxButton
    Left = 360
    Top = 38
    Width = 97
    Height = 37
    Caption = 'LOAD'
    TabOrder = 1
    OnClick = btnLoadClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 91
    Width = 844
    Height = 348
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbListkodethr: TcxGridDBColumn
        Caption = 'Kode THR'
        DataBinding.FieldName = 'kodethr'
        Width = 100
      end
      object gtbListkodekaryawan: TcxGridDBColumn
        Caption = 'NIK'
        DataBinding.FieldName = 'kodekaryawan'
        Width = 100
      end
      object gtbListidkaryawan: TcxGridDBColumn
        Caption = 'ID Finger'
        DataBinding.FieldName = 'idkaryawan'
        Width = 100
      end
      object gtbListnamakaryawan: TcxGridDBColumn
        Caption = 'Nama '
        DataBinding.FieldName = 'namakaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbListdepartemen: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'departemen'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        Width = 100
      end
      object gtbListkodekontrak: TcxGridDBColumn
        Caption = 'Kontrak'
        DataBinding.FieldName = 'kodekontrak'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodekontrak'
        Properties.ListColumns = <
          item
            FieldName = 'namakontrak'
          end>
        Properties.ListSource = dsTblKontrak
        Width = 100
      end
      object gtbListtglmasukkerja: TcxGridDBColumn
        Caption = 'Tgl Masuk'
        DataBinding.FieldName = 'tglmasukkerja'
        Width = 100
      end
      object gtbListgapok: TcxGridDBColumn
        Caption = 'V. Gapok'
        DataBinding.FieldName = 'gapok'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListlamakerja: TcxGridDBColumn
        Caption = 'Lama Kerja'
        DataBinding.FieldName = 'lamakerja'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListvalue: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'value'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListtambahan: TcxGridDBColumn
        Caption = 'Tambahan'
        DataBinding.FieldName = 'tambahan'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListpayment: TcxGridDBColumn
        Caption = 'Payment'
        DataBinding.FieldName = 'payment'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListnamabank: TcxGridDBColumn
        Caption = 'Bank'
        DataBinding.FieldName = 'namabank'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListnorek: TcxGridDBColumn
        Caption = 'No. Rek'
        DataBinding.FieldName = 'norek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListnamarek: TcxGridDBColumn
        Caption = 'Nama Rek'
        DataBinding.FieldName = 'namarek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
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
          Caption = 'THR'
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
      object tvListGapok: TcxGridBandedColumn
        PropertiesClassName = 'TcxCalcEditProperties'
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object tvListTHR: TcxGridBandedColumn
        Caption = 'Value'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.#0'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 150
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object tvListTambahan: TcxGridBandedColumn
        PropertiesClassName = 'TcxCalcEditProperties'
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object tvListPayment: TcxGridBandedColumn
        PropertiesClassName = 'TcxCalcEditProperties'
        Position.BandIndex = 2
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object cxButton3: TcxButton
    Left = 756
    Top = 32
    Width = 96
    Height = 47
    Anchors = [akTop, akRight]
    Caption = 'EXPORT'
    TabOrder = 3
    OnClick = cxButton3Click
  end
  object qryKode: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select kodethr from ben_thr_periode where aktif = '#39'Y'#39'  order by ' +
        'kodethr DESC LIMIT 5')
    Left = 768
    Top = 40
  end
  object dsQryKode: TDataSource
    DataSet = qryKode
    Left = 772
    Top = 88
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select kodethr, kodekaryawan, idkaryawan, namakaryawan, departem' +
        'en, kodekontrak, tglmasukkerja, gapok, lamakerja, '
      'value, tambahan, payment,'
      
        '(select ben_hrd_karyawan_info.norek from  ben_hrd_karyawan_info ' +
        'where ben_hrd_karyawan_info.kodekaryawan = ben_thr_value.kodekar' +
        'yawan) as norek,'
      
        '(select ben_hrd_karyawan_info.namarek from  ben_hrd_karyawan_inf' +
        'o where ben_hrd_karyawan_info.kodekaryawan = ben_thr_value.kodek' +
        'aryawan) as namarek,'
      
        '(select ben_hrd_karyawan_info.namabank from  ben_hrd_karyawan_in' +
        'fo where ben_hrd_karyawan_info.kodekaryawan = ben_thr_value.kode' +
        'karyawan) as namabank'
      'FROM ben_thr_value where kodethr = '#39'x'#39)
    Left = 36
    Top = 172
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 36
    Top = 228
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 112
    Top = 172
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 116
    Top = 224
  end
  object tblKontrak: TMyTable
    TableName = 'ben_hrd_kontrak_master'
    Connection = dmDB.dbInternal
    Left = 272
    Top = 172
  end
  object dsTblKontrak: TDataSource
    DataSet = tblKontrak
    Left = 276
    Top = 224
  end
  object dlgSave: TSaveDialog
    Left = 512
    Top = 40
  end
end
