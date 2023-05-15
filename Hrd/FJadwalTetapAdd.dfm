object frmJadwalTetapAdd: TfrmJadwalTetapAdd
  Left = 0
  Top = 0
  Caption = 'Jadwal Tetap Add'
  ClientHeight = 367
  ClientWidth = 367
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
    367
    367)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 212
    Height = 26
    Caption = '  JADWAL OUTLET TETAP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 60
    Width = 74
    Height = 13
    Caption = 'Nama Jadwal'
  end
  object Label2: TLabel
    Left = 16
    Top = 96
    Width = 31
    Height = 13
    Caption = 'Senin'
  end
  object Label3: TLabel
    Left = 16
    Top = 124
    Width = 37
    Height = 13
    Caption = 'Selasa'
  end
  object Label5: TLabel
    Left = 16
    Top = 151
    Width = 29
    Height = 13
    Caption = 'Rabu'
  end
  object Label6: TLabel
    Left = 16
    Top = 178
    Width = 34
    Height = 13
    Caption = 'Kamis'
  end
  object Label7: TLabel
    Left = 16
    Top = 205
    Width = 36
    Height = 13
    Caption = 'Jumat'
  end
  object Label8: TLabel
    Left = 16
    Top = 232
    Width = 33
    Height = 13
    Caption = 'Sabtu'
  end
  object Label9: TLabel
    Left = 16
    Top = 259
    Width = 41
    Height = 13
    Caption = 'Minggu'
  end
  object edNama: TEdit
    Left = 136
    Top = 57
    Width = 220
    Height = 21
    TabOrder = 0
  end
  object edSenin: TcxLookupComboBox
    Left = 136
    Top = 93
    Properties.KeyFieldNames = 'autonum'
    Properties.ListColumns = <
      item
        FieldName = 'namashift'
      end>
    Properties.ListSource = frmJadwalTetap.dsTblShift
    TabOrder = 1
    Width = 220
  end
  object edSelasa: TcxLookupComboBox
    Left = 136
    Top = 121
    Properties.KeyFieldNames = 'autonum'
    Properties.ListColumns = <
      item
        FieldName = 'namashift'
      end>
    Properties.ListSource = frmJadwalTetap.dsTblShift
    TabOrder = 2
    Width = 220
  end
  object edRabu: TcxLookupComboBox
    Left = 136
    Top = 148
    Properties.KeyFieldNames = 'autonum'
    Properties.ListColumns = <
      item
        FieldName = 'namashift'
      end>
    Properties.ListSource = frmJadwalTetap.dsTblShift
    TabOrder = 3
    Width = 220
  end
  object edKamis: TcxLookupComboBox
    Left = 136
    Top = 175
    Properties.KeyFieldNames = 'autonum'
    Properties.ListColumns = <
      item
        FieldName = 'namashift'
      end>
    Properties.ListSource = frmJadwalTetap.dsTblShift
    TabOrder = 4
    Width = 220
  end
  object edJumat: TcxLookupComboBox
    Left = 136
    Top = 202
    Properties.KeyFieldNames = 'autonum'
    Properties.ListColumns = <
      item
        FieldName = 'namashift'
      end>
    Properties.ListSource = frmJadwalTetap.dsTblShift
    TabOrder = 5
    Width = 220
  end
  object edSabtu: TcxLookupComboBox
    Left = 136
    Top = 229
    Properties.KeyFieldNames = 'autonum'
    Properties.ListColumns = <
      item
        FieldName = 'namashift'
      end>
    Properties.ListSource = frmJadwalTetap.dsTblShift
    TabOrder = 6
    Width = 220
  end
  object edMinggu: TcxLookupComboBox
    Left = 136
    Top = 256
    Properties.KeyFieldNames = 'autonum'
    Properties.ListColumns = <
      item
        FieldName = 'namashift'
      end>
    Properties.ListSource = frmJadwalTetap.dsTblShift
    TabOrder = 7
    Width = 220
  end
  object btnSimpan: TButton
    Left = 20
    Top = 300
    Width = 89
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'SAVE'
    TabOrder = 8
    OnClick = btnSimpanClick
  end
  object btnUpdate: TButton
    Left = 32
    Top = 300
    Width = 89
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'UPDATE'
    TabOrder = 9
    OnClick = btnUpdateClick
  end
  object Button1: TButton
    Left = 267
    Top = 296
    Width = 89
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel'
    TabOrder = 10
    OnClick = Button1Click
  end
end
