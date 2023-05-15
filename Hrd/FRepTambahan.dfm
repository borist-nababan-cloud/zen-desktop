object frmRepTambahan: TfrmRepTambahan
  Left = 0
  Top = 0
  Caption = 'Laporan Tambahan Payroll'
  ClientHeight = 347
  ClientWidth = 759
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    759
    347)
  PixelsPerInch = 96
  TextHeight = 13
  object lblJudulForm: TLabel
    Left = 0
    Top = 0
    Width = 755
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Laporan Tambahan Payroll'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 523
  end
  object Label3: TLabel
    Left = 8
    Top = 70
    Width = 35
    Height = 13
    Caption = 'Outlet'
  end
  object Label1: TLabel
    Left = 8
    Top = 92
    Width = 43
    Height = 13
    Caption = 'Periode'
  end
  object Label2: TLabel
    Left = 188
    Top = 92
    Width = 42
    Height = 13
    Caption = 'Sampai'
  end
  object edPeriode: TComboBox
    Left = 8
    Top = 32
    Width = 257
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object edOutlet: TcxLookupComboBox
    Left = 56
    Top = 65
    Enabled = False
    Properties.KeyFieldNames = 'kodeoutlet'
    Properties.ListColumns = <
      item
        FieldName = 'namaoutlet'
      end>
    Properties.ListSource = dsTblOutlet
    TabOrder = 1
    Width = 209
  end
  object edStart: TcxDateEdit
    Left = 56
    Top = 89
    EditValue = 0d
    Enabled = False
    TabOrder = 2
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 243
    Top = 89
    EditValue = 0d
    Enabled = False
    TabOrder = 3
    Width = 121
  end
  object Button1: TButton
    Left = 279
    Top = 31
    Width = 90
    Height = 39
    Caption = 'LOAD '
    TabOrder = 4
    OnClick = Button1Click
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 116
    Width = 744
    Height = 223
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbListnilai
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbListkodekaryawan
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbListnilai
        end
        item
          Kind = skCount
          Column = gtbListkodekaryawan
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      object gtbListautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbListidoutlet: TcxGridDBColumn
        Caption = 'Outlet'
        DataBinding.FieldName = 'idoutlet'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodeoutlet'
        Properties.ListColumns = <
          item
            FieldName = 'namaoutlet'
          end>
        Properties.ListSource = dsTblOutlet
        Width = 125
      end
      object gtbListpayrollperiode: TcxGridDBColumn
        Caption = 'Periode'
        DataBinding.FieldName = 'payrollperiode'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 125
      end
      object gtbListdepartemen: TcxGridDBColumn
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
      object gtbListkodekaryawan: TcxGridDBColumn
        Caption = 'NIK'
        DataBinding.FieldName = 'kodekaryawan'
        Visible = False
        GroupIndex = 0
        Width = 100
      end
      object gtbListidfinger: TcxGridDBColumn
        Caption = 'ID Finger'
        DataBinding.FieldName = 'idfinger'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbListnama: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object gtbListidkaryawan: TcxGridDBColumn
        Caption = 'ID Finger'
        DataBinding.FieldName = 'idkaryawan'
        Visible = False
        Width = 100
      end
      object gtbListnilai: TcxGridDBColumn
        Caption = 'Nilai Tambahan'
        DataBinding.FieldName = 'nilai'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object gtbListlastedituser: TcxGridDBColumn
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnExport: TButton
    Left = 676
    Top = 33
    Width = 79
    Height = 36
    Anchors = [akTop, akRight]
    Caption = 'Export Excel'
    TabOrder = 6
    OnClick = btnExportClick
  end
  object tblOutlet: TMyTable
    TableName = 'ben_outlet'
    Connection = dmDB.dbInternal
    Left = 216
    Top = 8
  end
  object dsTblOutlet: TDataSource
    DataSet = tblOutlet
    Left = 268
    Top = 8
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 336
    Top = 8
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 404
    Top = 8
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'SELECT *, '
      
        ' (SELECT ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_' +
        'info '
      
        ' where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_tambahan' +
        '.kodekaryawan) as departemen, '
      
        ' (SELECT ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawa' +
        'n_info '
      
        ' where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_tambahan' +
        '.kodekaryawan) as nama, '
      
        ' (SELECT ben_hrd_karyawan_info.idkaryawan from ben_hrd_karyawan_' +
        'info '
      
        ' where ben_hrd_karyawan_info.kodekaryawan = ben_payroll_tambahan' +
        '.kodekaryawan) as idfinger'
      'FROM ben_payroll_tambahan'
      'WHERE payrollperiode = '#39'X'#39)
    Left = 488
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 488
    Top = 40
  end
  object dlgSave: TSaveDialog
    Left = 432
    Top = 68
  end
end
