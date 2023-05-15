object frmMasterKategori: TfrmMasterKategori
  Left = 0
  Top = 0
  Caption = 'MASTER KATEGORI BARANG'
  ClientHeight = 523
  ClientWidth = 842
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
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
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 262
    Height = 19
    Caption = '  MASTER KATEGORI BARANG   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 16
    Top = 40
    Width = 805
    Height = 413
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbKategori: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblKategori
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
      object gtbKategoriid_kategori: TcxGridDBColumn
        Caption = 'ID KATEGORI'
        DataBinding.FieldName = 'id_kategori'
        Visible = False
        Width = 100
      end
      object gtbKategorinama_kategori: TcxGridDBColumn
        Caption = 'NAMA KATEGORI'
        DataBinding.FieldName = 'nama_kategori'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 250
      end
      object gtbKategoriblok: TcxGridDBColumn
        Caption = 'BLOK'
        DataBinding.FieldName = 'blok'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbKategori
    end
  end
  object cxDBNavigator1: TcxDBNavigator
    Left = 16
    Top = 459
    Width = 416
    Height = 56
    Buttons.CustomButtons = <>
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Delete.Visible = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    DataSource = dsTblKategori
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object tblKategori: TMyTable
    TableName = 'tbl_kategori'
    Connection = dmDB.dbInternal
    Left = 416
    Top = 268
  end
  object dsTblKategori: TDataSource
    DataSet = tblKategori
    Left = 412
    Top = 340
  end
end
