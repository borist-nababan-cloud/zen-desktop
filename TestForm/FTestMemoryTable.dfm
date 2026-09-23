object frmTestMemoryTable: TfrmTestMemoryTable
  Left = 0
  Top = 0
  Caption = 'frmTestMemoryTable'
  ClientHeight = 449
  ClientWidth = 998
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    998
    449)
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 8
    Top = 8
    Width = 97
    Height = 53
    Caption = 'cxButton1'
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 8
    Top = 67
    Width = 537
    Height = 309
    Anchors = [akLeft, akTop, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object edScan: TcxTextEdit
    Left = 119
    Top = 8
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 466
  end
  object memResult: TMemo
    Left = 551
    Top = 67
    Width = 430
    Height = 309
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'memResult')
    TabOrder = 3
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'data'
    Left = 776
    Top = 64
  end
end
