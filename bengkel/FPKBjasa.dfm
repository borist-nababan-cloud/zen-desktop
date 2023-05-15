object frmPKBJasa: TfrmPKBJasa
  Left = 0
  Top = 0
  Caption = 'Input Jasa PKB'
  ClientHeight = 534
  ClientWidth = 679
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
    679
    534)
  PixelsPerInch = 96
  TextHeight = 16
  object cxLabel1: TcxLabel
    Left = 12
    Top = 309
    Anchors = [akLeft, akBottom]
    Caption = 'Kode Jasa'
    Transparent = True
  end
  object edKodeJasa: TcxTextEdit
    Left = 116
    Top = 308
    Anchors = [akLeft, akBottom]
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 321
  end
  object cxLabel2: TcxLabel
    Left = 12
    Top = 333
    Anchors = [akLeft, akBottom]
    Caption = 'Type Kendaraan'
    Transparent = True
  end
  object edNamaJasa: TcxTextEdit
    Left = 116
    Top = 380
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecUpperCase
    TabOrder = 3
    Width = 321
  end
  object edTypeKendaraan: TcxLookupComboBox
    Left = 116
    Top = 332
    Anchors = [akLeft, akBottom]
    Properties.KeyFieldNames = 'id_type'
    Properties.ListColumns = <
      item
        FieldName = 'nama_group_detail'
      end>
    Properties.ListSource = dsTbljenis
    TabOrder = 4
    Width = 321
  end
  object edCharge: TcxLookupComboBox
    Left = 116
    Top = 356
    Anchors = [akLeft, akBottom]
    Properties.KeyFieldNames = 'kode'
    Properties.ListColumns = <
      item
        FieldName = 'kode'
      end>
    Properties.ListSource = dsTblCharge
    TabOrder = 5
    Width = 321
  end
  object cxLabel3: TcxLabel
    Left = 12
    Top = 357
    Anchors = [akLeft, akBottom]
    Caption = 'Charge To'
    Transparent = True
  end
  object cxLabel4: TcxLabel
    Left = 13
    Top = 381
    Anchors = [akLeft, akBottom]
    Caption = 'Nama Jasa'
    Transparent = True
  end
  object edHarga: TcxCalcEdit
    Left = 116
    Top = 404
    OnFocusChanged = edHargaFocusChanged
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 8
    Width = 193
  end
  object cxLabel5: TcxLabel
    Left = 13
    Top = 405
    Anchors = [akLeft, akBottom]
    Caption = 'Harga Jasa'
    Transparent = True
  end
  object edCariJasa: TEdit
    Left = 179
    Top = 45
    Width = 252
    Height = 24
    Hint = 'Type Description here...'
    TabOrder = 10
    TextHint = 'Type Description here...'
    OnChange = edCariJasaChange
  end
  object edTypeMobilCari: TcxLookupComboBox
    Left = 179
    Top = 12
    Properties.KeyFieldNames = 'id_type'
    Properties.ListColumns = <
      item
        FieldName = 'nama_group_detail'
      end>
    Properties.ListSource = dsTbljenis
    Properties.ReadOnly = True
    TabOrder = 11
    Width = 252
  end
  object ckFilter: TcxCheckBox
    Left = 8
    Top = 16
    Caption = 'Filter By Type Kendaraan'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    Properties.OnChange = ckFilterPropertiesChange
    State = cbsChecked
    TabOrder = 12
  end
  object cxGrid1: TcxGrid
    Left = 12
    Top = 80
    Width = 659
    Height = 184
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 13
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
      object gtbListkodetype: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'kodetype'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_type'
        Properties.ListColumns = <
          item
            FieldName = 'nama_group_detail'
          end>
        Properties.ListSource = dsTbljenis
        Properties.ReadOnly = True
        Width = 150
      end
      object gtbListType2: TcxGridDBColumn
        Caption = 'Kode Type'
        DataBinding.FieldName = 'kodetype'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_type'
        Properties.ListColumns = <
          item
            FieldName = 'nama_type'
          end>
        Properties.ReadOnly = True
        Visible = False
        Width = 200
      end
      object gtbListkodejasa: TcxGridDBColumn
        Caption = 'Kode Jasa'
        DataBinding.FieldName = 'kodejasa'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 125
      end
      object gtbListdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 300
      end
      object gtbListflatrate: TcxGridDBColumn
        DataBinding.FieldName = 'flatrate'
        Visible = False
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
      object gtbListkodecharge: TcxGridDBColumn
        Caption = 'Charge To'
        DataBinding.FieldName = 'kodecharge'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListisedit: TcxGridDBColumn
        Caption = 'Editable'
        DataBinding.FieldName = 'isedit'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 60
      end
      object gtbListaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
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
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        Caption = 'Last Edit Date'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object cxLabel6: TcxLabel
    Left = 12
    Top = 46
    Caption = 'Search Deskripsi'
    Transparent = True
  end
  object cxLabel7: TcxLabel
    Left = 13
    Top = 430
    Anchors = [akLeft, akBottom]
    Caption = 'Discount'
    Transparent = True
  end
  object edDisc: TcxCalcEdit
    Left = 116
    Top = 429
    OnFocusChanged = edDiscFocusChanged
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 16
    Width = 89
  end
  object cxLabel8: TcxLabel
    Left = 13
    Top = 455
    Anchors = [akLeft, akBottom]
    Caption = 'Subtotal'
    Transparent = True
  end
  object edSubtotal: TcxCalcEdit
    Left = 116
    Top = 454
    OnFocusChanged = edSubtotalFocusChanged
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 18
    Width = 193
  end
  object cxLabel9: TcxLabel
    Left = 211
    Top = 430
    Anchors = [akLeft, akBottom]
    Caption = ' % '
    Transparent = True
  end
  object btnAdd: TcxButton
    Tag = 1
    Left = 116
    Top = 482
    Width = 107
    Height = 46
    Anchors = [akLeft, akBottom]
    Caption = 'Add'
    TabOrder = 20
    OnClick = btnAddClick
  end
  object cxButton2: TcxButton
    Left = 236
    Top = 482
    Width = 107
    Height = 46
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel'
    TabOrder = 21
  end
  object btnSelect: TcxButton
    Tag = 1
    Left = 13
    Top = 270
    Width = 92
    Height = 30
    Anchors = [akLeft, akBottom]
    Caption = 'Select'
    TabOrder = 22
    OnClick = btnSelectClick
  end
  object tblJenis: TMyTable
    TableName = 'mstr_type_detail'
    Connection = dmDB.dbInternal
    Left = 464
    Top = 292
  end
  object dsTbljenis: TMyDataSource
    DataSet = tblJenis
    Left = 464
    Top = 340
  end
  object tblList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from ben_bengkel_jasa where kodejasa = '#39'X'#39)
    Active = True
    Left = 522
    Top = 288
  end
  object dsTblList: TMyDataSource
    DataSet = tblList
    Left = 526
    Top = 352
  end
  object tblCharge: TMyTable
    TableName = 'ben_bengkel_chargeto'
    Connection = dmDB.dbInternal
    Left = 468
    Top = 416
  end
  object dsTblCharge: TMyDataSource
    DataSet = tblCharge
    Left = 472
    Top = 464
  end
end
