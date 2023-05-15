object frmReportKontrakBerjalan: TfrmReportKontrakBerjalan
  Left = 0
  Top = 0
  Caption = 'Report Kontrak Berjalan'
  ClientHeight = 448
  ClientWidth = 838
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
    838
    448)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = -4
    Width = 838
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Laporan Kontrak Kerja Berjalan'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 917
  end
  object btnLoad: TButton
    Left = 8
    Top = 28
    Width = 109
    Height = 37
    Caption = 'Load'
    TabOrder = 0
    OnClick = btnLoadClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 71
    Width = 822
    Height = 362
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object gtvKontrak: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtvKontrakKode: TcxGridColumn
        Caption = 'Kode'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvKontrakIdFinger: TcxGridColumn
        Caption = 'Id Finger'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvKontrakNama: TcxGridColumn
        Caption = 'Nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
      object gtvKontrakDivisi: TcxGridColumn
        Caption = 'Divisi'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvKontrakType: TcxGridColumn
        Caption = 'Type Kontrak'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodekontrak'
        Properties.ListColumns = <
          item
            FieldName = 'namakontrak'
          end>
        Properties.ListSource = dsTblKontrak
        Width = 100
      end
      object gtvKontrakTglKontrak: TcxGridColumn
        Caption = 'Tgl Hbs Kontrak'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 93
      end
      object gtvKontrakNorek: TcxGridColumn
        Caption = 'No. rek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvKontrakNamaRek: TcxGridColumn
        Caption = 'Nama Rek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvKontrakGapok: TcxGridColumn
        Caption = 'GP'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtvKontrakUM: TcxGridColumn
        Caption = 'U. Makan'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtvKontrakTunjangan1: TcxGridColumn
        Caption = 'Tunjangan'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtvKontrakTunjangan2: TcxGridColumn
        Caption = 'Tunjangan Lain'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtvKontrakBPJS: TcxGridColumn
        Caption = 'BPJS'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtvKontrakPotongan: TcxGridColumn
        Caption = 'Saving'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtvKontrakPotongan2: TcxGridColumn
        Caption = 'Potongan 2'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtvKontrakKomisi: TcxGridColumn
        Caption = 'Komisi'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtvKontrakTHP: TcxGridColumn
        Caption = 'THP'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvKontrak
    end
  end
  object Button1: TButton
    Left = 740
    Top = 28
    Width = 90
    Height = 37
    Anchors = [akTop, akRight]
    Caption = 'Export Excel'
    TabOrder = 2
    OnClick = Button1Click
  end
  object tblKontrak: TMyTable
    TableName = 'ben_hrd_kontrak_master'
    Connection = dmDB.dbInternal
    Left = 672
    Top = 32
  end
  object dsTblKontrak: TDataSource
    DataSet = tblKontrak
    Left = 672
    Top = 76
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 588
    Top = 32
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 588
    Top = 76
  end
  object dlgSave: TSaveDialog
    Left = 432
    Top = 28
  end
end
