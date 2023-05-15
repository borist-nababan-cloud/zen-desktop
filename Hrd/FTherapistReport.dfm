object frmTherapistReport: TfrmTherapistReport
  Left = 0
  Top = 0
  Caption = '  Report Therapist'
  ClientHeight = 642
  ClientWidth = 1078
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1078
    642)
  PixelsPerInch = 96
  TextHeight = 14
  object lblJudulAtas: TLabel
    Left = 8
    Top = 2
    Width = 1062
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Report Therapist'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1057
  end
  object Label13: TLabel
    Left = 8
    Top = 73
    Width = 215
    Height = 19
    Caption = 'Quick Search ID Karyawan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 12
    Top = 41
    Width = 118
    Height = 19
    Caption = 'Select Periode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 114
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    DesignSize = (
      1057
      105)
    Height = 105
    Width = 1057
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 95
      Height = 14
      Caption = 'Kode Karyawan'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 78
      Height = 14
      Caption = 'ID Karyawan'
    end
    object Label3: TLabel
      Left = 16
      Top = 76
      Width = 97
      Height = 14
      Caption = 'Nama Karyawan'
    end
    object Label5: TLabel
      Left = 548
      Top = 20
      Width = 37
      Height = 14
      Caption = 'Group'
    end
    object Label6: TLabel
      Left = 548
      Top = 56
      Width = 51
      Height = 14
      Caption = 'No. Urut'
    end
    object lblNilai: TLabel
      Left = 936
      Top = 51
      Width = 101
      Height = 38
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edKode: TEdit
      Left = 127
      Top = 17
      Width = 185
      Height = 22
      ReadOnly = True
      TabOrder = 0
    end
    object edID: TEdit
      Left = 127
      Top = 45
      Width = 185
      Height = 22
      ReadOnly = True
      TabOrder = 1
    end
    object edNama: TEdit
      Left = 127
      Top = 73
      Width = 185
      Height = 22
      ReadOnly = True
      TabOrder = 2
    end
    object gbSpecs: TcxRadioGroup
      Left = 336
      Top = 12
      Caption = 'Level'
      Properties.Items = <
        item
          Caption = 'Medium'
          Value = 'M'
        end
        item
          Caption = 'Strong'
          Value = 'S'
        end>
      TabOrder = 3
      Height = 81
      Width = 185
    end
    object edRate: TdxRatingControl
      Left = 936
      Top = 12
      Anchors = [akTop, akRight]
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = True
      Properties.Step = 0.500000000000000000
      Rating = 1.000000000000000000
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 4
      Transparent = True
      Height = 33
      Width = 101
    end
    object edGroup: TEdit
      Left = 603
      Top = 17
      Width = 185
      Height = 22
      TabOrder = 5
    end
    object edSlot: TEdit
      Left = 603
      Top = 53
      Width = 185
      Height = 22
      TabOrder = 6
    end
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 236
    Width = 1062
    Height = 280
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object gtvDetails: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          OnGetText = gtvDetailsTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText
          Column = gtvDetailsrRating
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtvDetailsCode: TcxGridColumn
        Caption = 'Code'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 100
      end
      object gtvDetailsGroup: TcxGridColumn
        Caption = 'Group'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 150
      end
      object gtvDetailsHeader: TcxGridColumn
        Caption = 'Group'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 135
      end
      object gtvDetailsName: TcxGridColumn
        Caption = 'Variable Name'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 628
      end
      object gtvDetailsrRating: TcxGridColumn
        Caption = 'Rating'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TdxRatingControlProperties'
        Width = 150
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvDetails
    end
  end
  object edQuickSearch: TcxTextEdit
    Left = 244
    Top = 70
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 2
    TextHint = 'Type ID Karyawan and Press Enter'
    OnKeyPress = edQuickSearchKeyPress
    Width = 382
  end
  object edPeriode: TcxComboBox
    Left = 244
    Top = 34
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 382
  end
  object btnSearch: TcxButton
    Left = 636
    Top = 73
    Width = 45
    Height = 25
    Caption = '...'
    TabOrder = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnSearchClick
  end
  object edCatatan: TcxMemo
    Left = 8
    Top = 527
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 5
    Height = 97
    Width = 770
  end
  object btnSave: TcxButton
    Left = 784
    Top = 555
    Width = 129
    Height = 69
    Anchors = [akRight, akBottom]
    Caption = 'Save Report'
    TabOrder = 6
    OnClick = btnSaveClick
  end
  object cxButton2: TcxButton
    Left = 950
    Top = 558
    Width = 115
    Height = 69
    Anchors = [akRight, akBottom]
    Caption = 'Lock Report'
    TabOrder = 7
  end
  object Button1: TButton
    Left = 896
    Top = 45
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 8
    Visible = False
    OnClick = Button1Click
  end
  object btnUnlock: TcxButton
    Left = 950
    Top = 522
    Width = 115
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Un-Lock Report'
    TabOrder = 9
    Visible = False
  end
end
