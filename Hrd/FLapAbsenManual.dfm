object frmLapAbsenManual: TfrmLapAbsenManual
  Left = 0
  Top = 0
  Caption = 'LAP. Absen Manual'
  ClientHeight = 479
  ClientWidth = 775
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
    775
    479)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 40
    Width = 59
    Height = 13
    Caption = 'Start Date'
    Transparent = True
  end
  object Label2: TLabel
    Left = 12
    Top = 68
    Width = 47
    Height = 13
    Caption = 'EndDate'
    Transparent = True
  end
  object Label3: TLabel
    Left = 8
    Top = 4
    Width = 763
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Laporan Absen Manual'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 837
  end
  object edStart: TcxDateEdit
    Left = 100
    Top = 36
    EditValue = 0d
    TabOrder = 0
    Width = 150
  end
  object edEnd: TcxDateEdit
    Left = 100
    Top = 64
    EditValue = 0d
    TabOrder = 1
    Width = 150
  end
  object cxButton1: TcxButton
    Left = 256
    Top = 36
    Width = 105
    Height = 49
    Caption = 'LOAD'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxGrid1: TcxGrid
    Left = 12
    Top = 100
    Width = 755
    Height = 363
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object gtbAbsen: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryAbsen
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
          Column = gtbAbsenid_karyawan
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbAbsennama
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbAbsentanggal
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtbAbsenid_karyawan
        end
        item
          Kind = skCount
          Column = gtbAbsennama
        end
        item
          Kind = skCount
          Column = gtbAbsentanggal
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      object gtbAbsentanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        SortIndex = 0
        SortOrder = soAscending
        Width = 100
      end
      object gtbAbsenid_karyawan: TcxGridDBColumn
        Caption = 'ID Karyawan'
        DataBinding.FieldName = 'id_karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbAbsennama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 250
      end
      object gtbAbsenwaktu: TcxGridDBColumn
        Caption = 'Waktu'
        DataBinding.FieldName = 'waktu'
        Width = 100
      end
      object gtbAbsennotes: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 250
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbAbsen
    end
  end
  object btnExpand: TButton
    Left = 652
    Top = 36
    Width = 115
    Height = 25
    Caption = 'Expand / Collapse'
    TabOrder = 4
    OnClick = btnExpandClick
  end
  object Button2: TButton
    Left = 652
    Top = 62
    Width = 115
    Height = 25
    Caption = 'Export Excel'
    TabOrder = 5
    OnClick = Button2Click
  end
  object qryAbsen: TMyQuery
    Connection = DMDB.StoreDB
    SQL.Strings = (
      
        'select id_karyawan, nama, tanggal, waktu, notes from absen_haria' +
        'n '
      'WHERE status = '#39'MANUAL'#39' AND tanggal = CURRENT_DATE')
    Left = 432
    Top = 32
  end
  object dsQryAbsen: TDataSource
    DataSet = qryAbsen
    Left = 436
    Top = 100
  end
  object dlgSave: TSaveDialog
    Options = [ofOverwritePrompt, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Left = 372
    Top = 36
  end
end
