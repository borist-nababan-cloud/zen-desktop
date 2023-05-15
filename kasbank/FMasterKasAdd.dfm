object frmMasterKasAdd: TfrmMasterKasAdd
  Left = 0
  Top = 0
  ClientHeight = 220
  ClientWidth = 501
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
    501
    220)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 493
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  MASTER KAS ADD'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 646
  end
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 35
    Height = 13
    Caption = 'Outlet'
  end
  object Label2: TLabel
    Left = 8
    Top = 75
    Width = 55
    Height = 13
    Caption = 'Nama Kas'
  end
  object Label6: TLabel
    Left = 8
    Top = 102
    Width = 51
    Height = 13
    Caption = 'Kode Kas'
  end
  object edOutlet: TcxLookupComboBox
    Left = 111
    Top = 45
    Properties.KeyFieldNames = 'kodeoutlet'
    Properties.ListColumns = <
      item
        FieldName = 'namaoutlet'
      end>
    Properties.ListSource = frmMasterKas.dsTblOutlet
    TabOrder = 0
    OnKeyPress = edOutletKeyPress
    Width = 145
  end
  object edNama: TEdit
    Left = 111
    Top = 72
    Width = 353
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    TextHint = 'Isikan tanpa Text ..BANK..'
    OnKeyPress = edNamaKeyPress
  end
  object edKodeKas: TEdit
    Left = 111
    Top = 99
    Width = 238
    Height = 21
    CharCase = ecUpperCase
    ReadOnly = True
    TabOrder = 2
    TextHint = 'AUTOGENERATE'
  end
  object btnAuto: TButton
    Left = 355
    Top = 99
    Width = 75
    Height = 25
    Caption = 'Auto'
    TabOrder = 3
    OnClick = btnAutoClick
  end
  object btnSimpan: TButton
    Left = 56
    Top = 136
    Width = 101
    Height = 54
    Caption = 'Simpan'
    TabOrder = 4
    OnClick = btnSimpanClick
  end
  object btnCancel: TButton
    Left = 248
    Top = 136
    Width = 101
    Height = 54
    Caption = 'Cancel'
    TabOrder = 5
  end
end
