object frmPayrollPotongan: TfrmPayrollPotongan
  Left = 0
  Top = 0
  ClientHeight = 327
  ClientWidth = 626
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
    626
    327)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 0
    Top = 4
    Width = 618
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  POTONGAN LAIN-LAIN'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 519
  end
  object Label1: TLabel
    Left = 8
    Top = 47
    Width = 87
    Height = 13
    Caption = 'Kode Karyawan'
  end
  object Label2: TLabel
    Left = 8
    Top = 74
    Width = 91
    Height = 13
    Caption = 'Nama Karyawan'
  end
  object Label3: TLabel
    Left = 8
    Top = 101
    Width = 80
    Height = 13
    Caption = 'Nilai Potongan'
  end
  object Label5: TLabel
    Left = 8
    Top = 128
    Width = 66
    Height = 13
    Caption = 'Keterangan'
  end
  object Label6: TLabel
    Left = 8
    Top = 155
    Width = 43
    Height = 13
    Caption = 'Periode'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 196
    Width = 610
    Height = 123
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbPotongan: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryPotongan
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '#,#'
          Position = spFooter
          Column = gtbPotongannilai
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = gtbPotongannilai
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbPotongannilai: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'nilai'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtbPotonganketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 250
      end
      object gtbPotonganlastedituser: TcxGridDBColumn
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
      object gtbPotonganlasteditdate: TcxGridDBColumn
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbPotongan
    end
  end
  object edKode: TEdit
    Left = 116
    Top = 44
    Width = 213
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edNama: TEdit
    Left = 116
    Top = 71
    Width = 213
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edNilai: TcxCalcEdit
    Left = 116
    Top = 98
    EditValue = 0.000000000000000000
    Properties.UseThousandSeparator = True
    TabOrder = 3
    Width = 165
  end
  object edKeterangan: TEdit
    Left = 116
    Top = 125
    Width = 213
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object btnTambah: TButton
    Left = 348
    Top = 47
    Width = 105
    Height = 58
    Caption = 'Tambah'
    TabOrder = 5
    OnClick = btnTambahClick
  end
  object edPeriodePot: TEdit
    Left = 116
    Top = 152
    Width = 213
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object qryPotongan: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select nilai, keterangan, lastedituser, lasteditdate from ben_pa' +
        'yroll_potongan'
      'LIMIT 10')
    Left = 480
    Top = 36
  end
  object dsQryPotongan: TDataSource
    DataSet = qryPotongan
    Left = 480
    Top = 88
  end
end
