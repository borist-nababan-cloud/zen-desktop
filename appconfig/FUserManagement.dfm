object frmUserManagement: TfrmUserManagement
  Left = 0
  Top = 0
  Caption = 'USER MANAGEMENT'
  ClientHeight = 597
  ClientWidth = 967
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    967
    597)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 416
    Width = 39
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'ID User'
  end
  object Label2: TLabel
    Left = 16
    Top = 445
    Width = 52
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 16
    Top = 474
    Width = 67
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Group Users'
  end
  object Label4: TLabel
    Left = 16
    Top = 503
    Width = 80
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Nama Lengkap'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 8
    Width = 945
    Height = 349
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gtbUser: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsTblUsers
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
      object gtbUseruserid: TcxGridDBColumn
        Caption = 'ID User'
        DataBinding.FieldName = 'userid'
        Width = 195
      end
      object gtbUserpassword: TcxGridDBColumn
        Caption = 'Password'
        DataBinding.FieldName = 'password'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecLowerCase
        Properties.EchoMode = eemPassword
        Width = 150
      end
      object gtbUseridkaryawan: TcxGridDBColumn
        Caption = 'ID Karyawan'
        DataBinding.FieldName = 'idkaryawan'
        Visible = False
        Width = 100
      end
      object gtbUserusergroupid: TcxGridDBColumn
        Caption = 'Group User'
        DataBinding.FieldName = 'usergroupid'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'idusersgroup'
        Properties.ListColumns = <
          item
            FieldName = 'namausersgroup'
          end>
        Properties.ListSource = dsTblGroup
        Width = 150
      end
      object gtbUserNama: TcxGridDBColumn
        Caption = 'Nama Lengkap'
        DataBinding.FieldName = 'namalengkap'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 250
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtbUser
    end
  end
  object edUser: TcxTextEdit
    Left = 120
    Top = 413
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecLowerCase
    TabOrder = 1
    Width = 250
  end
  object edPassword: TcxTextEdit
    Left = 120
    Top = 442
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecLowerCase
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 2
    Width = 250
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 371
    Width = 107
    Height = 31
    Anchors = [akLeft, akBottom]
    Caption = 'Edit Selected'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 6
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 156
    Top = 529
    Width = 107
    Height = 50
    Anchors = [akLeft, akBottom]
    Caption = 'SAVE / UPDATE'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Blue'
    TabOrder = 5
    OnClick = cxButton2Click
  end
  object edGroup: TcxLookupComboBox
    Left = 120
    Top = 471
    Anchors = [akLeft, akBottom]
    Properties.KeyFieldNames = 'idusersgroup'
    Properties.ListColumns = <
      item
        Caption = 'Group Users'
        SortOrder = soAscending
        FieldName = 'namausersgroup'
      end>
    Properties.ListSource = dsTblGroup
    TabOrder = 3
    Width = 250
  end
  object edNama: TcxTextEdit
    Left = 120
    Top = 500
    Anchors = [akLeft, akBottom]
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 250
  end
  object ckShow: TcxCheckBox
    Left = 384
    Top = 442
    Anchors = [akLeft, akBottom]
    Caption = 'Show Password'
    Properties.OnChange = ckShowPropertiesChange
    TabOrder = 7
  end
  object dsTblUsers: TDataSource
    DataSet = tblUsers
    Left = 632
    Top = 468
  end
  object tblUsers: TMyTable
    TableName = 'users'
    Connection = dmDB.dbInternal
    Left = 632
    Top = 412
  end
  object dsTblGroup: TDataSource
    DataSet = tblGroup
    Left = 708
    Top = 472
  end
  object tblGroup: TMyTable
    TableName = 'usersgroup'
    Connection = dmDB.dbInternal
    Left = 708
    Top = 416
  end
end
