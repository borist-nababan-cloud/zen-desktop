object frmPesan: TfrmPesan
  Left = 387
  Top = 152
  Width = 688
  Height = 511
  Caption = 'frmPesan'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 672
    Height = 432
    Align = alClient
    Color = clSkyBlue
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 670
      Height = 430
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object gtvBooking: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dmDB.dsqryBooking
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellMultiSelect = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object gtvBookingid_booking: TcxGridDBColumn
          Caption = 'No. Booking'
          DataBinding.FieldName = 'id_booking'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Width = 89
        end
        object gtvBookingtanggal: TcxGridDBColumn
          DataBinding.FieldName = 'tanggal'
          Visible = False
          Width = 100
        end
        object gtvBookingtgl_booking: TcxGridDBColumn
          Caption = 'Tanggal'
          DataBinding.FieldName = 'tgl_booking'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Width = 78
        end
        object gtvBookingjam_booking: TcxGridDBColumn
          Caption = 'Jam Booking'
          DataBinding.FieldName = 'jam_booking'
          Width = 84
        end
        object gtvBookingnama: TcxGridDBColumn
          Caption = 'Nama'
          DataBinding.FieldName = 'nama'
          Width = 132
        end
        object gtvBookingno_telp: TcxGridDBColumn
          Caption = 'No.Telp'
          DataBinding.FieldName = 'no_telp'
          Width = 112
        end
        object gtvBookingjumlah: TcxGridDBColumn
          Caption = 'Jumlah'
          DataBinding.FieldName = 'jumlah'
          Width = 65
        end
        object gtvBookingnotes: TcxGridDBColumn
          Caption = 'Keterangan'
          DataBinding.FieldName = 'notes'
          Width = 100
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = gtvBooking
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 41
    Align = alTop
    Color = clSkyBlue
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 557
      Height = 29
      AutoSize = False
      Caption = '....Daftar Booking'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel3: TPanel
      Left = 580
      Top = 1
      Width = 91
      Height = 39
      Align = alRight
      Color = clSkyBlue
      TabOrder = 0
      DesignSize = (
        91
        39)
      object btnExport: TcxButton
        Left = 0
        Top = 4
        Width = 91
        Height = 33
        Anchors = [akRight, akBottom]
        Caption = 'Export'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
      end
    end
  end
  object dlgSave: TSaveDialog
    Left = 424
    Top = 8
  end
end
