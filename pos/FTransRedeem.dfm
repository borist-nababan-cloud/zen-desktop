object frmTransRedeem: TfrmTransRedeem
  Left = 308
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 453
  ClientWidth = 402
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 36
    Top = 84
    Width = 45
    Height = 15
    Caption = 'Trans ID'
  end
  object Label2: TLabel
    Left = 36
    Top = 60
    Width = 57
    Height = 15
    Caption = 'Redeem ID'
  end
  object Label3: TLabel
    Left = 36
    Top = 156
    Width = 42
    Height = 15
    Caption = 'Tanggal'
  end
  object Label4: TLabel
    Left = 36
    Top = 180
    Width = 36
    Height = 15
    Caption = 'Waktu'
  end
  object Label5: TLabel
    Left = 36
    Top = 108
    Width = 67
    Height = 15
    Caption = 'ID Customer'
  end
  object Label6: TLabel
    Left = 36
    Top = 132
    Width = 87
    Height = 15
    Caption = 'Nama Customer'
  end
  object Label7: TLabel
    Left = 36
    Top = 204
    Width = 84
    Height = 15
    Caption = 'Available Point'
  end
  object Label8: TLabel
    Left = 36
    Top = 228
    Width = 74
    Height = 15
    Caption = 'Redeem Point'
  end
  object Label9: TLabel
    Left = 40
    Top = 252
    Width = 55
    Height = 15
    Caption = 'Sisa Point'
  end
  object lblIDMembersRedeem: TLabel
    Left = 132
    Top = 104
    Width = 9
    Height = 15
    Caption = '...'
  end
  object edTransIDRedeem: TcxTextEdit
    Left = 128
    Top = 80
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 250
  end
  object edRedeemTrans: TcxTextEdit
    Left = 128
    Top = 56
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 250
  end
  object cxButton1: TcxButton
    Left = 4
    Top = 4
    Width = 75
    Height = 33
    Caption = 'OFF LINE'
    Enabled = False
    LookAndFeel.Kind = lfOffice11
    TabOrder = 2
  end
  object cxButton2: TcxButton
    Left = 84
    Top = 4
    Width = 75
    Height = 33
    Caption = 'ON LINE'
    Enabled = False
    LookAndFeel.Kind = lfOffice11
    TabOrder = 3
  end
  object edTanggalRedeem: TcxDateEdit
    Left = 128
    Top = 152
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 4
    Width = 250
  end
  object edWaktuRedeem: TcxTimeEdit
    Left = 128
    Top = 176
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 5
    Width = 250
  end
  object edIDCustomerRedeem: TcxTextEdit
    Left = 128
    Top = 272
    Properties.ReadOnly = True
    TabOrder = 6
    Visible = False
    Width = 250
  end
  object edNamaCustomerRedeem: TcxTextEdit
    Left = 128
    Top = 128
    TabOrder = 7
    Width = 250
  end
  object edAvailablePointRedeem: TcxCalcEdit
    Left = 128
    Top = 200
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 8
    Width = 250
  end
  object edRedeemPoint: TcxCalcEdit
    Left = 128
    Top = 224
    EditValue = 0
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = edRedeemPropertiesEditValueChanged
    TabOrder = 9
    Width = 250
  end
  object edSisaRedeem: TcxCalcEdit
    Left = 128
    Top = 248
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 10
    Width = 250
  end
  object Button1: TButton
    Left = 164
    Top = 8
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 11
    Visible = False
    OnClick = Button1Click
  end
  object cxButton3: TcxButton
    Left = 45
    Top = 301
    Width = 149
    Height = 57
    Caption = 'OK'
    Default = True
    LookAndFeel.Kind = lfOffice11
    TabOrder = 12
    OnClick = cxButton3Click
  end
  object cxButton4: TcxButton
    Left = 200
    Top = 296
    Width = 149
    Height = 61
    Caption = 'CANCEL'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 13
    OnClick = cxButton4Click
  end
end
