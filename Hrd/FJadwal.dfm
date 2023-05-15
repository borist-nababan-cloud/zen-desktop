object frmJadwal: TfrmJadwal
  Left = 167
  Top = 115
  ClientHeight = 591
  ClientWidth = 969
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    969
    591)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 12
    Top = 8
    Width = 54
    Height = 15
    Caption = 'Start Date'
    Transparent = True
  end
  object Label2: TLabel
    Left = 12
    Top = 32
    Width = 48
    Height = 15
    Caption = 'End Date'
    Transparent = True
  end
  object Label3: TLabel
    Left = 12
    Top = 56
    Width = 32
    Height = 15
    Caption = 'Divisi'
    Transparent = True
  end
  object edStartDate: TcxDateEdit
    Left = 92
    Top = 4
    EditValue = 0d
    TabOrder = 0
    Width = 200
  end
  object edEndDate: TcxDateEdit
    Left = 92
    Top = 28
    EditValue = 0d
    TabOrder = 1
    Width = 200
  end
  object edDepartemen: TcxLookupComboBox
    Left = 92
    Top = 52
    Properties.KeyFieldNames = 'id_departemen'
    Properties.ListColumns = <
      item
        FieldName = 'id_departemen'
      end>
    TabOrder = 2
    Width = 200
  end
  object btnGetData: TcxButton
    Left = 296
    Top = 4
    Width = 101
    Height = 69
    Caption = 'Get Data Staff'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 3
    OnClick = btnGetDataClick
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 84
    Width = 971
    Height = 262
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    LookAndFeel.Kind = lfOffice11
    object gtvScheduler: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
          Column = gtvSchedulerIDKaryawan
        end
        item
          Kind = skCount
          Column = gtvSchedulerIDKaryawan
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtvSchedulerIDKaryawan
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtvSchedulerIDKaryawan: TcxGridColumn
        Caption = 'ID Karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 118
      end
      object gtvSchedulerNamaKaryawan: TcxGridColumn
        Caption = 'Nama Karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object gtvSchedulerDepartemen: TcxGridColumn
        Caption = 'Departemen ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 98
      end
      object gtvSchedulerWeekly: TcxGridColumn
        Caption = 'Weekly'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.KeyFieldNames = 'id_weekly'
        Properties.ListColumns = <
          item
            MinWidth = 150
            Width = 150
            FieldName = 'nama_weekly'
          end>
        Width = 150
      end
      object gtvSchedulerBtn: TcxGridColumn
        Caption = '[...]'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = gtvSchedulerBtnPropertiesButtonClick
        Width = 31
      end
      object gtvSchedulerMon: TcxGridColumn
        Caption = 'Mon'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_shift'
        Properties.ListColumns = <
          item
            FieldName = 'nama_shift'
          end>
      end
      object gtvSchedulerTues: TcxGridColumn
        Caption = 'Tues'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_shift'
        Properties.ListColumns = <
          item
            FieldName = 'nama_shift'
          end>
      end
      object gtvSchedulerWed: TcxGridColumn
        Caption = 'Wed'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_shift'
        Properties.ListColumns = <
          item
            FieldName = 'nama_shift'
          end>
      end
      object gtvSchedulerThurs: TcxGridColumn
        Caption = 'Thurs'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_shift'
        Properties.ListColumns = <
          item
            FieldName = 'nama_shift'
          end>
      end
      object gtvSchedulerFri: TcxGridColumn
        Caption = 'Fri'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_shift'
        Properties.ListColumns = <
          item
            FieldName = 'nama_shift'
          end>
      end
      object gtvSchedulerSat: TcxGridColumn
        Caption = 'Sat'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_shift'
        Properties.ListColumns = <
          item
            FieldName = 'nama_shift'
          end>
      end
      object gtvSchedulerSun: TcxGridColumn
        Caption = 'Sun'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_shift'
        Properties.ListColumns = <
          item
            FieldName = 'nama_shift'
          end>
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvScheduler
    end
  end
  object btnGenerate: TcxButton
    Left = 400
    Top = 4
    Width = 117
    Height = 69
    Caption = 'Generate Data '
    Enabled = False
    LookAndFeel.Kind = lfOffice11
    TabOrder = 5
    OnClick = btnGenerateClick
  end
  object cxGrid2: TcxGrid
    Left = 4
    Top = 348
    Width = 969
    Height = 245
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 6
    LookAndFeel.Kind = lfOffice11
    object gtvJadwal: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtvJadwalIDKaryawan: TcxGridColumn
        Caption = 'ID Karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 76
      end
      object gtvJadwalNamaKaryawan: TcxGridColumn
        Caption = 'Nama Karyawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 138
      end
      object gtvJadwalDepartemen: TcxGridColumn
        Caption = 'Departemen'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 110
      end
      object gtvJadwalShift: TcxGridColumn
        Caption = 'Shift'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 89
      end
      object gtvJadwalTglMasuk: TcxGridColumn
        Caption = 'Tanggal Masuk'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 111
      end
      object gtvJadwalJamMsk: TcxGridColumn
        Caption = 'Jam Masuk'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 89
      end
      object gtvJadwalTglKlr: TcxGridColumn
        Caption = 'Tanggal Keluar'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 129
      end
      object gtvJadwalJamKlr: TcxGridColumn
        Caption = 'Jam Keluar'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 149
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = gtvJadwal
    end
  end
  object btnPost: TcxButton
    Left = 520
    Top = 4
    Width = 177
    Height = 69
    Caption = 'POST DATA'
    Enabled = False
    LookAndFeel.Kind = lfOffice11
    TabOrder = 7
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnPostClick
  end
end
