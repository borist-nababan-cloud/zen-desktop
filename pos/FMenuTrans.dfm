object frmMenuTrans: TfrmMenuTrans
  Left = 295
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 700
  ClientWidth = 900
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    900
    700)
  PixelsPerInch = 96
  TextHeight = 15
  object lblPaketID: TLabel
    Left = 416
    Top = 433
    Width = 47
    Height = 15
    Caption = 'PAKET ID'
    Transparent = True
  end
  object Label1: TLabel
    Left = 48
    Top = 437
    Width = 39
    Height = 15
    Caption = 'Jasa ID'
    Transparent = True
  end
  object Label2: TLabel
    Left = 28
    Top = 460
    Width = 59
    Height = 15
    Caption = 'Jasa Nama'
    Transparent = True
  end
  object Waktu: TLabel
    Left = 48
    Top = 508
    Width = 36
    Height = 15
    Caption = 'Waktu'
    Transparent = True
  end
  object Label3: TLabel
    Left = 52
    Top = 532
    Width = 33
    Height = 15
    Caption = 'Harga'
    Transparent = True
  end
  object Label4: TLabel
    Left = 40
    Top = 580
    Width = 46
    Height = 15
    Caption = 'Room ID'
    Transparent = True
  end
  object Label7: TLabel
    Left = 16
    Top = 603
    Width = 67
    Height = 15
    Caption = 'Therapist ID'
    Transparent = True
  end
  object Label8: TLabel
    Left = 4
    Top = 484
    Width = 83
    Height = 15
    Caption = 'Aroma Therapy'
    Transparent = True
  end
  object Label9: TLabel
    Left = 4
    Top = 556
    Width = 82
    Height = 15
    Caption = 'Discount Paket'
    Transparent = True
  end
  object Label6: TLabel
    Left = 284
    Top = 634
    Width = 345
    Height = 19
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Gunakan Control (CTRL) Untuk Shortcut'
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object pgControl: TcxPageControl
    Left = 0
    Top = 0
    Width = 900
    Height = 429
    Align = alTop
    TabOrder = 10
    Properties.ActivePage = pgTherapist
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfOffice11
    ClientRectBottom = 426
    ClientRectLeft = 2
    ClientRectRight = 897
    ClientRectTop = 29
    object pgJasa: TcxTabSheet
      Caption = 'MENU JASA'
      ImageIndex = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        895
        397)
      object Label10: TLabel
        Left = 180
        Top = 350
        Width = 345
        Height = 19
        Anchors = [akLeft, akBottom]
        AutoSize = False
        Caption = 'Gunakan SHIFT + A Untuk Ke Data Awal'
        Color = clHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentColor = False
        ParentFont = False
        ExplicitTop = 356
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 895
        Height = 329
        Align = alTop
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        ExplicitWidth = 892
        object gtbMenu: TcxGridDBBandedTableView
          Navigator.Buttons.CustomButtons = <>
          OnCellDblClick = gtbMenuCellDblClick
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.IncSearch = True
          OptionsBehavior.ImmediateEditor = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Bands = <
            item
              Caption = 'DAFTAR MENU'
              Width = 628
            end>
          object gtbMenumenu_id: TcxGridDBBandedColumn
            DataBinding.FieldName = 'menu_id'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object gtbMenujasa_master_id: TcxGridDBBandedColumn
            DataBinding.FieldName = 'jasa_master_id'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object gtbMenujenis_jasa_id: TcxGridDBBandedColumn
            DataBinding.FieldName = 'jenis_jasa_id'
            Visible = False
            Width = 125
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object gtbMenunama_menu: TcxGridDBBandedColumn
            Caption = 'Menu'
            DataBinding.FieldName = 'nama_menu'
            HeaderAlignmentHorz = taCenter
            Width = 270
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object gtbMenustart_date: TcxGridDBBandedColumn
            DataBinding.FieldName = 'start_date'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object gtbMenuend_date: TcxGridDBBandedColumn
            DataBinding.FieldName = 'end_date'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object gtbMenustart_time: TcxGridDBBandedColumn
            DataBinding.FieldName = 'start_time'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object gtbMenuend_time: TcxGridDBBandedColumn
            DataBinding.FieldName = 'end_time'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object gtbMenuharga: TcxGridDBBandedColumn
            Caption = 'Harga'
            DataBinding.FieldName = 'harga'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.DisplayFormat = '#,#'
            HeaderAlignmentHorz = taCenter
            Width = 119
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object gtbMenuwaktu: TcxGridDBBandedColumn
            Caption = 'Lama'
            DataBinding.FieldName = 'waktu'
            HeaderAlignmentHorz = taCenter
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object gtbMenudisc_value: TcxGridDBBandedColumn
            DataBinding.FieldName = 'disc_value'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object gtbMenudisc_percent: TcxGridDBBandedColumn
            DataBinding.FieldName = 'disc_percent'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object gtbMenusubtotal: TcxGridDBBandedColumn
            Caption = 'Subtotal'
            DataBinding.FieldName = 'subtotal'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.DisplayFormat = '#,#'
            HeaderAlignmentHorz = taCenter
            Width = 119
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object gtbMenunotes: TcxGridDBBandedColumn
            DataBinding.FieldName = 'notes'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object gtbMenuaktif: TcxGridDBBandedColumn
            DataBinding.FieldName = 'aktif'
            Visible = False
            Width = 20
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = gtbMenu
        end
      end
      object btnSelectMenu: TcxButton
        Left = 4
        Top = 329
        Width = 169
        Height = 57
        Hint = 'PILIH JASA (CTRL + J)'
        Anchors = [akLeft, akBottom]
        Caption = 'SELECT (J)'
        LookAndFeel.Kind = lfOffice11
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnSelectMenuClick
        ExplicitTop = 331
      end
    end
    object pgROOM: TcxTabSheet
      Caption = 'RUANGAN'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        895
        397)
      object Label11: TLabel
        Left = 424
        Top = 358
        Width = 345
        Height = 19
        Anchors = [akLeft, akBottom]
        AutoSize = False
        Caption = 'Gunakan SHIFT + R Untuk Ke Data Awal'
        Color = clHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentColor = False
        ParentFont = False
        ExplicitTop = 364
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 895
        Height = 345
        Align = alTop
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        ExplicitWidth = 892
        object gtbRoom: TcxGridDBBandedTableView
          OnDblClick = gtbRoomDblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.IncSearch = True
          OptionsBehavior.ImmediateEditor = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.Footer = True
          OptionsView.Indicator = True
          Bands = <
            item
              Caption = 'AVAILABLE ROOM'
              Width = 489
            end>
          object gtbRoomruangan_id: TcxGridDBBandedColumn
            Caption = 'ID RUANGAN'
            DataBinding.FieldName = 'ruangan_id'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 133
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object gtbRoomlantai: TcxGridDBBandedColumn
            DataBinding.FieldName = 'lantai'
            Visible = False
            Width = 45
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object gtbRoomnomor: TcxGridDBBandedColumn
            DataBinding.FieldName = 'nomor'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object gtbRoomjenis_jasa: TcxGridDBBandedColumn
            Caption = 'JENIS JASA'
            DataBinding.FieldName = 'jenis_jasa'
            HeaderAlignmentHorz = taCenter
            Width = 95
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object gtbRoomnotes: TcxGridDBBandedColumn
            Caption = 'KETERANGAN'
            DataBinding.FieldName = 'notes'
            HeaderAlignmentHorz = taCenter
            Width = 129
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object gtbRoomkondisi: TcxGridDBBandedColumn
            DataBinding.FieldName = 'kondisi'
            Visible = False
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object gtbRoomnama_cust: TcxGridDBBandedColumn
            DataBinding.FieldName = 'nama_cust'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object gtbRoomstart_time: TcxGridDBBandedColumn
            DataBinding.FieldName = 'start_time'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object gtbRoomend_time: TcxGridDBBandedColumn
            Caption = 'END TIME'
            DataBinding.FieldName = 'end_time'
            HeaderAlignmentHorz = taCenter
            Width = 68
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object gtbRoomtherapist_id: TcxGridDBBandedColumn
            DataBinding.FieldName = 'therapist_id'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object gtbRoomtrans_id: TcxGridDBBandedColumn
            DataBinding.FieldName = 'trans_id'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object gtbRoomstatus: TcxGridDBBandedColumn
            Caption = 'STATUS'
            DataBinding.FieldName = 'status'
            HeaderAlignmentHorz = taCenter
            Width = 64
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = gtbRoom
        end
      end
      object btnAll: TcxButton
        Left = 284
        Top = 345
        Width = 133
        Height = 41
        Hint = 'CTRL + L'
        Anchors = [akLeft, akBottom]
        Caption = 'View All Room (L)'
        LookAndFeel.Kind = lfOffice11
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnAllClick
        ExplicitTop = 347
      end
      object btnAvailable: TcxButton
        Left = 152
        Top = 345
        Width = 129
        Height = 41
        Hint = 'CTRL+W'
        Anchors = [akLeft, akBottom]
        Caption = 'View Available (W)'
        LookAndFeel.Kind = lfOffice11
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnAvailableClick
        ExplicitTop = 347
      end
      object btnSelectRoom: TcxButton
        Left = 8
        Top = 345
        Width = 121
        Height = 41
        Hint = 'PILIH ROOM (CTRL+O)'
        Anchors = [akLeft, akBottom]
        Caption = 'Select Room (O)'
        LookAndFeel.Kind = lfOffice11
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnSelectRoomClick
        ExplicitTop = 347
      end
    end
    object pgTherapist: TcxTabSheet
      Caption = 'THERAPIST'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object XiPanel1: TPanel
        Left = 0
        Top = 0
        Width = 892
        Height = 399
        Align = alClient
        TabOrder = 0
        DesignSize = (
          895
          397)
        object Label5: TLabel
          Left = 1
          Top = 1
          Width = 893
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'AVAILABLE THERAPIST'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 150
        end
        object Label12: TLabel
          Left = 284
          Top = 350
          Width = 345
          Height = 19
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Caption = 'Gunakan SHIFT + T Untuk Ke Data Awal'
          Color = clHighlight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          ExplicitTop = 356
        end
        object cxGrid3: TcxGrid
          Left = 1
          Top = 20
          Width = 893
          Height = 273
          Align = alTop
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          ExplicitWidth = 890
          object gtbTherapist: TcxGridDBBandedTableView
            OnDblClick = gtbTherapistDblClick
            Navigator.Buttons.CustomButtons = <>
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsBehavior.ImmediateEditor = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.Footer = True
            OptionsView.Indicator = True
            Bands = <
              item
                Caption = 'AVAILABLE THERAPIST'
              end>
            object gtbTherapistid_therapist: TcxGridDBBandedColumn
              Caption = 'ID'
              DataBinding.FieldName = 'id_therapist'
              Width = 75
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object gtbTherapistdepartemen: TcxGridDBBandedColumn
              DataBinding.FieldName = 'departemen'
              Visible = False
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object gtbTherapistnama: TcxGridDBBandedColumn
              Caption = 'Nama'
              DataBinding.FieldName = 'nama'
              Width = 125
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object gtbTherapistno_urut: TcxGridDBBandedColumn
              Caption = 'NO Urut'
              DataBinding.FieldName = 'no_urut'
              SortIndex = 2
              SortOrder = soAscending
              Width = 50
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object gtbTherapisttanggal: TcxGridDBBandedColumn
              DataBinding.FieldName = 'tanggal'
              Visible = False
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object gtbTherapistwaktu_masuk: TcxGridDBBandedColumn
              DataBinding.FieldName = 'waktu_masuk'
              Visible = False
              Position.BandIndex = 0
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object gtbTherapiststatus: TcxGridDBBandedColumn
              DataBinding.FieldName = 'status'
              Visible = False
              GroupIndex = 0
              Width = 100
              Position.BandIndex = 0
              Position.ColIndex = 12
              Position.RowIndex = 0
            end
            object gtbTherapiststart_time: TcxGridDBBandedColumn
              DataBinding.FieldName = 'start_time'
              Visible = False
              Position.BandIndex = 0
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
            object gtbTherapistend_time: TcxGridDBBandedColumn
              Caption = 'End Time'
              DataBinding.FieldName = 'end_time'
              PropertiesClassName = 'TcxTimeEditProperties'
              Position.BandIndex = 0
              Position.ColIndex = 11
              Position.RowIndex = 0
            end
            object gtbTherapistroom_id: TcxGridDBBandedColumn
              Caption = 'Ruangan'
              DataBinding.FieldName = 'room_id'
              Width = 100
              Position.BandIndex = 0
              Position.ColIndex = 10
              Position.RowIndex = 0
            end
            object gtbTherapistCounter: TcxGridDBBandedColumn
              Caption = 'Jumlah Jasa'
              DataBinding.ValueType = 'String'
              PropertiesClassName = 'TcxTextEditProperties'
              SortIndex = 1
              SortOrder = soAscending
              Width = 90
              Position.BandIndex = 0
              Position.ColIndex = 8
              Position.RowIndex = 0
            end
            object gtbTherapistSchedule: TcxGridDBBandedColumn
              Caption = 'Schedule'
              DataBinding.ValueType = 'String'
              PropertiesClassName = 'TcxTextEditProperties'
              SortIndex = 0
              SortOrder = soAscending
              Width = 106
              Position.BandIndex = 0
              Position.ColIndex = 9
              Position.RowIndex = 0
            end
            object gtbTherapistFlag: TcxGridDBBandedColumn
              Caption = '...'
              PropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.CustomColors = <>
              Width = 24
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
          end
          object gtvTherapist: TcxGridTableView
            OnDblClick = gtvTherapistDblClick
            Navigator.Buttons.CustomButtons = <>
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.Footer = True
            OptionsView.Indicator = True
            object gtvTherapistFlag: TcxGridColumn
              Caption = '...'
              PropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.CustomColors = <>
              Properties.ShowDescriptions = False
              HeaderAlignmentHorz = taCenter
              Width = 20
            end
            object gtvTherapistUrutan: TcxGridColumn
              Caption = 'No. '
              DataBinding.ValueType = 'Integer'
              PropertiesClassName = 'TcxCalcEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              SortIndex = 1
              SortOrder = soAscending
              Width = 40
            end
            object gtvTherapistID: TcxGridColumn
              Caption = 'ID '
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 83
            end
            object gtvTherapistSchedule: TcxGridColumn
              Caption = 'Schedule Masuk'
              DataBinding.ValueType = 'DateTime'
              PropertiesClassName = 'TcxTimeEditProperties'
              Visible = False
              GroupIndex = 0
              HeaderAlignmentHorz = taCenter
              SortIndex = 0
              SortOrder = soAscending
              Styles.GroupSummary = cxStyle1
              Width = 103
            end
            object gtvTherapistDepartemen: TcxGridColumn
              Caption = 'Dept'
              HeaderAlignmentHorz = taCenter
              Width = 89
            end
            object gtvTherapistNama: TcxGridColumn
              Caption = 'Nama'
              HeaderAlignmentHorz = taCenter
              Width = 119
            end
            object gtvTherapistStatus: TcxGridColumn
              Caption = 'Status'
              HeaderAlignmentHorz = taCenter
              Width = 110
            end
            object gtvTherapistCounter: TcxGridColumn
              Caption = 'Count'
              PropertiesClassName = 'TcxCalcEditProperties'
              HeaderAlignmentHorz = taCenter
              SortIndex = 2
              SortOrder = soAscending
              Width = 116
            end
            object gtvTherapistType: TcxGridColumn
              Caption = 'Type'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gtvTherapistSex: TcxGridColumn
              Caption = 'Sex'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 52
            end
            object gtvTherapistEndTime: TcxGridColumn
              Caption = 'End Time'
              DataBinding.ValueType = 'DateTime'
              PropertiesClassName = 'TcxTimeEditProperties'
              HeaderAlignmentHorz = taCenter
            end
            object gtvTherapistTest: TcxGridColumn
              Caption = 'Test'
              Visible = False
              Width = 60
            end
          end
          object cxGrid3Level1: TcxGridLevel
            GridView = gtvTherapist
          end
        end
        object btnSelectTR: TcxButton
          Left = 8
          Top = 300
          Width = 129
          Height = 37
          Hint = 'CTRL+D'
          Caption = '* SELECT (D)'
          LookAndFeel.Kind = lfOffice11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnSelectTRClick
        end
        object cxButton6: TcxButton
          Left = 624
          Top = 300
          Width = 129
          Height = 37
          Caption = 'AUTO SELECT TR / TB'
          LookAndFeel.Kind = lfOffice11
          TabOrder = 2
          Visible = False
          OnClick = cxButton6Click
        end
        object cxButton7: TcxButton
          Left = 760
          Top = 300
          Width = 129
          Height = 37
          Caption = 'MALE'
          DropDownMenu = pmMale
          Kind = cxbkDropDown
          LookAndFeel.Kind = lfOffice11
          TabOrder = 3
          Visible = False
        end
        object cxButton10: TcxButton
          Left = 492
          Top = 300
          Width = 129
          Height = 37
          Caption = 'VIEW AVAILABLE'
          LookAndFeel.Kind = lfOffice11
          TabOrder = 4
          Visible = False
        end
        object btnAllTR: TcxButton
          Left = 6
          Top = 340
          Width = 131
          Height = 37
          Hint = 'CTRL+K'
          Caption = 'VIEW ALL (K)'
          LookAndFeel.Kind = lfOffice11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnAllTRClick
        end
        object btnCount: TcxButton
          Left = 496
          Top = 340
          Width = 75
          Height = 25
          Caption = 'Count'
          TabOrder = 6
          Visible = False
        end
        object btnViewTR: TcxButton
          Left = 142
          Top = 340
          Width = 131
          Height = 37
          Hint = 'CTRL+Q'
          Caption = 'VIEW AVAILABLE (Q)'
          LookAndFeel.Kind = lfOffice11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = btnViewTRClick
        end
      end
    end
  end
  object edJasaID: TcxTextEdit
    Left = 88
    Top = 433
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 200
  end
  object edJasaNama: TcxTextEdit
    Left = 88
    Top = 456
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 200
  end
  object edLama: TcxCalcEdit
    Left = 88
    Top = 504
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 3
    Width = 200
  end
  object edHarga: TcxCalcEdit
    Left = 88
    Top = 528
    EditValue = 0
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    TabOrder = 4
    Width = 200
  end
  object edRoomID: TcxTextEdit
    Left = 88
    Top = 576
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 6
    Width = 200
  end
  object edTherapist: TcxTextEdit
    Left = 88
    Top = 599
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 200
  end
  object btnFinish: TcxButton
    Left = 32
    Top = 627
    Width = 121
    Height = 37
    Hint = 'SELESAI (CTRL + I)'
    Caption = 'FINISH'
    Default = True
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
    OnClick = btnFinishClick
  end
  object edAroma: TcxLookupComboBox
    Left = 88
    Top = 480
    Properties.CharCase = ecUpperCase
    Properties.KeyFieldNames = 'nama_aroma'
    Properties.ListColumns = <
      item
        FieldName = 'nama_aroma'
      end>
    TabOrder = 2
    Width = 200
  end
  object edDiscount: TcxCalcEdit
    Left = 88
    Top = 552
    EditValue = 0
    Properties.ReadOnly = False
    Properties.UseThousandSeparator = True
    TabOrder = 5
    Width = 200
  end
  object btnCancel: TcxButton
    Left = 156
    Top = 627
    Width = 121
    Height = 37
    Hint = 'BATAL (CTRL+N)'
    Caption = 'CANCEL'
    LookAndFeel.Kind = lfOffice11
    ParentShowHint = False
    ShowHint = False
    TabOrder = 9
    OnClick = btnCancelClick
  end
  object pmMale: TPopupMenu
    Left = 264
    Top = 324
    object mnuMaleKuat: TMenuItem
      Caption = 'KUAT'
      OnClick = mnuMaleKuatClick
    end
    object mnuMaleSedang: TMenuItem
      Caption = 'SEDANG'
      OnClick = mnuMaleSedangClick
    end
  end
  object pmFemale: TPopupMenu
    Left = 228
    Top = 324
    object mnuFemaleKuat: TMenuItem
      Caption = 'KUAT'
      OnClick = mnuFemaleKuatClick
    end
    object mnuFemaleSedang: TMenuItem
      Caption = 'SEDANG'
      OnClick = mnuFemaleSedangClick
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Scalable = True
    Left = 664
    Top = 36
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clGradientActiveCaption
      TextColor = clGradientActiveCaption
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnShortCut = ApplicationEvents1ShortCut
    Left = 528
    Top = 488
  end
end
