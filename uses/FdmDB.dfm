object dmDB: TdmDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 202
  Width = 376
  object dbInternal: TMyConnection
    Database = 'bc_guna'
    Options.OptimizedBigInt = True
    Pooling = True
    Username = 'root'
    Server = 'localhost'
    LoginPrompt = False
    Left = 28
    Top = 16
  end
  object dbExternal: TMyConnection
    Database = 'bckmbidb'
    Left = 28
    Top = 92
  end
end
