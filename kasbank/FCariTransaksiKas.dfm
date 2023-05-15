object frmCariTransaksiKas: TfrmCariTransaksiKas
  Left = 0
  Top = 0
  Caption = 'Cari Transaksi Kas'
  ClientHeight = 400
  ClientWidth = 800
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    800
    400)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 2
    Top = 2
    Width = 794
    Height = 358
    Anchors = [akLeft, akTop, akRight, akBottom]
    PopupMenu = pmCari
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gtbCariTransaksiKas: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmDB.dsQryMaster
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 'Klik disini untuk melakukan filter data'
      FilterRow.Visible = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbCariTransaksiKasNoBukti: TcxGridDBColumn
        Caption = 'No Bukti'
        DataBinding.FieldName = 'id_transaksi'
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        SortIndex = 0
        SortOrder = soAscending
        Width = 150
      end
      object gtbCariTransaksiKasTgl: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Visible = False
        FooterAlignmentHorz = taRightJustify
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object gtbCariTransaksiKasTotal: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,0.#0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object gtbCariTransaksiKasStatus: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'status'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object gtbCariTransaksiKasUser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user_id'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object gtbCariTransaksiKasNotes: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbCariTransaksiKas
    end
  end
  object btnPilih: TcxButton
    Left = 358
    Top = 363
    Width = 78
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'Pilih'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 1
    OnClick = btnPilihClick
  end
  object pmCari: TPopupMenu
    Left = 676
    Top = 76
    object Expand1: TMenuItem
      Caption = 'Expand'
      OnClick = Expand1Click
    end
    object Collapse1: TMenuItem
      Caption = 'Collapse'
      OnClick = Collapse1Click
    end
  end
end
