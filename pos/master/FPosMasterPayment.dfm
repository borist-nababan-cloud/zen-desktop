object frmPosMasterPayment: TfrmPosMasterPayment
  Left = 0
  Top = 0
  Caption = '  PoS Master Payment'
  ClientHeight = 622
  ClientWidth = 1157
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
    1157
    622)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 1145
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  PoS Master Payment'
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
    Top = 42
    Width = 679
    Height = 515
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbPromo: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryPromo
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbPromoautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbPromokodepayment: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kodepayment'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
      object gtbPromonamapayment: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'namapayment'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object gtbPromokodecoa: TcxGridDBColumn
        Caption = 'Kode COA'
        DataBinding.FieldName = 'kodecoa'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_detail'
        Properties.ListColumns = <
          item
            FieldName = 'nama_detail'
          end>
        Properties.ListSource = dsQryCoa
        Properties.ReadOnly = True
        Width = 200
      end
      object gtbPromoaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 50
      end
      object gtbPromousededc: TcxGridDBColumn
        Caption = 'Bank'
        DataBinding.FieldName = 'usededc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 50
      end
      object gtbPromocabang: TcxGridDBColumn
        DataBinding.FieldName = 'cabang'
        Visible = False
        Width = 100
      end
      object gtbPromolastuser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'lastuser'
        Width = 100
      end
      object gtbPromolasteditdate: TcxGridDBColumn
        Caption = 'Date Edit'
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbPromo
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 703
    Top = 42
    Anchors = [akTop, akRight, akBottom]
    Caption = 'New / Edit Data'
    TabOrder = 1
    Height = 515
    Width = 446
    object Label2: TLabel
      Left = 12
      Top = 24
      Width = 81
      Height = 16
      Caption = 'Kode Payment'
    end
    object Label3: TLabel
      Left = 12
      Top = 54
      Width = 61
      Height = 16
      Caption = 'COA Detail'
    end
    object Label4: TLabel
      Left = 12
      Top = 84
      Width = 86
      Height = 16
      Caption = 'Nama Payment'
    end
    object edKodePayment: TcxTextEdit
      Left = 116
      Top = 21
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 241
    end
    object edCoa: TcxLookupComboBox
      Left = 116
      Top = 51
      Properties.KeyFieldNames = 'id_detail'
      Properties.ListColumns = <
        item
          FieldName = 'nama_detail'
        end>
      Properties.ListSource = dsQryCoa
      TabOrder = 1
      Width = 241
    end
    object edNamaPayment: TcxTextEdit
      Left = 116
      Top = 81
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      Width = 241
    end
    object ckAktif: TcxCheckBox
      Left = 12
      Top = 124
      Caption = 'Aktif'
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      TabOrder = 3
      Transparent = True
    end
    object btnSave: TcxButton
      Left = 59
      Top = 161
      Width = 105
      Height = 45
      Caption = 'Save'
      TabOrder = 4
      OnClick = btnSaveClick
    end
    object btnReset: TcxButton
      Left = 207
      Top = 161
      Width = 105
      Height = 45
      Caption = 'Clear'
      TabOrder = 5
      OnClick = btnResetClick
    end
    object StrukturPayment: TMemo
      Left = 9
      Top = 297
      Width = 185
      Height = 89
      Lines.Strings = (
        'CREATE TABLE `pos_master_payment` ('
        '  `autonum` int(11) NOT NULL AUTO_INCREMENT,'
        '  `kodepayment` varchar(30) DEFAULT NULL,'
        '  `kodecoa` varchar(255) DEFAULT NULL,'
        '  `namapayment` varchar(255) DEFAULT NULL,'
        '  `aktif` char(1) DEFAULT '#39'Y'#39','
        '  `usededc` char(1) NOT NULL DEFAULT '#39'N'#39','
        '  `cabang` char(3) DEFAULT NULL,'
        '  `lastuser` varchar(255) DEFAULT NULL,'
        
          '  `lasteditdate` datetime NOT NULL DEFAULT '#39'2019-01-01 01:01:01'#39 +
          ','
        '  PRIMARY KEY (`autonum`)'
        ') ENGINE=MyISAM DEFAULT CHARSET=latin1;')
      ScrollBars = ssBoth
      TabOrder = 6
      Visible = False
    end
    object ckEDC: TcxCheckBox
      Left = 124
      Top = 124
      Caption = 'Use Bank'
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      TabOrder = 7
      Transparent = True
    end
  end
  object btnNew: TcxButton
    Left = 8
    Top = 569
    Width = 105
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 2
    OnClick = btnNewClick
  end
  object btnEdit: TcxButton
    Left = 119
    Top = 569
    Width = 105
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'Edit Payment'
    TabOrder = 3
    OnClick = btnEditClick
  end
  object qryPayment: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from pos_master_payment where aktif = '#39'Y'#39)
    Active = True
    Left = 24
    Top = 80
  end
  object dsQryPromo: TMyDataSource
    DataSet = qryPayment
    Left = 24
    Top = 136
  end
  object qryCoa: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select id_detail, nama_detail from coa_detail')
    Left = 24
    Top = 192
  end
  object dsQryCoa: TMyDataSource
    DataSet = qryCoa
    Left = 24
    Top = 248
  end
end
