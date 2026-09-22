object dmDB: TdmDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 408
  Width = 725
  object dbInternal: TMyConnection
    Database = 'bc_sunda'
    Options.OptimizedBigInt = True
    Pooling = True
    Username = 'root'
    Server = 'localhost'
    LoginPrompt = False
    Left = 40
    Top = 168
  end
  object dbExternal: TMyConnection
    Database = 'bckmbidb'
    Left = 40
    Top = 88
  end
  object vRequest: TRESTRequest
    Client = vClient
    Params = <
      item
        Kind = pkHTTPHEADER
        name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 7ca2feb7e4852b658e6e252b81282fdbbf6768cd4a1b73dcbf4ed8866' +
          'a4da7f283dbc8cc6beca01e0660f5e48a230ed223dfbe861031e1e7bb0f79e69' +
          '2ee6a101a6eee5e7a91fb4ea6cb139c515e5b7ae4649abddad1c2a684305d99f' +
          'abbe0a1040ac1c3b87d9216412b1c34df336f21aa139759b0a7a3d634886fc03' +
          '0fef56f'
      end>
    Response = vResponse
    SynchronizedEvents = False
    Left = 221
    Top = 64
  end
  object vPOST: TRESTRequest
    Client = vClient
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 7ca2feb7e4852b658e6e252b81282fdbbf6768cd4a1b73dcbf4ed8866' +
          'a4da7f283dbc8cc6beca01e0660f5e48a230ed223dfbe861031e1e7bb0f79e69' +
          '2ee6a101a6eee5e7a91fb4ea6cb139c515e5b7ae4649abddad1c2a684305d99f' +
          'abbe0a1040ac1c3b87d9216412b1c34df336f21aa139759b0a7a3d634886fc03' +
          '0fef56f'
      end
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        Value = 
          '{"data": {"idmember": "7LGFJu8pQEfEbLsQcMUSJcqTUBC2","point": "1' +
          '000"}}'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = vResponse
    SynchronizedEvents = False
    Left = 500
    Top = 68
  end
  object vClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://member.zenfamilyspa.net/api/pointmembers'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 164
    Top = 112
  end
  object vResponse: TRESTResponse
    RootElement = 'data'
    Left = 164
    Top = 164
  end
  object vPUT: TRESTRequest
    Client = vClient
    Method = rmPUT
    Params = <
      item
        Kind = pkHTTPHEADER
        name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 7ca2feb7e4852b658e6e252b81282fdbbf6768cd4a1b73dcbf4ed8866' +
          'a4da7f283dbc8cc6beca01e0660f5e48a230ed223dfbe861031e1e7bb0f79e69' +
          '2ee6a101a6eee5e7a91fb4ea6cb139c515e5b7ae4649abddad1c2a684305d99f' +
          'abbe0a1040ac1c3b87d9216412b1c34df336f21aa139759b0a7a3d634886fc03' +
          '0fef56f'
      end
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        Value = 
          '{"data": {"idmember": "7LGFJu8pQEfEbLsQcMUSJcqTUBC2","point": "1' +
          '000"}}'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = vResponse
    SynchronizedEvents = False
    Left = 440
    Top = 64
  end
  object vDELETE: TRESTRequest
    Client = vClient
    Method = rmDELETE
    Params = <
      item
        Kind = pkHTTPHEADER
        name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 7ca2feb7e4852b658e6e252b81282fdbbf6768cd4a1b73dcbf4ed8866' +
          'a4da7f283dbc8cc6beca01e0660f5e48a230ed223dfbe861031e1e7bb0f79e69' +
          '2ee6a101a6eee5e7a91fb4ea6cb139c515e5b7ae4649abddad1c2a684305d99f' +
          'abbe0a1040ac1c3b87d9216412b1c34df336f21aa139759b0a7a3d634886fc03' +
          '0fef56f'
      end
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        Value = 
          '{"data": {"idmember": "7LGFJu8pQEfEbLsQcMUSJcqTUBC2","point": "1' +
          '000"}}'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = vResponse
    SynchronizedEvents = False
    Left = 304
    Top = 64
  end
  object vPATCH: TRESTRequest
    Client = vClient
    Method = rmPATCH
    Params = <
      item
        Kind = pkHTTPHEADER
        name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 7ca2feb7e4852b658e6e252b81282fdbbf6768cd4a1b73dcbf4ed8866' +
          'a4da7f283dbc8cc6beca01e0660f5e48a230ed223dfbe861031e1e7bb0f79e69' +
          '2ee6a101a6eee5e7a91fb4ea6cb139c515e5b7ae4649abddad1c2a684305d99f' +
          'abbe0a1040ac1c3b87d9216412b1c34df336f21aa139759b0a7a3d634886fc03' +
          '0fef56f'
      end
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        Value = 
          '{"data": {"idmember": "7LGFJu8pQEfEbLsQcMUSJcqTUBC2","point": "1' +
          '000"}}'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = vResponse
    SynchronizedEvents = False
    Left = 380
    Top = 64
  end
end
