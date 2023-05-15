object frmLaporanPayment: TfrmLaporanPayment
  Left = 0
  Top = 0
  Caption = 'Laporan Pembayaran PKB'
  ClientHeight = 525
  ClientWidth = 872
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
    872
    525)
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
    Width = 856
    Height = 425
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object gtbListnopol: TcxGridDBColumn
        Caption = 'No. Polisi'
        DataBinding.FieldName = 'nopol'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListpkbnumber: TcxGridDBColumn
        Caption = 'No. PKB'
        DataBinding.FieldName = 'pkbnumber'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
      object gtbListcustcode: TcxGridDBColumn
        DataBinding.FieldName = 'custcode'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 100
      end
      object gtbListnamacust: TcxGridDBColumn
        Caption = 'Nama Customer'
        DataBinding.FieldName = 'namacust'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 300
      end
      object gtbListkodetype: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'kodetype'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_type'
        Properties.ListColumns = <
          item
            FieldName = 'nama_group_detail'
          end>
        Properties.ListSource = dsTbljenis
        Properties.ReadOnly = True
        Width = 200
      end
      object gtbListtglpelunasan: TcxGridDBColumn
        Caption = 'Tgl Lunas'
        DataBinding.FieldName = 'tglpelunasan'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListwaktu: TcxGridDBColumn
        Caption = 'Waktu'
        DataBinding.FieldName = 'waktu'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbListsubtotal: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListdisc: TcxGridDBColumn
        Caption = 'Disc'
        DataBinding.FieldName = 'disc'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 65
      end
      object gtbListtotal: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListmaterai: TcxGridDBColumn
        Caption = 'Materai'
        DataBinding.FieldName = 'materai'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListgrandtotal: TcxGridDBColumn
        Caption = 'Grandtotal'
        DataBinding.FieldName = 'grandtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
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
    Left = 760
    Top = 8
    Width = 104
    Height = 38
    Anchors = [akTop, akRight]
    Caption = 'Export Excel'
    TabOrder = 6
    OnClick = cxButton1Click
  end
  object btnCancelPayment: TcxButton
    Left = 8
    Top = 483
    Width = 133
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'CANCEL PAYMENT'
    TabOrder = 7
    OnClick = btnCancelPaymentClick
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select pkbnumber, custcode, tglpelunasan, waktu, subtotal, disc,' +
        ' total, materai, grandtotal, '
      
        '(select ben_bengkel_customer.nopol from ben_bengkel_customer whe' +
        're ben_bengkel_customer.codecust = ben_bengkel_pkb_pelunasan.cus' +
        'tcode) as nopol,'
      
        '(select ben_bengkel_customer.namacust from ben_bengkel_customer ' +
        'where ben_bengkel_customer.codecust = ben_bengkel_pkb_pelunasan.' +
        'custcode) as namacust, '
      
        '(select ben_bengkel_customer.kodetype from ben_bengkel_customer ' +
        'where ben_bengkel_customer.codecust = ben_bengkel_pkb_pelunasan.' +
        'custcode) as kodetype '
      'from ben_bengkel_pkb_pelunasan'
      
        'WHERE ben_bengkel_pkb_pelunasan.tglpelunasan = CURRENT_DATE AND ' +
        'ben_bengkel_pkb_pelunasan.isdelete = '#39'N'#39)
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
  object tblJenis: TMyTable
    TableName = 'mstr_type_detail'
    Connection = dmDB.dbInternal
    Left = 28
    Top = 92
  end
  object dsTbljenis: TMyDataSource
    DataSet = tblJenis
    Left = 28
    Top = 140
  end
end
