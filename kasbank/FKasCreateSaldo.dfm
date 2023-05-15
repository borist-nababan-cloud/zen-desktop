object frmKasCreateSaldo: TfrmKasCreateSaldo
  Left = 0
  Top = 0
  ClientHeight = 344
  ClientWidth = 378
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
    378
    344)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 85
    Width = 351
    Height = 108
    Brush.Color = clMoneyGreen
    Pen.Style = psDot
  end
  object Label1: TLabel
    Left = 40
    Top = 100
    Width = 88
    Height = 13
    Caption = 'Last Date Saldo'
  end
  object Label2: TLabel
    Left = 8
    Top = 4
    Width = 356
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '.: Update Saldo Kas Kecil :.'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 505
  end
  object Label10: TLabel
    Left = 8
    Top = 51
    Width = 64
    Height = 13
    Caption = ' Select Kas '
  end
  object Label3: TLabel
    Left = 40
    Top = 127
    Width = 50
    Height = 13
    Caption = 'User Edit'
  end
  object Label4: TLabel
    Left = 40
    Top = 154
    Width = 31
    Height = 13
    Caption = 'Saldo'
  end
  object Label5: TLabel
    Left = 24
    Top = 212
    Width = 88
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Last Date Saldo'
  end
  object Label6: TLabel
    Left = 24
    Top = 239
    Width = 31
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Saldo'
  end
  object edTypeKas: TcxLookupComboBox
    Left = 116
    Top = 47
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'kodekas'
    Properties.ListColumns = <
      item
        FieldName = 'namakas'
      end>
    Properties.ListSource = dsTblKas
    Properties.OnChange = edTypeKasPropertiesChange
    TabOrder = 0
    Width = 243
  end
  object edLastDate: TcxDateEdit
    Left = 148
    Top = 97
    EditValue = 0d
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 185
  end
  object edlastUser: TEdit
    Left = 148
    Top = 124
    Width = 185
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edLastValue: TcxCalcEdit
    Left = 148
    Top = 151
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 185
  end
  object edTanggal: TcxDateEdit
    Left = 132
    Top = 209
    Anchors = [akLeft, akBottom]
    EditValue = 0d
    Properties.ReadOnly = False
    TabOrder = 4
    Width = 185
  end
  object edNilai: TcxCalcEdit
    Left = 132
    Top = 236
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Properties.ReadOnly = False
    TabOrder = 5
    Width = 185
  end
  object btnUpdate: TButton
    Left = 40
    Top = 275
    Width = 92
    Height = 50
    Anchors = [akLeft, akBottom]
    Caption = 'UPDATE'
    TabOrder = 6
    OnClick = btnUpdateClick
  end
  object btnCancel: TButton
    Left = 196
    Top = 275
    Width = 92
    Height = 50
    Anchors = [akLeft, akBottom]
    Caption = 'CANCEL'
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object tblKas: TMyQuery
    Connection = DMDB.StoreDB
    SQL.Strings = (
      'select kodekas, namakas from ben_master_kas where idoutlet = '#39'X'#39)
    Left = 256
    Top = 12
  end
  object dsTblKas: TDataSource
    DataSet = tblKas
    Left = 312
    Top = 12
  end
end
