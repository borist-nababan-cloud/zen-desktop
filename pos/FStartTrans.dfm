object frmStartTrans: TfrmStartTrans
  Left = 230
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 535
  ClientWidth = 822
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    822
    535)
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 4
    Top = 8
    Width = 813
    Height = 269
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gtbTransMaster: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = gtbTransMasterCellClick
      DataController.DataSource = dmDB.dsTransMaster
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
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
          Width = 613
        end>
      object gtbTransMastertrans_id: TcxGridDBBandedColumn
        DataBinding.FieldName = 'trans_id'
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 5
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
        DataBinding.FieldName = 'waktu'
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtbTransMasterid_customer: TcxGridDBBandedColumn
        DataBinding.FieldName = 'id_customer'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtbTransMasternama: TcxGridDBBandedColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
        Width = 150
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtbTransMasterpayment_via: TcxGridDBBandedColumn
        DataBinding.FieldName = 'payment_via'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtbTransMasterpayment_ref: TcxGridDBBandedColumn
        DataBinding.FieldName = 'payment_ref'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtbTransMastersubtotal: TcxGridDBBandedColumn
        DataBinding.FieldName = 'subtotal'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtbTransMasterdisc_percent: TcxGridDBBandedColumn
        DataBinding.FieldName = 'disc_percent'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object gtbTransMasterdisc_amount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'disc_amount'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object gtbTransMastertotal: TcxGridDBBandedColumn
        DataBinding.FieldName = 'total'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object gtbTransMastertax_: TcxGridDBBandedColumn
        DataBinding.FieldName = 'tax_'
        Visible = False
        Width = 58
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object gtbTransMastertax_amount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'tax_amount'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object gtbTransMastergrandtotal: TcxGridDBBandedColumn
        DataBinding.FieldName = 'grandtotal'
        Position.BandIndex = 0
        Position.ColIndex = 14
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
        DataBinding.FieldName = 'status_trans'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 16
        Position.RowIndex = 0
      end
      object gtbTransMasterroom_id: TcxGridDBBandedColumn
        Caption = 'Room ID'
        DataBinding.FieldName = 'room_id'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbTransMaster
    end
  end
  object cxGrid2: TcxGrid
    Left = 4
    Top = 360
    Width = 809
    Height = 164
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object gtbTransDetail: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmDB.dsTransDetail
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
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
        DataBinding.FieldName = 'produk_jasa_id'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtbTransDetailproduk_jasa_nama: TcxGridDBBandedColumn
        DataBinding.FieldName = 'produk_jasa_nama'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtbTransDetailstart_time: TcxGridDBBandedColumn
        DataBinding.FieldName = 'start_time'
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtbTransDetailend_time: TcxGridDBBandedColumn
        DataBinding.FieldName = 'end_time'
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtbTransDetailharga: TcxGridDBBandedColumn
        DataBinding.FieldName = 'harga'
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object gtbTransDetaildisc_amount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'disc_amount'
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object gtbTransDetaildisc_percent: TcxGridDBBandedColumn
        DataBinding.FieldName = 'disc_percent'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object gtbTransDetailsubtotal: TcxGridDBBandedColumn
        DataBinding.FieldName = 'subtotal'
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object gtbTransDetailteraphist_id: TcxGridDBBandedColumn
        DataBinding.FieldName = 'teraphist_id'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object gtbTransDetailroom_id: TcxGridDBBandedColumn
        DataBinding.FieldName = 'room_id'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 14
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
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = gtbTransDetail
    end
  end
  object cxButton1: TcxButton
    Left = 4
    Top = 288
    Width = 149
    Height = 61
    Caption = 'Start Trans'
    TabOrder = 2
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfOffice11
  end
end
