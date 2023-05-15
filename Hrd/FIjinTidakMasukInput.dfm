object frmIjinTidakMasukInput: TfrmIjinTidakMasukInput
  Left = 0
  Top = 0
  Caption = '  Input Ijin Tidak Masuk'
  ClientHeight = 438
  ClientWidth = 526
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
    526
    438)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 2
    Width = 505
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Input Ijin Tidak Masuk'
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
  object Label2: TLabel
    Left = 8
    Top = 101
    Width = 87
    Height = 13
    Caption = 'Kode Karyawan'
  end
  object Label3: TLabel
    Left = 8
    Top = 129
    Width = 75
    Height = 13
    Caption = 'ID  Karyawan'
  end
  object Label4: TLabel
    Left = 8
    Top = 159
    Width = 94
    Height = 13
    Caption = 'Nama  Karyawan'
  end
  object Label5: TLabel
    Left = 8
    Top = 222
    Width = 67
    Height = 13
    Caption = 'Tanggal Ijin'
  end
  object Label11: TLabel
    Left = 8
    Top = 257
    Width = 66
    Height = 13
    Caption = 'Keterangan'
  end
  object Label12: TLabel
    Left = 8
    Top = 191
    Width = 51
    Height = 13
    Caption = 'Tgl Input'
  end
  object Label6: TLabel
    Left = 8
    Top = 292
    Width = 43
    Height = 13
    Caption = 'Tag Ijin'
  end
  object lblNoIjin: TLabel
    Left = 132
    Top = 316
    Width = 9
    Height = 13
    Caption = '...'
    Visible = False
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
    Left = 132
    Top = 98
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edID: TEdit
    Left = 132
    Top = 128
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edNama: TEdit
    Left = 132
    Top = 158
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object edStart: TcxDateEdit
    Left = 132
    Top = 219
    EditValue = 0d
    TabOrder = 5
    OnKeyPress = edStartKeyPress
    Width = 129
  end
  object btnFind: TButton
    Left = 395
    Top = 94
    Width = 75
    Height = 55
    Caption = 'Search'
    TabOrder = 9
    OnClick = btnFindClick
  end
  object btnSave: TButton
    Left = 132
    Top = 350
    Width = 141
    Height = 61
    Caption = 'Simpan'
    TabOrder = 7
    OnClick = btnSaveClick
  end
  object edKeterangan: TEdit
    Left = 132
    Top = 254
    Width = 381
    Height = 21
    TabOrder = 6
    OnKeyPress = edKeteranganKeyPress
  end
  object edTglPengajuan: TcxDateEdit
    Left = 132
    Top = 188
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 4
    OnKeyPress = edTglPengajuanKeyPress
    Width = 257
  end
  object btnCancel: TButton
    Left = 344
    Top = 350
    Width = 141
    Height = 61
    Caption = 'Close'
    TabOrder = 8
    Visible = False
    OnClick = btnCancelClick
  end
  object edTagIjin: TcxTextEdit
    Left = 132
    Top = 289
    Properties.ReadOnly = True
    TabOrder = 10
    Text = 'IJIN TIDAK MASUK'
    Width = 381
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
  object tblTag: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select tagid, namatag from ben_presensi_tag where namatag like '#39 +
        'IJIN%'#39)
    Left = 492
    Top = 101
  end
  object dsTblTag: TDataSource
    DataSet = tblTag
    Left = 488
    Top = 157
  end
end
