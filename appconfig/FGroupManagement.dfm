object frmGroupManagement: TfrmGroupManagement
  Left = 0
  Top = 0
  Caption = 'GROUP MANAGEMENT'
  ClientHeight = 499
  ClientWidth = 977
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
    977
    499)
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel1: TBevel
    Left = 357
    Top = 3
    Width = 17
    Height = 482
    Anchors = [akLeft, akTop, akBottom]
    Shape = bsLeftLine
    ExplicitHeight = 562
  end
  object Label1: TLabel
    Left = 8
    Top = 372
    Width = 116
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Add New User Group'
    ExplicitTop = 452
  end
  object Label2: TLabel
    Left = 8
    Top = 404
    Width = 70
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Group Name'
    ExplicitTop = 484
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 8
    Width = 337
    Height = 349
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    object gtbUser: TcxGridDBTableView
      OnDblClick = gtbUserDblClick
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      OnFocusedRecordChanged = gtbUserFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbUseridusersgroup: TcxGridDBColumn
        DataBinding.FieldName = 'idusersgroup'
        PropertiesClassName = 'TcxCalcEditProperties'
        Visible = False
        Width = 170
      end
      object gtbUsernamausersgroup: TcxGridDBColumn
        Caption = 'User Group'
        DataBinding.FieldName = 'namausersgroup'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 258
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbUser
    end
  end
  object edNamaGroup: TEdit
    Left = 84
    Top = 401
    Width = 257
    Height = 23
    Anchors = [akLeft, akBottom]
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object btnAddUsersGroup: TcxButton
    Left = 108
    Top = 430
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
  object cxButton2: TcxButton
    Left = 409
    Top = 425
    Width = 121
    Height = 43
    Anchors = [akLeft, akBottom]
    Caption = 'Add'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object cxGrid2: TcxGrid
    Left = 387
    Top = 57
    Width = 578
    Height = 355
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    Visible = False
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Black'
    object gtvAccess: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtvAccessAutonum: TcxGridColumn
        Caption = 'Autonum'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCalcEditProperties'
        Visible = False
        Width = 100
      end
      object gtvAccessUnitName: TcxGridColumn
        Caption = 'Access Name'
        Width = 250
      end
      object gtvAccessGroup: TcxGridColumn
        Caption = 'Unit Group'
        Visible = False
        Width = 100
      end
      object gtvAccessNotes: TcxGridColumn
        Caption = 'Notes'
        Width = 300
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = gtvAccess
    end
  end
  object btnLoadAccess: TcxButton
    Left = 387
    Top = 8
    Width = 121
    Height = 43
    Caption = 'Load Access'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 5
    OnClick = btnLoadAccessClick
  end
  object btnDeleteAkses: TcxButton
    Left = 536
    Top = 425
    Width = 121
    Height = 43
    Anchors = [akLeft, akBottom]
    Caption = 'Delete Access'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 6
    OnClick = btnDeleteAksesClick
  end
  object cxButton1: TcxButton
    Left = 514
    Top = 8
    Width = 121
    Height = 43
    Caption = 'Load Config'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 7
  end
end
