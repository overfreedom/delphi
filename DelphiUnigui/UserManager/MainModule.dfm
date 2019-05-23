object UniMainModule: TUniMainModule
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Height = 408
  Width = 720
  object fdconYLDB: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL'
      'Address=localhost'
      'Database=yl'
      'Password=0000'
      'User_Name=sa')
    LoginPrompt = False
    Left = 16
    Top = 16
  end
  object fdqryAccount: TFDQuery
    Connection = fdconYLDB
    SQL.Strings = (
      'select * from  Account')
    Left = 80
    Top = 72
  end
  object DBillPre1: TDataSource
    DataSet = fdqryAccount
    Left = 208
    Top = 72
  end
  object dsp1: TDataSetProvider
    DataSet = fdqryAccount
    Left = 128
    Top = 72
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 168
    Top = 72
  end
  object fdmngrConnection: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 80
    Top = 152
  end
end
