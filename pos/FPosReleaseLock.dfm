object frmPosReleaseLock: TfrmPosReleaseLock
  Left = 0
  Top = 0
  Caption = '  PoS Release Lock'
  ClientHeight = 449
  ClientWidth = 866
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
    866
    449)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 854
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  PoS Release Lock'
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
    Left = 4
    Top = 52
    Width = 854
    Height = 343
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryLock
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbListtrans_id: TcxGridDBColumn
        Caption = 'Kode Trans'
        DataBinding.FieldName = 'trans_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
      object gtbListnama_customer: TcxGridDBColumn
        Caption = 'Nama Customer'
        DataBinding.FieldName = 'nama_customer'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object gtbListroom_id: TcxGridDBColumn
        Caption = 'Ruangan'
        DataBinding.FieldName = 'room_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListtherapist_id: TcxGridDBColumn
        Caption = 'TR ID'
        DataBinding.FieldName = 'therapist_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListcabang: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'cabang'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnRefreshData: TcxButton
    Left = 8
    Top = 401
    Width = 113
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = 'Load Data'
    TabOrder = 1
    OnClick = btnRefreshDataClick
  end
  object edSekarang: TcxDateEdit
    Left = 4
    Top = 28
    Properties.ReadOnly = True
    Properties.ShowTime = False
    TabOrder = 2
    Visible = False
    Width = 121
  end
  object btnRelase: TcxButton
    Left = 127
    Top = 401
    Width = 113
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = 'Release'
    TabOrder = 3
    OnClick = btnRelaseClick
  end
  object qryLock: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select trans_id, nama_customer, room_id, therapist_id, cabang fr' +
        'om trans_master '
      'where trans_id = '#39'X'#39)
    Active = True
    Left = 828
    Top = 40
  end
  object dsQryLock: TDataSource
    DataSet = qryLock
    Left = 828
    Top = 104
  end
end
