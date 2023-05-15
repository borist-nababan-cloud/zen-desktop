object frmLapTransDrivers: TfrmLapTransDrivers
  Left = 0
  Top = 0
  ClientHeight = 569
  ClientWidth = 972
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    972
    569)
  PixelsPerInch = 96
  TextHeight = 16
  object Label5: TLabel
    Left = 0
    Top = 0
    Width = 972
    Height = 19
    Align = alTop
    Alignment = taCenter
    Caption = 'Travel Transaction Report'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 214
  end
  object Label1: TLabel
    Left = 8
    Top = 36
    Width = 69
    Height = 16
    Caption = 'Start Date'
  end
  object Label2: TLabel
    Left = 8
    Top = 66
    Width = 58
    Height = 16
    Caption = 'End Date'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 112
    Width = 956
    Height = 437
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbTransDrivers: TcxGridDBTableView
      PopupMenu = PopupMenu1
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dmDB.dsQryTransDrivers
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#.#'
          Kind = skCount
          Column = gtbTransDriversid_trans_driver
        end
        item
          Format = '#,#.#'
          Kind = skSum
          Column = gtbTransDriverssubtotal
        end
        item
          Kind = skCount
          Column = gtbTransDriversfee_value
        end
        item
          Format = '#,#.#'
          Kind = skSum
          Column = gtbTransDriverstotal_fee
        end
        item
          Format = '#,#.#'
          Kind = skCount
          Column = gtbTransDriversnama_drivers
        end
        item
          Format = '#,#.#'
          Kind = skCount
          Column = gtbTransDriversid_drivers
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbTransDriversid_trans_driver: TcxGridDBColumn
        Caption = 'ID Transaksi'
        DataBinding.FieldName = 'id_trans_driver'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 129
      end
      object gtbTransDriverstanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbTransDriverswaktu: TcxGridDBColumn
        Caption = 'Waktu'
        DataBinding.FieldName = 'waktu'
        PropertiesClassName = 'TcxTimeEditProperties'
        Width = 100
      end
      object gtbTransDriversid_drivers: TcxGridDBColumn
        Caption = 'ID Driver'
        DataBinding.FieldName = 'id_drivers'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 150
      end
      object gtbTransDriversnama_drivers: TcxGridDBColumn
        Caption = 'Nama Driver'
        DataBinding.FieldName = 'nama_drivers'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 200
      end
      object gtbTransDriversnopol_driver: TcxGridDBColumn
        Caption = 'No Pol / Travel'
        DataBinding.FieldName = 'nopol_driver'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object gtbTransDriverstotal_items: TcxGridDBColumn
        Caption = 'Items'
        DataBinding.FieldName = 'total_items'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbTransDriverssubtotal: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbTransDriversfee_value: TcxGridDBColumn
        Caption = 'Fee Value'
        DataBinding.FieldName = 'fee_value'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbTransDriverstotal_fee: TcxGridDBColumn
        Caption = 'Total Fee'
        DataBinding.FieldName = 'total_fee'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbTransDrivers
    end
  end
  object edStart: TcxDateEdit
    Left = 88
    Top = 33
    EditValue = 0d
    TabOrder = 1
    Width = 157
  end
  object edEnd: TcxDateEdit
    Left = 88
    Top = 63
    EditValue = 0d
    TabOrder = 2
    Width = 157
  end
  object btnLoad: TButton
    Left = 256
    Top = 36
    Width = 121
    Height = 51
    Caption = 'Load Data'
    TabOrder = 3
    OnClick = btnLoadClick
  end
  object btnPrint: TButton
    Left = 383
    Top = 36
    Width = 121
    Height = 51
    Caption = 'Print Data'
    TabOrder = 4
    OnClick = btnPrintClick
  end
  object btnExport: TButton
    Left = 510
    Top = 36
    Width = 121
    Height = 51
    Caption = 'Export Data'
    TabOrder = 5
    OnClick = btnExportClick
  end
  object PopupMenu1: TPopupMenu
    Left = 772
    Top = 64
    object RePrintReceipt1: TMenuItem
      Caption = 'Re-Print Receipt'
      OnClick = RePrintReceipt1Click
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = PrintGrid
    Version = 0
    Left = 680
    Top = 56
    object PrintGrid: TdxGridReportLink
      Active = True
      Component = cxGrid1
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.GrayShading = True
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 43811.726381238430000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsSize.AutoWidth = True
      BuiltInReportLink = True
    end
  end
  object dlgSave: TSaveDialog
    Options = [ofOverwritePrompt, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Left = 796
    Top = 24
  end
end
