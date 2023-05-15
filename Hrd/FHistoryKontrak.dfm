object frmHistoryKontrak: TfrmHistoryKontrak
  Left = 0
  Top = 0
  ClientHeight = 328
  ClientWidth = 726
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
    726
    328)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 725
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  History Kontrak'
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
  object lblNama: TLabel
    Left = 14
    Top = 32
    Width = 12
    Height = 13
    Caption = '....'
  end
  object lblKode: TLabel
    Left = 14
    Top = 51
    Width = 12
    Height = 13
    Caption = '....'
  end
  object lblFingerID: TLabel
    Left = 14
    Top = 72
    Width = 12
    Height = 13
    Caption = '....'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 100
    Width = 710
    Height = 216
    TabOrder = 0
    object gtbKontrak: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryKontrak
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbKontrakautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbKontraknokontrak: TcxGridDBColumn
        Caption = 'No Kontrak'
        DataBinding.FieldName = 'nokontrak'
        Width = 100
      end
      object gtbKontraktglkontrak: TcxGridDBColumn
        Caption = 'Tgl Kontrak'
        DataBinding.FieldName = 'tglkontrak'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbKontrakkodekontrak: TcxGridDBColumn
        Caption = 'Kode Kontrak'
        DataBinding.FieldName = 'kodekontrak'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodekontrak'
        Properties.ListColumns = <
          item
            FieldName = 'namakontrak'
          end>
        Properties.ListSource = dsTblKontrak
        Width = 125
      end
      object gtbKontraktglmasuk: TcxGridDBColumn
        Caption = 'Tgl Masuk'
        DataBinding.FieldName = 'tglmasuk'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbKontraktglhabis: TcxGridDBColumn
        Caption = 'Tgl Habis'
        DataBinding.FieldName = 'tglhabis'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbKontrakgapok: TcxGridDBColumn
        Caption = 'V. Gapok'
        DataBinding.FieldName = 'gapok'
        Width = 100
      end
      object gtbKontraklastedituser: TcxGridDBColumn
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
      object gtbKontraklasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbKontrak
    end
  end
  object Button1: TButton
    Left = 560
    Top = 32
    Width = 158
    Height = 53
    Anchors = [akTop, akRight]
    Caption = 'Cancel Selected Kontrak'
    TabOrder = 1
    OnClick = Button1Click
  end
  object qryKontrak: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from ben_hrd_kontrak_details where nokontrak = '#39'X'#39)
    Left = 448
    Top = 40
  end
  object dsQryKontrak: TDataSource
    DataSet = qryKontrak
    Left = 512
    Top = 40
  end
  object tblKontrak: TMyTable
    TableName = 'ben_hrd_kontrak_master'
    Connection = dmDB.dbInternal
    Left = 320
    Top = 36
  end
  object dsTblKontrak: TDataSource
    DataSet = tblKontrak
    Left = 372
    Top = 36
  end
end
