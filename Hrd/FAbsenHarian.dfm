object frmAbsenHarian: TfrmAbsenHarian
  Left = 0
  Top = 0
  ClientHeight = 433
  ClientWidth = 935
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
    935
    433)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 216
    Height = 26
    Caption = '  JADWAL LOCAL OUTLET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 20
    Top = 48
    Width = 59
    Height = 13
    Caption = 'Start Date'
  end
  object Label2: TLabel
    Left = 20
    Top = 75
    Width = 50
    Height = 13
    Caption = 'End Date'
  end
  object edStart: TcxDateEdit
    Left = 116
    Top = 45
    EditValue = 0d
    TabOrder = 0
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 116
    Top = 72
    EditValue = 0d
    TabOrder = 1
    Width = 121
  end
  object btnSearch: TButton
    Left = 243
    Top = 48
    Width = 82
    Height = 40
    Caption = 'Search'
    TabOrder = 2
    OnClick = btnSearchClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 104
    Width = 919
    Height = 321
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object gtbReport: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsQryReport
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbReportkodekaryawan: TcxGridDBColumn
        Caption = 'Kode Karyawan'
        DataBinding.FieldName = 'kodekaryawan'
        Width = 100
      end
      object gtbReportnamakaryawan: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'namakaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 243
      end
      object gtbReportidkaryawan: TcxGridDBColumn
        DataBinding.FieldName = 'idkaryawan'
        Visible = False
        Width = 100
      end
      object gtbReportidoutlet: TcxGridDBColumn
        Caption = 'Outlet'
        DataBinding.FieldName = 'idoutlet'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodeoutlet'
        Properties.ListColumns = <
          item
            FieldName = 'nama'
          end>
        Properties.ListSource = dsTblOutlet
        Width = 100
      end
      object gtbReporttanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 100
      end
      object gtbReportwaktu: TcxGridDBColumn
        Caption = 'Jam'
        DataBinding.FieldName = 'waktu'
        Width = 100
      end
      object gtbReporttagatt: TcxGridDBColumn
        Caption = 'Tag FP'
        DataBinding.FieldName = 'tagatt'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 75
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbReport
    end
  end
  object btnExport: TButton
    Left = 331
    Top = 48
    Width = 89
    Height = 40
    Caption = 'Export Excel'
    TabOrder = 4
    OnClick = btnExportClick
  end
  object qryReport: TMyQuery
    Database = DMDB.StoreDB
    Active = True
    SQL.Strings = (
      
        'select kodekaryawan, idkaryawan, idoutlet, tanggal, waktu, tagat' +
        't, '
      
        '(select hrd_karyawan_info.namakaryawan from hrd_karyawan_info wh' +
        'ere hrd_karyawan_info.kodekaryawan = att_log.kodekaryawan) as na' +
        'makaryawan'
      'FROM att_log'
      'WHERE tanggal = CURRENT_DATE')
    Left = 620
    Top = 16
  end
  object dsQryReport: TDataSource
    DataSet = qryReport
    Left = 720
    Top = 20
  end
  object tblOutlet: TMyTable
    Database = DMDB.serverDB
    TableName = 'outlet'
    Left = 436
    Top = 28
  end
  object dsTblOutlet: TDataSource
    DataSet = tblOutlet
    Left = 508
    Top = 28
  end
  object dlgSave: TSaveDialog
    Left = 824
    Top = 40
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = gridPrint
    Version = 0
    Left = 668
    Top = 28
    object gridPrint: TdxGridReportLink
      Active = True
      Component = cxGrid1
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 42970.609576898150000000
      BuiltInReportLink = True
    end
  end
end
