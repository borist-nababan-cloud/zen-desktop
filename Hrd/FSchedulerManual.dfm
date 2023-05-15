object frmSchedulerManual: TfrmSchedulerManual
  Left = 195
  Top = 113
  ClientHeight = 571
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 105
    Align = alTop
    Color = clInactiveCaptionText
    TabOrder = 0
    object cxGroupBox1: TcxGroupBox
      Left = 1
      Top = 1
      Align = alLeft
      Caption = 'LAST SCHEDULE'
      TabOrder = 0
      Height = 103
      Width = 280
      object edLastSchedule: TcxDateEdit
        Left = 8
        Top = 72
        Properties.ReadOnly = True
        TabOrder = 0
        Visible = False
        Width = 137
      end
      object cxLabel3: TcxLabel
        Left = 5
        Top = 18
        Caption = 'STARTING DATE'
      end
      object edStartingDate: TcxDateEdit
        Left = 99
        Top = 16
        Properties.OnChange = edStartingDatePropertiesChange
        TabOrder = 2
        Width = 135
      end
      object cxLabel2: TcxLabel
        Left = 5
        Top = 46
        Caption = 'ENDING DATE'
      end
      object edEndSchedule: TcxDateEdit
        Left = 99
        Top = 44
        Properties.OnValidate = edEndSchedulePropertiesValidate
        TabOrder = 4
        Width = 135
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 281
      Top = 1
      Align = alLeft
      Caption = 'KARYAWAN NON SECURITY'
      TabOrder = 1
      Height = 103
      Width = 364
      object btnTambah: TSpeedButton
        Left = 253
        Top = 19
        Width = 56
        Height = 22
        Caption = 'ADD'
        OnClick = btnTambahClick
      end
      object lcbStaff: TcxLookupComboBox
        Left = 104
        Top = 20
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.KeyFieldNames = 'karyawan_id'
        Properties.ListColumns = <
          item
            Width = 50
            FieldName = 'karyawan_id'
          end
          item
            Width = 100
            FieldName = 'nama_lengkap'
          end
          item
            Width = 50
            FieldName = 'departemen_id'
          end>
        EditValue = '0'
        TabOrder = 0
        Width = 145
      end
      object cxLabel1: TcxLabel
        Left = 7
        Top = 21
        Caption = 'KARYAWAN ID'
      end
      object cxButton2: TcxButton
        Left = 31
        Top = 49
        Width = 137
        Height = 41
        Caption = 'GET DATA'
        LookAndFeel.Kind = lfOffice11
        TabOrder = 2
        OnClick = cxButton2Click
      end
      object cxButton1: TcxButton
        Left = 183
        Top = 49
        Width = 137
        Height = 41
        Caption = 'POSTING DATA'
        LookAndFeel.Kind = lfOffice11
        TabOrder = 3
        OnClick = cxButton1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 269
    Width = 769
    Height = 302
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object cxGrid2: TcxGrid
      Left = 1
      Top = 1
      Width = 767
      Height = 300
      Align = alClient
      PopupMenu = pmDataDetail
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object gtvScheduler: TcxGridBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsSelection.InvertSelect = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Bands = <
          item
            Caption = 'KARYAWAN IDENTITY'
            Width = 222
          end
          item
            Caption = 'DATE'
            Width = 200
          end
          item
            Caption = 'TIME'
            Width = 301
          end>
        object gtvSchedulerKaryawanID: TcxGridBandedColumn
          Caption = 'ID'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 71
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object gtvSchedulerNama: TcxGridBandedColumn
          Caption = 'NAMA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 70
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object gtvSchedulerTanggal: TcxGridBandedColumn
          Caption = 'TANGGAL'
          DataBinding.ValueType = 'DateTime'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object gtvSchedulerHari: TcxGridBandedColumn
          Caption = 'HARI'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object gtvSchedulerMasuk: TcxGridBandedColumn
          Caption = 'MASUK'
          DataBinding.ValueType = 'DateTime'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Kind = ckDateTime
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 100
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object gtvSchedulerKeluar: TcxGridBandedColumn
          Caption = 'KELUAR'
          DataBinding.ValueType = 'DateTime'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Kind = ckDateTime
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 100
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object gtvSchedulerColor: TcxGridBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 59
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = gtvScheduler
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 105
    Width = 769
    Height = 156
    Align = alTop
    Caption = 'Panel3'
    TabOrder = 2
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 767
      Height = 154
      Align = alClient
      PopupMenu = pmDataGroup
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object gtvDays: TcxGridBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Bands = <
          item
            Caption = 'MANUAL WEEKLY SHIFT '
            Width = 1006
          end>
        object gtvDaysKaryawanId: TcxGridBandedColumn
          Caption = 'KARYAWAN ID'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 95
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object gtvDaysNama: TcxGridBandedColumn
          Caption = 'NAMA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 101
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object gtvDaysDepartemen: TcxGridBandedColumn
          Caption = 'DEPARTEMEN'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 103
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object gtvDaysWeekly: TcxGridBandedColumn
          Caption = 'WEEKLY'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'id_weekly'
          Properties.ListColumns = <
            item
              MinWidth = 150
              Width = 150
              FieldName = 'nama_weekly'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 150
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object gtvDaysMon: TcxGridBandedColumn
          Caption = 'MONDAY'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.KeyFieldNames = 'id_shift'
          Properties.ListColumns = <
            item
              MinWidth = 150
              FieldName = 'nama_shift'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 100
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object gtvDaysTue: TcxGridBandedColumn
          Caption = 'TUESDAY'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.KeyFieldNames = 'id_shift'
          Properties.ListColumns = <
            item
              MinWidth = 100
              FieldName = 'nama_shift'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 78
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object gtvDaysWed: TcxGridBandedColumn
          Caption = 'WEDNESDAY'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.KeyFieldNames = 'id_shift'
          Properties.ListColumns = <
            item
              MinWidth = 100
              FieldName = 'nama_shift'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 81
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object gtvDaysThu: TcxGridBandedColumn
          Caption = 'THURSDAY'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.KeyFieldNames = 'id_shift'
          Properties.ListColumns = <
            item
              MinWidth = 150
              FieldName = 'nama_shift'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 78
          Position.BandIndex = 0
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object gtvDaysFri: TcxGridBandedColumn
          Caption = 'FRIDAY'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.KeyFieldNames = 'id_shift'
          Properties.ListColumns = <
            item
              MinWidth = 150
              FieldName = 'nama_shift'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 81
          Position.BandIndex = 0
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object gtvDaysSat: TcxGridBandedColumn
          Caption = 'SATURDAY'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.KeyFieldNames = 'id_shift'
          Properties.ListColumns = <
            item
              MinWidth = 150
              FieldName = 'nama_shift'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 76
          Position.BandIndex = 0
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
        object gtvDaysSun: TcxGridBandedColumn
          Caption = 'SUNDAY'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.KeyFieldNames = 'id_shift'
          Properties.ListColumns = <
            item
              MinWidth = 150
              FieldName = 'nama_shift'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 79
          Position.BandIndex = 0
          Position.ColIndex = 11
          Position.RowIndex = 0
        end
        object gtvDaysBtn: TcxGridBandedColumn
          Caption = '[ # ]'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.BeepOnError = True
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.UseLeftAlignmentOnEditing = False
          Properties.ViewStyle = vsButtonsOnly
          Properties.OnButtonClick = gtvDaysBtnPropertiesButtonClick
          HeaderAlignmentHorz = taCenter
          Width = 30
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object gtvDaysColor: TcxGridBandedColumn
          Caption = 'warna'
          DataBinding.ValueType = 'LargeInt'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Width = 58
          Position.BandIndex = 0
          Position.ColIndex = 12
          Position.RowIndex = 0
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = gtvDays
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 261
    Width = 769
    Height = 8
    Hint = 'SHOW DETAIL DATE'
    HotZoneClassName = 'TcxMediaPlayer9Style'
    AlignSplitter = salTop
    Control = Panel3
    ShowHint = True
    ParentShowHint = False
  end
  object pmDataDetail: TPopupMenu
    Left = 24
    Top = 516
    object EXPORTDETAIL1: TMenuItem
      Caption = 'EXPORTTO EXCEL 2003'
      OnClick = EXPORTDETAIL1Click
    end
    object PRINTDATA1: TMenuItem
      Caption = 'PRINT DATA'
      OnClick = PRINTDATA1Click
    end
  end
  object dlgSave: TSaveDialog
    Left = 52
    Top = 516
  end
  object pmDataGroup: TPopupMenu
    Left = 80
    Top = 516
    object EXPORTGROUP1: TMenuItem
      Caption = 'EXPORT TO EXCEL 2003'
      OnClick = EXPORTGROUP1Click
    end
    object PRINTDATA2: TMenuItem
      Caption = 'PRINT DATA'
      OnClick = PRINTDATA2Click
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = printGroup
    Version = 0
    Left = 116
    Top = 516
    object printGroup: TdxGridReportLink
      Active = True
      Component = cxGrid1
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 43811.981670439820000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsSize.AutoWidth = True
      BuiltInReportLink = True
    end
    object printDetail: TdxGridReportLink
      Component = cxGrid2
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 40106.621627604200000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsSize.AutoWidth = True
      BuiltInReportLink = True
    end
  end
  object tblScheduleStaff: TMyTable
    TableName = 'available_tr'
    Connection = DMDB.StoreDB
    Left = 380
    Top = 292
  end
end
