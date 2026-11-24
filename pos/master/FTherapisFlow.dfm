object frmTherapisFlow: TfrmTherapisFlow
  Left = 0
  Top = 0
  Caption = 'Therapis Flow'
  ClientHeight = 577
  ClientWidth = 1136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    1136
    577)
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 1124
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Therapist Flow'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1085
  end
  object panelRF: TPanel
    Left = 8
    Top = 40
    Width = 549
    Height = 458
    TabOrder = 0
    DesignSize = (
      549
      458)
    object Label2: TLabel
      Left = 12
      Top = 6
      Width = 161
      Height = 24
      Caption = 'List Therapis RF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxGrid2: TcxGrid
      Left = 8
      Top = 36
      Width = 529
      Height = 410
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitWidth = 1100
      ExplicitHeight = 172
      object gtvRF: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = gtvRFKodeKaryawan
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.Footer = True
        OptionsView.Indicator = True
        object gtvRFKodeKaryawan: TcxGridColumn
          Caption = 'Kode Karyawan'
          Options.Editing = False
          Width = 150
        end
        object gtvRFIDKaryawan: TcxGridColumn
          Caption = 'ID Finger'
          Options.Editing = False
          Width = 150
        end
        object gtvRFNama: TcxGridColumn
          Caption = 'Nama'
          Options.Editing = False
          Width = 150
        end
        object gtvRFGroup: TcxGridColumn
          Caption = 'Group'
          PropertiesClassName = 'TcxTextEditProperties'
          GroupIndex = 0
          SortIndex = 0
          SortOrder = soAscending
          Width = 150
        end
        object gtvRFNoUrut: TcxGridColumn
          Caption = 'No Urut'
          PropertiesClassName = 'TcxTextEditProperties'
          SortIndex = 1
          SortOrder = soAscending
          Width = 150
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = gtvRF
      end
    end
  end
  object pnlBM: TPanel
    Left = 572
    Top = 40
    Width = 556
    Height = 458
    TabOrder = 1
    DesignSize = (
      556
      458)
    object Label3: TLabel
      Left = 16
      Top = 10
      Width = 166
      Height = 24
      Caption = 'List Therapis BM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxGrid1: TcxGrid
      Left = 8
      Top = 40
      Width = 536
      Height = 411
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitWidth = 1100
      ExplicitHeight = 173
      object gtvBM: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = gtvBMKodeKaryawan
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.Footer = True
        OptionsView.Indicator = True
        object gtvBMKodeKaryawan: TcxGridColumn
          Caption = 'Kode Karyawan'
          Options.Editing = False
          Width = 150
        end
        object gtvBMIDKaryawan: TcxGridColumn
          Caption = 'ID Finger'
          Options.Editing = False
          Width = 150
        end
        object gtvBMNama: TcxGridColumn
          Caption = 'Nama'
          Options.Editing = False
          Width = 150
        end
        object gtvBMGroup: TcxGridColumn
          Caption = 'Group'
          PropertiesClassName = 'TcxTextEditProperties'
          GroupIndex = 0
          SortIndex = 0
          SortOrder = soAscending
          Width = 150
        end
        object gtvBMNoUrut: TcxGridColumn
          Caption = 'No Urut'
          PropertiesClassName = 'TcxTextEditProperties'
          SortIndex = 1
          SortOrder = soAscending
          Width = 150
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = gtvBM
      end
    end
  end
  object btnSave: TcxButton
    Left = 8
    Top = 504
    Width = 165
    Height = 57
    Anchors = [akLeft, akBottom]
    Caption = 'Save and Sync'
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object rbType: TcxRadioGroup
    Left = 192
    Top = 504
    Anchors = [akLeft, akBottom]
    Caption = 'Type Slot'
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'ATAS'
      end
      item
        Caption = 'BAWAH'
      end>
    ItemIndex = 0
    TabOrder = 3
    Height = 57
    Width = 269
  end
end
