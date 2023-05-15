object frmMasterReportVariable: TfrmMasterReportVariable
  Left = 0
  Top = 0
  Caption = '  Master Variable Report'
  ClientHeight = 664
  ClientWidth = 1120
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1120
    664)
  PixelsPerInch = 96
  TextHeight = 14
  object lblJudulAtas: TLabel
    Left = 8
    Top = 4
    Width = 1104
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Master Variable Report'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 930
  end
  object strukturPromo: TMemo
    Left = 927
    Top = 567
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `ben_report_variable` ('
      '  `autonum` int(3) NOT NULL AUTO_INCREMENT,'
      '  `kodevariable` varchar(50) DEFAULT NULL,'
      '  `groupvariable` varchar(255) DEFAULT NULL,'
      '  `namavariable` varchar(255) DEFAULT NULL,'
      '  `aktif` char(1) DEFAULT '#39'Y'#39','
      '  `lastedituser` varchar(30) DEFAULT NULL,'
      
        '  `lasteditdate` datetime NOT NULL DEFAULT '#39'2019-01-01 01:00:00'#39 +
        ','
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM DEFAULT CHARSET=latin1;')
    ScrollBars = ssBoth
    TabOrder = 0
    Visible = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 48
    Width = 705
    Height = 545
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object gtbVariable: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblVariable
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbVariableautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbVariablekodevariable: TcxGridDBColumn
        Caption = 'Code'
        DataBinding.FieldName = 'kodevariable'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbVariablegroupvariable: TcxGridDBColumn
        Caption = 'Group'
        DataBinding.FieldName = 'groupvariable'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        GroupIndex = 0
        Width = 200
      end
      object gtbVariablenamavariable: TcxGridDBColumn
        Caption = 'Variabe Name'
        DataBinding.FieldName = 'namavariable'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 300
      end
      object gtbVariableaktif: TcxGridDBColumn
        Caption = 'Active'
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 100
      end
      object gtbVariablelastedituser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'lastedituser'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbVariablelasteditdate: TcxGridDBColumn
        Caption = 'Date Edit'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbVariable
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 740
    Top = 48
    Anchors = [akTop, akRight, akBottom]
    Caption = 'New / Edit Data'
    TabOrder = 2
    Height = 545
    Width = 372
    object Label1: TLabel
      Left = 12
      Top = 24
      Width = 74
      Height = 14
      Caption = 'Code Variable'
    end
    object Label2: TLabel
      Left = 12
      Top = 52
      Width = 33
      Height = 14
      Caption = 'Group'
    end
    object Label3: TLabel
      Left = 12
      Top = 80
      Width = 77
      Height = 14
      Caption = 'Variable Name'
    end
    object edKode: TEdit
      Left = 104
      Top = 21
      Width = 229
      Height = 22
      ReadOnly = True
      TabOrder = 0
    end
    object edGroup: TEdit
      Left = 104
      Top = 49
      Width = 229
      Height = 22
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edNama: TEdit
      Left = 104
      Top = 77
      Width = 229
      Height = 22
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object ckAktiif: TcxCheckBox
      Left = 12
      Top = 116
      Caption = 'Aktif'
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      TabOrder = 3
      Transparent = True
    end
    object btnSave: TcxButton
      Left = 64
      Top = 156
      Width = 83
      Height = 49
      Caption = 'Save'
      TabOrder = 4
      OnClick = btnSaveClick
    end
    object btnClear: TcxButton
      Left = 184
      Top = 156
      Width = 83
      Height = 49
      Caption = 'Clear'
      TabOrder = 5
      OnClick = btnClearClick
    end
  end
  object cxButton2: TcxButton
    Left = 8
    Top = 599
    Width = 113
    Height = 49
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 127
    Top = 599
    Width = 113
    Height = 49
    Anchors = [akLeft, akBottom]
    Caption = 'Edit'
    TabOrder = 4
    OnClick = cxButton3Click
  end
  object tblVariable: TMyTable
    TableName = 'ben_report_variable'
    Connection = dmDB.dbInternal
    Left = 552
    Top = 288
  end
  object dsTblVariable: TMyDataSource
    DataSet = tblVariable
    Left = 556
    Top = 336
  end
end
