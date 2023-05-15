object frmPresensiManual: TfrmPresensiManual
  Left = 0
  Top = 0
  Caption = 'Absen Manual'
  ClientHeight = 430
  ClientWidth = 587
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
    587
    430)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 13
    Top = 79
    Width = 101
    Height = 16
    Caption = 'Kode Karyawan'
  end
  object Label4: TLabel
    Left = 0
    Top = -4
    Width = 584
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Presensi Manual'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 717
  end
  object Label2: TLabel
    Left = 13
    Top = 107
    Width = 87
    Height = 16
    Caption = 'ID  Karyawan'
  end
  object Label3: TLabel
    Left = 13
    Top = 137
    Width = 108
    Height = 16
    Caption = 'Nama  Karyawan'
  end
  object Label5: TLabel
    Left = 13
    Top = 169
    Width = 50
    Height = 16
    Caption = 'Tanggal'
  end
  object Label6: TLabel
    Left = 13
    Top = 199
    Width = 25
    Height = 16
    Caption = 'Jam'
  end
  object Label7: TLabel
    Left = 13
    Top = 227
    Width = 76
    Height = 16
    Caption = 'Keterangan'
  end
  object Label8: TLabel
    Left = 9
    Top = 31
    Width = 132
    Height = 16
    Caption = 'Search ID Karyawan'
  end
  object edKode: TEdit
    Left = 153
    Top = 76
    Width = 257
    Height = 24
    ReadOnly = True
    TabOrder = 1
  end
  object edID: TEdit
    Left = 153
    Top = 106
    Width = 257
    Height = 24
    ReadOnly = True
    TabOrder = 2
  end
  object edNama: TEdit
    Left = 153
    Top = 136
    Width = 257
    Height = 24
    ReadOnly = True
    TabOrder = 3
  end
  object edTanggal: TcxDateEdit
    Left = 153
    Top = 166
    EditValue = 0d
    TabOrder = 4
    Width = 257
  end
  object edJam: TcxTimeEdit
    Left = 153
    Top = 196
    EditValue = 0d
    TabOrder = 5
    OnKeyPress = edJamKeyPress
    Width = 257
  end
  object btnFind: TButton
    Left = 416
    Top = 75
    Width = 137
    Height = 55
    Caption = 'Search'
    TabOrder = 7
    OnClick = btnFindClick
  end
  object btnSimpan: TButton
    Left = 57
    Top = 263
    Width = 136
    Height = 54
    Caption = 'Simpan'
    TabOrder = 8
    OnClick = btnSimpanClick
  end
  object btnCancel: TButton
    Left = 199
    Top = 268
    Width = 109
    Height = 45
    Caption = 'Cancel'
    TabOrder = 9
    OnClick = btnCancelClick
  end
  object edKeterangan: TEdit
    Left = 153
    Top = 226
    Width = 339
    Height = 24
    CharCase = ecUpperCase
    TabOrder = 6
    OnKeyPress = edKeteranganKeyPress
  end
  object Button1: TButton
    Left = 417
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 10
    Visible = False
  end
  object edQuickSearch: TEdit
    Left = 153
    Top = 28
    Width = 241
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TextHint = 'Type ID Karyawan here...'
    OnKeyPress = edQuickSearchKeyPress
  end
end
