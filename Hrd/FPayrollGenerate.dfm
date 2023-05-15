object frmPayrollGenerate: TfrmPayrollGenerate
  Left = 0
  Top = 0
  ClientHeight = 213
  ClientWidth = 329
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
    329
    213)
  PixelsPerInch = 96
  TextHeight = 16
  object Label4: TLabel
    Left = -1
    Top = 0
    Width = 322
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  GENERATE PAYROLL PERIODE'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 657
  end
  object Label1: TLabel
    Left = 16
    Top = 52
    Width = 69
    Height = 16
    Caption = 'Start Date'
  end
  object Label2: TLabel
    Left = 16
    Top = 82
    Width = 58
    Height = 16
    Caption = 'End Date'
  end
  object Label3: TLabel
    Left = 16
    Top = 112
    Width = 87
    Height = 16
    Caption = 'Periode Kerja'
  end
  object edStart: TcxDateEdit
    Left = 116
    Top = 49
    EditValue = 0d
    Properties.OnChange = edStartPropertiesChange
    TabOrder = 0
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 116
    Top = 79
    EditValue = 0d
    Properties.OnChange = edEndPropertiesChange
    TabOrder = 1
    Width = 121
  end
  object btnPost: TButton
    Left = 116
    Top = 148
    Width = 105
    Height = 41
    Caption = 'GENERATE'
    TabOrder = 2
    OnClick = btnPostClick
  end
  object edPeriode: TcxCalcEdit
    Left = 116
    Top = 109
    EditValue = 0.000000000000000000
    TabOrder = 3
    Width = 121
  end
end
