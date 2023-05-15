object frmLapChangeJadwal: TfrmLapChangeJadwal
  Left = 0
  Top = 0
  Caption = 'Lap. Ganti Jadwal'
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
    Caption = '  Laporan Ganti Jadwal'
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
    Left = 8
    Top = 100
    Width = 759
    Height = 371
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object gtbAbsen: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryAbsen
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      object gtbAbsenkodekaryawan: TcxGridDBColumn
        Caption = 'Kode Karyawan'
        DataBinding.FieldName = 'kodekaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbAbsennama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 300
      end
      object gtbAbsenkodeshift: TcxGridDBColumn
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
      object gtbAbsentglmasuk: TcxGridDBColumn
        Caption = 'Tgl Masuk'
        DataBinding.FieldName = 'tglmasuk'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbAbsenjmasuk: TcxGridDBColumn
        Caption = 'J. Masuk'
        DataBinding.FieldName = 'jmasuk'
        Width = 100
      end
      object gtbAbsentglkeluar: TcxGridDBColumn
        Caption = 'Tgl Keluar'
        DataBinding.FieldName = 'tglkeluar'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbAbsenjkeluar: TcxGridDBColumn
        Caption = 'J. Keluar'
        DataBinding.FieldName = 'jkeluar'
        Width = 100
      end
      object gtbAbsennotes: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 300
      end
      object gtbAbsenlasteditdate: TcxGridDBColumn
        Caption = 'Last Edit Date'
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
      object gtbAbsenlastedituser: TcxGridDBColumn
        Caption = 'Last Edit User'
        DataBinding.FieldName = 'lastedituser'
        Width = 100
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
      
        'SELECT kodekaryawan, kodeshift, tglmasuk, jmasuk, tglkeluar, jke' +
        'luar, notes, '
      'lasteditdate, lastedituser, '
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info where ben_hrd_jadwal_local.kodekaryawan = ben_hrd_karyawan' +
        '_info.kodekaryawan) as nama '
      'from ben_hrd_jadwal_local'
      'where tglmasuk = CURRENT_DATE'
      'and tagedit = '#39'E'#39)
    Left = 432
    Top = 32
  end
  object dsQryAbsen: TDataSource
    DataSet = qryAbsen
    Left = 432
    Top = 80
  end
  object dlgSave: TSaveDialog
    Options = [ofOverwritePrompt, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Left = 372
    Top = 36
  end
  object tblShift: TMyTable
    TableName = 'ben_shift'
    Connection = DMDB.StoreDB
    Left = 556
    Top = 48
  end
  object dsTblShift: TDataSource
    DataSet = tblShift
    Left = 572
    Top = 88
  end
end
