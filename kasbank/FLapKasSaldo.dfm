object frmLapKasSaldo: TfrmLapKasSaldo
  Left = 0
  Top = 0
  ClientHeight = 452
  ClientWidth = 763
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
    763
    452)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 761
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Laporan Saldo Kas '
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
  object Label3: TLabel
    Left = 4
    Top = 48
    Width = 51
    Height = 13
    Caption = 'Kode Kas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCari: TcxButton
    Left = 291
    Top = 31
    Width = 114
    Height = 71
    Caption = 'Cari'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 0
    OnClick = btnCariClick
  end
  object btnExport: TcxButton
    Left = 407
    Top = 32
    Width = 114
    Height = 71
    Caption = 'Export Excel'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 1
    OnClick = btnExportClick
  end
  object btnPrint: TcxButton
    Left = 523
    Top = 32
    Width = 114
    Height = 71
    Caption = 'PRINT'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 2
    OnClick = btnPrintClick
  end
  object edTypeKas: TcxLookupComboBox
    Left = 75
    Top = 44
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodekas'
    Properties.ListColumns = <
      item
        FieldName = 'namakas'
      end>
    Properties.ListSource = dsTblKas
    TabOrder = 3
    Width = 181
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 110
    Width = 751
    Height = 327
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object gtbTrans: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryTrans
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbTransautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbTranskodekas: TcxGridDBColumn
        Caption = 'Kode Kas'
        DataBinding.FieldName = 'kodekas'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 125
      end
      object gtbTranstanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 108
      end
      object gtbTranssaldo: TcxGridDBColumn
        Caption = 'Saldo Awal'
        DataBinding.FieldName = 'saldo'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 117
      end
      object gtbTranslastuseredit: TcxGridDBColumn
        Caption = 'Last User Edit'
        DataBinding.FieldName = 'lastuseredit'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbTranslasteditdate: TcxGridDBColumn
        Caption = 'Last Edit Date'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbTrans
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = printGrid
    Version = 0
    Left = 692
    Top = 40
    object printGrid: TdxGridReportLink
      Active = True
      Component = cxGrid1
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 200
      PrinterPage.GrayShading = True
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 146
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[Date & Time Printed]')
      PrinterPage.PageFooter.LeftTitle.Strings = (
        'Staff')
      PrinterPage.PageFooter.RightTitle.Strings = (
        'Direksi')
      PrinterPage.PageHeader.CenterTitle.Strings = (
        'LAPORAN TRANSAKSI KAS')
      PrinterPage.PageHeader.RightTitle.Strings = (
        '[Page # of Pages #]')
      PrinterPage.PageSize.X = 8300
      PrinterPage.PageSize.Y = 11700
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 43811.952109398140000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsSize.AutoWidth = True
      BuiltInReportLink = True
    end
  end
  object dlgSave: TSaveDialog
    Left = 680
    Top = 88
  end
  object pmOption: TPopupMenu
    Left = 736
    Top = 92
    object Expan1: TMenuItem
      Caption = 'Expand'
    end
    object Collapse1: TMenuItem
      Caption = 'Collapse'
    end
  end
  object tblKas: TMyQuery
    Connection = DMDB.StoreDB
    SQL.Strings = (
      'select kodekas, namakas from ben_master_kas where idoutlet = '#39'X'#39)
    Left = 20
    Top = 168
  end
  object dsTblKas: TDataSource
    DataSet = tblKas
    Left = 68
    Top = 168
  end
  object tblCoa: TMyTable
    TableName = 'coa_detail'
    Connection = DMDB.StoreDB
    Left = 20
    Top = 220
  end
  object dsblCoa: TDataSource
    DataSet = tblCoa
    Left = 68
    Top = 228
  end
  object qryTrans: TMyQuery
    Connection = DMDB.StoreDB
    SQL.Strings = (
      'select * from ben_saldo_kas where tanggal = CURRENT_DATE '
      'AND kodekas = '#39'C'#39)
    Left = 20
    Top = 280
  end
  object dsQryTrans: TDataSource
    DataSet = qryTrans
    Left = 68
    Top = 280
  end
  object tblOutlet: TMyTable
    TableName = 'ben_outlet'
    Connection = DMDB.StoreDB
    Left = 16
    Top = 332
  end
  object dsTblOutlet: TDataSource
    DataSet = tblOutlet
    Left = 72
    Top = 332
  end
end
