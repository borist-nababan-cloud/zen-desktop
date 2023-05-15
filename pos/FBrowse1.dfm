object frmBrowse1: TfrmBrowse1
  Left = 267
  Top = 90
  Caption = 'frmBrowse'
  ClientHeight = 549
  ClientWidth = 891
  Color = clMoneyGreen
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    891
    549)
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 11
    Top = 45
    Width = 60
    Height = 17
    Caption = 'No.Faktur'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 11
    Top = 76
    Width = 61
    Height = 17
    Caption = 'Start Date'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 211
    Top = 76
    Width = 56
    Height = 17
    Caption = 'End Date'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 113
    Width = 875
    Height = 364
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object TvTrans: TcxGridDBTableView
      PopupMenu = pmBrowse
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skSum
          Position = spFooter
        end
        item
          Kind = skSum
          Position = spFooter
        end
        item
          Kind = skSum
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
          Column = TvTransid_faktur
        end
        item
          Kind = skSum
          Position = spFooter
          Column = TvTranstot_qty
        end
        item
          Kind = skSum
          Position = spFooter
          Column = TvTranssubTotal
        end
        item
          Kind = skSum
          Position = spFooter
          Column = TvTransdiscount
        end
        item
          Kind = skSum
          Position = spFooter
          Column = TvTransgrandtotal
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skSum
        end
        item
          Format = '#,#'
          Kind = skSum
        end
        item
          Format = '#,#'
          Kind = skSum
        end
        item
          Kind = skCount
          Column = TvTransid_faktur
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = TvTranstot_qty
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = TvTranssubTotal
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = TvTransdiscount
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = TvTransgrandtotal
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsSelection.InvertSelect = False
      OptionsView.Footer = True
      OptionsView.FooterMultiSummaries = True
      OptionsView.Indicator = True
      object TvTransid_faktur: TcxGridDBColumn
        Caption = 'No. Faktur'
        DataBinding.FieldName = 'id_faktur'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 120
      end
      object TvTransno_nota: TcxGridDBColumn
        Caption = 'No. Nota'
        DataBinding.FieldName = 'no_nota'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        Width = 64
      end
      object TvTranstanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.InputKind = ikRegExpr
        Properties.ReadOnly = True
        Visible = False
        GroupIndex = 0
        SortIndex = 0
        SortOrder = soDescending
        Width = 73
      end
      object TvTranstrans_id: TcxGridDBColumn
        Caption = 'Jenis Transaksi'
        DataBinding.FieldName = 'trans_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_trans'
        Properties.ListColumns = <
          item
            FieldName = 'nama_trans'
          end>
        Properties.ReadOnly = True
        Width = 101
      end
      object TvTransDoz: TcxGridDBColumn
        Caption = 'Doz'
        DataBinding.FieldName = 'tot_qty'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.AssignedValues.DisplayFormat = True
        Properties.ReadOnly = True
        OnGetDisplayText = TvTransDozGetDisplayText
        Width = 47
      end
      object TvTransPcs: TcxGridDBColumn
        Caption = 'Pcs'
        DataBinding.FieldName = 'tot_qty'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.AssignedValues.DisplayFormat = True
        Properties.ReadOnly = True
        OnGetDisplayText = TvTransPcsGetDisplayText
        Width = 37
      end
      object TvTranstot_qty: TcxGridDBColumn
        Caption = 'Total QTY'
        DataBinding.FieldName = 'tot_qty'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Width = 65
      end
      object TvTranssubTotal: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subTotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Width = 73
      end
      object TvTransdiscount: TcxGridDBColumn
        Caption = 'Discount'
        DataBinding.FieldName = 'discount'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Width = 69
      end
      object TvTransretur: TcxGridDBColumn
        Caption = 'Retur'
        DataBinding.FieldName = 'retur'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Visible = False
        Width = 85
      end
      object TvTransgrandtotal: TcxGridDBColumn
        Caption = 'GrandTotal'
        DataBinding.FieldName = 'grandtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Width = 89
      end
      object TvTransnama_cust: TcxGridDBColumn
        DataBinding.FieldName = 'nama_cust'
        Visible = False
      end
      object TvTranspayment_id: TcxGridDBColumn
        Caption = 'Tipe Bayar'
        DataBinding.FieldName = 'payment_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 81
      end
      object TvTransstock: TcxGridDBColumn
        DataBinding.FieldName = 'stock'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
      end
      object TvTransnotes: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 131
      end
      object TvTransid_toko: TcxGridDBColumn
        DataBinding.FieldName = 'id_toko'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = TvTrans
    end
  end
  object btnSelect: TcxButton
    Left = 8
    Top = 488
    Width = 133
    Height = 53
    Anchors = [akBottom]
    Caption = 'SELECT'
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    TabOrder = 1
    OnClick = btnSelectClick
  end
  object edCari: TcxTextEdit
    Left = 87
    Top = 41
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    Width = 144
  end
  object cxButton3: TcxButton
    Left = 253
    Top = 40
    Width = 78
    Height = 29
    Anchors = [akTop, akRight]
    Caption = 'CARI'
    Default = True
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    TabOrder = 3
    OnClick = cxButton3Click
  end
  object edStart: TcxDateEdit
    Left = 84
    Top = 72
    EditValue = 0d
    Properties.OnChange = edStartPropertiesChange
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 4
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 272
    Top = 72
    EditValue = 0d
    Properties.OnChange = edEndPropertiesChange
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 5
    Width = 121
  end
  object btnOK: TcxButton
    Left = 401
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    LookAndFeel.Kind = lfStandard
    TabOrder = 6
    OnClick = btnOKClick
  end
  object edTgl2: TEdit
    Left = 270
    Top = 73
    Width = 107
    Height = 23
    TabOrder = 7
  end
  object edTglShow: TEdit
    Left = 84
    Top = 73
    Width = 107
    Height = 23
    TabOrder = 8
  end
  object edAll: TcxCheckBox
    Left = 8
    Top = 16
    Caption = 'Tampil Semua'
    ParentFont = False
    Properties.OnChange = edAllPropertiesChange
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Times New Roman'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 9
    Visible = False
  end
  object pmBrowse: TPopupMenu
    Left = 424
    Top = 28
    object expand1: TMenuItem
      Caption = 'Expand'
      OnClick = expand1Click
    end
    object Collapse1: TMenuItem
      Caption = 'Collapse'
      OnClick = Collapse1Click
    end
  end
  object qryTrans1: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'SELECT * FROM trans1 where tanggal = CURRENT_DATE')
    Left = 700
    Top = 40
  end
  object dsQryTrans1: TDataSource
    DataSet = qryTrans1
    Left = 752
    Top = 44
  end
end
