object frmMemberList: TfrmMemberList
  Left = 0
  Top = 0
  ClientHeight = 582
  ClientWidth = 966
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    966
    582)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 932
    Height = 25
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'LIST MEMBER ALL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 835
    Top = 97
    Width = 113
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'LIST MEMBER LOCAL'
  end
  object Label3: TLabel
    Left = 16
    Top = 97
    Width = 162
    Height = 13
    Caption = 'LIST MEMBER ONLINE SERVER'
  end
  object lblCecker: TLabel
    Left = 939
    Top = 48
    Width = 9
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = '...'
  end
  object cxGrid1: TcxGrid
    Left = 16
    Top = 116
    Width = 453
    Height = 440
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    object gtbServer: TcxGridDBTableView
      PopupMenu = pmServer
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsServerListMember
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 Members'
          Kind = skCount
          Column = gtbServerno_kartu
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbServerno_kartu: TcxGridDBColumn
        Caption = 'NO. KARTU'
        DataBinding.FieldName = 'no_kartu'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbServerid_members: TcxGridDBColumn
        Caption = 'ID MEMBERS'
        DataBinding.FieldName = 'id_members'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Width = 100
      end
      object gtbServernama_lengkap: TcxGridDBColumn
        Caption = 'NAMA LENGKAP'
        DataBinding.FieldName = 'nama_lengkap'
        Width = 250
      end
      object gtbServertanggal_lahir: TcxGridDBColumn
        Caption = 'TGL. LAHIR'
        DataBinding.FieldName = 'tanggal_lahir'
        Width = 100
      end
      object gtbServertot_point: TcxGridDBColumn
        Caption = 'TOT. POINT'
        DataBinding.FieldName = 'tot_point'
        Width = 100
      end
      object gtbServerno_telepon: TcxGridDBColumn
        Caption = 'NO. TELP'
        DataBinding.FieldName = 'no_telepon'
        Width = 100
      end
      object gtbServerno_handphone: TcxGridDBColumn
        Caption = 'NO. HANDPHONE'
        DataBinding.FieldName = 'no_handphone'
        Width = 100
      end
      object gtbServeralamat: TcxGridDBColumn
        Caption = 'ALAMAT'
        DataBinding.FieldName = 'alamat'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 250
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbServer
    end
  end
  object cxGrid2: TcxGrid
    Left = 492
    Top = 116
    Width = 456
    Height = 440
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object gtbLocal: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 Members'
          Kind = skCount
          Column = gtbLocalno_kartu
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gtbLocalid_members: TcxGridDBColumn
        Caption = 'ID MEMBERS'
        DataBinding.FieldName = 'id_members'
        Visible = False
        Width = 100
      end
      object gtbLocalno_kartu: TcxGridDBColumn
        Caption = 'NO. KARTU'
        DataBinding.FieldName = 'no_kartu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbLocalnama_lengkap: TcxGridDBColumn
        Caption = 'NAMA LENGKAP'
        DataBinding.FieldName = 'nama_lengkap'
        Width = 250
      end
      object gtbLocaltanggal: TcxGridDBColumn
        Caption = 'TANGGAL'
        DataBinding.FieldName = 'tanggal'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbLocalexpired_date: TcxGridDBColumn
        Caption = 'EXPIRED DATE'
        DataBinding.FieldName = 'expired_date'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbLocalalamat: TcxGridDBColumn
        Caption = 'ALAMAT'
        DataBinding.FieldName = 'alamat'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 100
      end
      object gtbLocalid_type: TcxGridDBColumn
        Caption = 'IDENTITAS'
        DataBinding.FieldName = 'id_type'
        Width = 100
      end
      object gtbLocalid_identity: TcxGridDBColumn
        Caption = 'NO IDENTITAS'
        DataBinding.FieldName = 'id_identity'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbLocaltempat_lahir: TcxGridDBColumn
        Caption = 'TEMPAT LAHIR'
        DataBinding.FieldName = 'tempat_lahir'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbLocaltanggal_lahir: TcxGridDBColumn
        Caption = 'TGL LAHIR'
        DataBinding.FieldName = 'tanggal_lahir'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 100
      end
      object gtbLocaljenis_kelamin: TcxGridDBColumn
        Caption = 'KELAMIN'
        DataBinding.FieldName = 'jenis_kelamin'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbLocaltot_point: TcxGridDBColumn
        Caption = 'POINT'
        DataBinding.FieldName = 'tot_point'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object gtbLocalmembers_type: TcxGridDBColumn
        Caption = 'TYPE'
        DataBinding.FieldName = 'members_type'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbLocalno_telepon: TcxGridDBColumn
        Caption = 'FIX LINE'
        DataBinding.FieldName = 'no_telepon'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
      object gtbLocalno_handphone: TcxGridDBColumn
        Caption = 'HANDPHONE'
        DataBinding.FieldName = 'no_handphone'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = gtbLocal
    end
  end
  object btnLoad: TButton
    Left = 16
    Top = 48
    Width = 125
    Height = 43
    Caption = 'LOAD ONLINE'
    TabOrder = 2
    OnClick = btnLoadClick
  end
  object btnCopy: TButton
    Left = 500
    Top = 48
    Width = 125
    Height = 43
    Caption = 'COPY FROM SERVER'
    Enabled = False
    TabOrder = 3
    OnClick = btnCopyClick
  end
  object pmServer: TPopupMenu
    Left = 680
    Top = 48
    object EDITDATA1: TMenuItem
      Caption = 'EDIT DATA'
      OnClick = EDITDATA1Click
    end
  end
  object dsServerListMember: TDataSource
    Left = 336
    Top = 4
  end
  object dsServerSearch: TDataSource
    Left = 76
    Top = 8
  end
end
