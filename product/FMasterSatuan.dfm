object frmMasterSatuan: TfrmMasterSatuan
  Left = 0
  Top = 0
  Caption = 'MASTER SATUAN BARANG'
  ClientHeight = 523
  ClientWidth = 842
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    842
    523)
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 16
    Top = 8
    Width = 805
    Height = 445
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbSatuan: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblSatuan
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.InfoText = 'Klik Di Sini untuk Menambah Data'
      NewItemRow.Visible = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbSatuannama_satuan: TcxGridDBColumn
        Caption = 'Nama Satuan'
        DataBinding.FieldName = 'namasatuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        SortIndex = 0
        SortOrder = soAscending
        Width = 200
      end
      object gtbSatuanid_satuan: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 150
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbSatuan
    end
  end
  object cxDBNavigator1: TcxDBNavigator
    Left = 16
    Top = 459
    Width = 335
    Height = 56
    Buttons.CustomButtons = <>
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Delete.Visible = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    DataSource = dsTblSatuan
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object tblSatuan: TMyTable
    TableName = 'ben_bengkel_satuan'
    Connection = dmDB.dbInternal
    Active = True
    Left = 416
    Top = 268
  end
  object dsTblSatuan: TDataSource
    DataSet = tblSatuan
    Left = 420
    Top = 324
  end
end
