object frmReportPoSMaster: TfrmReportPoSMaster
  Left = 0
  Top = 0
  Caption = '   Report PoS Master'
  ClientHeight = 525
  ClientWidth = 1124
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1124
    525)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 1112
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '   Report PoS Master'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 1000
  end
  object Label2: TLabel
    Left = 8
    Top = 47
    Width = 34
    Height = 16
    Caption = 'FROM'
  end
  object Label3: TLabel
    Left = 200
    Top = 47
    Width = 25
    Height = 16
    Caption = ' TO '
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 84
    Width = 830
    Height = 425
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitWidth = 726
    object gtbDayli: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Options = [dcoAssignGroupingValues, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtbDaylisubtotal
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbDaylinama_customer
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbDaylitherapist_id
        end
        item
          Kind = skCount
          Position = spFooter
          Column = gtbDayligender
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skSum
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skSum
        end
        item
          Kind = skCount
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtbDaylisubtotal
        end
        item
          Kind = skCount
          Column = gtbDaylinama_customer
        end
        item
          Kind = skCount
          Column = gtbDaylitherapist_id
        end
        item
          Kind = skCount
          Column = gtbDayligender
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.GroupSummaryLayout = gslAlignWithColumnsAndDistribute
      OptionsView.Indicator = True
      object gtbDaylinama_customer: TcxGridDBColumn
        Caption = 'Cust Name'
        DataBinding.FieldName = 'nama_customer'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylistatus_trans: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'status_trans'
        Width = 100
      end
      object gtbDaylitanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 100
      end
      object gtbDaylistart_time: TcxGridDBColumn
        Caption = 'Start'
        DataBinding.FieldName = 'start_time'
        Width = 65
      end
      object gtbDayliend_time: TcxGridDBColumn
        Caption = 'End'
        DataBinding.FieldName = 'end_time'
        Width = 65
      end
      object gtbDayliroom_id: TcxGridDBColumn
        Caption = 'Room'
        DataBinding.FieldName = 'room_id'
        Width = 100
      end
      object gtbDaylitherapist_id: TcxGridDBColumn
        Caption = 'ID Therapist'
        DataBinding.FieldName = 'therapist_id'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylilama: TcxGridDBColumn
        Caption = 'Time'
        DataBinding.FieldName = 'lama'
        Width = 100
      end
      object gtbDaylisubtotal: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbDaylinotes: TcxGridDBColumn
        DataBinding.FieldName = 'notes'
        Visible = False
        Width = 100
      end
      object gtbDaylitaked: TcxGridDBColumn
        DataBinding.FieldName = 'taked'
        Visible = False
        Width = 100
      end
      object gtbDayligender: TcxGridDBColumn
        DataBinding.FieldName = 'gender'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbDaylitrans_id: TcxGridDBColumn
        Caption = 'Trans ID'
        DataBinding.FieldName = 'trans_id'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbDayli
    end
  end
  object edStart: TcxDateEdit
    Left = 60
    Top = 44
    EditValue = 0d
    TabOrder = 1
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 251
    Top = 44
    EditValue = 0d
    TabOrder = 2
    Width = 121
  end
  object cxButton2: TcxButton
    Left = 388
    Top = 36
    Width = 101
    Height = 42
    Caption = 'Load'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object cxButton1: TcxButton
    Left = 500
    Top = 36
    Width = 101
    Height = 42
    Caption = 'Export'
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object cxDBMemo1: TcxDBMemo
    Left = 844
    Top = 84
    Anchors = [akTop, akRight, akBottom]
    DataBinding.DataField = 'notes'
    DataBinding.DataSource = dsQryList
    Properties.OnChange = cxDBMemo1PropertiesChange
    TabOrder = 5
    ExplicitLeft = 740
    Height = 425
    Width = 265
  end
  object dsQryList: TMyDataSource
    DataSet = qryList
    Left = 704
    Top = 44
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select * from trans_master where cabang = '#39'X'#39)
    Left = 620
    Top = 40
  end
  object dlgSave: TSaveDialog
    Left = 792
    Top = 36
  end
end
