object frmMasterShiftAdd: TfrmMasterShiftAdd
  Left = 0
  Top = 0
  Caption = 'Add Master Shift'
  ClientHeight = 242
  ClientWidth = 365
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 59
    Width = 61
    Height = 13
    Caption = 'Nama Shift'
  end
  object Label2: TLabel
    Left = 16
    Top = 86
    Width = 64
    Height = 13
    Caption = 'Jam Masuk'
  end
  object Label3: TLabel
    Left = 16
    Top = 110
    Width = 63
    Height = 13
    Caption = 'Jam Keluar'
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 196
    Height = 26
    Caption = '  MASTER SHIFT FORM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edNamaShift: TEdit
    Left = 100
    Top = 56
    Width = 205
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edJMasuk: TcxTimeEdit
    Left = 100
    Top = 83
    EditValue = 0.5d
    TabOrder = 1
    Width = 205
  end
  object edJKeluar: TcxTimeEdit
    Left = 100
    Top = 107
    EditValue = 0.5d
    TabOrder = 2
    Width = 205
  end
  object ckAktif: TcxCheckBox
    Left = 184
    Top = 130
    Caption = 'Aktif'
    ParentFont = False
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 3
  end
  object btnSave: TButton
    Tag = 1
    Left = 32
    Top = 180
    Width = 89
    Height = 49
    Caption = 'SAVE'
    TabOrder = 4
    OnClick = btnSaveClick
  end
  object btnCancel: TButton
    Left = 172
    Top = 180
    Width = 89
    Height = 49
    Caption = 'CANCEL'
    TabOrder = 5
    OnClick = btnCancelClick
  end
  object btnUpdate: TButton
    Left = 46
    Top = 180
    Width = 75
    Height = 49
    Caption = 'Update'
    TabOrder = 6
    OnClick = btnUpdateClick
  end
  object ckOver: TcxCheckBox
    Left = 46
    Top = 129
    Caption = 'Over Night'
    ParentFont = False
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 7
  end
end
