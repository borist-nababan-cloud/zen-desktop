object frmLapRekapAbsen: TfrmLapRekapAbsen
  Left = 0
  Top = 0
  ClientHeight = 355
  ClientWidth = 720
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    720
    355)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 719
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Laporan Rekap Absen Harian'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 973
  end
  object Label1: TLabel
    Left = 7
    Top = 31
    Width = 59
    Height = 13
    Caption = 'Start Date'
  end
  object Label2: TLabel
    Left = 7
    Top = 54
    Width = 50
    Height = 13
    Caption = 'End Date'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 75
    Width = 704
    Height = 272
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbRepRekap: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryRepRekap
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
          Column = gtbRepRekaptanggal
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbRepRekapkodekaryawan
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbRepRekaptagresult
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtbRepRekaptanggal
        end
        item
          Kind = skCount
          Column = gtbRepRekapkodekaryawan
        end
        item
          Kind = skCount
          Column = gtbRepRekaptagresult
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbRepRekaptanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbRepRekapkodekaryawan: TcxGridDBColumn
        Caption = 'NIK'
        DataBinding.FieldName = 'kodekaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbRepRekapidkaryawan: TcxGridDBColumn
        Caption = 'ID Finger'
        DataBinding.FieldName = 'idkaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbRepRekapdepartemen: TcxGridDBColumn
        Caption = 'Divisi'
        DataBinding.FieldName = 'departemen'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        Width = 125
      end
      object gtbRepRekapnama: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object gtbRepRekapjadwalmasuk: TcxGridDBColumn
        Caption = 'J. Masuk'
        DataBinding.FieldName = 'jadwalmasuk'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbRepRekapjadwalkeluar: TcxGridDBColumn
        Caption = 'J. Keluar'
        DataBinding.FieldName = 'jadwalkeluar'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbRepRekapfpmasuk: TcxGridDBColumn
        Caption = 'FP. Masuk'
        DataBinding.FieldName = 'fpmasuk'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbRepRekapfpkeluar: TcxGridDBColumn
        Caption = 'FP. Keluar'
        DataBinding.FieldName = 'fpkeluar'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbRepRekaptagresult: TcxGridDBColumn
        Caption = 'Result'
        DataBinding.FieldName = 'tagresult'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'tagid'
        Properties.ListColumns = <
          item
            FieldName = 'namatag'
          end>
        Properties.ListSource = dsTblTag
        Width = 100
      end
      object gtbRepRekapketerangan: TcxGridDBColumn
        DataBinding.FieldName = 'keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 250
      end
      object gtbRepRekaplastedituser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'lastedituser'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbRepRekaplasteditdate: TcxGridDBColumn
        Caption = 'Date Post'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbRepRekap
    end
  end
  object edStart: TcxDateEdit
    Left = 75
    Top = 28
    EditValue = 0d
    TabOrder = 1
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 75
    Top = 51
    EditValue = 0d
    TabOrder = 2
    Width = 121
  end
  object btnLoad: TButton
    Left = 202
    Top = 28
    Width = 79
    Height = 41
    Caption = 'Load '
    TabOrder = 3
    OnClick = btnLoadClick
  end
  object btnExport: TButton
    Left = 625
    Top = 28
    Width = 87
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'Export Excel'
    TabOrder = 4
    OnClick = btnExportClick
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = DMDB.StoreDB
    Left = 80
    Top = 100
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 80
    Top = 156
  end
  object tblTag: TMyTable
    TableName = 'ben_presensi_tag'
    Connection = DMDB.StoreDB
    Left = 12
    Top = 104
  end
  object dsTblTag: TDataSource
    DataSet = tblTag
    Left = 12
    Top = 156
  end
  object qryRepRekap: TMyQuery
    Connection = DMDB.StoreDB
    SQL.Strings = (
      'select tanggal, kodekaryawan, idkaryawan, jadwalmasuk, '
      'jadwalkeluar, fpmasuk, fpkeluar, tagresult, keterangan, '
      'lastedituser, lasteditdate, '
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info where ben_hrd_karyawan_info.kodekaryawan = ben_presensi_de' +
        'tails.kodekaryawan) as nama,'
      
        '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_i' +
        'nfo where ben_hrd_karyawan_info.kodekaryawan = ben_presensi_deta' +
        'ils.kodekaryawan) as departemen'
      'from ben_presensi_details'
      'where idkaryawan = '#39'X'#39)
    Left = 16
    Top = 208
  end
  object dsQryRepRekap: TDataSource
    DataSet = qryRepRekap
    Left = 20
    Top = 256
  end
  object dlgSave: TSaveDialog
    Left = 388
    Top = 32
  end
end
