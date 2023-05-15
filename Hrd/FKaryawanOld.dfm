object frmKaryawanOld: TfrmKaryawanOld
  Left = 0
  Top = 0
  Caption = 'frmKaryawanOld'
  ClientHeight = 350
  ClientWidth = 703
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
    703
    350)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = -4
    Width = 701
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  List Karyawan Lama'
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
    Left = 0
    Top = 28
    Width = 701
    Height = 266
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbOld: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblKaryawanOld
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
      object gtbOldkaryawan_id: TcxGridDBColumn
        Caption = 'ID Karyawan'
        DataBinding.FieldName = 'karyawan_id'
        Width = 100
      end
      object gtbOlddepartemen_id: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'departemen_id'
        Width = 100
      end
      object gtbOldshift_id: TcxGridDBColumn
        Caption = 'Kode Shift'
        DataBinding.FieldName = 'shift_id'
        Visible = False
        Width = 100
      end
      object gtbOldstatus_kerja_id: TcxGridDBColumn
        DataBinding.FieldName = 'status_kerja_id'
        Visible = False
        Width = 100
      end
      object gtbOldtgl_masuk_kerja: TcxGridDBColumn
        DataBinding.FieldName = 'tgl_masuk_kerja'
        Width = 100
      end
      object gtbOldnama_lengkap: TcxGridDBColumn
        Caption = 'Nama Lengkap'
        DataBinding.FieldName = 'nama_lengkap'
        Width = 169
      end
      object gtbOldsex: TcxGridDBColumn
        Caption = 'Gender'
        DataBinding.FieldName = 'sex'
        Width = 100
      end
      object gtbOldalamat_ktp: TcxGridDBColumn
        Caption = 'Alamat KTP'
        DataBinding.FieldName = 'alamat_ktp'
        Visible = False
        Width = 100
      end
      object gtbOldalamat_tinggal: TcxGridDBColumn
        Caption = 'Alamat Tinggal'
        DataBinding.FieldName = 'alamat_tinggal'
        Visible = False
        Width = 100
      end
      object gtbOldtelp_fixline: TcxGridDBColumn
        DataBinding.FieldName = 'telp_fixline'
        Visible = False
        Width = 100
      end
      object gtbOldtelp_ponsel: TcxGridDBColumn
        DataBinding.FieldName = 'telp_ponsel'
        Visible = False
        Width = 100
      end
      object gtbOldtempat_lahir: TcxGridDBColumn
        DataBinding.FieldName = 'tempat_lahir'
        Visible = False
        Width = 100
      end
      object gtbOldtgl_lahir: TcxGridDBColumn
        DataBinding.FieldName = 'tgl_lahir'
        Visible = False
        Width = 100
      end
      object gtbOldagama_id: TcxGridDBColumn
        DataBinding.FieldName = 'agama_id'
        Visible = False
        Width = 100
      end
      object gtbOldgol_darah: TcxGridDBColumn
        DataBinding.FieldName = 'gol_darah'
        Visible = False
        Width = 100
      end
      object gtbOldtype: TcxGridDBColumn
        DataBinding.FieldName = 'type'
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbOld
    end
  end
  object btnSelect: TButton
    Left = 8
    Top = 300
    Width = 89
    Height = 42
    Anchors = [akLeft, akBottom]
    Caption = 'Select'
    TabOrder = 1
    OnClick = btnSelectClick
  end
  object tblKaryawanOld: TMyTable
    TableName = 'karyawan'
    Connection = dmDB.dbInternal
    Left = 660
    Top = 12
  end
  object dsTblKaryawanOld: TDataSource
    DataSet = tblKaryawanOld
    Left = 664
    Top = 72
  end
end
