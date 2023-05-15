object frmMemberCari: TfrmMemberCari
  Left = 0
  Top = 0
  Caption = '   Find Members'
  ClientHeight = 461
  ClientWidth = 894
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    894
    461)
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 420
    Top = 16
    Width = 34
    Height = 18
    Caption = 'LIMIT'
    Visible = False
  end
  object lblJudulAtas: TLabel
    Left = 4
    Top = 4
    Width = 878
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '   Find Members'
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
    Top = 84
    Width = 878
    Height = 369
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbMember: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryMemberLocal
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
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Width = 350
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
        Properties.ReadOnly = False
        Width = 100
      end
      object gtbMemberno_telepon: TcxGridDBColumn
        Caption = 'No Telp'
        DataBinding.FieldName = 'no_telepon'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Width = 100
      end
      object gtbMemberno_handphone: TcxGridDBColumn
        Caption = 'No. Mobile'
        DataBinding.FieldName = 'no_handphone'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbMember
    end
  end
  object edCariNama: TEdit
    Left = 12
    Top = 40
    Width = 257
    Height = 26
    TabOrder = 1
    TextHint = 'Klik di Sini untuk Cari Nama'
    OnChange = edCariNamaChange
  end
  object btnCancel: TcxButton
    Left = 279
    Top = 36
    Width = 121
    Height = 35
    Hint = 'BATAL (CTRL+N)'
    Caption = 'FIND'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    Visible = False
    OnClick = btnCancelClick
  end
  object edLimit: TcxCalcEdit
    Left = 420
    Top = 40
    EditValue = 100.000000000000000000
    TabOrder = 3
    Visible = False
    Width = 121
  end
  object dsQryMemberLocal: TDataSource
    DataSet = QryMemberLocal
    Left = 640
    Top = 28
  end
  object QryMemberLocal: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'SELECT nama_lengkap, tanggal_lahir, tempat_lahir, no_kartu, no_t' +
        'elepon, no_handphone, alamat FROM members')
    Left = 756
    Top = 24
  end
end
