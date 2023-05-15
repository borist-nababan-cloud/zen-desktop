object frmBuyAdditional: TfrmBuyAdditional
  Left = 213
  Top = 139
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 389
  ClientWidth = 688
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    688
    389)
  PixelsPerInch = 96
  TextHeight = 13
  object lblPaket: TLabel
    Left = 644
    Top = 300
    Width = 38
    Height = 13
    Anchors = [akTop, akRight, akBottom]
    Caption = 'lblPaket'
  end
  object Label5: TLabel
    Left = 0
    Top = 359
    Width = 688
    Height = 30
    Align = alBottom
    AutoSize = False
    Caption = 'Gunakan SHIFT Untuk Shortcut'
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 4
    Width = 677
    Height = 293
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gtbAdditional: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmDB.dsTblAdditional
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
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'ADDITIONAL '
          Width = 505
        end>
      object gtbAdditionalid_add: TcxGridDBBandedColumn
        Caption = 'Add'
        DataBinding.FieldName = 'id_add'
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtbAdditionaljenis_jasa: TcxGridDBBandedColumn
        DataBinding.FieldName = 'jenis_jasa'
        Visible = False
        Width = 150
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtbAdditionalnama_add: TcxGridDBBandedColumn
        Caption = 'Nama Additional'
        DataBinding.FieldName = 'nama_add'
        Width = 150
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtbAdditionalwaktu: TcxGridDBBandedColumn
        Caption = 'Waktu'
        DataBinding.FieldName = 'waktu'
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtbAdditionalharga: TcxGridDBBandedColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbAdditional
    end
  end
  object btnSelect: TcxButton
    Left = 4
    Top = 300
    Width = 101
    Height = 37
    Hint = 'SHIFT + S'
    Caption = 'SELECT'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnClick = btnSelectClick
  end
  object ApplicationEvents1: TApplicationEvents
    OnShortCut = ApplicationEvents1ShortCut
    Left = 160
    Top = 304
  end
end
