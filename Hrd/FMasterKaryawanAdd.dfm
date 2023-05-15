object frmMasterKaryawanAdd: TfrmMasterKaryawanAdd
  Left = 0
  Top = 0
  Caption = '  List Karyawan  Add'
  ClientHeight = 575
  ClientWidth = 714
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    714
    575)
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 75
    Height = 15
    Caption = 'NIK Karyawan'
  end
  object Label3: TLabel
    Left = 8
    Top = 69
    Width = 84
    Height = 15
    Caption = 'Kode Karyawan'
  end
  object Label4: TLabel
    Left = 8
    Top = 98
    Width = 88
    Height = 15
    Caption = 'Nama Karyawan'
  end
  object Label5: TLabel
    Left = 8
    Top = 127
    Width = 36
    Height = 15
    Caption = 'Outlet'
  end
  object Label1: TLabel
    Left = 0
    Top = -6
    Width = 706
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '  List Karyawan  Add'
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
  object edKodekaryawan: TEdit
    Left = 108
    Top = 37
    Width = 193
    Height = 23
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 0
  end
  object edIdkaryawan: TEdit
    Left = 108
    Top = 66
    Width = 193
    Height = 23
    MaxLength = 5
    NumbersOnly = True
    TabOrder = 1
  end
  object edNamaKaryawan: TEdit
    Left = 108
    Top = 95
    Width = 353
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object ckAktif: TcxCheckBox
    Left = 8
    Top = 151
    Caption = 'Aktif'
    ParentFont = False
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 4
  end
  object btnSave: TButton
    Tag = 1
    Left = 332
    Top = 124
    Width = 105
    Height = 54
    Caption = 'Save'
    TabOrder = 5
    OnClick = btnSaveClick
  end
  object Button2: TButton
    Left = 443
    Top = 124
    Width = 70
    Height = 54
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = Button2Click
  end
  object pgKaryawanAdd: TcxPageControl
    Left = 8
    Top = 196
    Width = 698
    Height = 370
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 7
    Properties.ActivePage = pgInfo
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 367
    ClientRectLeft = 2
    ClientRectRight = 695
    ClientRectTop = 29
    object pgInfo: TcxTabSheet
      Caption = 'Info'
      ImageIndex = 0
      object Label6: TLabel
        Left = 4
        Top = 106
        Width = 108
        Height = 15
        Caption = 'Tanggal Masuk Kerja'
      end
      object Label16: TLabel
        Left = 4
        Top = 135
        Width = 70
        Height = 15
        Caption = 'Departemen'
      end
      object Label17: TLabel
        Left = 5
        Top = 167
        Width = 72
        Height = 15
        Caption = 'Type Kontrak'
      end
      object Label20: TLabel
        Left = 4
        Top = 196
        Width = 61
        Height = 15
        Caption = 'Nama Bank'
      end
      object Label21: TLabel
        Left = 3
        Top = 225
        Width = 72
        Height = 15
        Caption = 'No. Rekening'
      end
      object Label22: TLabel
        Left = 3
        Top = 254
        Width = 85
        Height = 15
        Caption = 'Nama Rekening'
      end
      object Label23: TLabel
        Left = 312
        Top = 106
        Width = 106
        Height = 15
        Caption = 'Akhir Masa Kontrak'
      end
      object ckJadwalTetap: TcxCheckBox
        Left = 3
        Top = 18
        Caption = 'Jadwal Tetap'
        ParentFont = False
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Properties.OnChange = ckJadwalTetapPropertiesChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 0
      end
      object edTglMasuk: TcxDateEdit
        Left = 118
        Top = 103
        EditValue = 0d
        TabOrder = 1
        Width = 189
      end
      object ckNonJadwal: TcxCheckBox
        Left = 3
        Top = 45
        Caption = 'Non Jadwal'
        ParentFont = False
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Properties.OnChange = ckNonJadwalPropertiesChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 2
      end
      object edKodeJadwal: TcxLookupComboBox
        Left = 118
        Top = 18
        Properties.KeyFieldNames = 'autonum'
        Properties.ListColumns = <
          item
            FieldName = 'namajadwal'
          end>
        Properties.ListSource = frmMasterKaryawan.dsTblJadwalTetap
        TabOrder = 3
        Width = 193
      end
      object edDepartemen: TcxLookupComboBox
        Left = 118
        Top = 132
        Properties.KeyFieldNames = 'id_departemen'
        Properties.ListColumns = <
          item
            FieldName = 'nama_departemen'
          end>
        Properties.ListSource = frmMasterKaryawan.dsTblDepartemen
        TabOrder = 4
        Width = 193
      end
      object edKodeKontrak: TcxLookupComboBox
        Left = 118
        Top = 164
        Properties.KeyFieldNames = 'kodekontrak'
        Properties.ListColumns = <
          item
            FieldName = 'namakontrak'
          end>
        Properties.ListSource = frmMasterKaryawan.dsTblKontrak
        Properties.ReadOnly = True
        TabOrder = 5
        Width = 193
      end
      object edBank: TComboBox
        Left = 118
        Top = 193
        Width = 193
        Height = 23
        TabOrder = 6
        Items.Strings = (
          'MANDIRI'
          'BCA'
          'NISP'
          'BNI'
          'BRI'
          'PERMATA')
      end
      object edNoRek: TEdit
        Left = 118
        Top = 222
        Width = 193
        Height = 23
        TabOrder = 7
      end
      object edNamaRekening: TEdit
        Left = 118
        Top = 251
        Width = 193
        Height = 23
        TabOrder = 8
      end
      object edEndKontrak: TcxDateEdit
        Left = 422
        Top = 103
        EditValue = 0d
        Properties.ReadOnly = True
        TabOrder = 9
        Width = 189
      end
      object ckJadwalharian: TcxCheckBox
        Left = 3
        Top = 70
        Caption = 'Jadwal Harian'
        ParentFont = False
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Properties.OnChange = ckJadwalharianPropertiesChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 10
      end
    end
    object pgDetails: TcxTabSheet
      Caption = 'Details'
      ImageIndex = 1
      object Label7: TLabel
        Left = 16
        Top = 41
        Width = 62
        Height = 15
        Caption = 'Alamat KTP'
      end
      object Label8: TLabel
        Left = 16
        Top = 69
        Width = 79
        Height = 15
        Caption = 'Alamat Tinggal'
      end
      object Label9: TLabel
        Left = 16
        Top = 98
        Width = 82
        Height = 15
        Caption = 'No Telp Rumah'
      end
      object Label10: TLabel
        Left = 16
        Top = 130
        Width = 82
        Height = 15
        Caption = 'No Handphone'
      end
      object Label11: TLabel
        Left = 16
        Top = 159
        Width = 71
        Height = 15
        Caption = 'Tempat Lahir'
      end
      object Label12: TLabel
        Left = 17
        Top = 187
        Width = 69
        Height = 15
        Caption = 'Tanggal Lahir'
      end
      object Label13: TLabel
        Left = 16
        Top = 249
        Width = 53
        Height = 15
        Caption = 'Gol Darah'
      end
      object Label14: TLabel
        Left = 16
        Top = 278
        Width = 71
        Height = 15
        Caption = 'Alamat Email'
      end
      object Label15: TLabel
        Left = 16
        Top = 215
        Width = 37
        Height = 15
        Caption = 'Agama'
      end
      object Label18: TLabel
        Left = 16
        Top = 305
        Width = 41
        Height = 15
        Caption = 'Gender'
      end
      object Label19: TLabel
        Left = 16
        Top = 12
        Width = 71
        Height = 15
        Caption = 'No KTP / SIM'
      end
      object edAlamatKtp: TEdit
        Left = 128
        Top = 38
        Width = 501
        Height = 23
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object edAlamatTinggal: TEdit
        Left = 128
        Top = 67
        Width = 501
        Height = 23
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edTelpHome: TEdit
        Left = 128
        Top = 96
        Width = 501
        Height = 23
        CharCase = ecUpperCase
        NumbersOnly = True
        TabOrder = 3
      end
      object edHape: TEdit
        Left = 128
        Top = 125
        Width = 501
        Height = 23
        NumbersOnly = True
        TabOrder = 4
      end
      object edTmptLahir: TEdit
        Left = 128
        Top = 154
        Width = 501
        Height = 23
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object edGoldar: TEdit
        Left = 128
        Top = 244
        Width = 501
        Height = 23
        CharCase = ecUpperCase
        TabOrder = 8
      end
      object edEmail: TEdit
        Left = 128
        Top = 273
        Width = 501
        Height = 23
        TabOrder = 9
      end
      object edTglLahir: TcxDateEdit
        Left = 128
        Top = 183
        EditValue = 0d
        TabOrder = 6
        Width = 193
      end
      object edAgama: TComboBox
        Left = 128
        Top = 212
        Width = 501
        Height = 23
        TabOrder = 7
        Items.Strings = (
          'ISLAM'
          'PROTESTAN'
          'KATHOLIK'
          'HINDU'
          'BUDHA'
          'LAINNYA')
      end
      object edSex: TComboBox
        Left = 128
        Top = 302
        Width = 501
        Height = 23
        TabOrder = 10
        Items.Strings = (
          'LAKI-LAKI'
          'PEREMPUAN')
      end
      object edNoKtp: TEdit
        Left = 128
        Top = 9
        Width = 501
        Height = 23
        NumbersOnly = True
        TabOrder = 0
      end
    end
  end
  object edOutlet: TcxLookupComboBox
    Left = 108
    Top = 124
    Properties.KeyFieldNames = 'kodeoutlet'
    Properties.ListColumns = <
      item
        FieldName = 'namaoutlet'
      end>
    Properties.ListSource = frmMasterKaryawan.dsTblOutlet
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 193
  end
  object btnCopyOld: TButton
    Left = 602
    Top = -2
    Width = 104
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Copy From Old'
    TabOrder = 8
    OnClick = btnCopyOldClick
  end
  object btnAutoNIK: TButton
    Left = 307
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Auto'
    TabOrder = 9
    OnClick = btnAutoNIKClick
  end
  object btnAutoKode: TButton
    Left = 307
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Auto'
    TabOrder = 10
    OnClick = btnAutoKodeClick
  end
  object ckAdmin: TcxCheckBox
    Left = 144
    Top = 151
    Caption = 'Is Admin'
    ParentFont = False
    Properties.ValueChecked = 'Y'
    Properties.ValueUnchecked = 'N'
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 11
  end
end
