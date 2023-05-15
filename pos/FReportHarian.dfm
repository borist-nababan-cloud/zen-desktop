object frmReportHarian: TfrmReportHarian
  Left = 323
  Top = 173
  BorderIcons = [biSystemMenu]
  Caption = 'frmReportHarian'
  ClientHeight = 461
  ClientWidth = 792
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 492
    Top = 68
    Width = 54
    Height = 15
    Caption = 'Start Date'
    Transparent = True
    Visible = False
  end
  object Label2: TLabel
    Left = 492
    Top = 96
    Width = 45
    Height = 15
    Caption = 'EndDate'
    Transparent = True
    Visible = False
  end
  object edStart: TcxDateEdit
    Left = 552
    Top = 64
    EditValue = 0d
    TabOrder = 3
    Visible = False
    Width = 150
  end
  object edEnd: TcxDateEdit
    Left = 552
    Top = 92
    EditValue = 0d
    TabOrder = 4
    Visible = False
    Width = 150
  end
  object cxButton1: TcxButton
    Left = 12
    Top = 32
    Width = 209
    Height = 49
    Caption = 'VIEW TRANSAKSI'
    Default = True
    LookAndFeel.Kind = lfOffice11
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 139
    Width = 792
    Height = 322
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    Properties.ActivePage = pgJasa
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 322
    ClientRectRight = 792
    ClientRectTop = 26
    object pgJasa: TcxTabSheet
      Caption = 'DETAIL TRANSAKSI'
      ImageIndex = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 281
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        PopupMenu = pmView
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object gtvDetailJasa: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Kind = skSum
              Position = spFooter
              Column = gtvDetailJasaSubtotal
            end
            item
              Kind = skSum
              Column = gtvDetailJasaSubtotal
            end
            item
              Kind = skMax
              Position = spFooter
              Column = gtvDetailJasaID
            end
            item
              Kind = skCount
              Column = gtvDetailJasaID
            end
            item
              Kind = skCount
              Position = spFooter
              Column = gtvDetailJasaPaket
            end
            item
              Kind = skCount
              Column = gtvDetailJasaPaket
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#,#'
              Kind = skSum
              Column = gtvDetailJasaSubtotal
            end
            item
              Kind = skCount
              Column = gtvDetailJasaID
            end
            item
              Kind = skCount
              Column = gtvDetailJasaPaket
            end>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 'Klik Di Sini untuk filter data'
          FilterRow.Visible = True
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.Footer = True
          OptionsView.Indicator = True
          object gtvDetailJasaCabang: TcxGridColumn
            Caption = 'Cabang'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Properties.ReadOnly = True
          end
          object gtvDetailJasaPaket: TcxGridColumn
            Caption = 'Paket'
            Width = 87
          end
          object gtvDetailJasaPromo: TcxGridColumn
            Caption = 'Promo'
            PropertiesClassName = 'TcxTextEditProperties'
          end
          object gtvDetailJasaTransType: TcxGridColumn
            Caption = 'Trans Type'
            PropertiesClassName = 'TcxTextEditProperties'
            Width = 98
          end
          object gtvDetailJasaNamaCust: TcxGridColumn
            Caption = 'Nama Customer'
            Width = 119
          end
          object gtvDetailJasaID: TcxGridColumn
            Caption = 'ID Jasa / Product'
            Width = 160
          end
          object gtvDetailJasaNama: TcxGridColumn
            Caption = 'Nama Jasa / Product'
            Width = 149
          end
          object gtvDetailJasaQty: TcxGridColumn
            Caption = 'Qty'
            Width = 81
          end
          object gtvDetailJasaRoomID: TcxGridColumn
            Caption = 'Room ID'
            Width = 103
          end
          object gtvDetailJasaTRID: TcxGridColumn
            Caption = 'TR ID'
            Width = 91
          end
          object gtvDetailJasaHarga: TcxGridColumn
            Caption = 'Harga'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.UseThousandSeparator = True
            Width = 124
          end
          object gtvDetailJasaDiscount: TcxGridColumn
            Caption = 'Disc %'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.UseThousandSeparator = True
            Width = 122
          end
          object gtvDetailJasaSubtotal: TcxGridColumn
            Caption = 'Subtotal'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.UseThousandSeparator = True
            Width = 103
          end
          object gtvDetailJasaIDCust: TcxGridColumn
            Caption = 'ID Customer'
            Width = 111
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = gtvDetailJasa
        end
      end
    end
  end
  object btnExport: TcxButton
    Left = 260
    Top = 12
    Width = 141
    Height = 49
    Caption = 'EXPORT TO EXCEL'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 1
    OnClick = btnExportClick
  end
  object btnPrint: TcxButton
    Left = 260
    Top = 60
    Width = 141
    Height = 49
    Caption = 'PRINT PREVIEW'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 2
    OnClick = btnPrintClick
  end
  object dlgSave: TSaveDialog
    Options = [ofOverwritePrompt, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Left = 648
    Top = 4
  end
  object pmView: TPopupMenu
    Left = 452
    Top = 28
    object Expand1: TMenuItem
      Caption = 'Expand'
      OnClick = Expand1Click
    end
    object Collapse1: TMenuItem
      Caption = 'Collapse'
      OnClick = Collapse1Click
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = PrintGrid
    Version = 0
    Left = 484
    Top = 28
    object PrintGrid: TdxGridReportLink
      Active = True
      Component = cxGrid1
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.PageSize.X = 8300
      PrinterPage.PageSize.Y = 11700
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 43811.709194421290000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsSize.AutoWidth = True
      BuiltInReportLink = True
    end
  end
end
