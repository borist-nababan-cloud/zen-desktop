object frmPKBBahan: TfrmPKBBahan
  Left = 0
  Top = 0
  Caption = 'Input Bahan'
  ClientHeight = 514
  ClientWidth = 934
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
    934
    514)
  PixelsPerInch = 96
  TextHeight = 16
  object cxLabel1: TcxLabel
    Left = 495
    Top = 16
    Anchors = [akTop, akRight]
    Caption = 'Kode Bahan'
    Transparent = True
  end
  object edKodeBahan: TcxTextEdit
    Left = 599
    Top = 15
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 10
    Width = 321
  end
  object edNamaBahan: TcxTextEdit
    Left = 599
    Top = 75
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 321
  end
  object edCharge: TcxLookupComboBox
    Left = 599
    Top = 45
    Anchors = [akTop, akRight]
    Properties.KeyFieldNames = 'kode'
    Properties.ListColumns = <
      item
        FieldName = 'kode'
      end>
    Properties.ListSource = dsTblCharge
    TabOrder = 2
    Width = 321
  end
  object cxLabel3: TcxLabel
    Left = 495
    Top = 46
    Anchors = [akTop, akRight]
    Caption = 'Charge To'
    Transparent = True
  end
  object cxLabel4: TcxLabel
    Left = 496
    Top = 76
    Anchors = [akTop, akRight]
    Caption = 'Nama Bahan'
    Transparent = True
  end
  object edHarga: TcxCalcEdit
    Left = 599
    Top = 105
    OnFocusChanged = edHargaFocusChanged
    Anchors = [akTop, akRight]
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 4
    Width = 141
  end
  object cxLabel5: TcxLabel
    Left = 496
    Top = 106
    Anchors = [akTop, akRight]
    Caption = 'Harga Bahan'
    Transparent = True
  end
  object btnReset: TcxButton
    Left = 623
    Top = 256
    Width = 81
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'Reset'
    TabOrder = 14
  end
  object btnSave: TcxButton
    Left = 513
    Top = 256
    Width = 81
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'Add'
    TabOrder = 8
    OnClick = btnSaveClick
  end
  object edSatuan: TcxLookupComboBox
    Left = 792
    Top = 132
    Anchors = [akTop, akRight]
    Properties.KeyFieldNames = 'namasatuan'
    Properties.ListColumns = <
      item
        FieldName = 'namasatuan'
      end>
    Properties.ListSource = dsTblSatuan
    Properties.ReadOnly = True
    TabOrder = 15
    Width = 128
  end
  object cxLabel2: TcxLabel
    Left = 748
    Top = 133
    Anchors = [akTop, akRight]
    Caption = 'Satuan'
    Transparent = True
  end
  object cxLabel6: TcxLabel
    Left = 496
    Top = 133
    Anchors = [akTop, akRight]
    Caption = 'Qty'
    Transparent = True
  end
  object edQty: TcxCalcEdit
    Left = 599
    Top = 132
    OnFocusChanged = edQtyFocusChanged
    Anchors = [akTop, akRight]
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 5
    OnKeyPress = edQtyKeyPress
    Width = 141
  end
  object cxLabel7: TcxLabel
    Left = 496
    Top = 160
    Anchors = [akTop, akRight]
    Caption = 'Disc'
    Transparent = True
  end
  object edDisc: TcxCalcEdit
    Left = 599
    Top = 159
    OnFocusChanged = edDiscFocusChanged
    Anchors = [akTop, akRight]
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 6
    OnKeyPress = edDiscKeyPress
    Width = 141
  end
  object cxLabel8: TcxLabel
    Left = 496
    Top = 187
    Anchors = [akTop, akRight]
    Caption = 'Subtotal'
    Transparent = True
  end
  object edSubtotal: TcxCalcEdit
    Left = 599
    Top = 186
    OnFocusChanged = edSubtotalFocusChanged
    Anchors = [akTop, akRight]
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 7
    Width = 141
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 106
    Width = 482
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 20
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblList
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object gtbListautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbListkodesparepart: TcxGridDBColumn
        Caption = 'Kode Part'
        DataBinding.FieldName = 'kodebahan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
      object gtbListdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 300
      end
      object gtbListkodecharge: TcxGridDBColumn
        Caption = 'Charge To'
        DataBinding.FieldName = 'kodecharge'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListprice: TcxGridDBColumn
        Caption = 'H. Jual'
        DataBinding.FieldName = 'price'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListnotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        Visible = False
        Width = 100
      end
      object gtbListsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 75
      end
      object gtbListisedit: TcxGridDBColumn
        Caption = 'Editable'
        DataBinding.FieldName = 'isedit'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Visible = False
        Width = 60
      end
      object gtbListaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Visible = False
        Width = 60
      end
      object gtbListisdelete: TcxGridDBColumn
        DataBinding.FieldName = 'isdelete'
        Visible = False
        Width = 100
      end
      object gtbListlastedituser: TcxGridDBColumn
        Caption = 'Last Edit User'
        DataBinding.FieldName = 'lastedituser'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        Caption = 'Last Edit Date'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnSelect: TcxButton
    Left = 8
    Top = 465
    Width = 113
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'Select'
    TabOrder = 21
    OnClick = btnSelectClick
  end
  object cxLabel9: TcxLabel
    Left = 12
    Top = 63
    Caption = 'Nama Bahan'
    Transparent = True
  end
  object edCariNama: TcxTextEdit
    Left = 116
    Top = 62
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    Properties.OnChange = edCariTypePropertiesChange
    TabOrder = 1
    Width = 321
  end
  object cxLabel10: TcxLabel
    Left = 12
    Top = 33
    Caption = 'Kode Bahan'
    Transparent = True
  end
  object edCariKode: TcxTextEdit
    Left = 116
    Top = 32
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    Properties.OnChange = edCariKodePropertiesChange
    TabOrder = 0
    Width = 321
  end
  object cxLabel11: TcxLabel
    Left = 8
    Top = 7
    Caption = 'QUICK SEARCH......'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object tblList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from ben_bengkel_bahan where aktif = '#39'X'#39)
    Active = True
    Left = 540
    Top = 320
  end
  object dsTblList: TMyDataSource
    DataSet = tblList
    Left = 544
    Top = 372
  end
  object tblSatuan: TMyTable
    TableName = 'ben_bengkel_satuan'
    Connection = dmDB.dbInternal
    Left = 604
    Top = 320
  end
  object dsTblSatuan: TMyDataSource
    DataSet = tblSatuan
    Left = 604
    Top = 372
  end
  object tblCharge: TMyTable
    TableName = 'ben_bengkel_chargeto'
    Connection = dmDB.dbInternal
    Left = 664
    Top = 324
  end
  object dsTblCharge: TMyDataSource
    DataSet = tblCharge
    Left = 668
    Top = 372
  end
end
