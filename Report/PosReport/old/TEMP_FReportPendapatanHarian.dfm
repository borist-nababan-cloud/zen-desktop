object frmReportPendapatanHarian: TfrmReportPendapatanHarian
  Left = 0
  Top = 0
  Caption = '  PoS Report Pendapatan Harian'
  ClientHeight = 576
  ClientWidth = 1067
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1067
    576)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulAtas: TLabel
    Left = 8
    Top = 4
    Width = 1051
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  PoS Report Pendapatan Harian'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 993
  end
  object Label1: TLabel
    Left = 16
    Top = 38
    Width = 71
    Height = 16
    Caption = 'Server Time'
  end
  object lblTanggal: TLabel
    Left = 1002
    Top = 39
    Width = 57
    Height = 19
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = 'Tanggal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 961
  end
  object memSend: TMemo
    Left = 494
    Top = 73
    Width = 565
    Height = 370
    Anchors = [akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 507
    Width = 137
    Height = 61
    Anchors = [akLeft, akBottom]
    Caption = 'Close Trans'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object edServerTime: TcxDateEdit
    Left = 128
    Top = 35
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 249
  end
  object cxGrid1: TcxGrid
    Left = 16
    Top = 73
    Width = 459
    Height = 424
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object tvreport: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvreportColumn1: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
      end
      object tvreportColumn2: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 500
      end
      object tvreportColumn3: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 75
      end
      object tvreportColumn4: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = tvreport
    end
  end
  object cxButton2: TcxButton
    Left = 151
    Top = 507
    Width = 166
    Height = 61
    Anchors = [akLeft, akBottom]
    Caption = 'Send Mail'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object memNotes: TMemo
    Left = 494
    Top = 448
    Width = 561
    Height = 120
    Anchors = [akTop, akRight, akBottom]
    Lines.Strings = (
      'Reception Notes :')
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object cxButton3: TcxButton
    Left = 331
    Top = 507
    Width = 118
    Height = 61
    Anchors = [akLeft, akBottom]
    Caption = 'Send Mail'
    TabOrder = 6
    OnClick = cxButton3Click
  end
  object PrintGrid: TdxComponentPrinter
    CurrentLink = PrintGridLink1
    Version = 0
    Left = 724
    Top = 40
    object PrintGridLink1: TdxGridReportLink
      Active = True
      Component = cxGrid1
      DateFormat = 0
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 200
      PrinterPage.Margins.Left = 200
      PrinterPage.Margins.Right = 200
      PrinterPage.Margins.Top = 200
      PrinterPage.PageSize.X = 8300
      PrinterPage.PageSize.Y = 11700
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 45072.920649351850000000
      TimeFormat = 0
      OptionsOnEveryPage.Caption = False
      OptionsSize.AutoWidth = True
      OptionsView.Caption = False
      BuiltInReportLink = True
    end
  end
  object clSmtp1: TclSmtp
    Port = 465
    UseTLS = ctAutomatic
    MailAgent = 'Clever Internet Suite'
    Left = 644
    Top = 224
  end
  object clMailMessage1: TclMailMessage
    ToList = <>
    CCList = <>
    BCCList = <>
    Date = 45058.016274629630000000
    CharSet = 'iso-8859-1'
    ContentType = 'text/plain'
    Left = 800
    Top = 388
  end
end
