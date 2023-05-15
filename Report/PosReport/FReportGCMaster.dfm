object frmReportGCMaster: TfrmReportGCMaster
  Left = 0
  Top = 0
  Caption = '   Report GC Master'
  ClientHeight = 565
  ClientWidth = 1164
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
    1164
    565)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 1156
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '   Report GC Master'
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
    Left = 8
    Top = 32
    Width = 1148
    Height = 453
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbMaster: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryMaster
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbMasterpaket_number
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbMasterharga_jual
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      object gtbMasterpaket_number: TcxGridDBColumn
        DataBinding.FieldName = 'paket_number'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 300
      end
      object gtbMastertanggal: TcxGridDBColumn
        DataBinding.FieldName = 'tanggal'
        Visible = False
        Width = 100
      end
      object gtbMasterexpired_date: TcxGridDBColumn
        DataBinding.FieldName = 'expired_date'
        Visible = False
        Width = 100
      end
      object gtbMasterharga_jual: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga_jual'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 156
      end
      object gtbMastertotal_items: TcxGridDBColumn
        DataBinding.FieldName = 'total_items'
        Visible = False
        Width = 100
      end
      object gtbMasteraktif: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'aktif'
        Width = 109
      end
      object gtbMasterterjual: TcxGridDBColumn
        Caption = 'Sold'
        DataBinding.FieldName = 'terjual'
        Width = 129
      end
      object gtbMasternotes: TcxGridDBColumn
        Caption = 'Edit Date Time'
        DataBinding.FieldName = 'notes'
        Width = 250
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbMaster
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 500
    Width = 1148
    Height = 57
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    object btnViewDelete: TcxButton
      Left = 8
      Top = 8
      Width = 133
      Height = 37
      Caption = 'View Deleted Packet'
      TabOrder = 0
      OnClick = btnViewDeleteClick
    end
    object btnViewActive: TcxButton
      Left = 156
      Top = 8
      Width = 133
      Height = 37
      Caption = 'View Active Packet'
      TabOrder = 1
      OnClick = btnViewActiveClick
    end
    object btnViewNonActive: TcxButton
      Left = 300
      Top = 8
      Width = 145
      Height = 37
      Caption = 'View Non-Active Packet'
      TabOrder = 2
      OnClick = btnViewNonActiveClick
    end
  end
  object qryMaster: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from gc_master where aktif <> '#39'D'#39' AND terjual = '#39'N'#39)
    Active = True
    Left = 1104
    Top = 36
  end
  object dsQryMaster: TMyDataSource
    DataSet = qryMaster
    Left = 1104
    Top = 88
  end
end
