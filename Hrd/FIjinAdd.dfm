object frmIjinAdd: TfrmIjinAdd
  Left = 0
  Top = 0
  ClientHeight = 255
  ClientWidth = 502
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 210
    Height = 26
    Caption = '  INPUT IJIN KARYAWAN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 52
    Width = 91
    Height = 13
    Caption = 'Nama Karyawan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 79
    Width = 61
    Height = 13
    Caption = 'Parameter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 106
    Width = 61
    Height = 13
    Caption = 'Parameter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 133
    Width = 66
    Height = 13
    Caption = 'Keterangan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edNamaKaryawan: TcxLookupComboBox
    Left = 116
    Top = 49
    Properties.KeyFieldNames = 'kodekaryawan'
    Properties.ListColumns = <
      item
        FieldName = 'namakaryawan'
      end>
    Properties.ListSource = dsKaryawan
    TabOrder = 0
    Width = 297
  end
  object edParameter: TcxLookupComboBox
    Left = 116
    Top = 76
    Properties.KeyFieldNames = 'namaijin'
    Properties.ListColumns = <
      item
        FieldName = 'namaijin'
      end>
    Properties.ListSource = dsTblIjin
    TabOrder = 1
    Width = 297
  end
  object edTanggal: TcxDateEdit
    Left = 116
    Top = 103
    EditValue = 0d
    TabOrder = 2
    Width = 297
  end
  object edKeterangan: TEdit
    Left = 116
    Top = 130
    Width = 297
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object btnSimpan: TButton
    Left = 96
    Top = 168
    Width = 97
    Height = 41
    Caption = 'SIMPAN'
    TabOrder = 4
    OnClick = btnSimpanClick
  end
  object btnCancel: TButton
    Left = 212
    Top = 168
    Width = 97
    Height = 41
    Caption = 'Cancel'
    TabOrder = 5
  end
  object btnUpdate: TButton
    Left = 72
    Top = 168
    Width = 97
    Height = 41
    Caption = 'UPDATE'
    TabOrder = 6
    OnClick = btnUpdateClick
  end
  object qryKaryawan: TMyQuery
    Database = DMDB.StoreDB
    SQL.Strings = (
      'SELECT kodekaryawan, idkaryawan, namakaryawan'
      'FROM hrd_karyawan_info')
    Left = 372
    Top = 16
  end
  object dsKaryawan: TDataSource
    DataSet = qryKaryawan
    Left = 456
    Top = 20
  end
  object tblIjin: TMyTable
    Database = DMDB.StoreDB
    TableName = 'hrd_master_ijin'
    Left = 428
    Top = 180
  end
  object dsTblIjin: TDataSource
    DataSet = tblIjin
    Left = 360
    Top = 176
  end
end
