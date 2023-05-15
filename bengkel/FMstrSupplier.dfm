object frmSupplier: TfrmSupplier
  Left = 0
  Top = 0
  Caption = 'Master Supplier'
  ClientHeight = 544
  ClientWidth = 947
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    947
    544)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 236
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'New Data'
    TabOrder = 0
    Height = 293
    Width = 931
    object btnSave: TcxButton
      Left = 133
      Top = 217
      Width = 100
      Height = 45
      Caption = 'Save'
      TabOrder = 12
      OnClick = btnSaveClick
    end
    object btnReset: TcxButton
      Left = 269
      Top = 217
      Width = 85
      Height = 45
      Caption = 'Reset'
      TabOrder = 13
      OnClick = btnResetClick
    end
    object cxLabel2: TcxLabel
      Left = 9
      Top = 13
      Caption = 'Supplier Code'
      Transparent = True
    end
    object edKodeSupp: TcxTextEdit
      Left = 133
      Top = 12
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 293
    end
    object cxLabel4: TcxLabel
      Left = 9
      Top = 66
      Caption = 'Alamat'
      Transparent = True
    end
    object edAlamat: TcxTextEdit
      Left = 133
      Top = 65
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      Width = 293
    end
    object cxLabel5: TcxLabel
      Left = 9
      Top = 90
      Caption = 'Kota'
      Transparent = True
    end
    object edkota: TcxTextEdit
      Left = 133
      Top = 89
      Properties.CharCase = ecUpperCase
      TabOrder = 3
      Width = 293
    end
    object cxLabel6: TcxLabel
      Left = 9
      Top = 115
      Caption = 'Telp / Handphone'
      Transparent = True
    end
    object edTelp: TcxTextEdit
      Left = 133
      Top = 114
      Properties.CharCase = ecUpperCase
      TabOrder = 4
      Width = 293
    end
    object cxLabel7: TcxLabel
      Left = 9
      Top = 140
      Caption = 'Email'
      Transparent = True
    end
    object edEmail: TcxTextEdit
      Left = 133
      Top = 139
      Properties.CharCase = ecUpperCase
      TabOrder = 5
      Width = 293
    end
    object cxLabel8: TcxLabel
      Left = 9
      Top = 164
      Caption = 'NPWP'
      Transparent = True
    end
    object edNPWP: TcxTextEdit
      Left = 133
      Top = 163
      Properties.CharCase = ecUpperCase
      TabOrder = 6
      Width = 293
    end
    object cxLabel13: TcxLabel
      Left = 9
      Top = 40
      Caption = 'Nama Supplier'
      Transparent = True
    end
    object edNamaSupp: TcxTextEdit
      Left = 133
      Top = 39
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 293
    end
    object cxLabel1: TcxLabel
      Left = 9
      Top = 191
      Caption = 'Nama PIC'
      Transparent = True
    end
    object edPIC: TcxTextEdit
      Left = 133
      Top = 190
      Properties.CharCase = ecUpperCase
      TabOrder = 7
      Width = 293
    end
    object cxLabel3: TcxLabel
      Left = 465
      Top = 13
      Caption = 'Nama Bank'
      Transparent = True
    end
    object edBank: TcxTextEdit
      Left = 589
      Top = 12
      Properties.CharCase = ecUpperCase
      TabOrder = 8
      Width = 293
    end
    object cxLabel9: TcxLabel
      Left = 465
      Top = 40
      Caption = 'Nomor Rekening'
      Transparent = True
    end
    object edNoRek: TcxTextEdit
      Left = 589
      Top = 39
      Properties.CharCase = ecUpperCase
      TabOrder = 9
      Width = 293
    end
    object cxLabel10: TcxLabel
      Left = 465
      Top = 67
      Caption = 'Nama Rekening'
      Transparent = True
    end
    object edNamaRek: TcxTextEdit
      Left = 589
      Top = 66
      Properties.CharCase = ecUpperCase
      TabOrder = 10
      Width = 293
    end
    object cxLabel11: TcxLabel
      Left = 465
      Top = 94
      Caption = 'Lama Jatuh Tempo'
      Transparent = True
    end
    object edTempo: TcxTextEdit
      Left = 589
      Top = 93
      Properties.CharCase = ecUpperCase
      TabOrder = 11
      Width = 128
    end
    object cxLabel12: TcxLabel
      Left = 723
      Top = 94
      Caption = ' Hari '
      Transparent = True
    end
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 8
    Width = 931
    Height = 217
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object gtbSupplier: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object gtbSupplierautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 100
      end
      object gtbSupplierkode: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kode'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSuppliernamasupp: TcxGridDBColumn
        Caption = 'Nama Supplier'
        DataBinding.FieldName = 'namasupp'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSupplieralamat: TcxGridDBColumn
        Caption = 'Alamat'
        DataBinding.FieldName = 'alamat'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSupplierkota: TcxGridDBColumn
        Caption = 'Kota'
        DataBinding.FieldName = 'kota'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSuppliertelp: TcxGridDBColumn
        Caption = 'Telp'
        DataBinding.FieldName = 'telp'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSupplieremail: TcxGridDBColumn
        Caption = 'Email'
        DataBinding.FieldName = 'email'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSuppliernpwp: TcxGridDBColumn
        Caption = 'NPWP'
        DataBinding.FieldName = 'npwp'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSuppliernamapic: TcxGridDBColumn
        Caption = 'PIC'
        DataBinding.FieldName = 'namapic'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSupplierbank: TcxGridDBColumn
        Caption = 'Bank'
        DataBinding.FieldName = 'bank'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSuppliernorek: TcxGridDBColumn
        Caption = 'No Rek'
        DataBinding.FieldName = 'norek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSuppliernamarek: TcxGridDBColumn
        Caption = 'Nama rek'
        DataBinding.FieldName = 'namarek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSuppliertempo: TcxGridDBColumn
        Caption = 'Hari Tempo'
        DataBinding.FieldName = 'tempo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbSuppliernotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 100
      end
      object gtbSupplierisdelete: TcxGridDBColumn
        DataBinding.FieldName = 'isdelete'
        Width = 100
      end
      object gtbSupplierlastedituser: TcxGridDBColumn
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
      object gtbSupplierlasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbSupplier
    end
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from ben_bengkel_supplier where isdelete = '#39'N'#39)
    Active = True
    Left = 520
    Top = 416
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 520
    Top = 472
  end
end
