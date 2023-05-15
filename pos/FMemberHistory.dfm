object frmMemberHistory: TfrmMemberHistory
  Left = 0
  Top = 0
  Caption = '  History Member'
  ClientHeight = 472
  ClientWidth = 1061
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1061
    472)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 2
    Width = 1049
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  History Member'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 623
  end
  object lblCheck: TLabel
    Left = 8
    Top = 112
    Width = 16
    Height = 16
    Caption = '    '
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object btnKonek: TcxButton
    Left = 8
    Top = 34
    Width = 122
    Height = 67
    Caption = 'Connect Server'
    TabOrder = 0
    OnClick = btnKonekClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 136
    Width = 1045
    Height = 312
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbListtanggal: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListwaktu: TcxGridDBColumn
        Caption = 'Time'
        DataBinding.FieldName = 'waktu'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListid_member: TcxGridDBColumn
        Caption = 'ID Member'
        DataBinding.FieldName = 'id_member'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 100
      end
      object gtbListpoint_a: TcxGridDBColumn
        Caption = 'Saldo Awal'
        DataBinding.FieldName = 'point_a'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.0'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListpoint_t: TcxGridDBColumn
        Caption = 'Debet'
        DataBinding.FieldName = 'point_t'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.0'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListpoint_k: TcxGridDBColumn
        Caption = 'Kredit'
        DataBinding.FieldName = 'point_k'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.0'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListpoint_end: TcxGridDBColumn
        Caption = 'End Saldo'
        DataBinding.FieldName = 'point_end'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#.0'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListid_outlet: TcxGridDBColumn
        Caption = 'Outlet'
        DataBinding.FieldName = 'id_outlet'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodeoutlet'
        Properties.ListColumns = <
          item
            FieldName = 'namaoutlet'
          end>
        Properties.ListSource = dsQryOutlet
        Properties.ReadOnly = True
        Width = 150
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object gbSearch: TcxGroupBox
    Left = 136
    Top = 34
    Caption = 'Scan Your Member Here...'
    TabOrder = 2
    DesignSize = (
      709
      57)
    Height = 67
    Width = 709
    object Label2: TLabel
      Left = 288
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Name'
    end
    object Label3: TLabel
      Left = 288
      Top = 35
      Width = 63
      Height = 13
      Caption = 'Card Number'
    end
    object lblName: TLabel
      Left = 380
      Top = 16
      Width = 12
      Height = 13
      Caption = '...'
    end
    object lblCardNumber: TLabel
      Left = 380
      Top = 35
      Width = 12
      Height = 13
      Caption = '...'
    end
    object lblPoint: TLabel
      Left = 652
      Top = 16
      Width = 18
      Height = 25
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 608
    end
    object edScan: TcxTextEdit
      Left = 12
      Top = 16
      ParentFont = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '#'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -20
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      TextHint = 'Scan Your Member Here...'
      OnKeyPress = edScanKeyPress
      Width = 257
    end
  end
  object qryOutlet: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select kodeoutlet, namaoutlet from ben_outlet')
    Left = 992
    Top = 44
  end
  object dsQryOutlet: TMyDataSource
    DataSet = qryOutlet
    Left = 992
    Top = 96
  end
  object qryTrans: TMyQuery
    Connection = dbMember
    SQL.Strings = (
      'select tanggal, waktu, id_member, point_a, '
      'point_t, point_k, point_end, id_outlet from history_trans'
      'where id_member = '#39'X'#39)
    Left = 936
    Top = 40
  end
  object dsQryTrans: TMyDataSource
    DataSet = qryTrans
    Left = 936
    Top = 92
  end
  object tmrConServer: TTimer
    OnTimer = tmrConServerTimer
    Left = 880
    Top = 48
  end
  object dbMember: TMyConnection
    Left = 872
    Top = 104
  end
end
