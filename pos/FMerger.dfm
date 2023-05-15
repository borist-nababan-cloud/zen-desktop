object frmMerger: TfrmMerger
  Left = 259
  Top = 208
  BorderIcons = [biSystemMenu]
  ClientHeight = 478
  ClientWidth = 875
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    875
    478)
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 4
    Top = 0
    Width = 873
    Height = 233
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gtbTransMaster: TcxGridDBBandedTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = gtbTransMasterCellClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
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
          Caption = 'TRANS MASTER'
          Width = 908
        end>
      object gtbTransMastertrans_id: TcxGridDBBandedColumn
        Caption = 'Trans ID'
        DataBinding.FieldName = 'trans_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 91
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
        DataBinding.FieldName = 'waktu'
        PropertiesClassName = 'TcxTimeEditProperties'
        Width = 130
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
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 96
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
        DataBinding.FieldName = 'grandtotal'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 127
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
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 132
        Position.BandIndex = 0
        Position.ColIndex = 16
        Position.RowIndex = 0
      end
      object gtbTransMasterroom_id: TcxGridDBBandedColumn
        Caption = 'Room ID'
        DataBinding.FieldName = 'room_id'
        PropertiesClassName = 'TcxTextEditProperties'
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
        Width = 104
        Position.BandIndex = 0
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object gtbTransMasterColumn1: TcxGridDBBandedColumn
        Caption = 'Therapist ID'
        DataBinding.FieldName = 'therapist_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 131
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
    Top = 238
    Width = 873
    Height = 184
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object gtbTransDetail: TcxGridDBBandedTableView
      Navigator.Buttons.CustomButtons = <>
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
        Caption = 'Disc Amount'
        DataBinding.FieldName = 'disc_amount'
        Visible = False
        Width = 101
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
  object btnSelect: TcxButton
    Left = 4
    Top = 424
    Width = 181
    Height = 53
    Anchors = [akLeft, akBottom]
    Caption = 'SELECT'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 2
    OnClick = btnSelectClick
  end
  object ApplicationEvents1: TApplicationEvents
    OnShortCut = ApplicationEvents1ShortCut
    Left = 808
    Top = 432
  end
end
