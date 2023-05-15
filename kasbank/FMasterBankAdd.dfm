object frmMasterBankAdd: TfrmMasterBankAdd
  Left = 0
  Top = 0
  Caption = '  Master Bank Add'
  ClientHeight = 330
  ClientWidth = 504
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
    504
    330)
  PixelsPerInch = 96
  TextHeight = 16
  object Label4: TLabel
    Left = 4
    Top = 4
    Width = 492
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Master Bank Add'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 515
  end
  object Label2: TLabel
    Left = 4
    Top = 55
    Width = 70
    Height = 16
    Caption = 'Nama Bank'
  end
  object Label3: TLabel
    Left = 4
    Top = 82
    Width = 83
    Height = 16
    Caption = 'No. Rekening'
  end
  object Label5: TLabel
    Left = 4
    Top = 109
    Width = 106
    Height = 16
    Caption = 'Pemilik Rekening'
  end
  object Label6: TLabel
    Left = 4
    Top = 136
    Width = 67
    Height = 16
    Caption = 'Kode Bank'
  end
  object edNama: TEdit
    Left = 124
    Top = 52
    Width = 353
    Height = 24
    CharCase = ecUpperCase
    TabOrder = 0
    TextHint = 'Isikan tanpa Text ..BANK..'
    OnChange = edNamaChange
    OnKeyPress = edNamaKeyPress
  end
  object edNorek: TEdit
    Left = 124
    Top = 79
    Width = 353
    Height = 24
    CharCase = ecUpperCase
    NumbersOnly = True
    TabOrder = 1
    OnChange = edNorekChange
    OnKeyPress = edNorekKeyPress
  end
  object edPemilik: TEdit
    Left = 124
    Top = 106
    Width = 353
    Height = 24
    CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = edPemilikKeyPress
  end
  object edKodeBank: TEdit
    Left = 124
    Top = 133
    Width = 238
    Height = 24
    CharCase = ecUpperCase
    ReadOnly = True
    TabOrder = 3
    TextHint = 'AUTOGENERATE'
  end
  object btnAuto: TButton
    Left = 368
    Top = 133
    Width = 75
    Height = 25
    Caption = 'Generate'
    TabOrder = 4
    OnClick = btnAutoClick
  end
  object btnSimpan: TButton
    Left = 69
    Top = 220
    Width = 101
    Height = 54
    Caption = 'Simpan'
    TabOrder = 5
    OnClick = btnSimpanClick
  end
  object btnCancel: TButton
    Left = 261
    Top = 220
    Width = 101
    Height = 54
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = btnCancelClick
  end
  object ckEDC: TcxCheckBox
    Left = 8
    Top = 172
    Caption = 'As EDC'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 7
  end
  object ckAktif: TcxCheckBox
    Left = 124
    Top = 172
    Caption = 'Aktif'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsChecked
    TabOrder = 8
  end
end
