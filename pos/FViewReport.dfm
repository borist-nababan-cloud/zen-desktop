object frmViewTrans: TfrmViewTrans
  Left = 191
  Top = 89
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 558
  ClientWidth = 942
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
  object Label1: TLabel
    Left = 692
    Top = 12
    Width = 54
    Height = 15
    Caption = 'Start Date'
    Transparent = True
    Visible = False
  end
  object Label2: TLabel
    Left = 692
    Top = 36
    Width = 48
    Height = 15
    Caption = 'End Date'
    Transparent = True
    Visible = False
  end
  object edStart: TcxDateEdit
    Left = 748
    Top = 8
    EditValue = 0d
    TabOrder = 2
    Visible = False
    Width = 121
  end
  object pgControl: TcxPageControl
    Left = 0
    Top = 72
    Width = 942
    Height = 486
    ActivePage = pgPayment
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    LookAndFeel.Kind = lfOffice11
    TabOrder = 3
    ClientRectBottom = 486
    ClientRectRight = 942
    ClientRectTop = 26
    object pgPayment: TcxTabSheet
      Caption = 'By Payment'
      ImageIndex = 1
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 942
        Height = 460
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object gtbTransPayment: TcxGridDBBandedTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dmDB.dsTransPayment
          DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '#,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,#'
              Kind = skSum
            end
            item
              Kind = skCount
              Position = spFooter
              Column = gtbTransPaymentpayment_via
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#,#'
              Kind = skSum
            end
            item
              Kind = skCount
              Column = gtbTransPaymentpayment_via
            end
            item
              Kind = skCount
              Column = gtbTransPaymentid_payment
            end>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 'Klik di sin untuk Filter data'
          FilterRow.Visible = True
          OptionsBehavior.ImmediateEditor = False
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.Footer = True
          OptionsView.Indicator = True
          Bands = <
            item
              Caption = 'PAYMENT ID'
              Width = 474
            end
            item
              Caption = 'MEMBER POINT'
            end
            item
              Caption = 'PEMBAYARAN'
            end>
          object gtbTransPaymentid_payment: TcxGridDBBandedColumn
            Caption = 'Payment'
            DataBinding.FieldName = 'id_payment'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 101
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object gtbTransPaymenttanggal: TcxGridDBBandedColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'tanggal'
            PropertiesClassName = 'TcxDateEditProperties'
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
            Width = 117
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object gtbTransPaymentwaktu: TcxGridDBBandedColumn
            Caption = 'Waktu'
            DataBinding.FieldName = 'waktu'
            PropertiesClassName = 'TcxTimeEditProperties'
            HeaderAlignmentHorz = taCenter
            SortIndex = 1
            SortOrder = soAscending
            Width = 98
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object gtbTransPaymentid_member: TcxGridDBBandedColumn
            Caption = 'ID MEMBERS'
            DataBinding.FieldName = 'id_member'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.CharCase = ecUpperCase
            Properties.KeyFieldNames = 'id_members'
            Properties.ListColumns = <
              item
                FieldName = 'no_kartu'
              end>
            Properties.ListSource = dmDB.dsTblMembers
            Properties.ReadOnly = False
            OnGetDisplayText = gtbTransPaymentid_memberGetDisplayText
            SortIndex = 2
            SortOrder = soAscending
            Width = 90
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object gtbTransPaymentnama_member: TcxGridDBBandedColumn
            Caption = 'Nama'
            DataBinding.FieldName = 'nama_member'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 116
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object gtbTransPaymentsubtotal: TcxGridDBBandedColumn
            Caption = 'Subtotal'
            DataBinding.FieldName = 'subtotal'
            PropertiesClassName = 'TcxCalcEditProperties'
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 69
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object gtbTransPaymentdisc_percent: TcxGridDBBandedColumn
            Caption = 'Disc %'
            DataBinding.FieldName = 'disc_percent'
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 82
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object gtbTransPaymentdisc_amount: TcxGridDBBandedColumn
            Caption = 'Disc Rp'
            DataBinding.FieldName = 'disc_amount'
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object gtbTransPaymenttotal: TcxGridDBBandedColumn
            Caption = 'GrandTotal'
            DataBinding.FieldName = 'total'
            PropertiesClassName = 'TcxCalcEditProperties'
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 83
            Position.BandIndex = 2
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object gtbTransPaymentpembayaran: TcxGridDBBandedColumn
            Caption = 'Bayar'
            DataBinding.FieldName = 'pembayaran'
            PropertiesClassName = 'TcxCalcEditProperties'
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            Position.BandIndex = 2
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object gtbTransPaymentkembalian: TcxGridDBBandedColumn
            Caption = 'Kembali'
            DataBinding.FieldName = 'kembalian'
            PropertiesClassName = 'TcxCalcEditProperties'
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            Position.BandIndex = 2
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object gtbTransPaymentpoint_awal: TcxGridDBBandedColumn
            Caption = 'Point Awal'
            DataBinding.FieldName = 'point_awal'
            PropertiesClassName = 'TcxCalcEditProperties'
            HeaderAlignmentHorz = taCenter
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object gtbTransPaymenttambah_point: TcxGridDBBandedColumn
            Caption = 'Tambah'
            DataBinding.FieldName = 'tambah_point'
            PropertiesClassName = 'TcxCalcEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 110
            Position.BandIndex = 1
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object gtbTransPaymentkurang_point: TcxGridDBBandedColumn
            Caption = 'Kurang'
            DataBinding.FieldName = 'kurang_point'
            PropertiesClassName = 'TcxCalcEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 106
            Position.BandIndex = 1
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object gtbTransPaymentsisa: TcxGridDBBandedColumn
            Caption = 'Sisa'
            DataBinding.FieldName = 'sisa'
            PropertiesClassName = 'TcxCalcEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 75
            Position.BandIndex = 1
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object gtbTransPaymentpayment_via: TcxGridDBBandedColumn
            Caption = 'Payment By'
            DataBinding.FieldName = 'payment_via'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            GroupIndex = 0
            Width = 158
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object gtbTransPaymentpayment_ref: TcxGridDBBandedColumn
            Caption = 'Referensi'
            DataBinding.FieldName = 'payment_ref'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            Width = 93
            Position.BandIndex = 2
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object gtbTransPaymentstaff_id: TcxGridDBBandedColumn
            DataBinding.FieldName = 'staff_id'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object gtbTransPaymentnotes: TcxGridDBBandedColumn
            DataBinding.FieldName = 'notes'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object gtbTransPaymentcabang: TcxGridDBBandedColumn
            Caption = 'CABANG'
            DataBinding.FieldName = 'cabang'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = gtbTransPayment
        end
      end
    end
  end
  object edEnd: TcxDateEdit
    Left = 748
    Top = 32
    EditValue = 0d
    TabOrder = 4
    Visible = False
    Width = 121
  end
  object cxButton1: TcxButton
    Left = 156
    Top = 8
    Width = 125
    Height = 49
    Caption = 'VIEW TRANSAKSI'
    Default = True
    LookAndFeel.Kind = lfOffice11
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 288
    Top = 8
    Width = 141
    Height = 49
    Caption = 'EXPORT TO EXCEL'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 435
    Top = 8
    Width = 125
    Height = 49
    Caption = 'Print Bill'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 5
    OnClick = cxButton3Click
  end
  object dlgSave: TSaveDialog
    Options = [ofOverwritePrompt, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Left = 648
    Top = 4
  end
end
