object UniMainModule: TUniMainModule
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  MonitoredKeys.Keys = <>
  Height = 396
  Width = 695
  object fdmngr1: TFDManager
    ConnectionDefFileName = 'E:\mydemos\DelphiUnigui\tmp\Win32\Debug\FDMSSqlDrvier.ini'
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 24
    Top = 16
  end
  object fdcon2: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_Pool')
    LoginPrompt = False
    Left = 24
    Top = 72
  end
end
