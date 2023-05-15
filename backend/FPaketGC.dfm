object frmPaketGC: TfrmPaketGC
  Left = 231
  Top = 54
  ClientHeight = 561
  ClientWidth = 911
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    911
    561)
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
    Width = 75
    Height = 15
    Caption = 'Tgl Kadaluarsa'
    Transparent = True
  end
  object Label5: TLabel
    Left = 4
    Top = 84
    Width = 54
    Height = 15
    Caption = 'Harga Jual'
    Transparent = True
  end
  object edIDPaket: TcxTextEdit
    Left = 164
    Top = 8
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Text = 'GC.BM.0001'
    Width = 178
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 124
    Width = 497
    Height = 389
    PopupMenu = pmPilih
    TabOrder = 2
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
      OnFocusedRecordChanged = gtbPaketGCFocusedRecordChanged
      DataController.DataSource = dsQryMaster
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
    TabOrder = 3
    Width = 250
  end
  object edKadaluarsa: TcxDateEdit
    Left = 92
    Top = 56
    EditValue = 0d
    TabOrder = 4
    Width = 250
  end
  object edHargaJual: TcxCalcEdit
    Left = 92
    Top = 80
    EditValue = 0
    Properties.UseThousandSeparator = True
    TabOrder = 5
    Width = 250
  end
  object edAktif: TcxCheckBox
    Left = 356
    Top = 8
    Caption = 'Aktif'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 6
    Transparent = True
  end
  object cxGrid2: TcxGrid
    Left = 518
    Top = 124
    Width = 385
    Height = 389
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 7
    LookAndFeel.Kind = lfOffice11
    object gtbGCDetail: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryDetail
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
        Width = 125
      end
      object gtbGCDetailtanggal: TcxGridDBColumn
        Caption = 'Tgl Terbit'
        DataBinding.FieldName = 'tanggal'
        Visible = False
      end
      object gtbGCDetailexpired_date: TcxGridDBColumn
        Caption = 'Tgl Expired'
        DataBinding.FieldName = 'expired_date'
        Visible = False
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
        Visible = False
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
        Width = 225
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = gtbGCDetail
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 556
    Width = 911
    Height = 5
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 40
    AlignSplitter = salBottom
    MinSize = 40
    Control = cxGrid2
    ExplicitWidth = 5
  end
  object btnPost: TcxButton
    Left = 360
    Top = 36
    Width = 177
    Height = 63
    Caption = 'Post'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 9
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnPostClick
  end
  object btnCancel: TcxButton
    Left = 543
    Top = 36
    Width = 69
    Height = 63
    Caption = 'Cancel'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 10
  end
  object ckAktifMaster: TcxCheckBox
    Left = 8
    Top = 527
    Anchors = [akLeft, akBottom]
    Caption = 'Aktif'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    Properties.OnChange = ckAktifMasterPropertiesChange
    State = cbsChecked
    TabOrder = 11
  end
  object ckJualMaster: TcxCheckBox
    Left = 81
    Top = 527
    Anchors = [akLeft, akBottom]
    Caption = 'Terjual'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    Properties.OnChange = ckJualMasterPropertiesChange
    TabOrder = 12
  end
  object ckAktifDetail: TcxCheckBox
    Left = 857
    Top = 527
    Anchors = [akRight, akBottom]
    Caption = 'Aktif'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsChecked
    TabOrder = 13
    Visible = False
  end
  object ckJualDetail: TcxCheckBox
    Left = 777
    Top = 527
    Anchors = [akRight, akBottom]
    Caption = 'Terjual'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 14
    Visible = False
  end
  object ckPakaiDetail: TcxCheckBox
    Left = 705
    Top = 527
    Anchors = [akRight, akBottom]
    Caption = 'Pakai'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 15
    Visible = False
  end
  object edPrefix: TcxTextEdit
    Left = 92
    Top = 8
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 66
  end
  object btnEditPaket: TcxButton
    Left = 424
    Top = 519
    Width = 81
    Height = 31
    Anchors = [akLeft, akBottom]
    Caption = 'EDIT PAKET'
    TabOrder = 16
    OnClick = btnEditPaketClick
  end
  object btnSetAktif: TcxButton
    Left = 337
    Top = 519
    Width = 81
    Height = 31
    Anchors = [akLeft, akBottom]
    Caption = 'SET ACTIVE'
    TabOrder = 17
  end
  object pmPilih: TPopupMenu
    Left = 868
    Top = 8
    object PilihGC1: TMenuItem
      Caption = 'Edit Paket'
    end
  end
  object qryDetail: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from gc_detail where paket_number = '#39'X'#39';')
    MasterSource = dsQryMaster
    MasterFields = 'paket_number'
    DetailFields = 'paket_number'
    Left = 732
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'paket_number'
        Value = nil
      end>
  end
  object dsQryDetail: TDataSource
    DataSet = qryDetail
    Left = 732
    Top = 68
  end
  object qryMaster: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from gc_master where aktif = '#39'Y'#39' and terjual = '#39'N'#39)
    Left = 812
    Top = 16
  end
  object dsQryMaster: TDataSource
    DataSet = qryMaster
    Left = 812
    Top = 68
  end
end
