object frmIjinSakitList: TfrmIjinSakitList
  Left = 0
  Top = 0
  Caption = ' List Presensi Karyawan Sakit'
  ClientHeight = 509
  ClientWidth = 851
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
    851
    509)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 4
    Width = 835
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  List Presensi Karyawan Sakit'
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
  object cxGrid1: TcxGrid
    Left = 8
    Top = 40
    Width = 835
    Height = 413
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbListnomorijin: TcxGridDBColumn
        Caption = 'No. Ijin'
        DataBinding.FieldName = 'nomorijin'
        Width = 100
      end
      object gtbListtglpengajuan: TcxGridDBColumn
        Caption = 'Tgl Pengajuan'
        DataBinding.FieldName = 'tglpengajuan'
        Width = 100
      end
      object gtbListtanggal: TcxGridDBColumn
        Caption = 'Tanggal Ijin'
        DataBinding.FieldName = 'tanggal'
        Width = 100
      end
      object gtbListkodekaryawan: TcxGridDBColumn
        Caption = 'Kode Karyawan'
        DataBinding.FieldName = 'kodekaryawan'
        Width = 100
      end
      object gtbListidkaryawan: TcxGridDBColumn
        Caption = 'ID Karyawan'
        DataBinding.FieldName = 'idkaryawan'
        Width = 100
      end
      object gtbListnamakaryawan: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'namakaryawan'
        Width = 250
      end
      object gtbListnamatag: TcxGridDBColumn
        Caption = 'Tag Presensi'
        DataBinding.FieldName = 'namatag'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 143
      end
      object gtbListketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 300
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
      object gtbListtagpresensi: TcxGridDBColumn
        Caption = 'Tag'
        DataBinding.FieldName = 'tagpresensi'
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnRefresh: TButton
    Left = 8
    Top = 463
    Width = 89
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh'
    TabOrder = 1
    OnClick = btnRefreshClick
  end
  object btnCancelCuti: TButton
    Left = 708
    Top = 463
    Width = 135
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = 'Cancel Surat Sakit'
    TabOrder = 2
    OnClick = btnCancelCutiClick
  end
  object btnAddCuti: TButton
    Left = 115
    Top = 463
    Width = 89
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'Add Sakit'
    TabOrder = 3
    OnClick = btnAddCutiClick
  end
  object btnCetakUlang: TButton
    Left = 210
    Top = 463
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
      
        'select nomorijin, tglpengajuan, kodekaryawan, lastedituser, last' +
        'editdate, tanggal, keterangan, '
      
        '(select ben_hrd_karyawan_info.idkaryawan from ben_hrd_karyawan_i' +
        'nfo where ben_hrd_karyawan_info.kodekaryawan = ben_presensi_ijin' +
        '.kodekaryawan) as idkaryawan,'
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info where ben_hrd_karyawan_info.kodekaryawan = ben_presensi_ij' +
        'in.kodekaryawan) as namakaryawan,'
      'tagpresensi,  '
      
        '(select ben_presensi_tag.namatag from ben_presensi_tag where ben' +
        '_presensi_tag.tagid = ben_presensi_ijin.tagpresensi) as namatag'
      'from ben_presensi_ijin '
      'WHERE ben_presensi_ijin.tagpresensi = '#39'S'#39
      'ORDER BY tanggal DESC LIMIT 999')
    Left = 416
    Top = 8
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 484
    Top = 8
  end
end
