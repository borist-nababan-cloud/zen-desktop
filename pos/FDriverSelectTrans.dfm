object frmDriverSelectTrans: TfrmDriverSelectTrans
  Left = 0
  Top = 0
  Caption = 'Transaksi Travel / Drivers'
  ClientHeight = 557
  ClientWidth = 985
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    985
    557)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 230
    Width = 341
    Height = 275
  end
  object Image1: TImage
    Left = 235
    Top = 32
    Width = 123
    Height = 145
    Stretch = True
  end
  object Label4: TLabel
    Left = 207
    Top = 201
    Width = 106
    Height = 13
    Caption = 'Click Here To Start Scan'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = [fsBold, fsItalic, fsUnderline]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label1: TLabel
    Left = 12
    Top = 252
    Width = 51
    Height = 13
    Caption = 'Driver ID'
  end
  object Label2: TLabel
    Left = 12
    Top = 300
    Width = 70
    Height = 13
    Caption = 'Driver Name'
  end
  object Label3: TLabel
    Left = 12
    Top = 348
    Width = 82
    Height = 13
    Caption = 'No Pol / Travel'
  end
  object Label5: TLabel
    Left = 0
    Top = 0
    Width = 985
    Height = 19
    Align = alTop
    Alignment = taCenter
    Caption = 'Travel Transaction'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 153
  end
  object Label6: TLabel
    Left = 16
    Top = 394
    Width = 36
    Height = 13
    Caption = 'Detail '
  end
  object Label7: TLabel
    Left = 384
    Top = 467
    Width = 48
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Subtotal'
    ExplicitTop = 433
  end
  object Label8: TLabel
    Left = 384
    Top = 494
    Width = 46
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Nilai Fee'
    ExplicitTop = 460
  end
  object Label9: TLabel
    Left = 384
    Top = 521
    Width = 52
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Total Fee'
    ExplicitTop = 487
  end
  object Label10: TLabel
    Left = 384
    Top = 444
    Width = 81
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Nilai Transaksi'
    ExplicitTop = 410
  end
  object Label11: TLabel
    Left = 384
    Top = 383
    Width = 51
    Height = 13
    Caption = 'Driver ID'
  end
  object Label12: TLabel
    Left = 384
    Top = 417
    Width = 71
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'ID Transaksi'
    ExplicitTop = 422
  end
  object Label13: TLabel
    Left = 659
    Top = 416
    Width = 81
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Nilai Transaksi'
  end
  object btnStart: TButton
    Left = 199
    Top = 189
    Width = 75
    Height = 25
    Caption = 'btnStart'
    TabOrder = 0
    Visible = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 32
    Width = 221
    Height = 145
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btnStartScan: TButton
    Left = 8
    Top = 188
    Width = 185
    Height = 39
    Caption = 'Start Scan'
    TabOrder = 2
    OnClick = btnStartScanClick
  end
  object edDriverID: TcxTextEdit
    Left = 12
    Top = 271
    Enabled = False
    StyleDisabled.TextColor = clBlue
    TabOrder = 3
    Width = 325
  end
  object edNama: TcxTextEdit
    Left = 12
    Top = 319
    Enabled = False
    StyleDisabled.TextColor = clBlue
    TabOrder = 4
    Width = 325
  end
  object edNopol: TcxTextEdit
    Left = 12
    Top = 367
    Enabled = False
    StyleDisabled.TextColor = clBlue
    TabOrder = 5
    Width = 325
  end
  object edDetail: TMemo
    Left = 16
    Top = 413
    Width = 321
    Height = 65
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object cxGrid1: TcxGrid
    Left = 376
    Top = 32
    Width = 609
    Height = 376
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 7
    object gtvTransaksi: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          OnGetText = gtvTransaksiTcxGridDataControllerTcxDataSummaryFooterSummaryItems0GetText
          Column = gtvTransaksiSubtotal
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gtvTransaksiIDTransaksi: TcxGridColumn
        Caption = 'ID Transaksi'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
      object gtvTransaksiNamaJasa: TcxGridColumn
        Caption = 'Nama Jasa'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 200
      end
      object gtvTransaksiWaktu: TcxGridColumn
        Caption = 'Waktu'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.ReadOnly = True
        Width = 75
      end
      object gtvTransaksiSubtotal: TcxGridColumn
        Caption = 'Subtotal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object gtvTransaksiNamaCustomer: TcxGridColumn
        Caption = 'Nama Customer'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 200
      end
      object gtvTransaksiAmbil: TcxGridColumn
        Caption = 'Ambil'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.OnChange = gtvTransaksiAmbilPropertiesChange
      end
      object gtvTransaksiButton: TcxGridColumn
        Caption = 'Set'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = gtvTransaksiButtonPropertiesButtonClick
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = gtvTransaksi
    end
  end
  object edSubtotal: TcxCalcEdit
    Left = 488
    Top = 464
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.#'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clRed
    TabOrder = 8
    Width = 321
  end
  object edFee: TcxCalcEdit
    Left = 488
    Top = 491
    Anchors = [akLeft, akBottom]
    EditValue = 10.000000000000000000
    Properties.DisplayFormat = '#,#.#'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clRed
    TabOrder = 9
    Width = 321
  end
  object edTotalFee: TcxCalcEdit
    Left = 488
    Top = 518
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.#'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clRed
    TabOrder = 10
    Width = 321
  end
  object edNilaiTrans: TcxCalcEdit
    Left = 488
    Top = 441
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.#'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clRed
    TabOrder = 11
    Width = 321
  end
  object btnSave: TButton
    Left = 871
    Top = 420
    Width = 106
    Height = 63
    Anchors = [akLeft, akBottom]
    Caption = 'SAVE'
    TabOrder = 12
    OnClick = btnSaveClick
  end
  object edTransID: TcxTextEdit
    Left = 488
    Top = 414
    Anchors = [akLeft, akBottom]
    Enabled = False
    StyleDisabled.TextColor = clBlue
    TabOrder = 13
    Width = 165
  end
  object btnCancel: TButton
    Left = 871
    Top = 494
    Width = 106
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel'
    TabOrder = 14
    OnClick = btnCancelClick
  end
  object edItems: TcxCalcEdit
    Left = 752
    Top = 414
    Anchors = [akLeft, akBottom]
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.DisplayFormat = '#,#.#'
    Properties.UseThousandSeparator = True
    StyleDisabled.TextColor = clRed
    TabOrder = 15
    Width = 57
  end
  object fpVerifikasi: TFinFPVer
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnFPVerificationStatus = fpVerifikasiFPVerificationStatus
    OnFPVerificationID = fpVerifikasiFPVerificationID
    OnFPVerificationImage = fpVerifikasiFPVerificationImage
    Left = 484
    Top = 128
  end
end
