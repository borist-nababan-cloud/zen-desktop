object frmHOMasukBarang: TfrmHOMasukBarang
  Left = 0
  Top = 0
  ClientHeight = 577
  ClientWidth = 943
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    943
    577)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 4
    Width = 155
    Height = 19
    Caption = '  MASUK BARANG  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 71
    Height = 13
    Caption = 'ID Transaksi'
  end
  object Label3: TLabel
    Left = 8
    Top = 55
    Width = 45
    Height = 13
    Caption = 'Tanggal'
  end
  object Label4: TLabel
    Left = 586
    Top = 32
    Width = 81
    Height = 13
    Caption = 'Nama Supplier'
  end
  object Label5: TLabel
    Left = 8
    Top = 76
    Width = 35
    Height = 13
    Caption = 'No. PO'
  end
  object Label6: TLabel
    Left = 586
    Top = 59
    Width = 84
    Height = 13
    Caption = 'No. Surat Jalan'
  end
  object Label11: TLabel
    Left = 574
    Top = 416
    Width = 65
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Dibuat Oleh'
  end
  object Label12: TLabel
    Left = 574
    Top = 443
    Width = 67
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Mengetahui'
  end
  object Label13: TLabel
    Left = 574
    Top = 470
    Width = 66
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Keterangan'
  end
  object Label7: TLabel
    Left = 9
    Top = 405
    Width = 66
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Total Items'
  end
  object Label8: TLabel
    Left = 9
    Top = 432
    Width = 52
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Total Qty'
  end
  object edTransID: TcxTextEdit
    Left = 101
    Top = 29
    Enabled = False
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 250
  end
  object edTanggal: TcxDateEdit
    Left = 101
    Top = 52
    EditValue = 0d
    TabOrder = 1
    Width = 250
  end
  object btnNewTrans: TcxButton
    Left = 8
    Top = 100
    Width = 129
    Height = 46
    Caption = 'New Trans'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 2
    OnClick = btnNewTransClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 152
    Width = 921
    Height = 245
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object gtvMasuk: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      OnEditing = gtvMasukEditing
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#.##'
          Kind = skSum
          OnGetText = gtvMasukTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText
          Column = gtvMasukSisa
        end
        item
          Format = '#,#.##'
          Kind = skCount
          OnGetText = gtvMasukTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText
          Column = gtvMasukIDProduk
        end
        item
          Format = '#,#.##'
          Kind = skSum
          OnGetText = gtvMasukTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText
          Column = gtvMasukQtyMasuk
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object gtvMasukIDProduk: TcxGridColumn
        Caption = 'ID Produk'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtvMasukNamaProduk: TcxGridColumn
        Caption = 'Nama Produk'
        Width = 100
      end
      object gtvMasukQtyPO: TcxGridColumn
        Caption = 'QTY PO'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 100
      end
      object gtvMasukQtyMasuk: TcxGridColumn
        Caption = 'Qty Masuk'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Styles.Content = cxStyle1
        Width = 100
      end
      object gtvMasukTotMasuk: TcxGridColumn
        Caption = 'Tot Masuk'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtvMasukSisa: TcxGridColumn
        Caption = 'Sisa'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 100
      end
      object gtvMasukFinish: TcxGridColumn
        Caption = 'Finish'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'N'
        Visible = False
        Width = 100
      end
      object gtvMasukGudang: TcxGridColumn
        Caption = 'Gudang'
        Visible = False
        Width = 100
      end
      object gtvMasukKet: TcxGridColumn
        Caption = 'Keterangan'
        Width = 205
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvMasuk
    end
  end
  object edSupplier: TcxLookupComboBox
    Left = 679
    Top = 29
    Enabled = False
    Properties.KeyFieldNames = 'id_supp'
    Properties.ListColumns = <
      item
        FieldName = 'nama_supp'
      end>
    TabOrder = 4
    Width = 250
  end
  object edNoPO: TcxTextEdit
    Left = 101
    Top = 73
    Enabled = False
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 5
    Width = 250
  end
  object edSJ: TcxTextEdit
    Left = 679
    Top = 56
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    TabOrder = 6
    Width = 250
  end
  object edPrepared: TcxTextEdit
    Left = 666
    Top = 413
    Anchors = [akRight, akBottom]
    Enabled = False
    Properties.CharCase = ecUpperCase
    StyleDisabled.TextColor = clBlack
    TabOrder = 7
    Width = 269
  end
  object edMengetahui: TcxTextEdit
    Left = 666
    Top = 440
    Anchors = [akRight, akBottom]
    Properties.CharCase = ecUpperCase
    TabOrder = 8
    Width = 269
  end
  object edNotes: TcxMemo
    Left = 666
    Top = 467
    Anchors = [akRight, akBottom]
    TabOrder = 9
    Height = 75
    Width = 269
  end
  object btnSave: TcxButton
    Left = 409
    Top = 525
    Width = 129
    Height = 46
    Anchors = [akLeft, akBottom]
    Caption = 'SAVE'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 10
    OnClick = btnSaveClick
  end
  object btnReset: TcxButton
    Left = 552
    Top = 525
    Width = 98
    Height = 46
    Anchors = [akLeft, akBottom]
    Caption = 'Clear'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 11
    OnClick = btnResetClick
  end
  object btnPrint: TcxButton
    Left = 409
    Top = 473
    Width = 129
    Height = 46
    Anchors = [akLeft, akBottom]
    Caption = 'PRINT'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 12
    Visible = False
    OnClick = btnPrintClick
  end
  object edItems: TcxCalcEdit
    Left = 105
    Top = 402
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.##'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clBlack
    TabOrder = 13
    Width = 250
  end
  object edQty: TcxCalcEdit
    Left = 105
    Top = 429
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.##'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clBlack
    TabOrder = 14
    Width = 250
  end
  object ckFinish: TcxCheckBox
    Left = 8
    Top = 456
    Anchors = [akLeft, akBottom]
    Caption = 'PO FINISH'
    Properties.ReadOnly = True
    Properties.ValueChecked = 'Y'
    Properties.ValueGrayed = 'N'
    Properties.ValueUnchecked = 'N'
    State = cbsGrayed
    TabOrder = 15
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 416
    Top = 20
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
    end
  end
end
