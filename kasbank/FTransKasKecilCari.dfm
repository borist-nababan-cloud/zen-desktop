object frmTransKasKecilCari: TfrmTransKasKecilCari
  Left = 0
  Top = 0
  Caption = 'Cari Transaksi Kas'
  ClientHeight = 400
  ClientWidth = 800
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    800
    400)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 38
    Width = 59
    Height = 13
    Caption = 'Start Date'
  end
  object Label2: TLabel
    Left = 211
    Top = 38
    Width = 21
    Height = 13
    Caption = '  to '
  end
  object Label3: TLabel
    Left = 2
    Top = 2
    Width = 790
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '.: Transaksi Kas Kecil :.'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object cxGrid1: TcxGrid
    Left = 2
    Top = 68
    Width = 794
    Height = 292
    Anchors = [akLeft, akTop, akRight, akBottom]
    PopupMenu = pmCari
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gtbCariTransaksiKas: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryTransMaster
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
      object gtbCariTransaksiKaskodekas: TcxGridDBColumn
        Caption = 'Kode Kas'
        DataBinding.FieldName = 'kodekas'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodekas'
        Properties.ListColumns = <
          item
            FieldName = 'namakas'
          end>
        Properties.ListSource = frmTransKasKecil.dsTblKas
        Width = 100
      end
      object gtbCariTransaksiKasStatus: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'status'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
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
      object gtbCariTransaksiKasNotes: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object gtbCariTransaksiKasTotal: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,0.#0'
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
      object gtbCariTransaksiKasno_reff_trans: TcxGridDBColumn
        Caption = 'No. Reff'
        DataBinding.FieldName = 'no_reff_trans'
        Width = 100
      end
      object gtbCariTransaksiKasidoutlet: TcxGridDBColumn
        Caption = 'Outlet'
        DataBinding.FieldName = 'idoutlet'
        Width = 100
      end
      object gtbCariTransaksiKaslastuseredit: TcxGridDBColumn
        DataBinding.FieldName = 'lastuseredit'
        Width = 100
      end
      object gtbCariTransaksiKaslasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
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
  object edStart: TcxDateEdit
    Left = 84
    Top = 35
    EditValue = 0d
    TabOrder = 2
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 238
    Top = 34
    EditValue = 0d
    TabOrder = 3
    Width = 121
  end
  object btnFind: TButton
    Left = 365
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Cari'
    TabOrder = 4
    OnClick = btnFindClick
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
  object qryTransMaster: TMyQuery
    Connection = DMDB.StoreDB
    SQL.Strings = (
      'select * from ben_trans_kas_master where tanggal = CURRENT_DATE')
    Left = 396
    Top = 204
  end
  object dsQryTransMaster: TDataSource
    DataSet = qryTransMaster
    Left = 396
    Top = 268
  end
end
