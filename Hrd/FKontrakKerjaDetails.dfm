object frmKontrakKerjaDetails: TfrmKontrakKerjaDetails
  Left = 0
  Top = 0
  ClientHeight = 543
  ClientWidth = 509
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
    509
    543)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 509
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Details Kontrak Kerja Karyawan'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 933
  end
  object Label5: TLabel
    Left = 15
    Top = 185
    Width = 79
    Height = 13
    Caption = 'Lama Kontrak'
  end
  object Label6: TLabel
    Left = 282
    Top = 189
    Width = 31
    Height = 13
    Caption = 'Bulan'
  end
  object Label7: TLabel
    Left = 15
    Top = 211
    Width = 60
    Height = 13
    Caption = 'Gaji Pokok'
  end
  object Label8: TLabel
    Left = 15
    Top = 306
    Width = 86
    Height = 13
    Caption = 'Tunjangan Lain'
  end
  object Label9: TLabel
    Left = 15
    Top = 237
    Width = 70
    Height = 13
    Caption = 'Uang Makan'
  end
  object Label10: TLabel
    Left = 15
    Top = 261
    Width = 37
    Height = 13
    Caption = 'Komisi'
  end
  object Label11: TLabel
    Left = 15
    Top = 284
    Width = 60
    Height = 13
    Caption = 'Tunjangan'
  end
  object Label12: TLabel
    Left = 295
    Top = 261
    Width = 19
    Height = 13
    Caption = ' % '
  end
  object Label13: TLabel
    Left = 15
    Top = 353
    Width = 38
    Height = 13
    Caption = 'Saving'
  end
  object Label26: TLabel
    Left = 15
    Top = 165
    Width = 98
    Height = 13
    Caption = 'Tgl Akhir Kontrak'
  end
  object Label28: TLabel
    Left = 15
    Top = 141
    Width = 74
    Height = 13
    Caption = 'Kontrak Baru'
  end
  object Label30: TLabel
    Left = 15
    Top = 380
    Width = 48
    Height = 13
    Caption = 'Pot. Lain'
  end
  object Label32: TLabel
    Left = 282
    Top = 237
    Width = 32
    Height = 13
    Caption = '/ Hari'
  end
  object Label2: TLabel
    Left = 15
    Top = 114
    Width = 76
    Height = 13
    Caption = 'Kode Kontrak'
  end
  object Label3: TLabel
    Left = 15
    Top = 32
    Width = 121
    Height = 23
    Caption = 'Kode Karyawan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 15
    Top = 61
    Width = 127
    Height = 23
    Caption = 'Nama Karyawan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 148
    Top = 32
    Width = 13
    Height = 23
    Caption = ' : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Left = 148
    Top = 61
    Width = 13
    Height = 23
    Caption = ' : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblKodeKaryawan: TLabel
    Left = 179
    Top = 32
    Width = 20
    Height = 23
    Caption = '....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNamaKaryawan: TLabel
    Left = 179
    Top = 61
    Width = 20
    Height = 23
    Caption = '....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 15
    Top = 402
    Width = 70
    Height = 13
    Caption = 'Type Payroll'
  end
  object Label17: TLabel
    Left = 15
    Top = 328
    Width = 100
    Height = 13
    Caption = 'BPJS / Tamb. Lain'
  end
  object Label18: TLabel
    Left = 15
    Top = 425
    Width = 22
    Height = 13
    Caption = 'THP'
  end
  object edLama: TcxCalcEdit
    Left = 127
    Top = 185
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 0
    Width = 150
  end
  object edGapok: TcxCalcEdit
    Left = 127
    Top = 208
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 1
    Width = 150
  end
  object edTransport: TcxCalcEdit
    Left = 127
    Top = 303
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 5
    Width = 150
  end
  object edUM: TcxCalcEdit
    Left = 127
    Top = 234
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 2
    Width = 150
  end
  object edKomisi: TcxCalcEdit
    Left = 127
    Top = 258
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#.#'
    Properties.UseThousandSeparator = True
    TabOrder = 3
    Width = 150
  end
  object edTunjangan: TcxCalcEdit
    Left = 127
    Top = 281
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 4
    Width = 150
  end
  object edPot1: TcxCalcEdit
    Left = 127
    Top = 350
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 7
    Width = 150
  end
  object Button1: TButton
    Left = 23
    Top = 449
    Width = 158
    Height = 81
    Caption = 'Update'
    TabOrder = 11
    OnClick = Button1Click
  end
  object btnCancel: TButton
    Left = 187
    Top = 449
    Width = 106
    Height = 81
    Caption = 'Cancel'
    TabOrder = 12
    OnClick = btnCancelClick
  end
  object edTglEnd: TcxDateEdit
    Left = 127
    Top = 162
    EditValue = 0d
    TabOrder = 13
    Width = 235
  end
  object edKodeKontrak: TcxLookupComboBox
    Left = 127
    Top = 138
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodekontrak'
    Properties.ListColumns = <
      item
        FieldName = 'namakontrak'
      end>
    Properties.ListSource = dsQryKontrak
    Properties.ReadOnly = True
    TabOrder = 14
    Width = 235
  end
  object edPot2: TcxCalcEdit
    Left = 127
    Top = 372
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 8
    Width = 150
  end
  object edNoKontrak: TEdit
    Left = 127
    Top = 111
    Width = 235
    Height = 21
    ReadOnly = True
    TabOrder = 15
  end
  object BitBtn1: TBitBtn
    Left = 374
    Top = 109
    Width = 106
    Height = 50
    Caption = 'Reset Default'
    TabOrder = 16
    OnClick = BitBtn1Click
  end
  object edTypePayroll: TcxLookupComboBox
    Left = 127
    Top = 399
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'autonum'
    Properties.ListColumns = <
      item
        FieldName = 'typepayroll'
      end>
    Properties.ListSource = dsTblType
    Properties.ReadOnly = False
    TabOrder = 9
    Width = 235
  end
  object edTambLain: TcxCalcEdit
    Left = 127
    Top = 325
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 6
    Width = 150
  end
  object edTHP: TcxCalcEdit
    Left = 127
    Top = 422
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 10
    Width = 235
  end
  object tblKontrak: TMyTable
    TableName = 'ben_hrd_kontrak_master'
    Connection = dmDB.dbInternal
    Left = 455
    Top = 29
  end
  object dsTblKontrak: TDataSource
    DataSet = tblKontrak
    Left = 455
    Top = 77
  end
  object qryKontrak: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select kodekontrak, departemen, namakontrak from ben_hrd_kontrak' +
        '_master')
    Left = 351
    Top = 33
  end
  object dsQryKontrak: TDataSource
    DataSet = qryKontrak
    Left = 351
    Top = 81
  end
  object tblDivisi: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 287
    Top = 33
  end
  object dsTblDivisi: TDataSource
    DataSet = tblDivisi
    Left = 287
    Top = 85
  end
  object tblType: TMyTable
    TableName = 'ben_payroll_type'
    Connection = dmDB.dbInternal
    Left = 403
    Top = 29
  end
  object dsTblType: TDataSource
    DataSet = tblType
    Left = 403
    Top = 77
  end
end
