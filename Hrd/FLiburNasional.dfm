object frmLiburNasional: TfrmLiburNasional
  Left = 0
  Top = 0
  Caption = ' MASTER LIBUR NASIONAL'
  ClientHeight = 389
  ClientWidth = 612
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
    612
    389)
  PixelsPerInch = 96
  TextHeight = 13
  object cxBank: TcxGrid
    Left = 4
    Top = 8
    Width = 600
    Height = 361
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbBank: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblListLibur
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.Visible = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbBankautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
      end
      object gtbBanktanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 125
      end
      object gtbBankketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 300
      end
      object gtbBanklastedituser: TcxGridDBColumn
        DataBinding.FieldName = 'lastedituser'
        Visible = False
      end
      object gtbBanklasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
        Visible = False
      end
    end
    object cxBankLevel1: TcxGridLevel
      GridView = gtbBank
    end
  end
  object tblListLibur: TMyTable
    TableName = 'ben_libur_nasional'
    Connection = dmDB.dbInternal
    Left = 492
    Top = 40
  end
  object dsTblListLibur: TDataSource
    DataSet = tblListLibur
    Left = 492
    Top = 88
  end
end
