object frmMutasiKasKecil: TfrmMutasiKasKecil
  Left = 0
  Top = 0
  Caption = 'Mutasi Kas Kecil'
  ClientHeight = 400
  ClientWidth = 800
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
    800
    400)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 51
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
    Left = 8
    Top = 75
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
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 774
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Mutasi Kas Kecil'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 817
  end
  object Label3: TLabel
    Left = 8
    Top = 103
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
    Left = 108
    Top = 48
    EditValue = 0d
    TabOrder = 0
    Width = 181
  end
  object edEnd: TcxDateEdit
    Left = 108
    Top = 72
    EditValue = 0d
    TabOrder = 1
    Width = 181
  end
  object btnCari: TcxButton
    Left = 295
    Top = 47
    Width = 114
    Height = 71
    Caption = 'Cari'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 2
    OnClick = btnCariClick
  end
  object btnExport: TcxButton
    Left = 411
    Top = 48
    Width = 114
    Height = 71
    Caption = 'Export Excel'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 3
    OnClick = btnExportClick
  end
  object btnPrint: TcxButton
    Left = 527
    Top = 48
    Width = 114
    Height = 71
    Caption = 'PRINT'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 4
    OnClick = btnPrintClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 126
    Width = 779
    Height = 267
    Anchors = [akLeft, akTop, akRight, akBottom]
    PopupMenu = pmOption
    TabOrder = 5
    LookAndFeel.Kind = lfOffice11
    object gtvMutasiKas: TcxGridTableView
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
      object gtvMutasiKasTgl: TcxGridColumn
        Caption = 'Tanggal(mm/dd/yyyy)'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 140
      end
      object gtvMutasiKasCoaKode: TcxGridColumn
        Caption = 'Kode Coa'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtvMutasiKasCOA: TcxGridColumn
        Caption = 'Nama COA'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_detail'
        Properties.ListColumns = <
          item
            FieldName = 'nama_detail'
          end>
        Properties.ListSource = dsblCoa
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object gtvMutasiKasKet: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 300
      end
      object gtvMutasiKasDebet: TcxGridColumn
        Caption = 'Masuk'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,0.#0'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object gtvMutasiKasKredit: TcxGridColumn
        Caption = 'Keluar'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,0.#0'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object gtvMutasiKasSaldo: TcxGridColumn
        Caption = 'Saldo'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,0.#0'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object gtvMutasiKasBuktiKas: TcxGridColumn
        Caption = 'Bukti Kas'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object gtvMutasiKasNoKas: TcxGridColumn
        Caption = 'No Kas'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvMutasiKas
    end
  end
  object edTypeKas: TcxLookupComboBox
    Left = 108
    Top = 99
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodekas'
    Properties.ListColumns = <
      item
        FieldName = 'namakas'
      end>
    Properties.ListSource = dsTblKas
    TabOrder = 6
    Width = 181
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = printGrid
    Version = 0
    Left = 692
    Top = 40
    object printGrid: TdxGridReportLink
      Component = cxGrid1
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 32767
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
        'Mutasi Kas Kecil')
      PrinterPage.PageHeader.RightTitle.Strings = (
        '[Page # of Pages #]')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 40866.592515775460000000
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
  object tblKas: TMyQuery
    Connection = DMDB.StoreDB
    SQL.Strings = (
      'select kodekas, namakas from ben_master_kas where idoutlet = '#39'X'#39)
    Left = 20
    Top = 168
  end
  object dsTblKas: TDataSource
    DataSet = tblKas
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
end
