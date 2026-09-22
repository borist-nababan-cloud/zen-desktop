object frmPosLapTips: TfrmPosLapTips
  Left = 0
  Top = 0
  Caption = '  Lap. Payment Tips'
  ClientHeight = 522
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    901
    522)
  PixelsPerInch = 96
  TextHeight = 15
  object lblJudulAtas: TLabel
    Left = 8
    Top = 6
    Width = 885
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Lap. Payment Tips'
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
    Top = 40
    Width = 885
    Height = 474
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Properties.ActivePage = tabMain
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 471
    ClientRectLeft = 2
    ClientRectRight = 882
    ClientRectTop = 29
    object tabMain: TcxTabSheet
      Caption = 'tabMain'
      ImageIndex = 0
      DesignSize = (
        880
        442)
      object Label1: TLabel
        Left = 8
        Top = 11
        Width = 24
        Height = 15
        Caption = 'Dari'
      end
      object Label2: TLabel
        Left = 172
        Top = 11
        Width = 13
        Height = 15
        Caption = 'Ke'
      end
      object edStart: TcxDateEdit
        Left = 44
        Top = 8
        EditValue = 0d
        TabOrder = 0
        Width = 121
      end
      object btnLoad: TcxButton
        Left = 344
        Top = 7
        Width = 75
        Height = 25
        Caption = 'Load'
        TabOrder = 1
        OnClick = btnLoadClick
      end
      object edEnd: TcxDateEdit
        Left = 208
        Top = 8
        EditValue = 0d
        TabOrder = 2
        Width = 121
      end
      object cxGrid1: TcxGrid
        Left = 8
        Top = 38
        Width = 861
        Height = 401
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 3
        object gtbList: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsQryList
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '#,#'
              Position = spFooter
              Column = gtbListvalue
            end
            item
              Format = '#,#'
              Position = spFooter
              Column = gtbListvpayment1
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = gtbListnama_member
            end
            item
              Kind = skCount
              Column = gtbListid_payment
            end
            item
              Format = '#,#'
              Kind = skSum
              Column = gtbListvalue
            end
            item
              Kind = skSum
              Column = gtbListvpayment1
            end
            item
              Kind = skCount
              Column = gtbListlastuser
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.FooterMultiSummaries = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object gtbListnama_member: TcxGridDBColumn
            Caption = 'Customer'
            DataBinding.FieldName = 'nama_member'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 100
          end
          object gtbListid_payment: TcxGridDBColumn
            Caption = 'ID Payment'
            DataBinding.FieldName = 'id_payment'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 100
          end
          object gtbListvalue: TcxGridDBColumn
            Caption = 'Nilai Tips'
            DataBinding.FieldName = 'value'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.ReadOnly = True
            Properties.UseThousandSeparator = True
            Width = 100
          end
          object gtbListtanggal: TcxGridDBColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'tanggal'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ReadOnly = True
            Width = 100
          end
          object gtbListtrlist: TcxGridDBColumn
            Caption = 'ID TR / TB'
            DataBinding.FieldName = 'trlist'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 100
          end
          object gtbListvcash: TcxGridDBColumn
            Caption = 'P. Cash'
            DataBinding.FieldName = 'vcash'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.ReadOnly = True
            Properties.UseThousandSeparator = True
            Width = 100
          end
          object gtbListkodepayment1: TcxGridDBColumn
            Caption = 'Payment 1'
            DataBinding.FieldName = 'kodepayment1'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 100
          end
          object gtbListkodebank1: TcxGridDBColumn
            Caption = 'Bank 1'
            DataBinding.FieldName = 'kodebank1'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 100
          end
          object gtbListvpayment1: TcxGridDBColumn
            Caption = 'N. Payment 1'
            DataBinding.FieldName = 'vpayment1'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.ReadOnly = True
            Properties.UseThousandSeparator = True
            Width = 100
          end
          object gtbListkodepayment2: TcxGridDBColumn
            Caption = 'Payment 2'
            DataBinding.FieldName = 'kodepayment2'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            Width = 100
          end
          object gtbListkodebank2: TcxGridDBColumn
            Caption = 'Bank 2'
            DataBinding.FieldName = 'kodebank2'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            Width = 100
          end
          object gtbListlastuser: TcxGridDBColumn
            Caption = 'User'
            DataBinding.FieldName = 'lastuser'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 100
          end
          object gtbListlasteditdate: TcxGridDBColumn
            Caption = 'Date Edit'
            DataBinding.FieldName = 'lasteditdate'
            Width = 100
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = gtbList
        end
      end
      object cxButton1: TcxButton
        Left = 425
        Top = 7
        Width = 88
        Height = 25
        Caption = 'Export Excel'
        TabOrder = 4
        OnClick = cxButton1Click
      end
    end
    object tabEdit: TcxTabSheet
      Caption = 'tabEdit'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'SELECT'
      '  trans_payment_tips.id_payment, trans_payment_tips.value,'
      '  trans_payment_tips.tanggal, trans_payment_tips.trlist,'
      '  trans_payment_tips.lasteditdate, trans_payment_tips.lastuser,'
      
        '  trans_payment_detail.kodepayment1, trans_payment_detail.kodeba' +
        'nk1,'
      
        '  trans_payment_detail.vpayment1, trans_payment_detail.kodepayme' +
        'nt2,'
      '  trans_payment_detail.kodebank2, trans_payment.nama_member,'
      '  trans_payment_detail.vcash'
      'FROM'
      '  trans_payment_tips INNER JOIN'
      '  trans_payment_detail ON trans_payment_tips.id_payment ='
      '    trans_payment_detail.id_payment INNER JOIN'
      '  trans_payment ON trans_payment_tips.id_payment ='
      '    trans_payment.id_payment'
      'WHERE '
      '  trans_payment_tips.tanggal = CURRENT_DATE;')
    Left = 696
    Top = 28
  end
  object dsQryList: TMyDataSource
    DataSet = qryList
    Left = 768
    Top = 28
  end
  object dlgSave: TSaveDialog
    Left = 516
    Top = 32
  end
end
