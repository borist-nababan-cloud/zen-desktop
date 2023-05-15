object frmReportPeriode: TfrmReportPeriode
  Left = 0
  Top = 0
  Caption = '  Generate Report Periode'
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
    Caption = '  Generate Report Periode'
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
  object strukturPromo: TMemo
    Left = 144
    Top = 60
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `ben_report_periode` ('
      '  `autonum` int(3) NOT NULL AUTO_INCREMENT,'
      '  `kodereport` varchar(30) NOT NULL DEFAULT '#39#39','
      '  `aktif` char(1) NOT NULL DEFAULT '#39'Y'#39','
      '  `lastedituser` varchar(30) DEFAULT NULL,'
      
        '  `lasteditdate` datetime NOT NULL DEFAULT '#39'2019-01-01 01:00:00'#39 +
        ','
      '  PRIMARY KEY (`autonum`)'
      ') ENGINE=MyISAM DEFAULT CHARSET=latin1;')
    ScrollBars = ssBoth
    TabOrder = 4
    Visible = False
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
