object frmRekapSelectFP: TfrmRekapSelectFP
  Left = 0
  Top = 0
  ClientHeight = 433
  ClientWidth = 527
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
    527
    433)
  PixelsPerInch = 96
  TextHeight = 13
  object lblJudul: TLabel
    Left = 8
    Top = 8
    Width = 511
    Height = 27
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  CARI FINGER'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object lblKode: TLabel
    Left = 8
    Top = 56
    Width = 28
    Height = 13
    Caption = '____'
  end
  object lblIDFinger: TLabel
    Left = 8
    Top = 75
    Width = 28
    Height = 13
    Caption = '____'
  end
  object lblNama: TLabel
    Left = 8
    Top = 94
    Width = 28
    Height = 13
    Caption = '____'
  end
  object Label1: TLabel
    Left = 8
    Top = 115
    Width = 45
    Height = 13
    Caption = 'Tanggal'
  end
  object edTanggal: TcxDateEdit
    Left = 92
    Top = 112
    EditValue = 0d
    Properties.ReadOnly = False
    Properties.OnValidate = edTanggalPropertiesValidate
    TabOrder = 0
    OnKeyPress = edTanggalKeyPress
    Width = 121
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 152
    Width = 505
    Height = 229
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnSorting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbListid_karyawan: TcxGridDBColumn
        Caption = 'ID Finger'
        DataBinding.FieldName = 'id_karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbListnama: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbListtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbListwaktu: TcxGridDBColumn
        Caption = 'Waktu FP'
        DataBinding.FieldName = 'waktu'
        PropertiesClassName = 'TcxTimeEditProperties'
        SortIndex = 0
        SortOrder = soAscending
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnSelectBali: TButton
    Left = 8
    Top = 387
    Width = 75
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'SELECT'
    TabOrder = 2
    Visible = False
    OnClick = btnSelectBaliClick
  end
  object btnLoadList: TButton
    Left = 219
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Load List'
    TabOrder = 3
    OnClick = btnLoadListClick
  end
  object btnSelectBaru: TButton
    Left = 20
    Top = 387
    Width = 75
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'SELECT'
    TabOrder = 4
    Visible = False
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select id_karyawan, nama, tanggal, waktu from absen_harian'
      'where tanggal = CURRENT_DATE')
    Left = 464
    Top = 100
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 464
    Top = 152
  end
end
