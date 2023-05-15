object frmJadwalOutlet: TfrmJadwalOutlet
  Left = 0
  Top = 0
  Caption = 'Form Jadwal Harian Outlet'
  ClientHeight = 475
  ClientWidth = 847
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
    847
    475)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 31
    Width = 59
    Height = 13
    Caption = 'Start Date'
  end
  object Label2: TLabel
    Left = 8
    Top = 58
    Width = 50
    Height = 13
    Caption = 'End Date'
  end
  object Label3: TLabel
    Left = 0
    Top = -4
    Width = 845
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Master Jadwal Outlet'
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
    Top = 82
    Width = 831
    Height = 331
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbJadwal: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryJadwal
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.GroupByBox = False
      object gtbJadwalautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbJadwalkodekaryawan: TcxGridDBColumn
        Caption = 'Kode Karyawan'
        DataBinding.FieldName = 'kodekaryawan'
        Width = 100
      end
      object gtbJadwaldepartemen: TcxGridDBColumn
        Caption = 'Divisi'
        DataBinding.FieldName = 'departemen'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbJadwalidkaryawan: TcxGridDBColumn
        Caption = 'ID Karyawan'
        DataBinding.FieldName = 'idkaryawan'
        Width = 100
      end
      object gtbJadwalnamakaryawan: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'namakaryawan'
        Width = 250
      end
      object gtbJadwalidoutlet: TcxGridDBColumn
        Caption = 'Outlet'
        DataBinding.FieldName = 'idoutlet'
        Visible = False
        Width = 100
      end
      object gtbJadwalkodeshift: TcxGridDBColumn
        Caption = 'Shift'
        DataBinding.FieldName = 'kodeshift'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Width = 100
      end
      object gtbJadwaltglmasuk: TcxGridDBColumn
        Caption = 'Tgl. Masuk'
        DataBinding.FieldName = 'tglmasuk'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbJadwaljmasuk: TcxGridDBColumn
        Caption = 'J. Masuk'
        DataBinding.FieldName = 'jmasuk'
        Width = 100
      end
      object gtbJadwaltglkeluar: TcxGridDBColumn
        Caption = 'Tgl Keluar'
        DataBinding.FieldName = 'tglkeluar'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbJadwaljkeluar: TcxGridDBColumn
        Caption = 'J. Keluar'
        DataBinding.FieldName = 'jkeluar'
        Width = 100
      end
      object gtbJadwalnotes: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'notes'
        Visible = False
        Width = 100
      end
      object gtbJadwalisupload: TcxGridDBColumn
        DataBinding.FieldName = 'isupload'
        Visible = False
        Width = 100
      end
      object gtbJadwallasteditdate: TcxGridDBColumn
        Caption = 'Last Edit Date'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbJadwallastedituser: TcxGridDBColumn
        Caption = 'Last Edit User'
        DataBinding.FieldName = 'lastedituser'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbJadwaltagedit: TcxGridDBColumn
        Caption = 'Tag Edit'
        DataBinding.FieldName = 'tagedit'
        PropertiesClassName = 'TcxTextEditProperties'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbJadwal
    end
  end
  object edStart: TcxDateEdit
    Left = 104
    Top = 28
    EditValue = 0d
    TabOrder = 1
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 104
    Top = 55
    EditValue = 0d
    TabOrder = 2
    Width = 121
  end
  object btnSearch: TButton
    Left = 231
    Top = 28
    Width = 75
    Height = 48
    Caption = 'Search'
    TabOrder = 3
    OnClick = btnSearchClick
  end
  object Button1: TButton
    Left = 8
    Top = 419
    Width = 81
    Height = 48
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 4
    OnClick = Button1Click
  end
  object btnChangeJadwal: TButton
    Left = 95
    Top = 419
    Width = 105
    Height = 48
    Anchors = [akLeft, akBottom]
    Caption = 'Change Jadwal'
    TabOrder = 5
    OnClick = btnChangeJadwalClick
  end
  object qryJadwal: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select *,'
      
        '(select ben_hrd_karyawan_info.idkaryawan from ben_hrd_karyawan_i' +
        'nfo where ben_hrd_karyawan_info.kodekaryawan = ben_hrd_jadwal_lo' +
        'cal.kodekaryawan) as idkaryawan,'
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info where ben_hrd_karyawan_info.kodekaryawan = ben_hrd_jadwal_' +
        'local.kodekaryawan) as namakaryawan,'
      
        '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_i' +
        'nfo where ben_hrd_karyawan_info.kodekaryawan = ben_hrd_jadwal_lo' +
        'cal.kodekaryawan) as departemen'
      'from ben_hrd_jadwal_local where isupload = '#39'N'#39)
    Left = 644
    Top = 28
  end
  object dsQryJadwal: TDataSource
    DataSet = qryJadwal
    Left = 712
    Top = 28
  end
  object tblShift: TMyTable
    TableName = 'ben_shift'
    Connection = dmDB.dbInternal
    Left = 476
    Top = 32
  end
  object dsTblShift: TDataSource
    DataSet = tblShift
    Left = 540
    Top = 32
  end
end
