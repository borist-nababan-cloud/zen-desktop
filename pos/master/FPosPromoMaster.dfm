object frmPosPromoMaster: TfrmPosPromoMaster
  Left = 0
  Top = 0
  Caption = 'frmPosPromoMaster'
  ClientHeight = 648
  ClientWidth = 1026
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
    1026
    648)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 1014
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  PoS Master Promo'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 956
  end
  object strukturPromo: TMemo
    Left = 446
    Top = 520
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `pos_master_promo` ('
      '  `autonum` int(11) NOT NULL AUTO_INCREMENT,'
      '  `kodepromo` varchar(30) DEFAULT NULL,'
      '  `kodecoa` varchar(255) DEFAULT NULL,'
      '  `namapromo` varchar(255) DEFAULT NULL,'
      '  `discbj` double DEFAULT 0,'
      '  `discba` double DEFAULT 0,'
      '  `discbp` double DEFAULT 0,'
      '  `ispaket` char(1) NOT NULL DEFAULT '#39'N'#39','
      '  `aktif` char(1) NOT NULL DEFAULT '#39'Y'#39','
      '  `cabang` char(3) DEFAULT NULL,'
      '  `notes` text DEFAULT NULL,'
      '  `lastuser` varchar(255) DEFAULT NULL,'
      
        '  `lasteditdate` datetime NOT NULL DEFAULT '#39'2019-01-01 01:01:01'#39 +
        ','
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;')
    ScrollBars = ssBoth
    TabOrder = 2
    Visible = False
  end
  object StrukturCoa: TMemo
    Left = 486
    Top = 425
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `coa_detail` ('
      '  `autonum` int(11) NOT NULL AUTO_INCREMENT,'
      '  `id_subdetail` char(10) DEFAULT NULL,'
      '  `id_coa_master` char(30) DEFAULT NULL,'
      '  `id_detail` char(30) DEFAULT NULL,'
      '  `nama_detail` varchar(255) DEFAULT NULL,'
      '  `id_cabang` int(2) DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;')
    ScrollBars = ssBoth
    TabOrder = 1
    Visible = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 42
    Width = 553
    Height = 547
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
      object gtbPromokodepromo: TcxGridDBColumn
        Caption = 'Kode Promo'
        DataBinding.FieldName = 'kodepromo'
        Width = 100
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
        Width = 200
      end
      object gtbPromonamapromo: TcxGridDBColumn
        Caption = 'Nama Promo'
        DataBinding.FieldName = 'namapromo'
        Width = 100
      end
      object gtbPromodiscbj: TcxGridDBColumn
        Caption = 'Disc Jasa'
        DataBinding.FieldName = 'discbj'
        Width = 100
      end
      object gtbPromodiscba: TcxGridDBColumn
        Caption = 'Disc Add'
        DataBinding.FieldName = 'discba'
        Width = 100
      end
      object gtbPromodiscbp: TcxGridDBColumn
        Caption = 'Disc Produk'
        DataBinding.FieldName = 'discbp'
        Width = 100
      end
      object gtbPromoaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        Width = 100
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
    Left = 572
    Top = 48
    Anchors = [akTop, akRight, akBottom]
    Caption = 'New / Edit Data'
    TabOrder = 3
    Height = 592
    Width = 446
    object Label2: TLabel
      Left = 12
      Top = 24
      Width = 69
      Height = 16
      Caption = 'Kode Promo'
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
      Width = 74
      Height = 16
      Caption = 'Nama Promo'
    end
    object Label5: TLabel
      Left = 12
      Top = 114
      Width = 52
      Height = 16
      Caption = 'Disc Jasa'
    end
    object Label6: TLabel
      Left = 12
      Top = 144
      Width = 83
      Height = 16
      Caption = 'Disc Additional'
    end
    object Label7: TLabel
      Left = 12
      Top = 174
      Width = 66
      Height = 16
      Caption = 'Disc Produk'
    end
    object Label8: TLabel
      Left = 252
      Top = 114
      Width = 20
      Height = 16
      Caption = ' % '
    end
    object Label9: TLabel
      Left = 252
      Top = 144
      Width = 20
      Height = 16
      Caption = ' % '
    end
    object Label10: TLabel
      Left = 252
      Top = 174
      Width = 20
      Height = 16
      Caption = ' % '
    end
    object edKodePromo: TcxTextEdit
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
    object edNamaPromo: TcxTextEdit
      Left = 116
      Top = 81
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      Width = 241
    end
    object edBJ: TcxCalcEdit
      Left = 116
      Top = 111
      EditValue = 0.000000000000000000
      TabOrder = 3
      Width = 121
    end
    object edBA: TcxCalcEdit
      Left = 116
      Top = 141
      EditValue = 0.000000000000000000
      TabOrder = 4
      Width = 121
    end
    object edBP: TcxCalcEdit
      Left = 116
      Top = 171
      EditValue = 0.000000000000000000
      TabOrder = 5
      Width = 121
    end
    object ckAktif: TcxCheckBox
      Left = 164
      Top = 208
      Caption = 'Aktif'
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      TabOrder = 6
      Transparent = True
    end
    object btnSave: TcxButton
      Left = 51
      Top = 249
      Width = 105
      Height = 45
      Caption = 'Save'
      TabOrder = 7
      OnClick = btnSaveClick
    end
    object btnReset: TcxButton
      Left = 207
      Top = 249
      Width = 105
      Height = 45
      Caption = 'Clear'
      TabOrder = 8
      OnClick = btnResetClick
    end
    object ckDiskPaket: TcxCheckBox
      Left = 12
      Top = 208
      Caption = 'Discount On HH'
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      TabOrder = 9
      Transparent = True
    end
  end
  object btnNew: TcxButton
    Left = 8
    Top = 595
    Width = 105
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 4
    OnClick = btnNewClick
  end
  object btnEdit: TcxButton
    Left = 119
    Top = 595
    Width = 105
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'Edit Promo'
    TabOrder = 5
    OnClick = btnEditClick
  end
  object qryPromo: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from pos_master_promo where aktif = '#39'Y'#39)
    Left = 24
    Top = 80
  end
  object dsQryPromo: TMyDataSource
    DataSet = qryPromo
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
