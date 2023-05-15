object frmMasterKontrak: TfrmMasterKontrak
  Tag = 1
  Left = 0
  Top = 0
  Caption = 'Master Kontrak'
  ClientHeight = 464
  ClientWidth = 790
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
    790
    464)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulForm: TLabel
    Left = 0
    Top = 0
    Width = 788
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Master Kontrak'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 525
  end
  object cxGrid1: TcxGrid
    Left = 3
    Top = 32
    Width = 782
    Height = 381
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbKontrak: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblKontrak
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Indicator = True
      object gtbKontrakautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbKontrakdepartemen: TcxGridDBColumn
        Caption = 'Divisi'
        DataBinding.FieldName = 'departemen'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        Width = 150
      end
      object gtbKontrakkodekontrak: TcxGridDBColumn
        Caption = 'Kode Kontrak'
        DataBinding.FieldName = 'kodekontrak'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKontraknamakontrak: TcxGridDBColumn
        Caption = 'Nama Kontrak'
        DataBinding.FieldName = 'namakontrak'
        Width = 175
      end
      object gtbKontraklamakontrak: TcxGridDBColumn
        Caption = 'Lama Kontrak'
        DataBinding.FieldName = 'lamakontrak'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbKontrakgapok: TcxGridDBColumn
        Caption = 'Gapok'
        DataBinding.FieldName = 'gapok'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbKontraktransport: TcxGridDBColumn
        Caption = 'Transport'
        DataBinding.FieldName = 'transport'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbKontrakuangmakan: TcxGridDBColumn
        Caption = 'U. Makan'
        DataBinding.FieldName = 'uangmakan'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbKontrakkomisi: TcxGridDBColumn
        Caption = 'Komisi %'
        DataBinding.FieldName = 'komisi'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbKontraktunjangan1: TcxGridDBColumn
        Caption = 'Tunjangan'
        DataBinding.FieldName = 'tunjangan1'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbKontraktunjangan2: TcxGridDBColumn
        Caption = 'Tunjangan 2'
        DataBinding.FieldName = 'tunjangan2'
        Visible = False
        Width = 100
      end
      object gtbKontrakpotongan1: TcxGridDBColumn
        Caption = 'Saving'
        DataBinding.FieldName = 'potongan1'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbKontrakpotongan2: TcxGridDBColumn
        Caption = 'Pot. Lain'
        DataBinding.FieldName = 'potongan2'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 100
      end
      object gtbKontrakisadmin: TcxGridDBColumn
        Caption = 'Is Admin'
        DataBinding.FieldName = 'isadmin'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 100
      end
      object gtbKontrakaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 100
      end
      object gtbKontraklastedituser: TcxGridDBColumn
        Caption = 'Last Edit User'
        DataBinding.FieldName = 'lastedituser'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbKontraklasteditdate: TcxGridDBColumn
        Caption = 'Last Edit Date'
        DataBinding.FieldName = 'lasteditdate'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 125
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbKontrak
    end
  end
  object btnEdit: TButton
    Left = 124
    Top = 419
    Width = 114
    Height = 37
    Anchors = [akLeft, akBottom]
    Caption = 'Edit'
    TabOrder = 1
    OnClick = btnEditClick
  end
  object btnNew: TButton
    Left = 4
    Top = 419
    Width = 114
    Height = 37
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 2
    OnClick = btnNewClick
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 660
    Top = 120
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 660
    Top = 164
  end
  object tblKontrak: TMyTable
    TableName = 'ben_hrd_kontrak_master'
    Connection = dmDB.dbInternal
    Left = 728
    Top = 80
  end
  object dsTblKontrak: TDataSource
    DataSet = tblKontrak
    Left = 728
    Top = 124
  end
end
