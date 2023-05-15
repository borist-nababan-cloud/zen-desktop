object frmRejectGuest: TfrmRejectGuest
  Left = 0
  Top = 0
  Caption = '  PoS Rejected Guest[s]'
  ClientHeight = 527
  ClientWidth = 1053
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
    1053
    527)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 1033
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  PoS Rejected Guest[s]'
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
  object StrukturPayment: TMemo
    Left = 825
    Top = 389
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `trans_reject` ('
      '  `autonum` bigint(1) NOT NULL AUTO_INCREMENT,'
      '  `tanggal` date NOT NULL DEFAULT '#39'2020-01-01'#39','
      '  `waktu` time NOT NULL DEFAULT '#39'01:01:01'#39','
      '  `jenis_jasa` char(2) NOT NULL DEFAULT '#39'BM'#39','
      '  `keterangan` varchar(255) DEFAULT NULL,'
      '  `iscancel` char(1) NOT NULL DEFAULT '#39'N'#39','
      '  `lastuser` varchar(255) DEFAULT NULL,'
      
        '  `lasteditdate` datetime NOT NULL DEFAULT '#39'2019-01-01 01:01:01'#39 +
        ','
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;')
    ScrollBars = ssBoth
    TabOrder = 0
    Visible = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 48
    Width = 541
    Height = 389
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryReject
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object gtbListautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbListtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Visible = False
        Width = 100
      end
      object gtbListwaktu: TcxGridDBColumn
        Caption = 'Jam'
        DataBinding.FieldName = 'waktu'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListjenis_jasa: TcxGridDBColumn
        Caption = 'Jenis Jasa'
        DataBinding.FieldName = 'jenis_jasa'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListketerangan: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object gtbListiscancel: TcxGridDBColumn
        DataBinding.FieldName = 'iscancel'
        Visible = False
        Width = 100
      end
      object gtbListlastuser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'lastuser'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        Caption = 'Date Time'
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
    Left = 588
    Top = 48
    Anchors = [akTop, akRight, akBottom]
    Caption = 'New Data'
    TabOrder = 2
    Height = 430
    Width = 453
    object Label2: TLabel
      Left = 12
      Top = 23
      Width = 27
      Height = 16
      Caption = 'Jam '
    end
    object Label3: TLabel
      Left = 12
      Top = 59
      Width = 25
      Height = 16
      Caption = 'Jasa'
    end
    object Label4: TLabel
      Left = 12
      Top = 89
      Width = 65
      Height = 16
      Caption = 'Keterangan'
    end
    object Label5: TLabel
      Left = 12
      Top = 119
      Width = 77
      Height = 16
      Caption = 'Jumlah Tamu'
    end
    object edWaktu: TcxTimeEdit
      Left = 92
      Top = 20
      EditValue = 0
      TabOrder = 0
      Width = 149
    end
    object edJasa: TcxComboBox
      Left = 92
      Top = 56
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'BM'
        'RF')
      TabOrder = 1
      Text = 'BM'
      Width = 149
    end
    object edKeterangan: TcxTextEdit
      Left = 92
      Top = 86
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      Width = 341
    end
    object btnSekarang: TcxButton
      Left = 256
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Now'
      TabOrder = 3
      OnClick = btnSekarangClick
    end
    object cxButton2: TcxButton
      Left = 36
      Top = 156
      Width = 165
      Height = 53
      Caption = 'Save'
      TabOrder = 4
      OnClick = cxButton2Click
    end
    object btnReset: TcxButton
      Left = 224
      Top = 156
      Width = 105
      Height = 53
      Caption = 'Clear'
      TabOrder = 5
      OnClick = btnResetClick
    end
    object edJumlahTamu: TcxCalcEdit
      Left = 92
      Top = 116
      EditValue = 0.000000000000000000
      TabOrder = 6
      Width = 121
    end
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 456
    Width = 137
    Height = 57
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel Reject'
    TabOrder = 3
    OnClick = cxButton1Click
  end
  object btnRefresh: TcxButton
    Left = 156
    Top = 456
    Width = 137
    Height = 57
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh'
    TabOrder = 4
    OnClick = btnRefreshClick
  end
  object qryReject: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans_reject where tanggal = CURRENT_DATE'
      'and iscancel = '#39'N'#39)
    Left = 1004
    Top = 104
  end
  object dsQryReject: TMyDataSource
    DataSet = qryReject
    Left = 1008
    Top = 48
  end
end
