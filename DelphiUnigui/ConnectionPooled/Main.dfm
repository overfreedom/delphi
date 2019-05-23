object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 542
  ClientWidth = 888
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object ubtn1: TUniButton
    Left = 40
    Top = 56
    Width = 75
    Height = 25
    Hint = ''
    Caption = #36830#25509#27744#65311
    TabOrder = 0
    OnClick = ubtn1Click
  end
  object unm1: TUniMemo
    Left = 160
    Top = 24
    Width = 241
    Height = 194
    Hint = ''
    Lines.Strings = (
      'unm1')
    TabOrder = 1
  end
  object ubtn2: TUniButton
    Left = 40
    Top = 360
    Width = 75
    Height = 25
    Hint = ''
    Caption = #30452#36830
    TabOrder = 2
    OnClick = ubtn2Click
  end
  object unm2: TUniMemo
    Left = 160
    Top = 248
    Width = 257
    Height = 273
    Hint = ''
    Lines.Strings = (
      'unm2')
    TabOrder = 3
  end
end
