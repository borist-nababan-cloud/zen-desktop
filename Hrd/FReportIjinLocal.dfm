object frmReportIjinLocal: TfrmReportIjinLocal
  Left = 0
  Top = 0
  ClientHeight = 430
  ClientWidth = 718
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    718
    430)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 219
    Height = 26
    Caption = ' REPORT IJIN KARYAWAN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 59
    Height = 13
    Caption = 'Start Date'
  end
  object Label3: TLabel
    Left = 12
    Top = 71
    Width = 50
    Height = 13
    Caption = 'End Date'
  end
  object edStart: TcxDateEdit
    Left = 108
    Top = 41
    EditValue = 0d
    TabOrder = 0
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 108
    Top = 68
    EditValue = 0d
    TabOrder = 1
    Width = 121
  end
  object btnSearch: TButton
    Left = 235
    Top = 44
    Width = 75
    Height = 40
    Caption = 'Search'
    TabOrder = 2
    OnClick = btnSearchClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 95
    Width = 702
    Height = 318
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object gtbList: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbListkodekaryawan: TcxGridDBColumn
        DataBinding.FieldName = 'kodekaryawan'
        Width = 100
      end
      object gtbListidkaryawan: TcxGridDBColumn
        DataBinding.FieldName = 'idkaryawan'
        Width = 100
      end
      object gtbListnamakaryawan: TcxGridDBColumn
        DataBinding.FieldName = 'namakaryawan'
        Width = 250
      end
      object gtbListidoutlet: TcxGridDBColumn
        Caption = 'Outlet'
        DataBinding.FieldName = 'idoutlet'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodeoutlet'
        Properties.ListColumns = <
          item
            FieldName = 'nama'
          end>
        Properties.ListSource = dsTblOutlet
        Width = 100
      end
      object gtbListkodeijin: TcxGridDBColumn
        Caption = 'Parameter'
        DataBinding.FieldName = 'kodeijin'
        Width = 100
      end
      object gtbListtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 100
      end
      object gtbListketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnEdit: TButton
    Left = 316
    Top = 44
    Width = 97
    Height = 40
    Caption = 'Edit Selected'
    TabOrder = 4
    OnClick = btnEditClick
  end
  object qryList: TMyQuery
    Database = DMDB.StoreDB
    SQL.Strings = (
      'select kodekaryawan, idoutlet, kodeijin, tanggal, keterangan, '
      
        '(select hrd_karyawan_info.idkaryawan from hrd_karyawan_info wher' +
        'e hrd_karyawan_info.kodekaryawan = hrd_ijin.kodekaryawan) as idk' +
        'aryawan,'
      
        '(select hrd_karyawan_info.namakaryawan from hrd_karyawan_info wh' +
        'ere hrd_karyawan_info.kodekaryawan = hrd_ijin.kodekaryawan) as n' +
        'amakaryawan'
      'from hrd_ijin where tanggal = CURRENT_DATE')
    Left = 504
    Top = 16
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 596
    Top = 16
  end
  object tblOutlet: TMyTable
    Database = DMDB.StoreDB
    TableName = 'outlet'
    Left = 368
    Top = 12
  end
  object dsTblOutlet: TDataSource
    DataSet = tblOutlet
    Left = 428
    Top = 12
  end
end
