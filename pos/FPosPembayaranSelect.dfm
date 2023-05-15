object frmPosPembayaranSelect: TfrmPosPembayaranSelect
  Left = 0
  Top = 0
  ClientHeight = 481
  ClientWidth = 911
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    911
    481)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulAtas: TLabel
    Left = 8
    Top = 4
    Width = 894
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Pos Main Transaction'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 66
    Width = 895
    Height = 339
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbSelect: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQrySelect
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbSelecttrans_id: TcxGridDBColumn
        Caption = 'Kode Trans'
        DataBinding.FieldName = 'trans_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 125
      end
      object gtbSelectstatus_trans: TcxGridDBColumn
        DataBinding.FieldName = 'status_trans'
        Visible = False
        Width = 100
      end
      object gtbSelectnama_customer: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'nama_customer'
        Width = 250
      end
      object gtbSelectroom_id: TcxGridDBColumn
        Caption = 'Ruangan'
        DataBinding.FieldName = 'room_id'
        Width = 100
      end
      object gtbSelecttherapist_id: TcxGridDBColumn
        Caption = 'TR ID'
        DataBinding.FieldName = 'therapist_id'
        Width = 100
      end
      object gtbSelectpromo: TcxGridDBColumn
        DataBinding.FieldName = 'promo'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbSelect
    end
  end
  object edTanggal: TcxDateEdit
    Left = 736
    Top = 36
    EditValue = 0d
    TabOrder = 1
    Width = 167
  end
  object btnSelect: TcxButton
    Left = 8
    Top = 411
    Width = 133
    Height = 49
    Anchors = [akLeft, akBottom]
    Caption = 'SELECT'
    TabOrder = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnSelectClick
  end
  object btnRefresh: TcxButton
    Left = 156
    Top = 411
    Width = 108
    Height = 49
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh'
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
    OnClick = btnRefreshClick
  end
  object qrySelect: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select trans_id, status_trans, nama_customer, room_id, therapist' +
        '_id, '
      'promo from trans_master where trans_id = '#39'X'#39)
    Left = 736
    Top = 40
  end
  object dsQrySelect: TMyDataSource
    DataSet = qrySelect
    Left = 740
    Top = 92
  end
end
