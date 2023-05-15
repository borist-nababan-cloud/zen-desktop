object frmPosMainMenu: TfrmPosMainMenu
  Left = 0
  Top = 0
  Caption = '  Main Menu PoS '
  ClientHeight = 474
  ClientWidth = 1007
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
    1007
    474)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 4
    Width = 991
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  List Main Menu PoS'
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
  object memStruktur: TMemo
    Left = 814
    Top = 385
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `main_menu` ('
      '  `menu_id` varchar(50) NOT NULL DEFAULT '#39'(NONE)'#39','
      '  `type_menu` char(2) DEFAULT '#39'BJ'#39','
      '  `jenis_jasa_id` char(2) NOT NULL DEFAULT '#39'NN'#39','
      '  `nama_menu` varchar(100) NOT NULL DEFAULT '#39'(NONE)'#39','
      '  `harga` double NOT NULL DEFAULT 0,'
      '  `lama` int(3) NOT NULL DEFAULT 0,'
      '  `disc_hh` double NOT NULL DEFAULT 0,'
      '  `disc_normal` double DEFAULT NULL,'
      '  `harga_hh` double NOT NULL DEFAULT 0,'
      '  `harga_normal` double NOT NULL DEFAULT 0,'
      '  `notes` text DEFAULT NULL,'
      '  `aktif` varchar(255) NOT NULL DEFAULT '#39'Y'#39','
      '  `lastuser` varchar(255) DEFAULT NULL,'
      
        '  `lasteditdate` datetime NOT NULL DEFAULT '#39'2019-01-01 01:01:01'#39 +
        ','
      '  PRIMARY KEY (`menu_id`),'
      '  KEY `Jenis_Jasa_ID` (`jenis_jasa_id`)'
      ') ENGINE=MyISAM DEFAULT CHARSET=latin1;')
    ScrollBars = ssBoth
    TabOrder = 2
    Visible = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 36
    Width = 991
    Height = 387
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbListnama_menu: TcxGridDBColumn
        Caption = 'Nama Menu'
        DataBinding.FieldName = 'nama_menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object gtbListtype_menu: TcxGridDBColumn
        Caption = 'Type Menu'
        DataBinding.FieldName = 'type_menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListjenis_jasa_id: TcxGridDBColumn
        Caption = 'Jenis Menu'
        DataBinding.FieldName = 'jenis_jasa_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListharga: TcxGridDBColumn
        Caption = 'Harga Menu'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListlama: TcxGridDBColumn
        Caption = 'Waktu'
        DataBinding.FieldName = 'lama'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListdisc_hh: TcxGridDBColumn
        Caption = 'Disc HH'
        DataBinding.FieldName = 'disc_hh'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListdisc_normal: TcxGridDBColumn
        Caption = 'Disc Normal'
        DataBinding.FieldName = 'disc_normal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListharga_hh: TcxGridDBColumn
        Caption = 'Harga HH'
        DataBinding.FieldName = 'harga_hh'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListharga_normal: TcxGridDBColumn
        Caption = 'Harga Normal'
        DataBinding.FieldName = 'harga_normal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListnotes: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 100
      end
      object gtbListaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 100
      end
      object gtbListmenu_id: TcxGridDBColumn
        Caption = 'Kode Menu'
        DataBinding.FieldName = 'menu_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListlastuser: TcxGridDBColumn
        Caption = 'User Edit'
        DataBinding.FieldName = 'lastuser'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        Caption = 'Date Edit'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListColumn1: TcxGridDBColumn
        Caption = 'Type Menu'
        DataBinding.FieldName = 'type_menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        GroupIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnNew: TcxButton
    Left = 124
    Top = 429
    Width = 93
    Height = 37
    Anchors = [akLeft, akBottom]
    Caption = 'New Menu'
    TabOrder = 1
    OnClick = btnNewClick
  end
  object cxButton1: TcxButton
    Left = 898
    Top = 429
    Width = 93
    Height = 37
    Anchors = [akRight, akBottom]
    Caption = 'Import'
    DropDownMenu = pmImport
    Kind = cxbkOfficeDropDown
    TabOrder = 3
  end
  object cxButton2: TcxButton
    Left = 236
    Top = 429
    Width = 93
    Height = 37
    Anchors = [akLeft, akBottom]
    Caption = 'Edit Selected'
    TabOrder = 4
    OnClick = cxButton2Click
  end
  object btnRefresh: TcxButton
    Left = 8
    Top = 429
    Width = 93
    Height = 37
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh'
    OptionsImage.Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000330000002F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000033008B49FF008246F1000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000033008743FFA1E2D5FF239A60FF000000330000
      0033000000330000003300000022000000000000000000000000000000000000
      00000000000000000033008743FF93DCC9FF1ACAADFF00B68EFF009658FF0097
      5BFF008B4AFF008945FF005B30B9000000330000000000000000000000000000
      000000000000008A48FF81DBC2FF14CEA9FF00C499FF57DBC1FF56DCC3FF56DD
      C4FF56DEC5FF56DCC4FF44C19AFF008B4AFF0000003300000000000000000000
      000000000000008A48FF6FD7B8FF12D5A9FF00CD9BFF00CE9DFF00D1A0FF00D2
      A1FF00D1A0FF00D1A0FF1DD8AEFF2FCCA3FF018A49FF0000001E000000000000
      00000000000000000000008744FF5FD1ACFF11DDAAFF00CA90FF008B49FF0087
      45FF009C5EFF00A568FF00C48AFF04DDA8FF16BA83FF01532DAA000000000000
      0033000000330000001A00000000008846FF4ED3A9FF129155FF000000000000
      002D00000033004B2889008043F000B578FF00D89FFF008B4BFF00000000008D
      4DFF008B4BFF004626990000002C0000001400592FA2008D4CFF00000000007B
      42E5008C4AFF0000003300000000005C31A8008B4BFF008D4DFF00000000008B
      4BFF00D89FFF00B578FF00773EE400361D820000003300000033000000331191
      54FF53D4AAFF008846FF00000033000000000000000000000000000000000252
      2D951ABA86FF07DBA8FF00BE85FF00A061FF009C5DFF008744FF008A49FF00C9
      90FF12DCAAFF63D3AFFF008744FF000000330000000000000000000000000000
      0000008A49FF35D0AAFF20D7B1FF0DD3A7FF0DD4A7FF0DD4A8FF0DD3A7FF0ED1
      A4FF00CA9AFF13D3A9FF73D7BBFF008A48FF0000000000000000000000000000
      000000000000018B49FF48C29CFF5CDCC6FF5BDEC8FF5ADEC7FF5BDDC6FF5CDB
      C3FF00C399FF15CCAAFF85DBC3FF008A48FF0000000000000000000000000000
      00000000000000000000005B2FA8008946FF008844FF008744FF008947FF00B5
      8EFF1BC8AEFF98DECBFF008742FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000239B
      61FFA1E2D5FF008743FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000082
      46ED008B49FF0000000000000000000000000000000000000000}
    TabOrder = 5
    OnClick = btnRefreshClick
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from main_menu where aktif = '#39'Y'#39' ORDER BY menu_id DESC')
    Left = 20
    Top = 112
  end
  object dsQryList: TMyDataSource
    DataSet = qryList
    Left = 20
    Top = 180
  end
  object pmImport: TAdvPopupMenu
    Version = '2.6.2.1'
    Left = 912
    Top = 304
    object Jasa1: TMenuItem
      Caption = 'Jasa'
      OnClick = Jasa1Click
    end
    object Produk1: TMenuItem
      Caption = 'Produk'
      OnClick = Produk1Click
    end
    object Additional1: TMenuItem
      Caption = 'Additional'
      OnClick = Additional1Click
    end
  end
end
