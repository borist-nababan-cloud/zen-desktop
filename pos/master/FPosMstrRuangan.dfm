object frmPosMstrRuangan: TfrmPosMstrRuangan
  Left = 0
  Top = 0
  Caption = 'Master Ruangan'
  ClientHeight = 599
  ClientWidth = 966
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    966
    599)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 954
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Master Ruangan'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1012
  end
  object dxBevel1: TdxBevel
    Left = 537
    Top = 36
    Width = 421
    Height = 341
    Anchors = [akTop, akRight]
  end
  object Label2: TLabel
    Left = 592
    Top = 59
    Width = 82
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Kode Ruangan'
    ExplicitLeft = 654
  end
  object Label3: TLabel
    Left = 592
    Top = 89
    Width = 34
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Lantai'
    ExplicitLeft = 654
  end
  object Label4: TLabel
    Left = 592
    Top = 119
    Width = 38
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Nomor'
    ExplicitLeft = 654
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 36
    Width = 523
    Height = 509
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbMstrRuangan: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblRuangan
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbMstrRuanganruangan_id: TcxGridDBColumn
        Caption = 'ID Ruangan'
        DataBinding.FieldName = 'ruangan_id'
        Width = 100
      end
      object gtbMstrRuanganlantai: TcxGridDBColumn
        Caption = 'Lantai'
        DataBinding.FieldName = 'lantai'
        Width = 100
      end
      object gtbMstrRuangannomor: TcxGridDBColumn
        Caption = 'Nomor'
        DataBinding.FieldName = 'nomor'
        Width = 100
      end
      object gtbMstrRuanganjenis_jasa: TcxGridDBColumn
        Caption = 'Jasa'
        DataBinding.FieldName = 'jenis_jasa'
        Width = 100
      end
      object gtbMstrRuangannotes: TcxGridDBColumn
        Caption = 'Gender'
        DataBinding.FieldName = 'notes'
        Width = 100
      end
      object gtbMstrRuangankondisi: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'kondisi'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbMstrRuangan
    end
  end
  object edKodeRuangan: TcxTextEdit
    Left = 680
    Top = 56
    Anchors = [akTop, akRight]
    TabOrder = 1
    Width = 250
  end
  object edLantai: TcxTextEdit
    Left = 680
    Top = 86
    Anchors = [akTop, akRight]
    TabOrder = 2
    Width = 250
  end
  object edNomor: TcxTextEdit
    Left = 680
    Top = 116
    Anchors = [akTop, akRight]
    TabOrder = 3
    Width = 250
  end
  object rbJasa: TcxRadioGroup
    Left = 592
    Top = 146
    Anchors = [akTop, akRight]
    Caption = 'Jenis Jasa'
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'RF'
      end
      item
        Caption = 'BM'
      end>
    TabOrder = 4
    Height = 51
    Width = 338
  end
  object ckAktif: TcxCheckBox
    Left = 592
    Top = 288
    Anchors = [akTop, akRight]
    Caption = 'Aktif'
    TabOrder = 5
  end
  object btnAdd: TButton
    Left = 596
    Top = 324
    Width = 95
    Height = 37
    Anchors = [akTop, akRight]
    Caption = 'Add'
    TabOrder = 6
    OnClick = btnAddClick
  end
  object btnCancel: TButton
    Left = 722
    Top = 324
    Width = 85
    Height = 37
    Anchors = [akTop, akRight]
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object btnEdit: TButton
    Left = 8
    Top = 556
    Width = 89
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = 'Edit Selected'
    TabOrder = 8
    OnClick = btnEditClick
  end
  object rbGender: TcxRadioGroup
    Left = 592
    Top = 203
    Anchors = [akTop, akRight]
    Caption = 'Gender'
    Properties.Columns = 3
    Properties.Items = <
      item
        Caption = 'MALE'
      end
      item
        Caption = 'FEMALE'
      end
      item
        Caption = 'COUPLE'
      end
      item
        Caption = 'NONE'
      end>
    TabOrder = 9
    Height = 79
    Width = 338
  end
  object btnSync: TButton
    Left = 112
    Top = 556
    Width = 89
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = 'Sync to Cloud'
    TabOrder = 10
    OnClick = btnSyncClick
  end
  object tblRuangan: TMyTable
    TableName = 'ruangan'
    Connection = dmDB.dbInternal
    Left = 40
    Top = 152
  end
  object dsTblRuangan: TMyDataSource
    DataSet = tblRuangan
    Left = 44
    Top = 208
  end
end
