object frmSelectTherapist: TfrmSelectTherapist
  Left = 0
  Top = 0
  ClientHeight = 499
  ClientWidth = 522
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  DesignSize = (
    522
    499)
  PixelsPerInch = 96
  TextHeight = 23
  object Label6: TLabel
    Left = 4
    Top = -1
    Width = 262
    Height = 29
    Caption = '  FORM SELECT THERAPIST'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 34
    Width = 510
    Height = 393
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 736
    ExplicitHeight = 271
    object gtbTR: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryTR
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbTRid_therapist: TcxGridDBColumn
        Caption = 'ID TR'
        DataBinding.FieldName = 'id_therapist'
        Width = 100
      end
      object gtbTRdepartemen: TcxGridDBColumn
        DataBinding.FieldName = 'departemen'
        Visible = False
        Width = 100
      end
      object gtbTRnama_karyawan: TcxGridDBColumn
        Caption = 'NAMA'
        DataBinding.FieldName = 'nama_karyawan'
        Width = 250
      end
      object gtbTRstatus: TcxGridDBColumn
        Caption = 'STATUS'
        DataBinding.FieldName = 'status'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbTR
    end
  end
  object btnNewTrans: TcxButton
    Left = 8
    Top = 436
    Width = 189
    Height = 55
    Anchors = [akLeft, akBottom]
    Caption = 'NEW MENU'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    TabOrder = 1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 314
  end
  object dsQryTR: TDataSource
    Left = 312
    Top = 64
  end
end
