object frmRepPayrollDetails: TfrmRepPayrollDetails
  Left = 0
  Top = 0
  Caption = 'Report Payroll Details'
  ClientHeight = 586
  ClientWidth = 967
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
    967
    586)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 392
    Top = 37
    Width = 35
    Height = 13
    Caption = 'Outlet'
    Visible = False
  end
  object Label1: TLabel
    Left = 388
    Top = 62
    Width = 43
    Height = 13
    Caption = 'Periode'
    Visible = False
  end
  object Label2: TLabel
    Left = 568
    Top = 62
    Width = 42
    Height = 13
    Caption = 'Sampai'
    Visible = False
  end
  object lblJudulForm: TLabel
    Left = 3
    Top = 0
    Width = 956
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = ' LAPORAN DETAILS PAYROLL'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1094
  end
  object edPeriode: TComboBox
    Left = 8
    Top = 32
    Width = 257
    Height = 31
    DropDownCount = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 279
    Top = 32
    Width = 90
    Height = 39
    Caption = 'LOAD '
    TabOrder = 1
    OnClick = Button1Click
  end
  object edOutlet: TcxLookupComboBox
    Left = 440
    Top = 32
    Properties.KeyFieldNames = 'kodeoutlet'
    Properties.ListColumns = <
      item
        FieldName = 'namaoutlet'
      end>
    TabOrder = 2
    Visible = False
    Width = 209
  end
  object edStart: TcxDateEdit
    Left = 436
    Top = 59
    EditValue = 0d
    TabOrder = 3
    Visible = False
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 636
    Top = 59
    EditValue = 0d
    TabOrder = 4
    Visible = False
    Width = 121
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 86
    Width = 951
    Height = 484
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQrySlip
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 'Click here to filter Data'
      FilterRow.Visible = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      object gtbListkodekaryawan: TcxGridDBColumn
        Caption = 'NIK'
        DataBinding.FieldName = 'kodekaryawan'
        Width = 100
      end
      object gtbListidkaryawan: TcxGridDBColumn
        Caption = 'ID Finger'
        DataBinding.FieldName = 'idkaryawan'
        Width = 100
      end
      object gtbListnamakaryawan: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'namakaryawan'
        Width = 250
      end
      object gtbListdepartemen: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'departemen'
        Width = 100
      end
      object gtbListidoutlet: TcxGridDBColumn
        DataBinding.FieldName = 'idoutlet'
        Visible = False
        Width = 100
      end
      object gtbListisadmin: TcxGridDBColumn
        DataBinding.FieldName = 'isadmin'
        Visible = False
        Width = 100
      end
      object gtbListnorek: TcxGridDBColumn
        Caption = 'No. Rek'
        DataBinding.FieldName = 'norek'
        Width = 100
      end
      object gtbListnamarek: TcxGridDBColumn
        Caption = 'Nama rek'
        DataBinding.FieldName = 'namarek'
        Width = 250
      end
      object gtbListhperiode: TcxGridDBColumn
        Caption = 'H. Periode'
        DataBinding.FieldName = 'hperiode'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhnormal: TcxGridDBColumn
        Caption = 'H. Normal'
        DataBinding.FieldName = 'hnormal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhoff: TcxGridDBColumn
        Caption = 'Off'
        DataBinding.FieldName = 'hoff'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListharuskerja: TcxGridDBColumn
        Caption = 'Hrs. Kerja'
        DataBinding.FieldName = 'haruskerja'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListovertime: TcxGridDBColumn
        Caption = 'OT'
        DataBinding.FieldName = 'overtime'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhunder: TcxGridDBColumn
        Caption = 'Under T'
        DataBinding.FieldName = 'hunder'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhlate1: TcxGridDBColumn
        Caption = 'Late < 30'
        DataBinding.FieldName = 'hlate1'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhlate2: TcxGridDBColumn
        Caption = 'Late > 30'
        DataBinding.FieldName = 'hlate2'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhsakit: TcxGridDBColumn
        Caption = 'Sakit'
        DataBinding.FieldName = 'hsakit'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhimasuk: TcxGridDBColumn
        DataBinding.FieldName = 'himasuk'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbListhitidakmasuk: TcxGridDBColumn
        Caption = 'Tdk Masuk'
        DataBinding.FieldName = 'hitidakmasuk'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhipulang: TcxGridDBColumn
        DataBinding.FieldName = 'hipulang'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbListhikeluar: TcxGridDBColumn
        DataBinding.FieldName = 'hikeluar'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbListhitidakabsen: TcxGridDBColumn
        DataBinding.FieldName = 'hitidakabsen'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbListhalpa: TcxGridDBColumn
        Caption = 'Alpa'
        DataBinding.FieldName = 'halpa'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhfot: TcxGridDBColumn
        Caption = 'FOT'
        DataBinding.FieldName = 'hfot'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhlibnas: TcxGridDBColumn
        Caption = 'Lib Nas'
        DataBinding.FieldName = 'hlibnas'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhcuti: TcxGridDBColumn
        Caption = 'Cuti'
        DataBinding.FieldName = 'hcuti'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListhumakan: TcxGridDBColumn
        DataBinding.FieldName = 'humakan'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbListvgapok: TcxGridDBColumn
        DataBinding.FieldName = 'vgapok'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbListvsaving: TcxGridDBColumn
        Caption = 'Saving'
        DataBinding.FieldName = 'vsaving'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbListvtunjangan: TcxGridDBColumn
        Caption = 'Tunjangan'
        DataBinding.FieldName = 'vtunjangan'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListvpotongan: TcxGridDBColumn
        Caption = 'Potongan'
        DataBinding.FieldName = 'vpotongan'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListvbpjs: TcxGridDBColumn
        Caption = 'BPJS'
        DataBinding.FieldName = 'vbpjs'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListvlembur: TcxGridDBColumn
        DataBinding.FieldName = 'vlembur'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbListvumakan: TcxGridDBColumn
        DataBinding.FieldName = 'vumakan'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListvthp: TcxGridDBColumn
        DataBinding.FieldName = 'vthp'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbListgapok: TcxGridDBColumn
        Caption = 'Gapok'
        DataBinding.FieldName = 'gapok'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListkomisi: TcxGridDBColumn
        Caption = 'Komisi'
        DataBinding.FieldName = 'komisi'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListdenda: TcxGridDBColumn
        Caption = 'Denda'
        DataBinding.FieldName = 'denda'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListtamblain: TcxGridDBColumn
        Caption = 'Tambahan'
        DataBinding.FieldName = 'tamblain'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListnilaifot: TcxGridDBColumn
        Caption = 'N FOT'
        DataBinding.FieldName = 'nilaifot'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListnlembur: TcxGridDBColumn
        Caption = 'Lembur'
        DataBinding.FieldName = 'nlembur'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListgplibnas: TcxGridDBColumn
        Caption = 'GP. Lib Nas'
        DataBinding.FieldName = 'gplibnas'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListnumlibnas: TcxGridDBColumn
        Caption = 'UM Lib Nas'
        DataBinding.FieldName = 'numlibnas'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListnumakan: TcxGridDBColumn
        Caption = 'U. Makan'
        DataBinding.FieldName = 'numakan'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListnlibnas: TcxGridDBColumn
        DataBinding.FieldName = 'nlibnas'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbListpotlain: TcxGridDBColumn
        Caption = 'Potongan'
        DataBinding.FieldName = 'potlain'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListnilaithp: TcxGridDBColumn
        Caption = 'THP'
        DataBinding.FieldName = 'nilaithp'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListpayrollperiode: TcxGridDBColumn
        DataBinding.FieldName = 'payrollperiode'
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnExport: TButton
    Left = 750
    Top = 32
    Width = 85
    Height = 43
    Anchors = [akTop, akRight]
    Caption = 'Export Excel'
    TabOrder = 6
    OnClick = btnExportClick
  end
  object Button2: TButton
    Left = 841
    Top = 32
    Width = 118
    Height = 43
    Anchors = [akTop, akRight]
    Caption = 'Expand / Collapse'
    TabOrder = 7
  end
  object tblOutlet: TMyTable
    TableName = 'ben_outlet'
    Connection = dmDB.dbInternal
    Left = 672
    Top = 28
  end
  object dsTblOutlet: TDataSource
    DataSet = tblOutlet
    Left = 676
    Top = 80
  end
  object qrySlip: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'SELECT'
      
        '  ben_hrd_karyawan_info.kodekaryawan, ben_hrd_karyawan_info.idka' +
        'ryawan,'
      
        '  ben_hrd_karyawan_info.namakaryawan, ben_hrd_karyawan_info.idou' +
        'tlet,'
      
        '  ben_hrd_karyawan_info.departemen, ben_hrd_karyawan_info.norek,' +
        ' ben_hrd_karyawan_info.isadmin,'
      '  ben_hrd_karyawan_info.namarek, ben_payroll_details.*'
      'FROM'
      '  ben_hrd_karyawan_info INNER JOIN'
      '  ben_payroll_details ON ben_hrd_karyawan_info.kodekaryawan ='
      '    ben_payroll_details.kodekaryawan'
      'WHERE'
      '   ben_hrd_karyawan_info.active = '#39'Y'#39
      'AND'
      '   ben_hrd_karyawan_info.isadmin = '#39'Y'#39
      'AND ben_payroll_details.payrollperiode = '#39'X'#39)
    Left = 728
    Top = 28
  end
  object dsQrySlip: TDataSource
    DataSet = qrySlip
    Left = 732
    Top = 80
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 780
    Top = 32
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 784
    Top = 84
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'SELECT'
      
        '  ben_hrd_karyawan_info.kodekaryawan, ben_hrd_karyawan_info.idka' +
        'ryawan,'
      
        '  ben_hrd_karyawan_info.namakaryawan, ben_hrd_karyawan_info.depa' +
        'rtemen,'
      '  ben_hrd_karyawan_info.idoutlet, ben_hrd_karyawan_info.isadmin,'
      '  ben_payroll_details.hperiode, ben_payroll_details.hnormal,'
      '  ben_payroll_details.hoff, ben_payroll_details.haruskerja,'
      '  ben_payroll_details.hkerja, ben_payroll_details.overtime,'
      '  ben_payroll_details.hunder, ben_payroll_details.hlate1,'
      '  ben_payroll_details.hlate2, ben_payroll_details.hsakit,'
      '  ben_payroll_details.himasuk, ben_payroll_details.hitidakmasuk,'
      '  ben_payroll_details.hipulang, ben_payroll_details.hikeluar,'
      '  ben_payroll_details.hitidakabsen, ben_payroll_details.halpa,'
      '  ben_payroll_details.hfot, ben_payroll_details.hlibnas,'
      '  ben_payroll_details.hcuti, ben_payroll_details.humakan,'
      '  ben_payroll_details.vgapok, ben_payroll_details.vsaving,'
      '  ben_payroll_details.vtunjangan, ben_payroll_details.vpotongan,'
      '  ben_payroll_details.vbpjs, ben_payroll_details.vlembur,'
      '  ben_payroll_details.vumakan, ben_payroll_details.vthp,'
      '  ben_payroll_details.komisi, ben_payroll_details.denda,'
      '  ben_payroll_details.tamblain, ben_payroll_details.nilaithp,'
      '  ben_payroll_details.nilaifot, ben_payroll_details.nlembur,'
      '  ben_payroll_details.gplibnas, ben_payroll_details.numlibnas,'
      '  ben_payroll_details.numakan, ben_payroll_details.nlibnas,'
      '  ben_payroll_details.gapok, ben_payroll_details.potlain,'
      
        '  ben_payroll_details.payrollperiode, ben_hrd_karyawan_info.nore' +
        'k,'
      '  ben_hrd_karyawan_info.namarek'
      'FROM'
      '  ben_hrd_karyawan_info INNER JOIN'
      '  ben_payroll_details ON ben_payroll_details.kodekaryawan ='
      '    ben_hrd_karyawan_info.kodekaryawan'
      'WHERE'
      '  ben_hrd_karyawan_info.isadmin = '#39'Y'#39' AND'
      '  ben_payroll_details.payrollperiode = '#39'X'#39';')
    Left = 864
    Top = 24
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 868
    Top = 72
  end
  object dlgSave: TSaveDialog
    Left = 536
    Top = 44
  end
end
