object frmGiftCertificateMaster: TfrmGiftCertificateMaster
  Left = 0
  Top = 0
  Caption = '  Packet Gift Certificate'
  ClientHeight = 597
  ClientWidth = 1169
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
    1169
    597)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulAtas: TLabel
    Left = 4
    Top = 4
    Width = 1157
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Packet Gift Certificate'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 829
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 44
    Width = 553
    Height = 477
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
        Width = 100
      end
      object gtbMastertotal_items: TcxGridDBColumn
        DataBinding.FieldName = 'total_items'
        Visible = False
        Width = 100
      end
      object gtbMasteraktif: TcxGridDBColumn
        Caption = 'Actiive'
        DataBinding.FieldName = 'aktif'
        Width = 50
      end
      object gtbMasterterjual: TcxGridDBColumn
        Caption = 'Sold'
        DataBinding.FieldName = 'terjual'
        Width = 50
      end
      object gtbMasternotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbMaster
    end
  end
  object Panel1: TPanel
    Left = 4
    Top = 532
    Width = 557
    Height = 57
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    object btnNewPacket: TcxButton
      Left = 8
      Top = 8
      Width = 94
      Height = 37
      Caption = 'New Packet'
      TabOrder = 0
      OnClick = btnNewPacketClick
    end
    object btnActivatedPacket: TcxButton
      Left = 444
      Top = 8
      Width = 102
      Height = 37
      Caption = 'Activate'
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnActivatedPacketClick
    end
    object btnEditPacket: TcxButton
      Left = 216
      Top = 8
      Width = 102
      Height = 37
      Caption = 'Edit Packet'
      TabOrder = 2
      OnClick = btnEditPacketClick
    end
    object btnrefresh: TcxButton
      Left = 336
      Top = 8
      Width = 102
      Height = 37
      Caption = 'Refresh'
      TabOrder = 3
      OnClick = btnrefreshClick
    end
    object btnRemovePacket: TcxButton
      Left = 108
      Top = 8
      Width = 102
      Height = 37
      Caption = 'Remove Packet'
      TabOrder = 4
      OnClick = btnRemovePacketClick
    end
  end
  object cxGrid2: TcxGrid
    Left = 572
    Top = 44
    Width = 589
    Height = 477
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 2
    object tbDetails: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryDetail
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skSum
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = tbDetailsharga_jual
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
      object tbDetailspaket_number: TcxGridDBColumn
        DataBinding.FieldName = 'paket_number'
        Visible = False
        Width = 100
      end
      object tbDetailsgc_number: TcxGridDBColumn
        Caption = 'No. GC'
        DataBinding.FieldName = 'gc_number'
        Width = 250
      end
      object tbDetailsnama_menu: TcxGridDBColumn
        Caption = 'Nama Menu'
        DataBinding.FieldName = 'nama_menu'
        Width = 300
      end
      object tbDetailsharga_jual: TcxGridDBColumn
        Caption = 'Harga Jual'
        DataBinding.FieldName = 'harga_jual'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = tbDetails
    end
  end
  object Panel2: TPanel
    Left = 572
    Top = 532
    Width = 589
    Height = 57
    Anchors = [akRight, akBottom]
    TabOrder = 3
    object cxButton4: TcxButton
      Left = 11
      Top = 8
      Width = 134
      Height = 37
      Caption = 'Remove From Packet'
      TabOrder = 0
      Visible = False
    end
  end
  object qryMaster: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from gc_master where aktif <> '#39'D'#39' AND terjual = '#39'N'#39)
    Left = 900
    Top = 48
  end
  object dsQryMaster: TMyDataSource
    DataSet = qryMaster
    Left = 900
    Top = 100
  end
  object qryDetail: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select paket_number, gc_number, nama_menu, harga_jual from gc_de' +
        'tail')
    MasterSource = dsQryMaster
    MasterFields = 'paket_number'
    DetailFields = 'paket_number'
    Left = 964
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'paket_number'
        ParamType = ptInput
        Value = 'GC.1.BM.20906.0269'
      end>
  end
  object dsQryDetail: TMyDataSource
    DataSet = qryDetail
    Left = 964
    Top = 100
  end
end
