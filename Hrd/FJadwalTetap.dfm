object frmJadwalTetap: TfrmJadwalTetap
  Left = 0
  Top = 0
  Caption = 'Jadwal Tetap Outlet'
  ClientHeight = 353
  ClientWidth = 761
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
    761
    353)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = -4
    Width = 761
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Master Jadwal Tetap'
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
    Width = 745
    Height = 261
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbJadwal: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblJadwalTetap
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbJadwalautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbJadwalnamajadwal: TcxGridDBColumn
        Caption = 'Nama Jadwal'
        DataBinding.FieldName = 'namajadwal'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbJadwalsmonday: TcxGridDBColumn
        Caption = 'Senin'
        DataBinding.FieldName = 'smonday'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbJadwalstues: TcxGridDBColumn
        Caption = 'Selasa'
        DataBinding.FieldName = 'stues'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbJadwalswed: TcxGridDBColumn
        Caption = 'Rabu'
        DataBinding.FieldName = 'swed'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbJadwalsthur: TcxGridDBColumn
        Caption = 'Kamis'
        DataBinding.FieldName = 'sthur'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbJadwalsfri: TcxGridDBColumn
        Caption = 'Jumat'
        DataBinding.FieldName = 'sfri'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbJadwalssat: TcxGridDBColumn
        Caption = 'Sabtu'
        DataBinding.FieldName = 'ssat'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbJadwalsssun: TcxGridDBColumn
        Caption = 'Minggu'
        DataBinding.FieldName = 'ssun'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbJadwalisupload: TcxGridDBColumn
        DataBinding.FieldName = 'isupload'
        Visible = False
        Width = 100
      end
      object gtbJadwallasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbJadwallastedituser: TcxGridDBColumn
        DataBinding.FieldName = 'lastedituser'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbJadwaltagedit: TcxGridDBColumn
        Caption = 'Tag Edit'
        DataBinding.FieldName = 'tagedit'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbJadwal
    end
  end
  object Button1: TButton
    Left = 8
    Top = 307
    Width = 81
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 1
    OnClick = Button1Click
  end
  object btnEdit: TButton
    Left = 95
    Top = 307
    Width = 81
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = 'Edit'
    TabOrder = 2
    OnClick = btnEditClick
  end
  object tblJadwalTetap: TMyTable
    TableName = 'ben_hrd_jadwal_tetap'
    Connection = dmDB.dbInternal
    Left = 300
    Top = 4
  end
  object dsTblJadwalTetap: TDataSource
    DataSet = tblJadwalTetap
    Left = 372
    Top = 4
  end
  object tblShift: TMyTable
    TableName = 'ben_shift'
    Connection = dmDB.dbInternal
    Left = 456
  end
  object dsTblShift: TDataSource
    DataSet = tblShift
    Left = 524
  end
end
