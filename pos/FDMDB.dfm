object dmDB: TdmDB
  OldCreateOrder = False
  Height = 530
  Width = 1004
  object zenDB: TMyConnection
    Database = 'bc_zen'
    Username = 'root'
    Server = 'localhost'
    LoginPrompt = False
    Left = 20
    Top = 12
  end
  object qryTherapist: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from available_tr where status = '#39'AVAILABLE'#39)
    Left = 540
    Top = 12
  end
  object dsQryTherapist: TDataSource
    DataSet = qryTherapist
    Left = 540
    Top = 64
  end
  object qrySearch: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from empty_x')
    Left = 72
    Top = 12
  end
  object qryFind: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from empty_x')
    Left = 140
    Top = 12
  end
  object qryCari: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from empty_x')
    Left = 212
    Top = 12
  end
  object transMaster: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from trans_master where tanggal = '#39'2010-01-01'#39)
    Left = 72
    Top = 64
  end
  object dsTransMaster: TDataSource
    DataSet = transMaster
    Left = 72
    Top = 120
  end
  object transDetail: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from trans_detail where tanggal = '#39'2010-01-01'#39)
    Left = 72
    Top = 168
  end
  object dsTransDetail: TDataSource
    DataSet = transDetail
    Left = 72
    Top = 220
  end
  object MenuTrans: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from menu_master where aktif = '#39'Y'#39)
    Left = 284
    Top = 12
  end
  object dsMenuTrans: TDataSource
    DataSet = MenuTrans
    Left = 284
    Top = 64
  end
  object qryRoom: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from ruangan where status = '#39'AVAILABLE'#39)
    Left = 440
    Top = 16
  end
  object dsQryRoom: TDataSource
    DataSet = qryRoom
    Left = 440
    Top = 68
  end
  object dsTblAroma: TDataSource
    DataSet = tblAroma
    Left = 640
    Top = 64
  end
  object QRYCOUNTER1: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from available_tr where status = '#39'AVAILABLE'#39)
    Left = 212
    Top = 120
  end
  object QRYCOUNTER2: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from available_tr where status = '#39'AVAILABLE'#39)
    Left = 212
    Top = 168
  end
  object qryBarang: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from stock_kasir')
    Left = 440
    Top = 120
  end
  object dsQryBarang: TDataSource
    DataSet = qryBarang
    Left = 440
    Top = 172
  end
  object dsTblAdditional: TDataSource
    DataSet = tblAdditional
    Left = 728
    Top = 64
  end
  object qryTemp: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from empty_x')
    Left = 140
    Top = 64
  end
  object dsTblPayment: TDataSource
    Left = 540
    Top = 168
  end
  object PrintMaster: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from trans_payment where tanggal = '#39'2010-01-01'#39)
    Left = 640
    Top = 116
  end
  object dsPrintMaster: TDataSource
    DataSet = PrintMaster
    Left = 640
    Top = 172
  end
  object PrintDetail: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from trans_detail where tanggal = '#39'2010-01-01'#39)
    Left = 640
    Top = 240
  end
  object dsPrintDetail: TDataSource
    DataSet = PrintDetail
    Left = 640
    Top = 292
  end
  object QRYCOUNTER3: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from available_tr where status = '#39'AVAILABLE'#39)
    Left = 212
    Top = 220
  end
  object PrintRedeem: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from trans_redeem')
    Left = 544
    Top = 240
  end
  object dsPrintRedeem: TDataSource
    DataSet = PrintRedeem
    Left = 544
    Top = 292
  end
  object dsTblTherapist: TDataSource
    DataSet = tblTherapist
    Left = 440
    Top = 292
  end
  object dsTblRuangan: TDataSource
    DataSet = tblRuangan
    Left = 208
    Top = 400
  end
  object dsTblStockKasir: TDataSource
    Left = 436
    Top = 432
  end
  object dsTblMembers: TDataSource
    Left = 540
    Top = 392
  end
  object dsTblMembersTypeNone: TDataSource
    DataSet = TblMembersTypeNone
    Left = 648
    Top = 452
  end
  object qryPrintSO: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from trans_master where tanggal = '#39'2010-01-01'#39)
    Left = 728
    Top = 344
  end
  object dsQryPrintSO: TDataSource
    DataSet = qryPrintSO
    Left = 728
    Top = 392
  end
  object TransPayment: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from trans_payment where tanggal = '#39'2010-01-01'#39)
    Left = 72
    Top = 280
  end
  object dsTransPayment: TDataSource
    DataSet = TransPayment
    Left = 72
    Top = 332
  end
  object qryPaket: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from paket')
    Left = 72
    Top = 392
  end
  object dsQryPaket: TDataSource
    DataSet = qryPaket
    Left = 72
    Top = 444
  end
  object qryGC: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from gc_master where aktif = '#39'Y'#39' and terjual = '#39'N'#39)
    Left = 728
    Top = 120
  end
  object dsQryGC: TDataSource
    DataSet = qryGC
    Left = 728
    Top = 172
  end
  object qryGCDetail: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      
        'select * from gc_detail where aktif = '#39'Y'#39' and terjual = '#39'Y'#39' and ' +
        'pakai = '#39'N'#39' and expired_date >= CURRENT_DATE')
    Left = 820
    Top = 116
  end
  object dsQryGCDetail: TDataSource
    DataSet = qryGCDetail
    Left = 820
    Top = 168
  end
  object dstblProduk: TDataSource
    DataSet = tblProduuct
    Left = 804
    Top = 272
  end
  object dstblJenis: TDataSource
    DataSet = tblJenis
    Left = 920
    Top = 324
  end
  object qryBooking: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from booking where id_booking = '#39'#'#39)
    Left = 820
    Top = 12
  end
  object dsqryBooking: TDataSource
    DataSet = qryBooking
    Left = 820
    Top = 64
  end
  object qryFoot: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from empty_x')
    Left = 920
    Top = 12
  end
  object dsqryFoot: TDataSource
    DataSet = qryFoot
    Left = 920
    Top = 64
  end
  object dsTblDriver: TDataSource
    DataSet = tblDriver
    Left = 820
    Top = 392
  end
  object qryTransDrivers: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * , '
      
        '(select ben_master_drivers.nopol_mobil from ben_master_drivers w' +
        'here ben_drivers_trans_master.id_drivers = ben_master_drivers.id' +
        '_drivers) as nopol_driver'
      'from ben_drivers_trans_master '
      'where tanggal = CURRENT_DATE')
    Left = 924
    Top = 128
  end
  object dsQryTransDrivers: TDataSource
    DataSet = qryTransDrivers
    Left = 924
    Top = 180
  end
  object tblTherapist: TMyTable
    TableName = 'available_tr'
    Connection = zenDB
    Left = 440
    Top = 236
  end
  object tblStockkasir: TMyTable
    TableName = 'stock_kasir'
    Connection = zenDB
    Left = 428
    Top = 380
  end
  object tblMembers: TMyTable
    TableName = 'members'
    Connection = zenDB
    Left = 540
    Top = 344
  end
  object TblMembersTypeNone: TMyTable
    TableName = 'stock_kasir'
    Connection = zenDB
    Left = 644
    Top = 400
  end
  object tblDriver: TMyTable
    TableName = 'ben_master_drivers'
    Connection = zenDB
    Left = 816
    Top = 336
  end
  object tblRuangan: TMyTable
    TableName = 'ruangan'
    Connection = zenDB
    Left = 204
    Top = 348
  end
  object tblJenis: TMyTable
    TableName = 'jenis_jasa'
    Connection = zenDB
    Left = 916
    Top = 256
  end
  object tblProduuct: TMyTable
    TableName = 'produk'
    Connection = zenDB
    Left = 800
    Top = 220
  end
  object tblAdditional: TMyTable
    TableName = 'add_time'
    Connection = zenDB
    Left = 728
    Top = 20
  end
  object tblAroma: TMyTable
    TableName = 'aroma'
    Connection = zenDB
    Left = 636
    Top = 16
  end
  object qryUpdate: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from empty_x')
    Left = 328
    Top = 292
  end
  object QRYCOUNTEREXEC: TMyQuery
    Connection = zenDB
    SQL.Strings = (
      'select * from empty_x')
    Left = 328
    Top = 216
  end
end
