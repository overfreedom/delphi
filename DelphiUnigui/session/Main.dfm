object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 460
  ClientWidth = 877
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object unsyntxdtx1: TUniSyntaxEditEx
    Left = 48
    Top = 40
    Width = 697
    Height = 305
    Hint = ''
    Lines.Strings = (
      'unsyntxdtx1')
    Font.Name = 'Courier New'
  end
  object ubtn1: TUniButton
    Left = 48
    Top = 392
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'session'
    TabOrder = 1
    OnClick = ubtn1Click
  end
  object ubtn2: TUniButton
    Left = 152
    Top = 392
    Width = 225
    Height = 25
    Hint = ''
    Caption = 'uniLogger uniGUIUtils'
    TabOrder = 2
    OnClick = ubtn2Click
  end
end
