object frmPeriodeUM: TfrmPeriodeUM
  Left = 0
  Top = 0
  ClientHeight = 489
  ClientWidth = 705
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    705
    489)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulForm: TLabel
    Left = 0
    Top = 0
    Width = 704
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  PERIODE UM'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 821
  end
  object Label1: TLabel
    Left = 8
    Top = 44
    Width = 97
    Height = 16
    Caption = 'Periode Payroll'
  end
  object Label2: TLabel
    Left = 8
    Top = 84
    Width = 34
    Height = 16
    Caption = 'Start'
  end
  object Label3: TLabel
    Left = 252
    Top = 84
    Width = 31
    Height = 16
    Caption = ' s/d '
  end
  object Label4: TLabel
    Left = 8
    Top = 119
    Width = 53
    Height = 16
    Caption = 'Variable'
  end
  object memStruktur: TMemo
    Left = 476
    Top = 41
    Width = 520
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `ben_payroll_tgl_um3` ('
      '  `autonum` bigint(20) NOT NULL AUTO_INCREMENT,'
      '  `payrollperiode` varchar(255) DEFAULT NULL,'
      '  `tanggal` date DEFAULT NULL,'
      '  `vuangmakan` double DEFAULT NULL,'
      '  `notes` varchar(255) DEFAULT NULL,'
      '  `lastedituser` varchar(30) DEFAULT NULL,'
      '  `lasteditdate` datetime DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM DEFAULT CHARSET=latin1;')
    TabOrder = 0
    Visible = False
  end
  object edPeriode: TComboBox
    Left = 140
    Top = 41
    Width = 197
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 1
    OnChange = edPeriodeChange
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 152
    Width = 685
    Height = 289
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbListautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbListpayrollperiode: TcxGridDBColumn
        Caption = 'Periode'
        DataBinding.FieldName = 'payrollperiode'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 125
      end
      object gtbListtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbListvuangmakan: TcxGridDBColumn
        Caption = 'Variable'
        DataBinding.FieldName = 'vuangmakan'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 100
      end
      object gtbListnotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        Visible = False
        Width = 100
      end
      object gtbListlastedituser: TcxGridDBColumn
        Caption = 'Last User'
        DataBinding.FieldName = 'lastedituser'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 125
      end
      object gtbListlasteditdate: TcxGridDBColumn
        Caption = 'Last Edit'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 200
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object edStart: TcxDateEdit
    Left = 80
    Top = 81
    EditValue = 0d
    TabOrder = 3
    Width = 153
  end
  object edEnd: TcxDateEdit
    Left = 312
    Top = 81
    EditValue = 0d
    TabOrder = 4
    Width = 153
  end
  object edVariable: TcxCalcEdit
    Left = 80
    Top = 116
    EditValue = 1.000000000000000000
    TabOrder = 5
    Width = 73
  end
  object btnAdd: TButton
    Left = 224
    Top = 111
    Width = 97
    Height = 35
    Caption = 'Add'
    TabOrder = 6
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 8
    Top = 447
    Width = 125
    Height = 34
    Anchors = [akLeft, akBottom]
    Caption = 'Delete Selected'
    TabOrder = 7
    OnClick = btnDeleteClick
  end
  object qryList: TMyQuery
    Connection = DMDB.StoreDB
    SQL.Strings = (
      'select * from ben_payroll_tgl_um3 where payrollperiode = '#39'X'#39)
    Left = 348
    Top = 36
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 424
    Top = 40
  end
end
