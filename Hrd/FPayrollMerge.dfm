object frmPayrollMerge: TfrmPayrollMerge
  Left = 0
  Top = 0
  ClientHeight = 340
  ClientWidth = 510
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
    510
    340)
  PixelsPerInch = 96
  TextHeight = 13
  object lblJudulForm: TLabel
    Left = -1
    Top = 0
    Width = 510
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  PAYROLL MERGE'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1174
  end
  object Label1: TLabel
    Left = 8
    Top = 35
    Width = 103
    Height = 13
    Caption = 'Select Full Periode'
  end
  object Label2: TLabel
    Left = 8
    Top = 62
    Width = 109
    Height = 13
    Caption = 'Select First Periode'
  end
  object lblProg1: TLabel
    Left = 12
    Top = 127
    Width = 9
    Height = 13
    Caption = '   '
  end
  object lblProg2: TLabel
    Left = 12
    Top = 142
    Width = 9
    Height = 13
    Caption = '   '
  end
  object edPeriode: TComboBox
    Left = 147
    Top = 32
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object edMerge: TComboBox
    Left = 147
    Top = 59
    Width = 177
    Height = 21
    TabOrder = 1
  end
  object cxButton1: TcxButton
    Left = 336
    Top = 32
    Width = 137
    Height = 49
    Caption = 'Merge'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object progBar: TcxProgressBar
    Left = 8
    Top = 100
    TabOrder = 3
    Width = 465
  end
  object memLog: TMemo
    Left = 12
    Top = 172
    Width = 461
    Height = 160
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
  end
end
