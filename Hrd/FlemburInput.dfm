object frmLemburInput: TfrmLemburInput
  Left = 0
  Top = 0
  Caption = '  Input Lembur Karyawan'
  ClientHeight = 544
  ClientWidth = 498
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
    498
    544)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 320
    Width = 467
    Height = 145
  end
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 497
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Input Lembur Karyawan'
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
  object Label2: TLabel
    Left = 12
    Top = 115
    Width = 87
    Height = 13
    Caption = 'Kode Karyawan'
  end
  object Label3: TLabel
    Left = 12
    Top = 143
    Width = 75
    Height = 13
    Caption = 'ID  Karyawan'
  end
  object Label4: TLabel
    Left = 12
    Top = 173
    Width = 94
    Height = 13
    Caption = 'Nama  Karyawan'
  end
  object Label12: TLabel
    Left = 12
    Top = 205
    Width = 63
    Height = 13
    Caption = 'Tgl Lembur'
  end
  object Label5: TLabel
    Left = 22
    Top = 332
    Width = 73
    Height = 13
    Caption = 'Lembur Awal'
  end
  object Label6: TLabel
    Left = 22
    Top = 359
    Width = 76
    Height = 13
    Caption = 'Lembur Akhir'
  end
  object Label7: TLabel
    Left = 22
    Top = 384
    Width = 66
    Height = 13
    Caption = 'Keterangan'
  end
  object Label8: TLabel
    Left = 12
    Top = 232
    Width = 57
    Height = 13
    Caption = 'Tgl Masuk'
  end
  object Label9: TLabel
    Left = 12
    Top = 259
    Width = 56
    Height = 13
    Caption = 'Tgl Keluar'
  end
  object Label10: TLabel
    Left = 12
    Top = 286
    Width = 61
    Height = 13
    Caption = 'Nama Shift'
  end
  object Label11: TLabel
    Left = 22
    Top = 413
    Width = 77
    Height = 13
    Caption = 'Lama Lembur'
  end
  object lblNoLembur: TLabel
    Left = 22
    Top = 439
    Width = 9
    Height = 13
    Caption = '...'
    Visible = False
  end
  object Label13: TLabel
    Left = 8
    Top = 37
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
    Top = 112
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object edID: TEdit
    Left = 136
    Top = 142
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edNama: TEdit
    Left = 136
    Top = 172
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edTglLembur: TcxDateEdit
    Left = 136
    Top = 202
    EditValue = 0d
    Properties.OnChange = edTglLemburPropertiesChange
    Properties.OnValidate = edTglLemburPropertiesValidate
    TabOrder = 3
    Width = 257
  end
  object btnFind: TButton
    Left = 415
    Top = 108
    Width = 75
    Height = 55
    Caption = 'Search'
    TabOrder = 17
    OnClick = btnFindClick
  end
  object edStart: TcxTimeEdit
    Left = 285
    Top = 329
    EditValue = 0d
    Properties.ReadOnly = False
    Properties.OnChange = edStartPropertiesChange
    TabOrder = 10
    OnKeyPress = edStartKeyPress
    Width = 118
  end
  object edEnd: TcxTimeEdit
    Left = 285
    Top = 356
    EditValue = 0d
    Properties.ReadOnly = False
    Properties.OnChange = edEndPropertiesChange
    TabOrder = 12
    OnKeyPress = edEndKeyPress
    Width = 118
  end
  object edKeterangan: TEdit
    Left = 146
    Top = 383
    Width = 257
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 13
    OnKeyPress = edKeteranganKeyPress
  end
  object btnSimpan: TButton
    Left = 44
    Top = 479
    Width = 97
    Height = 53
    Caption = 'Simpan'
    TabOrder = 16
    OnClick = btnSimpanClick
  end
  object edTglMasuk: TcxDateEdit
    Left = 136
    Top = 229
    EditValue = 0d
    Properties.ReadOnly = False
    TabOrder = 4
    OnKeyPress = edTglMasukKeyPress
    Width = 133
  end
  object edTglKeluar: TcxDateEdit
    Left = 136
    Top = 256
    EditValue = 0d
    Properties.ReadOnly = False
    TabOrder = 6
    OnKeyPress = edTglKeluarKeyPress
    Width = 133
  end
  object edNamaShift: TEdit
    Left = 136
    Top = 283
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 8
    OnKeyPress = edNamaShiftKeyPress
  end
  object edJmasuk: TcxTimeEdit
    Left = 275
    Top = 229
    EditValue = 0d
    Properties.ReadOnly = False
    Properties.OnChange = edJmasukPropertiesChange
    TabOrder = 5
    OnKeyPress = edJmasukKeyPress
    Width = 118
  end
  object edJKeluar: TcxTimeEdit
    Left = 275
    Top = 256
    EditValue = 0d
    Properties.ReadOnly = False
    Properties.OnChange = edJKeluarPropertiesChange
    TabOrder = 7
    OnKeyPress = edJKeluarKeyPress
    Width = 118
  end
  object edLama: TcxCalcEdit
    Left = 146
    Top = 410
    EditValue = 0.000000000000000000
    TabOrder = 14
    OnKeyPress = edLamaKeyPress
    Width = 121
  end
  object edTglLemburStart: TcxDateEdit
    Left = 146
    Top = 329
    EditValue = 0d
    Properties.ReadOnly = False
    Properties.OnChange = edTglLemburStartPropertiesChange
    TabOrder = 9
    OnKeyPress = edTglLemburStartKeyPress
    Width = 133
  end
  object edTglLemburEnd: TcxDateEdit
    Left = 146
    Top = 356
    EditValue = 0d
    Properties.ReadOnly = False
    Properties.OnChange = edTglLemburEndPropertiesChange
    TabOrder = 11
    OnKeyPress = edTglLemburEndKeyPress
    Width = 133
  end
  object btnCancel: TButton
    Left = 292
    Top = 479
    Width = 97
    Height = 53
    Caption = 'Close Form'
    TabOrder = 15
    OnClick = btnCancelClick
  end
  object edQuickSearch: TcxTextEdit
    Left = 8
    Top = 58
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 18
    TextHint = 'Type ID Karyawan and Press Enter'
    OnKeyPress = edQuickSearchKeyPress
    Width = 382
  end
end
