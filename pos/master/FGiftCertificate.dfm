object frmGiftCertificate: TfrmGiftCertificate
  Left = 273
  Top = 161
  Caption = '  Gift Certificate'
  ClientHeight = 630
  ClientWidth = 910
  Color = clMoneyGreen
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    910
    630)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulAtas: TLabel
    Left = 8
    Top = 8
    Width = 894
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Gift Certificate'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 40
    Width = 894
    Height = 329
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gtbGCDetail: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblGiftCertificate
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
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
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
        Width = 100
      end
      object gtbGCDetailgc_number: TcxGridDBColumn
        Caption = 'GC Number'
        DataBinding.FieldName = 'gc_number'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
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
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbGCDetailjasa_master_id: TcxGridDBColumn
        Caption = 'Master Jasa'
        DataBinding.FieldName = 'jasa_master_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 107
      end
      object gtbGCDetailnama_menu: TcxGridDBColumn
        Caption = 'Nama Menu'
        DataBinding.FieldName = 'nama_menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
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
      object gtbGCDetailnotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Width = 150
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
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbGCDetail
    end
  end
  object gbData: TGroupBox
    Left = 8
    Top = 427
    Width = 894
    Height = 195
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'New Item[s]'
    TabOrder = 1
    DesignSize = (
      894
      195)
    object Label1: TLabel
      Left = 8
      Top = 25
      Width = 104
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'No. Gift Certificate'
      Transparent = True
    end
    object Label10: TLabel
      Left = 373
      Top = 22
      Width = 44
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'ID Awal'
      Transparent = True
    end
    object Label2: TLabel
      Left = 534
      Top = 20
      Width = 40
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'Jumlah'
      Transparent = True
    end
    object Label3: TLabel
      Left = 8
      Top = 63
      Width = 56
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'Tgl Terbit'
      Transparent = True
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 85
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'Tgl Kadaluarsa'
      Transparent = True
    end
    object Label5: TLabel
      Left = 10
      Top = 118
      Width = 89
      Height = 19
      Anchors = [akLeft, akBottom]
      Caption = 'Menu Master'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 378
      Top = 82
      Width = 63
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'Harga Jasa'
      Transparent = True
    end
    object Label9: TLabel
      Left = 378
      Top = 106
      Width = 60
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'Harga Jual'
      Transparent = True
    end
    object dxBevel1: TdxBevel
      Left = 10
      Top = 40
      Width = 673
      Height = 10
      Shape = dxbsLineBottom
    end
    object lblProgress: TLabel
      Left = 118
      Top = 160
      Width = 20
      Height = 19
      Caption = '    '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 378
      Top = 58
      Width = 57
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'Type Jasa'
      Transparent = True
    end
    object edID: TcxTextEdit
      Left = 195
      Top = 19
      Anchors = [akLeft, akBottom]
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 172
    end
    object edStart: TcxTextEdit
      Left = 433
      Top = 19
      Anchors = [akLeft, akBottom]
      Properties.CharCase = ecUpperCase
      Properties.PasswordChar = '0'
      TabOrder = 2
      Text = '0001'
      Width = 85
    end
    object edJumlah: TcxCalcEdit
      Left = 592
      Top = 17
      Anchors = [akLeft, akBottom]
      EditValue = 0
      TabOrder = 3
      Width = 180
    end
    object edTerbit: TcxDateEdit
      Left = 112
      Top = 62
      Anchors = [akLeft, akBottom]
      EditValue = 0d
      TabOrder = 4
      Width = 180
    end
    object edKadaluarsa: TcxDateEdit
      Left = 112
      Top = 86
      Anchors = [akLeft, akBottom]
      EditValue = 0d
      TabOrder = 5
      Width = 180
    end
    object edMenu: TcxLookupComboBox
      Left = 112
      Top = 115
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'menu_id'
      Properties.ListColumns = <
        item
          FieldName = 'nama_menu'
        end>
      Properties.ListSource = dsQryMenu
      Properties.OnChange = edMenuPropertiesChange
      Properties.OnEditValueChanged = edMenuPropertiesEditValueChanged
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 6
      OnKeyPress = edMenuKeyPress
      Width = 250
    end
    object edHargaJasa: TcxCalcEdit
      Left = 453
      Top = 79
      Anchors = [akLeft, akBottom]
      EditValue = 0
      Properties.UseThousandSeparator = True
      TabOrder = 7
      Width = 250
    end
    object edHargaJual: TcxCalcEdit
      Left = 453
      Top = 103
      Anchors = [akLeft, akBottom]
      EditValue = 0
      Properties.UseThousandSeparator = True
      TabOrder = 8
      Width = 250
    end
    object btnOK: TcxButton
      Left = 8
      Top = 148
      Width = 104
      Height = 41
      Caption = 'Generate'
      TabOrder = 9
      OnClick = btnOKClick
    end
    object edKodeOutlet: TcxTextEdit
      Left = 118
      Top = 19
      Anchors = [akLeft, akBottom]
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 67
    end
    object ckPaketSatuan: TcxCheckBox
      Left = 782
      Top = 18
      Caption = 'Set Sebagai Paket Satuan'
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      TabOrder = 10
    end
    object edJenisJasa: TcxTextEdit
      Left = 453
      Top = 55
      Anchors = [akLeft, akBottom]
      Properties.ReadOnly = True
      TabOrder = 11
      Width = 250
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 375
    Width = 894
    Height = 46
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    DesignSize = (
      894
      46)
    object btnSetNonAktif: TcxButton
      Left = 4
      Top = 2
      Width = 104
      Height = 41
      Caption = 'Set Non-Active'
      TabOrder = 0
      OnClick = btnSetNonAktifClick
    end
    object btnShowAll: TcxButton
      Left = 785
      Top = 2
      Width = 104
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Show All'
      TabOrder = 1
      OnClick = btnShowAllClick
    end
    object btnSetActive: TcxButton
      Left = 114
      Top = 2
      Width = 104
      Height = 41
      Caption = 'Set Active'
      TabOrder = 2
      OnClick = btnSetActiveClick
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = printGrid
    Version = 0
    Left = 816
    Top = 28
    object printGrid: TdxGridReportLink
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
      OptionsSize.AutoWidth = True
      BuiltInReportLink = True
    end
  end
  object dlgSave: TSaveDialog
    Left = 704
    Top = 20
  end
  object tblGiftCertificate: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from gc_detail where aktif = '#39'Y'#39
      'and terjual = '#39'N'#39' and pakai = '#39'N'#39)
    Left = 744
    Top = 508
  end
  object dsTblGiftCertificate: TMyDataSource
    DataSet = tblGiftCertificate
    Left = 748
    Top = 552
  end
  object qryMenu: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select menu_id, nama_menu from main_menu '
      'where type_menu = '#39'BJ'#39' and aktif = '#39'Y'#39)
    Left = 824
    Top = 509
  end
  object dsQryMenu: TMyDataSource
    DataSet = qryMenu
    Left = 824
    Top = 553
  end
end
