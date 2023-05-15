object frmIjinTidakMasuk: TfrmIjinTidakMasuk
  Left = 0
  Top = 0
  ClientHeight = 346
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
    346)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = -4
    Width = 525
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Presensi Ijin Tidak Masuk'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 665
  end
  object Label2: TLabel
    Left = 8
    Top = 36
    Width = 87
    Height = 13
    Caption = 'Kode Karyawan'
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 75
    Height = 13
    Caption = 'ID  Karyawan'
  end
  object Label4: TLabel
    Left = 8
    Top = 94
    Width = 94
    Height = 13
    Caption = 'Nama  Karyawan'
  end
  object Label5: TLabel
    Left = 8
    Top = 157
    Width = 67
    Height = 13
    Caption = 'Ijin Tanggal'
  end
  object Label11: TLabel
    Left = 8
    Top = 184
    Width = 66
    Height = 13
    Caption = 'Keterangan'
  end
  object Label12: TLabel
    Left = 8
    Top = 126
    Width = 80
    Height = 13
    Caption = 'Tgl Pengajuan'
  end
  object Label6: TLabel
    Left = 8
    Top = 219
    Width = 43
    Height = 13
    Caption = 'Tag Ijin'
    Visible = False
  end
  object lblNoIjin: TLabel
    Left = 8
    Top = 248
    Width = 9
    Height = 13
    Caption = '...'
    Visible = False
  end
  object edKode: TEdit
    Left = 132
    Top = 33
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object edID: TEdit
    Left = 132
    Top = 63
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edNama: TEdit
    Left = 132
    Top = 93
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edTglIjin: TcxDateEdit
    Left = 132
    Top = 154
    EditValue = 0d
    TabOrder = 4
    OnKeyPress = edTglIjinKeyPress
    Width = 257
  end
  object btnFind: TButton
    Left = 396
    Top = 32
    Width = 75
    Height = 55
    Caption = 'Search'
    TabOrder = 9
    OnClick = btnFindClick
  end
  object btnSave: TButton
    Left = 44
    Top = 277
    Width = 141
    Height = 61
    Caption = 'Simpan'
    TabOrder = 7
    OnClick = btnSaveClick
  end
  object edKeterangan: TEdit
    Left = 132
    Top = 181
    Width = 381
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    OnKeyPress = edKeteranganKeyPress
  end
  object edTglPengajuan: TcxDateEdit
    Left = 132
    Top = 123
    EditValue = 0d
    TabOrder = 3
    OnKeyPress = edTglPengajuanKeyPress
    Width = 257
  end
  object btnCancel: TButton
    Left = 344
    Top = 277
    Width = 141
    Height = 61
    Caption = 'Cancel'
    TabOrder = 8
    Visible = False
    OnClick = btnCancelClick
  end
  object edTagIjin: TcxLookupComboBox
    Left = 132
    Top = 216
    Properties.KeyFieldNames = 'tagid'
    Properties.ListColumns = <
      item
        FieldName = 'namatag'
      end>
    Properties.ListSource = dsTblTag
    TabOrder = 6
    Visible = False
    OnKeyPress = edTagIjinKeyPress
    Width = 381
  end
  object tblTag: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select tagid, namatag from ben_presensi_tag where tagid = '#39'IT'#39)
    Left = 492
    Top = 36
  end
  object dsTblTag: TDataSource
    DataSet = tblTag
    Left = 488
    Top = 92
  end
end
