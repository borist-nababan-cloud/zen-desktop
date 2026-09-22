object frmPosPembayaran: TfrmPosPembayaran
  Left = 0
  Top = 0
  Caption = '   PoS Payment'
  ClientHeight = 708
  ClientWidth = 1172
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object tabControl: TcxPageControl
    Left = 0
    Top = 0
    Width = 1172
    Height = 708
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tabMain
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 705
    ClientRectLeft = 2
    ClientRectRight = 1169
    ClientRectTop = 30
    object tabMain: TcxTabSheet
      Caption = 'tabMain'
      ImageIndex = 0
      DesignSize = (
        1167
        675)
      object Label12: TLabel
        Left = 852
        Top = 325
        Width = 62
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = 'Pos Printer'
        ExplicitTop = 356
      end
      object lblNotif: TLabel
        Left = 1148
        Top = 315
        Width = 12
        Height = 16
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 1151
        ExplicitTop = 346
      end
      object cxGrid1: TcxGrid
        Left = 4
        Top = 10
        Width = 1160
        Height = 299
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object tvPembayaran: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#,#'
              Kind = skSum
              OnGetText = tvPembayaranTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText
              Column = tvPembayaranSubtotal
            end
            item
              Format = '#,#'
              Kind = skSum
              Column = tvPembayaranHarga
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tvPembayaranTransID: TcxGridColumn
            Caption = 'Kode Trans'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 150
          end
          object tvPembayaranNamaCust: TcxGridColumn
            Caption = 'Nama Cusutomer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 300
          end
          object tvPembayaranRuangan: TcxGridColumn
            Caption = 'Ruangan'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 100
          end
          object tvPembayaranTherapist: TcxGridColumn
            Caption = 'TR ID'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 100
          end
          object tvPembayaranSubtotal: TcxGridColumn
            Caption = 'Subtotal'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.ReadOnly = True
            Properties.UseThousandSeparator = True
            Width = 100
          end
          object tvPembayaranDetails: TcxGridColumn
            Caption = 'Details'
            PropertiesClassName = 'TcxTextEditProperties'
            Width = 200
          end
          object tvPembayaranHarga: TcxGridColumn
            Caption = 'Harga'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.UseThousandSeparator = True
            Width = 100
          end
          object tvPembayaranIDTrans: TcxGridColumn
            Caption = 'KodeTrans'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = tvPembayaran
        end
      end
      object cxGroupBox1: TcxGroupBox
        Left = 4
        Top = 381
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Details '
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        Height = 258
        Width = 1156
        object Label2: TLabel
          Left = 12
          Top = 24
          Width = 115
          Height = 18
          Caption = 'Subtotal Payment'
        end
        object Label3: TLabel
          Left = 12
          Top = 53
          Width = 72
          Height = 18
          Caption = 'Add Promo'
        end
        object Label4: TLabel
          Left = 12
          Top = 120
          Width = 108
          Height = 18
          Caption = 'Potongan Promo'
        end
        object Label5: TLabel
          Left = 12
          Top = 152
          Width = 55
          Height = 18
          Caption = 'Discount'
        end
        object Label6: TLabel
          Left = 12
          Top = 88
          Width = 91
          Height = 18
          Caption = 'Voucher Code'
        end
        object Label7: TLabel
          Left = 560
          Top = 138
          Width = 87
          Height = 21
          Caption = 'Grand Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 12
          Top = 184
          Width = 82
          Height = 18
          Caption = 'Add Purpose'
        end
        object dxBevel1: TdxBevel
          Left = 532
          Top = 24
          Width = 14
          Height = 209
          Shape = dxbsLineRight
        end
        object Label9: TLabel
          Left = 555
          Top = 25
          Width = 75
          Height = 18
          Caption = 'Member ID'
        end
        object Label10: TLabel
          Left = 555
          Top = 57
          Width = 98
          Height = 18
          Caption = 'Nama Member'
        end
        object Label11: TLabel
          Left = 555
          Top = 89
          Width = 90
          Height = 18
          Caption = 'Point Member'
        end
        object lblNoKartu: TLabel
          Left = 948
          Top = 90
          Width = 20
          Height = 18
          Caption = '    '
        end
        object lblKodeMember: TLabel
          Left = 948
          Top = 141
          Width = 20
          Height = 18
          Caption = '    '
          Visible = False
        end
        object edSubtotal: TcxCalcEdit
          Left = 186
          Top = 21
          EditValue = 0.000000000000000000
          Properties.ReadOnly = True
          Properties.UseThousandSeparator = True
          TabOrder = 0
          Width = 259
        end
        object edPromo: TcxLookupComboBox
          Left = 186
          Top = 53
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'kodepromo'
          Properties.ListColumns = <
            item
              FieldName = 'namapromo'
            end>
          Properties.ListSource = dsQryPromo
          Properties.OnEditValueChanged = edPromoPropertiesEditValueChanged
          TabOrder = 1
          Width = 259
        end
        object edPromoRef: TcxTextEdit
          Left = 186
          Top = 85
          TabOrder = 2
          TextHint = 'Input Voucher Code Here...'
          Width = 259
        end
        object edDiscPromo: TcxCalcEdit
          Left = 186
          Top = 117
          EditValue = 0.000000000000000000
          Properties.ReadOnly = True
          Properties.UseThousandSeparator = True
          TabOrder = 3
          Width = 259
        end
        object edDiscPurpose: TcxCalcEdit
          Left = 186
          Top = 149
          EditValue = 0.000000000000000000
          Properties.ReadOnly = True
          TabOrder = 4
          Width = 259
        end
        object cxButton1: TcxButton
          Left = 216
          Top = 213
          Width = 75
          Height = 25
          Caption = 'Add Disc'
          TabOrder = 5
          OnClick = cxButton1Click
        end
        object btnClearDisc: TcxButton
          Left = 308
          Top = 213
          Width = 75
          Height = 25
          Caption = 'Clear Disc'
          TabOrder = 6
          OnClick = btnClearDiscClick
        end
        object edPurpose: TcxTextEdit
          Left = 186
          Top = 181
          Properties.ReadOnly = True
          TabOrder = 7
          TextHint = 'Addition Purpose'
          Width = 259
        end
        object edGrandTotal: TcxCalcEdit
          Left = 676
          Top = 135
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.ReadOnly = True
          Properties.UseThousandSeparator = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 8
          Width = 259
        end
        object btnClearPromo: TcxButton
          Left = 451
          Top = 54
          Width = 83
          Height = 25
          Caption = 'Clear Promo'
          TabOrder = 9
          OnClick = btnClearPromoClick
        end
        object btnSetPayment: TcxButton
          Left = 676
          Top = 170
          Width = 189
          Height = 63
          Caption = 'Set Payment'
          TabOrder = 10
          OnClick = btnSetPaymentClick
        end
        object edScan: TcxTextEdit
          Left = 676
          Top = 22
          Properties.EchoMode = eemPassword
          Properties.PasswordChar = '#'
          TabOrder = 11
          TextHint = 'Scan Member Code Here...'
          OnKeyPress = edScanKeyPress
          Width = 259
        end
        object btnLoadMember: TcxButton
          Left = 948
          Top = 12
          Width = 101
          Height = 57
          Caption = 'Load'
          TabOrder = 12
          OnClick = btnLoadMemberClick
        end
        object edMemberNama: TcxTextEdit
          Left = 676
          Top = 54
          Properties.ReadOnly = True
          TabOrder = 13
          TextHint = 'Scan Member Code Here...'
          Width = 259
        end
        object edMemberPoint: TcxCalcEdit
          Left = 676
          Top = 86
          EditValue = 0.000000000000000000
          Properties.ReadOnly = True
          Properties.UseThousandSeparator = True
          TabOrder = 14
          Width = 259
        end
        object cxButton2: TcxButton
          Left = 1055
          Top = 12
          Width = 90
          Height = 57
          Caption = 'View Data'
          TabOrder = 15
          OnClick = cxButton2Click
        end
      end
      object btnFind: TcxButton
        Left = 4
        Top = 325
        Width = 105
        Height = 55
        Anchors = [akLeft, akBottom]
        Caption = 'Find Trans'
        TabOrder = 2
        OnClick = btnFindClick
      end
      object cxButton3: TcxButton
        Left = 124
        Top = 325
        Width = 105
        Height = 55
        Anchors = [akLeft, akBottom]
        Caption = 'Move Trans'
        TabOrder = 3
        OnClick = cxButton3Click
      end
      object edJasa: TcxCalcEdit
        Left = 287
        Top = 350
        Anchors = [akLeft, akBottom]
        EditValue = 0.000000000000000000
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        TabOrder = 4
        Width = 121
      end
      object edProduk: TcxCalcEdit
        Left = 424
        Top = 350
        Anchors = [akLeft, akBottom]
        EditValue = 0.000000000000000000
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        TabOrder = 5
        Width = 121
      end
      object edAdditional: TcxCalcEdit
        Left = 560
        Top = 350
        Anchors = [akLeft, akBottom]
        EditValue = 0.000000000000000000
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        TabOrder = 6
        Width = 121
      end
      object edGift: TcxCalcEdit
        Left = 696
        Top = 350
        Anchors = [akLeft, akBottom]
        EditValue = 0.000000000000000000
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        TabOrder = 7
        Width = 121
      end
      object cxLabel1: TcxLabel
        Left = 287
        Top = 325
        Anchors = [akLeft, akBottom]
        Caption = 'Tot. Jasa'
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 424
        Top = 325
        Anchors = [akLeft, akBottom]
        Caption = 'Tot. Produk'
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 560
        Top = 325
        Anchors = [akLeft, akBottom]
        Caption = 'Tot. Additional'
        Transparent = True
      end
      object cxLabel4: TcxLabel
        Left = 696
        Top = 325
        Anchors = [akLeft, akBottom]
        Caption = 'Tot. GC'
        Transparent = True
      end
      object cbPrinterPos: TComboBox
        Left = 852
        Top = 350
        Width = 265
        Height = 24
        Anchors = [akLeft, akBottom]
        TabOrder = 12
        Text = 'select printer'
      end
    end
    object tabJSON: TcxTabSheet
      Caption = 'tabJSON'
      ImageIndex = 1
      DesignSize = (
        1167
        675)
      object memHasil: TMemo
        Left = 12
        Top = 12
        Width = 585
        Height = 510
        Anchors = [akLeft, akTop, akBottom]
        Lines.Strings = (
          'memHasil')
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object cxButton4: TcxButton
        Left = 12
        Top = 528
        Width = 97
        Height = 45
        Anchors = [akLeft, akBottom]
        Caption = 'Back'
        TabOrder = 1
        OnClick = cxButton4Click
      end
    end
  end
  object qryPromo: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select kodepromo, namapromo from pos_master_promo where aktif = ' +
        #39'Y'#39)
    Left = 16
    Top = 76
  end
  object dsQryPromo: TMyDataSource
    DataSet = qryPromo
    Left = 16
    Top = 132
  end
end
