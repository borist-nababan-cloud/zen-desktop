object frmTHRPerhitungan: TfrmTHRPerhitungan
  Left = 0
  Top = 0
  Caption = 'PERHITUNGAN THR'
  ClientHeight = 480
  ClientWidth = 918
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    918
    480)
  PixelsPerInch = 96
  TextHeight = 16
  object lblJudulForm: TLabel
    Left = 0
    Top = 0
    Width = 917
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  THR Calculation'
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
  object Bevel1: TBevel
    Left = 8
    Top = 32
    Width = 465
    Height = 61
  end
  object Label1: TLabel
    Left = 20
    Top = 54
    Width = 122
    Height = 16
    Caption = 'Select THR Periode'
  end
  object edKode: TcxLookupComboBox
    Left = 148
    Top = 50
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodethr'
    Properties.ListColumns = <
      item
        FieldName = 'kodethr'
      end>
    Properties.ListSource = dsQryKode
    TabOrder = 0
    Width = 193
  end
  object btnLoad: TcxButton
    Left = 360
    Top = 44
    Width = 97
    Height = 37
    Caption = 'LOAD'
    TabOrder = 1
    OnClick = btnLoadClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 108
    Width = 902
    Height = 325
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object gtvList: TcxGridBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      Bands = <
        item
          Caption = 'Karyawan Info'
        end
        item
          Caption = 'Value'
        end>
      object gtvListKodeTHR: TcxGridBandedColumn
        Caption = 'Periode'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvListKodeKaryawan: TcxGridBandedColumn
        Caption = 'Kode Karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvListIDFinger: TcxGridBandedColumn
        Caption = 'ID Finger'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvListDepartemen: TcxGridBandedColumn
        Caption = 'Departemen'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvListKontrak: TcxGridBandedColumn
        Caption = 'Kontrak'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kodekontrak'
        Properties.ListColumns = <
          item
            FieldName = 'namakontrak'
          end>
        Properties.ListSource = dsTblKontrak
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvListTglMasuk: TcxGridBandedColumn
        Caption = 'Tgl masuk'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtvListLama: TcxGridBandedColumn
        Caption = 'Lama'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvListIsAdmin: TcxGridBandedColumn
        Caption = 'Is Admin'
        Visible = False
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvListGapok: TcxGridBandedColumn
        Caption = 'Gapok'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 125
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvListNilai: TcxGridBandedColumn
        Caption = 'Nilai THR'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 125
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvListTambahan: TcxGridBandedColumn
        Caption = 'Tambahan'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 125
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvListPayment: TcxGridBandedColumn
        Caption = 'Total THR'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 125
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvListKet: TcxGridBandedColumn
        Caption = 'Notes'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 143
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtvListUser: TcxGridBandedColumn
        Caption = 'User'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 1
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvListDate: TcxGridBandedColumn
        Caption = 'Last Edit'
        Visible = False
        Width = 125
        Position.BandIndex = 1
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtvListNama: TcxGridBandedColumn
        Caption = 'Nama'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvList
    end
  end
  object btnAddTambahan: TcxButton
    Left = 8
    Top = 437
    Width = 134
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = 'Add Tambahan'
    TabOrder = 3
    OnClick = btnAddTambahanClick
  end
  object cxButton2: TcxButton
    Left = 496
    Top = 35
    Width = 125
    Height = 57
    Caption = 'POST DATA'
    TabOrder = 4
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 814
    Top = 34
    Width = 96
    Height = 57
    Anchors = [akTop, akRight]
    Caption = 'EXPORT'
    TabOrder = 5
    OnClick = cxButton3Click
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 28
    Top = 204
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 32
    Top = 256
  end
  object qryKode: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select kodethr from ben_thr_periode where aktif = '#39'Y'#39'  order by ' +
        'kodethr DESC LIMIT 10')
    Left = 148
    Top = 212
  end
  object dsQryKode: TDataSource
    DataSet = qryKode
    Left = 152
    Top = 260
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select * from ben_thr_parameter where kodethr = '#39'X'#39' and aktif = ' +
        #39'Y'#39)
    Left = 220
    Top = 220
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 224
    Top = 268
  end
  object dlgSave: TSaveDialog
    Left = 296
    Top = 180
  end
  object tblKontrak: TMyTable
    TableName = 'ben_hrd_kontrak_master'
    Connection = dmDB.dbInternal
    Left = 288
    Top = 240
  end
  object dsTblKontrak: TDataSource
    DataSet = tblKontrak
    Left = 292
    Top = 292
  end
end
