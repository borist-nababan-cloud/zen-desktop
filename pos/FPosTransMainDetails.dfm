object frmPosTransMainDetails: TfrmPosTransMainDetails
  Left = 0
  Top = 0
  Caption = '  Details Transaksi'
  ClientHeight = 222
  ClientWidth = 567
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label6: TLabel
    Left = 8
    Top = 8
    Width = 94
    Height = 23
    Caption = 'ID Transaksi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblKodeTrans: TLabel
    Left = 132
    Top = 8
    Width = 94
    Height = 23
    Caption = 'ID Transaksi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 201
    Top = 58
    Width = 86
    Height = 23
    Caption = 'Cust Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rbGender: TcxRadioGroup
    Left = 8
    Top = 52
    Caption = 'Select Gender'
    ParentFont = False
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'MALE'
      end
      item
        Caption = 'FEMALE'
      end>
    ItemIndex = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 61
    Width = 169
  end
  object edCustName: TcxTextEdit
    Left = 325
    Top = 55
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    TextHint = 'GUEST 1'
    Width = 222
  end
  object ckByRequest: TcxCheckBox
    Left = 201
    Top = 87
    Caption = 'By Request'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 2
  end
  object btnFinish: TcxButton
    Left = 120
    Top = 143
    Width = 121
    Height = 59
    Hint = 'SELESAI (CTRL + I)'
    Caption = 'SAVE'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnClick = btnFinishClick
  end
  object btnCancel: TcxButton
    Left = 247
    Top = 143
    Width = 121
    Height = 59
    Hint = 'BATAL (CTRL+N)'
    Caption = 'CANCEL'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    OnClick = btnCancelClick
  end
end
