object frmTherapist: TfrmTherapist
  Left = 204
  Top = 132
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 472
  ClientWidth = 964
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    964
    472)
  PixelsPerInch = 96
  TextHeight = 15
  object cxButton1: TcxButton
    Left = 0
    Top = 8
    Width = 101
    Height = 37
    Caption = 'View Available'
    TabOrder = 0
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfOffice11
  end
  object cxButton2: TcxButton
    Left = 104
    Top = 8
    Width = 101
    Height = 37
    Caption = 'View View All'
    TabOrder = 1
    OnClick = cxButton2Click
    LookAndFeel.Kind = lfOffice11
  end
  object cxGrid3: TcxGrid
    Left = 4
    Top = 48
    Width = 948
    Height = 421
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    object gtbTherapist: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmDB.dsQryTherapist
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'AVAILABLE THERAPIST'
        end>
      object gtbTherapistid_therapist: TcxGridDBBandedColumn
        Caption = 'ID'
        DataBinding.FieldName = 'id_therapist'
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtbTherapistdepartemen: TcxGridDBBandedColumn
        DataBinding.FieldName = 'departemen'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtbTherapistnama: TcxGridDBBandedColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtbTherapistno_urut: TcxGridDBBandedColumn
        Caption = 'NO Urut'
        DataBinding.FieldName = 'no_urut'
        SortIndex = 2
        SortOrder = soAscending
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtbTherapisttanggal: TcxGridDBBandedColumn
        DataBinding.FieldName = 'tanggal'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtbTherapistwaktu_masuk: TcxGridDBBandedColumn
        DataBinding.FieldName = 'waktu_masuk'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtbTherapiststatus: TcxGridDBBandedColumn
        DataBinding.FieldName = 'status'
        Visible = False
        GroupIndex = 0
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object gtbTherapiststart_time: TcxGridDBBandedColumn
        DataBinding.FieldName = 'start_time'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtbTherapistend_time: TcxGridDBBandedColumn
        Caption = 'End Time'
        DataBinding.FieldName = 'end_time'
        PropertiesClassName = 'TcxTimeEditProperties'
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object gtbTherapistroom_id: TcxGridDBBandedColumn
        Caption = 'Ruangan'
        DataBinding.FieldName = 'room_id'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object gtbTherapistCounter: TcxGridDBBandedColumn
        Caption = 'Jumlah Jasa'
        DataBinding.ValueType = 'String'
        PropertiesClassName = 'TcxTextEditProperties'
        SortIndex = 1
        SortOrder = soAscending
        Width = 90
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtbTherapistSchedule: TcxGridDBBandedColumn
        Caption = 'Schedule'
        DataBinding.ValueType = 'String'
        PropertiesClassName = 'TcxTextEditProperties'
        SortIndex = 0
        SortOrder = soAscending
        Width = 106
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object gtbTherapistFlag: TcxGridDBBandedColumn
        Caption = '...'
        PropertiesClassName = 'TcxColorComboBoxProperties'
        Properties.CustomColors = <>
        Width = 24
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object gtvTherapist: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtvTherapistFlag: TcxGridColumn
        Caption = '...'
        PropertiesClassName = 'TcxColorComboBoxProperties'
        Properties.CustomColors = <>
        Properties.ShowDescriptions = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 20
      end
      object gtvTherapistUrutan: TcxGridColumn
        Caption = 'No. '
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCalcEditProperties'
        HeaderAlignmentHorz = taCenter
        SortIndex = 1
        SortOrder = soAscending
        Width = 31
      end
      object gtvTherapistID: TcxGridColumn
        Caption = 'ID '
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 83
      end
      object gtvTherapistSchedule: TcxGridColumn
        Caption = 'Schedule Masuk'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxTimeEditProperties'
        Visible = False
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        SortIndex = 0
        SortOrder = soAscending
        Width = 103
      end
      object gtvTherapistDepartemen: TcxGridColumn
        Caption = 'Dept'
        HeaderAlignmentHorz = taCenter
        Width = 89
      end
      object gtvTherapistNama: TcxGridColumn
        Caption = 'Nama'
        HeaderAlignmentHorz = taCenter
        Width = 119
      end
      object gtvTherapistStatus: TcxGridColumn
        Caption = 'Status'
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object gtvTherapistCounter: TcxGridColumn
        Caption = 'Count'
        PropertiesClassName = 'TcxCalcEditProperties'
        HeaderAlignmentHorz = taCenter
        SortIndex = 2
        SortOrder = soAscending
        Width = 116
      end
      object gtvTherapistType: TcxGridColumn
        Caption = 'Type'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
      end
      object gtvTherapistSex: TcxGridColumn
        Caption = 'Sex'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 52
      end
      object gtvTherapistEndTime: TcxGridColumn
        Caption = 'End Time'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxTimeEditProperties'
        HeaderAlignmentHorz = taCenter
      end
      object gtvTherapistTest: TcxGridColumn
        Caption = 'Test'
        Visible = False
        Width = 60
      end
    end
    object cxGrid3Level1: TcxGridLevel
      GridView = gtvTherapist
    end
  end
end
