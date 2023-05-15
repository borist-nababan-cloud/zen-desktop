object frmLemburList: TfrmLemburList
  Left = 0
  Top = 0
  Caption = '  List Lembur Karyawan'
  ClientHeight = 319
  ClientWidth = 754
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
    754
    319)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = -2
    Top = -4
    Width = 755
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  Presensi List Lembur Karyawan'
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
  object Label2: TLabel
    Left = 8
    Top = 39
    Width = 76
    Height = 13
    Caption = 'Filter By Date'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 68
    Width = 738
    Height = 203
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbLembur: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsQryList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtbLemburnomorlembur: TcxGridDBColumn
        Caption = 'No. Lembur'
        DataBinding.FieldName = 'nomorlembur'
        Width = 100
      end
      object gtbLemburtglpengajuan: TcxGridDBColumn
        Caption = 'Tgl Pengajuan'
        DataBinding.FieldName = 'tglpengajuan'
        Width = 100
      end
      object gtbLemburkodekaryawan: TcxGridDBColumn
        Caption = 'NIK'
        DataBinding.FieldName = 'kodekaryawan'
        Width = 100
      end
      object gtbLemburtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 100
      end
      object gtbLemburidkaryawan: TcxGridDBColumn
        Caption = 'ID Finger'
        DataBinding.FieldName = 'idkaryawan'
        Width = 100
      end
      object gtbLemburnamakaryawan: TcxGridDBColumn
        Caption = 'Nama Karyawan'
        DataBinding.FieldName = 'namakaryawan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 200
      end
      object gtbLemburketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 100
      end
      object gtbLemburjstart: TcxGridDBColumn
        Caption = 'J. Start'
        DataBinding.FieldName = 'jstart'
        Width = 100
      end
      object gtbLemburjend: TcxGridDBColumn
        Caption = 'J. End'
        DataBinding.FieldName = 'jend'
        Width = 100
      end
      object gtbLemburjumlah: TcxGridDBColumn
        Caption = 'Jumlah'
        DataBinding.FieldName = 'jumlah'
        Width = 100
      end
      object gtbLemburlasteditdate: TcxGridDBColumn
        Caption = 'Last Edit Date'
        DataBinding.FieldName = 'lasteditdate'
        Width = 100
      end
      object gtbLemburlastedituser: TcxGridDBColumn
        Caption = 'Last Edit User'
        DataBinding.FieldName = 'lastedituser'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbLembur
    end
  end
  object btnRefresh: TButton
    Left = 8
    Top = 277
    Width = 89
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh'
    TabOrder = 1
    OnClick = btnRefreshClick
  end
  object btnCancelCuti: TButton
    Left = 640
    Top = 277
    Width = 106
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = 'Cancel Lembur'
    TabOrder = 2
    OnClick = btnCancelCutiClick
  end
  object btnAddCuti: TButton
    Left = 115
    Top = 277
    Width = 89
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'Add Lembur'
    TabOrder = 3
    OnClick = btnAddCutiClick
  end
  object btnCetakUlang: TButton
    Left = 210
    Top = 277
    Width = 89
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'Cetak Ulang'
    TabOrder = 4
    OnClick = btnCetakUlangClick
  end
  object edTanggal: TcxDateEdit
    Left = 108
    Top = 36
    EditValue = 0d
    TabOrder = 5
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
    TabOrder = 6
    OnClick = btnFilterClick
  end
  object qryList: TMyQuery
    Connection = dmDB.dbInternal
    SQL.Strings = (
      'select nomorlembur, tglpengajuan, kodekaryawan, tanggal, '
      
        '(select ben_hrd_karyawan_info.idkaryawan from ben_hrd_karyawan_i' +
        'nfo where ben_hrd_karyawan_info.kodekaryawan = ben_presensi_lemb' +
        'ur.kodekaryawan) as idkaryawan,'
      
        '(select ben_hrd_karyawan_info.namakaryawan from ben_hrd_karyawan' +
        '_info where ben_hrd_karyawan_info.kodekaryawan = ben_presensi_le' +
        'mbur.kodekaryawan) as namakaryawan,'
      'lastedituser, lasteditdate, keterangan, jstart, jend, jumlah'
      'from ben_presensi_lembur '
      'GROUP BY nomorlembur ORDER BY tanggal DESC LIMIT 1000')
    Left = 12
    Top = 76
  end
  object dsQryList: TDataSource
    DataSet = qryList
    Left = 12
    Top = 136
  end
end
