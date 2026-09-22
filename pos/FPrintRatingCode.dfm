object frmPrintRatingCode: TfrmPrintRatingCode
  Left = 0
  Top = 0
  Caption = 'frmPrintRatingCode'
  ClientHeight = 684
  ClientWidth = 1174
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object qrpPrintRating: TQuickRep
    Left = 32
    Top = -98
    Width = 545
    Height = 531
    ShowingPreview = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Continuous = False
    Page.Values = (
      5.100000000000000000
      780.520833333333200000
      5.100000000000000000
      801.099537037037100000
      15.000000000000000000
      5.100000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = False
    Units = Native
    Zoom = 180
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object PageHeaderBand1: TQRBand
      Left = 10
      Top = 3
      Width = 531
      Height = 470
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        690.856481481481500000
        780.520833333333400000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object lblJudulAtas: TQRLabel
        Left = 44
        Top = 12
        Width = 409
        Height = 42
        Size.Values = (
          61.736111111111120000
          64.675925925925930000
          17.638888888888890000
          601.192129629629700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'ZEN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object lblJudul: TQRLabel
        Left = 44
        Top = 47
        Width = 409
        Height = 32
        Size.Values = (
          47.037037037037040000
          64.675925925925930000
          69.085648148148150000
          601.192129629629700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Family Spa & Reflexology'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object lblAlamat1: TQRLabel
        Left = 44
        Top = 110
        Width = 409
        Height = 43
        Size.Values = (
          63.206018518518530000
          64.675925925925930000
          161.689814814814800000
          601.192129629629700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 
          'Could you please take a moment to rate your experience and provi' +
          'de any additional comments?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object lblAlamat2: TQRLabel
        Left = 44
        Top = 82
        Width = 409
        Height = 26
        Size.Values = (
          38.217592592592600000
          64.675925925925930000
          120.532407407407400000
          601.192129629629700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Guest Feedback'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 43
        Top = 408
        Width = 409
        Height = 28
        Size.Values = (
          41.157407407407410000
          63.206018518518520000
          599.722222222222200000
          601.192129629629600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Scan Me to open Feedback Page'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblRatingApps: TQRQRBarcode
        Left = 128
        Top = 159
        Width = 241
        Height = 243
        Size.Values = (
          357.187500000000000000
          188.148148148148100000
          233.715277777777800000
          354.247685185185200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        BarcodeText = 'https://customerfeedback.zenfamilyspa.id/'
        BarcodeEncoding = qrAuto
        QuietZone = 0
      end
      object QRLabel1: TQRLabel
        Left = 43
        Top = 436
        Width = 410
        Height = 28
        Size.Values = (
          41.157407407407410000
          63.206018518518520000
          640.879629629629600000
          602.662037037037100000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '********************************'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object SummaryBand1: TQRBand
      Left = 10
      Top = 473
      Width = 531
      Height = 49
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        72.025462962962980000
        780.520833333333400000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object lblDetailsRate: TQRLabel
        Left = 44
        Top = 6
        Width = 29
        Height = 29
        Size.Values = (
          42.627314814814820000
          64.675925925925930000
          8.819444444444444000
          42.627314814814820000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Test'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
    end
  end
end
