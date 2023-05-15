object frmTransaksiBank: TfrmTransaksiBank
  Left = 0
  Top = 0
  Caption = 'Transaksi Bank'
  ClientHeight = 511
  ClientWidth = 800
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    800
    511)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 2
    Width = 784
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '.: Transaksi Bank :.'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 119
    Width = 784
    Height = 263
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = ''
    object gtvBank: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Cancel.Visible = True
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtvBankNoBank
        end
        item
          Format = '#,0.#0'
          Kind = skSum
          OnGetText = gtvBankTcxGridDataControllerTcxDataSummaryFooterSummaryItems1GetText
          Column = gtvBankJumlah
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.DeletingConfirmation = False
      OptionsSelection.CellMultiSelect = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtvBankNoBank: TcxGridColumn
        Caption = 'NO. BANK'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object gtvBankCOA: TcxGridColumn
        Caption = 'COA'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_detail'
        Properties.ListColumns = <
          item
            FieldName = 'nama_detail'
          end>
        Properties.ListSource = dmDB.dsTblCoaDetail
        HeaderAlignmentHorz = taCenter
        Width = 250
      end
      object gtvBankKeterangan: TcxGridColumn
        Caption = 'KETERANGAN'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 350
      end
      object gtvBankJumlah: TcxGridColumn
        Caption = 'SUBTOTAL'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,0.#0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvBank
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 6
    Top = 31
    Anchors = [akLeft, akTop, akRight]
    Caption = 'TAMBAH DATA TRANSAKSI BANK'
    Style.LookAndFeel.SkinName = ''
    StyleDisabled.LookAndFeel.SkinName = ''
    StyleFocused.LookAndFeel.SkinName = ''
    StyleHot.LookAndFeel.SkinName = ''
    TabOrder = 1
    Transparent = True
    Height = 84
    Width = 784
    object Label2: TLabel
      Left = 30
      Top = 60
      Width = 44
      Height = 13
      Caption = 'STATUS'
    end
    object Label6: TLabel
      Left = 30
      Top = 38
      Width = 52
      Height = 13
      Caption = 'TANGGAL'
    end
    object Label8: TLabel
      Left = 30
      Top = 17
      Width = 84
      Height = 13
      Caption = 'NO BUKTI BANK'
    end
    object Label5: TLabel
      Left = 372
      Top = 17
      Width = 54
      Height = 13
      Caption = 'REKENING'
    end
    object Label9: TLabel
      Left = 602
      Top = 17
      Width = 29
      Height = 13
      Caption = 'BANK'
    end
    object edTglBank: TcxDateEdit
      Left = 128
      Top = 35
      EditValue = 0d
      TabOrder = 1
      Width = 167
    end
    object edNoBuktiBank: TcxTextEdit
      Left = 128
      Top = 14
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 167
    end
    object edStatus: TcxComboBox
      Left = 128
      Top = 56
      Properties.Items.Strings = (
        'MASUK'
        'KELUAR')
      TabOrder = 2
      Width = 167
    end
    object btnDelete: TcxButton
      Left = 695
      Top = 48
      Width = 70
      Height = 33
      Caption = 'Delete'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object btnBrowse: TcxButton
      Left = 614
      Top = 48
      Width = 70
      Height = 33
      Caption = 'Browse'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 4
      WordWrap = True
      OnClick = btnBrowseClick
    end
    object btnPrint: TcxButton
      Left = 534
      Top = 48
      Width = 70
      Height = 33
      Caption = 'Print'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 5
      WordWrap = True
      OnClick = btnPrintClick
    end
    object btnSave: TcxButton
      Left = 453
      Top = 48
      Width = 70
      Height = 33
      Caption = 'Save'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 6
      OnClick = btnSaveClick
    end
    object btnNew: TcxButton
      Left = 371
      Top = 48
      Width = 70
      Height = 33
      Caption = 'New'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 7
      OnClick = btnNewClick
    end
    object edNoRek: TcxLookupComboBox
      Left = 438
      Top = 14
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'no_rek'
      Properties.ListColumns = <
        item
          Caption = 'No Rekening'
          Fixed = True
          HeaderAlignment = taCenter
          Width = 100
          FieldName = 'no_rek'
        end
        item
          Caption = 'Bank'
          Fixed = True
          HeaderAlignment = taCenter
          FieldName = 'id_bank'
        end>
      Properties.ListSource = dmDB.dsTblMasterRek
      Properties.OnValidate = edNoRekPropertiesValidate
      TabOrder = 8
      Width = 145
    end
    object edIDBank: TcxLookupComboBox
      Left = 644
      Top = 14
      Properties.KeyFieldNames = 'id_bank'
      Properties.ListColumns = <
        item
          FieldName = 'nama_bank'
        end>
      Properties.ListSource = dmDB.dsTblMasterBank
      Properties.ReadOnly = True
      TabOrder = 9
      Width = 121
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 388
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'TAMBAH DATA DETAIL BANK'
    Style.LookAndFeel.SkinName = ''
    StyleDisabled.LookAndFeel.SkinName = ''
    StyleFocused.LookAndFeel.SkinName = ''
    StyleHot.LookAndFeel.SkinName = ''
    TabOrder = 2
    Transparent = True
    DesignSize = (
      782
      115)
    Height = 115
    Width = 782
    object Label4: TLabel
      Left = 29
      Top = 83
      Width = 46
      Height = 13
      Caption = 'JUMLAH'
    end
    object Label7: TLabel
      Left = 29
      Top = 39
      Width = 23
      Height = 13
      Caption = 'COA'
    end
    object Label3: TLabel
      Left = 29
      Top = 60
      Width = 72
      Height = 13
      Caption = 'KETERANGAN'
    end
    object Label10: TLabel
      Left = 29
      Top = 17
      Width = 45
      Height = 13
      Caption = 'CABANG'
    end
    object edCOA: TcxLookupComboBox
      Left = 127
      Top = 37
      Properties.KeyFieldNames = 'id_detail'
      Properties.ListColumns = <
        item
          FieldName = 'nama_detail'
        end>
      Properties.ListSource = dmDB.dsQryCari
      TabOrder = 0
      Width = 293
    end
    object edJumlah: TcxCalcEdit
      Left = 127
      Top = 79
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,0.#0'
      TabOrder = 2
      Width = 142
    end
    object edKeterangan: TcxTextEdit
      Left = 127
      Top = 58
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 293
    end
    object btnTambah: TcxButton
      Left = 474
      Top = 47
      Width = 70
      Height = 33
      Anchors = [akLeft, akBottom]
      Caption = 'Tambah'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 3
      OnClick = btnTambahClick
    end
    object btnClear: TcxButton
      Left = 556
      Top = 47
      Width = 70
      Height = 33
      Anchors = [akLeft, akBottom]
      Caption = 'Clear'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 4
      OnClick = btnClearClick
    end
    object edCabang: TcxLookupComboBox
      Left = 127
      Top = 15
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'autonum'
      Properties.ListColumns = <
        item
          FieldName = 'nama_cabang'
        end>
      Properties.ListSource = dmDB.dsTblCabang
      Properties.OnChange = edCabangPropertiesChange
      TabOrder = 5
      Width = 293
    end
  end
end
