object frmMasterShift: TfrmMasterShift
  Left = 0
  Top = 0
  Caption = 'Master Shift '
  ClientHeight = 519
  ClientWidth = 760
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    760
    519)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 137
    Height = 26
    Caption = '  MASTER SHIFT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 48
    Width = 744
    Height = 403
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbShift: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblShift
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbShiftautonum: TcxGridDBColumn
        DataBinding.FieldName = 'autonum'
        Visible = False
        Width = 100
      end
      object gtbShiftnamashift: TcxGridDBColumn
        Caption = 'Nama Shift'
        DataBinding.FieldName = 'namashift'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = True
        Width = 203
      end
      object gtbShiftjmasuk: TcxGridDBColumn
        Caption = 'J. Masuk'
        DataBinding.FieldName = 'jmasuk'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Properties.UseCtrlIncrement = True
        Width = 100
      end
      object gtbShiftjkeluar: TcxGridDBColumn
        Caption = 'J. Keluar'
        DataBinding.FieldName = 'jkeluar'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbShiftjamkerja: TcxGridDBColumn
        Caption = 'Jml Jam'
        DataBinding.FieldName = 'jamkerja'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbShiftovernight: TcxGridDBColumn
        Caption = 'Over Night'
        DataBinding.FieldName = 'overnight'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 75
      end
      object gtbShiftaktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 90
      end
      object gtbShiftnotes: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'notes'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbShift
    end
  end
  object Button1: TButton
    Left = 8
    Top = 466
    Width = 93
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    TabOrder = 1
    OnClick = Button1Click
  end
  object btnEdit: TButton
    Left = 107
    Top = 466
    Width = 93
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'Edit'
    TabOrder = 2
    OnClick = btnEditClick
  end
  object tblShift: TMyTable
    TableName = 'ben_shift'
    Connection = dmDB.dbInternal
    Left = 196
    Top = 16
  end
  object dsTblShift: TDataSource
    DataSet = tblShift
    Left = 196
    Top = 72
  end
end
