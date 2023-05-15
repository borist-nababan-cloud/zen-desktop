object frmSelectGC: TfrmSelectGC
  Left = 294
  Top = 98
  BorderIcons = [biSystemMenu]
  Caption = 'EDIT SELECTED GC PACKAGE'
  ClientHeight = 502
  ClientWidth = 964
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    964
    502)
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
    Width = 75
    Height = 15
    Caption = 'Tgl Kadaluarsa'
    Transparent = True
  end
  object Label5: TLabel
    Left = 365
    Top = 16
    Width = 54
    Height = 15
    Caption = 'Harga Jual'
    Transparent = True
  end
  object Label2: TLabel
    Left = 365
    Top = 40
    Width = 60
    Height = 15
    Caption = 'Total Items'
    Transparent = True
  end
  object Label6: TLabel
    Left = 8
    Top = 464
    Width = 79
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'TOTAL HARGA '
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
    Left = 453
    Top = 12
    EditValue = 0
    Properties.UseThousandSeparator = True
    TabOrder = 3
    Width = 149
  end
  object edSelectAktif: TcxCheckBox
    Left = 453
    Top = 60
    Caption = 'Aktif'
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    TabOrder = 4
    Transparent = True
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 95
    Width = 457
    Height = 354
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
          Column = gtvPaketGCID
        end
        item
          Format = '#,#'
          Kind = skSum
          Column = gtvPaketHarga
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.NavigatorHints = True
      OptionsData.Deleting = False
      OptionsData.Inserting = False
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
    object gtbOnPaket: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryOnPaket
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gtbOnPaketgc_number
        end
        item
          Format = '#,#'
          Kind = skSum
          OnGetText = gtbOnPaketTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText
          Column = gtbOnPaketharga_jual
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      object gtbOnPaketpaket_number: TcxGridDBColumn
        DataBinding.FieldName = 'paket_number'
        Visible = False
        Width = 100
      end
      object gtbOnPaketgc_number: TcxGridDBColumn
        Caption = 'GC Number'
        DataBinding.FieldName = 'gc_number'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 125
      end
      object gtbOnPaketnama_menu: TcxGridDBColumn
        Caption = 'Nama Menu'
        DataBinding.FieldName = 'nama_menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 250
      end
      object gtbOnPaketharga_jual: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga_jual'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbOnPaket
    end
  end
  object cxGrid2: TcxGrid
    Left = 544
    Top = 95
    Width = 405
    Height = 354
    Anchors = [akLeft, akTop, akBottom]
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
    end
    object gtbAvailable: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryAvailable
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbAvailablepaket_number: TcxGridDBColumn
        DataBinding.FieldName = 'paket_number'
        Visible = False
        Width = 100
      end
      object gtbAvailablegc_number: TcxGridDBColumn
        Caption = 'GC Number'
        DataBinding.FieldName = 'gc_number'
        Width = 125
      end
      object gtbAvailablenama_menu: TcxGridDBColumn
        Caption = 'Nama Menu'
        DataBinding.FieldName = 'nama_menu'
        Width = 250
      end
      object gtbAvailableharga_jual: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga_jual'
        Width = 100
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = gtbAvailable
    end
  end
  object edSelectItems: TcxCalcEdit
    Left = 453
    Top = 36
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 7
    Width = 149
  end
  object btnPost: TcxButton
    Left = 617
    Top = 8
    Width = 93
    Height = 51
    Caption = 'SAVE'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 8
    OnClick = btnPostClick
  end
  object btnCancel: TcxButton
    Left = 716
    Top = 8
    Width = 75
    Height = 51
    Caption = 'Cancel'
    LookAndFeel.Kind = lfOffice11
    TabOrder = 9
    OnClick = btnCancelClick
  end
  object btnRemove: TcxButton
    Left = 475
    Top = 255
    Width = 58
    Height = 42
    Caption = 'REMOVE'
    OptionsImage.Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000001900000033000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000452696008C4BFF0000003300000000000000000000001F0000
      0033000000330000003300000033000000330000003300000033000000330000
      003300000033008847FF54DAB0FF008746FF000000330000000000552EAE008A
      49FF008947FF008947FF008947FF008947FF008947FF008947FF008947FF0088
      46FF008644FF00B97FFF00D8A0FF65D7B3FF008744FF00000033008A49FF00D5
      A7FF00D1A1FF00D0A0FF00D0A0FF00D0A0FF00D0A0FF00D0A0FF00D0A0FF00D0
      A0FF00CF9FFF00CD9CFF00CB9AFF00CD9CFF74DABDFF008A48FF008A48FF65E6
      D1FF61E2CBFF61E1CAFF61E1CAFF61E1CAFF61E1CAFF61E1CAFF61E1CAFF61E1
      CAFF61E0C8FF64DFC7FF00C49AFF00C59CFF86DEC8FF008A48FF006134AF008A
      47FF008845FF008844FF008844FF008844FF008844FF008844FF008844FF0087
      44FF008641FF00AB7DFF00C09EFF9BE0D0FF008743FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008945FFA4E4D9FF008743FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000552E9A008C49FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    OptionsImage.Layout = blGlyphBottom
    TabOrder = 10
  end
  object btnAdd: TcxButton
    Left = 475
    Top = 199
    Width = 58
    Height = 42
    Caption = 'ADD'
    OptionsImage.Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000003300000027000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000033008C4BFF006D3BD1000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0033008746FF54DAB0FF008847FF000000330000003300000033000000330000
      0033000000330000003300000033000000330000003300000023000000330087
      44FF65D7B3FF00D8A0FF00B97FFF008644FF008846FF008947FF008947FF0089
      47FF008947FF008947FF008947FF008947FF008A49FF006135C0008A48FF74DA
      BDFF00CD9CFF00CB9AFF00CD9CFF00CF9FFF00D0A0FF00D0A0FF00D0A0FF00D0
      A0FF00D0A0FF00D0A0FF00D0A0FF00D1A1FF00D5A7FF008A49FF008A48FF86DE
      C8FF00C59CFF00C49AFF64DFC7FF61E0C8FF61E1CAFF61E1CAFF61E1CAFF61E1
      CAFF61E1CAFF61E1CAFF61E1CAFF61E2CBFF65E6D1FF008A48FF000000000087
      43FF9BE0D0FF00C09EFF00AB7DFF008641FF008744FF008844FF008844FF0088
      44FF008844FF008844FF008844FF008845FF008A47FF006134B0000000000000
      0000008743FFA4E4D9FF008945FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008C49FF007941DA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    OptionsImage.Layout = blGlyphTop
    TabOrder = 11
  end
  object cxButton1: TcxButton
    Left = 475
    Top = 396
    Width = 58
    Height = 53
    Anchors = [akLeft, akBottom]
    Caption = 'REFRESH'
    OptionsImage.Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000330000002F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000033008B49FF008246F1000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000033008743FFA1E2D5FF239A60FF000000330000
      0033000000330000003300000022000000000000000000000000000000000000
      00000000000000000033008743FF93DCC9FF1ACAADFF00B68EFF009658FF0097
      5BFF008B4AFF008945FF005B30B9000000330000000000000000000000000000
      000000000000008A48FF81DBC2FF14CEA9FF00C499FF57DBC1FF56DCC3FF56DD
      C4FF56DEC5FF56DCC4FF44C19AFF008B4AFF0000003300000000000000000000
      000000000000008A48FF6FD7B8FF12D5A9FF00CD9BFF00CE9DFF00D1A0FF00D2
      A1FF00D1A0FF00D1A0FF1DD8AEFF2FCCA3FF018A49FF0000001E000000000000
      00000000000000000000008744FF5FD1ACFF11DDAAFF00CA90FF008B49FF0087
      45FF009C5EFF00A568FF00C48AFF04DDA8FF16BA83FF01532DAA000000000000
      0033000000330000001A00000000008846FF4ED3A9FF129155FF000000000000
      002D00000033004B2889008043F000B578FF00D89FFF008B4BFF00000000008D
      4DFF008B4BFF004626990000002C0000001400592FA2008D4CFF00000000007B
      42E5008C4AFF0000003300000000005C31A8008B4BFF008D4DFF00000000008B
      4BFF00D89FFF00B578FF00773EE400361D820000003300000033000000331191
      54FF53D4AAFF008846FF00000033000000000000000000000000000000000252
      2D951ABA86FF07DBA8FF00BE85FF00A061FF009C5DFF008744FF008A49FF00C9
      90FF12DCAAFF63D3AFFF008744FF000000330000000000000000000000000000
      0000008A49FF35D0AAFF20D7B1FF0DD3A7FF0DD4A7FF0DD4A8FF0DD3A7FF0ED1
      A4FF00CA9AFF13D3A9FF73D7BBFF008A48FF0000000000000000000000000000
      000000000000018B49FF48C29CFF5CDCC6FF5BDEC8FF5ADEC7FF5BDDC6FF5CDB
      C3FF00C399FF15CCAAFF85DBC3FF008A48FF0000000000000000000000000000
      00000000000000000000005B2FA8008946FF008844FF008744FF008947FF00B5
      8EFF1BC8AEFF98DECBFF008742FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000239B
      61FFA1E2D5FF008743FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000082
      46ED008B49FF0000000000000000000000000000000000000000}
    OptionsImage.Layout = blGlyphBottom
    TabOrder = 12
  end
  object edTotalHarga: TcxCalcEdit
    Left = 108
    Top = 461
    Anchors = [akLeft, akBottom]
    EditValue = 0
    Properties.UseThousandSeparator = True
    TabOrder = 13
    Width = 149
  end
  object qryOnPaket: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select paket_number, gc_number, nama_menu, harga_jual from gc_de' +
        'tail'
      'where paket_number = '#39'X'#39)
    Active = True
    Left = 32
    Top = 124
  end
  object qryAvailable: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select paket_number, gc_number, nama_menu, harga_jual from gc_de' +
        'tail'
      'where paket_number = '#39'X'#39)
    Active = True
    Left = 608
    Top = 136
  end
  object dsQryAvailable: TDataSource
    DataSet = qryAvailable
    Left = 608
    Top = 188
  end
  object dsQryOnPaket: TDataSource
    DataSet = qryOnPaket
    Left = 32
    Top = 176
  end
end
