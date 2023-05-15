object frmReportVoid: TfrmReportVoid
  Left = 0
  Top = 0
  Caption = '   Report Void PoS'
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
    Caption = '   Report Void PoS'
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
          Column = gtbDaylitanggal
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
          Column = gtbDayliproduk_jasa_nama
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbDaylitrans_type_id
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbDaylijenis_detail
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbDayliproduk_jasa_id
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbDayliteraphist_id
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbDayliroom_id
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDayliquantity
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbDayliid_trans
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtbDaylitanggal
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylisubtotal
        end
        item
          Kind = skCount
          Column = gtbDayliproduk_jasa_nama
        end
        item
          Kind = skCount
          Column = gtbDaylitrans_type_id
        end
        item
          Kind = skCount
          Column = gtbDaylijenis_detail
        end
        item
          Kind = skCount
          Column = gtbDayliproduk_jasa_id
        end
        item
          Kind = skCount
          Column = gtbDayliteraphist_id
        end
        item
          Kind = skCount
          Column = gtbDayliroom_id
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDayliquantity
        end
        item
          Kind = skCount
          Column = gtbDayliid_trans
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
      object gtbDayliStatus: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'taked'
        Width = 100
      end
      object gtbDaylitanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbDaylinama_customer: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'nama_customer'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Width = 200
      end
      object gtbDaylitrans_type_id: TcxGridDBColumn
        Caption = 'Type Menu'
        DataBinding.FieldName = 'trans_type_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylijenis_detail: TcxGridDBColumn
        Caption = 'Jenis Menu'
        DataBinding.FieldName = 'jenis_detail'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDayliproduk_jasa_id: TcxGridDBColumn
        Caption = 'ID Menu'
        DataBinding.FieldName = 'produk_jasa_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDayliproduk_jasa_nama: TcxGridDBColumn
        Caption = 'Nama Menu'
        DataBinding.FieldName = 'produk_jasa_nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object gtbDayliharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylidisc_percent: TcxGridDBColumn
        Caption = 'Disc %'
        DataBinding.FieldName = 'disc_percent'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 100
      end
      object gtbDaylisubtotal: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDayliteraphist_id: TcxGridDBColumn
        Caption = 'ID TR'
        DataBinding.FieldName = 'teraphist_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDayliColumn1: TcxGridDBColumn
        Caption = 'Nama TR'
        DataBinding.FieldName = 'teraphist_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'idkaryawan'
        Properties.ListColumns = <
          item
            FieldName = 'namakaryawan'
          end>
        Properties.ListSource = dsQryTr
        Width = 250
      end
      object gtbDayliroom_id: TcxGridDBColumn
        Caption = 'Room'
        DataBinding.FieldName = 'room_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDayliquantity: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'quantity'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 100
      end
      object gtbDayliaroma: TcxGridDBColumn
        Caption = 'Aroma'
        DataBinding.FieldName = 'aroma'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylilama: TcxGridDBColumn
        Caption = 'Waktu'
        DataBinding.FieldName = 'lama'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 100
      end
      object gtbDayliColumn2: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'id_trans'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'trans_id'
        Properties.ListColumns = <
          item
            FieldName = 'nama_customer'
          end>
        Properties.ListSource = dsQryLookup
        Properties.ReadOnly = True
        Width = 175
      end
      object gtbDayliColumn3: TcxGridDBColumn
        Caption = 'Gender'
        DataBinding.FieldName = 'id_trans'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'trans_id'
        Properties.ListColumns = <
          item
            FieldName = 'gender'
          end>
        Properties.ListSource = dsQryLookup
        Properties.ReadOnly = True
        Width = 75
      end
      object gtbDayliid_trans: TcxGridDBColumn
        Caption = 'ID Trans'
        DataBinding.FieldName = 'id_trans'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylicabang: TcxGridDBColumn
        Caption = 'User Edit'
        DataBinding.FieldName = 'cabang'
        PropertiesClassName = 'TcxTextEditProperties'
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
  object dsQryList: TMyDataSource
    DataSet = qryList
    Left = 704
    Top = 44
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select id_trans, tanggal, trans_type_id, produk_jasa_id, produk_' +
        'jasa_nama,'
      
        'harga, disc_percent, subtotal, teraphist_id, room_id, quantity, ' +
        'aroma, lama, nama_customer, cabang, '
      
        '(select main_menu.jenis_jasa_id from main_menu where main_menu.m' +
        'enu_id = trans_detail_void.produk_jasa_id) as jenis_detail'
      'FROM trans_detail_void'
      'WHERE tanggal = CURRENT_DATE AND taked = '#39'F'#39)
    Left = 620
    Top = 40
  end
  object dlgSave: TSaveDialog
    Left = 792
    Top = 36
  end
  object qryTR: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select idkaryawan, namakaryawan'
      'from ben_hrd_karyawan_info where active = '#39'Y'#39)
    Left = 856
    Top = 36
  end
  object dsQryTr: TMyDataSource
    DataSet = qryTR
    Left = 940
    Top = 40
  end
  object qryLookUp: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select trans_id, nama_customer, gender from trans_master'
      'WHERE tanggal = CURRENT_DATE AND taked = '#39'F'#39)
    Left = 616
    Top = 164
  end
  object dsQryLookup: TMyDataSource
    DataSet = qryLookUp
    Left = 700
    Top = 168
  end
end
