object frmLaporanPayment: TfrmLaporanPayment
  Left = 0
  Top = 0
  Caption = 'Report Payment'
  ClientHeight = 525
  ClientWidth = 872
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object edStart: TcxDateEdit
    Left = 84
    Top = 16
    EditValue = 0d
    TabOrder = 0
    Width = 121
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 17
    Caption = 'Tanggal'
    Transparent = True
  end
  object cxDateEdit1: TcxDateEdit
    Left = 234
    Top = 16
    EditValue = 0d
    TabOrder = 2
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 211
    Top = 17
    Caption = ' - '
    Transparent = True
  end
  object cxGrid1: TcxGrid
    Left = 320
    Top = 184
    Width = 250
    Height = 200
    TabOrder = 4
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    Left = 664
    Top = 24
  end
  object DataSource1: TDataSource
    Left = 792
    Top = 32
  end
  object SaveDialog1: TSaveDialog
    Left = 572
    Top = 16
  end
end
