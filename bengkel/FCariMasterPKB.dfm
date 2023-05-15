object frmCariMasterPKB: TfrmCariMasterPKB
  Left = 0
  Top = 0
  Caption = 'FIND PKB'
  ClientHeight = 398
  ClientWidth = 654
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
    654
    398)
  PixelsPerInch = 96
  TextHeight = 16
  object cxGrid1: TcxGrid
    Left = 16
    Top = 12
    Width = 630
    Height = 332
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object gtbListautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbListpkbnumber: TcxGridDBColumn
        DataBinding.FieldName = 'pkbnumber'
        Width = 100
      end
      object gtbListnopol: TcxGridDBColumn
        DataBinding.FieldName = 'nopol'
        Width = 125
      end
      object gtbListnamacust: TcxGridDBColumn
        DataBinding.FieldName = 'namacust'
        Width = 300
      end
      object gtbListtglmasuk: TcxGridDBColumn
        DataBinding.FieldName = 'tglmasuk'
        Width = 100
      end
      object gtbListwaktumasuk: TcxGridDBColumn
        DataBinding.FieldName = 'waktumasuk'
        Width = 100
      end
      object gtbListcustcode: TcxGridDBColumn
        DataBinding.FieldName = 'custcode'
        Width = 100
      end
      object gtbListkeluhan: TcxGridDBColumn
        DataBinding.FieldName = 'keluhan'
        Width = 100
      end
      object gtbListtglselesai: TcxGridDBColumn
        DataBinding.FieldName = 'tglselesai'
        Width = 100
      end
      object gtbListwaktuselesai: TcxGridDBColumn
        DataBinding.FieldName = 'waktuselesai'
        Width = 100
      end
      object gtbListnotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        Width = 100
      end
      object gtbListstatus: TcxGridDBColumn
        DataBinding.FieldName = 'status'
        Width = 100
      end
      object gtbListisdelete: TcxGridDBColumn
        DataBinding.FieldName = 'isdelete'
        Width = 100
      end
      object gtbListlastedituser: TcxGridDBColumn
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnSelect: TcxButton
    Left = 16
    Top = 350
    Width = 125
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = 'SELECT'
    TabOrder = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnSelectClick
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select ben_bengkel_pkb.*, '
      
        '(select ben_bengkel_customer.namacust from ben_bengkel_customer ' +
        'where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) ' +
        'as namacust,'
      
        '(select ben_bengkel_customer.nopol from ben_bengkel_customer whe' +
        're ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as ' +
        'nopol'
      'from ben_bengkel_pkb where status = '#39'S'#39' and isdelete = '#39'N'#39)
    Active = True
    Left = 532
    Top = 4
  end
  object dsQryList: TMyDataSource
    DataSet = qryList
    Left = 536
    Top = 52
  end
end
