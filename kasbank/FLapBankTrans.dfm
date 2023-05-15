object frmLapBankTrans: TfrmLapBankTrans
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
    Caption = '  Laporan Transaksi Bank'
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
  object Label1: TLabel
    Left = 4
    Top = 35
    Width = 75
    Height = 13
    Caption = 'Tanggal Awal'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 4
    Top = 59
    Width = 78
    Height = 13
    Caption = 'Tanggal Akhir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 4
    Top = 87
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
  object edStart: TcxDateEdit
    Left = 104
    Top = 32
    EditValue = 0d
    TabOrder = 0
    Width = 181
  end
  object edEnd: TcxDateEdit
    Left = 104
    Top = 56
    EditValue = 0d
    TabOrder = 1
    Width = 181
  end
  object btnCari: TcxButton
    Left = 291
    Top = 31
    Width = 114
    Height = 71
    Caption = 'Cari'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 2
    OnClick = btnCariClick
  end
  object btnExport: TcxButton
    Left = 407
    Top = 32
    Width = 114
    Height = 71
    Caption = 'Export Excel'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 3
    OnClick = btnExportClick
  end
  object btnPrint: TcxButton
    Left = 523
    Top = 32
    Width = 114
    Height = 71
    Caption = 'PRINT'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 4
    OnClick = btnPrintClick
  end
  object edTypeKas: TcxLookupComboBox
    Left = 104
    Top = 83
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodebank'
    Properties.ListColumns = <
      item
        FieldName = 'kodebank'
      end>
    Properties.ListSource = dsTblBank
    TabOrder = 5
    Width = 181
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 110
    Width = 751
    Height = 327
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 6
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
      object gtbTransid_transaksi: TcxGridDBColumn
        Caption = 'No Transaksi'
        DataBinding.FieldName = 'id_transaksi'
        Width = 100
      end
      object gtbTranskodekas: TcxGridDBColumn
        Caption = 'Kode Bank'
        DataBinding.FieldName = 'kodebank'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbTransidoutlet: TcxGridDBColumn
        Caption = 'Outlet'
        DataBinding.FieldName = 'idoutlet'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodeoutlet'
        Properties.ListColumns = <
          item
            FieldName = 'namaoutlet'
          end>
        Properties.ListSource = dsTblOutlet
        Width = 100
      end
      object gtbTranstanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        SortIndex = 0
        SortOrder = soAscending
        Width = 100
      end
      object gtbTransno_kas: TcxGridDBColumn
        Caption = 'No Detail'
        DataBinding.FieldName = 'no_bank'
        Width = 100
      end
      object gtbTransid_coa: TcxGridDBColumn
        Caption = 'Kode Coa'
        DataBinding.FieldName = 'id_coa'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbTransNamaCoa: TcxGridDBColumn
        Caption = 'Nama Coa'
        DataBinding.FieldName = 'id_coa'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_detail'
        Properties.ListColumns = <
          item
            FieldName = 'nama_detail'
          end>
        Properties.ListSource = dsblCoa
        Width = 150
      end
      object gtbTransketerangan: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 250
      end
      object gtbTranssubtotal: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbTransstatus: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'status'
        Width = 100
      end
      object gtbTransno_reff: TcxGridDBColumn
        DataBinding.FieldName = 'no_reff'
        Visible = False
        Width = 100
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
      ReportDocument.CreationDate = 43811.953202314820000000
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
  object tblBank: TMyQuery
    Connection = DMDB.StoreDB
    SQL.Strings = (
      'select kodebank from ben_master_bank where idoutlet = '#39'X'#39)
    Left = 20
    Top = 168
  end
  object dsTblBank: TDataSource
    DataSet = tblBank
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
      
        'select * from ben_trans_bank_detail where tanggal = CURRENT_DATE' +
        ' '
      'AND idoutlet = '#39'X'#39)
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
