object frmLaporanTherapistReport: TfrmLaporanTherapistReport
  Left = 0
  Top = 0
  Caption = 'frmLaporanTherapistReport'
  ClientHeight = 665
  ClientWidth = 1050
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
    1050
    665)
  PixelsPerInch = 96
  TextHeight = 16
  object Label4: TLabel
    Left = 12
    Top = 49
    Width = 118
    Height = 19
    Caption = 'Select Periode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblJudulAtas: TLabel
    Left = 4
    Top = 2
    Width = 1038
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Laporan Penilaian Therapist'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 728
  end
  object edPeriode: TcxComboBox
    Left = 248
    Top = 42
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Width = 382
  end
  object cxGrid1: TcxGrid
    Left = 12
    Top = 92
    Width = 1030
    Height = 559
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object gtbRapor: TcxGridDBCardView
      Navigator.Buttons.CustomButtons = <>
      FindPanel.DisplayMode = fpdmAlways
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      LayoutDirection = ldVertical
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CaptionWidth = 100
      OptionsView.CardAutoWidth = True
      OptionsView.CardBorderWidth = 5
      OptionsView.CardIndent = 7
      OptionsView.CardWidth = 400
      OptionsView.CategorySeparatorWidth = 5
      OptionsView.SeparatorWidth = 5
      RowLayout = rlVertical
      object gtbRaporkodereport: TcxGridDBCardViewRow
        Caption = 'Periode'
        DataBinding.FieldName = 'kodereport'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object gtbRaporkodekaryawan: TcxGridDBCardViewRow
        Caption = 'ID TR'
        DataBinding.FieldName = 'kodekaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Position.BeginsLayer = False
      end
      object gtbRaporidkaryawan: TcxGridDBCardViewRow
        Caption = 'ID TR'
        DataBinding.FieldName = 'idkaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Position.BeginsLayer = False
      end
      object gtbRapornama: TcxGridDBCardViewRow
        Caption = 'Nama '
        DataBinding.FieldName = 'nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Position.BeginsLayer = False
      end
      object gtbRaporNilai2: TcxGridDBCardViewRow
        Caption = 'Nilai'
        DataBinding.FieldName = 'nilai'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.0'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Position.BeginsLayer = False
      end
      object gtbRaporcatatan: TcxGridDBCardViewRow
        Caption = 'Notes'
        DataBinding.FieldName = 'catatan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Position.BeginsLayer = False
      end
      object gtbRapornilai: TcxGridDBCardViewRow
        DataBinding.FieldName = 'nilai'
        PropertiesClassName = 'TdxRatingControlProperties'
        Properties.ReadOnly = True
        CaptionAlignmentHorz = taCenter
        Position.BeginsLayer = True
        IsCaptionAssigned = True
      end
      object gtbRaporstatus: TcxGridDBCardViewRow
        DataBinding.FieldName = 'status'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        OnGetDisplayText = gtbRaporstatusGetDisplayText
        CaptionAlignmentHorz = taCenter
        Position.BeginsLayer = False
        IsCaptionAssigned = True
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbRapor
    end
  end
  object cxButton1: TcxButton
    Left = 648
    Top = 41
    Width = 105
    Height = 40
    Caption = 'Load'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 776
    Top = 41
    Width = 105
    Height = 40
    Caption = 'Cetak'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'SELECT kodereport, kodekaryawan, idkaryawan, nilai, status, cata' +
        'tan, '
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info where ben_hrd_karyawan_info.kodekaryawan = ben_report_mast' +
        'er.kodekaryawan) as nama'
      'FROM ben_report_master '
      'WHERE ben_report_master.kodereport = '#39'X'#39
      '')
    Left = 648
    Top = 128
  end
  object dsQryList: TMyDataSource
    DataSet = qryList
    Left = 648
    Top = 76
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = cetakReport
    Version = 0
    Left = 928
    Top = 64
    object cetakReport: TdxGridReportLink
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
      ReportDocument.CreationDate = 43894.533392997680000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      OptionsCards.AutoWidth = True
      OptionsExpanding.ExpandGroupRows = True
      OptionsFormatting.LookAndFeelKind = lfFlat
      OptionsSize.AutoWidth = True
      OptionsView.Caption = False
      OptionsView.FilterBar = False
      BuiltInReportLink = True
    end
  end
end
