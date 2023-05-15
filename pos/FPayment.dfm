object frmPayment: TfrmPayment
  Left = 110
  Top = 169
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Payment'
  ClientHeight = 511
  ClientWidth = 834
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
    Left = 8
    Top = 12
    Width = 62
    Height = 15
    Caption = 'ID Payment'
  end
  object edPaymentID: TcxTextEdit
    Left = 84
    Top = 8
    TabOrder = 0
    Width = 121
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 240
    Width = 825
    Height = 193
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object gtvPayment: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtvPaymentColumn1: TcxGridColumn
        Caption = 'Room ID'
      end
      object gtvPaymentColumn2: TcxGridColumn
        Caption = 'Nama Customer'
        Width = 124
      end
      object gtvPaymentColumn3: TcxGridColumn
        Caption = 'Therapist ID'
        Width = 112
      end
      object gtvPaymentColumn4: TcxGridColumn
        Caption = 'GrandTotal'
        Width = 143
      end
      object gtvPaymentColumn5: TcxGridColumn
        Caption = 'SO ID'
        Width = 124
      end
      object gtvPaymentColumn6: TcxGridColumn
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvPayment
    end
  end
  object cxNavigator1: TcxNavigator
    Left = 4
    Top = 444
    Width = 300
    Height = 57
    Control = gtvPayment
    Buttons.CustomButtons = <>
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Insert.Visible = False
    Buttons.Delete.Hint = 'DELETE'
    Buttons.Edit.Visible = False
    Buttons.Post.Hint = 'SAVE'
    Buttons.Cancel.Visible = False
    Buttons.Refresh.Visible = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
end
