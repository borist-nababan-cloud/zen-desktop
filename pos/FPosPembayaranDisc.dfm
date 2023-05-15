object frmPosPembayaranDisc: TfrmPosPembayaranDisc
  Left = 0
  Top = 0
  ClientHeight = 299
  ClientWidth = 635
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object Label2: TLabel
    Left = 12
    Top = 24
    Width = 146
    Height = 19
    Caption = 'Subtotal Payment'
  end
  object Label1: TLabel
    Left = 12
    Top = 57
    Width = 57
    Height = 19
    Caption = 'Disc %'
  end
  object Label3: TLabel
    Left = 12
    Top = 90
    Width = 95
    Height = 19
    Caption = 'Disc Rupiah'
  end
  object Label4: TLabel
    Left = 12
    Top = 181
    Width = 81
    Height = 19
    Caption = 'Total Disc'
  end
  object Label5: TLabel
    Left = 12
    Top = 148
    Width = 140
    Height = 19
    Caption = 'Addition Purpose'
  end
  object edSubtotal: TcxCalcEdit
    Left = 186
    Top = 21
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 203
  end
  object edDiscP: TcxCalcEdit
    Left = 186
    Top = 54
    OnFocusChanged = edDiscPFocusChanged
    EditValue = 0.000000000000000000
    Properties.ReadOnly = False
    Properties.OnEditValueChanged = edDiscPPropertiesEditValueChanged
    TabOrder = 1
    OnKeyPress = edDiscPKeyPress
    Width = 111
  end
  object edDiscR: TcxCalcEdit
    Left = 186
    Top = 87
    OnFocusChanged = edDiscRFocusChanged
    EditValue = 0.000000000000000000
    Properties.ReadOnly = False
    Properties.OnEditValueChanged = edDiscRPropertiesEditValueChanged
    TabOrder = 2
    OnKeyPress = edDiscRKeyPress
    Width = 203
  end
  object edTotDisc: TcxCalcEdit
    Left = 186
    Top = 178
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    TabOrder = 4
    Width = 327
  end
  object btnAdd: TcxButton
    Left = 186
    Top = 220
    Width = 163
    Height = 65
    Caption = 'Add'
    TabOrder = 5
    OnClick = btnAddClick
  end
  object edPurpose: TcxTextEdit
    Left = 186
    Top = 145
    OnFocusChanged = edPurposeFocusChanged
    TabOrder = 3
    TextHint = 'Input Addition Purpose'
    OnKeyPress = edPurposeKeyPress
    Width = 327
  end
end
