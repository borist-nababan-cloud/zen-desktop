object frmMasterDivisi: TfrmMasterDivisi
  Left = 0
  Top = 0
  Caption = 'frmMasterDivisi'
  ClientHeight = 379
  ClientWidth = 767
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    767
    379)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 765
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Master Divisi'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 681
  end
  object Label2: TLabel
    Left = 419
    Top = 44
    Width = 69
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Kode Divisi'
    ExplicitLeft = 420
  end
  object Label3: TLabel
    Left = 419
    Top = 80
    Width = 72
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Nama Divisi'
    ExplicitLeft = 420
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 32
    Width = 412
    Height = 293
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbDivisi: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Visible = True
      DataController.DataSource = dsTblDepartemen
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbDivisiid_departemen: TcxGridDBColumn
        Caption = 'Kode Divisi'
        DataBinding.FieldName = 'id_departemen'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 138
      end
      object gtbDivisinama_departemen: TcxGridDBColumn
        Caption = 'Nama Divisi'
        DataBinding.FieldName = 'nama_departemen'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 239
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbDivisi
    end
  end
  object edKode: TEdit
    Left = 511
    Top = 41
    Width = 245
    Height = 24
    Anchors = [akTop, akRight]
    Enabled = False
    TabOrder = 1
  end
  object edNama: TEdit
    Left = 511
    Top = 77
    Width = 245
    Height = 24
    Anchors = [akTop, akRight]
    Enabled = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 336
    Width = 89
    Height = 35
    Caption = 'Edit'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 103
    Top = 336
    Width = 89
    Height = 35
    Caption = 'New'
    TabOrder = 4
    OnClick = Button2Click
  end
  object btnSimpan: TButton
    Tag = 1
    Left = 511
    Top = 107
    Width = 102
    Height = 46
    Anchors = [akTop, akRight]
    Caption = 'Simpan'
    TabOrder = 5
    OnClick = btnSimpanClick
  end
  object btnClear: TButton
    Left = 619
    Top = 107
    Width = 102
    Height = 46
    Anchors = [akTop, akRight]
    Caption = 'Cancel'
    TabOrder = 6
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 640
    Top = 4
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 640
    Top = 48
  end
end
