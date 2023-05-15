object frmChangeRoom: TfrmChangeRoom
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
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
  DesignSize = (
    854
    462)
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 4
    Top = 4
    Width = 801
    Height = 397
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gtbChangeRoom: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbChangeRoomruangan_id: TcxGridDBColumn
        Caption = 'RUANGAN ID'
        DataBinding.FieldName = 'ruangan_id'
        Width = 131
      end
      object gtbChangeRoomlantai: TcxGridDBColumn
        DataBinding.FieldName = 'lantai'
        Visible = False
        Width = 86
      end
      object gtbChangeRoomnomor: TcxGridDBColumn
        DataBinding.FieldName = 'nomor'
        Visible = False
      end
      object gtbChangeRoomjenis_jasa: TcxGridDBColumn
        DataBinding.FieldName = 'jenis_jasa'
        Visible = False
        Width = 50
      end
      object gtbChangeRoomnotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        Visible = False
      end
      object gtbChangeRoomkondisi: TcxGridDBColumn
        DataBinding.FieldName = 'kondisi'
        Visible = False
        Width = 75
      end
      object gtbChangeRoomnama_cust: TcxGridDBColumn
        DataBinding.FieldName = 'nama_cust'
        Visible = False
      end
      object gtbChangeRoomstart_time: TcxGridDBColumn
        DataBinding.FieldName = 'start_time'
        Visible = False
      end
      object gtbChangeRoomstatus: TcxGridDBColumn
        Caption = 'STATUS'
        DataBinding.FieldName = 'status'
        Visible = False
        GroupIndex = 0
        Width = 139
      end
      object gtbChangeRoomtherapist_id: TcxGridDBColumn
        Caption = 'ID THERAPIST'
        DataBinding.FieldName = 'therapist_id'
        Width = 100
      end
      object gtbChangeRoomend_time: TcxGridDBColumn
        Caption = 'END TIME'
        DataBinding.FieldName = 'end_time'
        Width = 120
      end
      object gtbChangeRoomtrans_id: TcxGridDBColumn
        DataBinding.FieldName = 'trans_id'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbChangeRoom
    end
  end
  object cxButton5: TcxButton
    Left = 0
    Top = 408
    Width = 153
    Height = 50
    Anchors = [akLeft, akBottom]
    Caption = 'SELECT'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 1
    OnClick = cxButton5Click
  end
  object qryChangeRoom: TMyQuery
    Connection = dmDB.dbInternal
    Left = 416
    Top = 232
  end
  object dsQryChangeRoom: TMyDataSource
    DataSet = qryChangeRoom
    Left = 420
    Top = 300
  end
end
