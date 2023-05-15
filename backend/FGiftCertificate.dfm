object frmGiftCertificate: TfrmGiftCertificate
  Left = 273
  Top = 161
  ClientHeight = 555
  ClientWidth = 910
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
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
    910
    555)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 8
    Top = 324
    Width = 894
    Height = 221
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    DesignSize = (
      894
      221)
    object Label1: TLabel
      Left = 12
      Top = 41
      Width = 102
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'No. Gift Certificate'
      Transparent = True
    end
    object Label10: TLabel
      Left = 12
      Top = 61
      Width = 43
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'ID Awal'
      Transparent = True
    end
    object Label2: TLabel
      Left = 14
      Top = 85
      Width = 41
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Jumlah'
      Transparent = True
      ExplicitTop = 42
    end
    object Label3: TLabel
      Left = 12
      Top = 110
      Width = 54
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Tgl Terbit'
      Transparent = True
      ExplicitTop = 67
    end
    object Label4: TLabel
      Left = 12
      Top = 131
      Width = 83
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Tgl Kadaluarsa'
      Transparent = True
    end
    object Label5: TLabel
      Left = 269
      Top = 42
      Width = 74
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Menu Master'
      Transparent = True
    end
    object Label6: TLabel
      Left = 270
      Top = 66
      Width = 58
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Jenis Jasa'
      Transparent = True
    end
    object Label8: TLabel
      Left = 271
      Top = 94
      Width = 63
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Harga Jasa'
      Transparent = True
    end
    object Label9: TLabel
      Left = 273
      Top = 118
      Width = 60
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Harga Jual'
      Transparent = True
    end
    object Label11: TLabel
      Left = 8
      Top = 7
      Width = 180
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = '  NEW GENERATE GC DETAILS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object edID: TcxTextEdit
      Left = 116
      Top = 38
      Anchors = [akLeft, akBottom]
      TabOrder = 0
      Width = 137
    end
    object edStart: TcxTextEdit
      Left = 116
      Top = 60
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      Text = '0001'
      Width = 137
    end
    object edJumlah: TcxCalcEdit
      Left = 116
      Top = 82
      Anchors = [akLeft, akBottom]
      EditValue = 0
      TabOrder = 2
      Width = 137
    end
    object edTerbit: TcxDateEdit
      Left = 116
      Top = 106
      Anchors = [akLeft, akBottom]
      EditValue = 0d
      TabOrder = 3
      Width = 137
    end
    object edKadaluarsa: TcxDateEdit
      Left = 116
      Top = 129
      Anchors = [akLeft, akBottom]
      EditValue = 0d
      TabOrder = 4
      Width = 137
    end
    object edMenu: TcxLookupComboBox
      Left = 345
      Top = 38
      Anchors = [akLeft, akBottom]
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'menu_id'
      Properties.ListColumns = <
        item
          FieldName = 'nama_menu'
        end>
      Properties.ListSource = dsQryMenu
      Properties.OnChange = edMenuPropertiesChange
      Properties.OnValidate = edMenuPropertiesValidate
      TabOrder = 5
      Width = 250
    end
    object edJenisJasa: TcxTextEdit
      Left = 345
      Top = 62
      Anchors = [akLeft, akBottom]
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 6
      Width = 250
    end
    object edHargaJasa: TcxCalcEdit
      Left = 345
      Top = 89
      OnFocusChanged = edHargaJasaFocusChanged
      Anchors = [akLeft, akBottom]
      EditValue = 0
      Properties.UseThousandSeparator = True
      TabOrder = 7
      Width = 250
    end
    object edHargaJual: TcxCalcEdit
      Left = 345
      Top = 115
      Anchors = [akLeft, akBottom]
      EditValue = 0
      Properties.UseThousandSeparator = True
      TabOrder = 8
      Width = 250
    end
    object btnOK: TcxButton
      Left = 28
      Top = 172
      Width = 113
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Generate'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      TabOrder = 9
      OnClick = btnOKClick
    end
    object cxButton1: TcxButton
      Left = 148
      Top = 172
      Width = 113
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Cancel'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      TabOrder = 10
    end
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 33
    Width = 894
    Height = 232
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object gtbGCDetail: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryGCDetail
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
          Column = gtbGCDetailpaket_number
          Sorted = True
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbGCDetailgc_number
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbGCDetailjenis_jasa_id
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbGCDetailjasa_master_id
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbGCDetailharga_jasa
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbGCDetailharga_jual
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbGCDetailaktif
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbGCDetailterjual
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbGCDetailpakai
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtbGCDetailgc_number
        end
        item
          Kind = skCount
          Column = gtbGCDetailnama_menu
        end
        item
          Kind = skCount
          Column = gtbGCDetailpaket_number
        end
        item
          Kind = skCount
          Column = gtbGCDetailjenis_jasa_id
        end
        item
          Kind = skCount
          Column = gtbGCDetailjasa_master_id
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbGCDetailharga_jasa
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbGCDetailharga_jual
        end
        item
          Kind = skCount
          Column = gtbGCDetailaktif
        end
        item
          Kind = skCount
          Column = gtbGCDetailterjual
        end
        item
          Kind = skCount
          Column = gtbGCDetailpakai
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object gtbGCDetailautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
      end
      object gtbGCDetailpaket_number: TcxGridDBColumn
        Caption = 'Paket Number'
        DataBinding.FieldName = 'paket_number'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
      object gtbGCDetailgc_number: TcxGridDBColumn
        Caption = 'GC Number'
        DataBinding.FieldName = 'gc_number'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
      object gtbGCDetailtanggal: TcxGridDBColumn
        Caption = 'Terbit'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 75
      end
      object gtbGCDetailexpired_date: TcxGridDBColumn
        Caption = 'Expired'
        DataBinding.FieldName = 'expired_date'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 77
      end
      object gtbGCDetailjenis_jasa_id: TcxGridDBColumn
        Caption = 'Jenis Jasa'
        DataBinding.FieldName = 'jenis_jasa_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbGCDetailjasa_master_id: TcxGridDBColumn
        Caption = 'Master Jasa'
        DataBinding.FieldName = 'jasa_master_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Width = 107
      end
      object gtbGCDetailnama_menu: TcxGridDBColumn
        Caption = 'Nama Menu'
        DataBinding.FieldName = 'nama_menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 150
      end
      object gtbGCDetailharga_jasa: TcxGridDBColumn
        Caption = 'Harga Jasa'
        DataBinding.FieldName = 'harga_jasa'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 89
      end
      object gtbGCDetailharga_jual: TcxGridDBColumn
        Caption = 'Harga Jual'
        DataBinding.FieldName = 'harga_jual'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbGCDetailaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 43
      end
      object gtbGCDetailterjual: TcxGridDBColumn
        Caption = 'Sold'
        DataBinding.FieldName = 'terjual'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 42
      end
      object gtbGCDetailpakai: TcxGridDBColumn
        Caption = 'Used'
        DataBinding.FieldName = 'pakai'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 40
      end
      object gtbGCDetailnotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 225
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbGCDetail
    end
  end
  object cxLabel1: TcxLabel
    Left = 0
    Top = 0
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = ' Master GC'
    ParentColor = False
    ParentFont = False
    Style.Color = clBlack
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.TextColor = clWhite
    Style.IsFontAssigned = True
    Height = 23
    Width = 899
  end
  object ckAktif: TcxCheckBox
    Left = 833
    Top = 271
    Anchors = [akRight, akBottom]
    Caption = 'Aktif'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    Properties.OnChange = ckAktifPropertiesChange
    State = cbsChecked
    TabOrder = 3
  end
  object btnSetNonAktif: TcxButton
    Left = 8
    Top = 271
    Width = 121
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 'Set Non Active'
    TabOrder = 4
    OnClick = btnSetNonAktifClick
  end
  object ckJual: TcxCheckBox
    Left = 753
    Top = 271
    Anchors = [akRight, akBottom]
    Caption = 'Terjual'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    Properties.OnChange = ckJualPropertiesChange
    TabOrder = 5
  end
  object ckPakai: TcxCheckBox
    Left = 681
    Top = 271
    Anchors = [akRight, akBottom]
    Caption = 'Pakai'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    Properties.OnChange = ckPakaiPropertiesChange
    TabOrder = 6
  end
  object btnSetActive: TcxButton
    Left = 140
    Top = 271
    Width = 121
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 'Set Active'
    TabOrder = 7
    OnClick = btnSetActiveClick
  end
  object Memo1: TMemo
    Left = 632
    Top = 36
    Width = 250
    Height = 180
    Anchors = [akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 8
  end
  object btnSetSatuan: TcxButton
    Left = 267
    Top = 271
    Width = 121
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 'Set Paket Satuan'
    TabOrder = 9
    OnClick = btnSetSatuanClick
  end
  object pmOption: TPopupMenu
    Left = 32
    Top = 102
    object PrintTable1: TMenuItem
      Caption = 'Print Table'
    end
    object ExportTable1: TMenuItem
      Caption = 'Export Table'
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = printGrid
    Version = 0
    Left = 848
    Top = 500
    object printGrid: TdxGridReportLink
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.Header = 429
      PrinterPage.Margins.Bottom = 799
      PrinterPage.Margins.Left = 350
      PrinterPage.Margins.Right = 190
      PrinterPage.Margins.Top = 909
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        ''
        ''
        'ADMIN')
      PrinterPage.PageFooter.LeftTitle.Strings = (
        '[Date Printed],[Time Printed]')
      PrinterPage.PageFooter.RightTitle.Strings = (
        '[Page # of Pages #]')
      PrinterPage.PageHeader.Font.Charset = ANSI_CHARSET
      PrinterPage.PageHeader.Font.Color = clBlack
      PrinterPage.PageHeader.Font.Height = -13
      PrinterPage.PageHeader.Font.Name = 'Calibri'
      PrinterPage.PageHeader.Font.Style = [fsBold]
      PrinterPage.PageHeader.LeftTitle.Strings = (
        'Print Out'
        'Gift Certificate')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage.ReverseTitlesOnEvenPages = True
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 40689.606893495400000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsSize.AutoWidth = True
      BuiltInReportLink = True
    end
  end
  object dlgSave: TSaveDialog
    Left = 848
    Top = 424
  end
  object pmView: TPopupMenu
    Left = 36
    Top = 146
    object Expand1: TMenuItem
      Caption = 'Expand'
    end
    object Collapse1: TMenuItem
      Caption = 'Collapse'
    end
  end
  object qryGCDetail: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select * from gc_detail where aktif = '#39'Y'#39' AND terjual = '#39'N'#39'  AND' +
        ' pakai = '#39'N'#39' order by tanggal DESC')
    Active = True
    Left = 100
    Top = 96
  end
  object dsQryGCDetail: TDataSource
    DataSet = qryGCDetail
    Left = 104
    Top = 156
  end
  object qryMenu: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select menu_id, nama_menu from main_menu where aktif = '#39'Y'#39
      'AND type_menu = '#39'BJ'#39)
    Left = 728
    Top = 320
  end
  object dsQryMenu: TDataSource
    DataSet = qryMenu
    Left = 780
    Top = 324
  end
end
