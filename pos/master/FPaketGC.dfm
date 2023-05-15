object frmPaketGC: TfrmPaketGC
  Left = 231
  Top = 54
  ClientHeight = 657
  ClientWidth = 911
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 4
    Top = 12
    Width = 45
    Height = 15
    Caption = 'ID Paket'
    Transparent = True
  end
  object Label3: TLabel
    Left = 4
    Top = 36
    Width = 49
    Height = 15
    Caption = 'Tgl Terbit'
    Transparent = True
  end
  object Label4: TLabel
    Left = 4
    Top = 60
    Width = 82
    Height = 15
    Caption = 'Tgl Kadaluarsa'
    Transparent = True
  end
  object Label5: TLabel
    Left = 4
    Top = 84
    Width = 58
    Height = 15
    Caption = 'Harga Jual'
    Transparent = True
  end
  object edIDPaket: TcxTextEdit
    Left = 92
    Top = 8
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Text = 'GC.BM.0001'
    Width = 250
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 118
    Width = 911
    Height = 304
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    PopupMenu = pmPilih
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object gtbPaketGC: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      OnCellClick = gtbPaketGCCellClick
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.NavigatorHints = True
      OptionsBehavior.ImmediateEditor = False
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbPaketGCpaket_number: TcxGridDBColumn
        Caption = 'No. Paket'
        DataBinding.FieldName = 'paket_number'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = True
        Width = 150
      end
      object gtbPaketGCtanggal: TcxGridDBColumn
        Caption = 'Tgl Terbit'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbPaketGCexpired_date: TcxGridDBColumn
        Caption = 'Tgl. Expired'
        DataBinding.FieldName = 'expired_date'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbPaketGCharga_jual: TcxGridDBColumn
        Caption = 'Harga Jual'
        DataBinding.FieldName = 'harga_jual'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbPaketGCtotal_items: TcxGridDBColumn
        Caption = 'Qty Items'
        DataBinding.FieldName = 'total_items'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbPaketGCaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 61
      end
      object gtbPaketGCterjual: TcxGridDBColumn
        Caption = 'Sold'
        DataBinding.FieldName = 'terjual'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 56
      end
      object gtbPaketGCnotes: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = True
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbPaketGC
    end
  end
  object edTerbit: TcxDateEdit
    Left = 92
    Top = 32
    EditValue = 0d
    TabOrder = 2
    Width = 250
  end
  object edKadaluarsa: TcxDateEdit
    Left = 92
    Top = 56
    EditValue = 0d
    TabOrder = 3
    Width = 250
  end
  object edHargaJual: TcxCalcEdit
    Left = 92
    Top = 80
    EditValue = 0
    Properties.UseThousandSeparator = True
    TabOrder = 4
    Width = 250
  end
  object edAktif: TcxCheckBox
    Left = 356
    Top = 8
    Caption = 'Aktif'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 5
    Transparent = True
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 427
    Width = 911
    Height = 230
    Align = alBottom
    TabOrder = 6
    LookAndFeel.Kind = lfOffice11
    object gtbGCDetail: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbGCDetailharga_jual
        end
        item
          Kind = skCount
          Column = gtbGCDetailgc_number
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbGCDetailautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
      end
      object gtbGCDetailpaket_number: TcxGridDBColumn
        DataBinding.FieldName = 'paket_number'
        Visible = False
      end
      object gtbGCDetailgc_number: TcxGridDBColumn
        Caption = 'No. GC'
        DataBinding.FieldName = 'gc_number'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 101
      end
      object gtbGCDetailtanggal: TcxGridDBColumn
        Caption = 'Tgl Terbit'
        DataBinding.FieldName = 'tanggal'
      end
      object gtbGCDetailexpired_date: TcxGridDBColumn
        Caption = 'Tgl Expired'
        DataBinding.FieldName = 'expired_date'
        Width = 100
      end
      object gtbGCDetailjasa_master_id: TcxGridDBColumn
        DataBinding.FieldName = 'jasa_master_id'
        Visible = False
      end
      object gtbGCDetailjenis_jasa_id: TcxGridDBColumn
        DataBinding.FieldName = 'jenis_jasa_id'
        Visible = False
        Width = 99
      end
      object gtbGCDetailnama_menu: TcxGridDBColumn
        Caption = 'Nama Menu'
        DataBinding.FieldName = 'nama_menu'
        Width = 187
      end
      object gtbGCDetailharga_jual: TcxGridDBColumn
        Caption = 'Harga Jual'
        DataBinding.FieldName = 'harga_jual'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 81
      end
      object gtbGCDetailharga_jasa: TcxGridDBColumn
        Caption = 'Harga Jasa'
        DataBinding.FieldName = 'harga_jasa'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 88
      end
      object gtbGCDetailaktif: TcxGridDBColumn
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 50
      end
      object gtbGCDetailterjual: TcxGridDBColumn
        DataBinding.FieldName = 'terjual'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 50
      end
      object gtbGCDetailpakai: TcxGridDBColumn
        DataBinding.FieldName = 'pakai'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 50
      end
      object gtbGCDetailnotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        Visible = False
        Width = 150
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = gtbGCDetail
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 422
    Width = 911
    Height = 5
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 40
    AlignSplitter = salBottom
    MinSize = 40
    Control = cxGrid2
  end
  object btnPost: TcxButton
    Left = 360
    Top = 36
    Width = 177
    Height = 37
    Caption = 'Post'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 8
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnPostClick
  end
  object btnCancel: TcxButton
    Left = 556
    Top = 36
    Width = 53
    Height = 37
    Caption = 'Cancel'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 9
  end
  object pmPilih: TPopupMenu
    Left = 832
    Top = 32
    object PilihGC1: TMenuItem
      Caption = 'Edit Paket'
      OnClick = PilihGC1Click
    end
  end
  object tblPaketGC: TMyQuery
    Connection = dmDB.dbInternal
    Left = 696
    Top = 16
  end
  object dsTblPaketGC: TMyDataSource
    DataSet = tblPaketGC
    Left = 696
    Top = 68
  end
  object qryGC: TMyQuery
    Connection = dmDB.dbInternal
    Left = 628
    Top = 12
  end
  object dsQryGC: TMyDataSource
    DataSet = qryGC
    Left = 628
    Top = 68
  end
end
