object frmBrowseTrans: TfrmBrowseTrans
  Left = 195
  Top = 135
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 446
  ClientWidth = 949
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 4
    Top = 8
    Width = 941
    Height = 233
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gtbTransMaster: TcxGridDBBandedTableView
      OnDblClick = gtbTransMasterDblClick
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = gtbTransMasterCellClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
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
          Caption = 'TRANS MASTER'
          Width = 908
        end>
      object gtbTransMastertrans_id: TcxGridDBBandedColumn
        Caption = 'Trans ID'
        DataBinding.FieldName = 'trans_id'
        Width = 93
        Position.BandIndex = 0
        Position.ColIndex = 17
        Position.RowIndex = 0
      end
      object gtbTransMastertanggal: TcxGridDBBandedColumn
        DataBinding.FieldName = 'tanggal'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtbTransMasterwaktu: TcxGridDBBandedColumn
        Caption = 'Time In'
        DataBinding.FieldName = 'start_time'
        PropertiesClassName = 'TcxTimeEditProperties'
        Width = 132
        Position.BandIndex = 0
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
      object gtbTransMasterid_customer: TcxGridDBBandedColumn
        DataBinding.FieldName = 'id_customer'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtbTransMasternama: TcxGridDBBandedColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama_customer'
        Width = 84
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtbTransMasterpayment_via: TcxGridDBBandedColumn
        DataBinding.FieldName = 'payment_via'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtbTransMasterpayment_ref: TcxGridDBBandedColumn
        DataBinding.FieldName = 'payment_ref'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtbTransMastersubtotal: TcxGridDBBandedColumn
        DataBinding.FieldName = 'subtotal'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtbTransMasterdisc_percent: TcxGridDBBandedColumn
        DataBinding.FieldName = 'disc_percent'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtbTransMasterdisc_amount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'disc_amount'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtbTransMastertotal: TcxGridDBBandedColumn
        DataBinding.FieldName = 'total'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object gtbTransMastertax_: TcxGridDBBandedColumn
        DataBinding.FieldName = 'tax_'
        Visible = False
        Width = 58
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object gtbTransMastertax_amount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'tax_amount'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object gtbTransMastergrandtotal: TcxGridDBBandedColumn
        Caption = 'Grand Total'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Visible = False
        Width = 129
        Position.BandIndex = 0
        Position.ColIndex = 18
        Position.RowIndex = 0
      end
      object gtbTransMasternotes: TcxGridDBBandedColumn
        DataBinding.FieldName = 'notes'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 15
        Position.RowIndex = 0
      end
      object gtbTransMasterstatus_trans: TcxGridDBBandedColumn
        Caption = 'Status Trans'
        DataBinding.FieldName = 'status_trans'
        Width = 134
        Position.BandIndex = 0
        Position.ColIndex = 16
        Position.RowIndex = 0
      end
      object gtbTransMasterroom_id: TcxGridDBBandedColumn
        Caption = 'Room ID'
        DataBinding.FieldName = 'room_id'
        Width = 97
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtbTransMastertherapist_id: TcxGridDBBandedColumn
        Caption = 'Therapist'
        DataBinding.FieldName = 'therapist_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_therapist'
        Properties.ListColumns = <
          item
            FieldName = 'nama'
          end>
        Width = 106
        Position.BandIndex = 0
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object gtbTransMasterColumn1: TcxGridDBBandedColumn
        Caption = 'Therapist ID'
        DataBinding.FieldName = 'therapist_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 133
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbTransMaster
    end
  end
  object cxGrid2: TcxGrid
    Left = 4
    Top = 288
    Width = 941
    Height = 156
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object gtbTransDetail: TcxGridDBBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTransDetail
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'TRANS DETAIL'
        end>
      object gtbTransDetailautonum: TcxGridDBBandedColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtbTransDetailid_trans: TcxGridDBBandedColumn
        DataBinding.FieldName = 'id_trans'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtbTransDetailtanggal: TcxGridDBBandedColumn
        DataBinding.FieldName = 'tanggal'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtbTransDetailtrans_type_id: TcxGridDBBandedColumn
        DataBinding.FieldName = 'trans_type_id'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtbTransDetailproduk_jasa_id: TcxGridDBBandedColumn
        Caption = 'Jasa / Product ID'
        DataBinding.FieldName = 'produk_jasa_id'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
      object gtbTransDetailproduk_jasa_nama: TcxGridDBBandedColumn
        Caption = 'Nama Jasa / Product'
        DataBinding.FieldName = 'produk_jasa_nama'
        Width = 135
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtbTransDetailstart_time: TcxGridDBBandedColumn
        Caption = 'Start'
        DataBinding.FieldName = 'start_time'
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtbTransDetailend_time: TcxGridDBBandedColumn
        Caption = 'End'
        DataBinding.FieldName = 'end_time'
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object gtbTransDetailharga: TcxGridDBBandedColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        Width = 84
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object gtbTransDetaildisc_amount: TcxGridDBBandedColumn
        Caption = 'Disc FB %'
        DataBinding.FieldName = 'disc_amount'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 85
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object gtbTransDetaildisc_percent: TcxGridDBBandedColumn
        Caption = 'Disc %'
        DataBinding.FieldName = 'disc_percent'
        Width = 109
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object gtbTransDetailsubtotal: TcxGridDBBandedColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        Position.BandIndex = 0
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object gtbTransDetailteraphist_id: TcxGridDBBandedColumn
        Caption = 'Therapist'
        DataBinding.FieldName = 'teraphist_id'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtbTransDetailroom_id: TcxGridDBBandedColumn
        Caption = 'Room ID'
        DataBinding.FieldName = 'room_id'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtbTransDetailquantity: TcxGridDBBandedColumn
        Caption = 'Quantity'
        DataBinding.FieldName = 'quantity'
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 15
        Position.RowIndex = 0
      end
      object gtbTransDetailaroma: TcxGridDBBandedColumn
        DataBinding.FieldName = 'aroma'
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 16
        Position.RowIndex = 0
      end
      object gtbTransDetaillama: TcxGridDBBandedColumn
        DataBinding.FieldName = 'lama'
        Width = 132
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = gtbTransDetail
    end
  end
  object btnEdit: TcxButton
    Left = 4
    Top = 244
    Width = 117
    Height = 37
    Hint = 'CTRL + Z'
    Caption = 'EDIT'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnEditClick
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 232
    Top = 248
  end
  object TransMaster: TMyQuery
    Connection = dmDB.dbInternal
    Left = 456
    Top = 248
  end
  object dsTransMaster: TMyDataSource
    DataSet = TransMaster
    Left = 536
    Top = 252
  end
  object transDetail: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans_detail where id_trans = '#39'X'#39)
    Active = True
    Left = 596
    Top = 248
  end
  object dsTransDetail: TMyDataSource
    DataSet = transDetail
    Left = 676
    Top = 252
  end
end
