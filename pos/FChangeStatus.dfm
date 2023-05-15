object frmChangeStatus: TfrmChangeStatus
  Left = 245
  Top = 122
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmChangeStatus'
  ClientHeight = 462
  ClientWidth = 854
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
  object cxGroupBox1: TcxGroupBox
    Left = 4
    Top = 4
    Caption = 'Therapist'
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    Style.Shadow = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Transparent = True
    Height = 145
    Width = 281
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 67
      Height = 15
      Caption = 'ID Therapist'
      Transparent = True
    end
    object Label2: TLabel
      Left = 8
      Top = 52
      Width = 92
      Height = 15
      Caption = 'Status Therapist'#39
      Transparent = True
    end
    object edTherapistID: TcxLookupComboBox
      Left = 88
      Top = 20
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'id_therapist'
      Properties.ListColumns = <
        item
          MinWidth = 75
          FieldName = 'id_therapist'
        end
        item
          MinWidth = 150
          FieldName = 'nama'
        end>
      Properties.ListSource = dmDB.dsTblTherapist
      TabOrder = 0
      Width = 145
    end
    object edStatusTherapist: TcxComboBox
      Left = 88
      Top = 48
      Properties.CharCase = ecUpperCase
      Properties.Items.Strings = (
        'AVAILABLE'
        'NOT AVAILABLE')
      TabOrder = 1
      Text = 'AVAILABLE'
      Width = 145
    end
    object cxButton1: TcxButton
      Left = 92
      Top = 76
      Width = 89
      Height = 33
      Caption = 'UPDATE'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 2
      OnClick = cxButton1Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 160
    Width = 854
    Height = 302
    Align = alBottom
    TabOrder = 1
    object gtbRuangan: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmDB.dsTblRuangan
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtbRuanganruangan_id
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbRuanganruangan_id: TcxGridDBColumn
        Caption = 'ROOM ID'
        DataBinding.FieldName = 'ruangan_id'
      end
      object gtbRuanganlantai: TcxGridDBColumn
        DataBinding.FieldName = 'lantai'
        Visible = False
      end
      object gtbRuangannomor: TcxGridDBColumn
        DataBinding.FieldName = 'nomor'
        Visible = False
      end
      object gtbRuanganjenis_jasa: TcxGridDBColumn
        Caption = 'Jenis Jasa'
        DataBinding.FieldName = 'jenis_jasa'
        Width = 99
      end
      object gtbRuangannotes: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'notes'
        Width = 128
      end
      object gtbRuangankondisi: TcxGridDBColumn
        DataBinding.FieldName = 'kondisi'
        Visible = False
      end
      object gtbRuangannama_cust: TcxGridDBColumn
        DataBinding.FieldName = 'nama_cust'
        Visible = False
      end
      object gtbRuanganstart_time: TcxGridDBColumn
        DataBinding.FieldName = 'start_time'
        Visible = False
      end
      object gtbRuanganend_time: TcxGridDBColumn
        DataBinding.FieldName = 'end_time'
        Visible = False
      end
      object gtbRuangantherapist_id: TcxGridDBColumn
        DataBinding.FieldName = 'therapist_id'
        Visible = False
      end
      object gtbRuangantrans_id: TcxGridDBColumn
        DataBinding.FieldName = 'trans_id'
        Visible = False
      end
      object gtbRuanganstatus: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'status'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'AVAILABLE'
          'NOT AVAILABLE')
        Width = 150
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbRuangan
    end
  end
end
