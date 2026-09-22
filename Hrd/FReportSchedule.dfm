object frmReportSchedule: TfrmReportSchedule
  Left = 225
  Top = 117
  Caption = 'Laporan Jadwal Harian'
  ClientHeight = 519
  ClientWidth = 787
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    787
    519)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 67
    Align = alTop
    BevelOuter = bvNone
    Color = clSkyBlue
    TabOrder = 0
    DesignSize = (
      787
      67)
    object Label2: TLabel
      Left = 8
      Top = 39
      Width = 63
      Height = 13
      Caption = 'Filter By Date'
    end
    object Label1: TLabel
      Left = -2
      Top = -4
      Width = 788
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = '  Presensi Laporan Jadwal Harian'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      ExplicitWidth = 755
    end
    object edTanggal: TcxDateEdit
      Left = 108
      Top = 36
      EditValue = 0d
      TabOrder = 0
      Width = 121
    end
    object btnFilter: TcxButton
      Left = 244
      Top = 34
      Width = 41
      Height = 25
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000004070C12192E5084020305080000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000014253E5D335CA5FF4880B9FF325A9AE604070D1400000000000000000000
        0000000000000000000000000000000000000000000000000000000000001627
        3F5D5184BCFF7DB5D7FF7FB5D6FF5691C3FF33609FED0204080C000000000000
        00000000000000000000000000000000000000000000000000001729405D588E
        C1FF8FC5DFFFA0D3E7FF93C7E0FF619BC9FF233E74DC0204070A000000000000
        0000101D2937335B81AF467BADEB4B85BCFD4A83BBFD4377ACF04C81BBFF87BF
        DBFFA3D5E8FFA5D7E9FF80BBDAFF3D63AAFD05090F1700000000000000001F37
        4C654882B0E73E6F99CE23405B7C0B141D280B141D28213B597C518BBFFD79B4
        D6FF99CCE3FF8DC4DEFF4F83BCFF050910170000000000000000111F2A374D87
        B2E72A4B65861E1B191F3E3A3541534D4757514B45553935313C1B19171C538F
        BFFA6FABD2FF4073BEFF15273D590000000000000000000000003B6988AF4579
        A0CE1E1C1A20524C4656605A52655F5951645C564F615B554E604B46404F1B19
        171C477DB3F7355F8FC9000000000000000000000000000000005493B9EB2949
        617C45403A48665F576B655E566A635C5468605A52655E5850635B554E603B37
        323E223C597C4175AAEB0000000000000000000000000000000060A4CBFD0D18
        1F28625B54676A625A6F6961596E665F576B635C5468625B54675F595164534D
        47570B141D284B85BCFD0000000000000000000000000000000061A6CDFD0E18
        2028665F576B6F675E746C645C716A625A6F6760586C645D5569625B54675751
        4A5B0B141D284E89BDFD000000000000000000000000000000005899BEEB2B4E
        637C4E494352726A6178706960766E665D736C645C716760586C655E566A413C
        374424415C7C477EAFEB0000000000000000000000000000000041728DAF4C85
        A6CE26232028645D5569736B6279706960766F675E746C645C7157514A5B1E1C
        1A2040739CCE345E82AF0000000000000000000000000000000014242C375898
        BCE730566C8627242129504A44546A625A6F6760586C49443F4D201E1C222A4C
        66864B83B1E7101E293700000000000000000000000000000000000000002542
        52655898BCE74C86A6CE2C4E637C0E1920280D181F28294B617C467CA1CE4F89
        B4E720394D650000000000000000000000000000000000000000000000000000
        000014242C3741738DAF599ABEEB63A7CDFD61A5CCFD5694BCEB3C6B89AF1220
        2B37000000000000000000000000000000000000000000000000}
      TabOrder = 1
      OnClick = btnFilterClick
    end
    object edIndex: TEdit
      Left = 312
      Top = 36
      Width = 121
      Height = 21
      TabOrder = 2
      Visible = False
    end
    object edID2: TEdit
      Left = 436
      Top = 36
      Width = 121
      Height = 21
      TabOrder = 3
      Visible = False
    end
    object edID: TEdit
      Left = 560
      Top = 36
      Width = 121
      Height = 21
      TabOrder = 4
      Visible = False
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 475
    Width = 758
    Height = 36
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    object lblInfo: TLabel
      Left = 754
      Top = 0
      Width = 4
      Height = 36
      Align = alRight
      Alignment = taCenter
      BiDiMode = bdRightToLeftNoAlign
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      Transparent = True
      Visible = False
      ExplicitHeight = 23
    end
    object dbnScheduler: TDBNavigator
      Left = 0
      Top = 0
      Width = 381
      Height = 36
      DataSource = dsQryList
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbRefresh]
      Align = alLeft
      Hints.Strings = (
        'First'
        'Previous'
        'Next'
        'Last'
        'Insert'
        'Delete'
        'Edit'
        'Post'
        'Cancel'
        'Refresh')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 73
    Width = 771
    Height = 396
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LevelTabs.Slants.Kind = skCutCorner
    LookAndFeel.Kind = lfOffice11
    object gtbScheduler: TcxGridDBBandedTableView
      OnKeyPress = gtbSchedulerKeyPress
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'SCHEDULER STAFF'
        end>
      object gtbSchedulerkodekaryawan: TcxGridDBBandedColumn
        DataBinding.FieldName = 'kodekaryawan'
        Width = 150
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gtbSchedulerkodeshift: TcxGridDBBandedColumn
        DataBinding.FieldName = 'kodeshift'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namashift'
          end>
        Properties.ListSource = dstblShift
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gtbSchedulertglmasuk: TcxGridDBBandedColumn
        DataBinding.FieldName = 'tglmasuk'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gtbSchedulerjmasuk: TcxGridDBBandedColumn
        DataBinding.FieldName = 'jmasuk'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gtbSchedulertglkeluar: TcxGridDBBandedColumn
        DataBinding.FieldName = 'tglkeluar'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object gtbSchedulerjkeluar: TcxGridDBBandedColumn
        DataBinding.FieldName = 'jkeluar'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object gtbSchedulerlasteditdate: TcxGridDBBandedColumn
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object gtbSchedulerlastedituser: TcxGridDBBandedColumn
        DataBinding.FieldName = 'lastedituser'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object gtbSchedulertagedit: TcxGridDBBandedColumn
        DataBinding.FieldName = 'tagedit'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object gtbScheduleridkaryawan: TcxGridDBBandedColumn
        DataBinding.FieldName = 'idkaryawan'
        Width = 125
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gtbSchedulernamakaryawan: TcxGridDBBandedColumn
        DataBinding.FieldName = 'namakaryawan'
        Width = 300
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbScheduler
    end
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      
        'select kodekaryawan, kodeshift, tglmasuk, jmasuk, tglkeluar, jke' +
        'luar, lasteditdate, lastedituser, tagedit, '
      
        '(select ben_hrd_karyawan_info.idkaryawan from ben_hrd_karyawan_i' +
        'nfo where ben_hrd_karyawan_info.kodekaryawan = ben_hrd_jadwal_lo' +
        'cal.kodekaryawan) as idkaryawan,'
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info where ben_hrd_karyawan_info.kodekaryawan = ben_hrd_jadwal_' +
        'local.kodekaryawan) as namakaryawan '
      'from ben_hrd_jadwal_local '
      'GROUP BY kodekaryawan ORDER BY tglmasuk DESC LIMIT 1000')
    Left = 52
    Top = 28
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 52
    Top = 88
  end
  object tblShift: TMyTable
    TableName = 'ben_shift'
    Connection = dmDB.dbInternal
    Left = 492
    Top = 12
  end
  object dstblShift: TDataSource
    DataSet = tblShift
    Left = 496
    Top = 64
  end
end
