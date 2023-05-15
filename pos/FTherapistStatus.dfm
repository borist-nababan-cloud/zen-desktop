object frmTherapistStatus: TfrmTherapistStatus
  Left = 0
  Top = 0
  Caption = '  Therapist Status'
  ClientHeight = 639
  ClientWidth = 1151
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
    1151
    639)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulAtas: TLabel
    Left = 4
    Top = 4
    Width = 1143
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Therapist Status'
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
  object lblAutoRefresh: TLabel
    Left = 8
    Top = 36
    Width = 87
    Height = 16
    Caption = 'Auto Refresh'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 56
    Width = 1139
    Height = 517
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtvAbsen: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtvAbsenIDTR: TcxGridColumn
        Caption = 'ID TR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvAbsenNamaTR: TcxGridColumn
        Caption = 'Nama TR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object gtvAbsenDept: TcxGridColumn
        Caption = 'Dept'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        OnGetDataText = gtvAbsenDeptGetDataText
        GroupIndex = 0
        Width = 100
      end
      object gtvAbsenStatus: TcxGridColumn
        Caption = 'Status'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        SortIndex = 0
        SortOrder = soAscending
        Width = 125
      end
      object gtvAbsenSpecs: TcxGridColumn
        Caption = 'Specs'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        OnGetDataText = gtvAbsenSpecsGetDataText
        Width = 100
      end
      object gtvAbsenGroup: TcxGridColumn
        Caption = 'Group'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        SortIndex = 1
        SortOrder = soAscending
        Width = 75
      end
      object gtvAbsenNoUrut: TcxGridColumn
        Caption = 'No. Urut'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        SortIndex = 2
        SortOrder = soAscending
        Width = 75
      end
      object gtvAbsenTurun: TcxGridColumn
        Caption = 'Turun'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 75
      end
      object gtvAbsenNotes: TcxGridColumn
        Caption = 'Fp Time'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 70
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvAbsen
    end
  end
  object btnRefresh: TcxButton
    Left = 8
    Top = 579
    Width = 105
    Height = 46
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh'
    TabOrder = 1
    OnClick = btnRefreshClick
  end
  object cxButton2: TcxButton
    Left = 132
    Top = 579
    Width = 121
    Height = 46
    Anchors = [akLeft, akBottom]
    Caption = 'Change Status'
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 972
    Top = 60
  end
end
