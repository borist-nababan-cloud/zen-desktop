object frmMemberMaster: TfrmMemberMaster
  Left = 0
  Top = 0
  Caption = '  Master Members'
  ClientHeight = 473
  ClientWidth = 841
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
    841
    473)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulAtas: TLabel
    Left = 8
    Top = 4
    Width = 825
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Master Members'
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
    Top = 36
    Width = 825
    Height = 369
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbMember: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryMember
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skCount
          Column = gtbMemberno_kartu
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 'Gunakan F2 untuk filter'
      FilterRow.Visible = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbMemberno_kartu: TcxGridDBColumn
        Caption = 'No Kartu'
        DataBinding.FieldName = 'no_kartu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbMembernama_lengkap: TcxGridDBColumn
        Caption = 'Nama Lengkap'
        DataBinding.FieldName = 'nama_lengkap'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 300
      end
      object gtbMemberalamat: TcxGridDBColumn
        Caption = 'Alamat'
        DataBinding.FieldName = 'alamat'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodeoutlet'
        Properties.ListColumns = <
          item
            FieldName = 'namaoutlet'
          end>
        Properties.ListSource = dsTblOutlet
        Width = 125
      end
      object gtbMembertempat_lahir: TcxGridDBColumn
        Caption = 'Tempat Lahir'
        DataBinding.FieldName = 'tempat_lahir'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbMembertanggal_lahir: TcxGridDBColumn
        Caption = 'Tanggal Lahir'
        DataBinding.FieldName = 'tanggal_lahir'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbMemberno_telepon: TcxGridDBColumn
        Caption = 'No Telp'
        DataBinding.FieldName = 'no_telepon'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbMemberno_handphone: TcxGridDBColumn
        Caption = 'No. Mobile'
        DataBinding.FieldName = 'no_handphone'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbMemberid_members: TcxGridDBColumn
        DataBinding.FieldName = 'id_members'
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbMember
    end
  end
  object btnBaru: TcxButton
    Left = 8
    Top = 416
    Width = 93
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 1
    OnClick = btnBaruClick
  end
  object btnEdit: TcxButton
    Left = 112
    Top = 416
    Width = 93
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'Edit'
    TabOrder = 2
    OnClick = btnEditClick
  end
  object qryListMember: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'SELECT id_members, nama_lengkap, tanggal_lahir, tempat_lahir, no' +
        '_kartu, '
      'no_handphone, alamat FROM members')
    Left = 656
    Top = 36
  end
  object dsQryMember: TMyDataSource
    DataSet = qryListMember
    Left = 656
    Top = 100
  end
  object tblOutlet: TMyTable
    TableName = 'ben_outlet'
    Connection = dmDB.dbInternal
    Left = 416
    Top = 244
  end
  object dsTblOutlet: TMyDataSource
    DataSet = tblOutlet
    Left = 412
    Top = 312
  end
end
