object frmGroupAccessAdd: TfrmGroupAccessAdd
  Left = 0
  Top = 0
  Caption = 'ADD GROUP ACCESS'
  ClientHeight = 521
  ClientWidth = 868
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  DesignSize = (
    868
    521)
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid2: TcxGrid
    Left = 5
    Top = 8
    Width = 854
    Height = 433
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    object gtvAvailable: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtvAvailableAutonum: TcxGridColumn
        Caption = 'Autonum'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCalcEditProperties'
        Visible = False
        Width = 100
      end
      object gtvAvailableGroup: TcxGridColumn
        Caption = 'Unit Group'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Width = 100
      end
      object gtvAvailableUnitName: TcxGridColumn
        Caption = 'Access Name'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 300
      end
      object gtvAvailableNotes: TcxGridColumn
        Caption = 'Notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 400
      end
      object gtvAvailableAdd: TcxGridColumn
        Caption = 'Add'
        PropertiesClassName = 'TcxCheckBoxProperties'
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = gtvAvailable
    end
  end
  object cxButton2: TcxButton
    Left = 8
    Top = 458
    Width = 121
    Height = 43
    Anchors = [akLeft, akBottom]
    Caption = 'Add Access'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 1
    OnClick = cxButton2Click
  end
end
