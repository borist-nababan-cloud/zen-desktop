object frmChangeTR: TfrmChangeTR
  Left = 262
  Top = 125
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
  DesignSize = (
    854
    462)
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 0
    Top = 8
    Width = 833
    Height = 393
    TabOrder = 0
    object gtbTR: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.CancelOnExit = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbTRno_urut: TcxGridDBColumn
        Caption = 'No Urut'
        DataBinding.FieldName = 'no_urut'
        PropertiesClassName = 'TcxCalcEditProperties'
        SortIndex = 0
        SortOrder = soAscending
        Width = 50
      end
      object gtbTRid_therapist: TcxGridDBColumn
        DataBinding.FieldName = 'id_therapist'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 131
      end
      object gtbTRdepartemen: TcxGridDBColumn
        DataBinding.FieldName = 'departemen'
        PropertiesClassName = 'TcxTextEditProperties'
      end
      object gtbTRnama: TcxGridDBColumn
        DataBinding.FieldName = 'nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 150
      end
      object gtbTRtanggal: TcxGridDBColumn
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Visible = False
      end
      object gtbTRwaktu_masuk: TcxGridDBColumn
        DataBinding.FieldName = 'waktu_masuk'
        Visible = False
        Width = 79
      end
      object gtbTRstatus: TcxGridDBColumn
        DataBinding.FieldName = 'status'
        Width = 100
      end
      object gtbTRstart_time: TcxGridDBColumn
        DataBinding.FieldName = 'start_time'
        Visible = False
      end
      object gtbTRend_time: TcxGridDBColumn
        DataBinding.FieldName = 'end_time'
      end
      object gtbTRroom_id: TcxGridDBColumn
        DataBinding.FieldName = 'room_id'
        Width = 125
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbTR
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
  object qryTherapist: TMyQuery
    Connection = dmDB.dbInternal
    Left = 416
    Top = 232
  end
  object dsQryTherapist: TMyDataSource
    DataSet = qryTherapist
    Left = 420
    Top = 300
  end
end
