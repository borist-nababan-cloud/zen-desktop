object frmHistoryPKB: TfrmHistoryPKB
  Left = 0
  Top = 0
  Caption = 'History Kendaraan'
  ClientHeight = 591
  ClientWidth = 941
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    941
    591)
  PixelsPerInch = 96
  TextHeight = 16
  object gbSearch: TcxGroupBox
    Left = 8
    Top = 8
    TabOrder = 0
    Visible = False
    Height = 53
    Width = 505
    object cxLabel1: TcxLabel
      Left = 8
      Top = 10
      Caption = 'Nomor Polisi'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object edNopolTengah: TcxTextEdit
      Left = 167
      Top = 9
      ParentFont = False
      Properties.MaxLength = 4
      Properties.PasswordChar = '0'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 121
    end
    object edNopolBelakang: TcxTextEdit
      Left = 292
      Top = 9
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 4
      Properties.PasswordChar = '0'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 67
    end
    object btnCari: TcxButton
      Left = 365
      Top = 8
      Width = 85
      Height = 33
      Caption = 'Add'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000330000002F000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000033008B49FF008246F1000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000033008743FFA1E2D5FF239A60FF000000330000
        0033000000330000003300000022000000000000000000000000000000000000
        00000000000000000033008743FF93DCC9FF1ACAADFF00B68EFF009658FF0097
        5BFF008B4AFF008945FF005B30B9000000330000000000000000000000000000
        000000000000008A48FF81DBC2FF14CEA9FF00C499FF57DBC1FF56DCC3FF56DD
        C4FF56DEC5FF56DCC4FF44C19AFF008B4AFF0000003300000000000000000000
        000000000000008A48FF6FD7B8FF12D5A9FF00CD9BFF00CE9DFF00D1A0FF00D2
        A1FF00D1A0FF00D1A0FF1DD8AEFF2FCCA3FF018A49FF0000001E000000000000
        00000000000000000000008744FF5FD1ACFF11DDAAFF00CA90FF008B49FF0087
        45FF009C5EFF00A568FF00C48AFF04DDA8FF16BA83FF01532DAA000000000000
        0033000000330000001A00000000008846FF4ED3A9FF129155FF000000000000
        002D00000033004B2889008043F000B578FF00D89FFF008B4BFF00000000008D
        4DFF008B4BFF004626990000002C0000001400592FA2008D4CFF00000000007B
        42E5008C4AFF0000003300000000005C31A8008B4BFF008D4DFF00000000008B
        4BFF00D89FFF00B578FF00773EE400361D820000003300000033000000331191
        54FF53D4AAFF008846FF00000033000000000000000000000000000000000252
        2D951ABA86FF07DBA8FF00BE85FF00A061FF009C5DFF008744FF008A49FF00C9
        90FF12DCAAFF63D3AFFF008744FF000000330000000000000000000000000000
        0000008A49FF35D0AAFF20D7B1FF0DD3A7FF0DD4A7FF0DD4A8FF0DD3A7FF0ED1
        A4FF00CA9AFF13D3A9FF73D7BBFF008A48FF0000000000000000000000000000
        000000000000018B49FF48C29CFF5CDCC6FF5BDEC8FF5ADEC7FF5BDDC6FF5CDB
        C3FF00C399FF15CCAAFF85DBC3FF008A48FF0000000000000000000000000000
        00000000000000000000005B2FA8008946FF008844FF008744FF008947FF00B5
        8EFF1BC8AEFF98DECBFF008742FF000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000239B
        61FFA1E2D5FF008743FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000082
        46ED008B49FF0000000000000000000000000000000000000000}
      TabOrder = 3
      OnClick = btnCariClick
    end
    object edNopolDepan: TcxTextEdit
      Left = 109
      Top = 9
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 4
      Properties.PasswordChar = '0'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      Text = 'P'
      Width = 52
    end
  end
  object cxLabel5: TcxLabel
    Left = 375
    Top = 70
    Caption = 'Type Mobil'
    Transparent = True
  end
  object edTypeMobil: TcxLookupComboBox
    Left = 457
    Top = 69
    Properties.KeyFieldNames = 'id_type'
    Properties.ListColumns = <
      item
        FieldName = 'nama_group_detail'
      end>
    Properties.ListSource = dsTbljenis
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 252
  end
  object cxLabel6: TcxLabel
    Left = 375
    Top = 94
    Caption = 'Warna'
    Transparent = True
  end
  object edWarnaMobil: TcxTextEdit
    Left = 457
    Top = 93
    Properties.ReadOnly = True
    TabOrder = 4
    Width = 252
  end
  object cxLabel7: TcxLabel
    Left = 375
    Top = 118
    Caption = 'Tahun'
    Transparent = True
  end
  object edTahunMobil: TcxTextEdit
    Left = 457
    Top = 117
    Properties.ReadOnly = True
    TabOrder = 6
    Width = 252
  end
  object cxLabel2: TcxLabel
    Left = 4
    Top = 69
    Caption = 'Kode pelanggan'
    Transparent = True
  end
  object edKodeKonsumen: TcxTextEdit
    Left = 105
    Top = 68
    Properties.ReadOnly = True
    TabOrder = 8
    Width = 252
  end
  object cxLabel3: TcxLabel
    Left = 4
    Top = 93
    Caption = 'Nama Pelanggan'
    Transparent = True
  end
  object edNamaKonsumen: TcxTextEdit
    Left = 105
    Top = 92
    Properties.ReadOnly = True
    TabOrder = 10
    Width = 252
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 118
    Caption = 'Nomor Plat'
    Transparent = True
  end
  object edPlatNomor: TcxTextEdit
    Left = 105
    Top = 117
    Properties.ReadOnly = True
    TabOrder = 12
    Width = 252
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 156
    Width = 445
    Height = 377
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 13
    object gtbMaster: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryMaster
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
      object gtbMasterpkbnumber: TcxGridDBColumn
        Caption = 'No. PKB'
        DataBinding.FieldName = 'pkbnumber'
        Width = 100
      end
      object gtbMastertglmasuk: TcxGridDBColumn
        Caption = 'Tgl Masuk'
        DataBinding.FieldName = 'tglmasuk'
        Width = 100
      end
      object gtbMasterwaktumasuk: TcxGridDBColumn
        Caption = 'Jam'
        DataBinding.FieldName = 'waktumasuk'
        Width = 100
      end
      object gtbMasterkeluhan: TcxGridDBColumn
        Caption = 'Keluhan'
        DataBinding.FieldName = 'keluhan'
        Visible = False
        Width = 100
      end
      object gtbMasterkilometer: TcxGridDBColumn
        DataBinding.FieldName = 'kilometer'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbMaster
    end
  end
  object cxGrid2: TcxGrid
    Left = 468
    Top = 420
    Width = 457
    Height = 163
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 14
    ExplicitWidth = 579
    object gtbDetails: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryDetails
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
      object gtbDetailspkbnumber: TcxGridDBColumn
        Caption = 'No. PKB'
        DataBinding.FieldName = 'pkbnumber'
        Width = 140
      end
      object gtbDetailstypedetail: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'typedetail'
        Width = 100
      end
      object gtbDetailskodedetail: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kodedetail'
        Width = 100
      end
      object gtbDetailsnamadetail: TcxGridDBColumn
        Caption = 'Nama Details'
        DataBinding.FieldName = 'namadetail'
        Width = 250
      end
      object gtbDetailsjumlah: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'jumlah'
        Width = 100
      end
      object gtbDetailssatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 100
      end
      object gtbDetailskodecharge: TcxGridDBColumn
        Caption = 'Charge To'
        DataBinding.FieldName = 'kodecharge'
        Width = 100
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = gtbDetails
    end
  end
  object memoKeluhan: TcxDBMemo
    Left = 467
    Top = 176
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'keluhan'
    DataBinding.DataSource = dsQryMaster
    Properties.ReadOnly = True
    Properties.ScrollBars = ssBoth
    TabOrder = 15
    Height = 238
    Width = 458
  end
  object btnDelete: TcxButton
    Left = 8
    Top = 539
    Width = 121
    Height = 48
    Anchors = [akLeft, akBottom]
    Caption = 'Close Form'
    OptionsImage.Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000DFEC0000F1FF0000F1FF0000F1FF0000EFFF0000
      EFFF0000EDFF0000DCED00000000000000000000000000000000000000000000
      0000000000000000E3EC1A20F5FF3C4CF9FF3A49F8FF3847F8FF3545F8FF3443
      F7FF3242F7FF141BF1FF0000D8E8000000000000000000000000000000000000
      00000000E5EC1D23F9FF4453FAFF2429F9FF1212F7FF0F0FF6FF0C0CF5FF0909
      F5FF161BF5FF3343F7FF141BF1FF0000D8E80000000000000000000000000000
      E6EC1F25FAFF4A58FBFF4247FBFFC9C9FDFF3B3BF9FF1313F7FF1010F6FF3333
      F7FFC5C5FDFF3035F7FF3444F7FF141BF2FF0000D8E800000000000000000000
      FBFF4F5DFDFF3237FBFFCBCBFEFFF2F2FFFFEBEBFEFF3B3BF9FF3939F8FFEAEA
      FEFFF1F1FEFFC5C5FDFF181DF6FF3343F7FF0000EFFF00000000000000000000
      FDFF525FFDFF2828FCFF4747FCFFECECFFFFF2F2FFFFECECFFFFECECFEFFF1F1
      FFFFEAEAFEFF3434F7FF0B0BF5FF3545F8FF0000EFFF00000000000000000000
      FDFF5562FEFF2C2CFDFF2929FCFF4848FCFFEDEDFFFFF2F2FFFFF2F2FFFFECEC
      FEFF3A3AF9FF1212F7FF0F0FF6FF3848F8FF0000F1FF00000000000000000000
      FDFF5764FEFF3030FDFF2D2DFDFF4B4BFCFFEDEDFFFFF2F2FFFFF2F2FFFFECEC
      FFFF3D3DF9FF1616F8FF1313F7FF3C4BF8FF0000F1FF00000000000000000000
      FFFF5A67FEFF3333FEFF5050FDFFEDEDFFFFF3F3FFFFEDEDFFFFEDEDFFFFF2F2
      FFFFECECFEFF3E3EFAFF1717F8FF3F4EF9FF0000F1FF00000000000000000000
      FFFF5B68FFFF4347FEFFCFCFFFFFF3F3FFFFEDEDFFFF4C4CFCFF4A4AFCFFECEC
      FFFFF2F2FFFFCACAFEFF2A2FFAFF4251FAFF0000F3FF00000000000000000000
      EBEB262BFFFF5D6AFFFF585BFFFFCFCFFFFF5252FEFF2F2FFDFF2C2CFDFF4B4B
      FCFFCCCCFEFF484CFBFF4957FBFF1D23F9FF0000E2EB00000000000000000000
      00000000EBEB262BFFFF5D6AFFFF4347FFFF3434FEFF3232FEFF3030FDFF2D2D
      FDFF383CFCFF4F5DFCFF1F25FAFF0000E4EB0000000000000000000000000000
      0000000000000000EBEB262BFFFF5C69FFFF5B68FFFF5A67FEFF5865FEFF5663
      FEFF5461FEFF2227FCFF0000EEF2000000000000000000000000000000000000
      000000000000000000000000ECEC0000FFFF0000FFFF0000FFFF0000FDFF0000
      FDFF0000FDFF0000EAEC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnDeleteClick
  end
  object cxLabel8: TcxLabel
    Left = 468
    Top = 156
    Caption = 'Keluhan'
    Transparent = True
  end
  object tblJenis: TMyTable
    TableName = 'mstr_type_detail'
    Connection = dmDB.dbInternal
    Left = 556
  end
  object dsTbljenis: TMyDataSource
    DataSet = tblJenis
    Left = 556
    Top = 48
  end
  object qryMaster: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select pkbnumber, tglmasuk, waktumasuk, keluhan, kilometer'
      'from ben_bengkel_pkb where pkbnumber = '#39'X'#39)
    Active = True
    Left = 740
    Top = 20
  end
  object dsQryMaster: TMyDataSource
    DataSet = qryMaster
    Left = 796
    Top = 20
  end
  object dsQryDetails: TMyDataSource
    DataSet = qryDetails
    Left = 796
    Top = 76
  end
  object qryDetails: TMyTable
    TableName = 'ben_bengkel_pkb_detail'
    MasterFields = 'pkbnumber'
    DetailFields = 'pkbnumber'
    MasterSource = dsQryMaster
    Connection = dmDB.dbInternal
    Left = 740
    Top = 76
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pkbnumber'
        Value = nil
      end>
  end
end
