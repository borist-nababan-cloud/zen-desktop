object frmMasterBank: TfrmMasterBank
  Left = 0
  Top = 0
  ClientHeight = 485
  ClientWidth = 924
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
    924
    485)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 4
    Top = 4
    Width = 912
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  MASTER BANK'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 515
  end
  object StrukturSaldo: TMemo
    Left = 540
    Top = 378
    Width = 185
    Height = 89
    Anchors = [akLeft, akBottom]
    Lines.Strings = (
      'CREATE TABLE `ben_saldo_bank` ('
      '  `autonum` int(3) NOT NULL AUTO_INCREMENT,'
      '  `kodebank` varchar(30) DEFAULT NULL,'
      '  `tanggal` date DEFAULT NULL,'
      '  `saldo` double NOT NULL DEFAULT 0,'
      '  `lastuseredit` varchar(30) DEFAULT NULL,'
      '  `lasteditdate` datetime DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM DEFAULT CHARSET=latin1;')
    ScrollBars = ssBoth
    TabOrder = 4
    Visible = False
  end
  object StrukturMaster: TMemo
    Left = 731
    Top = 378
    Width = 185
    Height = 89
    Anchors = [akLeft, akBottom]
    Lines.Strings = (
      'CREATE TABLE `ben_master_bank` ('
      '  `autonum` int(11) NOT NULL AUTO_INCREMENT,'
      '  `idoutlet` int(3) DEFAULT NULL,'
      '  `kodebank` varchar(30) DEFAULT NULL,'
      '  `namabank` varchar(255) DEFAULT NULL,'
      '  `norek` varchar(255) DEFAULT NULL,'
      '  `namarekening` varchar(255) DEFAULT NULL,'
      '  `asedc` char(1) NOT NULL DEFAULT '#39'N'#39','
      '  `aktif` char(1) NOT NULL DEFAULT '#39'Y'#39','
      '  `lastuseredit` varchar(30) DEFAULT NULL,'
      
        '  `lasteditdate` datetime NOT NULL DEFAULT '#39'2020-01-01 01:01:01'#39 +
        ','
      '  `notes` varchar(255) DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM DEFAULT CHARSET=latin1;')
    ScrollBars = ssBoth
    TabOrder = 3
    Visible = False
  end
  object cxBank: TcxGrid
    Left = 4
    Top = 36
    Width = 912
    Height = 376
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbBank: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblMasterBank
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
      object gtbBankidoutlet: TcxGridDBColumn
        Caption = 'Outlet'
        DataBinding.FieldName = 'idoutlet'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodeoutlet'
        Properties.ListColumns = <
          item
            FieldName = 'namaoutlet'
          end>
        Properties.ReadOnly = True
        Visible = False
        Width = 100
      end
      object gtbBankkodebank: TcxGridDBColumn
        Caption = 'Kode Bank'
        DataBinding.FieldName = 'kodebank'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 111
      end
      object gtbBanknamabank: TcxGridDBColumn
        Caption = 'Nama Bank'
        DataBinding.FieldName = 'namabank'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 120
      end
      object gtbBanknorek: TcxGridDBColumn
        Caption = 'No. Rek'
        DataBinding.FieldName = 'norek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
      object gtbBanknamarekening: TcxGridDBColumn
        Caption = 'Nama Rekening'
        DataBinding.FieldName = 'namarekening'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object gtbBankasedc: TcxGridDBColumn
        Caption = 'EDC'
        DataBinding.FieldName = 'asedc'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 50
      end
      object gtbBankaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 50
      end
      object gtbBanklastuseredit: TcxGridDBColumn
        DataBinding.FieldName = 'lastuseredit'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbBanklasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
    end
    object cxBankLevel1: TcxGridLevel
      GridView = gtbBank
    end
  end
  object btnNew: TButton
    Left = 12
    Top = 422
    Width = 97
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 1
    OnClick = btnNewClick
  end
  object Button2: TButton
    Left = 115
    Top = 422
    Width = 97
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'Edit'
    TabOrder = 2
    OnClick = Button2Click
  end
  object tblMasterBank: TMyTable
    TableName = 'ben_master_bank'
    Connection = dmDB.dbInternal
    Active = True
    Left = 492
    Top = 40
  end
  object dsTblMasterBank: TDataSource
    DataSet = tblMasterBank
    Left = 492
    Top = 88
  end
end
