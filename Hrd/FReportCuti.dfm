object frmReportCuti: TfrmReportCuti
  Left = 0
  Top = 0
  Caption = 'Lap. Sakit / Ijin'
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
    Caption = '  Laporan Cuti'
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
    Top = 93
    Width = 759
    Height = 378
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
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
          Column = gtbAbsenkodekaryawan
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
          Column = gtbAbsenidkaryawan
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
          Column = gtbAbsennama
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
          Column = gtbAbsenketerangan
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
          Column = gtbAbsenlastedituser
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbAbsendivisi
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
        end
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbAbsenkodekaryawan
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbAbsenidkaryawan
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbAbsennama
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbAbsenketerangan
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbAbsenlastedituser
        end
        item
          Kind = skCount
          Column = gtbAbsendivisi
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      object gtbAbsennomorcuti: TcxGridDBColumn
        Caption = 'No. Cuti'
        DataBinding.FieldName = 'nomorcuti'
        Width = 100
      end
      object gtbAbsenkodekaryawan: TcxGridDBColumn
        Caption = 'NIK'
        DataBinding.FieldName = 'kodekaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 100
      end
      object gtbAbsenidkaryawan: TcxGridDBColumn
        Caption = 'ID Finger'
        DataBinding.FieldName = 'idkaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 100
      end
      object gtbAbsennama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 250
      end
      object gtbAbsendivisi: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'divisi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDivisi
        Width = 150
      end
      object gtbAbsentglpengajuan: TcxGridDBColumn
        Caption = 'Tgl. Pengajuan'
        DataBinding.FieldName = 'tglpengajuan'
        Width = 100
      end
      object gtbAbsentanggal: TcxGridDBColumn
        Caption = 'Tgl Cuti'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbAbsentglstart: TcxGridDBColumn
        Caption = 'Tgl. Start'
        DataBinding.FieldName = 'tglstart'
        Width = 100
      end
      object gtbAbsentglend: TcxGridDBColumn
        Caption = 'Tgl End'
        DataBinding.FieldName = 'tglend'
        Width = 100
      end
      object gtbAbsensaldo: TcxGridDBColumn
        Caption = 'Saldo Awal'
        DataBinding.FieldName = 'saldo'
        Width = 100
      end
      object gtbAbsenjumlah: TcxGridDBColumn
        Caption = 'Jumlah'
        DataBinding.FieldName = 'jumlah'
        Width = 100
      end
      object gtbAbsensisa: TcxGridDBColumn
        Caption = 'Sisa'
        DataBinding.FieldName = 'sisa'
        Width = 100
      end
      object gtbAbsenketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 300
      end
      object gtbAbsenlasteditdate: TcxGridDBColumn
        Caption = 'Date Edit'
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
      object gtbAbsenlastedituser: TcxGridDBColumn
        Caption = 'User Edit'
        DataBinding.FieldName = 'lastedituser'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
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
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'SELECT kodekaryawan, idkaryawan, nomorcuti, tglpengajuan, tangga' +
        'l,'
      'tagpresensi, keterangan, tglstart, tglend, jumlah, saldo, sisa, '
      'lasteditdate, lastedituser,'
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info '
      
        'where ben_presensi_cuti.kodekaryawan = ben_hrd_karyawan_info.kod' +
        'ekaryawan) as nama, '
      
        '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_i' +
        'nfo '
      
        'where ben_presensi_cuti.kodekaryawan = ben_hrd_karyawan_info.kod' +
        'ekaryawan) as divisi '
      
        'from ben_presensi_cuti where ben_presensi_cuti.tglstart >= CURRE' +
        'NT_DATE '
      'AND ben_presensi_cuti.tglstart <= CURRENT_DATE')
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
  object tblDivisi: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 492
    Top = 36
  end
  object dsTblDivisi: TDataSource
    DataSet = tblDivisi
    Left = 492
    Top = 84
  end
end
