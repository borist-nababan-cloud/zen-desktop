object frmIjinCuti: TfrmIjinCuti
  Left = 0
  Top = 0
  Caption = '  Input Cuti '
  ClientHeight = 517
  ClientWidth = 561
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
    561
    517)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 0
    Top = -4
    Width = 563
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Input Cuti '
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 529
  end
  object Label2: TLabel
    Left = 12
    Top = 107
    Width = 101
    Height = 16
    Caption = 'Kode Karyawan'
  end
  object Label3: TLabel
    Left = 12
    Top = 135
    Width = 87
    Height = 16
    Caption = 'ID  Karyawan'
  end
  object Label4: TLabel
    Left = 12
    Top = 165
    Width = 108
    Height = 16
    Caption = 'Nama  Karyawan'
  end
  object Label5: TLabel
    Left = 12
    Top = 228
    Width = 79
    Height = 16
    Caption = 'Cuti Tanggal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 12
    Top = 258
    Width = 77
    Height = 16
    Caption = 's/d Tanggal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 12
    Top = 288
    Width = 33
    Height = 16
    Caption = 'Divisi'
  end
  object Label8: TLabel
    Left = 12
    Top = 318
    Width = 74
    Height = 16
    Caption = 'Jumlah Hari'
  end
  object Label9: TLabel
    Left = 12
    Top = 348
    Width = 64
    Height = 16
    Caption = 'Saldo Cuti'
  end
  object Label10: TLabel
    Left = 12
    Top = 378
    Width = 55
    Height = 16
    Caption = 'Sisa Cuti'
  end
  object Label11: TLabel
    Left = 12
    Top = 408
    Width = 76
    Height = 16
    Caption = 'Keterangan'
  end
  object Label12: TLabel
    Left = 12
    Top = 197
    Width = 90
    Height = 16
    Caption = 'Tgl Pengajuan'
  end
  object Label13: TLabel
    Left = 8
    Top = 28
    Width = 215
    Height = 19
    Caption = 'Quick Search ID Karyawan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edKode: TEdit
    Left = 136
    Top = 104
    Width = 257
    Height = 24
    ReadOnly = True
    TabOrder = 1
  end
  object edID: TEdit
    Left = 136
    Top = 134
    Width = 257
    Height = 24
    ReadOnly = True
    TabOrder = 2
  end
  object edNama: TEdit
    Left = 136
    Top = 164
    Width = 257
    Height = 24
    ReadOnly = True
    TabOrder = 3
  end
  object edStart: TcxDateEdit
    Left = 136
    Top = 225
    EditValue = 0d
    ParentFont = False
    Properties.OnChange = edStartPropertiesChange
    Properties.OnValidate = edStartPropertiesValidate
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 5
    OnKeyPress = edStartKeyPress
    Width = 257
  end
  object btnFind: TButton
    Left = 400
    Top = 103
    Width = 75
    Height = 55
    Caption = 'Search'
    TabOrder = 14
    OnClick = btnFindClick
  end
  object edEnd: TcxDateEdit
    Left = 136
    Top = 255
    EditValue = 0d
    ParentFont = False
    Properties.OnChange = edEndPropertiesChange
    Properties.OnValidate = edEndPropertiesValidate
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 6
    OnKeyPress = edEndKeyPress
    Width = 257
  end
  object edDivisi: TcxLookupComboBox
    Left = 136
    Top = 285
    Properties.KeyFieldNames = 'id_departemen'
    Properties.ListColumns = <
      item
        FieldName = 'nama_departemen'
      end>
    Properties.ListSource = dsTblDepartemen
    TabOrder = 7
    OnKeyPress = edDivisiKeyPress
    Width = 257
  end
  object edJumlah: TcxCalcEdit
    Left = 136
    Top = 315
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    TabOrder = 8
    OnKeyPress = edJumlahKeyPress
    Width = 121
  end
  object edSaldo: TcxCalcEdit
    Left = 136
    Top = 345
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    TabOrder = 9
    OnKeyPress = edSaldoKeyPress
    Width = 121
  end
  object edSisa: TcxCalcEdit
    Left = 136
    Top = 375
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    TabOrder = 10
    OnKeyPress = edSisaKeyPress
    Width = 121
  end
  object btnSave: TButton
    Left = 52
    Top = 435
    Width = 141
    Height = 61
    Caption = 'Simpan'
    TabOrder = 12
    OnClick = btnSaveClick
  end
  object edKeterangan: TEdit
    Left = 136
    Top = 405
    Width = 381
    Height = 24
    CharCase = ecUpperCase
    TabOrder = 11
    OnKeyPress = edKeteranganKeyPress
  end
  object edTglPengajuan: TcxDateEdit
    Left = 136
    Top = 194
    EditValue = 0d
    Properties.OnChange = edStartPropertiesChange
    Properties.OnValidate = edStartPropertiesValidate
    TabOrder = 4
    OnKeyPress = edTglPengajuanKeyPress
    Width = 257
  end
  object btnCancel: TButton
    Left = 356
    Top = 435
    Width = 141
    Height = 61
    Caption = 'Cancel'
    TabOrder = 13
    Visible = False
    OnClick = btnCancelClick
  end
  object edQuickSearch: TcxTextEdit
    Left = 8
    Top = 49
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    TextHint = 'Type ID Karyawan and Press Enter'
    OnKeyPress = edQuickSearchKeyPress
    Width = 382
  end
  object gbHistory: TcxGroupBox
    Left = 268
    Top = 315
    Caption = 'History Cuti'
    TabOrder = 15
    Height = 79
    Width = 249
    object lblSaldo: TcxLabel
      Left = 7
      Top = 17
      Caption = 'Saldo Cuti '
      Transparent = True
    end
    object lblTerpakai: TcxLabel
      Left = 7
      Top = 46
      Caption = 'Jumlah Saldo Terpakai'
      Transparent = True
    end
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 408
    Top = 23
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 408
    Top = 71
  end
end
