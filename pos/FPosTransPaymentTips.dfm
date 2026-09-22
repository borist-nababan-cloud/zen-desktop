object frmPosTransPaymentTips: TfrmPosTransPaymentTips
  Left = 0
  Top = 0
  Caption = '  PoS Payment Tips'
  ClientHeight = 531
  ClientWidth = 1004
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1004
    531)
  PixelsPerInch = 96
  TextHeight = 19
  object lblJudulAtas: TLabel
    Left = 8
    Top = 3
    Width = 981
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  PoS Payment Tips'
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
  object tabControl: TcxPageControl
    Left = 8
    Top = 35
    Width = 981
    Height = 488
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Properties.ActivePage = tabMain
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 485
    ClientRectLeft = 2
    ClientRectRight = 978
    ClientRectTop = 33
    object tabMain: TcxTabSheet
      Caption = 'tabMain'
      ImageIndex = 0
      ExplicitHeight = 479
      DesignSize = (
        976
        452)
      object Label1: TLabel
        Left = 8
        Top = 39
        Width = 51
        Height = 19
        Caption = 'Tanggal'
      end
      object edTanggal: TcxDateEdit
        Left = 76
        Top = 36
        EditValue = 0d
        TabOrder = 0
        Width = 121
      end
      object btnLoad: TcxButton
        Left = 212
        Top = 35
        Width = 75
        Height = 25
        Caption = 'Load'
        TabOrder = 1
        OnClick = btnLoadClick
      end
      object cxGrid1: TcxGrid
        Left = 8
        Top = 75
        Width = 965
        Height = 367
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        ExplicitHeight = 394
        object gtbList: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsQryList
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object gtbListtanggal: TcxGridDBColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'tanggal'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ReadOnly = True
            Width = 100
          end
          object gtbListid_payment: TcxGridDBColumn
            Caption = 'ID Payment'
            DataBinding.FieldName = 'id_payment'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 200
          end
          object gtbListnama_member: TcxGridDBColumn
            Caption = 'Nama Customer'
            DataBinding.FieldName = 'nama_member'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 250
          end
          object gtbListtotal: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'total'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.ReadOnly = True
            Properties.UseThousandSeparator = True
            Width = 100
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = gtbList
        end
      end
      object btnAdd: TcxButton
        Left = 856
        Top = 44
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Add Tips'
        TabOrder = 3
        OnClick = btnAddClick
      end
    end
    object tabInput: TcxTabSheet
      Caption = 'tabInput'
      ImageIndex = 1
      ExplicitHeight = 479
      object Label2: TLabel
        Left = 20
        Top = 20
        Width = 43
        Height = 19
        Caption = 'Label2'
      end
      object Label3: TLabel
        Left = 20
        Top = 55
        Width = 51
        Height = 19
        Caption = 'Tanggal'
      end
      object Label4: TLabel
        Left = 20
        Top = 86
        Width = 32
        Height = 19
        Caption = 'Total'
      end
      object dxBevel1: TdxBevel
        Left = 20
        Top = 132
        Width = 237
        Height = 93
      end
      object Label5: TLabel
        Left = 29
        Top = 154
        Width = 61
        Height = 19
        Caption = 'Nilai Tips'
      end
      object Label6: TLabel
        Left = 380
        Top = 20
        Width = 37
        Height = 19
        Caption = 'Room'
      end
      object Label7: TLabel
        Left = 552
        Top = 20
        Width = 61
        Height = 19
        Caption = 'Therapist'
      end
      object btnSimpan: TButton
        Left = 29
        Top = 231
        Width = 92
        Height = 58
        Caption = 'Simpan'
        TabOrder = 0
        OnClick = btnSimpanClick
      end
      object edList1: TListBox
        Left = 380
        Top = 45
        Width = 153
        Height = 121
        Enabled = False
        ItemHeight = 19
        TabOrder = 1
      end
      object edPaymentID: TcxTextEdit
        Left = 144
        Top = 17
        Properties.ReadOnly = True
        TabOrder = 2
        Text = 'edPaymentID'
        Width = 217
      end
      object edPaymentDate: TcxDateEdit
        Left = 144
        Top = 50
        EditValue = 0d
        Properties.ReadOnly = True
        TabOrder = 3
        Width = 217
      end
      object edPaymentTotal: TcxCalcEdit
        Left = 144
        Top = 83
        EditValue = 0.000000000000000000
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        TabOrder = 4
        Width = 217
      end
      object edNilai: TcxCalcEdit
        Left = 29
        Top = 183
        EditValue = 0.000000000000000000
        Properties.UseThousandSeparator = True
        TabOrder = 5
        Width = 176
      end
      object btnBatal: TButton
        Left = 138
        Top = 248
        Width = 95
        Height = 41
        Caption = 'Batal'
        TabOrder = 6
        OnClick = btnBatalClick
      end
      object edList2: TListBox
        Left = 552
        Top = 45
        Width = 153
        Height = 121
        Enabled = False
        ItemHeight = 19
        TabOrder = 7
      end
    end
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'SELECT trans_payment.id_payment, trans_payment.tanggal, trans_pa' +
        'yment.nama_member, trans_payment.total'
      'FROM trans_payment'
      
        'WHERE NOT EXISTS (SELECT 1 FROM trans_payment_tips WHERE trans_p' +
        'ayment.id_payment = trans_payment_tips.id_payment)'
      
        'AND trans_payment.tanggal = CURRENT_DATE ORDER BY trans_payment.' +
        'id_payment DESC;')
    Left = 152
    Top = 4
  end
  object dsQryList: TMyDataSource
    DataSet = qryList
    Left = 224
    Top = 4
  end
end
