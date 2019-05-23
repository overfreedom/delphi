object UniLoginForm1: TUniLoginForm1
  Left = 0
  Top = 0
  ClientHeight = 275
  ClientWidth = 623
  Caption = 'UniLoginForm1'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object unlbl1: TUniLabel
    Left = 193
    Top = 67
    Width = 36
    Height = 13
    Hint = ''
    Caption = #29992#25143#21517
    TabOrder = 0
  end
  object unlbl2: TUniLabel
    Left = 193
    Top = 107
    Width = 24
    Height = 13
    Hint = ''
    Caption = #23494#30721
    TabOrder = 1
  end
  object ubtn1: TUniButton
    Left = 193
    Top = 200
    Width = 75
    Height = 25
    Hint = ''
    Caption = #30331#24405
    TabOrder = 2
    ClientEvents.UniEvents.Strings = (
      
        'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.base' +
        'Cls ="btn";'#13#10'  config.cls ="btn-success";'#13#10'}')
    OnClick = ubtn1Click
  end
  object ubtn2: TUniButton
    Left = 334
    Top = 200
    Width = 75
    Height = 25
    Hint = ''
    Caption = #27880#20876
    TabOrder = 3
    OnClick = ubtn2Click
  end
  object undtuser_id: TUniEdit
    Left = 248
    Top = 66
    Width = 121
    Hint = ''
    Text = ''
    TabOrder = 4
    ClientEvents.ExtEvents.Strings = (
      
        'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10'    UniLogin' +
        'Form1.undtuser_id.inputWrap.addCls("mycss");'#13#10'}')
  end
  object undtpwd: TUniEdit
    Left = 248
    Top = 107
    Width = 121
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 5
  end
end
