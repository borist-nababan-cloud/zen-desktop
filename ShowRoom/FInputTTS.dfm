object frmInputTTS: TfrmInputTTS
  Left = 0
  Top = 0
  ClientHeight = 498
  ClientWidth = 885
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    885
    498)
  PixelsPerInch = 96
  TextHeight = 15
  object Label20: TLabel
    Left = 423
    Top = 31
    Width = 54
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'INPUT TTS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 562
  end
  object Bevel4: TBevel
    Left = 423
    Top = 44
    Width = 453
    Height = 6
    Anchors = [akTop, akRight]
    Shape = bsBottomLine
    ExplicitLeft = 562
  end
  object Label1: TLabel
    Left = 423
    Top = 56
    Width = 34
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'ID SPK'
    ExplicitLeft = 546
  end
  object Label2: TLabel
    Left = 423
    Top = 77
    Width = 42
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Tanggal '
    ExplicitLeft = 546
  end
  object Label3: TLabel
    Left = 423
    Top = 104
    Width = 39
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'No SPK'
    ExplicitLeft = 546
  end
  object Label4: TLabel
    Left = 423
    Top = 390
    Width = 45
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Amount'
  end
  object Label5: TLabel
    Left = 423
    Top = 361
    Width = 37
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'No TTS'
  end
  object Label6: TLabel
    Left = 423
    Top = 128
    Width = 97
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Jenis Pembayaran'
    ExplicitLeft = 546
  end
  object Label7: TLabel
    Left = 423
    Top = 201
    Width = 87
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Type Kendaraan'
    ExplicitLeft = 562
  end
  object Label8: TLabel
    Left = 423
    Top = 225
    Width = 97
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Warna Kendaraan'
    ExplicitLeft = 546
  end
  object Label9: TLabel
    Left = 423
    Top = 249
    Width = 53
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Nama TTS'
    ExplicitLeft = 562
  end
  object Label10: TLabel
    Left = 423
    Top = 273
    Width = 60
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Alamat TTS'
    ExplicitLeft = 562
  end
  object Label11: TLabel
    Left = 423
    Top = 297
    Width = 46
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Kota TTS'
    ExplicitLeft = 562
  end
  object lbNoRek: TLabel
    Left = 423
    Top = 153
    Width = 69
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'No Rekening'
    ExplicitLeft = 546
  end
  object lbBank: TLabel
    Left = 423
    Top = 177
    Width = 26
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Bank'
    ExplicitLeft = 546
  end
  object lbNoReff: TLabel
    Left = 423
    Top = 153
    Width = 71
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'No Referensi'
    Visible = False
    ExplicitLeft = 546
  end
  object lbTglMsk: TLabel
    Left = 764
    Top = 153
    Width = 81
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Tgl Masuk Bank'
    Visible = False
    ExplicitLeft = 887
  end
  object lbTglJatuhTempo: TLabel
    Left = 764
    Top = 153
    Width = 111
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Tanggal Jatuh Tempo'
    Visible = False
    ExplicitLeft = 887
  end
  object Label12: TLabel
    Left = 423
    Top = 420
    Width = 66
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'Mengetahui'
  end
  object Label14: TLabel
    Left = 8
    Top = 4
    Width = 869
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  INPUT TTS  '
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1008
  end
  object lblCoa: TLabel
    Left = 864
    Top = 8
    Width = 12
    Height = 19
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 1003
  end
  object cxGrid1: TcxGrid
    Left = 2
    Top = 36
    Width = 415
    Height = 443
    Anchors = [akLeft, akTop, akRight, akBottom]
    PopupMenu = pmTTS
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    object gtbTTS: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryTTS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbTTSamount
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbTTSautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
      end
      object gtbTTStanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 75
      end
      object gtbTTSno_tts: TcxGridDBColumn
        Caption = 'No TTS'
        DataBinding.FieldName = 'no_tts'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 75
      end
      object gtbTTSno_spk: TcxGridDBColumn
        Caption = 'No SPK'
        DataBinding.FieldName = 'no_spk'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 75
      end
      object gtbTTSamount: TcxGridDBColumn
        Caption = 'Amount'
        DataBinding.FieldName = 'amount'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Width = 100
      end
      object gtbTTSpayment_type: TcxGridDBColumn
        Caption = 'Jenis Pembayaran'
        DataBinding.FieldName = 'payment_type'
        Width = 122
      end
      object gtbTTSid_spk: TcxGridDBColumn
        Caption = 'ID SPK'
        DataBinding.FieldName = 'id_spk'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 125
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbTTS
    end
  end
  object edTTSIDSPK: TcxTextEdit
    Left = 528
    Top = 53
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 228
  end
  object edTglTTS: TcxDateEdit
    Left = 528
    Top = 77
    Anchors = [akTop, akRight]
    EditValue = 0d
    TabOrder = 2
    Width = 228
  end
  object edNoSPKTTS: TcxTextEdit
    Left = 528
    Top = 101
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 228
  end
  object edAmountTTS: TcxCalcEdit
    Left = 528
    Top = 387
    Anchors = [akTop, akRight]
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '#,#'
    Properties.ReadOnly = True
    TabOrder = 4
    Width = 228
  end
  object btnSave: TButton
    Left = 536
    Top = 445
    Width = 66
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'Simpan'
    TabOrder = 6
    OnClick = btnSaveClick
  end
  object edNoTTS: TcxTextEdit
    Left = 528
    Top = 358
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 5
    Width = 228
  end
  object edPaymentTTS: TcxComboBox
    Left = 528
    Top = 125
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.Items.Strings = (
      'TUNAI'
      'DEBET'
      'KREDIT'
      'TRANSFER'
      'CEK'
      'GIRO')
    Properties.OnValidate = edPaymentTTSPropertiesValidate
    TabOrder = 9
    Text = 'TUNAI'
    Width = 228
  end
  object btnPrint: TButton
    Left = 609
    Top = 445
    Width = 66
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'Print'
    TabOrder = 7
    OnClick = btnPrintClick
  end
  object edTypeTTS: TcxTextEdit
    Left = 528
    Top = 198
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 10
    Width = 228
  end
  object edWarnaTTS: TcxTextEdit
    Left = 528
    Top = 222
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 11
    Width = 228
  end
  object edNamaTTS: TcxTextEdit
    Left = 528
    Top = 246
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    TabOrder = 12
    Width = 228
  end
  object edAlamatTTS: TcxTextEdit
    Left = 528
    Top = 270
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    TabOrder = 13
    Width = 228
  end
  object edKotaTTS: TcxTextEdit
    Left = 528
    Top = 294
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    TabOrder = 14
    Width = 228
  end
  object Button1: TButton
    Left = 681
    Top = 445
    Width = 66
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'Cancel'
    TabOrder = 8
    OnClick = Button1Click
  end
  object edNoRek: TcxLookupComboBox
    Left = 528
    Top = 149
    Anchors = [akTop, akRight]
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
        Width = 100
        FieldName = 'id_bank'
      end>
    Properties.ListSource = dsTblRekening
    Properties.OnValidate = edNoRekPropertiesValidate
    TabOrder = 15
    Width = 228
  end
  object edIDBank: TcxLookupComboBox
    Left = 528
    Top = 173
    Anchors = [akTop, akRight]
    Properties.KeyFieldNames = 'id_bank'
    Properties.ListColumns = <
      item
        FieldName = 'nama_bank'
      end>
    Properties.ListSource = dsTblBank
    Properties.ReadOnly = True
    TabOrder = 16
    Width = 228
  end
  object edNoReff: TcxTextEdit
    Left = 528
    Top = 149
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    TabOrder = 17
    Visible = False
    Width = 228
  end
  object edBankReff: TcxTextEdit
    Left = 528
    Top = 173
    Anchors = [akTop, akRight]
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    TabOrder = 18
    Visible = False
    Width = 228
  end
  object edTglMskBank: TcxDateEdit
    Left = 764
    Top = 174
    Anchors = [akTop, akRight]
    EditValue = 0d
    TabOrder = 19
    Visible = False
    Width = 112
  end
  object edTglJatuhTempo: TcxDateEdit
    Left = 764
    Top = 173
    Anchors = [akTop, akRight]
    EditValue = 0d
    TabOrder = 20
    Visible = False
    Width = 112
  end
  object edAuthorize: TcxLookupComboBox
    Left = 528
    Top = 416
    Anchors = [akTop, akRight]
    Properties.KeyFieldNames = 'nama_user'
    Properties.ListColumns = <
      item
        Caption = 'Nama'
        HeaderAlignment = taCenter
        FieldName = 'nama_user'
      end>
    Properties.ListSource = dsTblMengetahui
    Properties.ReadOnly = True
    TabOrder = 21
    Width = 228
  end
  object Button2: TButton
    Left = 753
    Top = 445
    Width = 75
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'Cetak Baru'
    TabOrder = 22
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 423
    Top = 330
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'New TTS'
    TabOrder = 23
    OnClick = Button3Click
  end
  object memPayment: TMemo
    Left = 774
    Top = 58
    Width = 103
    Height = 89
    TabOrder = 24
    Visible = False
  end
  object memUntuk: TMemo
    Left = 774
    Top = 198
    Width = 103
    Height = 89
    TabOrder = 25
    Visible = False
  end
  object memTerimadari: TMemo
    Left = 774
    Top = 297
    Width = 103
    Height = 89
    TabOrder = 26
    Visible = False
  end
  object pmTTS: TPopupMenu
    Left = 301
    Top = 220
    object EditTTS1: TMenuItem
      Caption = 'Edit TTS'
      OnClick = EditTTS1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object HapusTerpilih1: TMenuItem
      Caption = 'Hapus Terpilih'
      OnClick = HapusTerpilih1Click
    end
  end
  object qryTTS: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from mstr_tts where id_spk = '#39#39)
    Left = 180
    Top = 100
  end
  object dsQryTTS: TMyDataSource
    DataSet = qryTTS
    Left = 180
    Top = 152
  end
  object tblMengetahui: TMyTable
    TableName = 'authorize_pic'
    Connection = dmDB.dbInternal
    Left = 112
    Top = 216
  end
  object dsTblMengetahui: TMyDataSource
    DataSet = tblMengetahui
    Left = 112
    Top = 260
  end
  object tblrekening: TMyTable
    TableName = 'rekening'
    Connection = dmDB.dbInternal
    Left = 220
    Top = 220
  end
  object dsTblRekening: TMyDataSource
    DataSet = tblrekening
    Left = 220
    Top = 264
  end
  object tblBank: TMyTable
    TableName = 'bank'
    Connection = dmDB.dbInternal
    Left = 308
    Top = 92
  end
  object dsTblBank: TMyDataSource
    DataSet = tblBank
    Left = 308
    Top = 136
  end
end
