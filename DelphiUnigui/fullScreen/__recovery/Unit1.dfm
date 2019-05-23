object UniLoginForm1: TUniLoginForm1
  Left = 0
  Top = 0
  ClientHeight = 240
  ClientWidth = 463
  Caption = 'UniLoginForm1'
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAjaxEvent = UniLoginFormAjaxEvent
  PixelsPerInch = 96
  TextHeight = 13
  object UniDBEdit1: TUniDBEdit
    Left = 192
    Top = 40
    Width = 121
    Height = 22
    Hint = ''
    TabOrder = 0
  end
  object UniLabel1: TUniLabel
    Left = 137
    Top = 46
    Width = 36
    Height = 13
    Hint = ''
    Caption = #30331#24405#21517
    TabOrder = 1
  end
  object UniLabel2: TUniLabel
    Left = 137
    Top = 94
    Width = 24
    Height = 13
    Hint = ''
    Caption = #23494#30721
    TabOrder = 2
  end
  object UniDBEdit2: TUniDBEdit
    Left = 192
    Top = 88
    Width = 121
    Height = 22
    Hint = ''
    TabOrder = 3
  end
  object UniButton1: TUniButton
    Left = 152
    Top = 144
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Login'
    ModalResult = 1
    TabOrder = 4
  end
  object UniButton2: TUniButton
    Left = 256
    Top = 144
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancle'
    ModalResult = 2
    TabOrder = 5
  end
end
