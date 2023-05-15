object frmPaketGCInput: TfrmPaketGCInput
  Left = 0
  Top = 0
  Caption = '  Input Paket GC'
  ClientHeight = 689
  ClientWidth = 1085
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1085
    689)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulAtas: TLabel
    Left = 4
    Top = 4
    Width = 1073
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Input Paket GC'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1149
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 52
    Caption = 'Kode Paket'
    Transparent = True
  end
  object edOutletID: TcxTextEdit
    Left = 92
    Top = 51
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 81
  end
  object edKode: TcxTextEdit
    Left = 179
    Top = 51
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    Width = 306
  end
  object edHargaJual: TcxCalcEdit
    Left = 92
    Top = 81
    EditValue = 0.000000000000000000
    Properties.UseThousandSeparator = True
    TabOrder = 3
    Width = 257
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 82
    Caption = 'Harga Jual'
    Transparent = True
  end
  object edExpired: TcxDateEdit
    Left = 92
    Top = 111
    EditValue = 0d
    TabOrder = 5
    Width = 257
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 112
    Caption = 'Expired'
    Transparent = True
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 152
    Width = 493
    Height = 493
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 7
    object gtvAvailble: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,,#'
          Kind = skSum
          Column = gtvAvailbleHarga
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtvAvailbleNamaMenu
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtvAvailbleNoGC
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtvAvailbleNoGC: TcxGridColumn
        Caption = 'No. GC'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
      object gtvAvailbleNamaMenu: TcxGridColumn
        Caption = 'Nama Menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object gtvAvailbleHarga: TcxGridColumn
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvAvailble
    end
  end
  object cxGrid2: TcxGrid
    Left = 578
    Top = 152
    Width = 493
    Height = 493
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 8
    object tvList: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,,#'
          Kind = skSum
          Column = tvListHarga
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = tvListNamaMenu
        end
        item
          Format = '#,#'
          Kind = skCount
          OnGetText = tvListTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText
          Column = tvListNoGC
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvListNoGC: TcxGridColumn
        Caption = 'No. GC'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
      object tvListNamaMenu: TcxGridColumn
        Caption = 'Nama Menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object tvListHarga: TcxGridColumn
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 656
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh List'
    TabOrder = 9
    OnClick = cxButton1Click
  end
  object cxButton3: TcxButton
    Left = 507
    Top = 196
    Width = 65
    Height = 81
    Anchors = [akLeft]
    Caption = 'ADD'
    TabOrder = 10
    OnClick = cxButton3Click
  end
  object cxButton4: TcxButton
    Left = 507
    Top = 292
    Width = 65
    Height = 81
    Anchors = [akLeft]
    Caption = 'MOVE'
    TabOrder = 11
    OnClick = cxButton4Click
  end
  object btnSave: TcxButton
    Left = 491
    Top = 81
    Width = 122
    Height = 53
    Anchors = [akLeft]
    Caption = 'SAVE'
    TabOrder = 12
    OnClick = btnSaveClick
  end
  object cxLabel4: TcxLabel
    Left = 358
    Top = 82
    Caption = 'Items'
    Transparent = True
  end
  object edItems: TcxCalcEdit
    Left = 400
    Top = 81
    EditValue = 0.000000000000000000
    Properties.UseThousandSeparator = True
    TabOrder = 14
    Width = 77
  end
end
