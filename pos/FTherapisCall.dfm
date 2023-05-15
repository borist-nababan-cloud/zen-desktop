object frmTherapisCall: TfrmTherapisCall
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
    Caption = '  Therapist Call'
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
    TabOrder = 0
    object gtvCall: TcxGridBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.BandSizing = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Options.HoldOwnColumnsOnly = True
          Options.Sizing = False
          Width = 150
        end
        item
        end>
      object gtvCallTRID: TcxGridBandedColumn
        Caption = 'TR ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvCallRoomID: TcxGridBandedColumn
        Caption = 'ROOM ID'
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvCallCustomer: TcxGridBandedColumn
        Caption = 'CUST NAME'
        Visible = False
        Width = 150
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvCallTransID: TcxGridBandedColumn
        Caption = 'ID TRANS'
        Visible = False
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvCallDetails: TcxGridBandedColumn
        Caption = 'JASA'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvCallAdd: TcxGridBandedColumn
        Caption = 'ADD'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvCall
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 948
    Top = 76
  end
end
