object frmHistoryMember: TfrmHistoryMember
  Left = 0
  Top = 0
  Caption = 'HISTORY TRANSAKSI MEBER'
  ClientHeight = 498
  ClientWidth = 905
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object lblCecker: TLabel
    Left = 8
    Top = 8
    Width = 30
    Height = 24
    Caption = '      '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 60
    Width = 93
    Height = 15
    Caption = 'Scan Kartu Di Sini'
  end
  object Label2: TLabel
    Left = 8
    Top = 89
    Width = 83
    Height = 15
    Caption = 'Nama Member'
  end
  object Label3: TLabel
    Left = 8
    Top = 118
    Width = 70
    Height = 15
    Caption = 'Jumlah Point'
  end
  object Label4: TLabel
    Left = 8
    Top = 159
    Width = 344
    Height = 15
    Caption = 'HISTORY TERSIMPAN START DARI TANGGAL 17 NOVEMBER 2014'
  end
  object btnCek: TButton
    Left = 328
    Top = 46
    Width = 105
    Height = 45
    Caption = 'CEK DATA'
    TabOrder = 0
    OnClick = btnCekClick
  end
  object edMemberID: TEdit
    Left = 132
    Top = 57
    Width = 173
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edMemberIDKeyPress
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 184
    Width = 889
    Height = 301
    TabOrder = 2
    object gtbHistory: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsServerCari
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
      object gtbHistorytrans_id: TcxGridDBColumn
        Caption = 'No. Transaksi'
        DataBinding.FieldName = 'trans_id'
        Width = 100
      end
      object gtbHistorytanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        SortIndex = 0
        SortOrder = soDescending
        Width = 100
      end
      object gtbHistorywaktu: TcxGridDBColumn
        Caption = 'Waktu'
        DataBinding.FieldName = 'waktu'
        PropertiesClassName = 'TcxTimeEditProperties'
        Width = 100
      end
      object gtbHistoryjumlah_trans: TcxGridDBColumn
        Caption = 'Jumlah [Rp.]'
        DataBinding.FieldName = 'jumlah_trans'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,#'
        Properties.UseThousandSeparator = True
        Width = 123
      end
      object gtbHistorypoint_a: TcxGridDBColumn
        Caption = 'P. Awal'
        DataBinding.FieldName = 'point_a'
        Width = 100
      end
      object gtbHistorypoint_t: TcxGridDBColumn
        Caption = 'P. Tambah'
        DataBinding.FieldName = 'point_t'
        Width = 100
      end
      object gtbHistorypoint_k: TcxGridDBColumn
        Caption = 'P. Kurang'
        DataBinding.FieldName = 'point_k'
        Width = 100
      end
      object gtbHistorypoint_end: TcxGridDBColumn
        Caption = 'P. Akhir'
        DataBinding.FieldName = 'point_end'
        Width = 100
      end
      object gtbHistoryid_outlet: TcxGridDBColumn
        Caption = 'Cabang'
        DataBinding.FieldName = 'id_outlet'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_outlet'
        Properties.ListColumns = <
          item
            FieldName = 'nama_outlet'
          end>
        Properties.ListSource = dsTblOutlet
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbHistory
    end
  end
  object edNama: TEdit
    Left = 132
    Top = 86
    Width = 173
    Height = 23
    Enabled = False
    TabOrder = 3
  end
  object edTotPoint: TcxCalcEdit
    Left = 132
    Top = 115
    EditValue = 0.000000000000000000
    Enabled = False
    TabOrder = 4
    Width = 173
  end
  object dsServerCari: TDataSource
    DataSet = ServerCari
    Left = 724
    Top = 84
  end
  object dsTblOutlet: TDataSource
    DataSet = TblOutlet
    Left = 600
    Top = 92
  end
  object dbOnline: TMyConnection
    Left = 488
    Top = 56
  end
  object ServerCari: TMyQuery
    Connection = dbOnline
    Left = 724
    Top = 36
  end
  object ServerSearch: TMyQuery
    Connection = dbOnline
    Left = 836
    Top = 28
  end
  object TblOutlet: TMyTable
    Connection = dbOnline
    Left = 596
    Top = 36
  end
end
