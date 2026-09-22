object frmTHRCutOff: TfrmTHRCutOff
  Left = 0
  Top = 0
  Caption = 'Cut Off Periode THR'
  ClientHeight = 350
  ClientWidth = 615
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
    615
    350)
  PixelsPerInch = 96
  TextHeight = 13
  object lblJudulForm: TLabel
    Left = 0
    Top = 0
    Width = 613
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Create THR Cut Off Periode'
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
  object Label1: TLabel
    Left = 12
    Top = 46
    Width = 133
    Height = 19
    Caption = 'Set Cut Off Date'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblKode: TLabel
    Left = 459
    Top = 44
    Width = 61
    Height = 19
    Caption = 'lblKode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object memStruktur: TMemo
    Left = 170
    Top = 248
    Width = 423
    Height = 92
    Lines.Strings = (
      'CREATE TABLE `ben_thr_periode` ('
      '  `autonum` int(2) NOT NULL AUTO_INCREMENT,'
      '  `kodethr` varchar(30) NOT NULL DEFAULT '#39#39','
      '  `tanggal` date NOT NULL DEFAULT '#39'0000-00-00'#39','
      '  `aktif` char(1) NOT NULL DEFAULT '#39'Y'#39','
      '  `lastedituser` varchar(30) DEFAULT NULL,'
      '  `lasteditdate` datetime DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;')
    TabOrder = 0
    Visible = False
  end
  object edTanggal: TcxDateEdit
    Left = 156
    Top = 43
    EditValue = 0d
    ParentFont = False
    Properties.OnChange = edTanggalPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 193
  end
  object cxButton1: TcxButton
    Left = 364
    Top = 36
    Width = 89
    Height = 41
    Caption = 'Create'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 92
    Width = 585
    Height = 209
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbListautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbListkodethr: TcxGridDBColumn
        Caption = 'Kode THR'
        DataBinding.FieldName = 'kodethr'
        Width = 100
      end
      object gtbListtanggal: TcxGridDBColumn
        Caption = 'Tgl Cut Off'
        DataBinding.FieldName = 'tanggal'
        Width = 100
      end
      object gtbListaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        Width = 100
      end
      object gtbListlastedituser: TcxGridDBColumn
        Caption = 'Last User'
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        Caption = 'Edited Date'
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnSetInaktif: TcxButton
    Left = 12
    Top = 307
    Width = 101
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = 'Set In-Active'
    TabOrder = 4
    OnClick = btnSetInaktifClick
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from ben_thr_periode where aktif = '#39'Y'#39)
    Left = 560
    Top = 40
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 560
    Top = 92
  end
end
