object frmTHRParameter: TfrmTHRParameter
  Left = 0
  Top = 0
  Caption = 'PARAMETER THR'
  ClientHeight = 507
  ClientWidth = 978
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
    978
    507)
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 8
    Top = 86
    Width = 349
    Height = 61
  end
  object lblJudulForm: TLabel
    Left = 0
    Top = 0
    Width = 976
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = ' Parameter THR'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 925
  end
  object Label1: TLabel
    Left = 20
    Top = 106
    Width = 122
    Height = 16
    Caption = 'Select THR Periode'
  end
  object Label3: TLabel
    Left = 8
    Top = 32
    Width = 457
    Height = 13
    Caption = 
      '- Parameter dibuat hanya untuk karyawan yang tidak mengikuti for' +
      'mat pro-rata'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 46
    Width = 591
    Height = 13
    Caption = 
      '- Karyawan dengan masa kerja >= 12 Bulan akan dihitungkan normal' +
      ' sesuai dengan peraturan yang ada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 59
    Width = 580
    Height = 13
    Caption = 
      '- Apabila masa kerja karyawan < 12 Bulan dan tidak ada dalam par' +
      'ameter, maka dihitungkan pro-rata'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edKode: TcxLookupComboBox
    Left = 148
    Top = 102
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodethr'
    Properties.ListColumns = <
      item
        FieldName = 'kodethr'
      end>
    Properties.ListSource = dsQryKode
    Properties.OnChange = edKodePropertiesChange
    TabOrder = 0
    Width = 193
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 153
    Caption = 'New Parameter'
    TabOrder = 1
    Height = 192
    Width = 349
    object Label2: TLabel
      Left = 12
      Top = 28
      Width = 80
      Height = 16
      Caption = 'Departemen'
    end
    object Label6: TLabel
      Left = 12
      Top = 57
      Width = 72
      Height = 16
      Caption = 'Masa Kerja'
    end
    object Label7: TLabel
      Left = 261
      Top = 57
      Width = 35
      Height = 16
      Caption = 'Bulan'
    end
    object Label8: TLabel
      Left = 12
      Top = 87
      Width = 58
      Height = 16
      Caption = 'Nilai (Rp)'
    end
    object edDepartemen: TcxLookupComboBox
      Left = 128
      Top = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'id_departemen'
      Properties.ListColumns = <
        item
          FieldName = 'nama_departemen'
        end>
      Properties.ListSource = dsTblDepartemen
      TabOrder = 0
      Width = 205
    end
    object edLama: TcxCalcEdit
      Left = 128
      Top = 54
      EditValue = 0.000000000000000000
      TabOrder = 1
      Width = 121
    end
    object edNilai: TcxCalcEdit
      Left = 128
      Top = 84
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '#,#'
      Properties.UseThousandSeparator = True
      TabOrder = 2
      Width = 177
    end
    object btnTambah: TcxButton
      Left = 128
      Top = 124
      Width = 107
      Height = 33
      Caption = 'Add'
      TabOrder = 3
      OnClick = btnTambahClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 384
    Top = 86
    Width = 586
    Height = 371
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object gtbList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object gtbListautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbListkodethr: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kodethr'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 125
      end
      object gtbListidoutlet: TcxGridDBColumn
        DataBinding.FieldName = 'idoutlet'
        Visible = False
        Width = 100
      end
      object gtbListdepartemen: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'departemen'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        Width = 125
      end
      object gtbListlamakerja: TcxGridDBColumn
        Caption = 'Masa Kerja'
        DataBinding.FieldName = 'lamakerja'
        Width = 100
      end
      object gtbListnilai: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'nilai'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbListaktif: TcxGridDBColumn
        DataBinding.FieldName = 'aktif'
        Width = 100
      end
      object gtbListlastedituser: TcxGridDBColumn
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
      object gtbListlasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbList
    end
  end
  object btnSetInaktif: TcxButton
    Left = 384
    Top = 464
    Width = 101
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = 'Set In-Active'
    TabOrder = 3
    OnClick = btnSetInaktifClick
  end
  object qryKode: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select kodethr from ben_thr_periode where aktif = '#39'Y'#39'  order by ' +
        'kodethr DESC LIMIT 5')
    Left = 772
    Top = 44
  end
  object dsQryKode: TDataSource
    DataSet = qryKode
    Left = 776
    Top = 92
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 716
    Top = 44
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 720
    Top = 96
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select * from ben_thr_parameter where kodethr = '#39'X'#39' and aktif = ' +
        #39'Y'#39)
    Left = 844
    Top = 40
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 848
    Top = 88
  end
end
