object frmTherapisCall2: TfrmTherapisCall2
  Left = 0
  Top = 0
  Caption = '  Therapist Call'
  ClientHeight = 673
  ClientWidth = 1183
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1183
    673)
  PixelsPerInch = 96
  TextHeight = 18
  object lblJudulAtas: TLabel
    Left = 8
    Top = 4
    Width = 1167
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Therapist Call 2'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label1: TLabel
    Left = 8
    Top = 36
    Width = 90
    Height = 18
    Caption = 'Server Date'
  end
  object lblServerDate: TLabel
    Left = 176
    Top = 36
    Width = 90
    Height = 18
    Caption = 'Server Date'
  end
  object lblLastCheck: TLabel
    Left = 1085
    Top = 36
    Width = 90
    Height = 18
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = 'Server Date'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 68
    Width = 1167
    Height = 549
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object gtvCard: TcxGridCardView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      LayoutDirection = ldVertical
      OptionsView.CardAutoWidth = True
      OptionsView.CardBorderWidth = 10
      OptionsView.CardIndent = 7
      OptionsView.CardWidth = 750
      OptionsView.CategorySeparatorWidth = 10
      object gtvCardTRID: TcxGridCardViewRow
        Caption = 'ID Therapist'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BeginsLayer = True
      end
      object gtvCardRoom: TcxGridCardViewRow
        Caption = 'Room'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BeginsLayer = True
      end
      object gtvCardDetails: TcxGridCardViewRow
        Caption = 'Details'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BeginsLayer = True
      end
      object gtvCardNotes: TcxGridCardViewRow
        Caption = 'Additional'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BeginsLayer = True
      end
      object gtvCardTransID: TcxGridCardViewRow
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Position.BeginsLayer = True
      end
      object gtvCardTime: TcxGridCardViewRow
        Caption = 'Start'
        PropertiesClassName = 'TcxTimeEditProperties'
        Position.BeginsLayer = True
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvCard
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 948
    Top = 76
  end
end
