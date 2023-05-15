object frmLaporanPKB: TfrmLaporanPKB
  Left = 0
  Top = 0
  Caption = 'Laporan Transaksi PKB'
  ClientHeight = 551
  ClientWidth = 964
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    964
    551)
  PixelsPerInch = 96
  TextHeight = 13
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
    Height = 481
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
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
      object gtbListcustcode: TcxGridDBColumn
        Caption = 'Kode Konsumen'
        DataBinding.FieldName = 'custcode'
        Width = 100
      end
      object gtbListkeluhan: TcxGridDBColumn
        Caption = 'Keluhan'
        DataBinding.FieldName = 'keluhan'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 100
      end
      object gtbListkilometer: TcxGridDBColumn
        Caption = 'Kilometer'
        DataBinding.FieldName = 'kilometer'
        Width = 100
      end
      object gtbListtglselesai: TcxGridDBColumn
        Caption = 'Tgl Selesai'
        DataBinding.FieldName = 'tglselesai'
        Width = 100
      end
      object gtbListwaktuselesai: TcxGridDBColumn
        Caption = 'Jam Selesai'
        DataBinding.FieldName = 'waktuselesai'
        Width = 100
      end
      object gtbListnotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        Visible = False
        Width = 100
      end
      object gtbListstatus: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'status'
        Width = 100
      end
      object gtbListisdelete: TcxGridDBColumn
        DataBinding.FieldName = 'isdelete'
        Visible = False
        Width = 100
      end
      object gtbListnopol: TcxGridDBColumn
        Caption = 'No Polisi'
        DataBinding.FieldName = 'nopol'
        Width = 100
      end
      object gtbListnamacust: TcxGridDBColumn
        Caption = 'Nama Customer'
        DataBinding.FieldName = 'namacust'
        Width = 100
      end
      object gtbListkodetype: TcxGridDBColumn
        Caption = 'type'
        DataBinding.FieldName = 'kodetype'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_type'
        Properties.ListColumns = <
          item
            FieldName = 'nama_group_detail'
          end>
        Properties.ListSource = dsTbljenis
        Width = 150
      end
      object gtbListtahun: TcxGridDBColumn
        Caption = 'Tahun'
        DataBinding.FieldName = 'tahun'
        Width = 100
      end
      object gtbListwarna: TcxGridDBColumn
        Caption = 'Warna'
        DataBinding.FieldName = 'warna'
        Width = 100
      end
      object gtbListnomesin: TcxGridDBColumn
        Caption = 'No Mesin'
        DataBinding.FieldName = 'nomesin'
        Width = 100
      end
      object gtbListnorangka: TcxGridDBColumn
        Caption = 'No. Rangka'
        DataBinding.FieldName = 'norangka'
        Width = 100
      end
      object gtbListlastedituser: TcxGridDBColumn
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
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
      'select ben_bengkel_pkb.*, '
      
        '(select ben_bengkel_customer.nopol from ben_bengkel_customer whe' +
        're ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as ' +
        'nopol,'
      
        '(select ben_bengkel_customer.namacust from ben_bengkel_customer ' +
        'where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) ' +
        'as namacust, '
      
        '(select ben_bengkel_customer.kodetype from ben_bengkel_customer ' +
        'where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) ' +
        'as kodetype,  '
      
        '(select ben_bengkel_customer.tahun from ben_bengkel_customer whe' +
        're ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as ' +
        'tahun,'
      
        '(select ben_bengkel_customer.warna from ben_bengkel_customer whe' +
        're ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) as ' +
        'warna, '
      
        '(select ben_bengkel_customer.nomesin from ben_bengkel_customer w' +
        'here ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) a' +
        's nomesin,'
      
        '(select ben_bengkel_customer.norangka from ben_bengkel_customer ' +
        'where ben_bengkel_customer.codecust = ben_bengkel_pkb.custcode) ' +
        'as norangka'
      'from ben_bengkel_pkb'
      
        'WHERE ben_bengkel_pkb.tglmasuk = CURRENT_DATE AND ben_bengkel_pk' +
        'b.isdelete = '#39'N'#39)
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
