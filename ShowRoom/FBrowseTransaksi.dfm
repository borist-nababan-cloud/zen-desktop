object frmBrowseTransaksi: TfrmBrowseTransaksi
  Left = 0
  Top = 0
  Caption = 'Browse Transaksi'
  ClientHeight = 522
  ClientWidth = 1019
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Times New Roman'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1019
    522)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 4
    Width = 1003
    Height = 30
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '.: Tabel Browse SPK :.'
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
    Top = 80
    Width = 1003
    Height = 392
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = ''
    object gtbMstrTransaksi: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryMstrSPK
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
          Column = gtbMstrTransaksino_spk
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtbMstrTransaksino_spk
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.FooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object gtbMstrTransaksitanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Visible = False
        GroupIndex = 0
        SortIndex = 0
        SortOrder = soDescending
        Width = 100
      end
      object gtbMstrTransaksino_spk: TcxGridDBColumn
        Caption = 'No SPK'
        DataBinding.FieldName = 'no_spk'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbMstrTransaksinama_pembeli: TcxGridDBColumn
        Caption = 'Nama Pembeli'
        DataBinding.FieldName = 'nama_pembeli'
        Width = 100
      end
      object gtbMstrTransaksinama_bpkb: TcxGridDBColumn
        Caption = 'Nama BPKB'
        DataBinding.FieldName = 'nama_bpkb'
        Width = 100
      end
      object gtbMstrTransaksinama_kuitansi: TcxGridDBColumn
        Caption = 'Nama Kuitansi'
        DataBinding.FieldName = 'nama_kuitansi'
        Width = 100
      end
      object gtbMstrTransaksiColumn1: TcxGridDBColumn
        Caption = 'No Rangka'
        DataBinding.FieldName = 'id_kendaraan'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_kendaraan'
        Properties.ListColumns = <
          item
            FieldName = 'no_rangka'
          end>
        Width = 125
      end
      object gtbMstrTransaksiid_kendaraan: TcxGridDBColumn
        Caption = 'Id Type'
        DataBinding.FieldName = 'id_kendaraan'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_kendaraan'
        Properties.ListColumns = <
          item
            FieldName = 'id_type'
          end>
        Width = 100
      end
      object gtbMstrTransaksiColumn2: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'id_kendaraan'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_kendaraan'
        Properties.ListColumns = <
          item
            FieldName = 'id_type'
          end>
        Visible = False
        Width = 125
      end
      object gtbMstrTransaksialamat_pembeli: TcxGridDBColumn
        DataBinding.FieldName = 'alamat_pembeli'
        Visible = False
        Width = 100
      end
      object gtbMstrTransaksikota_pembeli: TcxGridDBColumn
        DataBinding.FieldName = 'kota_pembeli'
        Visible = False
        Width = 100
      end
      object gtbMstrTransaksitelepon_pembeli: TcxGridDBColumn
        DataBinding.FieldName = 'telepon_pembeli'
        Visible = False
        Width = 100
      end
      object gtbMstrTransaksihandphone_pembeli: TcxGridDBColumn
        DataBinding.FieldName = 'handphone_pembeli'
        Visible = False
      end
      object gtbMstrTransaksialamat_bpkb: TcxGridDBColumn
        DataBinding.FieldName = 'alamat_bpkb'
        Visible = False
      end
      object gtbMstrTransaksiktp_bpkb: TcxGridDBColumn
        DataBinding.FieldName = 'ktp_bpkb'
        Visible = False
      end
      object gtbMstrTransaksikota_bpkb: TcxGridDBColumn
        DataBinding.FieldName = 'kota_bpkb'
        Visible = False
      end
      object gtbMstrTransaksialamat_kuitansi: TcxGridDBColumn
        DataBinding.FieldName = 'alamat_kuitansi'
        Visible = False
      end
      object gtbMstrTransaksikota_kuitansi: TcxGridDBColumn
        DataBinding.FieldName = 'kota_kuitansi'
        Visible = False
      end
      object gtbMstrTransaksilunas: TcxGridDBColumn
        DataBinding.FieldName = 'lunas'
        Visible = False
        Width = 77
      end
      object gtbMstrTransaksiid_spk: TcxGridDBColumn
        Caption = 'ID Transaksi'
        DataBinding.FieldName = 'id_spk'
        Width = 100
      end
      object gtbMstrTransaksihead_sales: TcxGridDBColumn
        Caption = 'Head Sales'
        DataBinding.FieldName = 'head_sales'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbMstrTransaksisales: TcxGridDBColumn
        Caption = 'Sales'
        DataBinding.FieldName = 'sales'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbMstrTransaksipayment: TcxGridDBColumn
        Caption = 'Pembayaran'
        DataBinding.FieldName = 'payment'
        Width = 100
      end
      object gtbMstrTransaksileasing: TcxGridDBColumn
        Caption = 'Leasing'
        DataBinding.FieldName = 'leasing'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbMstrTransaksilama_angsuran: TcxGridDBColumn
        Caption = 'Lama Angsuran'
        DataBinding.FieldName = 'lama_angsuran'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 75
      end
      object gtbMstrTransaksijumlah_angsuran: TcxGridDBColumn
        Caption = 'Jumlah Angsuran'
        DataBinding.FieldName = 'jumlah_angsuran'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 75
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbMstrTransaksi
    end
  end
  object btnSelect: TcxButton
    Left = 8
    Top = 478
    Width = 85
    Height = 36
    Anchors = [akLeft, akBottom]
    Caption = 'Select'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 1
    OnClick = btnSelectClick
  end
  object btnView: TcxButton
    Left = 96
    Top = 478
    Width = 85
    Height = 36
    Anchors = [akLeft, akBottom]
    Caption = 'Expand'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 2
    OnClick = btnViewClick
  end
  object ckLimit: TcxCheckBox
    Left = 8
    Top = 44
    Caption = 'Set Limit'
    Properties.OnChange = ckLimitPropertiesChange
    State = cbsChecked
    TabOrder = 3
  end
  object edLimit: TcxCalcEdit
    Left = 148
    Top = 44
    EditValue = 500
    TabOrder = 4
    OnKeyPress = edLimitKeyPress
    Width = 77
  end
  object cxButton1: TcxButton
    Left = 231
    Top = 40
    Width = 42
    Height = 34
    LookAndFeel.Kind = lfOffice11
    OptionsImage.Glyph.Data = {
      36090000424D3609000000000000360000002800000018000000180000000100
      2000000000000009000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000060300095B2A0089863D00CCA64A
      00FFAA4D00FFBB6102FFAC4F07FFB05409FF844209BB48250665000000000000
      000000000000000000000000000000000000000000000F090212000000000000
      00000000000000000000000000006F3300A7A64900FFC26800FFD48101FFE49A
      01FFE39801FFE29700FFE49A06FFE49A0DFFDB8D15FFCE7C17FFBB5F15FF6F3D
      0D930000000000000000000000000000000037220944CF7E23FF000000000000
      0000000000001309001DA74B00FFBD6100FFDF9001FFE29701FFE09501FFDF93
      00FFE09301FFE0980AFFE39C0FFFE49F19FFE7A722FFEAAE2BFFEAAA33FFD182
      22FFBD6A1AF5140C031A00000000865115A7D88E2CFFDB932EFF000000000000
      00001309001DA64A00FFD17C01FFE39801FFE09401FFDF9301FFDF9300FFE093
      04FFE1990AFFE39E14FFE5A21DFFE7A725FFE8AB2EFFEAAF36FFECB53EFFF1BD
      46FFE4A63BFFCC7A1FFFBA6E1AE8E5A940FFF9D66FFFDF9936FF000000000000
      0000A74B00FFD17C01FFE19701FFDF9401FFDF9301FFDF9201FFE09506FFE49B
      0EFFE5A116FFE8A61EFFE8A925FFE9AC2CFFEAAF34FFEDB43EFFEEB947FFF0BF
      50FFF3C556FFEEBB51FFEEBA54FFF6CF6DFFF8D472FFE19E37FF000000006F33
      00A7BC6100FFE39801FFDF9401FFDF9300FFE09403FFE2990AFFE7A113FFDB8E
      17FFD9902DFFCE8632FFE2AD63FFECC680FFF9DE9EFFF2CB68FFEFBD4AFFF1C3
      56FFF3C75EFFF5CB65FFF6CE6BFFF6D072FFF9D779FFE3A43CFF06030009A64A
      00FFDF9101FFE09401FFDF9300FFE09304FFE29B0BFFE09614FFBE6613FFB15D
      13F25E320B7E2413042F542F096E7C440DA0CA771CFFE9BE76FFFCE5ACFFF2C7
      5AFFF4CB66FFF5CE6BFFF6D272FFF8D477FFFBDC82FFE5A93FFF5B2A0089C268
      01FFE29700FFDF9201FFE09406FFE49B0FFFE19716FFBB6414FF4F2A096B0000
      000000000000000000000000000000000000673E0F80CE7C1CFFF5D891FFF4CA
      66FFF6CF6DFFF7D273FFF9D678FFF9D97FFFFCDF89FFE8AD44FF8A4003CCD685
      01FFE29703FFE2990AFFE39D12FFE8A61BFFC56E17FF5F340B7F000000000000
      0000000000000000000000000000965B16BAE1A852FFFADF96FFF5CB5FFFF5CF
      6DFFF7D271FFF9D77AFFFADA80FFFADC85FFFEE390FFEAB146FFAF5507FFC56D
      09FFD4860BFFE39915FFE9A81FFFE4A024FFB25F16F000000000000000000000
      000000000000170E041CCF7E22FFD99234FFF6DEA6FFFFF1D3FFFEEFD1FFFEE8
      B7FFFCE19EFFFADB80FFFBDC81FFFCDF88FFFDE492FFEDB74AFF000000001108
      0117341B0548904B10C7C36E19FFCA771EFF814710A900000000000000000000
      00000000000000000000000000003C260B487A4C1391B9751ADDE6AD4DFFF1CC
      82FFFAE4B6FFFFF6E3FFFFF2D2FFFFECBEFFFFEBAFFFEFBB4BFF9F4700F22D13
      0044000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004C34
      0F578D601CA0D89B31F0EFC366FFF6DB99FFFEEECEFFF2C664FFC47622FFE3B0
      60FFE3B060FFCF8832FFCF8832FF733805A04021055700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005D451664E4AE3EF2B55B00FFEBB3
      2BFFF0CA63FFF8E19FFFFFF0CAFFF2D496FFE5B167FFD58F36FFA8590BDD7140
      0D913A2309480000000000000000000000000000000000000000000000009467
      22A9E7AD42FFE8AA3EFFB38229C7000000000000000000000000BB5F03FFE295
      01FFE09506FFE39A0DFFE5A31CFFEFC55DFFF6D890FFFDEBBEFFFEEDC7FFF5DA
      9EFFD78F32FFD28324FF170F041C00000000000000000000000000000000D493
      2CF0FADD81FFFEE696FFFCE38EFFF9D573FFF4D075FFEFB841FFBC6106FFE299
      06FFE39A0FFFE49F19FFE7A423FFE7A92AFFEAAB31FFECB032FFF5D57FFFDFA5
      4FFF985B17BA0000000000000000000000000000000000000000714E1A7FE7AB
      3EFFFEE491FFFCE491FFFEE592FFFFEAB0FFFCE8BAFFBF9232CCBD6509FFE29C
      09FFE39C12FFE5A11BFFE7A727FFE9AD31FFEBAF36FFF2CF7CFFCC781AFF673E
      0F8000000000000000000000000000000000000000005E41156BE39F32FFFADA
      7DFFFCE18FFFFDE392FFFEE38FFFFFF2D1FFF6D47CFF80632289C1660AFFE39C
      09FFE39E14FFE6A21EFFE7A829FFEAAE35FFEAB036FFF9DFA1FFE9BE77FFD283
      22FF855214A05D3C106E281B082F6D4A167ED3902DF2E4A338FFF7D779FFFDE1
      8DFFFCE08EFFFDE28FFFFEE8AAFFFFF0D5FFEFB538FF08070209C2690DFFE59C
      0CFFE49F18FFE7A523FFE9AB2CFFEAAF36FFEDB33EFFEDB640FFF4CC6DFFF9E4
      A9FFF2CF8FFFECC376FFE5AA4DFFEEBE5EFFF1C964FFFCDE85FFFBDE87FFFCE0
      8BFFFCE08CFFFEE59BFFFFF5DFFFF4CE6EFF9D792BA700000000C36B0FFFE59D
      0EFFE7A41BFFE19A1FFFE7A735FFECB339FFEDB540FFEEBA48FFF0BE4EFFF0C2
      52FFF3C75DFFF5CC68FFF7D171FFF8D576FFFAD87DFFFADA80FFFBDD85FFFCDF
      88FFFDE49BFFFFF2D3FFFBE3AAFFEFB63BFF0000000000000000C56F12FFE8A4
      12FFD7881BFFB06118E8CB7824FFE5A943FFEFBA43FFEEBC4AFFF0C052FFF2C5
      5AFFF4C963FFF5CD6AFFF6D271FFF8D477FFF9D87DFFFADA7FFFFBDD83FFFDE7
      A3FFFFF5DEFFFBE4AAFFEFB538FF1B15081D0000000000000000C77113FFC872
      18FF7F4711A700000000140C031AC3731DF5DFA043FFF3CB6DFFF2C65CFFF2C7
      59FFF4C960FFF4CC67FFF7D16EFFF7D573FFF8D778FFFBE098FFFFEFCDFFFEF0
      D4FFF4CE6EFFEFB63BFF1B15081D000000000000000000000000BF6918FF341D
      074400000000000000000000000000000000794C1493D48321FFE9BB6AFFF3D0
      85FFF8DF99FFFBE5A9FFFCE5ABFFFEEBBCFFFFF3D8FFFAE3AFFFF4CF79FFEFB4
      38FF9D792BA700000000000000000000000000000000000000000E0802120000
      000000000000000000000000000000000000000000000000000056391065A16A
      1DBBDE952CFFE1982BFFEDB95BFFE7A938FFE8A934FFBD8B2DCC7F6122890807
      0209000000000000000000000000000000000000000000000000}
    TabOrder = 5
    OnClick = cxButton1Click
  end
  object dsQryMstrSPK: TMyDataSource
    DataSet = qryMstrSpk
    Left = 528
    Top = 40
  end
  object qryMstrSpk: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select * from mstr_spk where lunas <> '#39'BATAL'#39' and lunas <> '#39'SELE' +
        'SAI'#39' '
      'ORDER BY tanggal DESC LIMIT 500')
    Left = 396
    Top = 40
  end
end
