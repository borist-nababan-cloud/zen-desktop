object frmPosMainMenuInput: TfrmPosMainMenuInput
  Left = 0
  Top = 0
  Caption = '  Main Menu Input'
  ClientHeight = 464
  ClientWidth = 635
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    635
    464)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 623
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = ' Main Menu Input'
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
  object rbType: TRadioGroup
    Left = 8
    Top = 36
    Width = 619
    Height = 41
    Caption = 'Type Menu'
    Columns = 4
    Items.Strings = (
      'Jasa'
      'Additional'
      'Produk')
    TabOrder = 0
    TabStop = True
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 101
    Caption = 'Kode Menu'
    Transparent = True
  end
  object edKode: TcxTextEdit
    Left = 108
    Top = 100
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 289
  end
  object edJenis: TcxComboBox
    Left = 108
    Top = 130
    Properties.CharCase = ecUpperCase
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      'BM'
      'RF')
    TabOrder = 3
    Width = 289
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 132
    Caption = 'Jenis Jasa'
    Transparent = True
  end
  object cxLabel3: TcxLabel
    Left = 403
    Top = 128
    Caption = 'Abaikan Field ini jika menu bukan jasa'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -9
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold, fsUnderline]
    Style.TextColor = clRed
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel4: TcxLabel
    Left = 403
    Top = 144
    Caption = 'atau addtional'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -9
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold, fsUnderline]
    Style.TextColor = clRed
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 161
    Caption = 'Nama Menu'
    Transparent = True
  end
  object edNamaMenu: TcxTextEdit
    Left = 108
    Top = 160
    Properties.CharCase = ecUpperCase
    TabOrder = 8
    Width = 519
  end
  object edHargaUtama: TcxCalcEdit
    Left = 108
    Top = 190
    OnFocusChanged = edHargaUtamaFocusChanged
    EditValue = 0.000000000000000000
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = edHargaUtamaPropertiesEditValueChanged
    TabOrder = 9
    Width = 201
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 191
    Caption = 'Harga Utama'
    Transparent = True
  end
  object cxLabel7: TcxLabel
    Left = 340
    Top = 191
    Caption = 'Lama'
    Transparent = True
  end
  object edLama: TcxCalcEdit
    Left = 440
    Top = 190
    EditValue = 0.000000000000000000
    Properties.UseThousandSeparator = True
    TabOrder = 12
    Width = 121
  end
  object cxLabel8: TcxLabel
    Left = 8
    Top = 221
    Caption = 'Happy Hour'
    Transparent = True
  end
  object edDiscHH: TcxCalcEdit
    Left = 108
    Top = 220
    OnFocusChanged = edDiscHHFocusChanged
    EditValue = 0.000000000000000000
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = edDiscHHPropertiesEditValueChanged
    TabOrder = 14
    Width = 65
  end
  object cxLabel9: TcxLabel
    Left = 179
    Top = 221
    Caption = ' %  =  '
    Transparent = True
  end
  object edHargaHH: TcxCalcEdit
    Left = 228
    Top = 220
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 16
    Width = 147
  end
  object cxLabel10: TcxLabel
    Left = 8
    Top = 248
    Caption = 'Normal'
    Transparent = True
  end
  object edDiscNormal: TcxCalcEdit
    Left = 108
    Top = 247
    OnFocusChanged = edDiscNormalFocusChanged
    EditValue = 0.000000000000000000
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = edDiscNormalPropertiesEditValueChanged
    TabOrder = 18
    Width = 65
  end
  object cxLabel11: TcxLabel
    Left = 179
    Top = 248
    Caption = ' %  =  '
    Transparent = True
  end
  object edHargaNormal: TcxCalcEdit
    Left = 228
    Top = 247
    OnFocusChanged = edHargaNormalFocusChanged
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 20
    Width = 147
  end
  object ckKeterangan: TcxCheckBox
    Left = 8
    Top = 312
    Caption = 'Cetak Keterangan Pada Bill'
    Properties.ValueChecked = 'Y'
    Properties.ValueGrayed = 'N'
    Properties.ValueUnchecked = 'N'
    TabOrder = 21
  end
  object edKeterangan: TcxTextEdit
    Left = 108
    Top = 277
    TabOrder = 22
    Width = 519
  end
  object cxLabel12: TcxLabel
    Left = 8
    Top = 278
    Caption = 'Keterangan'
    Transparent = True
  end
  object ckAktif: TcxCheckBox
    Left = 8
    Top = 342
    Caption = 'Aktif'
    ParentFont = False
    Properties.ValueChecked = 'Y'
    Properties.ValueGrayed = 'N'
    Properties.ValueUnchecked = 'N'
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 24
  end
  object btnSimpan: TcxButton
    Left = 140
    Top = 376
    Width = 105
    Height = 50
    Caption = 'Save'
    TabOrder = 25
    OnClick = btnSimpanClick
  end
  object cxButton2: TcxButton
    Left = 380
    Top = 376
    Width = 105
    Height = 50
    Caption = 'Cancel'
    TabOrder = 26
    OnClick = cxButton2Click
  end
  object ckBaverage: TcxCheckBox
    Left = 216
    Top = 312
    Caption = 'As Baverage'
    Properties.ValueChecked = 'Y'
    Properties.ValueGrayed = 'N'
    Properties.ValueUnchecked = 'N'
    TabOrder = 27
  end
  object cdRedeem: TcxCheckBox
    Left = 332
    Top = 312
    Caption = 'Can Redeem'
    Properties.ValueChecked = 'Y'
    Properties.ValueGrayed = 'N'
    Properties.ValueUnchecked = 'N'
    TabOrder = 28
    Visible = False
  end
  object ckDiscount: TcxCheckBox
    Left = 440
    Top = 312
    Caption = 'Can Discount'
    Properties.ValueChecked = 'Y'
    Properties.ValueGrayed = 'N'
    Properties.ValueUnchecked = 'N'
    TabOrder = 29
    Visible = False
  end
end
