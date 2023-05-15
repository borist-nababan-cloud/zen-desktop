object frmJadwalOutletChange: TfrmJadwalOutletChange
  Left = 0
  Top = 0
  Caption = 'Jadwal Harian Change'
  ClientHeight = 388
  ClientWidth = 393
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
    393
    388)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 3
    Top = 37
    Width = 382
    Height = 123
  end
  object Label3: TLabel
    Left = 0
    Top = 0
    Width = 391
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Change Jadwal'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 581
  end
  object Label1: TLabel
    Left = 8
    Top = 49
    Width = 87
    Height = 13
    Caption = 'Kode Karyawan'
  end
  object Label2: TLabel
    Left = 8
    Top = 76
    Width = 51
    Height = 13
    Caption = 'ID Finger'
  end
  object Label4: TLabel
    Left = 8
    Top = 103
    Width = 91
    Height = 13
    Caption = 'Nama Karyawan'
  end
  object Label5: TLabel
    Left = 8
    Top = 130
    Width = 85
    Height = 13
    Caption = 'Tanggal Masuk'
  end
  object Label6: TLabel
    Left = 8
    Top = 169
    Width = 57
    Height = 13
    Caption = 'Kode Shift'
  end
  object Label7: TLabel
    Left = 8
    Top = 196
    Width = 64
    Height = 13
    Caption = 'Jam Masuk'
  end
  object Label8: TLabel
    Left = 8
    Top = 223
    Width = 84
    Height = 13
    Caption = 'Tanggal Keluar'
  end
  object Label9: TLabel
    Left = 8
    Top = 250
    Width = 63
    Height = 13
    Caption = 'Jam Keluar'
  end
  object Label10: TLabel
    Left = 8
    Top = 277
    Width = 66
    Height = 13
    Caption = 'Keterangan'
  end
  object edKode: TEdit
    Left = 112
    Top = 46
    Width = 169
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object edID: TEdit
    Left = 112
    Top = 73
    Width = 169
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edNama: TEdit
    Left = 112
    Top = 100
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edTglMasuk: TcxDateEdit
    Left = 112
    Top = 127
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 169
  end
  object edKodeShift: TcxLookupComboBox
    Left = 112
    Top = 166
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 15
    Properties.KeyFieldNames = 'autonum'
    Properties.ListColumns = <
      item
        FieldName = 'namashift'
      end>
    Properties.ListSource = dsTblShift
    Properties.OnEditValueChanged = edKodeShiftPropertiesEditValueChanged
    TabOrder = 4
    Width = 169
  end
  object edJMasuk: TcxTimeEdit
    Left = 112
    Top = 193
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 5
    Width = 169
  end
  object edTglKeluar: TcxDateEdit
    Left = 112
    Top = 220
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 6
    Width = 169
  end
  object edJamKeluar: TcxTimeEdit
    Left = 112
    Top = 247
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 169
  end
  object Button1: TButton
    Left = 65
    Top = 319
    Width = 105
    Height = 52
    Caption = 'Update'
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 319
    Width = 105
    Height = 52
    Caption = 'Cancel'
    TabOrder = 10
    OnClick = Button2Click
  end
  object edKet: TEdit
    Left = 112
    Top = 274
    Width = 250
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
  end
  object tblShift: TMyTable
    TableName = 'ben_shift'
    Connection = dmDB.dbInternal
    Left = 324
    Top = 169
  end
  object dsTblShift: TDataSource
    DataSet = tblShift
    Left = 324
    Top = 225
  end
end
