object frmViewSakit: TfrmViewSakit
  Left = 221
  Top = 159
  Width = 907
  Height = 405
  BorderIcons = [biSystemMenu]
  Caption = 'View Data Karyawan Sakit / Izin'
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
    891
    367)
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 5
    Top = 4
    Width = 881
    Height = 317
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gtbSakit: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmDB.dsTblSakit
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Indicator = True
      object gtbSakitautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        VisibleForCustomization = False
      end
      object gtbSakittanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 73
      end
      object gtbSakitkaryawan_id: TcxGridDBColumn
        Caption = 'ID Karyawan'
        DataBinding.FieldName = 'karyawan_id'
        PropertiesClassName = 'TcxTextEditProperties'
      end
      object gtbSakitnama: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object gtbSakitid_penalti: TcxGridDBColumn
        Caption = 'ID Penalti'
        DataBinding.FieldName = 'id_penalti'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_penalti_presensi'
        Properties.ListColumns = <
          item
            FieldName = 'id_penalti_presensi'
          end>
        Properties.ListSource = dmDB.dsTblPenaltiPresensi
        Width = 200
      end
      object gtbSakitnotes: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbSakit
    end
  end
  object cxDBNavigator1: TcxDBNavigator
    Left = 4
    Top = 324
    Width = 252
    Height = 37
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Insert.Visible = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    DataSource = dmDB.dsTblSakit
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
end
