object frmMasterJasa: TfrmMasterJasa
  Left = 0
  Top = 0
  Caption = 'Master Jasa'
  ClientHeight = 536
  ClientWidth = 906
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    906
    536)
  PixelsPerInch = 96
  TextHeight = 16
  object cxGrid1: TcxGrid
    Left = 476
    Top = 84
    Width = 422
    Height = 381
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblList
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object gtbListautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
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
        Properties.ListSource = dsTblType
        Properties.ReadOnly = True
        Width = 200
      end
      object gtbListkodejasa: TcxGridDBColumn
        Caption = 'Kode Jasa'
        DataBinding.FieldName = 'kodejasa'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
      object gtbListkodetype: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'kodetype'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_type'
        Properties.ListColumns = <
          item
            FieldName = 'nama_type'
          end>
        Properties.ListSource = dsTblType
        Properties.ReadOnly = True
        Visible = False
        GroupIndex = 0
        Width = 100
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
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'New  / Edit'
    TabOrder = 1
    Height = 517
    Width = 453
    object cxLabel1: TcxLabel
      Left = 12
      Top = 32
      Caption = 'Kode Jasa'
      Transparent = True
    end
    object edKodeJasa: TcxTextEdit
      Left = 116
      Top = 31
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 321
    end
    object cxLabel2: TcxLabel
      Left = 12
      Top = 62
      Caption = 'Type Kendaraan'
      Transparent = True
    end
    object edNamaJasa: TcxTextEdit
      Left = 116
      Top = 121
      Properties.CharCase = ecUpperCase
      TabOrder = 3
      OnKeyPress = edNamaJasaKeyPress
      Width = 321
    end
    object edTypeKendaraan: TcxLookupComboBox
      Left = 116
      Top = 61
      Properties.KeyFieldNames = 'id_type'
      Properties.ListColumns = <
        item
          FieldName = 'nama_type'
        end>
      Properties.ListSource = dsTblType
      TabOrder = 1
      OnKeyPress = edTypeKendaraanKeyPress
      Width = 321
    end
    object edCharge: TcxLookupComboBox
      Left = 116
      Top = 91
      Properties.KeyFieldNames = 'kode'
      Properties.ListColumns = <
        item
          FieldName = 'kode'
        end>
      Properties.ListSource = dsTblCharge
      TabOrder = 2
      OnKeyPress = edChargeKeyPress
      Width = 321
    end
    object cxLabel3: TcxLabel
      Left = 12
      Top = 92
      Caption = 'Charge To'
      Transparent = True
    end
    object cxLabel4: TcxLabel
      Left = 13
      Top = 122
      Caption = 'Nama Jasa'
      Transparent = True
    end
    object edHarga: TcxCalcEdit
      Left = 116
      Top = 151
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#'
      Properties.UseThousandSeparator = True
      TabOrder = 4
      OnKeyPress = edHargaKeyPress
      Width = 141
    end
    object cxLabel5: TcxLabel
      Left = 13
      Top = 152
      Caption = 'Harga Jasa'
      Transparent = True
    end
    object ckAktif: TcxCheckBox
      Left = 13
      Top = 192
      Caption = 'Aktif'
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      TabOrder = 5
      OnKeyPress = ckAktifKeyPress
    end
    object btnReset: TcxButton
      Left = 216
      Top = 236
      Width = 81
      Height = 41
      Caption = 'Reset'
      TabOrder = 6
      OnClick = btnResetClick
    end
    object ckEdit: TcxCheckBox
      Left = 116
      Top = 192
      Caption = 'Editable'
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      TabOrder = 12
      OnKeyPress = ckEditKeyPress
    end
    object btnSave: TcxButton
      Left = 116
      Top = 236
      Width = 81
      Height = 41
      Caption = 'Save'
      TabOrder = 13
      OnClick = btnSaveClick
    end
  end
  object cxLabel6: TcxLabel
    Left = 476
    Top = 20
    Caption = 'Filter By Type Kendaraan'
    Transparent = True
  end
  object cxLookupComboBox3: TcxLookupComboBox
    Left = 476
    Top = 46
    Properties.ListColumns = <>
    TabOrder = 3
    Width = 321
  end
  object btnEdit: TcxButton
    Left = 476
    Top = 480
    Width = 81
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'Edit'
    TabOrder = 4
  end
  object btnDelete: TcxButton
    Left = 572
    Top = 480
    Width = 81
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'Delete Jasa'
    TabOrder = 5
  end
  object tblList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select * from ben_bengkel_jasa where aktif = '#39'Y'#39' and isdelete = ' +
        #39'N'#39)
    Active = True
    Left = 496
    Top = 152
  end
  object dsTblList: TMyDataSource
    DataSet = tblList
    Left = 500
    Top = 216
  end
  object tblType: TMyTable
    TableName = 'mstr_type'
    Connection = dmDB.dbInternal
    Active = True
    Left = 508
    Top = 280
  end
  object dsTblType: TMyDataSource
    DataSet = tblType
    Left = 508
    Top = 352
  end
  object tblCharge: TMyTable
    TableName = 'ben_bengkel_chargeto'
    Connection = dmDB.dbInternal
    Left = 576
    Top = 288
  end
  object dsTblCharge: TMyDataSource
    DataSet = tblCharge
    Left = 580
    Top = 336
  end
end
