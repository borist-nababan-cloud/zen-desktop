object frmJadwalOutletAdd: TfrmJadwalOutletAdd
  Left = 0
  Top = 0
  Caption = 'Jadwal Harian Add'
  ClientHeight = 585
  ClientWidth = 935
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
    935
    585)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 68
    Width = 59
    Height = 13
    Caption = 'Start Date'
  end
  object Label2: TLabel
    Left = 16
    Top = 104
    Width = 76
    Height = 13
    Caption = 'Jumlah Week'
  end
  object Label3: TLabel
    Left = 16
    Top = 40
    Width = 30
    Height = 13
    Caption = 'Divisi'
  end
  object Label5: TLabel
    Left = 4
    Top = 138
    Width = 597
    Height = 11
    Caption = 
      'Jadwal yang sudah ada tidak akan di-replace dengan data baru. Un' +
      'tuk merubah data jadwal, gunakan menu ganti jadwal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 0
    Top = -4
    Width = 936
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Master Jadwal Outlet'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 861
  end
  object edStart: TcxDateEdit
    Left = 112
    Top = 65
    EditValue = 0d
    Properties.OnChange = edStartPropertiesChange
    TabOrder = 0
    Width = 181
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 160
    Width = 923
    Height = 169
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    object gtvJadwal: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtvJadwalKodeStaff: TcxGridColumn
        Caption = 'NIK'
        Width = 125
      end
      object gtvJadwalIDStaff: TcxGridColumn
        Caption = 'ID Finger'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvJadwalNamaStaff: TcxGridColumn
        Caption = 'Nama Staff'
        Width = 150
      end
      object gtvJadwalMon: TcxGridColumn
        Caption = 'Monday'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownWidth = 150
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Width = 75
      end
      object gtvJadwalTue: TcxGridColumn
        Caption = 'Tuesday'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownWidth = 150
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Width = 75
      end
      object gtvJadwalWed: TcxGridColumn
        Caption = 'Wednesday'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownWidth = 150
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Width = 75
      end
      object gtvJadwalThu: TcxGridColumn
        Caption = 'Thursday'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownWidth = 150
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Width = 75
      end
      object gtvJadwalFri: TcxGridColumn
        Caption = 'Friday'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownWidth = 150
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Width = 75
      end
      object gtvJadwalSat: TcxGridColumn
        Caption = 'Saturday'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownWidth = 150
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Width = 75
      end
      object gtvJadwalSun: TcxGridColumn
        Caption = 'Sunday'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownWidth = 150
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Width = 75
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvJadwal
    end
  end
  object edCount: TcxCalcEdit
    Left = 112
    Top = 101
    EditValue = 1
    TabOrder = 2
    Width = 181
  end
  object Button1: TButton
    Left = 299
    Top = 92
    Width = 102
    Height = 40
    Caption = 'Prepared'
    TabOrder = 3
    OnClick = Button1Click
  end
  object cxGrid2: TcxGrid
    Left = 8
    Top = 335
    Width = 919
    Height = 214
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object tvAdd: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object tvAddNik: TcxGridColumn
        Caption = 'NIK'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object tvAddStaff: TcxGridColumn
        Caption = 'Nama Staff'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object tvAddShift: TcxGridColumn
        Caption = 'Shift'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dsTblShift
        Properties.ReadOnly = True
        Width = 100
      end
      object tvAddTglMasuk: TcxGridColumn
        Caption = 'Tgl Masuk'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object tvAddMasuk: TcxGridColumn
        Caption = 'J. Masuk'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object tvAddTglKeluar: TcxGridColumn
        Caption = 'Tgl Keluar'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
      end
      object tvAddKeluar: TcxGridColumn
        Caption = 'J. Keluar'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = tvAdd
    end
  end
  object btnClearJadwal: TButton
    Left = 8
    Top = 552
    Width = 88
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Jadwal'
    TabOrder = 5
    OnClick = btnClearJadwalClick
  end
  object btnPost: TButton
    Left = 491
    Top = 40
    Width = 134
    Height = 92
    Caption = 'POST DATA'
    TabOrder = 6
    Visible = False
    OnClick = btnPostClick
  end
  object edDivisi: TcxLookupComboBox
    Left = 112
    Top = 40
    Properties.KeyFieldNames = 'id_departemen'
    Properties.ListColumns = <
      item
        FieldName = 'nama_departemen'
      end>
    Properties.ListSource = dsTblDivisi
    TabOrder = 7
    Width = 181
  end
  object btnLoadstaff: TButton
    Left = 299
    Top = 41
    Width = 102
    Height = 45
    Caption = 'Load Karyawan'
    TabOrder = 8
    OnClick = btnLoadstaffClick
  end
  object tblShift: TMyTable
    TableName = 'ben_shift'
    Connection = dmDB.dbInternal
    Left = 708
    Top = 8
  end
  object dsTblShift: TDataSource
    DataSet = tblShift
    Left = 772
    Top = 8
  end
  object tblDivisi: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 712
    Top = 76
  end
  object dsTblDivisi: TDataSource
    DataSet = tblDivisi
    Left = 776
    Top = 76
  end
end
