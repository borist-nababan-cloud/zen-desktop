object frmRepTopRequest: TfrmRepTopRequest
  Left = 0
  Top = 0
  Caption = 'Report Top Request'
  ClientHeight = 464
  ClientWidth = 911
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    911
    464)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 899
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '   Laporan Top Request'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1161
  end
  object Label2: TLabel
    Left = 8
    Top = 47
    Width = 34
    Height = 16
    Caption = 'FROM'
  end
  object Label3: TLabel
    Left = 200
    Top = 47
    Width = 25
    Height = 16
    Caption = ' TO '
  end
  object edStart: TcxDateEdit
    Left = 60
    Top = 44
    EditValue = 0d
    TabOrder = 0
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 251
    Top = 44
    EditValue = 0d
    TabOrder = 1
    Width = 121
  end
  object cxButton2: TcxButton
    Left = 388
    Top = 36
    Width = 101
    Height = 42
    Caption = 'Load'
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object cxButton1: TcxButton
    Left = 500
    Top = 36
    Width = 101
    Height = 42
    Caption = 'Export'
    TabOrder = 3
    OnClick = cxButton1Click
  end
  object pgLaporanRequest: TcxPageControl
    Left = 4
    Top = 80
    Width = 895
    Height = 376
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    Properties.ActivePage = pgDetails
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 373
    ClientRectLeft = 2
    ClientRectRight = 892
    ClientRectTop = 30
    object pgDetails: TcxTabSheet
      Caption = 'Details'
      ImageIndex = 0
      DesignSize = (
        890
        343)
      object cxGrid1: TcxGrid
        Left = 8
        Top = 8
        Width = 879
        Height = 329
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object gtvList: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Kind = skSum
              Position = spFooter
              Column = gtvListTotal
            end
            item
              Kind = skCount
              Position = spFooter
              Column = gtvListIDTR
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              Column = gtvListTotal
            end
            item
              Kind = skCount
              Column = gtvListIDTR
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsSelection.MultiSelect = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object gtvListIDTR: TcxGridColumn
            Caption = 'ID TR'
            Width = 100
          end
          object gtvListNama: TcxGridColumn
            Caption = 'Nama Karyawan'
            Width = 250
          end
          object gtvListTotal: TcxGridColumn
            Caption = 'Total'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCalcEditProperties'
            Width = 100
          end
          object gtvListTanggal: TcxGridColumn
            Caption = 'Tanggal'
            DataBinding.ValueType = 'DateTime'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 100
          end
          object gtvListIDTrans: TcxGridColumn
            Caption = 'ID Trans'
            Width = 100
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = gtvList
        end
      end
    end
    object pgSummary: TcxTabSheet
      Caption = 'Summary'
      ImageIndex = 1
      DesignSize = (
        890
        343)
      object cxGrid2: TcxGrid
        Left = 11
        Top = 12
        Width = 879
        Height = 329
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object gtvSummary: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Kind = skSum
              Position = spFooter
              Column = gtvSummaryTotal
            end
            item
              Kind = skCount
              Position = spFooter
              Column = gtvSummaryID
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              Column = gtvSummaryTotal
            end
            item
              Kind = skCount
              Column = gtvSummaryID
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsSelection.MultiSelect = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object gtvSummaryID: TcxGridColumn
            Caption = 'ID TR'
            Width = 100
          end
          object gtvSummaryNama: TcxGridColumn
            Caption = 'Nama Karyawan'
            Width = 250
          end
          object gtvSummaryTotal: TcxGridColumn
            Caption = 'Total'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCalcEditProperties'
            Width = 100
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = gtvSummary
        end
      end
    end
  end
  object dlgSave: TSaveDialog
    Left = 868
    Top = 8
  end
end
