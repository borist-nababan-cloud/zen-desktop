object frmTRSpecs: TfrmTRSpecs
  Left = 309
  Top = 231
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Spesifikasi Therapist'
  ClientHeight = 170
  ClientWidth = 308
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 66
    Height = 15
    Caption = 'ID Teraphist'
    Transparent = True
  end
  object Label2: TLabel
    Left = 28
    Top = 88
    Width = 59
    Height = 15
    Caption = 'Spesifikasi'
    Transparent = True
  end
  object Label3: TLabel
    Left = 24
    Top = 64
    Width = 66
    Height = 15
    Caption = 'Departemen'
    Transparent = True
  end
  object Label4: TLabel
    Left = 4
    Top = 40
    Width = 86
    Height = 15
    Caption = 'Nama Teraphist'
    Transparent = True
  end
  object lcbKaryawanID: TcxLookupComboBox
    Left = 92
    Top = 12
    Properties.DropDownSizeable = True
    Properties.KeyFieldNames = 'id_therapist'
    Properties.ListColumns = <
      item
        MinWidth = 75
        Width = 75
        FieldName = 'id_therapist'
      end
      item
        MinWidth = 150
        FieldName = 'nama'
      end>
    Properties.ListSource = dmDB.dsTblTherapist
    Properties.OnChange = cxLookupComboBox1PropertiesChange
    TabOrder = 0
    Width = 200
  end
  object edSpecs: TcxComboBox
    Left = 92
    Top = 84
    Properties.CharCase = ecUpperCase
    Properties.Items.Strings = (
      'KUAT'
      'SEDANG')
    TabOrder = 1
    Text = 'PILIH SPESIFIKASI'
    Width = 200
  end
  object edNama: TcxTextEdit
    Left = 92
    Top = 36
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 200
  end
  object edDepartemen: TcxTextEdit
    Left = 92
    Top = 60
    Properties.ReadOnly = True
    TabOrder = 3
    Text = 'edDepartemen'
    Width = 200
  end
  object cxButton1: TcxButton
    Left = 100
    Top = 120
    Width = 109
    Height = 33
    Caption = 'Update'
    TabOrder = 4
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfOffice11
  end
end
