object frmReportPosPayment: TfrmReportPosPayment
  Left = 0
  Top = 0
  Caption = '   Report PoS Payment'
  ClientHeight = 525
  ClientWidth = 1012
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
    1012
    525)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 1000
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '   Report PoS Payment'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label2: TLabel
    Left = 8
    Top = 47
    Width = 34
    Height = 16
    Caption = 'FROM'
  end
  object Label3: TLabel
    Left = 200
    Top = 47
    Width = 25
    Height = 16
    Caption = ' TO '
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 84
    Width = 996
    Height = 425
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbDayli: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Options = [dcoAssignGroupingValues, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDayliexchange
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDaylirounding
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDaylivpayment1
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDaylivcash
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDaylivgift
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDaylivredeem
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDaylivdisc
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDaylivpromo
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDaylisubtotal
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbDaylitanggal
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDaylitotal
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skSum
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skSum
        end
        item
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDayliexchange
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylirounding
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylivpayment1
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylivcash
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylivgift
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylivredeem
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylivdisc
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylivpromo
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylisubtotal
        end
        item
          Kind = skCount
          Column = gtbDaylitanggal
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylitotal
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.GroupSummaryLayout = gslAlignWithColumnsAndDistribute
      OptionsView.Indicator = True
      object gtbDaylitanggal: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbDaylinama_member: TcxGridDBColumn
        Caption = 'Nama Customer'
        DataBinding.FieldName = 'nama_member'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDayliid_member: TcxGridDBColumn
        Caption = 'Member Card'
        DataBinding.FieldName = 'id_member'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylipoint_awal: TcxGridDBColumn
        Caption = 'P. Awal'
        DataBinding.FieldName = 'point_awal'
        Width = 100
      end
      object gtbDaylitambah_point: TcxGridDBColumn
        Caption = 'P. Tambah'
        DataBinding.FieldName = 'tambah_point'
        Width = 100
      end
      object gtbDaylikurang_point: TcxGridDBColumn
        Caption = 'P. Kurang'
        DataBinding.FieldName = 'kurang_point'
        Width = 100
      end
      object gtbDaylisisa: TcxGridDBColumn
        Caption = 'P. Sisa'
        DataBinding.FieldName = 'sisa'
        Width = 100
      end
      object gtbDayliid_payment_1: TcxGridDBColumn
        DataBinding.FieldName = 'id_payment_1'
        Visible = False
        Width = 100
      end
      object gtbDaylitanggal_1: TcxGridDBColumn
        DataBinding.FieldName = 'tanggal_1'
        Visible = False
        Width = 100
      end
      object gtbDaylisubtotal: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylikodepromo: TcxGridDBColumn
        Caption = 'Disc Promo'
        DataBinding.FieldName = 'kodepromo'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodepromo'
        Properties.ListColumns = <
          item
            FieldName = 'namapromo'
          end>
        Properties.ListSource = dsQryPromo
        Width = 100
      end
      object gtbDaylirefpromo: TcxGridDBColumn
        Caption = 'No. Ref Promo'
        DataBinding.FieldName = 'refpromo'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylivpromo: TcxGridDBColumn
        Caption = 'N. Promo'
        DataBinding.FieldName = 'vpromo'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylirefdisc: TcxGridDBColumn
        Caption = 'Add Disc Reff'
        DataBinding.FieldName = 'refdisc'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylivdisc: TcxGridDBColumn
        Caption = 'N. Add Disc'
        DataBinding.FieldName = 'vdisc'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylitotal: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylivredeem: TcxGridDBColumn
        Caption = 'N. Redeem'
        DataBinding.FieldName = 'vredeem'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylirefgift: TcxGridDBColumn
        Caption = 'No. GC'
        DataBinding.FieldName = 'refgift'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylivgift: TcxGridDBColumn
        Caption = 'N. GC'
        DataBinding.FieldName = 'vgift'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylivcash: TcxGridDBColumn
        Caption = 'N. Cash'
        DataBinding.FieldName = 'vcash'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylikodepayment1: TcxGridDBColumn
        Caption = 'Payment 1'
        DataBinding.FieldName = 'kodepayment1'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodepayment'
        Properties.ListColumns = <
          item
            FieldName = 'namapayment'
          end>
        Properties.ListSource = dsQryPayment
        Width = 100
      end
      object gtbDaylikodebank1: TcxGridDBColumn
        Caption = 'Bank'
        DataBinding.FieldName = 'kodebank1'
        Width = 100
      end
      object gtbDaylirefpayment1: TcxGridDBColumn
        Caption = 'No. Reff Pay 1'
        DataBinding.FieldName = 'refpayment1'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylivpayment1: TcxGridDBColumn
        Caption = 'N. Payment'
        DataBinding.FieldName = 'vpayment1'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylikodepayment2: TcxGridDBColumn
        Caption = 'Payment 2'
        DataBinding.FieldName = 'kodepayment2'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodepayment'
        Properties.ListColumns = <
          item
            FieldName = 'namapayment'
          end>
        Properties.ListSource = dsQryPayment
        Width = 100
      end
      object gtbDaylikodebank2: TcxGridDBColumn
        Caption = 'Bank 2'
        DataBinding.FieldName = 'kodebank2'
        Width = 100
      end
      object gtbDaylirefpayment2: TcxGridDBColumn
        Caption = 'Ref Payment 2'
        DataBinding.FieldName = 'refpayment2'
        Width = 100
      end
      object gtbDaylivpayment2: TcxGridDBColumn
        Caption = 'N. Payment 2'
        DataBinding.FieldName = 'vpayment2'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylirounding: TcxGridDBColumn
        Caption = 'Rounding'
        DataBinding.FieldName = 'rounding'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDayliexchange: TcxGridDBColumn
        Caption = 'Exchange'
        DataBinding.FieldName = 'exchange'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDayliid_payment: TcxGridDBColumn
        DataBinding.FieldName = 'id_payment'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylilastuser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'lastuser'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylilasteditdate: TcxGridDBColumn
        Caption = 'Date Time'
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
      object gtbDaylinotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        Visible = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbDayli
    end
  end
  object edStart: TcxDateEdit
    Left = 60
    Top = 44
    EditValue = 0d
    TabOrder = 1
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 251
    Top = 44
    EditValue = 0d
    TabOrder = 2
    Width = 121
  end
  object cxButton2: TcxButton
    Left = 388
    Top = 36
    Width = 101
    Height = 42
    Caption = 'Load'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object cxButton1: TcxButton
    Left = 500
    Top = 36
    Width = 101
    Height = 42
    Caption = 'Export'
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object btnCetakUlang: TcxButton
    Left = 896
    Top = 36
    Width = 101
    Height = 42
    Anchors = [akTop, akRight]
    Caption = 'Cetak Ulang'
    TabOrder = 5
    OnClick = btnCetakUlangClick
  end
  object cxButton3: TcxButton
    Left = 789
    Top = 36
    Width = 101
    Height = 42
    Anchors = [akTop, akRight]
    Caption = 'Cetak Rating'
    TabOrder = 6
    OnClick = cxButton3Click
  end
  object dsQryList: TMyDataSource
    DataSet = qryList
    Left = 620
    Top = 60
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'SELECT'
      '  trans_payment.id_payment, trans_payment.tanggal,'
      '  trans_payment.id_member, trans_payment.nama_member,'
      '  trans_payment.point_awal, trans_payment.tambah_point,'
      '  trans_payment.kurang_point, trans_payment.sisa,'
      '  trans_payment_detail.*'
      'FROM'
      '  trans_payment INNER JOIN'
      '  trans_payment_detail ON trans_payment.id_payment ='
      '    trans_payment_detail.id_payment'
      'WHERE'
      '  trans_payment.tanggal = CURRENT_DATE;')
    Left = 620
    Top = 16
  end
  object dlgSave: TSaveDialog
    Left = 872
    Top = 204
  end
  object qryPromo: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from pos_master_promo where aktif = '#39'Y'#39)
    Left = 860
    Top = 40
  end
  object dsQryPromo: TMyDataSource
    DataSet = qryPromo
    Left = 860
    Top = 120
  end
  object qryPayment: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from pos_master_payment where aktif = '#39'Y'#39)
    Left = 364
    Top = 160
  end
  object dsQryPayment: TMyDataSource
    DataSet = qryPayment
    Left = 364
    Top = 204
  end
end
