object frmPayrollAdminBali: TfrmPayrollAdminBali
  Left = 0
  Top = 0
  ClientHeight = 432
  ClientWidth = 969
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    969
    432)
  PixelsPerInch = 96
  TextHeight = 13
  object lblJudulForm: TLabel
    Left = -1
    Top = 0
    Width = 967
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Payroll Bali'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 878
  end
  object Label1: TLabel
    Left = 192
    Top = 35
    Width = 29
    Height = 13
    Caption = 'Start'
  end
  object Label2: TLabel
    Left = 368
    Top = 35
    Width = 20
    Height = 13
    Caption = 'End'
  end
  object Label3: TLabel
    Left = 536
    Top = 35
    Width = 67
    Height = 13
    Caption = 'Jumlah Hari'
  end
  object Label4: TLabel
    Left = 748
    Top = 35
    Width = 78
    Height = 13
    Caption = 'Libur Nasional'
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 164
    Width = 957
    Height = 221
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtvRekap: TcxGridBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtvRekapTHP
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
          Column = gtvRekapKode
        end
        item
          Format = '#,#'
          Kind = skCount
          Position = spFooter
          Column = gtvRekapDivisi
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtvRekapDenda
        end
        item
          Format = '#,#'
          Kind = skSum
          Position = spFooter
          Column = gtvRekapPotLain
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#'
          Kind = skSum
          Column = gtvRekapTHP
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtvRekapKode
        end
        item
          Format = '#,#'
          Kind = skCount
          Column = gtvRekapDivisi
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtvRekapDenda
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtvRekapPotLain
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.ColumnsQuickCustomizationReordering = qcrEnabled
      OptionsCustomize.BandsQuickCustomization = True
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'ID Karyawan'
          FixedKind = fkLeft
        end
        item
          Caption = 'Variable'
        end
        item
          Caption = 'Presensi'
        end
        item
          Caption = 'Take Home Pay'
        end>
      object gtvRekapKode: TcxGridBandedColumn
        Caption = 'Kode'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvRekapIDFinger: TcxGridBandedColumn
        Caption = 'ID Finger'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvRekapDivisi: TcxGridBandedColumn
        Caption = 'Divisi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvRekapNama: TcxGridBandedColumn
        Caption = 'Nama'
        Width = 150
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvRekapBank: TcxGridBandedColumn
        Caption = 'Bank'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Styles.Content = StyleRekening
        Styles.Header = StyleRekening
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvRekapNoRek: TcxGridBandedColumn
        Caption = 'Nama Rek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = True
        Styles.Content = StyleRekening
        Styles.Header = StyleRekening
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtvRekapNamaRek: TcxGridBandedColumn
        Caption = 'No Rek'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = True
        Styles.Content = StyleRekening
        Styles.Header = StyleRekening
        Width = 150
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvRekapType: TcxGridBandedColumn
        Caption = 'V. Type'
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvRekapVarGapok: TcxGridBandedColumn
        Caption = 'V. Gapok'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvRekapVarTHP: TcxGridBandedColumn
        Caption = 'V. THP'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object gtvRekapVarTunjangan: TcxGridBandedColumn
        Caption = 'V. Tunj'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvRekapVarTransport: TcxGridBandedColumn
        Caption = 'V. Tunj. Lain'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvRekapVarPot1: TcxGridBandedColumn
        Caption = 'V. Saving'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvRekapVarPot2: TcxGridBandedColumn
        Caption = 'V. Pot'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Styles.Content = StylePotongan
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtvRekapVarTamb: TcxGridBandedColumn
        Caption = 'V. BPJS / Tamb'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvRekapVarOT: TcxGridBandedColumn
        Caption = 'V. Lembur'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtvRekapKomisi: TcxGridBandedColumn
        Caption = 'Komisi'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvRekapOff: TcxGridBandedColumn
        Caption = 'Off'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtvRekapLibNas: TcxGridBandedColumn
        Caption = 'Lib. Nas'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvRekapHKerja: TcxGridBandedColumn
        Caption = 'H. Kerja'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvRekapHarusKerja: TcxGridBandedColumn
        Caption = 'Harus Kerja'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvRekapCuti: TcxGridBandedColumn
        Caption = 'Cuti'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvRekapNormal: TcxGridBandedColumn
        Caption = 'Normal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtvRekapOvertime: TcxGridBandedColumn
        Caption = 'Jam OT'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvRekapFullOvertime: TcxGridBandedColumn
        Caption = 'F O T'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtvRekapUnderTime: TcxGridBandedColumn
        Caption = 'Under T'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object gtvRekapLate1: TcxGridBandedColumn
        Caption = 'Late'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object gtvRekapLate2: TcxGridBandedColumn
        Caption = 'Late > 30'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object gtvRekapIjinMasuk: TcxGridBandedColumn
        Caption = 'I. Masuk'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object gtvRekapIjinKeluar: TcxGridBandedColumn
        Caption = 'I. Keluar'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object gtvRekapIjinTM: TcxGridBandedColumn
        Caption = 'I. Tidak Msk'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
      object gtvRekapIjinPulang: TcxGridBandedColumn
        Caption = 'I. Pulang'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 15
        Position.RowIndex = 0
      end
      object gtvRekapIjinSakit: TcxGridBandedColumn
        Caption = 'Sakit'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 16
        Position.RowIndex = 0
      end
      object gtvRekapAlpa: TcxGridBandedColumn
        Caption = 'Alpa'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 17
        Position.RowIndex = 0
      end
      object gtvRekapDenda: TcxGridBandedColumn
        Caption = 'Denda'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Styles.Content = StylePotongan
        Styles.Footer = StylePotongan
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtvRekapPotLain: TcxGridBandedColumn
        Caption = 'Pot. Lain'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Styles.Content = StylePotongan
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gtvRekapTambLain: TcxGridBandedColumn
        Caption = 'Tamb. Lain'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtvRekapNUM: TcxGridBandedColumn
        Caption = 'N. UM'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtvRekapNLembur: TcxGridBandedColumn
        Caption = 'N. Lembur'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object gtvRekapTHP: TcxGridBandedColumn
        Caption = 'THP'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Styles.Content = styleTotal
        Styles.Footer = styleTotal
        Styles.GroupSummary = styleTotal
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object gtvRekapKeterangan: TcxGridBandedColumn
        Caption = 'Keterangan'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 150
        Position.BandIndex = 3
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object gtvRekapVarUM: TcxGridBandedColumn
        Caption = 'V. UM'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtvRekapNGapok: TcxGridBandedColumn
        Caption = 'Gapok'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtvRekapNGPLibNas: TcxGridBandedColumn
        Caption = 'G. Lib Nas'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtvRekapIjinTA: TcxGridBandedColumn
        Caption = 'I. Tdk Absn'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Visible = False
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 18
        Position.RowIndex = 0
      end
      object gtvRekapNUMLibNas: TcxGridBandedColumn
        Caption = 'UM. Lib Nas'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtvRekapNFOT: TcxGridBandedColumn
        Caption = 'N FOT'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object gtvRekapHOT: TcxGridBandedColumn
        Caption = 'Hari  OT'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtvRekapHUM: TcxGridBandedColumn
        Caption = 'Hari UM'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Position.BandIndex = 3
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtvRekapUMx3: TcxGridBandedColumn
        Caption = 'UM x 3'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Position.BandIndex = 3
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object gtvRekapHCashIn: TcxGridBandedColumn
        Caption = 'Cash In'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 75
        Position.BandIndex = 2
        Position.ColIndex = 19
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvRekap
    end
  end
  object edPeriode: TComboBox
    Left = 8
    Top = 32
    Width = 177
    Height = 21
    TabOrder = 1
    OnChange = edPeriodeChange
  end
  object edStart: TcxDateEdit
    Left = 232
    Top = 32
    EditValue = 0d
    TabOrder = 2
    Width = 121
  end
  object edEnd: TcxDateEdit
    Left = 408
    Top = 32
    EditValue = 0d
    TabOrder = 3
    Width = 121
  end
  object edLama: TcxCalcEdit
    Left = 616
    Top = 32
    EditValue = 0.000000000000000000
    TabOrder = 4
    Width = 121
  end
  object Button1: TButton
    Left = 652
    Top = 91
    Width = 85
    Height = 48
    Caption = 'Export Excel'
    TabOrder = 5
    OnClick = Button1Click
  end
  object tabControl: TcxPageControl
    Left = 4
    Top = 58
    Width = 393
    Height = 100
    TabOrder = 6
    Properties.ActivePage = tbKaryawan
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 97
    ClientRectLeft = 2
    ClientRectRight = 390
    ClientRectTop = 27
    object tbDivisi: TcxTabSheet
      Caption = 'Search By Divisi'
      ImageIndex = 0
      object edDepartemen: TcxLookupComboBox
        Left = 3
        Top = 16
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = dsTblDepartemen
        TabOrder = 0
        Width = 227
      end
      object btnDivisi: TButton
        Left = 236
        Top = 3
        Width = 81
        Height = 38
        Caption = 'Load Data'
        TabOrder = 1
        OnClick = btnDivisiClick
      end
    end
    object tbKaryawan: TcxTabSheet
      Caption = 'By ID Karyawan'
      ImageIndex = 1
      object lblKodeKaryawan: TLabel
        Left = 3
        Top = 3
        Width = 15
        Height = 13
        Caption = '.....'
      end
      object lblIDFinger: TLabel
        Left = 3
        Top = 17
        Width = 15
        Height = 13
        Caption = '.....'
      end
      object lblNamaKaryawan: TLabel
        Left = 3
        Top = 31
        Width = 15
        Height = 13
        Caption = '.....'
      end
      object btnCariKaryawan: TButton
        Left = 196
        Top = 4
        Width = 75
        Height = 37
        Caption = 'Cari'
        TabOrder = 0
        OnClick = btnCariKaryawanClick
      end
      object btnLoadKode: TButton
        Left = 305
        Top = 5
        Width = 75
        Height = 37
        Caption = 'Load'
        TabOrder = 1
        OnClick = btnLoadKodeClick
      end
      object edQuickSearch: TcxTextEdit
        Left = 3
        Top = 50
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 2
        TextHint = 'Type ID Karyawan and Press Enter'
        OnKeyPress = edQuickSearchKeyPress
        Width = 357
      end
    end
    object tbAll: TcxTabSheet
      Caption = 'All'
      ImageIndex = 2
      object btnLoadAll: TButton
        Left = 3
        Top = 3
        Width = 93
        Height = 39
        Caption = 'Load All'
        TabOrder = 0
        OnClick = btnLoadAllClick
      end
    end
  end
  object prog1: TcxProgressBar
    Left = 414
    Top = 64
    TabOrder = 7
    Width = 323
  end
  object Button2: TButton
    Left = 414
    Top = 88
    Width = 115
    Height = 51
    Caption = 'POST'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = Button2Click
  end
  object btnPotongan: TButton
    Left = 11
    Top = 391
    Width = 102
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = 'Add Potongan'
    TabOrder = 9
    OnClick = btnPotonganClick
  end
  object btnTambahan: TButton
    Left = 119
    Top = 391
    Width = 102
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = 'Add Tambahan'
    TabOrder = 10
    OnClick = btnTambahanClick
  end
  object edLibNas: TcxCalcEdit
    Left = 828
    Top = 32
    EditValue = 0.000000000000000000
    TabOrder = 11
    Width = 121
  end
  object edMerge: TComboBox
    Left = 131
    Top = 60
    Width = 177
    Height = 21
    TabOrder = 12
    Visible = False
  end
  object ckMerge: TcxCheckBox
    Left = 4
    Top = 59
    Caption = 'Merge Periode'
    TabOrder = 13
    Visible = False
  end
  object Memo1: TMemo
    Left = 748
    Top = 54
    Width = 213
    Height = 89
    Anchors = [akLeft, akTop, akRight]
    ScrollBars = ssBoth
    TabOrder = 14
    Visible = False
  end
  object tblDepartemen: TMyTable
    TableName = 'departemen'
    Connection = dmDB.dbInternal
    Left = 760
    Top = 64
  end
  object dsTblDepartemen: TDataSource
    DataSet = tblDepartemen
    Left = 764
    Top = 108
  end
  object dlgSave: TSaveDialog
    Left = 428
    Top = 120
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 916
    Top = 76
    PixelsPerInch = 96
    object StylePotongan: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object styleTotal: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object StyleRekening: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlue
    end
  end
end
