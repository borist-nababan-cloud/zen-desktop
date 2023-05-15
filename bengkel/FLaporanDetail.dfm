object frmLaporanDetail: TfrmLaporanDetail
  Left = 0
  Top = 0
  Caption = 'Laporan Details PKB'
  ClientHeight = 567
  ClientWidth = 981
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    981
    567)
  PixelsPerInch = 96
  TextHeight = 16
  object edStart: TcxDateEdit
    Left = 84
    Top = 16
    EditValue = 0d
    TabOrder = 0
    Width = 121
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 17
    Caption = 'Tanggal'
    Transparent = True
  end
  object edEnd: TcxDateEdit
    Left = 234
    Top = 16
    EditValue = 0d
    TabOrder = 2
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 211
    Top = 17
    Caption = ' - '
    Transparent = True
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 52
    Width = 944
    Height = 497
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbListsubtotal
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbListjumlah
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbListtypedetail
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbListkodedetail
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbListColumn1
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbListpkbnumber
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbListsubtotal
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbListjumlah
        end
        item
          Kind = skCount
          Column = gtbListtypedetail
        end
        item
          Kind = skCount
          Column = gtbListkodedetail
        end
        item
          Kind = skCount
          Column = gtbListColumn1
        end
        item
          Kind = skCount
          Column = gtbListpkbnumber
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.FooterAutoHeight = True
      OptionsView.FooterMultiSummaries = True
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object gtbListautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbListpkbnumber: TcxGridDBColumn
        Caption = 'No. PKB'
        DataBinding.FieldName = 'pkbnumber'
        Visible = False
        GroupIndex = 0
        Width = 100
      end
      object gtbListtglmasuk: TcxGridDBColumn
        Caption = 'Tgl Masuk'
        DataBinding.FieldName = 'tglmasuk'
        Width = 100
      end
      object gtbListwaktumasuk: TcxGridDBColumn
        Caption = 'Jam Masuk'
        DataBinding.FieldName = 'waktumasuk'
        Width = 100
      end
      object gtbListtypedetail: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'typedetail'
        PropertiesClassName = 'TcxTextEditProperties'
        OnGetDisplayText = gtbListtypedetailGetDisplayText
        Width = 100
      end
      object gtbListkodedetail: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kodedetail'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbListnamadetail: TcxGridDBColumn
        Caption = 'Nama Part / Jasa / Bahan'
        DataBinding.FieldName = 'namadetail'
        Width = 250
      end
      object gtbListjumlah: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'jumlah'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 100
      end
      object gtbListharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListdiscount: TcxGridDBColumn
        Caption = 'Disc'
        DataBinding.FieldName = 'discount'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListsubtotal: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListkodecharge: TcxGridDBColumn
        Caption = 'Charge To'
        DataBinding.FieldName = 'kodecharge'
        Width = 100
      end
      object gtbListisdelete: TcxGridDBColumn
        DataBinding.FieldName = 'isdelete'
        Visible = False
        Width = 100
      end
      object gtbListlastedituser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
      object gtbListColumn1: TcxGridDBColumn
        Caption = 'No PKB'
        DataBinding.FieldName = 'pkbnumber'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnLoad: TcxButton
    Left = 372
    Top = 8
    Width = 85
    Height = 38
    Caption = 'LOAD'
    TabOrder = 5
    OnClick = btnLoadClick
  end
  object cxButton1: TcxButton
    Left = 853
    Top = 8
    Width = 104
    Height = 38
    Anchors = [akTop, akRight]
    Caption = 'Export Excel'
    TabOrder = 6
    OnClick = cxButton1Click
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select ben_bengkel_pkb_detail.* '
      'FROM ben_bengkel_pkb_detail'
      'WHERE ben_bengkel_pkb_detail.tglmasuk = CURRENT_DATE '
      'ORDER BY ben_bengkel_pkb_detail.pkbnumber ASC')
    Left = 92
    Top = 92
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 92
    Top = 144
  end
  object dlgSave: TSaveDialog
    Left = 572
    Top = 16
  end
end
