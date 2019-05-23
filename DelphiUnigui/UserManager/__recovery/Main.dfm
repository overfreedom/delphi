object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 505
  ClientWidth = 1004
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Layout = 'fit'
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel3: TUniPanel
    Left = 0
    Top = 0
    Width = 1004
    Height = 505
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'UniPanel3'
    Layout = 'fit'
    object UniPanel2: TUniPanel
      Left = 1
      Top = 1
      Width = 256
      Height = 503
      Hint = ''
      Align = alLeft
      TabOrder = 1
      Caption = 'UniPanel2'
      Layout = 'fit'
      LayoutConfig.Region = 'west'
      object untrmnMainMenu: TUniTreeMenu
        Left = 1
        Top = 1
        Width = 254
        Height = 501
        Hint = ''
        Align = alClient
        Items.FontData = {0100000000}
        LayoutConfig.Region = 'center'
        SourceMenu = umntmMainMenu
        OnSelectionChange = untrmnMainMenuSelectionChange
      end
    end
    object UniPanel1: TUniPanel
      Left = 257
      Top = 1
      Width = 746
      Height = 503
      Hint = ''
      Align = alClient
      TabOrder = 2
      Caption = ''
      Layout = 'fit'
      LayoutConfig.Region = 'center'
      object unpgcntrlMain: TUniPageControl
        Left = 1
        Top = 1
        Width = 744
        Height = 501
        Hint = ''
        Align = alClient
        LayoutConfig.Region = 'center'
        TabOrder = 1
        OnChange = unpgcntrlMainChange
      end
    end
  end
  object umntmMainMenu: TUniMenuItems
    Left = 88
    Top = 376
    object unmntmN1: TUniMenuItem
      Caption = #36134#21495#31649#29702
      object unmntmN6: TUniMenuItem
        Caption = #31649#29702#21592#36134#21495
        Hint = 'test'
      end
      object unmntmN7: TUniMenuItem
        Caption = #24320#21457#32773#36134#21495
      end
    end
    object unmntmN3: TUniMenuItem
      Caption = #32452#32455#31649#29702
    end
    object unmntmN4: TUniMenuItem
      Caption = #35282#33394#31649#29702
    end
    object unmntmN2: TUniMenuItem
      Caption = #25805#20316#26435#38480#31649#29702
    end
    object unmntmN5: TUniMenuItem
      Caption = #36164#28304#26435#38480#31649#29702
    end
  end
  object untvmglstMainMenu: TUniNativeImageList
    Left = 88
    Top = 328
  end
end
