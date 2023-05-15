object frmMasterKaryawan: TfrmMasterKaryawan
  Left = 0
  Top = 0
  Caption = '  List Master Karyawan'
  ClientHeight = 549
  ClientWidth = 971
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    971
    549)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = -4
    Top = 0
    Width = 975
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  List Karyawan  '
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 921
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 64
    Width = 947
    Height = 432
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbKaryawan: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryKaryawan
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbKaryawankodekaryawan: TcxGridDBColumn
        Caption = 'Kode Karyawan'
        DataBinding.FieldName = 'kodekaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKaryawanidkaryawan: TcxGridDBColumn
        Caption = 'ID Karyawan'
        DataBinding.FieldName = 'idkaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKaryawannamakaryawan: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'namakaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = True
        Width = 250
      end
      object gtbKaryawandepartemen: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'departemen'
        Width = 100
      end
      object gtbKaryawanjadwaltetap: TcxGridDBColumn
        Caption = 'Type Jadwal'
        DataBinding.FieldName = 'jadwaltetap'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 88
      end
      object gtbKaryawanlasteditdate: TcxGridDBColumn
        Caption = 'Last Date Edit'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKaryawanlastedituser: TcxGridDBColumn
        Caption = 'Last User Edit'
        DataBinding.FieldName = 'lastedituser'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKaryawantagedit: TcxGridDBColumn
        DataBinding.FieldName = 'tagedit'
        Visible = False
        Width = 100
      end
      object gtbKaryawanactive: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'active'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 100
      end
      object gtbKaryawankodejadwal: TcxGridDBColumn
        DataBinding.FieldName = 'kodejadwal'
        Visible = False
        Width = 100
      end
      object gtbKaryawankodekontrak: TcxGridDBColumn
        Caption = 'Kode Kontrak'
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
      object gtbKaryawantglmasukkerja: TcxGridDBColumn
        Caption = 'Tgl masuk Kerja'
        DataBinding.FieldName = 'tglmasukkerja'
        Visible = False
        Width = 100
      end
      object gtbKaryawantglhabiskontrak: TcxGridDBColumn
        DataBinding.FieldName = 'tglhabiskontrak'
        Visible = False
        Width = 100
      end
      object gtbKaryawannamabank: TcxGridDBColumn
        DataBinding.FieldName = 'namabank'
        Visible = False
        Width = 100
      end
      object gtbKaryawannorek: TcxGridDBColumn
        DataBinding.FieldName = 'norek'
        Visible = False
        Width = 100
      end
      object gtbKaryawanisadmin: TcxGridDBColumn
        Caption = 'Is Admin'
        DataBinding.FieldName = 'isadmin'
        Width = 100
      end
      object gtbKaryawanidoutlet: TcxGridDBColumn
        Caption = 'Outlet'
        DataBinding.FieldName = 'idoutlet'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodeoutlet'
        Properties.ListColumns = <
          item
            FieldName = 'namaoutlet'
          end>
        Properties.ListSource = dsTblOutlet
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbKaryawan
    end
  end
  object btnNew: TButton
    Left = 116
    Top = 502
    Width = 101
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 1
    OnClick = btnNewClick
  end
  object btnEdit: TButton
    Left = 223
    Top = 502
    Width = 101
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 'Edit'
    TabOrder = 2
    OnClick = btnEditClick
  end
  object btnSelect: TButton
    Tag = 1
    Left = 854
    Top = 502
    Width = 101
    Height = 39
    Anchors = [akRight, akBottom]
    Caption = 'Select'
    TabOrder = 3
    OnClick = btnSelectClick
  end
  object ckFilter: TcxCheckBox
    Left = 8
    Top = 29
    Caption = 'All / Active'
    Properties.OnChange = ckFilterPropertiesChange
    State = cbsChecked
    TabOrder = 4
  end
  object btnKontrak: TButton
    Left = 330
    Top = 502
    Width = 107
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 'Kontrak Update'
    TabOrder = 5
    OnClick = btnKontrakClick
  end
  object btnRefresh: TButton
    Left = 9
    Top = 502
    Width = 101
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh'
    TabOrder = 6
    OnClick = btnRefreshClick
  end
  object tblKaryawan: TMyTable
    TableName = 'ben_hrd_karyawan_info'
    Connection = dmDB.dbInternal
    Left = 812
    Top = 16
  end
  object dsTblKaryawan: TDataSource
    DataSet = tblKaryawan
    Left = 812
    Top = 72
  end
  object tblOutlet: TMyTable
    TableName = 'ben_outlet'
    Connection = dmDB.dbInternal
    Left = 720
    Top = 12
  end
  object dsTblOutlet: TDataSource
    DataSet = tblOutlet
    Left = 720
    Top = 68
  end
  object tblJadwalTetap: TMyTable
    TableName = 'ben_hrd_jadwal_tetap'
    Connection = dmDB.dbInternal
    Left = 492
    Top = 12
  end
  object dsTblJadwalTetap: TDataSource
    DataSet = tblJadwalTetap
    Left = 496
    Top = 64
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 260
    Top = 164
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 260
    Top = 212
  end
  object tblKontrak: TMyTable
    TableName = 'ben_hrd_kontrak_master'
    Connection = dmDB.dbInternal
    Left = 140
    Top = 156
  end
  object dsTblKontrak: TDataSource
    DataSet = tblKontrak
    Left = 140
    Top = 204
  end
  object qryKaryawan: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from ben_hrd_karyawan_info where active = '#39'Y'#39)
    Left = 552
    Top = 328
  end
  object dsQryKaryawan: TDataSource
    DataSet = qryKaryawan
    Left = 632
    Top = 328
  end
end
