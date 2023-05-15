object frmKalenderKerja: TfrmKalenderKerja
  Left = 214
  Top = 112
  Width = 902
  Height = 558
  BorderIcons = [biSystemMenu]
  Caption = 'frmKalenderKerja'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 242
    Width = 894
    Height = 241
    Align = alBottom
    TabOrder = 0
    object gbKalenderKerja: TcxGroupBox
      Left = 1
      Top = 1
      Align = alLeft
      Caption = 'DATA KALENDER KERJA'
      Enabled = False
      Style.BorderStyle = ebsOffice11
      Style.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.Kind = lfOffice11
      TabOrder = 0
      Height = 239
      Width = 240
      object edkal_id: TcxDBTextEdit
        Left = 100
        Top = 24
        DataBinding.DataField = 'temp_id'
        DataBinding.DataSource = dmDB.dsTblKalKerja
        TabOrder = 0
        Width = 121
      end
      object cxLabel1: TcxLabel
        Left = 8
        Top = 24
        Caption = 'ID KALENDER'
      end
      object cxLabel2: TcxLabel
        Left = 8
        Top = 60
        Caption = 'NAMA LIBUR'
      end
      object cxLabel4: TcxLabel
        Left = 8
        Top = 111
        Caption = 'END DATE'
      end
      object cxLabel5: TcxLabel
        Left = 8
        Top = 81
        Caption = 'START DATE'
      end
      object edNama: TcxDBTextEdit
        Left = 100
        Top = 52
        DataBinding.DataField = 'libur_resmi_nasional'
        DataBinding.DataSource = dmDB.dsTblKalKerja
        TabOrder = 5
        Width = 121
      end
      object edStart: TcxDBDateEdit
        Left = 100
        Top = 81
        DataBinding.DataField = 'tgl_awal_libur_resmi'
        DataBinding.DataSource = dmDB.dsTblKalKerja
        TabOrder = 6
        Width = 121
      end
      object edEnd: TcxDBDateEdit
        Left = 100
        Top = 111
        DataBinding.DataField = 'tgl_akhir_libur_resmi'
        DataBinding.DataSource = dmDB.dsTblKalKerja
        TabOrder = 7
        Width = 121
      end
      object edLama: TcxDBCalcEdit
        Left = 100
        Top = 139
        DataBinding.DataField = 'lama_libur_resmi'
        DataBinding.DataSource = dmDB.dsTblKalKerja
        TabOrder = 8
        Width = 121
      end
      object cxLabel3: TcxLabel
        Left = 8
        Top = 139
        Caption = 'LAMA'
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 483
    Width = 894
    Height = 41
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 1
    object cxDBNavigator1: TcxDBNavigator
      Left = 1
      Top = 1
      Width = 430
      Height = 39
      Buttons.OnButtonClick = cxDBNavigator1ButtonsButtonClick
      Buttons.PriorPage.Visible = False
      Buttons.NextPage.Visible = False
      Buttons.SaveBookmark.Visible = False
      Buttons.GotoBookmark.Visible = False
      Buttons.Filter.Visible = False
      DataSource = dmDB.dsTblKalKerja
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      Align = alLeft
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 894
    Height = 242
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    OnClick = Panel3Click
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 892
      Height = 240
      Align = alClient
      TabOrder = 0
      object gtbKalKerja: TcxGridDBBandedTableView
        NavigatorButtons.ConfirmDelete = False
        OnEditing = gtbKalKerjaEditing
        DataController.DataSource = dmDB.dsTblKalKerja
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsView.Footer = True
        OptionsView.Indicator = True
        Bands = <
          item
            Caption = 'IDENTITAS KALENDER'
          end
          item
            Caption = 'START-END DAY'
            Width = 246
          end
          item
            Caption = 'LAMA'
            Width = 79
          end>
        object gtbKalKerjaautonum: TcxGridDBBandedColumn
          DataBinding.FieldName = 'autonum'
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object gtbKalKerjatemp_id: TcxGridDBBandedColumn
          Caption = 'ID'
          DataBinding.FieldName = 'temp_id'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 75
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object gtbKalKerjatahun_buku: TcxGridDBBandedColumn
          DataBinding.FieldName = 'tahun_buku'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          GroupIndex = 0
          Width = 75
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object gtbKalKerjalibur_resmi_nasional: TcxGridDBBandedColumn
          Caption = 'NAMA LIBUR'
          DataBinding.FieldName = 'libur_resmi_nasional'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 200
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object gtbKalKerjatgl_twal_libur_resmi: TcxGridDBBandedColumn
          Caption = 'TANGGAL AWAL'
          DataBinding.FieldName = 'tgl_awal_libur_resmi'
          PropertiesClassName = 'TcxDateEditProperties'
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object gtbKalKerjatgl_akhir_libur_resmi: TcxGridDBBandedColumn
          Caption = 'TANGGAL AKHIR'
          DataBinding.FieldName = 'tgl_akhir_libur_resmi'
          PropertiesClassName = 'TcxDateEditProperties'
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object gtbKalKerjalama_libur_resmi: TcxGridDBBandedColumn
          Caption = 'LAMA LIBUR'
          DataBinding.FieldName = 'lama_libur_resmi'
          PropertiesClassName = 'TcxCalcEditProperties'
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = gtbKalKerja
      end
    end
  end
end
