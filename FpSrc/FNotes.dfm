object frmNotes: TfrmNotes
  Left = 0
  Top = 0
  Caption = 'Notes Finger Scan'
  ClientHeight = 356
  ClientWidth = 734
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    734
    356)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 312
    Width = 39
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Penulis'
  end
  object Memo1: TMemo
    Left = 16
    Top = 12
    Width = 697
    Height = 277
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object edPenulis: TEdit
    Left = 132
    Top = 309
    Width = 265
    Height = 23
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object btnAddUsersGroup: TcxButton
    Left = 420
    Top = 301
    Width = 121
    Height = 43
    Anchors = [akLeft, akBottom]
    Caption = 'Add'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 2
    OnClick = btnAddUsersGroupClick
  end
end
