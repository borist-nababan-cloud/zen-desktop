object frmReportCashIn: TfrmReportCashIn
  Left = 0
  Top = 0
  ClientHeight = 489
  ClientWidth = 834
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
    834
    489)
  PixelsPerInch = 96
  TextHeight = 13
  object lblJudulForm: TLabel
    Left = 0
    Top = 0
    Width = 832
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = ' Report Payroll Cash In'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 525
  end
  object Label2: TLabel
    Left = 272
    Top = 35
    Width = 29
    Height = 13
    Caption = 'Start'
  end
  object Label3: TLabel
    Left = 272
    Top = 62
    Width = 20
    Height = 13
    Caption = 'End'
  end
  object Label6: TLabel
    Left = 8
    Top = 32
    Width = 123
    Height = 13
    Caption = 'Select Periode Payroll'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 92
    Width = 818
    Height = 389
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbCashin: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '#,#'
          Position = spFooter
          Column = gtbCashintamblain
        end
        item
          Format = '#,#'
          Position = spFooter
          Column = gtbCashinpotlain
        end
        item
          Format = '#,#'
          Position = spFooter
          Column = gtbCashingapok
        end
        item
          Format = '#,#'
          Position = spFooter
          Column = gtbCashinnlibnas
        end
        item
          Format = '#,#'
          Position = spFooter
          Column = gtbCashinnumakan
        end
        item
          Format = '#,#'
          Position = spFooter
          Column = gtbCashinnumlibnas
        end
        item
          Format = '#,#'
          Position = spFooter
          Column = gtbCashingplibnas
        end
        item
          Format = '#,#'
          Position = spFooter
          Column = gtbCashinnlembur
        end
        item
          Format = '#,#'
          Position = spFooter
          Column = gtbCashinnilaifot
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbCashinnilaithp
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
          Column = gtbCashinkodekaryawan
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
          Column = gtbCashinnama
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
          Column = gtbCashinpayrollperiode
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbCashintamblain
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbCashinpotlain
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbCashingapok
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbCashinnlibnas
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbCashinnumakan
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbCashinnumlibnas
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbCashingplibnas
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbCashinnlembur
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbCashinnilaifot
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbCashinnilaithp
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbCashinkodekaryawan
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbCashinnama
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbCashinpayrollperiode
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbCashinkodekaryawan: TcxGridDBColumn
        Caption = 'NIK'
        DataBinding.FieldName = 'kodekaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbCashinnama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbCashindivisi: TcxGridDBColumn
        Caption = 'Divisi'
        DataBinding.FieldName = 'divisi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        Width = 200
      end
      object gtbCashinpayrollperiode: TcxGridDBColumn
        Caption = 'Periode Payroll'
        DataBinding.FieldName = 'payrollperiode'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbCashintglstart: TcxGridDBColumn
        Caption = 'Tgl Start'
        DataBinding.FieldName = 'tglstart'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbCashintglend: TcxGridDBColumn
        Caption = 'Tgl End'
        DataBinding.FieldName = 'tglend'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbCashinidkaryawan: TcxGridDBColumn
        Caption = 'ID Finger'
        DataBinding.FieldName = 'idkaryawan'
        Width = 100
      end
      object gtbCashinhperiode: TcxGridDBColumn
        Caption = 'H. Periode'
        DataBinding.FieldName = 'hperiode'
        Width = 100
      end
      object gtbCashinhoff: TcxGridDBColumn
        Caption = 'H. Off'
        DataBinding.FieldName = 'hoff'
        Width = 100
      end
      object gtbCashinharuskerja: TcxGridDBColumn
        Caption = 'Hrs. Kerja'
        DataBinding.FieldName = 'haruskerja'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Width = 100
      end
      object gtbCashinhkerja: TcxGridDBColumn
        Caption = 'H. Kerja'
        DataBinding.FieldName = 'hkerja'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Width = 100
      end
      object gtbCashinovertime: TcxGridDBColumn
        Caption = 'Over Time'
        DataBinding.FieldName = 'overtime'
        Width = 100
      end
      object gtbCashinhunder: TcxGridDBColumn
        Caption = 'Under Time'
        DataBinding.FieldName = 'hunder'
        Width = 100
      end
      object gtbCashinhlate1: TcxGridDBColumn
        Caption = 'Late '
        DataBinding.FieldName = 'hlate1'
        Width = 100
      end
      object gtbCashinhlate2: TcxGridDBColumn
        Caption = 'Late > 30'
        DataBinding.FieldName = 'hlate2'
        Width = 100
      end
      object gtbCashinhsakit: TcxGridDBColumn
        Caption = 'H. Sakit'
        DataBinding.FieldName = 'hsakit'
        Width = 100
      end
      object gtbCashinhimasuk: TcxGridDBColumn
        Caption = 'H. Ijin Msk'
        DataBinding.FieldName = 'himasuk'
        Width = 100
      end
      object gtbCashinhitidakmasuk: TcxGridDBColumn
        Caption = 'H. I. Tdk Msk'
        DataBinding.FieldName = 'hitidakmasuk'
        Width = 100
      end
      object gtbCashinhipulang: TcxGridDBColumn
        Caption = 'H. I. Pulang'
        DataBinding.FieldName = 'hipulang'
        Width = 100
      end
      object gtbCashinhikeluar: TcxGridDBColumn
        Caption = 'H. I. Keluar'
        DataBinding.FieldName = 'hikeluar'
        Width = 100
      end
      object gtbCashinhitidakabsen: TcxGridDBColumn
        Caption = 'H. Tdk Absen'
        DataBinding.FieldName = 'hitidakabsen'
        Visible = False
        Width = 100
      end
      object gtbCashinhalpa: TcxGridDBColumn
        Caption = 'H. Alpa'
        DataBinding.FieldName = 'halpa'
        Width = 100
      end
      object gtbCashinhfot: TcxGridDBColumn
        Caption = 'H. FOT'
        DataBinding.FieldName = 'hfot'
        Width = 100
      end
      object gtbCashinhlibnas: TcxGridDBColumn
        Caption = 'H. Lib. Nas'
        DataBinding.FieldName = 'hlibnas'
        Width = 100
      end
      object gtbCashinhcuti: TcxGridDBColumn
        Caption = 'H. Cuti'
        DataBinding.FieldName = 'hcuti'
        Width = 100
      end
      object gtbCashintamblain: TcxGridDBColumn
        Caption = 'Tamb. Lain'
        DataBinding.FieldName = 'tamblain'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbCashinpotlain: TcxGridDBColumn
        Caption = 'Potongan'
        DataBinding.FieldName = 'potlain'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbCashingapok: TcxGridDBColumn
        Caption = 'Gaji Pokok'
        DataBinding.FieldName = 'gapok'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbCashinnlibnas: TcxGridDBColumn
        Caption = 'H. Lib Nasional'
        DataBinding.FieldName = 'nlibnas'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbCashinnumakan: TcxGridDBColumn
        Caption = 'Uang Makan'
        DataBinding.FieldName = 'numakan'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbCashinnumlibnas: TcxGridDBColumn
        Caption = 'UM. Lib Nas'
        DataBinding.FieldName = 'numlibnas'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbCashingplibnas: TcxGridDBColumn
        Caption = 'GP. Lib Nas'
        DataBinding.FieldName = 'gplibnas'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbCashinnlembur: TcxGridDBColumn
        Caption = 'N. Lembur'
        DataBinding.FieldName = 'nlembur'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbCashinnilaifot: TcxGridDBColumn
        Caption = 'N. FOT'
        DataBinding.FieldName = 'nilaifot'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbCashinColumn1: TcxGridDBColumn
        Caption = 'Komisi'
        DataBinding.FieldName = 'komisi'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
      end
      object gtbCashinnilaithp: TcxGridDBColumn
        Caption = 'N. THP'
        DataBinding.FieldName = 'nilaithp'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbCashinlastedituser: TcxGridDBColumn
        Caption = 'User Post'
        DataBinding.FieldName = 'lastedituser'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbCashinlasteditdate: TcxGridDBColumn
        Caption = 'Date Post'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbCashin
    end
  end
  object edPeriode: TComboBox
    Left = 8
    Top = 48
    Width = 253
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object edStart: TcxDateEdit
    Left = 312
    Top = 32
    EditValue = 0d
    Enabled = False
    TabOrder = 2
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 312
    Top = 59
    EditValue = 0d
    Enabled = False
    TabOrder = 3
    Width = 121
  end
  object btnLoad: TButton
    Left = 660
    Top = 32
    Width = 75
    Height = 43
    Caption = 'Load'
    TabOrder = 4
    OnClick = btnLoadClick
  end
  object btnExport: TButton
    Left = 741
    Top = 32
    Width = 85
    Height = 43
    Anchors = [akTop, akRight]
    Caption = 'Export Excel'
    TabOrder = 5
    OnClick = btnExportClick
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'SELECT *, '
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info where ben_hrd_karyawan_info.kodekaryawan =  ben_payroll_ca' +
        'shin.kodekaryawan) as nama,  '
      
        '(select ben_hrd_karyawan_info.departemen from ben_hrd_karyawan_i' +
        'nfo where ben_hrd_karyawan_info.kodekaryawan =  ben_payroll_cash' +
        'in.kodekaryawan) as divisi '
      'FROM ben_payroll_cashin'
      'WHERE payrollperiode = '#39'X'#39)
    Left = 288
    Top = 88
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 416
    Top = 92
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 490
    Top = 92
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 336
    Top = 88
  end
  object dlgSave: TSaveDialog
    Left = 12
    Top = 84
  end
end
