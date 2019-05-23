object DMUserManager: TDMUserManager
  OldCreateOrder = False
  Height = 394
  Width = 900
  object fdqryAdmin: TFDQuery
    Connection = UniMainModule.fdconYLDB
    SQL.Strings = (
      'select * from account')
    Left = 48
    Top = 40
  end
  object fdqryDeveloper: TFDQuery
    Left = 48
    Top = 96
  end
  object fdconUserManangerDemo: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL'
      'Database=UserManangerDemo'
      'Password=0000'
      'User_Name=sa'
      'Address=localhost')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 168
  end
  object fdqrysys_user: TFDQuery
    Connection = fdconUserManangerDemo
    SQL.Strings = (
      'select * from s_user'
      'where id = :user_id')
    Left = 48
    Top = 232
    ParamData = <
      item
        Name = 'User_ID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
