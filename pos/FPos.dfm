object frmPos: TfrmPos
  Left = 200
  Top = 80
  ClientHeight = 604
  ClientWidth = 1063
  Color = clMoneyGreen
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    1063
    604)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 4
    Top = 12
    Width = 29
    Height = 15
    Caption = 'SO ID'
    Transparent = True
  end
  object Label2: TLabel
    Left = 4
    Top = 36
    Width = 42
    Height = 15
    Caption = 'Tanggal '
    Transparent = True
  end
  object Label3: TLabel
    Left = 4
    Top = 60
    Width = 69
    Height = 15
    Caption = 'Waktu Mulai'
    Transparent = True
  end
  object Label4: TLabel
    Left = 4
    Top = 108
    Width = 89
    Height = 15
    Caption = 'Nama Customer'
    Transparent = True
  end
  object Label6: TLabel
    Left = 4
    Top = 132
    Width = 46
    Height = 15
    Caption = 'Room ID'
    Transparent = True
  end
  object Label7: TLabel
    Left = 4
    Top = 545
    Width = 46
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'SubTotal'
    Transparent = True
  end
  object Label8: TLabel
    Left = 4
    Top = 84
    Width = 76
    Height = 15
    Caption = 'Waktu Selesai'
    Transparent = True
  end
  object Label9: TLabel
    Left = 4
    Top = 517
    Width = 65
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Total Waktu'
    Transparent = True
  end
  object Label11: TLabel
    Left = 4
    Top = 156
    Width = 65
    Height = 15
    Caption = 'Therapist ID'
    Transparent = True
  end
  object Label13: TLabel
    Left = 4
    Top = 180
    Width = 31
    Height = 15
    Caption = 'Paket'
    Transparent = True
  end
  object Label5: TLabel
    Left = 200
    Top = 540
    Width = 465
    Height = 21
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Gunakan Control (CTRL) Untuk Shortcut'
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object Label10: TLabel
    Left = 200
    Top = 516
    Width = 465
    Height = 21
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Gunakan Control (CTRL) + M untuk Ke Tabel Transaksi'
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object Label12: TLabel
    Left = 707
    Top = 476
    Width = 61
    Height = 15
    Anchors = [akRight, akBottom]
    Caption = 'Pos Printer'
  end
  object Label14: TLabel
    Left = 707
    Top = 505
    Width = 57
    Height = 15
    Anchors = [akRight, akBottom]
    Caption = 'HK Printer'
  end
  object edTransID: TcxTextEdit
    Left = 96
    Top = 8
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 250
  end
  object edTanggal: TcxDateEdit
    Left = 96
    Top = 32
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 250
  end
  object edWaktu: TcxTimeEdit
    Left = 96
    Top = 56
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 250
  end
  object edNamaCustomer: TcxTextEdit
    Left = 96
    Top = 104
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 205
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 293
    Width = 1041
    Height = 167
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 12
    LookAndFeel.Kind = lfOffice11
    object gtvDetail: TcxGridBandedTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          OnGetText = gtvDetailTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText
          Column = gtvDetailSubtotal
        end
        item
          Kind = skSum
          OnGetText = gtvDetailTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText
          Column = gtvDetailLama
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'DETAIL TRANSAKSI'
          Width = 1012
        end>
      object gtvDetailIDJasa: TcxGridBandedColumn
        Caption = 'ID Jasa / Product'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 130
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvDetailTransType: TcxGridBandedColumn
        Caption = 'TransType'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 77
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvDetailNamaJasa: TcxGridBandedColumn
        Caption = 'Nama Product / Jasa'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 207
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvDetailStart: TcxGridBandedColumn
        Caption = 'Start Time'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvDetailEnd: TcxGridBandedColumn
        Caption = 'End Time'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvDetailHarga: TcxGridBandedColumn
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        HeaderAlignmentHorz = taCenter
        Width = 85
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvDetailDiscPercent: TcxGridBandedColumn
        Caption = 'Disc %'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Properties.OnEditValueChanged = gtvDetailDiscPercentPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 84
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtvDetailDiscAmount: TcxGridBandedColumn
        Caption = 'Disc Amount'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtvDetailSubtotal: TcxGridBandedColumn
        Caption = 'Subtotal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        HeaderAlignmentHorz = taCenter
        Width = 84
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object gtvDetailTherapist: TcxGridBandedColumn
        Caption = 'Therapist ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object gtvDetailRoom: TcxGridBandedColumn
        Caption = 'Room ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Width = 85
        Position.BandIndex = 0
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object gtvDetailAroma: TcxGridBandedColumn
        Caption = 'Aroma'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 71
        Position.BandIndex = 0
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
      object gtvDetailQty: TcxGridBandedColumn
        Caption = 'Qty'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Properties.OnEditValueChanged = gtvDetailQtyPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 56
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtvDetailLama: TcxGridBandedColumn
        Caption = 'Lama'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        HeaderAlignmentHorz = taCenter
        Width = 60
        Position.BandIndex = 0
        Position.ColIndex = 15
        Position.RowIndex = 0
      end
      object gtvDetailDiscFB: TcxGridBandedColumn
        Caption = 'Disc FB %'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 62
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object gtvDetailSubtotalDisc: TcxGridBandedColumn
        Caption = 'Subtotal Disc %'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 96
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvDetail
    end
  end
  object btnNew: TcxButton
    Left = 360
    Top = 8
    Width = 85
    Height = 45
    Hint = 'Transaksi Baru ( CNTRL + N )'
    Caption = 'New (N)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnNewClick
  end
  object btnBuyJasa: TcxButton
    Left = 736
    Top = 114
    Width = 85
    Height = 50
    Hint = 'Jasa Utama'
    Caption = 'Jasa'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    Visible = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnBuyJasaClick
  end
  object btnSave: TcxButton
    Left = 360
    Top = 60
    Width = 85
    Height = 50
    Hint = 'Simpan Transaksi ( CNTRL + S)'
    Caption = 'SAVE (S)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnSaveClick
  end
  object edIDRoomPos: TcxTextEdit
    Left = 96
    Top = 128
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 6
    Width = 250
  end
  object edSubtotal: TcxCalcEdit
    Left = 76
    Top = 541
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.UseThousandSeparator = True
    TabOrder = 18
    Width = 121
  end
  object btnBuyProduct: TcxButton
    Left = 620
    Top = 8
    Width = 97
    Height = 45
    Hint = 'Pembelian Produk dan GC ( CNTRL + P )'
    Caption = 'Product (G)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnBuyProductClick
  end
  object btnView: TcxButton
    Left = 552
    Top = 60
    Width = 178
    Height = 50
    Hint = 'Lihat Transaksi yang sedang berjalan (CTRL+V)'
    Caption = 'VIEW TRANSACTION (V)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnViewClick
  end
  object btnAdditional: TcxButton
    Left = 719
    Top = 8
    Width = 114
    Height = 45
    Hint = 'Additional waktu dan Lulur ( CNTRL + A)'
    Caption = 'Additional (A)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnAdditionalClick
  end
  object edSelesai: TcxTimeEdit
    Left = 96
    Top = 80
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 250
  end
  object edLamaPos: TcxCalcEdit
    Left = 76
    Top = 513
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.UseThousandSeparator = True
    TabOrder = 22
    Width = 121
  end
  object btnCancel: TcxButton
    Left = 733
    Top = 60
    Width = 96
    Height = 50
    Hint = 'Pembatalan Transaksi(CTRL + C)'
    Caption = 'CANCEL (C)'
    DropDownMenu = pmCancel
    Kind = cxbkDropDown
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnChangeTR: TcxButton
    Left = 4
    Top = 250
    Width = 120
    Height = 36
    Hint = 'Ganti Therapist (Control + T)'
    Caption = 'Change Therapist (T)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnChangeTRClick
  end
  object btnChangeRoom: TcxButton
    Left = 124
    Top = 250
    Width = 120
    Height = 36
    Hint = 'Ganti Ruangan (Control + R)'
    Caption = 'Change Room (R)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnChangeRoomClick
  end
  object btnPrintSO: TcxButton
    Left = 448
    Top = 60
    Width = 101
    Height = 50
    Hint = 'Print Sales Order ( CNTRL + P)'
    Caption = 'Print SO (P)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnPrintSOClick
  end
  object edTherapistPos: TcxTextEdit
    Left = 96
    Top = 152
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 250
  end
  object btnPay: TcxButton
    Left = 780
    Top = 220
    Width = 93
    Height = 25
    Caption = 'PAY'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 25
    Visible = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnPayClick
  end
  object btnMerge: TcxButton
    Left = 780
    Top = 192
    Width = 93
    Height = 25
    Caption = 'MERGE OTHERS'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 26
    Visible = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnMergeClick
  end
  object cxNavigator1: TcxNavigator
    Left = 4
    Top = 464
    Width = 255
    Height = 41
    Control = cxGrid1
    Buttons.CustomButtons = <>
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Last.Visible = True
    Buttons.Insert.Visible = False
    Buttons.Delete.Hint = 'DELETE'
    Buttons.Delete.Visible = False
    Buttons.Edit.Visible = False
    Buttons.Post.Visible = False
    Buttons.Cancel.Visible = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    Anchors = [akLeft, akBottom]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
  end
  object edPaketPos: TcxTextEdit
    Left = 96
    Top = 176
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    Properties.OnEditValueChanged = edPaketPosPropertiesEditValueChanged
    TabOrder = 8
    Width = 249
  end
  object edGender: TcxComboBox
    Left = 304
    Top = 104
    Properties.CharCase = ecUpperCase
    Properties.Items.Strings = (
      'M'
      'F')
    TabOrder = 5
    Text = 'M'
    Width = 41
  end
  object edPromo: TcxCheckBox
    Left = 0
    Top = 200
    Caption = 'Promo Pelajar'
    Properties.Alignment = taRightJustify
    Properties.NullStyle = nssUnchecked
    Properties.ReadOnly = True
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsGrayed
    TabOrder = 14
  end
  object btnChecked: TcxButton
    Left = 116
    Top = 200
    Width = 80
    Height = 25
    Hint = 'Ganti Status Promo(CTRL + Y)'
    Caption = 'Change (Y)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnCheckedClick
  end
  object ckFB: TcxCheckBox
    Left = 0
    Top = 224
    Caption = 'Promo FB'
    Enabled = False
    Properties.Alignment = taRightJustify
    Properties.NullStyle = nssUnchecked
    Properties.ReadOnly = True
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsGrayed
    TabOrder = 28
  end
  object btnFB: TcxButton
    Left = 116
    Top = 224
    Width = 80
    Height = 25
    Hint = 'Ganti Status Promo (CTRL+H)'
    Caption = 'Change (H)'
    Enabled = False
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 29
    OnClick = btnFBClick
  end
  object btnBM: TcxButton
    Left = 452
    Top = 8
    Width = 81
    Height = 45
    Hint = 'Jasa BM ( CNTRL + B )'
    Caption = 'BODY (B)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 30
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnBMClick
  end
  object btnRF: TcxButton
    Left = 536
    Top = 8
    Width = 81
    Height = 45
    Hint = 'Jasa RF( CNTRL + F )'
    Caption = 'FOOT (F)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 31
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnRFClick
  end
  object btnVoid: TcxButton
    Left = 264
    Top = 466
    Width = 121
    Height = 37
    Hint = 'Cancel Order Detail (Control + E)'
    Anchors = [akLeft, akBottom]
    Caption = 'VOID PRUDUCT (E)'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = btnVoidClick
  end
  object btnNewTrans: TcxButton
    Left = 357
    Top = 116
    Width = 189
    Height = 55
    Caption = 'NEW MENU'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Black'
    TabOrder = 32
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnNewTransClick
  end
  object cbPrinterHK: TComboBox
    Left = 780
    Top = 502
    Width = 265
    Height = 23
    Anchors = [akRight, akBottom]
    TabOrder = 33
    Text = 'select printer'
  end
  object cbPrinterPos: TComboBox
    Left = 780
    Top = 473
    Width = 265
    Height = 23
    Anchors = [akRight, akBottom]
    TabOrder = 34
    Text = 'select printer'
  end
  object pmCancel: TPopupMenu
    Left = 852
    Top = 52
    object BYTHERAPIST1: TMenuItem
      Caption = 'BY THERAPIST'
      OnClick = BYTHERAPIST1Click
    end
    object BYCUSTOMER1: TMenuItem
      Caption = 'BY CUSTOMER'
      OnClick = BYCUSTOMER1Click
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 912
    Top = 124
  end
  object appEven: TApplicationEvents
    OnShortCut = appEvenShortCut
    Left = 852
    Top = 4
  end
  object TransMaster: TMyQuery
    Connection = dmDB.dbInternal
    Left = 368
    Top = 188
  end
  object dsTransMaster: TMyDataSource
    DataSet = TransMaster
    Left = 372
    Top = 240
  end
  object transDetail: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans_detail where id_trans = '#39'X'#39)
    Active = True
    Left = 524
    Top = 204
  end
  object dsTransDetail: TMyDataSource
    DataSet = transDetail
    Left = 604
    Top = 208
  end
  object qryRoom: TMyQuery
    Connection = dmDB.dbInternal
    Left = 584
    Top = 140
  end
  object dsQryRoom: TMyDataSource
    DataSet = qryRoom
    Left = 664
    Top = 140
  end
  object MenuTrans: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from menu_master '
      'where jenis_jasa_id = '#39'BM'#39
      'AND aktif = '#39'Y'#39' order by nama_menu ASC'#39)
    Left = 452
    Top = 188
  end
  object dsMenuTrans: TMyDataSource
    DataSet = MenuTrans
    Left = 456
    Top = 240
  end
end
