object frmSearchCustomer: TfrmSearchCustomer
  Left = 0
  Top = 0
  Caption = 'Search Customer'
  ClientHeight = 536
  ClientWidth = 912
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    912
    536)
  PixelsPerInch = 96
  TextHeight = 16
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
    Properties.OnChange = edNopolTengahPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    OnKeyPress = edNopolTengahKeyPress
    Width = 121
  end
  object edNopolBelakang: TcxTextEdit
    Left = 292
    Top = 9
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Properties.MaxLength = 4
    Properties.PasswordChar = '0'
    Properties.OnChange = edNopolBelakangPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    OnKeyPress = edNopolBelakangKeyPress
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
    Properties.OnChange = edNopolDepanPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 4
    Text = 'P'
    OnKeyPress = edNopolDepanKeyPress
    Width = 52
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 52
    Width = 442
    Height = 420
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    object gtbSearch: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Indicator = True
      object gtbSearchcodecust: TcxGridDBColumn
        Caption = 'Kode Customer'
        DataBinding.FieldName = 'codecust'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 125
      end
      object gtbSearchnopol: TcxGridDBColumn
        Caption = 'No. Polisi'
        DataBinding.FieldName = 'nopol'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbSearchnamacust: TcxGridDBColumn
        Caption = 'Nama Customer'
        DataBinding.FieldName = 'namacust'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object gtbSearchkodetype: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'kodetype'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_type'
        Properties.ListColumns = <
          item
            FieldName = 'nama_group_detail'
          end>
        Properties.ListSource = dsTbljenis
        Width = 150
      end
      object gtbSearchwarna: TcxGridDBColumn
        Caption = 'Warna'
        DataBinding.FieldName = 'warna'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbSearchnorangka: TcxGridDBColumn
        Caption = 'No Rangka'
        DataBinding.FieldName = 'norangka'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
      object gtbSearchnomesin: TcxGridDBColumn
        Caption = 'No Mesin'
        DataBinding.FieldName = 'nomesin'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbSearch
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 464
    Top = 8
    Anchors = [akTop, akRight]
    Caption = 'New Data'
    TabOrder = 6
    Height = 517
    Width = 440
    object btnAddPkb: TcxButton
      Left = 12
      Top = 448
      Width = 85
      Height = 45
      Caption = 'Add to PKB'
      TabOrder = 0
      OnClick = btnAddPkbClick
    end
    object btnSave: TcxButton
      Left = 12
      Top = 440
      Width = 85
      Height = 45
      Caption = 'Save'
      TabOrder = 14
      OnClick = btnSaveClick
    end
    object btnReset: TcxButton
      Left = 148
      Top = 440
      Width = 85
      Height = 45
      Caption = 'Reset'
      TabOrder = 15
      OnClick = btnResetClick
    end
    object cxLabel2: TcxLabel
      Left = 12
      Top = 28
      Caption = 'Customer Code'
      Transparent = True
    end
    object edCustCode: TcxTextEdit
      Left = 136
      Top = 27
      Properties.ReadOnly = True
      TabOrder = 17
      Width = 121
    end
    object cxLabel3: TcxLabel
      Left = 12
      Top = 53
      Caption = 'No. Polisi'
      Transparent = True
    end
    object edNopol: TcxTextEdit
      Left = 136
      Top = 53
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      StyleDisabled.TextColor = clBlack
      StyleDisabled.TextStyle = [fsBold]
      TabOrder = 1
      OnKeyPress = edNopolKeyPress
      Width = 121
    end
    object cxLabel4: TcxLabel
      Left = 12
      Top = 110
      Caption = 'Alamat'
      Transparent = True
    end
    object edAlamat: TcxTextEdit
      Left = 136
      Top = 109
      Properties.CharCase = ecUpperCase
      TabOrder = 3
      OnKeyPress = edAlamatKeyPress
      Width = 293
    end
    object cxLabel5: TcxLabel
      Left = 12
      Top = 134
      Caption = 'Kota'
      Transparent = True
    end
    object edkota: TcxTextEdit
      Left = 136
      Top = 133
      Properties.CharCase = ecUpperCase
      TabOrder = 4
      OnKeyPress = edkotaKeyPress
      Width = 293
    end
    object cxLabel6: TcxLabel
      Left = 12
      Top = 159
      Caption = 'Telp / Handphone'
      Transparent = True
    end
    object edTelp: TcxTextEdit
      Left = 136
      Top = 158
      Properties.CharCase = ecUpperCase
      TabOrder = 5
      OnKeyPress = edTelpKeyPress
      Width = 293
    end
    object cxLabel7: TcxLabel
      Left = 12
      Top = 184
      Caption = 'Email'
      Transparent = True
    end
    object edEmail: TcxTextEdit
      Left = 136
      Top = 183
      Properties.CharCase = ecUpperCase
      TabOrder = 6
      OnKeyPress = edEmailKeyPress
      Width = 293
    end
    object cxLabel8: TcxLabel
      Left = 12
      Top = 208
      Caption = 'NPWP'
      Transparent = True
    end
    object edNPWP: TcxTextEdit
      Left = 136
      Top = 207
      Properties.CharCase = ecUpperCase
      TabOrder = 7
      OnKeyPress = edNPWPKeyPress
      Width = 293
    end
    object edType: TcxLookupComboBox
      Left = 136
      Top = 247
      Properties.KeyFieldNames = 'id_type'
      Properties.ListColumns = <
        item
          FieldName = 'nama_group_detail'
        end>
      Properties.ListSource = dsTbljenis
      TabOrder = 8
      OnKeyPress = edTypeKeyPress
      Width = 293
    end
    object cxLabel9: TcxLabel
      Left = 12
      Top = 248
      Caption = 'Type Kendaraan'
      Transparent = True
    end
    object cxLabel10: TcxLabel
      Left = 12
      Top = 302
      Caption = 'Warna Kendaraan'
      Transparent = True
    end
    object edWarna: TcxLookupComboBox
      Left = 136
      Top = 301
      Properties.KeyFieldNames = 'nama_warna'
      Properties.ListColumns = <
        item
          FieldName = 'nama_warna'
        end>
      Properties.ListSource = dsTblWarna
      TabOrder = 10
      OnKeyPress = edWarnaKeyPress
      Width = 293
    end
    object edTglKirim: TcxDateEdit
      Left = 136
      Top = 391
      EditValue = 0d
      TabOrder = 13
      OnKeyPress = edTglKirimKeyPress
      Width = 141
    end
    object cxLabel11: TcxLabel
      Left = 12
      Top = 396
      Caption = 'Tanggal Kirim'
      Transparent = True
    end
    object cxLabel12: TcxLabel
      Left = 12
      Top = 273
      Caption = 'Tahun Kendaraan'
      Transparent = True
    end
    object edTahun: TcxTextEdit
      Left = 136
      Top = 273
      Properties.CharCase = ecUpperCase
      TabOrder = 9
      OnKeyPress = edTahunKeyPress
      Width = 121
    end
    object cxLabel13: TcxLabel
      Left = 12
      Top = 84
      Caption = 'Nama Cust'
      Transparent = True
    end
    object edCutNama: TcxTextEdit
      Left = 136
      Top = 83
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      OnKeyPress = edCutNamaKeyPress
      Width = 293
    end
    object cxLabel14: TcxLabel
      Left = 12
      Top = 331
      Caption = 'No Rangka'
      Transparent = True
    end
    object edNoRangka: TcxTextEdit
      Left = 136
      Top = 331
      Properties.CharCase = ecUpperCase
      TabOrder = 11
      OnKeyPress = edNoRangkaKeyPress
      Width = 177
    end
    object cxLabel15: TcxLabel
      Left = 12
      Top = 361
      Caption = 'No Mesin'
      Transparent = True
    end
    object edNoMesin: TcxTextEdit
      Left = 136
      Top = 361
      Properties.CharCase = ecUpperCase
      TabOrder = 12
      OnKeyPress = edNoMesinKeyPress
      Width = 177
    end
  end
  object btnSelect: TcxButton
    Tag = 1
    Left = 8
    Top = 483
    Width = 85
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'Select'
    TabOrder = 7
    OnClick = btnSelectClick
  end
  object tblJenis: TMyTable
    TableName = 'mstr_type_detail'
    Connection = dmDB.dbInternal
    Left = 84
    Top = 136
  end
  object dsTbljenis: TMyDataSource
    DataSet = tblJenis
    Left = 84
    Top = 184
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select codecust, nopol, namacust, kodetype, warna, norangka, nom' +
        'esin'
      'from ben_bengkel_customer where codecust = '#39'X'#39)
    Active = True
    Left = 24
    Top = 120
  end
  object dsQryList: TMyDataSource
    DataSet = qryList
    Left = 24
    Top = 172
  end
  object tblWarna: TMyTable
    TableName = 'mstr_warna'
    Connection = dmDB.dbInternal
    Left = 828
    Top = 44
  end
  object dsTblWarna: TMyDataSource
    DataSet = tblWarna
    Left = 828
    Top = 104
  end
end
