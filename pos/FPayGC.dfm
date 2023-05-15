object frmPayGC: TfrmPayGC
  Left = 199
  Top = 127
  BorderIcons = [biSystemMenu]
  Caption = 'frmPayGC'
  ClientHeight = 505
  ClientWidth = 803
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    803
    505)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 4
    Top = 8
    Width = 789
    Height = 29
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'CHECKING GIVE CERTIFICATE'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 40
    Width = 789
    Height = 400
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gtbPayGC: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 Voucher[s]'
          Kind = skCount
          Column = gtbPayGCgc_number
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object gtbPayGCautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
      end
      object gtbPayGCpaket_number: TcxGridDBColumn
        DataBinding.FieldName = 'paket_number'
        Visible = False
        Width = 144
      end
      object gtbPayGCgc_number: TcxGridDBColumn
        Caption = 'No. GC'
        DataBinding.FieldName = 'gc_number'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        SortIndex = 0
        SortOrder = soAscending
        Width = 125
      end
      object gtbPayGCtanggal: TcxGridDBColumn
        DataBinding.FieldName = 'tanggal'
        Visible = False
      end
      object gtbPayGCexpired_date: TcxGridDBColumn
        Caption = 'Expired Date'
        DataBinding.FieldName = 'expired_date'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 98
      end
      object gtbPayGCjasa_master_id: TcxGridDBColumn
        DataBinding.FieldName = 'jasa_master_id'
        Visible = False
      end
      object gtbPayGCjenis_jasa_id: TcxGridDBColumn
        DataBinding.FieldName = 'jenis_jasa_id'
        Visible = False
      end
      object gtbPayGCnama_menu: TcxGridDBColumn
        DataBinding.FieldName = 'nama_menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 200
      end
      object gtbPayGCharga_jual: TcxGridDBColumn
        DataBinding.FieldName = 'harga_jual'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
      end
      object gtbPayGCharga_jasa: TcxGridDBColumn
        Caption = 'Harga Jasa'
        DataBinding.FieldName = 'harga_jasa'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
      end
      object gtbPayGCaktif: TcxGridDBColumn
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 53
      end
      object gtbPayGCterjual: TcxGridDBColumn
        DataBinding.FieldName = 'terjual'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 48
      end
      object gtbPayGCpakai: TcxGridDBColumn
        DataBinding.FieldName = 'pakai'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 41
      end
      object gtbPayGCnotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbPayGC
    end
  end
  object btnSelect: TcxButton
    Left = 4
    Top = 451
    Width = 93
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = '*Select'
    Default = True
    LookAndFeel.Kind = lfOffice11
    TabOrder = 1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnSelectClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 104
    Top = 452
    Caption = 'FIND GC'
    TabOrder = 2
    Height = 45
    Width = 289
    object edGCFind: TcxTextEdit
      Left = 8
      Top = 16
      Properties.Alignment.Horz = taCenter
      TabOrder = 0
      Text = 'TYPE HERE'
      Width = 177
    end
    object btnFind: TcxButton
      Left = 188
      Top = 14
      Width = 75
      Height = 25
      Caption = 'FIND'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 1
      OnClick = btnFindClick
    end
  end
end
