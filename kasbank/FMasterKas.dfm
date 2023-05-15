object frmMasterKas: TfrmMasterKas
  Left = 0
  Top = 0
  Caption = 'frmMasterKas'
  ClientHeight = 365
  ClientWidth = 735
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
    735
    365)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 2
    Top = 0
    Width = 727
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  MASTER KAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 656
  end
  object cxGrid1: TcxGrid
    Left = 2
    Top = 32
    Width = 725
    Height = 277
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbKas: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblMasterKas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbKasautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbKasidoutlet: TcxGridDBColumn
        Caption = 'Outlet'
        DataBinding.FieldName = 'idoutlet'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodeoutlet'
        Properties.ListColumns = <
          item
            FieldName = 'namaoutlet'
          end>
        Properties.ListSource = dsTblOutlet
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKaskodekas: TcxGridDBColumn
        Caption = 'Kode Kas'
        DataBinding.FieldName = 'kodekas'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKasnamakas: TcxGridDBColumn
        Caption = 'Nama Kas'
        DataBinding.FieldName = 'namakas'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKaslastuseredit: TcxGridDBColumn
        Caption = 'Last User Edit'
        DataBinding.FieldName = 'lastuseredit'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKaslasteditdate: TcxGridDBColumn
        Caption = 'Last Edit Date'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKasnotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbKas
    end
  end
  object btnNew: TButton
    Left = 8
    Top = 315
    Width = 97
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 1
    OnClick = btnNewClick
  end
  object Button2: TButton
    Left = 111
    Top = 315
    Width = 97
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'Edit'
    TabOrder = 2
  end
  object tblMasterKas: TMyTable
    TableName = 'ben_master_kas'
    Connection = DMDB.StoreDB
    Left = 596
    Top = 36
  end
  object dsTblMasterKas: TDataSource
    DataSet = tblMasterKas
    Left = 596
    Top = 84
  end
  object tblOtlet: TMyTable
    TableName = 'ben_outlet'
    Connection = DMDB.StoreDB
    Left = 696
    Top = 40
  end
  object dsTblOutlet: TDataSource
    DataSet = tblOtlet
    Left = 696
    Top = 88
  end
end
