object frmReportAll: TfrmReportAll
  Left = 199
  Top = 128
  Caption = 'frmReportAll'
  ClientHeight = 500
  ClientWidth = 832
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    832
    500)
  PixelsPerInch = 96
  TextHeight = 15
  object XiPanel1: TPanel
    Left = 0
    Top = 0
    Width = 832
    Height = 85
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 540
      Top = 6
      Width = 54
      Height = 15
      Caption = 'Start Date'
      Transparent = True
      Visible = False
    end
    object Label2: TLabel
      Left = 540
      Top = 38
      Width = 48
      Height = 15
      Caption = 'End Date'
      Transparent = True
      Visible = False
    end
    object edStart: TcxDateEdit
      Left = 604
      Top = 4
      EditValue = 0d
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Visible = False
      Width = 133
    end
    object btnFind: TcxButton
      Left = 156
      Top = 4
      Width = 149
      Height = 53
      Caption = 'VIEW TRANSAKSI'
      Default = True
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      TabOrder = 0
      OnClick = btnFindClick
    end
    object cxButton2: TcxButton
      Left = 308
      Top = 4
      Width = 141
      Height = 53
      Caption = 'Option'
      DropDownMenu = pmOption
      Kind = cxbkDropDownButton
      LookAndFeel.Kind = lfOffice11
      TabOrder = 1
    end
  end
  object edEnd: TcxDateEdit
    Left = 632
    Top = 44
    EditValue = 0d
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Visible = False
    Width = 133
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 88
    Width = 829
    Height = 412
    Anchors = [akLeft, akTop, akRight, akBottom]
    PopupMenu = pmView
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object gtvAll: TcxGridBandedTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
          Column = gtvAllCustomerGender
        end
        item
          Kind = skCount
          Column = gtvAllCustomerGender
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtvAllStartTime
        end
        item
          Kind = skCount
          Column = gtvAllStartTime
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtvAllJenisTrans
        end
        item
          Kind = skCount
          Column = gtvAllCustomerGender
        end
        item
          Kind = skCount
          Column = gtvAllStartTime
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 'Klik di sini untuk filter data'
      FilterRow.Visible = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.NavigatorHints = True
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      Bands = <
        item
          Caption = 'Trans ID'
          Width = 636
        end
        item
          Caption = 'Jasa / Product'
          Width = 296
        end
        item
          Caption = 'Date Time'
        end
        item
          Caption = 'Customer'
        end>
      object gtvAllTransID: TcxGridBandedColumn
        Caption = 'ID Trans'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 66
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvAllTanggal: TcxGridBandedColumn
        Caption = 'Tanggal '
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        SortIndex = 0
        SortOrder = soAscending
        Width = 76
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvAllStartTime: TcxGridBandedColumn
        Caption = 'Start'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        SortIndex = 1
        SortOrder = soAscending
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvAllEndTime: TcxGridBandedColumn
        Caption = 'End'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        SortIndex = 2
        SortOrder = soAscending
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvAllCustomerNama: TcxGridBandedColumn
        Caption = 'Nama Customer'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 93
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvAllCustomerGender: TcxGridBandedColumn
        Caption = 'Gender'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvAllRoomID: TcxGridBandedColumn
        Caption = 'Room ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 66
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvAllTRID: TcxGridBandedColumn
        Caption = 'ID TR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 77
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvAllNamaTR: TcxGridBandedColumn
        Caption = 'Nama TR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 84
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvAllStatusTrans: TcxGridBandedColumn
        Caption = 'Status'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 87
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtvAllNamaTrans: TcxGridBandedColumn
        Caption = 'Jasa / Product'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 161
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvAllPaket: TcxGridBandedColumn
        Caption = 'Paket'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 51
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvAllHarga: TcxGridBandedColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 52
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvAllJenisTrans: TcxGridBandedColumn
        Caption = 'Jenis'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 67
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvAllPaymentID: TcxGridBandedColumn
        Caption = 'Payment ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 71
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtvAllPromo: TcxGridBandedColumn
        Caption = 'Promo'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 57
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtvAllCabang: TcxGridBandedColumn
        Caption = 'Cabang'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 77
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvAll
    end
  end
  object dlgSave: TSaveDialog
    Options = [ofOverwritePrompt, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Left = 696
    Top = 16
  end
  object pmOption: TPopupMenu
    Left = 484
    Top = 24
    object ExportExcel20031: TMenuItem
      Caption = 'Export Excel 2003'
      OnClick = ExportExcel20031Click
    end
    object PrintPreview1: TMenuItem
      Caption = 'Print Preview'
      OnClick = PrintPreview1Click
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = PrintGrid
    Version = 0
    Left = 620
    Top = 8
    object PrintGrid: TdxGridReportLink
      Active = True
      Component = cxGrid1
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 126
      PrinterPage.Margins.Right = 134
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage.ScaleMode = smFit
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 43811.709341192130000000
      ShrinkToPageWidth = True
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsFormatting.UseNativeStyles = True
      OptionsRefinements.TransparentGraphics = True
      OptionsSize.AutoWidth = True
      StyleRepository = cxStyleRepository1
      Styles.BandHeader = cxStyle1
      Styles.Caption = cxStyle3
      Styles.FilterBar = cxStyle2
      Styles.Footer = cxStyle6
      Styles.Header = cxStyle5
      Styles.Selection = cxStyle4
      BuiltInReportLink = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clWindow
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
  end
  object pmView: TPopupMenu
    Left = 520
    Top = 24
    object Expand1: TMenuItem
      Caption = 'Expand'
      OnClick = Expand1Click
    end
    object Collapse1: TMenuItem
      Caption = 'Collapse'
      OnClick = Collapse1Click
    end
  end
end
