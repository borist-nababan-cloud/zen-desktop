object frmReportPendapatanBulanan: TfrmReportPendapatanBulanan
  Left = 0
  Top = 0
  Caption = '  PoS Report Pendapatan Periodic'
  ClientHeight = 575
  ClientWidth = 1057
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
    1057
    575)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulAtas: TLabel
    Left = 8
    Top = 4
    Width = 1041
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  PoS Report Pendapatan Periodic'
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
    Left = 488
    Top = 39
    Width = 71
    Height = 16
    Caption = 'Server Time'
  end
  object lblTanggal: TLabel
    Left = 992
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
  object Label2: TLabel
    Left = 12
    Top = 39
    Width = 26
    Height = 16
    Caption = 'Year'
  end
  object Label3: TLabel
    Left = 228
    Top = 39
    Width = 35
    Height = 16
    Caption = 'Month'
  end
  object lblTtest: TLabel
    Left = 16
    Top = 73
    Width = 10
    Height = 19
    Caption = '  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxButton1: TcxButton
    Left = 17
    Top = 506
    Width = 137
    Height = 61
    Anchors = [akLeft, akBottom]
    Caption = 'Load Trans'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object edServerTime: TcxDateEdit
    Left = 568
    Top = 36
    EditValue = 0d
    Properties.ReadOnly = False
    TabOrder = 1
    Width = 249
  end
  object cxGrid1: TcxGrid
    Left = 16
    Top = 98
    Width = 449
    Height = 398
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
        Properties.Alignment.Horz = taRightJustify
        Width = 200
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = tvreport
    end
  end
  object cxButton2: TcxButton
    Left = 160
    Top = 506
    Width = 305
    Height = 61
    Anchors = [akLeft, akBottom]
    Caption = 'Send Mail'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object memNotes: TMemo
    Left = 496
    Top = 80
    Width = 561
    Height = 202
    Anchors = [akTop, akRight, akBottom]
    Lines.Strings = (
      'Notes :')
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object edYear: TcxComboBox
    Left = 92
    Top = 36
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '2027'
      '2026'
      '2025'
      '2024'
      '2023')
    TabOrder = 6
    Width = 121
  end
  object edMonth: TcxComboBox
    Left = 280
    Top = 36
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '01'
      '02'
      '03'
      '04'
      '05'
      '06'
      '07'
      '08'
      '09'
      '10'
      '11'
      '12')
    TabOrder = 7
    Text = '01'
    Width = 121
  end
  object Button1: TButton
    Left = 407
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 8
    Visible = False
    OnClick = Button1Click
  end
  object memSend: TMemo
    Left = 496
    Top = 288
    Width = 561
    Height = 279
    Anchors = [akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object PrintGrid: TdxComponentPrinter
    CurrentLink = PrintGridLink1
    Version = 0
    Left = 724
    Top = 40
    object PrintGridLink1: TdxGridReportLink
      Active = True
      Component = cxGrid1
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 200
      PrinterPage.GrayShading = True
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 200
      PrinterPage.Margins.Left = 200
      PrinterPage.Margins.Right = 200
      PrinterPage.Margins.Top = 200
      PrinterPage.PageSize.X = 8300
      PrinterPage.PageSize.Y = 11700
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 46297.032817256940000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsOnEveryPage.Caption = False
      OptionsSize.AutoWidth = True
      OptionsView.Caption = False
      BuiltInReportLink = True
    end
  end
end
