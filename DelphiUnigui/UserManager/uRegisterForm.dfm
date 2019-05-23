object RegisterForm: TRegisterForm
  Left = 0
  Top = 0
  ClientHeight = 393
  ClientWidth = 759
  Caption = 'UniForm1'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object undbdtemail: TUniDBEdit
    Left = 314
    Top = 132
    Width = 121
    Height = 22
    Hint = ''
    DataField = 'email'
    DataSource = ds1
    TabOrder = 0
  end
  object unlbl1: TUniLabel
    Left = 251
    Top = 219
    Width = 30
    Height = 13
    Hint = ''
    Caption = 'phone'
    TabOrder = 1
  end
  object undbdtuser_id: TUniDBEdit
    Left = 314
    Top = 51
    Width = 121
    Height = 22
    Hint = ''
    DataField = 'id'
    DataSource = ds1
    TabOrder = 2
  end
  object unlbl2: TUniLabel
    Left = 251
    Top = 180
    Width = 20
    Height = 13
    Hint = ''
    Caption = 'pwd'
    TabOrder = 3
  end
  object undbdtphone: TUniDBEdit
    Left = 314
    Top = 210
    Width = 121
    Height = 22
    Hint = ''
    DataField = 'mobile'
    DataSource = ds1
    TabOrder = 4
  end
  object unlbl3: TUniLabel
    Left = 251
    Top = 138
    Width = 24
    Height = 13
    Hint = ''
    Caption = 'email'
    TabOrder = 5
  end
  object undbdtuser_name: TUniDBEdit
    Left = 314
    Top = 93
    Width = 121
    Height = 22
    Hint = ''
    DataField = 'name'
    DataSource = ds1
    TabOrder = 6
  end
  object unlbl4: TUniLabel
    Left = 251
    Top = 99
    Width = 53
    Height = 13
    Hint = ''
    Caption = 'user_name'
    TabOrder = 7
  end
  object undbdtpwd_sha256: TUniDBEdit
    Left = 314
    Top = 174
    Width = 121
    Height = 22
    Hint = ''
    DataField = 'pwd_sha256'
    DataSource = ds1
    PasswordChar = '*'
    TabOrder = 8
  end
  object unlbl5: TUniLabel
    Left = 251
    Top = 57
    Width = 11
    Height = 13
    Hint = ''
    Caption = 'ID'
    TabOrder = 9
  end
  object ubtn1: TUniButton
    Left = 360
    Top = 288
    Width = 75
    Height = 25
    Hint = ''
    Caption = #25552#20132
    TabOrder = 10
    OnClick = ubtn1Click
  end
  object ds1: TDataSource
    DataSet = DMUserManager.fdqrysys_user
    Left = 40
    Top = 80
  end
end
