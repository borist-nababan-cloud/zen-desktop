object frmPosTransMain: TfrmPosTransMain
  Left = 0
  Top = 0
  Anchors = [akTop, akRight]
  Caption = '  PoS Main Transaction'
  ClientHeight = 563
  ClientWidth = 1143
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
    1143
    563)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulAtas: TLabel
    Left = 8
    Top = 4
    Width = 1127
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Pos Main Transaction'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1085
  end
  object Label14: TLabel
    Left = 489
    Top = 39
    Width = 57
    Height = 16
    Caption = 'HK Printer'
  end
  object memStruktur: TMemo
    Left = 502
    Top = 444
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `trans_detail_void` ('
      '  `autonum` bigint(20) NOT NULL AUTO_INCREMENT,'
      '  `id_trans` varchar(30) DEFAULT NULL,'
      '  `tanggal` date NOT NULL DEFAULT '#39'2000-01-01'#39','
      '  `trans_type_id` varchar(50) NOT NULL DEFAULT '#39'(NONE)'#39','
      '  `produk_jasa_id` varchar(50) NOT NULL DEFAULT '#39'(NONE)'#39','
      '  `produk_jasa_nama` varchar(255) NOT NULL DEFAULT '#39'(NONE)'#39','
      '  `start_time` time NOT NULL DEFAULT '#39'00:00:00'#39','
      '  `end_time` time NOT NULL DEFAULT '#39'00:00:00'#39','
      '  `harga` float NOT NULL DEFAULT 0,'
      '  `disc_amount` float NOT NULL DEFAULT 0,'
      '  `disc_percent` float NOT NULL DEFAULT 0,'
      '  `subtotal` float NOT NULL DEFAULT 0,'
      '  `teraphist_id` varchar(50) NOT NULL DEFAULT '#39'(NONE)'#39','
      '  `room_id` varchar(50) NOT NULL DEFAULT '#39'(NONE)'#39','
      '  `quantity` float NOT NULL DEFAULT 0,'
      '  `aroma` varchar(255) NOT NULL DEFAULT '#39'(NONE)'#39','
      '  `lama` int(11) NOT NULL DEFAULT 0,'
      '  `id_customer` varchar(255) DEFAULT NULL,'
      '  `nama_customer` varchar(255) DEFAULT NULL,'
      '  `paket` varchar(255) DEFAULT NULL,'
      '  `payment_id` varchar(255) NOT NULL DEFAULT '#39'(NONE)'#39','
      '  `taked` char(1) NOT NULL DEFAULT '#39'N'#39','
      '  `cabang` varchar(50) NOT NULL DEFAULT '#39'SUKAJADI'#39','
      '  PRIMARY KEY (`autonum`),'
      '  KEY `idx_id` (`id_trans`)'
      ') ENGINE=MyISAM DEFAULT CHARSET=latin1;')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 9
    Visible = False
  end
  object pnlControl: TPanel
    Left = 8
    Top = 503
    Width = 1127
    Height = 53
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    DesignSize = (
      1127
      53)
    object dxBevel1: TdxBevel
      Left = 660
      Top = 1
      Width = 13
      Height = 53
    end
    object btnNew: TcxButton
      Left = 8
      Top = 5
      Width = 85
      Height = 40
      Anchors = [akLeft, akBottom]
      Caption = 'New Trans'
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnJasa: TcxButton
      Left = 685
      Top = 7
      Width = 80
      Height = 40
      Anchors = [akLeft, akBottom]
      Caption = 'Jasa'
      TabOrder = 1
      OnClick = btnJasaClick
    end
    object btnAdditional: TcxButton
      Left = 769
      Top = 7
      Width = 80
      Height = 40
      Anchors = [akLeft, akBottom]
      Caption = 'Additional'
      TabOrder = 2
      OnClick = btnAdditionalClick
    end
    object btnProduk: TcxButton
      Left = 855
      Top = 7
      Width = 80
      Height = 40
      Anchors = [akLeft, akBottom]
      Caption = 'Produk'
      TabOrder = 3
      OnClick = btnProdukClick
    end
    object btnGC: TcxButton
      Left = 941
      Top = 7
      Width = 80
      Height = 40
      Anchors = [akLeft, akBottom]
      Caption = 'GC'
      TabOrder = 4
      OnClick = btnGCClick
    end
    object cxButton1: TcxButton
      Left = 1027
      Top = 7
      Width = 80
      Height = 40
      Anchors = [akLeft, akBottom]
      Caption = 'Void'
      TabOrder = 5
      OnClick = cxButton1Click
    end
    object btnCetakSO: TcxButton
      Left = 107
      Top = 5
      Width = 86
      Height = 40
      Anchors = [akLeft, akBottom]
      Caption = 'Cetak SO'
      TabOrder = 6
      OnClick = btnCetakSOClick
    end
    object cxButton2: TcxButton
      Left = 564
      Top = 5
      Width = 86
      Height = 40
      Anchors = [akLeft, akBottom]
      Caption = 'Cust Name'
      TabOrder = 7
      OnClick = cxButton2Click
    end
    object btnChangeRoom: TcxButton
      Left = 464
      Top = 5
      Width = 94
      Height = 40
      Anchors = [akLeft, akBottom]
      Caption = 'Room Change'
      TabOrder = 8
      OnClick = btnChangeRoomClick
    end
    object cxButton3: TcxButton
      Left = 371
      Top = 5
      Width = 86
      Height = 40
      Anchors = [akLeft, akBottom]
      Caption = 'Details'
      TabOrder = 9
      OnClick = cxButton3Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 82
    Width = 665
    Height = 367
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    object gtbMaster: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryMaster
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtbMasternama_customer
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbMastertrans_id: TcxGridDBColumn
        DataBinding.FieldName = 'trans_id'
        Visible = False
        Width = 100
      end
      object gtbMasternama_customer: TcxGridDBColumn
        Caption = 'Customer Name'
        DataBinding.FieldName = 'nama_customer'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object gtbMastergender: TcxGridDBColumn
        Caption = 'Sex'
        DataBinding.FieldName = 'gender'
        Width = 50
      end
      object gtbMasterroom_id: TcxGridDBColumn
        Caption = 'Room'
        DataBinding.FieldName = 'room_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbMastertherapist_id: TcxGridDBColumn
        Caption = 'TR ID'
        DataBinding.FieldName = 'therapist_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbMasterstart_time: TcxGridDBColumn
        Caption = 'Start'
        DataBinding.FieldName = 'start_time'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbMasterend_time: TcxGridDBColumn
        Caption = 'End'
        DataBinding.FieldName = 'end_time'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbMasternotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        Visible = False
        Width = 100
      end
      object gtbMastercabang: TcxGridDBColumn
        Caption = 'Last Edit'
        DataBinding.FieldName = 'cabang'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbMaster
    end
  end
  object cxGrid2: TcxGrid
    Left = 693
    Top = 82
    Width = 442
    Height = 415
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object tbDetails: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryDetails
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          Column = tbDetailssubtotal
        end
        item
          Kind = skSum
          Column = tbDetailslama
        end
        item
          Kind = skCount
          Column = tbDetailstrans_type_id
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object tbDetailsautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object tbDetailsid_trans: TcxGridDBColumn
        DataBinding.FieldName = 'id_trans'
        Visible = False
        Width = 100
      end
      object tbDetailsproduk_jasa_id: TcxGridDBColumn
        Caption = 'Kode Menu'
        DataBinding.FieldName = 'produk_jasa_id'
        Visible = False
        Width = 100
      end
      object tbDetailstrans_type_id: TcxGridDBColumn
        Caption = 'Menu'
        DataBinding.FieldName = 'trans_type_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        OnGetDataText = tbDetailstrans_type_idGetDataText
        GroupIndex = 0
        Width = 75
      end
      object tbDetailsproduk_jasa_nama: TcxGridDBColumn
        Caption = 'Nama Menu'
        DataBinding.FieldName = 'produk_jasa_nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object tbDetailsdisc_percent: TcxGridDBColumn
        Caption = 'Disc'
        DataBinding.FieldName = 'disc_percent'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object tbDetailssubtotal: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object tbDetailslama: TcxGridDBColumn
        Caption = 'Waktu'
        DataBinding.FieldName = 'lama'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object tbDetailscabang: TcxGridDBColumn
        Caption = 'Edit By'
        DataBinding.FieldName = 'cabang'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = tbDetails
    end
  end
  object lblNamaPaket: TcxLabel
    Left = 8
    Top = 32
    Caption = 'Happy Hour '
    Transparent = True
  end
  object lblActivePacket: TcxLabel
    Left = 96
    Top = 32
    Caption = 'Active Packet '
    Transparent = True
  end
  object edDateTimeServer: TcxDateEdit
    Left = 914
    Top = 36
    Anchors = [akTop, akRight]
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 221
  end
  object cxLabel2: TcxLabel
    Left = 834
    Top = 37
    Anchors = [akTop, akRight]
    Caption = 'Server Time'
    Transparent = True
  end
  object cbPrinterHK: TComboBox
    Left = 552
    Top = 36
    Width = 265
    Height = 24
    TabOrder = 4
    Text = 'select printer'
  end
  object cxDBNavigator1: TcxDBNavigator
    Left = 8
    Top = 452
    Width = 322
    Height = 45
    Buttons.ConfirmDelete = False
    Buttons.CustomButtons = <>
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Insert.Visible = False
    Buttons.Delete.Visible = False
    Buttons.Edit.Visible = False
    Buttons.Post.Visible = False
    Buttons.Cancel.Visible = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    DataSource = dsQryMaster
    Anchors = [akLeft, akBottom]
    TabOrder = 5
  end
  object cxLabel3: TcxLabel
    Left = 336
    Top = 452
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh Time'
    Transparent = True
  end
  object edRefreshCount: TcxCalcEdit
    Left = 336
    Top = 473
    Anchors = [akLeft, akBottom]
    EditValue = 10.000000000000000000
    TabOrder = 11
    Width = 89
  end
  object lblToCount: TcxLabel
    Left = 431
    Top = 474
    Anchors = [akLeft, akBottom]
    Caption = '....'
    Transparent = True
  end
  object tmrRefresh: TTimer
    Enabled = False
    OnTimer = tmrRefreshTimer
    Left = 708
    Top = 36
  end
  object qryMaster: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select trans_id, start_time, end_time, nama_customer, room_id, '
      'therapist_id, notes, cabang, gender from trans_master '
      'where tanggal = CURRENT_DATE and promo <> '#39'F'#39
      'order by trans_id DESC')
    Left = 388
    Top = 36
  end
  object dsQryMaster: TMyDataSource
    DataSet = qryMaster
    Left = 448
    Top = 36
  end
  object qryDetails: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select autonum, id_trans, produk_jasa_id, produk_jasa_nama, disc' +
        '_percent,'
      'subtotal, lama, cabang, trans_type_id from trans_detail')
    RefreshOptions = [roAfterInsert, roAfterUpdate, roBeforeEdit]
    Options.AutoRefresh = True
    MasterSource = dsQryMaster
    MasterFields = 'trans_id'
    DetailFields = 'id_trans'
    Left = 268
    Top = 36
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'trans_id'
        Value = nil
      end>
  end
  object dsQryDetails: TMyDataSource
    DataSet = qryDetails
    Left = 328
    Top = 36
  end
end
