object frmMaster1: TfrmMaster1
  Left = 279
  Top = 127
  Caption = 'SESSION 1'
  ClientHeight = 536
  ClientWidth = 969
  Color = clSilver
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  DesignSize = (
    969
    536)
  PixelsPerInch = 96
  TextHeight = 15
  object memBenPrint: TMemo
    Left = 646
    Top = 0
    Width = 185
    Height = 89
    Lines.Strings = (
      'CREATE TABLE `ben_print` ('
      '  `autonum` bigint(20) NOT '
      'NULL AUTO_INCREMENT,'
      '  `idfaktur` varchar(30) NOT '
      'NULL DEFAULT '#39'-'#39','
      '  `tglcetak` date NOT NULL '
      'DEFAULT '#39'0000-00-00'#39','
      '  `waktucetak` time NOT NULL '
      'DEFAULT '#39'00:00:00'#39','
      '  `usercetak` varchar(255) '
      'DEFAULT NULL,'
      '  PRIMARY KEY (`autonum`),'
      '  KEY `idxfakturid` (`idfaktur`));')
    TabOrder = 5
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 689
    Top = 12
    Width = 260
    Height = 489
    Anchors = [akTop, akRight]
    Caption = 'Detail'
    TabOrder = 0
    DesignSize = (
      260
      489)
    object Label2: TLabel
      Left = 5
      Top = 18
      Width = 42
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Tanggal'
      Transparent = True
    end
    object Label12: TLabel
      Left = 5
      Top = 42
      Width = 60
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Jenis Trans'
      Transparent = True
    end
    object Label3: TLabel
      Left = 5
      Top = 67
      Width = 53
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Transaksi'
      Transparent = True
    end
    object Label13: TLabel
      Left = 5
      Top = 95
      Width = 52
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Customer'
      Transparent = True
    end
    object Label4: TLabel
      Left = 5
      Top = 122
      Width = 54
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Total Item'
      Transparent = True
    end
    object Label5: TLabel
      Left = 5
      Top = 146
      Width = 50
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Sub Total'
      Transparent = True
    end
    object Label7: TLabel
      Left = 5
      Top = 171
      Width = 38
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Diskon'
      Transparent = True
    end
    object Label14: TLabel
      Left = 5
      Top = 199
      Width = 29
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Retur'
      Transparent = True
    end
    object Label11: TLabel
      Left = 5
      Top = 226
      Width = 76
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Tipe Bayar (1)'
      Transparent = True
    end
    object Label6: TLabel
      Left = 5
      Top = 250
      Width = 52
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Bayar Rp.'
      Transparent = True
    end
    object Label16: TLabel
      Left = 5
      Top = 278
      Width = 76
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Tipe Bayar (2)'
      Transparent = True
    end
    object Label17: TLabel
      Left = 5
      Top = 302
      Width = 52
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Bayar Rp.'
      Transparent = True
    end
    object Label18: TLabel
      Left = 5
      Top = 328
      Width = 62
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Nama Bank'
      Transparent = True
    end
    object Label19: TLabel
      Left = 5
      Top = 354
      Width = 45
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'No. Giro'
      Transparent = True
    end
    object Label20: TLabel
      Left = 5
      Top = 382
      Width = 85
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Tgl Jatuh Tempo'
      Transparent = True
    end
    object Label21: TLabel
      Left = 5
      Top = 406
      Width = 82
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Total Bayar Rp.'
      Transparent = True
    end
    object Label22: TLabel
      Left = 5
      Top = 432
      Width = 79
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Kembalian Rp.'
      Transparent = True
    end
    object Label10: TLabel
      Left = 5
      Top = 458
      Width = 62
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Keterangan'
      Transparent = True
    end
    object edTanggal: TcxDateEdit
      Left = 96
      Top = 14
      Anchors = [akTop, akRight]
      Properties.OnChange = edTanggalPropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 110
    end
    object edTglShow: TEdit
      Left = 96
      Top = 14
      Width = 96
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object cbJenisTrans: TcxComboBox
      Left = 96
      Top = 40
      Anchors = [akTop, akRight]
      Properties.Items.Strings = (
        'Masuk'
        'Keluar')
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Text = 'Keluar'
      OnClick = cbJenisTransClick
      Width = 110
    end
    object lcbTransID: TcxLookupComboBox
      Left = 96
      Top = 65
      Anchors = [akTop, akRight]
      AutoSize = False
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'id_trans'
      Properties.ListColumns = <
        item
          FieldName = 'nama_trans'
        end>
      Properties.OnValidate = lcbTransIDPropertiesValidate
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      OnClick = lcbTransIDClick
      Height = 23
      Width = 136
    end
    object edCustomer: TcxTextEdit
      Left = 96
      Top = 91
      Anchors = [akTop, akRight]
      Properties.CharCase = ecUpperCase
      Properties.OnValidate = cxTextEdit1PropertiesValidate
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 4
      Width = 110
    end
    object EQty: TcxCalcEdit
      Left = 96
      Top = 117
      Anchors = [akTop, akRight]
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.DisplayFormat = True
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.BorderStyle = ebsFlat
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 5
      Width = 110
    end
    object EdSubTotal: TcxCalcEdit
      Left = 96
      Top = 143
      Anchors = [akTop, akRight]
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,0.#'
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 6
      Width = 110
    end
    object edDiscount: TcxCalcEdit
      Left = 96
      Top = 169
      Anchors = [akTop, akRight]
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,0.#'
      Properties.ReadOnly = False
      Properties.UseThousandSeparator = True
      Properties.OnChange = edDiscountPropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.BorderStyle = ebsFlat
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 7
      Width = 110
    end
    object edRetur: TcxCalcEdit
      Left = 96
      Top = 195
      Anchors = [akTop, akRight]
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,0.#'
      Properties.ReadOnly = False
      Properties.UseThousandSeparator = True
      Properties.OnChange = edReturPropertiesChange
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.BorderStyle = ebsFlat
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 8
      Width = 110
    end
    object edPayment: TcxComboBox
      Left = 96
      Top = 221
      Anchors = [akTop, akRight]
      Properties.Items.Strings = (
        'TUNAI'
        'DEBET CARD'
        'KREDIT'
        'TEMPO'
        'TRANSFER'
        'DP (DOWN PAYMENT)')
      Properties.OnChange = edPaymentPropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 9
      Text = 'TUNAI'
      Width = 110
    end
    object edDP: TcxCalcEdit
      Left = 96
      Top = 247
      Anchors = [akTop, akRight]
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,0.#'
      Properties.ReadOnly = False
      Properties.UseThousandSeparator = True
      Properties.OnChange = edDPPropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 10
      Width = 110
    end
    object edPayment2: TcxComboBox
      Left = 96
      Top = 273
      Anchors = [akTop, akRight]
      Properties.Items.Strings = (
        'TUNAI'
        'DEBET CARD'
        'KREDIT'
        'TEMPO'
        'TRANSFER'
        'DP (DOWN PAYMENT)')
      Properties.OnChange = edPayment2PropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 11
      Text = 'TUNAI'
      Width = 110
    end
    object edBayar2: TcxCalcEdit
      Left = 96
      Top = 299
      Anchors = [akTop, akRight]
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,0.#'
      Properties.ReadOnly = False
      Properties.UseThousandSeparator = True
      Properties.OnChange = edBayar2PropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 12
      Width = 110
    end
    object edNamaBank: TcxTextEdit
      Left = 96
      Top = 324
      Anchors = [akTop, akRight]
      Enabled = False
      Properties.CharCase = ecUpperCase
      Properties.OnValidate = cxTextEdit1PropertiesValidate
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 13
      Width = 110
    end
    object edNoGiro: TcxTextEdit
      Left = 96
      Top = 350
      Anchors = [akTop, akRight]
      Enabled = False
      Properties.CharCase = ecUpperCase
      Properties.OnValidate = cxTextEdit1PropertiesValidate
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 14
      Width = 110
    end
    object edJatuhTempo: TcxDateEdit
      Left = 96
      Top = 378
      Anchors = [akTop, akRight]
      Enabled = False
      Properties.OnChange = edJatuhTempoPropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 15
      Width = 110
    end
    object edEditTgl: TEdit
      Left = 96
      Top = 378
      Width = 96
      Height = 23
      Anchors = [akTop, akRight]
      Enabled = False
      TabOrder = 16
    end
    object edTotBayar: TcxCalcEdit
      Left = 96
      Top = 403
      Anchors = [akTop, akRight]
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,0.#'
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 17
      Width = 110
    end
    object edKembalian: TcxCalcEdit
      Left = 96
      Top = 429
      Anchors = [akTop, akRight]
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,0.#'
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 18
      Width = 110
    end
    object edNotes: TcxTextEdit
      Left = 96
      Top = 453
      Anchors = [akTop, akRight]
      Properties.OnValidate = edNotesPropertiesValidate
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 19
      Width = 137
    end
    object edToko: TcxLookupComboBox
      Left = 96
      Top = 453
      Anchors = [akTop, akRight]
      AutoSize = False
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'nama_toko'
      Properties.ListColumns = <
        item
          FieldName = 'nama_toko'
        end>
      Properties.OnChange = edTokoPropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 20
      Height = 23
      Width = 137
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 399
    Width = 665
    Height = 129
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    object cxGroupBox2: TcxGroupBox
      Left = 1
      Top = 1
      Align = alLeft
      Caption = 'Navigator'
      ParentBackground = False
      ParentColor = False
      Style.BorderStyle = ebsOffice11
      Style.Color = clSilver
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Transparent = True
      DesignSize = (
        366
        127)
      Height = 127
      Width = 366
      object btnStopScanner1: TcxButton
        Left = 76
        Top = 54
        Width = 61
        Height = 40
        Hint = 'Stop Scanner 1'
        Anchors = [akLeft, akBottom]
        LookAndFeel.Kind = lfStandard
        OptionsImage.Glyph.Data = {
          5A0B0000424D5A0B00000000000036000000280000001E0000001F0000000100
          180000000000240B0000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDF9D9DB36E6E
          9C4C4C8F3939893434853939834B4B816969889898A1CBCBCBE8E8E8F2F2F2FC
          FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFE15959B0141491070795060695060694
          06069306069306069406069507079508088B3333868D8DA4EBEBEBFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFD8D8ED5858B308089106069207079207079007079006069006069006
          069006069007079007079007079207079708089845459ACACAD7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9ED3
          1B1B9C0707940808930808940606930505920A0A940E0E971010980F0F980D0D
          980A0A9608089507079408089408089408089813139F8B8BCFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF8B8BCD0B0B970808970A
          0A9809099804049516169E2828AE2222AF1B1BA322229F22229B191997171798
          18189C14149D0C0C9B0B0B990A0A980909980909977474C2FFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFF9D9DD60C0C9C0B0B9C0E0E9D09099C1212
          9F5757C36C6CE28383E1AFAFE5D5D5EFE8E8F5E9E9F5D8D8ECAFAFD97474BD2F
          2F9E18189C1212A110109F0E0E9D0D0D9C0C0C9C8484CAFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFCDCDEB1717A30F0FA11212A30C0CA22828ACA1A1E3BFBFF7
          EBEBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FB5252
          B41717A81515A61313A51212A31010A20F0FA0B7B7E1FFFFFFFFFFFF0000FFFF
          FFFBFBFD4646B71313A71515A81111A82929B1A3A3EBDFDFFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAADE2B2BB41C1CAF
          1B1BAE1818AC1717AB1515A91313A83232AFF2F2FAFFFFFF0000FFFFFFAEAEE0
          1616AB1818AD1818AE2525B47070DEDBDBF9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6A6DE2828B82525B92323B62121B624
          24B62020B41A1AB01818AE1616AC9494D6FFFFFF0000FBFBFE4646BD1B1BB31D
          1DB52121B74646C9C2C2EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF8888D63030C12E2EC12C2CBF2B2BC02D2DBE2D2DA52A2A
          AA2323BA1F1FB61C1CB43333B7F3F3FA0000CDCDED1E1EB62121BA2323BC3232
          C28585D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF8383D73B3BCB3838CA3636C93535C93838C73333A9D9D9EC9D9DD22929BC
          2626BE2222BB1F1FB8B6B6E500009292D92525BF2929C12F2FC63A3ABEE1E1F2
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8585DB4545
          D34141D14040D03F3FD04343CF3737ADD2D2E9FFFFFFF2F2F93838B82F2FC728
          28C12626C07878CF00006A6ACD2E2EC73131C83C3CCF6060C3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9090E04F4FDA4A4AD84A4AD7
          4747D64E4ED83F3FC0D2D2ECFFFFFFFFFFFFFFFFFF6F6FC53636CD2F2FC82D2D
          C75353C600004C4CC53737CF3C3CCF4646D58989CEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF9797E46868E36060E05555DE4E4EDD5C5CE05C
          5CDCD2D2EFFFFFFFFFFFFFFFFFFFFFFFFF9E9ED53A3AD13636CE3333CD4141C5
          00004141C54141D54646D55050DAA3A3D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF9F9FD9999E67474E87171E67070E66666E47373E78D8DF0D7D7F4FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB9B9E03F3FD43D3DD43939D33E3EC900004444
          C64B4BDB5050DB5A5AE0A7A7DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FD95
          95E78080ED7D7DEC7D7DEB7878EA9494EFBEBEF7E0E0F9FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFBCBCE44747DA4443D94040D84141CB00005454C85656E2
          5A5AE06666E69A9ADCFFFFFFFFFFFFFFFFFFFFFFFFF9F9FE9A9AEA8C8BF18989
          F08989F08887F09C9CF3BEBEF8EBEBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFA8A8E15151E14A4ADE4747DF4848CB00006E6ECA6060E76464E570
          70E98888E2FFFFFFFFFFFFFFFFFFFAFAFE9F9FEC9595F49393F39494F39797F4
          A0A0F69393EFE8E8FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF8888E25959E65050E14F4FE55858C800008D8DD06868E96D6DE97777EC7D7D
          E9EDEDFAFFFFFFF9F9FEA4A4EE9D9DF69C9CF59D9DF5A4A4F9A6A6F66E6EDCE4
          E4F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FE6A6AE6
          5F5FE85656E65555E87575CA0000C6C6E56161DD7979EF7F7FEE8A8AF2AFAFEF
          F2F2FCA7A7F0A3A3F7A3A3F6A5A5F6B0B0FCA5A5F26565C6E2E2F5FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0EF6B6BEE6262EB5E
          5EEB5252E1AEAEDC0000FCFCFE6161C78787F78888F19191F49999F4A2A2F2A6
          A6F8A9A9F8ACACF9B9B9FE9E9EED6060B9F1F1F9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6F77878F07171F06969EE6868F14F4F
          D0F1F1F90000FFFFFF9E9ED47D7DEB9393F79898F5A1A1F7A8A8F9ACACF9B0B0
          FABFBFFEA0A0F16969C1F5F5FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFEDEDFC8888F27E7EF67474F26E6EF26A6AF18B8BDBFFFFFF
          0000FFFFFFF6F6FB5F5FCA9F9FFBA09FF7A7A6F8ADADFAB3B3FBBDBDFD9797F0
          6868C6FBFBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFE5E5FB9797F48989F97F7FF67979F57777F57070E9ECECF9FFFFFF0000FFFF
          FFFFFFFFBCBCE16D6DE3AEAEFDADADF9B3B3FBB9B9FBC4C4FE8C8CE7F0F0FAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFEC7C7F7B0B0FA
          A2A2FB8888F88484F77C7CF69595F8BEBEF1FFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFF8B8BD59090F6B7B7FDB8B8FCBEBEFCC3C3FDCECEFFCCCCFFCDCDFBE0E0
          FBF0F0FDF8F8FEF9F9FEF1F1FDE0E0FBCBCBF9BDBDFAC0C0FEB8B8FDA9A9FB8E
          8EFA8585F9AEADFDC0C0F6FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFF9898E0AEAEFFBFBFFEC2C2FDC8C8FDCDCDFED4D4FFD9D9FFD6D6FFD0D0FD
          CFCFFCCDCDFCCBCBFDCECEFFCFCFFFC9C9FFC0C0FEB9B9FDB1B1FD9D9DFDABAB
          FDBFBFF8FAFAFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFC2C2ECCDCDFECECEFFCCCCFED1D1FED4D4FED7D7FFD9D9FFDBDBFFDCDCFFDA
          DAFFD7D7FFD3D3FFCECEFFC8C8FFC4C4FFC6C6FFBDBDFF8888F2A5A5EFFBFBFE
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E6E6F4DADAF6CDCDFFD1D1FFE0E0FFE4E4FFE2E2FFE0E0FFDEDEFFDDDDFFDBDB
          FFDADAFFDADAFFD8D8FFC8C8FD8F8FE05C5CD0C0C0EDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
          FBFDD3D3F09797EB8181EEA2A2F2C1C1F8D3D3FDDADAFFDADAFED1D1FBBEBEF2
          A09FE16A6AC25454B29797D2F4F4FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFFD0D0EC8D8DD46565C65353BE4F4FB74E4EB25151AF6161B68787C6C6
          C6E3FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
        OnClick = btnStopScanner1Click
      end
      object btnStartScanner1: TcxButton
        Left = 16
        Top = 62
        Width = 61
        Height = 40
        Hint = 'Start Scanner 1'
        Anchors = [akLeft, akBottom]
        LookAndFeel.Kind = lfStandard
        OptionsImage.Glyph.Data = {
          5A0B0000424D5A0B00000000000036000000280000001E0000001F0000000100
          180000000000240B0000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8D3D4D3A1AC
          A878988D6493855F96886C9D938AA9A3B7BFBDE9E9E9FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFEDEDEDD7D7D7BDBDBD7A827E34614C0A6E4300935A00B174
          00C28A00D19F00DCAF00E3B800D0A91BB2956C9F94D4D6D5FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFF0F0
          F0B9B9B9777777414542123825004E27006536007B4600935B00A86F00B88300
          C69600D1A600D9B000DAB300DCB200D9AF0DB391799F96F4F4F4FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFAFAFAD3D3D39191914E4E4E
          18251E003D1E004C25004F27005E3200744200905802A76D04B88306C69605D1
          A601D8AF00D6AE00D2AA00CDA500CDA500CCA03D9981E9E9E9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFBFBFBC7C7C77C7C7C48484819272000442200
          4B26004520004A240563370A88530BA77215C5A013D4B913DBC21DE2C91CE3C8
          13DDBF12D7B304CDA500C59D00C29800CA993D997FF0F0F0FFFFFFFFFFFFFFFF
          FFFFFFFF0000FEFEFED5D5D58585854F4F4F272A29013D1F004C26004321044C
          280A7846099A5E05AB6E01BA8800CCAB00D9C100E1CC00E6D300E7D204E4D00C
          E0CB13D8BC11CDA804C19800BC8D00C890599B88FEFEFEFFFFFFFFFFFFFFFFFF
          0000E6E6E6A1A1A16262623B3B3B0A2B1A004925014422075F35078B52019F61
          00A46A00AD7A00BC9300CBAA00D7BA00E0C700E4CF00E3CE00E1CA00DDC800D9
          BF08D7B216D1AC0DC09500BB8600C591A6B8B3FFFFFFFFFFFFFFFFFF0000C0C0
          C0818181535353252B2800381B01452307693B048F5300975D009D6600A46E00
          AF8000BD9800CCAA00D7B700DFC100E2C600DEC600DBC400D9C100D7B700D6B1
          00D8B212D7B010BF9000C8922AAB8EF7F7F7FFFFFFFFFFFF0000A5A5A5727272
          47474710261A00381B05613602894F008F5800975F009B6300A36E00B68900C9
          A400CDAD05D4B207D9B602D7B400D8B900D8B900D4B100D3A900D5AD00D8B200
          DAB512D6AF0DC59500CEA0B6C4C1FFFFFFFFFFFF00009696966868683C3C3C04
          2312044825027C46008953008F5900935B009B6200AB791DAA896FB4A6BDDED6
          D6EEE8DAF6EFD2E9E2A6DFCE58CCAC07C79400D39C00D2A300D6AD00D8B200DA
          B413D4AC07D9AB6EAC9FFFFFFFFFFFFF00008F8F8F6363633335340128130466
          3700804B008852008C55009359029C6579BCA6EBEEEDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFCCD4D133AA8200D59700D3A300D6AD00D7AF03D7AF
          14DDB443B19BFFFFFFFFFFFF00008C8C8C6262622F312F033B1E017441007F4B
          00854F008B52009259A1C4B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFCCCDCD26956D00D39300D4A300D6AB00D5AB0EDDB43B
          BAA2FFFFFFFFFFFF00008E8E8E636363303231024F2A007442007D4900824B00
          8B516EAD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFDDDDDD777B790D9C6800D39700D3A700D3AA04DBB042BCA3FFFF
          FFFFFFFF0000939393666666363C39015931007341007A450081481E8759EFF2
          F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFD0D0D079797933584900C28000D3A100D3A800D8AC46BFA4FFFFFFFFFFFF
          00009D9D9D6F6F6F3B433F00593100703F007741008147568D76FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDB5B5
          B565656539393803975F00D29B00D1A500D1A749D4B1FFFFFFFFFFFF0000ABAB
          AB7B7B7B414A4500562F006D3C00733D00773F1C916EEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5909090525252
          202422027F4B00CD9200CFA300CEA251D7B4FFFFFFFFFFFF0000C0C0C08C8C8C
          4D5450004F2B006838006F3A006C3702B18371A49AFFFFFFF7F7F7EBEBEBD2D3
          D2A8AFABA8B1ADA8B3B0A6B4B0BAC3C1ECECECB3B3B36C6C6C37373706291903
          784600C88D00CE9F00CFA14EC9A9FFFFFFFFFFFF0000DCDCDCA6A6A667696806
          4729006134006A3600663104A57802C29B98A8A3CBCBCB8F8F8F434F48006B36
          008D5700AC7A00CC9C22B79AB1B1B17E7E7E4444440D3323003C20037C4900C5
          8B00CB9C00CE9D66C6ABFFFFFFFFFFFF0000F4F4F4CBCBCB9292921D47330058
          2F00643300612D068F6101CCA404926654675D74747438443D006C36008E5800
          AE7B00CF9E1BB7977272723F44410C472E005431023F2303925800C18A00C795
          00CC999CCCBCFFFFFFFFFFFF0000FFFFFFF0F0F0D5D5D56C7872004A28005D2E
          00612C056F3D07BD9500A171004D28141B14323E37006B36008D5700AD7A00CD
          9D16AF90385349007447007343004B2B065A3402A66700BD8800C28A0ABD84E1
          E9E5FFFFFFFFFFFF0000FFFFFFFFFFFFFEFEFEE5E5E5204D38005129005E2B01
          5E270C8D5D03A4750056300313052D3931016833008B5400AC7800CD9C22B195
          497565009059006A3E04553305854D00AB7000B88100B87666A58AFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFADB2B0003E20005226005B270360
          290D865703633E061D0D314039028052049D6F0DB68B11D0A645B5A1809D9200
          8E58046E4207764300975B00A87100AE70179A60E3E6E4FFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF667870003F1F004F23005923035926
          0A5732062E1831453F029E7901B69304C09F05C7A84FB1A49CB5AB058851066E
          3B00844900985E00A064038C50B4CBBFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F759726500381B004B20004F20003F181F
          3A293F4D49018E6600AE8300BA9400C2A04CB8A6D9DFDC16603100663300824A
          008D52018047A3B8ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF83938B09361F003E1B284C368F8F8F4952
          4F00805800A47500B38700BE9747A998FFFFFFC3CBC60C54300068381E7149AF
          C0B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFCDD3D063786DD4D5D5E3E3E3858A8902724C
          00976500A87800B08651B6A2FFFFFFFFFFFFA3AFA8738F7FE7EAE9FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFE0E00C694900895700
          9B6800A27559B29EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEDEC10634500794A008C590094
          665EA996FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFECF1EF135A4000653F00784B007F5563A996
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF0F4F210553C00533700603E00654364AE99FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF5F8F7416E5C265D4927644E25664D87B6A7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Visible = False
        OnClick = btnStartScanner1Click
      end
      object cxDBNavigator1: TcxDBNavigator
        Left = 7
        Top = 93
        Width = 172
        Height = 25
        Buttons.OnButtonClick = cxDBNavigator1ButtonsButtonClick
        Buttons.ConfirmDelete = False
        Buttons.CustomButtons = <>
        Buttons.PriorPage.Visible = False
        Buttons.NextPage.Visible = False
        Buttons.Last.Visible = True
        Buttons.Insert.Visible = False
        Buttons.Delete.Visible = False
        Buttons.Edit.Visible = False
        Buttons.Post.Visible = False
        Buttons.Cancel.Visible = False
        Buttons.Refresh.Visible = True
        Buttons.SaveBookmark.Visible = False
        Buttons.GotoBookmark.Visible = False
        Buttons.Filter.Visible = False
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        Anchors = [akLeft, akBottom]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object btnNew: TcxButton
        Left = 258
        Top = 72
        Width = 61
        Height = 49
        Hint = 'Transaksi Baru'
        Anchors = [akLeft, akBottom]
        Caption = 'BARU'
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = k
      end
      object btnDelete: TcxButton
        Left = 195
        Top = 63
        Width = 57
        Height = 25
        Hint = 'Hapus Transaksi'
        Anchors = [akLeft, akBottom]
        Caption = 'HAPUS'
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnDeleteClick
      end
      object btnBrowse: TcxButton
        Left = 189
        Top = 93
        Width = 65
        Height = 25
        Hint = 'Cetak Transaksi'
        Anchors = [akLeft, akBottom]
        Caption = 'BROWSE'
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnBrowseClick
      end
      object edNoNota: TcxTextEdit
        Left = 8
        Top = 14
        Anchors = [akLeft, akBottom]
        Properties.OnValidate = cxTextEdit1PropertiesValidate
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 6
        Visible = False
        Width = 241
      end
      object btnSave: TcxButton
        Left = 258
        Top = 15
        Width = 57
        Height = 54
        Hint = 'Simpan Transaksi'
        Anchors = [akLeft, akBottom]
        Caption = 'SIMPAN'
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = btnSaveClick
      end
      object btnPrint: TcxButton
        Left = 129
        Top = 63
        Width = 50
        Height = 25
        Hint = 'Cetak Transaksi'
        Anchors = [akLeft, akBottom]
        Caption = 'CETAK'
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = btnPrintClick
      end
      object btnUpdateHarga: TcxButton
        Left = 140
        Top = 37
        Width = 109
        Height = 25
        Hint = 'Hapus Transaksi'
        Anchors = [akLeft, akBottom]
        Caption = '+ (-) Harga'
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = btnUpdateHargaClick
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 373
      Top = 1
      Caption = 'Grandtotal'
      ParentBackground = False
      ParentColor = False
      Style.BorderStyle = ebsOffice11
      Style.Color = clSilver
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Transparent = True
      DesignSize = (
        284
        127)
      Height = 127
      Width = 284
      object Label8: TLabel
        Left = 4
        Top = 46
        Width = 81
        Height = 19
        Anchors = [akLeft, akBottom]
        Caption = 'Total Bayar '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 89
        Top = 46
        Width = 22
        Height = 19
        Anchors = [akLeft, akBottom]
        Caption = 'Rp.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 4
        Top = 21
        Width = 72
        Height = 19
        Anchors = [akLeft, akBottom]
        Caption = 'No. Faktur'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblSisaBayar: TLabel
        Left = 4
        Top = 71
        Width = 69
        Height = 19
        Anchors = [akLeft, akBottom]
        Caption = 'SisaBayar '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblRp: TLabel
        Left = 88
        Top = 71
        Width = 22
        Height = 19
        Anchors = [akLeft, akBottom]
        Caption = 'Rp.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label15: TLabel
        Left = 4
        Top = 99
        Width = 30
        Height = 19
        Anchors = [akLeft, akBottom]
        Caption = 'User'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edGrand: TcxCalcEdit
        Left = 127
        Top = 43
        Anchors = [akLeft, akBottom]
        EditValue = 0
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,0.#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Width = 150
      end
      object edFaktur: TcxTextEdit
        Left = 127
        Top = 17
        Anchors = [akLeft, akBottom]
        ParentFont = False
        Properties.OnValidate = cxTextEdit1PropertiesValidate
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Width = 150
      end
      object edSisaBayar: TcxCalcEdit
        Left = 127
        Top = 68
        Anchors = [akLeft, akBottom]
        EditValue = 0
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,0.#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Width = 150
      end
      object edUser: TcxTextEdit
        Left = 127
        Top = 94
        Anchors = [akLeft, akBottom]
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = True
        Properties.OnValidate = cxTextEdit1PropertiesValidate
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 3
        Width = 150
      end
    end
  end
  object grdItems: TcxGrid
    Left = 8
    Top = 44
    Width = 675
    Height = 349
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object gtvItem: TcxGridBandedTableView
      Navigator.Buttons.OnButtonClick = gtvItemNavigatorButtonsButtonClick
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
          Column = gtvItemDoz
        end
        item
          Kind = skSum
          Column = gtvItemPcs
        end
        item
          Kind = skSum
          Column = gtvItemQty
        end
        item
          Format = '#,0.#'
          Kind = skSum
          Column = gtvItemSubTotal
        end
        item
          Kind = skCount
          Column = gtvItemNo
        end>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.InfoText = 'Klik Disini Untuk Tambah Data'
      NewItemRow.Visible = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.DeletingConfirmation = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsSelection.InvertSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'BARCODE'
          Width = 194
        end
        item
          Caption = 'QUANTITY'
          Width = 132
        end
        item
          Caption = 'AMOUNT'
          Width = 214
        end>
      object gtvItemNo: TcxGridBandedColumn
        Caption = 'No'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Width = 34
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvItemId: TcxGridBandedColumn
        Caption = 'ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Properties.OnValidate = gtvItemIdPropertiesValidate
        Width = 80
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvItemJenis: TcxGridBandedColumn
        Caption = 'JENIS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 80
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvItemDoz: TcxGridBandedColumn
        Caption = 'Doz'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.UseThousandSeparator = True
        Properties.OnValidate = gtvItemDozPropertiesValidate
        FooterAlignmentHorz = taRightJustify
        Width = 44
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvItemPcs: TcxGridBandedColumn
        Caption = 'Pcs'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.OnValidate = gtvItemPcsPropertiesValidate
        FooterAlignmentHorz = taRightJustify
        Width = 37
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvItemQty: TcxGridBandedColumn
        Caption = 'Qty'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        FooterAlignmentHorz = taRightJustify
        Width = 51
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvItemHarga: TcxGridBandedColumn
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Properties.OnValidate = gtvItemHargaPropertiesValidate
        Width = 77
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvItemSubTotal: TcxGridBandedColumn
        Caption = 'SubTotal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        Width = 89
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvItemKet: TcxGridBandedColumn
        Caption = 'Ukuran'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 48
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvItemUpdate: TcxGridBandedColumn
        Caption = 'Update'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    object glvItems: TcxGridLevel
      GridView = gtvItem
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 12
    Caption = 'Click Here To Start Scan'
  end
  object edScan: TcxTextEdit
    Left = 148
    Top = 8
    OnFocusChanged = edScanFocusChanged
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Times New Roman'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 3
    Text = 'Click Here To Start Scan'
    OnClick = edScanClick
    OnKeyPress = edScanKeyPress
    Width = 405
  end
  object imgNor: TImageList
    Height = 18
    Width = 18
    Left = 288
    Top = 80
    Bitmap = {
      494C0101040009007C0012001200FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000480000002400000001002000000000008028
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D8E6E600D9DE
      D600DCCAB100E3C09B00E8B27D00DD9B5800DE944B00DE944B00E09A5500E6AD
      7500E1BC9300DEC8AC00D9DED600D8E6E6000000000000000000000000000000
      0000D8E6E600DFE2DA00DDCBB100E9C29A00E8B27D00DD9B5900DE944B00DE94
      4B00E0995300E6AE7700E1BB9200DAC6AA00DFDFD600D8E6E600000000000000
      00000000000000000000D8E6E600DFE0D700DBCAB100E3C09B00E8B27D00E09B
      5700DE944B00DE944B00E0995300E6AD7500E1BD9400DEC8AC00DFE0D700D8E6
      E60000000000000000000000000000000000D8E5E500D9DDD600DCC9AF00E1BD
      9500E8B27D00E19D5A00DE944B00DE944B00DD9A5500E6AD7500E4BC9200D7C3
      A700D9DDD600D8E5E5000000000000000000DCD5C500DEC8AC00E0B58700E2AA
      7300E3A36400E3A36400E3A36400E3A36400E3A36400E3A36400E3A36400E3A3
      6400DE914500DE944B00DD9B5800DDA77000DBC09E00DBD1BE00DFD7C700E5CA
      AC00E9B68400DFA76F00E3A36400E3A36400E3A36400E4A66900E4A66900E4A6
      6900E4A66900E3A36400DD904400DE944B00E0995300DFA76F00DEC09C00DDD3
      C000DFD6C600DEC8AC00E0B58700E4A96E00E3A36400E3A36400E3A36400E4A6
      6900E4A66900E4A66900E4A66900E3A36400DE914500DE944B00E09B5700DCA8
      7000DFC29F00DED3C000DED3C100DEC6A800DEB48600E6AD7500E4A66900E3A2
      6200E4A66900E4A66900E4A66900E4A66900E4A66900E3A26200DE914500DE94
      4B00DD9A5500DDA66D00E1BD9500DCCFBA00E2B78900E5A96E00E7B07A00E7B0
      7A00E8B27D00E8B27D00E8B27D00E8B27D00E6AD7500E8B27D00EBBF9400E3A3
      6400DE914500DE914500DE914500DE914500DE914500E0B58700E4B88A00DFA7
      6F00E7AF7800E7AF7800E8B27D00E8B27D00E8B27D00E6AE7700E8B27D00EBBF
      9400EBBF9400E3A36400DD904400DD904400DD904400DD904400DD904400E2B7
      8900E3B78900E4A96E00E7B07A00E7B07A00E8B27D00E8B27D00E8B27D00E8B2
      7D00E6AD7500E8B27D00EBBF9400E3A36400DE914500DE914500DE914500DE91
      4500DE914500E3B78900E4BC9200E6AD7500E8B27D00E8B27D00E8B27D00E8B2
      7D00E8B27D00E8B27D00E8B27D00E8B27D00E9B88800E19D5A00DD8E4000DD8E
      4000DE914500DE914500DE914500E4BC9200D9E3DF00E2BA8F00EABA8B00EBBF
      9400EABA8B00EABA8B00EABA8B00EABA8B00EDC59E00E2A16100DA863300D77D
      2600DC8B3B00DD8E4000DC8B3B00DC8B3B00DEAE7B00D8E6E600D8E1DC00E1BB
      9200E8B98B00EBBF9400E8B98B00E8B98B00E8B98B00E8B98B00EBBF9400B76B
      2000DA832F00D77D2700DA832F00DD8E4000DC8B3B00DC8B3B00DEAD7900DBE6
      E600D9E3DF00E2BA8F00E2BA8F00EBBF9400EBBC8E00EBBC8E00EBBC8E00EBBC
      8E00EEC69F00E09B5700DA853100D77D2600DC8B3B00DD8E4000DC8B3B00DC8B
      3B00DEAE7B00D8E6E600D8E5E500E1BD9500EABB8D00ECC29900EBBC8E00EABB
      8D00EABB8D00EABB8D00EABB8D00ECC29900E9B88800DC8B3B00DC8B3B00DC8B
      3B00DC8B3B00DC8B3B00DEB68A00DBE9EB0000000000D8E1DC00E2B78900EDC5
      9E00F0CEAD00F0CEAD00EDC59E00EDC59E00F1D2B400F2D6BB00E09A55009356
      1A009A5A1B00BA6D2100D77D2600DDA56B00D9E3DF000000000000000000D8E1
      DC00E2B78900EBBF9400F0CEAD00F0CEAD00EDC59E00F3D7BC00DC8B3B005632
      0F00CB772400AD651E008C521900AD651E00CF782400DDA36600D8E1DC000000
      000000000000D8E1DC00E3B78900EBBF9400F0CEAD00F0CEAD00EEC69F00EEC6
      9F00F1D2B400F1D7BD00E099530093561A009A5A1B00BA6D2100D77D2600DDA5
      6B00D9E3DF000000000000000000D8E5E500E1BD9500ECC09500F0CEAD00F0CE
      AD00F1D1B200F1D1B200EFCAA600F1D1B200DF975000DB873400DB873400D881
      2C00DC8B3B00DEB48600D8E5E500000000000000000000000000D9E3DF00DFC3
      A300E8B98A00EEC8A300F1D2B400F1D2B400F1D2B400F0CEAD00F6E1CD00F0CE
      AD00DC8B3B00BA773300E1BC9300D8E6E6000000000000000000000000000000
      0000D8E1DC00DFC4A400E8B98B00EEC7A100F4DCC500F0CEAD0073431400B76B
      2000DF975000DF975000D9812C00BC6E2100E1BB9200D8E6E600000000000000
      00000000000000000000D9E3DF00E0C4A300EBBC8E00EEC69F00F1D7BD00F4DA
      C100F0CEAD00F0CEAD00F6E1CD00F0CEAD00DC8B3B00BC763100E1BD9400D8E6
      E6000000000000000000000000000000000000000000DCCDB500E4BC9200EFCA
      A600E8B27D00ECC09500F2D4B700E6AD6B00DB873400DC8B3B00D8812C00DCA1
      6500DED3C1000000000000000000000000000000000000000000000000000000
      0000D9DED600DFC3A300E4C19A00F2D6BB00F1D2B400F1D2B400F0CEAD00F2D6
      BB00F2D6BB00EAD7C100DBEAEC00000000000000000000000000000000000000
      00000000000000000000D9DED600DFC4A400E5CAAC00D77D27005B351000B76B
      2000DD8E4000DF975000DF975000DF975000DEC09C00D8E6E600000000000000
      000000000000000000000000000000000000DFE0D700DFC29F00E1BD9400EBBF
      9400F1D7BD00F4DAC100F0CEAD00F1D2B400F1D7BD00EED9C200DEEBED000000
      0000000000000000000000000000000000000000000000000000D6E3E200DE94
      4B00BC6E2100BE793300CF9F6A00D6A26C00DD9A5500BF702200D88B3E00DBE9
      EB00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EEDECC00F1D2B400F1D2B400F1D2B400F1D2B400F0CE
      AD00F0CEAD00F0CEAD00F0CEAD00E3DACA000000000000000000000000000000
      000000000000000000000000000000000000D9D4C4008C521900734314006A3E
      130076451500B76B2000DD8E4000DF975000DF975000DD9B5900D4B79300D8E6
      E600000000000000000000000000000000000000000000000000E3C5A300A15E
      1C00E0995300EBBF9400F4DAC100F1D7BD00F0CEAD00F0CEAD00F0CEAD00E5DB
      CA00DEEBED0000000000000000000000000000000000DAE1DD00D99B5C00C473
      2300C4732300C67D3400D5D0C100D5D0C100BE793300B56A2000AD651E00C78E
      5300D9DDD6000000000000000000000000000000000000000000000000000000
      000000000000E4E1D700F2D6BB00F2D6BB00F2D6BB00F2D6BB00F1D2B400F0CE
      AD00F0CEAD00F0CEAD00F0CEAD00EFCAA600E9D1B700E2E0D500000000000000
      000000000000000000000000000000000000B3814C00824C1700824C17007645
      15005D3610005D36100076451500B76B2000DF975000BC6E210094734F000000
      00000000000000000000000000000000000000000000ECE7DE00F4DAC100E09B
      5700DD8E4000D0792500DE914500EEC69F00F4DAC100F0CEAD00F0CEAD00EFCA
      A600F1D2B400E4E0D600000000000000000000000000BA956B00C4732300D77D
      2600CD782400CD782400C5762900C5762900BC6E2100BC6E2100B56A2000AD65
      1E00C29A6D000000000000000000000000000000000000000000000000000000
      000000000000F1DDC900F4DAC100F4DAC100F2D6BB00F2D6BB00F2D6BB00F1D2
      B400F1D2B400F4DAC100F4DAC100F1D2B400EEC8A300E5D9C800000000000000
      0000000000000000000000000000DEC09C009A5A1B00874F1800874F18006A3E
      1300A15E1C00734314005D3610005D36100076451500754B2100C5CAC4000000
      000000000000000000000000000000000000DCE7E600F2DDC800F6E2CF00EBBF
      9400DD8E4000DD8E4000DD8E4000C6742300E8B58300F6E2CF00EFCAA600F0CE
      AD00EEC8A300EEDDCB00000000000000000000000000C8D2D000A2764800CD78
      2400D8812C00D77D2600D77D2600CA762300C4732300BF702200BF702200B682
      4B00D1D7D1000000000000000000000000000000000000000000000000000000
      0000EAE5DA00F5DDC600F4DAC100F4DAC100F4DAC100F2D6BB00F2D6BB00F2D6
      BB00F2D6BB00E8B58300E5A96E00EDC59E00EAD7C10000000000000000000000
      00000000000000000000D8E1DC00C17D390095571A0095571A0076451500DE94
      4B00FBF2EA00E9B684006A3E13006A3E13005D361000A5917700000000000000
      000000000000000000000000000000000000ECE7DE00F6E1CD00F6E1CD00F6E1
      CD00DF975000DF975000DF975000BF702200A15E1C00E8B58300F6E1CD00EFCA
      A600EAD5BD000000000000000000000000000000000000000000D6E3E200B182
      5000D8812C00D8812C00D77D2600D77D2600CA762300C4732300C7986500D6E3
      E20000000000000000000000000000000000000000000000000000000000DFE8
      E600F7E6D600F5DDC600F5DDC600F4DAC100F4DAC100F4DAC100F2D6BB00F6E1
      CD00F2D6BB00DC8B3B00D77D2600E3A36400DEECEF0000000000000000000000
      00000000000000000000D8AD7E00AD651E00A15E1C0092551900AD651E00FAEE
      E300DFA76F00F4DCC5007F4A1600623911008D5B2900DBE6E600000000000000
      0000000000000000000000000000DCE7E600F7E6D600F5DDC600F5DDC600F6E2
      CF00EEC69F00DD8E4000DF975000DA853100B56A2000A15E1C00E8B27D00F1D7
      BD00DEE3DD00000000000000000000000000000000000000000000000000DBB9
      9000DB873400DB873400D8812C00D77D2600D77D2600CA762300CAAE8A000000
      000000000000000000000000000000000000000000000000000000000000F0E7
      DB00F7E6D600F6E1CD00F6E1CD00F5DDC600F5DDC600F4DAC100F2D6BB00EEC8
      A300EBBF9400E2A16100DE944B00A48A6C00C7CBC400C7CBC400000000000000
      000000000000D9DACF00D9812C00A15E1C00874F18008C52190092551900F6E2
      CF00FDF8F400DD9044006239110076451500BFB4A00000000000000000000000
      0000000000000000000000000000F1EBE100F7E6D600F6E1CD00F6E1CD00F5DD
      C600F7E6D600EBBF9400DA853100DE944B00DA853100B0671F00B0671F00E5CF
      B600000000000000000000000000000000000000000000000000E1BD9500DD8E
      4000DD8E4000DC8B3B00DB873400DB873400D77D2600CD782400C4732300C3A6
      8300000000000000000000000000000000000000000000000000E5E9E600F9EC
      E000F6E2CF00F6E2CF00F6E2CF00F5DDC600F4DAC100F6E1CD00F0CEAD00DD8E
      4000DE944B00E6AD7500E4A76B00DC8B3B00D5812F00A2612100000000000000
      000000000000D9A87300B76B2000B76B2000DD8E4000C372220092551900A15E
      1C00CF78240076451500764515009D7448000000000000000000000000000000
      00000000000000000000E5E9E600F9ECE000F6E2CF00F6E2CF00F6E2CF00F5DD
      C600F5DDC600F7E6D600EBBC8E00D9802A00DE944B00DD8E4000F0CEAD00E7BC
      8F00C4BEAF0000000000000000000000000000000000C1A27D00DC8B3B00DF97
      5000DE914500DD8E4000DC8B3B00D8812C00DB873400CD782400CD782400BC6E
      2100CDA97F000000000000000000000000000000000000000000F5EFE800F7E6
      D600F6E2CF00F6E2CF00F6E2CF00F6E2CF00F5DDC600F5DDC600F1D2B400E6AD
      7500E8B58300E8B58300E7B07A00E5A96E00DD9B5800AD651E00000000000000
      0000DBCFBA00DA832F0095571A00EFCAA600FFFFFF00F1D2B400EBBF9400DC8B
      3B005D361000874F1800874F1800C7C7BC000000000000000000000000000000
      00000000000000000000F7EFE700F7E6D600F6E2CF00F6E2CF00F6E2CF00F6E2
      CF00F5DDC600F4DAC100F7E6D600EBBC8E00DA853100F7E6D600FFFFFF00DE94
      4B0093561A00D8B58D00000000000000000000000000D7C3A700BA712800DC8B
      3B00DF975000DD8E4000DEB68A00BD936400C4732300D8812C00CA762300D883
      3100DCCFBA0000000000000000000000000000000000EAEDE900F9ECE000F6E2
      CF00F6E2CF00F6E2CF00F6E2CF00F5DDC600F5DDC600F5DDC600F2D6BB00F0CE
      AD00EFCAA600EBBF9400E7B07A00DDA56B00DFC3A300D4C8B20000000000D8E6
      E600DC9F6000AD651E00DD8E4000FFFFFF00FBF2EA00B76B2000E4A66900B76B
      2000874F1800874F1800B98E5F00000000000000000000000000000000000000
      000000000000E6EBE800F9ECE000F6E2CF00F6E2CF00F6E2CF00F6E2CF00F5DD
      C600F5DDC600F4DAC100F4DAC100F5DDC600F0CEAD00F1D7BD00E8B27D00D980
      2A00DD8E4000DFD6C60000000000000000000000000000000000D8D2C100BB7A
      3800DB873400DBB990000000000000000000AC937300BF702200DE944B00DCDB
      D00000000000000000000000000000000000DFE8E600F8F2EC00F9ECE000F9EC
      E000F9ECE000F7E6D600F7E6D600F6E2CF00F6E2CF00F4DAC100F4DAC100F4DA
      C100F2D6BB00EBBF9400E5A96E00AC9F8A00000000000000000000000000DFC4
      A400DD8E4000CF782400F6E2CF00FFFFFF00EBBF9400DD904400E4A669008C52
      19009A5A1B0093633300D8E1DC00000000000000000000000000000000000000
      0000E6EBE800FAF4EE00F9ECE000F9ECE000F9ECE000F7E6D600F7E6D600F6E2
      CF00F6E2CF00F5DDC600F4DAC100F1D7BD00F6E2CF00E3C5A300CB782600DDA5
      6B00DCE7E600000000000000000000000000000000000000000000000000D7C3
      A700B886520000000000000000000000000000000000B1825000DCCDB5000000
      000000000000000000000000000000000000F0E7DB00F9ECE000F9ECE000F9EC
      E000F9ECE000F9ECE000F9ECE000F7E6D600F6E2CF00F6E2CF00F4DAC100F4DA
      C100EAD7C100EDC59E00E8B58300D1C6B1000000000000000000D8E1DC00DE94
      4B00DA832F00E9B68400FFFFFF00F9EBDE00F9EBDE00F4DCC500BC6E2100BC6E
      2100A15E1C00BBA2830000000000000000000000000000000000000000000000
      0000F8EADD00F8EADD00F7EFE700F9ECE000F9ECE000F9ECE000F9ECE000F7E6
      D600F6E2CF00F6E2CF00F5DDC600F1D7BD00EEDDCB0000000000E2BA8F00DFE0
      D700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000048000000240000000100010000000000B00100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000C000F0003C000F0003000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000600018000600
      01000000C000F0003C000F8007000000F001FC003F001FC00F000000FC00FF00
      0FC0078007000000F8003F001F80038007000000F8003E001F00038007000000
      F0007C003F0007C00F000000E0007C003E0007E01F000000E00038007E000FC0
      0F000000C0003800FC00078007000000C0003000FC0003800700000080002001
      F80003C30F0000000000E001F00007E79F0000000000C003F0004FFFFF000000
      00000000000000000000000000000000000000000000}
  end
  object imgHot: TImageList
    Height = 18
    Width = 18
    Left = 316
    Top = 80
    Bitmap = {
      494C0101040009007C0012001200FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000480000002400000001002000000000008028
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DCE8E400E1E2
      D300E2D19900EDCB7600F4C34A00ECAC2300E8A40D00E5A00F00E3A62200E4B4
      5000DCC07D00D1C6A000D4DED500D6E5E900D6E5E900D6E5E900000000000000
      0000DBE7E100E2E5D200E8D19400F7CE7300F0BE5200EEAE2000E6A30E00E6A3
      0E00E2A52100E4B65200DDBD7800D0C69F00D7DFD800D6E6E800D6E6E800D6E6
      E800000000000000000000000000E3E5D100DECE9400EDCB7600F4C34A00ECAC
      2300E8A40D00E5A00F00E7A52100E4B45000DFC07C00D0C69F00D7DFD800D6E4
      E80000000000000000000000000000000000DAE6E000DEE1CE00E7D09700EDC9
      7400F0BC4E00EDAF2000E8A30F00E8A30F00E2A62300E3B65100DCBF7A00D1C6
      9C00D4DDD400D7E7E700D7E7E700D7E7E700E3DBB200E8D28D00F0C25700F5B8
      3A00F7B52900F7B42200F7B52900F7B52900F7B52900F7B52900F7B52900F7B4
      2200F0A20000ECA30B00E3A62200DBAE4C00D6C38B00D6D0B500E5DDB500EDD4
      8E00F2C25300F6B93600F6B52800F7B52100F7B52100F7B52100F6B52800F6B5
      2800F6B52800F6B52800EDA20000EDA20A00E6A52000DCAC4A00D9C48D00D8D2
      B700E3DBB200E8D28D00F0C25700F6B83500F7B52900F7B42200F7B52900F7B5
      2900F7B52900F7B52900F7B52900F7B42200F0A10000ECA20A00E7A52100DAAC
      4C00D6C48F00D8D3B800E4DAAD00E9D08600F0C25500F4B93900F7B62900F7B6
      2900F7B62900F7B62900F7B72E00F7B72E00F7B72E00F6B52400EFA20000EDA3
      0A00E5A61F00DCAD4700D6C08200D6CFAF00F0C36500F1B63D00F0BC4B00F0BC
      4B00F0BC4B00F0BE5100F0BE5100F0BE5100F0BC4B00F4C34A00FFCF6100F7B5
      2900EEA00000EEA00000EEA00000EEA00000E49A0800DEB76A00EDC56200F1B6
      3E00EFBC4C00EFBC4C00EFBC4C00F0BE5200F0BE5200F0BE5200F0BE5200FFD2
      5D00FFCF6300F6B52800EDA20000EDA20000EDA20000EDA20000E49A0700E0B8
      6C00F0C36500F1B63D00EFBE5100EFBB4800EFBE5100EFBE5100EFBE5100EFBE
      5100EFBB4800F4C34A00FFCF6100F7B52900EEA00000EEA00000EEA00000EEA0
      0000E49B0A00E0B96C00EAC06900EFB63F00EFBE5200EFBE5200EFBE5200EFBE
      5200EFBE5200EFBE5200EFBE5200EFBE5200F0C46000EDAF2000EA9E0000EA9E
      0000EFA20000EFA20000E49B0900E0BC7300D7E4DD00DCBD7100E9C36C00EBC7
      7600E9C36C00E9C36C00E9C36C00F0C36500D3C694009D947600997E3900BE80
      0200E59C0100E59C0100E59C0100DB930000DDB25800DCE8E400D7DFD800DCBD
      7100E9C36C00EBC77600E9C36C00E9C36C00E9C36C00EEC46E00ECCB74005A51
      32008A784500AD770800D48F0000E39D0200E0990000DB930000DEB25500DBE7
      E300D7E4DD00DCBD7100E9C36C00EBC87600E9C36C00E9C36C00E9C36C00F0C3
      6500DAC498009D947600997E3900BE800200E59C0100E59C0100E59C0100DB93
      0000DDB25700DEE3E400D7E7E700DFC47A00EAC06900EDC87D00E9C47100E9C4
      7100E9C47100E9C47100E9C47100EDC87D00EAC06900D7910600D7910600DB96
      0200D8930000D8930000DFB8690000000000D6E5E900D4DED500DCBD7100E6C6
      8300ECD39A00ECD39A00EBCC8700E2CC9200C1C8D100C6CBD800807D8700402B
      1B00643C000095660000B67B0A00D0A75000D7E4DD000000000000000000D7DF
      D800DCBD7100E6C68200ECD29B00EBD19500E6C78A00FFE59F00877C5D000000
      0000A9AE0000827C01004D33030085540000AD770800CDA44D00D6E4DD000000
      000000000000D7DFD800DCBD7100E6C58200ECD09600ECD09600EBCD8700E4CB
      9300BDC5CE00C6CED400807D8700402B1B00643C000095660000B67B0A00D0A7
      5000D7E4DD00000000000000000000000000DBC28000E4C17B00EDD09900EDD0
      9900FBDD9600EDD59900EDD59900EDD7A200D1972A00D48C0000D48C0000C988
      0000CD8D1200D5B57100D7E7E700D7E7E7000000000000000000D7E4DD00D3C6
      9400DCBD7100E5CD9400EED7A500D2CCC400C2C2CA00C6C5C500DAD9DA00C6C5
      C5008B72550090671D00C2B59200D6E5E900D6E5E900D6E5E900DBE7E300DBE7
      E300D6E4DD00D8C79200DDBD7800E8D19400F9E4B300E1D6AA00131217008289
      0000FFFF0000FFF10200C8B1010086651300B6AE9C0000000000000000000000
      00000000000000000000D7E4DD00D6C48F00DFC07C00E4CB9300F1D9A800DED4
      CA00C5C3CB00C5C3CB00D7DFD800C4C4C5008B72550090681D00C2B59200D6E4
      E80000000000000000000000000000000000D7E7E700D6CFAF00DFC47A00E7D0
      9700A79EA300D6C68E00E6D5B100D4A75700D48C00009A734600AA7C1F00D0A4
      4600D9D3B7000000000000000000000000000000000000000000000000000000
      0000D4DED500D3C69400CEBE9700C1C8D100CAC9C600CAC9C600C6C5C500CCCC
      CC00CCCCCC00CCCCCC0000000000000000000000000000000000000000000000
      00000000000000000000D7DFD800D6C59C00E8D1940072684F00000008007C7E
      0C00E3E10300FFF10200FFE20000F5C20B00DDC58400DBE7E300DBE7E300DBE7
      E30000000000000000000000000000000000DEE2D500D3C69200CAB89000B9AF
      B400D6CDC500DED4CA00C4C4C500C7CBCC00C7CBCC00D0D2D100DCEBEF000000
      0000000000000000000000000000000000000000000000000000DAE6E0005A56
      A1000000960050496800A99C6600C6A6530095776F000A0B9300484B9A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CFD6E000CAC9C600CAC9C600CAC9C600C6C5C500C6C5
      C500C6C5C500BFC3C300BFC3C300CCD4D6000000000000000000000000000000
      000000000000000000000000000000000000BCCBD40028282800141513000300
      1A001A1E12007F840600E4D90300FFD90000FBB10000DAA42F00A3AAA8000000
      0000000000000000000000000000000000000000000000000000B4B7BD000948
      65004495BE00A2B4C000DED4CA00D6CDC500C2C1C100C2C1C100C2C1C100CDD5
      D700DCEBEF0000000000000000000000000000000000C8D7EA004D50BC000000
      A5000000A5001314AB00A9B7DE00A9B7DE0013149D0000008D00000082004D51
      9A00C8D6E1000000000000000000000000000000000000000000000000000000
      000000000000D4DEE000CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C6C5
      C500C6C5C500C0C1C200C0C1C200C0C1C200C6C5C500D4DEE000000000000000
      0000000000000000000000000000000000006666660021222100212221001818
      180000000800000008002024100080830700FADA0100987300004A4E5A000000
      00000000000000000000000000000000000000000000DEE3E400D7CFCD002BB1
      E50000A5E800017CB6003D8BB200A4C2CE00D6D6D600C2C1C100C2C1C100BDBD
      BD00C7CBCC00D3DCDE00000000000000000000000000606498000000A5000101
      BF000000AD000000AD000907A6000907A600000099000000990000008D000202
      7F006065A3000000000000000000000000000000000000000000000000000000
      000000000000D6D6D600D2D1D300D2D1D300CCCCCC00CCCCCC00CCCCCC00CAC9
      C600CAC9C600D7D5CF00DBDBCF00CAC9C600BBBBBD00CCD4D600000000000000
      0000000000000000000000000000A7B0B2003333330028282800282828001010
      1000393939001818180000000800000010002729070027271800B0BFC9000000
      00000000000000000000000000000000000000000000D6D6D600EBDBD20093BD
      D00000A5E80000B0EB0000A5E8002A507C00B8929400D7E4DD00C2C1C100C2C1
      C100BDBDBD00CDD5D700000000000000000000000000BCCBD00032347C000000
      B4000000CC000000B4000000B4000000B4000000A5000000A50000008D003333
      9900BCCBDC000000000000000000000000000000000000000000000000000000
      0000DBE2E300DAD9DA00D2D1D300D2D1D300D2D1D300CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00A5A5A30095969700B3B4B900CDD1D20000000000000000000000
      00000000000000000000CEDDDF005D5F60003333330033333300181818007A7A
      7A00F1F1F000A5A5A5001010100010101000000008006E757E00000000000000
      000000000000000000000000000000000000DEE3E400D6D6D600D6D6D600E4D7
      D300289CD30000CCFF004E89B4009D000C006B050900ABA4A100D3DCDE00BDBD
      BD00C7CBCC000000000000000000000000000000000000000000CEDEE1004D51
      82000504C4000000CC000101BF000101BF000000AD000000A5005155B000CEDE
      E700000000000000000000000000000000000000000000000000000000000000
      0000E2E2E100DAD9DA00D6D6D600D6D6D600D6D6D600CDD1D200CDD1D200E1E2
      D300C9C8D5000A0CD7000000C30084869800DEECEF0000000000000000000000
      00000000000000000000959D9E004242420039393900333333003C3E3F00E8E8
      E80099999900D8D8D800212221000808080033333300D6E6E800D6E6E800D6E6
      E80000000000000000000000000000000000DEE3E400D6D6D600D6D6D600EBDB
      D20094CDDE0053639500F8032900D6002F008C001A0068070D00AA9D9800D0D2
      D100D3DCDE000000000000000000000000000000000000000000000000007075
      DC000705D4000001D5000000CC000101BF000101BF000000A500747CC0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E2E2E100DAD9DA00DAD9DA00D6D6D600D6D6D600D2D1D300D2D1D300CAC8
      AD00A9A7B5001717FF00090BF2005C638000B5C4C600B2C0C800000000000000
      000000000000C8D6D8006666660033333300282828002828280028282800DDDD
      DD00F8F8F8007A7A7A0008080800181818009AA5A70000000000000000000000
      0000000000000000000000000000E6E6E600DEDEDE00D6D6D600D6D6D600D6D6
      D600E6E6E600DC878900D0001400F6004000CD013E0086000F0070192000BECA
      C8000000000000000000000000000000000000000000000000006C73EE000000
      E7000000E7000100DE000001D5000001D5000101BF000000B4000000A5006B72
      B70000000000000000000000000000000000000000000000000000000000E6E6
      E600DEDEDE00DEDEDE00DEDEDE00DAD9DA00D2D1D300E1E2D300B9B7D2002B2B
      BF002B2BBF003838FF002C2BFF001819C300100FB90018166200000000000000
      0000000000008F9596004A4A4A004A4A4A007474740052525200282828003333
      33005A5A5A00181818001818180052525200D6E6E80000000000000000000000
      0000000000000000000000000000E6E6E600DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600D3F5EF00CA939A00CB011D00F8003200CF173300D0BDB900A7B2
      A800A4AFB90000000000000000000000000000000000747BA2000100DE000000
      FF000100F1000100F1000705D4000705C3000001D5000000B4000000B4000000
      9600747BB4000000000000000000000000000000000000000000EDEDED00E2E2
      E100DEDEDE00DEDEDE00DEDEDE00DAD9DA00D6D6D600E4E5CE00B4B4DB003838
      FF004A4AFF004F4FFE003F3EFF002C2BFF001110FF00100F7200000000000000
      0000BCC7C9006969690033333300BFBFBF00FFFFFF00C8C8C800AFAFAF006F74
      7500080808002122210021222100B0BDC0000000000000000000000000000000
      00000000000000000000ECEEEE00DEE3E400DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600D6D6D600D1EFEB00C88A9000C8112000FFC2C700FFFFFF004C50
      AC000504560099A0B000000000000000000000000000ADB5BC00292878000100
      DE000000FF000000E700646AE600666A8D000000A5000000CC000000A500292A
      A600ADB6D60000000000000000000000000000000000E4ECED00E4ECED00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DAD9DA00D6D6D600D6D6D600C9C8D500A6A6
      DD00A1A0DF006666FF004948F3005155C900727AF5009AA5D900000000000000
      000086898A004242420074747400FFFFFF00F1F1F0004A4A4A00929292004A4A
      4A0028282800282828006F747500000000000000000000000000000000000000
      000000000000E4ECED00E4ECED00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600D6D6D600D0D2D100CFDDDC00C4C3BE00C7D4C900545AEC000000
      C70050509800C6CED40000000000000000000000000000000000BCCBD0003839
      7F000001D5006067EF000000000000000000636B9400000099003A39BB00C1CD
      E3000000000000000000000000000000000000000000EDEDED00E6E6E600E6E6
      E600E6E6E600E6E6E600E2E2E100DEDEDE00DAD9DA00D6D6D600D6D6D600E4E3
      C600D7D6C5006666FF004443E7007E859100000000000000000000000000AFB8
      BA00747474005A5A5A00DDDDDD00FFFFFF00AFAFAF007A7A7A00929292002828
      2800333333003C3E3F00CEDDDF00000000000000000000000000000000000000
      0000E0EAEC00F2F3F300E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600DEDE
      DE00DEDEDE00D6D6D600D0D2D100CCCCCC00DEE2D500A9ACC6000203AE00545B
      C800D6E4E800000000000000000000000000000000000000000000000000ADB5
      BC004C4F8A00000000000000000000000000000000004B4F7E00ADB6D6000000
      000000000000000000000000000000000000E2E2E100EDEDED00EDEDED00EDED
      ED00EDEDED00EDEDED00E6E6E600E2E2E100DEDEDE00DAD9DA00D7D5CF00D7D5
      CF00C3C6DB006B6DFE005351F600A3AECD000000000000000000D1E0E3007A7A
      7A0069696900A5A5A500FFFFFF00E8E8E800E8E8E800D8D8D8004A4A4A004A4A
      4A0039393900868E900000000000000000000000000000000000000000000000
      0000E6E6E600ECEEEE00ECEEEE00ECEEEE00ECEEEE00ECEEEE00E6E6E600E6E6
      E600DEDEDE00DEDEDE00D6D6D600D0D2D100D6D6D600000000009296C100CCD8
      DF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000048000000240000000100010000000000B00100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000C00030000E000F0000000000000000000000000000000000
      0000000000000000000000000000000000000000010000000000600018000700
      00000000C00000007C000F0007000000F003FC000F001FC01F000000FC00FF00
      1FC0078007000000F8003F001F80038007000000F8003E001F80038007000000
      F0007C003F0007C00F000000F0007C000F0007E01F000000F00038007E000FC0
      0F000000E00038007E00078007000000C0003000FC0003800700000080003001
      F80003C30F0000008000E001F00007E79F0000000000C003F0004FFFFF000000
      00000000000000000000000000000000000000000000}
  end
  object imgDis: TImageList
    Height = 18
    Width = 18
    Left = 344
    Top = 80
    Bitmap = {
      494C0101040009007C0012001200FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000480000002400000001002000000000008028
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEDD
      DF00B5C4C600ABB3B500989D9D00828484007B7B7B007B7B7B00828484009999
      9900AEAEAE00B2BCBE00CEDDDF00D6E6E800D6E6E800D6E6E800000000000000
      0000D6E5E800D3DFE100B8C1C300B3B5B500A5A5A50086898A007B7B7B007B7B
      7B008284840099999900AEAEAE00B0BDBF00CEDDDF00D6E5E800000000000000
      0000000000000000000000000000D1E0E300B7C1C300AEB5B700989C9D008383
      84007B7B7B007B7B7B008383840099999900ADADAD00B6BEC000D0DCDE00D6E6
      E800D6E6E800D6E6E8000000000000000000D4E4E700CEDCDE00B6C0C200ADB2
      B3009EA4A500868686007B7B7B007B7B7B007D83840099999900A7ABAC00B0BB
      BC00CEDCDE00D4E4E7000000000000000000C4CFD100B2BCBE00A6A6A6009999
      99008E9192008C8C8C008C8C8C008E9192008E9192008E9192008E9192008C8C
      8C007B7B7B007B7B7B008284840093939300ABB3B500BFCACC00C7D1D300B8C1
      C300A5A5A500959696008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C007B7B7B007B7B7B00828484008F959600ACB3B500C0CE
      D000C4CFD100B6BEC0009FA7A900959595008C8C8C008C8C8C008C8C8C009094
      95009094950090949500909495008C8C8C007B7B7B007B7B7B00838384009094
      9500AEB5B700C4CFD100C2CDCF00B3BBBD009EA4A500959595008C8C8C008C8C
      8C008C8C8C00959595009595950095959500959595008C8C8C007B7B7B007B7B
      7B007D8384008B939500A5ADB500BBC5C700A6A6A60099999900989D9D00989D
      9D00989D9D00989D9D00989D9D00989D9D00989D9D00989D9D00AEAEAE008C8C
      8C007B7B7B007B7B7B007B7B7B007B7B7B0073737300A6A6A600A5A5A5009596
      9600999999009999990099999900A5A5A500A5A5A5009999990099999900AEAE
      AE00AEAEAE008C8C8C007B7B7B007B7B7B007B7B7B007373730073737300A5A5
      A500A5A5A5009999990099999900999999009999990099999900989C9D00989C
      9D00989C9D00989C9D00B3B3B3008C8C8C007373730073737300737373007373
      730073737300A5A5A500A7ABAC00959595009EA4A5009EA4A5009EA4A5009EA4
      A5009EA4A5009EA4A5009EA4A5009EA4A500A8A8A8008C8C8C00737373007373
      7300737373007373730073737300A7ABAC00D1E0E300A5ADAF00A5ADAF00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00B5B5B5008C8C8C006C6D6D006364
      64007373730073737300737373006C6D6D00989D9D00D6E6E800D1E0E300A4AC
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE004949
      4900666666005D5F600069696900737373007373730073737300959D9E00D6E5
      E800D1E0E300A4ADAE00A4ADAE00B3B3B300ADADAD00ADADAD00ADADAD00ADAD
      AD00BDBDBD008C8C8C006B6B6B005B5B5B007373730073737300737373006B6B
      6B00989C9D00D6E6E800D4E4E700ADB2B300A8A8A800B5B5B500ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00B5B5B500A8A8A8006F7171006F7171006F71
      71006B6B6B006B6B6B009EA4A50000000000D6E6E800CEDDDF00A6A6A600B5B5
      B500C5C5C500C5C5C500BCBCBC00BCBCBC00CCCCCC00CCCCCC00828484002C2C
      2C003333330049494900636464008E919200D1E0E3000000000000000000CEDD
      DF00A5A5A500B3B5B500C5C5C500C5C5C500BBBBBB00CCCCCC00737373000000
      000059595900414141002929290041414100595959008C8C8C00D1E0E3000000
      0000D6E6E800D1E0E300A5A5A500B3B3B300C6C6C600BDBDBD00BDBDBD00BDBD
      BD00C6C6C600CCCCCC00838384002C2C2C0033333300494949005B5B5B009094
      9500D1E0E3000000000000000000D4E4E700ADADAD00ADADAD00C5C5C500C5C5
      C500C5C5C500C5C5C500BFBFBF00C5C5C5007B7B7B006B6B6B006B6B6B006666
      66006F7171009EA4A500D4E4E700000000000000000000000000D1E0E300B1B8
      BA00A6A6A600BCBCBC00CCCCCC00CCCCCC00C5C5C500C5C5C500DEDEDE00C5C5
      C5007373730056575700A5ADAF00D6E6E800D6E6E800D6E6E800000000000000
      0000D1E0E300B1B8BA00A4ACAE00BBBBBB00D5D5D500C5C5C500181818004141
      410082848400828484006666660049494900A4ACAE00D6E5E800000000000000
      00000000000000000000D1E0E300B5B5BD00ADADAD00BDBDBD00CCCCCC00D6D6
      D600C6C6C600C6C6C600DEDEDE00C6C6C6007373730053535300A4ADAE00D6E6
      E800D6E6E800D6E6E800000000000000000000000000BBC5C700ADADAD00BFBF
      BF009EA4A500ADB2B300CCCCCC00959595006B6B6B006F717100666666008C8C
      8C00C2CDCF000000000000000000000000000000000000000000000000000000
      0000CEDDDF00B1B8BA00ABB3B500CCCCCC00C5C5C500C5C5C500C5C5C500CCCC
      CC00CCCCCC00CCCCCC0000000000000000000000000000000000000000000000
      00000000000000000000CEDDDF00B1B8BA00B8C1C3005D5F6000000000004949
      490073737300828484008284840082848400ACB3B500D6E5E800000000000000
      000000000000000000000000000000000000D3DCDE00AEB5B700ADADAD00B3B3
      B300CCCCCC00D6D6D600C6C6C600C6C6C600CCCCCC00CCCCCC00DDEBEE000000
      0000000000000000000000000000000000000000000000000000D3E2E5007B7B
      7B004949490059595900848A8B00848A8B007D838400515151006F7171000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6D6D600CCCCCC00CCCCCC00C5C5C500C5C5C500C5C5
      C500C5C5C500C5C5C500C5C5C500CCD4D6000000000000000000000000000000
      000000000000000000000000000000000000C0CED00029292900181818001010
      10001818180049494900737373007B7B7B007B7B7B0082848400A0AAAB00D6E5
      E800000000000000000000000000000000000000000000000000B5B5BD003838
      380083838400B3B3B300D6D6D600CCCCCC00BDBDBD00BDBDBD00BDBDBD00CDD5
      D600DDEBEE00DDEBEE00000000000000000000000000D1E1E400868686005151
      51005151510059595900BCC9CC00BCC9CC005959590041414100414141007373
      7300CEDCDE000000000000000000000000000000000000000000000000000000
      000000000000D4DEDF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C5C5C500C5C5
      C500C5C5C500C5C5C500C5C5C500BCBCBC00C5C5C500D4DEDF00000000000000
      0000000000000000000000000000000000005D5F600020202000202020001818
      1800080808000808080018181800494949007B7B7B00494949004E535300D6E5
      E8000000000000000000000000000000000000000000DFE4E500D6D6D6008C8C
      8C00737373005B5B5B0073737300BDBDBD00D6D6D600BDBDBD00BDBDBD00BDBD
      BD00C6C6C600D3DCDE00000000000000000000000000737B7C00515151006666
      6600595959005959590059595900515151004949490049494900494949004141
      41007D8384000000000000000000000000000000000000000000000000000000
      000000000000D6D6D600D6D6D600CCD1D200CCCCCC00CCCCCC00CCCCCC00C5C5
      C500C5C5C500D6D6D600D6D6D600C5C5C500BCBCBC00CCD4D600000000000000
      0000000000000000000000000000A5ADB5003333330020202000202020001010
      1000383838001818180008080800080808001818180020202000B4C2C5000000
      00000000000000000000000000000000000000000000D6D6D600DEDEDE00B3B3
      B30073737300737373007373730053535300A5A5A500DEDEDE00BDBDBD00C6C6
      C600BDBDBD00CDD5D600000000000000000000000000BDCCCE00535758005959
      5900666666005959590059595900595959005151510051515100494949006666
      6600C3D2D5000000000000000000000000000000000000000000000000000000
      0000E0E3E400D6D6D600D6D6D600D6D6D600CCD1D200CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00A6A6A60093939300B5B5B500CCD1D20000000000000000000000
      00000000000000000000CEDDDF005D5F60003333330033333300181818007B7B
      7B00F0F0F000A5A5A50010101000101010000808080071787A00000000000000
      000000000000000000000000000000000000DFE4E500D6D6D600D6D6D600D6D6
      D6007B7B7B007B7B7B00838384004949490038383800A5A5A500D6D6D600BDBD
      BD00CCCCCC000000000000000000000000000000000000000000CEDCDE006469
      69006666660066666600666666005959590059595900515151007D838400D1E1
      E400000000000000000000000000000000000000000000000000000000000000
      0000E0E3E400D6D6D600D6D6D600D6D6D600D6D6D600CCD1D200CCD1D200D6D6
      D600CCCCCC0073737300636464008E919200DEECEF0000000000000000000000
      00000000000000000000959D9E004141410038383800292929003C3E3F00F0F0
      F00095969600D5D5D500202020000808080033333300D6E5E800000000000000
      000000000000000000000000000000000000DFE4E500D6D6D600D6D6D600DEDE
      DE00BDBDBD00737373007B7B7B006B6B6B004949490038383800A5A5A500CCCC
      CC00D1E0E3000000000000000000000000000000000000000000000000009EA4
      A5006B6B6B006B6B6B0066666600666666005959590059595900949D9E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600CCCCCC00BCBC
      BC00AEAEAE008C8C8C007B7B7B006A707200B5C4C600B5C4C600000000000000
      000000000000C8D6D8006666660038383800202020002929290029292900DDDD
      DD00F8F8F8007B7B7B0008080800181818009AA5A70000000000000000000000
      0000000000000000000000000000E6E6E600DEDEDE00D6D6D600D6D6D600D6D6
      D600DFE4E500B3B3B300666666007B7B7B00666666004343430043434300C0C6
      C800000000000000000000000000000000000000000000000000A5ADB5007373
      7300737373006F7171006B6B6B006B6B6B005959590059595900515151008B93
      950000000000000000000000000000000000000000000000000000000000E6E6
      E600DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600C5C5C5007373
      73007B7B7B0099999900939393006C6D6D00636464003C3C3C00000000000000
      0000000000008F95960049494900494949007373730051515100292929003838
      38005959590018181800181818004E535300D6E5E80000000000000000000000
      0000000000000000000000000000E6E6E600DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600DFE4E500ADADAD00666666007B7B7B0073737300C6C6C600ADAD
      AD00A7B3B50000000000000000000000000000000000848A8B006B6B6B007D83
      84007B7B7B00737373006F717100666666006666660059595900595959004949
      49008B9395000000000000000000000000000000000000000000EDEDED00E0E3
      E400DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600C5C5C5009999
      9900A6A6A600A6A6A600989D9D00939393008284840040404000000000000000
      0000BCC7C9006969690033333300BDBDC500FFFFFF00C5C5C500AEAEAE007373
      7300080808002020200020202000B0BDBF000000000000000000000000000000
      00000000000000000000ECEEEE00DFE4E500DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600D6D6D600DEDEDE00A5A5A5006B6B6B00DEDEDE00FFFFFF007B7B
      7B002C2C2C009FA7A900000000000000000000000000ADB8BA00515151006F71
      71007D838400737373009EA4A500737B7C005151510066666600535758006666
      6600BBC5C70000000000000000000000000000000000E4ECED00E4ECED00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600CCCCCC00C5C5
      C500BCBCBC00AEAEAE00989D9D008C8C8C00B1B8BA00B2BCBE0000000000D6E5
      E80086898A004141410073737300FFFFFF00F0F0F000494949008F9596004949
      490029292900292929006F747500000000000000000000000000000000000000
      0000D6E6E800E4ECED00E4ECED00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600BDBDBD00CCCCCC00A5A5A5006666
      660073737300C6D0D20000000000000000000000000000000000BDCCCE005959
      59006B6B6B00A7ABAC000000000000000000737B7C00515151007B7B7B00CAD7
      D9000000000000000000000000000000000000000000EDEDED00E6E6E600E6E6
      E600E6E6E600E6E6E600E0E3E400DEDEDE00D6D6D600D6D6D600D6D6D600D6D6
      D600CCCCCC00AEAEAE0093939300818A8C00000000000000000000000000AFB8
      BA007373730059595900DDDDDD00FFFFFF00AEAEAE007B7B7B008F9596002929
      2900333333003C3E3F00CEDDDF00000000000000000000000000000000000000
      0000E0EAEC00F2F3F300E6E6E600E6E6E600E6E6E600E6E6E600DEDEDE00DEDE
      DE00DEDEDE00D6D6D600D6D6D600CCCCCC00DEDEDE00B5B5BD005B5B5B008C8C
      8C00D6E6E800D6E6E8000000000000000000000000000000000000000000ADB8
      BA00646969000000000000000000000000000000000066666600BBC5C7000000
      000000000000000000000000000000000000E0E3E400EDEDED00EDEDED00EDED
      ED00EDEDED00EDEDED00E6E6E600E0E3E400DEDEDE00DEDEDE00D6D6D600CCD1
      D200CCD1D200B5B5B500A6A6A600B0BCBE000000000000000000D1E0E3007B7B
      7B0069696900A5A5A500FFFFFF00E8E8E800E8E8E800D5D5D500494949004949
      490038383800848C940000000000000000000000000000000000000000000000
      0000E6E6E600ECEEEE00ECEEEE00ECEEEE00ECEEEE00ECEEEE00E6E6E600E6E6
      E600DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D60000000000A4ADAE00D0DC
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000048000000240000000100010000000000B00100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000E00030003E00030003000000000000000000000000000000
      0000000000000000000000000000000000000000010000000000600010000600
      01000000C00030003C00038007000000F003FC003F001FC01F000000FC00FF00
      0FC0038007000000F8003F000F80038007000000F8003E001F80038007000000
      F0007C003F0007C00F000000F0007C003F0007E01F000000F00038007E000FC0
      0F000000E00038007E00078007000000C0003000FC0003800700000080002001
      F00003C30F0000008000E001F00003E79F0000000000C003F0004FFFFF000000
      00000000000000000000000000000000000000000000}
  end
  object imgCtrlDis: TImageList
    Height = 24
    Width = 24
    Left = 452
    Top = 80
    Bitmap = {
      494C0101030004007C0018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00E6E6E600DEDE
      DE00DEDEDE00DEDEDE00E6E6E600EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00E6E6E600DEDEDE00D6D6
      D600D6D6D600DEDEDE00E6E6E600EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFEF00D6D6D600BDBDBD00A6A6A6009393
      93009393930099999900B5B5B500D6D6D600E6E6E600E6E6E600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E6E6E600D6D6D600ADADAD0094949400838383008383
      83008383830099999900BCBCBC00DEDEDE00E6E6E600E6E6E600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7F700E5E5E500DEDEDE00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00DEDEDE00E5E5E500F7F7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700DEDEDE00ADADAD007373730049494900494949004949
      49005151510051515100595959006B6B6B0099999900CCCCCC00D6D6D600E6E6
      E600000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00D6D6D600ADADAD00666666004141410041414100494949004949
      49005353530053535300595959007B7B7B00B5B5B500D6D6D600D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E5E5E500CCCCCC00ADADAD00959595008C8C8C008585
      85008585850095959500A4A4A400CCCCCC00DEDEDE00DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00CCCCCC00848484003C3C3C003C3C3C0041414100494949004949
      490051515100515151005959590066666600666666006B6B6B00ADADAD00CCCC
      CC00DEDEDE00000000000000000000000000000000000000000000000000EFEF
      EF00CCCCCC00838383003B3B3B003B3B3B004141410049494900494949005353
      530059595900595959006666660066666600666666008C8C8C00C5C5C500D6D6
      D600000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700D6D6D600ADADAD006B6B6B005959590066666600737373007B7B
      7B007B7B7B007B7B7B007B7B7B00737373008C8C8C00C5C5C500CCCCCC00EEEE
      EE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F700CCCCCC00737373003C3C3C00414141004141410049494900494949004949
      49005151510051515100595959005959590066666600666666006B6B6B009999
      9900C5C5C500E6E6E60000000000000000000000000000000000F7F7F700CCCC
      CC00737373003B3B3B003B3B3B00414141004949490049494900494949005353
      5300535353005959590066666600666666006B6B6B006B6B6B007B7B7B00C5C5
      C500D6D6D600000000000000000000000000000000000000000000000000F7F7
      F700CCCCCC008585850049494900535353005959590066666600737373007373
      73007B7B7B006B6B6B006B6B6B007B7B7B007B7B7B0073737300ADADAD00C5C5
      C500EEEEEE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6D6
      D600848484004141410041414100414141004141410041414100414141004949
      4900515151005151510059595900595959005959590066666600666666006666
      6600A6A6A600C5C5C50000000000000000000000000000000000D6D6D6008C8C
      8C00414141004141410041414100414141004949490049494900494949005353
      530053535300595959005959590066666600666666006B6B6B00666666008383
      8300C5C5C500E6E6E6000000000000000000000000000000000000000000CCCC
      CC008585850041414100535353005353530085858500ADADAD00BDBDBD009595
      9500C5C5C500BDBDBD00999999006B6B6B007B7B7B007B7B7B0073737300ADAD
      AD00C5C5C5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00A6A6
      A600494949004949490049494900414141004949490099999900666666004141
      4100494949005151510051515100595959005959590059595900666666006666
      660066666600B5B5B500D6D6D6000000000000000000EFEFEF00ADADAD004949
      4900494949004141410041414100414141004949490049494900494949004949
      4900535353005959590059595900595959006666660066666600666666006666
      6600A4A4A400CCCCCC0000000000000000000000000000000000DEDEDE009999
      9900494949004949490049494900A4A4A400B5B5B500B5B5B500BDBDBD00A4A4
      A400B5B5B500BDBDBD00D6D6D600BDBDBD006B6B6B007B7B7B007B7B7B007373
      7300B5B5B500CCCCCC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D6D6007373
      73004949490049494900494949004949490059595900E6E6E600DEDEDE00A6A6
      A600595959004949490051515100515151005959590059595900595959005959
      59005959590084848400C5C5C5000000000000000000DEDEDE008C8C8C004949
      4900494949004949490049494900494949004949490049494900494949004949
      4900494949005353530059595900595959005959590059595900666666006666
      660073737300B5B5B500EFEFEF000000000000000000F7F7F700BDBDBD006666
      660053535300595959009595950073737300C5C5C500A4A4A4006B6B6B006666
      66006B6B6B008C8C8C00B5B5B500A4A4A400B5B5B5006B6B6B007B7B7B007B7B
      7B0085858500BDBDBD00F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00B5B5B5006666
      66005151510049494900494949004949490059595900DEDEDE00D6D6D600DEDE
      DE00DEDEDE009999990059595900494949005151510059595900595959005959
      59005959590059595900B5B5B500EFEFEF0000000000C5C5C5006B6B6B005959
      5900494949004949490049494900494949004949490049494900494949004949
      4900494949005353530053535300535353005959590059595900595959005959
      590059595900A4A4A400DEDEDE000000000000000000E5E5E500999999005959
      59005353530099999900D6D6D600ADADAD008585850041414100414141004949
      4900535353005959590073737300A4A4A400D6D6D600999999006B6B6B007B7B
      7B0073737300ADADAD00D6D6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDE00999999006666
      66006666660051515100515151004141410051515100CCCCCC00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00D6D6D600939393005151510051515100515151005151
      5100515151005151510099999900DEDEDE00EFEFEF00ADADAD00666666006666
      6600595959004949490053535300535353004949490049494900494949004949
      4900494949004949490053535300535353005353530053535300535353005353
      5300535353008C8C8C00D6D6D6000000000000000000D6D6D600858585006666
      660066666600CCCCCC00CCCCCC00A4A4A4004949490041414100858585006666
      66004949490059595900595959006B6B6B00A4A4A400BDBDBD006B6B6B007373
      73007373730095959500CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCCCCC00939393006666
      66006666660066666600494949004949490049494900A6A6A600DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00E6E6E600D6D6D60084848400515151005151
      510051515100515151008D8D8D00DEDEDE00DEDEDE00A4A4A400666666006B6B
      6B006B6B6B007B7B7B0094949400838383007373730049494900494949004949
      4900494949004949490049494900494949005353530053535300535353005353
      5300494949007B7B7B00CCCCCC0000000000F7F7F700BDBDBD007B7B7B006B6B
      6B008C8C8C00E5E5E500D6D6D600737373004949490049494900CCCCCC00E5E5
      E500999999005959590053535300595959007B7B7B00BDBDBD008C8C8C006666
      6600666666007B7B7B00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5C5C500939393006B6B
      6B006B6B6B006B6B6B00666666004949490049494900D6D6D600EFEFEF00EFEF
      EF00E6E6E600E6E6E600E6E6E600E6E6E600EFEFEF00F7F7F7007B7B7B004949
      4900494949004949490084848400D6D6D600DEDEDE00A4A4A4006B6B6B006B6B
      6B006B6B6B007B7B7B008C8C8C00838383006666660049494900494949004949
      4900494949004949490049494900494949004949490049494900494949004949
      49004949490073737300CCCCCC0000000000EEEEEE00B5B5B5007B7B7B007373
      730085858500A4A4A400BDBDBD00737373005959590053535300C5C5C500F7F7
      F700F7F7F700DEDEDE0099999900494949006666660099999900BDBDBD00C5C5
      C500595959006B6B6B00BDBDBD00F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCCCCC00999999007373
      73007373730066666600515151006666660073737300DEDEDE00C5C5C500EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00F7F7F700CCCCCC007B7B7B00494949004949
      490049494900494949008D8D8D00DEDEDE00E6E6E600A4A4A400737373007373
      73007B7B7B00737373006B6B6B00666666006666660066666600494949004949
      4900494949004949490049494900494949004949490049494900494949004949
      4900414141007B7B7B00D6D6D60000000000F7F7F700B5B5B5007B7B7B007373
      730099999900DEDEDE00BDBDBD007B7B7B006B6B6B0066666600D6D6D6000000
      000000000000E5E5E5008C8C8C004141410059595900B5B5B500DEDEDE000000
      0000C5C5C50066666600B5B5B500EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDE00A6A6A6007373
      7300737373006B6B6B006666660051515100595959009999990099999900DEDE
      DE00F7F7F70000000000DEDEDE00848484004949490049494900494949004949
      4900494949004141410099999900E6E6E600EFEFEF00B5B5B500737373007B7B
      7B00A4A4A400999999008C8C8C008383830083838300838383006B6B6B005959
      5900535353004949490049494900494949004949490049494900494949004949
      4900414141008C8C8C00DEDEDE0000000000F7F7F700BDBDBD00858585007B7B
      7B008C8C8C00EEEEEE00DEDEDE008C8C8C007373730073737300E5E5E500F7F7
      F700ADADAD005353530041414100414141006B6B6B00E5E5E500E5E5E500E5E5
      E500CCCCCC0073737300BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700BDBDBD007B7B
      7B007B7B7B007B7B7B006B6B6B005959590066666600D6D6D600E6E6E6000000
      0000EFEFEF00A6A6A60059595900494949005151510051515100494949004949
      49004949490049494900ADADAD00EFEFEF0000000000CCCCCC00838383007B7B
      7B00838383009494940094949400949494008383830083838300737373006B6B
      6B006B6B6B006666660059595900595959005353530053535300535353005353
      530049494900A4A4A400EFEFEF000000000000000000CCCCCC008C8C8C008585
      85007B7B7B00CCCCCC00F7F7F700BDBDBD00858585007B7B7B00A4A4A4008585
      850059595900666666006666660059595900999999008C8C8C00BDBDBD00CCCC
      CC00535353007B7B7B00CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D6D6008D8D
      8D005959590059595900737373007373730084848400F7F7F700DEDEDE007B7B
      7B00595959005959590066666600666666006666660059595900595959005959
      5900494949007B7B7B00CCCCCC000000000000000000E6E6E600A4A4A4009494
      94007B7B7B007B7B7B007B7B7B007B7B7B007373730073737300737373006B6B
      6B006B6B6B006B6B6B006B6B6B00666666006666660066666600666666005959
      590073737300C5C5C500000000000000000000000000E5E5E500A4A4A4008585
      85008585850099999900E5E5E500B5B5B500BDBDBD00858585007B7B7B007B7B
      7B007B7B7B007373730073737300959595007B7B7B00595959007B7B7B007373
      73005353530099999900DEDEDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00B5B5
      B500848484007373730066666600595959005959590073737300595959004949
      490051515100737373006B6B6B006B6B6B006666660066666600666666005959
      590059595900ADADAD00E6E6E600000000000000000000000000CCCCCC00BCBC
      BC00A4A4A400949494008C8C8C00838383007B7B7B007B7B7B007B7B7B007B7B
      7B0073737300737373006B6B6B006B6B6B006B6B6B0066666600666666005959
      5900A4A4A400E6E6E600000000000000000000000000F7F7F700BDBDBD008C8C
      8C008C8C8C008585850085858500DEDEDE00F7F7F700C5C5C500A4A4A4008C8C
      8C008C8C8C009595950099999900858585006B6B6B006B6B6B00666666006666
      66006B6B6B00B5B5B500F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6D6
      D600B5B5B5007B7B7B0073737300666666006666660059595900666666007B7B
      7B007B7B7B00737373007373730073737300737373006B6B6B006B6B6B005959
      590093939300D6D6D60000000000000000000000000000000000E6E6E600CCCC
      CC0094949400999999009999990094949400949494008C8C8C00838383007B7B
      7B0073737300737373007373730073737300737373006B6B6B00666666009494
      9400D6D6D6000000000000000000000000000000000000000000DEDEDE00ADAD
      AD00858585008C8C8C008585850099999900D6D6D600EEEEEE00E5E5E500C5C5
      C500C5C5C500D6D6D600858585006B6B6B006B6B6B006B6B6B006B6B6B005959
      590099999900D6D6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D6D600BDBD
      BD00C5C5C500939393007B7B7B00848484008484840084848400737373006666
      6600494949004949490073737300737373007373730073737300666666008D8D
      8D00CCCCCC00F7F7F700000000000000000000000000D6D6D600B5B5B500C5C5
      C500BCBCBC007B7B7B007B7B7B00838383007B7B7B007B7B7B007B7B7B007373
      7300737373007B7B7B007B7B7B007B7B7B0073737300666666008C8C8C00C5C5
      C500F7F7F7000000000000000000000000000000000000000000F7F7F700E5E5
      E500A4A4A400858585008C8C8C00858585008585850099999900A4A4A400B5B5
      B500F7F7F700EEEEEE0085858500737373007373730073737300666666008585
      8500C5C5C500F7F7F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E6E6E600CCCC
      CC00BDBDBD00B5B5B5008D8D8D00595959005959590051515100515151005151
      51005151510059595900848484007B7B7B00737373007373730099999900CCCC
      CC00EFEFEF0000000000000000000000000000000000EFEFEF00D6D6D600BCBC
      BC00B5B5B500A4A4A40083838300838383007B7B7B007B7B7B007B7B7B007B7B
      7B0083838300838383007B7B7B007373730073737300A4A4A400CCCCCC00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000EEEEEE00A4A4A4008C8C8C008C8C8C008C8C8C008585850073737300B5B5
      B50000000000000000008C8C8C0073737300737373006B6B6B008C8C8C00BDBD
      BD00EEEEEE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6E6E600EFEFEF000000
      0000F7F7F700E6E6E600CCCCCC00A6A6A6007B7B7B0066666600666666007373
      73008484840084848400666666007B7B7B0093939300B5B5B500D6D6D600F7F7
      F70000000000000000000000000000000000E6E6E600E6E6E60000000000F7F7
      F700EFEFEF00D6D6D600B5B5B500A4A4A40099999900949494008C8C8C008383
      8300838383007B7B7B008383830099999900B5B5B500D6D6D600F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700E5E5E500ADADAD008C8C8C008C8C8C008C8C8C00858585009999
      9900BDBDBD00BDBDBD00858585007B7B7B007B7B7B00A4A4A400C5C5C500EEEE
      EE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700C5C5C500BDBDBD00C5C5
      C500DEDEDE00EFEFEF00F7F7F700EFEFEF00DEDEDE00BDBDBD00ADADAD008D8D
      8D006B6B6B00666666006B6B6B0099999900D6D6D600EFEFEF00000000000000
      000000000000000000000000000000000000C5C5C500BCBCBC00C5C5C500D6D6
      D600E6E6E600F7F7F700F7F7F700E6E6E600CCCCCC00B5B5B500999999008383
      8300737373007373730099999900DEDEDE00EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700DEDEDE00C5C5C500ADADAD00999999008C8C8C008585
      850085858500858585008C8C8C00A4A4A400B5B5B500D6D6D600F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00D6D6D600C5C5
      C500BDBDBD00B5B5B500B5B5B500B5B5B500B5B5B500999999008D8D8D008484
      84008484840099999900BDBDBD00DEDEDE000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00DEDEDE00CCCCCC00BCBC
      BC00B5B5B500ADADAD00ADADAD00ADADAD008C8C8C007B7B7B007B7B7B007B7B
      7B0094949400BCBCBC00E6E6E600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEEEEE00E5E5E500CCCCCC00C5C5C500BDBD
      BD00BDBDBD00BDBDBD00CCCCCC00DEDEDE00EEEEEE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F700E6E6E600DEDEDE00CCCCCC00C5C5C500C5C5C500C5C5C500C5C5C500D6D6
      D600EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F700EFEF
      EF00DEDEDE00D6D6D600C5C5C500BCBCBC00BCBCBC00BCBCBC00D6D6D600EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEEE00EEEE
      EE00EEEEEE00EEEEEE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FF80FFFF00FFFFFFFF000000FE003FFC
      003FFE007F000000F8000FF0001FFC003F000000F00007E0000FF0000F000000
      E00003C00007E00007000000E00003C00003E00007000000C00001800003C000
      03000000C0000180000180000100000080000080000180000100000080000000
      0001800001000000800000000001000001000000800000000001000000000000
      8000000000010018100000008004000000010000010000008010008000018000
      01000000C00001800003800001000000C00001C00003800001000000E00003C0
      0007C00003000000C00003800007C00003000000C0000780000FF00C07000000
      90000F20001FF0000F00000000003F00007FF8001F0000008000FF0001FFFE00
      7F000000E007FFC00FFFFFC3FF00000000000000000000000000000000000000
      000000000000}
  end
  object imgCtrlHot: TImageList
    Height = 24
    Width = 24
    Left = 424
    Top = 80
    Bitmap = {
      494C0101030004007C0018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F1F500EBE3EA00E8DC
      E600E6D8E200E6D8E200EBDFEA00EAEBED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00E8E7DE00E3E1
      D900DFDDD400DFDDD400E3E1D900ECEAE200EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F1E4EF00DED4DD00B7BEB70091B4960073B3
      81006EB67E0079BE89009BC9A400CED8D000EFE0EC00EFE0EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEDE500D7D6CD00A8A6BA007C7CAD005B5B
      A1005454AB005C5BB3007B7ABE00AEADD400DDDDDD00ECEAE200ECEAE2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F8F900E6EAEC00D7DBDE00CCD0D300CCCC
      CC00CCCCCC00CFD3D400DFE5E700E6EAEC00F7F8F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F1F500E6D8E200A7BAAA004B9D53000B8C1A00008C07000094
      110000A1130000AD190000B81F000EC536005BD77600C1DFC900E1CFDC00E7E7
      E700000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700DFDDD4009E9CB4003A3A910000008400000084000000
      8C00000094000606A6000404AB000708B3003030C1009494D800DCD9CF00DCD9
      CF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DFE5E700CCCCCC00BBA59D00B3887800B1766100B272
      5B00B76D5900BF756300CB938500D8C0BA00DFE5E700DBDFE300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4EBF100D1C6CE0069A36E00007A0500007A050000841000019318000193
      180000A01F0000AD240001BD2C0000C52E0000CF270002D531007DD99200D5C5
      D000E1E0E4000000000000000000000000000000000000000000000000000000
      0000EFEFEF00CFCCC6005B5BA10000007600000076000606860008088A000808
      8A000B0B9A001010A4001212AA001717B7001313BE000606C2004646CC00C5C3
      CC00D7D6CD000000000000000000000000000000000000000000000000000000
      0000F0F3F500D2D5D900BAA198009B5B4000944626009F4E2F00A9553700AE59
      3D00B8543900C5523800C6452B00BE3F2400C76C5700D3BEB900CCD0D300EDEE
      EE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8F6
      F700D1C6CE004B9D5300007A0500007A05000084100000841000019318000193
      180000A01F0000AD240000B5280001BD2C0000CC330000CC330000DA280060D7
      7C00D0BFCB00EAEBED000000000000000000000000000000000000000000F7F7
      F700D3D0C7004C4B9D000000760000007600060686000606860008088A000808
      8A000B0B9A000F0F9F001212AA001212AA001717B7001919BD000C0DC6002F2F
      C900C3BFC300DCD9CF000000000000000000000000000000000000000000F0F3
      F500C8C8CB00A57D6E00832F0A008E3C1A0094462600955237009A614D00A45F
      4900A8665300A34F3900B3462C00C5523800C6452B00BD422600C69A8F00C0C6
      C900EDEEEE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DCCE
      D70060A669000082010000860B0000860B0000860B000082010000860B000193
      1800009E1B0000A6210000AD240000B5280001BD2C0000C52E0006CF340000D5
      260078D18D00CEBCC8000000000000000000000000000000000000000000DFDD
      D4006969A30000007B0000008400000084000000840006068600060686000808
      9400080894000F0F9F000F0F9F001212AA001212AA001717B7001919BD000C0D
      C6004545C700C7C4BD00EFEDE50000000000000000000000000000000000CCD0
      D300A8756000822801008B3611008A402300997B6F00AFAAA900BBBEBF00AA8A
      7F00C8C8CB00BBB7B700AA8A7F00A14A3600C5523800C5523800BD422600C69A
      8F00C0C6C9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F4EBF1009AB4
      9C00008C0700008C0700008C070000860B000B8C1A0083B98900359B4400008C
      07000094110000A01F0000A6210000AD240000B5280001BD2C0001BD2C0000CC
      330000CC3300AAC1AE00DED4DD00000000000000000000000000F9F8F000A7A4
      B70000008C0000008C0000008C0000008C0000008C0006068600060686000606
      8600080894000B0B9A000B0B9A001010A4001212AA001212AA001717B7001717
      B7000708B3008684C200D3D0C700000000000000000000000000DBDFE300B693
      85008A2E06008B36110083320F00A99D9900B0B9BE00B4B6B800C0B8C000ACA2
      9D00B4B6B800C3B5C400CAD6DC00C4B7B400A54D3300BC543A00BC543A00B74C
      3100C2ADA700CCD0D30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DCCED70049A6
      5C00009306000094110000941100008C070020962D00EBDFEA00E5DBE20094BE
      99002499310000930600009E1B0000AD240000AD240000B5280000B5280001BD
      2C0000C021004FC26A00CEBCC800000000000000000000000000E3E1D9006969
      A30000008C0000008C0000008C0000008C0000008C0000008C0000008C000405
      8D0008089400080894000B0B9A000B0B9A001010A4001212AA001212AA001212
      AA001212AA002E2DB500BBB8B700EFEFEF0000000000F7F8F900C4B7B4009B4B
      29009136100095472500A390880089695B00CBC3CA0098B59B003E954800249D
      2F0026B238004CCD60009CCDA700C7939600C0ADA8009E554100BB5A4000B854
      3900B76D5900BBB7B700F0F3F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F1F500B7BEB70023A5
      42000C9F260000941100009411000094110020962D00D6D9D700D6D9D700E5DB
      E200E5DBE20084BB8A00179A2900009C100000A6210000AD240000AD240000AD
      240000AD24000AB53000AEB5AE00EAEBED0000000000FCFCF900C3BFC3003A42
      9C0021219B00000094000000940000008C0000008C0000008C0004058D000405
      8D0004058D0008089400080894000B0B9A000B0B9A000F0F9F000F0F9F000F0F
      9F001212AA000606A6009492B500E3E1D90000000000DFE5E700B69385009D3F
      180094340C00B28F8100CAD6DC00BBACAE006B9F6A000A7D0B00008405000091
      050000A8190000BE1D000DD5310072CD8300D5CEDD00AD948C00A54D3300B45D
      4300AD543000B9A19900D5D9DD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDD8E7008AB4930017A9
      390023A54200089F1F00009C1000027F1C001C8C3700CBCBD600E0DEDF00E0DE
      DF00E0DEDF00EBDFEA00D6D9D70072B77B0009941F00009C100000A6210000A6
      210000A6210000A718008AB49300E5DBE20000000000EFEDE500A7A4B7002A2B
      A6003434A50021219B000000940020208C00191990001010850000008C000000
      8C0004058D00080894000808940008089400080894000B0B9A000F0F9F000F0F
      9F000F0F9F0000009C006D6CAE00DCD9CF0000000000CFD3D400B4715600A74D
      2800A4523000CCC9C700CCCCCC0092B89700058E0700008405005EA96400309C
      38000093030000AD1B0000C127000ACE2F008BBA9500C0B8C00095523700AE59
      3D00A9553700B3827100C8CCCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DDC4D50073B3810019AD
      420026AD450026AD4500157D54001447740016457A00817DC700E1E0E400E1E0
      E400E1E0E400E1E0E400E1E0E400F1E4EF00CED8D00060B16B0009941F00009E
      1B00009E1B00009C100070AD7A00DED4DD0000000000E8E7DE008D8BB4002A2B
      A6003434A5003434A5005B5BA1008D8D8D00838383006565820004058D000405
      8D0004058D0004058D0008089400080894000808940008089400080894000808
      940008089400000094005453A400D6D3C900F9F9FE00C6BEBC00B3614000AC50
      2A00BB7F6600DEE7EB00DCD0DD0045A8590000930300058E0700C2D2C500F0DF
      EF007DB78000189F200000A20C0000B418003EB65200C3B5C400A57D6E00964E
      3300A4523000A8665300BBBEBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0BFCB006EB67E001FB7
      430029B3480029B348002DA158001D7968001E736F00C2C1F200EEEFEE00EEEF
      EE00E7E7E700E7E7E700E7E7E700E2E3E300F4E8F200FFF2FF0051AE5E000093
      0600019318000093060069A36E00DED4DD0000000000E6E4D4008D8BB4002D2D
      AB003939A7003939A7005454AB007573AD006666990038389C00000094000000
      94000000940004058D0004058D0004058D000808940008089400080894000808
      94000808940000008C004C4B9D00D3D0C700F0F3F500C0B3AF00B65D3900B458
      3300B4715600B5968900BBB7B70035B1530010A6300005990E00B2D5B600FFED
      FF00FCE8FB00E5DEE40079BB7D0000990B0021A12D00A59C9700CAB7B100D0C4
      BF008A402300A0593B00BBB7B700F0F3F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DDC4D50073B3810023BD
      47002BBC4D0029975D00228A5B0023A5420039AD5400D5D5E700B0AFD700EAEB
      ED00EEEFEE00EEEFEE00F6F1F500FFF4FF00C3DAC60048AA5100009411000094
      110000941100008C07006DA57400E3D7E00000000000EFEDE0009492B5003131
      B0003A3AAC0052529F005050950038389C0038389C00333392003C3C85000405
      8D0000009400000094000000940004058D0004058D0004058D0004058D000405
      8D0004058D000000840052529F00D7D6CD00F0F4F700C0B3AF00BC5F3A00B458
      3300C5846900DDDEDE00C0B8C00038BB560020B444001AAA3A00C2E5C900FFFA
      FF00FFFAFF00E2E6E0006DB46C00008B000020922200BBB7B700DDDEDE00F9FF
      FF00D0BCB60095523700BBB7B700F0F3F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDD8E7008CBB960026C2
      4A0032BD54003263A20028539A001F4E870023528D006D68CA006D68CA00CECE
      E600F9F8FE0000000000D8E9D9005DB46200008C0700008C0700009411000094
      1100008D10000082010085A88800EBDFEA0000000000F9F8F000AFACBE00393A
      B4004242B6009C9CAB00999999008D8D8D008383830083838300838383004242
      940018189900080894000808940000008C0000008C0000008C0000008C000000
      8C0000008C0000008400716FA300E3E1D900F7F8F900C6BBB800C2674400C05D
      3700C4755500EDEEEE00E4D6E10057C4700027BD4A0027BD4A00D8F1DF00F0F3
      F50086CE9700119A2900008B0F00008B0F003E954800E5DEE400E5DEE400DEE7
      EB00D8CDC800A45F4900BBB7B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBF2F900B4C3B60033C5
      550033C555003AB86300389A79002C7D84003C7F9100BBB6EF00DCD8F9000000
      0000EFF7F10086CC9600189E34000193180009941F0009941F0009941F000994
      1F000B8C1A000E8C2400AEB5AE00F6F1F5000000000000000000D2D0CD005453
      B7003D3DBA005555BA007171B6007C7CAD007979A5006969A3005454AB003939
      A7003939A700333399002C2C9B0021219B0021219B0019199000191990001919
      900019199000101085009C9CAB00EFEFEF0000000000D2CFCF00C4755500C965
      3F00C05D3700E2CAC000F2F9FE00ACD2B30033CF580033CF580079D78F0049C1
      650010A630001DA540001DA54000189D3A0091A38800B67D6700D2B9AE00D8CD
      C8008E3C1A00A0685200C8CCCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DED4DD0061BA
      8200307D8B002C936B0032BD54002CBB50004CC26A00F8F6F700CECEE600597F
      9D0028885D0013A3340023A5420023A5420023A542001F9D3D001C993A001A96
      3700098E2900519F6500D1C6CE00000000000000000000000000EFEDE5009392
      BE008383A6005B5B9C004242AD004242AD004242AD004242AD00454599006565
      82004E4E8E003434A5003434A5003434A5003333990033339900333399002C2C
      920020208C0050509500C7C4BD000000000000000000DFE5E700C8917D00CC64
      3B00C6623B00D0816200EDE7E300D5A9A10099E0A9003BD65F0022CD4A0029C7
      4E002FC3530027BD4A0029B5480077B28100AC645000943E1A00AC6C5100A35F
      41008E3C1A00B0918600DBDFE300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6F1F500A6B7
      BC004D7AB5003159B0002E5B990021588B0021588B00425BA50023528D001152
      7C00218168002EB44D002EB44D0029AD470029AD470023A5420023A542001F9D
      3D0013973100A4B6A700EBE3EA00000000000000000000000000FCFCF900CCCC
      CC00BEBEC300A3A3A300939393008D8D8D00838383007B7B7B007B7B7B007B7B
      7B00666699003A3AAC003A3AAC003434A5003434A5003434A500333399003333
      9900202191009E9CB400ECEAE2000000000000000000F0F4F700CAB7B100CF6E
      4800CF6E4800C9653F00C46C4A00E8DCD700F9F9FE00B7DABE006AD482004ED3
      6D004BCE690057C4700098AA8A00B76D5900A9553700A95537009F4E2F009B4B
      2900A0593B00C0B3AF00F0F3F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DED4
      DD008FD79D003ABF6D00429D8E0037849800327F900027867B002E9E700039BD
      5E0039BD5E002FAF520031B850002EB44D002EB44D0029AD470029AD470013A3
      340073B38100DCCED70000000000000000000000000000000000FCFCF900E8E7
      DE00BFBED6006263C4007B7ABE008787B2008383A6007573AD006565B1004949
      B6004949B6004141A7003A3AAC003A3AAC003A3AAC003A3AAC003434A5002121
      9B007573AD00D7D6CD0000000000000000000000000000000000DBDFE300D39A
      8500CE674000CF6E4800C9653F00D3876A00E8D2CA00F0F4F700E5DEE400C5C0
      C300C5C0C300DCD0DD00B2725B00AD543000AA573500AA573500A45230009D45
      2100B6938500D5D9DD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0B5F8009682
      FA00B4A8EB0070BB9D0030C65A003FCE60003FCE60003BC55E0034B161002C93
      6B001E736F001C6B720032B3580032BD540031B850002EB44D0019AD420061B5
      7400D1C6CE00F8F6F70000000000000000000000000000000000D7D7D700B7B6
      B600CCC9C400AFAFCA004949B6004343BE004949BE004949B6005454AB005B5B
      9C0065657B006C6C76004646AC004242AD004242AD003A3AAC002A2BA6006D6C
      AE00CCC9C400F7F7F70000000000000000000000000000000000F7F8F900E3E1
      E100DD8A6A00CE674000D36E4800CE674000C9653F00D0816200D2917800D9A8
      9500F9F9FE00E6ECEF00B4715600B4583300B4583300B4583300A54B2400B272
      5B00C6C4C600F7F8F90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DFD6FE00B39F
      FD009983F8008E79F2005463C300285E9100245F8C0021588B0021588B001D5D
      8600206C84002D8E79003BC55E003BC55E002BBC4D002BBC4D0079BE8900D1C6
      CE00F6F1F5000000000000000000000000000000000000000000EFEFEF00D7D7
      D700BEBEC300B7B6B600A3A3A3008383830083838300838383007B7B7B007B7B
      7B007B7B7B006F709D004949BE004242B600393AB400393AB4008584BA00CFCC
      C600F9F8F000000000000000000000000000000000000000000000000000F9F9
      FE00F3ECE900DD8A6A00D76A4100D36E4800D36E4800C9653F00C2542A00DDA5
      8E000000000000000000BA775D00B4583300B65D3900AC502A00BA775D00C6BE
      BC00EDEEEE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCD8F900E6E6F3000000
      0000F2EDFE00D9D0FB00C0ADF0008183CE005585A7003B908F00389A790034B6
      73003BD45F0036D159002AA75F0039BD5E0066C57C00AAC1AE00DCCED700F8F6
      F7000000000000000000000000000000000000000000E6E6E600E6E6E6000000
      0000F7F7F700EFEFEF00DFDDD400B7B6B6009C9CAB008585AB006D6CAE006060
      BC004747C6004343BE0052529F005453B7007B7ABE00B2B0BE00DFDDD400F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      0000F2F9FE00E8E6E600D99F8900D36E4800D76A4100D76A4100CE684100D585
      6600E3B19E00E0AE9B00C46C4A00BD583100BC5F3A00BD947B00C6C4C600EDEE
      EE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F2EDFE00A48EF8009983F800A99D
      F500CDCBED00EAEBED00F9F8FE00EEEFEE00DED4DD00BCC6C00098C0A40073AB
      9000538A8A003E708D00447097008291AC00DCCED700F4EBF100000000000000
      000000000000000000000000000000000000F7F7F700C5C5C500BCBCBC00C5C5
      C500D7D7D700E6E6E600F7F7F700F7F7F700ECEAE200D2D0CD00B2B0BE009190
      A8007D7C8C00737373007373730099999900E3E1D900F7EFEF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F8F900DBDFE300D0BCB600D39A8500D57F5F00D4724D00CE67
      4000C95E3500C95E3500C4755500C8917D00C4B2AD00D2D5D900F7F8F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F8FE00E4DCFD00C4B4FE00A38E
      FD009682FA008C7BF5008778F2008B81EB008A83E6007770CC006057BB005C58
      B3005A5EAF00797DBC00ADA7D300DCD4ED000000000000000000000000000000
      000000000000000000000000000000000000FCFCF900EFEFEF00DDDDDD00CCCC
      CC00BCBCBC00B7B6B600ADADAD00ADADAD00ADADAD008D8D8D007B7B7B007B7B
      7B007B7B7B0093939300C2C1BC00EFEDE5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0F3F500DFE5E700D2CFCF00D0BCB600C4B2
      AD00C4B2AD00D0BCB600CCCCCC00DBDFE300F0F3F50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F1
      FD00DFD6FE00C4B4FE00B4A6FB00A496F8009C90F7009C90F700A6A2E900C2C1
      F200E3E2FA000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F700EFEFEF00DDDDDD00D2D0CD00C5C5C500BEBEC300BCBCBC00BCBCBC00D2D0
      CD00EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F3F500E6EC
      EF00E6ECEF00F0F3F50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FF80FFFF807FFFFFFF000000FE003FFE
      001FFE007F000000F8000FF8000FFC003F000000F00007F00007F0000F000000
      E00003E00003E00007000000E00003E00001E00007000000C00001C00001C000
      03000000C00001C0000080000100000080000080000080000100000080000080
      0000800001000000800000800000000001000000800000800000000000000000
      800000800000000000000000800400800000000001000000801000C000008000
      01000000C00001C00001800001000000C00001C00001800001000000E00003C0
      0003C00003000000C00003C00003C00003000000C00007C00007E00C07000000
      90000F90000FF0000F00000000003F00003FF8001F0000000000FF0000FFFE00
      7F000000E007FFE007FFFFC3FF00000000000000000000000000000000000000
      000000000000}
  end
  object imgCtrlNor: TImageList
    Height = 24
    Width = 24
    Left = 396
    Top = 80
    Bitmap = {
      494C0101030004007C0018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF6F000FFEFE600FFEFE600FFE9
      DD00FFE9DD00FFE9DD00FFF2EB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF6F000FFEBDF00FFE6D700FFE6
      D700FFE6D700FFE9DC00FFF0E600FFF0E6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFF2EB00FFE6D600FFD0B500FFC09B00FEB78D00FEB7
      8D00FEBC9500FFCDAF00FFE6D600FFEFE600FFEFE60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFF0E600FFDFCD00FFCDAF00FEB68B00FFAC7B00FFAC
      7B00FFB08100FEBC9500FFD6BD00FFE9DC00FFF0E600FFF0E600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFBF800FFF0E600FFE6D700FEDFCD00FEDF
      CD00FEDFCD00FEDFCD00FFEDE100FFF0E600FFFBF80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFF9F600FFE9DD00FFCDAF00FFA36D00FF873F00FF873F00FF873F00FF8D
      4800FE904D00FE935300FF9D6200FEBC9500FEDFCD00FFE6D600FFEFE6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFF6F000FFE6D700FFC6A400FF985B00FF843B00FF843B00FF843B00FF8B
      4400FF8B4400FE935300FE935300FFA67100FFCDAF00FFE6D700FFE6D7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFF0E600FFDCC600FFC6A400FEB68B00FFB18300FFB1
      8300FFB18300FEB68B00FFC6A400FFD9C400FFEDE100FFEDE100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFF6
      F000FFDCC600FFB08100FF7F3200FF7F3200FF843B00FF843B00FF8B4400FF8B
      4400FE904D00FE935300FF975900FF975900FF9D6200FFC6A400FFDCC600FFEC
      E00000000000000000000000000000000000000000000000000000000000FFF6
      F000FFDDC700FFAC7B00FF7F3200FF7F3200FF843B00FF843B00FF8B4400FF8B
      4400FE935300FE935300FF985B00FF9D6200FF9D6200FFB08100FFD9C300FFDF
      CD00000000000000000000000000000000000000000000000000000000000000
      0000FFF8F500FFE6D700FFC6A400FF9D6200FE935300FF995D00FFA36D00FFA3
      6D00FFA36D00FFAA7600FFA67100FFA67100FFB48600FFD9C400FEDFCD00FFF3
      ED00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF9F600FFDC
      C600FFA36D00FF7F3200FF7F3200FF843B00FF843B00FF843B00FF8B4400FF8B
      4400FE904D00FE904D00FF975900FF975900FF9D6200FF9D6200FEBC9500FFD9
      C300FFEFE6000000000000000000000000000000000000000000FFFBF800FFDD
      C700FFA36D00FF7F3200FF7F3200FF843B00FF843B00FF843B00FF8B4400FF8B
      4400FE935300FE935300FF975900FF9D6200FF9D6200FF9D6200FFAA7600FFD6
      BD00FFE6D700000000000000000000000000000000000000000000000000FFF8
      F500FFD9C400FFB18300FF843B00FF8D4800FE935300FF995D00FFA36D00FFA3
      6D00FFAA7600FF9D6200FF9D6200FFAC7B00FFA67100FFA67100FFC6A400FFD9
      C400FFF3ED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFE6D600FFAC
      7B00FF813400FF843B00FF843B00FF843B00FF843B00FF843B00FF8B4400FF8B
      4400FF8B4400FE904D00FE935300FF975900FF975900FF9D6200FF9D6200FFC3
      9F00FFD9C3000000000000000000000000000000000000000000FFE6D700FFB0
      8100FF813400FF843B00FF843B00FF843B00FF843B00FF843B00FF8B4400FF8B
      4400FF8B4400FE935300FE935300FF985B00FF9D6200FF9D6200FF9D6200FFB0
      8100FFD6BD00FFF0E6000000000000000000000000000000000000000000FEDF
      CD00FFAC7B00FF843B00FF8B4400FE935300FFAC7B00FFC6A400FFD2B600FEB6
      8B00FFD9C400FFD2B600FEBC9500FF9D6200FFAA7600FFAA7600FFA36D00FFC6
      A400FFD9C4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF6F000FFC39F00FF87
      3F00FF873F00FF873F00FF873F00FF873F00FFC09B00FF9D6200FF843B00FF8B
      4400FF8B4400FE904D00FE904D00FE935300FE935300FF975900FF975900FF97
      5900FFCDAF00FFE6D600000000000000000000000000FFF6F000FFC6A400FF87
      3F00FF873F00FF843B00FF843B00FF843B00FF873F00FF873F00FF873F00FF8B
      4400FF8B4400FE935300FE935300FE935300FF975900FF975900FF975900FF97
      5900FFC39F00FFDDC70000000000000000000000000000000000FFE9DD00FFBF
      9A00FF884100FF884100FF884100FFC29E00FFCFB400FFCFB400FFCFB400FFC2
      9E00FFCCAD00FFD2B600FEDFCD00FFD2B600FF9D6200FFAA7600FFAA7600FFA3
      6D00FFCFB400FEDFCD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFE6D600FFA77300FF87
      3F00FF873F00FF873F00FF873F00FE935300FFECE000FFECE000FFC6A400FF97
      5900FF873F00FF8D4800FE904D00FE904D00FE935300FE935300FE935300FF97
      5900FFB08100FFD9C300000000000000000000000000FFE9DC00FFB08100FF87
      3F00FF873F00FF873F00FF873F00FF873F00FF873F00FF873F00FF873F00FF87
      3F00FF8B4400FF8B4400FE935300FE935300FE935300FF975900FF975900FF97
      5900FFA36D00FFD2B700FFF6F0000000000000000000FFFBF800FFD2B600FF97
      5900FF8D4800FE935300FEB68B00FFA36D00FFD9C400FFC6A400FF9D6200FF97
      5900FF9D6200FFB48600FFCCAD00FFC6A400FFCCAD00FFA36D00FFAA7600FFA6
      7100FFB18300FFCFB400FFF8F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF6F000FFCDAF00FF995D00FE90
      4D00FF8B4400FF8B4400FF873F00FE935300FFE6D600FFE6D600FFECE000FFE6
      D600FFC09B00FE935300FF8B4400FF8B4400FE904D00FE935300FE935300FE93
      5300FE935300FFCDAF00FFF2EB000000000000000000FFD6BD00FF9D6200FE93
      5300FF873F00FF873F00FF873F00FF873F00FF873F00FF873F00FF873F00FF87
      3F00FF8B4400FF8B4400FF8B4400FF8B4400FE935300FE935300FE935300FE93
      5300FE935300FFC39F00FFE9DC000000000000000000FFF0E600FFBF9A00FE93
      5300FF8D4800FEBC9500FEDFCD00FFCCAD00FFB18300FF843B00FF813400FF88
      4100FF944A00FF975900FFA36D00FFBF9A00FEDFCD00FEBC9500FF9D6200FFAA
      7600FFA36D00FFC6A400FFE6D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFE9DD00FFC09B00FF975900FF97
      5900FE904D00FF8B4400FF813400FE904D00FEDFCD00FFE9DD00FFE9DD00FFE9
      DD00FFE9DD00FFE6D600FEB78D00FF8D4800FF8D4800FE904D00FE904D00FE90
      4D00FE904D00FFC09B00FFE9DD0000000000FFF6F000FFC6A400FF9D6200FF9D
      6200FE935300FF873F00FF8D4800FF8D4800FF873F00FF873F00FF873F00FF87
      3F00FF8B4400FF8B4400FF8B4400FF8B4400FF8B4400FF8B4400FE935300FE93
      5300FF8B4400FFB48600FFE6D7000000000000000000FEDFCD00FFAC7B00FF99
      5D00FF9D6200FFD9C400FFD9C400FFC6A400FF884100FF843B00FFAC7B00FF99
      5D00FF884100FE935300FF975900FF9D6200FFC29E00FFD2B600FF9D6200FFA6
      7100FF9D6200FEB68B00FFDCC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEDFCD00FEB78D00FF995D00FF9D
      6200FF9D6200FF873F00FF873F00FF873F00FFC09B00FFECE000FFECE000FFEC
      E000FFECE000FFECE000FFEFE600FEDFCD00FFB08100FF8D4800FF8D4800FF8D
      4800FF8D4800FFB48600FFE6D60000000000FFEBDF00FFBF9A00FF9D6200FF9D
      6200FF9D6200FFAA7600FEB68B00FFAC7B00FFA36D00FF873F00FF873F00FF87
      3F00FF873F00FF8B4400FF8B4400FF8B4400FF8B4400FF8D4800FF8D4800FF8D
      4800FF873F00FFAA7600FFDFCD0000000000FFF8F500FFD5BD00FFA67100FF9D
      6200FEB68B00FFEDE100FFE6D700FFA67100FF884100FF884100FFDCC600FFF0
      E600FEBC9500FE935300FF8D4800FE935300FFA67100FFD2B600FFB18300FF99
      5D00FF9D6200FFAA7600FFD5BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFD9C300FEB78D00FF9D6200FF9D
      6200FF9D6200FF9D6200FF8B4400FF8B4400FFE6D600FFF2EB00FFEFE600FFEF
      E600FFEFE600FFEFE600FFECE000FFF2EB00FFF9F600FFAC7B00FF873F00FF87
      3F00FF873F00FFB08100FFE6D60000000000FFE9DC00FFBF9A00FF9D6200FF9D
      6200FF9D6200FFAA7600FFB48600FFAC7B00FF9D6200FF873F00FF873F00FF87
      3F00FF873F00FF873F00FF873F00FF8B4400FF8B4400FF8B4400FF8B4400FF8B
      4400FF873F00FFA67100FFDDC70000000000FFF6F000FFCFB400FFA67100FFA6
      7100FFB18300FFBF9A00FFD2B600FFA36D00FE935300FF8D4800FFD5BD00FFF8
      F500FFF8F500FFEDE100FEBC9500FF884100FF975900FFBF9A00FFD5BD00FFD9
      C400FE935300FF9D6200FFCFB400FFF8F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEDFCD00FEBC9500FFA36D00FFA3
      6D00FF975900FE904D00FF975900FFA36D00FFE9DD00FFD6BE00FFEFE600FFF6
      F000FFF6F000FFF6F000FFF9F600FEDFCD00FFA77300FF873F00FF873F00FF87
      3F00FF873F00FFB08100FFE9DD0000000000FFF0E600FFC39F00FFA36D00FFA3
      6D00FFA36D00FFA36D00FF9D6200FF9D6200FF985B00FF985B00FF873F00FF87
      3F00FF873F00FF873F00FF873F00FF873F00FF873F00FF873F00FF873F00FF87
      3F00FF873F00FFA67100FFDFCD0000000000FFF6F000FFCFB400FFAA7600FFA6
      7100FEBC9500FFE9DD00FFD5BD00FFA67100FF9D6200FF975900FEDFCD00FFFB
      F800FFFBF800FFEDE100FEB68B00FF843B00FE935300FFCFB400FFE9DD00FFFB
      F800FFD5BD00FF995D00FFCFB400FFF6F0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFECE000FFC39F00FFA36D00FFA3
      6D00FF9D6200FF975900FE904D00FE935300FEBC9500FEBC9500FFE6D600FFFB
      F900FFFBF900FFE9DD00FFB08100FF873F00FF873F00FF873F00FF873F00FF87
      3F00FF873F00FEBC9500FFEFE60000000000FFF9F600FFCDAF00FFA67100FFA6
      7100FFC39F00FEBC9500FFB08100FFAC7B00FFAC7B00FFAC7B00FF9D6200FE93
      5300FF8D4800FF873F00FF873F00FF873F00FF873F00FF873F00FF873F00FF87
      3F00FF873F00FFB08100FFE9DC0000000000FFFBF800FFD5BD00FFAC7B00FFAC
      7B00FFB48600FFF3ED00FFE6D700FFB48600FFA36D00FFA36D00FFEDE100FFF8
      F500FFC6A400FF944A00FF843B00FF843B00FF9D6200FFEDE100FFEDE100FFED
      E100FEDFCD00FFA36D00FFD2B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF9F600FFD0B500FFA77300FFA7
      7300FFA77300FF9D6200FE935300FF995D00FEDFCD00FFEFE60000000000FFF6
      F000FFC6A400FE935300FF873F00FF8D4800FF8D4800FF8D4800FF873F00FF87
      3F00FF8B4400FFC6A400FFF6F0000000000000000000FFDFCD00FFB08100FFAA
      7600FFB08100FEB68B00FEB68B00FEB68B00FFB08100FFAA7600FFA36D00FFA3
      6D00FF9D6200FF985B00FF985B00FE935300FE935300FF8D4800FF8D4800FF8D
      4800FF8D4800FFC39F00FFF6F0000000000000000000FEDFCD00FFB48600FFAC
      7B00FFAC7B00FEDFCD00FFF8F500FFD5BD00FFAC7B00FFAC7B00FFC6A400FFB1
      8300FE935300FF995D00FF995D00FE935300FEBC9500FFB48600FFD5BD00FEDF
      CD00FF944A00FFA67100FEDFCD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFE6D600FFB48600FE93
      5300FE935300FFA36D00FFA36D00FFB08100FFF9F600FFE6D600FFA77300FE93
      5300FE935300FF995D00FF995D00FF995D00FF995D00FE935300FE935300FF8B
      4400FFA77300FFDCC600000000000000000000000000FFF0E600FFC6A400FEB6
      8B00FFAA7600FFA67100FFA67100FFA67100FFA67100FFA67100FFA67100FF9D
      6200FF9D6200FF9D6200FF9D6200FF9D6200FF9D6200FF985B00FF985B00FE93
      5300FFA36D00FFD9C300000000000000000000000000FFEDE100FFC29E00FFAC
      7B00FFAC7B00FEBC9500FFF0E600FFCFB400FFCFB400FFB18300FFA67100FFA6
      7100FFA67100FFA67100FFA67100FEB68B00FFA67100FE935300FFAA7600FFA3
      6D00FF944A00FEBC9500FFE9DD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF6F000FFCDAF00FFAC
      7B00FFA36D00FF975900FE935300FE935300FFA36D00FE935300FF873F00FF8D
      4800FFA36D00FFA36D00FF9D6200FF9D6200FF995D00FF995D00FE935300FE90
      4D00FFC6A400FFF2EB0000000000000000000000000000000000FFDDC700FFD6
      BD00FFC39F00FEB68B00FFB08100FFAC7B00FFAC7B00FFAC7B00FFAC7B00FFAC
      7B00FFA36D00FFA36D00FF9D6200FF9D6200FF9D6200FF9D6200FF985B00FE93
      5300FFC6A400FFF0E600000000000000000000000000FFF8F500FFD2B600FFB1
      8300FFB18300FFB18300FFB18300FFE9DD00FFFBF800FFD9C400FFBF9A00FEB6
      8B00FFB48600FEB68B00FFBF9A00FFB18300FF9D6200FF9D6200FF995D00FF99
      5D00FF9D6200FFCCAD00FFF8F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFE6D600FFCD
      AF00FFA77300FFA36D00FF995D00FF995D00FE904D00FF995D00FFAA7600FFAA
      7600FFA36D00FFA36D00FFA36D00FF9D6200FF9D6200FF9D6200FE935300FEB7
      8D00FFE6D6000000000000000000000000000000000000000000FFEBDF00FFDD
      C700FEB68B00FFBF9A00FFBF9A00FEB68B00FEB68B00FFB48600FFAC7B00FFAC
      7B00FFA36D00FFA36D00FFA36D00FFA36D00FFA36D00FF9D6200FF975900FEB6
      8B00FFDFCD000000000000000000000000000000000000000000FFE9DD00FFC6
      A400FFB18300FFB18300FFB18300FFBF9A00FFE6D700FFF6F000FFEDE100FFD5
      BD00FFD5BD00FFE6D700FFB18300FF9D6200FF9D6200FF9D6200FF9D6200FF97
      5900FFBF9A00FFE6D70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFE6D600FFD0B500FFDC
      C600FEB78D00FFA77300FFB08100FFB08100FFAC7B00FFA36D00FF975900FF87
      3F00FF873F00FFA36D00FFA36D00FFA36D00FFA36D00FF995D00FFB48600FFDC
      C600FFF9F60000000000000000000000000000000000FFE6D700FFD0B400FFDD
      C700FFD2B700FFAA7600FFAC7B00FFAC7B00FFAC7B00FFAC7B00FFA67100FFA6
      7100FFA67100FFA67100FFA67100FFA67100FFA67100FF9D6200FFB48600FFDD
      C700FFF9F6000000000000000000000000000000000000000000FFFBF800FFED
      E100FFC29E00FFB18300FFB18300FFB18300FFB18300FEBC9500FFC29E00FFCF
      B400FFFBF800FFF3ED00FFB18300FFA36D00FFA36D00FFA36D00FF995D00FFB1
      8300FFD9C400FFFBF80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF2EB00FEDFCD00FFD6
      BE00FFD0B500FFB48600FE935300FE935300FE904D00FE904D00FF8D4800FF8D
      4800FE935300FFAC7B00FFAC7B00FFA36D00FFA36D00FEBC9500FFDCC600FFF6
      F0000000000000000000000000000000000000000000FFF6F000FFDFCD00FFD6
      BD00FFD0B400FFC39F00FFB08100FFB08100FFAA7600FFAA7600FFAA7600FFAA
      7600FFB08100FFB08100FFAA7600FFA67100FFA67100FFBF9A00FFDDC700FFF6
      F00000000000000000000000000000000000000000000000000000000000FFFB
      F800FFF3ED00FFC29E00FFB18300FFB18300FFB18300FFB18300FFA67100FFCF
      B4000000000000000000FFB18300FFA67100FFA67100FF9D6200FFB18300FFD5
      BD00FFF6F0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFEFE600FFF2EB0000000000FFF9
      F600FFEFE600FEDFCD00FFC6A400FFAA7600FF995D00FF9D6200FFA36D00FFB0
      8100FFB08100FF9D6200FFA77300FEB78D00FFCDAF00FFE6D600FFF9F6000000
      000000000000000000000000000000000000FFF0E600FFF0E60000000000FFFB
      F800FFF0E600FFE6D700FFD0B400FFC39F00FEBC9500FEB68B00FEB68B00FFB0
      8100FFAC7B00FFA67100FFAC7B00FEBC9500FFD0B400FFE6D700FFFBF8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFBF800FFF0E600FFCCAD00FEB68B00FFB48600FFB48600FFB48600FFBF
      9A00FFD5BD00FFD5BD00FFB18300FFA67100FFA67100FFBF9A00FFD9C400FFF3
      ED00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFD6BE00FFD6BE00FFDCC600FFE9
      DD00FFF2EB00FFFBF900FFF6F000FFE6D600FFD6BE00FFC6A400FFB48600FF9D
      6200FF995D00FF9C6B00FEBC9500FFE6D600FFF2EB0000000000000000000000
      000000000000000000000000000000000000FFD9C300FFD2B700FFD9C300FFE6
      D700FFF0E600FFFBF800FFFBF800FFF0E600FFDFCD00FFD0B400FEBC9500FFAC
      7B00FFA36D00FFA36D00FEBC9500FFE9DC00FFF6F00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFF8F500FFE9DD00FFD5BD00FFC6A400FEBC9500FEB68B00FFB1
      8300FFAC7B00FFAC7B00FFB48600FFC29E00FFCFB400FFE6D700FFF8F5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF2EB00FFE6D600FFD9C300FFD6
      BE00FFD0B500FFD0B500FFD0B500FFD0B500FFC09B00FFB08100FFB08100FFB0
      8100FEBC9500FFD0B500FFECE000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF6F000FFE9DC00FFD9C300FFD6
      BD00FFCDAF00FFC6A400FFC6A400FFC6A400FFB48600FFA67100FFA67100FFA6
      7100FEB68B00FFD6BD00FFF0E600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF6F000FFEDE100FEDFCD00FFD5BD00FFCF
      B400FFCFB400FFD5BD00FEDFCD00FFE9DD00FFF6F00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF9F600FFF2
      EB00FFE9DD00FEDFCD00FFD9C300FFD9C300FFD9C300FFD9C300FFE6D600FFF2
      EB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFBF800FFF6
      F000FFE9DC00FFDFCD00FFD9C300FFD6BD00FFD2B700FFD2B700FFDFCD00FFF0
      E600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF6F000FFF6
      F000FFF0E600FFF6F00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FF01FFFF00FFFFFFFF000000FC007FFC
      003FFE007F000000F0001FF0001FFC003F000000E0000FE0000FF0000F000000
      C00007C00007E00007000000C00007C00003E00007000000800003800003C000
      0300000080000380000180000100000000000180000180000100000000000100
      0001800001000000000001000001000001000000000001000001000000000000
      0000010000010000000000000000010000010000010000000020018000018000
      01000000800003800003800001000000800003C00003800001000000C00007C0
      0007C00003000000800007800007C0000300000080000F80000FE00C07000000
      20001F20001FF0000F00000000007F00007FF8001F0000000001FF0001FFFE00
      7F000000C00FFFC00FFFFFC3FF00000000000000000000000000000000000000
      000000000000}
  end
  object PrintDialog1: TPrintDialog
    Copies = 1
    Options = [poSelection]
    Left = 488
    Top = 172
  end
  object qryPrintMstr: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans1 where tanggal = CURRENT_DATE')
    Left = 624
    Top = 64
  end
  object dsQryPrintMstr: TDataSource
    DataSet = qryPrintMstr
    Left = 624
    Top = 120
  end
  object QryPrintDetail: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans_detail1 where tanggal = CURRENT_DATE')
    Left = 616
    Top = 180
  end
  object dsQryPrintDetail: TDataSource
    DataSet = QryPrintDetail
    Left = 612
    Top = 236
  end
  object qryTrans1: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans1 where tanggal = CURRENT_DATE')
    Left = 48
    Top = 124
  end
  object dsqryTrans1: TDataSource
    DataSet = qryTrans1
    Left = 48
    Top = 180
  end
  object qryTrans2: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans1 where tanggal = CURRENT_DATE')
    Left = 140
    Top = 124
  end
  object dsQryTrans2: TDataSource
    DataSet = qryTrans2
    Left = 140
    Top = 180
  end
  object qryJenisTrans: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans_id;')
    Left = 136
    Top = 236
  end
  object dsQryJenisTrans: TDataSource
    DataSet = qryJenisTrans
    Left = 136
    Top = 292
  end
  object qryDelete: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans_id;')
    Left = 232
    Top = 236
  end
  object dsQryDelete: TDataSource
    DataSet = qryDelete
    Left = 232
    Top = 292
  end
  object tblTrans1: TMyTable
    TableName = 'trans1'
    Connection = dmDB.dbInternal
    Left = 416
    Top = 224
  end
  object dsTblTrans1: TDataSource
    DataSet = tblTrans1
    Left = 416
    Top = 276
  end
  object qryToko: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'Select * from toko WHERE id_toko = '#39'#'#39)
    Left = 320
    Top = 152
  end
  object dsQryToko: TDataSource
    DataSet = qryToko
    Left = 320
    Top = 208
  end
end
