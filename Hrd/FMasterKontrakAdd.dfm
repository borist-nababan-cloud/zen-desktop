object frmMasterKontrakAdd: TfrmMasterKontrakAdd
  Left = 0
  Top = 0
  Caption = 'Add Master Kontrak'
  ClientHeight = 497
  ClientWidth = 402
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
    402
    497)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = -4
    Width = 394
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Master Kontrak Add'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 766
  end
  object Label16: TLabel
    Left = 16
    Top = 31
    Width = 33
    Height = 16
    Caption = 'Divisi'
  end
  object Label2: TLabel
    Left = 16
    Top = 61
    Width = 90
    Height = 16
    Caption = 'Nama Kontrak'
  end
  object Label3: TLabel
    Left = 16
    Top = 91
    Width = 89
    Height = 16
    Caption = 'Lama Kontrak'
  end
  object Label4: TLabel
    Left = 286
    Top = 91
    Width = 35
    Height = 16
    Caption = 'Bulan'
  end
  object Label5: TLabel
    Left = 16
    Top = 121
    Width = 65
    Height = 16
    Caption = 'Gaji Pokok'
  end
  object Label6: TLabel
    Left = 16
    Top = 239
    Width = 97
    Height = 16
    Caption = 'Tunjangan Lain'
  end
  object Label7: TLabel
    Left = 16
    Top = 151
    Width = 78
    Height = 16
    Caption = 'Uang Makan'
  end
  object Label8: TLabel
    Left = 16
    Top = 181
    Width = 40
    Height = 16
    Caption = 'Komisi'
  end
  object Label9: TLabel
    Left = 16
    Top = 211
    Width = 67
    Height = 16
    Caption = 'Tunjangan'
  end
  object Label10: TLabel
    Left = 286
    Top = 190
    Width = 22
    Height = 16
    Caption = ' % '
  end
  object Label11: TLabel
    Left = 16
    Top = 269
    Width = 43
    Height = 16
    Caption = 'Saving'
  end
  object Label12: TLabel
    Left = 16
    Top = 299
    Width = 56
    Height = 16
    Caption = 'Pot. Lain'
  end
  object lblKodeKontrak: TLabel
    Left = 22
    Top = 362
    Width = 16
    Height = 16
    Caption = '....'
  end
  object Label14: TLabel
    Left = 286
    Top = 151
    Width = 41
    Height = 16
    Caption = ' / hari'
  end
  object edDepartemen: TcxLookupComboBox
    Left = 130
    Top = 28
    Properties.KeyFieldNames = 'id_departemen'
    Properties.ListColumns = <
      item
        FieldName = 'nama_departemen'
      end>
    Properties.ListSource = frmMasterKontrak.dsTblDepartemen
    TabOrder = 0
    OnKeyPress = edDepartemenKeyPress
    Width = 255
  end
  object edNama: TEdit
    Left = 130
    Top = 58
    Width = 255
    Height = 24
    CharCase = ecUpperCase
    TabOrder = 1
    OnKeyPress = edNamaKeyPress
  end
  object edLama: TcxCalcEdit
    Left = 130
    Top = 88
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 2
    OnKeyPress = edLamaKeyPress
    Width = 150
  end
  object edGapok: TcxCalcEdit
    Left = 130
    Top = 118
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 3
    OnKeyPress = edGapokKeyPress
    Width = 150
  end
  object edTransport: TcxCalcEdit
    Left = 130
    Top = 236
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 7
    OnKeyPress = edTransportKeyPress
    Width = 150
  end
  object edUM: TcxCalcEdit
    Left = 130
    Top = 148
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 4
    OnKeyPress = edUMKeyPress
    Width = 150
  end
  object edKomisi: TcxCalcEdit
    Left = 130
    Top = 178
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#.#'
    Properties.UseThousandSeparator = True
    TabOrder = 5
    OnKeyPress = edKomisiKeyPress
    Width = 150
  end
  object edTunjangan: TcxCalcEdit
    Left = 130
    Top = 208
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 6
    OnKeyPress = edTunjanganKeyPress
    Width = 150
  end
  object edPotongan: TcxCalcEdit
    Left = 130
    Top = 266
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 8
    OnKeyPress = edPotonganKeyPress
    Width = 150
  end
  object ckAdmin: TcxCheckBox
    Left = 16
    Top = 330
    Caption = 'Is Admin'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsGrayed
    TabOrder = 10
    OnKeyPress = ckAdminKeyPress
  end
  object ckAktif: TcxCheckBox
    Left = 156
    Top = 330
    Caption = 'Aktif'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsGrayed
    TabOrder = 11
    OnKeyPress = ckAktifKeyPress
  end
  object btnSimpan: TButton
    Left = 16
    Top = 384
    Width = 121
    Height = 51
    Caption = 'Simpan'
    TabOrder = 12
    OnClick = btnSimpanClick
  end
  object btnCancel: TButton
    Left = 143
    Top = 384
    Width = 121
    Height = 51
    Caption = 'Cancel'
    TabOrder = 13
    OnClick = btnCancelClick
  end
  object edPot2: TcxCalcEdit
    Left = 130
    Top = 296
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.UseThousandSeparator = True
    TabOrder = 9
    OnKeyPress = edPot2KeyPress
    Width = 150
  end
end
