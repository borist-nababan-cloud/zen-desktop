object frmJadwalAll: TfrmJadwalAll
  Left = 0
  Top = 0
  ClientHeight = 580
  ClientWidth = 874
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
    874
    580)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 216
    Height = 26
    Caption = '  JADWAL LOCAL OUTLET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 20
    Top = 48
    Width = 59
    Height = 13
    Caption = 'Start Date'
  end
  object Label2: TLabel
    Left = 20
    Top = 75
    Width = 50
    Height = 13
    Caption = 'End Date'
  end
  object lblStatus: TLabel
    Left = 854
    Top = 8
    Width = 12
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = '....'
  end
  object edStart: TcxDateEdit
    Left = 116
    Top = 45
    EditValue = 0d
    TabOrder = 0
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 116
    Top = 72
    EditValue = 0d
    TabOrder = 1
    Width = 121
  end
  object btnSearch: TButton
    Left = 243
    Top = 48
    Width = 75
    Height = 40
    Caption = 'Search'
    TabOrder = 2
    OnClick = btnSearchClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 104
    Width = 858
    Height = 461
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
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
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodeoutlet'
        Properties.ListColumns = <
          item
            FieldName = 'nama'
          end>
        Properties.ListSource = dsTblOutlet
        Width = 100
      end
      object gtbJadwalkodeshift: TcxGridDBColumn
        Caption = 'Shift'
        DataBinding.FieldName = 'kodeshift'
        Width = 100
      end
      object gtbJadwaltanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 100
      end
      object gtbJadwaljmasuk: TcxGridDBColumn
        Caption = 'J. Masuk'
        DataBinding.FieldName = 'jmasuk'
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
        Width = 100
      end
      object gtbJadwalisupload: TcxGridDBColumn
        DataBinding.FieldName = 'isupload'
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbJadwal
    end
  end
  object qryJadwal: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select *,'
      
        '(select hrd_karyawan_info.idkaryawan from hrd_karyawan_info wher' +
        'e hrd_karyawan_info.kodekaryawan = hrd_jadwal_local.kodekaryawan' +
        ') as idkaryawan,'
      
        '(select hrd_karyawan_info.namakaryawan from hrd_karyawan_info wh' +
        'ere hrd_karyawan_info.kodekaryawan = hrd_jadwal_local.kodekaryaw' +
        'an) as namakaryawan'
      'from hrd_jadwal_local where isupload = '#39'X'#39)
    Left = 440
    Top = 40
  end
  object dsQryJadwal: TDataSource
    DataSet = qryJadwal
    Left = 512
    Top = 40
  end
  object tblOutlet: TMyTable
    TableName = 'outlet'
    Connection = dmDB.dbInternal
    Left = 636
    Top = 24
  end
  object dsTblOutlet: TDataSource
    DataSet = tblOutlet
    Left = 708
    Top = 24
  end
  object tmrLogin: TTimer
    Enabled = False
    OnTimer = tmrLoginTimer
    Left = 364
    Top = 12
  end
end
