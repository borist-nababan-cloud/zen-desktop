object frmIjinCutiList: TfrmIjinCutiList
  Left = 0
  Top = 0
  Caption = '  Presensi List Cuti Karyawan'
  ClientHeight = 480
  ClientWidth = 713
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
    713
    480)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = -2
    Top = -4
    Width = 715
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Presensi List Cuti Karyawan'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 529
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 28
    Width = 697
    Height = 397
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.DragDropText = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbListtglstart: TcxGridDBColumn
        Caption = 'Tgl Start'
        DataBinding.FieldName = 'tglstart'
        PropertiesClassName = 'TcxDateEditProperties'
        SortIndex = 0
        SortOrder = soDescending
        Width = 100
      end
      object gtbListtglend: TcxGridDBColumn
        Caption = 'Tgl End'
        DataBinding.FieldName = 'tglend'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbListtglpengajuan: TcxGridDBColumn
        Caption = 'Tgl Pengajuan'
        DataBinding.FieldName = 'tglpengajuan'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbListkodekaryawan: TcxGridDBColumn
        Caption = 'Kode Karyawan'
        DataBinding.FieldName = 'kodekaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 250
      end
      object gtbListidkaryawan: TcxGridDBColumn
        Caption = 'ID Karyawan'
        DataBinding.FieldName = 'idkaryawan'
        Width = 100
      end
      object gtbListnamakaryawan: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'namakaryawan'
        Width = 100
      end
      object gtbListlastedituser: TcxGridDBColumn
        Caption = 'Last Edit User'
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        Caption = 'Last Edit Date'
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
      object gtbListketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 300
      end
      object gtbListjumlah: TcxGridDBColumn
        Caption = 'Jmlh Hari'
        DataBinding.FieldName = 'jumlah'
        Width = 100
      end
      object gtbListsisa: TcxGridDBColumn
        Caption = 'Sisa'
        DataBinding.FieldName = 'sisa'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 75
      end
      object gtbListnomorcuti: TcxGridDBColumn
        Caption = 'Nomor Cuti'
        DataBinding.FieldName = 'nomorcuti'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnRefresh: TButton
    Left = 8
    Top = 431
    Width = 89
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh'
    TabOrder = 1
    OnClick = btnRefreshClick
  end
  object btnCancelCuti: TButton
    Left = 616
    Top = 431
    Width = 89
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = 'Cancel Cuti'
    TabOrder = 2
    OnClick = btnCancelCutiClick
  end
  object btnAddCuti: TButton
    Left = 115
    Top = 431
    Width = 89
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'Add Cuti'
    TabOrder = 3
    OnClick = btnAddCutiClick
  end
  object btnCetakUlang: TButton
    Left = 210
    Top = 431
    Width = 89
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'Cetak Ulang'
    TabOrder = 4
    OnClick = btnCetakUlangClick
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select nomorcuti, tglpengajuan, kodekaryawan, '
      
        '(select ben_hrd_karyawan_info.idkaryawan from ben_hrd_karyawan_i' +
        'nfo where ben_hrd_karyawan_info.kodekaryawan = ben_presensi_cuti' +
        '.kodekaryawan) as idkaryawan,'
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info where ben_hrd_karyawan_info.kodekaryawan = ben_presensi_cu' +
        'ti.kodekaryawan) as namakaryawan,'
      
        'lastedituser, lasteditdate, tglstart, tglend, jumlah, keterangan' +
        ', sisa'
      'from ben_presensi_cuti'
      'WHERE ben_presensi_cuti.tagpresensi <> '#39'ID'#39
      'GROUP BY nomorcuti ORDER BY nomorcuti DESC LIMIT 1000')
    Left = 416
    Top = 8
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 484
    Top = 8
  end
end
