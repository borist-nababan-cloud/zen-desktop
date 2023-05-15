object frmSelectGC: TfrmSelectGC
  Left = 294
  Top = 98
  BorderIcons = [biSystemMenu]
  Caption = 'frmSelectGC'
  ClientHeight = 613
  ClientWidth = 898
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    898
    613)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 45
    Height = 15
    Caption = 'ID Paket'
    Transparent = True
  end
  object Label3: TLabel
    Left = 8
    Top = 40
    Width = 49
    Height = 15
    Caption = 'Tgl Terbit'
    Transparent = True
  end
  object Label4: TLabel
    Left = 8
    Top = 64
    Width = 82
    Height = 15
    Caption = 'Tgl Kadaluarsa'
    Transparent = True
  end
  object Label5: TLabel
    Left = 8
    Top = 88
    Width = 58
    Height = 15
    Caption = 'Harga Jual'
    Transparent = True
  end
  object Label2: TLabel
    Left = 8
    Top = 112
    Width = 60
    Height = 15
    Caption = 'Total Items'
    Transparent = True
  end
  object edSelectIDPaket: TcxTextEdit
    Left = 96
    Top = 12
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 250
  end
  object edSelectTerbit: TcxDateEdit
    Left = 96
    Top = 36
    EditValue = 0d
    TabOrder = 1
    Width = 250
  end
  object edSelectKadaluarsa: TcxDateEdit
    Left = 96
    Top = 60
    EditValue = 0d
    TabOrder = 2
    Width = 250
  end
  object edSelectJual: TcxCalcEdit
    Left = 96
    Top = 84
    EditValue = 0
    Properties.UseThousandSeparator = True
    TabOrder = 3
    Width = 250
  end
  object edSelectAktif: TcxCheckBox
    Left = 96
    Top = 132
    Caption = 'Aktif'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 4
    Transparent = True
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 204
    Width = 369
    Height = 409
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 5
    object gtvPaket: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          OnGetText = gtvPaketTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText
          Column = gtvPaketGCID
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtvPaketHarga
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.NavigatorHints = True
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object gtvPaketGCID: TcxGridColumn
        Caption = 'ID GC'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 89
      end
      object gtvPaketNama: TcxGridColumn
        Caption = 'Nama Menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 166
      end
      object gtvPaketHarga: TcxGridColumn
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Width = 85
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvPaket
    end
  end
  object cxGrid2: TcxGrid
    Left = 376
    Top = 0
    Width = 522
    Height = 613
    Align = alRight
    TabOrder = 6
    object tvAvailable: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object tvAvailablePaketNumber: TcxGridColumn
        Caption = 'Paket Number'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        GroupIndex = 0
        Width = 109
      end
      object tvAvailableIDGC: TcxGridColumn
        Caption = 'ID GC'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = True
        Width = 104
      end
      object tvAvailableNama: TcxGridColumn
        Caption = 'Nama Menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = True
        Width = 111
      end
      object tvAvailableHarga: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 124
      end
      object tvAvailableBtn: TcxGridColumn
        Caption = 'Add'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = tvAvailableBtnPropertiesButtonClick
        Width = 115
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = tvAvailable
    end
  end
  object edSelectItems: TcxCalcEdit
    Left = 96
    Top = 108
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 7
    Width = 250
  end
  object btnPost: TcxButton
    Left = 4
    Top = 156
    Width = 149
    Height = 41
    Caption = 'POST'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 8
    OnClick = btnPostClick
  end
  object btnCancel: TcxButton
    Left = 160
    Top = 156
    Width = 75
    Height = 41
    Caption = 'Cancel'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 9
    OnClick = btnCancelClick
  end
  object qryGC: TMyQuery
    Connection = dmDB.dbInternal
    Left = 280
    Top = 148
  end
  object dsQryGC: TMyDataSource
    DataSet = qryGC
    Left = 332
    Top = 148
  end
  object tblPaketGC: TMyQuery
    Connection = dmDB.dbInternal
    Left = 280
    Top = 200
  end
  object dsTblPaketGC: TMyDataSource
    DataSet = tblPaketGC
    Left = 332
    Top = 200
  end
end
